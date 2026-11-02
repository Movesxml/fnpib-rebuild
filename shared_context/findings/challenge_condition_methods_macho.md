# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0005efb4 — 0005efb4

- 函数名: FUN_0005efb4
- 函数体: 235 字节
- 调用者数: 2 / 被调用者数: 5

```c

undefined4 FUN_0005efb4(int param_1,undefined4 param_2)

{
  char *pcVar1;
  size_t sVar2;
  undefined4 uVar3;
  int iVar4;
  int iVar5;
  
  pcVar1 = (char *)FUN_0030c660(param_2,"name");
  _strcpy((char *)(param_1 + 4),pcVar1);
  sVar2 = _strlen(pcVar1);
  uVar3 = FUN_002f69c4(pcVar1,sVar2);
  *(undefined4 *)(param_1 + 0x44) = uVar3;
  *(undefined4 *)(param_1 + 0x58) = 1;
  pcVar1 = (char *)FUN_0030c660(param_2,"result");
  if (pcVar1 != (char *)0x0) {
    sVar2 = _strlen(pcVar1);
    iVar4 = FUN_002f69c4(pcVar1,sVar2);
    if (iVar4 == DAT_005a7fe4) {
      *(undefined4 *)(param_1 + 0x58) = 2;
    }
  }
  FUN_0030c6c0(param_2,"total",param_1 + 0x48);
  pcVar1 = (char *)FUN_0030c660(param_2,"specific_type");
  if (pcVar1 == (char *)0x0) {
    uVar3 = 0;
  }
  else {
    sVar2 = _strlen(pcVar1);
    uVar3 = FUN_002f69c4(pcVar1,sVar2);
  }
  *(undefined4 *)(param_1 + 0x4c) = uVar3;
  *(undefined4 *)(param_1 + 0x50) = uVar3;
  pcVar1 = (char *)FUN_0030c660(param_2,"evaluateOnEnd");
  if (pcVar1 != (char *)0x0) {
    sVar2 = _strlen(pcVar1);
    iVar4 = FUN_002f69c4(pcVar1,sVar2);
    iVar5 = FUN_002f69c4("true",4);
    if (iVar4 == iVar5) {
      *(undefined1 *)(param_1 + 0x54) = 1;
    }
  }
  return 1;
}


```

## FUN_0005f568 — 00060514

- 函数名: FUN_00060514
- 函数体: 135 字节
- 调用者数: 2 / 被调用者数: 6

```c

void FUN_00060514(int param_1)

{
  undefined4 uVar1;
  int *piVar2;
  code *pcVar3;
  undefined1 auStack_48 [40];
  undefined1 local_20 [4];
  int local_1c;
  
  local_1c = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0x40) = 1;
  if (*(int *)(param_1 + 0x94) != 0) {
    local_20[0] = 1;
    FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 0x94) + 0x260),local_20);
    piVar2 = *(int **)(param_1 + 0x94);
    pcVar3 = *(code **)(*piVar2 + 0x40);
    FUN_0030f7cc(auStack_48,"play");
    (*pcVar3)(piVar2,auStack_48,1);
    FUN_0030f7e0(auStack_48);
  }
  uVar1 = FUN_0007505c();
  FUN_00075184(uVar1,"Music-bonus");
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_1c) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0005f56c — 00060514

- 函数名: FUN_00060514
- 函数体: 135 字节
- 调用者数: 2 / 被调用者数: 6

```c

void FUN_00060514(int param_1)

{
  undefined4 uVar1;
  int *piVar2;
  code *pcVar3;
  undefined1 auStack_48 [40];
  undefined1 local_20 [4];
  int local_1c;
  
  local_1c = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0x40) = 1;
  if (*(int *)(param_1 + 0x94) != 0) {
    local_20[0] = 1;
    FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 0x94) + 0x260),local_20);
    piVar2 = *(int **)(param_1 + 0x94);
    pcVar3 = *(code **)(*piVar2 + 0x40);
    FUN_0030f7cc(auStack_48,"play");
    (*pcVar3)(piVar2,auStack_48,1);
    FUN_0030f7e0(auStack_48);
  }
  uVar1 = FUN_0007505c();
  FUN_00075184(uVar1,"Music-bonus");
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_1c) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0005f570 — 00060514

- 函数名: FUN_00060514
- 函数体: 135 字节
- 调用者数: 2 / 被调用者数: 6

