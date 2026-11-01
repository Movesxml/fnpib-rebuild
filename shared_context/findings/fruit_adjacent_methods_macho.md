# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0000e4e8 — 0000e4e8

- 函数名: FUN_0000e4e8
- 函数体: 65 字节
- 调用者数: 2 / 被调用者数: 4

```c

undefined4 FUN_0000e4e8(int param_1,undefined4 param_2)

{
  int *piVar1;
  undefined4 uVar2;
  int iVar3;
  undefined4 uVar4;
  
  uVar2 = FUN_00033ca0();
  iVar3 = FUN_000359cc(uVar2,param_2);
  uVar2 = 0;
  if (iVar3 == 1) {
    piVar1 = (int *)(param_1 + 0x40);
    if (*piVar1 != 0) {
      uVar2 = FUN_00033ca0();
      FUN_00036f4c(uVar2,*piVar1);
      *piVar1 = 0;
    }
    uVar4 = FUN_00033ca0();
    uVar2 = 1;
    iVar3 = FUN_00035a08(uVar4,param_2,piVar1,1);
    *piVar1 = iVar3;
  }
  return uVar2;
}


```

## FUN_0000f018 — 0000ff40

- 函数名: FUN_0000ff40
- 函数体: 786 字节
- 调用者数: 1 / 被调用者数: 3

```c

void FUN_0000ff40(int param_1,undefined4 param_2,int *param_3)

{
  undefined1 uVar1;
  undefined1 uVar2;
  undefined1 uVar3;
  int iVar4;
  undefined4 *puVar5;
  uint uVar6;
  undefined4 uVar7;
  undefined8 in_d0;
  longlong lVar8;
  uint extraout_s1;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  undefined4 extraout_s3_01;
  undefined8 in_d2;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  undefined4 extraout_s5_01;
  undefined4 in_s7;
  undefined4 extraout_s7;
  undefined4 extraout_s7_00;
  undefined4 extraout_s7_01;
  undefined4 in_s9;
  undefined4 extraout_s9;
  undefined4 extraout_s9_00;
  undefined4 extraout_s9_01;
  undefined4 extraout_s11;
  undefined4 extraout_s11_00;
  undefined4 extraout_s13;
  undefined4 extraout_s13_00;
  undefined4 extraout_s15;
  undefined8 uVar9;
  undefined8 uVar10;
  undefined4 uVar11;
  undefined8 unaff_d10;
  undefined8 unaff_d11;
  undefined8 unaff_d12;
  undefined8 unaff_d13;
  undefined8 unaff_d14;
  undefined8 unaff_d15;
  undefined4 uVar12;
  undefined8 uVar13;
  undefined8 uVar14;
  undefined8 uVar15;
  undefined8 uVar16;
  undefined8 uVar17;
  undefined8 uVar18;
  undefined8 uVar19;
  undefined1 local_90;
  undefined1 local_8f;
  undefined1 local_8e;
  undefined1 local_8d;
  undefined1 local_8c;
  undefined1 local_8b;
  undefined1 local_8a;
  undefined1 local_89;
  undefined4 local_88;
  undefined4 local_84;
  undefined4 local_7c;
  undefined4 local_78;
  undefined4 local_70;
  undefined4 local_6c;
  undefined1 uStack_64;
  undefined1 uStack_63;
  undefined1 uStack_62;
  undefined1 uStack_61;
  
  uVar7 = (undefined4)((ulonglong)in_d2 >> 0x20);
  lVar8 = CONCAT44((int)((ulonglong)in_d0 >> 0x20),*(float *)(param_1 + 0xd0));
  if (*(float *)(param_1 + 0xd0) <= 0.0) {
    uVar10 = 0;
    if (0 < *(int *)(param_1 + 0x84)) {
      uVar10 = 0;
      iVar4 = FUN_0001cd70();
      lVar8 = (ulonglong)extraout_s1 << 0x20;
      in_s7 = extraout_s7;
      in_s9 = extraout_s9;
      uVar7 = extraout_s5;
      if (iVar4 == 1) {
        puVar5 = &DAT_000102a4;
        if ((int)((uint)(*(float *)(param_1 + 0x10) < 0.0) << 0x1f) < 0) {
          puVar5 = &DAT_000102a8;
        }
        lVar8 = CONCAT44(extraout_s1,*puVar5);
        uVar10 = FloatVectorNeg(lVar8,2,2);
      }
    }
    uVar11 = 0x3f800000;
    uVar9 = 0;
    if ((float)uVar10 == 0.0) {
      uVar9 = 0x3f800000;
    }
    uVar13 = CONCAT44((int)((ulonglong)lVar8 >> 0x20),*(float *)(param_1 + 0x1c0));
    if ((int)((uint)(*(float *)(param_1 + 0x1c0) < 1.0) << 0x1f) < 0) {
      uVar6 = 0xffffff;
      uVar13 = FloatVectorSub(0x3f8000003f800000,uVar13,2,0x20);
      uVar13 = FloatVectorMult(uVar13,CONCAT44(0x3f800000,DAT_000102ac),2,0x20);
      uVar13 = FPToFixed(uVar13,0,0,3,0x20);
      iVar4 = (int)uVar13;
      if ((0 < iVar4) && (uVar6 = iVar4 << 0x18 | 0xffffff, 0xfe < iVar4)) {
        uVar6 = 0xffffffff;
      }
      uVar14 = FloatVectorMult(CONCAT44(in_s9,*(undefined4 *)(param_1 + 0xe8)),
                               CONCAT44(in_s7,DAT_000102b0),2,0x20);
      uVar13 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar13 >> 0x20),
                                        *(undefined4 *)(param_1 + 0x28)),
                               CONCAT44(in_s7,DAT_000102b0),2,0x20);
      uVar15 = FloatVectorMult(uVar10,uVar14,2,0x20);
      uVar14 = FloatVectorMult(uVar9,uVar14,2,0x20);
      uVar15 = FloatVectorMult(uVar15,CONCAT44(in_s9,DAT_000102b4),2,0x20);
      uVar14 = FloatVectorMult(uVar14,CONCAT44(in_s9,DAT_000102b4),2,0x20);
      uVar11 = (undefined4)uVar13;
      uVar13 = FloatVectorSub(CONCAT44(0x3f800000,*(undefined4 *)(param_1 + 0x10)),uVar15,2,0x20);
      uVar14 = FloatVectorSub(CONCAT44(uVar7,*(undefined4 *)(param_1 + 0x14)),uVar14,2,0x20);
      uStack_64 = (undefined1)uVar6;
      uStack_63 = (undefined1)(uVar6 >> 8);
      uVar13 = FloatVectorAdd(CONCAT44(in_s7,*(undefined4 *)(param_1 + 0xf4)),uVar13,2);
      uVar14 = FloatVectorAdd(uVar14,CONCAT44(uVar7,*(undefined4 *)(param_1 + 0xf8)),2);
      uStack_62 = (undefined1)(uVar6 >> 0x10);
      uStack_61 = (undefined1)(uVar6 >> 0x18);
      FUN_00039ca4(uVar11,param_2,(int)uVar13,(int)uVar14,uVar11,uVar11,&uStack_64);
      *param_3 = *param_3 + 1;
      uVar13 = CONCAT44(extraout_s1_00,*(undefined4 *)(param_1 + 0x1c0));
      uVar11 = extraout_s3;
    }
    if (0.0 < (float)uVar13) {
      uVar6 = 0xffffff;
      uVar13 = FloatVectorMult(uVar13,CONCAT44(uVar11,DAT_000102b8),2,0x20);
      uVar13 = FPToFixed(uVar13,0,0,3,0x20);
      iVar4 = (int)uVar13;
      if ((0 < iVar4) && (uVar6 = iVar4 << 0x18 | 0xffffff, 0xfe < iVar4)) {
        uVar6 = 0xffffffff;
      }
      uVar7 = *(undefined4 *)(param_1 + 0x28);
      uVar11 = *(undefined4 *)(param_1 + 0xe8);
      FUN_00014f24(&local_88,param_1 + 0x134);
      uVar18 = CONCAT44((int)((ulonglong)unaff_d14 >> 0x20),DAT_0052ce64);
      uVar15 = FloatVectorMult(CONCAT44(extraout_s15,DAT_0052ce60),
                               CONCAT44((int)((ulonglong)unaff_d11 >> 0x20),local_88),2,0x20);
      uVar14 = FloatVectorMult(uVar18,CONCAT44((int)((ulonglong)unaff_d12 >> 0x20),local_7c),2,0x20)
      ;
      uVar12 = (undefined4)((ulonglong)unaff_d15 >> 0x20);
      uVar19 = FloatVectorMult(CONCAT44(extraout_s15,DAT_0052ce60),CONCAT44(extraout_s13,local_84),2
                               ,0x20);
      uVar14 = FloatVectorAdd(uVar15,uVar14,2);
      uVar16 = FloatVectorMult(CONCAT44(extraout_s7_00,DAT_0052ce68),CONCAT44(extraout_s11,local_70)
                               ,2,0x20);
      uVar15 = FloatVectorMult(CONCAT44((int)((ulonglong)unaff_d10 >> 0x20),uVar11),
                               CONCAT44(extraout_s11,DAT_000102bc),2,0x20);
      uVar14 = FloatVectorAdd(uVar14,uVar16,2);
      uVar1 = (undefined1)(uVar6 >> 8);
      uVar17 = FloatVectorMult(uVar10,uVar15,2,0x20);
      uVar2 = (undefined1)(uVar6 >> 0x10);
      uVar10 = FloatVectorMult(uVar15,uVar14,2,0x20);
      uVar3 = (undefined1)(uVar6 >> 0x18);
      uVar10 = FloatVectorMult(uVar10,0x3f0000003f000000,2,0x20);
      uVar10 = FloatVectorAdd(CONCAT44(uVar12,*(undefined4 *)(param_1 + 0x10)),uVar10,2);
      uVar16 = CONCAT44(uVar12,DAT_000102c0);
      uVar14 = FloatVectorMult(uVar17,uVar16,2,0x20);
      uVar18 = FloatVectorMult(uVar18,CONCAT44((int)((ulonglong)unaff_d13 >> 0x20),local_78),2,0x20)
      ;
      uVar10 = FloatVectorSub(uVar10,uVar14,2,0x20);
      uVar18 = FloatVectorAdd(uVar19,uVar18,2);
      uVar17 = FloatVectorMult(CONCAT44(extraout_s7_00,DAT_0052ce68),
                               CONCAT44(extraout_s9_00,local_6c),2,0x20);
      uVar10 = FloatVectorAdd(uVar10,CONCAT44(extraout_s1_01,*(undefined4 *)(param_1 + 0xf4)),2);
      uVar18 = FloatVectorAdd(uVar18,uVar17,2);
      uVar17 = FloatVectorMult(uVar9,uVar15,2,0x20);
      uVar9 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar13 >> 0x20),uVar7),
                              CONCAT44(extraout_s11,DAT_000102bc),2,0x20);
      uVar18 = FloatVectorMult(uVar15,uVar18,2,0x20);
      uVar13 = FloatVectorMult(uVar17,uVar16,2,0x20);
      uVar7 = (undefined4)uVar9;
      uVar9 = FloatVectorMult(uVar18,0x3f0000003f000000,2,0x20);
      uVar9 = FloatVectorAdd(CONCAT44(extraout_s5_00,*(undefined4 *)(param_1 + 0x14)),uVar9,2);
      uVar9 = FloatVectorSub(uVar9,uVar13,2,0x20);
      uVar9 = FloatVectorAdd(CONCAT44(extraout_s3_00,*(undefined4 *)(param_1 + 0xf8)),uVar9,2);
      local_8c = (char)uVar6;
      local_8b = uVar1;
      local_8a = uVar2;
      local_89 = uVar3;
      FUN_00039ca4((int)uVar10,param_2,(int)uVar10,(int)uVar9,uVar7,uVar7,&local_8c);
      *param_3 = *param_3 + 1;
      FUN_00014f24(&local_88,param_1 + 0x144);
      uVar9 = FloatVectorMult(CONCAT44(extraout_s3_01,DAT_0052ce60),
                              CONCAT44(extraout_s11_00,local_88),2,0x20);
      uVar10 = FloatVectorMult(CONCAT44(extraout_s7_01,DAT_0052ce64),
                               CONCAT44(extraout_s13_00,local_7c),2,0x20);
      uVar18 = FloatVectorMult(CONCAT44(extraout_s3_01,DAT_0052ce60),
                               CONCAT44(extraout_s5_01,local_84),2,0x20);
      uVar10 = FloatVectorAdd(uVar9,uVar10,2);
      uVar9 = FloatVectorMult(CONCAT44(extraout_s7_01,DAT_0052ce64),
                              CONCAT44(extraout_s9_01,local_78),2,0x20);
      uVar9 = FloatVectorAdd(uVar18,uVar9,2);
      uVar18 = FloatVectorMult(CONCAT44(extraout_s1_02,DAT_0052ce68),
                               CONCAT44(extraout_s3_01,local_6c),2,0x20);
      uVar16 = FloatVectorMult(CONCAT44(extraout_s1_02,DAT_0052ce68),
                               CONCAT44(extraout_s3_01,local_70),2,0x20);
      uVar9 = FloatVectorAdd(uVar9,uVar18,2);
      uVar10 = FloatVectorAdd(uVar10,uVar16,2);
      uVar18 = FloatVectorMult(uVar15,uVar9,2,0x20);
      uVar10 = FloatVectorMult(uVar15,uVar10,2,0x20);
      uVar9 = FloatVectorMult(uVar10,0x3f0000003f000000,2,0x20);
      uVar10 = FloatVectorMult(uVar18,0x3f0000003f000000,2,0x20);
      uVar9 = FloatVectorAdd(CONCAT44(extraout_s7_01,*(undefined4 *)(param_1 + 0x11c)),uVar9,2);
      uVar10 = FloatVectorAdd(CONCAT44(extraout_s5_01,*(undefined4 *)(param_1 + 0x120)),uVar10,2);
      uVar9 = FloatVectorSub(uVar9,uVar14,2,0x20);
      uVar10 = FloatVectorSub(uVar10,uVar13,2,0x20);
      uVar9 = FloatVectorAdd(uVar9,CONCAT44(extraout_s3_01,*(undefined4 *)(param_1 + 0xf4)),2);
      uVar10 = FloatVectorAdd(CONCAT44(extraout_s1_02,*(undefined4 *)(param_1 + 0xf8)),uVar10,2);
      local_90 = (char)uVar6;
      local_8f = uVar1;
      local_8e = uVar2;
      local_8d = uVar3;
      FUN_00039ca4((int)uVar10,param_2,(int)uVar9,(int)uVar10,uVar7,uVar7,&local_90);
      *param_3 = *param_3 + 1;
    }
  }
  return;
}


```

