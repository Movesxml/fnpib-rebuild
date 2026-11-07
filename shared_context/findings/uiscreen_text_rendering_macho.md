# UIScreen 文字渲染（ComponentText / 字体引擎）：Mach-O 证据

范围：原始 ARMv7 发售版 `FruitNinjaPuss` 的 `ComponentText` 组件、字体面（TTF）加载、字形栅格化、行布局与文字 mesh 提交。 只记录已导出语料能直接指到的东西；推断一律标 `[推断]`，无证据写「未导出」。

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
- 构造入口先写死一批字段（`component_text_constructor.txt:73-98`）：`+0x73c`(=`this[0x1cf]`)=`0xf`（`:96`）；`+0x744` 空 std::string（`:75`）；`+0x784`/`+0x794` 两个 vector 容量 4（`:76-77`）；`+0x7d8` 空 std::string（`:93`）。
- 默认字体：启动函数 `FUN_0001dde4` 在 `~iPhone` 布局加载成功后调 `FUN_00023758(ui,"ComponentText","fontName","fontstruetype/bronic.ttf")`（`font_property_initializers.txt:333-340`）；该函数按属性类型 `*(node+0x8c)` 分派，case 2 = string 写 `+0x90`（`font_default_setter.txt:76-87`）。
- 另一处易混：`FUN_003c2818`（虚表 `0x542808`）的 `fontSize` 默认 10.0、`maxLines` 默认 300（`font_property_initializers.txt:218-226`、`:193`），但**它不是 ComponentText**：其 `+0x73c..+0x758` 是 7 个 UI 子组件指针（console/consoleBg/consoleOutput/consoleInputBg/consoleInput/consoleEnterBtn/debugTextComponent，`text_component_core.txt:265,323,387,457,521,588,649`）；引用这两个默认值会得到与原版相反的结论。

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
| `+0x73c` | 排版位标志位掩码（构造 `0xf`；旧记 `+0x7bc` 无读写点） | :96 |
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
- 字符推进：`advance = fontSize*faceScale + glyph[2] + kerning`；`uVar18 = FixedToFP(param_5) * *(font+0x184)`（`font_engine_real.txt:423-432`），每字符 `uVar12 = FloatVectorAdd(uVar18, FUN_00320508(glyph, prevGlyph))`（`:483-486`）+ `(1.0,1.0)`（`:487`）累加进 `uVar17`（`:488`）。
  `FUN_00320508` = `glyph[2]`（双 float 推进量）+ 上一字形存在且 `glyph[1]`、`glyph[0x12]` 相同时的 `FUN_0031e9b0` 字距（`font_raster_layout.txt:660-675`）。
- 断行判定：累加宽度 `uVar17 <= maxWidth` 持续（`:491`）；`maxWidth == -1` 表示不限宽（同一条）。
- 显式换行：字符 `10` (`\n`) 单独分支（`:471-478`）。
- 空格族：`0x09..0x20` 中掩码 `0x800011` 命中的字符、`0x200b`（零宽空格）、`0x3000`（表意空格）参与「可断点」标记（`:453-469`）。
- 返回：剩余文本写回 `param_3`、`*param_7`=高度、`*param_8`=是否截断、`*param_9`=本行字符数（`:519-586`）；一个字都放不下时输出串赋 `0x460ee8`（`:587`）。行迭代外壳 `FUN_00321920` 反复调 `FUN_0031b8fc` 直到串空，每行把该行串推进 vector `+0xcc`、把累计字符数推进 `+0xe8`（`font_mesh_construction.txt:33-96`；t089:60-63）。

### 2.3 maxLines / 自动缩字号
- 行数上限取 `this+0x2c`，小于 1 时按 999999 处理（`font_raster_layout.txt:400-403`）。
- 缩字号主循环 `FUN_00320a28`：每轮以 `(this+0x54, 当前字号, text, this+0x48, 宽度实参, …)` 调 `FUN_00321920`，用「行数 ≤ 上限 且 未截断」判定成功；否则字号 **-1.0** 后重排，直到成功或字号 `<= 5.0`（`font_raster_layout.txt:404-420`）。宽度实参在 `this+0x30 != 0` 时传 `-1`（不限宽），否则取 `this+0x24`（`:405-409`）。
- 高度受限缩字 `FUN_00322624`：以 1.0 步长减字号，按 `行数*字号 + (行数-1)*verticalSpacing` 与 `+0x28`（高度）比较，下限 `6.0`（`text_component_update_flags.txt:110-127`）。
- 另一条缩字路径 `FUN_00321aa0`：从候选字号向后扫描，逐次调用 `FUN_00321920`，直到放得下或字号 `<= 5.0`（`font_mesh_construction.txt:110-154`）。
- `FUN_003226f0` 把排版对象 `+0x30` 置 1 = 关闭换行（`text_component_update_flags.txt:138-151`，调用点 `component_text_font_path.txt:156-158`）。

### 2.4 对齐与基线
- 对齐不是枚举，而是掩码 **`+0x73c`**（构造 `0xf`，`component_text_constructor.txt:96`；旧记 `+0x7bc` 至今无读写点，见 §4.9 末条）：
  - 归一化：`alignToFontMeshBounds(+0x878) == 0` → `flags = (flags & ~0x4c) | 0x40`（`component_text_font_path.txt:105-107`），默认 `0x0f` 归一化为 **`0x43`**。
  - 传入：`+0x73c` 先抄到 `this+0x778`（`:92-93`），作第 6 实参建排版对象（`:120,124`），落 `+0x34`（`font_raster_layout.txt:280`）。
  - **落点（订正）**：`flags & 3` 决定 **x**，写 0x40 记录 `+0xc`（t089:298-347）；`0x4/0x8/0xc/0x40` 决定 **y**，写 `+0x10`（t089:192-297）。据 `FUN_00323208`：`x = -(层+0x00) - 记录+0xc`、`y = 记录+0x10`（`t084_text_mesh_full.txt:809-816`）⇒ 旧文「`+0x10`=行内 x、`+0x0c`=行内 y」与 §4.9「0xc 水平 / 0x3 垂直」**反了**；§3.2、§4.5-2 同步订正。
  - x 三分支（`&3`，W=`+0x24`）：`0/1` → 0；`2` → `W - abs(m2-m0)`；`3` → `W/2 - abs(m2-m0)/2`；`0x20` 命中时改写为 `W - abs(m2-m0)`（装不下）或 `0`（t089:308-345）。
  - y 分支见 §2.6 的表。
- 坐标收尾：先加外部偏移（`+0xc += this+0x10`、`+0x10 += this+0x14`，t089:354-361），再 `FPToFixed(...,3)`+`FixedToFP` 量化（t089:368-376）。
- 全局反向：`FUN_0031fa44()+0x21 != 0` 时把**全部行记录**的 `+0x10`（=y）取值倒序写回（t089:380-418）——**不是 x 倒序**；该字节在字体系统 ctor 里置 0（`t087_module_dump.txt:9417`），无其它写点，语义**未导出**。
- 对齐名字符串表（`0x470c80`）：`Bounce/Top/Left/Right/Bottom/TopLeft/TopRight/BottomLeft/BottomRight/Fill`（`alignment_enum_data.txt:5`，`TopLeft`=`0x470c9d`，`text_alignment_strings.txt:3-4`）。**字符串→掩码的转换函数未导出**（§4.9）。
- 行高 / 基线：原「**未导出**」结论**作废**，见 §2.6。

