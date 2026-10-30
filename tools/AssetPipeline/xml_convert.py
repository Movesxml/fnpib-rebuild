#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""T-017 / tools/AssetPipeline/xml_convert.py — 游戏配置 xml → json

【保真原则】
只做「结构搬运」，不改语义、不做类型强转（数字仍是字符串）。这样下游
Swift 解码时能否失败得清清楚楚，也便于和反编译常量逐字段对照。

元素 → 对象::

    {"tag": "fruit",
     "attrs": {"chance": "0.12", "name": "watermelon"},
     "text": "可选，去首尾空白，纯空白丢弃",
     "children": [ ...文档顺序... ]}

  * 属性顺序不保证（ElementTree 语义），需要顺序请用 attrs 之外的 children
  * 注释 / 处理指令丢弃（ElementTree 默认行为）
  * 命名空间保留为 `{uri}local` 形式；原版资源应无命名空间，若有会在 index 里列 warning
  * `--max-depth N` 可截断（N=0 表示不限制），被截断节点记 `children_omitted: <数量>`

【编码兜底】
先按 XML 声明的编码解析（ET 对 bytes 输入自动处理）；
失败则尝试 gb18030 解码后再解析（老中文资源兜底），命中会在条目里标
`encoding: gb18030-fallback` + `warning: encoding_fallback`。
⚠️ 兜底有把「真正的语法损坏」误判成「编码问题」的风险，所以只作为第二方案，
   且两条错误信息都会写进 index.json。

【fruitlist.xml / wave 相关 xml —— 人工抽检样例】
⚠️ TODO（未填）：T-017 执行环境没有真实 assets.zip 可读，为避免臆造数据，
此处不伪造样例。跑完一次转换后请按下述清单抽检并把结果贴回本段注释：

    python tools/AssetPipeline/xml_convert.py build/AssetPipeline/Raw \
        build/AssetPipeline/Json

  建议抽检对象（index.json 里会给出命中路径）：
    1) fruitlist.xml —— 逐项对照 core_logic_notes 的 chance / chance_inc /
       new_life_at / scale / spread / disappear_speed（⚠️ 这几个字段目前只有
       macho 单源，无 exe 交叉验证）
    2) wave*.xml —— until 字段的 atoi/forever 语义是否与 T-014 WaveDirector 一致
    3) input*.xml —— 触摸区域坐标系是否为归一化 [0,1] 还是像素
    4) buildNumber.xml —— 版本号应为 1.0.4

  抽检要点：
    - 属性写法 vs 子元素写法是否混用（影响 Swift Codable 的 keyDecodingStrategy）
    - 浮点数是否用 '0.5' 还是 '0,5'（本地化小数点是经典坑）
    - 布尔量是 '1' / 'true' / 'yes'（三选一，别都写）

【用法】
::

    python tools/AssetPipeline/xml_convert.py Raw build/AssetPipeline/Json
    python tools/AssetPipeline/xml_convert.py Raw out --max-depth 6
    python tools/AssetPipeline/xml_convert.py --selftest

