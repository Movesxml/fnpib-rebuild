# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0006ee88 — 0006ee88

- 函数名: FUN_0006ee88
- 函数体: 437 字节
- 调用者数: 3 / 被调用者数: 12

```c

void FUN_0006ee88(int param_1)

{
  undefined *puVar1;
  undefined4 **ppuVar2;
  ulong uVar3;
  undefined4 *puVar4;
  void *pvVar5;
  undefined4 uVar6;
  int iVar7;
  int iVar8;
  undefined4 ***pppuVar9;
  undefined4 *puVar10;
  uint uVar11;
  int iVar12;
  undefined4 ***pppuVar13;
  undefined4 local_30;
  undefined4 local_2c;
  undefined4 **local_28;
  undefined4 **local_24;
  
  if (*(void **)(param_1 + 0x78) != (void *)0x0) {
    operator_delete(*(void **)(param_1 + 0x78));
    *(undefined4 *)(param_1 + 0x78) = 0;
  }
  uVar11 = *(uint *)(param_1 + 0x7c);
  uVar3 = (ulong)((ulonglong)uVar11 * 8);
  if ((int)((ulonglong)uVar11 * 8 >> 0x20) != 0) {
    uVar3 = 0xffffffff;
  }
  puVar4 = operator_new__(uVar3);
  if (uVar11 != 0) {
    puVar10 = puVar4;
    do {
      *puVar10 = 0;
      puVar10[1] = 0;
      puVar10 = puVar10 + 2;
    } while (puVar10 != puVar4 + uVar11 * 2);
  }
  *(undefined4 **)(param_1 + 0x78) = puVar4;
  iVar7 = *(int *)(param_1 + 0x6c);
  iVar8 = *(int *)(param_1 + 0x70);
  local_28 = &local_28;
  local_24 = &local_28;
  if (iVar8 != iVar7) {
    uVar11 = 0;
    do {
      iVar12 = 0;
      if (0 < **(int **)(iVar7 + uVar11 * 4)) {
        do {
          local_2c = FUN_0006ec3c();
          FUN_0006f598(&local_28,&local_28,&local_2c);
          iVar7 = *(int *)(param_1 + 0x6c);
          iVar12 = iVar12 + 1;
        } while (iVar12 < **(int **)(iVar7 + uVar11 * 4));
        iVar8 = *(int *)(param_1 + 0x70);
      }
      uVar11 = uVar11 + 1;
    } while (uVar11 < (uint)(iVar8 - iVar7 >> 2));
  }
  FUN_0001d10c(PTR_DAT_004d9048);
  puVar1 = PTR_DAT_004d91a0;
  iVar7 = FUN_00062be4(PTR_DAT_004d91a0,*(undefined4 *)(param_1 + 0xa4));
  if (iVar7 == 1) {
    *(int *)(puVar1 + 8) = *(int *)(puVar1 + 8) + 1;
    local_30 = FUN_00062ca4(puVar1);
    FUN_0006f598(&local_28,&local_28,&local_30);
  }
  uVar11 = *(uint *)(param_1 + 0x7c);
  uVar3 = (ulong)((ulonglong)uVar11 * 4);
  if ((int)((ulonglong)uVar11 * 4 >> 0x20) != 0) {
    uVar3 = 0xffffffff;
  }
  pvVar5 = operator_new__(uVar3);
  if (0 < (int)uVar11) {
    iVar7 = 0;
    do {
      *(int *)((int)pvVar5 + iVar7 * 4) = iVar7;
      iVar7 = iVar7 + 1;
    } while (iVar7 < (int)uVar11);
  }
  FUN_00039a64(pvVar5,uVar11);
  if (0 < *(int *)(param_1 + 0x7c)) {
    iVar7 = 0;
    do {
      iVar8 = 0;
      iVar12 = *(int *)((int)pvVar5 + iVar7 * 4);
      pppuVar9 = (undefined4 ***)local_28;
      if ((undefined4 ***)local_28 == &local_28) {
LAB_0006efd8:
        uVar6 = FUN_0006ed78(param_1);
        *(undefined4 *)(*(int *)(param_1 + 0x78) + iVar12 * 8) = uVar6;
      }
      else {
        do {
          pppuVar9 = (undefined4 ***)*pppuVar9;
          iVar8 = iVar8 + -1;
        } while (pppuVar9 != &local_28);
        if (iVar8 == 0) goto LAB_0006efd8;
        *(undefined4 **)(*(int *)(param_1 + 0x78) + iVar12 * 8) = local_28[2];
        FUN_00039a28(param_1 + 0x40,
                     *(undefined4 *)(*(int *)(*(int *)(param_1 + 0x78) + iVar12 * 8) + 0x54));
        ppuVar2 = local_28;
        std::_List_node_base::unhook();
        operator_delete(ppuVar2);
      }
      iVar7 = iVar7 + 1;
    } while (iVar7 < *(int *)(param_1 + 0x7c));
  }
  pppuVar9 = (undefined4 ***)local_28;
  if (pvVar5 != (void *)0x0) {
    operator_delete__(pvVar5);
    pppuVar9 = (undefined4 ***)local_28;
  }
  while (pppuVar9 != &local_28) {
    pppuVar13 = (undefined4 ***)*pppuVar9;
    operator_delete(pppuVar9);
    pppuVar9 = pppuVar13;
  }
  return;
}


```

