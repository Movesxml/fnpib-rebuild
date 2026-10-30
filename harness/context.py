"""共享上下文：文件级的双模型共同记忆。Kimi 与 DeepSeek 都通过这里读写。"""
from __future__ import annotations

import json
from datetime import datetime, timezone
from pathlib import Path

from .config import FINDINGS, MEMORY, PROGRESS, SHARED

TASKS_JSON = SHARED / "tasks.json"


def _read(path: Path) -> str:
    return path.read_text(encoding="utf-8") if path.exists() else ""


def load_docs(names=("PROJECT.md", "PLAN.md", "DECISIONS.md")) -> dict:
    return {n: _read(SHARED / n) for n in names}


def load_findings() -> dict:
    """返回 {文件名: 内容}，供编码 prompt 组装。"""
    out = {}
    if FINDINGS.exists():
        for p in sorted(FINDINGS.glob("*.md")):
            out[p.name] = p.read_text(encoding="utf-8")
    return out


def load_tasks() -> list:
    if TASKS_JSON.exists():
        try:
            return json.loads(TASKS_JSON.read_text(encoding="utf-8"))
        except json.JSONDecodeError:
            return []
    return []


def save_tasks(tasks: list) -> None:
    SHARED.mkdir(parents=True, exist_ok=True)
    TASKS_JSON.write_text(
        json.dumps(tasks, ensure_ascii=False, indent=2), encoding="utf-8"
    )
    _render_tasks_md(tasks)


def _render_tasks_md(tasks: list) -> None:
    lines = ["# 任务卡（task.py 自动生成，请勿手改格式）", ""]
    for t in tasks:
        lines.append(f"### [{t['id']}] {t['status']} :: {t['title']}")
        lines.append(f"- 创建: {t['created']}　更新: {t.get('updated', '-')}")
        if t.get("acceptance"):
            lines.append(f"- 验收: {t['acceptance']}")
        if t.get("notes"):
            lines.append(f"- 备注: {t['notes']}")
        lines.append("")
        lines.append(t.get("desc", "").strip())
        lines.append("")
    (SHARED / "TASKS.md").write_text("\n".join(lines), encoding="utf-8")


def get_task(task_id: str) -> dict | None:
    for t in load_tasks():
        if t["id"] == task_id:
            return t
    return None


def update_task(task_id: str, **fields) -> dict:
    tasks = load_tasks()
    for t in tasks:
        if t["id"] == task_id:
            t.update(fields)
            t["updated"] = _now()
            save_tasks(tasks)
            return t
    raise KeyError(f"任务不存在: {task_id}")


def next_task_id(tasks=None) -> str:
    tasks = tasks if tasks is not None else load_tasks()
    nums = []
    for t in tasks:
        tid = t.get("id", "")
        if tid.startswith("T-"):
            try:
                nums.append(int(tid[2:]))
            except ValueError:
                pass
    return f"T-{(max(nums) + 1) if nums else 1:03d}"


def _now() -> str:
    return datetime.now(timezone.utc).astimezone().isoformat(timespec="seconds")


def append_decision(title: str, body: str) -> None:
    p = SHARED / "DECISIONS.md"
    with p.open("a", encoding="utf-8") as f:
        f.write(f"\n## [{_now()}] {title}\n\n{body}\n")


def append_task_note(task_id: str, note: str) -> None:
    t = get_task(task_id)
    old = t.get("notes", "")
    update_task(task_id, notes=(old + " | " + note).strip(" |"))


def save_finding(name: str, text: str) -> Path:
    FINDINGS.mkdir(parents=True, exist_ok=True)
    p = FINDINGS / f"{name}.md"
    p.write_text(text, encoding="utf-8")
    return p


def save_progress(name: str, text: str) -> Path:
    PROGRESS.mkdir(parents=True, exist_ok=True)
    p = PROGRESS / f"{name}.md"
    p.write_text(text, encoding="utf-8")
    return p


def log_usage(record: dict) -> None:
    MEMORY.mkdir(parents=True, exist_ok=True)
    with (MEMORY / "usage.jsonl").open("a", encoding="utf-8") as f:
        f.write(json.dumps(record, ensure_ascii=False) + "\n")