### 2.5 描边 / 阴影是否参与布局
- 不参与。笔画与阴影不是改字形轮廓，而是**同一段文字的多份独立图层**：
  `FUN_00322adc`（22 个参数，1171B）按传入的 (size, colour) 对各 `operator_new(0x7c)` 一个图层对象，挂在 0xf4B 排版对象上： `+0x18`（`font_engine_real.txt:241-274`，仅当 size>0 且该分支标志为 0）、`+0x1c`（`:275-292`）、`+0x20`（主层，带 `+0x38/+0x3c` 纹理参数，`:293-303`）、`+0x24`（`:304-317`）、`+0x28`/`+0x2c`（同一组参数的两份，`:318-343`）。 哪个槽对应 stroke / softShadow / innerGlow 只能由实参顺序 `[推断]`，语料未给出符号级对应。
- 图层参数从组件属性直传：`FUN_003cff24` 把 strokeSize/strokeColour/softShadowSize/softShadowColour/innerGlowSize/innerGlowColour 等塞进 `FUN_00322a40(...)` 的 22 个实参（`component_text_font_path.txt:321-366`）。
- 阴影的位移发生在**顶点阶段**：复制一份顶点数组，逐顶点加 `softShadowOffset` 的 `(x,y)`，再整体变换（`component_text_rebuild.txt:104-125`）。
- 是否建阴影 mesh 有阈值：`DAT_003d11f4 <= softShadowSize` 才建（`component_text_rebuild.txt:136-150`）。`DAT_003d11f4` 的值未导出。
- 半径（圆弧）排版走另一支：`radius != 0` 时 `FUN_003cff24` 先以 `0xffffffff`（不换行）调 `FUN_0031b8fc` 量出整串宽度，再用 `MaxArcDegrees * DAT_003d02c0 * (-radius)` 得到弧长；宽度超弧长时按比例缩小字号（`component_text_font_path.txt:263-291`）。**圆弧上每个字形的坐标公式未导出。**

### 2.6 行高与基线（t089 全导出，2026-11-08）
**行高**：没有独立行高字段；行距 = 字号 + `verticalSpacing`，在 `FUN_00320ed8` 开头算一次（t089:144-155,189）。
- `V = *(int*)(this+0x4c)` = `verticalSpacing`（`+0x7f8`，int，默认 1；ctor `font_raster_layout.txt:285`，实参 `component_text_font_path.txt:98-101,117-120`）；`S = *(f32*)(this+0x50)` = 请求字号（`+0x7e8`）；`s = *(f32*)(this+0xd8)` = 本次实际字号（`font_raster_layout.txt:399,419`；t089:447,476）。
- `pitch = (int)( s + V + 0.5*(s - S) )`（t089:146-155 的运算顺序；`0xbf000000` = −0.5f）：`s == S`（未缩字）⇒ **pitch = 字号 + verticalSpacing**，V 缺省 1 ⇒ 行高 ≈ 字号 + 1px；缩字时 `0.5*(s-S)` 是半差补偿。
- **方向已定案**（`build_logs/t090_pitch_asm.txt:12-21`）：`vsub d18,d2,d0` 得 `S−s`，乘 `−0.5f` 得 `0.5(s−S)`，加 `float(V)`、再加 `s0=s`，末尾 `vcvt.s32.f32`（:57）截断 ⇒ 公式确为 `(int)(s + V + 0.5*(s−S))`，原 `[推断]` 撤销。
- 佐证：限高缩字 `FUN_00322624` 以 `总高 = 行数*字号 + (行数-1)*V` 与 `+0x28` 比（t089:510-518），与该式一致。
- **ascent/descent/lineGap 不参与**：全链无字体度量读取；只有 face `+0x184/+0x180` 缩放与逐字推进 `(实参 + fontSystem+0x140) × face+0x184 + glyph[2] + 1.0`（t089:784-849），与行高/基线无关。

**基线**：单行内没有基线量。`+0x10` 只把该行各层 mesh 平移到行位（字形 pen 已烘在 mesh 里，§4.11.3），纵向对齐全用**主层 mesh 包围盒** 4 个 int（层 `+0x00/+0x04/+0x08/+0x0c` = x0,y0,x1,y1 `[推断]`；`FUN_0031984c` 不初始化这 12 字节，`font_mesh_construction.txt:185-203`，写入者在 `FUN_003199a4` 链里、**未导出** `[推断]`）。判定"哪个 pass 是水平"的关键：`+0x24` = 宽度上限（作 `FUN_0031b8fc` 的 maxWidth，`font_raster_layout.txt:409-413`），`+0x28` = 高度上限（t089:513-518；ctor 写入 `font_raster_layout.txt:281-282`）。

| 掩码/情形 | y 表达式（t089 行号；H=`+0x28`，m1=`层+0x04`，m3=`层+0x0c`，h=abs(m3-m1)） |
|---|---|
| `0x40` 置位 | `y_k = -s - k*pitch`（:286-296；s 取 `+0xd8` 整数值） |
| `0x40` 清、`0x8` 清 | 首行 `-m1`（仅当 `this+0xe0≠0`），否则 `y_k = -(k+0.5)*pitch - m3 - h/2`（:243-267） |
| `0x40` 清、`0xc==0xc` 或 `0x20` 置位、单行 | `+0x21==0`：`y = m3/2 - m1 - (H-h)/2`（:199-217）；否则 `y = -(H+s+4.0)/2`（:218-228，4.0f=`0x40800000`） |
| 同上、多行 | `maxH = max(h)`；`y_0 = -(maxH/2) + n*pitch/2 - H/2 - pitch/2`，`y_k = y_0 - k*pitch`（:162-173,230-241；:174-187 的取 min 循环初值 0 且严格小于 ⇒ 恒 0，死代码） |
| `0x40` 清、`0x8` 置、非 `0xc` | `y_0 = -(H+m3)`，`y_k = y_0 + k*pitch`（:269-284） |

- 唯一近似"字体度量"的只有单行镜像支路的 **4.0f**；其余全来自 mesh 包围盒与 s。要真基线只能取 mesh 自身坐标（`FUN_0031ae00` 的 pen，§4.11.3）。
- `this+0xe0` 在排版对象构造后由 `FUN_003cfc24` 置 1（`component_text_font_path.txt:127`），故首行默认走 `-m1`。
- 仍未导出：`FPToFixed(...,3)` 的定点刻度（取整 / 1/8）与 `FloatVectorSub` 方向 → `Disassemble 0x00320ed8:0x90`；层 `+0x00..+0x0c` 写入者 → 导出 `0x00319b24`(111B)、`0x0031b190`(197B)；`+0x21` 语义 → 目前只知 ctor 置 0（`t087_module_dump.txt:9417`）。
- 位→轴映射 `[推断]`：`0x1`/`0x2` = 横向左/右（`0x3` = 居中，实测 `&3`：0/1→左、2→右、3→中）；`0x4`/`0x8` = 纵向上/下（`0xc` = 居中）。与 §4.9 旧标签相反；字符串→掩码的转换仍未导出（§4.9）。

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
  发行二进制里确有 FreeType 的 BDF 驱动错误串（`_bdf_parse_glyphs`、`bdf_load_font`，`shared_context/findings/mode_related_strings_exe.txt:54-62`），说明引擎静态链入了 FreeType 字体库。 是否走 TrueType 驱动而非位图字体，直接证据只有资源本身是 `*.ttf`（默认 `fontstruetype/bronic.ttf`）`[推断]`。

### 3.2 图集 vs 每字形 mesh
- **两者都有**：
  - 每个字体面持有 **256×256** 的位图尺寸：`FUN_0031dba4(obj, path, &fontSystem, 0x100, 0x100)`（`font_metrics_core.txt:95-98`），存入 `face+0x104/+0x108`（`font_raster_layout.txt:115-116`）。
  - 每个字形在面内有一个 **0x30 字节** 缓存节点（`FUN_00321358` 建，`font_engine_real.txt:606-649`），每字形再 `operator_new(0x4c)` 一个四边形对象（`font_mesh_construction.txt:316`），由 `FUN_003204c0(uvScale, out, engine, ch, size, &uvDelta, &origin)` 填充（`:316-327`，函数体未导出，65B）。
  - 放置后的每字形实例是 **0x40 字节** 记录：`+0x0c` = 行内 x、`+0x10` = 行内 y（订正：§2.4）、`+0x20` = 包围盒指针（`font_raster_layout.txt:431` 的 `operator_new(0x40)`；`font_metrics_core.txt:194-199,271,297` 的 `+0xc/+0x10/+0x20` 读写）。
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

