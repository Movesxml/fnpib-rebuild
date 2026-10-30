# -*- coding: utf-8 -*-
"""GitHub API 推送（并行版，绕开 github.com 直连封锁，只走 api.github.com）。

用法:
    python tools/github_api_push.py <TOKEN> <owner/repo>

前提: 本目录已是 git 仓库（读 `git ls-files`），api.github.com 可直连。
流程: 逐文件建 blob（8 线程并行）→ 嵌套 tree → commit → 更新 heads/main。
"""
import base64
import hashlib
import json
import os
import subprocess
import sys
import threading
import time
import urllib.error
import urllib.request
from concurrent.futures import ThreadPoolExecutor

API = "https://api.github.com"
TOKEN = sys.argv[1]
FULL = sys.argv[2]            # owner/repo
OWNER, REPO = FULL.split("/")
CHECKPOINT = "build/.blob_checkpoint.json"   # 断点：已建 blob 的 path->sha
_lock = threading.Lock()
_last = [0.0]


def api(method: str, path: str, payload: dict | None = None, retries: int = 5) -> dict:
    data = json.dumps(payload).encode() if payload is not None else None
    for attempt in range(retries):
        req = urllib.request.Request(
            API + path, data=data, method=method,
            headers={
                "Authorization": f"Bearer {TOKEN}",
                "Accept": "application/vnd.github+json",
                "X-GitHub-Api-Version": "2022-11-28",
                "Content-Type": "application/json",
            },
        )
        try:
            with urllib.request.urlopen(req, timeout=60) as r:
                return json.loads(r.read())
        except urllib.error.HTTPError as e:
            body = e.read().decode(errors="replace")[:300]
            if "secondary rate limit" in body:
                print(f"  [限流] 触发二级速率限制，等 60s 后重试…")
                time.sleep(60)
                continue
            if e.code in (502, 503, 504, 429) or e.code >= 500:
                time.sleep(2 * (attempt + 1))
                continue
            raise SystemExit(f"API {method} {path} -> HTTP {e.code}: {body}")
        except Exception:
            time.sleep(2 * (attempt + 1))
    raise SystemExit(f"API {method} {path} 重试 {retries} 次仍失败（网络抖动）")


def make_blob(path: str) -> tuple[str, str]:
    raw = open(path, "rb").read()
    # 写请求节流：至少间隔 0.35s，避开 GitHub 二级速率限制
    with _lock:
        wait = 0.35 - (time.monotonic() - _last[0])
        if wait > 0:
            time.sleep(wait)
        _last[0] = time.monotonic()
    r = api("POST", f"/repos/{OWNER}/{REPO}/git/blobs",
            {"content": base64.b64encode(raw).decode(), "encoding": "base64"})
    return path, r["sha"]


def main() -> None:
    me = api("GET", "/user")
    print(f"账号: {me['login']}  目标: {FULL}")

    head = api("GET", f"/repos/{FULL}/git/ref/heads/main")
    base_sha = head["object"]["sha"]
    print(f"main 基点: {base_sha[:10]}")

    files = subprocess.run(["git", "ls-files"], capture_output=True, text=True,
                           check=True).stdout.splitlines()
    print(f"待推送文件: {len(files)}")

    def git_sha(path: str) -> str:
        """本地计算 git blob sha（内容寻址，与 GitHub 返回的 blob sha 一致）。"""
        data = open(path, "rb").read()
        return hashlib.sha1(b"blob %d\0" % len(data) + data).hexdigest()

    blobs: dict[str, str] = {}
    if os.path.exists(CHECKPOINT):
        blobs = json.load(open(CHECKPOINT, encoding="utf-8"))
        # 内容校验：仅当本地内容未变时才跳过（防陈旧缓存漏推）
        blobs = {p: s for p, s in blobs.items() if p in files and git_sha(p) == s}
    print(f"断点恢复: 已跳过 {len(blobs)} 个未变更 blob")
    todo = [f for f in files if f not in blobs]
    print(f"还需创建: {len(todo)}")

    done = 0
    os.makedirs("build", exist_ok=True)
    with ThreadPoolExecutor(max_workers=2) as ex:
        for path, sha in ex.map(make_blob, todo):
            blobs[path] = sha
            with _lock:
                json.dump(blobs, open(CHECKPOINT, "w", encoding="utf-8"))
            done += 1
            if done % 50 == 0 or done == len(todo):
                print(f"  blobs: {done}/{len(todo)}")

    def build_tree(prefix: str) -> str:
        entries, dirs, leaves = [], set(), []
        for path, sha in blobs.items():
            if not path.startswith(prefix):
                continue
            rest = path[len(prefix):]
            if "/" in rest:
                dirs.add(rest.split("/", 1)[0])
            else:
                leaves.append((rest, sha))
        for name in sorted(dirs):
            entries.append({"path": name, "mode": "040000", "type": "tree",
                            "sha": build_tree(f"{prefix}{name}/")})
        for name, sha in sorted(leaves):
            entries.append({"path": name, "mode": "100644", "type": "blob", "sha": sha})
        return api("POST", f"/repos/{FULL}/git/trees", {"tree": entries})["sha"]

    tree_sha = build_tree("")
    print(f"tree: {tree_sha[:10]}")

    commit = api("POST", f"/repos/{FULL}/git/commits", {
        "message": "T-001~T-020: iOS 重建工程全量（双模型协作产出）",
        "tree": tree_sha, "parents": [base_sha],
    })
    api("PATCH", f"/repos/{FULL}/git/refs/heads/main",
        {"sha": commit["sha"], "force": True})
    print(f"完成: https://github.com/{FULL} (commit {commit['sha'][:8]})")
    print("Actions 已触发: push -> .github/workflows/ios.yml")


if __name__ == "__main__":
    main()
