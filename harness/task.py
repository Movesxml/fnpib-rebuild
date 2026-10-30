"""任务卡管理（Kimi 侧使用）。

python -m harness.task new --title "标题" --desc "描述" [--acceptance "验收标准"]
python -m harness.task list
python -m harness.task show --id T-001
python -m harness.task set --id T-001 --status doing [--note "补充说明"]
"""
from __future__ import annotations

import argparse
import sys

from .context import _now, get_task, load_tasks, next_task_id, save_tasks, update_task

STATUSES = ("pending", "doing", "done", "blocked")


def cmd_new(a: argparse.Namespace) -> None:
    tasks = load_tasks()
    tid = next_task_id(tasks)
    tasks.append({
        "id": tid, "title": a.title, "desc": a.desc or "",
        "acceptance": a.acceptance or "", "notes": "",
        "status": "pending", "created": _now(), "updated": _now(),
    })
    save_tasks(tasks)
    print(tid)


def cmd_list(a: argparse.Namespace) -> None:
    tasks = load_tasks()
    if not tasks:
        print("(暂无任务)")
        return
    for t in tasks:
        print(f"{t['id']:6} {t['status']:8} {t['title']}")


def cmd_show(a: argparse.Namespace) -> None:
    t = get_task(a.id)
    if not t:
        sys.exit(f"任务不存在: {a.id}")
    for k in ("id", "status", "title", "desc", "acceptance", "notes", "created", "updated"):
        print(f"{k:12}: {t.get(k, '')}")


def cmd_set(a: argparse.Namespace) -> None:
    fields = {"status": a.status}
    if a.note:
        fields["notes"] = a.note
    t = update_task(a.id, **fields)
    print(f"{t['id']} -> {t['status']}")


def main(argv=None) -> None:
    p = argparse.ArgumentParser(prog="harness.task", description="任务卡管理")
    sub = p.add_subparsers(dest="cmd", required=True)

    n = sub.add_parser("new", help="新建任务卡")
    n.add_argument("--title", required=True)
    n.add_argument("--desc", default="")
    n.add_argument("--acceptance", default="")
    n.set_defaults(func=cmd_new)

    l = sub.add_parser("list")
    l.set_defaults(func=cmd_list)

    s = sub.add_parser("show")
    s.add_argument("--id", required=True)
    s.set_defaults(func=cmd_show)

    st = sub.add_parser("set")
    st.add_argument("--id", required=True)
    st.add_argument("--status", required=True, choices=STATUSES)
    st.add_argument("--note", default="")
    st.set_defaults(func=cmd_set)

    a = p.parse_args(argv)
    a.func(a)


if __name__ == "__main__":
    main()