### 3.4 字体库五个入口的职责（本轮闭合）
| 地址 | 字节 | 反编译里直接做了什么 | FreeType 对应 `[推断]` | 证据 |
|---|---|---|---|---|
| `0x003f8b24` | 49 | 组 `{1, base, size, 0}` 调 `0x003f86d4`；`base==0` 直接返回 6 | `FT_Open_Face`，flags 1 = `FT_OPEN_MEMORY` | t082_text_render_full.txt:395-403 |
| `0x003f86b4` | 29 | 取 `face+0x5c`(charmap)，空返回 0，否则调 `charmap->clazz(+0xc)->+0xc(charmap, ch)` | `FT_Get_Char_Index` | :423-430 |
| `0x003f967c` | 69 | 在 `face+0x28` 数组（长度 `face+0x24`）里找 charmap，命中写回 `face+0x5c`，否则返回 6 | `FT_Set_Charmap` | :726-743 |
| `0x003f74e0` | 941 | 校验 face/`+0x58`(size)/`+0x54`(slot)，清 slot，经 `*(face+0x60)+0x14` 的 `+0x50` 方法加载，按 `slot+0x48` 分派格式，末段按 flags 取 render_mode 调 `0x003f8694` | `FT_Load_Glyph` | :521-704 |
| `0x003f9540` | 189 | 经 `*(face+0x60)+0x14` 的 `+0x54` 方法取 `(face,l,r,&v)`，再用 `size+0x10/+0x14` 缩放、ppem<25 修正、`(v+0x20)&~0x3f` 对齐 | `FT_Get_Kerning` | :455-486 |

- **硬证据**：`0x003f74e0` 直接拿 `slot+0x48` 与 `0x6f75746c`(`'outl'`)、`0x62697473`(`'bits'`)、`0x636f6d70`(`'comp'`) 比较（t082:579、:642、:695；重复导出于 text_internal_objects.txt:155,218,271）；`0x10` 为纵向排布时 `advance.y` 取 vertAdvance（t082:651-658）；`1`(NO_SCALE) 被改写成 `|0xa`（:569-571）；`0x800`(IGNORE_TRANSFORM) 跳过 transform（:666）。
- **调用顺序**：建面 `FUN_0031dbc0 → 0x003f8b24`（font_raster_layout.txt:141）→ 选 (platform 3, encoding 1) charmap `0x003f967c`（:152-168）→ 取字形 `FUN_0031e0b8 → 0x003f86b4`（找不到就换 fallback face，:29-44）→ `0x003f84e4` 16.16 单位阵 → `0x003f74e0(face,index,4)`（font_mesh_construction.txt:297-299）→ 字距 `FUN_0031e9b0 → 0x003f86b4 ×2 → 0x003f9540(face,l,r,0,&v)`（:357-359）。

### 3.5 字形位图格式 / 行跨度 / 缓存键
- **格式**：`FUN_0031e178` 传 load_flags = **4** = `FT_LOAD_RENDER`（font_mesh_construction.txt:299）。`0x003f74e0` 末尾取 `render_mode=(flags&0xfffff)>>0x10`，`FT_LOAD_MONOCHROME(0x1000)` 时把 0 改成 2，再调 `0x003f8694(slot,mode)`（t082:695-701）。mode 0 = `FT_RENDER_MODE_NORMAL` → **8bit 灰度、256 级、1 字节/像素** `[推断]`（导出里没有读 `slot+0x5e` 的代码，灰度是按 FreeType 默认渲染模式推的）。
- **行跨度**：`slot+0x54` = `FT_Bitmap.pitch`；数据 `+0x58`、宽 `+0x50`、高 `+0x4c`、`pixel_mode +0x5e`、`num_grays +0x5c`。`FUN_0031e178` 只读 `+0x4c/+0x50/+0x24/+0x1c/+0x40/+0x64`（font_mesh_construction.txt:300-305）。**把 buffer/pitch 上传成纹理的函数本轮仍未导出。**
- **缓存键**：面级 = 字体路径字符串（`FUN_0031fc34` 的 map，font_metrics_core.txt:88-102）。字形级：本轮**没看到任何"先查后建"分支**——`FUN_0031e178` 每次 `operator_new(0x4c)` 新建（font_mesh_construction.txt:316,327）；记录里可当键的只有 `+0x00` 字符码、`+0x04` 字号、`+0x48` 面指针（t082:228-233）。大小写折叠发生在取字形之前（0x61-0x7a / 0xe0-0xf6 / 0xf8-0xfe 减 0x20，font_raster_layout.txt:29-33）。

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
  `FUN_00323130(mesh)` →（若节点 `+0x48` 非 0）`FUN_00323208(mesh, this+0x788)` → `FUN_003234c4(mesh, &origin, &rect, 5)` （`component_text_methods.txt:119-166`）。
- **支路 B（`+0x740 != 0`，文字对象自绘）**
  `FUN_003d13fc(&vec, this)` 先把局部原点用组件变换矩阵变换（`component_text_rebuild.txt:495-548`），再把矩阵各分量整块拷到栈上，最后 `FUN_00321f14(vec, textObj, &matrix)`（`component_text_methods.txt:169-193`）。

### 4.4 与 UIScreen quad 通道的关系
- **不是同一条函数路径。** 普通组件走 `FUN_003d6acc`：4 顶点 × 0x30B，UV/位置写 `+0x00/+0x04/+0x28/+0x2c`，颜色从模板 `PTR_DAT_004d9e2c` 整块拷贝（`font_draw_functions.txt:63-193`）。文字走 `FUN_00321f14` / `FUN_003234c4`，顶点由字形构造器 `FUN_003204c0` 产生。
- **但共用同一套顶点格式与同一张纹理单元语义**（0x30B、UV 在前、位置在后）`[推断]`；两者都在结束时把全局矩阵块写回单位矩阵：`PTR_DAT_004d904c + 0x1094..0x10d0` 与 `+0x1894..0x18d4` 被填入 `DAT_0052be20..be5c`（单位矩阵，`font_property_initializers.txt:112-129`），并把 `+0x18d4` 计数器 +1（`component_text_methods.txt:194-253`）。
- 混合状态（blend func / 采样 / 深度）在已导出语料中**完全没有出现**——未导出。
- **订正（本轮）**：本节首条「顶点由字形构造器 `FUN_003204c0` 产生」与 4.5 的逐指令复核不符——`FUN_003204c0` 只填 0x4c 度量记录，顶点在层对象里、由未导出的 `FUN_003235bc` / 层构造器生成。

### 4.5 一个字形怎么变成四边形（支路 B 全链）
**先说结论**：`FUN_00321f14` **不生成顶点**，只做"每字形一次矩阵变换 + 每字形一次提交"；顶点在每层的 0x7c 层对象里，生成者是**未导出**的 `FUN_003235bc` / 层构造器。导出能逐条指到的部分如下。

