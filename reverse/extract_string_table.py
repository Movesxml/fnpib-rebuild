import json
import math
import os
import struct
import sys
import tempfile
from pathlib import Path

HEADER_PATH = Path("assets_raw/StringTables/FruitNinjaPussInBoots_header.str")
LANGUAGE_PATH = Path("assets_raw/StringTables/FruitNinjaPussInBoots_English_US.str")
UISF_PATH = Path("reverse/uiscreen_reports/inGameChallengeMapScreen.json")
OUTPUT_PATH = Path("Content/challengeMapStrings.json")

LANGUAGE = "English_US"
DEFAULT_FONT_NAME = "FontsTrueType/bronic.ttf"
DEFAULT_FONT_SIZE = 1.0
U32 = struct.Struct("<I")


def u32(blob, offset):
    return U32.unpack_from(blob, offset)[0]


def read_string(blob, data_base, relative_offset, character_length, byte_length):
    start = data_base + relative_offset
    end = start + byte_length
    if end >= len(blob):
        raise ValueError("string terminator is missing")
    if blob[end] != 0:
        raise ValueError("string is not NUL terminated")
    try:
        text = blob[start:end].decode("utf-8")
    except UnicodeDecodeError as exc:
        raise ValueError("invalid UTF-8 string") from exc
    if len(text) != character_length:
        raise ValueError("decoded character length mismatch")
    return text


def parse_table(path, record_size):
    blob = path.read_bytes()
    if len(blob) < 76:
        raise ValueError(f"{path} is too short")

    version = u32(blob, 0)
    if version != 1:
        raise ValueError(f"{path} has unsupported version {version}")

    identifier = blob[4:68]
    payload_size = u32(blob, 68)
    if 72 + payload_size != len(blob):
        raise ValueError(f"{path} has invalid payload size")

    count = u32(blob, 72)
    data_base = 76 + record_size * count
    if data_base > len(blob):
        raise ValueError(f"{path} has invalid record area")

    records = []
    for index in range(count):
        record_offset = 76 + index * record_size

        if record_size == 40:
            strings = []
            for part in range(3):
                item_offset = record_offset + part * 12
                relative_offset = u32(blob, item_offset)
                character_length = u32(blob, item_offset + 4)
                byte_length = u32(blob, item_offset + 8)
                strings.append(
                    read_string(
                        blob,
                        data_base,
                        relative_offset,
                        character_length,
                        byte_length,
                    )
                )

            language_index = u32(blob, record_offset + 36)
            if language_index >= count:
                raise ValueError(f"{path} has out-of-range languageIndex")
            records.append((strings, language_index))

        elif record_size == 12:
            relative_offset = u32(blob, record_offset)
            character_length = u32(blob, record_offset + 4)
            byte_length = u32(blob, record_offset + 8)
            records.append(
                read_string(
                    blob,
                    data_base,
                    relative_offset,
                    character_length,
                    byte_length,
                )
            )

        else:
            raise ValueError("unsupported record size")

    return identifier, count, records


def write_json_atomic(path, payload):
    path.parent.mkdir(parents=True, exist_ok=True)
    fd, temporary_name = tempfile.mkstemp(
        dir=str(path.parent),
        prefix=path.name + ".",
        suffix=".tmp",
    )
    try:
        with os.fdopen(fd, "w", encoding="utf-8") as handle:
            json.dump(payload, handle, ensure_ascii=False, indent=2)
            handle.write("\n")
        os.replace(temporary_name, path)
    except Exception:
        try:
            os.unlink(temporary_name)
        except FileNotFoundError:
            pass
        raise


def extract(uis_path, output_path, expected_count):
    header_identifier, header_count, header_records = parse_table(HEADER_PATH, 40)
    language_identifier, language_count, language_texts = parse_table(LANGUAGE_PATH, 12)

    if header_identifier != language_identifier:
        raise ValueError("header and language identifiers differ")
    if header_count != language_count:
        raise ValueError("header and language record counts differ")

    mapping = {}
    for strings, language_index in header_records:
        key = strings[0]
        if key in mapping:
            raise ValueError(f"duplicate header key: {key}")
        mapping[key] = language_texts[language_index]

    samples = {
        "FN_PUSS_ACT_1": "Act 1",
        "FN_PUSS_CHALLENGE_MAP_TITLE": "ACT %d",
        "FN_PUSS_SAN_RICARDO": "San Ricardo",
    }
    for key, expected in samples.items():
        if mapping.get(key) != expected:
            raise ValueError(f"sample mismatch for {key}")

    document = json.loads(uis_path.read_text(encoding="utf-8"))
    if not isinstance(document, dict):
        raise ValueError("UISF root is not an object")

    components = document.get("components")
    if not isinstance(components, list):
        raise ValueError("UISF components is not an array")

    rows = []
    for component_index, component in enumerate(components):
        if not isinstance(component, dict):
            continue

        properties = component.get("properties")
        if not isinstance(properties, dict):
            continue
        if "text" not in properties:
            continue

        key = properties["text"]
        if not isinstance(key, str):
            raise ValueError("component text is not a string")

        name = component.get("name")
        if not isinstance(name, str):
            raise ValueError("component name is missing or not a string")

        if "fontName" in properties:
            font_name = properties["fontName"]
            if not isinstance(font_name, str) or font_name == "":
                raise ValueError("invalid explicit fontName")
        else:
            font_name = DEFAULT_FONT_NAME

        if "fontSize" in properties:
            value = properties["fontSize"]
            if isinstance(value, bool) or not isinstance(value, (int, float)):
                raise ValueError("invalid explicit fontSize")
            try:
                font_size = float(value)
            except (OverflowError, ValueError) as exc:
                raise ValueError("invalid explicit fontSize") from exc
            if not math.isfinite(font_size):
                raise ValueError("invalid explicit fontSize")
        else:
            font_size = DEFAULT_FONT_SIZE

        if key not in mapping:
            raise ValueError(f"missing string table key: {key}")

        rows.append(
            {
                "componentIndex": component_index,
                "name": name,
                "key": key,
                "text": mapping[key],
                "fontName": font_name,
                "fontSize": font_size,
            }
        )

    if len(rows) != expected_count:
        raise ValueError(f"expected exactly {expected_count} text components, found {len(rows)}")

    output = {
        "version": 1,
        "language": LANGUAGE,
        "entries": rows,
    }
    write_json_atomic(output_path, output)

    for row in rows:
        print(f"{row['key']}={row['text']}")


BACKGROUND_UISF_PATH = Path("reverse/uiscreen_reports/inGameChallengeBackground.json")
BACKGROUND_OUTPUT_PATH = Path("Content/challengeBackgroundStrings.json")


def main():
    extract(UISF_PATH, OUTPUT_PATH, 11)
    if "--with-background" in sys.argv:
        extract(BACKGROUND_UISF_PATH, BACKGROUND_OUTPUT_PATH, 1)


if __name__ == "__main__":
    main()