## FUN_0000f130 — 0000ff40

- 函数名: FUN_0000ff40
- 函数体: 786 字节
- 调用者数: 1 / 被调用者数: 3

```c

void FUN_0000ff40(int param_1,undefined4 param_2,int *param_3)

{
  undefined1 uVar1;
  undefined1 uVar2;
  undefined1 uVar3;
  int iVar4;
  undefined4 *puVar5;
  uint uVar6;
  undefined4 uVar7;
  undefined8 in_d0;
  longlong lVar8;
  uint extraout_s1;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  undefined4 extraout_s3_01;
  undefined8 in_d2;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  undefined4 extraout_s5_01;
  undefined4 in_s7;
  undefined4 extraout_s7;
  undefined4 extraout_s7_00;
  undefined4 extraout_s7_01;
  undefined4 in_s9;
  undefined4 extraout_s9;
  undefined4 extraout_s9_00;
  undefined4 extraout_s9_01;
  undefined4 extraout_s11;
  undefined4 extraout_s11_00;
  undefined4 extraout_s13;
  undefined4 extraout_s13_00;
  undefined4 extraout_s15;
  undefined8 uVar9;
  undefined8 uVar10;
  undefined4 uVar11;
  undefined8 unaff_d10;
  undefined8 unaff_d11;
  undefined8 unaff_d12;
  undefined8 unaff_d13;
  undefined8 unaff_d14;
  undefined8 unaff_d15;
  undefined4 uVar12;
  undefined8 uVar13;
  undefined8 uVar14;
  undefined8 uVar15;
  undefined8 uVar16;
  undefined8 uVar17;
  undefined8 uVar18;
  undefined8 uVar19;
  undefined1 local_90;
  undefined1 local_8f;
  undefined1 local_8e;
  undefined1 local_8d;
  undefined1 local_8c;
  undefined1 local_8b;
  undefined1 local_8a;
  undefined1 local_89;
  undefined4 local_88;
  undefined4 local_84;
  undefined4 local_7c;
  undefined4 local_78;
  undefined4 local_70;
  undefined4 local_6c;
  undefined1 uStack_64;
  undefined1 uStack_63;
  undefined1 uStack_62;
  undefined1 uStack_61;
  
  uVar7 = (undefined4)((ulonglong)in_d2 >> 0x20);
  lVar8 = CONCAT44((int)((ulonglong)in_d0 >> 0x20),*(float *)(param_1 + 0xd0));
  if (*(float *)(param_1 + 0xd0) <= 0.0) {
    uVar10 = 0;
    if (0 < *(int *)(param_1 + 0x84)) {
      uVar10 = 0;
      iVar4 = FUN_0001cd70();
      lVar8 = (ulonglong)extraout_s1 << 0x20;
      in_s7 = extraout_s7;
      in_s9 = extraout_s9;
      uVar7 = extraout_s5;
      if (iVar4 == 1) {
        puVar5 = &DAT_000102a4;
        if ((int)((uint)(*(float *)(param_1 + 0x10) < 0.0) << 0x1f) < 0) {
          puVar5 = &DAT_000102a8;
        }
        lVar8 = CONCAT44(extraout_s1,*puVar5);
        uVar10 = FloatVectorNeg(lVar8,2,2);
      }
    }
    uVar11 = 0x3f800000;
    uVar9 = 0;
    if ((float)uVar10 == 0.0) {
      uVar9 = 0x3f800000;
    }
    uVar13 = CONCAT44((int)((ulonglong)lVar8 >> 0x20),*(float *)(param_1 + 0x1c0));
    if ((int)((uint)(*(float *)(param_1 + 0x1c0) < 1.0) << 0x1f) < 0) {
      uVar6 = 0xffffff;
      uVar13 = FloatVectorSub(0x3f8000003f800000,uVar13,2,0x20);
      uVar13 = FloatVectorMult(uVar13,CONCAT44(0x3f800000,DAT_000102ac),2,0x20);
      uVar13 = FPToFixed(uVar13,0,0,3,0x20);
      iVar4 = (int)uVar13;
      if ((0 < iVar4) && (uVar6 = iVar4 << 0x18 | 0xffffff, 0xfe < iVar4)) {
        uVar6 = 0xffffffff;
      }
      uVar14 = FloatVectorMult(CONCAT44(in_s9,*(undefined4 *)(param_1 + 0xe8)),
                               CONCAT44(in_s7,DAT_000102b0),2,0x20);
      uVar13 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar13 >> 0x20),
                                        *(undefined4 *)(param_1 + 0x28)),
                               CONCAT44(in_s7,DAT_000102b0),2,0x20);
      uVar15 = FloatVectorMult(uVar10,uVar14,2,0x20);
      uVar14 = FloatVectorMult(uVar9,uVar14,2,0x20);
      uVar15 = FloatVectorMult(uVar15,CONCAT44(in_s9,DAT_000102b4),2,0x20);
      uVar14 = FloatVectorMult(uVar14,CONCAT44(in_s9,DAT_000102b4),2,0x20);
      uVar11 = (undefined4)uVar13;
      uVar13 = FloatVectorSub(CONCAT44(0x3f800000,*(undefined4 *)(param_1 + 0x10)),uVar15,2,0x20);
      uVar14 = FloatVectorSub(CONCAT44(uVar7,*(undefined4 *)(param_1 + 0x14)),uVar14,2,0x20);
      uStack_64 = (undefined1)uVar6;
      uStack_63 = (undefined1)(uVar6 >> 8);
      uVar13 = FloatVectorAdd(CONCAT44(in_s7,*(undefined4 *)(param_1 + 0xf4)),uVar13,2);
      uVar14 = FloatVectorAdd(uVar14,CONCAT44(uVar7,*(undefined4 *)(param_1 + 0xf8)),2);
      uStack_62 = (undefined1)(uVar6 >> 0x10);
      uStack_61 = (undefined1)(uVar6 >> 0x18);
      FUN_00039ca4(uVar11,param_2,(int)uVar13,(int)uVar14,uVar11,uVar11,&uStack_64);
      *param_3 = *param_3 + 1;
      uVar13 = CONCAT44(extraout_s1_00,*(undefined4 *)(param_1 + 0x1c0));
      uVar11 = extraout_s3;
    }
    if (0.0 < (float)uVar13) {
      uVar6 = 0xffffff;
      uVar13 = FloatVectorMult(uVar13,CONCAT44(uVar11,DAT_000102b8),2,0x20);
      uVar13 = FPToFixed(uVar13,0,0,3,0x20);
      iVar4 = (int)uVar13;
      if ((0 < iVar4) && (uVar6 = iVar4 << 0x18 | 0xffffff, 0xfe < iVar4)) {
        uVar6 = 0xffffffff;
      }
      uVar7 = *(undefined4 *)(param_1 + 0x28);
      uVar11 = *(undefined4 *)(param_1 + 0xe8);
      FUN_00014f24(&local_88,param_1 + 0x134);
      uVar18 = CONCAT44((int)((ulonglong)unaff_d14 >> 0x20),DAT_0052ce64);
      uVar15 = FloatVectorMult(CONCAT44(extraout_s15,DAT_0052ce60),
                               CONCAT44((int)((ulonglong)unaff_d11 >> 0x20),local_88),2,0x20);
      uVar14 = FloatVectorMult(uVar18,CONCAT44((int)((ulonglong)unaff_d12 >> 0x20),local_7c),2,0x20)
      ;
      uVar12 = (undefined4)((ulonglong)unaff_d15 >> 0x20);
      uVar19 = FloatVectorMult(CONCAT44(extraout_s15,DAT_0052ce60),CONCAT44(extraout_s13,local_84),2
                               ,0x20);
      uVar14 = FloatVectorAdd(uVar15,uVar14,2);
      uVar16 = FloatVectorMult(CONCAT44(extraout_s7_00,DAT_0052ce68),CONCAT44(extraout_s11,local_70)
                               ,2,0x20);
      uVar15 = FloatVectorMult(CONCAT44((int)((ulonglong)unaff_d10 >> 0x20),uVar11),
                               CONCAT44(extraout_s11,DAT_000102bc),2,0x20);
      uVar14 = FloatVectorAdd(uVar14,uVar16,2);
      uVar1 = (undefined1)(uVar6 >> 8);
      uVar17 = FloatVectorMult(uVar10,uVar15,2,0x20);
      uVar2 = (undefined1)(uVar6 >> 0x10);
      uVar10 = FloatVectorMult(uVar15,uVar14,2,0x20);
      uVar3 = (undefined1)(uVar6 >> 0x18);
      uVar10 = FloatVectorMult(uVar10,0x3f0000003f000000,2,0x20);
      uVar10 = FloatVectorAdd(CONCAT44(uVar12,*(undefined4 *)(param_1 + 0x10)),uVar10,2);
      uVar16 = CONCAT44(uVar12,DAT_000102c0);
      uVar14 = FloatVectorMult(uVar17,uVar16,2,0x20);
      uVar18 = FloatVectorMult(uVar18,CONCAT44((int)((ulonglong)unaff_d13 >> 0x20),local_78),2,0x20)
      ;
      uVar10 = FloatVectorSub(uVar10,uVar14,2,0x20);
      uVar18 = FloatVectorAdd(uVar19,uVar18,2);
      uVar17 = FloatVectorMult(CONCAT44(extraout_s7_00,DAT_0052ce68),
                               CONCAT44(extraout_s9_00,local_6c),2,0x20);
      uVar10 = FloatVectorAdd(uVar10,CONCAT44(extraout_s1_01,*(undefined4 *)(param_1 + 0xf4)),2);
      uVar18 = FloatVectorAdd(uVar18,uVar17,2);
      uVar17 = FloatVectorMult(uVar9,uVar15,2,0x20);
      uVar9 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar13 >> 0x20),uVar7),
                              CONCAT44(extraout_s11,DAT_000102bc),2,0x20);
      uVar18 = FloatVectorMult(uVar15,uVar18,2,0x20);
      uVar13 = FloatVectorMult(uVar17,uVar16,2,0x20);
      uVar7 = (undefined4)uVar9;
      uVar9 = FloatVectorMult(uVar18,0x3f0000003f000000,2,0x20);
      uVar9 = FloatVectorAdd(CONCAT44(extraout_s5_00,*(undefined4 *)(param_1 + 0x14)),uVar9,2);
      uVar9 = FloatVectorSub(uVar9,uVar13,2,0x20);
      uVar9 = FloatVectorAdd(CONCAT44(extraout_s3_00,*(undefined4 *)(param_1 + 0xf8)),uVar9,2);
      local_8c = (char)uVar6;
      local_8b = uVar1;
      local_8a = uVar2;
      local_89 = uVar3;
      FUN_00039ca4((int)uVar10,param_2,(int)uVar10,(int)uVar9,uVar7,uVar7,&local_8c);
      *param_3 = *param_3 + 1;
      FUN_00014f24(&local_88,param_1 + 0x144);
      uVar9 = FloatVectorMult(CONCAT44(extraout_s3_01,DAT_0052ce60),
                              CONCAT44(extraout_s11_00,local_88),2,0x20);
      uVar10 = FloatVectorMult(CONCAT44(extraout_s7_01,DAT_0052ce64),
                               CONCAT44(extraout_s13_00,local_7c),2,0x20);
      uVar18 = FloatVectorMult(CONCAT44(extraout_s3_01,DAT_0052ce60),
                               CONCAT44(extraout_s5_01,local_84),2,0x20);
      uVar10 = FloatVectorAdd(uVar9,uVar10,2);
      uVar9 = FloatVectorMult(CONCAT44(extraout_s7_01,DAT_0052ce64),
                              CONCAT44(extraout_s9_01,local_78),2,0x20);
      uVar9 = FloatVectorAdd(uVar18,uVar9,2);
      uVar18 = FloatVectorMult(CONCAT44(extraout_s1_02,DAT_0052ce68),
                               CONCAT44(extraout_s3_01,local_6c),2,0x20);
      uVar16 = FloatVectorMult(CONCAT44(extraout_s1_02,DAT_0052ce68),
                               CONCAT44(extraout_s3_01,local_70),2,0x20);
      uVar9 = FloatVectorAdd(uVar9,uVar18,2);
      uVar10 = FloatVectorAdd(uVar10,uVar16,2);
      uVar18 = FloatVectorMult(uVar15,uVar9,2,0x20);
      uVar10 = FloatVectorMult(uVar15,uVar10,2,0x20);
      uVar9 = FloatVectorMult(uVar10,0x3f0000003f000000,2,0x20);
      uVar10 = FloatVectorMult(uVar18,0x3f0000003f000000,2,0x20);
      uVar9 = FloatVectorAdd(CONCAT44(extraout_s7_01,*(undefined4 *)(param_1 + 0x11c)),uVar9,2);
      uVar10 = FloatVectorAdd(CONCAT44(extraout_s5_01,*(undefined4 *)(param_1 + 0x120)),uVar10,2);
      uVar9 = FloatVectorSub(uVar9,uVar14,2,0x20);
      uVar10 = FloatVectorSub(uVar10,uVar13,2,0x20);
      uVar9 = FloatVectorAdd(uVar9,CONCAT44(extraout_s3_01,*(undefined4 *)(param_1 + 0xf4)),2);
      uVar10 = FloatVectorAdd(CONCAT44(extraout_s1_02,*(undefined4 *)(param_1 + 0xf8)),uVar10,2);
      local_90 = (char)uVar6;
      local_8f = uVar1;
      local_8e = uVar2;
      local_8d = uVar3;
      FUN_00039ca4((int)uVar10,param_2,(int)uVar9,(int)uVar10,uVar7,uVar7,&local_90);
      *param_3 = *param_3 + 1;
    }
  }
  return;
}


```

