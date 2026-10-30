# Mortar `.tex` 格式谱系（T-018）

> 目标：assets_raw 全量 264 个 `.tex` 的解析与 PNG 落盘。
> 结论口径：**`ok` + `external_palette` 合计 == 264**；
> 其中 `external_palette` 是变体 B 的合法成功态（灰度索引兜底 + 外部调色板待补）。
> 另有独立计数 `fallback_raw`（RAW8 灰度预览），**它计入 ok 但会在 manifest 单列**，
> 若 > 0 表示仍有未识别布局，需回补规则（见 §7）。

---

## 0. TL;DR — 判定决策树

```
read data
├─ data[0:3] == b'TEX'  ─────────────────────────────► 变体 C 候选
│    扫描 head[4:96) 的所有相邻 u16 对 → (w,h)
│    for bpp in (4,3,2,1):
│        hdr = len(data) - w*h*bpp
│        if 8 <= hdr <= 512 → 候选 (hdr,w,h,bpp,off)
│    用「全局 header 长度直方图众数」过滤候选
│    命中 → C（像素按 hdr 处起始，32bpp/24bpp/16bpp 解码）
│    未命中 → 继续往下（防止碰巧以 'TEX' 开头的非 C 文件被误吞）
│
└─ 传统 12 字节头判定：
   len(data) >= 13
   data[8:12] == FF FF FF FF
   0 < u16@4 (w) <= 8192, 0 < u16@6 (h) <= 8192
   　
   ├─ (1) len(payload) % (w*h) == 0 且 1 <= bpp <= 4
   │        ────────────────────────────────────────► 变体 A（整数 bpp）
   │
   ├─ (2) w*h 为偶数 且 len(payload) == w*h/2
   │        ────────────────────────────────────────► 变体 B（4bpp 纯索引）
   │
   ├─ (3) ∃ bpp ∈ {4,2,1}：w/2×h/2 递推累加 == len(payload)
   │        ────────────────────────────────────────► 变体 D（mip 链）
   │
   ├─ (4) ∃ bpp ∈ {4,2,1}：len - w*h*bpp ∈ (0,64] 且多余字节全 0
   │        ────────────────────────────────────────► 变体 D（尾部零填充）
   │
   ├─ (5) ∃ bpp ∈ {1,2,4}：len - w*h*bpp ∈ COMMON_PALETTE_SIZES
   │        ────────────────────────────────────────► 变体 D（内嵌调色板嫌疑）
   │
   └─ (6) 兜底 ──────────────────────────────────► RAW8 灰度预览（variant="?"）
```

判定顺序的理由：**(1) 是硬方程，先吃掉绝大多数**；**(2) 与 (1) 互斥**（w*h/2 不可能是 w*h 的整数倍，除非 w*h=0）；**(3)(4)(5) 只在 (1)(2) 都失败时尝试**，避免把 mip 链误当单层图。

---

## 1. 变体 A —— 传统头 + 整数 bpp 像素

### 1.1 头部布局（12 字节，已实证）

| 偏移 | 长度 | 字段 | 说明 |
|---|---|---|---|
| 0x00 | 1 | `type` | 主格式码（0x06 = LA88 已实证） |
| 0x01 | 1 | `minor` | 子型 / 通道变体，语义未定 |
| 0x02 | 2 | `field` | u16，用途未知（可能是 flags / mip 数） |
| 0x04 | 2 | `width` | u16 LE |
| 0x06 | 2 | `height` | u16 LE |
| 0x08 | 4 | `FF FF FF FF` | 哨兵/终止符，判定 A/B/D 的关键锚点 |
| 0x0C | — | 像素数据起点 | |

### 1.2 格式表（`A_TYPE_TABLE`）

| type | 格式 | bpp | 置信 |
|---|---|---|---|
| 0x01 | RGBA8888 | 4 | L（候选） |
| 0x02 | RGBA4444 | 2 | L（候选） |
| 0x03 | ABGR4444 | 2 | L（候选） |
| 0x04 | RGBA5551 | 2 | L（候选） |
| 0x05 | RGB565 | 2 | L（候选） |
| **0x06** | **LA88** | **2** | **H（任务卡实证）** |
| 0x07 | L8 | 1 | L（候选） |
| 0x08 | A8 | 1 | L（候选） |

