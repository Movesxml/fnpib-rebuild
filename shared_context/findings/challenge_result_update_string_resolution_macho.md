# FUN_0006c95c 跳转表与动画字符串复核

来源：`ipa/extracted/FruitNinjaPiB-v1.0412/Payload/FruitNinjaPuss.app/FruitNinjaPuss`，发售版 ARM Mach-O。该映射段满足文件偏移 = 虚拟地址 - 0x1000。

## TBB 跳转表

`0006c996 tbb [pc,r0]` 的表地址为 `0006c99a`，原始四字节为 `02 17 29 3e`。目标按 `table + 2 * byte` 计算：

- 状态 0 → `0006c99e`
- 状态 1 → `0006c9c8`
- 状态 2 → `0006c9ec`
- 状态 3 → `0006ca16`

## 字符串地址

Thumb 的 `add r1,pc` 使用当前指令地址 + 4。逐指令重算并从 Mach-O 原始字节读取 NUL 结尾字符串：

- `0006c99e`：`0x003ac60a + (0x0006c9aa + 4) = 0x00418fb8` → `animate_in`
- `0006c9c8`：`0x003afa3b + (0x0006c9d4 + 4) = 0x0041a413` → `ins`
- `0006c9ec`：`0x003ac5bc + (0x0006c9f8 + 4) = 0x00418fb8` → `animate_in`
- `0006ca16`：`0x003ade56 + (0x0006ca22 + 4) = 0x0041a87c` → `animate_out`
- `0006ca58`：`0x003b00c6 + (0x0006ca64 + 4) = 0x0041ab2e` → `s/challengeComplete.tex`
- `0006ca90`：`0x003af973 + (0x0006ca9c + 4) = 0x0041a413` → `ins`

因此状态 0 的第二项查询是 `s/challengeComplete.tex`，不是 `s.xml`。`inGameChallengeScoreScreen.uiscreen` 不含 `ins` 或 `s/challengeComplete.tex` 动画，原版的递归播放查询对它们返回 false；不得为了让状态等待而向生成资源补写这些动画。
