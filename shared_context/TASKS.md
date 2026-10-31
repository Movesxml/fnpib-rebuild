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

### [T-023] doing :: GameWorld 十步实装（R1 主循环全链）
- 创建: 2026-10-31T11:24:03+08:00　更新: 2026-10-31T11:27:40+08:00
- 验收: 十步全部有实现或显式 [待验证] 守卫（step8 允许留桩）；SlashTrail 入 GameState；新增 ≥5 个单测覆盖步骤 2/3/4/9/10；CI 全绿

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