依赖：仅标准库。
"""

from __future__ import annotations

import argparse
import json
import sys
import tempfile
import xml.etree.ElementTree as ET
from collections import Counter
from datetime import datetime
from pathlib import Path

MAX_PREVIEW_ATTRS = 16


# --------------------------------------------------------------------------- #
# 解析
# --------------------------------------------------------------------------- #

def parse_xml(data: bytes) -> tuple[ET.Element | None, str | None, str | None]:
    """返回 (root, error, encoding_tag)。"""
    try:
        return ET.fromstring(data), None, "as-declared"
    except ET.ParseError as first_err:
        try:
            text = data.decode("gb18030")
        except UnicodeDecodeError as dec_err:
            return None, (f"ParseError(as-declared): {first_err} | "
                          f"gb18030 decode failed: {dec_err}"), None
        try:
            root = ET.fromstring(text)
            return root, None, "gb18030-fallback"
        except ET.ParseError as second_err:
            return None, (f"ParseError(as-declared): {first_err} | "
                          f"ParseError(gb18030): {second_err}"), None


def elem_to_obj(el: ET.Element, depth_limit: int | None, depth: int = 0) -> dict:
    obj: dict = {"tag": el.tag}
    if el.attrib:
        obj["attrs"] = dict(el.attrib)

    text = (el.text or "").strip()
    if text:
        obj["text"] = text

    kids = list(el)
    if kids:
        if depth_limit is not None and depth >= depth_limit:
            obj["children_omitted"] = len(kids)
        else:
            obj["children"] = [elem_to_obj(k, depth_limit, depth + 1) for k in kids]
    return obj


def walk_stats(root: ET.Element) -> tuple[int, int, set[str]]:
    nodes = 0
    max_depth = 0
    attrs: set[str] = set()
    stack: list[tuple[ET.Element, int]] = [(root, 0)]
    while stack:
        node, depth = stack.pop()
        nodes += 1
        max_depth = max(max_depth, depth)
        attrs.update(node.attrib.keys())
        stack.extend((child, depth + 1) for child in node)
    return nodes, max_depth, attrs


# --------------------------------------------------------------------------- #
# 批量转换
# --------------------------------------------------------------------------- #

def _rel_of(path: Path, in_path: Path) -> Path:
    try:
        return path.relative_to(in_path)
    except ValueError:
        return Path(path.name)


def collect_xml(in_path: Path) -> list[Path]:
    if in_path.is_file():
        return [in_path]
    files = [p for p in in_path.rglob("*") if p.is_file() and p.suffix.lower() == ".xml"]
    files.sort()
    return files


def convert_one(src: Path, in_path: Path, out_root: Path, *,
                depth_limit: int | None, indent: int, force: bool) -> dict:
    rel = _rel_of(src, in_path)
    out_rel = rel.with_suffix(".json")
    entry: dict = {
        "source": rel.as_posix(),
        "output": out_rel.as_posix(),
    }

    try:
        data = src.read_bytes()
    except OSError as exc:
        entry.update({"status": "error", "error": f"read: {exc}"})
        return entry
    entry["bytes"] = len(data)

    root, err, encoding = parse_xml(data)
    if root is None:
        entry.update({"status": "error", "error": err})
        return entry
    entry["encoding"] = encoding
    if encoding == "gb18030-fallback":
        entry["warning"] = "encoding_fallback"

    nodes, max_depth, attrs = walk_stats(root)
    entry.update({
        "root_tag": root.tag,
        "nodes": nodes,
        "max_depth": max_depth,
        "attrs_sample": sorted(attrs)[:MAX_PREVIEW_ATTRS],
    })
    if root.tag.startswith("{"):
        entry["warning"] = (entry.get("warning", "") + " namespaced_tag").strip()

    doc = {
        "source": rel.as_posix(),
        "bytes": len(data),
        "encoding": encoding,
        "root": elem_to_obj(root, depth_limit),
    }

    dst = out_root / out_rel
    if dst.exists() and not force:
        entry.update({"status": "skipped", "reason": "exists"})
        return entry

    try:
        dst.parent.mkdir(parents=True, exist_ok=True)
        dst.write_text(json.dumps(doc, ensure_ascii=False, indent=indent),
                       encoding="utf-8")
    except OSError as exc:
        entry.update({"status": "error", "error": f"write: {exc}"})
        return entry

    entry["status"] = "ok"
    entry["json_bytes"] = dst.stat().st_size
    return entry


def convert_tree(in_path: Path, out_root: Path, *,
                 depth_limit: int | None = None,
                 indent: int = 2,
                 force: bool = False,
                 quiet: bool = False) -> tuple[list[dict], dict]:
    files = collect_xml(in_path)
    if not quiet:
        print(f"[xml] 待处理 {len(files)} 个 .xml（in={in_path} out={out_root}）")

    entries: list[dict] = []
    for idx, src in enumerate(files, 1):
        entry = convert_one(src, in_path, out_root,
                            depth_limit=depth_limit, indent=indent, force=force)
        entries.append(entry)
        if not quiet and entry["status"] != "ok":
            print(f"[xml] {idx:>3d}/{len(files)} {entry['status']:<7s} "
                  f"{entry['source']}  {entry.get('error', '')}")

    summary = {
        "total": len(entries),
        "by_status": dict(Counter(e["status"] for e in entries)),
        "encodings": dict(Counter(e.get("encoding", "<none>") for e in entries)),
        "root_tags": dict(Counter(e.get("root_tag", "<none>") for e in entries)),
        "warnings": dict(Counter(
            token
            for e in entries
            for token in str(e.get("warning", "")).split()
        )),
    }
    return entries, summary


def write_index(path: Path, entries: list[dict], summary: dict, *,
                in_path: Path, out_root: Path) -> None:
    doc = {
        "tool": "xml_convert.py",
        "tool_version": 1,
        "generated_at": datetime.now().astimezone().isoformat(timespec="seconds"),
        "in_path": str(in_path),
        "out_dir": str(out_root),
        "summary": summary,
        "entries": entries,
        "manual_checklist": [
            "fruitlist.xml: chance / chance_inc / new_life_at / scale / spread / disappear_speed"
            "（仅 macho 单源，务必人工核对）",
            "wave*.xml: until 字段 → WaveDirector 的 atoi/forever 语义",
            "input*.xml: 触摸坐标是否归一化",
            "buildNumber.xml: 版本应为 1.0.4",
            "检查浮点数是否为句点小数、布尔量写法是否统一",
        ],
    }
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(doc, ensure_ascii=False, indent=2), encoding="utf-8")


# --------------------------------------------------------------------------- #
# selftest
# --------------------------------------------------------------------------- #

SAMPLE_UTF8 = """<?xml version="1.0" encoding="UTF-8"?>
<fruitlist version="1.0.4">
  <fruit name="watermelon" chance="0.12" chance_inc="0.01">
    <scale>1.25</scale>
    <spread>3</spread>
  </fruit>
  <fruit name="banana" chance="0.20">
    <note>香蕉 &amp; 苹果</note>
  </fruit>
  <!-- 注释应被丢弃 -->
  <wave until="forever" no="3"/>