1. **0x4c 字形记录**（`FUN_0031e178`，`operator_new(0x4c)`，font_mesh_construction.txt:316）： `0x003f86b4(ch)` → `0x003f84e4`(16.16 单位阵+零平移) → `0x003f74e0(face,index,4)` → 读 slot 的 `+0x64/+0x4c/+0x50/+0x24/+0x1c/+0x40`（:297-305），再乘面缩放 `font+0x184`（:318-322），最后由 `FUN_003204c0` 落字段（:327）：

   | 记录偏移 | 值 | 证据 |
   |---|---|---|
   | `+0x00` | 字符码 `ch`（`FUN_0031b8fc` 后面直接拿 `*glyph` 比 10/0x200b/0x3000，font_engine_real.txt:452-471） | t082:228 |
   | `+0x04` | 请求字号 | t082:229 |
   | `+0x08` | `(advance.x*DAT_0031e2b8 - bitmap_left) * (1/面缩放)` | font_mesh_construction.txt:307,315-317,322 |
   | `+0x0c` | `(horiBearingY - metrics.height) * DAT_0031e2c0 * (1/面缩放)` | :303-304,308,313-314,321 |
   | `+0x10` | 0 | t082:232 |
   | `+0x28` | 0 | t082:234（`uVar9` 在 :319 被重写成 0） |
   | `+0x2c` | `1/面缩放`；空字形（宽或高 = 0）时 0 | t082:235；font_mesh_construction.txt:309-311 |
   | `+0x30/+0x34` | `DAT_0052c010/14` = **0.0f** | t082:236-237；font_property_initializers.txt:100-103 |
   | `+0x40/+0x44` | 0 | t082:238-239 |
   | `+0x48` | 字体面指针 | t082:233 |

   记录里**没有颜色、没有 4 个顶点**，`+0x14` 连写都没写。上一轮把 `+0x28/+0x2c` 记作 UV `(1,1)/(1,0)`；按本轮反编译它们是 `(0, 1/scale)` 或 `(0,0)`，是否当 UV 用要等顶点构造器（记入 6.3）。
2. **0x40 放置记录**（`FUN_00320a28`，`operator_new(0x40)`，font_raster_layout.txt:431）：`+0x00/+0x04/+0x08` = 排版对象的 `+0x18/+0x1c/+0x20`（= **softShadowOffset**，:543-545）；`+0x18..+0x2c` = 6 个层对象（见 4.6）；`+0x0c`(行内 x) / `+0x10`(行内 y)（订正：§2.4） 由 `FUN_00320ed8` 写（font_metrics_core.txt:400-407）。
3. **变换与提交**（`FUN_00321f14`）：
   - 开头先 `FUN_00320a28()` / `FUN_00321d04(obj)` 重排（t082:61-62），再遍历 `obj+0x04..obj+0x08` 的指针数组（:63-64,92）。
   - 矩阵 `M[0..0xb]` 拷到栈（:73-85）；平移 = `obj+0x3c/+0x40/+0x44` + `M[12]/M[13]/M[14]`（:86-91）。
   - 位置：`x' = tx + r[0xc]·M[0] + r[0x10]·M[4] + r[0x14]·M[8]`；y'/z' 换成 `M[1]/M[5]/M[9]/M[13]`、`M[2]/M[6]/M[10]/M[14]`（:96-119）→ 列主序 `v'=M·v` `[推断]`。**这一步不做缩放**，缩放已折进排版阶段的行内坐标。
   - `M[15]` 也取了（:85 的 `local_2c`）但没进可见运算；结果写 `local_38/34/30` 三个 float，然后 **每字形一次** `FUN_003235bc(local_30, 放置记录, &local_68, 9)`（:120）。首个实参在反编译里是 z 槽而不是 `&local_38`，**Ghidra 此处不可信**；`FUN_003235bc` 本身**未导出**（247B，0x003235bc–0x003236b3）。
   - 步长：循环体 1 个字形记录、指针数组步长 4B（:92,121-129）；**顶点步长仍是 0x30B/12 dword**（§4.2）。
   - **索引**：两条支路都没有 index buffer 痕迹——`FUN_00321f14` 每字形 1 次、`FUN_003234c4` 每层 1 次，按非索引提交 `[推断]`。"每字形 4 顶点"在本轮导出里仍无直接证据（`FUN_003235bc` 未导出），保留 `[推断]`。**UV 来源 / 顶点顺序 / 颜色写入顶点：未导出。**

**本轮复核（`FUN_003235bc` 全导出 247B，`build_logs/t084_text_mesh_full.txt:13-95`）**

- 它**不生成顶点**：函数体只读 `param_1`（0x40 层组记录）与 `param_2`（4×4 矩阵），全程没有 UV、颜色、顶点写入，也没有索引。逐层顶点展开在它唯一的几何被调者 `FUN_0031b790`（0x0031b790，361B，2026-11-08 已导出，见 §4.10）里；调用点 `:78,81,83,85,88,91`（被调用者数 2 = `FUN_003199a4` + `FUN_0031b790`，没有第三个）。
- `param_1` = §4.5-2 的 0x40 记录：6 个层槽 `+0x18..+0x2c`（`:48-92` 依次判 `param_1[6..0xb]`）；`+0x00/+0x04/+0x08` = 阴影位移（`:70-77` 只加到矩阵平移列上）。
- `param_2` = 4×4 矩阵：`:57-69` 整块拷 16 dword，其中 `+0x30/+0x34/+0x38` = M[12]/M[13]/M[14]（平移列）；`:70-77` 得 `M[12..14] + 记录+0x00..+0x08`，只写进阴影层用的局部矩阵 `local_58`。
- 六层提交序与 §4.6 同：`:78` 阴影（改过的矩阵）→ `:81` `+0x1c` → `:83` `+0x20` → `:85` `+0x24` → `:88` `+0x28` → `:91` `+0x2c`。
- `+0x20`（主填充）先懒初始化（`*(char*)(+0x69)==0` → `FUN_003199a4()`，`:49-55`），并作为**第 4 实参**传给每一次 `FUN_0031b790`（`:78-91`）→ 每层提交都带主层 [推断：主层持有字形图集与度量记录]。
- 颜色/纹理句柄不在本函数：颜色在层对象构造时写 `+0x18`，纹理句柄在 `+0x74/+0x78`（仅主填充层非 0，见 4.8）。
- 调用点 `FUN_00321f14` 打印成 `FUN_003235bc(local_30,iVar1,&local_68,9)`（t082:120），与本函数 3 参原型及函数体都不符；按函数体反推真实实参 = (0x40 记录, `&local_68` 矩阵, 上下文) [推断]，首实参与第 4 实参是 hard-float 误配。
- **四顶点算法 / 顶点顺序 / UV 来源 / 索引：仍未导出**，下一个必导地址是 `0x0031b790`（见 6.2）。

### 4.6 图层：阴影/描边/发光/斜面的顺序（本轮闭合）
- 4 个 setter 都作用在排版对象上，先比旧值（命中早退），改了就写 `*(byte*)obj = 1` 脏标记：

  | setter | 写进排版对象的字段 | 证据 |
  |---|---|---|
  | `FUN_003214b0` stroke | `+0x58` size、`+0x5c` 常量 1、`+0x60..63` colour | t082:254-268 |
  | `FUN_00321420` softShadow | `+0x74` size、`+0x78..7b` colour、`+0x18/+0x1c/+0x20` offset、`+0x7c` int 模式 | t082:282-307 |
  | `FUN_003214fc` innerGlow | `+0x6c` size、`+0x70..73` colour | t082:321-333 |
  | `FUN_00321600` bevel | `+0xb4..+0xc0` size/depth/azimuth/zenith、`+0xc4/+0xc8` 两色 | t082:347-370 |

