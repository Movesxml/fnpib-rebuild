# 首次编译排障清单（T-020）

> **状态诚实说明**：本仓库当前在 Windows 开发机上开发，`xcodegen` / `xcodebuild` 均未在真实 macOS 上跑过。
> 本文件所有条目都来自对 `project.yml`、`App/Info.plist`、`blueprint/*.swift`、
> `Sources/FNPBCore/Loop/GameWorld.swift` 的**静态审查**，不是实测日志。
> 标 `[待验证]` 的是需要首跑确认的推断项；标 `H` 的是从代码结构可直接推出的确定项。
>
> 覆盖范围：仅「编译 + 逻辑层单元测试」。真机/未签名 IPA、资产管线、UI 层缺失、渲染正确性都不在本链。

---

## 0. 本仓库尚未推 GitHub 时的本地替代命令（macOS 上执行）

Windows 上**无法**编译（无 Xcode 工具链；XcodeGen 官方无 Windows 二进制 [待验证]），
只能用 `actionlint`（Go/Docker 安装）对 `.github/workflows/ios.yml` 做语法与表达式检查。

在 Mac（装 Xcode 26.x + XcodeGen 2.44.1）上，CI 等价的一行命令：

```bash
# 生成 + 编译 + 跑 FNPBCoreTests（与 workflow 完全等价，不签名）
xcodegen generate --spec project.yml && \
xcodebuild test \
  -project FNPIB.xcodeproj -scheme FNPIB -configuration Debug \
  -destination 'platform=iOS Simulator,name=iPhone 17' \
  -derivedDataPath build/DerivedData \
  -resultBundlePath build/TestResults.xcresult | xcpretty --test
```

分步版（推荐首次排障用，能定位卡在哪一步）：

```bash
# 1) 确认工具链
xcode-select -p                      # 必须是 Xcode 26.x
xcodebuild -version                  # Xcode 26.x
xcrun --sdk iphonesimulator --show-sdk-version   # 26.x

# 2) 只验证工程生成（最快，几秒）
xcodegen generate --spec project.yml
xcodebuild -list -project FNPIB.xcodeproj

# 3) 只编译（模拟器，免签名）
xcodebuild build -project FNPIB.xcodeproj -scheme FNPIB -configuration Debug \
  -destination 'generic/platform=iOS Simulator' \
  -derivedDataPath build/DerivedData CODE_SIGNING_ALLOWED=NO | xcpretty

# 4) 确认模拟器机型存在，再跑测试
xcrun simctl list devices available | grep "iPhone 17"
xcodebuild test -project FNPIB.xcodeproj -scheme FNPIB -configuration Debug \
  -destination 'platform=iOS Simulator,name=iPhone 17' \
  -derivedDataPath build/DerivedData | xcpretty --test
```

失败时优先看原始日志而不是 xcpretty 的美化输出：`build/DerivedData/Logs/Build/*.xcactivitylog`
（或 workflow 上传的 `build.log` / `test.log`）。

---

## 1. 预期与失败分级

| 阶段 | 失败含义 | 该找哪一节 |
|---|---|---|
| Select Xcode 26 | runner 镜像/SDK 不匹配 | §3.1 |
| Install XcodeGen | brew 版本漂移 | §3.13 |
| Generate Xcode project | spec 与磁盘文件不一致 | §3.2 / §3.7 |
| Build | Swift 6 并发、existential、Metal、plist | §3.3–§3.9 |
| Test | 测试 target 配置或模拟器机型 | §3.10 / §3.11 |

预计耗时：首次全量编译 8–15 分钟（含 Metal 编译与 5 个 target）；`timeout-minutes: 40` 留了约 2.5 倍余量。

---

## 2. 资产依赖结论（任务卡要求核查项）

**结论：编译链不依赖任何原版美术资源；但「是否存在编译期资产依赖」无法从现有上下文确认——标 `[待验证]`。**

依据：

1. **[2026-11-07 更正]** 本文 T-020 时写的「`project.yml` 里没有任何 `resources:` 条目」已过时：
   现在 App target 把 `Content/` 以 `buildPhase: resources` 列入（`project.yml:107-110`），
   44 个文件平铺进 `.app` 根（CI 日志 `8_Build (Debug, simulator)` 可见）。
   但这仍然只是**运行期**资源：编译器看不到 `Content/` 里的内容，
   `.tex` / `assets.zip` / `fruitlist.xml` 的产物不参与编译，所以下面 §2 的结论本身不变。
