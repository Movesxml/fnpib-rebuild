# iOS 27 构建管线说明

> 当前机器是 **Windows**，无法本地编译/签名 iOS 应用。真正的构建必须依赖 macOS + Xcode。
> 本目录记录推荐的两条路径，进入 Phase 2 重建阶段时再启用。

## 路径 A：GitHub Actions macOS Runner（推荐，零本机依赖）

仓库推送后用 `macos-15` runner：

```yaml
# .github/workflows/build.yml 示意
jobs:
  build:
    runs-on: macos-15          # 自带 Xcode 26+
    steps:
      - uses: actions/checkout@v4
      - name: Build modernized app
        run: xcodebuild -project FnpibModern.xcodeproj -scheme FnpibModern -configuration Release -destination 'generic/platform=iOS'
      - name: Export unsigned IPA
        run: xcodebuild -exportArchive ...
```

- 产出未签名 IPA，侧载（AltStore / Sideloadly / TrollStore 视目标系统而定）
- 需要 Apple ID（免费账号 7 天签名，付费开发者 1 年）
- 注意：本机未安装 `gh` CLI，需要时先安装 GitHub CLI 并登录

## 路径 B：本地 macOS + Xcode

- 需要一台 mac（或 macOS 虚拟机，法律与稳定性风险自负）
- Xcode 26+，iOS 27 SDK
- 本项目的 Kimi/DeepSeek harness 在任何机器上都能跑，上下文目录随仓库走

## 关于重新签名的重要事实

- 如果原 IPA 是 **App Store 正版**（FairPlay 加密），没有越狱设备 dump 出的解密版本则无法反编译出有效代码，重建等于从零重写游戏逻辑
- 体检脚本（`harness/ipa_tools.py`）会自动检测 cryptid
- 现代化后的 IPA 必须用**你自己的证书**重签，原 IPA 的签名对新二进制无效
