from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[1]
TARGETS = {
    "exe": ROOT / "reverse" / "FruitNinjaPIB.exe",
    "macho": ROOT / "ipa" / "extracted" / "FruitNinjaPiB-v1.0412" / "Payload" / "FruitNinjaPuss.app" / "FruitNinjaPuss",
}
KEYWORDS = ("miss", "life", "lives", "gameover", "game-over", "game_over", "classic")
for label, path in TARGETS.items():
    data = path.read_bytes()
    strings = [m.group().decode("ascii") for m in re.finditer(rb"[ -~]{4,160}", data)]
    hits = sorted({s for s in strings if any(k in s.lower() for k in KEYWORDS)})
    out = ROOT / "shared_context" / "findings" / f"mode_related_strings_{label}.txt"
    out.write_text("\n".join(hits) + "\n", encoding="utf-8")
    print(label, len(hits), out)
