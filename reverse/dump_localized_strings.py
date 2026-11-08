"""导出完整字符串表（English_US）到 Content/localizedStrings.json。

与 challengeMapStrings.json 的区别：那份只含挑战地图屏用到的 11 条，
这份是发售版 StringTables 的全量（879 条），供任意屏按原键取文案。
"""
import json
import pathlib
import sys

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
import extract_string_table as base  # noqa: E402

ROOT = pathlib.Path(__file__).resolve().parent.parent
OUTPUT = ROOT / "Content" / "localizedStrings.json"


def main():
    header_identifier, header_count, header_records = base.parse_table(base.HEADER_PATH, 40)
    language_identifier, language_count, language_texts = base.parse_table(base.LANGUAGE_PATH, 12)
    if header_identifier != language_identifier:
        raise ValueError("header and language identifiers differ")
    if header_count != language_count:
        raise ValueError("header and language record counts differ")

    table = {}
    for strings, language_index in header_records:
        key = strings[0]
        if key in table:
            raise ValueError(f"duplicate key: {key}")
        table[key] = language_texts[language_index]

    if len(table) != 879:
        raise ValueError(f"expected 879 strings, found {len(table)}")
    for key, expected in {
        "FN_PUSS_LIVES": "Lives",
        "FN_PUSS_CHALLENGE_MAP_TITLE": "ACT %d",
        "FN_PUSS_ACT_1": "Act 1",
    }.items():
        if table.get(key) != expected:
            raise ValueError(f"sample mismatch for {key}")

    payload = {
        "version": 1,
        "language": base.LANGUAGE,
        "entries": [{"key": k, "text": table[k]} for k in sorted(table)],
    }
    base.write_json_atomic(OUTPUT, payload)
    print(f"entries={len(table)}")


if __name__ == "__main__":
    main()
