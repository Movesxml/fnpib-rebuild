from __future__ import annotations

import argparse
import json
import struct
from dataclasses import asdict, dataclass
from pathlib import Path
from typing import Any


class FormatError(ValueError):
    pass


@dataclass(frozen=True)
class Keyframe:
    offset: int
    time_ms: int
    interpolation: int
    values: list[float | int | str]
    events: list[dict[str, Any]]


@dataclass(frozen=True)
class Track:
    name: str
    kind: int
    keyframes: list[Keyframe]


@dataclass(frozen=True)
class Animation:
    name: str
    flags: int
    tracks: list[Track]

    @property
    def end_time_ms(self) -> int:
        return max((key.time_ms for track in self.tracks for key in track.keyframes), default=0)


class Reader:
    def __init__(self, data: bytes):
        self.data = data

    def require(self, offset: int, token: bytes) -> None:
        if self.data[offset:offset + len(token)] != token:
            raise FormatError(f"expected {token!r} at 0x{offset:x}")

    def u32(self, offset: int) -> int:
        if offset < 0 or offset + 4 > len(self.data):
            raise FormatError(f"u32 outside file at 0x{offset:x}")
        return struct.unpack_from(">I", self.data, offset)[0]

    def i32(self, offset: int) -> int:
        return struct.unpack(">i", struct.pack(">I", self.u32(offset)))[0]

    def f32(self, offset: int) -> float:
        if offset < 0 or offset + 4 > len(self.data):
            raise FormatError(f"f32 outside file at 0x{offset:x}")
        return struct.unpack_from(">f", self.data, offset)[0]

    def string(self, offset: int) -> tuple[str, int]:
        # UISF stores the NUL terminator inside the big-endian length.
        length = self.u32(offset)
        if length > 4096:
            raise FormatError(f"unreasonable string length {length} at 0x{offset:x}")
        if length == 0:
            return "", offset + 4
        start = offset + 4
        end = start + length - 1
        if end >= len(self.data) or self.data[end] != 0:
            raise FormatError(f"unterminated string at 0x{offset:x}")
        try:
            value = self.data[start:end].decode("utf-8")
        except UnicodeDecodeError as exc:
            raise FormatError(f"invalid UTF-8 at 0x{start:x}") from exc
        return value, end + 1

    def positions(self, token: bytes, start: int = 0, end: int | None = None) -> list[int]:
        end = len(self.data) if end is None else end
        result = []
        cursor = start
        while True:
            found = self.data.find(token, cursor, end)
            if found < 0:
                return result
            result.append(found)
            cursor = found + 1


PROP_GROUP_HEADER = b"\x00\x07\xaa\xa1"
PROP_GROUP_COUNT = b"\x00\x07\xbb\xb1"
PROP_GROUP_END = b"\x00\x07\xff\xf1"
PROP_RECORD_HEADER = b"\x00\x07\xde\xe1"
PROP_RECORD_HEADER_2 = b"\xff\xff\xff\xff"

PROPERTY_CATEGORIES: dict[str, str] = {}


def _register_properties(category: str, names: tuple[str, ...]) -> None:
    for name in names:
        if name in PROPERTY_CATEGORIES:
            raise RuntimeError(f"duplicate static property mapping: {name!r}")
        PROPERTY_CATEGORIES[name] = category


