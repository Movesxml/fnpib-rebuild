# 任务卡（task.py 自动生成，请勿手改格式）

### [T-001] done :: IPA 资产体检与三问判定
- 创建: 2026-10-30T19:37:33+08:00　更新: 2026-10-30T22:30:00+08:00
- 验收: findings/ipa_inventory.md 存在；DECISIONS.md 有三问结论
- 备注: 体检早已完成：IPA 未加密、armv7-only，产物 findings/ipa_inventory.md（延迟登记）

用户上传 ipa 后：1) 运行 harness.ipa_tools inspect 生成体检报告；2) 用 REA 对包做成员级体检；3) 判定加密/64位/引擎三个问题并把结论写入 DECISIONS.md

### [T-002] done :: 双二进制等价性验证
- 创建: 2026-10-30T20:58:31+08:00　更新: 2026-10-30T21:07:37+08:00
- 验收: findings/binary_equivalence.md 存在且含类清单差异与可用性边界结论
- 备注: 报告: findings/binary_equivalence.md；关键更正: macho 游戏类符号被剥离，结构信息唯靠 exe，数值常量以 macho 为准

系统对比 iOS Mach-O（发售版=基准真源）与 x86 Debug exe（辅助对照）：1) Mortar 类清单差异表（exe 131 类 MSVC-RTTI vs macho 740 符号 Itanium）；2) 关键玩法字符串/文案差异（如 UNHANDLED FRUIT ACTION 仅 exe 有）；3) 判定 exe 可用于加速理解的边界；4) 结论写入 findings/binary_equivalence.md 与 DECISIONS.md

### [T-003] done :: Mach-O 导入 Ghidra 并定位核心玩法函数
- 创建: 2026-10-30T21:07:37+08:00　更新: 2026-10-30T22:30:00+08:00
- 验收: 项目建立; findings/macho_core_functions.md 含上述四类函数地址+证据
- 备注: Mach-O 已导入 fnpiB-ios 并完成全量分析（27857 函数）；42 个关键词命中函数已定位并分类（见 T-004）

把 iOS 发售版 FruitNinjaPuss (armv7) 导入 Ghidra 项目 reverse/fnpiB-ios，跑自动分析，然后基于字符串交叉引用定位: 1) 主循环/帧率控制; 2) 切割判定与连击; 3) 计分与高分; 4) 分辨率/渲染初始化。无名函数用字符串 xref 识别。产出: findings/macho_core_functions.md

### [T-004] done :: 玩法函数语义分类与双源关联
- 创建: 2026-10-30T21:40:07+08:00　更新: 2026-10-30T21:54:22+08:00
- 验收: 输出 findings/function_classification.md: 73个函数的分类表+双源关联假设+Top5深挖建议
- 备注: 第二轮：harness 已支持 extra_files/finding_cap，exe 侧 31 函数报告已注入 | 报告§5已给出下游任务建议 T-005~T-008；关键词法未覆盖切割几何，定位方法需换

阅读 reverse/exe_gameplay_located.md(x86,31个函数) 与 shared_context/findings/macho_core_functions.md(armv7,42个函数): 1) 逐个函数判定玩法职责(切割判定/连击/计分/波次/道具有效性/资源注册等), 说明依据; 2) 尝试双源关联: 哪些 exe 函数与哪些 macho 函数可能是同一逻辑(依据字符串/常量/结构); 3) 标出最值得优先深挖的5个函数及理由

### [T-005] done :: Top5 核心玩法函数深度反编译与双源常量核对
- 创建: 2026-10-30T22:30:00+08:00　更新: 2026-10-30T22:03:23+08:00
- 验收: core_logic_notes.md：≥5 组函数的深度语义笔记，每组含常量表（含换算后的 float 值）、状态/分支全链、双源冲突裁决记录；切割判定缺失问题给出定位方案
- 备注: 前置：需 Kimi 先用 Ghidra 导出 10 个函数的完整反编译（DumpDecompile 无截断版）

基于 findings/function_classification.md §4 Top5，对下列函数做【完整未截断】反编译深度对比（exe↔macho）：
1) 主循环/实体更新：exe E10 FUN_00bda510 ↔ macho M03 FUN_00016214（帧更新顺序、实体接口、固定步长）
2) 连击族：exe E01/E02 ↔ macho M41 FUN_000718b0（combo 计数语义、档位、窗口清零条件）
3) 计分：macho M18 FUN_0001cb08 + M24 FUN_00065ad4（计分回调链、命中率公式）
4) 波次：macho M10 FUN_00053cb8 + M19 FUN_00053388 + M11 FUN_00027f24（WaveInfo 字段真值、出果节奏参数）
5) 炸弹/道具：macho M32 FUN_00020c38 + M28 FUN_00056098（爆炸常量、freeze 计时）
要求：输入文件 reverse/exe_gameplay_located.md 与 findings/macho_core_functions.md 中的函数体尾部被 /* ...截断... */ 切掉，需先用 Ghidra DumpDecompile 脚本对以上函数重新导出【无截断】反编译（Kimi 负责产输入，放 shared_context/findings/deep_top5_{exe,macho}.md），然后逐函数提取：完整常量表（浮点+整数，标注来源端）、分支条件全链、调用图一跳。产出 findings/core_logic_notes.md。

【输出纪律】输入全文约 19 万字符，输出务必紧凑：常量用表格（hex→float→语义），分支链用编号列表不用长引文；目标产出 core_logic_notes.md ≤ 2 万字符。若某函数信息量过大，优先保证常量表与分支条件完整，文字分析从简。

### [T-006] done :: 切割几何函数深挖 + 数据段待验证常量读取
- 创建: 2026-10-30T22:55:00+08:00　更新: 2026-10-30T22:14:19+08:00
- 验收: findings/slash_geometry.md：切割判定完整公式（含所有常量与分支）、碰撞层函数地图；findings/pending_constants.md：§7 清单全部闭合（值+来源地址）
- 备注: 输入已就绪：3 个 macho 函数全量反编译 + 两侧数据段常量已读取 | 重要订正：FUN_00009b50=normalize（非点积）；PTR+0x44=上一帧 dt 缓存（非固定步长）；game+0xf0=切割半径²

承接 core_logic_notes.md §6/§7：
1) 用 DumpByName 导出 macho FUN_00017d74（命中测试）、FUN_00017fdc（近失）、FUN_00009b50（模长/点积）全量反编译，从其调用图向下一跳定位引擎碰撞层（colaabb/coline/colsphere/triclipper），还原切割几何公式（线段-球/三角裁剪）；
2) 读 macho/exe 数据段，闭合 §7 常量清单：固定步长(PTR+0x44/_DAT_0197f47c)、轨迹时长(DAT_00016614/_DAT_016f2018)、combo 窗口(DAT_00017024/00017028)、命中率 K/SCALE(DAT_00065b70/b74)、特效位掩码 DAT_005d4d74；
3) exe 侧用 RTTI 类 Fruit/SlashEntity 虚表 +0x24 反查 OnSliced 实现，与 macho 语义对齐。
输入由 Kimi 准备（DeepSeek 只用本任务卡 + findings）。

### [T-007] done :: 残余常量闭合 + exe OnSliced 虚表反查 + 碰撞层同体比对
- 创建: 2026-10-30T23:10:00+08:00　更新: 2026-10-30T22:32:12+08:00
- 验收: pending_constants.md 更新版：遗留项全部闭合或有明确结论；新增 findings/on_sliced_exe.md 虚表对齐表
- 备注: 输入已就绪（7 份 findings），含 Kimi 取数结论 A-E

承接 slash_geometry.md §7 与 pending_constants.md §3：
1) exe 侧 0x16F2028(应15.0)/0x16F2018(应0.05) 读数异常根因排查：先用 DumpData bytes 模式 dump 两个地址 ±16 字节邻域，再在 .rdata 段按目标 float 值(0x41700000/0x3D4CCCCD)全段反查实际地址；
2) DAT_004d90b4 二次解引用（读 ptr:0x4d90b4:0x0:f32，即 0x5d4cd0 处的值）；
3) FUN_002ed344 vs ctx->vtable+0x0C 是否同一函数体（DumpByName 导出 0x2ed344 比对签名与体）；
4) exe RTTI .?AVFruit@@ → vftable 读 +0x20/+0x24/+0x28 三槽地址并反查函数名，与 macho OnSliced(+0x24) 对齐；
5) Globals 单例 PTR_DAT_004d9048 结构 +0x00..+0x48 一次性 dump（闭合开关 0x18/0x0A、dt 槽 0x44）。

【Kimi 已完成的取数结论，直接采用】
A) exe 读数异常根因=Debug 版浮点常量存为 double（8 字节）：0x16f2018=0.05、0x16f2028=15.0、0x16f29f0=0.5、0x197f47c=0.0(初值)，与 macho 全合 → exe 侧全部闭合。
B) macho DAT_004d90b4 与 PTR_DAT_004d9048 的 GOT 槽均指向 ARM 代码桩（懒绑定），静态不可解 → 结论写「运行时求值」。
C) 0x52bfe0/e4/e8 = 12 字节全 0 → off 默认零向量确认。
D) exe RTTI：COL 已批量定位（rtti_vtables_exe.md），但 vftable[-1]→COL 反查无命中，需你分析原因并给出结论（可能：vftable 运行时构建/段遗漏/布局差异）。
E) FUN_002ed344 全量反编译在 deep_collide_2ed344.md，与 slash_geometry.md §5 的 vtable+0x0C 契约比对同体性。

### [T-008] pending :: on_sliced_exe.md 截断补齐（低优先）
- 创建: 2026-10-30T23:30:00+08:00　更新: 2026-10-30T23:30:00+08:00
- 验收: on_sliced_exe.md 落盘：三条路径评估+推荐、同体性结论
- 备注: 低优先：核心契约（vtable+0x24=OnSliced）已在 slash_geometry 定案，本任务为锦上添花

T-007 因 thinking 占用 23K/32K token 导致 on_sliced_exe.md 在 §1 处截断未落盘。任务：基于 rtti_vtables_exe.md 的 COL 数据 + vtables_fruit.md（0 符号，RTTI 分析器未跑），给出 exe 侧 Fruit/SlashEntity 虚表槽位对齐的三条可行路径评估（重跑 RTTI 分析/扫 ARM literal pool/Frida），并给出推荐；同时完成 FUN_002ed344(=0x2ee2a0) 与 vtable+0x0C 同体性比对（deep_collide_2ed344.md 已导出）。输出 findings/on_sliced_exe.md，≤4000 字符。

### [T-009] done :: Phase 2 重建蓝图：工程结构 + GameState + 核心系统接口
- 创建: 2026-10-30T22:50:00+08:00　更新: 2026-10-30T22:44:27+08:00
- 验收: blueprint/REBUILD_BLUEPRINT.md（≤3万字符）+ blueprint/Constants.swift + blueprint/GameState.swift 三个文件块
- 备注: Constants.swift(11.5K)+GameState.swift(5.7K) 已落盘；REBUILD_BLUEPRINT.md 因 32K 上限截断，转 T-010 重写

基于逆向结论起草 iOS 27 重建蓝图。【Kimi 的架构约束，必须遵守】
1) 渲染：SpriteKit（SKEmitterNode 粒子/SKShapeNode 刀光/纹理 atlas），不复刻 OpenGL ES；120Hz 由 CADisplayLink+SpriteKit 自动适配；
2) 语言：Swift 6 (Strict Concurrency)，模块划分用 Swift Package 子模块；
3) 架构：Entity-Component 轻量自研（参照原 EntityManager 语义，不引入第三方 ECS）；
4) 逻辑帧：可变 dt + 上一帧 dt 缓存兜底（原逻辑如此，core_logic_notes §6），不做固定步长；
5) 数值一律以 core_logic_notes/slash_geometry 的 macho 列为准；
6) 存档：原 XML 键名保留（findings 中 macho 侧键名），用 Codable+JSON 或 PropertyList，需给出迁移映射表。
【蓝图内容】a) 工程目录树（target/package 划分）；b) GameState 结构体（22 字段表→Swift，含语义注释）；c) 核心协议/类接口：GameLoop、Entity/EntityManager、SlashTracker（8 槽环形缓冲）、HitTest（两段式公式直译）、ComboSystem（窗口 0.1/0.095、双档 clamp）、ScoreSystem（溢出保护、命中率公式 K=-0.2*SCALE=100）、WaveManager（WaveInfo/Spawner 默认值表）、BombSystem（3.2/1.6/2.0/9.0、哨兵-2）、FreezeSystem；d) Constants.swift 草案（全部已闭合常量）；e) 资产清单（从 ipa/assets 可提取项：贴图/xml/mmd→转换策略）；f) 风险与开放问题清单。
所有结论标注来源（core_logic_notes §x / slash_geometry §x / function_classification §x）。

### [T-010] done :: REBUILD_BLUEPRINT.md 重写（仅主文档）
- 创建: 2026-10-30T22:58:00+08:00　更新: 2026-10-30T22:49:51+08:00
- 验收: REBUILD_BLUEPRINT.md 完整落盘（含工程结构树、7 个核心系统接口签名、资产策略、风险清单）
- 备注: 输出纪律：单文件、≤14K 字符、不重复已落盘内容

T-009 的蓝图主文档因输出上限截断。本轮只写 blueprint/REBUILD_BLUEPRINT.md 一个文件，已落盘的 blueprint/Constants.swift 与 blueprint/GameState.swift 不要再重复输出。内容按 T-009 任务卡的 a/c/d/e/f 项（工程结构、核心系统接口、资产清单、风险清单），其中 GameState 结构体一节只写「见 GameState.swift + 字段语义速查表」即可，避免重复。总长度 ≤ 14000 字符，宁可压缩文字分析也要把接口签名写全。

### [T-011] done :: project.yml + FNPBCore 可编译骨架
- 创建: 2026-10-30T23:15:00+08:00　更新: 2026-10-30T23:12:53+08:00
- 验收: 3 个文件块解析落盘；GameWorld.tick 的 10 步桩与 §1.2 一一对应
- 备注: Constants/GameState 已落盘，禁止重复输出

基于 blueprint/ 三件套生成可编译骨架。【不要重复输出】Constants.swift / GameState.swift / REBUILD_BLUEPRINT.md——它们已在工作区 blueprint/ 下，骨架文件直接 import 引用即可（本轮把 Constants.swift/GameState.swift 视为已存在）。
只输出 3 个文件块（总 ≤20K 字符，宁可省文字）：
1) project.yml：XcodeGen 定义（App target iOS deployment 26.0、FNPBCore/FNPBRender/FNPBPlatform/FNPBUI 四模块、FNPBCoreTests；源文件路径映射蓝图目录树）；
2) Sources/FNPBCore/Loop/GameWorld.swift：GameTicking 协议的默认实现骨架——tick 内按 core_logic_notes §1.2 的 10 步顺序写方法桩（每步一个 private func 空实现+注释锚点），GameServices 依赖容器定义放这里；
3) Sources/FNPBCore/Time/TimeDriver.swift：FrameStamp/FrameDriving/FixedStepDriver 完整实现（advance 的 alpha 插值 + maxSubsteps 防死循环）。
要求：Swift 6 严格并发可编译（Sendable 标注齐全）；不臆造 API；import 只用 Foundation/simd。

