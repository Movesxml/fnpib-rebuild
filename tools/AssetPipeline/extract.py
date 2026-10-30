#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""T-017 / tools/AssetPipeline/extract.py — IPA → assets.zip → Raw/ 解包 + 全量清点

用法（Windows PowerShell / cmd 均可）::

    # 默认输入 ipa/FruitNinjaPiB-v1.0412.ipa
    python tools/AssetPipeline/extract.py
    python tools/AssetPipeline/extract.py ipa/FruitNinjaPiB-v1.0412.ipa \
        --out-dir build/AssetPipeline/Raw --report-dir build/AssetPipeline/reports

    # 直接给 assets.zip
    python tools/AssetPipeline/extract.py assets.zip --out-dir Raw

    # 只清点已解包目录，不动文件
    python tools/AssetPipeline/extract.py Raw --list-only

产出::

    <out-dir>/                      原始资产（保留 assets.zip 内部目录结构）
    <report-dir>/inventory.json     机器可读清点结果
    <report-dir>/inventory.md       人读报告

设计说明：
- **只用标准库**：清点阶段只需读文件头，不 import Pillow/numpy，
  因此「只想解包不想装依赖」的场景也能跑。
- .tex 只读 12 字节头做宽高/bpp 粗估；**权威解析在 tex_convert.py**
  （TEX_HEADER_SIZE 两边必须一致，改动时同步）。