_register_properties("string", (
    "KeyName", "alignment", "comment", "description", "fontName", "fruitType", "fruittype",
    "headingFont", "leaderboardType", "model", "orientation", "paintTexture", "text",
    "texture", "textureDisabled", "textureEnabled",
))
_register_properties("bool", (
    "allowStretchX", "allowStretchY", "autoScrollEnabled", "childrenCodeGenerated",
    "clipsChildren", "confineToHeight", "descriptionConfineToHeight", "drawNinePatch",
    "drawninepatch", "enabled", "headingConfineToHeight", "inputEnabled", "localiseText",
    "maintainViewportHeight", "maintainViewportWidth", "originFromCenter", "recreateFruit",
    "respondsToBackButton", "useGradient",
))
_register_properties("u32", (
    "descriptionLines", "dropShadowStyle", "enteriesStepSize", "headingMaxLines", "layer",
    "maxEnteries", "maxLines", "numPages", "screenPriority", "textMaxLines", "updateMask",
))
_register_properties("f32", (
    "autoScrollSpeed", "bevelSize", "descriptionFontSize", "descriptionHeight",
    "descriptionSpacing", "descriptionWidth", "fontSize", "fruitScale", "fruitscale",
    "headingHeight", "headingSpacing", "headingWidth", "height", "innerGlowSize",
    "paintTextureHeight", "paintTextureWidth", "radius", "softShadowSize", "strokeSize",
    "textBoxHeight", "textBoxWidth", "verticalSpacing", "width",
))
_register_properties("vec2", ("backgroundtarget", "texCoordPos", "texCoordSize"))
_register_properties("vec3", (
    "addPosition", "descriptionPosition", "enteriesPosition", "errorPosition", "fruitOffset",
    "fruitRotation", "fruitRotationSpeed", "headingPosition", "loadingPosition", "modelSize",
    "origin", "paintTextOffset", "position", "rotation", "scale", "softShadowOffset",
    "textBoxOffset", "textRotation",
))
_register_properties("vec4", (
    "NormalStateColour", "bevelColourA", "bevelColourB", "colour", "descriptionColour",
    "headingColour", "innerGlowColour", "insideColour", "outsideColour", "paintColour",
    "softShadowColour", "strokeColour", "textColour",
))


def property_category(name: str) -> str:
    category = PROPERTY_CATEGORIES.get(name)
    if category is None:
        raise FormatError(f"unknown static property name {name!r}")
    return category


def _require_property_range(reader: Reader, offset: int, size: int) -> None:
    if offset < 0 or size < 0 or offset + size > len(reader.data):
        raise FormatError(f"truncated property record at 0x{offset:x}")


def _read_property_u32(reader: Reader, offset: int) -> int:
    _require_property_range(reader, offset, 4)
    return reader.u32(offset)


def _read_property_f32(reader: Reader, offset: int) -> float:
    _require_property_range(reader, offset, 4)
    return reader.f32(offset)


def _parse_vec_metadata(
    reader: Reader, cursor: int, name: str, record_offset: int,
) -> tuple[list[int], int]:
    """Consume the resource's variable type metadata and its exact 1,0 terminator."""
    metadata: list[int] = []
    while True:
        token = _read_property_u32(reader, cursor)
        cursor += 4
        if token == 1 and _read_property_u32(reader, cursor) == 0:
            cursor += 4
            if not metadata:
                raise FormatError(f"{name!r}: empty vec metadata at 0x{record_offset:x}")
            return metadata, cursor
        metadata.append(token)
        if len(metadata) > 8:
            raise FormatError(f"{name!r}: more than 8 vec metadata words at 0x{record_offset:x}")


def parse_property_record(reader: Reader, offset: int) -> tuple[dict[str, Any], int]:
    record_offset = offset
    name, cursor = reader.string(offset)
    try:
        category = property_category(name)
    except FormatError as error:
        raise FormatError(f"{error} at 0x{record_offset:x}") from error
    reader.require(cursor, PROP_RECORD_HEADER)
    cursor += 4
    reader.require(cursor, PROP_RECORD_HEADER_2)
    cursor += 4
    metadata: list[int] = []
    raw_value: int | None = None

    if category in ("vec2", "vec3", "vec4"):
        dimension = {"vec2": 2, "vec3": 3, "vec4": 4}[category]
        metadata, cursor = _parse_vec_metadata(reader, cursor, name, record_offset)
        value: Any = []
        for _ in range(dimension):
            value.append(_read_property_f32(reader, cursor))
            cursor += 4
    else:
        header = [_read_property_u32(reader, cursor + index * 4) for index in range(3)]
        cursor += 12
        if header != [0, 1, 0]:
            raise FormatError(f"{name!r}: invalid scalar header {header!r} at 0x{record_offset:x}")
        if category == "string":
            value, cursor = reader.string(cursor)
        else:
            raw_value = _read_property_u32(reader, cursor)
            cursor += 4
            if category == "bool":
                if raw_value not in (0, 1):
                    raise FormatError(f"{name!r}: invalid bool {raw_value} at 0x{record_offset:x}")
                value = bool(raw_value)
            elif category == "f32":
                value = reader.f32(cursor - 4)
            elif category == "u32":
                value = raw_value
            else:
                raise RuntimeError(f"unhandled property category {category!r}")

    trailer = _read_property_u32(reader, cursor)
    cursor += 4
    if trailer != 0:
        raise FormatError(f"{name!r}: invalid property trailer at 0x{record_offset:x}")
    return {
        "name": name, "category": category, "offset": record_offset,
        "end_offset": cursor, "metadata": metadata, "raw_value": raw_value,
        "trailer": trailer, "value": value,
    }, cursor