### [T-012] done :: Slice 模块实现：两段式切割判定 + 对账测试
- 创建: 2026-10-30T23:20:00+08:00　更新: 2026-10-30T23:18:57+08:00
- 验收: 4 文件块落盘；测试覆盖判定两分支+近失+门控；每函数注释锚定 slash_geometry §x

直译 slash_geometry.md 的切割判定公式为 Swift，并写黄金值对账测试。
输出 4 个文件块：
1) Sources/FNPBCore/Slice/SliceGeometry.swift —— SlashTrail（8 槽环形缓冲、0.05s 采样）+ SliceQuery + HitTest 门控；
2) Sources/FNPBCore/Slice/ShapeIntersect.swift —— ShapeRef（sphere/line/triangle/aabb）与 ShapeIntersecting 实现：线-球/线-三角/球-球相交，contact 输出交点 vec3（对应引擎 vtable+0x0C 多态分发）；
3) Sources/FNPBCore/Slice/SliceTesting.swift —— SliceTesting 协议实现：两段式（①intersect ②球体二次确认：球心距离²、截面圆 k=sqrtf(r²-|pt|²)、±极值点 vs 切割半径²）+ isNearMiss（半径×1.5）；门控条件按 slash_geometry §1.1（radiusSquared>0 等）；normalize 处理零向量兜底；
4) Tests/FNPBCoreTests/SliceGeometryTests.swift —— 黄金值测试：直接命中(球心在切割半径内)、截面±极值两分支、近失 1.5× 边界、门控全假、轨迹缓冲 8 槽环绕。
类型复用 GameWorld.swift 的过渡 Entity/EntityID/EntityKind（本轮不迁移 ECS，只 import 同模块直接用）；数值常量引用 Constants.swift 的条目（若该文件无对应条目则在本模块内定义并注释 [macho H] 来源）；Swift 6 可编译，import 只用 Foundation/simd。

### [T-013] done :: Combo + Score 模块实现（带黄金值测试）
- 创建: 2026-10-30T23:25:00+08:00　更新: 2026-10-30T23:24:09+08:00
- 验收: 5 文件块落盘；测试覆盖窗口结算+溢出保护+命中率；每函数注释锚定 core_logic_notes §x

直译 core_logic_notes §2（连击）与 §3（计分/统计）为 Swift。
输出 5 个文件块：
1) Sources/FNPBCore/Combo/ComboTracker.swift —— ComboTracking 协议实现：registerSlice（窗口内计数、comboFruitTypes 记录、rhythmFactor 递减公式 -combo*(0.5*rand/8+0.75)、特殊果 +0x1ba 分支、同一实体防重复 +0x180）、tickWindow（+0x174 推进：>=0.095 封顶、到期结算派发 settle 事件、结算后 memset 0xff 语义、combo>9 窗口置 0.095）、reset；
2) Sources/FNPBCore/Combo/ComboTier.swift —— visual=clamp(combo-3,0,2)、text=clamp(combo-2,1,5)、isEffectActive(combo>2) [both 双源]；
3) Sources/FNPBCore/Score/ScoreSystem.swift —— ScoreDispatching 实现：事件序号、延迟回调队列(delay==0 或 delay<seq&&mode==1 出队)、总分累加、溢出保护(mode==4 不归零；其余 mode!=5 超 0x7fffffff 归零)；
4) Sources/FNPBCore/Score/StatsRecorder.swift —— StatsRecording 实现 + Accuracy 命中率公式：(total+X+K*misses*total)/total，K=-0.2、SCALE=100，负值归零；
5) Tests/FNPBCoreTests/ComboScoreTests.swift —— 黄金值测试：combo 窗口推进/到期结算/0.095 封顶/combo>9 收紧、双档 clamp 边界、溢出保护两模式、命中率手算用例。
协议签名以 GameWorld.swift 的过渡声明为准（该文件未落盘类型不得出现在签名里）；数值引用 Constants.swift 或本模块内定义并标 [macho H]；GameState 字段用 GameState.swift 的真实字段名；Swift 6 可编译。

### [T-014] done :: Wave 模块：内容类型 + WaveDirector + 生成器（带测试）
- 创建: 2026-10-30T23:30:00+08:00　更新: 2026-10-30T23:28:58+08:00
- 验收: 4 文件块落盘；测试覆盖默认值/until/权重/freeze/炸弹状态机

直译 core_logic_notes §4/§5 与 function_classification M10/M19 为 Swift。
输出 4 个文件块：
1) Sources/FNPBCore/Content/ContentTypes.swift —— WaveInfo/Spawner/SpawnerFruit/FruitInfo 的 Codable 定义，默认值逐项对齐 core_logic_notes §4.1/§4.2/§4.5（chanceRegrowth 0.25、criticalChance 1.0(float 概率)、beforeDelay 2.0、overridePoolID 10、overrideChance 100、FruitInfo scale 25.0/collision 1.0/hitInfluence 0.75、bomb.size/collision）；until 语义后处理（'forever'→-2；atoi 后仅 >=waveNo 采纳；末尾 -1→-2）做成静态函数并注释 [macho] 独有；
2) Sources/FNPBCore/Wave/SpawnTable.swift —— 按 chance 累计和的权重抽取（M19：param_1[1] 累加、二分或线性抽取），使用 RandomSource 协议；炸弹哨兵 -2/空槽 -1 语义；
3) Sources/FNPBCore/Wave/WaveDirector.swift —— WaveDirecting 实现（签名必须与 GameWorld.swift 的过渡协议一致：tick(dt:state:world:)）：beginGame 载入 waves、freeze 倒计时（>0 递减、归零触发 OnFreeze 语义与 +0x208 计数）、生成循环（遍历 spawner、+0x18<2 走概率池、ID==-2 炸弹触发爆炸、计时 max(0,x+speed*dt)）、炸弹状态机 0→1→2（+0x17c=rand*10+10）、forceSpawn；
4) Tests/FNPBCoreTests/WaveTests.swift —— 黄金值测试：默认值表全项、until 三种输入后处理、权重抽取分布（固定 RandomSource 种子可复现）、freeze 归零触发一次、炸弹状态机迁移。
数值引用 Constants.swift 或本模块定义并标 [macho H]；协议/类型复用 GameWorld.swift 过渡定义；Swift 6 可编译。

### [T-015] done :: ECS 迁移转正 + 实体运动（水果抛物线）
- 创建: 2026-10-30T23:35:00+08:00　更新: 2026-10-30T23:33:52+08:00
- 验收: 5 文件块落盘；GameWorld 过渡类型节消失且 10 步桩原样；测试通过生成序与积分器手算

把 GameWorld.swift 的过渡占位类型迁移为正式 ECS 模块，并实现水果运动。
输出 5 个文件块：
1) Sources/FNPBCore/ECS/Entity.swift —— 正式 Entity/EntityID/EntityKind/EntityTransform/EntityPrototype（从 GameWorld.swift 迁移并扩展：EntityPrototype 含 kind+初始 transform+fruit 可选 FruitInfo；状态槽三字段保留 Int32 不 enum 化）；
2) Sources/FNPBCore/ECS/EntityStore.swift —— 正式 EntityStore 协议（蓝图 S2 全签名：spawn/despawn/entity/forEach/aliveCount/clear）+ GenerationOrderStore 实现（数组存储、生成序遍历，禁止 Dictionary 无序遍历）；
3) Sources/FNPBCore/Entities/FruitMotion.swift —— 抛物线运动积分器：gravity 加速度、初速、旋转、离屏判定回收；⚠️ 重力/初速真值未从 macho 提取（ FruitInfo 只有 disappear_speed/scale 等部分键）→ 用 Constants.Physics 占位并逐条标 [待验证]，把参数全部注入化便于后续 Frida 闭合后只改常量；
4) Sources/FNPBCore/Loop/GameWorld.swift —— 【完整重写该文件】删除过渡类型节（Entity/EntityStore/EntityKind/EntityID/EntityTransform），改为 import 引用 ECS 模块；10 步桩保留不动；协议节（SliceTesting/ComboTracking/ScoreDispatching/StatsRecording/WaveDirecting/AudioPlaying/EffectEmitting/RandomSource/ComboEvent/StatsKey/GameServices/GameTicking）保留在原地；
5) Tests/FNPBCoreTests/EntityStoreTests.swift —— 生成序遍历、spawn/despawn 后 id 稳定、clear；FruitMotion 积分器手算用例（已知重力下 1/60 步的位置/速度）。
关键约束：迁移后全工程只能有一份 Entity 定义；GameWorld 重写不得改动 10 步桩的任何注释锚点；Swift 6 可编译。

### [T-016] done :: FNPBPlatform 平台层 + App 壳
- 创建: 2026-10-30T23:40:00+08:00　更新: 2026-10-30T23:39:29+08:00
- 验收: 5-6 文件块落盘；App 入口能把 FrameStamp 驱动到 GameWorld.tick；存档键名与 macho 一致

实现蓝图 S1/S7 的平台胶合层与 App 入口。
输出 5 个文件块：
1) Sources/FNPBPlatform/DisplayLinkDriver.swift —— FrameDriving 完整实现：CADisplayLink 包装、CAFrameRateRange(min:60,max:preferred:) 120Hz 设置、targetTimestamp 算 dt、start/stop、actualFrameRate；@MainActor；
2) Sources/FNPBPlatform/TouchRouter.swift —— TouchRouting 实现：UIKit touch（UIKit  import 仅限本文件）→ SIMD3 世界坐标，坐标换算依赖注入（logicalSize 提供者闭包），began/moved/ended 时间戳用 hostTime；
3) Sources/FNPBPlatform/AudioEngine.swift —— AudioPlaying 实现：AVAudioEngine 或 AVAudioPlayer 简单实现，按 key 从 ContentBundle 取音效文件，音量/同时播放数上限参数化；
4) Sources/FNPBPlatform/Persistence.swift —— 存档读写：键名保留原版（macho M08/M09：version/highscore/%shighscore/critical_chance/rated/challengeData 等），Codable+JSON 存 ApplicationSupport，给出原 XML 键→新 JSON 键的迁移映射表注释；
5) App/FNPBApp.swift + App/Info.plist（两个文件块或合并为一个 FILE 块用目录前缀分开均可——分开更稳）——SwiftUI App 入口：组装 GameWorld+GameServices+FixedStepDriver+DisplayLinkDriver+TouchRouter，ContentView 占位（Metal 渲染接入点留 TODO 注释）。
约束：import UIKit/SwiftUI 仅限 FNPBPlatform 与 App；FNPBCore 协议签名以 GameWorld.swift 为准；不臆造 API，不确定标 [待验证]。

### [T-017] done :: 资产管线：.tex→PNG、xml→json、mmd 结构分析
- 创建: 2026-10-30T23:45:00+08:00　更新: 2026-10-30T23:41:24+08:00
- 验收: 4 文件块落盘；tex_convert 有尺寸校验与 selftest；manifest 覆盖全部 264 个 tex
- 备注: 管线落盘并已实跑：解包成功(assets_raw/inventory)；tex 72/264 成功（LA88/RGBA4444/ABGR4444/RGBA8888）；192 失败暴露 .tex 家族真实复杂度（4 变体），转 T-018

用 Python（工作区自带 Pillow/numpy）写构建期资产转换 CLI。【Kimi 已完成的格式侦察，直接采用】
- IPA 内层 assets.zip 含：tex×264、ogg×227（无需转换）、xml×68、mmd×60(HBR0 分块)、binmodel×46、uiscreen×20、str×12、vs/fs 着色器×6+6(GLSL ES)、ttf×4；
- .tex 头部 12 字节：[type u8][? u8][? u16][width u16][height u16][ff ff ff ff]，其后像素数据；样例 64×32 文件 4108B=12+64*32*2 → 16bpp（候选 LA88 或 RGBA4444，用样例字节 '40 ff' 重复模式判定，写转换器时做尺寸公式校验：size-12 == w*h*2 不成立则尝试 4bpp/8bpp 变体并在 manifest 标 warning）；
- .mmd：'HBR0' magic + 版本号 u32 + 块长 u32 的嵌套分块（02/01/00 层级样例见侦察）。
输出 4 个文件块：
1) tools/AssetPipeline/extract.py —— ipa→assets.zip→Raw/ 解包 + 全量清点报告（按扩展名计数、尺寸范围）；
2) tools/AssetPipeline/tex_convert.py —— .tex→PNG（Pillow）+ manifest.json（原路径/输出路径/宽高/格式判定置信）；CLI 参数 in_dir/out_dir，可单文件调试；
3) tools/AssetPipeline/xml_convert.py —— xml→json（保留属性/文本/层级； fruitlist.xml/wave 相关 xml 输出后人工抽检样例写进文件头注释）；
4) tools/AssetPipeline/MMD_FORMAT.md —— 基于样例字节与 binmodel/mmd 数量给出 HBR0 容器格式分析报告（chunk 头布局、已确认/推测标注、下一步完整解析器的接口建议）；不实现 mmd 解析器本体（后续任务）。
约束：只用标准库+Pillow+numpy；Windows 可跑；每个转换器带 --selftest（用合成 .tex 样例验证往返）。

### [T-018] done :: .tex 全格式谱系分析 + tex_convert 扩展
- 创建: 2026-10-30T23:55:00+08:00　更新: 2026-10-30T23:53:13+08:00
- 验收: tex_convert.py 重写 + TEX_FORMAT.md；全量转换 ok 率 100%（external_palette 灰度兜底计入 ok）
- 备注: Kimi 已实跑现有管线并侦察 4 变体特征；样例字节在任务卡里