```c

void FUN_00060514(int param_1)

{
  undefined4 uVar1;
  int *piVar2;
  code *pcVar3;
  undefined1 auStack_48 [40];
  undefined1 local_20 [4];
  int local_1c;
  
  local_1c = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0x40) = 1;
  if (*(int *)(param_1 + 0x94) != 0) {
    local_20[0] = 1;
    FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 0x94) + 0x260),local_20);
    piVar2 = *(int **)(param_1 + 0x94);
    pcVar3 = *(code **)(*piVar2 + 0x40);
    FUN_0030f7cc(auStack_48,"play");
    (*pcVar3)(piVar2,auStack_48,1);
    FUN_0030f7e0(auStack_48);
  }
  uVar1 = FUN_0007505c();
  FUN_00075184(uVar1,"Music-bonus");
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_1c) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0005f574 — 00060514

- 函数名: FUN_00060514
- 函数体: 135 字节
- 调用者数: 2 / 被调用者数: 6

```c

void FUN_00060514(int param_1)

{
  undefined4 uVar1;
  int *piVar2;
  code *pcVar3;
  undefined1 auStack_48 [40];
  undefined1 local_20 [4];
  int local_1c;
  
  local_1c = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0x40) = 1;
  if (*(int *)(param_1 + 0x94) != 0) {
    local_20[0] = 1;
    FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 0x94) + 0x260),local_20);
    piVar2 = *(int **)(param_1 + 0x94);
    pcVar3 = *(code **)(*piVar2 + 0x40);
    FUN_0030f7cc(auStack_48,"play");
    (*pcVar3)(piVar2,auStack_48,1);
    FUN_0030f7e0(auStack_48);
  }
  uVar1 = FUN_0007505c();
  FUN_00075184(uVar1,"Music-bonus");
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_1c) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0005f578 — 00060514

- 函数名: FUN_00060514
- 函数体: 135 字节
- 调用者数: 2 / 被调用者数: 6

```c

void FUN_00060514(int param_1)

{
  undefined4 uVar1;
  int *piVar2;
  code *pcVar3;
  undefined1 auStack_48 [40];
  undefined1 local_20 [4];
  int local_1c;
  
  local_1c = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0x40) = 1;
  if (*(int *)(param_1 + 0x94) != 0) {
    local_20[0] = 1;
    FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 0x94) + 0x260),local_20);
    piVar2 = *(int **)(param_1 + 0x94);
    pcVar3 = *(code **)(*piVar2 + 0x40);
    FUN_0030f7cc(auStack_48,"play");
    (*pcVar3)(piVar2,auStack_48,1);
    FUN_0030f7e0(auStack_48);
  }
  uVar1 = FUN_0007505c();
  FUN_00075184(uVar1,"Music-bonus");
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_1c) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0005f57c — 00060514

- 函数名: FUN_00060514
- 函数体: 135 字节
- 调用者数: 2 / 被调用者数: 6

```c

void FUN_00060514(int param_1)

{
  undefined4 uVar1;
  int *piVar2;
  code *pcVar3;
  undefined1 auStack_48 [40];
  undefined1 local_20 [4];
  int local_1c;
  
  local_1c = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0x40) = 1;
  if (*(int *)(param_1 + 0x94) != 0) {
    local_20[0] = 1;
    FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 0x94) + 0x260),local_20);
    piVar2 = *(int **)(param_1 + 0x94);
    pcVar3 = *(code **)(*piVar2 + 0x40);
    FUN_0030f7cc(auStack_48,"play");
    (*pcVar3)(piVar2,auStack_48,1);
    FUN_0030f7e0(auStack_48);
  }
  uVar1 = FUN_0007505c();
  FUN_00075184(uVar1,"Music-bonus");
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_1c) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0005f580 — 00060514

- 函数名: FUN_00060514
- 函数体: 135 字节
- 调用者数: 2 / 被调用者数: 6

```c

void FUN_00060514(int param_1)

{
  undefined4 uVar1;
  int *piVar2;
  code *pcVar3;
  undefined1 auStack_48 [40];
  undefined1 local_20 [4];
  int local_1c;
  
  local_1c = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0x40) = 1;
  if (*(int *)(param_1 + 0x94) != 0) {
    local_20[0] = 1;
    FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 0x94) + 0x260),local_20);
    piVar2 = *(int **)(param_1 + 0x94);
    pcVar3 = *(code **)(*piVar2 + 0x40);
    FUN_0030f7cc(auStack_48,"play");
    (*pcVar3)(piVar2,auStack_48,1);
    FUN_0030f7e0(auStack_48);
  }
  uVar1 = FUN_0007505c();
  FUN_00075184(uVar1,"Music-bonus");
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_1c) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0005f588 — 00060514

- 函数名: FUN_00060514
- 函数体: 135 字节
- 调用者数: 2 / 被调用者数: 6

```c