def parse_static_properties(
    reader: Reader, start: int, limit: int,
) -> tuple[dict[str, Any], list[dict[str, Any]], list[dict[str, Any]], int]:
    cursor = start
    properties: dict[str, Any] = {}
    records: list[dict[str, Any]] = []
    groups: list[dict[str, Any]] = []
    seen: dict[str, int] = {}
    while True:
        if cursor + 4 > limit:
            raise FormatError(f"static property area has no UIAM before 0x{limit:x}")
        if reader.data[cursor:cursor + 4] == b"UIAM":
            return properties, records, groups, cursor
        reader.require(cursor, PROP_GROUP_HEADER)
        if cursor + 20 > limit:
            raise FormatError(f"truncated property group header at 0x{cursor:x}")
        group_offset = cursor
        group_flags = reader.u32(cursor + 4)
        group_id = reader.u32(cursor + 8)
        reader.require(cursor + 12, PROP_GROUP_COUNT)
        property_count = reader.u32(cursor + 16)
        cursor += 20
        group_property_names: list[str] = []
        for _ in range(property_count):
            record, cursor = parse_property_record(reader, cursor)
            if cursor > limit:
                raise FormatError(f"property at 0x{record['offset']:x} extends past UIAM")
            name = record["name"]
            if name in seen:
                raise FormatError(
                    f"duplicate static property {name!r} at 0x{record['offset']:x}; "
                    f"first at 0x{seen[name]:x}")
            seen[name] = record["offset"]
            record["group_id"] = group_id
            record["group_flags"] = group_flags
            properties[name] = record["value"]
            records.append(record)
            group_property_names.append(name)
        reader.require(cursor, PROP_GROUP_END)
        cursor += 4
        if cursor > limit:
            raise FormatError(f"property group end extends past 0x{limit:x}")
        groups.append({
            "offset": group_offset, "flags": group_flags, "group_id": group_id,
            "property_count": property_count, "end_offset": cursor,
            "properties": group_property_names,
        })


def parse_event(reader: Reader, offset: int, end: int) -> tuple[dict[str, Any], int]:
    reader.require(offset, b"UIEC")
    command, cursor = reader.string(offset + 4)
    argument_count = reader.u32(cursor)
    cursor += 4
    arguments = []
    for _ in range(argument_count):
        argument, cursor = reader.string(cursor)
        arguments.append(argument)
    next_record = reader.data.find(b"UIEC", cursor, end)
    record_end = next_record if next_record >= 0 else end
    if any(reader.data[cursor:record_end]):
        raise FormatError(f"UIEC {command!r} has non-zero trailing data at 0x{cursor:x}")
    return {"command": command, "arguments": arguments}, record_end


