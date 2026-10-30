#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""tex_convert.py — Mortar / Halfbrick `.tex` -> PNG 批量转换器（T-018 重写版）

覆盖 4 类载体（完整格式谱系见同目录 TEX_FORMAT.md）：

  变体 A  传统 12 字节头 + 整数 bpp 像素
          [type u8][minor u8][field u16][w u16][h u16][FF FF FF FF]
          type 0x06 == LA88；另有 RGBA4444 / ABGR4444 / RGBA5551 / RGB565 /
          RGBA8888 / L8 / A8 子型（见 A_TYPE_TABLE，全部 [待验证]）

  变体 B  传统头 + 4bpp 纯索引（payload 恰 == w*h/2），调色板不在文件内，
          输出 16 级灰度索引图，manifest 标 needs_external_palette

  变体 C  ASCII 'TEX' 扩展容器（样例 hud_cross.tex 32820B）
          头部字段语义未完全定死 -> 用「总长方程 + 全局 header 长度聚类」反解
          像素按 32bpp 输出（RGBA32）

  变体 D  传统头 + 尾部多余字节
          依次尝试：mip 链（w/2 x h/2 递推）/ 尾部零填充 / 内嵌调色板尺寸

无第三方依赖（PNG 用 zlib 手写），可直接在 Windows / CI 上跑：

    python tools/AssetPipeline/tex_convert.py assets_raw assets_png
    python tools/AssetPipeline/tex_convert.py --selftest

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

__version__ = "T-018"

# ---------------------------------------------------------------------------
# 常量
# ---------------------------------------------------------------------------

HEADER_AB_LEN = 12
HEADER_AB_TAIL = b"\xff\xff\xff\xff"

C_MAGIC = b"TEX"          # 前 3 字节
C_SCAN_FROM = 4           # 头部候选扫描起点
C_SCAN_TO = 96            # 头部候选扫描终点（不含）
C_HDR_MIN = 8             # header_len 合理下界
C_HDR_MAX = 512           # header_len 合理上界

MAX_DIM = 8192
MAX_PIXELS = 16_777_216   # 4096x4096，防声明异常导致内存爆炸

#: 传统头的 type -> (格式名, 每像素字节数)。
#: [待验证] 本轮仅 0x06=LA88 由任务卡实证；其余为候选表，
#: 判定逻辑不依赖本表（只影响染色），未知 type 走 bpp 推断。
A_TYPE_TABLE: Dict[int, Tuple[str, int]] = {
    0x01: ("RGBA8888", 4),
    0x02: ("RGBA4444", 2),
    0x03: ("ABGR4444", 2),
    0x04: ("RGBA5551", 2),
    0x05: ("RGB565", 2),
    0x06: ("LA88", 2),
    0x07: ("L8", 1),
    0x08: ("A8", 1),
}

#: 变体 B 调色板来源候选（写进 manifest，供后续调查）
PALETTE_CANDIDATES: List[str] = [
    "fruitlist.xml 等 xml 中的 colour/color 键（16 色表）",
    "同名伴随文件（.binmodel / .pal / .json / .atlas）",
    "Mortar 引擎全局默认调色板（常量表，可能位于 macho/exe 数据段）",
]

#: 内嵌调色板的常见字节尺寸（256 色 RGB/RGBA、64/48/32 字节小表）
COMMON_PALETTE_SIZES = (1024, 768, 512, 256, 64, 48, 32, 16)


# ---------------------------------------------------------------------------
# 数据结构
# ---------------------------------------------------------------------------

@dataclass
class Analysis:
    variant: str                     # "A" | "B" | "C" | "D" | "?"
    format: str                      # 解码所用的像素编码名
    width: int
    height: int
    bpp: float                       # 每像素字节数（B 为 0.5）
    header_bytes: int
    mip_levels: int
    rgba: bytes                      # 长度 == width*height*4
    notes: List[str] = field(default_factory=list)
    needs_external_palette: bool = False


@dataclass
class Record:
    rel: str
    status: str                      # "ok" | "external_palette" | "failed"
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


# ---------------------------------------------------------------------------
# 小工具
# ---------------------------------------------------------------------------

def _u16(b: bytes, o: int) -> int:
    return b[o] | (b[o + 1] << 8)


def _u32(b: bytes, o: int) -> int:
    return b[o] | (b[o + 1] << 8) | (b[o + 2] << 16) | (b[o + 3] << 24)


