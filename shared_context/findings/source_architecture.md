# 发售版源码架构地图（2026-10-30，从 x86 Debug 版 __FILE__ 串恢复）

来源：`FruitNinjaPIB.exe` 中 1246 条源文件路径串（`__FILE__`/`__ASSERT` 残留），去重 276 个。
游戏本体 53 个文件 / 321 次引用。**源码根：`d:\projects\fruitninjapuss\source\`**，引擎 `d:\projects\engines\mortarworking\src\source\`。

## 游戏侧模块（按职责）

| 模块 | 文件 | 职责推断 | 热度* |
|---|---|---|---|
| 实体系统 | `entity/entitymanager.cpp` | 实体生命周期/更新调度（全场 busiest） | x88 |
| 实体系统 | `entities/actormanager.cpp` | 玩法角色管理（fruit/slash/jiblet 的调度） | x54 |
| 核心玩法 | `entities/fruit.cpp` | 水果实体：生成/运动/被切行为 | x12 |
| 核心玩法 | `entities/slash.cpp` | **切割判定核心** | x4 |
| 核心玩法 | `entities/jiblet.cpp` | 碎块（被切后的半果） | x1 |
| 核心玩法 | `utils/combochecker.cpp` | **连击判定** | x3 |
| 核心玩法 | `utils/scoremodifier.cpp` | 计分修正 | x1 |
| 核心玩法 | `wavemanager/wavemanager.cpp` | **出果波次控制**（街机模式节奏） | x8 |
| 模式 | `originalmode/originalmodecontrol.cpp` | 经典模式 | x3 |
| 模式 | `challengemode/*` (9 文件) | 挑战模式全套（conditions/control/mods/tier/scorebonus/uimap） | x50 |
| 存档 | `save/save.cpp` | 存档 | x4 |
| HUD | `hud/*` (16 文件) | 界面（superfruitchest/pinata/upsell…） | x41 |
| 音频 | `sound/gamesound.cpp`, `sound/vomanager.cpp` | 游戏音效/VO | x12 |
| 入口 | `game.cpp`, `initialise.cpp`, `gametask/gametask.cpp` | 启动/主任务 | x7 |

*热度=该文件路径串出现次数≈断言/日志点数量，指示模块复杂度。

## 引擎侧关键模块（节选）

- `collision/`: colaabb/colline/colsphere — **线 vs 球 = 切割几何**
- `display/gles2/`, `texture/opengles2/`, `basicgraphics/gles2/` — GLES2 渲染管线
- `mesh/triclipper.h` — 三角形裁剪（切半效果？）
- `userinterface/components/componentswipie.cpp` — **swipe（滑切输入）组件**
- `renderer/scenegraph/skyworld/gamescene_skyworld.cpp` — 游戏场景

## 定位协议（Phase 1 取数路线）

1. **macho 侧**：用文件名串（`fruit.cpp`/`slash.cpp`/`combochecker.cpp`/`wavemanager.cpp`/`entitymanager.cpp`）做 xref → 直接拿到**发售版**各类实现函数的地址+反编译 [macho]
2. **exe 侧**：同名文件串 xref → 有 RTTI 类名对照，补结构/命名 [exe]
3. 每条结论标 `[macho]/[exe]/[both]`，数值以 macho 反编译为准
