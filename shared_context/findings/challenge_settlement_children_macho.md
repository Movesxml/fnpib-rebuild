# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0006bd40 — 0006bd40

- 函数名: FUN_0006bd40
- 函数体: 23 字节
- 调用者数: 1 / 被调用者数: 0

```c

void FUN_0006bd40(undefined4 *param_1)

{
  param_1[5] = 0;
  *param_1 = &DAT_00538c4c;
  param_1[1] = 0;
  return;
}


```

## FUN_0006c95c — 0006c95c

- 函数名: FUN_0006c95c
- 函数体: 85 字节
- 调用者数: 0 / 被调用者数: 1

(反编译超时或失败)

## FUN_0006c100 — 0006c100

- 函数名: FUN_0006c100
- 函数体: 435 字节
- 调用者数: 1 / 被调用者数: 9

```c

void FUN_0006c100(int param_1)

{
  undefined *puVar1;
  int iVar2;
  undefined4 uVar3;
  int *piVar4;
  code *pcVar5;
  undefined1 auStack_140 [40];
  undefined1 auStack_118 [40];
  undefined1 auStack_f0 [40];
  undefined1 auStack_c8 [40];
  undefined1 auStack_a0 [40];
  undefined1 auStack_78 [40];
  undefined1 auStack_50 [40];
  undefined1 local_28 [4];
  int local_24;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0x14) = 0;
  local_28[0] = 1;
  FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 4) + 0x260),local_28);
  FUN_00396d98(*(undefined4 *)(param_1 + 4),1);
  uVar3 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_50,"instructionsContainer");
  iVar2 = FUN_0039725c(uVar3,auStack_50);
  FUN_0030f7e0(auStack_50);
  local_28[0] = 0;
  FUN_0001da28(*(undefined4 *)(iVar2 + 0x260),local_28);
  uVar3 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_78,"scoreContainer");
  iVar2 = FUN_0039725c(uVar3,auStack_78);
  FUN_0030f7e0(auStack_78);
  local_28[0] = 1;
  FUN_0001da28(*(undefined4 *)(iVar2 + 0x260),local_28);
  uVar3 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_a0,"resultsContainer");
  iVar2 = FUN_0039725c(uVar3,auStack_a0);
  FUN_0030f7e0(auStack_a0);
  local_28[0] = 1;
  FUN_0001da28(*(undefined4 *)(iVar2 + 0x260),local_28);
  uVar3 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_c8,"resultsContainer.BonusList");
  iVar2 = FUN_0039725c(uVar3,auStack_c8);
  FUN_0030f7e0(auStack_c8);
  local_28[0] = 1;
  FUN_0001da28(*(undefined4 *)(iVar2 + 0x260),local_28);
  uVar3 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_f0,"@totalScore");
  iVar2 = FUN_0039725c(uVar3,auStack_f0);
  FUN_0030f7e0(auStack_f0);
  if (iVar2 != 0) {
    FUN_0007d9e8(iVar2);
    FUN_0007d850(iVar2);
  }
  uVar3 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_118,"@scoreCounterTotal");
  iVar2 = FUN_0039725c(uVar3,auStack_118);
  FUN_0030f7e0(auStack_118);
  if (iVar2 != 0) {
    FUN_0007d9e8(iVar2);
  }
  FUN_0006c2b4(param_1);
  piVar4 = *(int **)(param_1 + 4);
  pcVar5 = *(code **)(*piVar4 + 0x40);
  FUN_0030f7cc(auStack_140,"animate_in");
  (*pcVar5)(piVar4,auStack_140,1);
  FUN_0030f7e0(auStack_140);
  puVar1 = PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0x10) = 0;
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0006c0e0 — 0006c0e0

- 函数名: FUN_0006c0e0
- 函数体: 29 字节
- 调用者数: 6 / 被调用者数: 1

```c

void FUN_0006c0e0(int param_1)

{
  undefined1 local_c [4];
  
  if (*(int *)(param_1 + 4) != 0) {
    local_c[0] = 0;
    FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 4) + 0x260),local_c);
  }
  return;
}


```

## FUN_0006d318 — 0006d318

- 函数名: FUN_0006d318
- 函数体: 27 字节
- 调用者数: 1 / 被调用者数: 0

```c

void FUN_0006d318(undefined4 *param_1)

{
  *param_1 = &DAT_00538c68;
  param_1[1] = 0;
  param_1[8] = 0;
  param_1[9] = 0;
  param_1[10] = 0;
  param_1[0xb] = 0;
  return;
}


```

## FUN_0006d80c — 0006d80c

- 函数名: FUN_0006d80c
- 函数体: 661 字节
- 调用者数: 0 / 被调用者数: 9

(反编译超时或失败)

## FUN_0006d53c — 0006d53c

- 函数名: FUN_0006d53c
- 函数体: 137 字节
- 调用者数: 1 / 被调用者数: 5

```c

void FUN_0006d53c(int param_1,undefined4 *param_2)

{
  undefined *puVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  int *piVar5;
  code *pcVar6;
  undefined1 auStack_4c [40];
  undefined1 local_24 [4];
  int local_20;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_20 = *(int *)PTR____stack_chk_guard_004d9044;
  local_24[0] = 1;
  FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 4) + 0x260),local_24);
  uVar2 = param_2[1];
  uVar3 = param_2[2];
  uVar4 = param_2[3];
  *(undefined4 *)(param_1 + 0xc) = *param_2;
  *(undefined4 *)(param_1 + 0x10) = uVar2;
  *(undefined4 *)(param_1 + 0x14) = uVar3;
  *(undefined4 *)(param_1 + 0x18) = uVar4;
  FUN_0006d5c8(param_1);
  piVar5 = *(int **)(param_1 + 4);
  pcVar6 = *(code **)(*piVar5 + 0x40);
  FUN_0030f7cc(auStack_4c,"animate_in");
  (*pcVar6)(piVar5,auStack_4c,1);
  FUN_0030f7e0(auStack_4c);
  *(undefined4 *)(param_1 + 0x1c) = 0;
  *(undefined4 *)(param_1 + 0x20) = 0;
  if (*(int *)puVar1 != local_20) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0006d51c — 0006d51c

- 函数名: FUN_0006d51c
- 函数体: 29 字节
- 调用者数: 5 / 被调用者数: 1