2. `FNPBCore` 是纯逻辑 framework（`project.yml` 注释明确「不得依赖 UIKit/Metal」），
   T-019 约定 `ContentBundle` 加载失败**降级为占位**——这是运行期行为，不影响编译。
3. 但本轮注入的共享上下文中**不含** `Sources/FNPBCore/Content/*.swift`，无法核实其中是否有：
   - 编译期由 Run Script 生成的 Swift 常量文件（如 SwiftGen 风格）→ 若有，CI 需补生成步骤；
   - `Bundle.module` 引用（SPM 专属 API，framework target 不存在）→ 属编译错误，见 §3.8；
   - `#file`/`#filePath` 相对路径读取仓库文件（模拟器沙盒内不可读）→ 测试期崩溃，非编译错。

因此 workflow 的 `Prepare workspace` 步骤**只做** `mkdir -p Raw build`，不做资源生成。
若首跑出现 `cannot find 'xxx' in scope` 且该符号来自资产生成的常量文件，按下面补：

```yaml
# 仅当确认存在编译期资产生成时才加，别提前加
- name: Generate content constants
  run: python3 tools/AssetPipeline/generate_constants.py --raw Raw --out Sources/FNPBCore/Content/Generated
```

---

## 3. 编译错误 Top 14（按命中概率排序）

### 3.1 Xcode / 部署目标不匹配（阻塞一切，最先撞）

- **症状**
  - `error: The iOS deployment target 'IPHONEOS_DEPLOYMENT_TARGET' is set to 26.0, but the range of supported deployment target versions is 12.0 to 18.x.`
  - 或 `xcodebuild: error: Unable to find a destination matching the provided destination specifier`（镜像里没有 iOS 26 runtime）
  - 或 `xcodebuild: error: SDK "iphonesimulator" cannot be located`
- **根因**：`project.yml` 的 `deploymentTarget.iOS = 26.0` 与 `IPHONEOS_DEPLOYMENT_TARGET = 26.0` 是硬约束，必须 Xcode 26 SDK；`macos-15` 镜像默认 Xcode 未必是 26（[待验证]）。
- **修法**
  1. 首选：换 `runs-on: macos-26`，或确认 `macos-15` 镜像确实预装 `Xcode_26*.app`；
  2. 本地/临时验证：把 `deploymentTarget` 降到 runner SDK 上限（**只做语法级验证，不要提交**）；
  3. workflow 的 `Select Xcode 26` 步骤已在找不齐时直接 `::error::` 退出，看该步日志即可确认。
- **涉及**：`.github/workflows/ios.yml`（`runs-on`、Select Xcode 步骤）、`project.yml`
- **置信**：H（版本是硬编码的）

### 3.2 `xcodegen generate` 因缺失 sources 路径失败 / 生成空 target

- **症状**
  - `Spec validation error: Target "FNPBUI" has a source path "Sources/FNPBUI" which does not exist`（不同 XcodeGen 版本措辞不同 [待验证]）
  - 或生成成功但目标无源文件，随后在 App 侧报 `cannot find 'MenuView' in scope` / 链接期 `Undefined symbols`
- **根因**：`project.yml` 给 5 个 target 都写了 `sources: - path: ...`，而 `Sources/FNPBUI`、`Sources/FNPBRender/Shaders` 等目录可能尚未全部落盘（T-019 汇总里 UI 层还是「剩余工作」）。
- **修法**
  1. 目录建好并提交 `.gitkeep`（`generateEmptyDirectories: true` 才会生效）；
  2. UI 层尚未开工时，把 `FNPBUI` target 与 FNPIB 的对应依赖注释掉，等有源文件再加回；
  3. workflow `Prepare workspace` 步骤会逐目录打印 `ok / ::warning::`，先看这一步。
- **涉及**：`project.yml`、`Sources/FNPBUI/`、`Sources/FNPBRender/Shaders/`
- **置信**：H（目录清单与 T-019 汇总对不上）

### 3.3 Info.plist 双写冲突（`info:` 块 vs `INFOPLIST_FILE`）

