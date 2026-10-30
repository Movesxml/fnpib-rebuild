# reverse/ — 反编译工作区

## 目标文件

| 文件 | 来源 | 说明 |
|---|---|---|
| `FruitNinjaPIB.exe` | IPA 内 `assets.zip`（15.1 MB，x86 PE） | 游戏逻辑的 Windows x86 编译，**REA/Ghidra 在 Windows 上可直接反编译**（iOS Mach-O 不被 REA Windows 版支持，但 Ghidra 直接可用） |
| `libEGL.dll` | 同上 | 引擎 GLES 桥接库（已完成分析测试） |

## 已验证可用的直接 Ghidra 管线（绕过 REA 桥接，稳定性更好）

```bash
export TMP=D:\\temp TEMP=D:\\temp
export JAVA_HOME=D:\\tools\\java\\jdk-21.0.12.1+1
GHIDRA=D:\\tools\\ghidra\\ghidra_12.1.4_PUBLIC\\support\\analyzeHeadless.bat

# 第一步：导入 + 自动分析（超时 240s，部分分析也会保存）
"$GHIDRA" reverse/fnpiB FNPIB -import reverse/FruitNinjaPIB.exe -overwrite

# 第二步：导出反编译伪代码（每次调用最多 200 个函数，可重复跑加大 cap）
"$GHIDRA" reverse/fnpiB FNPIB -process FruitNinjaPIB.exe \
  -scriptPath reverse/scripts -postScript DumpDecompile.java "D:\\fnpib_update\\reverse\\decompiled" 200
```

要点：
- **C 盘已 100% 满（77 MB）是 REA 反复失败的根因**；临时目录已迁到 `D:\temp`（setx 持久化），
  每次会话仍需 `export TMP/TEMP`（Git Bash 不继承 setx 新值）
- REA 对 15 MB 大目标分析超过单次 300 秒工具上限，长分析任务用上面的分段管线
- `DumpDecompile.java` 的 cap 参数控制每轮函数数；项目库保留在 `reverse/fnpiB/` 可反复导出
