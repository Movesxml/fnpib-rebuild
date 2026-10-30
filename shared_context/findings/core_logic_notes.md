# 核心玩法逻辑笔记（T-005 · Top5 深度双源对比）

- 输入：`findings/deep_top5_exe.md`（10 函数全量）、`findings/deep_top5_macho.md`（11 函数全量）
- 取数口径：**类结构/命名 ← exe；数值/行为 ← macho 为准**（`binary_equivalence.md` 协议）
- 置信：`H`=函数体内字面量可直接换算；`M`=由控制流/比较结构推断；`L`=仅见数据段符号引用，值需二次读二进制

---

## §0 本轮重大结构发现：Game 状态类 exe≡macho 逐字段一致 [both]

`exe FUN_00bda510` 与 `macho FUN_00016214` 对同一状态对象的偏移使用**完全相同**，可直接当字段表用（exe 提供类名，macho 提供发售版行为）：

| 偏移 | 类型 | 语义（本轮确认/推断） | 证据 |
|---|---|---|---|
| +0x3c | int | 漏切/惩罚计数（非特殊切中 +2） | [both] |
| +0x40/+0x44 | vec2 | 命中点缓存（清 0） | [both] |
| +0x50 | byte | 碰撞半径生效标志 | [both] |
| +0x51 | byte | slashesScoring 首发标志 | [both] |
| +0x54 | float | 节奏因子（combo 时按 combo 数递减，语义待验证） | [both] |
| +0x60+i*4 | int[11] | combo 水果类型 ID 数组（清 0xff×0x2c） | [both] |
| +0x8c | int | combo 计数 | [both] |
| +0x90 | int | combo 类型/难度标记（0/1） | [both]（exe 写法不同，见 §2 裁决） |
| +0xa4 | byte | 失灵/结束标志（炸弹近失置位） | [both] |
| +0xa5 | byte | slash 轨迹计时活跃 | [both] |
| +0xb4 | int | 关卡等级；<4 时关闭 +0xf4 | [both] |
| +0xf4 | float | 等级相关特效/节奏参数 | [both] |
| +0xf8/0xfc/0x100 | vec3 | 上一 slash 位置 | [both] |
| +0x104/0x108/0x10c | vec3 | 命中点 | [both] |
| +0x110 | int | 本次切中得分 | [both] |
| +0x174 | float | combo 窗口计时 | [both] |
| +0x178 | int | 连锁/门限标记 | [both] |
| +0x17c | float | slash 轨迹持续计时 | [both] |
| +0x180 | ptr | 上一个参与 combo 的实体（防重复） | [both] |
| +0x1ba | byte | 特殊果加成开关 | [both] |
| +0xc1 | byte | 特殊果/炸弹标记 | [both] |

**重建价值**：可直接写出 `GameState` 结构体（>=0x1C0 字节），macho 行为 + exe 命名双源闭合。

---

## §1 G1 主循环 / 实体更新：exe `FUN_00bda510` ↔ macho `FUN_00016214`

### 1.1 常量表

| 常量 | hex | float | 语义 | 源/置信 |
|---|---|---|---|---|
| 15.0 | 0x41700000 | 15.0 | 碰撞半径归一化除数 | [macho] H；对应 exe `_DAT_016f2028`[L] |
| 0.5 | 0x3f000000 | 0.5 | 归一化权重 | [macho] H；`_DAT_016f29f0`[L] |
| 1.0 | 0x3f800000 | 1.0 | 归一化上限 | [macho] H；`_DAT_016ef478`[L] |
| 8.0 | 0x41000000 | 8.0 | 实体速度 clamp 上限 | [macho] H；`_DAT_01713248`/`_DAT_016f8410`[L] |
| 10.0 | 0x41200000 | 10.0 | 爆炸弹飞速度系数 | [macho] H |
| 0.095 | 0x3dc28f5c | 0.095 | combo>9 时窗口计时封顶 | [macho] H；`_DAT_01713ef8`[L] |
| 0.1 | 0x3dcccccd | 0.1 | combo 窗口触发后重置 | [macho] H；`_DAT_016f7b50`[L] |
| 0.75 | 0x3f400000 | 0.75 | combo 窗口随机基 | [macho] H；`_DAT_016f8810`[L] |
| -3.0 | 0xc0400000 | -3.0 | 特殊果对节奏因子的反向修正 | [macho] H |
| 0.0 | — | 0.0 | 冻结/计时归零判定 | [macho] M（`_DAT_016ec7e0` 推断 0.0）[L] |
| 固定步长 | — | — | dt==0 时兜底步长（`PTR_DAT_004d9048+0x44` / `_DAT_0197f47c`） | [both] L（值待读） |
| 轨迹超时 | — | — | slash 轨迹环形缓冲存活时长（`DAT_00016614` / `_DAT_016f2018`） | [both] L |

