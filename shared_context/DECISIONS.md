# 决策日志

每个重要取舍一条，格式：`## [时间] 标题` + 正文。Kimi 与 DeepSeek 都会读这里。

## [2026-10-30] 双模型分工定型

Kimi K3.1 Pro = 规划者（本文件、PLAN、任务卡、代码终审）；DeepSeek = 编码者（经 harness 调用）。
共享上下文 = `shared_context/` 文件，两个模型经 harness 读写同一份。

## [2026-10-30] DeepSeek 模型选型

用户要求「最新 flash-1017」。实测官方 API 仅接受 `deepseek-flash` / `deepseek-v4-pro`
（`deepseek-flash-1017` 返回 invalid_request_error，request_id 26bb0711-…）。
「1017」是官网变更日志日期（2026-10-17），`deepseek-flash` 即为当前最新 Flash（V4.1-Flash）。
**结论：编码角色默认 `deepseek-flash`；复杂反编译重建任务可临时切 `deepseek-v4-pro`（.env 改一行）。**
冒烟测试已通过（46+461 tokens，含 hybrid reasoning）。

## [2026-10-30] 工具链安装与反编译管线定型（安装阶段收官）

- **Java**: Temurin JDK 21.0.12.1 → `D:\tools\java\jdk-21.0.12.1+1`（JRE 不够，REA 要求完整 JDK；JAVA_HOME 已 setx）
- **Ghidra**: 12.1.4 PUBLIC → `D:\tools\ghidra\ghidra_12.1.4_PUBLIC`（GHIDRA_INSTALL_DIR 已 setx；走上海交大镜像 4MB/s 下载）
- **关键排障**: C 盘 100% 满（剩 77MB）是 REA 反复失败的根因 → 系统 TMP/TEMP 已迁 `D:\temp`
- **REA Windows 版不支持 Mach-O**（P0 仅 PE/6502）→ 影响评估：小。游戏逻辑走 x86 exe 即可；Mach-O 仅含平台胶合层（UIKit/触摸/EAGL/CADisplayLink），如需核对可用 Ghidra 直接分析（analyzeHeadless 对 Mach-O/armv7 同样支持，REA 限制只是调度层人为门控）；将来 mac 构建机配 Hopper 后 REA 全功能可用
- **主反编译目标定为 `FruitNinjaPIB.exe`（15.1MB x86 PE）**：跨平台同代码库，Windows 下 REA/Ghidra 直接可分析
- **稳定管线**（绕过 REA 桥接，见 `reverse/README.md`）：analyzeHeadless 分段跑，已实测导出 150 个函数伪代码（13 秒）
- **重大发现**: 引擎名为 **Mortar**（Halfbrick 自研），二进制保留 **C++ RTTI 类名**（Fruit/SlashEntity/ComboModifier/ChallengeUIScore/Delegate…）→ Phase 1 可按类级重建，逻辑映射质量远超纯汇编

## [2026-10-30] 双源验证协议（用户原则：尽可能与原版一致）