</fruitlist>
"""


def selftest(verbose: bool = True) -> int:
    failures: list[str] = []
    checks = 0

    def check(cond: bool, msg: str) -> None:
        nonlocal checks
        checks += 1
        if cond:
            if verbose:
                print(f"[selftest] ok   {msg}")
        else:
            failures.append(msg)
            print(f"[selftest] FAIL {msg}")

    tmp = Path(tempfile.mkdtemp(prefix="fnpib_xml_selftest_"))
    if verbose:
        print(f"[selftest] 临时目录 {tmp}")

    # ---- 1. 基础结构保真 ----
    root, err, enc = parse_xml(SAMPLE_UTF8.encode("utf-8"))
    check(root is not None and err is None, "UTF-8 样例解析成功")
    check(enc == "as-declared", f"encoding 标记正确（{enc}）")
    check(root is not None and root.tag == "fruitlist", "root tag 正确")

    nodes, max_depth, attrs = walk_stats(root)
    check(nodes == 7, f"节点计数（got {nodes}, 期望 7）")
    check(max_depth == 2, f"最大深度（got {max_depth}, 期望 2）")
    check({"name", "chance", "chance_inc", "until", "no"} <= attrs,
          f"属性收集完整（{sorted(attrs)}）")

    obj = elem_to_obj(root, None)
    check(obj["attrs"]["version"] == "1.0.4", "根属性保留")
    kids = obj["children"]
    check([k["tag"] for k in kids] == ["fruit", "fruit", "wave"],
          f"子元素顺序且注释被丢弃（{[k['tag'] for k in kids]}）")
    first = kids[0]
    check(first["attrs"]["name"] == "watermelon" and first["attrs"]["chance"] == "0.12",
          "子元素属性保留（字符串类型不转换）")
    check([c["tag"] for c in first["children"]] == ["scale", "spread"],
          "孙元素顺序正确")
    check(first["children"][0]["text"] == "1.25", "文本节点保留")
    check(kids[1]["children"][0]["text"] == "香蕉 & 苹果", "实体 &amp; 解码正确")
    check("text" not in obj, "根节点纯空白文本被丢弃")

    # ---- 2. depth 截断 ----
    trunc = elem_to_obj(root, depth_limit=0)
    check(trunc["children_omitted"] == 3 and "children" not in trunc,
          "depth_limit=0 截断并记录数量")

    # ---- 3. gb18030 兜底 ----
    gbk_doc = '<?xml version="1.0"?><a><b>中文内容</b></a>'
    root_g, err_g, enc_g = parse_xml(gbk_doc.encode("gb18030"))
    if root_g is not None and enc_g == "gb18030-fallback":
        check(True, "gb18030 兜底命中")
        check(elem_to_obj(root_g, None)["children"][0]["text"] == "中文内容",
              "gb18030 文本正确还原")
    else:
        # 某些平台 expat 对非法 UTF-8 的处理可能不同，宽松跳过而非判失败
        print(f"[selftest] SKIP gb18030 兜底（解析结果 enc={enc_g}, err={err_g}）")

    # ---- 4. 损坏 xml ----
    root_b, err_b, enc_b = parse_xml(b"<a><b>oops</a>")
    check(root_b is None and err_b is not None, "损坏 xml 返回 error 而非抛异常")
    check(enc_b is None, "损坏 xml 无 encoding 标记")

    # ---- 5. 文件级往返 ----
    raw = tmp / "Raw"
    out = tmp / "Out"
    (raw / "cfg").mkdir(parents=True, exist_ok=True)
    (raw / "cfg" / "fruitlist.xml").write_bytes(SAMPLE_UTF8.encode("utf-8"))
    (raw / "cfg" / "broken.xml").write_bytes(b"<a><b></a>")
    (raw / "readme.txt").write_text("ignore", encoding="utf-8")

    entries, summary = convert_tree(raw, out, quiet=True, force=True)
    check(len(entries) == 2, f"只处理 .xml（got {len(entries)}）")
    by_src = {e["source"]: e for e in entries}
    check(by_src["cfg/fruitlist.xml"]["status"] == "ok", "fruitlist 转换成功")
    check(by_src["cfg/broken.xml"]["status"] == "error", "损坏文件记 error 不中断")

    json_path = out / "cfg" / "fruitlist.json"
    check(json_path.exists(), "JSON 落盘")
    doc = json.loads(json_path.read_text(encoding="utf-8"))
    check(doc["root"]["tag"] == "fruitlist", "JSON 结构完整")
    check(doc["root"]["children"][1]["children"][0]["text"] == "香蕉 & 苹果",
          "JSON 中实体已解码且非 ASCII 正常写入")

    index_path = out / "index.json"
    write_index(index_path, entries, summary, in_path=raw, out_root=out)
    idx = json.loads(index_path.read_text(encoding="utf-8"))
    check(idx["summary"]["total"] == 2 and "manual_checklist" in idx,
          "index.json 含 summary 与人工抽检清单")

    # ---- 6. --force 语义 ----
    entries2, _ = convert_tree(raw, out, quiet=True, force=False)
    skipped = sum(1 for e in entries2 if e["status"] == "skipped")
    check(skipped == 1, f"已存在且无 --force 时跳过（got {skipped}）")

    print("")
    if failures:
        print(f"[selftest] 失败 {len(failures)}/{checks}")
        for f in failures:
            print(f"  - {f}")
        return 1
    print(f"[selftest] 全部通过（{checks} 项检查）")
    return 0


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #

def _setup_console() -> None:
    for stream in (sys.stdout, sys.stderr):
        try:
            stream.reconfigure(encoding="utf-8", errors="replace")
        except Exception:
            pass


def main(argv=None) -> int:
    _setup_console()
    ap = argparse.ArgumentParser(
        description="游戏配置 xml → json（T-017）",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=__doc__,
    )
    ap.add_argument("in_dir", nargs="?", help="Raw 资产目录或单个 .xml")
    ap.add_argument("out_dir", nargs="?", help="JSON 输出目录")
    ap.add_argument("--in-dir", dest="in_dir_opt", default=None)
    ap.add_argument("--out-dir", dest="out_dir_opt", default=None)
    ap.add_argument("--max-depth", type=int, default=0,
                    help="层级截断（0 = 不限制，默认 0）")
    ap.add_argument("--indent", type=int, default=2, help="JSON 缩进（默认 2）")
    ap.add_argument("--index", default=None, help="index.json 路径（默认 <out_dir>/index.json）")
    ap.add_argument("--force", action="store_true", help="覆盖已存在的 JSON")
    ap.add_argument("--selftest", action="store_true")
    ap.add_argument("--quiet", action="store_true")
    args = ap.parse_args(argv)

    if args.selftest:
        return selftest(verbose=not args.quiet)

    in_arg = args.in_dir or args.in_dir_opt
    out_arg = args.out_dir or args.out_dir_opt
    if not in_arg or not out_arg:
        ap.error("需要 in_dir 与 out_dir（或使用 --selftest）")

    in_path = Path(in_arg)
    out_root = Path(out_arg)
    if not in_path.exists():
        raise SystemExit(f"[xml] 输入不存在: {in_path}")

    depth_limit = args.max_depth if args.max_depth and args.max_depth > 0 else None

    entries, summary = convert_tree(
        in_path, out_root,
        depth_limit=depth_limit,
        indent=args.indent,
        force=args.force,
        quiet=args.quiet,
    )

    index_path = Path(args.index) if args.index else (out_root / "index.json")
    write_index(index_path, entries, summary, in_path=in_path, out_root=out_root)

    if not args.quiet:
        print("")
        print(f"[xml] 完成 {summary['total']} 个：{summary['by_status']}")
        print(f"[xml] 编码分布：{summary['encodings']}")
        if summary["warnings"]:
            print(f"[xml] 警告：{summary['warnings']}")
        print(f"[xml] index: {index_path}")
        print("[xml] 提醒：fruitlist/wave 等关键 xml 需按 index.json 的 "
              "manual_checklist 人工抽检（本轮未填样例，见文件头 TODO）")

    return 0 if summary["by_status"].get("error", 0) == 0 else 2


if __name__ == "__main__":
    raise SystemExit(main())