from __future__ import annotations

import collections
import hashlib
import json
import math
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

LAYOUT_KEYS = (
    "texture", "text", "position", "scale", "origin", "rotation", "width", "height",
    "colour", "enabled", "inputEnabled", "originFromCenter", "texCoordPos", "texCoordSize",
    "layer", "fontName", "fontSize", "alignment", "drawNinePatch", "allowStretchX",
    "allowStretchY", "maintainViewportWidth", "maintainViewportHeight",
)
LAYOUT_VECTOR_SIZES = {
    "position": 3, "scale": 3, "origin": 3, "rotation": 3,
    "texCoordPos": 2, "texCoordSize": 2, "colour": 4,
}
LAYOUT_NONNEGATIVE_NUMBERS = {"width", "height", "fontSize"}
LAYOUT_STRING_KEYS = {"texture", "text", "fontName", "alignment"}
LAYOUT_BOOL_KEYS = {
    "enabled", "inputEnabled", "originFromCenter", "drawNinePatch", "allowStretchX",
    "allowStretchY", "maintainViewportWidth", "maintainViewportHeight",
}


def is_finite_number(value: object) -> bool:
    return isinstance(value, (int, float)) and not isinstance(value, bool) and math.isfinite(value)


def validate_layout(component_name: str, stem: str, component: dict) -> dict:
    properties = component.get("properties")
    if not isinstance(properties, dict):
        raise FormatError(f"{stem}/{component_name}: missing UIAM properties object")
    layout = {}
    for key in LAYOUT_KEYS:
        if key not in properties:
            continue
        value = properties[key]
        layout[key] = value
        if key in LAYOUT_VECTOR_SIZES:
            expected = LAYOUT_VECTOR_SIZES[key]
            if not isinstance(value, list) or len(value) != expected:
                raise FormatError(f"{stem}/{component_name}: {key} must have {expected} values")
            if any(not is_finite_number(item) for item in value):
                raise FormatError(f"{stem}/{component_name}: {key} contains a non-finite value")
        elif key in LAYOUT_NONNEGATIVE_NUMBERS:
            if not is_finite_number(value) or value < 0:
                raise FormatError(f"{stem}/{component_name}: invalid non-negative {key}")
        elif key in LAYOUT_STRING_KEYS:
            if not isinstance(value, str):
                raise FormatError(f"{stem}/{component_name}: {key} must be a string")
        elif key in LAYOUT_BOOL_KEYS:
            if not isinstance(value, bool):
                raise FormatError(f"{stem}/{component_name}: {key} must be a boolean")
        elif key == "layer":
            if not isinstance(value, int) or isinstance(value, bool):
                raise FormatError(f"{stem}/{component_name}: layer must be an integer")
        else:
            raise AssertionError(f"unhandled layout key {key!r}")
    return layout


def validate_parent_indices(components: list[dict], stem: str) -> None:
    count = len(components)
    for index, component in enumerate(components):
        parent_index = component["parentIndex"]
        if not isinstance(parent_index, int) or isinstance(parent_index, bool):
            raise FormatError(f"{stem}: parentIndex at {index} is not an integer")
        if parent_index < -1 or parent_index >= count or parent_index == index:
            raise FormatError(f"{stem}: invalid parentIndex {parent_index} at {index}")
        if index == 0 and parent_index != -1:
            raise FormatError(f"{stem}: root parentIndex must be -1")


def validate_map_icon_slot1(components: list[dict], stem: str) -> None:
    if stem != "inGameChallengeMapScreen":
        return
    matches = [c for c in components if c["name"].endswith(".iconSlot1")]
    if len(matches) != 1:
        raise FormatError(f"{stem}: expected exactly one iconSlot1, got {len(matches)}")
    layout = matches[0]["layout"]
    expected = {
        "texture": "textures/adventureprogress/iconSlot.tex",
        "position": [126.0, 42.5, 0.0], "origin": [83.5, 0.0, 0.0],
        "scale": [1.0, 1.0, 1.0], "width": 83.0, "height": 83.0,
    }
    for key, value in expected.items():
        if layout.get(key) != value:
            raise FormatError(f"{stem}/iconSlot1: {key} {layout.get(key)!r} != {value!r}")

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
        # Static values remain local to this component; no transform is inferred here.
        components.append({
            "name": name,
            "animations": animations,
            "parentIndex": component["parent_index"],
            "layout": validate_layout(name, stem, component),
        })

    validate_parent_indices(components, stem)
    validate_map_icon_slot1(components, stem)
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
