# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_000680f0 — 000680f0

- 函数名: FUN_000680f0
- 函数体: 245 字节
- 调用者数: 2 / 被调用者数: 11

```c

void FUN_000680f0(int param_1)

{
  undefined *puVar1;
  undefined4 uVar2;
  int *piVar3;
  code *pcVar4;
  undefined1 auStack_a0 [40];
  undefined1 auStack_78 [40];
  undefined1 auStack_50 [40];
  undefined1 local_28 [4];
  int local_24;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  local_28[0] = 1;
  FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 0xa8) + 0x260),local_28);
  piVar3 = *(int **)(param_1 + 0xa8);
  pcVar4 = *(code **)(*piVar3 + 0x40);
  FUN_0030f7cc(auStack_50,"animate_in");
  (*pcVar4)(piVar3,auStack_50,1);
  FUN_0030f7e0(auStack_50);
  *(undefined4 *)(param_1 + 0xb8) = 0;
  FUN_000681e8(param_1,0);
  uVar2 = FUN_003ecb20();
  FUN_0030f7cc(auStack_78,"inGameChallengeHud");
  piVar3 = (int *)FUN_003f06d0(uVar2,auStack_78);
  FUN_0030f7e0(auStack_78);
  if (piVar3 != (int *)0x0) {
    pcVar4 = *(code **)(*piVar3 + 0x40);
    FUN_0030f7cc(auStack_a0,"animate_out");
    (*pcVar4)(piVar3,auStack_a0,1);
    FUN_0030f7e0(auStack_a0);
  }
  FUN_00069dbc(param_1);
  FUN_0006c100(param_1 + 0x28);
  FUN_0006d51c(param_1 + 0x40);
  FUN_0007497c(param_1 + 0x74);
  puVar1 = PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0xac) = 1;
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00068018 — 00068018

- 函数名: FUN_00068018
- 函数体: 213 字节
- 调用者数: 1 / 被调用者数: 11

```c

void FUN_00068018(int param_1)

{
  undefined *puVar1;
  int iVar2;
  int *piVar3;
  undefined4 uVar4;
  code *pcVar5;
  undefined1 auStack_74 [40];
  undefined1 auStack_4c [40];
  undefined1 local_24 [4];
  int local_20;
  
  local_20 = *(int *)PTR____stack_chk_guard_004d9044;
  local_24[0] = 0;
  FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 0xa8) + 0x260),local_24);
  *(undefined4 *)(param_1 + 0xb8) = 0;
  FUN_00069dbc(param_1);
  FUN_0006c0e0(param_1 + 0x28);
  FUN_0006d51c(param_1 + 0x40);
  FUN_0007497c(param_1 + 0x74);
  iVar2 = FUN_0001d10c(PTR_DAT_004d9048);
  uVar4 = *(undefined4 *)(iVar2 + 4);
  FUN_0030f7cc(auStack_4c,"pause");
  piVar3 = (int *)FUN_0039725c(uVar4,auStack_4c);
  FUN_0030f7e0(auStack_4c);
  if (piVar3 != (int *)0x0) {
    pcVar5 = *(code **)(*piVar3 + 0x40);
    FUN_0030f7cc(auStack_74,"animate_out_end");
    (*pcVar5)(piVar3,auStack_74,1);
    FUN_0030f7e0(auStack_74);
  }
  FUN_00076654(param_1 + 0x9c);
  puVar1 = PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0xac) = 5;
  if (*(int *)puVar1 != local_20) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00068950 — 00068950

- 函数名: FUN_00068950
- 函数体: 69 字节
- 调用者数: 1 / 被调用者数: 6

```c

void FUN_00068950(int param_1)

{
  undefined1 local_10 [4];
  
  local_10[0] = 0;
  FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 0xa8) + 0x260),local_10);
  FUN_0006c0e0(param_1 + 0x28);
  FUN_00069dbc(param_1);
  FUN_0006d51c(param_1 + 0x40);
  FUN_0007497c(param_1 + 0x74);
  FUN_0006e200(param_1 + 0x88);
  return;
}


```

## FUN_00067e50 — 00067e50

