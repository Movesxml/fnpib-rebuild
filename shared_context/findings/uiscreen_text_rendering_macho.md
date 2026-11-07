# UIScreen 文字渲染（ComponentText / 字体引擎）：Mach-O 证据

范围：原始 ARMv7 发售版 `FruitNinjaPuss` 的 `ComponentText` 组件、字体面（TTF）加载、字形栅格化、行布局与文字 mesh 提交。
只记录已导出语料能直接指到的东西；推断一律标 `[推断]`，无证据写「未导出」。

- 组件构造函数：`FUN_003cec7c`，虚表 `0x542c78`（`build_logs/component_text_constructor.txt:73-74`；`build_logs/component_text_vtable.txt:5`）。
- 字体面对象：`FUN_0031dbc0`（0x1a4 字节）；文字排版对象：`FUN_003206b8`（0xf4 字节）。
- 全局字体系统单例：`FUN_0031fa44` → `&DAT_005aea44`（`build_logs/font_metrics_core.txt:49-60`）。

---

## 1. 数据模型

### 1.1 属性的存储形式（先决条件）

ComponentText 的每个文字属性不是裸标量，而是**属性节点指针**：

- 节点 `+0x38` = 链表下一个节点（`*(node+0x38)+4` 取下一条），`+0x48` = 值本体（float / int / 4 字节颜色 / std::string / vec3）。
  证据：`build_logs/component_text_font_path.txt:49-52`（"text"）、`:94-97`（maxLines）、`:245-248`（fontSize）、`build_logs/component_text_rebuild.txt:99-101`（softShadowOffset，读 `+0x48/+0x4c`）、`:136-138`（softShadowSize）。
- 构造时用「取或建」把默认值写进节点，六类属性各有独立 map：
  | 类型 | map 基址 | 取或建函数 | 构造证据 |
  |---|---|---|---|
  | bool | `this+0x18` | `FUN_0007fdc0` | `component_text_constructor.txt:270-277` |
  | string | `this+0x28` | `FUN_00080314` | `:101-110` |
  | vec3 | `this+0x38` | `FUN_0007fb98` | `:238-248` |
  | float | `this+0x58` | `FUN_0007cd44` | `:113-120` |
  | int | `this+0x78` | `FUN_00082ca4` | `:142-151` |
  | colour | `this+0x88` | `FUN_003d24c0` | `:153-162` |
- 取节点值 = 走到链尾再读 `+0x48`（`component_text_font_path.txt:49-52` 的 `for(...;*(iVar1+0x38)!=0;...)` + `*(iVar1+0x48)`）。

### 1.2 ComponentText 属性表（偏移 = 节点指针所在字节）

