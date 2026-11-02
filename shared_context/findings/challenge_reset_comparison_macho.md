# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0005f614 — 0005f614

- 函数名: FUN_0005f614
- 函数体: 2 字节
- 调用者数: 0 / 被调用者数: 0

```c

void FUN_0005f614(void)

{
  return;
}


```

## FUN_0005f624 — 0005f624

- 函数名: FUN_0005f624
- 函数体: 1 字节
- 调用者数: 0 / 被调用者数: 0

```c

undefined8 FUN_0005f624(undefined4 param_1,undefined1 *param_2)

{
  undefined1 *puVar1;
  undefined1 unaff_r6;
  char in_NG;
  bool in_OV;
  
  puVar1 = param_2;
  if (in_OV) {
    puVar1 = (undefined1 *)((int)param_2 * -0xfffffff);
    *param_2 = unaff_r6;
  }
  if ((bool)in_NG != in_OV) {
    software_interrupt(0x4770);
  }
  return CONCAT44(puVar1,5);
}


```

## FUN_0005f62c — 0005f62c

- 函数名: FUN_0005f62c
- 函数体: 4 字节
- 调用者数: 0 / 被调用者数: 0

```c

undefined4 FUN_0005f62c(void)

{
  return 5;
}


```

## FUN_0005f60c — 0005f60c

- 函数名: FUN_0005f60c
- 函数体: 4 字节
- 调用者数: 0 / 被调用者数: 0

```c

undefined4 FUN_0005f60c(void)

{
  return 4;
}


```

## FUN_00039bd4 — 00039bd4

- 函数名: FUN_00039bd4
- 函数体: 141 字节
- 调用者数: 1 / 被调用者数: 4

```c

int FUN_00039bd4(char *param_1)

{
  int iVar1;
  int iVar2;
  size_t sVar3;
  int iVar4;
  
  if (((DAT_005a5ef4 & 1) == 0) && (iVar2 = ___cxa_guard_acquire(&DAT_005a5ef4), iVar2 != 0)) {
    DAT_005a5ef8 = FUN_002f69c4("EQUAL",5);
    DAT_005a5efc = FUN_002f69c4("NOT_EQUAL",9);
    DAT_005a5f00 = FUN_002f69c4("GREATER",7);
    ___cxa_guard_release(&DAT_005a5ef4);
  }
  iVar2 = 3;
  if (param_1 != (char *)0x0) {
    sVar3 = _strlen(param_1);
    iVar4 = FUN_002f69c4(param_1,sVar3);
    iVar1 = 0;
    do {
      iVar2 = iVar1;
      if (2 < iVar2) {
        return 3;
      }
      iVar1 = iVar2 + 1;
    } while (iVar4 != (&DAT_005a5ef8)[iVar2]);
  }
  return iVar2;
}


```