- 唯一调用点 `FUN_003d0cf4` 把组件属性逐个喂进去：strokeSize(+0x804)/strokeColour(+0x808) → `FUN_003214b0`；softShadowSize(+0x80c)/Colour(+0x810)/Offset(+0x814) → `FUN_00321420(...,0)`（模式位固定传 0）；innerGlowSize(+0x818)/Colour(+0x81c) → `FUN_003214fc`；bevel 六件套(+0x820..+0x838) → `FUN_00321600`（text_component_update_flags.txt:209-305）。
- 层不是改字形轮廓，而是**同一段文字重绘多遍**：`FUN_00322adc` 按条件建 6 个 0x7c 层对象挂到 `+0x18..+0x2c`（font_engine_real.txt:241-343）。每字形的 0x40 记录在 `FUN_00320a28` 里用同一条 22 参调用建层（实参 #2 起依次对应 `FUN_00322adc` 的 param_1..param_22；font_raster_layout.txt:456-464）：

  | 槽 | 层 | 尺寸来源 | 颜色来源 | 建立条件（font_engine_real.txt） |
  |---|---|---|---|---|
  | `+0x18` | **softShadow**（带模式位） | `+0x74` | `+0x78` | size>0(模式0) 或 size≥0(模式1)，两个不同构造器 :241-274 |
  | `+0x1c` | **stroke** | `+0x58` | `+0x60` | size>0 :275-292 |
  | `+0x20` | **主填充** | — | `+0x80`（渐变时取 2/3/4 个色，font_raster_layout.txt:466-513） | 无条件 :293-303 |
  | `+0x24` | **innerGlow** | `+0x6c` | `+0x70` | size>0 :304-317 |
  | `+0x28` | **bevel A** | `+0xb4/+0xb8/+0xbc/+0xc0` | `+0xc4` | size>0 :318-327 |
  | `+0x2c` | **bevel B** | 同上，方位角再加 `DAT_00322f70` | `+0xc8` | 与 A 同一个 if :328-342 |

- **绘制顺序 = 槽顺序**（`FUN_003234c4`，t082:187-208）：**softShadow → stroke → 主填充 → innerGlow → bevelA → bevelB**。
  只有 `+0x18`(softShadow) 这一层在提交前把 0x40 记录 `+0x00/+0x04/+0x08`（= softShadowOffset）加到原点上（:187-195），其余 5 层直接用传入原点；主填充 `+0x20` 还负责懒初始化（`*(+0x69)==0` 时调 `FUN_003199a4`，:177-186），并作为每次调用的最后一个实参。
- 颜色不进 0x4c/0x40 记录，只在层对象里；层怎么把颜色写进 0x30B 顶点，由未导出的 `FUN_0031b608`（269B）完成。

**本轮补充（`FUN_0031b608` 全导出 269B，`t084_text_mesh_full.txt:108-158`）**

- 一次调用 = 一层的一次提交。首句 `FUN_0031b3a4(层, 实参5, 实参6)`，只有返回 1 才继续（`:125-127`）→ **批次划分 = 层**（`FUN_003234c4` 里 6 次，t082:194-208）。
- 变换槽 = 渲染器单例 `PTR_DAT_004d904c + 0x1894`：`FUN_00006400(槽, 原点x, 原点y, 1.0f)`（`:128-129`；0x00006400，161B，未导出，[推断] 写平移+等比）；`实参4 × DAT_0031b718` → `FPToFixed(...,3)` → 取低 16 位 → `FUN_003010b8`/`FUN_003010d0` 拆两半 → `FUN_00027228(槽, a, b)`（`:130-136`）。`DAT_0031b718` 的值未导出。
- 顶点区间：没有显式区间。全局笔位置 `渲染器+0x18c4/+0x18c8/+0x18cc` 每次累加原点三分量（`:137-149`），区间由累加器隐式给出 [推断]。
- `渲染器+0x18d8` 计数器本次 **+1 → +2 → +1（共 +4）**（`:131,150,153`）：与「每层每字形 4 顶点」一致 [推断]，仍无 index 证据。
- 收尾三连：`FUN_0031fa44()+0x1b8` 写进变换槽（`:151-152`，全局字体的一个 float，含义未导出）→ `FUN_002eec0c(渲染器, 1)`（`:154`，唯一带常量 1 的调用；[推断] 纹理/批次切换）→ `FUN_0031b71c(层)`（`:155`，实际出图，115B，**未导出**）。
- 混合状态：仍无 blend func / 采样 / 深度代码；只能确认每次提交前有上述变换设置。
- **订正**：本节末条「颜色写进 0x30B 顶点由 `FUN_0031b608` 完成」不成立——`FUN_0031b608` 只做变换槽/计数器/出图收尾，不写顶点；写顶点的位置仍是 `0x0031b790` / `0x0031b71c`（未导出）。

### 4.7 本轮读到的常量
- `0x3d11f4` = **1.0E-4**（f32 `0x38d1b717`，t082_text_constants.txt:5）。阴影开关：`DAT_003d11f4 <= softShadowSize` 才建阴影顶点（component_text_rebuild.txt:140），即 `softShadowSize > 0`。
- `0x3d02c0` = **0.017453292** = π/180（f32 `0x3c8efa35`，t082_text_constants.txt:7）。度→弧度：`MaxArcDegrees(+0x850，默认 153) × 0x3d02c0 × (-radius)` 得弧长（component_text_font_path.txt:269-275）；弧长小于量出宽度时按比例缩字号（:276-291）。
- `DAT_0052c010/0x52c014` = **0.0f / 0.0f**（font_property_initializers.txt:100-103），被 `FUN_003204c0` 写进字形记录 `+0x30/+0x34`（t082:236-237）。
- `0x470c80` 起 128B：`Bounce\0Top\0Left\0Right\0Bottom\0TopLeft\0TopRight\0BottomLeft\0BottomRight\0Fill\0` 后接 `UIMessageData(%p)\0FirstValid\0RealtimeMin\0Draw\0DrawComp`（t082_text_constants.txt:9）。10 个名字是**连续 NUL 串、不是指针表**，转换只能靠 `strcmp`；目前唯一已知引用是 `0x470c9d`(TopLeft) 在 `FUN_003e9fc0:0x3ea15c`（alignment_xrefs.txt:9-11）→ **字符串→`+0x7bc` 掩码的转换函数仍未导出**，建议导出 `0x003e9fc0`（589B，0x003e9fc0–0x003ea20c）。

### 4.8 层对象：构造实参与懒初始化（本轮闭合）
- `FUN_003197fc` 是 79B 纯包装：`FUN_0031984c(this); return this`（`t084_text_mesh_full.txt:171-176`）。真构造 `FUN_0031984c`（343B）已导出：`font_mesh_construction.txt:159-246`。
- 13 个实参（`font_mesh_construction.txt:167-169`），7 个调用点全在 `FUN_00322adc`（`font_engine_real.txt:249,264,282,298,311,325,336`；每次 `operator_new(0x7c)` 后立刻调它）：

| # | 去处 | 值 / 含义 |
|---|---|---|
| 1 | — | `operator_new(0x7c)` 的层对象本体 |
| 2 | `+0x48` | 字体面指针（`:212`）；构造里用 `face+0x184` / `face+0x180` 缩放（`:219-224`、`:230-236`） |
| 3 | `+0x64` | `char*` 名字：`strlen` → `operator_new` → `strncpy`（`:237-241`） |
| 4 | `+0x44` | `fontSystem+0x10 × 实参4`（float，`:208-211`） |
| 5 | `+0x18` | 4 字节颜色 + 1 个 0，经 `FUN_0031c57c`（`:213-218`；0x0031c57c，53B，未导出） |
| 6 | `+0x28` | `(实参6 + fontSystem+0x140) × face+0x184`（`:219-224`） |
| 7 | `+0x2c` | 模式；为 1..3 时 `+0x30 = ceilf(实参8 × face+0x180)`（`:225`、`:230-236`） |
| 8-11 | `+0x30..+0x3c` | 四个 float（`:226-229`） |
| 12-13 | `+0x74/+0x78` | 仅主填充层非 0：`记录+0x38` 与 `FUN_00322adc` 的 param_22（`:298-299`）→ 纹理句柄 [推断] |