扩展 tools/AssetPipeline/tex_convert.py 覆盖全部 264 个 .tex。【Kimi 实跑侦察结论，直接采用】
1) 变体 A（已成功 72 个）：传统二进制头 [type u8][b1 u8][field u16][w u16][h u16][ff ff ff ff] + 16bpp 像素（type 06=LA88、另有 RGBA4444/ABGR4444/RGBA8888 子型，现有代码已覆盖）；
2) 变体 B（78 个）：type∈{4,5,6,7,8,9,10} 且 payload 恰 == w*h/2 → 4bpp 纯索引，调色板不在文件内——转换器先输出索引灰度图（palette=灰度16级）并在 manifest 标 needs_external_palette，同时给出调色板来源的候选调查思路（fruitlist.xml colour 键/binmodel 伴随文件/全局默认调色板）；
3) 变体 C（107 个）：ASCII 魔数 'TEX   ' 扩展容器，样例 hud_cross.tex 32820B：magic 后 [u32=3][7 字节 08 01 08 04 08 03 08 疑为通道描述][u32=2][尺寸域含 0x80/0x40][256?×64?] + 32bpp 像素（'#3Q ' 重复模式，疑 RGBA32，128×64×4=32768≈payload）；需你解析头布局（给出字段偏移假设表+尺寸校验），支持 RGBA32 输出；
4) 变体 D（少数）：payload 比 w*h/2 多 16424/4136/65576 等字节——疑似 mipmap 链或内嵌调色板，给出判定逻辑（尝试把多余字节解释为 mip 链：w/2×h/2 递推校验）。
输出 2 个文件块：tools/AssetPipeline/tex_convert.py（完整重写，覆盖 A-D + selftest 覆盖每变体合成样例）、tools/AssetPipeline/TEX_FORMAT.md（格式谱系文档：每变体头部布局表、判定决策树、未决问题清单）。
验收硬指标：assets_raw 全量 264 个转换后 ok+external_palette 计数 == 264（跑 python tex_convert.py assets_raw assets_png 验证）。

### [T-019] done :: FNPBRender Metal 渲染层
- 创建: 2026-10-31T00:00:00+08:00　更新: 2026-10-30T23:58:32+08:00
- 验收: 5 文件块落盘；MTKView 可嵌入 SwiftUI；submit 分桶逻辑完整

实现蓝图 S7 的 Metal 渲染层，素材用 assets_png 的真实图集。
输出 5 个文件块：
1) Sources/FNPBRender/MetalContext.swift —— 设备/命令队列/渲染管线描述符缓存；MTKView 包装（UIViewRepresentable 供 SwiftUI 用，import SwiftUI/UIKit 仅限本文件）；
2) Sources/FNPBRender/SpriteBatch.swift —— SpriteInstance（位置/尺寸/旋转/色调/UV 子矩形）、SpriteBatch、BlendMode（opaque/alpha/additive）；实例数据用 MTLBuffer 每帧上传的队列设计；
3) Sources/FNPBRender/RenderSurface.swift —— 蓝图 S7 RenderSurface 协议完整实现：configure(SurfaceRequest)（drawableSize 变化重建 viewport 与逻辑坐标系，注释锚定原 glViewport+15.0 归一化语义）、beginFrame/submit(按 texture+blend 分桶)/endFrame；logicalSize 参与切片半径换算的注释说明；
4) Sources/FNPBRender/Shaders/sprite.metal —— 顶点（实例变换+UV）+ 片元（纹理采样×色调）着色器，支持 additive 混合的编译时常量或双管线；
5) Sources/FNPBRender/TextureLoader.swift —— TextureLoading 实现：PNG→MTLTexture（纹理图集整页加载，UV 子矩形由调用方给出），缓存去重。
约束：渲染层不 import FNPBCore 以外的游戏逻辑（FNPBCore 仅取 SurfaceRequest 等纯值类型——若蓝图里 SurfaceRequest 定义在渲染层则保持）；120Hz 下无阻塞（命令提交不占主线程超 1ms 的注释说明）；不臆造 Metal API，不确定标 [待验证]。

### [T-020] done :: CI 验证链：GitHub Actions macOS 编译+测试
- 创建: 2026-10-31T00:05:00+08:00　更新: 2026-10-31T00:05:06+08:00
- 验收: workflow 语法合法（可被 actionlint 思路人工检查）；排障清单 ≥8 条具体可操作

设计本工程第一条验证链。【Kimi 的架构约束】
- 触发：push/PR 到 main + workflow_dispatch；
- runner：macos-15（Xcode 26）；步骤：checkout → brew 装 xcodegen（锁版本）→ xcodegen generate → xcodebuild build（FNPIB scheme，Debug）→ xcodebuild test（FNPBCoreTests，iPhone 17 模拟器）→ 上传 xcresult/xcpretty 日志产物（失败时）；
- 资产步骤：不需要真机资源即可编译（ContentBundle 加载失败应降级为占位，检查现有 ContentTypes 代码是否编译期依赖资产文件——如依赖，workflow 里加一步从 Raw 生成最小 ContentBundle 或用空目录）；
- 并发/矩阵：单矩阵即可，加 timeout-minutes: 40。
输出 2 个文件块：
1) .github/workflows/ios.yml —— 完整 workflow；
2) docs/CI_FIRST_BUILD.md —— 首次编译排障清单：基于对现有代码的审查，列出 10 个最可能的编译错误（Swift 6 严格并发的 Sendable 违例、any 协议、GameServices 非 Sendable 跨 actor、FNPBCoreTests 的 @testable import、blueprint/ 编入模块的路径、Metal shader 编译期检查、Info.plist 与 GENERATE_INFOPLIST_FILE 冲突等），每条给症状+修法；
并在文件头说明：本仓库尚未推 GitHub 时的本地替代命令（xcodegen generate && xcodebuild 一行命令）。

### [T-021] done :: FNPBUI 界面层 v1：五个核心屏幕
- 创建: 2026-10-31T02:33:56+08:00　更新: 2026-10-31T02:49:23+08:00
- 验收: Sources/FNPBUI/ 下 ≥4 个 swift 文件落盘；project.yml 对应依赖无需改动或同步改；screen 枚举与 uiscreen 文件名一一对应；不臆造 FNPBCore 字段，全部经 GameSnapshot 注入
- 备注: 8 文件落盘（ScreenID/GameSnapshot/UISupport+5 屏幕）；CI success（3d9db404）；曾因提取截断丢 UIActions 已修复；素材全部走语义 key 待资产清单回填

实现 FNPBUI 界面层第一批（蓝图 S8 的 v1 切片，纯 SwiftUI，import SwiftUI/UIKit 仅限本 target）。
【锚点：原版界面清单，来自 IPA 解包 assets_raw/xml/screens/ 的 20 个 .uiscreen 文件名，逐字抄录】
mainscreen / gamemode / inGameClassic / inGameAdventure / inGameChallengeHud / inGameChallengeBackground / inGameChallengeInstructionsScreen / inGameChallengeMapScreen / inGameChallengeScoreScreen / inGameChallengeScoreScreenComplete / inGameChallengeScoreScreenCompleteFailure / pause / results / extras / about / newsscreen / newsscreenFruitNinja / newsscreenJetpack / shopScreen / Background
v1 只做 5 个：mainscreen、gamemode、inGameClassic（HUD）、pause、results。其余 15 个在 ScreenID 枚举里占位（case 齐全+注释锚定对应 uiscreen 文件名），不实现视图。
【架构约束（不可违反）】
1) FNPBUI 不得 import FNPBCore 的具体类型去直接读字段——定义纯值结构 GameSnapshot（score/lives/timer/comboCount/bestScore/pauseVisible/result 等），由 App 层每帧或事件驱动组装注入（@Observable 或 @StateObject 均可，但 Snapshot 结构本身 Sendable、无游戏类型）；
2) 反向通路走闭包/Intent 回调（onPauseTapped/onResumeTapped/onRestartTapped/onQuitTapped/onModeSelected 等），UI 不直接持有 GameWorld；
3) import UIKit 仅限需要 UIViewRepresentable 的文件（如把 TouchRouter.captureView / MetalContext 的 MTKView 嵌入 SwiftUI 的桥接器——若蓝图已把桥接放在 FNPBRender/FNPBPlatform，则 FNPBUI 只用其公开包装类型）；
4) 背景图/按钮图：assets_png/ 下已有 .tex 转换产物，用 Image(uiImage:) 加载并写清单注释（用了哪些文件、对应哪个 uiscreen 元素）；找不到对应素材的元素用色块占位 + [待验证] 注释，禁止臆造资源名；
5) 横竖屏：原版为横屏游戏（macho 启动即 landscape），v1 只保证横屏布局正确，竖屏加 .ignoresSafeArea 级别的简单适配即可，标注 [待验证]。
输出 4 个文件块：
1) Sources/FNPBUI/ScreenID.swift —— 20 case 枚举 + 每个 case 锚定 uiscreen 文件名的注释；
2) Sources/FNPBUI/GameSnapshot.swift —— 快照值结构 + ViewModel 协议（Blueprint 风格的单向数据流）；
3) Sources/FNPBUI/Screens/MainMenuScreen.swift + GameModeScreen.swift（一个 FILE 块两个类型也可，分开更稳）；
4) Sources/FNPBUI/Screens/InGameHUDScreen.swift + PauseScreen.swift + ResultsScreen.swift；
约束：不臆造 FNPBCore/FNPBRender 的 API（拿不准的写 [待验证] 并在文件头列出疑问清单）；Swift 6 并发模式——ViewModel 协议标 @MainActor；每个屏幕文件头注明锚定的 uiscreen 名与主要元素（分数/暂停按钮/生命图标/连击横幅…）。

### [T-022] done :: App 装配层 T-022：GameHost 真实服务接线 + UI 五屏闭环
- 创建: 2026-10-31T02:51:24+08:00　更新: 2026-10-31T11:23:02+08:00
- 验收: FNPBApp.swift 重写后 CI 绿；占位服务仅剩 EffectEmitting；触摸写入 GameState 真实字段；五屏随 UIPhase 切换
- 备注: CI success(4de799d6)；注入截断导致 10 处猜测，Kimi 已逐点修正（UIActions 无标签 init/TouchRouter 单回调/SaveData 无 soundEnabled/FixedStepDriver.advance(delta:)/GameServices.rng/GameSnapshot 参数顺序等）；SliceQuery provider=prevSlashPos→hitPoint 线段占位 [待验证]

重写 App 装配层，打通「菜单→开局→游玩→暂停→结算→重开」闭环（蓝图 S1 收口 + S8 接线）。

【Kimi 已核准的接口事实，直接采用（均已编译验证，勿再存疑）】
- GameState 真实字段（blueprint/GameState.swift，已编入 FNPBCore）：hitPoint: SIMD3<Float>（=macho game+0x10/14/18 触摸点）、slashTrailActive: Bool（=+0xa5）、slashTrailTimer: Float（=+0x17c）、comboCount/comboWindowTimer/comboFruitTypes/comboTypeFlag、missPenaltyCount、specialFruitBonusEnabled、specialOrBombMarked、isFaulted、sliceRadiusSquared 等；
- 真实服务类（全在 FNPBCore）：SliceTester()（init(intersector:queryProvider:)，queryProvider 给默认实现即可，provider 内部从 GameState 组 SliceQuery——切割形状暂用 .line 占位并注明 [待验证]）；ComboTracker(stats:specialFruitBonus:)；ScoreSystem()（total 只读）；StatsRecorder()；WaveDirector(playerCount:rng:)；
- EffectEmitting 无真实实现，**保留 PlaceholderEffectEmitter**（文件内注明待特效任务卡）；
- RandomSource 保留现有 SplitMix64Random（PRNG 序列 [待验证]，勿动）；
- 存档：SaveStore.load()/save() 与 SaveData.highscores 沿用，最高分键语义见 FNPBPlatform 存档映射注释。

【触摸接线（macho §1.2 语义，直接采用）】
began → state.hitPoint = position; state.slashTrailActive = true；
moved 且 slashTrailActive → state.hitPoint = position；
ended → 无操作（轨迹由 slashTrailTimer 超时自清，原版同款）。
GameWorld 十步仍是桩，写入暂无人消费——这是预期，不许因此删掉接线。

【五屏闭环（FNPBUI T-021 已落盘，接口以 GameSnapshot.swift 为准）】
1) 新增 App/AppViewModel.swift：@Observable @MainActor final class AppViewModel: FNPBUIViewModel——持 GameHost 引用，phase 状态机（mainMenu→modeSelect→playing→paused→results），send(_:) 实现全部 UIIntent（selectMode 开局、pause 停 DisplayLink、resume 重启 DisplayLink、restart 重置全套状态、quitToMenu、toggleSound 切 AudioEngine masterVolume 并落 saveData）；snapshot 每帧由 handleFrame 末尾组装（score←ScoreSystem.total、bestScore←saveData、combo←ComboTracker 当前值经 clamp(combo-3,0,2) 视觉档位与 clamp(combo-2,1,5) 文本档位、文本占位 "COMBO" [待验证]、result 在转入 results 时组装）；
2) 重写 App/FNPBApp.swift 的 ContentView：按 vm.snapshot.phase switch——mainMenu→MainMenuScreen、modeSelect→GameModeScreen、playing/paused→ZStack{ Metal 渲染视图(TODO 可先纯黑底+注释锚点)、TouchSurfaceView、InGameHUDScreen }（paused 再叠 PauseScreen）、results→ResultsScreen；每屏传 (snapshot: vm.snapshot, actions: vm.actions)；
3) GameHost 改造：init 用真实服务替换 5 个占位（保留 EffectEmitting 占位与 SplitMix64Random）；handleFrame 末尾调 vm 刷新快照；新增 startGame(mode:)/restart()/quitToMenu() 三个流程方法（重置 GameState()、store.clear()、score.reset()、combo.reset(state:)、waveDirector.beginGame(waves: [WaveInfo()]) 占位波次 [待验证]、DisplayLink start/stop）；
4) GameHost 保留 handleScenePhase/persist 现有语义。

【硬约束】import 关系不许变（App 可 import 全部四模块；FNPBUI 不许新增模块依赖）；Swift 6 严格并发：AppViewModel 全类 @MainActor；不臆造任何 API（每个调用点必须与注入文件里的签名一致）；GameWorld.tick 调用签名以 GameWorld.swift 为准。
【已知会翻车点，先想清楚再写】
a) GameHost 持有 AppViewModel、AppViewModel 持有 GameHost → 用 weak 或单向持有+闭包打破循环；
b) ObservableObject(GameHost) 与 @Observable(AppViewModel) 混用：统一走 AppViewModel 暴露 @Published 等价物（@Observable 的 @Observable 宏属性即可）；
c) FNPBUIViewModel 要求 class 类型且 @MainActor——实现头照抄协议声明；
d) 切割 radius：state.sliceRadiusSquared 初值 0 → HitTest 门控永不通过，开局时在 startGame 写入 Constants.Slash 系的合理初值（15.0² 归一化语义见 RenderSurface 注释），标注 [待验证]。

### [T-023] done :: GameWorld 十步实装（R1 主循环全链）
- 创建: 2026-10-31T11:24:03+08:00　更新: 2026-10-31T11:43:12+08:00
- 验收: 十步全部有实现或显式 [待验证] 守卫（step8 允许留桩）；SlashTrail 入 GameState；新增 ≥5 个单测覆盖步骤 2/3/4/9/10；CI 全绿
- 备注: CI success(0ac40ace)；13 测试全过；控制流修正已裁决接受；levelTier=4 开局写入 [待验证]；harness extra_files 截断 bug 已修（根因）