| 属性 | 节点偏移 | 类型 | 构造默认值 | 构造证据（文件:行） |
|---|---|---|---|---|
| `text` | `+0x7dc` | string | 空串（`PTR_DAT_004d91c0`） | component_text_constructor.txt:99-110 |
| `radius` | `+0x7e0` | float | `0` | :112-120 |
| `fontName` | `+0x7e4` | string | 空串 | :121-131 |
| `fontSize` | `+0x7e8` | float | `0x3f800000` = **1.0** | :133-141 |
| `maxLines` | `+0x7ec` | int | **1** | :142-151 |
| `insideColour` | `+0x7f0` | colour | 白 `PTR_DAT_004d9080` | :152-162 |
| `outsideColour` | `+0x7f4` | colour | 白 | :163-172 |
| `verticalSpacing` | `+0x7f8` | int | **1** | :173-180 |
| `horizontalSpacing` | `+0x7fc` | int | **1** | :181-188 |
| `dropShadowStyle` | `+0x800` | int | `0` | :189-196 |
| `strokeSize` | `+0x804` | float | **1.0** | :197-205 |
| `strokeColour` | `+0x808` | colour | 白 | :206-215 |
| `softShadowSize` | `+0x80c` | float | **1.0** | :216-224 |
| `softShadowColour` | `+0x810` | colour | 白 | :225-234 |
| `softShadowOffset` | `+0x814` | vec3 | `DAT_0052bfe0/e4/e8` = (0,0,0) | :235-248；常量定义 font_property_initializers.txt:88-93 |
| `innerGlowSize` | `+0x818` | float | `0` | :249-257 |
| `innerGlowColour` | `+0x81c` | colour | 白 | :258-267 |
| `bevelEnabled`（未进注册表） | `+0x820` | bool | `0` | :268-277 |
| `bevelSize` | `+0x824` | float | `0` | :279-286 |
| `bevelDepth` | `+0x828` | float | `0` | :287-295 |
| `bevelAzimuth` | `+0x82c` | float | `0` | :297-305 |
| `bevelZenith` | `+0x830` | float | `0` | :307-315 |
| `bevelColourA` | `+0x834` | colour | 白 | :318-327 |
| `bevelColourB` | `+0x838` | colour | 白 | :329-337 |
| `alignment` | `+0x83c` | string | `""` | :338-348 |
| `localiseText` | `+0x840` | bool | `0` | :350-357 |
| `useGradient` | `+0x844` | bool | `0` | :358-365 |
| `DAT_00604858`（名字未导出） | `+0x848` | string | `""` | :366-376；名字表 font_property_initializers.txt:71-72 |
| `confineToHeight` | `+0x84c` | bool | `0` | :378-385 |
| `MaxArcDegrees` | `+0x850` | int | `0x99` = 153 | :386-394 |
| `useMetallicGradient` | `+0x854` | bool | `0` | :396-404 |
| `metallicColourA..D` | `+0x858..0x864` | colour×4 | 白 | :406-428 |
| `marginsTop/Bottom/Left/Right` | `+0x868..0x874` | int×4 | `0` | :430-453 |
| `alignToFontMeshBounds` | `+0x878` | bool | `FUN_003ec218()` 返回值 | :454-505 |
| `colourisation` | `+0x87c` | string | `""` | :506-521 |

属性名注册表（22 条）见 `build_logs/font_property_initializers.txt:23-74`；`fontName`/`fontSize` 的字符串地址分别是 `0x418bb2`/`0x45ab50`（`font_property_references.txt:5-26`、`font_property_strings.txt:1-8`）。

### 1.3 构造期默认值的写入点（逐条指令级）

- 构造入口先写死一批字段：`component_text_constructor.txt:73-98`。
  `+0x73c`(=`this[0x1cf]`) = `0xf`（`:96`）；`+0x744` = 空 std::string（`:75`）；`+0x784`/`+0x794` 两个 vector 容量 4（`:76-77`）；`+0x7d8` = 空 std::string（`:93`）。
- 默认字体：启动函数 `FUN_0001dde4` 在 `~iPhone` 布局加载成功后调用
  `FUN_00023758(ui, "ComponentText", "fontName", "fontstruetype/bronic.ttf")`（`font_property_initializers.txt:333-340`）。
  `FUN_00023758` 按属性类型 `*(node+0x8c)` 分派，case 2 = string 写入 `+0x90`（`font_default_setter.txt:76-87`）。
- 另一处易混：`FUN_003c2818`（虚表 `0x542808`）的 `fontSize` 默认 10.0、`maxLines` 默认 300（`font_property_initializers.txt:218-226`、`:193`）。**它不是 ComponentText**：其 `+0x73c..+0x758` 是 7 个 UI 子组件指针（console/consoleBg/consoleOutput/consoleInputBg/consoleInput/consoleEnterBtn/debugTextComponent，`text_component_core.txt:265,323,387,457,521,588,649`）。引用这两个默认值会得到与原版相反的结论。

### 1.4 运行时状态字段（非属性）

