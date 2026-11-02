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

## 正交投影与根视口：已证实和未证实边界

- `FUN_003f032c` 生成设备像素正交投影：x 映射为 `2*x/deviceWidth-1`，y 映射为 `1-2*y/deviceHeight`，即左上原点、y 向下。
- `FUN_003cd778` 的 scaleToViewportMode 分支包含固定 `[1,1]`、两轴比值、统一最小比值及其他轴向模式。构造注册的默认字符串为 `Scale`，但枚举映射和设备设计尺寸的运行时写入链尚未全部闭合。
- `FUN_003f08a0` 分别计算两个设计尺寸/设备尺寸比值；`FUN_003f08fc` 取较小值。`FUN_003ed7d0` 还将该较小值封顶为 4 后写入另一渲染器对象，不能把这一步误当成所有 UIScreen 根矩阵都固定封顶。
- 在这些运行时值闭合前，核心布局投影只输出 UISF 逻辑坐标，不宣称现有 SwiftUI `proxy.width/480` 就是官方公式，也不实现特殊屏幕拉伸。

## 证据文件（本地工作记录，不作为运行时资源）

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