```c

void FUN_0006d51c(int param_1)

{
  undefined1 local_c [4];
  
  if (*(int *)(param_1 + 4) != 0) {
    local_c[0] = 0;
    FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 4) + 0x260),local_c);
  }
  return;
}


```

## FUN_0006e004 — 0006e004

- 函数名: FUN_0006e004
- 函数体: 23 字节
- 调用者数: 1 / 被调用者数: 0

```c

void FUN_0006e004(undefined4 *param_1)

{
  param_1[4] = 0;
  *param_1 = &DAT_00538c78;
  param_1[1] = 0;
  return;
}


```

## FUN_0006e550 — 0006e550

- 函数名: FUN_0006e550
- 函数体: 213 字节
- 调用者数: 0 / 被调用者数: 4

(反编译超时或失败)

## FUN_0006e220 — 0006e220

- 函数名: FUN_0006e220
- 函数体: 49 字节
- 调用者数: 1 / 被调用者数: 3

```c

void FUN_0006e220(int param_1)

{
  undefined1 local_14 [4];
  
  *(undefined4 *)(param_1 + 0x10) = 0;
  local_14[0] = 1;
  FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 4) + 0x260),local_14);
  FUN_00396d98(*(undefined4 *)(param_1 + 4),1);
  FUN_0006e254(param_1);
  *(undefined4 *)(param_1 + 0xc) = 0;
  return;
}


```

## FUN_0006e200 — 0006e200

- 函数名: FUN_0006e200
- 函数体: 29 字节
- 调用者数: 1 / 被调用者数: 1

```c

void FUN_0006e200(int param_1)

{
  undefined1 local_c [4];
  
  if (*(int *)(param_1 + 4) != 0) {
    local_c[0] = 0;
    FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 4) + 0x260),local_c);
  }
  return;
}


```

## FUN_0007661c — 0007661c

- 函数名: FUN_0007661c
- 函数体: 23 字节
- 调用者数: 1 / 被调用者数: 0

```c

void FUN_0007661c(undefined4 *param_1)

{
  *param_1 = &DAT_00538dc8;
  param_1[1] = 0;
  param_1[2] = 0;
  return;
}


```

## FUN_00076c10 — 00076c10

- 函数名: FUN_00076c10
- 函数体: 147 字节
- 调用者数: 0 / 被调用者数: 4

```c

void FUN_00076c10(int param_1)

{
  undefined *puVar1;
  int iVar2;
  undefined4 uVar3;
  undefined1 auStack_6c [40];
  undefined1 auStack_44 [40];
  int local_1c;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_1c = *(int *)PTR____stack_chk_guard_004d9044;
  if (*(int *)(param_1 + 4) == 1) {
    uVar3 = *(undefined4 *)(param_1 + 8);
    FUN_0030f7cc(auStack_44,"animate_out");
    iVar2 = FUN_0039834c(uVar3,auStack_44,1);
    FUN_0030f7e0(auStack_44);
    if ((iVar2 == 0) && (iVar2 = *(int *)(param_1 + 8), iVar2 != 0)) {
      FUN_0030f7cc(auStack_6c,"animate_out");
      iVar2 = FUN_0039834c(iVar2,auStack_6c,1);
      FUN_0030f7e0(auStack_6c);
      if (iVar2 == 0) {
        *(undefined4 *)(param_1 + 4) = 2;
      }
    }
  }
  if (*(int *)puVar1 != local_1c) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00076654 — 00076654

- 函数名: FUN_00076654
- 函数体: 1149 字节
- 调用者数: 1 / 被调用者数: 15

```c

void FUN_00076654(int param_1)