| 偏移 | 含义（直接读到） | 证据 |
|---|---|---|
| `+0x740` | 文字排版对象指针（0xf4B） | component_text_font_path.txt:113-126 |
| `+0x744` | 解析后的字体路径 std::string | :45-48 |
| `+0x784`/`+0x794` | 两套 0x30B 顶点 vector（主层 / 阴影层） | component_text_constructor.txt:76-77；dtor component_text_constructor.txt:610-611 |
| `+0x7a0` | mesh 是否有效 | component_text_methods.txt:112-116 |
| `+0x7a4` | 需要重建排版 | component_text_methods.txt:20-22、:321 |
| `+0x7a8` | 需要重建字体/文字 | :23-25、:360 |
| `+0x7ac` | 需要重刷颜色/样式 | :26-28、:368 |
| `+0x7b0`/`+0x7b4` | 上次字号 / 强制重排标志 | :29-36 |
| `+0x7b8` | 堆缓冲（析构 delete） | component_text_constructor.txt:607-609 |
| `+0x7bc` | 排版位标志位掩码（构造 0xf） | :96 |
| `+0x7d8` | 已解析显示文本缓存 std::string | component_text_methods.txt:547-549 |

---

## 2. 布局

### 2.1 调用链

`component dirty → FUN_003d0bf4（推文字/字号）→ FUN_003cfc24（重建排版对象）→ FUN_00320a28 → {FUN_00321920 (逐行) , FUN_00321aa0 (缩字号) , FUN_00320ed8 (定位)} → FUN_00321310 (释放旧字形)`

- `FUN_003d0bf4` 把 `text`（vtable `+0xb0` = slot 44 = `FUN_003d078c`）和 `fontSize`（`+0x7e8`）推给排版对象（`component_text_rebuild.txt:231-252`）。
- `FUN_003cfbe0`：`radius == 0` 走直线排版 `FUN_003cfc24`，否则走圆弧排版 `FUN_003cff24`（`:190-203`）。

### 2.2 字符串 → 一行字形

`FUN_0031b8fc(font, textIn, textOut, glyphSize, fontSize, maxWidth, outHeight, outTruncated, outCount)`（`font_engine_real.txt:376-593`）。参数语义按用法直读：第 4 参传入字形获取（`:448`），第 5 参叠加全局 `+0x140` 后乘面缩放（`:423-424`），第 6 参为宽度上限且 `-1` 表示不限（`:491`），第 7/8/9 参是出参（`:519-566`）。

- 逐字符取字形：`FUN_0031e0b8(font, ch, size)`（`:448`）→ 命中/新建字形对象（`font_raster_layout.txt:13-49`）。
- 字符推进：`advance = fontSize*faceScale + glyph[2] + kerning`
  `uVar18 = FixedToFP(param_5) * *(font+0x184)`（`font_engine_real.txt:423-432`），
  每字符 `uVar12 = FloatVectorAdd(uVar18, FUN_00320508(glyph, prevGlyph))`（`:483-486`），再 `+ (1.0,1.0)`（`:487`），累加进 `uVar17`（`:488`）。
  `FUN_00320508` = `glyph[2]`（双 float 推进量）+ 上一字形存在且 `glyph[1]`、`glyph[0x12]` 相同时的 `FUN_0031e9b0` 字距（`font_raster_layout.txt:660-675`）。
- 断行判定：累加宽度 `uVar17 <= maxWidth` 持续（`:491`）；`maxWidth == -1` 表示不限宽（同一条）。
- 显式换行：字符 `10` (`\n`) 单独分支（`:471-478`）。
- 空格族：`0x09..0x20` 中掩码 `0x800011` 命中的字符、`0x200b`（零宽空格）、`0x3000`（表意空格）参与「可断点」标记（`:453-469`）。
- 返回：剩余文本写回 `param_3`、`*param_7 = 高度`、`*param_8 = 是否截断`、`*param_9 = 本行字符数`（`:519-586`）；一个字都放不下时把输出串赋成 `0x460ee8`（`:587`）。
- 行迭代外壳 `FUN_00321920`：反复调 `FUN_0031b8fc` 直到串空，每行把宽度推进 vector `param_6`、把累计字符数推进 `param_7`（`font_mesh_construction.txt:33-96`）。

