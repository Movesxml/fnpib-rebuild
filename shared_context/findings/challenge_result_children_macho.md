# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0006cae0 — 0006cae0

- 函数名: FUN_0006cae0
- 函数体: 327 字节
- 调用者数: 1 / 被调用者数: 8

```c

void FUN_0006cae0(int param_1,int param_2)

{
  undefined *puVar1;
  undefined *puVar2;
  int *piVar3;
  int iVar4;
  code *pcVar5;
  int iVar6;
  undefined4 uVar7;
  undefined **local_98;
  undefined *local_94;
  undefined1 local_78;
  undefined1 auStack_74 [40];
  undefined1 auStack_4c [40];
  int local_24;
  
  puVar2 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0x14) = 0;
  if (param_2 == 0) {
    FUN_00020698(1,1);
  }
  uVar7 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_4c,"resultsContainer");
  piVar3 = (int *)FUN_0039725c(uVar7,auStack_4c);
  iVar4 = FUN_0030f7e0(auStack_4c);
  if (piVar3 != (int *)0x0) {
    iVar4 = piVar3[0x13];
  }
  if (piVar3 != (int *)0x0 && iVar4 != 0) {
    for (iVar4 = piVar3[0x98]; *(int *)(iVar4 + 0x38) != 0;
        iVar4 = *(int *)(*(int *)(iVar4 + 0x38) + 4)) {
    }
    if (*(char *)(iVar4 + 0x48) != '\0') {
      pcVar5 = *(code **)(*piVar3 + 0x40);
      FUN_0030f7cc(auStack_74,"animate_trigger");
      (*pcVar5)(piVar3,auStack_74,1);
      FUN_0030f7e0(auStack_74);
    }
  }
  puVar1 = PTR_DAT_004d9024;
  iVar4 = FUN_0005edbc(PTR_DAT_004d9024);
  iVar6 = *(int *)(PTR_DAT_004d9048 + 0x1a4);
  if ((iVar6 != 0) && (iVar4 == 1 && param_2 == 0)) {
    local_78 = 1;
    local_98 = (undefined **)0x0;
    FUN_0000a298(&local_98);
    local_78 = 0;
    local_98 = &PTR_LAB_0052bf38;
    local_94 = PTR_FUN_004d9058;
    FUN_0002bb34(iVar6,"Combo",0x3f800000,0x3f800000,&local_98,0);
    FUN_0000a298(&local_98);
  }
  iVar4 = FUN_0005edbc(puVar1);
  uVar7 = 1;
  if (iVar4 != 1) {
    uVar7 = 2;
  }
  *(undefined4 *)(param_1 + 0x10) = uVar7;
  if (*(int *)puVar2 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0006cc28 — 0006cc28

- 函数名: FUN_0006cc28
- 函数体: 111 字节
- 调用者数: 0 / 被调用者数: 4

```c

void FUN_0006cc28(int param_1)