{
  undefined *puVar1;
  int iVar2;
  _List_node_base *p_Var3;
  int iVar4;
  undefined4 *puVar5;
  undefined4 uVar6;
  int *piVar7;
  undefined4 *puVar8;
  code *pcVar9;
  undefined *local_1a8;
  int local_1a4;
  undefined1 *local_1a0;
  undefined4 local_19c;
  undefined1 local_188;
  undefined1 auStack_184 [40];
  undefined *local_15c;
  int local_158;
  undefined1 *local_154;
  undefined4 local_150;
  undefined1 local_13c;
  undefined1 auStack_138 [40];
  undefined *local_110;
  int local_10c;
  undefined1 *local_108;
  undefined4 local_104;
  undefined1 local_f0;
  undefined1 auStack_ec [40];
  undefined *local_c4;
  int local_c0;
  undefined1 *local_bc;
  undefined4 local_b8;
  undefined1 local_a4;
  undefined1 auStack_a0 [40];
  undefined1 auStack_78 [40];
  undefined4 local_50 [8];
  undefined1 local_30;
  undefined4 local_2c;
  undefined4 local_28;
  int local_24;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  local_50[0] = CONCAT31(local_50[0]._1_3_,1);
  FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 8) + 0x260),local_50);
  piVar7 = *(int **)(param_1 + 8);
  pcVar9 = *(code **)(*piVar7 + 0x40);
  FUN_0030f7cc(auStack_78,"animate_in");
  (*pcVar9)(piVar7,auStack_78,1);
  FUN_0030f7e0(auStack_78);
  uVar6 = *(undefined4 *)(param_1 + 8);
  FUN_0030f7cc(auStack_a0,"back");
  iVar2 = FUN_0039725c(uVar6,auStack_a0);
  FUN_0030f7e0(auStack_a0);
  if (iVar2 != 0) {
    puVar8 = (undefined4 *)(iVar2 + 0xb34);
    if (*(int *)(iVar2 + 0xb3c) == 0) {
      FUN_00022608(puVar8);
      *puVar8 = puVar8;
      *(undefined4 **)(iVar2 + 0xb38) = puVar8;
    }
    else {
      puVar5 = (undefined4 *)*puVar8;
      if (puVar5 != puVar8) {
        puVar5[0xb] = *(int *)(iVar2 + 0xb3c);
        puVar5[0xc] = 2;
        *(int *)(iVar2 + 0xb40) = *(int *)(iVar2 + 0xb40) + 1;
        for (puVar5 = (undefined4 *)*puVar5; puVar5 != puVar8; puVar5 = (undefined4 *)*puVar5) {
          puVar5[0xb] = *(undefined4 *)(iVar2 + 0xb3c);
          puVar5[0xc] = 2;
          *(int *)(iVar2 + 0xb40) = *(int *)(iVar2 + 0xb40) + 1;
        }
      }
    }
    local_a4 = 1;
    local_c4 = (undefined *)0x0;
    FUN_00022510(&local_c4);
    local_a4 = 0;
    local_c4 = &DAT_0052ce38;
    local_b8 = 0;
    local_bc = &FUN_00076ad4_1;
    local_30 = 1;
    local_50[0] = 0;
    local_c0 = param_1;
    (*(code *)PTR_FUN_0052ce40)(&local_c4,local_50);
    local_2c = 0;
    local_28 = 0;
    p_Var3 = (_List_node_base *)FUN_0002256c(puVar8,local_50);
    std::_List_node_base::hook(p_Var3);
    FUN_00022510(local_50);
    if (*(int *)(iVar2 + 0xb3c) != 0) {
      iVar4 = *(int *)(iVar2 + 0xb38);
      *(int *)(iVar4 + 0x2c) = *(int *)(iVar2 + 0xb3c);
      *(undefined4 *)(iVar4 + 0x30) = 1;
      *(int *)(iVar2 + 0xb40) = *(int *)(iVar2 + 0xb40) + 1;
    }
    FUN_00022510(&local_c4);
  }
  if (*(int *)(PTR_DAT_004d9048 + 4) == 2) {
    uVar6 = *(undefined4 *)(param_1 + 8);
    FUN_0030f7cc(auStack_138,"@buy");
    iVar2 = FUN_0039725c(uVar6,auStack_138);
    FUN_0030f7e0(auStack_138);
    if (iVar2 != 0) {
      puVar8 = (undefined4 *)(iVar2 + 0xb34);
      if (*(int *)(iVar2 + 0xb3c) == 0) {
        FUN_00022608(puVar8);
        *puVar8 = puVar8;
        *(undefined4 **)(iVar2 + 0xb38) = puVar8;
      }
      else {
        puVar5 = (undefined4 *)*puVar8;
        if (puVar5 != puVar8) {
          puVar5[0xb] = *(int *)(iVar2 + 0xb3c);
          puVar5[0xc] = 2;
          *(int *)(iVar2 + 0xb40) = *(int *)(iVar2 + 0xb40) + 1;
          for (puVar5 = (undefined4 *)*puVar5; puVar5 != puVar8; puVar5 = (undefined4 *)*puVar5) {
            puVar5[0xb] = *(undefined4 *)(iVar2 + 0xb3c);
            puVar5[0xc] = 2;
            *(int *)(iVar2 + 0xb40) = *(int *)(iVar2 + 0xb40) + 1;
          }
        }
      }
      local_13c = 1;
      local_15c = (undefined *)0x0;
      FUN_00022510(&local_15c);
      local_13c = 0;
      local_15c = &DAT_0052ce38;
      local_150 = 0;
      local_154 = &LAB_00076b5c_1;
      local_30 = 1;
      local_50[0] = 0;
      local_158 = param_1;
      (*(code *)PTR_FUN_0052ce40)(&local_15c,local_50);
      local_2c = 0;
      local_28 = 0;
      p_Var3 = (_List_node_base *)FUN_0002256c(puVar8,local_50);
      std::_List_node_base::hook(p_Var3);
      FUN_00022510(local_50);
      if (*(int *)(iVar2 + 0xb3c) != 0) {
        iVar4 = *(int *)(iVar2 + 0xb38);
        *(int *)(iVar4 + 0x2c) = *(int *)(iVar2 + 0xb3c);
        *(undefined4 *)(iVar4 + 0x30) = 1;
        *(int *)(iVar2 + 0xb40) = *(int *)(iVar2 + 0xb40) + 1;
      }
      FUN_00022510(&local_15c);
    }
  }
  else if (*(int *)(PTR_DAT_004d9048 + 4) == 1) {
    uVar6 = *(undefined4 *)(param_1 + 8);
    FUN_0030f7cc(auStack_ec,"@buy");
    iVar2 = FUN_0039725c(uVar6,auStack_ec);
    FUN_0030f7e0(auStack_ec);
    if (iVar2 != 0) {
      puVar8 = (undefined4 *)(iVar2 + 0xb34);
      if (*(int *)(iVar2 + 0xb3c) == 0) {
        FUN_00022608(puVar8);
        *puVar8 = puVar8;
        *(undefined4 **)(iVar2 + 0xb38) = puVar8;
      }
      else {
        puVar5 = (undefined4 *)*puVar8;
        if (puVar5 != puVar8) {
          puVar5[0xb] = *(int *)(iVar2 + 0xb3c);
          puVar5[0xc] = 2;
          *(int *)(iVar2 + 0xb40) = *(int *)(iVar2 + 0xb40) + 1;
          for (puVar5 = (undefined4 *)*puVar5; puVar5 != puVar8; puVar5 = (undefined4 *)*puVar5) {
            puVar5[0xb] = *(undefined4 *)(iVar2 + 0xb3c);
            puVar5[0xc] = 2;
            *(int *)(iVar2 + 0xb40) = *(int *)(iVar2 + 0xb40) + 1;
          }
        }
      }
      local_f0 = 1;
      local_110 = (undefined *)0x0;
      FUN_00022510(&local_110);
      local_f0 = 0;
      local_110 = &DAT_0052ce38;
      local_104 = 0;
      local_108 = &LAB_00076b40_1;
      local_30 = 1;
      local_50[0] = 0;
      local_10c = param_1;
      (*(code *)PTR_FUN_0052ce40)(&local_110,local_50);
      local_2c = 0;
      local_28 = 0;
      p_Var3 = (_List_node_base *)FUN_0002256c(puVar8,local_50);
      std::_List_node_base::hook(p_Var3);
      FUN_00022510(local_50);
      if (*(int *)(iVar2 + 0xb3c) != 0) {
        iVar4 = *(int *)(iVar2 + 0xb38);
        *(int *)(iVar4 + 0x2c) = *(int *)(iVar2 + 0xb3c);
        *(undefined4 *)(iVar4 + 0x30) = 1;
        *(int *)(iVar2 + 0xb40) = *(int *)(iVar2 + 0xb40) + 1;
      }
      FUN_00022510(&local_110);
    }
  }
  else {
    uVar6 = *(undefined4 *)(param_1 + 8);
    FUN_0030f7cc(auStack_184,"upsellMain.woodBoardOffset.woodBoard.BuyFullGame.fruit");
    iVar2 = FUN_0039725c(uVar6,auStack_184);
    FUN_0030f7e0(auStack_184);
    if (iVar2 != 0) {
      FUN_0003ca90(iVar2 + 0x75c,*(undefined4 *)(iVar2 + 0x75c));
      puVar8 = (undefined4 *)(iVar2 + 0x76c);
      if (*(int *)(iVar2 + 0x774) == 0) {
        FUN_0003ca68(puVar8);
        *puVar8 = puVar8;
        *(undefined4 **)(iVar2 + 0x770) = puVar8;
      }
      else {
        puVar5 = (undefined4 *)*puVar8;
        if (puVar5 != puVar8) {
          puVar5[0xb] = *(int *)(iVar2 + 0x774);
          puVar5[0xc] = 2;
          *(int *)(iVar2 + 0x778) = *(int *)(iVar2 + 0x778) + 1;
          for (puVar5 = (undefined4 *)*puVar5; puVar5 != puVar8; puVar5 = (undefined4 *)*puVar5) {
            puVar5[0xb] = *(undefined4 *)(iVar2 + 0x774);
            puVar5[0xc] = 2;
            *(int *)(iVar2 + 0x778) = *(int *)(iVar2 + 0x778) + 1;
          }
        }
      }
      local_188 = 1;
      local_1a8 = (undefined *)0x0;
      FUN_0003c910(&local_1a8);
      local_188 = 0;
      local_1a8 = &DAT_0052ce18;
      local_19c = 0;
      local_1a0 = &LAB_00076b78_1;
      local_30 = 1;
      local_50[0] = 0;
      local_1a4 = param_1;
      (*(code *)PTR_FUN_0052ce20)(&local_1a8,local_50);
      local_2c = 0;
      local_28 = 0;
      p_Var3 = (_List_node_base *)FUN_0003c96c(puVar8,local_50);
      std::_List_node_base::hook(p_Var3);
      FUN_0003c910(local_50);
      if (*(int *)(iVar2 + 0x774) != 0) {
        iVar4 = *(int *)(iVar2 + 0x770);
        *(int *)(iVar4 + 0x2c) = *(int *)(iVar2 + 0x774);
        *(undefined4 *)(iVar4 + 0x30) = 1;
        *(int *)(iVar2 + 0x778) = *(int *)(iVar2 + 0x778) + 1;
      }
      FUN_0003c910(&local_1a8);
    }
  }
  puVar1 = PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 4) = 0;
  if (*(int *)puVar1 == local_24) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