### 1.2 分支全链（按发售版 macho 顺序）

1. `dt==0` → 用固定步长 `+0x44` 替换（暂停/首帧兜底）；exe 同构（`param_1!=0` 时替换）[both]
2. **碰撞半径归一化**：`d = |(x,y,z)|`；`d/15.0 <= 1.0` 时 `w = 0.5*(d/15.0)+0.5`，否则 `w = 1.0`；全局最大值 `DAT_005573b8 = max(...)`（↔ exe `DAT_019514c0`）[both 结构一致]
3. **slash 轨迹**：`+0xa5!=0` → `+0x17c += dt`；`> DAT_00016614` → 槽位 `DAT_005573b4=(+1)%8` 写入 `FUN_00019f10(&DAT_00557468 + slot*4, +0xb8, +0xb4)`，清 `+0xa5`；`+0x17c=0`
4. `+0xb4 < 4` → `+0xf4 = 0`（低关卡关闭特效），跳过实体遍历
5. **遍历门控**：`PTR+0x24 <= 0.0`（爆炸/冻结计时结束）且 `DAT_005d4d74 & 0x40 == 0` 且（单例 vtable+0x28 返回 1 或空）
6. **循环 A（type=1 水果）**，每实体：
   1. 全局锁 `DAT_00557390` 或 `piVar13[0x2b] > 0`（个体延时未到）→ break/跳过
   2. 参与判定：`piVar13[0x6f]==0`（未标记）且 `piVar13[0x41] <= -1.0`（下落态）且 `piVar13[0x34] <= 0.0` 且 `(flags&1)==0` 且 `piVar13[0x30]!=0`（可见）
   3. `FUN_00017d74(game, entity) == 1` → **被切中**（切割判定入口，见 §6）：
      1. `DAT_005d4d80!=0` → `+0xa5=1`（开轨迹）
      2. `(piVar13[0x33]==0 || piVar13[0x32]>3) && piVar13[+0xc1]==0` → `+0x3c += 2`
      3. 清 `+0x44/+0x40`；记录 `+0xf8..+0x100=旧slash位置`、`+0x110=水果类型`、`+0x104..+0x10c=位置`
      4. `piVar13[0x6e]==0`（非炸弹）时：
         - 若 `piVar13[0x21]==2` 或 同实体 → 跳 combo 窗口检查（不计数）
         - 否则 `+0x180=entity`、`+0x174=0`、`comboArr[+0x8c]=type`、`+0x90=(type!=0)`；首发发 `slashesScoring`/`slashes` 统计事件；`+0x51=1`；combo++；`combo>9 → +0x174=0.095`；`+0x54 -= combo*(0.5*rand/8+0.75)`；vtable+0x44 回调
         - `+0x1ba!=0` → `+0x110 += DAT_004d90b4`；`+0x54 += -3.0*(0.5*rand/8+0.75)`
         - `DAT_005d4d6c!=0` → `FUN_00033ca0/FUN_00035a08` 生成命中特效，位置 = `+0x10/+0x14/+0x18`（触摸点）
      5. `piVar13[0x6e]!=0`（炸弹）→ `DAT_00557390=1`（本帧终止）
   4. **未切中**：`DAT_005d4d74 & 2` → 沿触摸点方向推离；`& 1` → 拉近；随后速度 clamp 到 8.0（`FUN_00009b50` 取模长）
