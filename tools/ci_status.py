# -*- coding: utf-8 -*-
"""查询 GitHub Actions 最近若干次运行；可等待指定 commit 的那一次跑完。

用法:
    python tools/ci_status.py --repo Movesxml/fnpib-rebuild -n 5
    python tools/ci_status.py --repo Movesxml/fnpib-rebuild --wait <commit_sha>
"""
from __future__ import annotations

import argparse
import json
import os
import sys
import time
import urllib.error
import urllib.request

API = "https://api.github.com"


def api(path: str, token: str = "") -> dict:
    headers = {"Accept": "application/vnd.github+json", "User-Agent": "dsh-agent"}
    if token:
        headers["Authorization"] = "Bearer " + token
    req = urllib.request.Request(API + path, headers=headers)
    try:
        with urllib.request.urlopen(req, timeout=90) as r:
            return json.loads(r.read())
    except urllib.error.HTTPError as e:
        if e.code == 401 and token:
            headers.pop("Authorization", None)
            req = urllib.request.Request(API + path, headers=headers)
            with urllib.request.urlopen(req, timeout=90) as r:
                return json.loads(r.read())
        body = e.read().decode(errors="replace")[:300]
        raise SystemExit(f"HTTP {e.code}: {body}")


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--repo", required=True)
    ap.add_argument("-n", type=int, default=5)
    ap.add_argument("--wait", help="commit sha：等到该次运行结束")
    ap.add_argument("--timeout", type=int, default=2400)
    ap.add_argument("--token-file", default=os.environ.get("DSH_GH_TOKEN_FILE", r"D:\temp\gh_token.txt"))
    a = ap.parse_args()

    token = ""
    if os.path.exists(a.token_file):
        token = open(a.token_file, encoding="utf-8").read().strip()

    if a.wait:
        deadline = time.time() + a.timeout
        while True:
            runs = api(f"/repos/{a.repo}/actions/runs?per_page=30", token)["workflow_runs"]
            run = next((r for r in runs if r["head_sha"].startswith(a.wait)), None)
            if run and run["status"] == "completed":
                print(json.dumps({
                    "id": run["id"], "conclusion": run["conclusion"],
                    "sha": run["head_sha"][:10], "url": run["html_url"],
                }, indent=1))
                sys.exit(0 if run["conclusion"] == "success" else 1)
            if time.time() > deadline:
                print("等待超时；最近的运行:", file=sys.stderr)
                break
            print(f"  … {(run['status'] if run else 'queued')}", flush=True)
            time.sleep(20)

    for run in api(f"/repos/{a.repo}/actions/runs?per_page={a.n}", token)["workflow_runs"]:
        print(f"{run['id']}  {run['status']}/{run['conclusion']}  {run['head_sha'][:8]}  {run['created_at']}")


if __name__ == "__main__":
    main()
