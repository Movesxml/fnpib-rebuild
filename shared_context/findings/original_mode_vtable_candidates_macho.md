# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_000676e0 — 000676e0

- 函数名: FUN_000676e0
- 函数体: 47 字节
- 调用者数: 0 / 被调用者数: 3

```c

undefined4 * FUN_000676e0(undefined4 *param_1)

{
  *param_1 = &PTR_FUN_000676e0_1_00538be8;
  FUN_00026e98(param_1 + 0x1d,0);
  FUN_0003ef70(param_1);
  FUN_0003f3c0(param_1);
  return param_1;
}


```

## FUN_000676ac — 000676ac

- 函数名: FUN_000676ac
- 函数体: 51 字节
- 调用者数: 0 / 被调用者数: 4

```c

void FUN_000676ac(undefined4 *param_1)

{
  *param_1 = &PTR_FUN_000676e0_1_00538be8;
  FUN_00026e98(param_1 + 0x1d,0);
  FUN_0003ef70(param_1);
  FUN_0003f3c0(param_1);
  operator_delete(param_1);
  return;
}


```

## FUN_00067710 — 00067710

- 函数名: FUN_00067710
- 函数体: 11 字节
- 调用者数: 0 / 被调用者数: 0

```c

void FUN_00067710(int *param_1)

{
  (**(code **)(*param_1 + 0x10))();
  return;
}


```

## FUN_00067720 — 00067720

- 函数名: FUN_00067720
- 函数体: 23 字节
- 调用者数: 0 / 被调用者数: 2

```c

void FUN_00067720(int param_1)

{
  FUN_00026e98(param_1 + 0x74,0);
  FUN_0003ef70(param_1);
  return;
}


```

## FUN_0006771c — 000686e8

- 函数名: FUN_000686e8
- 函数体: 89 字节
- 调用者数: 1 / 被调用者数: 1

(反编译超时或失败)

## FUN_00067d78 — 未找到

(函数未找到)

## FUN_00067808 — 未找到

(函数未找到)

## FUN_00067738 — 00067738

- 函数名: FUN_00067738
- 函数体: 207 字节
- 调用者数: 0 / 被调用者数: 8

```c

void FUN_00067738(int param_1)

{
  undefined4 uVar1;
  int iVar2;
  int *piVar3;
  code *pcVar4;
  undefined1 auStack_98 [40];
  undefined1 auStack_70 [40];
  undefined1 auStack_48 [40];
  undefined1 local_20 [4];
  int local_1c;
  
  local_1c = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_0003f4e8(param_1);
  if (*(char *)(param_1 + 0xa8) != '\0') {
    *(undefined1 *)(param_1 + 0xa8) = 0;
    *(undefined1 *)(param_1 + 0x33) = 1;
    uVar1 = FUN_003ecb20();
    FUN_0030f7cc(auStack_48,"mainscreen");
    iVar2 = FUN_003f06d0(uVar1,auStack_48);
    FUN_0030f7e0(auStack_48);
    if (iVar2 != 0) {
      local_20[0] = 1;
      FUN_0001da28(*(undefined4 *)(iVar2 + 0x264),local_20);
      FUN_0030f7cc(auStack_70,"news");
      piVar3 = (int *)FUN_0039725c(iVar2,auStack_70);
      FUN_0030f7e0(auStack_70);
      if (piVar3 != (int *)0x0) {
        pcVar4 = *(code **)(*piVar3 + 0x40);
        FUN_0030f7cc(auStack_98,"animate_in");
        (*pcVar4)(piVar3,auStack_98,1);
        FUN_0030f7e0(auStack_98);
      }
    }
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_1c) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00067d7c — 00067d7c

- 函数名: FUN_00067d7c
- 函数体: 9 字节
- 调用者数: 0 / 被调用者数: 1

```c

void FUN_00067d7c(void)

{
  FUN_0003ee3c();
  return;
}


```

## FUN_00069068 — 00069068

- 函数名: FUN_00069068
- 函数体: 13 字节
- 调用者数: 1 / 被调用者数: 1

```c

undefined4 FUN_00069068(undefined4 param_1)

{
  FUN_00069078();
  return param_1;
}


```

## FUN_00069054 — 00069054

- 函数名: FUN_00069054
- 函数体: 17 字节
- 调用者数: 0 / 被调用者数: 2

```c

void FUN_00069054(void *param_1)

{
  FUN_00069078();
  operator_delete(param_1);
  return;
}


```

## FUN_0006bd6c — 0006bd6c

- 函数名: FUN_0006bd6c
- 函数体: 13 字节
- 调用者数: 1 / 被调用者数: 1

```c

undefined4 FUN_0006bd6c(undefined4 param_1)

{
  FUN_0006bd7c();
  return param_1;
}


```

## FUN_0006bd58 — 0006bd58

- 函数名: FUN_0006bd58
- 函数体: 17 字节
- 调用者数: 0 / 被调用者数: 2

```c

void FUN_0006bd58(void *param_1)

{
  FUN_0006bd7c();
  operator_delete(param_1);
  return;
}


```

## FUN_0006d330 — 0006e254

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

## FUN_0006d334 — 0006d334

- 函数名: FUN_0006d334
- 函数体: 17 字节
- 调用者数: 0 / 被调用者数: 2

```c

void FUN_0006d334(void *param_1)

{
  FUN_0006d358();
  operator_delete(param_1);
  return;
}


```

## FUN_0006e030 — 0006e030

- 函数名: FUN_0006e030
- 函数体: 13 字节
- 调用者数: 1 / 被调用者数: 1

```c

undefined4 FUN_0006e030(undefined4 param_1)