- 记录侧：`FUN_00322adc` 先写 0x40 记录 `+0x30..+0x33` 主色、`+0x34..+0x37` 描边色，再 `_memset(记录,0,0x30)`，最后 `+0x38=param_21`/`+0x3c=param_22`（`font_engine_real.txt:230-240`）。
- 懒初始化标志 `+0x69`：只被 `FUN_003235bc:49` / `FUN_003234c4:178` 读；`FUN_003199a4`（29B）= `FUN_00319b24 → FUN_00319ce0 → FUN_00319dd0 → FUN_0031b190` 四连（`t084:846-854`）。构造末尾**直接**调它（`font_mesh_construction.txt:242`）再注册进全局表（`FUN_0031fe80`，`:243-244`）→ `+0x69` 的置位点不在构造器内，**未导出**。

### 4.9 对齐：`0x470c80` 名字表 → 枚举值（`FUN_003e9fc0` 全导出 589B）
- 它**不是**字符串→掩码转换器，而是**枚举名表构造器**：先在 `0x48cd04` 起的素数表（2,3,5,7,11,…；表头 `0x48cd00` = `08 01 00 00`，`alignment_enum_data.txt:7`）里二分出 **≥10 的第一个值 = 11**，写 `+0x24` / `+0x34`，`FUN_003ea558` 按它分配 `+0x18`（`:456-483`，[推断] 桶数）；再逐条 `FUN_003ea210(对象, 值, 名字)` 注册 11 条（`:484-519`）。
- 名字→值（"值" = `FUN_003ea210` 第 2 实参）：

| 值 | 名字 | 字符串地址 | 证据（`t084_freetype_full.txt`） |
|---|---|---|---|
| -1 | `Invalid` | 内联字面量 | :454, :488 |
| 0 | `None` | 内联字面量 | :490-491 |
| 1 | `Top` | `0x470c87` | :493-494 |
| 2 | `Left` | `0x470c8b` | :496-497 |
| 3 | `Right` | 内联字面量 | :499-500 |
| 4 | `Bottom` | 内联字面量 | :502-503 |
| 5 | `TopLeft` | `0x470c9d`（`alignment_xrefs.txt:9-11`） | :505-506 |
| 6 | `TopRight` | 内联字面量 | :508-509 |
| 7 | `BottomLeft` | 内联字面量 | :511-512 |
| 8 | `BottomRight` | 内联字面量 | :514-515 |
| 9 | `Fill` | `0x470cc5` | :517-518 |

- `0x470c80` 的 `Bounce` **不属于**这个枚举：本函数没有任何一处引用它（11 条里没有 Bounce）。
- 枚举值 ≠ 掩码。掩码字段是 **`+0x73c`**（`component_text_constructor.txt:96` 的 `param_1[0x1cf]=0xf`，0x1cf×4=0x73c），作为第 6 实参进排版对象（`component_text_font_path.txt:92,120`），排版对象内按 `+0x34` 读（`t084:269,271-272,322,348,365,381`）。文档 §1.4 旧记作 `+0x7bc`（本轮已改为 `+0x73c`）；`+0x7bc` 在语料里既无写入点也无读取点。
- 掩码位语义（`FUN_00320ed8` 实证，**按轴订正**）：`0x40` = 按字体 mesh 包围盒对齐（纵向，t089:286-296）；`0x4/0x8/0xc` = 纵向（`0xc` 居中，t089:193,230-241；仅 `0x8` 走 :269-284）；`0x20` = 关闭换行（`FUN_003226f0` 把 `+0x30` 置 1，`component_text_font_path.txt:156-158`）兼 x 夹取（t089:330-345）；`0x3` = 横向（0/1 左、2 右、3 中，t089:302-329）。旧记「0xc 水平 / 0x3 垂直」**反了**，见 §2.4/§2.6。
- **值→掩码的转换函数未导出**：语料里没有任何把 0..9 映射到 0x1/0x2/0x4/0x8/0x20/0x40 的代码。反证：值 5(`TopLeft`) 与 `0x1|0x4=0x5` 只是巧合，6(`TopRight`) 对不上 `0x1|0x8=0x9` —— **不能用 `1<<值`，也不能把值当掩码**。

### 4.10 顶点数据的最终落点（t085 导出，2026-11-08）
`FUN_0031b790(layer, matrix, ?, ?)` 本身也**不写顶点**，它是「矩阵合成 + 提交收尾」 （build_logs/t085_glyph_vertex_full.txt:13-95）：

1. 先调 `FUN_0031b3a4(layer, ?, ?)`，返回 1 才继续。该函数在开头按 `DAT_0052be20..0052be5c` 一整组常量初始化两块 4×4 矩阵块（全局块 `+0x1094..` 与 `+0x1894..`），并对 `+0x69` 为 0 的层 先调 `FUN_003199a4` 做懒初始化（:190-263）。
2. 把全局矩阵块 `PTR_DAT_004d904c+0x1894..+0x18d0`（16 dword）拷到栈上，与传入矩阵调 `FUN_00009e84(in, param_2, out)` 合成，结果写回同一全局块（:54-86）。
3. `+0x18d8` 计数器 **+1**；`FUN_0031fa44()` 取到对象后用 `FUN_00006400(全局块, 1.0, obj+0x1b8, 1.0)` 做一次缩放/组合（:87-89）；计数器再 **+1**（:90）。 ⇒ 本路径每层每字形共 +2（与 §4.6 记的「+4」不一致，以本节为准）。
4. `FUN_002eec0c(渲染器, 1)` 后调 `FUN_0031b71c(layer)` 收尾（:91-92）。

`FUN_0031b71c(layer)`（115B，:108-148）遍历 `layer+0x58` 的指针数组（末指针在 `+0x5c`）：

- 条目内 `[10]` 为负时走 `[3]` 计数分支；否则按 `[index*3+4] .. [index*3+5]` 取区间；
- 统一调 **`FUN_0033a8fc(start, count, ptr, flag, 0)`** —— 把一段顶点交给渲染器
  （起始偏移、数量、数据指针、标志）。

`FUN_0031a790(layer, ?, ?)`（55B，:161+）是 §4.3 支路 A 的同构遍历。

**仍未导出**：`FUN_0033a8fc`（顶点提交）、`FUN_0031fa44`/`FUN_0031fe58`（渲染器状态）、 `DAT_0052be20` 起的常量块（需 `DumpData 0x52be20:0x40`），以及把 4 个顶点写进缓冲的代码位置—— 从 `FUN_0031b71c` 的条目结构看，顶点缓冲由 `+0x58` 数组元素持有，写入者尚未出现。

### 4.11 顶点写入者（t087 导出，2026-11-08）
**找到了：`FUN_0031ae00`（0x0031ae00，911B，唯一调用者 `FUN_00319dd0`）。** 证据：`build_logs/t087_module_dump.txt:3557-3792`（完整反编译）、 `build_logs/t087_vertex_writer_asm.txt`（全函数汇编，指令地址逐条可查）、 过程与排除表 `build_logs/t087_vertex_writer.md`。

它给**每个字形记录写 6 个顶点（2 个三角形，无索引缓冲）**，不是 4 个： `bytes = n*6*0x30`、`*(elem+0xc) = n*6`（`:3632-3639`； 汇编 0x0031ae76-0x0031ae96 `add r0,r0,r0 lsl#1 / lsls r2,r0,#1 / umull r0,r1,r2,#0x30`）。 缓冲指针写 `elem+0x08`、顶点数写 `elem+0x0c`。

