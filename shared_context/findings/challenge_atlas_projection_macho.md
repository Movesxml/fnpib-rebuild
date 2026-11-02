# 挑战图标图集与投影证据

## 原始资源

- `inGameChallengeMapScreen.uiscreen` 的 normal / boss `adventureNode_*` 均引用 `textures/adventureProgress/challengeAtlas.tex`。
- 文件头为 `0a 0a 0c 00 00 04 00 04 ff ff ff ff`：format_id=12、1024×1024；负载为 524288 字节，即 4 bpp。
- 以 PVRTC4 RGBA 解码后出现完整问号、水果、星星图标；原先按 INDEX4 灰度显示的噪声 PNG 不是可交付资源。
- 正式 App 资源由 `reverse/generate_challenge_atlas_asset.py` 原样解码生成，不重绘、不重新着色、不改 UV。

## 索引与 UV

`challenge_map_controller_asm_macho.txt`：

- `0x0006a42c` 调用 `FUN_00060da0` 获取随机可见类型图标。
- `0x0006a430` 右移 3 位得到行，`0x0006a432` 与 7 得到列。
- `0x0006a448` / `0x0006a44c` 分别乘以同一个 1/8 系数并写入纹理坐标。
- `0x0006a610` / `0x0006a612` 对实际回合类型执行相同映射。

因此 1024×1024 图集每格为 128×128，索引 `i` 对应像素区域：

```text
x = (i & 7) * 128
y = (i >> 3) * 128
w = h = 128
```

## App 投影边界

App 根据 `ChallengeMapInput.isBonus` 选择 `challengeContainer.spinner` 或 `bossChallengeContainer.spinner`，读取控制器 `.setIcon` 命令写入的索引，再投影到对应地图槽位。UI 不自行抽取类型、不推断随机结果，也不以数字或 SF Symbol 代替原图标。

当前仅把原图标接入既有重建地图布局；完整 UISF 地图美术、坐标和动画视觉不属于本项已闭合范围。
