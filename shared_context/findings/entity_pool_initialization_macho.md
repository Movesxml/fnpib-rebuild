# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_000064a4 — 000064a4

- 函数名: FUN_000064a4
- 函数体: 149 字节
- 调用者数: 1 / 被调用者数: 3

```c

undefined4 * FUN_000064a4(undefined4 *param_1)

{
  undefined4 *puVar1;
  undefined4 *puVar2;
  undefined4 *puVar3;
  
  param_1[0x406] = 0;
  puVar3 = param_1 + 0x405;
  param_1[0x405] = 0;
  param_1[0x405] = puVar3;
  param_1[0x406] = puVar3;
  *(undefined1 *)(param_1 + 0x411) = 1;
  param_1[0x409] = 0;
  *(undefined1 *)(param_1 + 0x41a) = 1;
  param_1[0x412] = 0;
  *param_1 = 0;
  param_1[1] = 0;
  param_1[0x404] = 0;
  param_1[0x202] = 0;
  *(undefined1 *)(param_1 + 0x408) = 0;
  param_1[0x403] = 0;
  param_1[0x407] = 0;
  FUN_00006d10(param_1 + 0x409);
  FUN_00006ce0(param_1 + 0x412);
  puVar1 = (undefined4 *)param_1[0x405];
  while (puVar1 != puVar3) {
    puVar2 = (undefined4 *)*puVar1;
    operator_delete(puVar1);
    puVar1 = puVar2;
  }
  *puVar3 = puVar3;
  param_1[0x406] = puVar3;
  return param_1;
}


```

## FUN_00006cc0 — 00006cc0

- 函数名: FUN_00006cc0
- 函数体: 31 字节
- 调用者数: 1 / 被调用者数: 2

```c

void FUN_00006cc0(undefined4 param_1,undefined4 param_2,undefined4 *param_3)

{
  _List_node_base *p_Var1;
  
  p_Var1 = operator_new(0xc);
  if (p_Var1 + 8 != (_List_node_base *)0x0) {
    *(undefined4 *)(p_Var1 + 8) = *param_3;
  }
  std::_List_node_base::hook(p_Var1);
  return;
}


```