#### 4.11.1 三级结构
| 层 | 内容 | 证据 |
|---|---|---|
| `layer`（0x7cB，`FUN_0031984c`） | `+0x4c` 字形记录 vector；`+0x58` 批次元素 vector；`+0x64` = **待渲染字符串**；`+0x69` 顶点有效；`+0x6a` 圆弧 | 构造 `font_mesh_construction.txt:159-246` |
| 批次元素（0x50B，`FUN_0031adb0`：`:3518`，`operator_new(0x50)` + `FUN_0031bcec`） | `+0x00` 页 id、`+0x04` 纹理、`+0x08` **顶点缓冲**、`+0x0c` **顶点数**、`+0x10/+0x1c` 两个区间三元组、`+0x28` 区间索引(-1)、`+0x2c..0x38` 包围盒、`+0x44` 本批字形 vector | `:3518-3556`、`FUN_00319ad0` `:1824` |
| 顶点缓冲 | `n*6` × 0x30B，平铺，无索引 | 见下 |

追加 `+0x5c` 的是 **`FUN_0031c1d0`（0x0031c1d0，39B，`:5020`）**，标准 `vector<void*>::push_back`； 唯一调用点是 `FUN_0031adb0`（按页 id find-or-create，`:3533-3553`）， 而 `FUN_0031adb0` 只被 `FUN_00319dd0` 调用。清空是 `FUN_00319a84`（`:1784`）。

#### 4.11.2 顶点布局（0x30B / 12 float）
| 偏移 | 内容 | 汇编 |
|---|---|---|
| +0x00 / +0x04 | **位置 x / y**（float） | `vstr s20,[r0]` 0x0031b002、`vstr s30,[r0,#4]` 0x0031b006 |
| +0x08 / +0x0c / +0x10 | 0 / 0 / 0 | 0x0031b13c、0x0031b142、0x0031b148 |
| +0x14 | **1.0f**（0x3f800000） | 0x0031b150 |
| +0x18 / +0x1c / +0x20 / +0x24 | **颜色 R / G / B / A**，打包色 byte2 / byte1 / byte0 / byte3，`vcvt.f32.u32` 直接转，**未除 255** | 0x0031b124-0x0031b136 |
| +0x28 / +0x2c | **UV u / v** | `vstr s2,[r0,#0x28]` 0x0031b00a、`vstr s0,[r0,#0x2c]` 0x0031b00e |

颜色来源：元素 `+0x3c`（`FUN_0031048c(layer+0x18)` 的打包色），若 `FUN_0031beb0` 按 `字形+0x44` 查到逐字形覆盖色则改用覆盖色、并取元素 `+0x40` 当 alpha（`:3655-3670`、汇编 0x0031af26-0x0031af40）。

#### 4.11.3 4 个角的生成公式
记 `g` = 0x4c 字形记录、`pen = (g[0x30], g[0x34])`、`w = g[0x38]`、`h = g[0x3c]`、 `(a,b) = (g[0x28], g[0x2c])`、`θ = g[0x40]`（直排恒 0，圆弧排版由 `FUN_00319ba0` 写入）：

~~~
R(p,q) = (p·cosθ − q·sinθ, p·sinθ + q·cosθ)
P_w0 = pen + R( w−a , −b )      // 0x0031afde / 0x0031afe2
P_0h = pen + R( −a  , h−b )      // 0x0031afc6 / 0x0031afce
P_00 = pen + R( −a  , −b  )      // 0x0031afba / 0x0031afca
P_wh = pen + R( w−a , h−b )      // 0x0031afb2 / 0x0031afda
~~~

若 `a = b = 0`（[推断] 常见情形，见 4.11.6），四角就是 `pen` 起、`w×h` 的轴对齐矩形， 再整体绕 `pen` 转 `θ`。

**输出成 6 个顶点**（两条三角形，对角线 `P_0h–P_w0`；绕序由全局 `FUN_0031fa44()+0x1b4` 是否为 1 决定，只交换 1/2、4/5）：

| 顶点 | `+0x1b4 == 1` | 否则 | UV |
|---|---|---|---|
| 0 | P_w0 | P_w0 | (g[0x20], g[0x24]) |
| 1 | P_0h | P_00 | (g[0x18], g[0x1c]) / (g[0x18], g[0x24]) |
| 2 | P_00 | P_0h | (g[0x18], g[0x24]) / (g[0x18], g[0x1c]) |
| 3 | P_wh | P_wh | (g[0x20], g[0x1c]) |
| 4 | P_0h | P_0h | (g[0x18], g[0x1c]) |
| 5 | P_w0 | P_w0 | (g[0x20], g[0x24]) |

即 **u 随 x 增（g[0x18]→g[0x20]）、v 随 y 减（y=0 取 g[0x24]，y=h 取 g[0x1c]）**。 UV 四元组来自 0x4c 记录的 `+0x18..+0x24`，由 `FUN_0031e2c4`（`:7668`）从图集节点 `+0x08..+0x14` 原样拷入——**这就是 256×256 图集的 UV 矩形**（[推断]：图集节点由 `FUN_0031e4e8` 生成纹理、`FUN_003666bc` 插入并回填 uv，后者未导出）。

#### 4.11.4 调用链
`FUN_0031b608`（每层每字形）/ `FUN_0031b790`（矩阵合成）→ `FUN_0031b3a4`（不可见返回 0）→ 若 `layer+0x69==0` 调 `FUN_003199a4` → `FUN_00319b24`（字符串→0x4c 记录）→ `FUN_00319ce0`（推进/角度）→ **`FUN_00319dd0`（按页 id 分桶 + `FUN_0031ae00` 写顶点）** → `FUN_0031b190`（圆弧/上色）→ 回到 `FUN_0031b3a4` → `FUN_0031b71c` → 逐元素 `FUN_0033a8fc(缓冲, 顶点数, 页id, flag, 0)`。

支路 A（预烘焙）的 `FUN_0031a7c8`（`:3020`）读的是**同一份** `elem+0x08` 缓冲（y 取负后推进组件 `+0x784`），不另生成顶点 → 两条支路共用同一个写入者。

#### 4.11.5 订正（本轮推翻的旧结论）
1. §4.2「文字顶点 +0x00/+0x04 = UV、+0x28/+0x2c = 位置」**反了**：文字顶点是位置在前、UV 在后（0x28/0x2c）。
2. §4.5/§4.6「每层每字形 4 顶点」→ 实为 **6 顶点**（两条三角形），仍无索引。
3. §4.5 表「记录 +0x28 = 0、+0x2c = 1/面缩放」→ **+0x28/+0x2c 是位图原点偏移**，写点 `FUN_003204c0`（`:10345`）取自图集节点 +0x20/+0x24；记录 `+0x18..0x24` = **UV 矩形**。
4. §4.8「层 +0x64 = char* 名字」→ 是**待渲染字符串**（`FUN_00319b24` 逐字解析 `layer+0x64`）。
5. §4.8「层 +0x69 懒标志置位点未导出」→ 置 1 在 `FUN_00319dd0`、清 0 在 `FUN_00319a84`。
6. §4.6「颜色写进 0x30B 顶点由未导出的 `FUN_0031b608` 完成」→ 颜色写在 `FUN_0031ae00`；且是 **0..255 浮点**，没有归一化。

#### 4.11.6 仍未闭合
- `FUN_0033a8fc`（唯一剩余提交点）仍未导出；实参语义已可确定为 (顶点缓冲, 顶点数, 页id, 1/0, 0)。
- 图集节点 `+0x20/+0x24`（= 记录 `+0x28/+0x2c`）到底是"内边距"还是"位图原点"：`FUN_0031e4e8` 里这两个值同时用于
  像素填充（`width + iVar2*2`、`rows + local_80*2`），无法只凭该函数判定，四角公式保留 (a,b) 符号。
- `FUN_003666bc`（图集插入 / UV 回填）、`FUN_0031fa44()+0x1b4`（绕序开关）未导出。

**顶点写入顺序已单独成文**：见 `glyph_vertex_order_macho.md`（寄存器级追踪 + 两支绕序的可实现伪代码 + 12 个 UV 写点的归属，含对 §4.5 的勘误）。

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

