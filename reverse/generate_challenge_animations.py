from __future__ import annotations

import collections
import hashlib
import json
from pathlib import Path

from extract_uiscreen import FormatError, parse_file
from generate_classic_animations import qualified_names


ROOT = Path(__file__).resolve().parents[1]
SCREEN_ROOT = ROOT / "assets_raw/xml/screens"
CONTENT_ROOT = ROOT / "Content"
VALUE_COUNTS = {
    "_Events_": 0,
    "comment": 0,
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

# Counts are a regression lock for the exact release resources, not a filter.
# Every component, animation, keyframe and event must survive conversion.
SPECS = {
    "Background": (
        "backgroundAnimations.json", 5, 10, {0: 10}),
    "inGameChallengeHud": (
        "challengeAnimations.json", 142, 135, {0: 665, 3: 112, 2: 16, 7: 1, 5: 1}),
    "inGameChallengeBackground": (
        "challengeBackgroundAnimations.json", 13, 17, {0: 54, 2: 2, 1: 15}),
    "inGameChallengeScoreScreen": (
        "challengeScoreAnimations.json", 48, 34, {0: 88, 3: 5}),
    "inGameChallengeScoreScreenComplete": (
        "challengeScoreCompleteAnimations.json", 29, 27, {0: 60, 2: 9, 3: 22}),
    "inGameChallengeScoreScreenCompleteFailure": (
        "challengeScoreCompleteFailureAnimations.json", 18, 4, {0: 14, 2: 5}),
    "inGameChallengeInstructionsScreen": (
        "challengeInstructionsAnimations.json", 21, 10, {0: 19, 2: 5}),
    "inGameChallengeMapScreen": (
        "challengeMapAnimations.json", 95, 86, {0: 223, 1: 6, 2: 1}),
}


def crop_values(track_name: str, values: list, offset: int) -> list:
    expected = VALUE_COUNTS.get(track_name)
    if expected is None:
        raise FormatError(f"unsupported production track {track_name!r} at 0x{offset:x}")
    if track_name == "comment":
        if len(values) != 1 or not isinstance(values[0], str):
            raise FormatError(f"invalid comment payload at 0x{offset:x}")
        return []
    if any(not isinstance(value, (float, int)) or isinstance(value, bool) for value in values):
        raise FormatError(f"non-numeric {track_name!r} payload at 0x{offset:x}")
    if len(values) < expected:
        raise FormatError(f"short {track_name!r} payload at 0x{offset:x}")
    # UIKF may contain alignment/metadata words after the typed track payload.
    return values[:expected]


def build(stem: str) -> tuple[dict, dict]:
    output_name, expected_components, expected_animations, expected_interpolations = SPECS[stem]
    source = SCREEN_ROOT / f"{stem}.uiscreen"
    report = parse_file(source)
    names = qualified_names(report["components"])
    if len(names) != len(set(names)):
        raise FormatError("duplicate qualified component name")
    components = []
    interpolation_counts: collections.Counter[int] = collections.Counter()
    comment_count = 0
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
                    keyframe = {
                        "timeMS": key["time_ms"],
                        "interpolation": key["interpolation"],
                        "values": crop_values(track["name"], key["values"], key["offset"]),
                        "events": key["events"],
                    }
                    if track["name"] == "comment":
                        keyframe["comment"] = key["values"][0]
                        comment_count += 1
                    keyframes.append(keyframe)
                tracks.append({"name": track["name"], "keyframes": keyframes})
            animations.append({
                "name": animation["name"],
                "endTimeMS": animation["end_time_ms"],
                "tracks": tracks,
            })
        # Keep every source component and animation, including the root and empty ones.
        components.append({"name": name, "animations": animations})

    animation_count = sum(len(component["animations"]) for component in components)
    if len(components) != expected_components:
        raise FormatError(f"{stem}: expected {expected_components} components, got {len(components)}")
    if animation_count != expected_animations:
        raise FormatError(f"{stem}: expected {expected_animations} animations, got {animation_count}")
    if dict(interpolation_counts) != expected_interpolations:
        raise FormatError(f"{stem}: interpolation census mismatch: {dict(interpolation_counts)}")
    if components[0]["name"] != "":
        raise FormatError(f"{stem}: the UISF screen root must have an empty qualified name")
    if any(name.startswith(f"{stem}.") for name in names):
        raise FormatError(f"{stem}: screen root was not removed from a qualified name")
    content = {
        "formatVersion": 1,
        "source": {
            "file": source.name,
            "sha256": hashlib.sha256(source.read_bytes()).hexdigest(),
        },
        "components": components,
    }
    summary = {
        "output": output_name,
        "components": len(components),
        "animations": animation_count,
        "comments": comment_count,
        # JSON object keys are strings; keep the in-memory manifest identical to its round-trip.
        "interpolations": {str(key): value for key, value in sorted(interpolation_counts.items())},
    }
    return content, summary


def main() -> None:
    manifest = {"formatVersion": 1, "screens": {}}
    for stem in SPECS:
        content, summary = build(stem)
        output = CONTENT_ROOT / summary["output"]
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_text(json.dumps(content, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        # Round-trip the exact deliverable and independently recheck identity/counts.
        loaded = json.loads(output.read_text(encoding="utf-8"))
        assert loaded == content
        assert loaded["source"]["sha256"] == hashlib.sha256(
            (SCREEN_ROOT / loaded["source"]["file"]).read_bytes()).hexdigest()
        assert len(loaded["components"]) == summary["components"]
        assert sum(len(c["animations"]) for c in loaded["components"]) == summary["animations"]
        census = collections.Counter(
            key["interpolation"]
            for component in loaded["components"]
            for animation in component["animations"]
            for track in animation["tracks"]
            for key in track["keyframes"]
        )
        assert {str(key): value for key, value in sorted(census.items())} == summary["interpolations"]
        manifest["screens"][stem] = {**summary, "source": content["source"]}
        print(f"Wrote {output.name}: {summary}")

    manifest_path = CONTENT_ROOT / "challengeAnimationManifest.json"
    manifest_path.write_text(
        json.dumps(manifest, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    assert json.loads(manifest_path.read_text(encoding="utf-8")) == manifest
    print(f"Wrote {manifest_path.name}: {len(manifest['screens'])} exact release screens")


if __name__ == "__main__":
    main()