## FUN_00074780 — 00074780

- 函数名: FUN_00074780
- 函数体: 21 字节
- 调用者数: 1 / 被调用者数: 0

```c

void FUN_00074780(undefined4 *param_1)

{
  *param_1 = &DAT_00538d78;
  param_1[1] = 0;
  return;
}


```

## FUN_00074ac8 — 00074ac8

- 函数名: FUN_00074ac8
- 函数体: 227 字节
- 调用者数: 0 / 被调用者数: 5

(反编译超时或失败)

## FUN_0007497c — 0007497c

- 函数名: FUN_0007497c
- 函数体: 29 字节
- 调用者数: 3 / 被调用者数: 1

```c

void FUN_0007497c(int param_1)

{
  undefined1 local_c [4];
  
  if (*(int *)(param_1 + 4) != 0) {
    local_c[0] = 0;
    FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 4) + 0x260),local_c);
  }
  return;
}


```

## FUN_0007499c — 0007499c

- 函数名: FUN_0007499c
- 函数体: 129 字节
- 调用者数: 1 / 被调用者数: 5

```c

void FUN_0007499c(int param_1)

{
  undefined *puVar1;
  int *piVar2;
  code *pcVar3;
  undefined1 auStack_50 [40];
  undefined1 local_28 [4];
  int local_24;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  local_28[0] = 1;
  FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 4) + 0x260),local_28);
  FUN_00074a20(param_1);
  *(undefined4 *)(param_1 + 0x10) = 0;
  piVar2 = *(int **)(param_1 + 4);
  pcVar3 = *(code **)(*piVar2 + 0x40);
  FUN_0030f7cc(auStack_50,"animate_in");
  (*pcVar3)(piVar2,auStack_50,1);
  FUN_0030f7e0(auStack_50);
  *(undefined4 *)(param_1 + 0xc) = 0;
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00069ef0 — 00069ef0

- 函数名: FUN_00069ef0
- 函数体: 2553 字节
- 调用者数: 0 / 被调用者数: 23

```c

