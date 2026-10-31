"""调用 DeepSeek 执行编码任务（Kimi 审查后决定 --apply 落盘）。

python -m harness.coder run --task T-001             # 产出保存到 progress/T-001.response.md
python -m harness.coder run --task T-001 --apply      # 解析 ## FILE: 块并写入工作区
python -m harness.coder run --task T-001 --dry-run    # 只打印将发送的 prompt
"""
from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path

from .config import FINDINGS, WORKSPACE
from .context import (append_task_note, get_task, load_docs, load_findings,
                      load_tasks, save_progress, update_task)
from .ds_client import DeepSeekError, chat

SYSTEM_PROMPT = """你是 DeepSeek，本项目的编码执行 agent。项目采用双模型协作架构：
- Kimi K3.1 Pro（规划者）：负责架构设计、任务拆分、进度管理、最终代码审查
- 你（编码者）：根据任务卡与共享上下文产出实现，产出由 Kimi 审查后才落盘

规则：
1. 只做任务卡范围内的事，不擅自扩展；发现任务卡本身有缺陷时明确指出。
2. 本项目是把 iOS 6 时代的 IPA 现代化到 iOS 27。必须考虑旧 API 在新系统的可用性
   （OpenGL ES 已移除、32 位已不支持、UIWebView 已移除、旧 UIKit 行为变化等），
   在说明中标注兼容性风险。
3. 需要写文件时，严格使用如下格式（harness 会按此自动解析）：

## FILE: <相对工作区根目录的路径>
```<语言>
<完整文件内容>
```

4. 不得臆造 API 或系统行为；不确定处标注 [待验证]。
5. 全程使用中文回答。先给简短设计说明，再给文件。
"""

FINDING_CAP = 4000     # 单份发现摘要上限
FINDING_TOTAL = 12000  # 发现总量上限


def build_user_prompt(task: dict) -> str:
    docs = load_docs()
    tasks = load_tasks()
    t = get_task(task["id"])
    parts = [
        "===== 项目背景 (PROJECT.md) =====\n" + docs["PROJECT.md"].strip(),
        "===== 总体规划 (PLAN.md) =====\n" + docs["PLAN.md"].strip(),
        "===== 决策日志 (DECISIONS.md) =====\n" + docs["DECISIONS.md"].strip() or "(暂无)",
        "===== 当前任务卡 =====\n"
        f"编号: {t['id']}\n标题: {t['title']}\n描述:\n{t['desc']}\n"
        f"验收标准: {t.get('acceptance') or '(未定义)'}\n备注: {t.get('notes') or '(无)'}",
    ]
    findings = load_findings()
    # 任务卡可指定 extra_files（工作区相对路径，不受 findings 目录限制）与 finding_cap
    extra_files = t.get("extra_files") or []
    finding_cap = int(t.get("finding_cap") or FINDING_CAP)
    if findings or extra_files:
        budget = FINDING_TOTAL
        ftxt = []
        for rel in extra_files:  # 额外文件优先完整注入
            p = WORKSPACE / rel
            if not p.exists():
                ftxt.append(f"--- {rel} ---\n[缺失]")
                continue
            text = p.read_text(encoding="utf-8")
            # extra_files 必须完整注入（T-021~T-023 三轮皆因截断产生 API 猜测）；
            # finding_cap 只作用于下方 findings，不作用于任务卡显式点名的文件。
            ftxt.append(f"--- {rel} ---\n{text}")
        extra_names = {Path(rel).name for rel in extra_files}
        for name, text in findings.items():
            if name in extra_names:
                continue  # 避免重复注入
            if budget <= 0:
                break
            chunk = text[:FINDING_CAP]
            budget -= len(chunk)
            ftxt.append(f"--- {name} ---\n{chunk}")
        parts.append("===== 反编译/体检发现 (shared_context/findings) =====\n" + "\n\n".join(ftxt))
    parts.append(
        "===== 输出要求 =====\n按系统提示中的 ## FILE: 格式输出需要创建/修改的文件；"
        "若任务不需要写文件，直接给出结论与依据。最后列出你认为 Kimi 审查时应注意的风险点。"
    )
    return "\n\n".join(parts)


