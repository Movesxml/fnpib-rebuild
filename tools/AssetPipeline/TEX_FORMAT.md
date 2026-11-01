# Mortar `.tex` 格式谱系（T-031）

> T-031 修正：传统 12 字节头的格式字段是 **偏移 2 的 u16 `format_id`**，
> 不是偏移 0 的首字节版本号。已实证 `0x11 = RGB565`。
> 本文件取代 T-018 中「首字节 type 表」的错误口径。

## 0. 判定决策树

```text
read data
├─ data[0:3] == b'TEX'
│    ─────────────────────────────────────────────► 变体 C 候选（T-018 算法）
│    扫描 head[4:96) 的相邻 u16 对 → (w,h)
│    for bpp in (4,3,2,1):
│        hdr = len(data) - w*h*bpp
│        if 8 <= hdr <= 512 → 候选
│    用全局 header 长度直方图众数过滤
│    命中 → C；未命中 → 继续往下
│
└─ 传统 12 字节头：
   len(data) >= 13
   data[8:12] == FF FF FF FF
   0 < u16@4(w) <= 8192, 0 < u16@6(h) <= 8192
   　
   ├─ (1) len(payload) % (w*h) == 0 且 1 <= bpp <= 4
   │        ────────────────────────────────────► 变体 A（整数 bpp）
   │
   ├─ (2) w*h 为偶数 且 len(payload) == w*h/2
   │        ────────────────────────────────────► 变体 B（4bpp 纯索引）
   │
   ├─ (3) ∃ bpp ∈ {4,2,1}：完整 mip 链累加 == len(payload)
   │        ────────────────────────────────────► 变体 D（mip 链）
   │
   ├─ (4) ∃ bpp ∈ {4,2,1}：len - w*h*bpp ∈ (0,64] 且多余字节全 0
   │        ────────────────────────────────────► 变体 D（尾部零填充）
   │
   ├─ (5) ∃ bpp ∈ {1,2,4}：len - w*h*bpp ∈ COMMON_PALETTE_SIZES
   │        ────────────────────────────────────► 变体 D（内嵌调色板嫌疑）
   │
   └─ (6) 兜底 ──────────────────────────────► RAW8 灰度预览（variant="?"）
```

## 1. 传统 12 字节头（已实证）

| 偏移 | 长度 | 字段 | 说明 |
|---|---|---|---|
| 0x00 | 1 | `b0` | 版本/子版本字节，**不参与格式判定** |
| 0x01 | 1 | `b1` | 版本/子版本字节，**不参与格式判定** |
| 0x02 | 2 | `format_id` | u16 LE，**像素格式字段** |
| 0x04 | 2 | `width` | u16 LE |
| 0x06 | 2 | `height` | u16 LE |
| 0x08 | 4 | `FF FF FF FF` | 哨兵，A/B/D 判定锚点 |
| 0x0C | — | 像素数据 | |

`fruit_atlas.tex` 实例：

```text
09 09 11 00 00 02 00 02 ff ff ff ff
      ^^^^^
      format_id = 0x0011 = 17 = RGB565
w = 0x0200 = 512, h = 0x0200 = 512
payload = 512*512*2 = 524288
file = 12 + 524288 = 524300
```

T-018 的旧实现把首字节 `09` 当格式，再按 2bpp 猜成 RGBA4444，导致
`fruit_atlas.png` 彩色噪化。T-031 起**禁止再按首字节或 bpp 猜格式**。

## 2. 已实证格式：`0x11 = RGB565`

代码中的唯一已验证项：

```python
VERIFIED_FORMATS = {
    0x11: ("RGB565", 2),
}
```

解码（little-endian u16）：

```text
R = bits 15..11
G = bits 10..5
B = bits 4..0
A = 255

R8 = (R * 255 + 15) / 31
G8 = (G * 255 + 31) / 63
B8 = (B * 255 + 15) / 31
```

整数写法：

```python
r8 = (r5 * 255 + 15) // 31
g8 = (g6 * 255 + 31) // 63
b8 = (b5 * 255 + 15) // 31
```

自测的像素级黄金值：

| u16 | R5/G6/B5 | RGBA8888 |
|---|---|---|
| `0xF800` | 31/0/0 | `255,0,0,255` |
| `0x07E0` | 0/63/0 | `0,255,0,255` |
| `0x001F` | 0/0/31 | `0,0,255,255` |
| `0x8410` | 16/32/16 | `132,130,132,255` |

## 3. 未闭合格式的显式状态

`format_id != 0x11` 的传统头文件：

* 不进入 `A_TYPE_TABLE` 猜测；
* 不按 1/2/3/4 bpp 猜 `L8 / RGBA4444 / RGB24 / RGBA8888`；
* 输出 `RAW_PREVIEW` 灰度预览（每像素取首字节），便于检查布局；
* manifest 中 `status = "unverified_format"`，`format_verified = false`；
* `notes` 记录 `format_id=0x.. not verified; raw preview only`。

这是**合法成功态**：文件有 PNG、有边界校验，只是颜色未闭合。
`0x10`、`0x12` 等不得顺手猜成 16bpp RGBA4444。

## 4. 变体 B：4bpp 纯索引

特征与 T-018 相同：

