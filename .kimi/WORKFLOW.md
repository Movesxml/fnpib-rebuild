# 双模型协作规程（Kimi 侧操作规程）

## 角色

- **我（Kimi K3.1 Pro）**：规划者。拆任务、写 PLAN/TASKS、审 DeepSeek 产出、维护 DECISIONS，与用户沟通。
- **DeepSeek**：编码者。由本仓库 harness 调用，读写共享上下文，产出须经我审查才交付。
- **REA**：反编译工具层（CLI：`npx -y rea-agents@latest ...`），证据落 `shared_context/findings/`。

## 每次迭代固定流程

1. 与用户确认目标 → 更新 `PLAN.md` → 建任务卡：
   `python -m harness.task new --title "..." --desc "..." --acceptance "..."`
2. 执行：`python -m harness.coder run --task T-XXX`（先不带 `--apply`）
3. 审查 `shared_context/progress/T-XXX.response.md`：
   - 正确性、iOS 27 API 兼容性、有无臆造（`[待验证]` 标记处逐一核实）
   - 不通过 → 问题写进任务 notes（`harness.task set --id T-XXX --status pending --note "问题..."`）→ 重跑
4. 通过后 `harness.task set --id T-XXX --status done`；需要落盘的代码加 `--apply` 重跑或手动编辑
5. 关键任务可自审：`python -m harness.reviewer run --task T-XXX`，我再终审
6. 重要取舍 append 到 `DECISIONS.md`（用 `harness.context.append_decision` 或手动）

## 铁律

- 未经审查的 DeepSeek 产出不直接交付用户
- API key 只存在于 `.env`，不进入对话与共享上下文
- 反编译结论必须附证据（REA Evidence / 偏移量）；无证据的推断标注 `[推测]`
- 大改造（模型切换、构建路径变更）先征得用户同意，再记入 DECISIONS
