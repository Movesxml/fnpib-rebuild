#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""tex_convert.py — Mortar / Halfbrick `.tex` -> PNG 批量转换器（T-031 修正版）

T-031 的核心修正
----------------
传统 12 字节头：

    [u8 b0][u8 b1][u16 format_id][u16 width][u16 height][FF FF FF FF]

* 偏移 0/1 的两个字节是版本/子版本，**不是**像素格式。
* 偏移 2 的 u16 才是格式字段。已实证：`0x11` = RGB565。
* 除 `0x11` 外，其他 format id 尚未闭合。本工具不再按首字节或 bpp 猜
  RGBA4444 / ABGR4444 / RGBA5551 等，而是输出 `RAW_PREVIEW` 灰度预览，
  并在 manifest 中标记 `status="unverified_format"`。
* RGB565 解码：little-endian u16，R=bits15..11，G=bits10..5，B=bits4..0，
  分别按 `(v*255 + max/2) / max` 扩展到 8 位，A=255。

保留 T-018 的变体 B/C/D 行为：
  B = 传统头 + 4bpp 纯索引（外置调色板，输出 16 级灰度索引图）
  C = ASCII 'TEX' 扩展容器（用总长方程 + header 长度聚类）
  D = 传统头 + mip 链 / 尾部零填充 / 内嵌调色板嫌疑

