"""DeepSeek OpenAI 兼容客户端：调用、重试、用量记录。"""
from __future__ import annotations

import time
import uuid
from datetime import datetime, timezone

import requests

from .config import settings
from .context import log_usage

MAX_RETRIES = 3
BACKOFF = 4  # 秒，逐次翻倍；遇到限流按信号退避


class DeepSeekError(RuntimeError):
    pass


def _extract_content(data: dict) -> str:
    choice = (data.get("choices") or [{}])[0]
    msg = choice.get("msg") or choice.get("message") or {}
    content = msg.get("content")
    if content is None:
        content = choice.get("content", "")
    if isinstance(content, list):  # 分段/多模态形式
        content = "".join(
            c.get("text", "") for c in content if isinstance(c, dict)
        )
    return content or ""


def chat(messages, *, model=None, temperature=None, max_tokens=None,
         purpose: str = "chat") -> tuple:
    """返回 (回复文本, usage 字典)。失败抛 DeepSeekError。"""
    cfg = settings()
    key = cfg["DEEPSEEK_API_KEY"].strip()
    if not key:
        raise DeepSeekError(
            "DEEPSEEK_API_KEY 未配置。请把 .env.example 复制为 .env 并填入 key。"
        )
    base = cfg["DEEPSEEK_BASE_URL"].rstrip("/")
    model = model or cfg["DEEPSEEK_MODEL"]
    payload = {
        "model": model,
        "messages": messages,
        "temperature": float(temperature if temperature is not None else cfg["DEEPSEEK_TEMPERATURE"]),
        "max_tokens": int(max_tokens or cfg["DEEPSEEK_MAX_TOKENS"]),
        "stream": False,
    }
    headers = {"Authorization": f"Bearer {key}", "Content-Type": "application/json"}
    last_err: Exception | None = None
    for attempt in range(MAX_RETRIES):
        try:
            resp = requests.post(
                f"{base}/chat/completions", headers=headers,
                json=payload, timeout=300,
            )
        except requests.RequestException as e:  # 网络层错误，退避重试
            last_err = e
            time.sleep(BACKOFF * (2 ** attempt))
            continue
        if resp.status_code == 429 or resp.status_code >= 500:
            last_err = DeepSeekError(f"HTTP {resp.status_code}: {resp.text[:300]}")
            time.sleep(BACKOFF * (2 ** attempt))
            continue
        if resp.status_code >= 400:
            raise DeepSeekError(f"HTTP {resp.status_code}: {resp.text[:500]}")
        data = resp.json()
        usage = data.get("usage", {}) or {}
        log_usage({
            "ts": datetime.now(timezone.utc).astimezone().isoformat(timespec="seconds"),
            "purpose": purpose,
            "model": model,
            "request_id": data.get("id", str(uuid.uuid4())),
            "prompt_tokens": usage.get("prompt_tokens"),
            "completion_tokens": usage.get("completion_tokens"),
            "reasoning_tokens": (usage.get("completion_tokens_details") or {}).get("reasoning_tokens"),
            "finish_reason": (data.get("choices") or [{}])[0].get("finish_reason"),
        })
        return _extract_content(data), usage

    raise DeepSeekError(f"重试 {MAX_RETRIES} 次仍失败: {last_err}")