- zip 路径安全：拒绝绝对路径 / 盘符 / `..` 段（zip-slip），被拒条目记入报告。
- 解包是幂等的：已存在文件默认不覆盖（--overwrite 才覆盖）。
- 不做任何格式转换，保证「Raw 目录 = 原始字节」这一可审计前提。
"""

from __future__ import annotations

import argparse
import io
import json
import shutil
import struct
import sys
import zipfile
import xml.etree.ElementTree as ET
from collections import Counter
from datetime import datetime
from pathlib import Path

# --- 与 tex_convert.py 保持一致的常量（改动需同步）---
TEX_HEADER_SIZE = 12

MMD_MAGIC = b"HBR0"
DEFAULT_ASSETS_NAME = "assets.zip"
DEFAULT_INPUT = "ipa/FruitNinjaPiB-v1.0412.ipa"
DEFAULT_OUT_DIR = "build/AssetPipeline/Raw"
DEFAULT_REPORT_DIR = "build/AssetPipeline/reports"

JUNK_NAMES = {".DS_Store", "Thumbs.db"}
JUNK_PREFIXES = ("__MACOSX/",)


# --------------------------------------------------------------------------- #
# 基础设施
# --------------------------------------------------------------------------- #

def _setup_console() -> None:
    """Windows 控制台默认 cp936，打印中文可能 UnicodeEncodeError。"""
    for stream in (sys.stdout, sys.stderr):
        try:
            stream.reconfigure(encoding="utf-8", errors="replace")  # py>=3.7
        except Exception:
            pass


def _now() -> str:
    return datetime.now().astimezone().isoformat(timespec="seconds")


def _is_unsafe_zip_name(name: str) -> bool:
    n = name.replace("\\", "/")
    if n.startswith("/"):
        return True
    if len(n) >= 2 and n[1] == ":":          # "C:/..." 之类
        return True
    return any(part == ".." for part in n.split("/"))


def _is_junk_name(name: str) -> bool:
    n = name.replace("\\", "/")
    if any(n.startswith(p) for p in JUNK_PREFIXES):
        return True
    return Path(n).name in JUNK_NAMES


# --------------------------------------------------------------------------- #
# 解包
# --------------------------------------------------------------------------- #

def _extract_zip(zf: zipfile.ZipFile, dest: Path, *, overwrite: bool) -> dict:
    stats = {
        "extracted": 0,
        "unsafe_skipped": [],
        "junk_skipped": [],
        "exists_skipped": [],
        "errors": [],
    }
    for info in zf.infolist():
        if info.is_dir():
            continue
        name = info.filename
        if _is_unsafe_zip_name(name):
            stats["unsafe_skipped"].append(name)
            continue
        if _is_junk_name(name):
            stats["junk_skipped"].append(name)
            continue
        target = dest / Path(name.replace("\\", "/"))
        if target.exists() and not overwrite:
            stats["exists_skipped"].append(name)
            continue
        try:
            target.parent.mkdir(parents=True, exist_ok=True)
            with zf.open(info) as src, open(target, "wb") as dst:
                shutil.copyfileobj(src, dst)
            stats["extracted"] += 1
        except OSError as exc:
            stats["errors"].append(f"{name}: {exc}")
    return stats


def load_assets_zip(path: Path, assets_name: str = DEFAULT_ASSETS_NAME):
    """打开输入，返回 (内层 assets ZipFile, 源描述 dict)。

    支持三种输入：.ipa / 裸 assets.zip / 任何含 assets.zip 的容器 zip。
    内层 zip 走内存 BytesIO，调用方负责 close。
    """
    if not path.exists():
        raise SystemExit(f"[extract] 输入不存在: {path}")

    try:
        outer = zipfile.ZipFile(path)
    except zipfile.BadZipFile as exc:
        raise SystemExit(f"[extract] 不是有效 zip: {path} ({exc})")

    try:
        names = [i.filename for i in outer.infolist() if not i.is_dir()]
    except zipfile.BadZipFile as exc:
        outer.close()
        raise SystemExit(f"[extract] zip 目录损坏: {path} ({exc})")

    is_ipa = any(n.startswith("Payload/") for n in names)
    if not is_ipa:
        # 输入本身就是资产包
        return outer, {
            "kind": "assets_zip",
            "container": str(path),
            "assets_zip": str(path),
            "members": len(names),
        }

    cands = [n for n in names
             if n.replace("\\", "/").lower().endswith(assets_name.lower())]
    # Payload/ 下的优先，路径层级浅的优先
    cands.sort(key=lambda n: (0 if n.startswith("Payload/") else 1,
                              n.count("/"), len(n)))
    if not cands:
        outer.close()
        raise SystemExit(f"[extract] IPA 内未找到 {assets_name}（共 {len(names)} 个条目）")

    chosen = cands[0]
    try:
        blob = outer.read(chosen)
    except KeyError as exc:
        outer.close()
        raise SystemExit(f"[extract] 读取 {chosen} 失败: {exc}")
    finally:
        outer.close()

    try:
        inner = zipfile.ZipFile(io.BytesIO(blob))
    except zipfile.BadZipFile as exc:
        raise SystemExit(f"[extract] 内层 {chosen} 不是有效 zip: {exc}")

    return inner, {
        "kind": "ipa",
        "container": str(path),
        "ipa_members": len(names),
        "assets_zip": chosen,
        "assets_zip_candidates": cands,
        "assets_zip_bytes": len(blob),
    }


# --------------------------------------------------------------------------- #
# 清点探针
# --------------------------------------------------------------------------- #

def _probe_tex(path: Path, size: int) -> dict:
    """只读 12 字节头。字段语义未全部证实，仅做尺寸/bpp 粗估。"""
    with open(path, "rb") as fh:
        head = fh.read(TEX_HEADER_SIZE)
    if len(head) < TEX_HEADER_SIZE:
        return {"error": "header_truncated", "size": size}

    type_id, flags, unk, width, height = struct.unpack_from("<BBHHH", head, 0)
    tail = head[8:12]
    pixels = width * height
    payload = size - TEX_HEADER_SIZE
    bpp_exact = (payload / pixels) if pixels else None
    unit_guess = None
    if bpp_exact is not None:
        for unit in (1, 2, 4):
            if payload == pixels * unit:
                unit_guess = unit
                break

    return {
        "type": type_id,
        "flags": flags,
        "unk": unk,
        "width": width,
        "height": height,
        "pixels": pixels,
        "payload_bytes": payload,
        "bpp_exact": round(bpp_exact, 4) if bpp_exact is not None else None,
        "unit_guess": unit_guess,
        "tail_ok": tail == b"\xff\xff\xff\xff",
    }


def _probe_mmd(path: Path, size: int) -> dict:
    with open(path, "rb") as fh:
        head = fh.read(16)
    magic_ok = head[:4] == MMD_MAGIC
    version = int.from_bytes(head[4:8], "little") if len(head) >= 8 else None
    declared = int.from_bytes(head[8:12], "little") if len(head) >= 12 else None
    matches = None
    if declared is not None:
        matches = {
            "declared_equals_filesize": declared == size,
            "declared_plus_12_equals_filesize": declared + 12 == size,
            "declared_plus_8_equals_filesize": declared + 8 == size,
        }
    return {
        "magic_ok": magic_ok,
        "version": version,
        "declared_len": declared,
        "filesize": size,
        "len_hypotheses": matches,
    }


def _probe_xml(path: Path) -> dict:
    try:
        ET.parse(path)
        return {"ok": True}
    except ET.ParseError as exc:
        return {"ok": False, "error": f"ParseError: {exc}"}
    except OSError as exc:
        return {"ok": False, "error": f"OSError: {exc}"}


# --------------------------------------------------------------------------- #
# 清点汇总
# --------------------------------------------------------------------------- #

def _iter_assets(root: Path):
    for path in sorted(root.rglob("*")):
        if not path.is_file():
            continue
        rel = path.relative_to(root).as_posix()
        if _is_junk_name(rel):
            continue
        yield path, rel


def build_inventory(root: Path) -> dict:
    by_ext: dict[str, dict] = {}
    tex_items: list[tuple[str, int, dict]] = []
    mmd_items: list[tuple[str, int, dict]] = []
    xml_items: list[tuple[str, int, dict]] = []
    total_files = 0
    total_bytes = 0

    for path, rel in _iter_assets(root):
        try:
            size = path.stat().st_size
        except OSError:
            continue
        total_files += 1
        total_bytes += size
        ext = path.suffix.lower() or "<none>"

        bucket = by_ext.get(ext)
        if bucket is None:
            by_ext[ext] = {"count": 0, "bytes": 0, "size_min": size, "size_max": size}
            bucket = by_ext[ext]
        bucket["count"] += 1
        bucket["bytes"] += size
        bucket["size_min"] = min(bucket["size_min"], size)
        bucket["size_max"] = max(bucket["size_max"], size)

        if ext == ".tex":
            tex_items.append((rel, size, _probe_tex(path, size)))
        elif ext == ".mmd":
            mmd_items.append((rel, size, _probe_mmd(path, size)))
        elif ext == ".xml":
            xml_items.append((rel, size, _probe_xml(path)))

    warnings: list[str] = []

    # ---- tex ----
    tex_ok = [it for it in tex_items if "error" not in it[2]]
    tex_bad = [it for it in tex_items if "error" in it[2]]
    tex_summary = {
        "count": len(tex_items),
        "header_ok": len(tex_ok),
        "errors": [{"path": rel, "error": probe["error"]}
                   for rel, _size, probe in tex_bad][:32],
    }
    if tex_ok:
        widths = [it[2]["width"] for it in tex_ok]
        heights = [it[2]["height"] for it in tex_ok]
        units = Counter(it[2]["unit_guess"] if it[2]["unit_guess"] is not None else 0
                        for it in tex_ok)
        tex_summary.update({
            "width_range": [min(widths), max(widths)],
            "height_range": [min(heights), max(heights)],
            "unit_hist": {str(k): v for k, v in sorted(units.items())},
            "type_hist": {str(k): v for k, v in sorted(
                Counter(it[2]["type"] for it in tex_ok).items())},
            "tail_not_ff": [rel for rel, _s, p in tex_ok if not p["tail_ok"]][:32],
            "size_not_canonical": [
                {"path": rel, "pixels": p["pixels"], "payload": p["payload_bytes"],
                 "bpp": p["bpp_exact"]}
                for rel, _s, p in tex_ok if p["unit_guess"] is None
            ][:32],
        })
        zero_unit = tex_summary["unit_hist"].get("0", 0)
        if zero_unit:
            warnings.append(
                f"{zero_unit} 个 .tex 的 payload 长度不是 w*h*(1|2|4) 的整数倍，"
                f"tex_convert 会记 warning 并跳过（见 tex_summary.size_not_canonical）")
    if tex_bad:
        warnings.append(f"{len(tex_bad)} 个 .tex 头部不足 12 字节，无法解析")
    if not tex_items:
        warnings.append("Raw/ 内没有 .tex 文件 —— 解包是否成功？")

    # ---- mmd ----
    mmd_magic_bad = [rel for rel, _s, p in mmd_items if not p["magic_ok"]]
    hyp = Counter()
    for rel, _s, p in mmd_items:
        h = p.get("len_hypotheses") or {}
        for key, ok in h.items():
            if ok:
                hyp[key] += 1
    mmd_summary = {
        "count": len(mmd_items),
        "magic_ok": len(mmd_items) - len(mmd_magic_bad),
        "magic_bad": mmd_magic_bad[:32],
        "versions": {str(k): v for k, v in sorted(
            Counter(p.get("version") for _r, _s, p in mmd_items if p["magic_ok"]).items(),
            key=lambda kv: str(kv[0]))},
        "len_hypothesis_hits": dict(hyp),
    }
    if mmd_magic_bad:
        warnings.append(f"{len(mmd_magic_bad)} 个 .mmd 不以 HBR0 开头")

    # ---- xml ----
    xml_bad = [(rel, p["error"]) for rel, _s, p in xml_items if not p.get("ok")]
    xml_summary = {
        "count": len(xml_items),
        "parsed_ok": len(xml_items) - len(xml_bad),
        "errors": [{"path": rel, "error": err} for rel, err in xml_bad[:32]],
    }
    if xml_bad:
        warnings.append(
            f"{len(xml_bad)} 个 .xml 用 ElementTree 默认解析失败"
            f"（xml_convert.py 会尝试 gb18030 兜底）")

    return {
        "generated_at": _now(),
        "raw_dir": str(root),
        "total_files": total_files,
        "total_bytes": total_bytes,
        "by_ext": by_ext,
        "tex": tex_summary,
        "mmd": mmd_summary,
        "xml": xml_summary,
        "warnings": warnings,
    }


def render_markdown(inv: dict) -> str:
    lines: list[str] = []
    src = inv.get("source", {})
    lines.append("# 资产清点报告（T-017 · extract.py）")
    lines.append("")
    lines.append(f"- 生成时间：`{inv['generated_at']}`")
    lines.append(f"- 输入：`{src.get('container', '?')}`（kind=`{src.get('kind', 'dir')}`）")
    if src.get("assets_zip"):
        lines.append(f"- 内层资产包：`{src['assets_zip']}` "
                     f"（{src.get('assets_zip_bytes', 0)} 字节）")
    lines.append(f"- Raw 目录：`{inv['raw_dir']}`")
    lines.append(f"- 文件总数：**{inv['total_files']}**，总字节：**{inv['total_bytes']}**")
    lines.append("")

    lines.append("## 按扩展名")
    lines.append("")
    lines.append("| 扩展名 | 数量 | 总字节 | 最小 | 最大 |")
    lines.append("|---|---:|---:|---:|---:|")
    for ext, s in sorted(inv["by_ext"].items(), key=lambda kv: (-kv[1]["count"], kv[0])):
        lines.append(f"| `{ext}` | {s['count']} | {s['bytes']} | {s['size_min']} | {s['size_max']} |")
    lines.append("")

    tex = inv.get("tex", {})
    if tex.get("count"):
        lines.append("## .tex 头部统计（粗估，权威解码见 tex_convert.py）")
        lines.append("")
        lines.append(f"- 数量：{tex['count']}（头部可解析 {tex['header_ok']}）")
        lines.append(f"- 宽范围：{tex.get('width_range')}，高范围：{tex.get('height_range')}")
        lines.append(f"- 每像素字节数分布：`{tex.get('unit_hist')}`")
        lines.append(f"- 头字节 type 分布：`{tex.get('type_hist')}`")
        lines.append(f"- 尾部非 `ffffffff` 的文件：{len(tex.get('tail_not_ff', []))} 个")
        lines.append(f"- 尺寸不规范的 `.tex`：{len(tex.get('size_not_canonical', []))} 个")
        lines.append("")

    mmd = inv.get("mmd", {})
    if mmd.get("count"):
        lines.append("## .mmd 头部统计（HBR0 容器）")
        lines.append("")
        lines.append(f"- 数量：{mmd['count']}，magic 正确 {mmd['magic_ok']}")
        lines.append(f"- 版本号分布：`{mmd.get('versions')}`")
        lines.append(f"- 长度字段假设命中：`{mmd.get('len_hypothesis_hits')}` "
                     f"（用于判定「声明长度是否含 12 字节头」，见 MMD_FORMAT.md）")
        lines.append("")

    xml = inv.get("xml", {})
    if xml.get("count"):
        lines.append("## .xml 可解析性")
        lines.append("")
        lines.append(f"- 数量：{xml['count']}，默认解析成功 {xml['parsed_ok']}")
        if xml["errors"]:
            lines.append("- 失败清单（前 32）：")
            for item in xml["errors"]:
                lines.append(f"  - `{item['path']}`：{item['error']}")
        lines.append("")

    if inv.get("warnings"):
        lines.append("## 警告")
        lines.append("")
        for w in inv["warnings"]:
            lines.append(f"- {w}")
        lines.append("")

    return "\n".join(lines)


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #

def main(argv=None) -> int:
    _setup_console()
    ap = argparse.ArgumentParser(
        description="IPA → assets.zip → Raw/ 解包 + 全量清点",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=__doc__,
    )
    ap.add_argument("input", nargs="?", default=None,
                    help=f"ipa / assets.zip / 已解包目录（默认 {DEFAULT_INPUT}）")
    ap.add_argument("--out-dir", default=DEFAULT_OUT_DIR, help="Raw 输出目录")
    ap.add_argument("--report-dir", default=DEFAULT_REPORT_DIR, help="报告输出目录")
    ap.add_argument("--assets-name", default=DEFAULT_ASSETS_NAME,
                    help="ipa 内资产包文件名（默认 assets.zip）")
    ap.add_argument("--overwrite", action="store_true", help="覆盖已存在文件")
    ap.add_argument("--list-only", action="store_true",
                    help="输入按已解包目录处理，只清点不解包")
    args = ap.parse_args(argv)

    in_path = Path(args.input or DEFAULT_INPUT)
    out_dir = Path(args.out_dir)
    report_dir = Path(args.report_dir)

    source: dict
    if args.list_only or in_path.is_dir():
        if not in_path.is_dir():
            raise SystemExit(f"[extract] --list-only 需要目录输入: {in_path}")
        raw_dir = in_path
        source = {"kind": "dir", "container": str(in_path)}
        print(f"[extract] 只清点，不修改: {raw_dir}")
    else:
        raw_dir = out_dir
        print(f"[extract] 打开 {in_path}")
        zf, source = load_assets_zip(in_path, args.assets_name)
        try:
            print(f"[extract] 资产包: {source.get('assets_zip')} "
                  f"({len(zf.infolist())} 条目) → {raw_dir}")
            stats = _extract_zip(zf, raw_dir, overwrite=args.overwrite)
        finally:
            zf.close()
        source["extract_stats"] = {
            "extracted": stats["extracted"],
            "unsafe_skipped": stats["unsafe_skipped"][:32],
            "junk_skipped": len(stats["junk_skipped"]),
            "exists_skipped": len(stats["exists_skipped"]),
            "errors": stats["errors"][:32],
        }
        print(f"[extract] 解包 {stats['extracted']} 个文件"
              f"（已存在跳过 {len(stats['exists_skipped'])}，"
              f"不安全路径跳过 {len(stats['unsafe_skipped'])}，"
              f"错误 {len(stats['errors'])}）")

    if not raw_dir.is_dir():
        raise SystemExit(f"[extract] Raw 目录不存在: {raw_dir}")

    inv = build_inventory(raw_dir)
    inv["source"] = source

    report_dir.mkdir(parents=True, exist_ok=True)
    json_path = report_dir / "inventory.json"
    md_path = report_dir / "inventory.md"
    json_path.write_text(json.dumps(inv, ensure_ascii=False, indent=2), encoding="utf-8")
    md_path.write_text(render_markdown(inv), encoding="utf-8")

    print("")
    print(f"[extract] 文件总数 {inv['total_files']}，总字节 {inv['total_bytes']}")
    for ext, s in sorted(inv["by_ext"].items(), key=lambda kv: -kv[1]["count"])[:12]:
        print(f"           {ext:>10s}  x{s['count']:<5d} {s['bytes']:>10d} B")
    if inv["warnings"]:
        print("")
        for w in inv["warnings"]:
            print(f"[extract] WARN {w}")
    print("")
    print(f"[extract] 报告: {json_path}")
    print(f"[extract] 报告: {md_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())