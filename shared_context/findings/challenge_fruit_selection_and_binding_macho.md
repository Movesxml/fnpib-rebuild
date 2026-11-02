# 挑战水果选择与 CONSECUTIVE 绑定：ARMv7 Mach-O 证据

## 1. 范围与结论

- 目标：真实 IPA 中的 ARMv7 Mach-O `FruitNinjaPuss`。
- 工程：`FNPIB-iOS` / `FruitNinjaPuss`。
- 本次仅以 `-readOnly -noanalysis` 读取既有 Ghidra 工程；未修改 Mach-O、生产代码或工程代码。
- 四个挑战水果选择函数、`FUN_0005ef64`、`FUN_0005ed54`、`FUN_0005eb6c`、`FUN_0005efb4` 的完整指令体均已导出，函数体无缺口。
- 另导出 `FUN_00061128`、`FUN_000619d0`、`FUN_0005e924`、`FUN_0005f21c`、`FUN_000617a8`，用于闭合选择、恢复、激活、求值和字段读取顺序。

## 2. 水果 ID、名称与 FruitInfo

已核实的结构：

- `DAT_005d4cd0`：FruitInfo 数量。
- `DAT_005d4cdc`：FruitInfo 基址。
- FruitInfo 步长：`0x338`。
- `FUN_0000ac08(id)`：返回 `DAT_005d4cdc + id * 0x338`。
- `FUN_0000aae0(name, 0)`：先以 `FUN_002f69c4` 规范化/哈希名称，再与各 FruitInfo 的 `+0x250` 比较，返回匹配的水果索引。

因此 **FruitInfo `+0x250` 是 32 位规范化名称哈希，不是 C 字符串指针**。以下只记录名称集合和运行时 ID 查询关系，不把水果 ID 硬编码为常量。

## 3. 四个候选构造函数

所有候选数组都在调用时重建：遍历 `id = 0 .. DAT_005d4cd0 - 1`，按条件把当前 32 位 ID 写入数组。它们不是静态常量水果表。

| 函数 / 用途 | 指令范围（末指令地址） | 收录规则 | 32 位 ID 数组 | 数量寄存器 | 尾部选择调用 |
|---|---|---|---|---|---|
| `FUN_0000af50`，默认初选 | `0x0000af50..0x0000afc2` | 除 `FUN_0000aae0("banana", 0)` 外的全部 ID，保持原索引顺序 | `DAT_00556f8c` | `r4` | `0x0000afba BL FUN_0000ac24` |
| `FUN_0000afc4`，模式 1 | `0x0000afc4..0x0000b068` | 仅 `strawberry`、`kiwifruit`、`lime` 对应 ID | `DAT_0055708c` | `r5` | `0x0000b05e BL FUN_0000ac24` |
| `FUN_0000b06c`，模式 2 | `0x0000b06c..0x0000b1a0` | 仅 `orange`、`mango`、`apple_red`、`tomato`、`apple`、`plum`、`passionfruit`、`lemon`、`peach`、`pear` 对应 ID | `DAT_0055718c` | `r4` | `0x0000b196 BL FUN_0000ac24` |
| `FUN_0000b1a4`，模式 3 | `0x0000b1a4..0x0000b248` | 仅 `banana`、`watermelon`、`pineapple` 对应 ID | `DAT_0055728c` | `r5` | `0x0000b23e BL FUN_0000ac24` |

集合依据是各函数实际字符串引用、名称到 ID 查询及相等分支；字符串原始字节另存于 `challenge_fruit_selection_data_macho.txt`。

### 公共返回语义

四个包装函数最终均把以下参数交给 `FUN_0000ac24`：

```text
r0 = 原始 param_1（调用点实际传 0）
r1 = 本次重建的 32 位水果 ID 数组
r2 = 候选数量
```

`FUN_0000ac24` 按 FruitInfo 权重与 PRNG 选择水果，结果留在 `r0`。已核实它读取 `+0x308` 权重、`+0x30c` 累计权重，部分分支还读取 `+0x310`、`+0x318`、`+0x328`，末尾存在候选数组内回退选择。

所以四个包装函数的实际返回值是 **32 位水果 ID**。Ghidra 对部分包装函数显示的 `void` 来自原型缺失，不能据此认定它们无返回值。

## 4. 模式分派与最终写回

`FUN_00061128` 从 `[[controller + 0x64] + 0x4c]` 读取挑战水果模式：

| 模式 | 调用地址 | 选择函数 | 最终写回 |
|---|---:|---|---|
| 1 | `0x0006119a` | `FUN_0000afc4` | `0x0006119e STR r0, [controller + 0x88]` |
| 2 | `0x00061186` | `FUN_0000b06c` | 同上 |
| 3 | `0x0006118e` | `FUN_0000b1a4` | 同上 |

`param_2 == 0` 时，`0x00061170` 先调用 `FUN_0000af50`，`0x00061174` 把默认初选写入 `controller + 0x88`。随后模式 1/2/3 会重新选择，并在 `0x0006119e` 覆盖为最终结果。**默认初选不能误称为最终模式选择。**

## 5. `FUN_0005ef64` 的实际绑定语义

完整指令体显示：

1. `0x0005ef74`：把 `condition + 0x5c` 清零。
2. `0x0005ef76`：读取 `condition + 0x4c`。
3. `0x0005ef7c`：读取 `DAT_005f949c`（challengeFruit 类型哈希）。
4. `0x0005ef80`：两者不等则直接返回。
5. 相等时依次执行：
   - `0x0005ef90 BL FUN_0001d10c`：取得挑战控制器；
   - `0x0005ef94 BL FUN_000617a8`：读取 `controller + 0x88` 的选中水果 ID；
   - `0x0005ef98 BL FUN_0000ac08`：取得该 ID 的 FruitInfo；
   - `0x0005ef9c`：读取 FruitInfo `+0x250`；
   - `0x0005efa0`：把该 32 位名称哈希写入 `condition + 0x50`。

