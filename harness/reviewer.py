"""DeepSeek 自审（可选）：对编码产出做第二意见审查，Kimi 终审。

python -m harness.reviewer run --task T-001
"""
from __future__ import annotations

import argparse
import sys
from pathlib import Path

from .config import PROGRESS
from .context import get_task, save_progress
from .ds_client import DeepSeekError, chat

REVIEW_PROMPT = """你是本项目的代码审查 agent。Kimi（规划者）会让 DeepSeek（编码者）完成任务卡，
现在由你对编码产出做独立自审。要求：
1. 对照任务卡的描述与验收标准逐项核对。
2. 重点检查：iOS 27 API 兼容性、32 位→64 位问题、内存管理约定（旧 MRC 代码现代化）、
   分辨率/刷新率硬编码、臆造的 API（标注 [待验证] 处）。
3. 输出：按「阻断问题 / 重要问题 / 建议 / 结论（通过|需修改）」四节给出，中文。
不要修改代码，只出审查意见。"""


def cmd_run(a: argparse.Namespace) -> None:
    t = get_task(a.task)
    if not t:
        sys.exit(f"任务不存在: {a.task}")
    resp_path = PROGRESS / f"{t['id']}.response.md"
    if not resp_path.exists():
        sys.exit(f"先运行 coder: python -m harness.coder run --task {t['id']}")
    response = resp_path.read_text(encoding="utf-8")

    user = (f"===== 任务卡 =====\n标题: {t['title']}\n描述:\n{t['desc']}\n"
            f"验收标准: {t.get('acceptance') or '(未定义)'}\n\n"
            f"===== 编码产出 ({resp_path.name}) =====\n{response}")
    print(f"[{t['id']}] 调用 DeepSeek 自审…")
    try:
        content, usage = chat(
            [{"role": "system", "content": REVIEW_PROMPT},
             {"role": "user", "content": user}],
            model=a.model, purpose=f"reviewer:{t['id']}",
        )
    except DeepSeekError as e:
        sys.exit(f"DeepSeek 调用失败: {e}")

    save_progress(f"{t['id']}.review", content)
    print(f"审查意见: shared_context/progress/{t['id']}.review.md")
    print(f"tokens: prompt={usage.get('prompt_tokens', '?')} / completion={usage.get('completion_tokens', '?')}")


def main(argv=None) -> None:
    p = argparse.ArgumentParser(prog="harness.reviewer", description="DeepSeek 自审")
    sub = p.add_subparsers(dest="cmd", required=True)
    r = sub.add_parser("run")
    r.add_argument("--task", required=True)
    r.add_argument("--model", default=None)
    r.set_defaults(func=cmd_run)
    a = p.parse_args(argv)
    a.func(a)


if __name__ == "__main__":
    main()
