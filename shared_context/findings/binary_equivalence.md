# T-002 双二进制等价性验证报告（2026-10-30）

## 样本身份

| | x86 exe | iOS Mach-O |
|---|---|---|
| 路径 | `ipa/.../assets.zip` 内 `FruitNinjaPIB.exe`（15.1 MB） | `Payload/FruitNinjaPuss.app/FruitNinjaPuss`（5.8 MB） |
| 格式 | PE x86，**Debug 构建**（VC++ Debug 库、dbghelp、DINPUT8、CRT 断言） | Mach-O **armv7 32 位**，Release |
| 编译时间 | 2013-06-11 23:55 UTC | —（SDK 6.1，版本 1.0.4） |
| 版本 | 1.0.4（buildNumber.xml 一致） | 1.0.4（CFBundleVersion） |
| 厂商 | Halfbrick Studios Pty Ltd（内部路径 `d:\projects\engines\mortarworking\`） | 同 |

## 核心结论：两者符号保留呈「分层互补」，不是简单的有无

**macho（发售版）：游戏逻辑符号被剥离**
- 740 个 Mortar 符号全部属于**服务/后端层**：ServiceManagerBackend、TypeInfo、Delegate0/1/2、
  Bricknet*ProviderCallbacks、Bank/Social/Leagues/Leaderboard/Achievement…ServiceAggregate、
  StackAllocatedPointer、IProvider
- **游戏逻辑类符号为零**：全文件检索 `Fruit`/`Slash` 命中的 mangled 符号数 = 0
- 即：发售版只保留服务层符号表，核心玩法代码（编译单元局部符号）已被 strip

**exe（Debug 版）：游戏类结构完整（本项目唯一来源）**
- 提取 150 个类/结构短名（MSVC RTTI），游戏逻辑分类齐全：
  - 实体：Fruit、SlashEntity、SplatEntity、MeshEntity、Jiblet、Entity
  - 修饰器：ComboModifier、TimeModifier、SpawnModifier、WaveModifier、ModSlice、ModFan、ModCollision、ExplodyFruitModifier
  - 组件：Component、ComponentText、ComponentScore、ComponentTimer、ComponentChallengeScore、SuperFruitControl/HitControl/Glow、FruitCamera、BombBlast、PowerUp、FruitSplosion
  - UI/流程：Game、Global、GameModeScreen、LeaderboardScreen、UpsellScreen、ExtrasScreen、ChallengeUI*、ScrollingMenu、HUDControl、TutorialControl、ChallengeMods、ConditionScore、TimeControl、SuperFruitChest
- 另有调试组件（ComponentDebugger、DeveloperButtonExit.tex）→ 确认为开发用构建

**内容等价性（佐证同源同版本）**
- 玩法关键词字符串：exe 835 条 / macho 617 条 / **共有 358 条**（combo/wave/score/fruit 家族全量重合）
- macho 独有串以平台/文案为主（MPTimer、GameKit、#FruitNinja、"Fruit Ninja: Puss In Boots" 标题串）
- 双方版本号一致（1.0.4）

## 可用性边界（重建工作的取数协议）

| 信息类型 | 主源 | 说明 |
|---|---|---|
| 类结构 / 继承 / 职责划分 | **exe** | macho 无游戏类符号，唯一来源 |
| 行为逻辑（函数实现） | **exe 反编译** + macho 对照 | macho 函数无名（FUN_xxx），靠字符串引用/常量关联 |
| **数值常量（重力/初速/概率/计时）** | **macho 反编译核对为最终值** | ⚠️ exe 是 Debug 版，常量存在构建差异风险；凡影响手感与平衡的数值，必须以发售版 macho 反编译值为准，exe 值仅作参考 |
| 平台胶合层（触摸/渲染/定时） | macho + 现代 API 重写 | 无反编译必要 |
| 文案/字符串 | macho | 发售版原文 |

## 风险与后续

1. Debug 版断言/调试分支在 Release 中可能不存在——重建时忽略 exe 中的 debug-only 路径
2. 等价性验证是持续协议而非一次性任务：T-003 起每条重建结论必须带 `[exe]` / `[macho]` / `[both]` 标签
3. 详细类清单：`reverse/class_inventory_exe.md`（重新生成后）与 `reverse/class_inventory_macho.md`