实装 GameWorld 的十步主循环（Sources/FNPBCore/Loop/GameWorld.swift）。step1 已完成；step2~step10 现为桩。本卡完成后「切中水果→连击→计分→波次→结束」在纯逻辑层可测。

【事实底账（Kimi 已核准，勿再存疑）】
- GameServices 字段：slice/combo/score/stats/waves/audio/effects/rng，全协议存在体（GameWorld.swift:104）。
- GameState 真实字段表在 blueprint/GameState.swift（已注入）：hitPoint/slashTrailActive/slashTrailTimer/comboCount/comboWindowTimer/comboFruitTypes/missPenaltyCount/specialFruitBonusEnabled/specialOrBombMarked/isFaulted/sliceRadiusSquared 等。
- SlashTrail 已实现（SliceGeometry.swift 已注入）：struct，advance(dt:point:) 严格复刻原环形缓冲（isActive 时 elapsed+=dt；elapsed>0.05 写槽并清 active/elapsed），begin()/clear()/reset()。**把 SlashTrail 实例放进 GameState**（新增 `public var slashTrail: SlashTrail = SlashTrail()`，GameState 已 Equatable → 给 SlashTrail 补 Equatable），step3 改为驱动它并同步 slashTrailActive/slashTrailTimer 两个镜像字段。
- 切割判定两段式：SliceTesting.isSliced(game:entity:)（queryProvider 已在 App 层注入，逻辑层直接用），炸弹近失 isNearMiss（半径 ×1.5，L4 仅限炸弹循环）。
- ComboTracker（已注入）：registerSlice(fruitType:entity:state:rng:) -> ComboEvent?（内部处理窗口/档位/近失计数）；tickWindow(dt:state:) -> [ComboEvent]；reset(state:)。ComboTier 档位常量见 ComboTier.swift。
- ScoreSystem.dispatch(score:comboType:isScoring:mode:) -> Int32；StatsRecorder.add(_:_:)/report(_:_:)；StatsKey 枚举含 slashes/slashesScoring/totalfruit/combos/nearMiss/bomb/freeze 等。
- AudioPlaying.play(_ key: String)（占位音效 key，注释 [待验证]）；EffectEmitting.emit(_ kind: Int32, at: SIMD3<Float>)（占位实现，直接调用即可）。
- WaveDirector.tick(dt:state:world:) 已实现（步骤 10 第一步）。
- 实体：Entity/EntityPrototype/EntityKind/GenerationOrderStore（已注入 ECS 文件）；水果运动 FruitMotion.swift（T-015）已有 advance 函数，step6 的水果位移若原逻辑含在循环 A 内则调用它，否则注明位移在何处推进 [待验证]。
- Entity 的 kind 判定：EntityKind.fruit ↔ 原 type=1；EntityKind.bomb ↔ type=2；特殊果 kind 见枚举（若缺失特殊果 kind，在 EntityKind 增 case 并注释）。

【逐步要求】
1. step2 碰撞半径归一化：d=|hitPoint|（vec3 长度）；w = (d/15.0 <= 1.0) ? 0.5*(d/15.0)+0.5 : 1.0；state.sliceRadiusSquared = w*w（[待验证] 原式输出到全局最大值，重建直接写状态字段并注明差异）；常量用 Constants 里已有的值，禁止裸数字（15.0/0.5/1.0 查 Constants.swift）。
2. step3：驱动 state.slashTrail.advance(dt:point:state.hitPoint)；注意原语义 isActive==0 时 elapsed=0（SlashTrail.advance 已含）——镜像字段 slashTrailTimer 赋 slashTrail.elapsed、slashTrailActive 赋 isActive。
3. step4：state.levelTier < 4 → state.levelEffectParam = 0 并返回 false（跳过实体遍历），否则 true；levelTier 默认 0 → 默认永远跳过遍历——⚠️ 这会锁死游戏，需核对 [待验证]：原 +0xb4 语义是否「levelTier」默认值在开局时被写为 ≥4。处理方案：在 step4 注释说明，并在 GameHost.startGame 已把 state 重置为 GameState() 的前提下，**本卡只实现判定本身**，默认值问题在风险点列出，Kimi 裁决。
4. step5 遍历门控：爆炸/冻结计时与全局位掩码属未闭合字段——冻结计时器在 WaveDirector.runtime，逻辑层读取 services.waves 无法访问 runtime（协议没有）→ 本步保持返回 true 并注释 [待验证] 三项门控来源，禁止臆造字段。
5. step6 循环A：world.forEach(kind: .fruit) 按生成序；逐实体——(a) 跳过已切标记（用 Entity 已有字段；无对应字段则读 state.specialOrBombMarked 前先查语义，不臆造）；(b) services.slice.isSliced(game: state, entity:) → 命中：state.slashTrail.begin()；调用 services.combo.registerSlice(fruitType: <实体 fruit 类型 id>, entity: entity.id, state: &state, rng: services.rng)，返回的 ComboEvent 若为档位升级→ services.score.dispatch(...)/stats.add(.combos, 1)/audio.play("combo_<tier>")/effects.emit；首切发 stats.add(.slashes,1)/.slashesScoring 语义对照 findings；(c) 特殊果：state.specialFruitBonusEnabled → 计分加 specialBonus（ComboTracker init 的 specialFruitBonus 已在 App 注入 0，此处只做状态标记判定，[待验证]）；(d) 切中后 despawn 实体 + effects.emit(0, at: entity 位置) + audio.play("splash")（音效 key [待验证]）。
6. step7 循环B：world.forEach(kind: .bomb)；isNearMiss → state.isFaulted = true + stats.add(.nearMiss, 1)（仅此处，L4 禁令不可推广）；炸弹被 isSliced 的爆炸结算在 step8 前的 [待验证] 段，本卡只做近失与 isFaulted 置位。
7. step8 循环C：保留桩，注释写清 L3 语义未闭合，不做任何逻辑。
8. step9：let events = services.combo.tickWindow(dt: dt, state: &state)；逐 event 分发 score/stats/audio/effects（档位事件对应 ComboTier）。
9. step10：services.waves.tick(dt:state:world:)（生成水果）；其余子系统顺序（score/stats/audio/effects）目前无逐帧 API → 只调 waves，其余注释 [待验证] 原调用点。
10. 新增 Tests/FNPBCoreTests/GameWorldTests.swift ≥5 测试：step2 半径归一化（d=0/7.5/30 三值）、step3 轨迹写槽与超时（advance 0.05 边界严格大于）、step4 levelTier<4 跳过、step9 tickWindow 到期分发（用真实 ComboTracker）、step10 waves 被调用（StubWaveDirector 计数）。测试用例里的 Stub 需满足 EntityStore 全协议（含 aliveCount，T-020 教训）。

【硬约束】不改 GameServices/GameWorld.tick 的公开签名；step6/7 的 forEach 用 inout 写回；不臆造任何 API——注入文件没有的签名不许调用；新常量进 Constants.swift 对应 enum（查重，Physics 区已存在）；输出纪律紧凑。

### [T-024] done :: 渲染接入 T-024：Metal 视图挂载 + 实体→精灵提取 + 刀光轨迹
- 创建: 2026-10-31T11:43:46+08:00　更新: 2026-10-31T11:53:09+08:00
- 验收: RenderAnchorView 被真实 Metal 视图替换；局内每帧提交水果精灵与刀光；GameHost 渲染链 beginFrame/submit/endFrame 接通；CI 全绿
- 备注: CI success(b4007b42)；GameRenderer+canvasView 挂载；currentEntities=forEach 收集；logicalSize 改接渲染层；占位项集中清单 10 条

把 FNPBRender 真实接入 App，让局内画面不再黑屏（蓝图 S7 收口 + S8 的最后一公里）。

【已核准事实】
- FNPBRender 四件套已编译验证：MetalContext（含 UIViewRepresentable 桥接 MetalCanvasView，typealias UIViewType = MetalCanvasView）、RenderSurface（@MainActor 协议+实现，configure(SurfaceRequest)/beginFrame/submit/endFrame、logicalSize）、SpriteBatch（SpriteInstance/BlendMode 实例批渲染）、TextureLoader（TextureLoading，load(TextureAsset)）。
- App 现状：FNPBApp.swift 的 gameplay ZStack 里 RenderAnchorView 是 Color.black 占位（T-022），GameHost 有 displayLink/touchRouter/audio/saveStore/gameWorld/fixedStep/state/store/services，handleFrame 末尾 viewModel.refreshSnapshot()。
- 刀光轨迹数据在 state.slashTrail（SlashTrail，points 数组 8 槽 SIMD3 世界坐标）。
- 水果实体：Entity.transform.position（SIMD3 世界坐标）/ fruit?.typeID；实体从 GenerationOrderStore 按生成序取。
- 世界坐标约定：原点屏幕中心、X 右 Y 上（TouchRouter 注释）；SpriteBatch 由 RenderSurface.logicalSize 做 NDC 映射（RenderSurface.swift 注释）。
- 贴图：assets_png/ 已全量转换（264 个 PNG，其中 192 个 4bpp 索引为灰度兜底图）；确证文件名仅 fruit_atlas.png 一张。UV 子矩形映射未闭合 → v1 允许整图集拉伸渲染 + [待验证] 注释；贴图缺失时用 TextureLoader 加载失败回落纯色四边形（SpriteInstance 色调），不得崩溃。
- 音效/特效事件已在 T-023 接线；本卡不碰逻辑。

【交付】
1) App/GameRenderer.swift（新）：@MainActor final class GameRenderer——持有 RenderSurface 实现与 TextureLoader；提供 mtkView 桥接视图结构（直接复用 FNPBRender 的 UIViewRepresentable 类型，不要另写桥）；实现帧回调（MTKView 的 draw 或 MetalContext 提供的帧入口，以 MetalContext.swift 实际 API 为准）：beginFrame → 从 GameHost 拉当前 (state, store) 快照 → 提水果精灵（每实体一个 SpriteInstance，位置=transform.position，尺寸按水果类型给默认占位 0.1 逻辑单位 [待验证]，色调按 typeID 哈希着色占位）→ 提交刀光（slashTrail.points 相邻点对连成线段精灵， additive 混合 [待验证]）→ endFrame。
2) 改 App/FNPBApp.swift：GameHost 增 renderDriver 属性（构造期创建 GameRenderer）；gameplay ZStack 把 RenderAnchorView 换成 GameRenderer 的桥接视图（.ignoresSafeArea()）；handleFrame 末尾在 refreshSnapshot 之前通知渲染层本帧数据就绪（或渲染层在 draw 时直接读 host.currentState/currentEntities——选注入文件里实际支持的通路，禁止臆造）。
3) GameHost 增加只读投影：currentEntities（按生成序数组快照）供渲染提取；现有 currentState 直接用。
4) 分辨率：configure(SurfaceRequest) 在视图尺寸变化时调用（桥接内部若已处理则复用），logicalSize 变化需回写 TouchCoordinateMapper.logicalSize 闭包的数据源——当前 GameHost.currentLogicalSize 是屏幕物理像素，与渲染 logicalSize 不一致属已知 [待验证]，本卡把 TouchCoordinateMapper 的 logicalSize 闭包改接到 RenderSurface.logicalSize（若该属性在协议上公开；不公开则在 GameRenderer 暴露只读投影）。

【硬约束】全部接线只能调用注入文件里真实存在的 API；Swift 6 隔离——Metal/MTKView 全部 @MainActor；不引入新 target 依赖（App 已依赖 FNPBRender）；CI 必须过编译+全部测试；每处 [待验证] 单列风险清单。

### [T-025] done :: T-025 实体生成与运动闭环：WaveSpawnSink 实现 + 抛物线积分 + 漏切
- 创建: 2026-10-31T11:53:57+08:00　更新: 2026-10-31T23:09:33+08:00
- 验收: WaveSpawnSink 有真实实现并挂到 WaveDirector.spawnSink；水果按 FruitMotion.integrate 逐帧运动；出界回收；漏切计 missPenalty；新增 ≥4 测试；CI 全绿
- 备注: CI success(run 41170247080, remote ce299814)；生成/运动/出界回收/6项测试全绿；Kimi裁决漏切使用独立missedFruitCount，保留原+0x3c切中分支；非法hex字面量已预审修正

打通「波次生成→水果抛起→可切→出界回收/漏切」的实体生命周期。T-024 之后画面链路已通，但水果永不生成、永不运动，本卡补齐。

【Kimi 已核准的缺口与事实】
1. **WaveSpawnSink 全工程无实现**：WaveDirector.spawnSink（weak）为 nil → spawnFruit/triggerExplosion 永不发生。协议（WaveDirector.swift:89）：`spawnFruit(kind: Int32, from spawner: Spawner, wave: WaveInfo)` / `triggerExplosion(from spawner: Spawner, wave: WaveInfo)`。
2. **FruitMotion.integrate(_ entity: inout Entity, ...)**（FruitMotion.swift:135，静态）已实现抛物线/自旋/出界判定，但**主循环没有任何调用点**。FruitMotionTuning 字段与 Constants.Physics 默认值均已落盘。
3. GameHost 现状：持有 store/state/waveDirector；startGame 重置全套；渲染经 currentEntities 提取。
4. 原主循环实体更新语义（core_logic_notes §1.2）：循环 A/B 内实体先运动再判定（具体顺序以 FUN_00016214 反编译为准，[待验证] 若未直读则注明）。

【交付】
1) App/WaveSpawnBridge.swift（新）：final class WaveSpawnBridge: WaveSpawnSink——持有 EntityStore（引用 GenerationOrderStore 实例）与 FruitMotionTuning；
   - spawnFruit(kind:from:wave:)：构造 EntityPrototype(kind: .fruit, transform: 初始位置在屏幕下缘（y = offscreenBottomMargin 附近，x 由 spawner 位置或 rng 决定 [待验证]），初速度按 FruitMotion 的发射角/速度区间采样（用注入的 RandomSource）)，fruit: FruitInfo(typeID: kind)（FruitInfo 其余字段默认，score 暂 0 → 待 fruitList 内容任务卡）→ store.spawn；
   - triggerExplosion(from:wave:)：v1 只生成 kind=.bomb 实体（占位，[待验证] 原语义为爆炸特效而非生成）。
   - GameHost.init 创建 bridge 并赋给 waveDirector.spawnSink；startGame 时 bridge 的 store 引用不变（store.clear() 保留实例）。
2) GameWorld 主循环补运动：在 step6 循环A 与 step7 循环B 的 forEach 开头，对每个实体调 FruitMotion.integrate（签名以 FruitMotion.swift 为准）——注意独占访问：forEach 的 inout entity 直接传给 integrate 合法；
   - 出界判定（integrate 返回值或字段，以真实 API 为准）→ 收集 pendingDespawn 统一回收（同 T-023 模式）；
   - 漏切：水果未切且出屏 → state.missPenaltyCount 增量（原 +0x3c 语义 [待验证]，若 findings 有明确漏切分支按其执行）；
   - 若 integrate 不含出界判定，用 FruitMotionTuning 的 offscreen 阈值在 GameWorld 判定。