- 函数名: FUN_00067e50
- 函数体: 13 字节
- 调用者数: 1 / 被调用者数: 1

```c

undefined4 FUN_00067e50(undefined4 param_1)

{
  FUN_00067e60();
  return param_1;
}


```

## FUN_00067f1c — 00067f1c

- 函数名: FUN_00067f1c
- 函数体: 59 字节
- 调用者数: 1 / 被调用者数: 2

```c

void FUN_00067f1c(int param_1,undefined4 param_2)

{
  undefined4 uVar1;
  
  *(undefined4 *)(param_1 + 0xb8) = 0;
  uVar1 = FUN_0001cfb0(*(undefined4 *)(PTR_DAT_004d9048 + 0x654),"inGameChallengeBackground",0);
  *(undefined4 *)(param_1 + 0xa8) = uVar1;
  FUN_000690f0(param_1,param_2);
  return;
}


```

## FUN_00067f94 — 00067f94

- 函数名: FUN_00067f94
- 函数体: 131 字节
- 调用者数: 1 / 被调用者数: 5

```c

void FUN_00067f94(int param_1)

{
  undefined *puVar1;
  int *piVar2;
  code *pcVar3;
  undefined1 auStack_4c [40];
  undefined1 local_24 [4];
  int local_20;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_20 = *(int *)PTR____stack_chk_guard_004d9044;
  local_24[0] = 1;
  FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 0xa8) + 0x260),local_24);
  piVar2 = *(int **)(param_1 + 0xa8);
  pcVar3 = *(code **)(*piVar2 + 0x40);
  FUN_0030f7cc(auStack_4c,"animate_in");
  (*pcVar3)(piVar2,auStack_4c,1);
  FUN_0030f7e0(auStack_4c);
  *(undefined4 *)(param_1 + 0xb8) = 0;
  FUN_00069a3c(param_1);
  *(undefined4 *)(param_1 + 0xac) = 0;
  if (*(int *)puVar1 != local_20) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_000686e8 — 000686e8

- 函数名: FUN_000686e8
- 函数体: 89 字节
- 调用者数: 1 / 被调用者数: 1

(反编译超时或失败)

## FUN_00068998 — 00068998

- 函数名: FUN_00068998
- 函数体: 33 字节
- 调用者数: 1 / 被调用者数: 3

```c

void FUN_00068998(int param_1,undefined4 param_2)

{
  FUN_0006af90();
  FUN_0006cc98(param_1 + 0x28,param_2);
  FUN_0006daa8(param_1 + 0x40,param_2);
  return;
}


```

## FUN_000606a4 — 000606a4

- 函数名: FUN_000606a4
- 函数体: 321 字节
- 调用者数: 1 / 被调用者数: 10

```c

void FUN_000606a4(int param_1,int param_2)