> 重要：**本表不参与判定**。真实 bpp 由 `len(payload) / (w*h)` 硬算，本表只决定染色方式。
> 表缺失或 bpp 不符时按 bpp 兜底（4→RGBA8888，2→RGBA4444，1→L8），并在 `notes` 记录
> `type not in table` / `type_table bpp=X != payload bpp=Y`。

### 1.3 待验证

- U1：RGBA4444 / ABGR4444 的**通道位段**（R 在最高 4 位还是 A 在最高 4 位）——本实现两种都提供，
  默认 RGBA4444 走「R 高 / A 低」，需与真实资产的人工核色确认。
- U2：`minor` 字节是否参与格式选择（任务卡提到「另有 RGBA4444/ABGR4444/RGBA8888 子型」，
  暗示 `(type, minor)` 二元键；本轮只确认了 `type=0x06 → LA88`）。

---

## 2. 变体 B —— 传统头 + 4bpp 纯索引（78 个）

### 2.1 特征

- 头部与变体 A **完全相同**（12 字节 + FF 哨兵）。
- `type ∈ {4,5,6,7,8,9,10}`。
- `len(payload) == w*h/2`（每像素 4 bit）。
- 调色板**不在文件内**。

### 2.2 输出

- PNG 内容：16 级灰度（nibble `0..15` → `0,17,34,...,255`），高 nibble 为左像素（约定，U 待验证）。
- manifest：`status = "external_palette"`，`needs_external_palette = true`，
  `palette_candidates` 填入三条调查线索。

### 2.3 调色板来源调查计划（给后续任务卡）

按「成本从低到高」排序：

1. **XML 线索**：`assets_raw` 内 `fruitlist.xml` 等文件是否存在 `colour/color` 键的 16 色表。
   ```bash
   grep -ril "colour" assets_raw --include=*.xml
   grep -i -A2 "colour" assets_raw/*/fruitlist.xml
   ```
2. **伴随文件线索**：与 B 变体同目录/同名的 `.binmodel` `.pal` `.atlas` `.json`。
   ```bash
   for f in $(tex_b_variant_list); do ls -la "$(dirname $f)"; done
   ```
3. **全局默认调色板**：Mortar 引擎常量表。若前两条失败，用 Ghidra 在
   `FruitNinjaPIB.exe` 数据段搜「16 个连续 u32、值域 0x000000–0xFFFFFF、且 alpha 单调」
   的数组（FNPIB 的 Puss in Boots 皮肤调色板风格应为暖橙/棕/米白）。
4. **交叉验证手段**：同一张图若在其它解包工具/网图中有已知 PNG，用
   「索引值直方图 × 候选调色板」做最小二乘匹配，取误差最小者。

> 在调色板补齐之前，灰度图已足以做**布局验证**（图形轮廓清晰可见），
> 不影响美术管线的结构核对，只影响色彩。

---

## 3. 变体 C —— ASCII `'TEX'` 扩展容器（107 个）

### 3.1 样例反推（`hud_cross.tex`，32820 B）

```
32820 - 128*64*4 = 32820 - 32768 = 52  →  header_len = 52，像素 32bpp
```

像素重复模式 `'#3Q '`（`23 33 51 20`），按 RGBA32 解为暖灰色，符合 UI 九宫格图。

### 3.2 字段偏移假设表（★ = 由方程反证）

| 偏移 | 长度 | 样例字节 | 假设角色 | 置信 |
|---|---|---|---|---|
| 0x00 | 4 | `54 45 58 00` (`TEX\0`) | magic | **H**（肉眼可见） |
| 0x04 | 4 | `03 00 00 00` | u32 = 3：格式族 ID / 通道数 / mip 数 | L |
| 0x08 | 7 | `08 01 08 04 08 03 08` | 通道描述（`[size u8][type u8]` 对 ×3 + 1 字节余项） | L |
| 0x0F | 1 | `00` | 填充 / 4th 通道标识 | L |
| 0x10 | 4 | `02 00 00 00` | u32 = 2：子格式 ID / mip 层数 | L |
| 0x14 | 2 | `80 00` (128) | **width（LE u16）** | **M**（方程反证） |
| 0x16 | 2 | `40 00` (64) | **height（LE u16）** | **M**（方程反证） |
| 0x18–0x33 | 28 | `00...` | 未解析（对齐填充 / 未使用域） | L |
| 0x34 | — | — | **像素起点（= header_len）** | **H**（方程反证） |