### 2.3 maxLines / 自动缩字号

- 行数上限取 `this+0x2c`，小于 1 时按 999999 处理（`font_raster_layout.txt:400-403`）。
- 缩字号主循环 `FUN_00320a28`：每轮以 `(this+0x54, 当前字号, text, this+0x48, 宽度实参, …)` 调 `FUN_00321920`，用「行数 ≤ 上限 且 未截断」判定成功；否则字号 **-1.0** 后重排，直到成功或字号 `<= 5.0`（`font_raster_layout.txt:404-420`）。宽度实参在 `this+0x30 != 0` 时传 `-1`（不限宽），否则取 `this+0x24`（`:405-409`）。
- 高度受限缩字 `FUN_00322624`：以 1.0 步长减字号，按 `行数*字号 + (行数-1)*verticalSpacing` 与 `+0x28`（高度）比较，下限 `6.0`（`text_component_update_flags.txt:110-127`）。
- 另一条缩字路径 `FUN_00321aa0`：从候选字号向后扫描，逐次调用 `FUN_00321920`，直到放得下或字号 `<= 5.0`（`font_mesh_construction.txt:110-154`）。
- `FUN_003226f0` 把排版对象 `+0x30` 置 1 = 关闭换行（`text_component_update_flags.txt:138-151`，调用点 `component_text_font_path.txt:156-158`）。

### 2.4 对齐与基线

- 对齐不是一个枚举，而是位掩码 `+0x7bc`（构造 `0xf`，`component_text_constructor.txt:96`）：
  - 归一化：`alignToFontMeshBounds == 0` 时 `flags = (flags & ~0x4c) | 0x40`（`component_text_font_path.txt:102-107`）。
  - 水平：`flags & 0xc`；`0x20` 视为居中；`0x8` 右、`0x4` 左（`component_text_font_path.txt:92-99` 的 `uVar6 = uVar3&0xc; if(uVar3==0x20) uVar6=0xc;`；`font_metrics_core.txt:275-316` 的三分支）。
  - 垂直：`flags & 3`，值 2/3 时按字形包围盒宽高做半宽/半高修正（`font_metrics_core.txt:330-361`）。
- 每字形定位 `FUN_00320ed8`：先把行内所有字形按 `maxGlyphWidth/2` 归心（`:196-205`），再按分支给每个字形写 `+0x10`（行内 x）与 `+0xc`（行内 y）；随后统一加对象 `+0x10`/`+0x14`（外部偏移，`:380-394`），最后 `FPToFixed(...,3)` 量化为定点（`:395-410`）。
- 全局反向标志：`FUN_0031fa44()+0x21` 非 0 时，把整行 x 收集成临时数组再倒序写回（`:412-450`）——镜像/RTL 排布只在这里出现。
- 对齐名字符串表（`0x470c80`）：`Bounce / Top / Left / Right / Bottom / TopLeft / TopRight / BottomLeft / BottomRight / Fill`（`build_logs/alignment_enum_data.txt:5`，`TopLeft` 地址 `0x470c9d` 见 `text_alignment_strings.txt:3-4`）。**字符串→掩码的转换函数未导出。**
- 行高 / 基线：**未导出**。语料只给出「每字符累加 `fontSize*faceScale + advance + 1.0`」与全局常量 `+0x140`（`font_engine_real.txt:423`），没有独立的行高、ascent/descent 或基线公式。

### 2.5 描边 / 阴影是否参与布局

- 不参与。笔画与阴影不是改字形轮廓，而是**同一段文字的多份独立图层**：
  `FUN_00322adc`（22 个参数，1171B）按传入的 (size, colour) 对各 `operator_new(0x7c)` 一个图层对象，挂在 0xf4B 排版对象上：
  `+0x18`（`font_engine_real.txt:241-274`，仅当 size>0 且该分支标志为 0）、`+0x1c`（`:275-292`）、`+0x20`（主层，带 `+0x38/+0x3c` 纹理参数，`:293-303`）、`+0x24`（`:304-317`）、`+0x28`/`+0x2c`（同一组参数的两份，`:318-343`）。
  哪个槽对应 stroke / softShadow / innerGlow 只能由实参顺序 `[推断]`，语料未给出符号级对应。
