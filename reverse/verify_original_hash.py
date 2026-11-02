"""Independent lookup2 transcription of FUN_002f69c4 for Swift vector review."""
from pathlib import Path
import json

MASK = 0xFFFFFFFF
GOLDEN = 0x9E3779B9


def s8(value):
    return value - 0x100 if value & 0x80 else value


def word(data: bytes, offset: int) -> int:
    """ARM reads bytes 0–2 signed and byte 3 unsigned."""
    return sum(
        (data[offset + index] if index == 3 else s8(data[offset + index])) << (8 * index)
        for index in range(4)
    ) & MASK


def original_hash(raw: bytes) -> int:
    if not raw or raw[0] == 0:
        return 0
    data = bytes(byte + 0x20 if 0x41 <= byte <= 0x5A else byte for byte in raw)
    a = GOLDEN
    b = GOLDEN
    c = 0x805
    length = len(data)
    offset = 0
    while length - offset >= 12:
        a = (a + word(data, offset)) & MASK
        b = (b + word(data, offset + 4)) & MASK
        c = (c + word(data, offset + 8)) & MASK
        a, b, c = mix(a, b, c)
        offset += 12
    c = (c + length) & MASK
    tail = data[offset:]
    # Exact signed/unsigned byte accesses in the ARM tail switch.
    for index, shift in ((10, 24), (9, 16), (8, 8)):
        if len(tail) > index:
            value = tail[index] if shift == 24 else s8(tail[index])
            c = (c + (value << shift)) & MASK
    for index, shift in ((7, 24), (6, 16), (5, 8), (4, 0)):
        if len(tail) > index:
            value = tail[index] if shift == 24 else s8(tail[index])
            b = (b + (value << shift)) & MASK
    for index, shift in ((3, 24), (2, 16), (1, 8), (0, 0)):
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
    for name in ("", "apple", "APPLE", "Apple", "FastFruit1", "bombPairs1", "LEFT_RIGHT",
                 "é", "aé", "éa", "ééa", "aéé", "你好", "ééééééé"):
        vectors[name] = name.encode("utf-8")
    result = {name: {"utf8": raw.hex(), "hash": f"0x{original_hash(raw):08x}"}
              for name, raw in vectors.items()}
    out = Path("shared_context/findings/string_hash_reference_vectors.json")
    out.write_text(json.dumps(result, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(result, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