7. **循环 B（type=2 炸弹）**：`+0x7d!=0` 且 `piVar13[0x30]<=0` → 命中 → 若 `DAT_005d4d74 & 0x10 == 0`：vtable+0x24(OnSliced)、`DAT_00557390=1`、`+0x7e && piVar13[0x26]==0 → +0xa4=1`；否则位置 `+= 10.0*速度*dt`（炸飞）；未命中 → `FUN_00017fdc` 近失 → `near_miss` 统计事件
8. **循环 C（type=0 其他）**：`piVar13[0x17]!=0 && (flags&0x11)==0 && FUN_00017d74==1` → vtable+0x24、首发 `slashesScoring`
9. **combo 窗口结算**：
   - `+0x174 < DAT_00017024` → `+0x174 += dt`；`>= DAT_00017028` → `+0x174=0.1`、`DAT_005d4d90++`、遍历 combo 回调链表(vtable+0xc)、`FUN_0001a438` 清链、单例 vtable+0x50、combo>=2 时 `DAT_005d4d90?+0x40 = max(x-combo, 2)`
   - combo>=3 → `FUN_0001cd6c()!=1 || +0x90!=2` 时 `FUN_0001cb08(combo, +0x90, 1, 0)`；`FUN_0002c450/0002ca24(combo)`；`"%s_combos"` + `"combos"` 统计；`FUN_0000342c/000042b4(combo, comboArr)`；combo>2 且含 `strawberry` → `strawberry_combo_total`；更新最高 combo 表（`PTR+0x2e4`）
   - 结束后统一：`combo=0; +0x90=0; +0x180=0; +0x178=0; memset(+0x60, 0xff, 0x2c)`
   - 若 `+0x174 >= DAT_00017024` → 直接走清零分支（窗口到期）
10. 尾部子系统更新：`FUN_00018288`、`FUN_0001836c`、`FUN_00018628`（↔ exe `thunk_00bdbf10/00bdc360/00bdc050`）[both]

### 1.3 调用图一跳（macho）

`FUN_0001702c`(前置) · `FUN_00019f10`(轨迹环形缓冲) · `FUN_000065c4/00006ad0/00006af0`(实体迭代器) · **`FUN_00017d74`(命中)★** · **`FUN_00017fdc`(近失)★** · `FUN_00009b50`(模长/点积) · `FUN_002f69c4`(字符串哈希) · `FUN_00027588`(统计上报) · **`FUN_0001cb08`(计分事件)★** · `FUN_0001cd6c`(模式) · `FUN_0002c450/0002ca24` · `FUN_0000342c/000042b4`(combo 历史) · `FUN_0002e030`(最高 combo 比较) · `FUN_00033ca0/00035a08`(特效实体) · `FUN_0001a438`(回调清链) · vtable：`+0x24`(OnSliced)、单例 `+0x28/+0x48/+0x50`、事件链 `+0xc`

### 1.4 裁决

- **无实质冲突**；exe 多出的「命中音效随机选择」分支（`_DAT_016fcf38/_DAT_016f2008/_DAT_016f8410`）在 macho 中未见 → 判定为 **Debug 版额外音效路径**，重建时按 macho 省略，但音效调用位置可参考 exe。
- **vtable 槽偏移差异（重要）**：exe 命中后调 `vtable+0x20`（4 参数），macho 调 `vtable+0x24`（this+4 参数）。判定为 Release 版虚表少一个条目，**重建一律按 macho 的 +0x24 映射 OnSliced**。

---

## §2 G2 连击族：exe `FUN_00b29620`(+`FUN_00aa7890` 置位) ↔ macho `FUN_000718b0`

### 2.1 常量表