> ⚠️ 上表是**假设**，代码不依赖它。代码只依赖两个不变量：
> ① `total = header_len + w*h*bpp`；② **同族 C 容器的 header_len 应一致**。

### 3.3 尺寸方程 + 全局聚类（代码实现的做法）

因为无法确定 `w/h` 字段到底在哪个偏移，转换器：

1. 把 `head[4:96)` 里**所有相邻 u16 对**都当作 `(w, h)` 试；
2. 对每个 `bpp ∈ {4,3,2,1}` 解 `header_len = total - w*h*bpp`；
3. 保留 `header_len ∈ [8, 512]` 的候选；
4. **第一趟**对全部 C 文件各取 top1 候选的 `header_len` 做直方图 → 众数作为全局 `hint`；
5. **第二趟**优先选 `header_len == hint` 的候选（再按「宽≥高 → bpp 大 → 偏移靠前」排序）。

产物：`manifest.json` 顶层字段

```json
"c_header_hint": 52,
"c_header_histogram": {"52": 107}
```

**这张直方图就是假设表的证伪工具**：
- 若 107 个文件全部聚到 52 → §3.2 的 `header_len=52` 得到强证据，`0x34` 为像素起点可定论。
- 若出现多个簇（如 52 与 48 各半）→ 说明 C 容器有两个子型，需在 `TEX_FORMAT.md` 补子型表。
- 若某文件 `header_len != hint`，其 `notes` 会写 `header_len X != global hint Y (fallback to local)`。

### 3.4 待验证

- **U3**：`0x04` / `0x10` 两个 u32 的真实语义（格式族 vs mip 数 vs 通道数）。
- **U4**：`128×64` 还是 `64×128`——两者乘积相同，方程无法区分。代码用「宽≥高」启发式。
  验证手段：找一张已知横图的 C 文件（如 `hud_*` / 长条 banner），看输出是否被转置。
- **U5**：bpp 是否恒为 4（RGBA32）。若存在 24bpp 子型，`header_len` 聚类会分裂成两簇。

---

## 4. 变体 D —— 传统头 + 尾部多余字节

### 4.1 mip 链（主假设）

判定：从 `(w,h)` 起按 `w/2 × h/2` 递推（下限 1），累加 `w*h*bpp`，若**某一级累加和恰等于 payload 长度**，判定为 mip 链。

```
sizes = [w*h*bpp, (w/2)*(h/2)*bpp, (w/4)*(h/4)*bpp, ..., 1*1*bpp]
match if Σ sizes[:k] == len(payload)  for some k
```

- 输出：只解 **mip0**（最大层），`mip_levels = k` 写入 manifest。
- 允许尾部不足一级的偏差：本实现要求**精确相等**，不做四舍五入（真实 mip 链是否用 `>>1` 取整需 U6 验证）。

### 4.2 尾部零填充

`0 < len - w*h*bpp <= 64` 且多余字节**全为 0** → 视为对齐填充，解 base 层，note `trailing_zero_padding=NB`。

### 4.3 内嵌调色板嫌疑

`len - w*h*bpp ∈ {1024, 768, 512, 256, 64, 48, 32, 16}` → 视为「base 层 + 调色板」，
只解 base 层，note `embedded_palette_suspect=NB`。**不拆分调色板**（等 U7 明确后再说）。

### 4.4 待验证

- **U6**：mip 递减是 `>>1` 还是 `max(1, w//2)`；是否可能存在非 2 次幂尺寸。
- **U7**：多余字节究竟是 mip 链、内嵌调色板，还是**第二张贴图**（FNPIB 的 sprite sheet 可能是 atlas 拼接）。
  验证手段：若多余字节长度恰好等于另一组 `w'×h'×bpp`，且头部无第二组尺寸 → 大概率为 mip；
  若多余字节呈「16/256 个 4 字节颜色值 + 少量元数据」结构 → 大概率为调色板。