3) 新增 Tests/FNPBCoreTests/SpawnMotionTests.swift ≥4 用例：bridge.spawnFruit 后 store 有实体且初速度在 tuning 区间内；运动两帧后位置按抛物线变化；出界后回收；漏切计数。测试替身复用现有 SeededRandomSource（WaveTests.swift）与 SpyStats 模式（自行在本文件定义私有 spy，不要改他人文件）。
4) AppViewModel 快照 lives：原版 Classic 漏切三振（missPenaltyCount 阈值 [待验证]），v1 在 refreshSnapshot 里用 `max(0, 3 - Int(state.missPenaltyCount))` 近似并标 [待验证]；GameHost.handleFrame 的结束判定增加「missPenaltyCount >= 3 → finishGame」（[待验证] 原版结束条件，与 isFaulted 并列）。

【硬约束】不改 WaveDirector/FruitMotion 的公开签名；不臆造 API；Swift 6 独占访问纪律同 T-023；裸数字进 Constants（查重）；所有 [待验证] 单列。

### [T-026] done :: T-026 bxml 二进制 XML 解码与转换修复
- 创建: 2026-10-31T23:10:02+08:00　更新: 2026-10-31T23:26:31+08:00
- 验收: 自测全过；实跑 assets_raw/xml 60/60 转 JSON 成功且每文件完整消费；fruitList/originalWaveList 根和子节点数符合任务卡；原文本 XML 回归测试不退化
- 备注: CI success(run 41214503438, remote 7e6ef06d)；53项自测全过，真实bxml 60/60完整消费；多根globalProbabilities保留3个顶层节点

