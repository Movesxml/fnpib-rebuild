"""Independent lookup2 transcription of FUN_002f69c4 for Swift vector review."""
from pathlib import Path
import json

MASK = 0xFFFFFFFF
GOLDEN = 0x9E3779B9


def s8(value):
    return value - 0x100 if value & 0x80 else value


def original_hash(raw: bytes) -> int:
    if not raw:
        return 0
    data = bytes(byte + 0x20 if 0x41 <= byte <= 0x5A else byte for byte in raw)
    a = GOLDEN
    b = GOLDEN
    c = 0x805
    length = len(data)
    offset = 0
    while length - offset >= 12:
        a = (a + int.from_bytes(data[offset:offset + 4], "little")) & MASK
        b = (b + int.from_bytes(data[offset + 4:offset + 8], "little")) & MASK
        c = (c + int.from_bytes(data[offset + 8:offset + 12], "little")) & MASK
        a, b, c = mix(a, b, c)
        offset += 12
    c = (c + length) & MASK
    tail = data[offset:]
    # Exact signed/unsigned byte accesses in the ARM tail switch.
    for index, shift in ((10, 24), (9, 16), (8, 8)):
        if len(tail) > index:
            value = tail[index] if shift == 24 else s8(tail[index])
            c = (c + (value << shift)) & MASK
    for index, shift in ((6, 24), (5, 16), (4, 8)):
        if len(tail) > index:
            value = tail[index] if shift == 24 else s8(tail[index])
            b = (b + (value << shift)) & MASK
    for index, shift in ((2, 24), (1, 16), (0, 0)):
        if len(tail) > index:
            value = tail[index] if shift == 24 else s8(tail[index])
            a = (a + (value << shift)) & MASK
    return mix(a, b, c)[2]


def mix(a, b, c):
    a = (a - b - c) & MASK; a ^= c >> 13
    b = (b - c - a) & MASK; b ^= (a << 8) & MASK
    c = (c - a - b) & MASK; c ^= b >> 13
    a = (a - b - c) & MASK; a ^= c >> 12
    b = (b - c - a) & MASK; b ^= (a << 16) & MASK
    c = (c - a - b) & MASK; c ^= b >> 5
    a = (a - b - c) & MASK; a ^= c >> 3
    b = (b - c - a) & MASK; b ^= (a << 10) & MASK
    c = (c - a - b) & MASK; c ^= b >> 15
    return a & MASK, b & MASK, c & MASK


def main():
    vectors = {}
    for length in range(14):
        vectors[f"len{length}"] = bytes(range(0x41, 0x41 + length))
    for name in ("", "apple", "APPLE", "FastFruit1", "bombPairs1", "LEFT_RIGHT", "é", "你好"):
        vectors[name] = name.encode("utf-8")
    result = {name: {"utf8": raw.hex(), "hash": f"0x{original_hash(raw):08x}"}
              for name, raw in vectors.items()}
    out = Path("shared_context/findings/string_hash_reference_vectors.json")
    out.write_text(json.dumps(result, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(result, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