| 常量 | hex | float | 语义 | 源/置信 |
|---|---|---|---|---|
| 0.4 | 0x3ecccccd | 0.4 | combo 音效/动画起始插值 | [macho] H |
| 1.0 | 0x3f800000 | 1.0 | 插值终点 | [both] H |
| 0.25 | 0x3e800000 | 0.25 | combo 文本淡入起始 | [macho] H；exe `_DAT_016f4094`[L] |
| 2 | — | — | 视觉档位上限（clamp 0..2） | [both] H(立即数)；exe `DAT_018b6414`[L 应为 2] |
| 5 | — | — | 文本档位上限（clamp 1..5） | [both] H |
| combo 门限 | — | — | `combo > 2` 才进特效分支 | [both] H |

### 2.2 分支全链

1. 前置：`combo > 2` 且 `*(game+0x54)+0x18 != 0`（关卡控制器存在）
2. `FUN_00074428(controller)` → 取 combo 显示节点
3. 属性 `comboValue` 存在 → 格式化 `"%i"` 写入 `+0x7dc` 文本
4. **视觉档位** `tier1 = clamp(combo-3, 0, 2)` → `FUN_00074254(controller, +0x104, tier1)`
5. 音效/动效：`FUN_0007250c(handle, 0.4, 1.0, ctx)`
6. **文本档位** `tier2 = clamp(combo-2, 1, 5)`：构造 `"combo-%i"` → `+0x4c`；`FUN_0002bc94(handle, "combo-%i", 0.25, 1.0)`
7. exe 侧额外：`FUN_00aa7890` 在 `combo>2` 时重建 combo 文本对象（`_DAT_016f40cc` 颜色 + 1.0 alpha）→ 与 4~6 同职责

### 2.3 裁决

- **档位公式 [both] 一致**：`clamp(combo-3,0,2)`（视觉）与 `clamp(combo-2,1,5)`（文本），exe 的两段比较结构与 macho 逐字对应；DECISIONS 中「M41 硬编码 clamp(0..2) 即 3 档」本轮**升级为双源确认**（exe `DAT_018b6414` 应为 2，[待验证] 但逻辑闭合）。
- **combo 语义 [macho] 明确**：`combo = 本窗口内被切水果数`，窗口在 §1 步骤 9 结算；`combo>9` 时窗口计时直接置 0.095（近似立即结算）→ 高连击窗口更紧。

---

## §3 G3 计分：macho `FUN_0001cb08`（事件分发）+ `FUN_00065ad4`（命中率公式）

### 3.1 常量表

| 常量 | hex | float/值 | 语义 | 置信 |
|---|---|---|---|---|
| INT_MAX | 0x7fffffff | 2147483647 | 分数溢出保护阈值 | H |
| 模式 4 | 4 | — | `DAT_005f8db8==4` 时**跳过**溢出保护 | H |
| 模式 5 | 5 | — | 溢出后不归零的模式 | H |
| K | `DAT_00065b70` | ? | 命中率修正系数 | L（待读） |
| 缩放 | `DAT_00065b74` | ? | 结果缩放（疑为 1.0 或 100） | L（待读） |

### 3.2 `FUN_0001cb08(score, comboType, isScoring)` 分支链

1. 全局事件序号 `DAT_005576f0 += 1`
2. 遍历回调链表 `DAT_005576e8`：节点 `(delay==0 || (delay<seq && mode==1))` → `vtable+0xc(score, comboType)`（延迟回调队列，供 UI 滚动计分）
3. `FUN_0001d888` 清链
4. 累加 `DAT_005f8dd4 += vtable_call(...)`：
   - `DAT_005f8db8==4` → **不做** `>0x7fffffff` 归零
   - 否则 → `>0x7fffffff && 模式!=5` 时归零
5. 统计 `"all"`：`score>0 && isScoring==1 && comboType<2` → `FUN_00027588(...,"all", score, 1, 0)`
   - `DAT_005f9378!=0` → `"upside_down_points"`
   - `"bean"` 计数为 0 → `"score_without_beans"`
6. 成就/排行回调 `DAT_005f8da8`：vtable 返回 0 → 再取并 `FUN_00070ba4`（提交检查）
7. **本函数是「计分事件/统计分发器」，不含基础分公式**；基础分在水果切中时写入 `+0x110`（§1 步骤 6.3）。