退出码：0 = 无 failed；1 = 有 failed；2 = 参数/目录错误。
"""

from __future__ import annotations

import argparse
import json
import os
import struct
import sys
import tempfile
import zlib
from collections import Counter
from dataclasses import dataclass, field
from typing import Dict, List, Optional, Tuple

__version__ = "T-031"

# ---------------------------------------------------------------------------
# 常量
# ---------------------------------------------------------------------------

HEADER_AB_LEN = 12
HEADER_AB_TAIL = b"\xff\xff\xff\xff"

C_MAGIC = b"TEX"
C_SCAN_FROM = 4
C_SCAN_TO = 96
C_HDR_MIN = 8
C_HDR_MAX = 512

MAX_DIM = 8192
MAX_PIXELS = 16_777_216

#: 已实证的传统头格式表。**只允许放入有直接证据的项。**
#: T-031 只确认 `0x11 -> RGB565`；0x10、0x12 等尚未闭合，不得在此猜。
VERIFIED_FORMATS: Dict[int, Tuple[str, int]] = {
    0x11: ("RGB565", 2),
}

PALETTE_CANDIDATES: List[str] = [
    "fruitlist.xml 等 xml 中的 colour/color 键（16 色表）",
    "同名伴随文件（.binmodel / .pal / .json / .atlas）",
    "Mortar 引擎全局默认调色板（常量表，可能位于 macho/exe 数据段）",
]

COMMON_PALETTE_SIZES = (1024, 768, 512, 256, 64, 48, 32, 16)


# ---------------------------------------------------------------------------
# 数据结构
# ---------------------------------------------------------------------------

@dataclass
class Analysis:
    variant: str
    format: str
    width: int
    height: int
    bpp: float
    header_bytes: int
    mip_levels: int
    rgba: bytes
    notes: List[str] = field(default_factory=list)
    needs_external_palette: bool = False
    format_id: int = 0
    format_verified: bool = True


@dataclass
class Record:
    rel: str
    status: str
    variant: str = "?"
    format: str = ""
    width: int = 0
    height: int = 0
    bpp: float = 0.0
    header_bytes: int = 0
    mip_levels: int = 1
    png: str = ""
    needs_external_palette: bool = False
    palette_candidates: List[str] = field(default_factory=list)
    notes: List[str] = field(default_factory=list)
    format_id: int = 0
    format_verified: bool = True


# ---------------------------------------------------------------------------
# 小工具
# ---------------------------------------------------------------------------

def _u16(b: bytes, o: int) -> int:
    return b[o] | (b[o + 1] << 8)


def _u32(b: bytes, o: int) -> int:
    return b[o] | (b[o + 1] << 8) | (b[o + 2] << 16) | (b[o + 3] << 24)


def _expand5(v: int) -> int:
    return (v * 255 + 15) // 31


def _expand6(v: int) -> int:
    return (v * 255 + 31) // 63


def _resolve_format(format_id: int, bpp: int) -> Tuple[str, bool, str]:
    """返回 (格式名, 是否已验证, 说明)。

    T-031 口径：只有 VERIFIED_FORMATS 中且 bpp 完全一致的项才可染色；
    其他一律 RAW_PREVIEW，绝不按 bpp 猜 RGBA4444。
    """
    spec = VERIFIED_FORMATS.get(format_id)
    if spec is None:
        return ("RAW_PREVIEW", False,
                f"format_id=0x{format_id:02x} not verified; raw preview only")
    name, expect_bpp = spec
    if expect_bpp != bpp:
        return ("RAW_PREVIEW", False,
                f"format_id=0x{format_id:02x} expects bpp={expect_bpp}, "
                f"payload bpp={bpp}; raw preview only")
    return (name, True, "")


def _match_mip_chain(total: int, w: int, h: int, bpp: int) -> int:
    cw, ch = w, h
    acc = 0
    lv = 0
    while True:
        acc += cw * ch * bpp
        lv += 1
        if acc == total:
            return lv
        if acc > total:
            return 0
        if cw == 1 and ch == 1:
            return 0
        cw = max(1, cw // 2)
        ch = max(1, ch // 2)
        if lv > 24:
            return 0


# ---------------------------------------------------------------------------
# 像素解码
# ---------------------------------------------------------------------------

def _decode_raw_preview(payload: bytes, w: int, h: int, bpp: int) -> Optional[bytes]:
    """未闭合格式的确定性灰度预览：取每像素首字节，不做颜色猜测。"""
    px = w * h
    if px <= 0 or px > MAX_PIXELS or bpp <= 0 or bpp > 8:
        return None
    if len(payload) < px * bpp:
        return None
    out = bytearray(px * 4)
    for i in range(px):
        c = payload[i * bpp]
        o = i * 4
        out[o] = c
        out[o + 1] = c
        out[o + 2] = c
        out[o + 3] = 255
    return bytes(out)


def _decode_pixels(fmt: str, payload: bytes, w: int, h: int) -> Optional[bytes]:
    px = w * h
    if px <= 0 or px > MAX_PIXELS:
        return None

    if fmt in ("RGBA8888", "RGBA32"):
        if len(payload) < px * 4:
            return None
        return bytes(payload[: px * 4])

    if fmt == "RGB24":
        if len(payload) < px * 3:
            return None
        out = bytearray(px * 4)
        for i in range(px):
            s = i * 3
            o = i * 4
            out[o] = payload[s]
            out[o + 1] = payload[s + 1]
            out[o + 2] = payload[s + 2]
            out[o + 3] = 255
        return bytes(out)

    if fmt in ("RGBA4444", "ABGR4444", "RGBA5551", "RGB565", "LA88", "RAW16"):
        if len(payload) < px * 2:
            return None
        out = bytearray(px * 4)
        for i in range(px):
            v = payload[i * 2] | (payload[i * 2 + 1] << 8)
            o = i * 4
            if fmt == "RGBA4444":
                r = (v >> 12) & 0xF
                g = (v >> 8) & 0xF
                b = (v >> 4) & 0xF
                a = v & 0xF
                out[o] = r * 17
                out[o + 1] = g * 17
                out[o + 2] = b * 17
                out[o + 3] = a * 17
            elif fmt == "ABGR4444":
                a = (v >> 12) & 0xF
                b = (v >> 8) & 0xF
                g = (v >> 4) & 0xF
                r = v & 0xF
                out[o] = r * 17
                out[o + 1] = g * 17
                out[o + 2] = b * 17
                out[o + 3] = a * 17
            elif fmt == "RGBA5551":
                r = (v >> 11) & 0x1F
                g = (v >> 6) & 0x1F
                b = (v >> 1) & 0x1F
                a = v & 1
                out[o] = r * 255 // 31
                out[o + 1] = g * 255 // 31
                out[o + 2] = b * 255 // 31
                out[o + 3] = 255 if a else 0
            elif fmt == "RGB565":
                r = (v >> 11) & 0x1F
                g = (v >> 5) & 0x3F
                b = v & 0x1F
                out[o] = _expand5(r)
                out[o + 1] = _expand6(g)
                out[o + 2] = _expand5(b)
                out[o + 3] = 255
            elif fmt == "LA88":
                l = (v >> 8) & 0xFF
                a = v & 0xFF
                out[o] = l
                out[o + 1] = l
                out[o + 2] = l
                out[o + 3] = a
            else:  # RAW16
                c = (v >> 8) & 0xFF
                out[o] = c
                out[o + 1] = c
                out[o + 2] = c
                out[o + 3] = 255
        return bytes(out)

    if fmt == "INDEX4":
        if len(payload) < (px + 1) // 2:
            return None
        out = bytearray(px * 4)
        for i in range(px):
            byte = payload[i // 2]
            nib = (byte >> 4) if (i % 2 == 0) else (byte & 0x0F)
            c = nib * 17
            o = i * 4
            out[o] = c
            out[o + 1] = c
            out[o + 2] = c
            out[o + 3] = 255
        return bytes(out)

    if fmt == "L8":
        if len(payload) < px:
            return None
        out = bytearray(px * 4)
        for i in range(px):
            c = payload[i]
            o = i * 4
            out[o] = c
            out[o + 1] = c
            out[o + 2] = c
            out[o + 3] = 255
        return bytes(out)

    if fmt == "A8":
        if len(payload) < px:
            return None
        out = bytearray(px * 4)
        for i in range(px):
            o = i * 4
            out[o] = 255
            out[o + 1] = 255
            out[o + 2] = 255
            out[o + 3] = payload[i]
        return bytes(out)

    if fmt == "RAW8":
        out = bytearray(px * 4)
        for i in range(px):
            c = payload[i] if i < len(payload) else 0
            o = i * 4
            out[o] = c
            out[o + 1] = c
            out[o + 2] = c
            out[o + 3] = 255
        return bytes(out)

    return None


# ---------------------------------------------------------------------------
# 变体 C
# ---------------------------------------------------------------------------

def _c_candidates(head: bytes, total: int) -> List[Tuple[int, int, int, int, int]]:
    out: List[Tuple[int, int, int, int, int]] = []
    limit = min(len(head), total, C_SCAN_TO)
    if limit < C_SCAN_FROM + 4:
        return out
    seen = set()
    for off in range(C_SCAN_FROM, limit - 3):
        w = _u16(head, off)
        h = _u16(head, off + 2)
        if not (1 <= w <= MAX_DIM and 1 <= h <= MAX_DIM):
            continue
        for bpp in (4, 3, 2, 1):
            hdr = total - w * h * bpp
            if C_HDR_MIN <= hdr <= C_HDR_MAX:
                key = (hdr, w, h, bpp, off)
                if key not in seen:
                    seen.add(key)
                    out.append(key)
    return out


def _c_sort_key(c: Tuple[int, int, int, int, int]):
    return (0 if c[1] >= c[2] else 1, -c[3], c[4])


def _analyse_c(data: bytes, hint: Optional[int] = None) -> Optional[Analysis]:
    total = len(data)
    if total < C_HDR_MIN + 4:
        return None
    head = data[:C_SCAN_TO]
    cands = _c_candidates(head, total)
    if not cands:
        return None

    pool = [c for c in cands if hint is not None and c[0] == hint]
    used_hint = bool(pool)
    if not pool:
        pool = cands
    pool.sort(key=_c_sort_key)
    hdr, w, h, bpp, off = pool[0]

    payload = data[hdr:]
    fmt = {4: "RGBA32", 3: "RGB24", 2: "RAW16", 1: "L8"}.get(bpp, "RAW8")
    rgba = _decode_pixels(fmt, payload, w, h)
    if rgba is None:
        return None

    notes = [f"c_container hdr={hdr}B dims_off={off} bpp={bpp}"]
    if hint is not None and not used_hint:
        notes.append(f"header_len {hdr} != global hint {hint} (fallback to local)")
    notes.append("c_container semantics still partially unverified (T-018 U3/U5)")

    return Analysis(
        variant="C",
        format=fmt,
        width=w,
        height=h,
        bpp=bpp,
        header_bytes=hdr,
        mip_levels=1,
        rgba=rgba,
        notes=notes,
        needs_external_palette=False,
        format_id=0,
        format_verified=True,
    )


# ---------------------------------------------------------------------------
# 变体 A / B / D：传统 12 字节头
# ---------------------------------------------------------------------------

def _analyse_ab(data: bytes) -> Optional[Analysis]:
    total = len(data)
    if total < HEADER_AB_LEN + 1:
        return None
    if data[8:12] != HEADER_AB_TAIL:
        return None

    b0 = data[0]
    b1 = data[1]
    format_id = _u16(data, 2)
    w = _u16(data, 4)
    h = _u16(data, 6)
    if not (1 <= w <= MAX_DIM and 1 <= h <= MAX_DIM):
        return None

    payload = data[HEADER_AB_LEN:]
    px = w * h
    notes = [
        f"legacy_header b0=0x{b0:02x} b1=0x{b1:02x} "
        f"format_id=0x{format_id:02x}"
    ]

    # --- 变体 A：整数 bpp ---
    if px and len(payload) % px == 0:
        bpp = len(payload) // px
        if 1 <= bpp <= 4:
            fmt, verified, why = _resolve_format(format_id, bpp)
            if verified:
                rgba = _decode_pixels(fmt, payload, w, h)
            else:
                rgba = _decode_raw_preview(payload, w, h, bpp)
            if rgba is not None:
                if why:
                    notes.append(why)
                return Analysis(
                    variant="A", format=fmt, width=w, height=h, bpp=bpp,
                    header_bytes=HEADER_AB_LEN, mip_levels=1, rgba=rgba,
                    notes=notes, needs_external_palette=False,
                    format_id=format_id, format_verified=verified,
                )

    # --- 变体 B：4bpp 纯索引 ---
    if px % 2 == 0 and len(payload) == px // 2:
        rgba = _decode_pixels("INDEX4", payload, w, h)
        if rgba is not None:
            notes.append("4bpp indexed; palette not embedded (TEX_FORMAT.md §3.2)")
            return Analysis(
                variant="B", format="INDEX4", width=w, height=h, bpp=0.5,
                header_bytes=HEADER_AB_LEN, mip_levels=1, rgba=rgba,
                notes=notes, needs_external_palette=True,
                format_id=format_id, format_verified=False,
            )

    # --- 变体 D1：mip 链 ---
    for bpp in (4, 2, 1):
        lv = _match_mip_chain(len(payload), w, h, bpp)
        if lv:
            base = px * bpp
            fmt, verified, why = _resolve_format(format_id, bpp)
            if verified:
                rgba = _decode_pixels(fmt, payload[:base], w, h)
            else:
                rgba = _decode_raw_preview(payload[:base], w, h, bpp)
            if rgba is not None:
                notes.append(f"mip chain levels={lv} base_bpp={bpp}")
                if why:
                    notes.append(why)
                return Analysis(
                    variant="D", format=fmt, width=w, height=h, bpp=bpp,
                    header_bytes=HEADER_AB_LEN, mip_levels=lv, rgba=rgba,
                    notes=notes, needs_external_palette=False,
                    format_id=format_id, format_verified=verified,
                )

    # --- 变体 D2：尾部零填充 ---
    for bpp in (4, 2, 1):
        need = px * bpp
        extra = len(payload) - need
        if 0 < extra <= 64 and not any(payload[need:]):
            fmt, verified, why = _resolve_format(format_id, bpp)
            if verified:
                rgba = _decode_pixels(fmt, payload[:need], w, h)
            else:
                rgba = _decode_raw_preview(payload[:need], w, h, bpp)
            if rgba is not None:
                notes.append(f"trailing_zero_padding={extra}B bpp={bpp}")
                if why:
                    notes.append(why)
                return Analysis(
                    variant="D", format=fmt, width=w, height=h, bpp=bpp,
                    header_bytes=HEADER_AB_LEN, mip_levels=1, rgba=rgba,
                    notes=notes, needs_external_palette=False,
                    format_id=format_id, format_verified=verified,
                )

    # --- 变体 D3：内嵌调色板嫌疑 ---
    for bpp in (1, 2, 4):
        need = px * bpp
        extra = len(payload) - need
        if extra in COMMON_PALETTE_SIZES:
            fmt, verified, why = _resolve_format(format_id, bpp)
            if verified:
                rgba = _decode_pixels(fmt, payload[:need], w, h)
            else:
                rgba = _decode_raw_preview(payload[:need], w, h, bpp)
            if rgba is not None:
                notes.append(
                    f"embedded_palette_suspect={extra}B bpp={bpp} "
                    f"(not split; base layer decoded)"
                )
                if why:
                    notes.append(why)
                return Analysis(
                    variant="D", format=fmt, width=w, height=h, bpp=bpp,
                    header_bytes=HEADER_AB_LEN, mip_levels=1, rgba=rgba,
                    notes=notes, needs_external_palette=False,
                    format_id=format_id, format_verified=verified,
                )

    return None


def _analyse_fallback(data: bytes) -> Analysis:
    n = len(data)
    if n == 0:
        return Analysis(
            variant="?", format="RAW8", width=1, height=1, bpp=1,
            header_bytes=0, mip_levels=1, rgba=b"\x00\x00\x00\xff",
            notes=["empty file"], needs_external_palette=False,
            format_id=0, format_verified=False,
        )
    w = 128 if n >= 128 else n
    h = (n + w - 1) // w
    rgba = _decode_pixels("RAW8", data, w, h)
    if rgba is None:
        rgba = _decode_pixels("RAW8", data[:1], 1, 1) or b"\x00\x00\x00\xff"
        w = h = 1
    return Analysis(
        variant="?", format="RAW8", width=w, height=h, bpp=1,
        header_bytes=0, mip_levels=1, rgba=rgba,
        notes=["fallback: unrecognised layout, raw luma preview"],
        needs_external_palette=False, format_id=0, format_verified=False,
    )


# ---------------------------------------------------------------------------
# 总入口
# ---------------------------------------------------------------------------

def analyse(data: bytes, c_header_hint: Optional[int] = None) -> Analysis:
    if data[:3] == C_MAGIC:
        a = _analyse_c(data, c_header_hint)
        if a is not None:
            return a
    a = _analyse_ab(data)
    if a is not None:
        return a
    return _analyse_fallback(data)


# ---------------------------------------------------------------------------
# PNG 写出
# ---------------------------------------------------------------------------

def _png_chunk(tag: bytes, payload: bytes) -> bytes:
    return (struct.pack(">I", len(payload)) + tag + payload +
            struct.pack(">I", zlib.crc32(tag + payload) & 0xFFFFFFFF))


def write_png(path: str, w: int, h: int, rgba: bytes) -> None:
    stride = w * 4
    expect = stride * h
    if len(rgba) < expect:
        raise ValueError(f"rgba too short: {len(rgba)} < {expect}")
    raw = bytearray()
    for y in range(h):
        raw.append(0)
        raw += rgba[y * stride:(y + 1) * stride]

    png = (
        b"\x89PNG\r\n\x1a\n"
        + _png_chunk(b"IHDR", struct.pack(">IIBBBBB", w, h, 8, 6, 0, 0, 0))
        + _png_chunk(b"IDAT", zlib.compress(bytes(raw), 9))
        + _png_chunk(b"IEND", b"")
    )
    d = os.path.dirname(path)
    if d:
        os.makedirs(d, exist_ok=True)
    with open(path, "wb") as f:
        f.write(png)


# ---------------------------------------------------------------------------
# 批量转换
# ---------------------------------------------------------------------------

def _collect_tex(src_root: str) -> List[str]:
    files: List[str] = []
    for base, dirs, names in os.walk(src_root):
        dirs.sort()
        for name in sorted(names):
            if name.lower().endswith(".tex"):
                files.append(os.path.join(base, name))
    files.sort()
    return files


def _compute_c_hint(paths: List[str]) -> Tuple[Optional[int], Counter]:
    hist: Counter = Counter()
    for path in paths:
        try:
            with open(path, "rb") as f:
                head = f.read(C_SCAN_TO)
            total = os.path.getsize(path)
        except OSError:
            continue
        if len(head) < C_SCAN_FROM + 4 or head[:3] != C_MAGIC:
            continue
        cands = _c_candidates(head, total)
        if not cands:
            continue
        cands.sort(key=_c_sort_key)
        hist[cands[0][0]] += 1
    hint = hist.most_common(1)[0][0] if hist else None
    return hint, hist


def convert_tree(src_root: str, dst_root: str) -> dict:
    paths = _collect_tex(src_root)
    c_hint, c_hist = _compute_c_hint(paths)

    records: List[Record] = []
    for path in paths:
        rel = os.path.relpath(path, src_root).replace("\\", "/")
        try:
            with open(path, "rb") as f:
                data = f.read()
        except OSError as e:
            records.append(Record(rel=rel, status="failed",
                                  notes=[f"read error: {e}"]))
            continue

        a = analyse(data, c_hint)

        if a.needs_external_palette:
            status = "external_palette"
        elif not a.format_verified or a.variant == "?":
            status = "unverified_format"
        else:
            status = "ok"

        notes = list(a.notes)
        if a.variant == "?":
            notes.append("fallback_raw_luma")

        rec = Record(
            rel=rel,
            status=status,
            variant=a.variant,
            format=a.format,
            width=a.width,
            height=a.height,
            bpp=a.bpp,
            header_bytes=a.header_bytes,
            mip_levels=a.mip_levels,
            notes=notes,
            needs_external_palette=a.needs_external_palette,
            format_id=a.format_id,
            format_verified=a.format_verified,
        )

        out_rel = os.path.splitext(rel)[0] + ".png"
        out_path = os.path.join(dst_root, out_rel)
        try:
            write_png(out_path, a.width, a.height, a.rgba)
            rec.png = out_rel
        except Exception as e:  # noqa: BLE001
            rec.status = "failed"
            rec.notes.append(f"png write error: {e}")

        if rec.status == "external_palette":
            rec.palette_candidates = list(PALETTE_CANDIDATES)
        records.append(rec)

    status_counts = Counter(r.status for r in records)
    variant_counts = Counter(r.variant for r in records)
    format_counts = Counter(r.format for r in records if r.format)
    fallback = sum(1 for r in records if r.variant == "?")

    totals = {
        "total": len(records),
        "ok": status_counts.get("ok", 0),
        "external_palette": status_counts.get("external_palette", 0),
        "unverified_format": status_counts.get("unverified_format", 0),
        "failed": status_counts.get("failed", 0),
        "fallback_raw": fallback,
    }
    totals["converted"] = (
        totals["ok"] + totals["external_palette"] + totals["unverified_format"]
    )

    summary = {
        "tool": "tex_convert.py",
        "version": __version__,
        "source_root": os.path.abspath(src_root),
        "output_root": os.path.abspath(dst_root),
        "totals": totals,
        "variants": dict(variant_counts),
        "formats": dict(format_counts),
        "c_header_hint": c_hint,
        "c_header_histogram": dict(c_hist),
    }

    manifest = dict(summary)
    manifest["files"] = [
        {
            "rel": r.rel,
            "status": r.status,
            "variant": r.variant,
            "format": r.format,
            "format_id": r.format_id,
            "format_verified": r.format_verified,
            "width": r.width,
            "height": r.height,
            "bpp": r.bpp,
            "header_bytes": r.header_bytes,
            "mip_levels": r.mip_levels,
            "png": r.png,
            "needs_external_palette": r.needs_external_palette,
            "palette_candidates": r.palette_candidates,
            "notes": r.notes,
        }
        for r in records
    ]

    os.makedirs(dst_root, exist_ok=True)
    with open(os.path.join(dst_root, "manifest.json"), "w",
              encoding="utf-8") as f:
        json.dump(manifest, f, ensure_ascii=False, indent=2)

    return summary


# ---------------------------------------------------------------------------
# selftest
# ---------------------------------------------------------------------------

def _mk_header_legacy(format_id: int, w: int, h: int,
                      b0: int = 9, b1: int = 9,
                      hfield: int = 0) -> bytes:
    return (bytes([b0 & 0xFF, b1 & 0xFF])
            + struct.pack("<HHH", format_id & 0xFFFF, w, h)
            + HEADER_AB_TAIL)


def _mk_header_c(w: int, h: int, hdr: int = 52, dim_off: int = 20) -> bytes:
    buf = bytearray(hdr)
    buf[0:4] = b"TEX\x00"
    struct.pack_into("<I", buf, 4, 3)
    buf[8:15] = bytes([8, 1, 8, 4, 8, 3, 8])
    struct.pack_into("<I", buf, 16, 2)
    struct.pack_into("<HH", buf, dim_off, w, h)
    return bytes(buf)


def selftest() -> bool:
    ok = True

    def check(name: str, cond: bool, detail=None) -> None:
        nonlocal ok
        if cond:
            print(f"[PASS] {name}")
        else:
            ok = False
            print(f"[FAIL] {name}  {detail!r}")

    # ---------------- RGB565 像素级 ----------------
    w, h = 4, 1
    vals = [0xF800, 0x07E0, 0x001F, 0x8410]
    payload = struct.pack("<4H", *vals)
    a = analyse(_mk_header_legacy(0x11, w, h) + payload)
    check("RGB565 variant", a.variant == "A", a.variant)
    check("RGB565 format", a.format == "RGB565", a.format)
    check("RGB565 verified", a.format_verified is True, a.format_verified)
    check("RGB565 format_id", a.format_id == 0x11, a.format_id)
    check("RGB565 dims", (a.width, a.height) == (w, h), (a.width, a.height))
    check("RGB565 bpp", a.bpp == 2, a.bpp)
    check("RGB565 red", a.rgba[0:4] == bytes([255, 0, 0, 255]), a.rgba[0:4])
    check("RGB565 green", a.rgba[4:8] == bytes([0, 255, 0, 255]), a.rgba[4:8])
    check("RGB565 blue", a.rgba[8:12] == bytes([0, 0, 255, 255]), a.rgba[8:12])
    check("RGB565 mid", a.rgba[12:16] == bytes([132, 130, 132, 255]),
          a.rgba[12:16])

    # ---------------- 未知 0x10 不得被猜成 RGBA4444 ----------------
    a = analyse(_mk_header_legacy(0x10, 2, 1) + struct.pack("<2H", 0, 0))
    check("unknown 0x10 variant", a.variant == "A", a.variant)
    check("unknown 0x10 not guessed", a.format == "RAW_PREVIEW", a.format)
    check("unknown 0x10 unverified", a.format_verified is False,
          a.format_verified)
    check("unknown 0x10 note", any("not verified" in n for n in a.notes),
          a.notes)

    # ---------------- 变体 B ----------------
    idx = bytes([0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF])
    a = analyse(_mk_header_legacy(0x06, 4, 4) + idx)
    check("B variant", a.variant == "B", a.variant)
    check("B needs_palette", a.needs_external_palette is True,
          a.needs_external_palette)
    check("B format", a.format == "INDEX4", a.format)
    check("B bpp", a.bpp == 0.5, a.bpp)
    check("B px0 gray", a.rgba[0] == 0, a.rgba[0])
    check("B px1 gray", a.rgba[4] == 17, a.rgba[4])
    check("B px2 gray", a.rgba[8] == 34, a.rgba[8])

    # ---------------- 变体 C ----------------
    cw, ch = 32, 16
    cpx = bytes([0x23, 0x33, 0x51, 0x20]) * (cw * ch)
    cdata = _mk_header_c(cw, ch, hdr=52) + cpx
    check("C synthetic size", len(cdata) == 52 + cw * ch * 4, len(cdata))
    a = analyse(cdata)
    check("C variant", a.variant == "C", a.variant)
    check("C format", a.format == "RGBA32", a.format)
    check("C dims", (a.width, a.height) == (cw, ch), (a.width, a.height))
    check("C header_bytes", a.header_bytes == 52, a.header_bytes)
    check("C px0", a.rgba[:4] == bytes([0x23, 0x33, 0x51, 0x20]), a.rgba[:4])

    # ---------------- 变体 D：mip 链 ----------------
    dw, dh = 8, 8
    base = bytes([0xFF, 0xFF]) * (dw * dh)
    mips = base
    for (mw, mh) in ((4, 4), (2, 2), (1, 1)):
        mips += bytes([0x00, 0x00]) * (mw * mh)
    ddata = _mk_header_legacy(0x11, dw, dh) + mips
    a = analyse(ddata)
    check("D variant", a.variant == "D", a.variant)
    check("D mip_levels", a.mip_levels == 4, a.mip_levels)
    check("D format", a.format == "RGB565", a.format)
    check("D dims", (a.width, a.height) == (dw, dh), (a.width, a.height))
    check("D px0 white", a.rgba[:4] == bytes([255, 255, 255, 255]), a.rgba[:4])

    # ---------------- 兜底 ----------------
    a = analyse(b"\x00" * 300)
    check("fallback variant", a.variant == "?", a.variant)
    check("fallback exists", len(a.rgba) == a.width * a.height * 4)
    check("fallback unverified", a.format_verified is False, a.format_verified)

    # ---------------- 端到端 ----------------
    with tempfile.TemporaryDirectory() as td:
        src = os.path.join(td, "raw")
        dst = os.path.join(td, "out")
        os.makedirs(src)
        cases = {
            "a_rgb565.tex": _mk_header_legacy(0x11, w, h) + payload,
            "b1.tex": _mk_header_legacy(0x06, 4, 4) + idx,
            "c1.tex": cdata,
            "d1.tex": ddata,
            "u16.tex": _mk_header_legacy(0x10, 2, 1) + struct.pack("<2H", 0, 0),
        }
        for name, blob in cases.items():
            with open(os.path.join(src, name), "wb") as f:
                f.write(blob)
        s = convert_tree(src, dst)
        t = s["totals"]
        check("e2e total", t["total"] == 5, t)
        check("e2e failed==0", t["failed"] == 0, t)
        check("e2e ok==3", t["ok"] == 3, t)
        check("e2e external_palette==1", t["external_palette"] == 1, t)
        check("e2e unverified_format==1", t["unverified_format"] == 1, t)
        check("e2e fallback_raw==0", t["fallback_raw"] == 0, t)
        pngs = [n for n in os.listdir(dst) if n.lower().endswith(".png")]
        check("e2e png count", len(pngs) == 5, pngs)
        check("e2e manifest", os.path.isfile(os.path.join(dst, "manifest.json")))

    # ---------------- 真实 fruit_atlas 回归 ----------------
    atlas = os.path.join("assets_raw", "models", "Fruit", "textures",
                         "fruit_atlas.tex")
    if os.path.isfile(atlas):
        with open(atlas, "rb") as f:
            adata = f.read()
        a = analyse(adata)
        check("real fruit_atlas size", len(adata) == 524300, len(adata))
        check("real fruit_atlas variant", a.variant == "A", a.variant)
        check("real fruit_atlas format", a.format == "RGB565", a.format)
        check("real fruit_atlas verified", a.format_verified is True,
              a.format_verified)
        check("real fruit_atlas dims", (a.width, a.height) == (512, 512),
              (a.width, a.height))
        check("real fruit_atlas bpp", a.bpp == 2, a.bpp)
        check("real fruit_atlas rgba len",
              len(a.rgba) == 512 * 512 * 4, len(a.rgba))
        non_gray = any(a.rgba[i] != a.rgba[i + 1]
                       for i in range(0, len(a.rgba), 4))
        check("real fruit_atlas has chroma", non_gray)
    else:
        print("[SKIP] real fruit_atlas.tex not found "
              "(expected assets_raw/models/Fruit/textures/fruit_atlas.tex)")

    print("")
    print("[SELFTEST] " + ("PASS" if ok else "FAIL"))
    return ok


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------

def main(argv: Optional[List[str]] = None) -> int:
    ap = argparse.ArgumentParser(
        description="Mortar/Halfbrick .tex -> PNG 批量转换（T-031）")
    ap.add_argument("src", nargs="?", help="assets_raw 目录")
    ap.add_argument("dst", nargs="?", help="assets_png 输出目录")
    ap.add_argument("--selftest", action="store_true", help="跑内置合成样例自检")
    args = ap.parse_args(argv)

    if args.selftest:
        return 0 if selftest() else 1

    if not args.src or not args.dst:
        ap.error("需要 src 与 dst 两个位置参数，或使用 --selftest")
    if not os.path.isdir(args.src):
        print(f"[ERROR] 不是目录: {args.src}", file=sys.stderr)
        return 2

    summary = convert_tree(args.src, args.dst)
    print(json.dumps(summary, ensure_ascii=False, indent=2))
    t = summary["totals"]
    print(f"[SUMMARY] total={t['total']} ok={t['ok']} "
          f"external_palette={t['external_palette']} "
          f"unverified_format={t['unverified_format']} "
          f"failed={t['failed']} fallback_raw={t['fallback_raw']}",
          file=sys.stderr)
    return 0 if t["failed"] == 0 else 1


if __name__ == "__main__":
    sys.exit(main())