# iOS 27 构建管线说明

> 当前机器是 **Windows**，无法本地编译/签名 iOS 应用。真正的构建必须依赖 macOS + Xcode。
> 本目录记录推荐的两条路径，进入 Phase 2 重建阶段时再启用。

## 现状（先看这个）

`.github/workflows/ios.yml` **只做**「生成工程 → Debug 模拟器编译 → 跑单测」，
**不产出 IPA**。历史上这里写的那段 `-exportArchive` 示例是照抄必失败的：

- 工程名是 `FNPIB`（`project.yml` 的 `name`），不是 `FnpibModern`；
- `-exportArchive` 缺 `-archivePath` 与 `ExportOptions.plist`，仓内也没有该文件；
- 更关键：`exportArchive` **强制走签名**，与「产出未签名 IPA」的目标直接冲突。

## 路径 A：GitHub Actions macOS Runner（推荐，零本机依赖）

未签名 IPA 的正确做法是 **archive + 手工 zip**，全程 `CODE_SIGNING_ALLOWED=NO`：

```bash
xcodegen generate --spec project.yml
xcodebuild archive \
  -project FNPIB.xcodeproj -scheme FNPIB -configuration Release \
  -destination 'generic/platform=iOS' \
  -archivePath build/FNPIB.xcarchive \
  CODE_SIGNING_ALLOWED=NO CODE_SIGNING_REQUIRED=NO CODE_SIGN_IDENTITY=""

APP=build/FNPIB.xcarchive/Products/Applications/FNPIB.app
lipo -archs "$APP/FNPIB"                 # 必须是 arm64
mkdir -p build/Payload && cp -R "$APP" build/Payload/
(cd build && zip -qry FNPIB-unsigned.ipa Payload)
```

- **必须 Release**：Debug 产物带 `FNPIB.debug.dylib` / `__preview.dylib`，重签后无法启动。
- 侧载（AltStore / Sideloadly / TrollStore）会用自己的证书重签，因此 `codesign -dv`
  报「code object is not signed at all」是**正常状态**。
- 需要 Apple ID（免费账号 7 天签名，付费开发者 1 年）。

## 路径 B：本地 macOS + Xcode

- 需要一台 mac（或 macOS 虚拟机，法律与稳定性风险自负）
- Xcode 26+，iOS 27 SDK
- 本项目的 Kimi/DeepSeek harness 在任何机器上都能跑，上下文目录随仓库走

## 关于重新签名的重要事实

- 如果原 IPA 是 **App Store 正版**（FairPlay 加密），没有越狱设备 dump 出的解密版本则无法反编译出有效代码，重建等于从零重写游戏逻辑
- 体检脚本（`harness/ipa_tools.py`）会自动检测 cryptid
- 现代化后的 IPA 必须用**你自己的证书**重签，原 IPA 的签名对新二进制无效