def parse_keyframe(reader: Reader, offset: int, track_name: str, end: int) -> tuple[Keyframe, int]:
    reader.require(offset, b"UIKF")
    time_ms = reader.u32(offset + 4)
    interpolation = reader.u32(offset + 8)
    cursor = offset + 12
    values: list[float | int | str] = []
    events: list[dict[str, Any]] = []
    if reader.data[cursor:cursor + 4] == b"EVTH":
        event_count = reader.u32(cursor + 8)
        event_cursor = cursor + 12
        for _ in range(event_count):
            event_end = reader.data.find(b"UIEF", event_cursor, end)
            if event_end < 0:
                raise FormatError(f"UIEC at 0x{event_cursor:x} has no UIEF")
            event, parsed_end = parse_event(reader, event_cursor, event_end)
            if parsed_end != event_end:
                raise FormatError(f"UIEC parse mismatch at 0x{event_cursor:x}")
            events.append(event)
            event_cursor = event_end + 4
        cursor = event_cursor
        reader.require(cursor, b"EVTF")
        cursor += 4
        if any(reader.data[cursor:end]):
            raise FormatError(f"non-zero EVTF trailing data at 0x{cursor:x}")
        cursor = end
    elif track_name in {"comment", "text", "texture"}:
        value, cursor = reader.string(cursor)
        if any(reader.data[cursor:end]):
            raise FormatError(f"string UIKF at 0x{offset:x} has non-zero trailing data")
        cursor = end
        values.append(value)
    else:
        value_bytes = end - cursor
        if value_bytes <= 0 or value_bytes % 4 != 0:
            raise FormatError(f"invalid UIKF value byte count {value_bytes} at 0x{offset:x}")
        for value_offset in range(cursor, end, 4):
            raw = reader.u32(value_offset)
            values.append(raw if track_name == "enabled" else reader.f32(value_offset))
        cursor = end
    return Keyframe(offset, time_ms, interpolation, values, events), cursor


def parse_track(reader: Reader, offset: int, end: int) -> Track:
    reader.require(offset, b"UIAT")
    name, cursor = reader.string(offset + 4)
    kind = reader.u32(cursor)
    frame_start = cursor + 4
    frame_positions = reader.positions(b"UIKF", frame_start, end)
    keyframes = []
    for index, frame_offset in enumerate(frame_positions):
        frame_end = frame_positions[index + 1] if index + 1 < len(frame_positions) else end
        keyframe, parsed_end = parse_keyframe(reader, frame_offset, name, frame_end)
        if parsed_end != frame_end:
            raise FormatError(
                f"UIKF at 0x{frame_offset:x} parsed to 0x{parsed_end:x}, expected 0x{frame_end:x}")
        keyframes.append(keyframe)
    return Track(name, kind, keyframes)


def parse_animation(reader: Reader, offset: int, end: int) -> Animation:
    reader.require(offset, b"USAM")
    name, cursor = reader.string(offset + 4)
    flags = reader.u32(cursor)
    uisa = reader.positions(b"UISA", cursor + 4, end)
    if len(uisa) != 1:
        raise FormatError(f"USAM {name!r} has {len(uisa)} UISA chunks")
    track_positions = reader.positions(b"UIAT", uisa[0] + 4, end)
    tracks = []
    for index, track_offset in enumerate(track_positions):
        track_end = track_positions[index + 1] if index + 1 < len(track_positions) else end
        tracks.append(parse_track(reader, track_offset, track_end))
    return Animation(name, flags, tracks)