## FUN_0000f1e0 — 0000ff40

- 函数名: FUN_0000ff40
- 函数体: 786 字节
- 调用者数: 1 / 被调用者数: 3

```c

void FUN_0000ff40(int param_1,undefined4 param_2,int *param_3)

{
  undefined1 uVar1;
  undefined1 uVar2;
  undefined1 uVar3;
  int iVar4;
  undefined4 *puVar5;
  uint uVar6;
  undefined4 uVar7;
  undefined8 in_d0;
  longlong lVar8;
  uint extraout_s1;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  undefined4 extraout_s3_01;
  undefined8 in_d2;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  undefined4 extraout_s5_01;
  undefined4 in_s7;
  undefined4 extraout_s7;
  undefined4 extraout_s7_00;
  undefined4 extraout_s7_01;
  undefined4 in_s9;
  undefined4 extraout_s9;
  undefined4 extraout_s9_00;
  undefined4 extraout_s9_01;
  undefined4 extraout_s11;
  undefined4 extraout_s11_00;
  undefined4 extraout_s13;
  undefined4 extraout_s13_00;
  undefined4 extraout_s15;
  undefined8 uVar9;
  undefined8 uVar10;
  undefined4 uVar11;
  undefined8 unaff_d10;
  undefined8 unaff_d11;
  undefined8 unaff_d12;
  undefined8 unaff_d13;
  undefined8 unaff_d14;
  undefined8 unaff_d15;
  undefined4 uVar12;
  undefined8 uVar13;
  undefined8 uVar14;
  undefined8 uVar15;
  undefined8 uVar16;
  undefined8 uVar17;
  undefined8 uVar18;
  undefined8 uVar19;
  undefined1 local_90;
  undefined1 local_8f;
  undefined1 local_8e;
  undefined1 local_8d;
  undefined1 local_8c;
  undefined1 local_8b;
  undefined1 local_8a;
  undefined1 local_89;
  undefined4 local_88;
  undefined4 local_84;
  undefined4 local_7c;
  undefined4 local_78;
  undefined4 local_70;
  undefined4 local_6c;
  undefined1 uStack_64;
  undefined1 uStack_63;
  undefined1 uStack_62;
  undefined1 uStack_61;
  
  uVar7 = (undefined4)((ulonglong)in_d2 >> 0x20);
  lVar8 = CONCAT44((int)((ulonglong)in_d0 >> 0x20),*(float *)(param_1 + 0xd0));
  if (*(float *)(param_1 + 0xd0) <= 0.0) {
    uVar10 = 0;
    if (0 < *(int *)(param_1 + 0x84)) {
      uVar10 = 0;
      iVar4 = FUN_0001cd70();
      lVar8 = (ulonglong)extraout_s1 << 0x20;
      in_s7 = extraout_s7;
      in_s9 = extraout_s9;
      uVar7 = extraout_s5;
      if (iVar4 == 1) {
        puVar5 = &DAT_000102a4;
        if ((int)((uint)(*(float *)(param_1 + 0x10) < 0.0) << 0x1f) < 0) {
          puVar5 = &DAT_000102a8;
        }
        lVar8 = CONCAT44(extraout_s1,*puVar5);
        uVar10 = FloatVectorNeg(lVar8,2,2);
      }
    }
    uVar11 = 0x3f800000;
    uVar9 = 0;
    if ((float)uVar10 == 0.0) {
      uVar9 = 0x3f800000;
    }
    uVar13 = CONCAT44((int)((ulonglong)lVar8 >> 0x20),*(float *)(param_1 + 0x1c0));
    if ((int)((uint)(*(float *)(param_1 + 0x1c0) < 1.0) << 0x1f) < 0) {
      uVar6 = 0xffffff;
      uVar13 = FloatVectorSub(0x3f8000003f800000,uVar13,2,0x20);
      uVar13 = FloatVectorMult(uVar13,CONCAT44(0x3f800000,DAT_000102ac),2,0x20);
      uVar13 = FPToFixed(uVar13,0,0,3,0x20);
      iVar4 = (int)uVar13;
      if ((0 < iVar4) && (uVar6 = iVar4 << 0x18 | 0xffffff, 0xfe < iVar4)) {
        uVar6 = 0xffffffff;
      }
      uVar14 = FloatVectorMult(CONCAT44(in_s9,*(undefined4 *)(param_1 + 0xe8)),
                               CONCAT44(in_s7,DAT_000102b0),2,0x20);
      uVar13 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar13 >> 0x20),
                                        *(undefined4 *)(param_1 + 0x28)),
                               CONCAT44(in_s7,DAT_000102b0),2,0x20);
      uVar15 = FloatVectorMult(uVar10,uVar14,2,0x20);
      uVar14 = FloatVectorMult(uVar9,uVar14,2,0x20);
      uVar15 = FloatVectorMult(uVar15,CONCAT44(in_s9,DAT_000102b4),2,0x20);
      uVar14 = FloatVectorMult(uVar14,CONCAT44(in_s9,DAT_000102b4),2,0x20);
      uVar11 = (undefined4)uVar13;
      uVar13 = FloatVectorSub(CONCAT44(0x3f800000,*(undefined4 *)(param_1 + 0x10)),uVar15,2,0x20);
      uVar14 = FloatVectorSub(CONCAT44(uVar7,*(undefined4 *)(param_1 + 0x14)),uVar14,2,0x20);
      uStack_64 = (undefined1)uVar6;
      uStack_63 = (undefined1)(uVar6 >> 8);
      uVar13 = FloatVectorAdd(CONCAT44(in_s7,*(undefined4 *)(param_1 + 0xf4)),uVar13,2);
      uVar14 = FloatVectorAdd(uVar14,CONCAT44(uVar7,*(undefined4 *)(param_1 + 0xf8)),2);
      uStack_62 = (undefined1)(uVar6 >> 0x10);
      uStack_61 = (undefined1)(uVar6 >> 0x18);
      FUN_00039ca4(uVar11,param_2,(int)uVar13,(int)uVar14,uVar11,uVar11,&uStack_64);
      *param_3 = *param_3 + 1;
      uVar13 = CONCAT44(extraout_s1_00,*(undefined4 *)(param_1 + 0x1c0));
      uVar11 = extraout_s3;
    }
    if (0.0 < (float)uVar13) {
      uVar6 = 0xffffff;
      uVar13 = FloatVectorMult(uVar13,CONCAT44(uVar11,DAT_000102b8),2,0x20);
      uVar13 = FPToFixed(uVar13,0,0,3,0x20);
      iVar4 = (int)uVar13;
      if ((0 < iVar4) && (uVar6 = iVar4 << 0x18 | 0xffffff, 0xfe < iVar4)) {
        uVar6 = 0xffffffff;
      }
      uVar7 = *(undefined4 *)(param_1 + 0x28);
      uVar11 = *(undefined4 *)(param_1 + 0xe8);
      FUN_00014f24(&local_88,param_1 + 0x134);
      uVar18 = CONCAT44((int)((ulonglong)unaff_d14 >> 0x20),DAT_0052ce64);
      uVar15 = FloatVectorMult(CONCAT44(extraout_s15,DAT_0052ce60),
                               CONCAT44((int)((ulonglong)unaff_d11 >> 0x20),local_88),2,0x20);
      uVar14 = FloatVectorMult(uVar18,CONCAT44((int)((ulonglong)unaff_d12 >> 0x20),local_7c),2,0x20)
      ;
      uVar12 = (undefined4)((ulonglong)unaff_d15 >> 0x20);
      uVar19 = FloatVectorMult(CONCAT44(extraout_s15,DAT_0052ce60),CONCAT44(extraout_s13,local_84),2
                               ,0x20);
      uVar14 = FloatVectorAdd(uVar15,uVar14,2);
      uVar16 = FloatVectorMult(CONCAT44(extraout_s7_00,DAT_0052ce68),CONCAT44(extraout_s11,local_70)
                               ,2,0x20);
      uVar15 = FloatVectorMult(CONCAT44((int)((ulonglong)unaff_d10 >> 0x20),uVar11),
                               CONCAT44(extraout_s11,DAT_000102bc),2,0x20);
      uVar14 = FloatVectorAdd(uVar14,uVar16,2);
      uVar1 = (undefined1)(uVar6 >> 8);
      uVar17 = FloatVectorMult(uVar10,uVar15,2,0x20);
      uVar2 = (undefined1)(uVar6 >> 0x10);
      uVar10 = FloatVectorMult(uVar15,uVar14,2,0x20);
      uVar3 = (undefined1)(uVar6 >> 0x18);
      uVar10 = FloatVectorMult(uVar10,0x3f0000003f000000,2,0x20);
      uVar10 = FloatVectorAdd(CONCAT44(uVar12,*(undefined4 *)(param_1 + 0x10)),uVar10,2);
      uVar16 = CONCAT44(uVar12,DAT_000102c0);
      uVar14 = FloatVectorMult(uVar17,uVar16,2,0x20);
      uVar18 = FloatVectorMult(uVar18,CONCAT44((int)((ulonglong)unaff_d13 >> 0x20),local_78),2,0x20)
      ;
      uVar10 = FloatVectorSub(uVar10,uVar14,2,0x20);
      uVar18 = FloatVectorAdd(uVar19,uVar18,2);
      uVar17 = FloatVectorMult(CONCAT44(extraout_s7_00,DAT_0052ce68),
                               CONCAT44(extraout_s9_00,local_6c),2,0x20);
      uVar10 = FloatVectorAdd(uVar10,CONCAT44(extraout_s1_01,*(undefined4 *)(param_1 + 0xf4)),2);
      uVar18 = FloatVectorAdd(uVar18,uVar17,2);
      uVar17 = FloatVectorMult(uVar9,uVar15,2,0x20);
      uVar9 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar13 >> 0x20),uVar7),
                              CONCAT44(extraout_s11,DAT_000102bc),2,0x20);
      uVar18 = FloatVectorMult(uVar15,uVar18,2,0x20);
      uVar13 = FloatVectorMult(uVar17,uVar16,2,0x20);
      uVar7 = (undefined4)uVar9;
      uVar9 = FloatVectorMult(uVar18,0x3f0000003f000000,2,0x20);
      uVar9 = FloatVectorAdd(CONCAT44(extraout_s5_00,*(undefined4 *)(param_1 + 0x14)),uVar9,2);
      uVar9 = FloatVectorSub(uVar9,uVar13,2,0x20);
      uVar9 = FloatVectorAdd(CONCAT44(extraout_s3_00,*(undefined4 *)(param_1 + 0xf8)),uVar9,2);
      local_8c = (char)uVar6;
      local_8b = uVar1;
      local_8a = uVar2;
      local_89 = uVar3;
      FUN_00039ca4((int)uVar10,param_2,(int)uVar10,(int)uVar9,uVar7,uVar7,&local_8c);
      *param_3 = *param_3 + 1;
      FUN_00014f24(&local_88,param_1 + 0x144);
      uVar9 = FloatVectorMult(CONCAT44(extraout_s3_01,DAT_0052ce60),
                              CONCAT44(extraout_s11_00,local_88),2,0x20);
      uVar10 = FloatVectorMult(CONCAT44(extraout_s7_01,DAT_0052ce64),
                               CONCAT44(extraout_s13_00,local_7c),2,0x20);
      uVar18 = FloatVectorMult(CONCAT44(extraout_s3_01,DAT_0052ce60),
                               CONCAT44(extraout_s5_01,local_84),2,0x20);
      uVar10 = FloatVectorAdd(uVar9,uVar10,2);
      uVar9 = FloatVectorMult(CONCAT44(extraout_s7_01,DAT_0052ce64),
                              CONCAT44(extraout_s9_01,local_78),2,0x20);
      uVar9 = FloatVectorAdd(uVar18,uVar9,2);
      uVar18 = FloatVectorMult(CONCAT44(extraout_s1_02,DAT_0052ce68),
                               CONCAT44(extraout_s3_01,local_6c),2,0x20);
      uVar16 = FloatVectorMult(CONCAT44(extraout_s1_02,DAT_0052ce68),
                               CONCAT44(extraout_s3_01,local_70),2,0x20);
      uVar9 = FloatVectorAdd(uVar9,uVar18,2);
      uVar10 = FloatVectorAdd(uVar10,uVar16,2);
      uVar18 = FloatVectorMult(uVar15,uVar9,2,0x20);
      uVar10 = FloatVectorMult(uVar15,uVar10,2,0x20);
      uVar9 = FloatVectorMult(uVar10,0x3f0000003f000000,2,0x20);
      uVar10 = FloatVectorMult(uVar18,0x3f0000003f000000,2,0x20);
      uVar9 = FloatVectorAdd(CONCAT44(extraout_s7_01,*(undefined4 *)(param_1 + 0x11c)),uVar9,2);
      uVar10 = FloatVectorAdd(CONCAT44(extraout_s5_01,*(undefined4 *)(param_1 + 0x120)),uVar10,2);
      uVar9 = FloatVectorSub(uVar9,uVar14,2,0x20);
      uVar10 = FloatVectorSub(uVar10,uVar13,2,0x20);
      uVar9 = FloatVectorAdd(uVar9,CONCAT44(extraout_s3_01,*(undefined4 *)(param_1 + 0xf4)),2);
      uVar10 = FloatVectorAdd(CONCAT44(extraout_s1_02,*(undefined4 *)(param_1 + 0xf8)),uVar10,2);
      local_90 = (char)uVar6;
      local_8f = uVar1;
      local_8e = uVar2;
      local_8d = uVar3;
      FUN_00039ca4((int)uVar10,param_2,(int)uVar9,(int)uVar10,uVar7,uVar7,&local_90);
      *param_3 = *param_3 + 1;
    }
  }
  return;
}


```

