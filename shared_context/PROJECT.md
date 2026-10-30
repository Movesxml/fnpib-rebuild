# 项目背景：fnpib（iOS 游戏 IPA 现代化）

## 目标

将一个可运行于 **iOS 6 及以下**系统的 `.ipa` 游戏：

1. **重新构建**为可在 **iOS 27** 上运行的 `.ipa`
2. 将**运行分辨率和刷新率**更新至现代游戏标准（屏幕自适应分辨率、ProMotion 最高 120Hz）

## 手段与约束

- 必要时使用 GitHub 上的 **REA（Reverse Engineer Anything，`morluto/rea`）** 做反编译
- 双模型 agent 集群：**Kimi K3.1 Pro 规划指导 + DeepSeek 编码执行**，共享上下文即本目录
- 当前开发机为 **Windows**；iOS 构建/签名必须走 macOS（见 `pipeline/README.md`）

## 资产档案（2026-10-30 体检已确认）

| 项 | 值 |
|---|---|
| 游戏 | Fruit Ninja Puss in Boots（FNPIB），Halfbrick 出品 |
| Bundle ID / 版本 | com.halfbrick.fnpib / 1.0.4（ipa 文件名 v1.0412） |
| 构建环境 | Xcode iPhoneOS 6.1 SDK |
| 架构 | **仅 armv7 32 位**（最低 iOS 4.3），无 arm64 切片 → iOS 27 必须重建 64 位 |
| FairPlay 加密 | **未加密**（2013 年 mrYODA 破解版，cryptid=0）→ 可直接反编译 |
| 引擎 | Halfbrick 自研跨平台引擎（assets.zip 内含 FruitNinjaPIB.exe 游戏模块、libEGL/libGLESv2、.tex 贴图），非 Unity/Cocos |
| 资源 | `assets.zip` 内 790 个文件：贴图/字体/输入配置，**现代化重建可直接复用美术资源** |
| 需剔除的过期组件 | OpenFeint（已倒闭）、Millennial Media / MRAID 广告 SDK |

> 法律边界：仅限个人学习研究用途；分发现代化版本需取得 Halfbrick 授权。
