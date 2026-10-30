# REA（Reverse Engineer Anything）使用说明

仓库：`https://github.com/morluto/rea` —— 通过 MCP/CLI 让 agent 驱动 Ghidra / Hopper / IDA 做反编译。

## 本地安装状态（2026-10-30 实测，安装阶段已收官）

- ✅ **rea-agents 6.8.0 离线版**：`tools/rea/package/`，入口 `tools\rea.cmd`
- ✅ **Ghidra 12.1.4**：`D:\tools\ghidra\ghidra_12.1.4_PUBLIC`（GHIDRA_INSTALL_DIR 已 setx）
- ✅ **JDK 21**：`D:\tools\java\jdk-21.0.12.1+1`（JAVA_HOME 已 setx；REA 要求完整 JDK，JRE 不行）
- ⚠️ **REA 6.8.0 Windows 版不支持 Mach-O**（仅 PE/raw6502）→ 分析 iOS 二进制请用 Ghidra 直接管线
- ⚠️ 15MB 级大目标的完整分析超单次 300 秒工具上限 → 大目标用 `reverse/README.md` 的直接 Ghidra 分段管线（已实测：13 秒导出 150 函数伪代码）
- ⚠️ Node 24.21.0（REA 建议 ≥24.22.1，不阻塞）

## 环境变量（每次新会话都要 export，Git Bash 不继承 setx）

```bash
export TMP="D:\temp" TEMP="D:\temp"          # C 盘已满 100%，临时目录必须走 D 盘
export GHIDRA_INSTALL_DIR="D:\tools\ghidra\ghidra_12.1.4_PUBLIC"
export JAVA_HOME="D:\tools\java\jdk-21.0.12.1+1"
```

## 常用命令（装好后）

```bash
# 应用/包体检
tools\rea.cmd inspect ipa\xxx.ipa --json > shared_context\findings\rea_ipa.json

# JS/Electron 静态分析（不需要引擎）
tools\rea.cmd analyze-javascript-application <目录或.asar> --json

# 深度反编译（需引擎）
tools\rea.cmd decompile <可执行文件> --json
```

## 在本项目中的分工

- **Kimi**：决定查什么、解读 Evidence
- **DeepSeek**：按 Evidence 重建实现
- **REA**：产出带证据的反编译事实 → `shared_context/findings/`

> Phase 0 体检不依赖 REA：直接用 `python -m harness.ipa_tools inspect ipa/xxx.ipa` 即可，
> 我们自己的体检器已覆盖 plist / 架构 / 最低系统 / 加密检测。
