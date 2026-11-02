# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0005eb3c — 0005eb3c

- 函数名: FUN_0005eb3c
- 函数体: 41 字节
- 调用者数: 0 / 被调用者数: 1

```c

void FUN_0005eb3c(int param_1)

{
  undefined4 *puVar1;
  undefined4 *puVar2;
  undefined4 *puVar3;
  
  *(undefined4 *)(param_1 + 0x24) = 0;
  *(undefined4 *)(param_1 + 0x28) = 0;
  *(undefined4 *)(param_1 + 0x2c) = 0;
  puVar1 = (undefined4 *)(param_1 + 0x1c);
  puVar2 = (void *)*puVar1;
  while (puVar2 != puVar1) {
    puVar3 = (undefined4 *)*puVar2;
    operator_delete(puVar2);
    puVar2 = puVar3;
  }
  *(undefined4 **)(param_1 + 0x1c) = puVar1;
  *(undefined4 **)(param_1 + 0x20) = puVar1;
  return;
}


```

## FUN_0005ec34 — 0005ec34

- 函数名: FUN_0005ec34
- 函数体: 71 字节
- 调用者数: 1 / 被调用者数: 1

```c

void FUN_0005ec34(int param_1,undefined4 param_2)

{
  int *piVar1;
  int iVar2;
  int *piVar3;
  int *piVar4;
  
  piVar1 = (int *)(param_1 + 0x1c);
  piVar4 = (int *)*piVar1;
  if (piVar4 != piVar1) {
    iVar2 = 0;
    piVar3 = piVar4;
    do {
      piVar3 = (int *)*piVar3;
      iVar2 = iVar2 + -1;
    } while (piVar3 != piVar1);
    if (iVar2 != 0) {
      do {
        (**(code **)(*(int *)piVar4[2] + 0x28))((int *)piVar4[2],param_2);
        piVar4 = (int *)*piVar4;
      } while (piVar4 != piVar1);
      FUN_0005ec7c(param_1,0);
    }
  }
  return;
}


```

## FUN_0005ed4c — 0005fc1c

- 函数名: FUN_0005fc1c
- 函数体: 347 字节
- 调用者数: 2 / 被调用者数: 8

```c

void FUN_0005fc1c(int param_1)

{
  longlong lVar1;
  float fVar2;
  undefined *puVar3;
  undefined *puVar4;
  int iVar5;
  uint uVar6;
  undefined4 uVar7;
  int iVar8;
  uint uVar9;
  undefined4 uVar10;
  int iVar11;
  undefined8 in_d0;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined8 uVar12;
  undefined8 uVar13;
  undefined8 uVar14;
  undefined **local_48;
  undefined *local_44;
  undefined1 local_28;
  int local_24;
  
  puVar3 = PTR____stack_chk_guard_004d9044;
  uVar7 = (undefined4)((ulonglong)in_d0 >> 0x20);
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  iVar5 = *(int *)(param_1 + 0x68);
  if (*(int *)(iVar5 + 0xa4) == 0) {
    FUN_0030a1d8();
    FUN_0030a7e4();
    local_28 = 1;
    local_48 = (undefined **)0x0;
    uVar7 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
    FUN_0000a298(&local_48);
    local_28 = 0;
    local_48 = &PTR_LAB_0052bf38;
    local_44 = PTR_FUN_004d9058;
    FUN_0002bb34(uVar7,"act-change",0x3f800000,0x3f800000,&local_48,0);
    FUN_0000a298(&local_48);
    *(undefined1 *)(param_1 + 0x8c) = 0;
    iVar5 = *(int *)(param_1 + 0x68);
    uVar7 = extraout_s1;
  }
  if (*(int *)(iVar5 + 0xac) != 0) {
    uVar7 = FUN_0002ede8();
    FUN_000300e0(uVar7,*(undefined4 *)(*(int *)(param_1 + 0x68) + 0xac));
    iVar5 = *(int *)(param_1 + 0x68);
    uVar7 = extraout_s1_00;
  }
  puVar4 = PTR_DAT_004d9050;
  fVar2 = DAT_0005fd78;
  iVar8 = *(int *)(iVar5 + 0x88);
  iVar11 = *(int *)(iVar5 + 0x8c);
  if (iVar8 != iVar11) {
    lVar1 = (ulonglong)*(uint *)PTR_DAT_004d9050 * (ulonglong)*(uint *)(PTR_DAT_004d9050 + 8);
    uVar9 = (uint)lVar1;
    uVar6 = *(int *)(PTR_DAT_004d9050 + 4) * *(uint *)(PTR_DAT_004d9050 + 8) +
            *(uint *)PTR_DAT_004d9050 * *(int *)(PTR_DAT_004d9050 + 0xc) +
            (int)((ulonglong)lVar1 >> 0x20) +
            *(int *)(PTR_DAT_004d9050 + 0x14) +
            (uint)CARRY4(uVar9,*(uint *)(PTR_DAT_004d9050 + 0x10));
    uVar10 = (undefined4)((ulonglong)uVar6 * 0x7ffff >> 0x20);
    *(uint *)PTR_DAT_004d9050 = uVar9 + *(uint *)(PTR_DAT_004d9050 + 0x10);
    *(uint *)(puVar4 + 4) = uVar6;
    iVar11 = iVar11 - iVar8;
    uVar12 = FixedToFP(CONCAT44(uVar10,uVar10),0,1,0,0x20);
    uVar14 = FixedToFP(CONCAT44(iVar11,iVar11),0,0,0,0x20);
    uVar13 = FixedToFP(CONCAT44(iVar8,iVar8),0,0,0,0x20);
    uVar12 = FloatVectorMult(uVar14,CONCAT44(uVar7,(float)uVar12 / fVar2),2,0x20);
    uVar12 = FloatVectorAdd(uVar13,uVar12,2);
    uVar12 = FPToFixed(uVar12,0,0,3,0x20);
    iVar8 = (int)uVar12;
  }
  *(int *)(iVar5 + 0x7c) = iVar8;
  *(undefined4 *)(iVar5 + 0x80) = 0;
  *(undefined4 *)(iVar5 + 0x84) = 0;
  FUN_0006ee88();
  if (*(int *)puVar3 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0005edbc — 0005edbc

- 函数名: FUN_0005edbc
- 函数体: 3 字节
- 调用者数: 12 / 被调用者数: 0

```c

undefined4 FUN_0005edbc(int param_1)

{
  return *(undefined4 *)(param_1 + 0x2c);
}


```

## FUN_0005edc8 — 0005edc8

- 函数名: FUN_0005edc8
- 函数体: 69 字节
- 调用者数: 1 / 被调用者数: 1

```c

void FUN_0005edc8(int param_1)

{
  int *piVar1;
  int *piVar2;
  
  piVar1 = (int *)(param_1 + 0x1c);
  for (piVar2 = (int *)*piVar1; piVar2 != piVar1; piVar2 = (int *)*piVar2) {
    (**(code **)(*(int *)piVar2[2] + 0x14))();
  }
  FUN_0005ec7c(param_1,1);
  if (*(int *)(param_1 + 0x2c) == 0) {
    *(undefined4 *)(param_1 + 0x2c) = 1;
    piVar2 = piVar1;
    do {
      piVar2 = (int *)*piVar2;
      if (piVar2 == piVar1) {
        return;
      }
    } while (*(int *)(piVar2[2] + 0x58) == 2);
    *(undefined4 *)(param_1 + 0x2c) = 2;
    return;
  }
  return;
}


```

## FUN_00060108 — 00060108

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

## FUN_00060628 — 00060628

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