写入 `condition + 0x50` 的是 **选中水果的 32 位名称哈希**，不是水果 ID、字符串地址、challengeFruit 类型哈希或 StatsRecorder 值。

## 6. 实际绑定时机：工厂早调用不是唯一调用

### 6.1 工厂与 XML 解析

`FUN_0005e924` 在条件对象初始化阶段直接调用 `FUN_0005ef64`。该调用发生在 XML 虚拟解析之前，此时 `condition + 0x4c` 通常仍为零，因此不是主要有效绑定。

`FUN_0005eb6c` 的顺序很清楚：

- `0x0005ebb2`：调用 `FUN_0005e924` 构造对象；
- `0x0005ebba..0x0005ebc2`：经对象虚表 `+0xc` 调用 XML 解析。

CONSECUTIVE 原始虚表 `0x00538880` 的对象 `vptr` 为 `0x00538888`。原始区域内容：

| 原始地址 | 值 | 含义 |
|---|---:|---|
| `0x00538890`（原始 `+0x10`，对象虚表 `+8`） | `0x0005ef65` | Thumb 指针，激活函数 `FUN_0005ef64` |
| `0x00538894`（原始 `+0x14`，对象虚表 `+0xc`） | `0x0005efb5` | Thumb 指针，XML 解析函数 `FUN_0005efb4` |

`FUN_0005efb4` 已完整核实：

- `0x0005f024..0x0005f030`：把 XML 数值解析到 `condition + 0x48`，即次数阈值；
- `0x0005f034..0x0005f05a`：取得 XML 字符串、计算哈希并写入 `condition + 0x4c`；
- `0x0005f05c`：解析结束时也把同一值暂存到 `condition + 0x50`。

### 6.2 激活时再次经虚表绑定

`FUN_0005ed54` 遍历已解析条件。对每个非空条件：

```text
0x0005ed88  LDR r0, [condition]
0x0005ed8a  LDR r1, [r0, #8]
0x0005ed8c  MOV r0, condition
0x0005ed8e  BLX r1
```

因此运行中的有效路径是：

```text
条件已解析
  → FUN_0005ed54 激活条件
  → 对象虚表 +8
  → FUN_0005ef64
  → 检查 condition+0x4c 的 challengeFruit 类型哈希
  → 以当前 controller+0x88 对应 FruitInfo+0x250 重写 condition+0x50
```

这证明原程序并非“必然不绑定”；也不能把工厂构造时的早调用误称为唯一调用。

### 6.3 新建与恢复路径均先选择、后激活

新建路径 `FUN_00061128`：

- `0x0006119e`：最终选中 ID 写入 `controller + 0x88`；
- `0x000611e2`：随后调用 `FUN_0005ed54`。

恢复路径 `FUN_000619d0`：

- `0x00061a86`：恢复 `controller + 0x88`；
- `0x00061b0a`：随后调用 `FUN_0005ed54`；
- 模式 2 和模式 1 的后续分支还分别在 `0x00061bf0`、`0x00061dd0` 再次调用 `FUN_0005ed54`。

所以无论新建还是恢复，绑定所读取的都是已经选定或恢复的当前水果 ID。

## 7. 求值语义与通配值

`FUN_0005f21c` 完整指令体确认：

- 先读取 `condition + 0x50`。
- 若它非零且不等于事件参数 `param_3`（当前水果 FruitInfo `+0x250`），在 `0x0005f22a` 直接返回 0，不改变状态。
- 若它为零或与事件哈希相等，才按 `param_2 >= [condition + 0x48]` 求值，并更新 `condition + 0x5c`。

因此 **`condition + 0x50 == 0` 是“不过滤水果”的通配语义，不是禁用条件**。`condition + 0x48` 仍是次数阈值。

## 8. 最小接线设计（建议，不是对现有代码的修改声明）

若目标工程缺少这条绑定，应只补齐与原程序相同的语义：

1. 在最终选择写入或恢复 `controller + 0x88` 之后、任何切果事件求值之前，激活已解析条件；对 `condition + 0x4c == DAT_005f949c` 的 CONSECUTIVE 条件执行 `FUN_0005ef64` 等价绑定。
2. 保留原函数的 `condition + 0x5c = 0` 激活重置行为；类型不匹配时不得写入 `condition + 0x50`。
3. 唯一应写入的水果过滤值是：

```text
condition->fruitNameHash32_at_0x50
    = FruitInfo[controller->selectedFruitId_at_0x88].nameHash32_at_0x250
```

4. 保留 `condition + 0x48` 的次数阈值及既有 CONSECUTIVE 计数/完成语义，不改写为其他统计来源。
5. 不应把水果 ID、名称字符串指针、challengeFruit 类型哈希或 StatsRecorder 值写入 `condition + 0x50`。

## 9. 同目录证据文件

- `challenge_fruit_selection_asm_macho.txt`：四个选择函数及绑定、激活、工厂解析相关函数的完整指令体。
- `challenge_fruit_call_order_asm_macho.txt`：新建、恢复、工厂、求值和 `controller + 0x88` 读取函数的完整指令体。
- `challenge_fruit_selection_data_macho.txt`：相关虚表原始字节与水果名称字符串原始字节。
- `challenge_condition_vtables_data_macho.txt`：相邻条件对象虚表的交叉核验数据。