void FUN_00060514(int param_1)

{
  undefined4 uVar1;
  int *piVar2;
  code *pcVar3;
  undefined1 auStack_48 [40];
  undefined1 local_20 [4];
  int local_1c;
  
  local_1c = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0x40) = 1;
  if (*(int *)(param_1 + 0x94) != 0) {
    local_20[0] = 1;
    FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 0x94) + 0x260),local_20);
    piVar2 = *(int **)(param_1 + 0x94);
    pcVar3 = *(code **)(*piVar2 + 0x40);
    FUN_0030f7cc(auStack_48,"play");
    (*pcVar3)(piVar2,auStack_48,1);
    FUN_0030f7e0(auStack_48);
  }
  uVar1 = FUN_0007505c();
  FUN_00075184(uVar1,"Music-bonus");
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_1c) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0005f58c — 00060514

- 函数名: FUN_00060514
- 函数体: 135 字节
- 调用者数: 2 / 被调用者数: 6

```c

void FUN_00060514(int param_1)

{
  undefined4 uVar1;
  int *piVar2;
  code *pcVar3;
  undefined1 auStack_48 [40];
  undefined1 local_20 [4];
  int local_1c;
  
  local_1c = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0x40) = 1;
  if (*(int *)(param_1 + 0x94) != 0) {
    local_20[0] = 1;
    FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 0x94) + 0x260),local_20);
    piVar2 = *(int **)(param_1 + 0x94);
    pcVar3 = *(code **)(*piVar2 + 0x40);
    FUN_0030f7cc(auStack_48,"play");
    (*pcVar3)(piVar2,auStack_48,1);
    FUN_0030f7e0(auStack_48);
  }
  uVar1 = FUN_0007505c();
  FUN_00075184(uVar1,"Music-bonus");
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_1c) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0005f590 — 00060514

- 函数名: FUN_00060514
- 函数体: 135 字节
- 调用者数: 2 / 被调用者数: 6

```c

void FUN_00060514(int param_1)

{
  undefined4 uVar1;
  int *piVar2;
  code *pcVar3;
  undefined1 auStack_48 [40];
  undefined1 local_20 [4];
  int local_1c;
  
  local_1c = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0x40) = 1;
  if (*(int *)(param_1 + 0x94) != 0) {
    local_20[0] = 1;
    FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 0x94) + 0x260),local_20);
    piVar2 = *(int **)(param_1 + 0x94);
    pcVar3 = *(code **)(*piVar2 + 0x40);
    FUN_0030f7cc(auStack_48,"play");
    (*pcVar3)(piVar2,auStack_48,1);
    FUN_0030f7e0(auStack_48);
  }
  uVar1 = FUN_0007505c();
  FUN_00075184(uVar1,"Music-bonus");
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_1c) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0005f594 — 00060514

- 函数名: FUN_00060514
- 函数体: 135 字节
- 调用者数: 2 / 被调用者数: 6

```c

void FUN_00060514(int param_1)

{
  undefined4 uVar1;
  int *piVar2;
  code *pcVar3;
  undefined1 auStack_48 [40];
  undefined1 local_20 [4];
  int local_1c;
  
  local_1c = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0x40) = 1;
  if (*(int *)(param_1 + 0x94) != 0) {
    local_20[0] = 1;
    FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 0x94) + 0x260),local_20);
    piVar2 = *(int **)(param_1 + 0x94);
    pcVar3 = *(code **)(*piVar2 + 0x40);
    FUN_0030f7cc(auStack_48,"play");
    (*pcVar3)(piVar2,auStack_48,1);
    FUN_0030f7e0(auStack_48);
  }
  uVar1 = FUN_0007505c();
  FUN_00075184(uVar1,"Music-bonus");
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_1c) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0005f598 — 00060514

- 函数名: FUN_00060514
- 函数体: 135 字节
- 调用者数: 2 / 被调用者数: 6

```c

void FUN_00060514(int param_1)

{
  undefined4 uVar1;
  int *piVar2;
  code *pcVar3;
  undefined1 auStack_48 [40];
  undefined1 local_20 [4];
  int local_1c;
  
  local_1c = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0x40) = 1;
  if (*(int *)(param_1 + 0x94) != 0) {
    local_20[0] = 1;
    FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 0x94) + 0x260),local_20);
    piVar2 = *(int **)(param_1 + 0x94);
    pcVar3 = *(code **)(*piVar2 + 0x40);
    FUN_0030f7cc(auStack_48,"play");
    (*pcVar3)(piVar2,auStack_48,1);
    FUN_0030f7e0(auStack_48);
  }
  uVar1 = FUN_0007505c();
  FUN_00075184(uVar1,"Music-bonus");
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_1c) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0005f59c — 0005f59c