### 3.3 `FUN_00065ad4` 命中率公式（还原）

```
misses  = stat("slashes") - stat("slashesScoring")     // 未得分的 slash 数
total   = stat("totalfruit")
X       = *(param_1 + 0x2c)                            // 外部修正项
f       = (total + X + K * misses * total) / total     // 命中率系数
result  = (f >= 0.0) ? f * SCALE : 0
return  (int)result
```
- 语义：**命中率惩罚**——每有一次未得分 slash，系数叠加 `K * misses`；负则不参与。
- `K`/`SCALE` 未在函数体内出现值（数据段引用）→ [待验证]。
- [macho] 源码级；exe 对应函数未在本轮导出（exe 侧入口应为 `FUN_00b29620` 内 `thunk_FUN_00c916e0` 的调用链，键名待映射）。

### 3.4 裁决

- 统计键名以 macho 为准：`slashes` / `slashesScoring` / `totalfruit` / `all` / `bean` / `upside_down_points` / `score_without_beans`（exe 仅见 `slashesScoring`/`slashes`/`combos`/`%s_combos`，[both] 部分重合）。
- **溢出保护分支**属发售版真实行为（非 Debug），重建必须保留：模式 4 不做 32 位归零。

---

## §4 G4 波次：macho `FUN_00053cb8`(WaveInfo) + `FUN_00053388`(Spawner) + `FUN_00027f24`(运行时状态)，exe `FUN_00c3a7e0` / `FUN_00b5a560`

### 4.1 常量表（WaveInfo 默认值，`param_1 + param_3*0x40` 块）

| 偏移 | 值 | 语义 | 置信 |
|---|---|---|---|
| +0xb0 | 10 (int) | 默认 override 概率池 ID | H |
| +0xb4 | 0.25 (0x3e800000) | waveChanceRegrowth | H |
| +0xb8 | 1.0 | criticalChance | H |
| +0xbc | 1.0 | dt | H |
| +0xc0 | 0.0 | dtInc | H |
| +0xc4 | 0.0 | dtSpInc | H |
| +0xc8 | 2.0 (0x40000000) | beforeDelay | H |
| +0xcc | 0.0 | beforeDelayInc | H |
| +0xd0 | 0.0 | nextDelay | H |
| +0xd4 | 0.0 | nextDelayInc | H |
| +0xd8 | 0.0 | nextDelaySpInc | H |
| +0xdc | 1 (byte) | waitForEntities 默认 true | H |
| +0xdd | 1 (byte) | waitForProcessing 默认 true | H |
| +0xe0 | 0.0 | speedLoss | H |
| +0xe4 | 100 (int) | override 概率池默认 | H |
| +0xe8/+0xec | 0 / -1 | players 索引区间（默认单玩家） | H |
| +0xf0 | -1 | players 上限 | H |
| spawner 元素 | 0x90 字节 | +0x1c=1.0, +0x2c=-1.0, +0x50/+0x54=1.0, +0x58=-1.0, +0x5c=1.0 | H |
| WaveInfo 元素 | 0xc4 字节 | `[0x13]`=Spawn 子节点数 | H |
| `players=="1,2"` | +0xe8=1,+0xec=2,+0xf0=-1 | 双人共享波次 | H |

### 4.2 `FUN_00053388`（Spawner）字段真值

| 偏移 | 键 | 默认 |
|---|---|---|
| +0x14 | name（堆拷贝） | — |
| +0x18 | name hash | — |
| +0x1c | mode（`FUN_00039714` 枚举） | — |
| +0x20 | minWait | — |
| +0x24 | maxWait | — |
| +0x28 | canSpawnWithPowers（byte，"true"） | — |
| +0x2c | dontSpawnBeforeWave | — |
| +0x4 | chance 累计和 | 0 |
| +0x8 | fruit 候选列表（type+chance） | — |
| 子节点 `fruit` | `chance` 默认 **100** | H |

### 4.3 `FUN_00027f24`（WaveManager 运行时状态）字段真值