void FUN_00069ef0(int param_1)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int *piVar5;
  int *piVar6;
  uint uVar7;
  undefined4 uVar8;
  undefined1 *puVar9;
  undefined4 uVar10;
  int iVar11;
  code *pcVar12;
  undefined4 uVar13;
  float fVar14;
  undefined8 in_d0;
  undefined8 uVar15;
  undefined8 in_d1;
  undefined8 uVar16;
  float fVar17;
  undefined8 unaff_d8;
  int local_550;
  undefined1 auStack_544 [40];
  undefined1 auStack_51c [40];
  undefined1 auStack_4f4 [40];
  undefined4 uStack_4cc;
  undefined4 local_4c8;
  undefined1 auStack_4c4 [40];
  undefined1 auStack_49c [40];
  undefined1 auStack_474 [40];
  undefined1 auStack_44c [40];
  undefined1 auStack_424 [40];
  undefined4 local_3fc;
  undefined4 local_3f8;
  undefined1 auStack_3f4 [40];
  undefined1 auStack_3cc [40];
  undefined1 auStack_3a4 [40];
  undefined4 local_37c;
  undefined4 local_378;
  undefined **local_374;
  undefined *local_370;
  undefined1 local_354;
  undefined1 auStack_350 [40];
  undefined1 auStack_328 [40];
  undefined1 auStack_300 [40];
  undefined1 auStack_2d8 [40];
  undefined1 auStack_2b0 [40];
  undefined1 auStack_288 [40];
  undefined1 auStack_260 [40];
  undefined1 auStack_238 [40];
  undefined1 auStack_210 [40];
  undefined1 auStack_1e8 [40];
  undefined1 auStack_1c0 [40];
  undefined1 auStack_198 [40];
  undefined1 auStack_170 [40];
  undefined1 auStack_148 [40];
  undefined1 auStack_120 [40];
  undefined **ppuStack_f8;
  undefined *puStack_f4;
  undefined1 uStack_d8;
  undefined1 auStack_d4 [40];
  undefined1 auStack_ac [40];
  undefined1 auStack_84 [40];
  undefined1 auStack_5c [40];
  undefined1 auStack_34 [12];
  
  uVar15 = CONCAT44((int)((ulonglong)in_d0 >> 0x20),DAT_0006a2b8);
  iVar1 = *(int *)PTR____stack_chk_guard_004d9044;
  uVar16 = FloatVectorAdd(CONCAT44((int)((ulonglong)in_d1 >> 0x20),*(undefined4 *)(param_1 + 0x1c)),
                          uVar15,2);
  *(int *)(param_1 + 0x1c) = (int)uVar16;
  fVar17 = *(float *)(param_1 + 0x20);
  uVar15 = FloatVectorAdd(CONCAT44((int)((ulonglong)unaff_d8 >> 0x20),fVar17),uVar15,2);
  *(int *)(param_1 + 0x20) = (int)uVar15;
  uVar8 = *(undefined4 *)(param_1 + 4);
  iVar2 = *(int *)(*(int *)(param_1 + 0xc) + 0x68);
  FUN_0030f7cc((int)uVar15,auStack_5c,"progressUIContainer");
  uVar8 = FUN_0039725c(uVar8,auStack_5c);
  FUN_0030f7e0(auStack_5c);
  FUN_0030f7cc(auStack_84,"map");
  iVar3 = FUN_0039725c(uVar8,auStack_84);
  FUN_0030f7e0(auStack_84);
  switch(*(undefined4 *)(param_1 + 0x14)) {
  case 0:
    uVar8 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_ac,"start_game");
    iVar2 = FUN_0039834c(uVar8,auStack_ac,1);
    FUN_0030f7e0(auStack_ac);
    if (iVar2 != 0) break;
    puVar9 = auStack_d4;
    *(undefined4 *)(param_1 + 0x20) = 0;
    *(undefined4 *)(param_1 + 0x14) = 2;
    piVar5 = *(int **)(param_1 + 4);
    pcVar12 = *(code **)(*piVar5 + 0x40);
    goto LAB_0006a1d4;
  case 1:
    fVar14 = *(float *)(param_1 + 0x20);
    if ((DAT_0006a2bc < fVar14) && ((int)((uint)(fVar17 < DAT_0006a2bc) << 0x1f) < 0)) {
      FUN_0006a90c(param_1);
      fVar14 = *(float *)(param_1 + 0x20);
    }
    if ((((1.5 < fVar14) && ((int)((uint)(fVar17 < 1.5) << 0x1f) < 0)) &&
        (iVar2 = FUN_0001d10c(PTR_DAT_004d9048), *(char *)(iVar2 + 0x8c) != '\0')) &&
       (iVar2 = FUN_0001d10c(PTR_DAT_004d9048), *(int *)(*(int *)(iVar2 + 0x68) + 0x98) == 0)) {
      FUN_0030a1d8();
      FUN_0030a7e4();
      uVar8 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
      uStack_d8 = 1;
      ppuStack_f8 = (undefined **)0x0;
      FUN_0000a298(&ppuStack_f8);
      uStack_d8 = 0;
      ppuStack_f8 = &PTR_LAB_0052bf38;
      puStack_f4 = PTR_FUN_004d9058;
      FUN_0002bb34(uVar8,"act-change",0x3f800000,0x3f800000,&ppuStack_f8,0);
      FUN_0000a298(&ppuStack_f8);
    }
    uVar8 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_120,"act_change");
    iVar2 = FUN_0039834c(uVar8,auStack_120,1);
    FUN_0030f7e0(auStack_120);
    if (iVar2 != 0) break;
    *(undefined4 *)(param_1 + 0x20) = 0;
    *(undefined4 *)(param_1 + 0x14) = 2;
    FUN_0006ac30(param_1);
    FUN_00069ddc(param_1);
    iVar2 = FUN_0001d10c(PTR_DAT_004d9048);
    *(undefined1 *)(iVar2 + 0x8c) = 0;
    uVar8 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_148,"challengeContainer");
    iVar2 = FUN_0039725c(uVar8,auStack_148);
    FUN_0030f7e0(auStack_148);
    if (iVar2 != 0) {
      auStack_34[0] = *(int *)(*(int *)(*(int *)(param_1 + 0xc) + 0x68) + 0x98) == 0;
      FUN_0001da28(*(undefined4 *)(iVar2 + 0x260),auStack_34);
    }
    uVar8 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_170,"bossChallengeContainer");
    iVar2 = FUN_0039725c(uVar8,auStack_170);
    FUN_0030f7e0(auStack_170);
    if (iVar2 != 0) {
      auStack_34[0] = *(int *)(*(int *)(*(int *)(param_1 + 0xc) + 0x68) + 0x98) != 0;
      FUN_0001da28(*(undefined4 *)(iVar2 + 0x260),auStack_34);
    }
    piVar5 = *(int **)(param_1 + 4);
    puVar9 = auStack_198;
    pcVar12 = *(code **)(*piVar5 + 0x40);