- **症状**
  - **A（静默数据丢失）**：`xcodegen generate` 后用 `git diff App/Info.plist` 会看到文件被重写，
    `UIRequiresFullScreen`、`CADisableMinimumFrameDurationOnPhone`、`UIRequiredDeviceCapabilities`、
    `LSApplicationCategoryType`、`UIViewControllerBasedStatusBarAppearance` 等手工维护的键**消失**；
  - **B（硬错误）**：`error: Multiple commands produce '.../FNPIB.app/Info.plist'`；
  - **C（行为错）**：`project.yml` 的 `info.properties` 写的是 **Landscape**，而 `App/Info.plist` 写的是 **Portrait**
    → 生成/手写两份来源不一致，方向行为随机。
- **根因**：FNPIB target 同时有 `info: { path: App/Info.plist, properties: ... }`（XcodeGen 会**生成并覆盖**该文件）
  与 `INFOPLIST_FILE: App/Info.plist` + `GENERATE_INFOPLIST_FILE: NO`（Xcode 使用该文件）。
- **修法**：删掉 FNPIB target 的整个 `info:` 块，只保留
  ```yaml
  settings:
    base:
      GENERATE_INFOPLIST_FILE: NO
      INFOPLIST_FILE: App/Info.plist
  ```
  所有 Info 键回到 `App/Info.plist` 手工维护（plist 里已经全了）。方向问题按实测统一到一份来源。
- **涉及**：`project.yml`（FNPIB target）、`App/Info.plist`
- **置信**：H（两处定义同时存在是确定的；A/B 哪种形态先出现取决于 XcodeGen 版本）

### 3.4 Swift 6 严格并发：MainActor 隔离 vs `Sendable`

- **症状**（任一）
  - `error: Sending 'services' risks causing data races`
  - `error: non-Sendable type 'GameServices' cannot cross actor boundary`
  - `warning: capture of 'world' with non-sendable type 'any EntityStore' in a '@Sendable' closure`
  - `error: call to main actor-isolated instance method 'tick(dt:state:world:services:)' in a synchronous nonisolated context`
- **根因**：`GameWorld.swift` 已明确声明「`GameServices` 非 Sendable，由逻辑线程（MainActor）独占、禁止跨 actor 传递」。
  而 `FNPBPlatform` 的驱动（`CADisplayLink`）与 `App` 入口把 `GameWorld.tick` 拉进回调闭包——只要某个闭包被标
  `@Sendable` 或处于非隔离上下文，Swift 6 语言模式就会拦下。`SWIFT_STRICT_CONCURRENCY=complete` + `SWIFT_VERSION=6.0`
  下这些是 error 而非 warning（`SWIFT_TREAT_WARNINGS_AS_ERRORS=NO` **不能**把 error 降级）。
- **修法**
  1. 驱动链路统一 `@MainActor`：`TimeDriver` / `GameLoop` 标 `@MainActor`，
     CADisplayLink 回调内用 `MainActor.assumeIsolated { ... }`（回调本身在主 RunLoop）；
  2. 协议隔离一致：`GameTicking.tick` 与各服务协议要么全 `@MainActor`，要么全 `nonisolated`；
  3. **禁止**用 `@unchecked Sendable` 绕过（`GameWorld.swift` 注释已明令禁止）。
- **涉及**：`Sources/FNPBCore/Loop/GameWorld.swift`、`Sources/FNPBCore/Loop/TimeDriver.swift`、`Sources/FNPBPlatform/*`、`App/FNPBApp.swift`
- **置信**：H（注释里的设计声明与 CI 的并发设置为已知约束）

### 3.5 existential 用法：缺 `any` 或协议不能做存在类型

- **症状**
  - `error: use of protocol 'EntityStore' as a type must be written 'any EntityStore'`
  - `error: type 'any EntityStore' cannot conform to 'EntityStore'`
  - `error: protocol 'RandomSource' can only be used as a generic constraint because it has Self or associated type requirements`
  - `error: cannot pass immutable value as inout argument: 'world' is a 'let'`（`inout any X` 转发时常见伴随错）
- **根因**：Swift 6 语言模式强制显式 `any`。`GameWorld.swift` 内部已正确写了 `any EntityStore`，
  但 `FNPBRender` / `FNPBPlatform` / `FNPBUI` / 测试替身里若仍有裸协议名（如 `var world: EntityStore`），会全数报错。
- **修法**：全仓检索补 `any`：
  ```bash
  grep -rnE ':\s*(EntityStore|RandomSource|SliceTesting|ComboTracking|ScoreDispatching|StatsRecording|WaveDirecting|AudioPlaying|EffectEmitting)\b' Sources Tests
  ```
  带 associatedtype 的协议不能做 existential → 改泛型参数或 `some`（注意 `inout some X` 不支持，需重载）。