`waveCount +0x248` · `numberOfWavesSpawned +0x24c` · `numberOfWavesSinceReset +0x250` · `waveDelay +0x254`(f) · `waveWait +0x258`(f) · `blitzSpawnedThisGame +0x298` · `blitzForceSpawnedCounter +0x29c` · `blitzSpawnTime +0x2a0`(f) · `beanStartPos +0x11c`(vec3) · `beanEndPos +0x128`(vec3) · `beanTime +0x134`(f) · `beanVisible +0x138`(byte，"false" 取反)；`wave` 子节点 → `(inc, index, spawner[delay, toSpawn])` 链表挂 `+0x260`

### 4.4 双源对齐（本轮第二次重大确认）

- `macho FUN_00027f24` 与 `exe FUN_00c3a7e0` 的**键名与偏移完全一致**（+0x248/+0x24c/+0x250/+0x254/+0x258/+0x298/+0x29c/+0x2a0/+0x11c/+0x128/+0x134/+0x138）→ DECISIONS 中「WaveManager 8 键偏移全同」本轮扩展到 **13 键全同** [both]。
- `macho FUN_00b5a560 ↔ FUN_00053388`：exe 版读 `+0xe0/+0xe4/+0xe8/+0xe9/+0xea/+0xec/+0xf0/+0x128/+0x124/+0xf4/+0x120/+0xf8..+0x13c/+0xdc/+0xd8`。**键名未导出（`UNK_`），无法逐键映射** → [待验证]，需用 exe 字符串表解码 `UNK_01709c68` 等指针。
- **until 语义修正（新增）**：`until=="forever" → -2`；`atoi(until)` 且 `value >= waveNo` 才采纳；解析末尾把 `until==-1` 全部推为 `-2`，并对「until 小于后续 waveNo」的波次取 `后续waveNo-1`。（macho 独有后处理，exe 未见 → [macho] 为准）

### 4.5 裁决

- WaveInfo / Spawner / WaveManager 三组默认常量**仅 macho 单源**（exe 版是 Debug 构建，且这些是 XML 缺省值，Debug/Release 差异风险高）→ 重建一律用本表 macho 值。
- `FruitInfo` 默认常量（`FUN_0001267c`，本轮附带获得，对重建极有价值）：
  - `+0x244 scale 默认 25.0f`（0x41c80000）、`+0x248 collision 默认 1.0f`、`+0x24c hitInfluence 默认 0.75f`
  - `+0x314 score` 为 0 → `+0x330=1`（无分标记）；`+0x318` noCritical；`+0x26c` onside；`+0x2fc` onlySprinkle
  - `bomb.size → PTR+0x94`、`bomb.collision → PTR+0x98`
  - 全局 critical 默认：`new_life_at/score/chance/chance_inc/splats` + `scale/spread/disappear_speed`
  - 这是**此前 DECISIONS 标注「fruitlist.xml 无 exe 交叉验证」的单点风险**的补充：本轮仍无 exe 对照，但默认值已与读取点一一绑定。

---

## §5 G5 炸弹/道具：macho `FUN_00020c38`（爆炸初始化）+ `FUN_00056098`（freeze/生成）

### 5.1 常量表

| 常量 | hex | float | 语义 | 源/置信 |
|---|---|---|---|---|
| 炸弹半径/计时 | 0x404ccccd | **3.2** | 写入单例 `+0x24`，主循环用它做爆炸门控 | [macho] H |
| 爆炸参数1 | 0x3fcccccd | **1.6** | `FUN_0000577c` 参数 | [macho] H |
| 爆炸参数2 | 0x40000000 | **2.0** | 同上 | [macho] H |
| 爆炸参数3 | 0x41100000 | **9.0** | 同上 | [macho] H |
| 音效增益 | 0x3f800000 | 1.0 | `"Bomb-explode"` | [macho] H |
| 弹飞系数 | 0x41200000 | 10.0 | 爆炸推离位置 `+= 10*速度*dt` | [macho] H |
| 生成区缩放 | 1.0 / 参数 `+0x78` | 1.0 | 生成位置缩放上限 | [macho] H |
| 池哨兵 | -2 | — | **bomb**（与 DECISIONS M31 一致） | [both] H |
| 空槽 | -1 | — | 无水果 | [macho] H |
| spawner 元素 | 0x90 字节 | — | 列表长度 `+0x4c` | [macho] H |
| 单例 +0xab | — | — | 时钟累加开关 | [macho] L |

