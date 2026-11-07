# -*- coding: utf-8 -*-
"""对比本地受版本控制文件与 GitHub 远端 main 的内容差异（按 git blob sha）。

用途：API 推送后在本地确认「远端确实等于我这次推的东西」。

用法:
    python tools/verify_remote.py --repo Movesxml/fnpib-rebuild
    python tools/verify_remote.py --repo ... --local-only   # 临时不需要网络
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import subprocess
import sys
import urllib.request

GIT_CANDIDATES = [r"D:\tools\git\cmd\git.exe", "git"]


def git_bin() -> str:
    for candidate in GIT_CANDIDATES:
        try:
            subprocess.run([candidate, "--version"], capture_output=True, check=True)
            return candidate
        except (OSError, subprocess.CalledProcessError):
            continue
    raise SystemExit("找不到 git")


def blob_sha(path: str) -> str:
    data = open(path, "rb").read()
    return hashlib.sha1(b"blob %d\0" % len(data) + data).hexdigest()


def api(path: str, token: str = "") -> dict:
    headers = {"Accept": "application/vnd.github+json", "User-Agent": "dsh-agent"}
    if token:
        headers["Authorization"] = "Bearer " + token
    req = urllib.request.Request("https://api.github.com" + path, headers=headers)
    try:
        with urllib.request.urlopen(req, timeout=120) as r:
            return json.loads(r.read())
    except urllib.error.HTTPError as e:
        if e.code == 401 and token:
            # 凭据失效时退回匿名读（公开仓库只读接口够用，速率有限）
            headers.pop("Authorization", None)
            req = urllib.request.Request("https://api.github.com" + path, headers=headers)
            with urllib.request.urlopen(req, timeout=120) as r:
                return json.loads(r.read())
        raise SystemExit(f"HTTP {e.code} GET {path}: {e.read().decode(errors='replace')[:300]}")


def flatten_tree(repo: str, tree_sha: str, token: str = "") -> dict:
    """一次 recursive 请求取整棵树；被截断时退回逐层遍历。"""
    try:
        data = api(f"/repos/{repo}/git/trees/{tree_sha}?recursive=1", token)
        if not data.get("truncated"):
            return {e["path"]: e["sha"] for e in data["tree"] if e["type"] == "blob"}
    except SystemExit:
        raise
    remote: dict[str, str] = {}

    def walk(sha: str, prefix: str = "") -> None:
        tree = api(f"/repos/{repo}/git/trees/{sha}", token)
        for e in tree["tree"]:
            if e["type"] == "tree":
                walk(e["sha"], prefix + e["path"] + "/")
            elif e["type"] == "blob":
                remote[prefix + e["path"]] = e["sha"]

    walk(tree_sha)
    return remote


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--repo", required=True)
    ap.add_argument("--branch", default="main")
    ap.add_argument("--token-file", default=os.environ.get("DSH_GH_TOKEN_FILE", r"D:\temp\gh_token.txt"))
    a = ap.parse_args()

    token = ""
    if os.path.exists(a.token_file):
        token = open(a.token_file, encoding="utf-8").read().strip()

    root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    os.chdir(root)

    files = subprocess.run([git_bin(), "ls-files"], capture_output=True, text=True, check=True).stdout.splitlines()
    files = [f for f in files if os.path.isfile(f)]
    local = {f: blob_sha(f) for f in files}

    head = api(f"/repos/{a.repo}/git/ref/heads/{a.branch}", token)
    commit = api(f"/repos/{a.repo}/git/commits/{head['object']['sha']}", token)
    remote = flatten_tree(a.repo, commit["tree"]["sha"], token)

    missing = sorted(set(remote) - set(local))
    added = sorted(set(local) - set(remote))
    diffs = sorted(f for f in set(local) & set(remote) if local[f] != remote[f])

    head_message = (commit.get("message") or "").splitlines()[:1]
    print(f"远端 head: {head['object']['sha'][:10]}  {(head_message[0] if head_message else '')[:70]}")
    print(f"本地受控: {len(local)}  远端: {len(remote)}")
    print(f"内容不一致: {len(diffs)}  仅远端有: {len(missing)}  仅本地有: {len(added)}")
    for f in diffs[:30]:
        print("  M", f)
    for f in missing[:30]:
        print("  -", f)
    for f in added[:30]:
        print("  +", f)
    if not diffs and not missing and not added:
        print("OK: 本地与远端一致")
        return
    sys.exit(1)


if __name__ == "__main__":
    main()
