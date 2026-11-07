# 结算/地图状态机（FUN_000686e8 / FUN_000688c8）—— 发售版 Mach-O 证据

范围：挑战结算控制器对象（+0xac 主状态、+0xb0 派发子状态、+0xb8 计时）的状态推进。
**不含** bonus 转盘（那是 FUN_0006d80c 的另一台状态机）。

## 1. FUN_000686e8 = 主状态派发

- 对象字段：`+0xac` 主状态。函数开头 `cmp r0,#0x6; bhi → 结束`，即状态 0..6 进 switch，7 直接退出。
- 跳表：`tbb [pc,r0]` @0x68726；字节表 **@0x6872A** = `04 40 5c 63 6f 7c 89`（7 项）。
- 按执行流实测，各分支体起始于：0x68732 / 0x687AA / 0x687E2 / 0x687F0 / 0x68808 / 0x68822 / 0x6883C。
  （state→分支的严格对应仍需一次运行时打点确认；本节按分支体内容描述，不强行编号。）

各分支体（反汇编见 build_logs/t081_fun_000686e8_full.txt）：

| 分支起点 | 行为 |
|---|---|
| 0x68732 | `FUN_00069ef0(r4, r1<<2)`；`if [+0x14] >= 3` 时若 `[+0xb4]==0` 调 `FUN_0001d10c(app)`+`FUN_00067f58`；`FUN_0006c0e0(+0x28)`、`FUN_0006d51c(+0x40)`；`[+0x14]==9` 时 `FUN_0002206c`；再取 app+0x68/+0x98 判空 → 非空转 0x688A4，否则 `FUN_0006e220(+0x88)` 并 **state=2**（0x687A2） |
| 0x687AA | `FUN_0006c95c(+0x28)`；`[+0x38]==4` 才继续；`FUN_00066b3c(r5+0x48)`；判空后 `FUN_00069a3c(r4)` 并 **state=0**（0x687DA） |
| 0x687E2 | `FUN_0006e550(+0x88)`；取 `[+0x94]` 与 2 比较 |
| 0x687F0 | `FUN_0006d80c(+0x40)`；`[+0x5c]==3` → `FUN_0006d51c(+0x40)`；`[+0x5c]==2` → 共同尾部 0x6887E |
| 0x68808 | `FUN_00074ac8(+0x74)`；`[+0x80]==2` → `FUN_0007497c(+0x74)`；随后 `b 0x68832` |
| 0x68822 | `FUN_00076c10(+0x9c)`；`[+0xa0]==2` → 落入 0x68832 |
| 0x6883C | 取 `[+0xa8]` 上以 0x30F7CC 构造的字符串经 `FUN_0039834C` 比较；相等则 **state=7**（0x68866）并 `FUN_00068950(r4)` |

共同尾部 0x68832：`FUN_000688c8(r4, 1)`。

## 2. FUN_000688c8 = 进入退场（关键）

```c
void FUN_000688c8(int param_1, int param_2) {
  FUN_00396d98(*(param_1+0xa8), 1);
  (*vtable[+0x40])(*(param_1+0xa8), "animate_out", 1);   // 递归播放退场
  *(param_1+0xb8) = 0;
  if (param_2 == 1) FUN_00069dbc(param_1);
  uVar2 = *(param_1+0xac);       // ← 旧状态
  *(param_1+0xac) = 6;           // ← 新状态固定 6
  *(param_1+0xb0) = uVar2;       // ← 子状态 = 旧状态，不是调用方传入的码
}
```

**结论**：`+0xb0` 的语义是「从哪个状态进入退场」，由函数自己取旧状态写入；
调用方只决定 `param_2`（1 = 额外执行 `FUN_00069dbc` 重置，0 = 不执行）。

## 3. FUN_00068950 = 状态 7 清理

`FUN_0001da28(*(*(param_1+0xa8)+0x260), ...)` → `FUN_0006c0e0(+0x28)` → `FUN_00069dbc` →
`FUN_0006d51c(+0x40)` → `FUN_0007497c(+0x74)` → `FUN_0006e200(+0x88)`。

## 4. +0xb0 的消费方：旧状态就是派发码（2026-11-08 更正）

§2 说 `FUN_000688c8` 把 `+0xb0` 写成**旧状态**，这没错；但**不能据此改 Swift 的派发码**，
因为消费方就是按 0/2/5 解释它的：

```c
// FUN_0005fd7c（挑战模式运行时）case 3 = settling，challenge_condition_concrete_macho.md:1515-1531
if (controller[0xac] == 7) {            // 结算控制器走到 7
  iVar2 = controller[0xb0];             // 退场时保存的旧状态
  if (iVar2 == 0)      FUN_00060514();  // → bonus intro
  else if (iVar2 == 5) FUN_0006059c();  // → cleanup
  else if (iVar2 == 2) { FUN_0005ffa8(); break; }  // → 下一回合 HUD
  else                 param_1[0x10] = 5;          // → 其他一律挂起
}
```

也就是说：**原版从状态 2 退场 = 下一回合，从状态 5 退场 = 清理，从状态 0 退场 = bonus**，
旧状态与派发码是同一组数值——这正是 `ChallengeSettlementSubstate` 的
`.bonus = 0 / .nextRound = 2 / .finished = 5`。

