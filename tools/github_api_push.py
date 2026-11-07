# -*- coding: utf-8 -*-
"""通过 GitHub REST API 推送当前工作树（绕开 github.com 直连封锁，只走 api.github.com）。

用法:
    set GITHUB_TOKEN=...            # 或 --token-file
    python tools/github_api_push.py --repo Movesxml/fnpib-rebuild --message "T-078: ..."
    python tools/github_api_push.py --repo ... --message ... --dry-run

行为:
    1. 读取 git ls-files 得到受版本控制的文件集合（自动尊重 .gitignore）。
    2. 拉取远端 main 的树，只对内容变化的文件建 blob（其余复用远端树，省流量与时间）。
    3. 用完整树建 commit（parent = 远端 head），更新 refs/heads/main。
    4. --dry-run 只打印差异，不发写请求。

与旧版的差异:
    - 不再依赖 build/.blob_checkpoint.json 断点（远端树即断点，天然幂等）。
    - 提交信息可指定，不再硬编码。
    - 推送前打印差异清单，便于审查。
"""
from __future__ import annotations

import argparse
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
_lock = threading.Lock()
_last = [0.0]
GIT_CANDIDATES = [
    r"D:\tools\git\cmd\git.exe",
    "git",
]


def git_bin() -> str:
    for candidate in GIT_CANDIDATES:
        try:
            subprocess.run([candidate, "--version"], capture_output=True, check=True)
            return candidate
        except (OSError, subprocess.CalledProcessError):
            continue
    raise SystemExit("找不到 git，可执行文件：tools/github_api_push.py")

GIT = git_bin()


def api(method: str, path: str, payload: dict | None = None, retries: int = 5,
        token: str | None = None, dry_run: bool = False) -> dict:
    if dry_run and method != "GET":
        raise SystemExit(f"--dry-run 下不应发写请求: {method} {path}")
    data = json.dumps(payload).encode() if payload is not None else None
    for attempt in range(retries):
        req = urllib.request.Request(
            API + path, data=data, method=method,
            headers={
                "Authorization": f"Bearer {token}",
                "Accept": "application/vnd.github+json",
                "X-GitHub-Api-Version": "2022-11-28",
                "Content-Type": "application/json",
                "User-Agent": "dsh-agent",
            },
        )
        try:
            with urllib.request.urlopen(req, timeout=120) as r:
                return json.loads(r.read())
        except urllib.error.HTTPError as e:
            body = e.read().decode(errors="replace")[:400]
            if "secondary rate limit" in body or e.code == 429:
                print("  [限流] 等待 60s 后重试…")
                time.sleep(60)
                continue
            if e.code >= 500:
                time.sleep(2 * (attempt + 1))
                continue
            raise SystemExit(f"API {method} {path} -> HTTP {e.code}: {body}")
        except Exception:
            time.sleep(2 * (attempt + 1))
    raise SystemExit(f"API {method} {path} 重试 {retries} 次仍失败")


def git_blob_sha(path: str) -> str:
    data = open(path, "rb").read()
    return hashlib.sha1(b"blob %d\0" % len(data) + data).hexdigest()


def make_blob(path: str, token: str) -> tuple[str, str]:
    raw = open(path, "rb").read()
    with _lock:
        wait = 0.35 - (time.monotonic() - _last[0])
        if wait > 0:
            time.sleep(wait)
        _last[0] = time.monotonic()
    r = api("POST", f"/repos/{OWNER}/{REPO}/git/blobs",
            {"content": base64.b64encode(raw).decode(), "encoding": "base64"},
            token=token)
    return path, r["sha"]


OWNER = REPO = ""