- 函数名: FUN_0005f59c
- 函数体: 35 字节
- 调用者数: 0 / 被调用者数: 0

```c

bool FUN_0005f59c(int *param_1)

{
  int iVar1;
  int iVar2;
  
  iVar1 = (**(code **)(*param_1 + 0x38))(param_1);
  iVar2 = (**(code **)(*param_1 + 0x34))(param_1);
  return iVar2 <= iVar1;
}


```

## FUN_0005f5c0 — 0005f5c0

- 函数名: FUN_0005f5c0
- 函数体: 37 字节
- 调用者数: 0 / 被调用者数: 0

```c

bool FUN_0005f5c0(int *param_1)

{
  int iVar1;
  int iVar2;
  int iVar3;
  
  iVar1 = (**(code **)(*param_1 + 0x44))(param_1);
  iVar2 = 0;
  iVar3 = param_1[0x17];
  if (iVar1 == 1) {
    iVar2 = param_1[0x16];
  }
  param_1[0x17] = iVar2;
  return iVar2 != iVar3;
}


```

## FUN_0005f81c — 0005f81c

- 函数名: FUN_0005f81c
- 函数体: 11 字节
- 调用者数: 0 / 被调用者数: 0

```c

void FUN_0005f81c(int *param_1)

{
  (**(code **)(*param_1 + 0x48))();
  return;
}


```

## FUN_0005f828 — 0005f828

- 函数名: FUN_0005f828
- 函数体: 11 字节
- 调用者数: 0 / 被调用者数: 0

```c

void FUN_0005f828(int *param_1)

{
  (**(code **)(*param_1 + 0x48))();
  return;
}


```

## FUN_0005f834 — 0006082c

- 函数名: FUN_0006082c
- 函数体: 75 字节
- 调用者数: 2 / 被调用者数: 1

```c

void FUN_0006082c(void)

{
  void *pvVar1;
  int iVar2;
  int iVar3;
  uint uVar4;
  
  DAT_005f94ac = 0;
  iVar2 = DAT_005f94a4;
  if (DAT_005f94a4 != DAT_005f94a0) {
    uVar4 = 0;
    iVar2 = DAT_005f94a0;
    iVar3 = DAT_005f94a4;
    do {
      pvVar1 = *(void **)(iVar2 + uVar4 * 4);
      if (pvVar1 != (void *)0x0) {
        operator_delete(pvVar1);
        *(undefined4 *)(DAT_005f94a0 + uVar4 * 4) = 0;
        iVar2 = DAT_005f94a0;
        iVar3 = DAT_005f94a4;
      }
      uVar4 = uVar4 + 1;
    } while (uVar4 < (uint)(iVar3 - iVar2 >> 2));
  }
  DAT_005f94a4 = iVar2;
  return;
}


```

## FUN_0005f838 — 0006082c

- 函数名: FUN_0006082c
- 函数体: 75 字节
- 调用者数: 2 / 被调用者数: 1

```c

void FUN_0006082c(void)

{
  void *pvVar1;
  int iVar2;
  int iVar3;
  uint uVar4;
  
  DAT_005f94ac = 0;
  iVar2 = DAT_005f94a4;
  if (DAT_005f94a4 != DAT_005f94a0) {
    uVar4 = 0;
    iVar2 = DAT_005f94a0;
    iVar3 = DAT_005f94a4;
    do {
      pvVar1 = *(void **)(iVar2 + uVar4 * 4);
      if (pvVar1 != (void *)0x0) {
        operator_delete(pvVar1);
        *(undefined4 *)(DAT_005f94a0 + uVar4 * 4) = 0;
        iVar2 = DAT_005f94a0;
        iVar3 = DAT_005f94a4;
      }
      uVar4 = uVar4 + 1;
    } while (uVar4 < (uint)(iVar3 - iVar2 >> 2));
  }
  DAT_005f94a4 = iVar2;
  return;
}


```

## FUN_0005f83c — 0006082c

- 函数名: FUN_0006082c
- 函数体: 75 字节
- 调用者数: 2 / 被调用者数: 1

