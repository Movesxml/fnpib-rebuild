# fnpib_update — 双模型 agent 集群工作区

**Kimi K3.1 Pro（规划指导）+ DeepSeek（编码执行），共享同一文件上下文，Kimi Work 作 harness。**

目标项目：把 iOS 6 时代的游戏 IPA 重建为 iOS 27 可运行，分辨率/刷新率现代化。

## 架构

```
用户 ↔ Kimi（本会话，规划/审查）
         │  shared_context/  ← 共享上下文（文件级）
         ▼
      harness/ ──调用 API──▶ DeepSeek（编码，deepseek-flash / 可切 v4-pro）
         │
      tools/REA.md ──CLI──▶ REA(npx) ──▶ Ghidra/Hopper（反编译引擎）
```

## 快速开始

```bash
# 1. 配置 key（首次）
copy .env.example .env   # 然后编辑 .env 填入 DEEPSEEK_API_KEY

# 2. 建任务卡（Kimi 做）
python -m harness.task new --title "任务标题" --desc "具体描述" --acceptance "验收标准"

# 3. 执行（DeepSeek 编码）
python -m harness.coder run --task T-001            # 产出到 progress/
python -m harness.coder run --task T-001 --apply      # 解析 ## FILE: 块并写盘
python -m harness.coder run --task T-001 --dry-run  # 只看将发送的 prompt

# 4. 自审 + 终审
python -m harness.reviewer run --task T-001

# 5. IPA 体检（拿到 ipa 后第一件事）
python -m harness.ipa_tools inspect ipa/xxx.ipa
```

## 目录

| 路径 | 说明 |
|---|---|
| `shared_context/` | 双模型共享上下文：PROJECT / PLAN / TASKS / DECISIONS / findings / progress / memory |
| `harness/` | 双模型 harness：config、DeepSeek 客户端、任务卡、coder、reviewer、IPA 体检 |
| `ipa/` | 待分析/重建的 IPA 放这里 |
| `pipeline/` | iOS 27 构建管线说明（macOS / GitHub Actions） |
| `tools/` | REA 反编译工具用法 |
| `.kimi/WORKFLOW.md` | Kimi 侧协作规程（每次迭代照此执行） |

## 模型配置

`.env` 里 `DEEPSEEK_MODEL` 默认 `deepseek-flash`（快、便宜）；复杂改造临时切 `deepseek-v4-pro`（1M 上下文、编码最强）。
旧模型名 `deepseek-chat` / `deepseek-reasoner` 已于 2026-07-24 下线，勿用。
