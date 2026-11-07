# 工程闭环（本机事实版）

> 这份文档记录 **在这台 Windows 机器上实际跑得通** 的命令与路径。
> 与 `pipeline/README.md`（描述理想构建管线）、`docs/CI_FIRST_BUILD.md`（描述首次编译排障）互补：
> 这里只写「今天怎么改一行代码、怎么让它上 CI」。

## 1. 本机工具链位置

| 组件 | 位置 | 备注 |
|---|---|---|
| Git | `D:\tools\git\cmd\git.exe`（MinGit 2.56.0） | **不在 PATH**，脚本内部用绝对路径；手工调用时先 `$env:PATH='D:\tools\git\cmd;'+$env:PATH` |
| Python | `C:\Users\22280\anaconda3\python.exe`（3.12） | `requests` 已装 |
| JDK | `D:\tools\java\jdk-21.0.12.1+1` | Ghidra 需要完整 JDK |
| Ghidra | `D:\tools\ghidra\ghidra_12.1.4_PUBLIC` | `support\analyzeHeadless.bat` |
| Node | `D:\Program Files\nodejs\node.exe` | 仅 REA 用 |
| 临时目录 | `D:\temp` | C 盘曾满盘导致 REA 失败，务必保持 TMP/TEMP 指向 D 盘 |

## 2. 为什么推送要走 GitHub API

本机 **直连 `github.com` 超时**，只有 `api.github.com` 可用，因此 `git push` 不可用。
推送由 `tools/github_api_push.py` 完成：读 `git ls-files` → 与远端 main 的树比对 →
只给变化的文件建 blob → 建树 → 建 commit → 更新 `refs/heads/main`。
这一步幂等：远端树就是断点，没变化会直接跳过。

**凭据**：fine-grained PAT，权限 `Contents: Read and write`（建议再加 `Actions: Read`），
存放在 `D:\temp\gh_token.txt`（**不入版本库**）。脚本也接受 `--token` 或 `DSH_GH_TOKEN_FILE`。

## 3. 一次改动的标准闭环

```powershell
$env:PATH = 'D:\tools\git\cmd;' + $env:PATH
cd D:\fnpib_update

# ① 静态自查（无编译器时的 best-effort：协议完整性 / 静态成员 / enum case）
python tools/static_check.py

# ② 本地提交（可回滚的检查点）
git add -A
git commit -m "T-0XX: 简述"

# ③ 推送（API 路径，会打印将改动的文件清单）
python tools/github_api_push.py --repo Movesxml/fnpib-rebuild --message "T-0XX: 简述"
#    先看差异不推：加 --dry-run

# ④ 等 CI（macos-15 + Xcode 26，build + 单测）
python tools/ci_status.py --repo Movesxml/fnpib-rebuild --wait <commit_sha>
python tools/ci_status.py --repo Movesxml/fnpib-rebuild -n 5

# ⑤ 确认远端内容与本地一致
python tools/verify_remote.py --repo Movesxml/fnpib-rebuild
```

CI 不通过时：`python tools/ci_status.py` 拿到 run id，用
`https://api.github.com/repos/Movesxml/fnpib-rebuild/actions/runs/<id>/logs` 取日志
（历史日志在 `build_logs/<run_id>/` 也留了一份）。

## 4. 资源产物怎么重新生成

| 产物 | 生成命令 | 依赖（不入库） |
|---|---|---|
| `Content/challengeMapStrings.json` | `python reverse/extract_string_table.py` | `assets_raw/StringTables/*.str`、`reverse/uiscreen_reports/inGameChallengeMapScreen.json` |
| `reverse/uiscreen_reports/*.json` | `python reverse/extract_uiscreen.py` | 原版 Mach-O（`ipa/extracted/`） |
| `assets_png/`、`Content/*.png` | `python tools/AssetPipeline/tex_convert.py` 等 | `assets_raw/` |

**命令必须在仓库根目录执行**：这些脚本用的是相对路径。

## 5. 本机做不了的事

- **编译/跑测试**：需要 macOS + Xcode 26，只能靠 GitHub Actions。
- **真机验证**：没有任何真机/模拟器打点记录，渲染与手感全部未经实机确认。
- **产出 .ipa**：当前 workflow 只 build + test，没有 archive/export 步骤（见 `pipeline/README.md`）。