```c

void FUN_0006082c(void)

{
  void *pvVar1;
  int iVar2;
  int iVar3;
  uint uVar4;
  
  DAT_005f94ac = 0;
  iVar2 = DAT_005f94a4;
  if (DAT_005f94a4 != DAT_005f94a0) {
    uVar4 = 0;
    iVar2 = DAT_005f94a0;
    iVar3 = DAT_005f94a4;
    do {
      pvVar1 = *(void **)(iVar2 + uVar4 * 4);
      if (pvVar1 != (void *)0x0) {
        operator_delete(pvVar1);
        *(undefined4 *)(DAT_005f94a0 + uVar4 * 4) = 0;
        iVar2 = DAT_005f94a0;
        iVar3 = DAT_005f94a4;
      }
      uVar4 = uVar4 + 1;
    } while (uVar4 < (uint)(iVar3 - iVar2 >> 2));
  }
  DAT_005f94a4 = iVar2;
  return;
}


```

## FUN_0005f868 — 0005f868

- 函数名: FUN_0005f868
- 函数体: 11 字节
- 调用者数: 0 / 被调用者数: 0

```c

void FUN_0005f868(int *param_1)

{
  (**(code **)(*param_1 + 0x48))();
  return;
}


```

## FUN_0005f21c — 00060108

- 函数名: FUN_00060108
- 函数体: 1035 字节
- 调用者数: 1 / 被调用者数: 22

