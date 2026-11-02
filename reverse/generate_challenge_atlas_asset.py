from pathlib import Path
import sys

from PIL import Image

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools/AssetPipeline/vendor"))
import texture2ddecoder  # noqa: E402

source = ROOT / "assets_raw/textures/adventureProgress/challengeAtlas.tex"
data = source.read_bytes()
assert len(data) == 12 + 1024 * 1024 // 2
assert data[:12] == bytes.fromhex("0a 0a 0c 00 00 04 00 04 ff ff ff ff")
rgba = texture2ddecoder.decode_pvrtc(data[12:], 1024, 1024, True)
assert len(rgba) == 1024 * 1024 * 4
# 12-byte legacy header, format_id=12, 1024x1024, 4 bpp PVRTC payload.
# Decoding produces the release question/fruit/star atlas; the old INDEX4 preview
# was compressed bytes visualised as greyscale and must not be shipped.
output = ROOT / "Content/challengeAtlas.png"
Image.frombytes("RGBA", (1024, 1024), rgba).save(output)
print(output)