- 图层参数从组件属性直传：`FUN_003cff24` 把 strokeSize/strokeColour/softShadowSize/softShadowColour/innerGlowSize/innerGlowColour 等塞进 `FUN_00322a40(...)` 的 22 个实参（`component_text_font_path.txt:321-366`）。
- 阴影的位移发生在**顶点阶段**：复制一份顶点数组，逐顶点加 `softShadowOffset` 的 `(x,y)`，再整体变换（`component_text_rebuild.txt:104-125`）。
- 是否建阴影 mesh 有阈值：`DAT_003d11f4 <= softShadowSize` 才建（`component_text_rebuild.txt:136-150`）。`DAT_003d11f4` 的值未导出。
- 半径（圆弧）排版走另一支：`radius != 0` 时 `FUN_003cff24` 先以 `0xffffffff`（不换行）调 `FUN_0031b8fc` 量出整串宽度，再用 `MaxArcDegrees * DAT_003d02c0 * (-radius)` 得到弧长；宽度超弧长时按比例缩小字号（`component_text_font_path.txt:263-291`）。**圆弧上每个字形的坐标公式未导出。**

---

## 3. 光栅化

### 3.1 字形来源：运行时解析 TTF（FreeType 形态）

- 字体面构造 `FUN_0031dbc0`（`font_raster_layout.txt:62-185`）：
  1. 取字体路径字符串，`_strncpy(obj+3, path, 0x100)`（`:123`）。
  2. `FUN_002f49fc / FUN_002f4aa8 / FUN_002f4c04 / FUN_002f4c08` = 打开文件 / 判存在 / 取长度 / 取数据指针（`:125-136`）。
  3. `memcpy` 到新缓冲区后 `FUN_003f8b24(library, bytes, size, 0, &obj+0x120)` 建面，随后释放缓冲区（`:133-150`）。
  4. 选面：遍历 `face+0x28` 数组，找 `*(short*)(x+8)==3 && ushort(x+10)==1`，再 `FUN_003f967c(face, 该面)`（`:152-168`）。
  5. 内容缩放：`face+0xc > 0` 时 `+0x180 = s`、`+0x184 = 1/s`（`:170-176`）。
- 字形加载 `FUN_0031e178`（`font_mesh_construction.txt:259-329`）：
  `FUN_0031ddf8`（设字号）→ `FUN_003f84e4(face, {0x10000,0,0,0x10000}, {0,0})`（16.16 单位矩阵 + 零平移）→ `FUN_003f74e0(face, glyphIndex, 4)`（`:288-299`）→ 读 glyph slot（`face+0x54`）的 `+0x40`、`+0x1c`、`+0x24`、`+0x4c`、`+0x50`、`+100`（`:300-315`）。
- 字距：`FUN_0031e9b0` → `FUN_003f86b4`（两字符取 index）+ `FUN_003f9540(face, l, r, 0, out)`（`font_mesh_construction.txt:342-379`）。
- 这组 `(face, glyphIndex, load_flags=4, matrix, delta)` 的形态与 FreeType 的 `FT_New_Memory_Face / FT_Get_Char_Index / FT_Load_Glyph / FT_Set_Transform / FT_Get_Kerning` 一一对应 `[推断]`；
  发行二进制里确有 FreeType 的 BDF 驱动错误串（`_bdf_parse_glyphs`、`bdf_load_font`，`shared_context/findings/mode_related_strings_exe.txt:54-62`），说明引擎静态链入了 FreeType 字体库。
  是否走 TrueType 驱动而非位图字体，直接证据只有资源本身是 `*.ttf`（默认 `fontstruetype/bronic.ttf`）`[推断]`。

### 3.2 图集 vs 每字形 mesh

