# ipa 目录

把待现代化的 `.ipa` 文件放在这里。

拿到 IPA 后第一件事：

```bash
python -m harness.ipa_tools inspect "ipa/你的文件.ipa"
```

会自动解压并体检：

- Info.plist（Bundle ID、可执行文件名、支持设备、图标等）
- Mach-O 架构列表（armv6 / armv7 / arm64…）
- 最低 iOS 版本要求
- 是否带 FairPlay 加密（cryptid）——App Store 下载的 IPA 是加密的，反编译前必须先解密

体检报告写入 `shared_context/findings/ipa_inventory.md`，两个模型都能读到。
