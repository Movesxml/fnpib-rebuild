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