- **两者都有**：
  - 每个字体面持有 **256×256** 的位图尺寸：`FUN_0031dba4(obj, path, &fontSystem, 0x100, 0x100)`（`font_metrics_core.txt:95-98`），存入 `face+0x104/+0x108`（`font_raster_layout.txt:115-116`）。
  - 每个字形在面内有一个 **0x30 字节** 缓存节点（`FUN_00321358` 建，`font_engine_real.txt:606-649`），每字形再 `operator_new(0x4c)` 一个四边形对象（`font_mesh_construction.txt:316`），由 `FUN_003204c0(uvScale, out, engine, ch, size, &uvDelta, &origin)` 填充（`:316-327`，函数体未导出，65B）。
  - 放置后的每字形实例是 **0x40 字节** 记录：`+0x0c` = 行内 y、`+0x10` = 行内 x、`+0x20` = 包围盒指针（`font_raster_layout.txt:431` 的 `operator_new(0x40)`；`font_metrics_core.txt:194-199,271,297` 的 `+0xc/+0x10/+0x20` 读写）。
  - 整段文字最终合成**一个大顶点数组**（组件 `+0x784`，元素 0x30B），每字形 4 个顶点。
- UV：`(w,h,?) = (1.0,1.0)` 或空字形时为 `(1.0,0.0)`（`font_mesh_construction.txt:291-312`）；glyph 宽高字段 `+0x4c/+0x50` 为 0 时退化。

### 3.3 缓存策略

| 层级 | 键 | 证据 |
|---|---|---|
| 字体面 | 组件 `+0x1c0` 的 map，键 = 字体路径 std::string | `font_metrics_core.txt:92-101` |
| 字形 | 面对象内的 map（`FUN_00320018` 查 / `FUN_00320024` 建），0x30B 条目 | `font_raster_layout.txt:25-26,99-102`；`font_engine_real.txt:606-649` |
| 排版结果 | 组件 `+0x740` 对象；脏标志触发整体重建 | `component_text_font_path.txt:33-44` |

- 字形缓存条目 0x30B 的初始化：`self[2..6]=0, self[0]=0, self[3]=self[1]=self+4, self[8..0xb]=0, self[9]=self[10]=self+7`（`font_engine_real.txt:625-644`）——即两个空链表头 `+0x1c` 与 `+0x38` `[推断]`。
- 缓存没有任何 LRU/上限代码出现在已导出函数里；只有析构时整条释放（`font_engine_real.txt:504-517`、`:606-649`）。

---

## 4. 提交渲染

### 4.1 入口

`ComponentText` 虚表 `0x542c78` 的槽位（`build_logs/component_text_vtable.txt:5`，地址已去 Thumb 位）：

| 槽 | 偏移 | 函数 | 用途 |
|---|---|---|---|
| 9 | `+0x24` | `0x3d9e6c` | 取顶点 vector（`component_text_rebuild.txt:70-75`） |
| 13 | `+0x34` | `0x3d0f44` | 脏检查 / 触发重建（`component_text_methods.txt:13-40`） |
| 14 | `+0x38` | `0x3d14b0` | **绘制提交**（`component_text_methods.txt:53-256`） |
| 35 | `+0x8c` | `0x3d02cc` | 属性变更（`component_text_methods.txt:340-512`） |
| 44 | `+0xb0` | `0x3d078c` | 取显示文本（含本地化）（`:525-623`） |

### 4.2 顶点与批次

- 顶点步长 **0x30 字节 / 12 dword**（`font_engine_real.txt:819,872`、`font_draw_functions.txt:184-186`）。
- 文字顶点布局：`+0x00/+0x04` = UV，`+0x28/+0x2c` = 屏幕 x/y，其余 8 个 dword 由字形构造时写入（颜色）[推断]。
  依据：普通 quad 通道在 `+0x00/+0x04` 写 UV、`+0x28/+0x2c` 写位置（`font_draw_functions.txt:168-175,187-193`），顶点变换函数 `FUN_003d1bfc` 只改 `[0..2]`、原样拷贝 `[3..0xb]`（`font_engine_real.txt:874-894`）。