```c

void FUN_00060108(int param_1)

{
  undefined *puVar1;
  undefined *puVar2;
  int iVar3;
  undefined4 uVar4;
  int iVar5;
  uint uVar6;
  undefined4 uVar7;
  _Rb_tree_node_base *p_Var8;
  int iVar9;
  undefined4 uVar10;
  char *pcVar11;
  int *piVar12;
  code *pcVar13;
  undefined **local_78;
  undefined *local_74;
  undefined4 local_70 [8];
  undefined1 local_50;
  undefined1 auStack_4c [40];
  int local_24;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  piVar12 = *(int **)(param_1 + 4);
  pcVar13 = *(code **)(*piVar12 + 0x40);
  FUN_0030f7cc(auStack_4c,"animate_out");
  (*pcVar13)(piVar12,auStack_4c,1);
  FUN_0030f7e0(auStack_4c);
  FUN_0005edc8(&DAT_005f94b4);
  iVar3 = FUN_0005edbc(&DAT_005f94b4);
  if (iVar3 == 0) goto LAB_000604fe;
  iVar9 = *(int *)(param_1 + 0x68);
  iVar3 = FUN_0005edbc(&DAT_005f94b4);
  *(int *)(iVar9 + 0x80) = *(int *)(iVar9 + 0x80) + 1;
  if (iVar3 == 1) {
    *(int *)(iVar9 + 0x84) = *(int *)(iVar9 + 0x84) + 1;
  }
  iVar3 = *(int *)(param_1 + 0x68);
  uVar4 = FUN_0005edbc(&DAT_005f94b4);
  iVar9 = param_1 + 8;
  *(undefined4 *)(*(int *)(iVar3 + 0x78) + *(int *)(iVar3 + 0x90) * 8 + 4) = uVar4;
  FUN_000663a0(iVar9,&DAT_005f94b4);
  iVar3 = 0;
  if ((*(int *)(param_1 + 0x68) != 0) && (iVar3 = 0, *(int *)(*(int *)(param_1 + 0x68) + 0x98) != 0)
     ) {
    iVar3 = 1;
  }
  iVar5 = FUN_0005edbc(&DAT_005f94b4);
  if (iVar5 == 1 || iVar3 == 1) {
    if (iVar3 == 0) {
      uVar4 = FUN_00065968(iVar9);
      FUN_00066a8c(param_1 + 0x48,uVar4);
      uVar6 = FUN_000659a0(iVar9,1);
      if (99 < uVar6) {
        uVar7 = *(undefined4 *)(PTR_DAT_004d9048 + 0x5c);
        uVar4 = FUN_002f69c4("full_slice_bonus_total",0x16);
        FUN_00027588(uVar7,"full_slice_bonus_total",uVar4,1,1,1);
      }
      puVar2 = PTR_DAT_004d9048;
      iVar9 = FUN_000276e8(*(undefined4 *)(PTR_DAT_004d9048 + 0x5c),"slashes");
      iVar5 = FUN_000276e8(*(undefined4 *)(puVar2 + 0x5c),"slashesScoring");
      uVar4 = *(undefined4 *)(puVar2 + 0x5c);
      if (iVar9 == iVar5) {
        uVar7 = FUN_002f69c4("no_misses_consecutive_total",0x1b);
        FUN_00027588(uVar4,"no_misses_consecutive_total",uVar7,1,1,1);
      }
      else {
        FUN_000274bc(uVar4,"no_misses_consecutive_total",0,1,1);
      }
      uVar7 = *(undefined4 *)(puVar2 + 0x5c);
      pcVar11 = "bandito_round_score";
      uVar4 = FUN_002f69c4("bandito_round_score",0x13);
      uVar10 = *(undefined4 *)(param_1 + 0x5c);
LAB_00060430:
      FUN_00027588(uVar7,pcVar11,uVar4,uVar10,0,1);
    }
    else {
      if ((*(int *)(param_1 + 0x68) == 0) || (*(int *)(*(int *)(param_1 + 0x68) + 0x98) == 0)) {
        iVar5 = FUN_00065968(iVar9);
        iVar9 = FUN_00066afc(param_1 + 0x48);
        iVar9 = iVar9 + iVar5;
      }
      else {
        iVar9 = FUN_00066afc(param_1 + 0x48);
      }
      FUN_00066a8c(param_1 + 0x48,iVar9);
      puVar2 = PTR_DAT_004d9048;
      uVar10 = *(undefined4 *)(PTR_DAT_004d9048 + 0x5c);
      uVar4 = FUN_002f69c4("bonus_round_score",0x11);
      uVar7 = FUN_00066b48(param_1 + 0x48);
      FUN_00027588(uVar10,"bonus_round_score",uVar4,uVar7,0,1);
      if (*(int *)(param_1 + 0x4c) == 2) {
        uVar7 = *(undefined4 *)(puVar2 + 0x5c);
        pcVar11 = "bandito_1_heart_finish";
        uVar4 = FUN_002f69c4("bandito_1_heart_finish",0x16);
        uVar10 = 1;
        goto LAB_00060430;
      }
    }
    puVar2 = PTR_DAT_004d9048;
    if (*(char *)(*(int *)(param_1 + 100) + 0x59) != '\0') {
      uVar7 = *(undefined4 *)(PTR_DAT_004d9048 + 0x5c);
      uVar4 = FUN_002f69c4("challenge_hard_pass",0x13);
      FUN_00027588(uVar7,"challenge_hard_pass",uVar4,1,1,1);
      uVar7 = *(undefined4 *)(puVar2 + 0x5c);
      uVar4 = FUN_002f69c4("challenge_hard_pass_total",0x19);
      FUN_00027588(uVar7,"challenge_hard_pass_total",uVar4,1,1,1);
    }
  }
  else {
    FUN_00066b0c(param_1 + 0x48);
    puVar2 = PTR_DAT_004d9048;
    local_78 = &PTR_LAB_0052bf38;
    local_74 = PTR_FUN_004d9058;
    local_50 = 1;
    local_70[0] = 0;
    uVar4 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
    FUN_0000a23c(&local_78,local_70);
    FUN_0002bc94(uVar4,"gank",0x3f800000,0x3f800000,local_70,0);
    FUN_0000a298(local_70);
    FUN_000274bc(*(undefined4 *)(puVar2 + 0x5c),"consecutive_finales_total",0,1,1);
    FUN_000274bc(*(undefined4 *)(puVar2 + 0x5c),"no_misses_consecutive_total",0,1,1);
  }
  puVar2 = PTR_DAT_004d9048;
  iVar5 = *(int *)(PTR_DAT_004d9048 + 0x5c);
  iVar9 = FUN_0002b2a8(iVar5 + 0x154,*(int *)(param_1 + 100) + 0x40);
  *(int *)(iVar9 + 8) = *(int *)(iVar9 + 8) + 1;
  iVar9 = 0;
  for (p_Var8 = *(_Rb_tree_node_base **)(iVar5 + 0x160);
      p_Var8 != (_Rb_tree_node_base *)(iVar5 + 0x158);
      p_Var8 = (_Rb_tree_node_base *)std::_Rb_tree_increment(p_Var8)) {
    if (0 < *(int *)(p_Var8 + 0x1c)) {
      iVar9 = iVar9 + 1;
    }
  }
  FUN_000274bc(*(undefined4 *)(puVar2 + 0x5c),"different_challenges_played",iVar9,1,1);
  FUN_000606a4(param_1,iVar3);
LAB_000604fe:
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0005f5f8 — 0006059c

- 函数名: FUN_0006059c
- 函数体: 139 字节
- 调用者数: 3 / 被调用者数: 8

```c

void FUN_0006059c(int param_1)