* 传统头，`len(payload) == w*h/2`；
* 调色板不在文件内；
* 输出 16 级灰度 `nibble*17`；
* `status = "external_palette"`，`needs_external_palette = true`；
* `palette_candidates` 保留三条调查线索。

## 5. 变体 C：ASCII `TEX` 扩展容器（T-018 算法保留）

仍用「总长方程 + 全量 header 长度聚类」：

```text
total = header_len + w*h*bpp
```

不做单文件字段硬编码。`c_header_hint` 与 `c_header_histogram` 写入
`manifest.json`。C 的语义仍有部分未闭合（T-018 U3/U5），但不在本轮
“传统头 format_id 修正”范围内，保持原行为以免 107 个 UI 纹理回归。

## 6. 变体 D：mip / 尾部填充 / 调色板嫌疑

判定顺序不变：

1. 完整 mip 链：只解 mip0，`mip_levels = k`；
2. 尾部零填充 `0 < extra <= 64`：只解 base；
3. `extra ∈ COMMON_PALETTE_SIZES`：标记 `embedded_palette_suspect`，只解 base。

D 的像素格式同样走 `format_id` 判定：`0x11` 且 base bpp=2 才按 RGB565，
否则 `RAW_PREVIEW` + `unverified_format`。

## 7. 输出与 manifest

```text
assets_png/
├── manifest.json
└── <与 assets_raw 同构>/xxx.png
```

PNG 一律 RGBA8888、无 premultiply、filter=0、**不做垂直翻转**。
UV 原点问题留给 Metal 渲染层（U8）。

manifest 顶层字段新增/修正：

```json
{
  "tool": "tex_convert.py",
  "version": "T-031",
  "totals": {
    "total": 264,
    "ok": 0,
    "external_palette": 0,
    "unverified_format": 0,
    "failed": 0,
    "fallback_raw": 0,
    "converted": 264
  },
  "variants": {"A": 0, "B": 0, "C": 0, "D": 0, "?": 0},
  "formats": {"RGB565": 0, "INDEX4": 0, "RGBA32": 0, "RAW_PREVIEW": 0},
  "files": [
    {
      "rel": "models/Fruit/textures/fruit_atlas.tex",
      "status": "ok",
      "variant": "A",
      "format": "RGB565",
      "format_id": 17,
      "format_verified": true,
      "width": 512,
      "height": 512,
      "bpp": 2,
      "notes": ["legacy_header b0=0x09 b1=0x09 format_id=0x11"]
    }
  ]
}
```

状态桶：

| status | 含义 |
|---|---|
| `ok` | 已识别且像素格式已验证（当前主要是 `0x11` RGB565 / C 容器 / 已验证 D） |
| `external_palette` | 变体 B，4bpp 索引，调色板待补 |
| `unverified_format` | 传统头 format_id 未闭合，输出 RAW_PREVIEW |
| `failed` | 读写/PNG 失败；验收要求 0 |

## 8. 自检与真实回归

```bash
python tools/AssetPipeline/tex_convert.py --selftest
python tools/AssetPipeline/tex_convert.py assets_raw assets_png
```

自检覆盖：

* RGB565 四像素黄金值；
* `format_id=0x10` 必须得到 `RAW_PREVIEW` + `format_verified=false`；
* B/C/D/fallback 原有用例；
* 端到端 5 文件：3 ok + 1 external_palette + 1 unverified_format + 0 failed；
* 若存在 `assets_raw/models/Fruit/textures/fruit_atlas.tex`：
  * 文件长度 524300；
  * `variant=A`、`format=RGB565`、`format_verified=true`；
  * 512×512、bpp=2；
  * 输出 RGBA 长度 512*512*4；
  * 至少存在一个非灰度像素（证明 RGB565 彩色通道生效）。

## 9. 验收口径

```text
totals.total == 264
totals.failed == 0
totals.fallback_raw == 7（当前已识别的未闭合布局，必须继续显式标记）
totals.ok + totals.external_palette + totals.unverified_format == 264
fruit_atlas.tex → format=RGB565, 512×512
```

注意：T-031 不再要求 `ok + external_palette == 264`。传统头中未闭合的
format_id 会进入 `unverified_format`，这是显式的、可追踪的成功态；
`failed` 仍必须为 0。

## 10. 未决问题

| 编号 | 问题 | 影响 | 验证手段 |
|---|---|---|---|
| U1 | 除 0x11 外的传统 format_id 映射 | 颜色 | 逐格式人工核色 / 反编译纹理加载器 |
| U2 | `b0/b1` 版本字节是否影响格式子型 | 颜色 | 抽样对比 + 反编译 |
| U3 | C 的 `0x04/0x10` u32 语义 | 无（当前靠方程） | 反编译 Mortar 纹理加载器 |
| U4 | C 宽高字段顺序 | C 输出可能转置 | 长条 UI 图目视 |
| U5 | C 是否存在非 32bpp 子型 | header 聚类分裂 | 看直方图 |
| U6 | D 的 mip 取整规则 | mip 匹配率 | 实跑失败样本 |
| U7 | D 的多余字节是 mip/调色板/第二贴图 | D 正确性 | 见 T-018 §4.4 |
| U8 | `.tex` UV 原点是否需垂直翻转 | 渲染方向 | Metal 首帧目视；不要在本层解决 |
| U9 | 是否 premultiplied alpha | 透明边缘发黑 | 与已知图对比 |