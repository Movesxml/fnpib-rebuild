# 水果图集与模型 UV 格式实证（T-031 输入）

## 1. 图集 RGB565 已闭合

原文件：`assets_raw/models/Fruit/textures/fruit_atlas.tex`，524300 字节。

传统头：`09 09 11 00 00 02 00 02 ff ff ff ff`。
- 两字节版本均为 9；**偏移 2 的 u16 才是像素格式字段，值 17**。
- 宽高均 512，12 字节头后恰有 512*512*2 字节。
- 现有转换器错把首字节 9 当格式，再按 2bpp 猜成 RGBA4444，输出明显彩色噪化。
- 对同一原始像素数据逐一比较 RGBA4444/ABGR4444/ARGB4444/BGRA4444、RGBA5551/BGRA5551/ARGB1555、RGB565/BGR565。仅 RGB565 的西瓜红、香蕉黄、菠萝黄、青柠绿、猕猴桃截面及徽章均恢复正常；BGR565 整体红蓝交换，4444/5551 明显错误。
- 解码 little-endian u16：R=bits15...11，G=bits10...5，B=bits4...0；分别用 `(v*255 + max/2)/max` 扩展至 8 位，A=255。

此结论只直接证明格式字段 17=RGB565。不要把旧 `A_TYPE_TABLE` 的首字节版本号继续当格式；本卡只强制改已验证的 17，其他字段仍需逐项证据。

## 2. MMD 网格（54/54 全量验证）

样本：`Apple_single.mmd`，长度 0x156f。

HBR0 顶层版本 2 的长度在偏移 8，mesh HBR0 起点为 `16 + topLength`；54 个 Fruit MMD 均指向 0x83（少数特效因材质长度不同为 0x82/0x84）。顶层 payload 与 mesh 之间的 4 字节字段不是固定零，语义未闭合，输出为 `topMeshField` 原值；顶层材质块与普通节点/变换尾部同时以 base64+SHA256 原样保留。

mesh 为版本 0，具有额外 4 字节零域：长度在 `mesh+12`，payload 从 `mesh+16` 开始，声明终点为 `mesh+16+meshLength`。
- `mesh+19`：u32 索引数 `indexCount`。
- `mesh+23`：`indexCount` 个 little-endian u16 索引。
- 索引末尾 `indexEnd` 后：5 字节网格参数（本卡不解释语义），随后 `indexEnd+5` 为 u32 `vertexCount`，顶点从 `indexEnd+9` 开始。
- 每顶点 36 字节：UV 2×f32（偏移 0/4），RGBA u32（偏移 8），法线 3×f32（偏移 12/16/20），位置 3×f32（偏移 24/28/32）。
- `vertexStart + vertexCount*36 == mesh+16+meshLength`，54/54 成立；所有索引均 `<vertexCount`。
- Apple：618 索引、107 顶点、最大索引 106；首顶点 UV=(0.4907238185,0.2823664546)，颜色 0xffffffff。

## 3. binmodel 网格（44 文件、45 网格，全量解析通过）

样本：`Peach_single.binmodel`、`watermelon_single.binmodel`、`balloon_red.binmodel`。早期草案中的 LP 长度、Meshcount 类型、Faces/Verts 参数和 MATRIX0 长度均被真实字节证伪，以下以全量回归为准。

- 标记为 `[u32 tagLength][tag bytes][NUL]`，长度不含末尾 NUL。Name、DiffuseTex 等字符串同样是长度不含 NUL、后随独立 NUL；内嵌 NUL 拒绝。
- 文件头依次为 `HalfBrickMesh` 标记、`Version` 标记+f32=1、`Meshcount` 标记+**u32** 网格数。不能假定一文件一网格。
- 每个网格依次含 Name/Parent/Matcount(f32)/Matname/材质字段/Faces/MATRIX0/Verts。
- 已闭合材质字段：`Twosided` 1×f32；`Ambient`/`Diffuse`/`Specular` 各 3×f32；`SpecLevel`/`GlossLevel`/`ReflectLevel`/`AmbientLevel`/`alpha` 各 1×f32；`DiffuseTex` 字符串。未知字段仍拒绝。
- `Faces` 后直接为 f32 `faceCount`，**没有额外参数字节**；再读 `faceCount*4` 个 f32 顶点索引。是四索引面，不是三索引面。
- 面数组终点必须是 `MATRIX0` 标记，随后 **12 个 f32**（48 字节），不是 16 个。
- `Verts` 后直接为 f32 `vertexCount`，**没有额外参数字节**。
- 每顶点 48 字节：首 f32 权重/参数，位置 3×f32（偏移4/8/12），法线 3×f32（偏移16/20/24），UV 2×f32（偏移28/32），颜色 RGB 3×f32（偏移36/40/44）。
- 每网格顶点数组后有且仅有一个 f32，但真实值包括 1.0 和 255.0，不能当成固定 255 校验。其语义尚未闭合，输出为 `vertexTrailer` 原值并标 `unverified_preserved_verbatim`。
- 下一网格从 Name 标记开始，或全文件以 u32=123456 结束；44/44 文件边界和结束标记均吻合。
- 43 文件一个网格；`chest_c_piece_2.binmodel` 有 2 网格，第二网格 Name=chestRays，引用 `textures/effects/chestRays.tex`，已验证保留。
- watermelon：168 面、504 顶点；首顶点 UV=(0.06224,0.99526)。Peach：314 面、942 顶点。balloon_red：543 顶点、48×543 字节后 trailer=1.0，随后结束标记 123456。

## 4. 水果—模型—颜色映射边界

`Content/fruitList.json` 中 24 个 FruitInfo 的文档顺序就是 typeID。模型位于 `assets_raw/models/Fruit`，以 `<name>_single.mmd` 或 `.binmodel` 为主；大小写必须保留实际路径。特例：`super_pomegranate`→`pomegranate_single.binmodel`，`super_chest`→`chest_single.binmodel`。Bomb→`Bomb.mmd`。

`FruitInfo/colours/colour` 是四通道果汁/飞溅色，不是模型 tint；模型应使用图集与自身顶点色，禁止再用 typeID 哈希色，也禁止把果汁色乘到整张水果贴图上。

本卡可输出完整网格、UV 边界和语义映射供后续 3D 渲染使用。**UV 包围盒只是元数据，不是官方 2D sprite**；原版使用 3D 网格，不能把包围盒裁图称为已还原创意外观。UV 的 V 方向与 Metal 纹理坐标一致性仍需渲染测试，不做暗中翻转。