{
  undefined *puVar1;
  int iVar2;
  undefined4 uVar3;
  int *piVar4;
  code *pcVar5;
  undefined1 auStack_48 [40];
  int local_20;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_20 = *(int *)PTR____stack_chk_guard_004d9044;
  iVar2 = FUN_00062a28(*(undefined4 *)(param_1 + 8));
  if (iVar2 == 0) {
    piVar4 = *(int **)(param_1 + 4);
    pcVar5 = *(code **)(*piVar4 + 0x40);
    FUN_0030f7cc(auStack_48,"animate_out");
    (*pcVar5)(piVar4,auStack_48,1);
    FUN_0030f7e0(auStack_48);
    uVar3 = 3;
  }
  else {
    uVar3 = 4;
  }
  *(undefined4 *)(param_1 + 0x10) = uVar3;
  if (*(int *)puVar1 != local_20) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

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

## FUN_0006e254 — 0006e254

- 函数名: FUN_0006e254
- 函数体: 761 字节
- 调用者数: 1 / 被调用者数: 13

```c

void FUN_0006e254(int param_1)

{
  undefined *puVar1;
  int *piVar2;
  int iVar3;
  uint uVar4;
  int iVar5;
  int iVar6;
  undefined4 uVar7;
  code *pcVar8;
  undefined8 uVar9;
  undefined8 uVar10;
  undefined1 auStack_270 [40];
  undefined1 auStack_248 [40];
  undefined1 auStack_220 [40];
  undefined4 local_1f8;
  undefined4 local_1f4;
  undefined4 local_1f0;
  undefined4 local_1ec;
  undefined1 auStack_1e8 [40];
  undefined1 auStack_1c0 [40];
  undefined1 auStack_198 [40];
  undefined1 auStack_170 [40];
  undefined1 auStack_148 [40];
  undefined1 auStack_120 [40];
  undefined1 auStack_f8 [40];
  undefined1 auStack_d0 [40];
  int local_a8;
  char acStack_a4 [128];
  int local_24;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  local_a8 = CONCAT31(local_a8._1_3_,1);
  FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 4) + 0x260),&local_a8);
  uVar7 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_d0,"@instructions");
  piVar2 = (int *)FUN_0039725c(uVar7,auStack_d0);
  FUN_0030f7e0(auStack_d0);
  if (piVar2 != (int *)0x0) {
    local_a8 = CONCAT31(local_a8._1_3_,1);
    FUN_0001da28(piVar2[0x98],&local_a8);
    FUN_0030f7cc(auStack_f8,*(int *)(param_1 + 8) + 0xa1);
    FUN_0030f7cc(auStack_120,"text");
    FUN_0030f870(auStack_148,auStack_f8);
    local_a8 = 0;
    FUN_000632ac(piVar2 + 0x28,auStack_120,&local_a8);
    FUN_00022950(*(undefined4 *)(piVar2[0x37] + local_a8 * 4),auStack_148);
    FUN_0030f7e0(auStack_148);
    FUN_0030f7e0(auStack_120);
    pcVar8 = *(code **)(*piVar2 + 0x40);
    FUN_0030f7cc(auStack_170,"transition_up");
    (*pcVar8)(piVar2,auStack_170,1);
    FUN_0030f7e0(auStack_170);
    FUN_0030f7e0(auStack_f8);
  }
  uVar7 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_198,"instructionsContainerLeft");
  iVar3 = FUN_0039725c(uVar7,auStack_198);
  FUN_0030f7e0(auStack_198);
  if (iVar3 != 0) {
    local_a8._0_1_ = 1;
    FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),&local_a8);
    FUN_00396d98(iVar3,1);
    uVar7 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_1c0,"instructionsContainerRight");
    iVar3 = FUN_0039725c(uVar7,auStack_1c0);
    FUN_0030f7e0(auStack_1c0);
    local_a8 = CONCAT31(local_a8._1_3_,1);
    FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),&local_a8);
    FUN_00396d98(iVar3,1);
  }
  uVar7 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_1e8,"@icon");
  iVar3 = FUN_0039725c(uVar7,auStack_1e8);
  FUN_0030f7e0(auStack_1e8);
  if (iVar3 != 0) {
    local_1f0 = 0x3e000000;
    local_1ec = 0x3e000000;
    FUN_0006bc4c(*(undefined4 *)(iVar3 + 0x748),&local_1f0);
    iVar6 = *(int *)(*(int *)(*(int *)(param_1 + 8) + 100) + 0x100);
    uVar4 = 0;
    if (iVar6 != 0) {
      uVar4 = *(uint *)(iVar6 + 0x44);
    }
    uVar10 = FixedToFP(CONCAT44(uVar4 >> 3,uVar4 >> 3),0,1,0,0x20);
    uVar9 = FixedToFP(CONCAT44(uVar4,uVar4) & 0x700000007,0,1,0,0x20);
    uVar10 = FloatVectorMult(uVar10,0x3e0000003e000000,2,0x20);
    uVar9 = FloatVectorMult(uVar9,0x3e0000003e000000,2,0x20);
    local_1f8 = (undefined4)uVar9;
    local_1f4 = (undefined4)uVar10;
    FUN_0006bc4c(local_1f4,*(undefined4 *)(iVar3 + 0x744),&local_1f8);
  }
  iVar3 = 1;
  do {
    _sprintf(acStack_a4,"@misscounters.cross%d",iVar3);
    uVar7 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_220,acStack_a4);
    iVar6 = FUN_0039725c(uVar7,auStack_220);
    FUN_0030f7e0(auStack_220);
    if (iVar6 != 0) {
      iVar5 = FUN_0001d10c(PTR_DAT_004d9048);
      local_a8 = CONCAT31(local_a8._1_3_,*(int *)(iVar5 + 0x4c) < iVar3);
      FUN_0001da28(*(undefined4 *)(iVar6 + 0x260),&local_a8);
    }
    iVar3 = iVar3 + 1;
  } while (iVar3 != 4);
  uVar7 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_248,"@scoreCounterTotal");
  iVar3 = FUN_0039725c(uVar7,auStack_248);
  FUN_0030f7e0(auStack_248);
  if (iVar3 != 0) {
    local_a8 = CONCAT31(local_a8._1_3_,1);
    FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),&local_a8);
    FUN_0007daa8(iVar3);
  }
  piVar2 = *(int **)(param_1 + 4);
  pcVar8 = *(code **)(*piVar2 + 0x40);
  FUN_0030f7cc(auStack_270,"animate_in");
  (*pcVar8)(piVar2,auStack_270,1);
  FUN_0030f7e0(auStack_270);
  puVar1 = PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0xc) = 0;
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