### 5.2 `FUN_00020c38` 分支链（首次调用单例初始化）

1. 门控 `PTR_DAT_004d9048[0x17] == 0`（炸弹子系统未初始化）
2. 统计键 `"bomb"` + 事件
3. **单例 `+0x24 = 3.2`**（爆炸计时/半径，主循环 §1 步骤 5 的 `<=0` 门控就是它）
4. `FUN_0000577c(触摸位置, 单例+0x58, 1.6, 2.0, 9.0)` → 创建爆炸实体
5. 记录爆炸位置到 `DAT_00557804/08/0c`；`DAT_005577b0 = 0`
6. 播放 `"Bomb-explode"`（音量 1.0，走委托上下文 `FUN_0000a23c`）

### 5.3 `FUN_00056098`（freeze/生成器 tick）分支链

1. `param_1[0x17b]=0`；`*param_1==0`（未结算）才继续
2. `FUN_000557ac(param_1, dt)`（时间推进）；`单例+0xab!=0` → `+0x40/+0x44 += dt`（总时长/时钟）
3. `freeze = param_1 + param_3*4 + 0x170`：
   - `freeze <= 0` → 置 0；实体管理器 `+0xb8 < +0xbc` 时进入**生成循环**：
     - 遍历 `+0x4c` 个 spawner 条目（每个 0x90 字节）
     - 条目 `+0x18 < 2` → 从概率池抽 ID（`DAT_005a7930` 固定点随机）
     - `ID == -2`（bomb）→ `bombCount++`；`+0x68 > 0` → `FUN_000568f4(param_1, 1, entry)` 触发爆炸
     - 否则 `+0x6c > 0` → `FUN_000537b4` 判类型、`FUN_00057000` 建水果，置 `param_1[param_3+0x178]=1`
     - 条目计时 `+0x1c`/`+0x10` 用 `max(0, x + 速度*dt)` 更新；剩余计数递减
   - `freeze > 0` → 倒计时；归零且 `FUN_00064000(单例+0x7c, 3)==1` → `FUN_00020698(1,0)` + 取 vtable+0x3c
4. `FUN_00057a40(...)==0 && 标志==0` → freeze 剩余 `param_1+param_3*4+0x174`：
   - `>0` → 递减，仍 >0 则返回
   - 归零 → 统计键 `"freeze"`；模式/开关满足 → 实体管理器 `+0xb8 += 1`；单例 vtable+0x38（OnFreeze）；`FUN_0001d10c()==0` 或 `param_1+0x208 < 玩家+0xfc` → `FUN_00054dd8(param_1,param_3)`（立即出果）；`+0x208 += 1`
5. 炸弹状态机 `param_1[0x17a]`：`0 → 1` 且 `+0x17c = rand()*10 + 10`；`1` 且 `param_1[0x179]==1 → 2`
6. 生成标记 `param_1[param_3+0x178]=1`（每帧/每玩家）

### 5.4 裁决

- **炸弹常量 [both] 完全吻合**：3.2 / 1.6 / 2.0 / 9.0（DECISIONS M32 已记录，本轮从 `FUN_00020c38` 直接读出，置信升为 H）。
- 哨兵 `-2 = bomb` [both] 确认（`FUN_00056098` 与 DECISIONS M31 一致），`-1 = 空`。
- exe 对应函数（`FUN_00bf8ed0` 含 `switch` 状态机 0..0x17、`FUN_00c6e770` 含水果表解析）**不是**本轮 5 组之一，但可作 exe 类名/状态编号来源；其 `switch` 值域 `0,1,3,4,8,0xe,0xf,0x10,0x12,0x16,0x17` 与 macho `DAT_005f8db8` 的模式枚举可能同源 → [待验证]。