{
  undefined4 *puVar1;
  undefined4 uVar2;
  undefined4 *puVar3;
  undefined1 local_1c [4];
  
  puVar1 = DAT_005f94f0;
  if ((undefined4 **)DAT_005f94f0 != &DAT_005f94f0) {
    do {
      puVar3 = (undefined4 *)*puVar1;
      operator_delete(puVar1);
      puVar1 = puVar3;
    } while ((undefined4 **)puVar3 != &DAT_005f94f0);
  }
  DAT_005f94f0 = &DAT_005f94f0;
  DAT_005f94f4 = &DAT_005f94f0;
  FUN_00020698(0,0);
  uVar2 = FUN_0002ede8();
  FUN_000300e0(uVar2,*(undefined4 *)(param_1 + 0x1a4));
  FUN_0001cda4(*(undefined4 *)(param_1 + 0x48),0);
  local_1c[0] = 0;
  FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 4) + 0x260),local_1c);
  FUN_000686b8(*(undefined4 *)(param_1 + 0x90));
  FUN_000209b8(0xffffffff,0xbf800000,0xffffffff);
  return;
}


```

## FUN_0005f118 — 0005f118

- 函数名: FUN_0005f118
- 函数体: 105 字节
- 调用者数: 0 / 被调用者数: 5

```c

undefined4 FUN_0005f118(int param_1,undefined4 param_2)

{
  char *pcVar1;
  size_t sVar2;
  undefined4 uVar3;
  int iVar4;
  
  FUN_0005efb4();
  pcVar1 = (char *)FUN_0030c660(param_2,"specific_type2");
  if (pcVar1 == (char *)0x0) {
    uVar3 = 0;
  }
  else {
    sVar2 = _strlen(pcVar1);
    uVar3 = FUN_002f69c4(pcVar1,sVar2);
  }
  *(undefined4 *)(param_1 + 0x60) = uVar3;
  *(undefined4 *)(param_1 + 100) = 0;
  iVar4 = FUN_0030c660(param_2,"comparison");
  if (iVar4 == 0) {
    *(undefined4 *)(param_1 + 0x60) = 0;
  }
  else {
    FUN_00039c64((undefined4 *)(param_1 + 100));
  }
  return 1;
}


```

## FUN_0005f100 — 0005f100

- 函数名: FUN_0005f100
- 函数体: 23 字节
- 调用者数: 0 / 被调用者数: 0

```c

undefined4 FUN_0005f100(int *param_1)

{
  undefined4 uVar1;
  
  uVar1 = 0;
  if ((char)param_1[0x15] != '\0') {
    uVar1 = (**(code **)(*param_1 + 0x48))();
  }
  return uVar1;
}


```

## FUN_0005f0a0 — 0005f0a0

- 函数名: FUN_0005f0a0
- 函数体: 23 字节
- 调用者数: 0 / 被调用者数: 0

```c

undefined4 FUN_0005f0a0(int *param_1)

{
  undefined4 uVar1;
  
  uVar1 = 0;
  if ((char)param_1[0x15] == '\0') {
    uVar1 = (**(code **)(*param_1 + 0x48))();
  }
  return uVar1;
}


```

## FUN_0005f60c — 0006059c

- 函数名: FUN_0006059c
- 函数体: 139 字节
- 调用者数: 3 / 被调用者数: 8

```c

void FUN_0006059c(int param_1)

{
  undefined4 *puVar1;
  undefined4 uVar2;
  undefined4 *puVar3;
  undefined1 local_1c [4];
  
  puVar1 = DAT_005f94f0;
  if ((undefined4 **)DAT_005f94f0 != &DAT_005f94f0) {
    do {
      puVar3 = (undefined4 *)*puVar1;
      operator_delete(puVar1);
      puVar1 = puVar3;
    } while ((undefined4 **)puVar3 != &DAT_005f94f0);
  }
  DAT_005f94f0 = &DAT_005f94f0;
  DAT_005f94f4 = &DAT_005f94f0;
  FUN_00020698(0,0);
  uVar2 = FUN_0002ede8();
  FUN_000300e0(uVar2,*(undefined4 *)(param_1 + 0x1a4));
  FUN_0001cda4(*(undefined4 *)(param_1 + 0x48),0);
  local_1c[0] = 0;
  FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 4) + 0x260),local_1c);
  FUN_000686b8(*(undefined4 *)(param_1 + 0x90));
  FUN_000209b8(0xffffffff,0xbf800000,0xffffffff);
  return;
}


```

## FUN_0005f0b8 — 0005f0b8

- 函数名: FUN_0005f0b8
- 函数体: 71 字节
- 调用者数: 0 / 被调用者数: 2

```c

bool FUN_0005f0b8(int param_1)

