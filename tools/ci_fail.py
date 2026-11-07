# -*- coding: utf-8 -*-
"""下载某次 Actions 运行的失败日志并抽取失败行。

用法:
    python tools/ci_fail.py --repo Movesxml/fnpib-rebuild --run 42402167490
    python tools/ci_fail.py --repo ... --run ... --grep "Test Case"
"""
from __future__ import annotations

import argparse
import json
import os
import re
import sys
import urllib.error
import urllib.request

API = "https://api.github.com"


class NoRedirect(urllib.request.HTTPRedirectHandler):
    def redirect_request(self, *a, **k):
        return None


def api(path: str, token: str) -> dict:
    req = urllib.request.Request(API + path, headers={
        "Authorization": "Bearer " + token,
        "Accept": "application/vnd.github+json",
        "User-Agent": "dsh-agent"})
    with urllib.request.urlopen(req, timeout=90) as r:
        return json.loads(r.read())


def fetch_log(job_id: int, token: str) -> str:
    url = f"{API}/repos/{{repo}}/actions/jobs/{job_id}/logs"
    return url


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--repo", required=True)
    ap.add_argument("--run", required=True, type=int)
    ap.add_argument("--grep", default="error:|failed|XCTAssert|Error")
    ap.add_argument("--token-file", default=os.environ.get(
        "DSH_GH_TOKEN_FILE", r"D:\temp\gh_token.txt"))
    ap.add_argument("--out", default=r"D:\temp\ci_fail.log")
    a = ap.parse_args()

    token = ""
    if os.path.exists(a.token_file):
        token = open(a.token_file, encoding="utf-8").read().strip()

    jobs = api(f"/repos/{a.repo}/actions/runs/{a.run}/jobs", token)["jobs"]
    failed = [j for j in jobs if j.get("conclusion") == "failure"]
    if not failed:
        print("没有失败的 job；conclusions:",
              {j["name"]: j.get("conclusion") for j in jobs})
        return

    pattern = re.compile(a.grep)
    for job in failed:
        print(f"== job {job['name']} ({job['conclusion']}) ==")
        url = f"{API}/repos/{a.repo}/actions/jobs/{job['id']}/logs"
        req = urllib.request.Request(url, headers={
            "Authorization": "Bearer " + token, "User-Agent": "dsh-agent"})
        opener = urllib.request.build_opener(NoRedirect)
        try:
            resp = opener.open(req, timeout=120)
            data = resp.read()
        except urllib.error.HTTPError as e:
            if e.code in (301, 302, 303, 307, 308):
                with urllib.request.urlopen(e.headers["Location"], timeout=180) as r2:
                    data = r2.read()
            else:
                raise
        text = data.decode("utf-8", "replace")
        open(a.out, "w", encoding="utf-8").write(text)
        print(f"日志已保存: {a.out} ({len(text)} 字符)")
        hits = [l for l in text.splitlines() if pattern.search(l)]
        print(f"命中 {len(hits)} 行：")
        for line in hits[:60]:
            print("  " + line[:240])


if __name__ == "__main__":
    main()
