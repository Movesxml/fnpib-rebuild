from __future__ import annotations

import hashlib
import json
from pathlib import Path

from PIL import Image


ROOT = Path(__file__).resolve().parents[1]
ATLAS = ROOT / "assets_png/textures/Hud/hud_cross.png"
MANIFEST = ROOT / "assets_png/manifest.json"
OUTPUT = ROOT / "Content"


def main() -> None:
    manifest = json.loads(MANIFEST.read_text(encoding="utf-8"))
    record = next(item for item in manifest["files"] if item["rel"] == "textures/Hud/hud_cross.tex")
    assert record["status"] == "ok" and record["format"] == "RGBA32"
    assert record["format_verified"] is True
    assert (record["width"], record["height"]) == (128, 64)

    # inGameClassic.uiscreen: misscounters.cross*/backing* use texCoordSize=(0.5, 1),
    # with active texCoordPos.x=0 and backing texCoordPos.x=0.5. Do not decode or
    # recolour the source pixels; only perform those two exact release atlas crops.
    with Image.open(ATLAS) as source:
        source = source.convert("RGBA")
        assert source.size == (128, 64)
        crops = {
            "classicHeartActive.png": (0, 0, 64, 64),
            "classicHeartBacking.png": (64, 0, 128, 64),
        }
        for name, rectangle in crops.items():
            target = OUTPUT / name
            source.crop(rectangle).save(target)
            assert hashlib.sha256(target.read_bytes()).digest_size == 32
            print(f"Wrote {target}: 64x64, source sha256={hashlib.sha256(ATLAS.read_bytes()).hexdigest()}")


if __name__ == "__main__":
    main()