{
  undefined *puVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  
  puVar1 = PTR_DAT_004d9048;
  uVar2 = FUN_00027508(*(undefined4 *)(PTR_DAT_004d9048 + 0x5c),*(undefined4 *)(param_1 + 0x50));
  uVar3 = FUN_00027508(*(undefined4 *)(puVar1 + 0x5c),*(undefined4 *)(param_1 + 0x60));
  iVar4 = FUN_00039c74(param_1 + 100,uVar2,uVar3);
  iVar5 = 0;
  iVar6 = *(int *)(param_1 + 0x5c);
  if (iVar4 == 1) {
    iVar5 = *(int *)(param_1 + 0x58);
  }
  *(int *)(param_1 + 0x5c) = iVar5;
  return iVar5 != iVar6;
}


```

## FUN_0005f610 — 0006059c

- 函数名: FUN_0006059c
- 函数体: 139 字节
- 调用者数: 3 / 被调用者数: 8

```c

void FUN_0006059c(int param_1)

{
  undefined4 *puVar1;
  undefined4 uVar2;
  undefined4 *puVar3;
  undefined1 local_1c [4];
  
  puVar1 = DAT_005f94f0;
  if ((undefined4 **)DAT_005f94f0 != &DAT_005f94f0) {
    do {
      puVar3 = (undefined4 *)*puVar1;
      operator_delete(puVar1);
      puVar1 = puVar3;
    } while ((undefined4 **)puVar3 != &DAT_005f94f0);
  }
  DAT_005f94f0 = &DAT_005f94f0;
  DAT_005f94f4 = &DAT_005f94f0;
  FUN_00020698(0,0);
  uVar2 = FUN_0002ede8();
  FUN_000300e0(uVar2,*(undefined4 *)(param_1 + 0x1a4));
  FUN_0001cda4(*(undefined4 *)(param_1 + 0x48),0);
  local_1c[0] = 0;
  FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 4) + 0x260),local_1c);
  FUN_000686b8(*(undefined4 *)(param_1 + 0x90));
  FUN_000209b8(0xffffffff,0xbf800000,0xffffffff);
  return;
}


```

## FUN_0005f184 — 0005f184

- 函数名: FUN_0005f184
- 函数体: 71 字节
- 调用者数: 0 / 被调用者数: 2

```c

undefined4 FUN_0005f184(int param_1,undefined4 param_2)

{
  int iVar1;
  double local_18;
  
  FUN_0005efb4();
  *(undefined4 *)(param_1 + 0x60) = 0x41200000;
  iVar1 = FUN_0030c718(param_2,"time",&local_18);
  if (iVar1 == 0) {
    *(float *)(param_1 + 0x60) = (float)local_18;
  }
  return 1;
}


```

## FUN_0005f1cc — 0005f1cc

- 函数名: FUN_0005f1cc
- 函数体: 77 字节
- 调用者数: 0 / 被调用者数: 2

```c

bool FUN_0005f1cc(int param_1,undefined4 param_2)

{
  undefined4 uVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  undefined8 in_d0;
  undefined8 uVar5;
  
  uVar5 = FloatVectorSub(CONCAT44((int)((ulonglong)in_d0 >> 0x20),*(undefined4 *)(param_1 + 100)),
                         CONCAT44(param_2,param_2),2,0x20);
  *(float *)(param_1 + 100) = (float)uVar5;
  if ((float)uVar5 <= 0.0) {
    uVar1 = FUN_000065c4();
    iVar2 = FUN_00006a84(uVar1,1);
    iVar4 = 0;
    iVar3 = *(int *)(param_1 + 0x5c);
    if (iVar2 == 0) {
      iVar4 = *(int *)(param_1 + 0x58);
    }
  }
  else {
    iVar3 = *(int *)(param_1 + 0x5c);
    iVar4 = 0;
  }
  *(int *)(param_1 + 0x5c) = iVar4;
  return iVar4 != iVar3;
}


```

## FUN_0005f62c — 00060628

- 函数名: FUN_00060628
- 函数体: 121 字节
- 调用者数: 0 / 被调用者数: 6

```c

void FUN_00060628(int param_1,undefined4 param_2)

{
  undefined *puVar1;
  int iVar2;
  undefined4 uVar3;
  undefined1 auStack_44 [40];
  int local_1c;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_1c = *(int *)PTR____stack_chk_guard_004d9044;
  if (*(int *)(param_1 + 0x78) != 0) {
    FUN_000753fc(*(int *)(param_1 + 0x78),param_2);
  }
  if (*(int *)(param_1 + 0x40) == 2) {
    uVar3 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_44,"Timer");
    iVar2 = FUN_0039725c(uVar3,auStack_44);
    FUN_0030f7e0(auStack_44);
    if (iVar2 != 0) {
      FUN_0008411c(iVar2,*(undefined4 *)(param_1 + 0x44));
    }
  }
  if (*(int *)puVar1 != local_1c) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