LAB_0006a1d4:
    FUN_0030f7cc(puVar9,"animate_in");
    (*pcVar12)(piVar5,puVar9,1);
    FUN_0030f7e0(puVar9);
    FUN_00022070();
    break;
  case 2:
    uVar8 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_1c0,"animate_in");
    iVar2 = FUN_0039834c(uVar8,auStack_1c0,1);
    if (iVar2 != 1) {
      uVar8 = *(undefined4 *)(param_1 + 4);
      FUN_0030f7cc(auStack_1e8,"start_game");
      iVar2 = FUN_0039834c(uVar8,auStack_1e8,1);
      if (iVar2 == 0) {
        uVar8 = *(undefined4 *)(param_1 + 4);
        FUN_0030f7cc(auStack_210,"act_change");
        iVar2 = FUN_0039834c(uVar8,auStack_210,1);
        FUN_0030f7e0(auStack_210);
        FUN_0030f7e0(auStack_1e8);
        FUN_0030f7e0(auStack_1c0);
        if (iVar2 == 0) {
          FUN_0006ad24(param_1);
        }
        break;
      }
      FUN_0030f7e0(auStack_1e8);
    }
    FUN_0030f7e0(auStack_1c0);
    break;
  case 3:
    FUN_0030f7cc(auStack_238,"pussMap");
    iVar3 = FUN_0039725c(iVar3,auStack_238);
    FUN_0030f7e0(auStack_238);
    if (iVar3 != 0) {
      _sprintf(&DAT_005f9590,"animate_trigger_%d",*(undefined4 *)(iVar2 + 0x84));
      FUN_0030f7cc(auStack_260,&DAT_005f9590);
      iVar2 = FUN_0039834c(iVar3,auStack_260,1);
      FUN_0030f7e0(auStack_260);
      if (iVar2 == 0) {
        FUN_0006ae4c(param_1);
      }
    }
    break;
  case 4:
    uVar8 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_288,"progressUIContainer");
    uVar8 = FUN_0039725c(uVar8,auStack_288);
    FUN_0030f7e0(auStack_288);
    uVar10 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_2b0,"challengeContainer.spinner");
    uVar10 = FUN_0039725c(uVar10,auStack_2b0);
    FUN_0030f7e0(auStack_2b0);
    if (iVar3 != 0) {
      _sprintf(&DAT_005f9590,"adventureNode_%d",1);
      FUN_0030f7cc(auStack_2d8,&DAT_005f9590);
      piVar5 = (int *)FUN_0039725c(uVar10,auStack_2d8);
      FUN_0030f7e0(auStack_2d8);
      if (piVar5 != (int *)0x0) {
        local_550 = 2;
        do {
          FUN_0030f7cc(auStack_300,"animate_reset_in");
          iVar3 = FUN_0039834c(piVar5,auStack_300,0);
          if (iVar3 == 1) {
LAB_0006a4d6:
            FUN_0030f7e0(auStack_300);
          }
          else {
            FUN_0030f7cc(auStack_328,"animate_delay");
            iVar3 = FUN_0039834c(piVar5,auStack_328,0);
            if (iVar3 != 0) {
              FUN_0030f7e0(auStack_328);
              goto LAB_0006a4d6;
            }
            FUN_0030f7cc(auStack_350,"animate_stop");
            iVar3 = FUN_0039834c(piVar5,auStack_350,0);
            FUN_0030f7e0(auStack_350);
            FUN_0030f7e0(auStack_328);
            FUN_0030f7e0(auStack_300);
            if (iVar3 == 0) {
              if ((*(int *)(param_1 + 8) == 0) &&
                 ((int)((uint)(*(float *)(param_1 + 0x1c) < DAT_0006a2c0) << 0x1f) < 0)) {
                uVar13 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
                local_354 = 1;
                local_374 = (undefined **)0x0;
                FUN_0000a298(&local_374);
                local_354 = 0;
                local_374 = &PTR_LAB_0052bf38;
                local_370 = PTR_FUN_004d9058;
                uVar13 = FUN_0002bb34(uVar13,"slot_spin_lp",0x3f800000,0x3f800000,&local_374,0);
                *(undefined4 *)(param_1 + 8) = uVar13;
                FUN_0000a298(&local_374);
              }
              uVar7 = FUN_00060da0();
              uVar15 = FixedToFP(CONCAT44(uVar7 >> 3,uVar7 >> 3),0,1,0,0x20);
              uVar16 = FixedToFP(CONCAT44(uVar7,uVar7) & 0x700000007,0,1,0,0x20);
              uVar15 = FloatVectorMult(uVar15,0x3e0000003e000000,2,0x20);
              uVar16 = FloatVectorMult(uVar16,0x3e0000003e000000,2,0x20);
              local_37c = (undefined4)uVar16;
              local_378 = (undefined4)uVar15;
              FUN_0006bc4c(local_378,piVar5[0x1d1],&local_37c);
              pcVar12 = *(code **)(*piVar5 + 0x40);
              FUN_0030f7cc(auStack_3a4,"animate_delay");
              (*pcVar12)(piVar5,auStack_3a4,1);
              FUN_0030f7e0(auStack_3a4);
            }
          }
          _sprintf(&DAT_005f9590,"adventureNode_%d",local_550);
          FUN_0030f7cc(auStack_2d8,&DAT_005f9590);
          piVar5 = (int *)FUN_0039725c(uVar10,auStack_2d8);
          FUN_0030f7e0(auStack_2d8);
          local_550 = local_550 + 1;
        } while (piVar5 != (int *)0x0);
      }
    }
    if (*(float *)(param_1 + 0x1c) <= DAT_0006a2c0) break;
    if (*(int *)(param_1 + 8) != 0) {
      FUN_00309aac(*(int *)(param_1 + 8),0x3dcccccd);
      FUN_0002be70(*(undefined4 *)(PTR_DAT_004d9048 + 0x1a4),*(undefined4 *)(param_1 + 8),
                   "slot_spin_lp");
      *(undefined4 *)(param_1 + 8) = 0;
    }
    if (0 < *(int *)(iVar2 + 0x7c)) {
      iVar3 = 0;
      do {
        iVar11 = iVar3 + 1;
        _sprintf(&DAT_005f9590,"adventureNode_%d",iVar11);
        FUN_0030f7cc(auStack_3cc,&DAT_005f9590);
        iVar4 = FUN_0039725c(uVar10,auStack_3cc);
        FUN_0030f7e0(auStack_3cc);
        _sprintf(&DAT_005f9590,"map.challenge_%d_%d.challenge",*(int *)(iVar2 + 0xa4) + 1,iVar11);
        FUN_0030f7cc(auStack_3f4,&DAT_005f9590);
        piVar5 = (int *)FUN_0039725c(uVar8,auStack_3f4);
        FUN_0030f7e0(auStack_3f4);
        if (iVar4 != 0) {
          piVar6 = (int *)FUN_0006ed58(iVar2,iVar3);
          uVar7 = 0;
          if (*(int *)(*piVar6 + 0x100) != 0) {
            uVar7 = *(uint *)(*(int *)(*piVar6 + 0x100) + 0x44);
          }
          uVar15 = FixedToFP(CONCAT44(uVar7 >> 3,uVar7 >> 3),0,1,0,0x20);
          uVar16 = FixedToFP(CONCAT44(uVar7,uVar7) & 0x700000007,0,1,0,0x20);
          uVar15 = FloatVectorMult(uVar15,0x3e0000003e000000,2,0x20);
          uVar16 = FloatVectorMult(uVar16,0x3e0000003e000000,2,0x20);
          local_3fc = (undefined4)uVar16;
          local_3f8 = (undefined4)uVar15;
          FUN_0006bc4c(local_3f8,*(undefined4 *)(iVar4 + 0x744),&local_3fc);
          auStack_34[0] = 1;
          FUN_0001da28(*(undefined4 *)(iVar4 + 0x264),auStack_34);
          if (piVar5 != (int *)0x0) {
            FUN_0006bc4c(piVar5[0x1d1],&local_3fc);
            pcVar12 = *(code **)(*piVar5 + 0x40);
            FUN_0030f7cc(auStack_424,"animate_appear");
            (*pcVar12)(piVar5,auStack_424,0);
            FUN_0030f7e0(auStack_424);
          }
        }
        iVar3 = iVar11;
      } while (iVar11 < *(int *)(iVar2 + 0x7c));
    }
    goto LAB_0006a82e;
  case 5:
    uVar8 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_44c,"progressUIContainer");
    uVar8 = FUN_0039725c(uVar8,auStack_44c);
    FUN_0030f7e0(auStack_44c);
    uVar10 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_474,"bossChallengeContainer.spinner");
    uVar10 = FUN_0039725c(uVar10,auStack_474);
    FUN_0030f7e0(auStack_474);
    if (*(float *)(param_1 + 0x1c) <= DAT_0006a908) break;
    if (*(int *)(param_1 + 8) != 0) {
      FUN_00309aac(*(int *)(param_1 + 8),0x3dcccccd);
      *(undefined4 *)(param_1 + 8) = 0;
    }
    if (0 < *(int *)(iVar2 + 0x7c)) {
      iVar3 = 0;
      do {
        iVar11 = iVar3 + 1;
        _sprintf(&DAT_005f9590,"adventureNode_%d",iVar11);
        FUN_0030f7cc(auStack_49c,&DAT_005f9590);
        iVar4 = FUN_0039725c(uVar10,auStack_49c);
        FUN_0030f7e0(auStack_49c);
        _sprintf(&DAT_005f9590,"map.challenge_%d_%d.challenge",*(int *)(iVar2 + 0xa4) + 1,iVar11);
        FUN_0030f7cc(auStack_4c4,&DAT_005f9590);
        piVar5 = (int *)FUN_0039725c(uVar8,auStack_4c4);
        FUN_0030f7e0(auStack_4c4);
        if (iVar4 != 0) {
          piVar6 = (int *)FUN_0006ed58(iVar2,iVar3);
          uVar7 = 0;
          if (*(int *)(*piVar6 + 0x100) != 0) {
            uVar7 = *(uint *)(*(int *)(*piVar6 + 0x100) + 0x44);
          }
          uVar15 = FixedToFP(CONCAT44(uVar7 >> 3,uVar7 >> 3),0,1,0,0x20);
          uVar16 = FixedToFP(CONCAT44(uVar7,uVar7) & 0x700000007,0,1,0,0x20);
          uVar15 = FloatVectorMult(uVar15,0x3e0000003e000000,2,0x20);
          uVar16 = FloatVectorMult(uVar16,0x3e0000003e000000,2,0x20);
          uStack_4cc = (undefined4)uVar16;
          local_4c8 = (undefined4)uVar15;
          FUN_0006bc4c(local_4c8,*(undefined4 *)(iVar4 + 0x744),&uStack_4cc);
          if (piVar5 != (int *)0x0) {
            FUN_0006bc4c(piVar5[0x1d1],&uStack_4cc);
            pcVar12 = *(code **)(*piVar5 + 0x40);
            FUN_0030f7cc(auStack_4f4,"animate_appear");
            (*pcVar12)(piVar5,auStack_4f4,0);
            FUN_0030f7e0(auStack_4f4);
          }
        }
        iVar3 = iVar11;
      } while (iVar11 < *(int *)(iVar2 + 0x7c));
    }