def parse_file(path: Path) -> dict[str, Any]:
    data = path.read_bytes()
    reader = Reader(data)
    reader.require(0, b"UISF")
    if len(reader.positions(b"UISF")) != 1 or len(reader.positions(b"UISB")) != 1:
        raise FormatError("expected exactly one UISF and UISB")
    component_positions = reader.positions(b"UICH")
    if not component_positions:
        raise FormatError("no UICH components")
    components = []
    for index, component_offset in enumerate(component_positions):
        component_end = component_positions[index + 1] if index + 1 < len(component_positions) else len(data)
        reader.require(component_offset, b"UICH")
        name, after_name = reader.string(component_offset + 20)
        parent = reader.i32(after_name)
        post_parent_start = after_name + 4
        static_start = post_parent_start + 16
        if static_start > component_end:
            raise FormatError(f"UICH {name!r}: post-parent fields outside component")
        post_parent_16 = data[post_parent_start:static_start].hex()
        properties, property_records, property_groups, map_offset = parse_static_properties(
            reader, static_start, component_end)
        component_ends = reader.positions(b"UIME", map_offset, component_end)
        if len(component_ends) != 1 or map_offset >= component_ends[0]:
            raise FormatError(f"UICH {name!r}: invalid UIAM/UIME range")
        reader.require(map_offset + 4, b"UIAB")
        animation_count = reader.u32(map_offset + 8)
        animation_positions = reader.positions(b"USAM", map_offset + 12, component_ends[0])
        if len(animation_positions) != animation_count:
            raise FormatError(
                f"UICH {name!r}: UIAB={animation_count}, USAM={len(animation_positions)}")
        animations = []
        for animation_index, animation_offset in enumerate(animation_positions):
            animation_end = (animation_positions[animation_index + 1]
                             if animation_index + 1 < len(animation_positions) else component_ends[0])
            animations.append(parse_animation(reader, animation_offset, animation_end))
        components.append({
            "name": name,
            "parent_index": parent,
            "component_offset": component_offset,
            "post_parent_16": post_parent_16,
            "static_start": static_start,
            "uiam_offset": map_offset,
            "properties": properties,
            "property_groups": property_groups,
            "property_records": property_records,
            "animations": [
                {**asdict(animation), "end_time_ms": animation.end_time_ms}
                for animation in animations
            ],
        })
    for index, component in enumerate(components):
        parent = component["parent_index"]
        if parent < -1 or parent >= len(components) or parent == index:
            raise FormatError(f"invalid parent index {parent} for {component['name']!r}")
    return {
        "file": path.name,
        "bytes": len(data),
        "component_count": len(components),
        "animation_count": sum(len(component["animations"]) for component in components),
        "components": components,
    }


def verify_layout(path: Path) -> None:
    report = parse_file(path)
    for component in report["components"]:
        for record in component["property_records"]:
            if not (component["static_start"] <= record["offset"]
                    < record["end_offset"] <= component["uiam_offset"]):
                raise FormatError(f"property outside static range: {record}")
    matches = [component for component in report["components"] if component["name"] == "iconSlot1"]
    if len(matches) != 1:
        raise FormatError(f"expected exactly one iconSlot1, got {len(matches)}")
    expected = {
        "texture": "textures/adventureprogress/iconSlot.tex",
        "scale": [1.0, 1.0, 1.0],
        "origin": [83.5, 0.0, 0.0],
        "position": [126.0, 42.5, 0.0],
        "width": 83.0,
        "height": 83.0,
    }
    for name, expected_value in expected.items():
        actual = matches[0]["properties"].get(name)
        if actual != expected_value:
            raise FormatError(f"iconSlot1.{name}: expected {expected_value!r}, got {actual!r}")
    print(f"OK layout {path}: {len(report['components'])} components")


def main() -> None:
    parser = argparse.ArgumentParser(description="Extract and validate release UISF layout and animations.")
    parser.add_argument("paths", nargs="*", type=Path)
    parser.add_argument("--all", action="store_true")
    parser.add_argument("--output", type=Path)
    parser.add_argument("--verify-layout", type=Path, metavar="PATH")
    args = parser.parse_args()
    if args.verify_layout is not None:
        verify_layout(args.verify_layout)
        return
    root = Path(__file__).resolve().parents[1]
    paths = sorted((root / "assets_raw/xml/screens").glob("*.uiscreen")) if args.all else args.paths
    if not paths:
        raise SystemExit("no .uiscreen inputs")
    reports = [parse_file(path) for path in paths]
    output = args.output or root / "reverse/uiscreen_reports"
    output.mkdir(parents=True, exist_ok=True)
    for report in reports:
        (output / f"{Path(report['file']).stem}.json").write_text(
            json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")
        print(f"OK {report['file']}: {report['component_count']} components, "
              f"{report['animation_count']} animations, {report['bytes']} bytes")
    print(f"Validated {len(reports)} files; reports: {output}")


if __name__ == "__main__":
    main()