def _resolve_a_format(t: int, bpp: int) -> str:
    """type 表优先；表缺失或 bpp 不符时按像素字节数兜底。"""
    known = A_TYPE_TABLE.get(t)
    if known is not None and known[1] == bpp:
        return known[0]
    return {1: "L8", 2: "RGBA4444", 3: "RGB24", 4: "RGBA8888"}.get(bpp, "RAW8")


def _match_mip_chain(total: int, w: int, h: int, bpp: int) -> int:
    """payload 是否恰为从 (w,h) 起的完整 mip 链；返回层数（0 = 不匹配）。"""
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
# 像素解码：统一输出 RGBA8888
# ---------------------------------------------------------------------------

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
                # [待验证] 位段：R 最高 4 位 / A 最低 4 位（little-endian u16）
                r = (v >> 12) & 0xF
                g = (v >> 8) & 0xF
                b = (v >> 4) & 0xF
                a = v & 0xF
                out[o] = r * 17
                out[o + 1] = g * 17
                out[o + 2] = b * 17
                out[o + 3] = a * 17
            elif fmt == "ABGR4444":
                # [待验证] A 最高 4 位 / R 最低 4 位
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
                out[o] = r * 255 // 31
                out[o + 1] = g * 255 // 63
                out[o + 2] = b * 255 // 31
                out[o + 3] = 255
            elif fmt == "LA88":
                l = (v >> 8) & 0xFF
                a = v & 0xFF
                out[o] = l
                out[o + 1] = l
                out[o + 2] = l
                out[o + 3] = a
            else:  # RAW16：未知 16bpp，取高字节做灰度预览
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
            c = nib * 17          # 16 级灰度
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
# 变体 C：候选枚举
# ---------------------------------------------------------------------------

def _c_candidates(head: bytes, total: int) -> List[Tuple[int, int, int, int, int]]:
    """枚举 (header_len, w, h, bpp, dim_offset) 候选。

    只用一条硬约束：header_len = total - w*h*bpp 必须落在合理头长区间内。
    不预设 w/h 字段位置，而是把头部内所有相邻 u16 对都当作 (w,h) 试。
    """
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
    # 1) 宽 >= 高（横向纹理更常见） 2) bpp 大优先 3) 字段偏移靠前
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

    return Analysis("C", fmt, w, h, bpp, hdr, 1, rgba, notes, False)


# ---------------------------------------------------------------------------
# 变体 A / B / D：传统 12 字节头
# ---------------------------------------------------------------------------

def _analyse_ab(data: bytes) -> Optional[Analysis]:
    total = len(data)
    if total < HEADER_AB_LEN + 1:
        return None
    if data[8:12] != HEADER_AB_TAIL:
        return None

    t = data[0]
    minor = data[1]
    hdr_field = _u16(data, 2)
    w = _u16(data, 4)
    h = _u16(data, 6)
    if not (1 <= w <= MAX_DIM and 1 <= h <= MAX_DIM):
        return None

    payload = data[HEADER_AB_LEN:]
    px = w * h
    known = A_TYPE_TABLE.get(t)
    notes = [f"type=0x{t:02x} minor=0x{minor:02x} field={hdr_field}"]

    # --- 变体 A：整数 bpp ---
    if px and len(payload) % px == 0:
        bpp = len(payload) // px
        if 1 <= bpp <= 4:
            fmt = _resolve_a_format(t, bpp)
            rgba = _decode_pixels(fmt, payload, w, h)
            if rgba is not None:
                if known is None:
                    notes.append("type not in table; format guessed from bpp")
                elif known[1] != bpp:
                    notes.append(f"type_table bpp={known[1]} != payload bpp={bpp}")
                return Analysis("A", fmt, w, h, bpp, HEADER_AB_LEN, 1, rgba, notes, False)

    # --- 变体 B：4bpp 纯索引 ---
    if px % 2 == 0 and len(payload) == px // 2:
        rgba = _decode_pixels("INDEX4", payload, w, h)
        if rgba is not None:
            notes.append("4bpp indexed; palette not embedded (TEX_FORMAT.md §3.2)")
            return Analysis("B", "INDEX4", w, h, 0.5, HEADER_AB_LEN, 1,
                            rgba, notes, True)

    # --- 变体 D1：mip 链 ---
    for bpp in (4, 2, 1):
        lv = _match_mip_chain(len(payload), w, h, bpp)
        if lv:
            base = px * bpp
            fmt = _resolve_a_format(t, bpp)
            rgba = _decode_pixels(fmt, payload[:base], w, h)
            if rgba is not None:
                notes.append(f"mip chain levels={lv} base_bpp={bpp}")
                return Analysis("D", fmt, w, h, bpp, HEADER_AB_LEN, lv,
                                rgba, notes, False)

    # --- 变体 D2：尾部零填充 ---
    for bpp in (4, 2, 1):
        need = px * bpp
        extra = len(payload) - need
        if 0 < extra <= 64 and not any(payload[need:]):
            fmt = _resolve_a_format(t, bpp)
            rgba = _decode_pixels(fmt, payload[:need], w, h)
            if rgba is not None:
                notes.append(f"trailing_zero_padding={extra}B bpp={bpp}")
                return Analysis("D", fmt, w, h, bpp, HEADER_AB_LEN, 1,
                                rgba, notes, False)

    # --- 变体 D3：内嵌调色板尺寸嫌疑 ---
    for bpp in (1, 2, 4):
        need = px * bpp
        extra = len(payload) - need
        if extra in COMMON_PALETTE_SIZES:
            fmt = _resolve_a_format(t, bpp)
            rgba = _decode_pixels(fmt, payload[:need], w, h)
            if rgba is not None:
                notes.append(f"embedded_palette_suspect={extra}B bpp={bpp} "
                             f"(not split; base layer decoded)")
                return Analysis("D", fmt, w, h, bpp, HEADER_AB_LEN, 1,
                                rgba, notes, False)

    return None


