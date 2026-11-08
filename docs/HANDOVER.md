# 交接说明（2026-11-08）

> 给下一位接手者：这份文档只写**能验证的事实**与**明确的缺口**，不含推测。
> 更细的证据出处见 `shared_context/findings/`，逐条决策见 `shared_context/DECISIONS.md`。

## 1. 现在能做什么

```
xcodegen generate && xcodebuild ... （CI 每轮执行）
→ 能编译、能跑完全部单测、能产出可侧载的未签名 IPA
```

| 能力 | 状态 | 验证方式 |
|---|---|---|
| 编译（模拟器，含 vendored FreeType 的 159 个 C 文件） | ✅ | CI `Build & Test` |
| 单元测试（Core / Render / UI 三个 bundle） | ✅ | CI |
| Release 归档 + 未签名 IPA | ✅ | CI `Package unsigned IPA` |
| 包内容校验（资源、架构、字体） | ✅ | CI 内断言 |
| **真机/模拟器实际观感** | ❌ **从未验证** | 无可用设备 |

## 2. 已经按发售版证据实现的部分

### 2.1 挑战地图（本轮工作的重点）

整条链路，每一层都有证据与测试：

| 层 | 文件 | 证据 |
|---|---|---|
| 字符串 | `ChallengeMapStrings` / `LocalizedStrings` | 发售版 StringTables（879 条全量） |
| 字体 | `vendor/freetype` + `FontShim` + `FreeTypeTextFontMetrics` | findings §3.1（原版静态链入 FreeType） |
| 排版 | `TextLineBreaker` / `TextLayoutEngine` / `TextLineMetrics` | font_engine_real.txt / §2.6 汇编定案 |
| 对齐 | `TextAlignment` / `TextVerticalAlignment` | §2.4 / t089 |
| 网格 | `TextMeshBuilder` | glyph_vertex_order_macho.md |
| 图集 | `GlyphAtlas` + `TextAtlasTexture` | §3 |
| 提交 | `TextQuadPass`（6 顶点三角形） | orderedQuad 着色器复用 |
| 背景屏 | `inGameChallengeBackground` 投影 + `animate_in` | challenge_settlement_full_macho.md:28-33 |
| 贴图 | `artworkManifest.json`（57/63 命中） | UISF 引用 × assets_png 全量比对 |

### 2.2 挑战模式行为

7 处已确证偏差全部修正并通过测试：权重初值、`draw` 强制推进、每回合默认初选、
LCG 种子、`writeActualIcons` 的 forceVisible、结算状态机、清理后相位 = 5。

## 3. 明确的缺口（不要用猜测填补）

1. **15 个界面没有视图**：`extras` / `shop` / `about` / `news` 等 `openScreen` 在
   `AppViewModel` 里被静默忽略。补它们需要 `.uiscreen` XML → 布局的解析器；
   App 里**没有**这个解析器（挑战地图用的是预生成的 `*Animations.json`）。
2. **若干标签无对应键**：结算屏的 BEST / MAX COMBO / FRUIT、暂停屏的 RESUME / RESTART。
   对应 `.uiscreen` 的文本组件里查不到这些键——原版很可能把标签烘进贴图，需另行取证。
3. **三处 `[待验证]`**（影响像素级一致性）：字号→像素换算、bearing→记录字段映射、FreeType 版本。
4. **真机观感**：以上全部只在编译与单测层面验证过。

## 4. 工具链（都已在仓库里，可直接用）

| 脚本 | 作用 |
|---|---|
| `tools/github_api_push.py` | 走 GitHub API 推送（`github.com` 在本机超时，只能用 `api.github.com`） |
| `tools/verify_remote.py` | 本地与远端 blob sha 对比 |
| `tools/ci_status.py` / `tools/ci_fail.py` | 查 CI、下载失败日志 |
| `tools/static_check.py` | 无 Swift 工具链时的静态检查 |
| `reverse/extract_string_table.py` | UISF + 字符串表 → 屏文案 JSON |
| `reverse/dump_localized_strings.py` | 全量字符串表导出 |
| `reverse/build_artwork_manifest.py` | UISF 贴图引用 × assets_png → 清单 |

## 5. 工作方式约定（沿用）

- 攒批修改 → 自查 diff → 一次推送 → 验证 CI；不逐个改动推 CI。
- 任何行为改动都必须有发售版证据（反编译/资源/字符串表），推断必须标 `[推断]` / `[待验证]`。
- 与原版冲突时以 armv7 Mach-O 为准（类结构可用 x86 PE）。