- **涉及**：`Sources/FNPBRender/*`、`Sources/FNPBPlatform/*`、`Tests/FNPBCoreTests/*`
- **置信**：M（本轮上下文未含这些文件，命中点未知，但模式必然存在）

### 3.6 `@testable import FNPBCore` 失败

- **症状**
  - `error: module 'FNPBCore' was not compiled for testing`
  - 或 `error: no such module 'FNPBCore'`
- **根因**：`@testable` 要求被测模块以 **Debug + `ENABLE_TESTABILITY=YES`** 构建；
  以 Release 构建、或 framework target 的 `ENABLE_TESTABILITY` 被显式关掉都会失败。
  `project.yml` 当前 `settings.base` 没有显式声明它，依赖 Xcode 默认（Debug=YES）。
- **修法**
  1. 坚持 `-configuration Debug`（workflow 已固定）；
  2. 显式钉住，避免依赖默认值漂移：
     ```yaml
     settings:
       configs:
         Debug:
           ENABLE_TESTABILITY: YES
     ```
  3. 别用 `-enableTestability` 之类的无效参数（那是 SPM 的）。
- **涉及**：`project.yml`（FNPBCore / FNPBCoreTests）、`Tests/FNPBCoreTests/*`
- **置信**：M（默认值是 YES，首跑可能直接过；属加固项）

### 3.7 `blueprint/*.swift` 双来源导致重复定义

- **症状**
  - `error: invalid redeclaration of 'Constants'` / `invalid redeclaration of 'GameState'`
  - `error: Multiple commands produce '.../Constants.o'`
  - 反向症状：`cannot find 'Constants' in scope`（说明文件根本没进工程 → 见 workflow 的 pbxproj 断言）
- **根因**：`project.yml` 把 `blueprint/Constants.swift`、`blueprint/GameState.swift` **直接编入** FNPBCore。
  若 `Sources/FNPBCore/` 下已有一份同名类型（例如 `Constants.Physics` 占位常量、或在 `GameWorld.swift` 里重声明），
  同 target 内就是重复定义。
- **修法**：单一来源。先查：
  ```bash
  grep -rnE '^(public )?(enum|struct|final class) (Constants|GameState)\b' Sources blueprint
  ```
  若两处都有 → 删掉 `Sources/` 侧副本（保留 blueprint 为准，因为它是双源核对后的产物），
  或把 blueprint 里的文件移入 `Sources/FNPBCore/` 并改 `project.yml` 的 sources 列表。
- **涉及**：`project.yml`、`blueprint/Constants.swift`、`blueprint/GameState.swift`、`Sources/FNPBCore/**`
- **置信**：H（结构上就是双来源，是否冲突取决于 `Sources/` 侧内容）

### 3.8 `Bundle.module` 在 framework target 不存在

- **症状**：`error: type 'Bundle' has no member 'module'`
- **根因**：`Bundle.module` 由 SwiftPM 自动生成，**只在 SPM target 内可用**。
  本工程是 XcodeGen + Xcode framework target，没有这个访问器。资产加载代码（ContentBundle，T-019）很容易顺手写成 `Bundle.module.url(forResource:)`。
- **修法**：
  ```swift
  // framework 内取自身 bundle
  private static let resources = Bundle(for: ContentBundleToken.self)  // 需一个 marker class
  ```
  或 `Bundle(identifier: "com.example.fnpib.core")`；App 侧用 `Bundle.main`。
- **涉及**：`Sources/FNPBCore/Content/*`（未见文件，标 [待验证] 是否已存在）
- **置信**：M

### 3.9 Metal：工具链缺失 / shader 编译错误 / metallib 位置

- **症状**
  - `error: Metal Toolchain is not installed`（Xcode 26 起 Metal 编译器可从 IDE 组件/命令行按需下载 [待验证]）
  - `Metal Compiler Error: ...`（`.metal` 语法/入口签名错）
  - 编译通过但**运行期** `device.makeDefaultLibrary()` 返回 `nil` → 黑屏（CI 全绿也照样黑屏，因为 `FNPBCoreTests` 不碰渲染层）