- 一个组件 = 一个顶点数组（`+0x784`）+ 一个阴影数组（`+0x794`），不是每字形一次 draw call（`component_text_rebuild.txt:99-125`）。

### 4.3 两条绘制支路

`FUN_003d14b0` 依 `+0x740`（排版对象）是否为空分流：

- **支路 A（`+0x740 == 0`，用 `+0x784/-0x794` 预烘焙 mesh）**
  `FUN_00323130(mesh)` →（若节点 `+0x48` 非 0）`FUN_00323208(mesh, this+0x788)` → `FUN_003234c4(mesh, &origin, &rect, 5)`
  （`component_text_methods.txt:119-166`）。
- **支路 B（`+0x740 != 0`，文字对象自绘）**
  `FUN_003d13fc(&vec, this)` 先把局部原点用组件变换矩阵变换（`component_text_rebuild.txt:495-548`），再把矩阵各分量整块拷到栈上，最后 `FUN_00321f14(vec, textObj, &matrix)`（`component_text_methods.txt:169-193`）。

### 4.4 与 UIScreen quad 通道的关系

- **不是同一条函数路径。** 普通组件走 `FUN_003d6acc`：4 顶点 × 0x30B，UV/位置写 `+0x00/+0x04/+0x28/+0x2c`，颜色从模板 `PTR_DAT_004d9e2c` 整块拷贝（`font_draw_functions.txt:63-193`）。文字走 `FUN_00321f14` / `FUN_003234c4`，顶点由字形构造器 `FUN_003204c0` 产生。
- **但共用同一套顶点格式与同一张纹理单元语义**（0x30B、UV 在前、位置在后）`[推断]`；两者都在结束时把全局矩阵块写回单位矩阵：`PTR_DAT_004d904c + 0x1094..0x10d0` 与 `+0x1894..0x18d4` 被填入 `DAT_0052be20..be5c`（单位矩阵，`font_property_initializers.txt:112-129`），并把 `+0x18d4` 计数器 +1（`component_text_methods.txt:194-253`）。
- 混合状态（blend func / 采样 / 深度）在已导出语料中**完全没有出现**——未导出。

---

## 5. 语料完整性（截断与覆盖）

- 15 份输入全部首行标注「完整反编译导出（无截断）」；逐份核对末块均以三个反引号正常闭合、函数头（名字/字节数/调用者计数）齐全，**没有任何一份被导出上限截断**。
- 但存在**覆盖缺口与重复**，必须当成缺口而不是结论：
  1. `build_logs/text_render_methods.txt` 名为「渲染方法」，实际内容是 Console 组件的 UI 装配（`FUN_003c2b44` 等），**没有一行绘制提交代码**。
  2. `build_logs/text_component_core.txt` 与 `text_render_methods.txt` 重复导出同一批函数（`FUN_003c2b44`、`FUN_003c3884`、`FUN_003c3334` 全文重复）。
  3. 两份「属性」文件不是反编译：`font_property_references.txt` 只有 4 组全局地址交叉引用，`font_property_strings.txt` 只有字符串地址与计数。
  4. 关键函数只有调用点、没有函数体（见第 6 节）。
  5. `text_component_core.txt` 整篇属于另一个类（虚表 `0x542808`，Console），其 `0x73c..0x760` 与 ComponentText 的 `0x740/0x7a4` 同名不同义，易被误读。

---

## 6. 未知清单与 Ghidra 导出目标

### 6.1 必须补导出的函数（地址取自 `shared_context/findings/macho_function_inventory.txt`）

