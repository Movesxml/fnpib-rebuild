# UISF 静态布局与父子投影（发售版 Mach-O）

## 范围与结论

本 finding 只闭合组件局部布局、动画属性覆盖和父子矩阵；不把尚未闭合的设备适配、nine-patch 或字体排版写成已实现行为。

- `FUN_003d7d7c` 注册构造默认值：position/origin/rotation 为 `[0,0,0]`，scale 为 `[1,1,1]`，width/height 为 `100`，originFromCenter 为 `false`。
- `FUN_003d85fc` 读取 position、scale 和 rotation.z，构造局部矩阵；rotation.z 先取负，再由 `FUN_003ce3b8` 乘 `0x3c8efa35`（`0.017453292`）转为弧度。
- `FUN_003ce3b8` 的矩阵数据在类型标签之后是 16 个 Float，平移位于最后三个元素。按其乘法与点变换的存储约定，局部矩阵等价于 `T * R * S`。
- `FUN_00399fa4` 取得父级全局矩阵；`FUN_00399f54`、`FUN_003d9468` 与 `FUN_003da3d8` 合并后的数学结果为 `world = parentWorld * local`。因此父级 position/rotation/scale 均传播给 children。
- `FUN_003d83a4`：originFromCenter 为 true 时，`effectiveOrigin = origin + [width*0.5,height*0.5,0]`；为 false 时保持 origin。它不修改局部 position，也不是“position 即中心点”的别名。
- `FUN_003d86d4` / `FUN_003d9364` 将 `-effectiveOrigin` 经全局矩阵变换并加全局平移，得到组件原点；局部纹理顶点也先减 effectiveOrigin 再乘全局矩阵。
- 静态 layout 是构造属性的资源值。当前动画在相应 track 存在时覆盖 position/scale/rotation；当前动画没有该 track 或没有活动动画时，继续使用静态值或上述构造默认值。不得把缺 track 当成全组件归零。
- `parentIndex == -1` 或旧资源中的 nil 表示无父级。投影必须额外检测多节点循环，不能仅依赖已有的索引范围与 self-parent 校验。

## 数值样例

`inGameChallengeMapScreen.uiscreen` 的 `challengeContainer.spinner.iconSlot1` 原始局部值为：

- texture `textures/adventureprogress/iconSlot.tex`
- position `[126.0,42.5,0.0]`
- origin `[83.5,0.0,0.0]`
- scale `[1.0,1.0,1.0]`
- width/height `83.0`
- originFromCenter 未写入，因此使用构造默认值 false，effectiveOrigin 仍为 `[83.5,0.0,0.0]`。

## 正交投影与根视口

- `FUN_003f032c` 生成设备像素正交投影：x 映射为 `2*x/deviceWidth-1`，y 映射为 `1-2*y/deviceHeight`，即左上原点、y 向下。
- `FUN_003ecb20` 返回单例对象 `DAT_005b0738`。设备尺寸位于该对象的 `+0x1c4/+0x1c8`，设计尺寸位于 `+0x33c/+0x340`；后两个偏移纠正了早期按错误地址基准得出的记录。
- `FUN_003ed85c` 从 `+0x33c/+0x340` 读取设计宽高。发售资源 `xml/FruitNinjaPuss_SkuLayout.xml` 的 `~iPhone` skuDefinition 明确写入 viewportWidth `480`、viewportHeight `320`；`FUN_0001dde4` 以同一 `~iPhone` 标识加载该配置。
- `FUN_003f08a0` 输出 `[deviceWidth/designWidth, deviceHeight/designHeight]`；`FUN_003f08fc` 返回两轴比值中的较小值。因此 `~iPhone` 的基准公式是 `[deviceWidth/480, deviceHeight/320]`，不是倒数。
- `FUN_003ec940` 按索引初始化字符串表：0 `None`、1 `KeepAspect`、2 `ScaleX`、3 `ScaleY`、4 `Scale`。`FUN_003ec8bc` 用同一张表把属性文本转成枚举。构造默认 `Scale` 因而是模式 4。
- `FUN_003cd778` 的原始汇编闭合全部分支：0 为 `[1,1]`；1 两轴均为 `min(xRatio,yRatio)`；2 两轴均为 xRatio；3 两轴均为 yRatio；4 为 `[xRatio,yRatio]`；default 也为 `[xRatio,yRatio]`。模式 2 和 3 的统一轴向不能从反编译栈变量猜测，已分别由 `003cd7d0` 和 `003cd7e2` 的读取位置确认。
- 生产资源 `inGameChallengeMapScreen.uiscreen` 根组件没有覆盖 scaleToViewportMode，所以走默认模式 4，根缩放为 `[deviceWidth/480,deviceHeight/320]`。这不是等比缩放，也不带居中留边。
- `FUN_003ed7d0` 将统一最小比值封顶为 4 后写入另一渲染器对象；这一步不属于上述 UIScreen 根矩阵，不得给挑战地图根缩放额外封顶。
- nine-patch、字体排版和纹理采样仍不在本 finding 的闭合范围内，不得以根视口公式已闭合为由宣称这些行为完成。

## 证据文件（本地工作记录，不作为运行时资源）

- `assets_raw/xml/FruitNinjaPuss_SkuLayout.xml`（bxml 原始资源）
- `build/ContentJSON/FruitNinjaPuss_SkuLayout.json`（结构解码副本）
- `build/uiscreen_layout_registration_macho.md`
- `build/uiscreen_component_methods_macho.md`
- `build/uiscreen_transform_exact_macho.md`
- `build/uiscreen_matrix_primitives_macho.md`
- `build/uiscreen_parent_matrix_macho.md`
- `build/uiscreen_viewport_projection_macho.md`
- `build/uiscreen_projection_primitives_macho.md`
- `build/uiscreen_viewport_root_exact_macho.md`
- `build/uiscreen_viewport_scale_exact_macho.md`
- `build/uiscreen_viewport_device_scale_macho.md`
- `build/viewport_root_assembly_macho.txt`
- `build/viewport_scale_enum_table_macho.md`
- `build/viewport_design_accessors_macho.md`
- `build/viewport_design_caller_macho.md`