- **根因**：`FNPBRender` 是 framework，`.metal` 编译产物是 `FNPBRender.framework/default.metallib`，不在主 bundle。
- **修法**
  1. CI 加可选步骤（失败不致命）：
     ```yaml
     - name: Install Metal toolchain (optional)
       continue-on-error: true
       run: xcodebuild -downloadComponent MetalToolchain
     ```
     [待验证] 该子命令在所锁 Xcode 版本上的可用性。
  2. 代码侧：改用 `try device.makeDefaultLibrary(bundle: Bundle(for: RenderToken.self))`。
  3. 想让 CI 抓到 shader 错，用独立冒烟编译：
     `xcrun -sdk iphonesimulator metal -c Sources/FNPBRender/Shaders/*.metal -o /dev/null`
- **涉及**：`Sources/FNPBRender/Shaders/*.metal`、`Sources/FNPBRender/*`、workflow
- **置信**：M（未见 shader 文件内容）

### 3.10 无 host app 的模拟器单元测试跑不起来

- **症状**
  - `Failed to load the test bundle. The bundle "FNPBCoreTests.xctest" couldn't be loaded because it is damaged or missing necessary resources.`
  - 或 `Early unexpected exit, operation never finished bootstrapping - no host application was provided`
  - 或 `xcodebuild: error: Scheme FNPIB is not currently configured for the test action.`
- **根因**：`FNPBCoreTests` 是 `bundle.unit-test` 且**故意不设** `TEST_HOST`（纯逻辑测试）。理论上 iOS 模拟器支持
  host-less `.xctest`（由 `xctest` runner 拉起），但需要 scheme 的 test action 正确配置（`project.yml` 里已配 `schemes.FNPIB.test.targets`）。
- **修法**
  1. 先确认 `xcodebuild -list -project FNPIB.xcodeproj` 里有 `FNPIB` scheme；
  2. 若仍报缺 host，退一步挂到 App：
     ```yaml
     TEST_HOST: $(BUILT_PRODUCTS_DIR)/FNPIB.app/FNPIB
     BUNDLE_LOADER: $(TEST_HOST)
     ```
     并把 scheme test action 的 build targets 里加入 `FNPIB: all`（已隐含）。
- **涉及**：`project.yml`（FNPBCoreTests）、`Tests/FNPBCoreTests/*`
- **置信**：M（依赖 Xcode 版本行为）

### 3.11 `iPhone 17` 模拟器不存在

- **症状**：`xcodebuild: error: Unable to find a destination matching the provided destination specifier: { platform:iOS Simulator, name:iPhone 17 }`
- **根因**：机型的可用性依赖所装 simulator runtime；`OS=latest` 只解决版本不解决机型。
- **修法**：先枚举再改 env（workflow 的 `Diagnostics` 步骤已打印 `simctl list devices available`）：
  ```bash
  xcrun simctl list devices available | grep -i iphone
  ```
  把 `env.SIM_NAME` 改成实到机型（或用 `platform=iOS Simulator,OS=latest,name=<机型>`）。
  更稳的写法是 `-destination 'platform=iOS Simulator,OS=latest'`（不带机型），但会失去机型确定性，不推荐用于游戏回归。
- **涉及**：workflow `env.SIM_NAME`
- **置信**：M（虚构/真实的机型命名差异）

### 3.12 签名 / 团队缺失

- **症状**
  - `error: Signing for "FNPIB" requires a development team.`
  - `error: No signing certificate "iOS Development" found`
  - `error: No profiles for 'com.example.fnpib' were found`
- **根因**：`project.yml` 有 `CODE_SIGN_STYLE: Automatic` 但**没有** `DEVELOPMENT_TEAM`。
  一旦 destination 变成 `generic/platform=iOS`（真机）或缺 `CODE_SIGNING_ALLOWED=NO`，就会撞上。
- **修法**：本链只构建模拟器 —— 保持 `-destination 'generic/platform=iOS Simulator'` +
  `CODE_SIGNING_ALLOWED=NO`（workflow 已如此）；不要为 CI 去填假 team。真机未签名 IPA 归 `pipeline/`。
- **涉及**：workflow build/test 步骤、`project.yml`
- **置信**：H

### 3.13 XcodeGen 版本漂移

- **症状**：workflow `Install XcodeGen` 步报 `::error::XcodeGen 版本漂移：期望 2.46.0，实得 2.47.0`；
  或新版 spec 解析行为变化导致 `project.pbxproj` 大量无意义 diff。
