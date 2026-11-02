from __future__ import annotations

import collections
import hashlib
import json
from pathlib import Path

from extract_uiscreen import FormatError, parse_file
from generate_classic_animations import qualified_names


ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "assets_raw/xml/screens/inGameChallengeHud.uiscreen"
OUTPUT = ROOT / "Content/challengeAnimations.json"
VALUE_COUNTS = {
    "_Events_": 0,
    "enabled": 1,
    "movescale": 1,
    "layer": 1,
    "position": 3,
    "scale": 3,
    "rotation": 3,
    "colour": 4,
    "insideColour": 4,
    "outsideColour": 4,
    "texCoordPos": 2,
}
EXPECTED_INTERPOLATIONS = {0: 665, 3: 112, 2: 16, 7: 1, 5: 1}


def crop_values(track_name: str, values: list, offset: int) -> list:
    expected = VALUE_COUNTS.get(track_name)
    if expected is None:
        raise FormatError(f"unsupported production track {track_name!r} at 0x{offset:x}")
    if len(values) < expected:
        raise FormatError(f"short {track_name!r} payload at 0x{offset:x}")
    # UIKF may contain alignment/metadata words after the typed track payload.
    return values[:expected]


def build() -> dict:
    report = parse_file(SOURCE)
    names = qualified_names(report["components"])
    if len(names) != len(set(names)):
        raise FormatError("duplicate qualified component name")
    components = []
    interpolation_counts: collections.Counter[int] = collections.Counter()
    for component, name in zip(report["components"], names):
        animations = []
        for animation in component["animations"]:
            tracks = []
            for track in animation["tracks"]:
                if track["name"] not in VALUE_COUNTS:
                    raise FormatError(
                        f"unhandled track {track['name']!r} in {name}/{animation['name']}"
                    )
                keyframes = []
                for key in sorted(track["keyframes"], key=lambda item: item["time_ms"]):
                    interpolation_counts[key["interpolation"]] += 1
                    keyframes.append({
                        "timeMS": key["time_ms"],
                        "interpolation": key["interpolation"],
                        "values": crop_values(track["name"], key["values"], key["offset"]),
                        "events": key["events"],
                    })
                tracks.append({"name": track["name"], "keyframes": keyframes})
            animations.append({
                "name": animation["name"],
                "endTimeMS": animation["end_time_ms"],
                "tracks": tracks,
            })
        # Keep every source component and animation, including the root and empty ones.
        components.append({"name": name, "animations": animations})

    if len(components) != 142:
        raise FormatError(f"expected 142 components, got {len(components)}")
    animation_count = sum(len(component["animations"]) for component in components)
    if animation_count != 135:
        raise FormatError(f"expected 135 animations, got {animation_count}")
    if dict(interpolation_counts) != EXPECTED_INTERPOLATIONS:
        raise FormatError(f"interpolation census mismatch: {dict(interpolation_counts)}")
    if components[0]["name"] != "":
        raise FormatError("the UISF screen root must have an empty qualified name")
    for required in ("challengeMods", "bonusIntro.intro1"):
        if required not in names:
            raise FormatError(f"missing required relative component {required}")
    if any(name.startswith("inGameChallengeHud.") for name in names):
        raise FormatError("screen root was not removed from a qualified name")
    return {
        "formatVersion": 1,
        "source": {
            "file": SOURCE.name,
            "sha256": hashlib.sha256(SOURCE.read_bytes()).hexdigest(),
        },
        "components": components,
    }


def main() -> None:
    content = build()
    OUTPUT.parent.mkdir(parents=True, exist_ok=True)
    OUTPUT.write_text(json.dumps(content, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    # Round-trip the exact deliverable and independently recheck source identity/counts.
    loaded = json.loads(OUTPUT.read_text(encoding="utf-8"))
    assert loaded == content
    assert loaded["source"]["sha256"] == hashlib.sha256(SOURCE.read_bytes()).hexdigest()
    assert len(loaded["components"]) == 142
    assert sum(len(c["animations"]) for c in loaded["components"]) == 135
    census = collections.Counter(
        key["interpolation"]
        for component in loaded["components"]
        for animation in component["animations"]
        for track in animation["tracks"]
        for key in track["keyframes"]
    )
    assert dict(census) == EXPECTED_INTERPOLATIONS
    print(f"Wrote {OUTPUT}: {len(content['components'])} components, "
          f"{sum(len(c['animations']) for c in content['components'])} animations, "
          f"interpolations {dict(sorted(census.items()))}")


if __name__ == "__main__":
    main()