{
  FUN_0006e040();
  return param_1;
}


```

## FUN_0006e01c — 0006e01c

- 函数名: FUN_0006e01c
- 函数体: 17 字节
- 调用者数: 0 / 被调用者数: 2

```c

void FUN_0006e01c(void *param_1)

{
  FUN_0006e040();
  operator_delete(param_1);
  return;
}


```

## FUN_00072080 — 00072f94

- 函数名: FUN_00072f94
- 函数体: 1471 字节
- 调用者数: 2 / 被调用者数: 6

```c

void FUN_00072f94(int param_1)

{
  undefined *puVar1;
  undefined *puVar2;
  undefined4 uVar3;
  int iVar4;
  undefined4 uVar5;
  int iVar6;
  uint uVar7;
  int iVar8;
  int iVar9;
  uint uVar10;
  uint uVar11;
  uint uVar12;
  undefined8 in_d0;
  undefined8 uVar13;
  undefined4 extraout_s1;
  undefined8 uVar14;
  undefined4 extraout_s1_00;
  undefined4 uVar15;
  undefined8 in_d1;
  undefined8 uVar16;
  undefined4 extraout_s3;
  undefined8 uVar17;
  undefined4 extraout_s3_00;
  undefined8 in_d2;
  undefined8 uVar18;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  undefined8 in_d3;
  undefined8 uVar19;
  undefined4 in_s9;
  undefined4 extraout_s9;
  undefined8 unaff_d9;
  undefined4 uVar20;
  undefined8 unaff_d10;
  undefined4 uVar21;
  uint local_424;
  uint local_420;
  undefined4 local_418;
  undefined1 local_414;
  undefined1 local_413;
  undefined1 local_412;
  undefined1 local_411;
  undefined4 uStack_410;
  undefined4 local_40c;
  undefined4 local_408;
  undefined4 local_404 [241];
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  iVar4 = *(int *)PTR____stack_chk_guard_004d9044;
  if (DAT_005a87a4 != (int *)0x0) {
    uVar5 = *(undefined4 *)PTR_DAT_004d9080;
    local_414 = (undefined1)uVar5;
    local_413 = (undefined1)((uint)uVar5 >> 8);
    local_412 = (undefined1)((uint)uVar5 >> 0x10);
    local_411 = (undefined1)((uint)uVar5 >> 0x18);
    iVar8 = *(int *)(param_1 + 4);
    iVar6 = *(int *)(iVar8 + 4);
    if (0 < iVar6) {
      local_420 = 0;
      do {
        iVar9 = *(int *)(*(int *)(iVar8 + 8) + local_420 * 4);
        uVar21 = (undefined4)((ulonglong)unaff_d10 >> 0x20);
        uVar14 = CONCAT44(uVar21,*(undefined4 *)(iVar9 + 4));
        uVar20 = (undefined4)((ulonglong)unaff_d9 >> 0x20);
        uVar5 = *(undefined4 *)(iVar9 + 8);
        uVar17 = CONCAT44(uVar20,uVar5);
        if ((int)local_420 < iVar6 + -1) {
          iVar6 = *(int *)(*(int *)(iVar8 + 8) + (local_420 | 1) * 4);
          uVar18 = FloatVectorSub(CONCAT44((int)((ulonglong)in_d2 >> 0x20),
                                           *(undefined4 *)(iVar6 + 4)),uVar14,2,0x20);
          uVar16 = FloatVectorSub(CONCAT44((int)((ulonglong)in_d1 >> 0x20),
                                           *(undefined4 *)(iVar6 + 8)),uVar17,2,0x20);
          uVar13 = FloatVectorSub(CONCAT44((int)((ulonglong)in_d0 >> 0x20),
                                           *(undefined4 *)(iVar6 + 0xc)),
                                  CONCAT44((int)((ulonglong)in_d3 >> 0x20),
                                           *(undefined4 *)(iVar9 + 0xc)),2,0x20);
          uStack_410 = (undefined4)uVar18;
          local_40c = (undefined4)uVar16;
          local_408 = (undefined4)uVar13;
        }
        local_424 = local_420 | 1;
        local_404[local_420 * 0x18] = *(undefined4 *)(iVar9 + 4);
        local_404[local_420 * 0x18 + 1] = uVar5;
        local_404[local_420 * 0x18 + 2] = *(undefined4 *)(param_1 + 0x10);
        local_404[local_420 * 0x18 + 10] = 0;
        local_404[local_420 * 0x18 + 0xb] = 0;
        local_404[local_420 * 0x18 + 3] = 0;
        local_404[local_420 * 0x18 + 4] = 0;
        local_404[local_420 * 0x18 + 5] = 0x3f800000;
        uVar7 = FUN_0031048c(&local_414);
        uVar10 = (uVar7 & 0xffff) >> 8;
        uVar11 = (uVar7 & 0xffffff) >> 0x10;
        uVar16 = FixedToFP(CONCAT44(uVar7 >> 0x18,uVar7 >> 0x18),0,1,0,0x20);
        uVar19 = FixedToFP(CONCAT44(uVar11,uVar11),0,1,0,0x20);
        uVar13 = FixedToFP(CONCAT44(uVar7,uVar7) & 0xff000000ff,0,1,0,0x20);
        uVar18 = FixedToFP(CONCAT44(uVar10,uVar10),0,1,0,0x20);
        local_404[local_420 * 0x18 + 6] = (int)uVar19;
        local_404[local_420 * 0x18 + 7] = (int)uVar18;
        local_404[local_420 * 0x18 + 8] = (int)uVar13;
        local_404[local_420 * 0x18 + 9] = (int)uVar16;
        FUN_00009b50((int)uVar13,&uStack_410);
        uVar7 = local_420 << 1 | 1;
        uVar13 = FloatVectorMult(CONCAT44(extraout_s1,local_408),0,2,0x20);
        uVar16 = FloatVectorSub(CONCAT44(extraout_s5,local_40c),uVar13,2,0x20);
        uVar13 = FloatVectorSub(uVar13,CONCAT44(extraout_s3,uStack_410),2,0x20);
        uVar16 = FloatVectorMult(uVar16,CONCAT44(extraout_s1,DAT_0052cda4),2,0x20);
        uVar13 = FloatVectorMult(CONCAT44(extraout_s1,DAT_0052cda4),uVar13,2,0x20);
        uVar14 = FloatVectorAdd(uVar14,uVar16,2);
        uVar17 = FloatVectorAdd(uVar17,uVar13,2);
        local_404[uVar7 * 0xc] = (int)uVar14;
        local_404[uVar7 * 0xc + 1] = (int)uVar17;
        local_404[uVar7 * 0xc + 2] = *(undefined4 *)(param_1 + 0x10);
        local_404[uVar7 * 0xc + 10] = 0;
        local_404[uVar7 * 0xc + 0xb] = 0x3f800000;
        local_404[uVar7 * 0xc + 3] = 0;
        local_404[uVar7 * 0xc + 4] = 0;
        local_404[uVar7 * 0xc + 5] = 0x3f800000;
        uVar10 = FUN_0031048c((int)uVar14,&local_414);
        uVar12 = (uVar10 & 0xffff) >> 8;
        uVar11 = (uVar10 & 0xffffff) >> 0x10;
        uVar17 = FixedToFP(CONCAT44(uVar10 >> 0x18,uVar10 >> 0x18),0,1,0,0x20);
        uVar14 = FixedToFP(CONCAT44(uVar10,uVar10) & 0xff000000ff,0,1,0,0x20);
        uVar16 = FixedToFP(CONCAT44(uVar11,uVar11),0,1,0,0x20);
        uVar13 = FixedToFP(CONCAT44(uVar12,uVar12),0,1,0,0x20);
        local_404[uVar7 * 0xc + 6] = (int)uVar16;
        local_404[uVar7 * 0xc + 7] = (int)uVar13;
        local_404[uVar7 * 0xc + 8] = (int)uVar14;
        local_404[uVar7 * 0xc + 9] = (int)uVar17;
        iVar8 = *(int *)(*(int *)(param_1 + 4) + 8);
        iVar6 = *(int *)(iVar8 + local_424 * 4);
        unaff_d10 = CONCAT44(uVar21,*(undefined4 *)(iVar6 + 4));
        uVar5 = *(undefined4 *)(iVar6 + 8);
        unaff_d9 = CONCAT44(uVar20,uVar5);
        if ((int)local_424 < *(int *)(*(int *)(param_1 + 4) + 4) + -1) {
          iVar8 = *(int *)(iVar8 + (local_420 + 2) * 4);
          uVar13 = FloatVectorSub(CONCAT44((int)((ulonglong)uVar13 >> 0x20),
                                           *(undefined4 *)(iVar8 + 4)),unaff_d10,2,0x20);
          uVar14 = FloatVectorSub(CONCAT44((int)((ulonglong)uVar14 >> 0x20),
                                           *(undefined4 *)(iVar8 + 8)),unaff_d9,2,0x20);
          uVar17 = FloatVectorSub(CONCAT44((int)((ulonglong)uVar17 >> 0x20),
                                           *(undefined4 *)(iVar8 + 0xc)),
                                  CONCAT44((int)((ulonglong)uVar16 >> 0x20),
                                           *(undefined4 *)(iVar6 + 0xc)),2,0x20);
          uStack_410 = (undefined4)uVar13;
          local_40c = (undefined4)uVar14;
          local_408 = (undefined4)uVar17;
        }
        local_420 = local_420 + 2;
        local_404[local_424 * 0x18] = *(undefined4 *)(iVar6 + 4);
        local_404[local_424 * 0x18 + 1] = uVar5;
        local_404[local_424 * 0x18 + 2] = *(undefined4 *)(param_1 + 0x10);
        local_404[local_424 * 0x18 + 10] = 0x3f800000;
        local_404[local_424 * 0x18 + 0xb] = 0;
        local_404[local_424 * 0x18 + 3] = 0;
        local_404[local_424 * 0x18 + 4] = 0;
        local_404[local_424 * 0x18 + 5] = 0x3f800000;
        uVar7 = FUN_0031048c((int)uVar17,&local_414);
        uVar10 = (uVar7 & 0xffff) >> 8;
        uVar11 = (uVar7 & 0xffffff) >> 0x10;
        uVar14 = FixedToFP(CONCAT44(uVar7 >> 0x18,uVar7 >> 0x18),0,1,0,0x20);
        uVar16 = FixedToFP(CONCAT44(uVar11,uVar11),0,1,0,0x20);
        uVar17 = FixedToFP(CONCAT44(uVar7,uVar7) & 0xff000000ff,0,1,0,0x20);
        uVar13 = FixedToFP(CONCAT44(uVar10,uVar10),0,1,0,0x20);
        local_404[local_424 * 0x18 + 6] = (int)uVar16;
        local_404[local_424 * 0x18 + 7] = (int)uVar13;
        local_404[local_424 * 0x18 + 8] = (int)uVar17;
        local_404[local_424 * 0x18 + 9] = (int)uVar14;
        FUN_00009b50((int)uVar17,&uStack_410);
        uVar7 = local_424 << 1 | 1;
        uVar17 = FloatVectorMult(CONCAT44(extraout_s3_00,local_408),0,2,0x20);
        uVar14 = FloatVectorSub(CONCAT44(extraout_s5_00,local_40c),uVar17,2,0x20);
        uVar17 = FloatVectorSub(uVar17,CONCAT44(extraout_s1_00,uStack_410),2,0x20);
        uVar13 = FloatVectorMult(uVar14,CONCAT44(extraout_s3_00,DAT_0052cda4),2,0x20);
        uVar14 = FloatVectorMult(CONCAT44(extraout_s3_00,DAT_0052cda4),uVar17,2,0x20);
        uVar17 = FloatVectorAdd(unaff_d10,uVar13,2);
        uVar14 = FloatVectorAdd(unaff_d9,uVar14,2);
        local_404[uVar7 * 0xc] = (int)uVar17;
        local_404[uVar7 * 0xc + 1] = (int)uVar14;
        local_404[uVar7 * 0xc + 2] = *(undefined4 *)(param_1 + 0x10);
        local_404[uVar7 * 0xc + 10] = 0x3f800000;
        local_404[uVar7 * 0xc + 0xb] = 0x3f800000;
        local_404[uVar7 * 0xc + 3] = 0;
        local_404[uVar7 * 0xc + 4] = 0;
        local_404[uVar7 * 0xc + 5] = 0x3f800000;
        uVar10 = FUN_0031048c((int)uVar17,&local_414);
        uVar12 = (uVar10 & 0xffff) >> 8;
        uVar11 = (uVar10 & 0xffffff) >> 0x10;
        in_d0 = FixedToFP(CONCAT44(uVar10 >> 0x18,uVar10 >> 0x18),0,1,0,0x20);
        in_d1 = FixedToFP(CONCAT44(uVar10,uVar10) & 0xff000000ff,0,1,0,0x20);
        in_d3 = FixedToFP(CONCAT44(uVar11,uVar11),0,1,0,0x20);
        in_d2 = FixedToFP(CONCAT44(uVar12,uVar12),0,1,0,0x20);
        local_404[uVar7 * 0xc + 6] = (int)in_d3;
        local_404[uVar7 * 0xc + 7] = (int)in_d2;
        local_404[uVar7 * 0xc + 8] = (int)in_d1;
        local_404[uVar7 * 0xc + 9] = (int)in_d0;
        iVar8 = *(int *)(param_1 + 4);
        iVar6 = *(int *)(iVar8 + 4);
        in_s9 = extraout_s9;
      } while ((int)local_420 < iVar6);
    }
    puVar2 = PTR_DAT_004d904c;
    uVar15 = (undefined4)((ulonglong)in_d0 >> 0x20);
    uVar17 = CONCAT44(uVar15,DAT_00073554);
    PTR_DAT_004d904c[0x18d4] = 0;
    uVar20 = DAT_0052be24;
    uVar5 = DAT_0052be20;
    *(undefined4 *)(puVar2 + 0x10a8) = DAT_0052be34;
    *(undefined4 *)(puVar2 + 0x10a4) = DAT_0052be30;
    uVar21 = DAT_0052be28;
    *(undefined4 *)(puVar2 + 0x10a0) = DAT_0052be2c;
    *(undefined4 *)(puVar2 + 0x109c) = uVar21;
    *(undefined4 *)(puVar2 + 0x1098) = uVar20;
    *(undefined4 *)(puVar2 + 0x1094) = uVar5;
    *(undefined4 *)(puVar2 + 0x10c0) = DAT_0052be4c;
    uVar5 = DAT_0052be44;
    *(undefined4 *)(puVar2 + 0x10bc) = DAT_0052be48;
    *(undefined4 *)(puVar2 + 0x10b8) = uVar5;
    uVar5 = DAT_0052be3c;
    *(undefined4 *)(puVar2 + 0x10b4) = DAT_0052be40;
    *(undefined4 *)(puVar2 + 0x10b0) = uVar5;
    *(undefined4 *)(puVar2 + 0x10ac) = DAT_0052be38;
    uVar21 = DAT_0052be58;
    uVar20 = DAT_0052be54;
    uVar5 = DAT_0052be50;
    *(undefined4 *)(puVar2 + 0x10d0) = DAT_0052be5c;
    *(undefined4 *)(puVar2 + 0x10cc) = uVar21;
    *(undefined4 *)(puVar2 + 0x10c8) = uVar20;
    *(undefined4 *)(puVar2 + 0x10c4) = uVar5;
    uVar21 = DAT_0052be30;
    uVar20 = DAT_0052be24;
    uVar5 = DAT_0052be20;
    *(undefined4 *)(puVar2 + 0x18a8) = DAT_0052be34;
    *(undefined4 *)(puVar2 + 0x18a4) = uVar21;
    uVar21 = DAT_0052be28;
    *(undefined4 *)(puVar2 + 0x18a0) = DAT_0052be2c;
    *(undefined4 *)(puVar2 + 0x189c) = uVar21;
    *(undefined4 *)(puVar2 + 0x1898) = uVar20;
    *(undefined4 *)(puVar2 + 0x1894) = uVar5;
    *(undefined4 *)(puVar2 + 0x18c0) = DAT_0052be4c;
    uVar3 = DAT_0052be44;
    uVar21 = DAT_0052be40;
    uVar20 = DAT_0052be3c;
    uVar5 = DAT_0052be38;
    *(undefined4 *)(puVar2 + 0x18bc) = DAT_0052be48;
    *(undefined4 *)(puVar2 + 0x18b8) = uVar3;
    *(undefined4 *)(puVar2 + 0x18b4) = uVar21;
    *(undefined4 *)(puVar2 + 0x18b0) = uVar20;
    *(undefined4 *)(puVar2 + 0x18ac) = uVar5;
    uVar21 = DAT_0052be58;
    uVar20 = DAT_0052be54;
    uVar5 = DAT_0052be50;
    *(undefined4 *)(puVar2 + 0x18d0) = DAT_0052be5c;
    uVar3 = DAT_0052ce60;
    *(undefined4 *)(puVar2 + 0x18cc) = uVar21;
    uVar14 = FloatVectorMult(CONCAT44(in_s9,uVar3),uVar17,2,0x20);
    *(undefined4 *)(puVar2 + 0x18c8) = uVar20;
    *(undefined4 *)(puVar2 + 0x18c4) = uVar5;
    uVar5 = (undefined4)((ulonglong)in_d2 >> 0x20);
    uVar13 = FloatVectorAdd(uVar14,CONCAT44((int)((ulonglong)in_d3 >> 0x20),
                                            *(undefined4 *)(puVar2 + 0x18c4)),2);
    uVar14 = CONCAT44((int)((ulonglong)in_d1 >> 0x20),DAT_0052ce68);
    uVar16 = FloatVectorMult(CONCAT44(uVar5,DAT_0052ce64),uVar17,2,0x20);
    *(int *)(puVar2 + 0x18c4) = (int)uVar13;
    uVar13 = FloatVectorAdd(uVar16,CONCAT44(uVar5,*(undefined4 *)(puVar2 + 0x18c8)),2);
    uVar17 = FloatVectorMult(uVar14,uVar17,2,0x20);
    *(int *)(puVar2 + 0x18c8) = (int)uVar13;
    uVar17 = FloatVectorAdd(uVar17,CONCAT44(uVar15,*(undefined4 *)(puVar2 + 0x18cc)),2);
    *(int *)(puVar2 + 0x18cc) = (int)uVar17;
    *(int *)(puVar2 + 0x18d8) = *(int *)(puVar2 + 0x18d8) + 2;
    FUN_002eec0c((int)uVar17,puVar2,1);
    (**(code **)(*DAT_005a87a4 + 8))();
    local_418 = 0;
    FUN_0033ab34(local_404,0x14,0,0,&local_418);
    FUN_00026ed0(&local_418);
    (**(code **)(*DAT_005a87a4 + 0xc))(DAT_005a87a4,1);
  }
  if (*(int *)puVar1 == iVar4) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

## FUN_0006f970 — 0006f970

- 函数名: FUN_0006f970
- 函数体: 17 字节
- 调用者数: 0 / 被调用者数: 2

```c

void FUN_0006f970(void *param_1)

{
  FUN_0006f994();
  operator_delete(param_1);
  return;
}


```

## FUN_0006f984 — 0006f984

- 函数名: FUN_0006f984
- 函数体: 13 字节
- 调用者数: 0 / 被调用者数: 1

```c

undefined4 FUN_0006f984(undefined4 param_1)

{
  FUN_0006f994();
  return param_1;
}


```

## FUN_00071f90 — 未找到

(函数未找到)

## FUN_00071d8c — 00071d8c

- 函数名: FUN_00071d8c
- 函数体: 25 字节
- 调用者数: 0 / 被调用者数: 1

```c

void FUN_00071d8c(int param_1,undefined4 param_2)

{
  if (*(int *)(param_1 + 0x54) == 0) {
    return;
  }
  FUN_000753fc(*(int *)(param_1 + 0x54),param_2);
  return;
}


```

## FUN_00074174 — 00075098

- 函数名: FUN_00075098
- 函数体: 229 字节
- 调用者数: 1 / 被调用者数: 3

```c

void FUN_00075098(float *param_1,undefined4 param_2)

{
  byte bVar1;
  undefined4 uVar2;
  char cVar3;
  float fVar4;
  undefined4 extraout_s1;
  undefined8 uVar5;
  undefined4 extraout_s3;
  float fVar6;
  undefined8 unaff_d8;
  undefined8 uVar7;
  
  if (*(char *)(param_1 + 2) == '\0') {
    return;
  }
  fVar6 = *param_1;
  uVar5 = CONCAT44((int)((ulonglong)unaff_d8 >> 0x20),fVar6);
  uVar7 = FloatVectorMult(CONCAT44(param_2,param_2),0x4080000040800000,2,0x20);
  if (PTR_DAT_004d9048[0x55] == '\0') {
    bVar1 = (byte)(((uint)(fVar6 == 0.0) << 0x1e) >> 0x18);
    cVar3 = -((char)((byte)(((uint)(fVar6 < 0.0) << 0x1f) >> 0x18) | bVar1) >> 7);
    if ((bool)(bVar1 >> 6) || (bool)cVar3 != NAN(fVar6)) {
      if (cVar3 == '\0') goto LAB_0007514a;
      uVar5 = FloatVectorAdd(uVar7,uVar5,2);
      fVar4 = 0.0;
      if ((int)((uint)((float)uVar5 < 0.0) << 0x1f) < 0) {
        fVar4 = (float)uVar5;
      }
    }
    else {
      uVar5 = FloatVectorSub(uVar5,uVar7,2,0x20);
      fVar4 = 0.0;
      if (0.0 < (float)uVar5) {
        fVar4 = (float)uVar5;
      }
    }
    *param_1 = fVar4;
  }
  else {
    uVar5 = FloatVectorSub(uVar5,uVar7,2,0x20);
    fVar4 = -1.0;
    if (-1.0 < (float)uVar5) {
      fVar4 = (float)uVar5;
    }
    *param_1 = fVar4;
    if (((int)((uint)(fVar4 < 0.0) << 0x1f) < 0) && (param_1[1] != -NAN)) {
      param_1[1] = -NAN;
      uVar2 = FUN_0030a1d8();
      FUN_0030a780(uVar2,param_1 + 2);
    }
  }
LAB_0007514a:
  if ((param_1[1] != 0.0) && (fVar6 != *param_1)) {
    uVar2 = FUN_0030a1d8();
    uVar5 = FloatVectorAbsolute(CONCAT44(extraout_s3,*param_1),4);
    uVar5 = FloatVectorMult(uVar5,CONCAT44(extraout_s1,DAT_00075180),2,0x20);
    FUN_0030a23c(uVar2,(int)uVar5);
  }
  return;
}


```

## FUN_00074168 — 00074168

- 函数名: FUN_00074168
- 函数体: 9 字节
- 调用者数: 0 / 被调用者数: 1

```c

void FUN_00074168(void *param_1)

{
  operator_delete(param_1);
  return;
}


```

## FUN_00074418 — 00074418

- 函数名: FUN_00074418
- 函数体: 11 字节
- 调用者数: 2 / 被调用者数: 0

```c

void FUN_00074418(int *param_1)

{
  (**(code **)(*param_1 + 0x18))();
  return;
}


```

## FUN_00074424 — 000753fc

- 函数名: FUN_000753fc
- 函数体: 791 字节
- 调用者数: 2 / 被调用者数: 7

```c

void FUN_000753fc(int param_1,undefined4 param_2)

{
  undefined *puVar1;
  undefined4 uVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int *piVar6;
  uint uVar7;
  uint uVar8;
  int iVar9;
  undefined4 extraout_s1;
  longlong lVar10;
  uint extraout_s1_00;
  uint extraout_s1_01;
  float fVar11;
  undefined4 extraout_s3;
  longlong lVar12;
  undefined4 extraout_s3_00;
  undefined4 extraout_s3_01;
  undefined4 uVar13;
  uint extraout_s3_02;
  uint extraout_s3_03;
  undefined4 extraout_s5;
  longlong lVar14;
  undefined4 extraout_s5_00;
  undefined4 extraout_s5_01;
  undefined4 uVar15;
  uint extraout_s5_02;
  undefined4 extraout_s5_03;
  undefined4 extraout_s7;
  undefined4 extraout_s7_00;
  undefined4 extraout_s7_01;
  undefined4 extraout_s7_02;
  undefined4 extraout_s7_03;
  undefined8 extraout_d4;
  longlong lVar16;
  longlong extraout_d5;
  longlong lVar17;
  undefined8 uVar18;
  ulonglong uVar19;
  undefined8 unaff_d14;
  undefined8 uVar20;
  ulonglong uVar21;
  undefined8 uVar22;
  undefined8 uVar23;
  undefined8 uVar24;
  undefined8 uVar25;
  undefined8 uVar26;
  undefined8 uVar27;
  undefined8 uVar28;
  undefined8 uVar29;
  undefined8 uVar30;
  undefined8 uVar31;
  undefined8 uVar32;
  undefined4 local_94;
  undefined4 local_90;
  undefined4 local_8c;
  int *local_88;
  undefined4 local_84;
  int *local_80;
  int *local_7c;
  undefined4 local_78;
  int *local_74;
  undefined4 local_70;
  undefined4 local_6c;
  undefined1 auStack_68 [8];
  
  uVar2 = FUN_003ecb20();
  FUN_003ed850(auStack_68,uVar2);
  uVar2 = FUN_003ecb20();
  FUN_003ed850(&local_70,uVar2);
  puVar1 = PTR_DAT_004d9050;
  local_7c = *(int **)(param_1 + 8);
  local_78 = *(undefined4 *)(param_1 + 0xc);
  lVar12 = CONCAT44(extraout_s3,local_6c);
  if (local_7c != (int *)0x0) {
    uVar25 = FloatVectorMult(lVar12,0x3f0000003f000000,2,0x20);
    uVar20 = CONCAT44((int)((ulonglong)unaff_d14 >> 0x20),DAT_00075718);
    uVar22 = FloatVectorMult(CONCAT44(extraout_s1,local_70),0x3f0000003f000000,2,0x20);
    lVar10 = CONCAT44(extraout_s1,DAT_00075714);
    uVar18 = CONCAT44(param_2,param_2);
    uVar28 = FloatVectorAdd(uVar22,lVar10,2);
    uVar22 = FloatVectorSub(uVar20,uVar22,2,0x20);
    uVar29 = FloatVectorAdd(uVar25,lVar10,2);
    uVar25 = FloatVectorSub(uVar20,uVar25,2,0x20);
    uVar2 = extraout_s7;
    local_74 = local_7c;
    uVar13 = extraout_s5;
    do {
      iVar9 = *local_74;
      if (*(int *)(iVar9 + 0x4c) != 0) {
        lVar10 = CONCAT44((int)((ulonglong)lVar10 >> 0x20),DAT_0052bfe0);
        lVar14 = CONCAT44(uVar13,DAT_0052bfe4);
        for (iVar3 = *(int *)(iVar9 + 0x260); *(int *)(iVar3 + 0x38) != 0;
            iVar3 = *(int *)(*(int *)(iVar3 + 0x38) + 4)) {
        }
        if (*(char *)(iVar3 + 0x48) != '\0') {
          iVar4 = *(int *)(iVar9 + 0x5f8);
          iVar5 = *(int *)(iVar4 + 0x38);
          iVar3 = iVar4;
          while (iVar5 != 0) {
            iVar3 = *(int *)(iVar5 + 4);
            iVar5 = *(int *)(iVar3 + 0x38);
          }
          fVar11 = *(float *)(iVar3 + 0x48);
          lVar12 = CONCAT44((int)((ulonglong)lVar12 >> 0x20),fVar11);
          if ((int)((uint)(fVar11 < (float)uVar22) << 0x1f) < 0) {
            uVar23 = FloatVectorSub(uVar22,lVar12,2,0x20);
            uVar24 = uVar22;
LAB_0007551c:
            lVar16 = FloatVectorAdd(lVar10,uVar23,2);
          }
          else {
            uVar24 = uVar28;
            lVar16 = lVar10;
            if ((float)uVar28 < fVar11) {
              uVar23 = FloatVectorSub(uVar28,lVar12,2,0x20);
              goto LAB_0007551c;
            }
          }
          fVar11 = *(float *)(iVar3 + 0x4c);
          uVar24 = CONCAT44((int)((ulonglong)uVar24 >> 0x20),fVar11);
          if ((int)((uint)(fVar11 < (float)uVar25) << 0x1f) < 0) {
            uVar23 = FloatVectorSub(uVar25,uVar24,2,0x20);
LAB_0007554e:
            lVar17 = FloatVectorAdd(lVar14,uVar23,2);
          }
          else {
            lVar17 = lVar14;
            if ((float)uVar29 < fVar11) {
              uVar23 = FloatVectorSub(uVar29,uVar24,2,0x20);
              goto LAB_0007554e;
            }
          }
          uVar23 = FloatVectorMult(lVar17,uVar18,2,0x20);
          uVar30 = FloatVectorMult(CONCAT44(uVar2,DAT_0052bfe8),uVar18,2,0x20);
          uVar26 = FloatVectorMult(lVar16,uVar18,2,0x20);
          local_84 = *(undefined4 *)(param_1 + 0xc);
          local_88 = *(int **)(param_1 + 8);
          uVar23 = FloatVectorMult(uVar23,0x4170000041700000,2,0x20);
          uVar31 = FloatVectorMult(uVar30,0x4170000041700000,2,0x20);
          uVar27 = FloatVectorMult(uVar26,0x4170000041700000,2,0x20);
          uVar30 = FloatVectorSub(lVar14,uVar23,2,0x20);
          uVar26 = FloatVectorSub(CONCAT44(uVar2,DAT_0052bfe8),uVar31,2,0x20);
          uVar23 = FloatVectorSub(lVar10,uVar27,2,0x20);
          local_80 = local_88;
          if (local_88 != (int *)0x0) {
            do {
              iVar5 = *local_80;
              piVar6 = local_80;
              if (iVar5 != iVar9) {
                piVar6 = *(int **)(iVar5 + 0x4c);
              }
              if (iVar5 != iVar9 && piVar6 != (int *)0x0) {
                for (iVar4 = *(int *)(iVar5 + 0x260); *(int *)(iVar4 + 0x38) != 0;
                    iVar4 = *(int *)(*(int *)(iVar4 + 0x38) + 4)) {
                }
                if (*(char *)(iVar4 + 0x48) != '\0') {
                  for (iVar5 = *(int *)(iVar5 + 0x5f8); *(int *)(iVar5 + 0x38) != 0;
                      iVar5 = *(int *)(*(int *)(iVar5 + 0x38) + 4)) {
                  }
                  uVar19 = FloatVectorSub(CONCAT44(uVar2,*(undefined4 *)(iVar5 + 0x48)),
                                          CONCAT44((int)((ulonglong)lVar12 >> 0x20),
                                                   *(undefined4 *)(iVar3 + 0x48)),2,0x20);
                  uVar21 = FloatVectorSub(CONCAT44((int)((ulonglong)lVar16 >> 0x20),
                                                   *(undefined4 *)(iVar5 + 0x4c)),
                                          CONCAT44((int)((ulonglong)uVar24 >> 0x20),
                                                   *(undefined4 *)(iVar3 + 0x4c)),2,0x20);
                  uVar27 = FloatVectorSub(CONCAT44((int)((ulonglong)lVar14 >> 0x20),
                                                   *(undefined4 *)(iVar5 + 0x50)),
                                          CONCAT44((int)((ulonglong)lVar10 >> 0x20),
                                                   *(undefined4 *)(iVar3 + 0x50)),2,0x20);
                  uVar32 = FloatVectorMult(uVar19,uVar19,2,0x20);
                  uVar24 = FloatVectorMult(uVar21,uVar21,2,0x20);
                  uVar31 = FloatVectorMult(uVar27,uVar27,2,0x20);
                  uVar24 = FloatVectorAdd(uVar32,uVar24,2);
                  uVar24 = FloatVectorAdd(uVar24,uVar31,2);
                  fVar11 = (float)uVar24;
                  if ((int)((uint)(fVar11 < DAT_0007571c) << 0x1f) < 0) {
                    if (fVar11 <= 0.0) {
                      lVar12 = (ulonglong)*(uint *)puVar1 * (ulonglong)*(uint *)(puVar1 + 8);
                      uVar8 = (uint)lVar12;
                      uVar7 = *(int *)(puVar1 + 4) * *(uint *)(puVar1 + 8) +
                              *(uint *)puVar1 * *(int *)(puVar1 + 0xc) +
                              (int)((ulonglong)lVar12 >> 0x20) + *(int *)(puVar1 + 0x14) +
                              (uint)CARRY4(uVar8,*(uint *)(puVar1 + 0x10));
                      uVar2 = (undefined4)((ulonglong)uVar7 * 0xff3a >> 0x20);
                      *(uint *)puVar1 = uVar8 + *(uint *)(puVar1 + 0x10);
                      *(uint *)(puVar1 + 4) = uVar7;
                      uVar7 = FUN_003010b8(uVar2,uVar7,(int)((ulonglong)uVar7 * 0xff3a));
                      uVar8 = FUN_003010d0(uVar2);
                      uVar27 = 0;
                      uVar24 = 0x3f8000003f800000;
                      uVar19 = (ulonglong)uVar7;
                      uVar21 = (ulonglong)uVar8;
                      uVar2 = extraout_s7_01;
                      uVar13 = extraout_s3_01;
                      uVar15 = extraout_s5_01;
                    }
                    else {
                      uVar2 = FUN_00301044(fVar11);
                      uVar24 = CONCAT44(uVar2,uVar2);
                      uVar2 = extraout_s7_00;
                      uVar13 = extraout_s3_00;
                      uVar15 = extraout_s5_00;
                    }
                    fVar11 = (float)uVar24;
                    uVar24 = FloatVectorSub(uVar20,uVar24,2,0x20);
                    uVar31 = FloatVectorMult(uVar24,CONCAT44(uVar15,(float)uVar21 / fVar11),2,0x20);
                    uVar32 = FloatVectorMult(CONCAT44(uVar13,(float)uVar19 / fVar11),uVar24,2,0x20);
                    uVar24 = FloatVectorMult(uVar24,CONCAT44(uVar2,(float)uVar27 / fVar11),2,0x20);
                    uVar27 = FloatVectorMult(uVar31,uVar18,2,0x20);
                    uVar31 = FloatVectorMult(uVar32,uVar18,2,0x20);
                    uVar24 = FloatVectorMult(uVar24,uVar18,2,0x20);
                    uVar27 = FloatVectorMult(uVar27,0x4170000041700000,2,0x20);
                    uVar32 = FloatVectorMult(uVar24,0x4170000041700000,2,0x20);
                    uVar24 = FloatVectorMult(uVar31,0x4170000041700000,2,0x20);
                    uVar30 = FloatVectorAdd(uVar30,uVar27,2);
                    uVar26 = FloatVectorAdd(uVar26,uVar32,2);
                    uVar23 = FloatVectorAdd(uVar23,uVar24,2);
                  }
                }
              }
              FUN_00075950(&local_88);
              lVar14 = (ulonglong)extraout_s5_02 << 0x20;
              lVar12 = (ulonglong)extraout_s3_02 << 0x20;
              lVar10 = (ulonglong)extraout_s1_00 << 0x20;
              uVar2 = extraout_s7_02;
              uVar24 = extraout_d4;
              lVar16 = extraout_d5;
            } while (local_80 != (int *)0x0);
            iVar4 = *(int *)(iVar9 + 0x5f8);
            lVar12 = CONCAT44(extraout_s3_02,*(undefined4 *)(iVar3 + 0x48));
            uVar24 = CONCAT44((int)((ulonglong)extraout_d4 >> 0x20),*(undefined4 *)(iVar3 + 0x4c));
          }
          uVar27 = FloatVectorSub(lVar12,uVar23,2,0x20);
          uVar23 = FloatVectorSub(uVar24,uVar30,2,0x20);
          uVar24 = FloatVectorSub(CONCAT44((int)((ulonglong)lVar10 >> 0x20),
                                           *(undefined4 *)(iVar3 + 0x50)),uVar26,2,0x20);
          local_94 = (undefined4)uVar27;
          local_90 = (undefined4)uVar23;
          local_8c = (undefined4)uVar24;
          FUN_0000606c(local_8c,iVar4,&local_94);
        }
      }
      FUN_00075950(&local_7c);
      lVar12 = (ulonglong)extraout_s3_03 << 0x20;
      lVar10 = (ulonglong)extraout_s1_01 << 0x20;
      uVar2 = extraout_s7_03;
      uVar13 = extraout_s5_03;
    } while (local_74 != (int *)0x0);
  }
  return;
}


```

## FUN_00074770 — 未找到

(函数未找到)

## FUN_0007479c — 未找到

(函数未找到)

## FUN_00074778 — 未找到

(函数未找到)

## FUN_000747a0 — 未找到

(函数未找到)

## FUN_000747a4 — 未找到

(函数未找到)

## FUN_0007477c — 未找到

(函数未找到)

## FUN_000747ac — 000747ac

- 函数名: FUN_000747ac
- 函数体: 13 字节
- 调用者数: 1 / 被调用者数: 1

```c

undefined4 FUN_000747ac(undefined4 param_1)

{
  FUN_000747bc();
  return param_1;
}


```

## FUN_00074798 — 00074798

- 函数名: FUN_00074798
- 函数体: 17 字节
- 调用者数: 0 / 被调用者数: 2

```c

void FUN_00074798(void *param_1)

{
  FUN_000747bc();
  operator_delete(param_1);
  return;
}


```

## FUN_00075ba8 — 00075ba8

- 函数名: FUN_00075ba8
- 函数体: 13 字节
- 调用者数: 0 / 被调用者数: 1

```c

undefined4 FUN_00075ba8(undefined4 param_1)

{
  FUN_00075bb8();
  return param_1;
}


```

## FUN_00075b94 — 00075b94

- 函数名: FUN_00075b94
- 函数体: 17 字节
- 调用者数: 0 / 被调用者数: 2

```c

void FUN_00075b94(undefined4 param_1)

{
  FUN_00075bb8();
  FUN_00084830(param_1);
  return;
}


```