- **根因**：Homebrew `xcodegen` formula 无版本固定能力，`brew install` 永远拿最新。
- **修法**
  1. 常规：把 `env.XCODEGEN_VERSION` 更新到实际版本并 commit；
  2. 严格重现：改用官方 release 固定二进制（不依赖 brew）：
     ```bash
     V=2.46.0
     curl -fsSL -o /tmp/xcodegen.zip \
       "https://github.com/yonaskolb/XcodeGen/releases/download/${V}/xcodegen.zip"
     unzip -q /tmp/xcodegen.zip -d /tmp/xcodegen
     BIN=$(find /tmp/xcodegen -type f -name xcodegen -perm -u+x | head -1)   # 包内布局 [待验证]
     sudo install -m 755 "$BIN" /usr/local/bin/xcodegen
     xcodegen --version
     ```
  3. 建议把 `FNPIB.xcodeproj/` 加进 `.gitignore`（工程是生成物），避免版本差异带来的 diff 噪音。
- **涉及**：workflow `env.XCODEGEN_VERSION`、`.gitignore`
- **置信**：H（版本断言是我写的，必然按定义生效）

### 3.14 `ENABLE_USER_SCRIPT_SANDBOXING: YES` × 未来资产管线 Run Script（预防项）

- **症状**：`Sandbox: bash(1234) deny(1) file-write-create ...`，或脚本读仓库文件被拒
- **根因**：`project.yml` 全局开了 `ENABLE_USER_SCRIPT_SANDBOXING: YES`。当前无 Run Script phase 所以无害；
  一旦把 `tools/AssetPipeline`（`.tex`→ktx2/xml→json）接成 build phase，脚本写 DerivedData 之外会被沙箱拦。
- **修法**：给该脚本声明 `inputFiles`/`outputFiles`；或对该 target 单独覆盖 `ENABLE_USER_SCRIPT_SANDBOXING: NO`。
- **涉及**：`project.yml`、`tools/AssetPipeline/*`
- **置信**：M（预防性）

---

## 4. actionlint 人工检查点（workflow 语法自检）

在 Windows 上用 `actionlint .github/workflows/ios.yml`（Go 安装或 Docker `rhysd/actionlint`）应无报错。人工复核项：

1. `timeout-minutes: 40` 在 **job 级**（不是 step 级）。
2. `concurrency` 在 workflow 顶层，用了 `cancel-in-progress`。
3. `on` 三个触发齐全：`push`(main) / `pull_request`(main) / `workflow_dispatch`。
4. `run` 内的 `$SIM_NAME` / `$PROJECT` / `$DERIVED_DATA` 是 **shell 变量展开**（由 job `env` 导出），
   不是 `${{ env.X }}`；两层不要混用（混用时 actionlint 会在 spec 校验期报未定义）。
5. 所有 `if:` 只用 `failure()` / `always()`，未引用不存在的 step id。
6. `actions/upload-artifact@v4` 的 `path` 与脚本实际写入位置一致：`build.log`/`test.log` 在工作区根，
   `.xcresult` 在 `build/TestResults.xcresult`（`build/` 已由 Prepare 步骤创建）。
7. `permissions: contents: read` 最小化；无 `secrets` 依赖。
8. 每个 `pipefail` 管线都以 `(xcpretty || cat)` 收尾，保证「xcpretty 缺失」不会伪装成构建失败。

---

## 5. 建议的首跑顺序（省时间）

1. `xcodegen generate --spec project.yml && xcodebuild -list -project FNPIB.xcodeproj`
   → 先把 §3.2 / §3.7 / §3.13 这三类「还没编译就死」的问题清掉（通常 30 秒内暴露）。
2. `xcodebuild build ... CODE_SIGNING_ALLOWED=NO`
   → 集中处理 §3.3（plist）、§3.4/§3.5（Swift 6 并发与 existential）、§3.8（Bundle.module）、§3.9（Metal）。
3. `xcodebuild test ...`
   → 只剩 §3.6 / §3.10 / §3.11。

预计真实工作量：**Swift 6 严格并发（§3.4 + §3.5）会是主要时间黑洞**，其余多为一次性配置修正。

---

## 6. 本链**不**验证的东西（避免误判「CI 绿 = 能玩」）

- Metal 渲染正确性 / 刀光效果（`FNPBCoreTests` 只覆盖 Slice/Combo/Score/Wave 纯逻辑）
- 资源加载（ContentBundle 降级路径未测）
- 输入、音频、触感（`FNPBPlatform` 需真机）
- 120Hz / ProMotion 实际帧率（`CADisplayLink.preferredFrameRateRange` 只能在真机观察）
- 出 IPA / 签名 / 侧载