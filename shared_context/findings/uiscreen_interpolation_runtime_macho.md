# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_003e86e8 — 003e86e8

- 函数名: FUN_003e86e8
- 函数体: 45 字节
- 调用者数: 9 / 被调用者数: 0

```c

undefined4 FUN_003e86e8(uint param_1,undefined4 param_2)

{
  code *pcVar1;
  
  if ((param_1 < 0x27) && (pcVar1 = *(code **)(DAT_005b0074 + param_1 * 4), pcVar1 != (code *)0x0))
  {
    param_2 = (*pcVar1)(param_2);
  }
  return param_2;
}


```

