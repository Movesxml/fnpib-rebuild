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
        animation_maps = reader.positions(b"UIAM", after_name, component_end)
        component_ends = reader.positions(b"UIME", after_name, component_end)
        if len(animation_maps) != 1 or len(component_ends) != 1:
            raise FormatError(f"UICH {name!r}: UIAM/UIME count mismatch")
        map_offset = animation_maps[0]
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


def main() -> None:
    parser = argparse.ArgumentParser(description="Extract and validate release UISF animation timelines.")
    parser.add_argument("paths", nargs="*", type=Path)
    parser.add_argument("--all", action="store_true")
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
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