# ---------------------------------------------------------------------------
# 兜底：RAW8 灰度预览（保证 100% 有产出，但显式标记）
# ---------------------------------------------------------------------------

def _analyse_fallback(data: bytes) -> Analysis:
    n = len(data)
    if n == 0:
        return Analysis("?", "RAW8", 1, 1, 1, 0, 1,
                        b"\x00\x00\x00\xff", ["empty file"], False)
    w = 128 if n >= 128 else n
    h = (n + w - 1) // w
    rgba = _decode_pixels("RAW8", data, w, h)
    if rgba is None:
        rgba = _decode_pixels("RAW8", data[:1], 1, 1) or b"\x00\x00\x00\xff"
        w = h = 1
    return Analysis("?", "RAW8", w, h, 1, 0, 1, rgba,
                    ["fallback: unrecognised layout, raw luma preview"], False)


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
# PNG 写出（零依赖）
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
        raw.append(0)  # filter type 0
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
    """第一趟：只读 96 字节，对每个 C 文件取 top1 候选的 header_len 投票。"""
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
        rec = Record(
            rel=rel,
            status="ok",
            variant=a.variant,
            format=a.format,
            width=a.width,
            height=a.height,
            bpp=a.bpp,
            header_bytes=a.header_bytes,
            mip_levels=a.mip_levels,
            notes=list(a.notes),
            needs_external_palette=a.needs_external_palette,
        )
        out_rel = os.path.splitext(rel)[0] + ".png"
        out_path = os.path.join(dst_root, out_rel)
        try:
            write_png(out_path, a.width, a.height, a.rgba)
            rec.png = out_rel
        except Exception as e:  # noqa: BLE001 - 单文件失败不中断整批
            rec.status = "failed"
            rec.notes.append(f"png write error: {e}")

        if a.needs_external_palette:
            rec.status = "external_palette"
            rec.palette_candidates = list(PALETTE_CANDIDATES)
        if a.variant == "?":
            rec.notes.append("fallback_raw_luma")
        records.append(rec)

    status_counts = Counter(r.status for r in records)
    variant_counts = Counter(r.variant for r in records)
    format_counts = Counter(r.format for r in records if r.format)
    fallback = sum(1 for r in records if r.variant == "?")

    summary = {
        "tool": "tex_convert.py",
        "version": __version__,
        "source_root": os.path.abspath(src_root),
        "output_root": os.path.abspath(dst_root),
        "totals": {
            "total": len(records),
            "ok": status_counts.get("ok", 0),
            "external_palette": status_counts.get("external_palette", 0),
            "failed": status_counts.get("failed", 0),
            "fallback_raw": fallback,
        },
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
# selftest：每个变体构造合成样例
# ---------------------------------------------------------------------------

def _mk_header_ab(t: int, minor: int, w: int, h: int, hfield: int = 0) -> bytes:
    return (bytes([t & 0xFF, minor & 0xFF])
            + struct.pack("<HHH", hfield, w, h)
            + HEADER_AB_TAIL)


def _mk_header_c(w: int, h: int, hdr: int = 52, dim_off: int = 20) -> bytes:
    """按 TEX_FORMAT.md §4.2 的假设表构造样例头（非真实文件）。"""
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

    # ---------------- 变体 A：RGBA8888 ----------------
    w, h = 4, 3
    payload = bytearray()
    for i in range(w * h):
        payload += bytes([(i * 7) % 256, (i * 11) % 256, (i * 13) % 256, 255])
    a = analyse(_mk_header_ab(0x01, 0, w, h) + bytes(payload))
    check("A/RGBA8888 variant", a.variant == "A", a.variant)
    check("A/RGBA8888 format", a.format == "RGBA8888", a.format)
    check("A/RGBA8888 dims", (a.width, a.height) == (w, h), (a.width, a.height))
    check("A/RGBA8888 bpp", a.bpp == 4, a.bpp)
    check("A/RGBA8888 px0", a.rgba[:4] == bytes([0, 0, 0, 255]), a.rgba[:4])
    check("A/RGBA8888 px1", a.rgba[4:8] == bytes([7, 11, 13, 255]), a.rgba[4:8])

    # ---------------- 变体 A：LA88 ----------------
    la = bytes([0x80, 0xFF, 0x00, 0x80, 0xFF, 0x00, 0x40, 0x40])
    a = analyse(_mk_header_ab(0x06, 0, 2, 2) + la)
    check("A/LA88 variant", a.variant == "A", a.variant)
    check("A/LA88 format", a.format == "LA88", a.format)
    check("A/LA88 px0", a.rgba[:4] == bytes([128, 128, 128, 255]), a.rgba[:4])
    check("A/LA88 px1", a.rgba[4:8] == bytes([0, 0, 0, 128]), a.rgba[4:8])

    # ---------------- 变体 B：4bpp 索引 ----------------
    idx = bytes([0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF])
    a = analyse(_mk_header_ab(0x06, 0, 4, 4) + idx)
    check("B variant", a.variant == "B", a.variant)
    check("B needs_palette", a.needs_external_palette is True, a.needs_external_palette)
    check("B bpp", a.bpp == 0.5, a.bpp)
    check("B px0 gray", a.rgba[0] == 0, a.rgba[0])
    check("B px1 gray", a.rgba[4] == 17, a.rgba[4])
    check("B px2 gray", a.rgba[8] == 34, a.rgba[8])

    # ---------------- 变体 C：'TEX' 容器 ----------------
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
    ddata = _mk_header_ab(0x02, 0, dw, dh) + mips
    a = analyse(ddata)
    check("D variant", a.variant == "D", a.variant)
    check("D mip_levels", a.mip_levels == 4, a.mip_levels)
    check("D dims", (a.width, a.height) == (dw, dh), (a.width, a.height))
    check("D px0 white", a.rgba[:4] == bytes([255, 255, 255, 255]), a.rgba[:4])

    # ---------------- 兜底 ----------------
    a = analyse(b"\x00" * 300)
    check("fallback variant", a.variant == "?", a.variant)
    check("fallback exists", len(a.rgba) == a.width * a.height * 4)

    # ---------------- 端到端 ----------------
    with tempfile.TemporaryDirectory() as td:
        src = os.path.join(td, "raw")
        dst = os.path.join(td, "out")
        os.makedirs(src)
        cases = {
            "a1.tex": _mk_header_ab(0x01, 0, 4, 3) + bytes(payload),
            "b1.tex": _mk_header_ab(0x06, 0, 4, 4) + idx,
            "c1.tex": cdata,
            "d1.tex": ddata,
        }
        for name, blob in cases.items():
            with open(os.path.join(src, name), "wb") as f:
                f.write(blob)
        s = convert_tree(src, dst)
        check("e2e total", s["totals"]["total"] == 4, s["totals"])
        check("e2e ok", s["totals"]["ok"] == 4, s["totals"])
        check("e2e failed==0", s["totals"]["failed"] == 0, s["totals"])
        check("e2e fallback==0", s["totals"]["fallback_raw"] == 0, s["totals"])
        pngs = [n for n in os.listdir(dst) if n.lower().endswith(".png")]
        check("e2e png count", len(pngs) == 4, pngs)
        check("e2e manifest", os.path.isfile(os.path.join(dst, "manifest.json")))

    print("")
    print("[SELFTEST] " + ("PASS" if ok else "FAIL"))
    return ok


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------

def main(argv: Optional[List[str]] = None) -> int:
    ap = argparse.ArgumentParser(
        description="Mortar/Halfbrick .tex -> PNG 批量转换（T-018）")
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
          f"external_palette={t['external_palette']} failed={t['failed']} "
          f"fallback_raw={t['fallback_raw']}", file=sys.stderr)
    return 0 if t["failed"] == 0 else 1


if __name__ == "__main__":
    sys.exit(main())