## FUN_0000f2e0 — 000102c4

- 函数名: FUN_000102c4
- 函数体: 1235 字节
- 调用者数: 1 / 被调用者数: 10

```c

void FUN_000102c4(void)

{
  undefined *puVar1;
  undefined *puVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  int iVar6;
  undefined4 uVar7;
  int iVar8;
  int *piVar9;
  undefined1 **ppuVar10;
  undefined4 local_c044;
  undefined4 local_c040;
  undefined4 local_c03c;
  undefined1 *puStack_c038;
  undefined1 auStack_c034 [24576];
  int local_6034;
  undefined1 *puStack_6030;
  undefined1 auStack_602c [24576];
  int aiStack_2c [3];
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  iVar6 = *(int *)PTR____stack_chk_guard_004d9044;
  if (((int *)DAT_00556ca0 != (int *)0x0) || (DAT_00556ca0._4_4_ != (int *)0x0)) {
    puStack_6030 = auStack_602c;
    aiStack_2c[0] = 0;
    local_6034 = 0;
    puStack_c038 = auStack_c034;
    local_c03c = 0;
    uVar7 = FUN_000065c4();
    iVar8 = FUN_00006ad0(uVar7,1,&local_c03c);
    if (iVar8 != 0) {
      do {
        if ((0.0 < *(float *)(iVar8 + 0x28)) && ((*(byte *)(iVar8 + 0xc) & 1) == 0)) {
          ppuVar10 = &puStack_c038;
          piVar9 = &local_6034;
          if (*(char *)(iVar8 + 0x1b8) == '\0') {
            ppuVar10 = &puStack_6030;
            piVar9 = aiStack_2c;
          }
          FUN_0000ff40(iVar8,ppuVar10,piVar9);
        }
        uVar7 = FUN_000065c4();
        iVar8 = FUN_00006af0(uVar7,1,&local_c03c);
      } while (iVar8 != 0);
    }
    uVar7 = FUN_000065c4();
    iVar8 = FUN_00006ad0(uVar7,2,&local_c03c);
    if (iVar8 != 0) {
      do {
        if (((0.0 < *(float *)(iVar8 + 0x28)) && ((*(byte *)(iVar8 + 0xc) & 1) == 0)) &&
           (*(char *)(iVar8 + 0x98) != '\0')) {
          FUN_00008a70(iVar8,&puStack_c038,&local_6034);
        }
        uVar7 = FUN_000065c4();
        iVar8 = FUN_00006af0(uVar7,2,&local_c03c);
      } while (iVar8 != 0);
    }
    piVar9 = (int *)FUN_002eddd0();
    uVar7 = (**(code **)(*piVar9 + 0x44))();
    piVar9 = (int *)FUN_002eddd0();
    (**(code **)(*piVar9 + 0x30))(piVar9,0);
    if (((int *)DAT_00556ca0 != (int *)0x0) && (iVar8 = aiStack_2c[0] * 6 + -1, 0 < iVar8)) {
      (**(code **)(*(int *)DAT_00556ca0 + 8))();
      puVar2 = PTR_DAT_004d904c;
      PTR_DAT_004d904c[0x18d4] = 0;
      uVar4 = DAT_0052be24;
      uVar3 = DAT_0052be20;
      *(undefined4 *)(puVar2 + 0x10a8) = DAT_0052be34;
      *(undefined4 *)(puVar2 + 0x10a4) = DAT_0052be30;
      uVar5 = DAT_0052be28;
      *(undefined4 *)(puVar2 + 0x10a0) = DAT_0052be2c;
      *(undefined4 *)(puVar2 + 0x109c) = uVar5;
      *(undefined4 *)(puVar2 + 0x1098) = uVar4;
      *(undefined4 *)(puVar2 + 0x1094) = uVar3;
      *(undefined4 *)(puVar2 + 0x10c0) = DAT_0052be4c;
      uVar3 = DAT_0052be44;
      *(undefined4 *)(puVar2 + 0x10bc) = DAT_0052be48;
      *(undefined4 *)(puVar2 + 0x10b8) = uVar3;
      uVar3 = DAT_0052be3c;
      *(undefined4 *)(puVar2 + 0x10b4) = DAT_0052be40;
      *(undefined4 *)(puVar2 + 0x10b0) = uVar3;
      *(undefined4 *)(puVar2 + 0x10ac) = DAT_0052be38;
      uVar5 = DAT_0052be58;
      uVar4 = DAT_0052be54;
      uVar3 = DAT_0052be50;
      *(undefined4 *)(puVar2 + 0x10d0) = DAT_0052be5c;
      *(undefined4 *)(puVar2 + 0x10cc) = uVar5;
      *(undefined4 *)(puVar2 + 0x10c8) = uVar4;
      *(undefined4 *)(puVar2 + 0x10c4) = uVar3;
      uVar5 = DAT_0052be30;
      uVar4 = DAT_0052be24;
      uVar3 = DAT_0052be20;
      *(undefined4 *)(puVar2 + 0x18a8) = DAT_0052be34;
      *(undefined4 *)(puVar2 + 0x18a4) = uVar5;
      uVar5 = DAT_0052be28;
      *(undefined4 *)(puVar2 + 0x18a0) = DAT_0052be2c;
      *(undefined4 *)(puVar2 + 0x189c) = uVar5;
      *(undefined4 *)(puVar2 + 0x1898) = uVar4;
      *(undefined4 *)(puVar2 + 0x1894) = uVar3;
      *(undefined4 *)(puVar2 + 0x18c0) = DAT_0052be4c;
      *(undefined4 *)(puVar2 + 0x18bc) = DAT_0052be48;
      uVar3 = DAT_0052be40;
      *(undefined4 *)(puVar2 + 0x18b8) = DAT_0052be44;
      *(undefined4 *)(puVar2 + 0x18b4) = uVar3;
      uVar3 = DAT_0052be38;
      *(undefined4 *)(puVar2 + 0x18b0) = DAT_0052be3c;
      *(undefined4 *)(puVar2 + 0x18ac) = uVar3;
      uVar5 = DAT_0052be58;
      uVar4 = DAT_0052be54;
      uVar3 = DAT_0052be50;
      *(undefined4 *)(puVar2 + 0x18d0) = DAT_0052be5c;
      *(undefined4 *)(puVar2 + 0x18cc) = uVar5;
      *(undefined4 *)(puVar2 + 0x18c8) = uVar4;
      *(undefined4 *)(puVar2 + 0x18c4) = uVar3;
      *(int *)(puVar2 + 0x18d8) = *(int *)(puVar2 + 0x18d8) + 1;
      FUN_002eec0c(puVar2,1);
      local_c040 = 0;
      FUN_0033ab34(auStack_602c,iVar8,0,0,&local_c040);
      FUN_00026ed0(&local_c040);
      (**(code **)(*(int *)DAT_00556ca0 + 0xc))((int *)DAT_00556ca0,1);
    }
    if ((DAT_00556ca0._4_4_ != (int *)0x0) && (0 < local_6034 * 6 + -1)) {
      (**(code **)(*DAT_00556ca0._4_4_ + 8))();
      puVar2 = PTR_DAT_004d904c;
      PTR_DAT_004d904c[0x18d4] = 0;
      uVar4 = DAT_0052be24;
      uVar3 = DAT_0052be20;
      *(undefined4 *)(puVar2 + 0x10a8) = DAT_0052be34;
      *(undefined4 *)(puVar2 + 0x10a4) = DAT_0052be30;
      uVar5 = DAT_0052be28;
      *(undefined4 *)(puVar2 + 0x10a0) = DAT_0052be2c;
      *(undefined4 *)(puVar2 + 0x109c) = uVar5;
      *(undefined4 *)(puVar2 + 0x1098) = uVar4;
      *(undefined4 *)(puVar2 + 0x1094) = uVar3;
      *(undefined4 *)(puVar2 + 0x10c0) = DAT_0052be4c;
      uVar3 = DAT_0052be44;
      *(undefined4 *)(puVar2 + 0x10bc) = DAT_0052be48;
      *(undefined4 *)(puVar2 + 0x10b8) = uVar3;
      uVar3 = DAT_0052be3c;
      *(undefined4 *)(puVar2 + 0x10b4) = DAT_0052be40;
      *(undefined4 *)(puVar2 + 0x10b0) = uVar3;
      *(undefined4 *)(puVar2 + 0x10ac) = DAT_0052be38;
      uVar5 = DAT_0052be58;
      uVar4 = DAT_0052be54;
      uVar3 = DAT_0052be50;
      *(undefined4 *)(puVar2 + 0x10d0) = DAT_0052be5c;
      *(undefined4 *)(puVar2 + 0x10cc) = uVar5;
      *(undefined4 *)(puVar2 + 0x10c8) = uVar4;
      *(undefined4 *)(puVar2 + 0x10c4) = uVar3;
      uVar5 = DAT_0052be30;
      uVar4 = DAT_0052be24;
      uVar3 = DAT_0052be20;
      *(undefined4 *)(puVar2 + 0x18a8) = DAT_0052be34;
      *(undefined4 *)(puVar2 + 0x18a4) = uVar5;
      uVar5 = DAT_0052be28;
      *(undefined4 *)(puVar2 + 0x18a0) = DAT_0052be2c;
      *(undefined4 *)(puVar2 + 0x189c) = uVar5;
      *(undefined4 *)(puVar2 + 0x1898) = uVar4;
      *(undefined4 *)(puVar2 + 0x1894) = uVar3;
      *(undefined4 *)(puVar2 + 0x18c0) = DAT_0052be4c;
      *(undefined4 *)(puVar2 + 0x18bc) = DAT_0052be48;
      uVar3 = DAT_0052be40;
      *(undefined4 *)(puVar2 + 0x18b8) = DAT_0052be44;
      *(undefined4 *)(puVar2 + 0x18b4) = uVar3;
      uVar3 = DAT_0052be38;
      *(undefined4 *)(puVar2 + 0x18b0) = DAT_0052be3c;
      *(undefined4 *)(puVar2 + 0x18ac) = uVar3;
      uVar5 = DAT_0052be58;
      uVar4 = DAT_0052be54;
      uVar3 = DAT_0052be50;
      *(undefined4 *)(puVar2 + 0x18d0) = DAT_0052be5c;
      *(undefined4 *)(puVar2 + 0x18cc) = uVar5;
      *(undefined4 *)(puVar2 + 0x18c8) = uVar4;
      *(undefined4 *)(puVar2 + 0x18c4) = uVar3;
      *(int *)(puVar2 + 0x18d8) = *(int *)(puVar2 + 0x18d8) + 1;
      FUN_002eec0c(puVar2,1);
      local_c044 = 0;
      FUN_0033ab34(auStack_c034,local_6034 * 6 + -1,0,0,&local_c044);
      FUN_00026ed0(&local_c044);
      (**(code **)(*DAT_00556ca0._4_4_ + 0xc))(DAT_00556ca0._4_4_,1);
    }
    piVar9 = (int *)FUN_002eddd0();
    (**(code **)(*piVar9 + 0x30))(piVar9,uVar7);
  }
  if (*(int *)puVar1 == iVar6) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

## FUN_0000f3b0 — 000102c4

- 函数名: FUN_000102c4
- 函数体: 1235 字节
- 调用者数: 1 / 被调用者数: 10

```c