用户质疑 x86 exe 真实性（该游戏无零售 Windows 版）→ 已鉴定：**exe 为 Halfbrick 内部 Debug 构建**
（2013-06-11，VC++ Debug 库 + dbghelp + DINPUT8 + 源码路径 `d:\projects\engines\mortarworking\` 泄露），真代码但构建配置≠发售版。
**协议**：
- iOS Mach-O = **基准真源**（发售版代码）；x86 exe = 辅助对照源（类名/断言/调试串更全）
- 每条重建行为打来源标签 `[macho]` / `[exe]` / `[both]`；冲突一律信 Mach-O 并记 DECISIONS
- ~~两二进制符号形态：exe=MSVC RTTI（131 类）；macho=Itanium mangled（740 符号+62 虚表）——macho 自身即够类级重建，对 exe 零依赖~~
  **T-002 已更正此结论**：macho 的 740 符号全部属服务/后端层（Bricknet 服务聚合等），**游戏逻辑类符号在发售版中被剥离**（Fruit/Slash 符号数=0）；
  exe 才是游戏类结构（150 类）的唯一来源 → **取数协议：类结构/命名走 exe，数值常量以 macho 反编译为准，行为冲突信 macho**。详见 findings/binary_equivalence.md
- 产出位置: 字符串线索 `findings/exe_strings.md`（853 条命中）、反编译语料 `reverse/decompiled/`、Ghidra 项目 `reverse/fnpiB/`

## [2026-10-30] IPA 三问判定（Phase 0 核心结论）

1. **加密？** 否（cryptid=0，mrYODA 2013 破解版）→ 反编译路径打通
2. **64 位？** 否（仅 armv7，min iOS 4.3）→ 必须重建 arm64，无转译捷径
3. **引擎？** Halfbrick 自研跨平台引擎（非 Unity/Cocos），GLES 渲染，assets.zip 含游戏 .exe 模块与全部美术资源
**策略指向**：以「行为复刻重建」为主——复用原美术资源，反编译核心逻辑（切割判定/物理/计分/模式），用现代技术栈重写。

## [2026-10-30T21:54:22+08:00] T-004 分类完成 + harness 注入修复

### T-004 函数分类完成（72/73）
- **A级硬关联 2 对**（结构体偏移 8/8 与 12/12 逐字段一致）：
  `M11 FUN_00027f24` ≡ `E06 FUN_00c3a7e0`（WaveManager 状态：waveCount/beanStartPos 等 8 键偏移全同）；
  `M27 FUN_0002f36c` ≡ `E11 FUN_00b5a560`（slashMod 配置：12 键偏移全同）。
  → 结论：WaveManager 与 slashMod 配置结构两编译单元同源，**exe 偏移表可用于重建**（逐类验证后）。
- **combo 档位**：macho M41 硬编码 clamp(0..2) 即 3 档（combo 3/4/5），exe 用全局变量 → 以 macho 为准。
- **critical 是 float 概率**（criticalChance），非开关。
- **实体类型枚举**（M20）：fruit=1/bomb=2/coin=3/slash=4/blast=5/jiblet=6/fruitray=7；bomb 在水果池哨兵 ID = -2（M31）。
- **⚠️ 单点风险**：fruitlist.xml 数值（chance/chance_inc/new_life_at/scale/spread/disappear_speed）仅 macho 单源，无 exe 交叉验证。
- **⚠️ 关键词定位法盲区**：31+42 个命中函数中无纯切割几何（colline/colsphere/triclipper），切割判定需换定位法（macho `__FILE__` 串仅 15 条，备选：从 M03 实体更新函数的调用图向外扩展）。
- 炸弹爆炸常量（M32）：3.2f/1.6f/2.0f/9.0f 等已提取。

### harness 修复
- coder.py 新增任务卡级 `extra_files`（工作区相对路径，优先完整注入，默认 cap=FINDING_CAP）与 `finding_cap` 覆盖；findings 循环按 basename 去重。
- `.env` DEEPSEEK_MAX_TOKENS 16384→32768（T-004 输出 2.4 万 token，16K 会截断 FILE 块）。

## [2026-10-30T22:03:23+08:00] T-005 核心逻辑笔记完成

### T-005 Top5 深挖完成 —— 三大结构性结论
1. **Game 状态类 exe≡macho 22 个字段偏移逐字段一致**（combo 计数 +0x8c、窗口计时 +0x174、slash 轨迹 +0x17c、命中点 +0x104 等）→ GameState 结构体可直接重建。
2. **WaveManager 关联扩展到 13 键全同**；combo 双档公式（视觉 clamp(combo-3,0,2)、文本 clamp(combo-2,1,5)）双源确认。
3. **切割判定入口定位成功**：FUN_00017d74（命中测试）/ FUN_00017fdc（近失），由主循环调用图锁定，绕开关键词法盲区。vtable 槽位 macho 比 exe 少一项（OnSliced 在 +0x24），重建按 macho。
4. 单点风险仍在：fruitlist/WaveInfo/Spawner 默认常量仅 macho 单源；命中率公式的 K/SCALE 常量在数据段待读（§7 清单）。

## [2026-10-30T22:14:19+08:00] T-006 切割几何 + 常量闭合

### T-006 切割几何还原完成
1. **切割判定两段式**：引擎通用形状相交（vtable+0x0C，多态分发线/球/三角）→ 球体再二次确认（球心距离 + 截面圆 ±极值点 vs 切割半径²，半径²=game+0xf0）。「刀刃宽度」由此实现，非点到线段距离公式。
2. **近失 = 同一判定 + 球半径 ×1.5**（0x3FC00000 新常量）；仅对炸弹循环调用（擦弹危险度统计）。
3. **FUN_00301044=sqrtf，FUN_00009b50=normalize**（订正旧笔记"模长/点积"）。
4. 常量闭合：轨迹 0.05s、combo 窗口 0.1/0.095、命中率 K=**-0.2**（负惩罚）、SCALE=100；combo 视觉档位上限 exe=2 双源确认。
5. 订正：「固定步长」实为上一帧 dt 缓存（exe 初值 0.0 自证）。
6. 未闭合（转 T-007）：exe 2 个 float 读数异常（疑 Debug 构建或符号地址漂移，macho 值已可代偿）、DAT_004d90b4 需二次解引用、FUN_002ed344 vs vtable+0x0C 同体比对、exe OnSliced 虚表反查。

## [2026-10-30T22:17:07+08:00] DeepSeek 思考模式确认

deepseek-flash 的思考模式为服务端默认开启（实测 reasoning_content 返回、reasoning_tokens 计入 completion）。
影响：completion_tokens 含思考 token，长任务更易触顶 32K 上限（T-004 即因此截断过一次）。
ds_client 已新增 reasoning_tokens 记录字段。思考模式保持开启——对逆向分析任务质量有利，成本已由任务卡分轮控制。

## [2026-10-30T22:32:12+08:00] T-007 常量闭合完成

1. exe 浮点读取异常根因 = Debug 版常量存 double（8 字节）而非地址错误：0x05/15.0/0.5/0.0 与 macho 全部互证，exe↔macho 双源闭合达成。
2. macho GOT 槽（DAT_004d90b4、PTR_DAT_004d9048）指向 ARM 懒绑定桩，静态不可解 → 定性「运行时求值」，遗留 Frida 验证。
3. 切割 off 默认零向量（0x52bfe0 12 字节全 0）确认。
4. DumpData/RttiScan 脚本坑记入 reverse/README：exe 项目 imageBase=0x400000 但列表空间从 0 开始（不可加 imageBase）；Ghidra 脚本参数按逗号+空格切分（用冒号分隔）。

## [2026-10-30T22:49:51+08:00] Phase 2 蓝图完成

blueprint/ 三件套落盘：Constants.swift（11.5K）、GameState.swift（5.7K）、REBUILD_BLUEPRINT.md（主文档）。
架构决策：XcodeGen 生成工程；FNPBCore 纯逻辑模块可 swift test 回归；Metal 渲染（SpriteKit 未采用——DeepSeek 按 120Hz+自定义刀光选择了 Metal 批次渲染，Kimi 终审接受，SpriteBatch 自研）；逻辑帧 60Hz 固定步长+渲染插值；PRNG 抽象保证回放一致性；实体状态槽保留 Int32 不提前 enum 化（语义映射仍是 M 级）。
下一步：生成 project.yml + FNPBCore 骨架代码。

## [2026-10-30T23:12:53+08:00] T-011 工程骨架完成

project.yml（XcodeGen，iOS 26.0 部署、Swift 6 strict concurrency、五 target）+ GameWorld.swift（§1.2 十步桩一一对应，含 prime() 解决首帧零步进）+ TimeDriver.swift（60Hz 固定步长+alpha 插值+maxSubsteps）。
注意：本机为 Windows，无法跑 xcodegen/xcodebuild 编译验证——编译验证需 Mac 或留给 CI（pipeline/）。GameWorld 内过渡占位类型（Entity/EntityStore/各协议）在 ECS 任务卡落盘后迁移删除。

## [2026-10-30T23:18:57+08:00] T-012 Slice 模块完成

两段式切割判定直译为 Swift（SliceTester.evaluate，含 gate/coarse/section 三段事件结构便于调试）；ShapeIntersect 实现 6 种形状对（线-球/线-三角/线-AABB/球-球/球-三角/球-AABB/AABB-AABB）。
遗留 [待验证]：截面 ± 极值点的轴构造式（现用 normalize(pt × cutDirection) 近似，反编译 SIMD 失真遮蔽了原式，待 Frida 打点 FUN_00009b50 确认）；transform.radius 是否乘 scale 待渲染任务卡闭合。
测试 5 组黄金值全部可手算复核。DEEPSEEK_MAX_TOKENS 65536 生效（本轮 42K 完成）。

## [2026-10-30T23:24:09+08:00] T-013 Combo+Score 模块完成

ComboTracker：registerSlice/tickWindow 直译 §2（0.095 封顶、combo>9 收紧、结算后 0xff 槽清零语义）；ScoreSystem：延迟队列+溢出双模式保护；Accuracy：K=-0.2/SCALE=100 公式。14 个黄金值测试。FNPBCore 已覆盖 Slice/Combo/Score 三大核心系统。

## [2026-10-30T23:28:58+08:00] T-014 Wave 模块完成

WaveInfo/Spawner/FruitInfo Codable（macho 默认值逐项对齐 §4）；until 四步后处理（forever→-2、atoi>=waveNo 采纳、残余-1→-2）；SpawnTable 权重抽取用 RandomSource；WaveDirector：freeze 倒计时归零触发、炸弹状态机 0→1→2（rand*10+10）、forceSpawn。20 黄金值测试。
FNPBCore 四大核心系统（Slice/Combo/Score/Wave）全部落地。剩余：ECS 迁移（GameWorld 过渡类型转正）、Entities 实体行为、渲染层、UI、资产管线。

## [2026-10-30T23:33:52+08:00] T-015 ECS 迁移完成

过渡类型已迁移至 ECS 模块（单一 Entity 定义）；FruitMotion 全参数注入化——重力/初速真值未提取，Constants.Physics 占位 [待验证]，待 Frida 闭合后只改常量；GameWorld 重写后 10 步桩与协议节原样。
剩余：渲染层（FNPBRender Metal）、平台层（FNPBPlatform CADisplayLink/触摸/音频）、UI（FNPBUI SwiftUI）、资产管线（tools/AssetPipeline：tex→ktx2、xml→json）、App 壳。

## [2026-10-30T23:39:29+08:00] T-016 平台层+App 壳完成

FNPBPlatform 四件 + App 入口两件落盘。存档键名保留原版（critical_chance=Float 概率等，键名映射表在文件头注释）。App 入口完成 FrameStamp→GameWorld.tick 驱动链组装；Metal 渲染接入点留 TODO。
剩余：FNPBRender（Metal 渲染，最大块）、FNPBUI（SwiftUI）、资产管线（tools/AssetPipeline：.tex→ktx2/.png、xml→json + ContentBundle 解码）。

## [2026-10-30T23:53:13+08:00] T-018 .tex 格式谱系闭合

.tex 家族 4 变体确认：A=传统头16bpp(72)、B=4bpp外置调色板(78，转灰度待调色板来源调查)、C=TEX 扩展容器(107，头长直方图 28/52 聚类)、D=mip/调色板尾缀(归并入A/B判定)。
验收 264/264。肉眼验证 fruit_atlas.png 为可识别游戏图集。调色板来源（fruitlist.xml colour?）列为未决问题。
harness 解析器修复：FILE 头与围栏间允许空行。

## [2026-10-30T23:58:32+08:00] T-019 渲染层完成 —— 全部模块就位

FNPBRender 五件落盘。工程模块清单齐了：FNPBCore(ECS/Slice/Combo/Score/Wave/Content/Entities/Time/Loop) + FNPBPlatform(4件) + FNPBRender(5件) + App(2件) + tools/AssetPipeline(4件) + blueprint(3件) + project.yml。
剩余工作转三类：①UI 层(FNPBUI SwiftUI) ②闭合项(Physics 常量 Frida、mmd 解析器、4bpp 调色板来源) ③验证链(Mac/CI 编译+真机)。

## [2026-10-31T00:05:06+08:00] D-T020-plist-single-source

Info.plist 单一来源修复：删除 project.yml 中 FNPIB target 的 info: 块（XcodeGen 会生成并覆盖 App/Info.plist，造成静默数据丢失），同时把 App/Info.plist 的方向从 Portrait 改为 Landscape 双方向（原版为横屏游戏；此前 project.yml info 块写 Landscape、plist 写 Portrait 互相矛盾）。所有 Info 键由 App/Info.plist 手工维护。


## [2026-11-07T18:20:00+08:00] 接手：编排改为单 agent，工程链重建

用户决定 T-077 之后不再维持「Kimi 规划 + DeepSeek 编码」双模型分工，改由单一 agent 全权处理
（规划/编码/验收/找 bug 由同一 agent 通过多路子 agent 并行完成）。据此确立下列工程事实：

- **凭据**：旧 fine-grained PAT 已失效（API 返回 401），且本机直连 `github.com` 超时、只有
  `api.github.com` 可用 → 推送继续走 GitHub REST API（`tools/github_api_push.py`）。
  凭据放 `D:\temp\gh_token.txt`，不入库。
- **git**：本机原先**没有任何 git**，`tools/static_check.py` 与推送脚本因此都是坏的。
  已安装 MinGit 2.56.0 到 `D:\tools\git`（npmmirror 镜像），不写系统 PATH，脚本内用绝对路径。
- **行尾**：系统级 `core.autocrlf=true`，会对 LF 文件做 CRLF 转换。本仓库设为 `false`，
  因为 API 推送按**工作树字节**计算 blob sha，一旦被转换就与远端不一致。
- **历史**：远端每次推送都是一个内容相同的匿名 commit（旧脚本硬编码提交信息），本地历史停在
  `96f7715`。今后以「工作树内容」为准，本地 commit 只作可回滚检查点，提交信息按真实任务写。
- **忽略清单**：`build_logs/`（721 个 Actions 日志）、`reverse/uiscreen_reports/`（20 份 UISF 报告）、
  `reverse/.agent_readonly_*`、`reverse/preview_*.png` 补进 `.gitignore`。
  这些此前只是「未跟踪」，一次 `git add -A` 就会把 20MB 中间产物推上去。

## [2026-11-07T18:35:00+08:00] T-077 收尾与 CI 补充「未签名 IPA」job

- T-077 的生成器 `reverse/extract_string_table.py` 之前已落盘但**没有跑过**，产物
  `Content/challengeMapStrings.json` 缺失。已执行并校验：11 条文本、3 个样例全对
  （`FN_PUSS_ACT_1=Act 1` / `FN_PUSS_CHALLENGE_MAP_TITLE=ACT %d` / `FN_PUSS_SAN_RICARDO=San Ricardo`）。
- CI 新增独立 job `package-ipa`（`needs: build-and-test`，PR 跳过）：Release 归档 + 关签名 →
  校验 Info.plist/arm64/9 个运行期资源 → zip 成 `FNPIB-unsigned.ipa` 上传 artifact。
  **不用 `-exportArchive`**：它强制签名，与「未签名 IPA」目标冲突（原 `pipeline/README.md` 的示例是错的，已重写）。
- `docs/CI_FIRST_BUILD.md` §2 那条「project.yml 里没有任何 resources 条目」是 T-020 时代的断言，
  已被 `project.yml:107-110`（Content 以 buildPhase: resources 进包）推翻，就地更正并注明日期。


## [2026-11-07T18:45:00+08:00] 铁律：成品与原版一致，一切以官方证据为准

用户明确要求：**成品应与原版一致，不要按自己的想法来，尽量所有东西来源于官方、依赖官方。**
这条覆盖此前所有「工程上更方便」的取舍，具体落法：

- 任何行为/数值/渲染路径，必须能指到 Mach-O（发售版）或官方数据文件的证据；exe 只作类结构辅助。
- 证据缺失时**不实现**，标 `[待验证]` 并先补证据（Ghidra 导出 / 数据段直读 / Frida 打点），
  不允许先用现代框架「等效替代」再回头证明。
- 已撤回的提议：挑战地图文字用 SwiftUI `Text` 叠层渲染。原版走 ComponentText + 自有字体引擎，
  SwiftUI 叠层属于自创路径，即便更快出画面也不采用。
- 工程性改动（CI、推送、文档）不受此限，但**不得改变运行期行为**；一旦会改变行为，必须有证据支撑。

## [2026-11-08T03:15:00+08:00] 四处行为修正经 CI 验证通过

run 42404320557（commit 1efbb060）Build & Test + Package unsigned IPA 双绿，445 测试全过，
覆盖以下按官方证据修正的行为：

1. 挑战权重项 `current` 初值改取 `partyChallenges/defaults@chanceSelect`（官方 20，__DATA 0x52cb54），
   `chanceSelect` 只作 `base` —— findings/challenge_round_setup_macho.md:770-792。
2. `ChallengeWeightTable.draw` 在总权重为 0 / 0xffffffff 时也**无条件推进一次**随机流，
   只有取样时跳过缩放 —— findings/challenge_weighted_container_macho.md:84-94。
3. 每回合都重新执行默认水果初选（`FUN_00061128 param_2==0`），不再沿用上回合的 defaultFruitID ——
   findings/challenge_fruit_selection_and_binding_macho.md:60。
4. App 的 LCG 种子由自造常量 `0x5DEE_CE66_D` 改为 `UInt32(time(NULL))` ——
   findings/prng_seed_provenance_macho.md §1。

工作方式约定（用户要求）：改一点不推一点，攒够一批 → 自查 review → 一次推送验证；
推送内容不通过 review 不上 CI。