## FUN_0006ebdc — 0006ebdc

- 函数名: FUN_0006ebdc
- 函数体: 93 字节
- 调用者数: 2 / 被调用者数: 1

```c

void FUN_0006ebdc(int param_1)

{
  undefined *puVar1;
  int iVar2;
  uint uVar3;
  int iVar4;
  
  uVar3 = 0;
  *(undefined1 *)(param_1 + 0xc) = 0;
  puVar1 = PTR_DAT_004d9048;
  iVar2 = *(int *)(param_1 + 0x10);
  if (*(int *)(param_1 + 0x14) != iVar2) {
    do {
      iVar4 = *(int *)(iVar2 + uVar3 * 4);
      iVar2 = FUN_0002b2a8(*(int *)(puVar1 + 0x5c) + 0x154,iVar4 + 0x40);
      if ((*(char *)(iVar4 + 0x58) != '\0') && (*(int *)(iVar2 + 8) == 0)) {
        *(undefined1 *)(param_1 + 0xc) = 1;
        return;
      }
      iVar2 = *(int *)(param_1 + 0x10);
      uVar3 = uVar3 + 1;
    } while (uVar3 < (uint)(*(int *)(param_1 + 0x14) - iVar2 >> 2));
  }
  return;
}


```

## FUN_0006edbc — 0006fc88

- 函数名: FUN_0006fc88
- 函数体: 315 字节
- 调用者数: 1 / 被调用者数: 6

```c

void FUN_0006fc88(int param_1,int param_2)

{
  undefined *puVar1;
  undefined4 uVar2;
  int iVar3;
  int iVar4;
  undefined1 auStack_10c [40];
  undefined1 auStack_e4 [40];
  undefined1 auStack_bc [40];
  undefined1 auStack_94 [40];
  undefined1 auStack_6c [40];
  undefined1 auStack_44 [32];
  int local_24;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  if (param_2 != 0) {
    FUN_0030f7cc(auStack_6c,"@combo");
    uVar2 = FUN_0039725c(param_2,auStack_6c);
    *(undefined4 *)(param_1 + 0x18) = uVar2;
    FUN_0030f7e0(auStack_6c);
    if (*(int *)(param_1 + 0x18) != 0) {
      FUN_00066a00(param_1 + 4);
    }
    FUN_0030f7cc(auStack_94,"@beanPlus25");
    uVar2 = FUN_0039725c(param_2,auStack_94);
    *(undefined4 *)(param_1 + 0x20) = uVar2;
    FUN_0030f7e0(auStack_94);
    if (*(int *)(param_1 + 0x20) != 0) {
      FUN_00066a00(param_1 + 4);
    }
    FUN_0030f7cc(auStack_bc,"@beanExtraLife");
    uVar2 = FUN_0039725c(param_2,auStack_bc);
    *(undefined4 *)(param_1 + 0x1c) = uVar2;
    FUN_0030f7e0(auStack_bc);
    if (*(int *)(param_1 + 0x1c) != 0) {
      FUN_00066a00(param_1 + 4);
    }
    FUN_0030f7cc(auStack_e4,"@critical");
    uVar2 = FUN_0039725c(param_2,auStack_e4);
    *(undefined4 *)(param_1 + 0x24) = uVar2;
    FUN_0030f7e0(auStack_e4);
    if (*(int *)(param_1 + 0x24) != 0) {
      FUN_00066a00(param_1 + 4);
    }
    iVar3 = 0;
    do {
      iVar4 = iVar3 + 1;
      FUN_002f702c(auStack_44,0x20,"@cross%i",iVar4);
      FUN_0030f7cc(auStack_10c,auStack_44);
      uVar2 = FUN_0039725c(param_2,auStack_10c);
      *(undefined4 *)(param_1 + 0x28 + iVar3 * 4) = uVar2;
      FUN_0030f7e0(auStack_10c);
      iVar3 = iVar4;
    } while (iVar4 != 3);
  }
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0006ed60 — 0006ed60

- 函数名: FUN_0006ed60
- 函数体: 23 字节
- 调用者数: 4 / 被调用者数: 0

```c

int FUN_0006ed60(int param_1)

{
  if (*(int *)(param_1 + 0xb0) != 0) {
    return *(int *)(param_1 + 0xb0);
  }
  return *(int *)(*(int *)(param_1 + 0x78) + *(int *)(param_1 + 0x90) * 8);
}


```

## FUN_0006ed58 — 0006ed58

- 函数名: FUN_0006ed58
- 函数体: 7 字节
- 调用者数: 7 / 被调用者数: 0

```c

int FUN_0006ed58(int param_1,int param_2)

{
  return *(int *)(param_1 + 0x78) + param_2 * 8;
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

## FUN_000607f8 — 000607f8

- 函数名: FUN_000607f8
- 函数体: 49 字节
- 调用者数: 1 / 被调用者数: 0

```c

int FUN_000607f8(int param_1)

{
  int *piVar1;
  uint uVar2;
  
  uVar2 = 0;
  do {
    if ((uint)(DAT_005f94a4 - (int)DAT_005f94a0 >> 2) <= uVar2) {
      return *DAT_005f94a0;
    }
    piVar1 = DAT_005f94a0 + uVar2;
    uVar2 = uVar2 + 1;
  } while (*(int *)(*piVar1 + 0x40) != param_1);
  return *piVar1;
}


```