void FUN_000102c4(void)

{
  undefined *puVar1;
  undefined *puVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  int iVar6;
  undefined4 uVar7;
  int iVar8;
  int *piVar9;
  undefined1 **ppuVar10;
  undefined4 local_c044;
  undefined4 local_c040;
  undefined4 local_c03c;
  undefined1 *puStack_c038;
  undefined1 auStack_c034 [24576];
  int local_6034;
  undefined1 *puStack_6030;
  undefined1 auStack_602c [24576];
  int aiStack_2c [3];
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  iVar6 = *(int *)PTR____stack_chk_guard_004d9044;
  if (((int *)DAT_00556ca0 != (int *)0x0) || (DAT_00556ca0._4_4_ != (int *)0x0)) {
    puStack_6030 = auStack_602c;
    aiStack_2c[0] = 0;
    local_6034 = 0;
    puStack_c038 = auStack_c034;
    local_c03c = 0;
    uVar7 = FUN_000065c4();
    iVar8 = FUN_00006ad0(uVar7,1,&local_c03c);
    if (iVar8 != 0) {
      do {
        if ((0.0 < *(float *)(iVar8 + 0x28)) && ((*(byte *)(iVar8 + 0xc) & 1) == 0)) {
          ppuVar10 = &puStack_c038;
          piVar9 = &local_6034;
          if (*(char *)(iVar8 + 0x1b8) == '\0') {
            ppuVar10 = &puStack_6030;
            piVar9 = aiStack_2c;
          }
          FUN_0000ff40(iVar8,ppuVar10,piVar9);
        }
        uVar7 = FUN_000065c4();
        iVar8 = FUN_00006af0(uVar7,1,&local_c03c);
      } while (iVar8 != 0);
    }
    uVar7 = FUN_000065c4();
    iVar8 = FUN_00006ad0(uVar7,2,&local_c03c);
    if (iVar8 != 0) {
      do {
        if (((0.0 < *(float *)(iVar8 + 0x28)) && ((*(byte *)(iVar8 + 0xc) & 1) == 0)) &&
           (*(char *)(iVar8 + 0x98) != '\0')) {
          FUN_00008a70(iVar8,&puStack_c038,&local_6034);
        }
        uVar7 = FUN_000065c4();
        iVar8 = FUN_00006af0(uVar7,2,&local_c03c);
      } while (iVar8 != 0);
    }
    piVar9 = (int *)FUN_002eddd0();
    uVar7 = (**(code **)(*piVar9 + 0x44))();
    piVar9 = (int *)FUN_002eddd0();
    (**(code **)(*piVar9 + 0x30))(piVar9,0);
    if (((int *)DAT_00556ca0 != (int *)0x0) && (iVar8 = aiStack_2c[0] * 6 + -1, 0 < iVar8)) {
      (**(code **)(*(int *)DAT_00556ca0 + 8))();
      puVar2 = PTR_DAT_004d904c;
      PTR_DAT_004d904c[0x18d4] = 0;
      uVar4 = DAT_0052be24;
      uVar3 = DAT_0052be20;
      *(undefined4 *)(puVar2 + 0x10a8) = DAT_0052be34;
      *(undefined4 *)(puVar2 + 0x10a4) = DAT_0052be30;
      uVar5 = DAT_0052be28;
      *(undefined4 *)(puVar2 + 0x10a0) = DAT_0052be2c;
      *(undefined4 *)(puVar2 + 0x109c) = uVar5;
      *(undefined4 *)(puVar2 + 0x1098) = uVar4;
      *(undefined4 *)(puVar2 + 0x1094) = uVar3;
      *(undefined4 *)(puVar2 + 0x10c0) = DAT_0052be4c;
      uVar3 = DAT_0052be44;
      *(undefined4 *)(puVar2 + 0x10bc) = DAT_0052be48;
      *(undefined4 *)(puVar2 + 0x10b8) = uVar3;
      uVar3 = DAT_0052be3c;
      *(undefined4 *)(puVar2 + 0x10b4) = DAT_0052be40;
      *(undefined4 *)(puVar2 + 0x10b0) = uVar3;
      *(undefined4 *)(puVar2 + 0x10ac) = DAT_0052be38;
      uVar5 = DAT_0052be58;
      uVar4 = DAT_0052be54;
      uVar3 = DAT_0052be50;
      *(undefined4 *)(puVar2 + 0x10d0) = DAT_0052be5c;
      *(undefined4 *)(puVar2 + 0x10cc) = uVar5;
      *(undefined4 *)(puVar2 + 0x10c8) = uVar4;
      *(undefined4 *)(puVar2 + 0x10c4) = uVar3;
      uVar5 = DAT_0052be30;
      uVar4 = DAT_0052be24;
      uVar3 = DAT_0052be20;
      *(undefined4 *)(puVar2 + 0x18a8) = DAT_0052be34;
      *(undefined4 *)(puVar2 + 0x18a4) = uVar5;
      uVar5 = DAT_0052be28;
      *(undefined4 *)(puVar2 + 0x18a0) = DAT_0052be2c;
      *(undefined4 *)(puVar2 + 0x189c) = uVar5;
      *(undefined4 *)(puVar2 + 0x1898) = uVar4;
      *(undefined4 *)(puVar2 + 0x1894) = uVar3;
      *(undefined4 *)(puVar2 + 0x18c0) = DAT_0052be4c;
      *(undefined4 *)(puVar2 + 0x18bc) = DAT_0052be48;
      uVar3 = DAT_0052be40;
      *(undefined4 *)(puVar2 + 0x18b8) = DAT_0052be44;
      *(undefined4 *)(puVar2 + 0x18b4) = uVar3;
      uVar3 = DAT_0052be38;
      *(undefined4 *)(puVar2 + 0x18b0) = DAT_0052be3c;
      *(undefined4 *)(puVar2 + 0x18ac) = uVar3;
      uVar5 = DAT_0052be58;
      uVar4 = DAT_0052be54;
      uVar3 = DAT_0052be50;
      *(undefined4 *)(puVar2 + 0x18d0) = DAT_0052be5c;
      *(undefined4 *)(puVar2 + 0x18cc) = uVar5;
      *(undefined4 *)(puVar2 + 0x18c8) = uVar4;
      *(undefined4 *)(puVar2 + 0x18c4) = uVar3;
      *(int *)(puVar2 + 0x18d8) = *(int *)(puVar2 + 0x18d8) + 1;
      FUN_002eec0c(puVar2,1);
      local_c040 = 0;
      FUN_0033ab34(auStack_602c,iVar8,0,0,&local_c040);
      FUN_00026ed0(&local_c040);
      (**(code **)(*(int *)DAT_00556ca0 + 0xc))((int *)DAT_00556ca0,1);
    }
    if ((DAT_00556ca0._4_4_ != (int *)0x0) && (0 < local_6034 * 6 + -1)) {
      (**(code **)(*DAT_00556ca0._4_4_ + 8))();
      puVar2 = PTR_DAT_004d904c;
      PTR_DAT_004d904c[0x18d4] = 0;
      uVar4 = DAT_0052be24;
      uVar3 = DAT_0052be20;
      *(undefined4 *)(puVar2 + 0x10a8) = DAT_0052be34;
      *(undefined4 *)(puVar2 + 0x10a4) = DAT_0052be30;
      uVar5 = DAT_0052be28;
      *(undefined4 *)(puVar2 + 0x10a0) = DAT_0052be2c;
      *(undefined4 *)(puVar2 + 0x109c) = uVar5;
      *(undefined4 *)(puVar2 + 0x1098) = uVar4;
      *(undefined4 *)(puVar2 + 0x1094) = uVar3;
      *(undefined4 *)(puVar2 + 0x10c0) = DAT_0052be4c;
      uVar3 = DAT_0052be44;
      *(undefined4 *)(puVar2 + 0x10bc) = DAT_0052be48;
      *(undefined4 *)(puVar2 + 0x10b8) = uVar3;
      uVar3 = DAT_0052be3c;
      *(undefined4 *)(puVar2 + 0x10b4) = DAT_0052be40;
      *(undefined4 *)(puVar2 + 0x10b0) = uVar3;
      *(undefined4 *)(puVar2 + 0x10ac) = DAT_0052be38;
      uVar5 = DAT_0052be58;
      uVar4 = DAT_0052be54;
      uVar3 = DAT_0052be50;
      *(undefined4 *)(puVar2 + 0x10d0) = DAT_0052be5c;
      *(undefined4 *)(puVar2 + 0x10cc) = uVar5;
      *(undefined4 *)(puVar2 + 0x10c8) = uVar4;
      *(undefined4 *)(puVar2 + 0x10c4) = uVar3;
      uVar5 = DAT_0052be30;
      uVar4 = DAT_0052be24;
      uVar3 = DAT_0052be20;
      *(undefined4 *)(puVar2 + 0x18a8) = DAT_0052be34;
      *(undefined4 *)(puVar2 + 0x18a4) = uVar5;
      uVar5 = DAT_0052be28;
      *(undefined4 *)(puVar2 + 0x18a0) = DAT_0052be2c;
      *(undefined4 *)(puVar2 + 0x189c) = uVar5;
      *(undefined4 *)(puVar2 + 0x1898) = uVar4;
      *(undefined4 *)(puVar2 + 0x1894) = uVar3;
      *(undefined4 *)(puVar2 + 0x18c0) = DAT_0052be4c;
      *(undefined4 *)(puVar2 + 0x18bc) = DAT_0052be48;
      uVar3 = DAT_0052be40;
      *(undefined4 *)(puVar2 + 0x18b8) = DAT_0052be44;
      *(undefined4 *)(puVar2 + 0x18b4) = uVar3;
      uVar3 = DAT_0052be38;
      *(undefined4 *)(puVar2 + 0x18b0) = DAT_0052be3c;
      *(undefined4 *)(puVar2 + 0x18ac) = uVar3;
      uVar5 = DAT_0052be58;
      uVar4 = DAT_0052be54;
      uVar3 = DAT_0052be50;
      *(undefined4 *)(puVar2 + 0x18d0) = DAT_0052be5c;
      *(undefined4 *)(puVar2 + 0x18cc) = uVar5;
      *(undefined4 *)(puVar2 + 0x18c8) = uVar4;
      *(undefined4 *)(puVar2 + 0x18c4) = uVar3;
      *(int *)(puVar2 + 0x18d8) = *(int *)(puVar2 + 0x18d8) + 1;
      FUN_002eec0c(puVar2,1);
      local_c044 = 0;
      FUN_0033ab34(auStack_c034,local_6034 * 6 + -1,0,0,&local_c044);
      FUN_00026ed0(&local_c044);
      (**(code **)(*DAT_00556ca0._4_4_ + 0xc))(DAT_00556ca0._4_4_,1);
    }
    piVar9 = (int *)FUN_002eddd0();
    (**(code **)(*piVar9 + 0x30))(piVar9,uVar7);
  }
  if (*(int *)puVar1 == iVar6) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

## FUN_0000f500 — 000102c4

- 函数名: FUN_000102c4
- 函数体: 1235 字节
- 调用者数: 1 / 被调用者数: 10

```c

void FUN_000102c4(void)

{
  undefined *puVar1;
  undefined *puVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  int iVar6;
  undefined4 uVar7;
  int iVar8;
  int *piVar9;
  undefined1 **ppuVar10;
  undefined4 local_c044;
  undefined4 local_c040;
  undefined4 local_c03c;
  undefined1 *puStack_c038;
  undefined1 auStack_c034 [24576];
  int local_6034;
  undefined1 *puStack_6030;
  undefined1 auStack_602c [24576];
  int aiStack_2c [3];
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  iVar6 = *(int *)PTR____stack_chk_guard_004d9044;
  if (((int *)DAT_00556ca0 != (int *)0x0) || (DAT_00556ca0._4_4_ != (int *)0x0)) {
    puStack_6030 = auStack_602c;
    aiStack_2c[0] = 0;
    local_6034 = 0;
    puStack_c038 = auStack_c034;
    local_c03c = 0;
    uVar7 = FUN_000065c4();
    iVar8 = FUN_00006ad0(uVar7,1,&local_c03c);
    if (iVar8 != 0) {
      do {
        if ((0.0 < *(float *)(iVar8 + 0x28)) && ((*(byte *)(iVar8 + 0xc) & 1) == 0)) {
          ppuVar10 = &puStack_c038;
          piVar9 = &local_6034;
          if (*(char *)(iVar8 + 0x1b8) == '\0') {
            ppuVar10 = &puStack_6030;
            piVar9 = aiStack_2c;
          }
          FUN_0000ff40(iVar8,ppuVar10,piVar9);
        }
        uVar7 = FUN_000065c4();
        iVar8 = FUN_00006af0(uVar7,1,&local_c03c);
      } while (iVar8 != 0);
    }
    uVar7 = FUN_000065c4();
    iVar8 = FUN_00006ad0(uVar7,2,&local_c03c);
    if (iVar8 != 0) {
      do {
        if (((0.0 < *(float *)(iVar8 + 0x28)) && ((*(byte *)(iVar8 + 0xc) & 1) == 0)) &&
           (*(char *)(iVar8 + 0x98) != '\0')) {
          FUN_00008a70(iVar8,&puStack_c038,&local_6034);
        }
        uVar7 = FUN_000065c4();
        iVar8 = FUN_00006af0(uVar7,2,&local_c03c);
      } while (iVar8 != 0);
    }
    piVar9 = (int *)FUN_002eddd0();
    uVar7 = (**(code **)(*piVar9 + 0x44))();
    piVar9 = (int *)FUN_002eddd0();
    (**(code **)(*piVar9 + 0x30))(piVar9,0);
    if (((int *)DAT_00556ca0 != (int *)0x0) && (iVar8 = aiStack_2c[0] * 6 + -1, 0 < iVar8)) {
      (**(code **)(*(int *)DAT_00556ca0 + 8))();
      puVar2 = PTR_DAT_004d904c;
      PTR_DAT_004d904c[0x18d4] = 0;
      uVar4 = DAT_0052be24;
      uVar3 = DAT_0052be20;
      *(undefined4 *)(puVar2 + 0x10a8) = DAT_0052be34;
      *(undefined4 *)(puVar2 + 0x10a4) = DAT_0052be30;
      uVar5 = DAT_0052be28;
      *(undefined4 *)(puVar2 + 0x10a0) = DAT_0052be2c;
      *(undefined4 *)(puVar2 + 0x109c) = uVar5;
      *(undefined4 *)(puVar2 + 0x1098) = uVar4;
      *(undefined4 *)(puVar2 + 0x1094) = uVar3;
      *(undefined4 *)(puVar2 + 0x10c0) = DAT_0052be4c;
      uVar3 = DAT_0052be44;
      *(undefined4 *)(puVar2 + 0x10bc) = DAT_0052be48;
      *(undefined4 *)(puVar2 + 0x10b8) = uVar3;
      uVar3 = DAT_0052be3c;
      *(undefined4 *)(puVar2 + 0x10b4) = DAT_0052be40;
      *(undefined4 *)(puVar2 + 0x10b0) = uVar3;
      *(undefined4 *)(puVar2 + 0x10ac) = DAT_0052be38;
      uVar5 = DAT_0052be58;
      uVar4 = DAT_0052be54;
      uVar3 = DAT_0052be50;
      *(undefined4 *)(puVar2 + 0x10d0) = DAT_0052be5c;
      *(undefined4 *)(puVar2 + 0x10cc) = uVar5;
      *(undefined4 *)(puVar2 + 0x10c8) = uVar4;
      *(undefined4 *)(puVar2 + 0x10c4) = uVar3;
      uVar5 = DAT_0052be30;
      uVar4 = DAT_0052be24;
      uVar3 = DAT_0052be20;
      *(undefined4 *)(puVar2 + 0x18a8) = DAT_0052be34;
      *(undefined4 *)(puVar2 + 0x18a4) = uVar5;
      uVar5 = DAT_0052be28;
      *(undefined4 *)(puVar2 + 0x18a0) = DAT_0052be2c;
      *(undefined4 *)(puVar2 + 0x189c) = uVar5;
      *(undefined4 *)(puVar2 + 0x1898) = uVar4;
      *(undefined4 *)(puVar2 + 0x1894) = uVar3;
      *(undefined4 *)(puVar2 + 0x18c0) = DAT_0052be4c;
      *(undefined4 *)(puVar2 + 0x18bc) = DAT_0052be48;
      uVar3 = DAT_0052be40;
      *(undefined4 *)(puVar2 + 0x18b8) = DAT_0052be44;
      *(undefined4 *)(puVar2 + 0x18b4) = uVar3;
      uVar3 = DAT_0052be38;
      *(undefined4 *)(puVar2 + 0x18b0) = DAT_0052be3c;
      *(undefined4 *)(puVar2 + 0x18ac) = uVar3;
      uVar5 = DAT_0052be58;
      uVar4 = DAT_0052be54;
      uVar3 = DAT_0052be50;
      *(undefined4 *)(puVar2 + 0x18d0) = DAT_0052be5c;
      *(undefined4 *)(puVar2 + 0x18cc) = uVar5;
      *(undefined4 *)(puVar2 + 0x18c8) = uVar4;
      *(undefined4 *)(puVar2 + 0x18c4) = uVar3;
      *(int *)(puVar2 + 0x18d8) = *(int *)(puVar2 + 0x18d8) + 1;
      FUN_002eec0c(puVar2,1);
      local_c040 = 0;
      FUN_0033ab34(auStack_602c,iVar8,0,0,&local_c040);
      FUN_00026ed0(&local_c040);
      (**(code **)(*(int *)DAT_00556ca0 + 0xc))((int *)DAT_00556ca0,1);
    }
    if ((DAT_00556ca0._4_4_ != (int *)0x0) && (0 < local_6034 * 6 + -1)) {
      (**(code **)(*DAT_00556ca0._4_4_ + 8))();
      puVar2 = PTR_DAT_004d904c;
      PTR_DAT_004d904c[0x18d4] = 0;
      uVar4 = DAT_0052be24;
      uVar3 = DAT_0052be20;
      *(undefined4 *)(puVar2 + 0x10a8) = DAT_0052be34;
      *(undefined4 *)(puVar2 + 0x10a4) = DAT_0052be30;
      uVar5 = DAT_0052be28;
      *(undefined4 *)(puVar2 + 0x10a0) = DAT_0052be2c;
      *(undefined4 *)(puVar2 + 0x109c) = uVar5;
      *(undefined4 *)(puVar2 + 0x1098) = uVar4;
      *(undefined4 *)(puVar2 + 0x1094) = uVar3;
      *(undefined4 *)(puVar2 + 0x10c0) = DAT_0052be4c;
      uVar3 = DAT_0052be44;
      *(undefined4 *)(puVar2 + 0x10bc) = DAT_0052be48;
      *(undefined4 *)(puVar2 + 0x10b8) = uVar3;
      uVar3 = DAT_0052be3c;
      *(undefined4 *)(puVar2 + 0x10b4) = DAT_0052be40;
      *(undefined4 *)(puVar2 + 0x10b0) = uVar3;
      *(undefined4 *)(puVar2 + 0x10ac) = DAT_0052be38;
      uVar5 = DAT_0052be58;
      uVar4 = DAT_0052be54;
      uVar3 = DAT_0052be50;
      *(undefined4 *)(puVar2 + 0x10d0) = DAT_0052be5c;
      *(undefined4 *)(puVar2 + 0x10cc) = uVar5;
      *(undefined4 *)(puVar2 + 0x10c8) = uVar4;
      *(undefined4 *)(puVar2 + 0x10c4) = uVar3;
      uVar5 = DAT_0052be30;
      uVar4 = DAT_0052be24;
      uVar3 = DAT_0052be20;
      *(undefined4 *)(puVar2 + 0x18a8) = DAT_0052be34;
      *(undefined4 *)(puVar2 + 0x18a4) = uVar5;
      uVar5 = DAT_0052be28;
      *(undefined4 *)(puVar2 + 0x18a0) = DAT_0052be2c;
      *(undefined4 *)(puVar2 + 0x189c) = uVar5;
      *(undefined4 *)(puVar2 + 0x1898) = uVar4;
      *(undefined4 *)(puVar2 + 0x1894) = uVar3;
      *(undefined4 *)(puVar2 + 0x18c0) = DAT_0052be4c;
      *(undefined4 *)(puVar2 + 0x18bc) = DAT_0052be48;
      uVar3 = DAT_0052be40;
      *(undefined4 *)(puVar2 + 0x18b8) = DAT_0052be44;
      *(undefined4 *)(puVar2 + 0x18b4) = uVar3;
      uVar3 = DAT_0052be38;
      *(undefined4 *)(puVar2 + 0x18b0) = DAT_0052be3c;
      *(undefined4 *)(puVar2 + 0x18ac) = uVar3;
      uVar5 = DAT_0052be58;
      uVar4 = DAT_0052be54;
      uVar3 = DAT_0052be50;
      *(undefined4 *)(puVar2 + 0x18d0) = DAT_0052be5c;
      *(undefined4 *)(puVar2 + 0x18cc) = uVar5;
      *(undefined4 *)(puVar2 + 0x18c8) = uVar4;
      *(undefined4 *)(puVar2 + 0x18c4) = uVar3;
      *(int *)(puVar2 + 0x18d8) = *(int *)(puVar2 + 0x18d8) + 1;
      FUN_002eec0c(puVar2,1);
      local_c044 = 0;
      FUN_0033ab34(auStack_c034,local_6034 * 6 + -1,0,0,&local_c044);
      FUN_00026ed0(&local_c044);
      (**(code **)(*DAT_00556ca0._4_4_ + 0xc))(DAT_00556ca0._4_4_,1);
    }
    piVar9 = (int *)FUN_002eddd0();
    (**(code **)(*piVar9 + 0x30))(piVar9,uVar7);
  }
  if (*(int *)puVar1 == iVar6) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

## FUN_0000f600 — 000102c4

- 函数名: FUN_000102c4
- 函数体: 1235 字节
- 调用者数: 1 / 被调用者数: 10

```c

void FUN_000102c4(void)

{
  undefined *puVar1;
  undefined *puVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  int iVar6;
  undefined4 uVar7;
  int iVar8;
  int *piVar9;
  undefined1 **ppuVar10;
  undefined4 local_c044;
  undefined4 local_c040;
  undefined4 local_c03c;
  undefined1 *puStack_c038;
  undefined1 auStack_c034 [24576];
  int local_6034;
  undefined1 *puStack_6030;
  undefined1 auStack_602c [24576];
  int aiStack_2c [3];
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  iVar6 = *(int *)PTR____stack_chk_guard_004d9044;
  if (((int *)DAT_00556ca0 != (int *)0x0) || (DAT_00556ca0._4_4_ != (int *)0x0)) {
    puStack_6030 = auStack_602c;
    aiStack_2c[0] = 0;
    local_6034 = 0;
    puStack_c038 = auStack_c034;
    local_c03c = 0;
    uVar7 = FUN_000065c4();
    iVar8 = FUN_00006ad0(uVar7,1,&local_c03c);
    if (iVar8 != 0) {
      do {
        if ((0.0 < *(float *)(iVar8 + 0x28)) && ((*(byte *)(iVar8 + 0xc) & 1) == 0)) {
          ppuVar10 = &puStack_c038;
          piVar9 = &local_6034;
          if (*(char *)(iVar8 + 0x1b8) == '\0') {
            ppuVar10 = &puStack_6030;
            piVar9 = aiStack_2c;
          }
          FUN_0000ff40(iVar8,ppuVar10,piVar9);
        }
        uVar7 = FUN_000065c4();
        iVar8 = FUN_00006af0(uVar7,1,&local_c03c);
      } while (iVar8 != 0);
    }
    uVar7 = FUN_000065c4();
    iVar8 = FUN_00006ad0(uVar7,2,&local_c03c);
    if (iVar8 != 0) {
      do {
        if (((0.0 < *(float *)(iVar8 + 0x28)) && ((*(byte *)(iVar8 + 0xc) & 1) == 0)) &&
           (*(char *)(iVar8 + 0x98) != '\0')) {
          FUN_00008a70(iVar8,&puStack_c038,&local_6034);
        }
        uVar7 = FUN_000065c4();
        iVar8 = FUN_00006af0(uVar7,2,&local_c03c);
      } while (iVar8 != 0);
    }
    piVar9 = (int *)FUN_002eddd0();
    uVar7 = (**(code **)(*piVar9 + 0x44))();
    piVar9 = (int *)FUN_002eddd0();
    (**(code **)(*piVar9 + 0x30))(piVar9,0);
    if (((int *)DAT_00556ca0 != (int *)0x0) && (iVar8 = aiStack_2c[0] * 6 + -1, 0 < iVar8)) {
      (**(code **)(*(int *)DAT_00556ca0 + 8))();
      puVar2 = PTR_DAT_004d904c;
      PTR_DAT_004d904c[0x18d4] = 0;
      uVar4 = DAT_0052be24;
      uVar3 = DAT_0052be20;
      *(undefined4 *)(puVar2 + 0x10a8) = DAT_0052be34;
      *(undefined4 *)(puVar2 + 0x10a4) = DAT_0052be30;
      uVar5 = DAT_0052be28;
      *(undefined4 *)(puVar2 + 0x10a0) = DAT_0052be2c;
      *(undefined4 *)(puVar2 + 0x109c) = uVar5;
      *(undefined4 *)(puVar2 + 0x1098) = uVar4;
      *(undefined4 *)(puVar2 + 0x1094) = uVar3;
      *(undefined4 *)(puVar2 + 0x10c0) = DAT_0052be4c;
      uVar3 = DAT_0052be44;
      *(undefined4 *)(puVar2 + 0x10bc) = DAT_0052be48;
      *(undefined4 *)(puVar2 + 0x10b8) = uVar3;
      uVar3 = DAT_0052be3c;
      *(undefined4 *)(puVar2 + 0x10b4) = DAT_0052be40;
      *(undefined4 *)(puVar2 + 0x10b0) = uVar3;
      *(undefined4 *)(puVar2 + 0x10ac) = DAT_0052be38;
      uVar5 = DAT_0052be58;
      uVar4 = DAT_0052be54;
      uVar3 = DAT_0052be50;
      *(undefined4 *)(puVar2 + 0x10d0) = DAT_0052be5c;
      *(undefined4 *)(puVar2 + 0x10cc) = uVar5;
      *(undefined4 *)(puVar2 + 0x10c8) = uVar4;
      *(undefined4 *)(puVar2 + 0x10c4) = uVar3;
      uVar5 = DAT_0052be30;
      uVar4 = DAT_0052be24;
      uVar3 = DAT_0052be20;
      *(undefined4 *)(puVar2 + 0x18a8) = DAT_0052be34;
      *(undefined4 *)(puVar2 + 0x18a4) = uVar5;
      uVar5 = DAT_0052be28;
      *(undefined4 *)(puVar2 + 0x18a0) = DAT_0052be2c;
      *(undefined4 *)(puVar2 + 0x189c) = uVar5;
      *(undefined4 *)(puVar2 + 0x1898) = uVar4;
      *(undefined4 *)(puVar2 + 0x1894) = uVar3;
      *(undefined4 *)(puVar2 + 0x18c0) = DAT_0052be4c;
      *(undefined4 *)(puVar2 + 0x18bc) = DAT_0052be48;
      uVar3 = DAT_0052be40;
      *(undefined4 *)(puVar2 + 0x18b8) = DAT_0052be44;
      *(undefined4 *)(puVar2 + 0x18b4) = uVar3;
      uVar3 = DAT_0052be38;
      *(undefined4 *)(puVar2 + 0x18b0) = DAT_0052be3c;
      *(undefined4 *)(puVar2 + 0x18ac) = uVar3;
      uVar5 = DAT_0052be58;
      uVar4 = DAT_0052be54;
      uVar3 = DAT_0052be50;
      *(undefined4 *)(puVar2 + 0x18d0) = DAT_0052be5c;
      *(undefined4 *)(puVar2 + 0x18cc) = uVar5;
      *(undefined4 *)(puVar2 + 0x18c8) = uVar4;
      *(undefined4 *)(puVar2 + 0x18c4) = uVar3;
      *(int *)(puVar2 + 0x18d8) = *(int *)(puVar2 + 0x18d8) + 1;
      FUN_002eec0c(puVar2,1);
      local_c040 = 0;
      FUN_0033ab34(auStack_602c,iVar8,0,0,&local_c040);
      FUN_00026ed0(&local_c040);
      (**(code **)(*(int *)DAT_00556ca0 + 0xc))((int *)DAT_00556ca0,1);
    }
    if ((DAT_00556ca0._4_4_ != (int *)0x0) && (0 < local_6034 * 6 + -1)) {
      (**(code **)(*DAT_00556ca0._4_4_ + 8))();
      puVar2 = PTR_DAT_004d904c;
      PTR_DAT_004d904c[0x18d4] = 0;
      uVar4 = DAT_0052be24;
      uVar3 = DAT_0052be20;
      *(undefined4 *)(puVar2 + 0x10a8) = DAT_0052be34;
      *(undefined4 *)(puVar2 + 0x10a4) = DAT_0052be30;
      uVar5 = DAT_0052be28;
      *(undefined4 *)(puVar2 + 0x10a0) = DAT_0052be2c;
      *(undefined4 *)(puVar2 + 0x109c) = uVar5;
      *(undefined4 *)(puVar2 + 0x1098) = uVar4;
      *(undefined4 *)(puVar2 + 0x1094) = uVar3;
      *(undefined4 *)(puVar2 + 0x10c0) = DAT_0052be4c;
      uVar3 = DAT_0052be44;
      *(undefined4 *)(puVar2 + 0x10bc) = DAT_0052be48;
      *(undefined4 *)(puVar2 + 0x10b8) = uVar3;
      uVar3 = DAT_0052be3c;
      *(undefined4 *)(puVar2 + 0x10b4) = DAT_0052be40;
      *(undefined4 *)(puVar2 + 0x10b0) = uVar3;
      *(undefined4 *)(puVar2 + 0x10ac) = DAT_0052be38;
      uVar5 = DAT_0052be58;
      uVar4 = DAT_0052be54;
      uVar3 = DAT_0052be50;
      *(undefined4 *)(puVar2 + 0x10d0) = DAT_0052be5c;
      *(undefined4 *)(puVar2 + 0x10cc) = uVar5;
      *(undefined4 *)(puVar2 + 0x10c8) = uVar4;
      *(undefined4 *)(puVar2 + 0x10c4) = uVar3;
      uVar5 = DAT_0052be30;
      uVar4 = DAT_0052be24;
      uVar3 = DAT_0052be20;
      *(undefined4 *)(puVar2 + 0x18a8) = DAT_0052be34;
      *(undefined4 *)(puVar2 + 0x18a4) = uVar5;
      uVar5 = DAT_0052be28;
      *(undefined4 *)(puVar2 + 0x18a0) = DAT_0052be2c;
      *(undefined4 *)(puVar2 + 0x189c) = uVar5;
      *(undefined4 *)(puVar2 + 0x1898) = uVar4;
      *(undefined4 *)(puVar2 + 0x1894) = uVar3;
      *(undefined4 *)(puVar2 + 0x18c0) = DAT_0052be4c;
      *(undefined4 *)(puVar2 + 0x18bc) = DAT_0052be48;
      uVar3 = DAT_0052be40;
      *(undefined4 *)(puVar2 + 0x18b8) = DAT_0052be44;
      *(undefined4 *)(puVar2 + 0x18b4) = uVar3;
      uVar3 = DAT_0052be38;
      *(undefined4 *)(puVar2 + 0x18b0) = DAT_0052be3c;
      *(undefined4 *)(puVar2 + 0x18ac) = uVar3;
      uVar5 = DAT_0052be58;
      uVar4 = DAT_0052be54;
      uVar3 = DAT_0052be50;
      *(undefined4 *)(puVar2 + 0x18d0) = DAT_0052be5c;
      *(undefined4 *)(puVar2 + 0x18cc) = uVar5;
      *(undefined4 *)(puVar2 + 0x18c8) = uVar4;
      *(undefined4 *)(puVar2 + 0x18c4) = uVar3;
      *(int *)(puVar2 + 0x18d8) = *(int *)(puVar2 + 0x18d8) + 1;
      FUN_002eec0c(puVar2,1);
      local_c044 = 0;
      FUN_0033ab34(auStack_c034,local_6034 * 6 + -1,0,0,&local_c044);
      FUN_00026ed0(&local_c044);
      (**(code **)(*DAT_00556ca0._4_4_ + 0xc))(DAT_00556ca0._4_4_,1);
    }
    piVar9 = (int *)FUN_002eddd0();
    (**(code **)(*piVar9 + 0x30))(piVar9,uVar7);
  }
  if (*(int *)puVar1 == iVar6) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

