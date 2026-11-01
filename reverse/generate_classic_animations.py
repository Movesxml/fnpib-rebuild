from __future__ import annotations

import hashlib
import json
from pathlib import Path

from extract_uiscreen import FormatError, parse_file


ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "assets_raw/xml/screens/inGameClassic.uiscreen"
OUTPUT = ROOT / "Content/classicAnimations.json"
SELECTED = {
    "gameOverContainer": {"game_over", "game_over_real"},
    "misscounters.cross1": {"in", "out"},
    "misscounters.cross2": {"in", "out"},
    "misscounters.cross3": {"in", "out"},
    "popups.beanExtraLife": {"trigger"},
    "popups.beanPlus25": {"trigger"},
}


def qualified_names(components: list[dict]) -> list[str]:
    names = []
    for index, component in enumerate(components):
        parts = [component["name"]]
        parent = component["parent_index"]
        while parent >= 0:
            parts.append(components[parent]["name"])
            parent = components[parent]["parent_index"]
        # Mach-O queries are relative to the screen root, e.g. misscounters.cross1.
        names.append(".".join(reversed(parts[:-1])))
    return names


def crop_values(track_name: str, values: list, offset: int) -> list:
    expected = {"scale": 3, "position": 3, "movescale": 1, "enabled": 1, "colour": 4}.get(track_name)
    if expected is None:
        raise FormatError(f"unsupported production track {track_name!r} at 0x{offset:x}")
    if len(values) < expected:
        raise FormatError(f"short {track_name!r} payload at 0x{offset:x}")
    # UIKF can append alignment words and engine metadata (including integer bit 1,
    # which is not a float colour/scale). Only the typed track payload is interpolated.
    return values[:expected]


def build() -> dict:
    report = parse_file(SOURCE)
    names = qualified_names(report["components"])
    components = []
    for component, name in zip(report["components"], names):
        wanted = SELECTED.get(name)
        if wanted is None:
            continue
        animations = []
        for animation in component["animations"]:
            if animation["name"] not in wanted:
                continue
            tracks = []
            for track in animation["tracks"]:
                if track["name"] not in {"scale", "position", "movescale", "enabled", "colour", "_Events_"}:
                    raise FormatError(f"unhandled track {track['name']!r} in {name}/{animation['name']}")
                keyframes = []
                for key in sorted(track["keyframes"], key=lambda item: item["time_ms"]):
                    keyframes.append({
                        "timeMS": key["time_ms"],
                        "interpolation": key["interpolation"],
                        "values": crop_values(track["name"], key["values"], key["offset"])
                        if track["name"] != "_Events_" else [],
                        "events": key["events"],
                    })
                tracks.append({"name": track["name"], "keyframes": keyframes})
            animations.append({
                "name": animation["name"],
                "endTimeMS": animation["end_time_ms"],
                "tracks": tracks,
            })
        if {animation["name"] for animation in animations} != wanted:
            raise FormatError(f"animation set mismatch for {name}")
        components.append({"name": name, "animations": animations})
    if {component["name"] for component in components} != set(SELECTED):
        raise FormatError("selected component set mismatch")
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
    # Round-trip the exact deliverable and recheck its complete source hash.
    loaded = json.loads(OUTPUT.read_text(encoding="utf-8"))
    assert loaded == content
    assert loaded["source"]["sha256"] == hashlib.sha256(SOURCE.read_bytes()).hexdigest()
    print(f"Wrote {OUTPUT}: {len(content['components'])} components, "
          f"{sum(len(c['animations']) for c in content['components'])} animations")


if __name__ == "__main__":
    main()