### 6.1 本轮已闭合（原表对应项划掉）
| 地址 | 原缺什么 | 现在闭合到哪一步 |
|---|---|---|
| ~~`0x00321f14`~~ | 文字对象真正的 draw 提交（支路 B 唯一出口） | 351B 全导出：每字形矩阵变换 + 每字形一次提交，见 4.5；顶点展开不在这里 |
| ~~`0x003234c4`~~ | 预烘焙 mesh 的 draw（支路 A） | 247B 全导出：6 层按固定顺序提交，见 4.6 |
| ~~`0x003204c0`~~ | 单字形 4 顶点构造 | 65B 全导出：**不是**顶点构造，是 0x4c 度量记录的字段填充，见 4.5 |
| ~~`0x003214b0`~~ / ~~`0x00321420`~~ / ~~`0x003214fc`~~ / ~~`0x00321600`~~ | stroke / shadow / glow / bevel 四个 setter | 全导出，字段与唯一调用点都清楚，见 4.6 |
| ~~`0x003f8b24`~~ | 从内存字节建字体面 | 49B 全导出：`FT_Open_Args` 内存模式，见 3.4 |
| ~~`0x003f86b4`~~ | char → glyph index | 29B 全导出：`FT_Get_Char_Index` 形态 |
| ~~`0x003f9540`~~ | 字距查询 | 189B 全导出：`FT_Get_Kerning` 形态（三种 kern_mode + 26.6 对齐） |
| ~~`0x003f74e0`~~ / ~~`0x003f967c`~~ | 字形加载 / 选面 | 941B + 69B 全导出：`FT_Load_Glyph` / `FT_Set_Charmap` |
| ~~`DAT_003d11f4`~~ / ~~`DAT_003d02c0`~~ | 两个常量值 | 1.0E-4 / π/180，见 4.7 |
| ~~`0x003235bc`~~ | 字形 → 顶点 | 247B 全导出：**不生成顶点**，只做「懒初始化 + 6 层分发 + 阴影矩阵平移」，见 4.5 |
| ~~`0x0031b608`~~ | 每层提交 | 269B 全导出：可见性判定 → 变换槽 → 笔累加器/计数器 → 出图，见 4.6 |
| ~~`0x003197fc`~~ / ~~`0x003199a4`~~ | 层对象构造 / 懒初始化 | 79B 包装 + 29B 四连；真构造 `0x0031984c` 早已在 font_mesh_construction.txt:159-246，见 4.8 |
| ~~`0x003e9fc0`~~ | 对齐字符串 → 掩码 | 589B 全导出：**是枚举名表构造器**（11 条），不是掩码转换，见 4.9 |
| ~~`0x00321d04`~~ / ~~`0x00321dc4`~~ / ~~`0x00323130`~~ / ~~`0x00323208`~~ | 前/后置、mesh 绑定、顶点子区间 | 189/333/67/113B 全导出：分别是「重排 + 6 层重置」、「4 次 `FUN_0033a8f4` 画框（`DAT_00603c84` 开关，[推断] 调试）」、「6 层重置」、「按记录原点逐层提交」，见 4.6 |
| ~~`0x003f86d4`~~ / ~~`0x003f84e4`~~ / ~~`0x003f8694`~~ / ~~`0x003f97e8`~~ / ~~`0x0031ddf8`~~ | FreeType 五入口 / 字号设定 | 全导出：truetype 驱动按名选（`_strcmp(...,"truetype")`，t084_freetype_full.txt:84）、`face+0x80` transform 写入（:307-345）、render 分派（:369）、size 链表查找（:401-408）、`FUN_003f94e0` 字号（t084_text_mesh_full.txt:890-894） |

### 6.2 仍缺：按地址
| 地址 | 字节 | 缺什么 | 建议导出范围 |
|---|---|---|---|
| `0x0031b790` | 361 | **四顶点/UV/颜色/索引的真正所在**：`FUN_003235bc` 每层调一次 `(层, 矩阵, 上下文, 主层)`，见 4.5 | 0x0031b790–0x0031b8fb |
| `0x0031b71c` | 115 | 层出图收尾（`FUN_0031b608:155` 调） | 0x0031b71c–0x0031b78f |
| `0x0031b3a4` | 611 | 层可见性/有效性判定（返回 1 才提交，见 4.6） | 0x0031b3a4–0x0031b607 |
| `0x0031a790` | 55 | 支路 A 的逐层提交（`FUN_00323208` 调，带记录原点） | 0x0031a790–0x0031a7c6 |
| `0x00319ad0` | 51 | 每层重置（`FUN_00323130` 对 6 个槽各调一次） | 0x00319ad0–0x00319b02 |
| `0x00319b24` / `0x00319ce0` / `0x00319dd0` / `0x0031b190` | 111/237/161/197 | `FUN_003199a4` 的四个子步骤（层初始化链，见 4.8） | 各自起址 + 长度 |
| `0x00322074` / `0x00322210` / `0x00322240` | 409/45/45 | 重排后处理：`+0xa9` / `+0xa8` / `+0xaa` 三个标志分支（圆弧/位移，语义未导出） | 0x00322074–0x0032220d 等 |
| `0x0031c57c` | 53 | 颜色写进层对象 `+0x18` 的字节布局 | 0x0031c57c–0x0031c5b0 |
| `0x003ea23c` / `0x003ea2e0` | 161 / 199 | 枚举注册表查找（名字→值 / 值→名字），对齐解析要用 | 0x003ea23c–0x003ea2dc、0x003ea2e0–0x003ea3a7 |
| 未知 | — | **枚举值(0..9) → 掩码**（4.9 已证明没有任何映射代码）；**位图 → 纹理**（`slot+0x54/+0x58` 无人读） | 从 `FUN_003d02cc`（属性变更）与 `0x0031dba4`/`0x0031fc34` 的调用者往下跟 |

### 6.3 仍缺：数据与行为
- ~~行高 / ascent / descent / 基线~~ 已闭合：行距 = 字号 + `verticalSpacing`，无 ascent/descent 参与，见 §2.6。
- 混合模式 / 采样 / 深度状态；4.6 只给出层间的 CPU 提交顺序。
- 圆弧文本（`radius != 0`）的逐字坐标公式（`0x3d02c0` 只闭合了弧长）。
- 256×256 与字形位图的关系：`FT_LOAD_RENDER` 是每字形独立 bitmap，导出里没有打包 / 上传，图集是否存在仍未知。
- 0x4c 记录 `+0x28/+0x2c` 是否当 UV 用（本轮看到的是 `(0, 1/scale)` / `(0,0)`）：`FUN_003235bc` 根本不读 0x4c 记录，消费点只可能在 `0x0031b790`。
- `+0x848` 未命名属性（`DAT_00604858`，字符串 `0x47054f`）的真名。
- `+0x48` 语义冲突（`FUN_003216c0` 写值 vs `FUN_0031984c:212` 写字体指针）：本轮证据表明层对象 `+0x48` 就是字体面，冲突源于把排版对象与层对象当成了同一个 [推断]。
- `FUN_0031fa44()+0x140`、`+0x10`、`+0x13c`、`+0x1b8`（`+0x1b8` 被 `FUN_0031b608:151-152` 写进变换槽）的写入点；`+0x21` 只在字体系统 ctor 置 0（`t087_module_dump.txt:9417`），运行期翻开的路径未导出。
- 本地化兜底串 `"STRING NOT FOUND"` / `"!! WRONG TABLE !!"` 与真机文案的对应。
- `DAT_0031b718`（`FUN_0031b608:130` 乘到实参4 上、再转定点的常量）的值与语义。
- 层对象 `+0x69` 懒标志的置位点（构造器只调 `FUN_003199a4`，自己不写 `+0x69`）。