**结论：`requestNextRound(dispatchSubstate: 2)` / `requestCleanup(dispatchSubstate: 5)` 与官方一致，
不需要改写。** 唯一仍缺的是：Swift 主状态编号（1 表示结算进行中）与官方 +0xac 的 3/4/5 不同，
但这只影响 `substate` 若从 `state` 推导时的取值；当前由调用方显式给 2/5，行为正确。
若将来把主状态改成官方编号，则必须同时改成 `substate = 旧状态` 并保证旧状态落在 {0,2,5}。

## 5. `param_2`（FUN_00069dbc）

`FUN_00069dbc(obj)` 只做一件事：`if (obj[1] != 0) FUN_0001da28(obj[1]+0x260, &false)`
（build_logs/t083_settlement_reset.txt）。Swift 侧没有对应对象字段，未建模，标 [待验证]。

证据文件：build_logs/t081_fun_000686e8_full.txt、build_logs/t082_settlement_helpers.txt

## 6. 结果回调的完整副作用（t083 导出，待实现）

`FUN_0006cae0(obj, param_2)`（build_logs/t083_settlement_reset.txt:21-101）：

1. `obj+0x14 = 0`；
2. `param_2 == 0` 时调 `FUN_00020698(1,1)`；
3. 取 `resultsContainer` 组件：若其 `+0x48` 标志非 0，递归播 `animate_trigger`（:52-60）；
4. 若 `app+0x1a4 != 0` 且 `FUN_0005edbc()==1` 且 `param_2==0`，播 `"Combo"` 音效（:79-89）；
5. 收尾 `obj+0x10 = (FUN_0005edbc()==1 ? 1 : 2)`（:90-95）。

`FUN_0006cc28(obj)`（:106-148）是 intro/ins 完成回调：

- `FUN_00062a28(obj[8]) == 0` → 对 `obj[4]`（结果面板）递归播 `animate_out`，`obj+0x10 = 3`；
- 否则 `obj+0x10 = 4`。

### 与 Swift 的对照

| 原版 | Swift | 状态 |
|---|---|---|
| `FUN_0006cc28` 的 animate_out / phase 3、4 | `finishNormalResult(canAnimateResultExit:)` | 结构一致 |
| `FUN_0006cae0` 第 3 步 resultsContainer `animate_trigger` | **缺** | 待补：`updateNormalResult` 里有 resultPlayer，可补一次 `playRecursively(component: "resultsContainer", animation: "animate_trigger")`，但必须先确认该组件在动画 JSON 中存在（原版用 +0x48 标志做前置判断） |
| `FUN_0006cae0` 第 4 步 `"Combo"` 音效 | **缺** | 待补：需要 audio 服务与 `FUN_0005edbc` 的判定等价物（该判定尚未辨识） |
| `FUN_0006cae0` 第 5 步 phase 1/2 | `applyOutcome()` 的 success/failure 分支 | 语义对应，判据 `FUN_0005edbc` 待辨识 |

## 7. 两处「疑似缺失」的复核结论（2026-11-08）

### 7.1 resultsContainer 的 `animate_trigger`：官方资源里不存在，不需要补

`FUN_0006cae0` 第 3 步确实会尝试在 `resultsContainer` 上播 `animate_trigger`，但它有两层前置：
先要求 `piVar3[0x98]` 走到的最后一个子节点满足 `*(char*)(node+0x48) != 0`（t083:52-55）。

官方资源 `Content/challengeScoreAnimations.json` 中 `resultsContainer` 只有 `animate_in` / `animate_out`
两段动画，**没有 `animate_trigger`**。即：该调用在这份资源上必然被前置条件挡住或不产生任何效果。

⇒ Swift 不补这一步是正确的；盲目补上一个不存在的动画只会抛错。若要完全等价，
应当先辨识 `+0x48` 标志的语义再实现前置判断，而不是直接调用。

### 7.2 `FUN_00062a28`（结果退场抑制）的真实结构

```c
// t086_settlement_predicates.txt:30-41
if (((obj[0x68] == 0) || (_ = 1, *(obj[0x68] + 0x98) == 0)) && (_ = 0, obj[0x4c] == 3)) _ = 1;
return _;
```

即：**当且仅当 `obj+0x4c == 3` 且（`obj+0x68 == 0` 或其 `+0x98` 为 0）时返回 1**。
`FUN_0006cc28` 用 `FUN_00062a28(...) == 0` 决定是否播结果退场 `animate_out`。

Swift 侧 `canAnimateChallengeResultExit()`（App/FNPBApp.swift:916-922）只实现了「失败回合数 == 3」这一半，
**没有 `+0x68` 那一半**，且注释里写的「失败回合数」是从 `roundsPlayed - roundsPassed` 反推的，
与 `+0x4c` 的对应关系尚未证实。标 [待验证]：需要辨识 `+0x4c` 与 `+0x68` 的字段语义。

### 7.3 `FUN_0005edbc` 不是谓词

`FUN_0005edbc(obj)` 只有 3 字节：`return obj+0x2c`（t086:13-17）。
`FUN_0006cae0` 里拿它和 1 比较来决定结果相位（1=pass / 2=fail）。
⇒ `obj+0x2c` 是「本回合结果」字段，与 Swift 的 `outcome` 对应；该对应关系为 [推断]。