---

## §6 「切割判定缺失」定位方案（Task 验收项）

关键词法失效的原因已明确：切割几何（`colline/colsphere/triclipper`）在 macho 的 `__FILE__` 串仅 15 条，且不引用玩法关键词。本轮改用工控流定位，**已锁定两个入口**：

| 函数 | 调用点 | 证据 | 语义 |
|---|---|---|---|
| **`FUN_00017d74(game, entity) → int`** | `FUN_00016214` 循环 A/B/C 各一次 | 返回值 `==1` 立即触发 OnSliced(+0x24)、计分、combo 计数 | **命中测试（切割判定）** |
| **`FUN_00017fdc(game, entity) → int`** | 循环 B 未中分支 | `==1` → 统计 `"near_miss"` | 近失判定（无伤划过） |

**下一步（可直接执行，无需再猜）**：
1. Ghidra 导出 `FUN_00017d74` / `FUN_00017fdc` 全量反编译（各约 1 个函数体）；从 `FUN_00017d74` 的调用图向下一跳即可命中引擎碰撞层（`colaabb/coline/colsphere`）。
2. 交叉验证：在 macho 全局数据区搜 **15.0f(0x41700000) / 0.75f(0x3f400000) / 8.0f(0x41000000)** 邻接常量簇——命中测试必然引用碰撞半径与 `hitInfluence`（§4.5 已确认 FruitInfo `collision=1.0`、`hitInfluence=0.75`），可反向锁定函数。
3. exe 侧用 MSVC RTTI 类 `Fruit`/`SlashEntity` 的虚表项 `+0x24`（OnSliced 实现）反查其调用者，与 macho 地址语义对齐（注意 §1.4 的 +4 vtable 偏移）。
4. 几何公式回归：`FUN_00009b50`（模长/点积）在 `FUN_00016214` 内被用于「水果与触摸点距离」，其最后一次调用结果与 8.0 比较 → 可作切割判定的距离阈入口。

---

## §7 待验证常量清单（下一轮读数据段即可闭合）

| 符号 | 出现位置 | 推测 | 验证方式 |
|---|---|---|---|
| `_DAT_0197f47c` / `PTR+0x44` | 固定步长 | 1/60 或 1/30 | 读 exe/macho 数据段 |
| `_DAT_016ec7e0` | 冻结判定 | 0.0 | 同上 |
| `DAT_00016614` / `_DAT_016f2018` | slash 轨迹时长 | 0.1~0.3s | 同上 |
| `DAT_00016618` | combo 随机除数 | 8.0 | 同上 |
| `DAT_00017024` / `DAT_00017028` | combo 窗口上下限 | 0.3~1.0s | 同上 |
| `DAT_00065b70` / `DAT_00065b74` | 命中率 K / SCALE | 0.5 / 1.0 | 同上 |
| `_DAT_016f29f0` / `_DAT_016f2028` | 半径归一化 0.5 / 15.0 | 已由公式闭合 | [M] 可确认 |
| `DAT_005d4d74` 位掩码 | 特效/调试开关 | 1,2,4,8,0x10,0x40 | 枚举清单 |
| `_DAT_019514dc` 位掩码 | 音效开关 | 1,2,4,8,0x10,0x40 | 同上 |
| `UNK_01709c68` 等 exe 串 | Spawner 键名 | name/mode/minWait… | 读 exe 字符串表 |

---

## §8 与既有 DECISIONS 的一致性核对

- M41 combo 档位 clamp(0..2) → **双源确认**（§2）✅
- M32 炸弹常量 3.2/1.6/2.0/9.0 → **双源确认**（§5）✅
- M31 炸弹哨兵 -2 → **双源确认**（§5.3）✅
- M11/E06 WaveManager 偏移一致 → **扩展至 13 键**（§4.4）✅
- M27/E11 slashMod 12 键一致 → 本轮未涉及，维持
- 「critical 是 float 概率」→ §4.1 `criticalChance` 确为 float 读取（`FUN_00053cb8` 中 `FUN_0030c718`）✅
