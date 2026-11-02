# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0005edc4 — 0005edc4

- 函数名: FUN_0005edc4
- 函数体: 1 字节
- 调用者数: 1 / 被调用者数: 0

```c

void FUN_0005edc4(void)

{
  return;
}


```

## FUN_0005ee84 — 0005ee84

- 函数名: FUN_0005ee84
- 函数体: 3 字节
- 调用者数: 3 / 被调用者数: 0

```c

undefined4 FUN_0005ee84(int param_1)

{
  return *(undefined4 *)(param_1 + 0x24);
}


```

## FUN_0005ecf4 — 0005ecf4

- 函数名: FUN_0005ecf4
- 函数体: 15 字节
- 调用者数: 1 / 被调用者数: 0

```c

void FUN_0005ecf4(int param_1)

{
  undefined4 *puVar1;
  
  for (puVar1 = *(undefined4 **)(param_1 + 0x1c); puVar1 != (undefined4 *)(param_1 + 0x1c);
      puVar1 = (undefined4 *)*puVar1) {
    if (((int *)puVar1[2])[0x16] == 1) {
      (**(code **)(*(int *)puVar1[2] + 0x30))();
    }
  }
  return;
}


```

## FUN_00066410 — 00066410

- 函数名: FUN_00066410
- 函数体: 1 字节
- 调用者数: 1 / 被调用者数: 0

```c

void FUN_00066410(void)

{
  return;
}


```

## FUN_000617f4 — 000617f4

- 函数名: FUN_000617f4
- 函数体: 30 字节
- 调用者数: 0 / 被调用者数: 0

```c

bool FUN_000617f4(int param_1)

{
  if (*(int *)(param_1 + 0x40) != 3) {
    return true;
  }
  return *(int *)(*(int *)(param_1 + 0x90) + 0xac) == 5;
}


```

## FUN_00061814 — 00061814

- 函数名: FUN_00061814
- 函数体: 28 字节
- 调用者数: 0 / 被调用者数: 0

```c

bool FUN_00061814(int param_1)

{
  if (*(int *)(param_1 + 0x90) != 0) {
    return 2 < *(int *)(*(int *)(param_1 + 0x90) + 0xac) - 3U;
  }
  return true;
}


```

