# 发售版 StringTables 二进制映射

范围：`FruitNinjaPussInBoots_header.str` 与语言文件的键到译文关系；不把该结构等同于完整 ComponentText 排版。

## 格式

- 所有整数为 little-endian UInt32，与 UISF 的 big-endian 存储不同。
- 文件头：version（4 字节，当前为 1）、64 字节格式标识、payloadByteCount（偏移 68）、entryCount（偏移 72）。payloadByteCount 从偏移 72 起计数，因此 `72 + payloadByteCount == fileSize`。
- header 从偏移 76 起每条 40 字节，字符串数据基址为 `76 + count * 40`。每条含 3 个字符串记录，每条 12 字节：相对字符串数据基址的 offset、字符长度、UTF-8 字节长度。偏移 36 为 languageIndex。
- 语言文件从偏移 76 起每条 12 字节，字符串数据基址为 `76 + count * 12`。每条同样保存 offset、字符长度、UTF-8 字节长度。
- 原始 `FUN_0030b90c` 按 `count * 0x28` 确定 header 字符串数据基址，并修正每条 0、12、24 偏移处的字符串地址。`FUN_0030b980` 按 `count * 0x0c` 确定语言文件基址并修正偏移 0 的地址。`FUN_0030b520` 验证 version=1 与 64 字节格式标识。

## 键到译文

必须使用 `headerRecord.languageIndex` 选择语言记录。header 数组下标与语言数组下标不同，不能直接 zip 两个数组。首条 header 是 `ACHIEVEMENT_00`，其 languageIndex=173；语言文件首条则是 `OK`，这一反例可直接发现错误配对。

生产 `inGameChallengeMapScreen.uiscreen` 的 11 个键经显式索引映射为：

| 组件 index | key | English_US |
| --- | --- | --- |
| 8 | FN_PUSS_CHALLENGE_MAP_TITLE | ACT %d |
| 20 | FN_PUSS_CLICK_TO_CHOOSE | Touch to Choose |
| 34 | FN_PUSS_BONUS_INTRO_1 | finale! |
| 37 | FN_PUSS_CLICK_TO_BEGIN | Touch to Begin! |
| 41 | FN_PUSS_ACT_1 | Act 1 |
| 42 | FN_PUSS_SAN_RICARDO | San Ricardo |
| 55 | FN_PUSS_ACT_2 | Act 2 |
| 56 | FN_PUSS_CAT_CANTINA | Cat Cantina |
| 69 | FN_PUSS_ACT_3 | Act 3 |
| 70 | FN_PUSS_SKY_CASTLE | Sky Castle |
| 83 | FN_PUSS_FINALE | FINALE |

## 证据与边界

- `build_logs/string_table_records.txt`：原始记录解析与地址修正。
- `build_logs/string_table_deserializers.txt`：header 和语言文件分别进入上述两条读取路径。
- `build_logs/string_table_loaders.txt`：原运行时构造 `_header.str` 和 `_English_US.str` 路径并加载。
- `assets_raw/StringTables/`：原始文件；所有语言文件具有相同 64 字节格式标识和 879 条记录。
- 字体见 `shared_context/findings/uiscreen_default_font_macho.md`；字体栅格化、基线、换行、描边及真机视觉仍未闭合。