---

## 5. 输出与 manifest

### 5.1 产物

```
assets_png/
├── manifest.json
└── <与 assets_raw 同构的目录树>/xxx.png
```

PNG 一律 **RGBA8888、无 premultiply、filter=0、不做垂直翻转**（UV 原点问题留给渲染层，见 U8）。

### 5.2 manifest 顶层

```json
{
  "tool": "tex_convert.py",
  "version": "T-018",
  "source_root": "...",
  "output_root": "...",
  "totals": {"total": 264, "ok": ..., "external_palette": ..., "failed": 0, "fallback_raw": ...},
  "variants": {"A": 72, "B": 78, "C": 107, "D": ..., "?": ...},
  "formats": {...},
  "c_header_hint": 52,
  "c_header_histogram": {"52": 107},
  "files": [ { "rel", "status", "variant", "format", "width", "height", "bpp",
              "header_bytes", "mip_levels", "png", "needs_external_palette",
              "palette_candidates", "notes" } ]
}
```

**验收钩子**：`totals.total == 264`，`totals.ok + totals.external_palette == 264`，
`totals.failed == 0`。同时人工检查 `totals.fallback_raw`（期望 0）。

---

## 6. 自检（`--selftest`）

每个变体一个合成样例，断言到像素级：

| 样例 | 断言 |
|---|---|
| A / RGBA8888 4×3 | variant、format、尺寸、bpp、px0/px1 四通道精确相等 |
| A / LA88 2×2 | `(L,A)` → `(L,L,L,A)` 映射正确 |
| B / 4bpp 4×4 | bpp=0.5、`needs_external_palette=true`、nibble→灰度 0/17/34 |
| C / 52B 头 32×16 | header_bytes=52、RGBA32、px0 四字节精确 |
| D / mip 8×8 | mip_levels=4、只解 base 层 |
| fallback 300B 随机 | 有输出、rgba 长度自洽 |
| 端到端 | 4 文件 → total=4、ok=4、failed=0、fallback_raw=0、4 张 PNG + manifest |

> C 的合成样例是**按 §3.2 假设表构造**的，不是真实文件。
> 它验证的是「方程 + 聚类」这套算法，不是验证假设表本身——假设表由实跑直方图验证。

---

## 7. 未决问题清单

| 编号 | 问题 | 影响 | 验证手段 |
|---|---|---|---|
| U1 | RGBA4444/ABGR4444 通道位段 | 变体 A 颜色错（R/B/A 互换） | 与已知图人工核色 |
| U2 | `(type, minor)` → 格式全表 | 变体 A 染色错误 | 抽样 + 已知图对比 |
| U3 | C 的 `0x04`/`0x10` u32 语义 | 无（当前靠方程不依赖） | 反编译 Mortar 纹理加载器 |
| U4 | C 的宽高字段顺序 | C 输出可能转置 | 长条 UI 图目视 |
| U5 | C 是否存在非 32bpp 子型 | header_len 聚类分裂 | 看 `c_header_histogram` |
| U6 | D 的 mip 取整规则 | mip 链匹配失败率 | 实跑失败样本 |
| U7 | D 的多余字节是 mip 还是调色板还是第二贴图 | D 变体输出正确性 | 见 §4.4 |
| U8 | `.tex` 的 UV 原点（是否需垂直翻转） | 渲染方向上下颠倒 | Metal 渲染层首帧目视；不要在这一层解决 |
| U9 | 是否存在 premultiplied alpha | 透明边缘发黑 | 与已知图对比 |

---

## 8. 验收

```bash
python tools/AssetPipeline/tex_convert.py --selftest
python tools/AssetPipeline/tex_convert.py assets_raw assets_png
```

期望 stderr：

```
[SUMMARY] total=264 ok=... external_palette=... failed=0 fallback_raw=0
```

若 `fallback_raw > 0`：按 §0 决策树逐条核对失败文件的 `notes`，补规则后重跑。