LAB_0006a82e:
    *(undefined4 *)(param_1 + 0x1c) = 0;
    *(undefined4 *)(param_1 + 0x20) = 0;
    *(undefined4 *)(param_1 + 0x14) = 7;
    break;
  case 8:
    uVar8 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_51c,"progressUIContainer");
    uVar8 = FUN_0039725c(uVar8,auStack_51c);
    FUN_0030f7e0(auStack_51c);
    FUN_0030f7cc(auStack_544,"animate_out");
    iVar3 = FUN_0039834c(uVar8,auStack_544,1);
    if (iVar3 == 1) {
      iVar2 = *(int *)(iVar2 + 0x98);
      FUN_0030f7e0(auStack_544);
      if (iVar2 == 0) break;
    }
    else {
      FUN_0030f7e0(auStack_544);
    }
    *(undefined4 *)(param_1 + 0x14) = 9;
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 != iVar1) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00069a3c — 00069a3c

- 函数名: FUN_00069a3c
- 函数体: 895 字节
- 调用者数: 2 / 被调用者数: 10

```c

void FUN_00069a3c(int param_1)

{
  undefined *puVar1;
  int *piVar2;
  int iVar3;
  int iVar4;
  int *piVar5;
  uint uVar6;
  undefined4 uVar7;
  code *pcVar8;
  int iVar9;
  undefined1 auStack_280 [40];
  undefined1 auStack_258 [40];
  undefined1 auStack_230 [40];
  undefined1 auStack_208 [40];
  undefined1 auStack_1e0 [40];
  undefined1 auStack_1b8 [40];
  undefined1 auStack_190 [40];
  undefined1 auStack_168 [40];
  undefined1 auStack_140 [40];
  undefined1 auStack_118 [40];
  undefined1 auStack_f0 [40];
  undefined1 auStack_c8 [40];
  undefined1 auStack_a0 [40];
  undefined1 auStack_78 [40];
  undefined1 auStack_50 [40];
  undefined1 local_28 [4];
  int local_24;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  local_28[0] = 1;
  FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 4) + 0x260),local_28);
  FUN_00396d98(*(undefined4 *)(param_1 + 4),1);
  uVar7 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_50,"progressUIContainer");
  piVar2 = (int *)FUN_0039725c(uVar7,auStack_50);
  FUN_0030f7e0(auStack_50);
  local_28[0] = 1;
  FUN_0001da28(piVar2[0x98],local_28);
  uVar7 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_78,"challengeContainer");
  iVar3 = FUN_0039725c(uVar7,auStack_78);
  FUN_0030f7e0(auStack_78);
  local_28[0] = 1;
  FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),local_28);
  FUN_00069a08(param_1);
  iVar3 = *(int *)(*(int *)(param_1 + 0xc) + 0x68);
  uVar6 = 0;
  if (*(char *)(param_1 + 0x24) == '\0') {
    uVar6 = *(int *)(iVar3 + 0xa4) + 1;
  }
  uVar7 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_a0,"challengeContainer.spinner");
  uVar7 = FUN_0039725c(uVar7,auStack_a0);
  FUN_0030f7e0(auStack_a0);
  if (0 < *(int *)(iVar3 + 0x7c)) {
    iVar9 = 0;
    do {
      iVar9 = iVar9 + 1;
      _sprintf(&DAT_005f9590,"adventureNode_%d",iVar9);
      FUN_0030f7cc(auStack_c8,&DAT_005f9590);
      iVar4 = FUN_0039725c(uVar7,auStack_c8);
      FUN_0030f7e0(auStack_c8);
      if (iVar4 != 0) {
        local_28[0] = 0;
        FUN_0001da28(*(undefined4 *)(iVar4 + 0x264),local_28);
      }
    } while (iVar9 < *(int *)(iVar3 + 0x7c));
  }
  if (*(char *)(param_1 + 0x18) != '\0') {
    pcVar8 = *(code **)(*piVar2 + 0x40);
    FUN_0030f7cc(auStack_f0,"animate_reset");
    (*pcVar8)(piVar2,auStack_f0,1);
    FUN_0030f7e0(auStack_f0);
    _sprintf(&DAT_005f9590,"map.act%d",uVar6);
    FUN_0030f7cc(auStack_118,&DAT_005f9590);
    piVar5 = (int *)FUN_0039725c(piVar2,auStack_118);
    FUN_0030f7e0(auStack_118);
    if (piVar5 != (int *)0x0) {
      pcVar8 = *(code **)(*piVar5 + 0x40);
      FUN_0030f7cc(auStack_140,"animate_disappear");
      (*pcVar8)(piVar5,auStack_140,1);
      FUN_0030f7e0(auStack_140);
    }
    _sprintf(&DAT_005f9590,"map.act%d",uVar6 + 1);
    FUN_0030f7cc(auStack_168,&DAT_005f9590);
    piVar2 = (int *)FUN_0039725c(piVar2,auStack_168);
    FUN_0030f7e0(auStack_168);
    if (piVar2 != (int *)0x0) {
      pcVar8 = *(code **)(*piVar2 + 0x40);
      FUN_0030f7cc(auStack_190,"animate_appear");
      (*pcVar8)(piVar2,auStack_190,1);
      FUN_0030f7e0(auStack_190);
    }
    uVar7 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_1b8,"@actContainer.actLabel");
    iVar3 = FUN_0039725c(uVar7,auStack_1b8);
    FUN_0030f7e0(auStack_1b8);
    if (iVar3 != 0) {
      if (uVar6 < 3) {
        *(uint *)(iVar3 + 0x880) = uVar6 + 1;
        FUN_003d0bf4(iVar3);
      }
      else {
        FUN_0030f7cc(auStack_1e0,"FN_PUSS_FINALE");
        FUN_00022950(*(undefined4 *)(iVar3 + 0x7dc),auStack_1e0);
        FUN_0030f7e0(auStack_1e0);
      }
    }
  }
  if (*(char *)(param_1 + 0x24) == '\0') {
    piVar2 = *(int **)(param_1 + 4);
    pcVar8 = *(code **)(*piVar2 + 0x40);
    if (*(char *)(param_1 + 0x18) != '\0') {
      FUN_0030f7cc(auStack_230,"act_change");
      (*pcVar8)(piVar2,auStack_230,1);
      FUN_0030f7e0(auStack_230);
      *(undefined4 *)(param_1 + 0x14) = 1;
      goto LAB_00069d90;
    }
    FUN_0030f7cc(auStack_258,"animate_in");
    (*pcVar8)(piVar2,auStack_258,1);
    FUN_0030f7e0(auStack_258);
    piVar2 = *(int **)(param_1 + 4);
    pcVar8 = *(code **)(*piVar2 + 0x40);
    FUN_0030f7cc(auStack_280,"map_in");
    (*pcVar8)(piVar2,auStack_280,1);
    FUN_0030f7e0(auStack_280);
    uVar7 = 2;
  }
  else {
    piVar2 = *(int **)(param_1 + 4);
    pcVar8 = *(code **)(*piVar2 + 0x40);
    FUN_0030f7cc(auStack_208,"start_game");
    (*pcVar8)(piVar2,auStack_208,1);
    FUN_0030f7e0(auStack_208);
    uVar7 = 0;
  }
  *(undefined4 *)(param_1 + 0x14) = uVar7;
LAB_00069d90:
  puVar1 = PTR____stack_chk_guard_004d9044;
  *(undefined1 *)(param_1 + 0x24) = 0;
  *(undefined4 *)(param_1 + 0x20) = 0;
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00069dbc — 00069dbc

- 函数名: FUN_00069dbc
- 函数体: 29 字节
- 调用者数: 8 / 被调用者数: 1

```c

void FUN_00069dbc(int param_1)

{
  undefined1 local_c [4];
  
  if (*(int *)(param_1 + 4) != 0) {
    local_c[0] = 0;
    FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 4) + 0x260),local_c);
  }
  return;
}


```