FILE_HEADER = re.compile(r"^## FILE:[ \t]*(?P<path>.+?)[ \t]*\r?$")


def parse_file_blocks(content: str) -> list:
    """解析 ## FILE: 块。内容里允许嵌套 ``` 围栏——闭合围栏取
    下一个 ## FILE: 标题或全文末尾之前的最后一行 ```。"""
    lines = content.split("\n")
    out = []
    i, n = 0, len(lines)
    while i < n:
        m = FILE_HEADER.match(lines[i])
        if not m:
            i += 1
            continue
        rel = m.group("path").strip().strip("`").strip()
        j = i + 1
        while j < n and lines[j].strip() == "":  # 跳过头部与围栏之间的空行
            j += 1
        if j < n and lines[j].startswith("```"):
            j += 1  # 跳过开头围栏
        else:
            i += 1
            continue
        close_idx = None
        k = j
        while k < n:
            if FILE_HEADER.match(lines[k]):
                break
            if lines[k].startswith("```"):
                close_idx = k
            k += 1
        if close_idx is None:
            i += 1
            continue
        code = "\n".join(lines[j:close_idx])
        p = (WORKSPACE / rel).resolve()  # 防目录穿越
        if not str(p).startswith(str(WORKSPACE.resolve())):
            print(f"[跳过] 路径越界: {rel}", file=sys.stderr)
        else:
            out.append((rel, code))
        i = close_idx + 1
    return out


def cmd_run(a: argparse.Namespace) -> None:
    t = get_task(a.task)
    if not t:
        sys.exit(f"任务不存在: {a.task}")
    if t["status"] == "done":
        sys.exit(f"{t['id']} 已完成。如需重做请先把状态改回 pending/doing。")

    prompt = build_user_prompt(t)
    if a.dry_run:
        print(SYSTEM_PROMPT + "\n\n" + prompt)
        return

    update_task(t["id"], status="doing")
    print(f"[{t['id']}] 调用 DeepSeek（模型可经 --model 覆盖）…")
    try:
        content, usage = chat(
            [{"role": "system", "content": SYSTEM_PROMPT},
             {"role": "user", "content": prompt}],
            model=a.model, purpose=f"coder:{t['id']}",
        )
    except DeepSeekError as e:
        sys.exit(f"DeepSeek 调用失败: {e}")

    save_progress(f"{t['id']}.response", content)
    ptok = usage.get("prompt_tokens", "?")
    ctok = usage.get("completion_tokens", "?")
    print(f"完成，prompt={ptok} tokens / completion={ctok} tokens")
    print(f"产出: shared_context/progress/{t['id']}.response.md")

    files = parse_file_blocks(content)
    if files:
        print(f"解析到 {len(files)} 个文件块:")
        for rel, _ in files:
            print(f"  - {rel}")
        if a.apply:
            for rel, code in files:
                p = WORKSPACE / rel
                p.parent.mkdir(parents=True, exist_ok=True)
                p.write_text(code, encoding="utf-8")
                print(f"已写入 {rel} ({len(code)} 字符)")
        else:
            print("（未落盘。审查后加 --apply 重跑，或手动复制。）")
    else:
        print("未解析到文件块——这是纯分析类产出，请阅读 response.md。")


def main(argv=None) -> None:
    p = argparse.ArgumentParser(prog="harness.coder", description="DeepSeek 编码执行")
    sub = p.add_subparsers(dest="cmd", required=True)
    r = sub.add_parser("run", help="执行指定任务卡")
    r.add_argument("--task", required=True)
    r.add_argument("--model", default=None, help="覆盖 .env 里的模型")
    r.add_argument("--apply", action="store_true", help="解析并写入文件块")
    r.add_argument("--dry-run", action="store_true", help="只打印 prompt")
    r.set_defaults(func=cmd_run)
    a = p.parse_args(argv)
    a.func(a)


if __name__ == "__main__":
    main()
