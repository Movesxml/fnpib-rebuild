# 总体规划（Kimi 维护，DeepSeek 执行）

> 阶段推进以 TASKS.md 的任务卡为准；本文件只放方向与验收思路。

## Phase 0 — 资产盘点（IPA 已就位：Fruit Ninja Puss in Boots v1.0.4）

- [x] `python -m harness.ipa_tools inspect ipa/FruitNinjaPiB-v1.0412.ipa` 体检 ✅ 报告在 `findings/ipa_inventory.md`
- [ ] 用 REA 对可执行文件做深度体检（**前置：装 Java + Ghidra**，见 tools/REA.md）
- [x] 三问判定（见 DECISIONS.md）：未加密 ✅ / 仅 armv7 ⚠️ / 自研引擎 ✅
  1. **是否加密**（cryptid=1 且非用户自持开发包 → 需要越狱设备 dump 解密版本，否则只能重写逻辑）
  2. **有无 64 位切片**（无 → arm64 重建是硬约束）
  3. **引擎与技术栈**（决定重建路径：Unity  IL2CPP/Mono 可提取托管代码；Cocos2d-x 是 C++ 可反编译；自研则按逆向重做）

## Phase 1 — 反编译理解

- 反编译目标：`reverse/FruitNinjaPIB.exe`（x86 PE，Windows 下 REA/Ghidra 直接支持）
- **优势：二进制保留 C++ RTTI 类名**（Mortar 引擎：Fruit/SlashEntity/ComboModifier/Entity/Component…）→ 类级重建
- 管线：`reverse/README.md` 的分段 analyzeHeadless（单次工具调用 300s 上限，分轮加量）
- [ ] 跑满自动分析（多轮 -process 累积，或长执行窗口）
- [ ] 按类整理：渲染循环 / 主循环 / 分辨率与帧率 / 切割判定与物理 / 计分与连击 / 存档资源加载
- Kimi 把关键路径整理成结构化笔记，供 DeepSeek 重建时引用

## Phase 2 — 重建（策略按 Phase 0 结论三选一）

| 情形 | 策略 |
|---|---|
| 有源码/可从 IPA 提取托管代码 | 迁移到现代 Xcode 工程，修 API 兼容性 |
| Cocos2d-x / C++ 自研 | 反编译核心逻辑，用现代引擎（Metal/SpriteKit/Unity）复刻行为 |
| 加密且无法解密 | 只重写：以逆向证据为规格说明，从零实现 |

## Phase 3 — 现代化

- 分辨率：按设备 Safe Area 自适应，支持 iPhone/iPad 全机型比例
- 刷新率：`CADisplayLink preferredFrameRateRange` 上限 120Hz，逻辑帧率与渲染帧率解耦
- 渲染：OpenGL ES → Metal 迁移（iOS 27 已彻底移除 GLES）
- 输入/存档/音效的现代化映射

## Phase 4 — 构建与部署

- GitHub Actions macOS runner 出未签名 IPA（见 `pipeline/README.md`）
- 用户侧签名侧载（AltStore / Sideloadly / TrollStore，按目标设备系统定）

## 风险与诚实预期

- **工作量**：旧商业游戏完整现代化通常是**数百小时级**的专家工程，agent 集群能加速但不会魔术化
- **加密**：正版 App Store IPA 的 FairPlay 加密无密钥可解，拿不到解密二进制就只能「重写」
- **法律**：仅限用户拥有合法权利改造的二进制（如自己的旧项目、已获授权）
