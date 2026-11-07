from __future__ import annotations

import argparse
from pathlib import Path

CHUNKS = (b"UISF", b"UISB", b"UICH", b"UIAM", b"UIAB", b"UIME", b"USAM", b"UISA", b"UIAT", b"UIKF", b"UIEF", b"EVTH")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("path", type=Path)
    parser.add_argument("--around", type=str)
    args = parser.parse_args()
    data = args.path.read_bytes()
    for chunk in CHUNKS:
        positions = []
        start = 0
        while (pos := data.find(chunk, start)) >= 0:
            positions.append(pos)
            start = pos + 1
        print(chunk.decode(), len(positions), positions[:80])
    if args.around:
        pos = data.find(args.around.encode())
        print(f"around {args.around!r}: {pos}")
        start = max(0, pos - 64)
        end = min(len(data), pos + 512)
        for offset in range(start, end, 16):
            row = data[offset:offset + 16]
            text = "".join(chr(value) if 32 <= value < 127 else "." for value in row)
            print(f"{offset:08x}: {row.hex(' '):<47} {text}")


if __name__ == "__main__":
    main()
