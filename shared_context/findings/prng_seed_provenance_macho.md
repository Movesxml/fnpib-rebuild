# PRNG 种子来源取证（FruitNinjaPuss, Mach-O）

- 程序: FruitNinjaPuss（ARMv7，6,081,392 B；__TEXT vmaddr=0x1000、fileoff=0 ⇒ 文件偏移 = VA−0x1000）
- 一句话结论: 全局流 PTR_DAT_004d9050 与权重容器的种子都取自 app 单例 **+0x1b4 的低 32 位**；该字段在**启动初始化时写入一次**，值为 libc `_time(NULL)`。

## 1. 唯一写入点（app 单例 +0x1b4）
| 项 | 证据 |
|---|---|
| 机器指令 | 0x241ce `STRD r0,r1,[r6,#0x1b4]`（e9c6 016d），位于 FUN_00023dac |
| 反编译 | build_logs/app_seed_1b4_writers.md:195-196（同函数重复导出：critical_chance_global_field_macho.md:233-234、explosion_timer_candidates_macho.md:233-234、game_fault_field_macho.md:195-196） |
| 写入值 | `uVar14 = FUN_0037e070()` |
| 种子源函数 | 0x37e070: `b580 push{r7,lr}; 2000 movs r0,#0; 466f mov r7,sp; f094 ecce blx 0x412a14; 17c1 adds r1,r0,#7; bd80 pop{r7,pc}` |
| 0x412a14 | __picsymbolstub4 第 197 项 → __la_symbol_ptr[197]=0x4da1b8 → 导入符号 **`_time`**（间接符号表 idx 2219） |
| 调用链 | FUN_00026c64（启动方法）0x26c7a `BL 0x23dac` 是 FUN_00023dac 的**唯一**调用者（二进制 BL 扫描） |

⇒ +0x1b4 = `time(NULL)` 低 32 位；同一 8 字节写使 +0x1b8 = time+7（高半）。**两套流都只读低 4 字节**。不是常量、不是 arc4random、不是第二个 PRNG。

## 2. 固定常量还是运行期状态
**运行期状态，但进程内恒定**：
- 写点只在启动函数 FUN_00023dac（同函数内创建单例、写 "Fruit Ninja PiB"、加载 particles/字符串）；
- app_seed_1b4_writers.md 中其余 10 个函数对该字段均为**读**，或操作的是别的类（见 §5）；
- 语料内无第二处 `*(app+0x1b4) = ...`，也无 `PTR_DAT_004d9048 = ...` 赋值（见 §6 未导出）。
- 粒度 1 秒 ⇒ 同一秒内启动两次，序列完全一致 [推断]，取决于 §1 的单次写。

## 3. 全局流与权重容器：同一 LCG 的两个实例
- 六字状态布局完全一致：容器 `param_1[5..10]`（challenge_weighted_container_macho.md:145-160；app_seed_1b4_writers.md:974-979）≡ 全局 `PTR_DAT_004d9050` +0/+4/+8/+0xc/+0x10/+0x14（app_seed_1b4_writers.md:1319-1324）。
- 常量一致：乘数低 0x6c078965、乘数高 0x5d588b65、增量 0x269ec3、末字 0。
- 步进公式一致：state_lo/state_hi 的 umull+mla+进位链，容器见 FUN_00039b24（challenge_weighted_container_macho.md:84-91），全局见 critical_chance_global_field_macho.md:14307-14311。
- 唯一差别是**取样映射**：容器 `state_hi * 总权重 >> 32`（FUN_00039b24:92-93），全局 `state_hi * 0x7ffff >> 32` 再除常量（critical_chance_global_field_macho.md:14313）。
⇒ **同一算法、同源（同一 +0x1b4）的两个独立实例**，不是两套算法。

## 4. 一个进程内先后创建多个权重容器
**相同种子 ⇒ 相同序列**（各自独立推进）：
- 构造函数只读种子、不回写：app_seed_1b4_writers.md:974（FUN_0003994c 全文无 0x1b4 写）；
- +0x1b4 进程内不变（§2）⇒ 每次构造拷贝到同一初始状态；
- 推进只改自身 `param_1[5..6]`（FUN_00039b24:85-91）⇒ 起点相同、推进独立；
- 二进制证据：FUN_0007220c 连续 7 次 `BL 0x3994c`（0x72230/0x7223c/0x72248/0x72254/0x72260/0x7226a/0x72274）。
- 附带：全局流在 5 处被**重置回同一 +0x1b4**（app_seed_1b4_writers.md:723/1002/1032/1076/1319）⇒ 每次模式/Pause 切换后全局流重放同一序列。

## 5. 其他 +0x1b4 命中：同偏移、不同类（已排除）
| 函数 | 访问 | 判定 |
|---|---|---|
| FUN_0000b4b8 | app_seed_1b4_writers.md:663 `*(undefined4*)(param_2+0x1b4)=0`（另写 +0x1b8/+0x1ba 字节） | 实体构造，4 字节字段 |
| FUN_00041810 | :894 `*(int**)(iVar6+0x1b4)=param_1`、+0x1b8 字节=1 | 反向链接指针 |
| FUN_0000f2f8 | :1156 读该指针并清 `iVar5+0x134` 回链（fruit_lifecycle_macho.md:62-64） | 实体回链 |
| FUN_0006cd70 | :1234 读另一对象 +0x1b4 传给 FUN_00397e70 | UI/结果对象字段 |

判定依据：以上基址是实体/UI 对象，字段为 4 字节指针/标志；app 单例的 +0x1b4 是 **8 字节 STRD 种子**。
全二进制立即数扫描：25 个函数含 `+0x1b4` 的 STR/STRD，只有 FUN_00023dac（0x241ce）落在 app 单例上。

## 6. 未导出 / 局限
- **未导出**：`PTR_DAT_004d9048` 指针变量本身的赋值点（单例 operator_new 处），语料无该全局的写。
- **未导出**：把 app+0x57 置 1 的代码（只见 FUN_000479c0 读、多处置 0）。
- 未发现第二个写 +0x1b4 的路径；如要复核，建议 Ghidra：
  1) 打开 FUN_00023dac（0x23dac–0x24281），Listing 中搜 `STRD`/imm 0x1b4（0x241ce），并回看 r6 是否来自 `ldr [0x4d9048]`；
  2) 对 PTR_DAT_004d9048 做 References → 只看写型（STR/STRD/STRB）；
  3) Search → For Scalars 0x1b4 限制在 store 助记符，再按基址寄存器回溯是否来自 0x4d9048；
  4) 对 0x37e070 做 References（共 16 处 BL），确认其唯一语义为 time()。

## 7. 复刻要点
- `seed = (uint32)time(NULL)`，启动时取一次；全局流在 5 个状态切换点重置为同一种子；容器构造时各取一次。
- 高 32 位（time+7）不参与任何随机计算。