真实 assets_raw/xml/*.xml 全部是 Halfbrick bxml，不是文本 XML；现有 xml_convert 60/60 失败。Kimi 已实证格式：头 12 字节='bxml'+u16 headerAttrCount+u16 unknown+u32 stringTableByteSize；随后字符串表为 NUL 结尾 UTF-8，可后缀复用（引用偏移可落在另一字符串内部，必须按偏移取到下一 NUL，不要求等于字符串起点）。字节码从 12+size 开始：u32 rootCount；每个元素为 u8 marker=1、u32 nameOffset、u32 attrCount、attrCount 个(u32 nameOffset,u32 valueOffset)、u32 childCount、依序 childCount 个子节点；文本叶节点为独立 u8 marker=4+u32 textOffset（只有 5 字节，后面不再跟元素体）。已验证 settings.xml/originalModeInfo.xml/fruitList.xml/originalWaveList.xml 全字节精确消费；fruitList 根 fruitInfoFile 26 子节点、24 个 FruitInfo；originalWaveList 根 waveManagerFile 39 子节点。交付：1) 新 tools/AssetPipeline/bxml_decode.py，严格 bounds/offset/marker/root 检查、递归深度与节点数防爆、返回 xml.etree.ElementTree 元素或清晰异常；2) 修改 xml_convert.py，parse_xml 先识别 bxml 并走解码，文本叶按 ET 语义合并到父节点 text/tail，encoding 标 bxml；保留原文本 XML 与 selftest；新增合成 bxml 自测（属性、文本、后缀引用、截断/非法 offset/未知 marker）；3) tools/AssetPipeline/BXML_FORMAT.md 记录已实证结构与限制。不要猜其他 marker；遇未知 marker 明确报错。只改这 3 个文件。

### [T-027] done :: T-027 波次内容模型与 until 原版语义修正
- 创建: 2026-10-31T23:45:44+08:00　更新: 2026-11-01T00:11:13+08:00
- 验收: Swift 6严格并发编译；WaveTests及现有测试全过；until精确符合FUN_00053cb8末尾循环；新增原始Spawn字段不影响既有默认值；无数组下标冒充waveNo
- 备注: CI success(run 41217623304, remote 2c86ee7e)；until/atoi/重复waveNo及内容模型按完整反编译终审

只做 ContentTypes.swift 与 WaveTests.swift，避免超大任务超时。完整反编译 shared_context/findings/fruit_id_mapping_macho.md 的 FUN_00053cb8/FUN_000537ec 已证明：1) WaveInfo 需保留原始 waveNo 和 chance 字段；2) Spawn 的 min/max/mininc/maxinc/delay/delayinc 是独立原始字段，不能用 Spawner.minWait/maxWait 冒充；为下一阶段添加清晰字段，但本任务不改调度器；3) 修正 WaveInfo.postProcessUntil：仅对解析后仍为 -1 的条目先设为 -2，再从所有 waveNo 严格更大的波次中取最小(waveNo-1)，找到则覆盖；无后续则保持 -2。已显式且有效的 until 绝不做旧实现的 step3 改写。使用原始 waveNo（真实文件从0开始且允许重复），不是数组下标或强制1基。更新 WaveTests 中所有与完整反编译冲突的旧预期，并增加：显式有效值不变、缺省取最近后续waveNo-1、无后续为forever、重复waveNo被跳过。不要改其他文件，不新增占位行为。

### [T-028] done :: T-028 真实水果与波次 JSON 严格加载器
- 创建: 2026-11-01T00:02:45+08:00　更新: 2026-11-01T00:31:07+08:00
- 验收: Swift 6严格并发编译及全部测试通过；真实24水果/38波次完整加载；所有类型序列与关键数值精确；错误数据明确throw；无占位波次、无数组下标伪造官方ID之外的映射（水果零基索引已有原版证据）
- 备注: CI success(run 41219497153, remote 6de49b4c)；严格加载真实24水果/38波次，修正文档root包装、defaults键、noCritical及NextWaveDelay顺序

实现真实内容加载，输入是T-026转换器JSON，不改原始资产。可改 Sources/FNPBCore/Content/OriginalContentLoader.swift(新)、ContentTypes.swift(仅补必要模型)、Tests/FNPBCoreTests/OriginalContentTests.swift(新)、project.yml(仅App资源加入Content)。权威证据已在shared_context/findings/fruit_id_mapping_macho.md与spawn_parser_macho.md。要求：1) 通用ContentNode Codable匹配tag/attrs/text/tail/children；严格root校验、数字/布尔解析、必需name/type，错误throw且带路径，不静默兜底。2) 水果按FruitInfo文档顺序赋零基typeID（apple0/watermelon3/pear_gold23），解析name/chance/score/scale/collision/hitInfluence/onSide或onside/onlySprinkle/noCritical，派生noScore=(score==0)；读取critical全局配置与bomb size/collision，不能把critical字段填到每个水果。3) Spawn.type按逗号拆分并trim，保留顺序；用明确SpawnKind枚举fruit(Int32)/bomb/random表示，不得用0或EntityKindValue.bomb冒充；普通名称必须存在于水果表，未知throw。4) 映射Spawn min/max/mininc/maxinc/delay/delayinc到T-027字段；原版maxinc最后也写+0x68，因此minInc运行时值要被maxinc覆盖，同时maxInc保留原始值。5) WaveInfo保留原始waveNo/chance；waveNo缺失时按文档序号，until原始tokens交给修正后的postProcessUntil；Wave_dt映射dt/inc/spinc；NextWaveDelay映射delay/inc/wait/waitSpinc/speedLoss/waitForEntities/waitForProcessing。若当前模型缺nextWait/nextWaitSpInc则新增，不得把wait冒充delay或inc。defaults只按原二进制实际键名读取，不要把真实waveChanceGrowth擅自别名成waveChanceRegrowth。6) 测试含内联样本的合法/非法数字/未知水果/类型顺序/maxinc覆盖，并从#filePath定位仓库Content真实JSON，验证24水果38波次、apple0/watermelon3/pear_gold23、wave0 watermelon数量1 dt0.7、重复waveNo和until结果、真实type均成功解析。不要改WaveDirector、GameHost或WaveSpawnBridge，下一阶段接入。不要手写或修改Content下JSON。

### [T-029] done :: 原版波次选择、批次数量与生成计时
- 创建: 2026-11-01T00:36:34+08:00　更新: 2026-11-01T01:49:56+08:00
- 验收: Swift 6严格并发与全部CI测试通过；真实38波次可初始化；数量/类型/计时/选波符合上述函数；无每帧无条件出果、无占位水果0兜底、无错误remaining字段；未闭合等待条件明确待验证
- 备注: CI success(run 41225866144, remote dfbb1985)；FUN_000547ec直接确认激活计数重置-1；首波wave0 watermelon、候选/until及freeze换波测试通过；waitForEntities/waitForProcessing、override池、多玩家交互仍待验证

依据完整反编译重写WaveDirector的真实调度，禁止每帧无条件抽一次。证据：spawn_parser_macho.md FUN_00054dd8/FUN_00056098，新导出wave_spawn_init_macho.md、wave_spawn_count_types_macho.md、wave_scheduler_helpers_macho.md、wave_info_init_macho.md、fruit_random_weight_macho.md。范围：WaveDirector.swift、ContentTypes.swift(仅必要运行时模型)、WaveTests.swift、可新增WaveSchedulerTests.swift；WaveSpawnBridge.swift仅允许把triggerExplosion改名spawnBomb以符合FUN_000568f4实际创建炸弹实体，不改几何。要求：1) beginGame保留旧重载并新增beginGame(waves:fruits:)接收真实水果池；选中波次后初始化每玩家每spawner批次。2) 数量严格按FUN_00057af0：min+minInc*spInc与max+minInc*spInc向零取整并分别钳到>=0；max>min时rng.nextInt(max-min)+min，否则min。remaining与total均初始化为该数量；timer=max(0,delay+delayInc*spInc)。maxinc已在加载器覆盖minInc，不可再重复加maxInc。3) 每波次的random在FUN_00057b84/FUN_00055670对应初始化阶段解析一次，普通模式按FruitInfo.chance累计权重抽取并保持文档顺序；不要把random留到每次生成，也不要用水果0兜底。显式fruit/bomb保序。4) 生成时从初始化后的类型序列抽取；.bomb调用spawnBomb，.fruit调用spawnFruit。每实体remaining减1，timer += max(0,delay+delayInc*当前waveSpInc)，禁止再用bombTriggerRemaining/fruitSpawnRemaining；删除这两个错误字段及旧SpawnTable路径（若其他编译调用需同步）。5) 波次选择按FUN_00054dd8：激活计数递增；候选waveNo<=count且(count<=until或until==-2)；缺省chance已由加载器继承90；选择前chanceRegrowth>0时currentChance=min(maxChance,currentChance+regrowth)，currentChance初始0；多候选按currentChance*10权重，单候选无需随机；选中后该波currentChance=0。重复waveNo合法，不能当下标。6) 当前波spInc初始0；非首次选择时旧波spInc+=1；选择后按证据设置spawnFreeze与freezeRemaining(nextDelay/nextWait及inc/spInc)，不要再用forceSpawn冒充立即出果，freeze结束调用selectNextWave。7) waitForEntities/waitForProcessing若EntityStore真实接口不能闭合，明确标[待验证]并只保留有证据的等待计时，不编造处理中计数。8) 测试覆盖数量公式/区间端点/负值钳制、random批次只解析一次、类型顺序、timer、候选until/forever/重复编号、权重增长与选中清零、freeze结束选择下一波；真实JSON开局应wave0 watermelon生成1而不是占位fruit。保留现有冻结/炸弹状态测试中确有证据部分，但修正step6每帧spawnFlag=1的错误（原版仅生成时置1）。不要改App开局、渲染、资源或其他系统。

### [T-030] done :: 真实内容开局与水果/炸弹实体原型
- 创建: 2026-11-01T01:28:31+08:00　更新: 2026-11-01T02:28:11+08:00
- 验收: App只以真实38波次和24水果开局；无占位波次/24上限/水果0兜底；水果与炸弹原型使用真实元数据；内容错误可诊断且无try！或静默假开局；Swift 6完整CI通过；几何仍明确待验证
- 备注: CI success(run 41229244948, remote cc6330ca)；真实Bundle内容开局、完整FruitInfo/BombInfo原型、未知ID拒绝及无24上限通过；模拟器改为动态选择；生成位置/初速/自旋/重力仍待验证

接入T-028真实Content，删除占位开局。范围仅App/FNPBApp.swift、App/AppViewModel.swift、Sources/FNPBCore/Entities/WaveSpawnBridge.swift、Tests/FNPBCoreTests/SpawnMotionTests.swift（确有必要可新增App侧资源加载辅助，但不要改WaveDirector/加载器/几何/渲染）。1) GameHost初始化时从Bundle.main读取fruitList.json与originalWaveList.json，用OriginalContentLoader.load；资源或解析失败必须保留错误并禁止进入假开局，不得try!崩溃、不得回退占位。可将GameHost.startGame改为@discardableResult Bool，并让AppViewModel仅在实际成功后切到playing；正常重开复用已验证内容。2) startGame使用content.waves.waves与content.fruits.fruits调用beginGame(waves:fruits:)，彻底删除PlaceholderWave及placeholder Spawner。3) WaveSpawnBridge构造时接收真实水果表和BombInfo并强持有值数据；spawnFruit按typeID精确取得对应FruitInfo，把完整元数据放入EntityPrototype.fruit，transform.scale/radius取真实scale/collision，未知typeID不生成且不得水果0兜底。spawnBomb只创建炸弹实体，transform.scale=55、radius=35（必须来自加载后的BombInfo，不写死），不得触发爆炸结算。4) 删除SpawnGeometry.maxLiveFruitCount及两处人造24上限，不新增替代上限；真实实体管理门控仍属后续。5) 保持当前随机位置、发射速度、自旋和gravity不变并标[待验证]，不得在的本卡猜官方几何。6) 更新全部编译调用与测试：真实apple scale60/collision5及元数据、未知ID不生成、bomb55/35、连续生成超过24不截断；现有运动/出界/漏切测试继续通过。不要改Content JSON。

### [T-031] done :: T-031 图集 RGB565 修正、真实网格提取与资源进包
- 创建: 2026-11-01T02:37:58+08:00　更新: 2026-11-01T16:58:13+08:00
- 验收: tex自测及264转换通过且fruit_atlas为RGB565；模型自测通过，实跑54/54 MMD与44/44 binmodel、45个binmodel网格完整消费；24水果+bomb映射无缺失；Content含真实图集、映射JSON和完整网格BIN；CI编译测试通过；无玩法或渲染猜测改动
- 备注: CI success(run 41290791117, remote 91c063b1)；RGB565真实图集、54 MMD/44 binmodel/45网格、24水果+bomb映射及25条BIN记录通过；完整材质/多网格/尾部保留；其他纹理格式、UV方向、MMD部分字段和Metal 3D渲染仍待验证

依据 shared_context/findings/model_uv_atlas_formats.md 的完整实证实现资产层，不改任何玩法。范围：tools/AssetPipeline/tex_convert.py、TEX_FORMAT.md、新增 model_extract.py；生成物由Kimi实跑写入Content。1) 修正传统tex偏移2的format字段17为RGB565，禁止再按首字节版本猜格式；保留其他未闭合格式的显式状态，不顺手猜16等。增加RGB565像素级自测与真实fruit_atlas回归，重跑264纹理应无回归。2) model_extract.py严格解析54个MMD与44个binmodel：完整边界/计数/索引/UV/位置/法线/颜色/材质/DiffuseTex/多网格/尾部校验，未知结构throw，不静默跳过。支持--selftest合成样本（含损坏输入）及CLI输入assets_raw/models/Fruit、Content/fruitList.json、输出Content。3) 输出fruitModels.json：24个水果按typeID映射实际_single模型路径，super_pomegranate/super_chest去super_前缀，另有bomb；每项保留原始模型文件、网格数、UV bounds、fruitList果汁colour（明确不是tint）。输出版本化fruitMeshes.bin，保存完整索引/顶点及JSON偏移长度供后续Metal 3D使用，不能只留UV包围盒。4) 将正确解码的512x512 fruit_atlas.png、fruitModels.json、fruitMeshes.bin放入Content；project.yml已经把Content作为resources，不重复添加assets_png。5) 本卡不改GameRenderer、不把UV包围盒裁图冒充官方3D模型、不把果汁色当贴图tint、不做V翻转猜测。输出代码文件块，不要输出大型JSON/PNG/BIN内容。

### [T-032] done :: 真实网格 Metal 3D 渲染链（视觉参数待真机闭合）
- 创建: 2026-11-01T17:06:05+08:00　更新: 2026-11-01T17:37:47+08:00
- 验收: 真实JSON/BIN严格解码与测试全过； fruit和bomb走真实网格+原始UV/顶点色；无整图集sprite或哈希tint；pinata可用而chest灰度不被冒充；既有刀光可编译；完整CI通过；视觉比例/UV/winding/MATRIX0明确待真机验证
- 备注: 完整CI 41293585133成功（远端aaaba90b）：真实JSON/BIN严格解码、24水果+bomb共25网格、原始64B顶点/UV/顶点色、fruit_atlas与pinata真实贴图、3D后接2D刀光及新增FNPBRenderTests均通过。chest按未闭合调色板跳过；scale/100、相机、UV方向、winding与MATRIX0仍待真机/反编译验证，不宣称官方视觉完全对齐。

基于T-031的Content/fruitModels.json与fruitMeshes.bin实现真正3D水果/炸弹渲染，删除整图集拉伸和typeID哈希色。范围：新增FNPBRender的纯数据资产解码器、Metal网格库与MeshBatch、fruit.metal；修改MetalContext/RenderSurface以在同一encoder内先画3D网格再画既有2D刀光；修改App/GameRenderer接入实体；新增FNPBRenderTests及project.yml测试目标。要求：1) 纯Swift Codable解码当前JSON，严格校验BIN magic/version/header/stride64/u32、每mesh offset+length边界、triangle count、index<vertexCount，输出fruit typeID与bomb的完整多网格几何，不能重解释或修改Content数据。2) Metal按原始64B顶点(pos3/normal3/uv2/color4/weight/reserved3)建buffer，u32索引drawIndexedPrimitives；sample*vertexColor，不乘果汁色、不使用材质alpha猜测透明、不做V翻转。3) 只把basename fruit_atlas.tex与pinata.tex映射到已验证RGB565 PNG；chest.tex调色板未闭合，必须返回无已验证纹理并跳过/诊断，不能用灰度预览或整图集兜底。普通渲染资源错误集中记录且不每帧IO。4) Mesh shader接受原始UV和顶点色；opaque+LEQUAL深度，cullMode.none直至winding有证据；2D sprite管线保持。5) GameRenderer对fruit按typeID、bomb单独取网格，使用EntityTransform位置与XYZ旋转；scale/100和世界到NDC 1逻辑点、正交深度只是沿用现有视觉重建参数，全部明确[待验证]，不得宣称官方相机。忽略尚未闭合布局的binmodel MATRIX0，不新增光照猜测。6) 纯数据测试含合法合成、损坏magic/offset/stride/index、真实Content 24水果+bomb/25网格/贴图映射；CI完整编译测试。7) 不改玩法、运动、切割、Content JSON/BIN，不输出大型资源内容。

### [T-033] done :: 主循环权威证据重审与输入/炸弹修正
- 创建: 2026-11-01T17:42:16+08:00　更新: 2026-11-01T18:15:38+08:00
- 验收: 触摸点与最后命中点分离且切中不改变后续query；炸弹先命中后近失、命中才按原条件置isFaulted；特殊实体与combo状态槽符合反编译；相关交互回归测试和完整CI通过；未闭合运动/特效参数继续明确登记
- 备注: 完整CI 41296295654成功（远端2d90f71a）：触摸输入与最后命中点隔离，炸弹先命中后近失且近失不结束，type=0切割遍历、实体状态槽combo门控/+0x90、首发统计分支及原型字段复制均通过；OnSliced奖励、combo结算计分、3.2秒爆炸门控、运动与特效仍待闭合。

按完整FUN_00016214逐段审查GameWorld、SliceQuery装配、Entity与ComboTracker。成批修复切中位置污染触摸输入、近失错误结束、炸弹命中缺分支、type=0特殊实体缺遍历、combo读错状态槽等确定偏差；不以占位参数冒充官方行为。

### [T-034] done :: 连击结算与真实 OnSliced 计分链
- 创建: 2026-11-01T18:18:05+08:00　更新: 2026-11-01T19:41:44+08:00
- 验收: combo结算按原条件调用计分且不多计/漏计；水果OnSliced奖励来自反编译而非猜测；相关统计、实体回调及回归测试完整；Swift 6完整CI通过；未闭合项单列

依据完整FUN_00016214步骤9和水果vtable+0x24真实实现，成批闭合combo>=3结算计分、动态/草莓/最高连击统计，以及水果命中OnSliced基础分、jiblet和特殊奖励。先定位并导出发售版OnSliced函数，禁止用fruit.score猜测官方基础分；同时补回主循环entity[0x6e]非炸弹门控。保留未闭合模式分支，完整CI后才登记。

### [T-035] done :: 爆炸门控与原版水果运动
- 创建: 2026-11-01T19:31:29+08:00　更新: 2026-11-07T18:19:17+08:00
- 验收: 爆炸命中/封锁/归零回归通过；运动字段、生成参数和积分顺序均有Mach-O证据；生产代码、测试替身与期望整体复核；完整GitHub Actions通过；未闭合模式与真机项单列
- 备注: 
[2026-11-07 接手审计] 能力已在生产代码落地，故关闭：Sources/FNPBCore/Entities/BombMotion.swift；Sources/FNPBCore/Loop/FruitOnSliced.swift 的 explosionTimeRemaining/isFaulted 分支。原卡自 T-043 后未回填状态，验收标准未重新执行。

闭合炸弹3.2秒计时、遍历门控及主循环顺序；继续反编译Spawn完整参数与水果运动，禁止保留无依据常量冒充官方行为。

### [T-036] done :: 挑战权重选择器与回合计划
- 创建: 2026-11-02T02:25:04+08:00　更新: 2026-11-07T18:19:17+08:00
- 验收: 仅新增选择器及测试；逐项对应Mach-O；不伪造PRNG；DeepSeek只输出代码，Kimi审查后才落盘
- 备注: 
[2026-11-07 接手审计] 能力已在生产代码落地，故关闭：Sources/FNPBCore/Challenge/ChallengeSelection.swift（含 specialChallenges 与回合计划洗牌）。原卡自 T-043 后未回填状态，验收标准未重新执行。

只写代码草案，由Kimi独立审查。依据完整Mach-O实现 ChallengeSelection.swift 与对应XCTest，不修改现有控制器。范围：1) 每项20字节语义对应 base/current/value/regrowth/cooldown；regrow时cooldown<1则 current=min(base,Int32((Float(current)*regrowth+Float(base)).rounded()))，否则cooldown-=1；2) 加权随机选择使用注入RandomSource，不宣称复刻原版PRNG，选中后current=0、cooldown=4并更新总权重；3) group选择先找prioritySelection且持久化游玩次数为0的首项，冷却或零权重时先regrow再按原索引清除；否则regrow后加权选择；随后写回所有current/cooldown快照并更新priority标志；4) tier组选择采用同一规则，但持久化状态独立；5) 回合计划为mustSelect>0的每组重复加入其选择结果，再创建0..<numRounds槽位并用注入RNG执行原版成对交换洗牌，依次优先消耗必选列表，其余槽位走普通组选择；6) 提供回合结果写回与按当前索引取challenge的纯值接口。特殊单例随机组FUN_00062be4、原版64位PRNG、UI和GameWorld接线不在本卡，不得猜。测试覆盖恢复上限、冷却递减、优先未玩、持久化游玩次数、必选队列、洗牌确定性和无可用项。

### [T-037] done :: 复刻原版 64 位 LCG 随机源
- 创建: 2026-11-02T03:21:12+08:00　更新: 2026-11-07T18:19:17+08:00
- 验收: 草案含完整 Swift 6 实现与 XCTest；算法严格按上述 Mach-O 证据，无猜测、无生产落盘。
- 备注: 
[2026-11-07 接手审计] 能力已在生产代码落地，故关闭：Sources/FNPBCore/Random/OriginalRandom.swift；App/FNPBApp.swift:184/272 使用 OriginalLCGRandom。原卡自 T-043 后未回填状态，验收标准未重新执行。

只创建 DeepSeek 草案，禁止修改生产文件。输出 build/staging/OriginalRandom.swift 与 build/staging/OriginalRandomTests.swift。实现 FNPBCore 的 final class OriginalLCGRandom: RandomSource：state 按 UInt64 回绕执行 state=state*0x5d588b656c078965+0x0000000000269ec3；先推进再取 high32=UInt32(state>>32)。nextInt(bound)：bound==0 或 -1 时返回 high32 的 Int32 位模式；正数 bound 返回 UInt32((UInt64(high32)*UInt64(UInt32(bound)))>>32) 的 Int32 位模式，不使用取模，不把 0 种子替换为其他值。nextFloat：q=UInt32((UInt64(high32)*0x7ffff)>>32)，返回 Float(q)/Float(524287)，保持 binary32 语义。snapshot/restore 必须准确保存 UInt64 state，包括 0。提供 public init(seed: UInt64=0)。测试至少逐状态覆盖种子0、1、0xdeadbeef 的前三步，以及 nextInt(4)、nextInt(10)、nextFloat 参考向量：seed0 states 0000000000269ec3,7188d00c55ae9cb2,0af528d3a0c3b2fd；seed1 states 5d588b656c2e2828,e3b543e45af1de8b,3d7fca1a0b78ce9a；deadbeef states 0457f41ae269da0e,a48f2c2ed7fd2449,2b33271979700090。每个新状态对应 nextInt4/nextInt10：seed0 (0,0),(1,4),(0,0)；seed1 (1,3),(3,8),(0,2)；deadbeef (0,0),(2,6),(0,1)。Float bits：seed0 00000000,3ee3119c,3d2f5216；seed1 3ebab0d7,3f63b53c,3e75ff1f；deadbeef 3c8afc11,3f248f15,3e2ccc96。测试还需验证 bound0/-1 和 snapshot/restore。不得替换 App 的 SplitMix64Random，不得改 ChallengeSelection，不得实现特殊组或挑战统计。Mach-O 证据：FUN_00039b24、FUN_00039a64、FUN_00062be4、FUN_00301080。

### [T-038] done :: 接入原版连续切果挑战事件
- 创建: 2026-11-02T04:14:56+08:00　更新: 2026-11-07T18:19:17+08:00
- 验收: 草案精确对齐Mach-O逐果CONSECUTIVE事件与计数；不复用combo；Kimi审查后才可落盘；完整回归测试包含顺序和边界。
- 备注: 
[2026-11-07 接手审计] 能力已在生产代码落地，故关闭：Sources/FNPBCore/Loop/GameWorld.swift:215 + FruitOnSliced.swift:55 注入 ChallengeConsecutiveTracker。原卡自 T-043 后未回填状态，验收标准未重新执行。

只输出 DeepSeek 草案到 build/staging/T-038/，禁止直接修改生产文件。范围仅闭合 FUN_00010bec 中 CONSECUTIVE 分发，不实现挑战水果随机选择、特殊组或 App 回合接线。真实 Mach-O 证据：计分水果路径先按玩家及水果定义+0x330(noScore)更新 DAT_005d4ce0；同一玩家且noScore==false时count+=1，否则count=1并记录玩家。随后 FUN_00003fb4(manager,count,fruitDefinition+0x250) 到 FUN_0005ee50，再对激活条件虚表+0x24调0x5f21c。r2是水果类型哈希；本项目值语义使用FruitInfo.name并沿用现有ChallengeCondition.recordConsecutive的大小写无关匹配。noScore早退路径不进入该计分事件，不得凭空上报。现有协议：RandomSource不相关；FruitOnSliced.apply(entity:inout Entity,state:inout GameState,services:GameServices,explosionTimeRemaining:Float=0)，内部resolveCritical后才计分；ChallengeModeRuntime.recordConsecutive(count:Int32,specificType:String?)；GameWorld.step6在onSliced.apply后调用evaluateChallengeImmediate。请设计最小改动：新增可重置的单玩家/玩家索引连续计数器，计数与事件必须位于FruitOnSliced原版对应顺序，GameWorld重开局清零；不要用comboCount、combo结算或触摸事件代替。输出完整 ChallengeConsecutiveTracker.swift、建议修改的FruitOnSliced.swift/GameWorld.swift及XCTest到build/staging/T-038镜像目录，并明确实际生产目标路径。测试覆盖普通水果1,2,3逐次、noScore不触发、换玩家重置为1、新局复位、特定水果过滤、非consecutive不受影响，且不改变既有计分/统计顺序。

### [T-039] done :: 复刻挑战水果候选与加权选择
- 创建: 2026-11-02T04:57:26+08:00　更新: 2026-11-07T18:19:17+08:00
- 验收: 草案完整、逐条对应Mach-O；无猜测默认值；测试覆盖四路径、权重边界、PRNG次数、回退和候选集合；Kimi审查后才落盘。
- 备注: 
[2026-11-07 接手审计] 能力已在生产代码落地，故关闭：Sources/FNPBCore/Challenge/ChallengeFruitSelection.swift（由 ChallengeRoundAssembler 调用）。原卡自 T-043 后未回填状态，验收标准未重新执行。

只输出 DeepSeek 草案到 build/staging/T-039/，禁止直接修改生产文件。依据 shared_context/findings/challenge_fruit_selection_and_binding_macho.md 与 fruit_weighted_selection_ac24_complete_macho.md 完整实现 FUN_0000ac24 及 FUN_0000af50/afc4/b06c/b1a4 的值语义等价算法。完整注入上述证据和现有 OriginalRandom.swift、ContentTypes.swift。选择器需显式表示四个全局权重和缓存、四项重建顺序、P 与 param_1 四分支、32位回绕、mulHi32、Int32严格小于、一次/两次PRNG以及count-1回退；RandomSource 使用真实 OriginalLCGRandom 接口。空候选及进入回退的单候选在原版会越界，Swift 必须返回明确安全错误/nil并注明新增安全策略，不得伪造原版合法返回。候选按名称动态查 FruitInfo.typeID，默认除banana，small=strawberry/kiwifruit/lime，medium=orange/mango/apple_red/tomato/apple/plum/passionfruit/lemon/peach/pear，big=banana/watermelon/pineapple；不得硬编码水果ID。输入条目显式携带 chance/noCritical/coinsMax，不猜 FruitInfo 缺省值，不接 App。输出完整 ChallengeFruitSelection.swift 与 XCTest，覆盖证据第10节向量、缓存复用、候选顺序、缺失名称、空候选安全策略。

### [T-040] done :: 绑定挑战水果到统计与连续条件
- 创建: 2026-11-02T05:10:01+08:00　更新: 2026-11-07T18:19:17+08:00
- 验收: 草案只含绑定与测试；不伪造统计计数；原始条件定义可重复激活；真实GameWorld回归；Kimi审查后才落盘。
- 备注: 
[2026-11-07 接手审计] 能力已在生产代码落地，故关闭：Sources/FNPBCore/Loop/ChallengeConditions.swift（challengeFruit 占位符，22 处引用）。原卡自 T-043 后未回填状态，验收标准未重新执行。

只输出 DeepSeek 草案到 build/staging/T-040/，禁止直接修改生产文件。依据 challenge_fruit_selection_and_binding_macho.md 和现有 ChallengeConditions.swift、ChallengeModeRuntime.swift、GameWorld.swift，实现当前 selected FruitInfo.name 对 challengeFruit 占位符的值语义绑定。STATS/STATS_COMPARE 求值时 challengeFruit 应读取所选真实水果名在 StatsRecorder 的键，不创建虚构计数器；CONSECUTIVE 仅在该占位符上换成选中水果名，nil/zero 仍表示通配，不过滤。选择或恢复水果后再 select/reset 激活条件，不能永久改写共享原始定义导致下一回合无法重绑定。ChallengeModeRuntime 初始化和下一回合显式接收 selectedFruitName；GameWorld 从真实 runtime 构造 evaluation context，不接 App、不实现水果选择。保留现有API兼容默认参数。完整注入上述三个生产文件和对应测试，输出最小完整改动及 XCTest，覆盖 STATS、STATS_COMPARE、CONSECUTIVE、非占位条件、换回合换水果、未选择水果安全行为。

### [T-041] done :: 加载真实挑战目录与条件资源
- 创建: 2026-11-02T05:28:04+08:00　更新: 2026-11-07T18:19:17+08:00
- 验收: 真实两份挑战资源通过现有 Loader 进入 OriginalContent；App Bundle 缺失资源有明确错误；有效权重映射无猜测；仅草案和测试，完整 CI 后登记
- 备注: 
[2026-11-07 接手审计] 能力已在生产代码落地，故关闭：Sources/FNPBCore/Content/OriginalContentLoader.swift:203/213 加载 ch1challengeList/challengeConditions。原卡自 T-043 后未回填状态，验收标准未重新执行。

只输出 DeepSeek 草案，禁止直接修改生产文件。目标是把已经存在于 Content/ch1challengeList.json 和 Content/challengeConditions.json 的官方资源接入 OriginalContent 与 App/OriginalContentBundle，使用现有 ChallengeCatalogLoader 和 ChallengeConditionLoader，不发明挑战选择或 UI 行为。另提供从真实 FruitInfo 有效运行时字段构造 [Int32:ChallengeFruitWeightEntry] 的纯函数，chance/noCritical 读现有字段，coinsMax 按已核实 FruitInfo 有效默认值 0 显式提供并注明证据，不把原始 XML 缺省 chance 擅自改成非零。输出最小完整改动与 XCTest，覆盖加载真实文档、条件数量与名称、challengeFruit 占位符、tier/group/challenge 保序、资源缺失错误以及权重映射；不接 GameWorld，不自动选择 tier 或 challenge，不替换 App 随机源。草案放 build/staging/T-041/，由 Kimi 审查后才落盘。

### [T-042] done :: 替换 App 随机源并审计全局序列
- 创建: 2026-11-02T05:39:16+08:00　更新: 2026-11-07T18:19:17+08:00
- 验收: 生产App唯一共享随机源使用已验证OriginalLCGRandom；无猜测官方种子；代码草案经Kimi整组审查；完整CI通过后才登记完成
- 备注: 
[2026-11-07 接手审计] 能力已在生产代码落地，故关闭：App/FNPBApp.swift:184；App 内已无 SplitMix64Random。原卡自 T-043 后未回填状态，验收标准未重新执行。

DeepSeek只输出代码草案，Kimi独立审查和落盘。现有OriginalLCGRandom已依据FUN_00039a64/FUN_00039b24/FUN_00062be4/FUN_00301080实现并通过完整CI。审查App/FNPBApp.swift中SplitMix64Random全部调用链与共享rng注入，提出最小完整改动将生产App统一切换为OriginalLCGRandom，保留一个共享随机源，不新增第二随机序列，不改挑战选择/资源加载/UI。种子初值如无Mach-O证据必须显式保留为待验证，不得捏造官方种子；删除失效的SplitMix占位实现及误导注释。补充可在FNPBCore测试目标执行的随机源共享/快照回归，不依赖UIKit；若App装配无法在该target测试，明确验证边界。输出到build/staging/T-042/，禁止直接修改生产文件。

### [T-043] done :: 闭合特殊挑战组与回合计划
- 创建: 2026-11-02T05:46:50+08:00　更新: 2026-11-07T18:19:17+08:00
- 验收: 特殊组概率/门控/顺序/RNG次数逐项对应Mach-O；无特殊组零额外RNG；Kimi整组审查；完整CI通过
- 备注: 
[2026-11-07 接手审计] 能力已在生产代码落地，故关闭：Sources/FNPBCore/Content/ChallengeCatalog.swift:187 + ChallengeSelection.swift:312。原卡自 T-043 后未回填状态，验收标准未重新执行。

DeepSeek只输出代码草案，Kimi独立审查、修改和落盘。完整Mach-O证据已导出到shared_context/findings/special_challenge_group_macho.md、special_challenge_reset_macho.md、challenge_tier_layout_macho.md、challenge_selection_weights_macho.md。现有Sources/FNPBCore/Challenge/ChallengeSelection.swift和Content/ChallengeCatalog.swift未实现FUN_00060d04/FUN_00062be4/FUN_00062ca4及FUN_0006ee88特殊组分支。请基于真实源码API提出最小完整改动：ChallengeCatalog可选加载specialChallenges(numPerGame及challengeGroup)，特殊组持有独立ChallengeGroupSelector和每局已选计数；仅numPerGame!=0、count==0、tierIndex!=0且!=2时消费一次OriginalLCGRandom.nextFloat并按难度0/1/2/其他阈值0.2/0.5/0.8/0.8判断，命中后count+=1、调用组内选择并把结果追加到必选队列；新局计数清零。保留现有mustSelect、成对洗牌、队列填充顺序。真实ch1challengeList.json没有specialChallenges，因此缺省必须是nil且不消耗RNG，不得虚构特殊挑战或难度值，难度和tierIndex显式注入。修正选择器中已过时的‘随机源非原版’注释，但不改变其他已验证行为。输出完整改动和XCTest到build/staging/T-043/，禁止直接修改生产文件。

### [T-044] done :: 纯 Core 挑战回合装配器
- 创建: 2026-11-02T06:06:45+08:00　更新: 2026-11-07T18:18:53+08:00
- 验收: 见 build/request_t044.py 与对应落地产物；本卡由 2026-11-07 审计补录，未重新编排验收。
- 备注: 2026-11-07 由审计补录：任务卡系统在 T-043 后停用，实际工作经 build/request_t0XX.py + progress 推进。

推进方式见 build/request_t044.py。落地产物：Sources/FNPBCore/Challenge/ChallengeRoundAssembler.swift、Tests/FNPBCoreTests/ChallengeRoundAssemblerTests.swift。

### [T-045] done :: customWave/forceWave 选波核心
- 创建: 2026-11-02T06:29:25+08:00　更新: 2026-11-07T18:18:53+08:00
- 验收: 见 build/request_t045.py 与对应落地产物；本卡由 2026-11-07 审计补录，未重新编排验收。
- 备注: 2026-11-07 由审计补录：任务卡系统在 T-043 后停用，实际工作经 build/request_t0XX.py + progress 推进。

推进方式见 build/request_t045.py。落地产物：Sources/FNPBCore/Content/ContentTypes.swift、Sources/FNPBCore/Content/OriginalContentLoader.swift、Sources/FNPBCore/Wave/WaveDirector.swift。

### [T-046] done :: ch1challengeWaveList 名称/类型/水果绑定
- 创建: 2026-11-02T06:43:43+08:00　更新: 2026-11-07T18:18:53+08:00
- 验收: 见 build/request_t046.py 与对应落地产物；本卡由 2026-11-07 审计补录，未重新编排验收。
- 备注: 2026-11-07 由审计补录：任务卡系统在 T-043 后停用，实际工作经 build/request_t0XX.py + progress 推进。

推进方式见 build/request_t046.py。落地产物：Content/ch1challengeWaveList.json、Sources/FNPBCore/Content/ContentTypes.swift、Sources/FNPBCore/Content/OriginalContentLoader.swift。

### [T-047] done :: 波 defaults 与 Spawn 字段解析
- 创建: 2026-11-02T06:49:48+08:00　更新: 2026-11-07T18:18:53+08:00
- 验收: 见 build/request_t047.py 与对应落地产物；本卡由 2026-11-07 审计补录，未重新编排验收。
- 备注: 2026-11-07 由审计补录：任务卡系统在 T-043 后停用，实际工作经 build/request_t0XX.py + progress 推进。

推进方式见 build/request_t047.py。落地产物：Sources/FNPBCore/Content/ContentTypes.swift、Sources/FNPBCore/Content/OriginalContentLoader.swift、blueprint/Constants.swift、Tests/FNPBCoreTests/ChallengeWaveDefaultsSpawnFieldsTests.swift。

### [T-048] done :: 挑战波列表独立加载
- 创建: 2026-11-02T07:40:20+08:00　更新: 2026-11-07T18:18:53+08:00
- 验收: 见 build/request_t048.py 与对应落地产物；本卡由 2026-11-07 审计补录，未重新编排验收。
- 备注: 2026-11-07 由审计补录：任务卡系统在 T-043 后停用，实际工作经 build/request_t0XX.py + progress 推进。

推进方式见 build/request_t048.py。落地产物：Sources/FNPBCore/Content/OriginalContentLoader.swift、App/OriginalContentBundle.swift、Content/ch1challengeWaveList.json。

### [T-049] done :: 原版字符串哈希 FUN_002f69c4
- 创建: 2026-11-02T08:04:12+08:00　更新: 2026-11-07T18:18:53+08:00
- 验收: 见 build/request_t049.py 与对应落地产物；本卡由 2026-11-07 审计补录，未重新编排验收。
- 备注: 2026-11-07 由审计补录：任务卡系统在 T-043 后停用，实际工作经 build/request_t0XX.py + progress 推进。

推进方式见 build/request_t049.py。落地产物：Sources/FNPBCore/Challenge/OriginalStringHash.swift、Tests/FNPBCoreTests/OriginalStringHashTests.swift。

### [T-050] done :: 挑战选择独立持久化
- 创建: 2026-11-02T08:11:53+08:00　更新: 2026-11-07T18:18:53+08:00
- 验收: 见 build/request_t050.py 与对应落地产物；本卡由 2026-11-07 审计补录，未重新编排验收。
- 备注: 2026-11-07 由审计补录：任务卡系统在 T-043 后停用，实际工作经 build/request_t0XX.py + progress 推进。

推进方式见 build/request_t050.py。落地产物：Sources/FNPBCore/Challenge/ChallengeSelection.swift、Sources/FNPBPlatform/Persistence.swift、Tests/FNPBCoreTests/ChallengeSelectionTests.swift。

### [T-051] done :: 持久化解码容错 + 拒绝重复结算
- 创建: 2026-11-02T09:05:32+08:00　更新: 2026-11-07T18:18:53+08:00
- 验收: 见 build/request_t051.py 与对应落地产物；本卡由 2026-11-07 审计补录，未重新编排验收。
- 备注: 2026-11-07 由审计补录：任务卡系统在 T-043 后停用，实际工作经 build/request_t0XX.py + progress 推进。

推进方式见 build/request_t051.py。落地产物：Sources/FNPBCore/Challenge/ChallengeRoundAssembler.swift、Sources/FNPBPlatform/Persistence.swift、Tests/FNPBCoreTests/PersistenceTests.swift。

### [T-052] done :: UISF 递归动画查询/播放
- 创建: 2026-11-02T09:14:59+08:00　更新: 2026-11-07T18:18:53+08:00
- 验收: 见 build/request_t052.py 与对应落地产物；本卡由 2026-11-07 审计补录，未重新编排验收。
- 备注: 2026-11-07 由审计补录：任务卡系统在 T-043 后停用，实际工作经 build/request_t0XX.py + progress 推进。

推进方式见 build/request_t052.py。落地产物：Sources/FNPBCore/Content/UIScreenAnimationPlayer.swift、Tests/FNPBCoreTests/UIScreenAnimationPlayerTests.swift。

### [T-053] done :: UISF 插值采样 + 挑战动画 JSON 工具
- 创建: 2026-11-02T09:43:04+08:00　更新: 2026-11-07T18:18:53+08:00
- 验收: 见 build/request_t053.py 与对应落地产物；本卡由 2026-11-07 审计补录，未重新编排验收。
- 备注: 2026-11-07 由审计补录：任务卡系统在 T-043 后停用，实际工作经 build/request_t0XX.py + progress 推进。

推进方式见 build/request_t053.py。落地产物：Sources/FNPBCore/Content/UIScreenAnimationPlayer.swift、reverse/generate_challenge_animations.py、Content/challengeAnimations.json。

### [T-054] done :: 首回合即 bonus 的 intro + 结算子状态
- 创建: 2026-11-02T11:35:20+08:00　更新: 2026-11-07T18:18:53+08:00
- 验收: 见 build/request_t054.py 与对应落地产物；本卡由 2026-11-07 审计补录，未重新编排验收。
- 备注: 2026-11-07 由审计补录：任务卡系统在 T-043 后停用，实际工作经 build/request_t0XX.py + progress 推进。

推进方式见 build/request_t054.py。落地产物：Sources/FNPBCore/Loop/ChallengeModeRuntime.swift、Sources/FNPBCore/Loop/GameWorld.swift、Tests/FNPBCoreTests/ChallengeModeRuntimeTests.swift。

### [T-055] done :: bonus 结算宿主协调器
- 创建: 2026-11-02T12:06:45+08:00　更新: 2026-11-07T18:18:53+08:00
- 验收: 见 build/request_t055.py 与对应落地产物；本卡由 2026-11-07 审计补录，未重新编排验收。
- 备注: 2026-11-07 由审计补录：任务卡系统在 T-043 后停用，实际工作经 build/request_t0XX.py + progress 推进。

推进方式见 build/request_t055.py。落地产物：Sources/FNPBCore/Challenge/ChallengeBonusSettlementHost.swift、Tests/FNPBCoreTests/ChallengeBonusSettlementHostTests.swift、Content/challengeScoreCompleteAnimations.json。

### [T-056] done :: 成就解锁幂等本地接收端
- 创建: 2026-11-02T12:17:29+08:00　更新: 2026-11-07T18:18:53+08:00
- 验收: 见 build/request_t056.py 与对应落地产物；本卡由 2026-11-07 审计补录，未重新编排验收。
- 备注: 2026-11-07 由审计补录：任务卡系统在 T-043 后停用，实际工作经 build/request_t0XX.py + progress 推进。

推进方式见 build/request_t056.py。落地产物：Sources/FNPBPlatform/Persistence.swift、Tests/FNPBCoreTests/PersistenceTests.swift。

### [T-057] done :: App 接 bonus 结算 host
- 创建: 2026-11-02T12:23:28+08:00　更新: 2026-11-07T18:18:53+08:00
- 验收: 见 build/request_t057.py 与对应落地产物；本卡由 2026-11-07 审计补录，未重新编排验收。
- 备注: 2026-11-07 由审计补录：任务卡系统在 T-043 后停用，实际工作经 build/request_t0XX.py + progress 推进。

推进方式见 build/request_t057.py。落地产物：App/FNPBApp.swift。

### [T-058] done :: 挑战地图状态机首条闭合路径
- 创建: 2026-11-02T12:39:22+08:00　更新: 2026-11-07T18:18:53+08:00
- 验收: 见 build/request_t058.py 与对应落地产物；本卡由 2026-11-07 审计补录，未重新编排验收。
- 备注: 2026-11-07 由审计补录：任务卡系统在 T-043 后停用，实际工作经 build/request_t0XX.py + progress 推进。

推进方式见 build/request_t058.py。落地产物：Sources/FNPBCore/Challenge/ChallengeMapController.swift、Tests/FNPBCoreTests/ChallengeMapControllerTests.swift。

### [T-059] done :: HUD 直接投影 host 真实数值
- 创建: 2026-11-02T14:49:41+08:00　更新: 2026-11-07T18:18:53+08:00
- 验收: 见 shared_context/progress/T-059.response.md 与对应落地产物；本卡由 2026-11-07 审计补录，未重新编排验收。
- 备注: 2026-11-07 由审计补录：任务卡系统在 T-043 后停用，实际工作经 build/request_t0XX.py + progress 推进。

推进方式见 shared_context/progress/T-059.response.md。落地产物：Sources/FNPBCore/Challenge/ChallengeBonusSettlementHost.swift、Sources/FNPBUI/GameSnapshot.swift、Sources/FNPBUI/Screens/InGameHUDScreen.swift。

### [T-060] done :: .uiscreen 静态属性记录严格解析
- 创建: 2026-11-02T15:04:03+08:00　更新: 2026-11-07T18:18:53+08:00
- 验收: 见 shared_context/progress/T-060.response.md 与对应落地产物；本卡由 2026-11-07 审计补录，未重新编排验收。
- 备注: 2026-11-07 审计：草案里的符号（_STATIC_PROPERTY_NAMES/_read_static_string 等）未进入 reverse/extract_uiscreen.py；同一能力由 T-064 的 parse_static_properties 以不同实现落地，故按「能力已覆盖」记 done，草案本身未采用。

推进方式见 shared_context/progress/T-060.response.md。无落地产物（见备注）。

### [T-061] done :: 挑战地图 PVRTC4→PNG
- 创建: 2026-11-02T15:05:24+08:00　更新: 2026-11-07T18:18:53+08:00
- 验收: 见 shared_context/progress/T-061.response.md 与对应落地产物；本卡由 2026-11-07 审计补录，未重新编排验收。
- 备注: 2026-11-07 由审计补录：任务卡系统在 T-043 后停用，实际工作经 build/request_t0XX.py + progress 推进。

推进方式见 shared_context/progress/T-061.response.md。落地产物：Content/challengeAtlas.png、Content/challengeCross.png、reverse/generate_challenge_atlas_asset.py。

### [T-062] done :: uiscreen 属性组/记录头解析
- 创建: 2026-11-02T15:12:16+08:00　更新: 2026-11-07T18:18:53+08:00
- 验收: 见 shared_context/progress/T-062.response.md 与对应落地产物；本卡由 2026-11-07 审计补录，未重新编排验收。
- 备注: 2026-11-07 由审计补录：任务卡系统在 T-043 后停用，实际工作经 build/request_t0XX.py + progress 推进。

推进方式见 shared_context/progress/T-062.response.md。落地产物：reverse/extract_uiscreen.py。

### [T-063] done :: 挑战素材再生脚本重写
- 创建: 2026-11-02T15:15:39+08:00　更新: 2026-11-07T18:18:53+08:00
- 验收: 见 shared_context/progress/T-063.response.md 与对应落地产物；本卡由 2026-11-07 审计补录，未重新编排验收。
- 备注: 2026-11-07 由审计补录：任务卡系统在 T-043 后停用，实际工作经 build/request_t0XX.py + progress 推进。

推进方式见 shared_context/progress/T-063.response.md。落地产物：reverse/generate_challenge_atlas_asset.py。

### [T-064] done :: 属性类别表与静态属性解析
- 创建: 2026-11-02T15:19:43+08:00　更新: 2026-11-07T18:18:53+08:00
- 验收: 见 shared_context/progress/T-064.response.md 与对应落地产物；本卡由 2026-11-07 审计补录，未重新编排验收。
- 备注: 2026-11-07 由审计补录：任务卡系统在 T-043 后停用，实际工作经 build/request_t0XX.py + progress 推进。

推进方式见 shared_context/progress/T-064.response.md。落地产物：reverse/extract_uiscreen.py。

### [T-065] done :: 挑战动画生成器校验补强
- 创建: 2026-11-02T15:31:41+08:00　更新: 2026-11-07T18:18:53+08:00
- 验收: 见 shared_context/progress/T-065.response.md 与对应落地产物；本卡由 2026-11-07 审计补录，未重新编排验收。
- 备注: 2026-11-07 由审计补录：任务卡系统在 T-043 后停用，实际工作经 build/request_t0XX.py + progress 推进。

推进方式见 shared_context/progress/T-065.response.md。落地产物：reverse/generate_challenge_animations.py、Content/challengeAnimationManifest.json。

### [T-066] done :: UIScreen 布局投影
- 创建: 2026-11-02T16:11:50+08:00　更新: 2026-11-07T18:18:53+08:00
- 验收: 见 shared_context/progress/T-066.response.md 与对应落地产物；本卡由 2026-11-07 审计补录，未重新编排验收。
- 备注: 2026-11-07 由审计补录：任务卡系统在 T-043 后停用，实际工作经 build/request_t0XX.py + progress 推进。

推进方式见 shared_context/progress/T-066.response.md。落地产物：Sources/FNPBCore/Content/UIScreenLayoutProjection.swift、Tests/FNPBCoreTests/UIScreenLayoutProjectionTests.swift。

### [T-067] done :: 根视口缩放模式 + 设备像素
- 创建: 2026-11-02T16:46:38+08:00　更新: 2026-11-07T18:18:53+08:00
- 验收: 见 shared_context/progress/T-067.response.md 与对应落地产物；本卡由 2026-11-07 审计补录，未重新编排验收。
- 备注: 2026-11-07 由审计补录：任务卡系统在 T-043 后停用，实际工作经 build/request_t0XX.py + progress 推进。

推进方式见 shared_context/progress/T-067.response.md。落地产物：Sources/FNPBCore/Content/UIScreenRootViewport.swift、Sources/FNPBCore/Content/UIScreenLayoutProjection+DevicePixels.swift。

### [T-068] done :: 布局投影完整实现
- 创建: 2026-11-02T17:37:21+08:00　更新: 2026-11-07T18:18:53+08:00
- 验收: 见 shared_context/progress/T-068.response.md 与对应落地产物；本卡由 2026-11-07 审计补录，未重新编排验收。
- 备注: 2026-11-07 由审计补录：任务卡系统在 T-043 后停用，实际工作经 build/request_t0XX.py + progress 推进。

推进方式见 shared_context/progress/T-068.response.md。落地产物：Sources/FNPBCore/Content/UIScreenLayoutProjection.swift。

### [T-069] done :: 地图布局快照 + HUD 状态投影
- 创建: 2026-11-02T17:48:07+08:00　更新: 2026-11-07T18:18:53+08:00
- 验收: 见 shared_context/progress/T-069.response.md 与对应落地产物；本卡由 2026-11-07 审计补录，未重新编排验收。
- 备注: 2026-11-07 由审计补录：任务卡系统在 T-043 后停用，实际工作经 build/request_t0XX.py + progress 推进。

推进方式见 shared_context/progress/T-069.response.md。落地产物：Sources/FNPBUI/ChallengeMapLayoutSnapshot.swift、Sources/FNPBUI/GameSnapshot.swift、App/FNPBApp.swift。

### [T-070] done :: texturePath→资源 key 精确映射
- 创建: 2026-11-02T18:07:20+08:00　更新: 2026-11-07T18:18:53+08:00
- 验收: 见 shared_context/progress/T-070.response.md 与对应落地产物；本卡由 2026-11-07 审计补录，未重新编排验收。
- 备注: 2026-11-07 由审计补录：任务卡系统在 T-043 后停用，实际工作经 build/request_t0XX.py + progress 推进。

推进方式见 shared_context/progress/T-070.response.md。落地产物：Sources/FNPBUI/ChallengeMapTextureResolver.swift。

### [T-071] done :: 地图几何/纹理纯值测试
- 创建: 2026-11-02T18:17:49+08:00　更新: 2026-11-07T18:18:53+08:00
- 验收: 见 shared_context/progress/T-071.response.md 与对应落地产物；本卡由 2026-11-07 审计补录，未重新编排验收。
- 备注: 2026-11-07 由审计补录：任务卡系统在 T-043 后停用，实际工作经 build/request_t0XX.py + progress 推进。

推进方式见 shared_context/progress/T-071.response.md。落地产物：Tests/FNPBUITests/ChallengeMapTexturePrimitiveTests.swift。

### [T-072] done :: 递归播放/插值接口对齐
- 创建: 2026-11-02T18:41:50+08:00　更新: 2026-11-07T18:18:53+08:00
- 验收: 见 shared_context/progress/T-072.response.md 与对应落地产物；本卡由 2026-11-07 审计补录，未重新编排验收。
- 备注: 2026-11-07 由审计补录：任务卡系统在 T-043 后停用，实际工作经 build/request_t0XX.py + progress 推进。

推进方式见 shared_context/progress/T-072.response.md。落地产物：Sources/FNPBCore/Content/UIScreenAnimationPlayer.swift、Sources/FNPBCore/Content/UIScreenLayoutProjection.swift、Tests/FNPBCoreTests/UIScreenLayoutProjectionTests.swift。

### [T-073] done :: 显示树排序与可见性分层
- 创建: 2026-11-02T18:51:39+08:00　更新: 2026-11-07T18:18:53+08:00
- 验收: 见 shared_context/progress/T-073.response.md 与对应落地产物；本卡由 2026-11-07 审计补录，未重新编排验收。
- 备注: 2026-11-07 由审计补录：任务卡系统在 T-043 后停用，实际工作经 build/request_t0XX.py + progress 推进。

推进方式见 shared_context/progress/T-073.response.md。落地产物：Sources/FNPBCore/Content/UIScreenDrawList.swift、Tests/FNPBCoreTests/UIScreenDrawListTests.swift。

### [T-074] done :: 有序四边形 值/测试/Pass（三子卡）
- 创建: 2026-11-02T19:16:08+08:00　更新: 2026-11-07T18:18:53+08:00
- 验收: 见 build_logs/T-074-pass.done 与对应落地产物；本卡由 2026-11-07 审计补录，未重新编排验收。
- 备注: 2026-11-07 由审计补录：任务卡系统在 T-043 后停用，实际工作经 build/request_t0XX.py + progress 推进。

推进方式见 build_logs/T-074-pass.done。落地产物：Sources/FNPBRender/OrderedTextureQuad.swift、Sources/FNPBRender/OrderedQuadPass.swift、Tests/FNPBRenderTests/OrderedTextureQuadTests.swift。

### [T-075] done :: 有序四边形 MTKView + 地图适配器
- 创建: 2026-11-02T19:35:04+08:00　更新: 2026-11-07T18:18:53+08:00
- 验收: 见 shared_context/progress/T-075.response.md 与对应落地产物；本卡由 2026-11-07 审计补录，未重新编排验收。
- 备注: 2026-11-07 由审计补录：任务卡系统在 T-043 后停用，实际工作经 build/request_t0XX.py + progress 推进。

推进方式见 shared_context/progress/T-075.response.md。落地产物：Sources/FNPBRender/OrderedQuadView.swift、App/ChallengeMapQuadAdapter.swift。

### [T-076] done :: 地图点击命中 + Metal 贴图叠层
- 创建: 2026-11-02T19:43:08+08:00　更新: 2026-11-07T18:18:53+08:00
- 验收: 见 shared_context/progress/T-076.response.md 与对应落地产物；本卡由 2026-11-07 审计补录，未重新编排验收。
- 备注: 2026-11-07 由审计补录：任务卡系统在 T-043 后停用，实际工作经 build/request_t0XX.py + progress 推进。

推进方式见 shared_context/progress/T-076.response.md。落地产物：Sources/FNPBUI/ChallengeMapInteraction.swift、App/ChallengeMapTextureOverlay.swift。

### [T-077] done :: StringTables 导出地图本地化文本
- 创建: 2026-11-02T00:00:00+08:00　更新: 2026-11-07T18:18:53+08:00
- 验收: 见 build_logs/T-077.prompt.md 与对应落地产物；本卡由 2026-11-07 审计补录，未重新编排验收。
- 备注: 2026-11-07 由审计补录：任务卡系统在 T-043 后停用，实际工作经 build/request_t0XX.py + progress 推进。

推进方式见 build_logs/T-077.prompt.md。落地产物：reverse/extract_string_table.py、Content/challengeMapStrings.json。