def main() -> None:
    global OWNER, REPO
    ap = argparse.ArgumentParser()
    ap.add_argument("--repo", required=True, help="owner/repo")
    ap.add_argument("--message", required=True)
    ap.add_argument("--token")
    ap.add_argument("--token-file", default=os.environ.get("DSH_GH_TOKEN_FILE", r"D:\temp\gh_token.txt"))
    ap.add_argument("--branch", default="main")
    ap.add_argument("--dry-run", action="store_true")
    ap.add_argument("--allow-empty", action="store_true")
    a = ap.parse_args()

    OWNER, REPO = a.repo.split("/")
    token = a.token or ""
    if not token and os.path.exists(a.token_file):
        token = open(a.token_file, encoding="utf-8").read().strip()
    if not token:
        raise SystemExit("未提供 token：--token / DSH_GH_TOKEN_FILE / D:\\temp\\gh_token.txt")

    root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    os.chdir(root)

    files = subprocess.run([GIT, "ls-files"], capture_output=True, text=True, check=True).stdout.splitlines()
    files = [f for f in files if os.path.isfile(f)]
    print(f"受版本控制文件: {len(files)}")

    head = api("GET", f"/repos/{a.repo}/git/ref/heads/{a.branch}", token=token)
    base_sha = head["object"]["sha"]
    base_commit = api("GET", f"/repos/{a.repo}/git/commits/{base_sha}", token=token)
    base_message = (base_commit.get("message") or "").splitlines()[:1]
    print(f"远端 {a.branch} 基点: {base_sha[:10]}  {(base_message[0] if base_message else '')[:60]}")

    remote_files: dict[str, str] = {}
    remote_dirs: dict[str, str] = {}
    tree_data = api("GET", f"/repos/{a.repo}/git/trees/{base_commit['tree']['sha']}?recursive=1", token=token)
    if not tree_data.get("truncated"):
        remote_files = {e["path"]: e["sha"] for e in tree_data["tree"] if e["type"] == "blob"}
        remote_dirs = {e["path"]: e["sha"] for e in tree_data["tree"] if e["type"] == "tree"}
    else:
        def walk(sha: str, prefix: str = "") -> None:
            tree = api("GET", f"/repos/{a.repo}/git/trees/{sha}", token=token)
            for e in tree["tree"]:
                if e["type"] == "tree":
                    remote_dirs[prefix + e["path"]] = e["sha"]
                    walk(e["sha"], prefix + e["path"] + "/")
                elif e["type"] == "blob":
                    remote_files[prefix + e["path"]] = e["sha"]

        walk(base_commit["tree"]["sha"])
    print(f"远端文件: {len(remote_files)}")

    local: dict[str, str] = {f: git_blob_sha(f) for f in files}
    changed = [f for f, s in local.items() if remote_files.get(f) != s]
    removed = [f for f in remote_files if f not in local]
    print(f"内容变化: {len(changed)}  远端有而本地受控列表没有: {len(removed)}")
    for f in sorted(changed)[:40]:
        tag = "M" if f in remote_files else "A"
        print(f"  {tag} {f}")
    if len(changed) > 40:
        print(f"  … 共 {len(changed)} 个")
    for f in sorted(removed)[:40]:
        print(f"  D {f}")

    if a.dry_run:
        print("dry-run：未发送任何写请求")
        return
    if not changed and not removed and not a.allow_empty:
        print("没有变化，跳过推送")
        return

    blobs = dict(local)
    to_upload = [f for f in changed if f in local]
    print(f"上传 blob: {len(to_upload)}（其余复用远端）")
    done = 0
    with ThreadPoolExecutor(max_workers=3) as ex:
        for path, sha in ex.map(lambda p: make_blob(p, token), to_upload):
            blobs[path] = sha
            done += 1
            if done % 20 == 0 or done == len(to_upload):
                print(f"  blobs {done}/{len(to_upload)}")

    touched = changed + removed

    def build_tree(prefix: str) -> str:
        # 目录内没有任何增删改 → 直接复用远端子树（省 API 调用，也不制造垃圾 tree 对象）
        if prefix and not any(p.startswith(prefix) for p in touched) and prefix.rstrip("/") in remote_dirs:
            return remote_dirs[prefix.rstrip("/")]
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
        return api("POST", f"/repos/{a.repo}/git/trees", {"tree": entries}, token=token)["sha"]

    tree_sha = build_tree("")
    print(f"tree: {tree_sha[:10]}")

    commit = api("POST", f"/repos/{a.repo}/git/commits", {
        "message": a.message, "tree": tree_sha, "parents": [base_sha],
    }, token=token)
    api("PATCH", f"/repos/{a.repo}/git/refs/heads/{a.branch}",
        {"sha": commit["sha"], "force": True}, token=token)
    print(f"完成: https://github.com/{a.repo}/commit/{commit['sha']}")
    print("Actions 已触发: push -> .github/workflows/ios.yml")


if __name__ == "__main__":
    main()