| 地址 | 字节 | 缺什么 | 建议导出范围 |
|---|---|---|---|
| `0x00321f14` | 351 | 文字对象真正的 draw 提交（支路 B 唯一出口） | 0x00321f14–0x00322074 |
| `0x003234c4` | 247 | 预烘焙 mesh 的 draw 提交（支路 A） | 0x003234c4–0x003235bc |
| `0x00323130` | 67 | mesh 绑定/前置状态 | 0x00323130–0x00323174 |
| `0x00323208` | 113 | mesh 顶点子区间/材质参数 | 0x00323208–0x0032327c |
| `0x003204c0` | 65 | 单字形 4 顶点构造（UV/颜色/位置来源） | 0x003204c0–0x00320504 |
| `0x0031ddf8` | 115 | 字形尺寸设定（含 16.16 换算） | 0x0031ddf8–0x0031de70 |
| `0x003214b0` | 73 | setStroke(size, colour) | 0x003214b0–0x003214fc |
| `0x00321420` | 141 | setShadow(size, colour, offset) | 0x00321420–0x003214b0 |
| `0x003214fc` | 61 | setGlow(size, colour) | 0x003214fc–0x0032153c |
| `0x00321600` | 191 | bevel 参数打包 | 0x00321600–0x003216c0 |
| `0x0032233c`/`0x0032236c` | 45/13 | 文本宽度 / 行高读数 | 0x0032233c–0x0032237c |
| `0x0031fcf4` | 125 | 按路径取/建字体面 | 0x0031fcf4–0x0031fd74 |
| `0x003199a4` | 29 | 排版对象首次构建 | 0x003199a4–0x003199c4 |
| `0x003f8b24` | 49 | 从内存字节建字体面 | 0x003f8b24–0x003f8b58 |
| `0x003f86b4` | 29 | char → glyph index | 0x003f86b4–0x003f86d4 |
| `0x003f9540` | 189 | 字距查询 | 0x003f9540–0x003f9600 |
| `0x003f74e0` | 941 | 字形加载/栅格化（load_flags=4） | 0x003f74e0–0x003f7890 |
| `0x003f967c` | 69 | 选面/设尺寸 | 0x003f967c–0x003f96c4 |
| `0x003f84e4` | 147 | 变换矩阵设置 | 0x003f84e4–0x003f8578 |
| `0x003f8b58` | 253 | 面对象上的字号/度量读取（用途待确认） | 0x003f8b58–0x003f8c58 |

### 6.2 必须补导出的数据

1. **对齐字符串 → 位掩码的转换**：`0x470c80` 表（10 个名字）的交叉引用；`alignment` 节点 `+0x83c` 的读者。
2. `DAT_003d11f4`（阴影 mesh 阈值）、`DAT_003d02c0`（圆弧常量）、`DAT_0031e2b8/0x0031e2c0`（字形度量缩放）、`DAT_003d11f4` 的实际浮点值。
3. `FUN_0031fa44()+0x140`（加进字号的全局偏移）与 `+0x10`、`+0x13c`、`+0x21` 三个全局字段的写入点。
4. `FUN_0031dbc0+0x158` 的 id 计数器语义、`+0x130` 的用途。
5. `+0x848` 那个未命名属性（`DAT_00604858`，字符串 `0x47054f`）的真实名字。
6. **未闭合的语义冲突**：`FUN_003216c0` 把值写进文字对象 `+0x48`（`text_component_update_flags.txt:79-84`），而构造函数在 `FUN_0031984c:212` 把 `+0x48` 写成字体指针、`:222` 又把它当指针解引用 `+0x184`。两处必有一处偏移读错，需对照 `0x0031984c+` 与 `0x003216c0` 的原始汇编复核。

### 6.3 仍未闭合的行为

- 行高、ascent/descent、基线的确切公式（只有逐字符累加与一个全局偏移）。
- 混合模式 / 采样状态 / 绘制顺序。
- 圆弧文本（`radius != 0`）的坐标公式。
- 字形图集的打包方式（256×256 内如何排布、何时换页）——语料只有"存在 256×256"这一条。
- 本地化取词失败时的两处兜底串 `"STRING NOT FOUND"`、`"!! WRONG TABLE !!"`（`component_text_methods.txt:604-607`）与真机文案的对应关系。
