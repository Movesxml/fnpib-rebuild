"""配置加载：读取 .env 与环境变量（环境变量优先）。"""
from __future__ import annotations

import os
from pathlib import Path

WORKSPACE = Path(__file__).resolve().parent.parent
SHARED = WORKSPACE / "shared_context"
FINDINGS = SHARED / "findings"
MEMORY = SHARED / "memory"
PROGRESS = SHARED / "progress"
ENV_PATH = WORKSPACE / ".env"

DEFAULTS = {
    "DEEPSEEK_API_KEY": "",
    "DEEPSEEK_BASE_URL": "https://api.deepseek.com",
    "DEEPSEEK_MODEL": "deepseek-flash",
    "DEEPSEEK_TEMPERATURE": "0.2",
    "DEEPSEEK_MAX_TOKENS": "16384",
}


def load_dotenv() -> dict:
    cfg = dict(DEFAULTS)
    if ENV_PATH.exists():
        for line in ENV_PATH.read_text(encoding="utf-8").splitlines():
            line = line.strip()
            if not line or line.startswith("#") or "=" not in line:
                continue
            k, _, v = line.partition("=")
            cfg[k.strip()] = v.strip().strip('"').strip("'")
    for k in cfg:  # 环境变量优先于 .env 文件
        if os.environ.get(k):
            cfg[k] = os.environ[k]
    return cfg


def settings() -> dict:
    return load_dotenv()