{
  int iVar1;
  int iVar2;
  undefined4 uVar3;
  int *piVar4;
  code *pcVar5;
  undefined4 local_d8;
  undefined4 local_d4;
  undefined4 local_d0;
  undefined4 local_cc;
  undefined1 auStack_c8 [40];
  undefined1 auStack_a0 [40];
  undefined1 auStack_78 [40];
  undefined1 auStack_50 [40];
  undefined1 local_28 [4];
  int local_24;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0x40) = 3;
  iVar1 = *(int *)(param_1 + 0x68);
  iVar2 = 0;
  if (iVar1 != 0) {
    iVar2 = *(int *)(iVar1 + 0x98);
  }
  if (iVar1 != 0 && iVar2 != 0) {
    uVar3 = FUN_0007505c();
    FUN_00075184(uVar3,"Music-bonus-end");
  }
  uVar3 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_50,"instructionsText");
  piVar4 = (int *)FUN_0039725c(uVar3,auStack_50);
  FUN_0030f7e0(auStack_50);
  if (piVar4 != (int *)0x0) {
    pcVar5 = *(code **)(*piVar4 + 0x40);
    FUN_0030f7cc(auStack_78,"instructions_out");
    (*pcVar5)(piVar4,auStack_78,1);
    FUN_0030f7e0(auStack_78);
  }
  uVar3 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_a0,"Timer");
  iVar2 = FUN_0039725c(uVar3,auStack_a0);
  FUN_0030f7e0(auStack_a0);
  if (iVar2 != 0) {
    local_28[0] = 0;
    FUN_0001da28(*(undefined4 *)(iVar2 + 0x260),local_28);
  }
  uVar3 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_c8,"challengeMods");
  iVar2 = FUN_0039725c(uVar3,auStack_c8);
  FUN_0030f7e0(auStack_c8);
  local_28[0] = 0;
  FUN_0001da28(*(undefined4 *)(iVar2 + 0x260),local_28);
  if (param_2 == 1) {
    local_cc = 100;
    local_d4 = *(undefined4 *)(param_1 + 0x58);
    local_d0 = FUN_00066af4(param_1 + 0x48);
    local_d8 = *(undefined4 *)(param_1 + 0x48);
    FUN_00068560(*(undefined4 *)(param_1 + 0x90),&local_d8);
  }
  else {
    FUN_000680f0(*(undefined4 *)(param_1 + 0x90));
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00060514 — 00060514

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

## FUN_0006059c — 0006059c

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

## FUN_0005ffa8 — 0005ffa8

- 函数名: FUN_0005ffa8
- 函数体: 349 字节
- 调用者数: 1 / 被调用者数: 10

```c

void FUN_0005ffa8(int param_1)

{
  bool bVar1;
  int iVar2;
  int iVar3;
  undefined4 uVar4;
  int *piVar5;
  code *pcVar6;
  undefined4 uVar7;
  undefined1 *puVar8;
  undefined1 auStack_c4 [40];
  undefined1 auStack_9c [40];
  undefined1 auStack_74 [40];
  undefined1 auStack_4c [40];
  undefined1 local_24 [4];
  int local_20;
  
  local_20 = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0x40) = 2;
  iVar2 = *(int *)(param_1 + 0x68);
  iVar3 = 0;
  if (iVar2 != 0) {
    iVar3 = *(int *)(iVar2 + 0x98);
  }
  if (iVar2 != 0 && iVar3 != 0) {
    uVar7 = *(undefined4 *)(PTR_DAT_004d9048 + 0x5c);
    uVar4 = FUN_002f69c4("consecutive_finales_total",0x19);
    FUN_00027588(uVar7,"consecutive_finales_total",uVar4,1,1,1);
  }
  if (*(int *)(PTR_DAT_004d9048 + 0x5c) != 0) {
    FUN_000277e4();
  }
  *(undefined4 *)(param_1 + 0x70) = 0;
  uVar4 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_4c,"Timer");
  piVar5 = (int *)FUN_0039725c(uVar4,auStack_4c);
  FUN_0030f7e0(auStack_4c);
  if (piVar5 != (int *)0x0) {
    bVar1 = false;
    if ((*(int *)(param_1 + 0x68) != 0) &&
       (bVar1 = false, *(int *)(*(int *)(param_1 + 0x68) + 0x98) != 0)) {
      bVar1 = true;
    }
    local_24[0] = 1;
    FUN_0001da28(piVar5[0x98],local_24);
    FUN_00396d98(piVar5,1);
    pcVar6 = *(code **)(*piVar5 + 0x40);
    if (bVar1) {
      puVar8 = auStack_74;
    }
    else {
      puVar8 = auStack_9c;
    }
    FUN_0030f7cc(puVar8,"animate_in");
    (*pcVar6)(piVar5,puVar8,1);
    FUN_0030f7e0(puVar8);
    FUN_00084394(piVar5);
  }
  if (*(int *)(param_1 + 0x9c) != 0) {
    local_24[0] = 1;
    FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 0x9c) + 0x260),local_24);
    piVar5 = *(int **)(param_1 + 0x9c);
    pcVar6 = *(code **)(*piVar5 + 0x40);
    FUN_0030f7cc(auStack_c4,"animate_in");
    (*pcVar6)(piVar5,auStack_c4,1);
    FUN_0030f7e0(auStack_c4);
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_20) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

