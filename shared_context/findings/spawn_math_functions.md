# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_003010b8 — 003010b8

- 函数名: FUN_003010b8
- 函数体: 21 字节
- 调用者数: 51 / 被调用者数: 0

```c

undefined4 FUN_003010b8(uint param_1)

{
  return *(undefined4 *)("0123456789ABCDEF" + (param_1 >> 2 & 0x3ffc) + 0x10);
}


```

## FUN_003010d0 — 003010d0

- 函数名: FUN_003010d0
- 函数体: 27 字节
- 调用者数: 46 / 被调用者数: 0

```c

undefined4 FUN_003010d0(uint param_1)

{
  return *(undefined4 *)("0123456789ABCDEF" + ((param_1 >> 4) + 0x400 & 0xfff) * 4 + 0x10);
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

## FUN_0000e42c — 0000f2f8

- 函数名: FUN_0000f2f8
- 函数体: 635 字节
- 调用者数: 7 / 被调用者数: 12

```c

void FUN_0000f2f8(int param_1,uint param_2)

{
  undefined *puVar1;
  undefined4 uVar2;
  uint uVar3;
  int *piVar4;
  int iVar5;
  undefined4 *puVar6;
  bool bVar7;
  
  iVar5 = 0x10;
  do {
    if (*(int *)(param_1 + iVar5 * 4) != 0) {
      uVar2 = FUN_00033ca0();
      FUN_00036f4c(uVar2,*(undefined4 *)(param_1 + iVar5 * 4));
      *(undefined4 *)(param_1 + iVar5 * 4) = 0;
    }
    iVar5 = iVar5 + 1;
  } while (iVar5 != 0x12);
  if ((((*(char *)(param_1 + 0x1b8) == '\0') && (*(char *)(param_1 + 0x1bc) == '\0')) &&
      (*(char *)(param_1 + 0xc4) == '\0')) &&
     (*(int *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x314) < 5)) {
    if (param_2 == 1) {
      if (((DAT_00556cec & 1) == 0) && (iVar5 = ___cxa_guard_acquire(&DAT_00556cec), iVar5 != 0)) {
        DAT_00556ce8 = FUN_002f69c4("dropped",7);
        ___cxa_guard_release(&DAT_00556cec);
      }
      puVar1 = PTR_DAT_004d9048;
      FUN_00027588(*(undefined4 *)(PTR_DAT_004d9048 + 0x5c),"dropped",DAT_00556ce8,1,0,0);
      iVar5 = (uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc;
      FUN_00027588(*(undefined4 *)(puVar1 + 0x5c),iVar5 + 0x1c0,*(undefined4 *)(iVar5 + 0x268),1,0,0
                  );
    }
    iVar5 = FUN_0001cd2c();
    if (iVar5 == 1) {
      uVar3 = *(uint *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x32c);
      bVar7 = uVar3 == 0;
      if (bVar7) {
        uVar3 = param_2 ^ 1;
      }
      if (((bVar7 && uVar3 == 0) && (iVar5 = FUN_0004eb70(), puVar1 = PTR_DAT_004d9048, iVar5 == 0))
         && ((*(char *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x330) == '\0' &&
             (iVar5 = FUN_0001ccec(PTR_DAT_004d9048), iVar5 != 0)))) {
        uVar2 = FUN_0001ccec(puVar1);
        FUN_000713f4(uVar2,param_1);
      }
    }
  }
  iVar5 = *(int *)(param_1 + 0x1b4);
  if ((iVar5 != 0) && (*(int *)(iVar5 + 0x134) == param_1)) {
    *(undefined4 *)(iVar5 + 0x134) = 0;
  }
  if ((((*(byte *)(param_1 + 0xc) & 0x10) == 0) &&
      (*(int *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x32c) != 0)) &&
     (DAT_005d4ce4 = DAT_005d4ce4 + -1, DAT_005d4ce4 < 1)) {
    DAT_005d4ce4 = 0;
  }
  if (*(short *)(param_1 + 8) != 0) {
    FUN_0000a5f8(0);
  }
  DAT_005d4d00 = DAT_005d4d00 + 1;
  for (puVar6 = DAT_005d4cf8; (undefined4 **)puVar6 != &DAT_005d4cf8; puVar6 = (undefined4 *)*puVar6
      ) {
    piVar4 = puVar6 + 2;
    if ((puVar6[0xb] == 0) || (((int)puVar6[0xb] < DAT_005d4d00 && (puVar6[0xc] == 1)))) {
      if (*(char *)(puVar6 + 10) != '\0') {
        piVar4 = (int *)*piVar4;
      }
      if (piVar4 != (int *)0x0) {
        (**(code **)(*piVar4 + 0xc))(piVar4,param_1);
      }
    }
  }
  FUN_00015068(&DAT_005d4cf8);
  *(int *)(param_1 + 0x1dc) = *(int *)(param_1 + 0x1dc) + 1;
  for (puVar6 = *(undefined4 **)(param_1 + 0x1d4); puVar6 != (undefined4 *)(param_1 + 0x1d4);
      puVar6 = (undefined4 *)*puVar6) {
    piVar4 = puVar6 + 2;
    if ((puVar6[0xb] == 0) || (((int)puVar6[0xb] < *(int *)(param_1 + 0x1dc) && (puVar6[0xc] == 1)))
       ) {
      if (*(char *)(puVar6 + 10) != '\0') {
        piVar4 = (int *)*piVar4;
      }
      if (piVar4 != (int *)0x0) {
        (**(code **)(*piVar4 + 0xc))(piVar4,param_1);
      }
    }
  }
  FUN_00015068((undefined4 *)(param_1 + 0x1d4));
  if (*(int **)(param_1 + 0xb4) != (int *)0x0) {
    (**(code **)(**(int **)(param_1 + 0xb4) + 4))();
    *(undefined4 *)(param_1 + 0xb4) = 0;
  }
  *(uint *)(param_1 + 0xc) = *(uint *)(param_1 + 0xc) | 0x10;
  return;
}


```

## FUN_0000df00 — 0000e6a4

- 函数名: FUN_0000e6a4
- 函数体: 2955 字节
- 调用者数: 2 / 被调用者数: 21

```c

void FUN_0000e6a4(int param_1)

{
  int iVar1;
  ulonglong uVar2;
  longlong lVar3;
  undefined2 uVar4;
  float fVar5;
  undefined *puVar6;
  undefined *puVar7;
  undefined *puVar8;
  undefined4 uVar9;
  uint uVar10;
  uint uVar11;
  int iVar12;
  undefined *puVar13;
  uint uVar14;
  uint uVar15;
  undefined4 uVar16;
  uint uVar17;
  ushort uVar18;
  uint uVar19;
  uint uVar20;
  int iVar21;
  int iVar22;
  undefined8 in_d0;
  undefined8 uVar23;
  undefined4 extraout_s1;
  longlong lVar24;
  uint extraout_s1_00;
  uint extraout_s1_01;
  uint extraout_s1_02;
  undefined4 extraout_s1_03;
  undefined4 extraout_s1_04;
  undefined4 extraout_s1_05;
  uint extraout_s1_06;
  uint extraout_s1_07;
  uint extraout_s1_08;
  uint extraout_s1_09;
  float fVar25;
  undefined8 in_d1;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  undefined4 extraout_s3_01;
  undefined4 extraout_s3_02;
  undefined4 extraout_s3_03;
  undefined4 extraout_s3_04;
  undefined4 extraout_s3_05;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  undefined4 extraout_s5_01;
  undefined4 extraout_s5_02;
  undefined4 extraout_s7;
  undefined4 extraout_s7_00;
  undefined8 unaff_d8;
  undefined8 uVar26;
  undefined8 unaff_d9;
  undefined8 uVar27;
  undefined8 unaff_d10;
  undefined8 uVar28;
  undefined4 uVar29;
  undefined8 unaff_d11;
  undefined8 uVar30;
  undefined4 uVar31;
  undefined8 unaff_d12;
  undefined4 uVar32;
  undefined8 uVar33;
  undefined8 uVar34;
  undefined8 uVar35;
  undefined8 uVar36;
  undefined **local_198;
  undefined *local_194;
  undefined4 local_190 [8];
  undefined1 local_170;
  undefined4 local_16c;
  undefined4 local_168;
  undefined4 local_164;
  undefined4 local_160;
  undefined4 local_15c;
  undefined4 local_158;
  undefined4 local_154;
  undefined4 local_150;
  undefined4 local_14c;
  undefined4 local_148;
  undefined4 local_144;
  undefined4 local_140;
  undefined4 local_13c;
  undefined4 local_138;
  undefined4 local_134;
  undefined4 local_130;
  undefined4 local_12c;
  undefined4 local_128;
  undefined4 local_124;
  undefined4 local_120;
  undefined4 local_114;
  undefined4 local_110;
  undefined4 local_104;
  undefined4 local_100;
  undefined4 local_f4;
  undefined4 local_f0;
  undefined1 auStack_e4 [128];
  int local_64;
  
  puVar13 = PTR_DAT_004d9048;
  puVar7 = PTR____stack_chk_guard_004d9044;
  uVar27 = CONCAT44((int)((ulonglong)unaff_d9 >> 0x20),DAT_0000e9b0);
  local_64 = *(int *)PTR____stack_chk_guard_004d9044;
  uVar23 = FloatVectorSub(CONCAT44((int)((ulonglong)in_d1 >> 0x20),
                                   *(undefined4 *)(PTR_DAT_004d9048 + 0x5d4)),
                          CONCAT44((int)((ulonglong)in_d0 >> 0x20),*(undefined4 *)(param_1 + 0x74)),
                          2,0x20);
  if ((int)((uint)((float)uVar23 < DAT_0000e9b0) << 0x1f) < 0) {
    uVar16 = *(undefined4 *)(PTR_DAT_004d9048 + 0x5c);
    uVar9 = FUN_002f69c4("quick_slice",0xb);
    FUN_00027588(uVar16,"quick_slice",uVar9,1,0,0);
  }
  uVar26 = CONCAT44((int)((ulonglong)unaff_d8 >> 0x20),*(undefined4 *)(param_1 + 0x14));
  uVar29 = *(undefined4 *)(param_1 + 0x10);
  uVar32 = (undefined4)((ulonglong)unaff_d12 >> 0x20);
  uVar31 = *(undefined4 *)(param_1 + 0x1c);
  uVar16 = *(undefined4 *)(param_1 + 0x20);
  uVar9 = FUN_00025164();
  uVar28 = FloatVectorMult(CONCAT44((int)((ulonglong)unaff_d10 >> 0x20),uVar16),0x4120000041200000,2
                           ,0x20);
  uVar33 = FloatVectorMult(CONCAT44(uVar32,uVar31),0x4120000041200000,2,0x20);
  uVar23 = FloatVectorMult(CONCAT44(uVar9,uVar9),0xbf000000bf000000,2,0x20);
  uVar33 = FloatVectorAdd(uVar33,CONCAT44((int)((ulonglong)unaff_d11 >> 0x20),uVar29),2);
  if (-1 < (int)((uint)((float)uVar33 < (float)uVar23) << 0x1f)) {
    uVar9 = FUN_00025164();
    uVar23 = FloatVectorMult(CONCAT44(uVar9,uVar9),0x3f0000003f000000,2,0x20);
    if ((float)uVar33 <= (float)uVar23) {
      uVar26 = FloatVectorAdd(uVar28,uVar26,2);
      uVar9 = FUN_000251a8();
      uVar23 = FloatVectorMult(CONCAT44(uVar9,uVar9),0xbf000000bf000000,2,0x20);
      if (-1 < (int)((uint)((float)uVar26 < (float)uVar23) << 0x1f)) {
        uVar9 = FUN_000251a8();
        uVar23 = FloatVectorMult(CONCAT44(uVar9,uVar9),0x3f0000003f000000,2,0x20);
        if ((float)uVar26 <= (float)uVar23) goto LAB_0000e7d6;
      }
    }
  }
  uVar16 = *(undefined4 *)(puVar13 + 0x5c);
  uVar9 = FUN_002f69c4("just_in_time",0xc);
  FUN_00027588(uVar16,"just_in_time",uVar9,1,0,0);
LAB_0000e7d6:
  *(undefined4 *)(param_1 + 0x8c) = *(undefined4 *)(param_1 + 0x1c);
  *(undefined4 *)(param_1 + 0x90) = *(undefined4 *)(param_1 + 0x20);
  puVar8 = PTR_DAT_004d9050;
  *(undefined4 *)(param_1 + 0x94) = *(undefined4 *)(param_1 + 0x24);
  *(undefined4 *)(param_1 + 0x104) = 0;
  *(undefined4 *)(param_1 + 0x88) = 0;
  uVar10 = *(uint *)(puVar8 + 8);
  iVar21 = *(int *)(puVar8 + 0xc);
  uVar19 = *(uint *)(puVar8 + 0x10);
  lVar24 = (ulonglong)*(uint *)puVar8 * (ulonglong)uVar10;
  uVar14 = (uint)lVar24;
  iVar12 = *(int *)(puVar8 + 0x14);
  uVar17 = uVar14 + uVar19;
  uVar14 = *(int *)(puVar8 + 4) * uVar10 +
           *(uint *)puVar8 * iVar21 + (int)((ulonglong)lVar24 >> 0x20) +
           iVar12 + (uint)CARRY4(uVar14,uVar19);
  if (&UNK_00002aa8 < (undefined *)((ulonglong)uVar14 * 0x5550 >> 0x20)) {
    uVar2 = (ulonglong)uVar17;
    uVar11 = (uint)(uVar10 * uVar2);
    iVar22 = iVar21 * uVar17;
    uVar17 = uVar11 + uVar19;
    uVar14 = iVar22 + uVar10 * uVar14 + (int)(uVar10 * uVar2 >> 0x20) + iVar12 +
             (uint)CARRY4(uVar11,uVar19);
  }
  uVar11 = (uint)((ulonglong)uVar17 * (ulonglong)uVar10);
  uVar15 = uVar11 + uVar19;
  uVar11 = uVar14 * uVar10 + uVar17 * iVar21 + (int)((ulonglong)uVar17 * (ulonglong)uVar10 >> 0x20)
           + iVar12 + (uint)CARRY4(uVar11,uVar19);
  *(uint *)puVar8 = uVar17;
  *(uint *)(puVar8 + 4) = uVar14;
  if (&UNK_00002aa8 < (undefined *)((ulonglong)uVar11 * 0x5550 >> 0x20)) {
    uVar2 = (ulonglong)uVar15;
    uVar14 = (uint)(uVar10 * uVar2);
    iVar21 = iVar21 * uVar15;
    uVar15 = uVar14 + uVar19;
    uVar11 = iVar21 + uVar10 * uVar11 + (int)(uVar10 * uVar2 >> 0x20) +
             iVar12 + (uint)CARRY4(uVar14,uVar19);
  }
  *(uint *)puVar8 = uVar15;
  *(uint *)(puVar8 + 4) = uVar11;
  FUN_000148e0(&local_124,param_1 + 0x134);
  uVar33 = FloatVectorMult(CONCAT44(extraout_s3,local_124),0,2,0x20);
  uVar23 = FloatVectorMult(CONCAT44(extraout_s5,local_114),0,2,0x20);
  uVar28 = FloatVectorMult(CONCAT44(extraout_s7,local_110),0,2,0x20);
  uVar35 = FloatVectorMult(CONCAT44(extraout_s1,local_120),0,2,0x20);
  uVar23 = FloatVectorAdd(uVar33,uVar23,2);
  uVar33 = FloatVectorAdd(uVar35,uVar28,2);
  uVar28 = FloatVectorAdd(CONCAT44(extraout_s1,local_104),uVar23,2);
  lVar24 = CONCAT44(extraout_s1,local_f0);
  uVar33 = FloatVectorAdd(CONCAT44(extraout_s3,local_100),uVar33,2);
  uVar23 = CONCAT44(extraout_s3,local_f4);
  if (puVar13[0x17] != '\0') {
    *(undefined1 *)(param_1 + 0x1ba) = 0;
  }
  iVar21 = 1;
  if (*(char *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x330) == '\0') {
    lVar24 = FloatVectorAdd(lVar24,uVar33,2);
    iVar21 = 0;
    uVar23 = FloatVectorAdd(uVar23,uVar28,2);
    uVar28 = FloatVectorNeg(lVar24,2,2);
    uVar33 = FloatVectorNeg(uVar23,2,2);
    uVar28 = FloatVectorAdd(uVar28,uVar33,2);
    if (0.0 < (float)uVar28) {
      iVar21 = FUN_0030113c((int)lVar24,(int)uVar23);
      uVar18 = *(short *)(param_1 + 0x108) + 0x8008;
      uVar28 = FixedToFP(CONCAT44(iVar21 + 0xc004,iVar21 + 0xc004) & 0xffff0000ffff,0,1,0,0x20);
      uVar33 = FixedToFP((ulonglong)CONCAT24(uVar18,(uint)uVar18),0,1,0,0x20);
      uVar9 = (undefined4)((ulonglong)uVar28 >> 0x20);
      fVar25 = (float)uVar33 / DAT_0000e9b4;
      uVar23 = CONCAT44(uVar9,fVar25);
      uVar33 = CONCAT44((int)((ulonglong)uVar33 >> 0x20),DAT_0000e9bc);
      uVar28 = FloatVectorSub(uVar33,CONCAT44(extraout_s7_00,(float)uVar28 / DAT_0000e9b4),2,0x20);
      lVar24 = FloatVectorSub(uVar28,uVar23,2,0x20);
      uVar35 = FloatVectorAbsolute(lVar24,4);
      if (DAT_0000e9b8 < (float)uVar35) {
        if ((float)uVar28 <= fVar25) {
          uVar28 = FloatVectorAdd(uVar28,uVar33,2);
          lVar24 = FloatVectorSub(uVar28,uVar23,2,0x20);
        }
        else {
          uVar23 = CONCAT44(uVar9,DAT_0000e9c0);
          lVar24 = FloatVectorAdd(lVar24,uVar23,2);
        }
      }
      iVar21 = 0;
      if ((int)((uint)((float)lVar24 < 0.0) << 0x1f) < 0) {
        iVar21 = 1;
      }
    }
  }
  uVar10 = *(uint *)puVar8;
  lVar3 = (ulonglong)uVar10 * (ulonglong)*(uint *)(puVar8 + 8);
  uVar14 = (uint)lVar3;
  uVar26 = CONCAT44((int)((ulonglong)uVar26 >> 0x20),*(undefined4 *)(param_1 + 0x10c));
  *(uint *)puVar8 = uVar14 + *(uint *)(puVar8 + 0x10);
  uVar10 = *(int *)(puVar8 + 4) * *(uint *)(puVar8 + 8) +
           uVar10 * *(int *)(puVar8 + 0xc) + (int)((ulonglong)lVar3 >> 0x20) +
           *(int *)(puVar8 + 0x14) + (uint)CARRY4(uVar14,*(uint *)(puVar8 + 0x10));
  *(uint *)(puVar8 + 4) = uVar10;
  fVar25 = DAT_0000e9b4;
  if ((*(char *)(param_1 + 0x1ba) == '\0') || (1 < *(int *)(param_1 + 0x84))) {
    uVar10 = uVar10 >> 0x1f | 2;
    if (*(char *)(param_1 + 0x1b8) == '\0') {
      iVar12 = FUN_0001d10c(puVar13);
      lVar24 = (ulonglong)extraout_s1_06 << 0x20;
      if (iVar12 != 0) {
        FUN_0001d10c(puVar13);
        puVar6 = PTR_DAT_004d9024;
        iVar12 = FUN_0005eef0(PTR_DAT_004d9024);
        lVar24 = (ulonglong)extraout_s1_07 << 0x20;
        if (iVar12 < 0x15) {
          FUN_0001d10c(puVar13);
          iVar12 = FUN_0005eef0(puVar6);
          fVar25 = DAT_0000f264;
          lVar24 = (ulonglong)extraout_s1_08 << 0x20;
          if (iVar12 == 0) {
            local_148 = *(undefined4 *)(param_1 + 0x10);
            local_144 = *(undefined4 *)(param_1 + 0x14);
            local_140 = *(undefined4 *)(param_1 + 0x18);
            uVar23 = FixedToFP((ulonglong)
                               CONCAT24(*(ushort *)(param_1 + 0x108),
                                        (uint)*(ushort *)(param_1 + 0x108)),0,1,0,0x20);
            uVar28 = FloatVectorMult(uVar26,CONCAT44(extraout_s3_04,DAT_0000f268),2,0x20);
            uVar28 = FloatVectorMult(uVar28,uVar27,2,0x20);
            uVar23 = FloatVectorSub(CONCAT44(extraout_s3_04,DAT_0000f26c),
                                    CONCAT44((int)((ulonglong)uVar23 >> 0x20),
                                             (float)uVar23 / DAT_0000f264),2,0x20);
            FUN_00011d10(&local_148,(int)uVar23,(int)uVar28,1,0,0x3f800000);
            local_154 = *(undefined4 *)(param_1 + 0x10);
            local_150 = *(undefined4 *)(param_1 + 0x14);
            local_14c = *(undefined4 *)(param_1 + 0x18);
            uVar23 = FixedToFP((ulonglong)
                               CONCAT24(*(ushort *)(param_1 + 0x108),
                                        (uint)*(ushort *)(param_1 + 0x108)),0,1,0,0x20);
            uVar23 = FloatVectorSub(CONCAT44(extraout_s3_05,DAT_0000f270),
                                    CONCAT44((int)((ulonglong)uVar23 >> 0x20),(float)uVar23 / fVar25
                                            ),2,0x20);
            FUN_00011d10(&local_154,(int)uVar23,(int)uVar28,1,0,0x3f800000);
            lVar24 = (ulonglong)extraout_s1_09 << 0x20;
            uVar26 = FloatVectorMult(uVar26,0x3fc000003fc00000,2,0x20);
            uVar10 = DAT_0052bf54;
          }
        }
      }
    }
  }
  else {
    local_130 = *(undefined4 *)(param_1 + 0x10);
    local_12c = *(undefined4 *)(param_1 + 0x14);
    local_128 = *(undefined4 *)(param_1 + 0x18);
    uVar9 = (undefined4)((ulonglong)uVar23 >> 0x20);
    uVar23 = FixedToFP((ulonglong)
                       CONCAT24(*(ushort *)(param_1 + 0x108),(uint)*(ushort *)(param_1 + 0x108)),0,1
                       ,0,0x20);
    uVar28 = FloatVectorMult(uVar26,CONCAT44(uVar9,DAT_0000e9c4),2,0x20);
    uVar28 = FloatVectorMult(uVar28,uVar27,2,0x20);
    uVar23 = FloatVectorSub(CONCAT44(uVar9,DAT_0000e9c8),
                            CONCAT44((int)((ulonglong)uVar23 >> 0x20),(float)uVar23 / DAT_0000e9b4),
                            2,0x20);
    FUN_00011d10(&local_130,(int)uVar23,(int)uVar28,1,0,0x3f800000);
    local_13c = *(undefined4 *)(param_1 + 0x10);
    local_138 = *(undefined4 *)(param_1 + 0x14);
    local_134 = *(undefined4 *)(param_1 + 0x18);
    uVar23 = FixedToFP((ulonglong)
                       CONCAT24(*(ushort *)(param_1 + 0x108),(uint)*(ushort *)(param_1 + 0x108)),0,1
                       ,0,0x20);
    uVar23 = FloatVectorSub(CONCAT44(extraout_s3_00,DAT_0000e9cc),
                            CONCAT44((int)((ulonglong)uVar23 >> 0x20),(float)uVar23 / fVar25),2,0x20
                           );
    FUN_00011d10(&local_13c,(int)uVar23,(int)uVar28,1,0,0x3f800000);
    lVar24 = (ulonglong)extraout_s1_00 << 0x20;
    uVar26 = FloatVectorMult(uVar26,0x3fc000003fc00000,2,0x20);
    uVar10 = DAT_0052bf54;
  }
  if ((*(int *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x314) == 0x32) ||
     (*(char *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x330) != '\0')) {
    uVar26 = FloatVectorMult(uVar26,0x3fc000003fc00000,2,0x20);
    uVar10 = DAT_0052bf54;
  }
  if (puVar13[0x18] != '\0') {
    iVar12 = FUN_0000fa78(param_1);
    lVar24 = (ulonglong)extraout_s1_01 << 0x20;
    if ((iVar12 == 1) && (1 < *(int *)(param_1 + 0x84))) {
      uVar10 = 0;
    }
  }
  fVar5 = DAT_0000e9d8;
  fVar25 = DAT_0000e9d0;
  if (0 < (int)uVar10) {
    uVar27 = FixedToFP(CONCAT44(uVar10,uVar10),0,0,0,0x20);
    uVar23 = CONCAT44(uVar32,DAT_0000e9d4);
    uVar28 = CONCAT44(DAT_0000e9d0,DAT_0000e9d8);
    uVar14 = 0;
    do {
      uVar17 = *(uint *)(puVar8 + 8);
      uVar19 = *(uint *)(puVar8 + 0x10);
      lVar24 = (ulonglong)*(uint *)puVar8 * (ulonglong)uVar17;
      uVar11 = (uint)lVar24;
      uVar15 = uVar11 + uVar19;
      lVar3 = (ulonglong)uVar15 * (ulonglong)uVar17;
      uVar20 = (uint)lVar3;
      uVar11 = *(int *)(puVar8 + 4) * uVar17 +
               *(uint *)puVar8 * *(int *)(puVar8 + 0xc) + (int)((ulonglong)lVar24 >> 0x20) +
               *(int *)(puVar8 + 0x14) + (uint)CARRY4(uVar11,uVar19);
      uVar17 = uVar11 * uVar17 + uVar15 * *(int *)(puVar8 + 0xc) + (int)((ulonglong)lVar3 >> 0x20) +
               *(int *)(puVar8 + 0x14) + (uint)CARRY4(uVar20,uVar19);
      uVar9 = (undefined4)((ulonglong)uVar17 * 0x7ffff >> 0x20);
      *(uint *)puVar8 = uVar20 + uVar19;
      *(uint *)(puVar8 + 4) = uVar17;
      uVar33 = FixedToFP(CONCAT44(uVar9,uVar9),0,1,0,0x20);
      uVar35 = FixedToFP(CONCAT44(uVar14,uVar14),0,0,0,0x20);
      uVar35 = FloatVectorMult(uVar35,uVar23,2,0x20);
      uVar35 = FloatVectorAdd(uVar35,0x40a0000040a00000,2);
      uVar33 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar33 >> 0x20),(float)uVar33 / fVar25),
                               0x3f0000003f000000,2,0x20);
      uVar33 = FloatVectorAdd(uVar33,0x3f8000003f800000,2);
      iVar12 = FUN_0001bcc0();
      uVar33 = FloatVectorMult(uVar26,uVar33,2,0x20);
      uVar17 = (uint)*(byte *)(param_1 + 0x3c);
      uVar33 = FloatVectorMult(uVar35,uVar33,2,0x20);
      if (*(char *)(param_1 + 0x1ba) != '\0') {
        uVar17 = uVar17 + DAT_005d4cd0;
      }
      local_160 = *(undefined4 *)(param_1 + 0x10);
      local_15c = *(undefined4 *)(param_1 + 0x14);
      local_158 = *(undefined4 *)(param_1 + 0x18);
      uVar4 = (undefined2)((ulonglong)uVar11 * 0xfff0 >> 0x20);
      uVar9 = FUN_003010b8(uVar4);
      uVar16 = FUN_003010d0(uVar4);
      uVar35 = FloatVectorMult(uVar33,CONCAT44(uVar9,uVar9),2,0x20);
      uVar33 = FloatVectorMult(uVar33,CONCAT44(uVar16,uVar16),2,0x20);
      local_16c = (undefined4)uVar35;
      local_168 = (undefined4)uVar33;
      local_164 = 0;
      FUN_0001a7cc(local_16c,iVar12,&local_160,&local_16c,0,
                   *(undefined1 *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x330),
                   uVar17);
      uVar33 = FixedToFP(CONCAT44(uVar14 - 2,uVar14 - 2),0,0,0,0x20);
      uVar35 = FloatVectorSub(0x3f8000003f800000,
                              CONCAT44((int)((ulonglong)uVar33 >> 0x20),
                                       (float)uVar33 / (float)uVar27),2,0x20);
      uVar33 = uVar28;
      if (fVar5 < (float)uVar35) {
        uVar33 = uVar35;
      }
      lVar24 = FloatVectorMult(uVar33,CONCAT44((int)((ulonglong)uVar35 >> 0x20),
                                               *(undefined4 *)(iVar12 + 100)),2,0x20);
      *(int *)(iVar12 + 100) = (int)lVar24;
      if (2 < (int)uVar14) {
        uVar9 = (undefined4)((ulonglong)uVar33 >> 0x20);
        uVar33 = FloatVectorMult(CONCAT44(uVar9,DAT_0052bf5c),
                                 CONCAT44((int)((ulonglong)lVar24 >> 0x20),
                                          *(undefined4 *)(iVar12 + 0x5c)),2,0x20);
        *(int *)(iVar12 + 0x5c) = (int)uVar33;
        uVar33 = FloatVectorMult(CONCAT44(uVar9,DAT_0052bf5c),
                                 CONCAT44((int)((ulonglong)uVar33 >> 0x20),
                                          *(undefined4 *)(iVar12 + 0x60)),2,0x20);
        *(int *)(iVar12 + 0x60) = (int)uVar33;
        uVar33 = CONCAT44((int)((ulonglong)uVar33 >> 0x20),DAT_0052bf58);
        uVar35 = FloatVectorMult(uVar33,CONCAT44(uVar9,*(undefined4 *)(iVar12 + 0x44)),2,0x20);
        *(int *)(iVar12 + 0x44) = (int)uVar35;
        uVar35 = FloatVectorMult(uVar33,CONCAT44((int)((ulonglong)uVar35 >> 0x20),
                                                 *(undefined4 *)(iVar12 + 0x48)),2,0x20);
        *(int *)(iVar12 + 0x48) = (int)uVar35;
        lVar24 = FloatVectorMult(uVar33,CONCAT44((int)((ulonglong)uVar35 >> 0x20),
                                                 *(undefined4 *)(iVar12 + 0x4c)),2,0x20);
        *(int *)(iVar12 + 0x4c) = (int)lVar24;
      }
      uVar14 = uVar14 + 1;
    } while (uVar10 != uVar14);
    if (0 < (int)uVar10) {
      lVar3 = (ulonglong)*(uint *)puVar8 * (ulonglong)*(uint *)(puVar8 + 8);
      uVar14 = (uint)lVar3;
      uVar10 = *(int *)(puVar8 + 4) * *(uint *)(puVar8 + 8) +
               *(uint *)puVar8 * *(int *)(puVar8 + 0xc) + (int)((ulonglong)lVar3 >> 0x20) +
               *(int *)(puVar8 + 0x14) + (uint)CARRY4(uVar14,*(uint *)(puVar8 + 0x10));
      *(uint *)puVar8 = uVar14 + *(uint *)(puVar8 + 0x10);
      *(uint *)(puVar8 + 4) = uVar10;
      FUN_002f702c((int)lVar24,auStack_e4,0x80,"Clean-Slice-%d",
                   (int)((ulonglong)uVar10 * 3 >> 0x20) + 1);
      local_198 = &PTR_LAB_0052bf38;
      local_194 = PTR_FUN_004d9058;
      local_170 = 1;
      local_190[0] = 0;
      uVar9 = *(undefined4 *)(puVar13 + 0x1a4);
      FUN_0000a23c(&local_198,local_190);
      FUN_0002bc94(uVar9,auStack_e4,0x3f800000,0x3f800000,local_190,0);
      FUN_0000a298(local_190);
      lVar24 = (ulonglong)extraout_s1_02 << 0x20;
    }
  }
  uVar10 = *(uint *)(puVar8 + 8);
  iVar22 = *(int *)(puVar8 + 0xc);
  lVar3 = (ulonglong)*(uint *)puVar8 * (ulonglong)uVar10;
  uVar14 = (uint)lVar3;
  uVar19 = *(uint *)(puVar8 + 0x10);
  iVar12 = *(int *)(puVar8 + 0x14);
  uVar28 = CONCAT44((int)((ulonglong)lVar24 >> 0x20),DAT_0000f164);
  uVar17 = uVar14 + uVar19;
  uVar14 = *(int *)(puVar8 + 4) * uVar10 +
           *(uint *)puVar8 * iVar22 + (int)((ulonglong)lVar3 >> 0x20) +
           iVar12 + (uint)CARRY4(uVar14,uVar19);
  puVar13 = &UNK_00002aa9;
  uVar27 = CONCAT44((int)((ulonglong)uVar27 >> 0x20),
                    *(undefined4 *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x24c))
  ;
  *(uint *)puVar8 = uVar17;
  *(uint *)(puVar8 + 4) = uVar14;
  uVar23 = uVar28;
  if (&UNK_00002aa9 <= (undefined *)((ulonglong)uVar14 * 0x5550 >> 0x20)) {
    uVar2 = (ulonglong)uVar17;
    uVar11 = (uint)(uVar10 * uVar2);
    iVar1 = iVar22 * uVar17;
    uVar17 = uVar11 + uVar19;
    uVar14 = iVar1 + uVar10 * uVar14 + (int)(uVar10 * uVar2 >> 0x20) +
             iVar12 + (uint)CARRY4(uVar11,uVar19);
    *(uint *)puVar8 = uVar17;
    *(uint *)(puVar8 + 4) = uVar14;
    uVar9 = (undefined4)((ulonglong)uVar14 * 0x5550 >> 0x20);
    uVar23 = FixedToFP(CONCAT44(uVar9,uVar9),0,1,0,0x20);
  }
  uVar11 = (uint)((ulonglong)uVar17 * (ulonglong)uVar10);
  uVar33 = FloatVectorSub(0x3f8000003f800000,uVar27,2,0x20);
  uVar23 = FloatVectorMult(uVar33,uVar23,2,0x20);
  uVar15 = uVar11 + uVar19;
  uVar23 = FloatVectorMult(uVar23,0x4080000040800000,2,0x20);
  uVar14 = uVar14 * uVar10 + uVar17 * iVar22 + (int)((ulonglong)uVar17 * (ulonglong)uVar10 >> 0x20)
           + iVar12 + (uint)CARRY4(uVar11,uVar19);
  uVar23 = FPToFixed(uVar23,0,0,3,0x20);
  lVar24 = (ulonglong)uVar14 * 0x5550;
  *(uint *)puVar8 = uVar15;
  *(uint *)(puVar8 + 4) = uVar14;
  if (&UNK_00002aa8 < (undefined *)((ulonglong)lVar24 >> 0x20)) {
    uVar17 = (uint)((ulonglong)uVar10 * (ulonglong)uVar15);
    uVar10 = iVar22 * uVar15 +
             uVar10 * uVar14 + (int)((ulonglong)uVar10 * (ulonglong)uVar15 >> 0x20) +
             iVar12 + (uint)CARRY4(uVar17,uVar19);
    puVar13 = (undefined *)((ulonglong)uVar10 * 0x5550);
    uVar9 = (undefined4)((ulonglong)uVar10 * 0x5550 >> 0x20);
    lVar24 = CONCAT44(uVar10,uVar9);
    *(uint *)puVar8 = uVar17 + uVar19;
    *(uint *)(puVar8 + 4) = uVar10;
    uVar28 = FixedToFP(CONCAT44(uVar9,uVar9),0,1,0,0x20);
  }
  uVar28 = FloatVectorMult(uVar33,uVar28,2,0x20);
  uVar18 = *(ushort *)(param_1 + 0x108);
  uVar28 = FloatVectorMult(uVar28,0x4080000040800000,2,0x20);
  uVar28 = FPToFixed(uVar28,0,0,3,0x20);
  if (iVar21 == 1) {
    uVar10 = uVar18 + 0x7ff8;
    *(short *)(param_1 + 0x108) = (short)uVar10;
    iVar12 = (uVar10 & 0xffff) - (int)uVar28;
    uVar18 = (ushort)iVar12;
    uVar14 = iVar12 + 0x7ff8U & 0xffff;
    uVar9 = FUN_003010b8(uVar14,0x7ff8,uVar10 & 0xffff,puVar13);
    uVar16 = FUN_003010d0(uVar14);
    uVar35 = CONCAT44(uVar16,uVar16);
    uVar28 = CONCAT44(uVar9,uVar9);
    uVar10 = (int)uVar23 + (uVar10 & 0xffff);
    uVar9 = extraout_s1_03;
    uVar16 = extraout_s3_01;
    uVar29 = extraout_s5_00;
  }
  else {
    uVar10 = (int)uVar28 + (uint)uVar18;
    uVar9 = FUN_003010b8(uVar10 & 0xffff,(int)((ulonglong)lVar24 >> 0x20),(int)lVar24,puVar13);
    uVar16 = FUN_003010d0(uVar10 & 0xffff);
    uVar35 = CONCAT44(uVar16,uVar16);
    uVar28 = CONCAT44(uVar9,uVar9);
    uVar18 = uVar18 - (short)uVar23;
    uVar9 = extraout_s1_04;
    uVar16 = extraout_s3_02;
    uVar29 = extraout_s5_01;
  }
  uVar35 = FloatVectorMult(uVar26,uVar35,2,0x20);
  uVar23 = FloatVectorMult(uVar26,uVar28,2,0x20);
  uVar28 = FloatVectorMult(uVar33,CONCAT44(uVar16,*(undefined4 *)(param_1 + 0x1c)),2,0x20);
  uVar30 = FloatVectorMult(uVar27,0,2,0x20);
  uVar35 = FloatVectorMult(uVar27,uVar35,2,0x20);
  uVar23 = FloatVectorMult(uVar27,uVar23,2,0x20);
  uVar36 = FloatVectorMult(uVar33,CONCAT44(uVar29,*(undefined4 *)(param_1 + 0x24)),2,0x20);
  uVar34 = FloatVectorMult(uVar33,CONCAT44(uVar9,*(undefined4 *)(param_1 + 0x20)),2,0x20);
  uVar28 = FloatVectorAdd(uVar23,uVar28,2);
  uVar23 = FloatVectorAdd(uVar30,uVar36,2);
  uVar35 = FloatVectorAdd(uVar35,uVar34,2);
  *(int *)(param_1 + 0x128) = (int)uVar28;
  *(int *)(param_1 + 300) = (int)uVar35;
  *(int *)(param_1 + 0x130) = (int)uVar23;
  if (iVar21 == 1) {
    uVar10 = uVar10 + 0x7ff8 & 0xffff;
  }
  else {
    uVar10 = (uint)uVar18;
  }
  uVar9 = FUN_003010b8((int)uVar23,uVar10);
  uVar16 = FUN_003010d0(uVar10);
  uVar23 = FloatVectorMult(uVar26,CONCAT44(uVar9,uVar9),2,0x20);
  uVar28 = FloatVectorMult(uVar26,CONCAT44(uVar16,uVar16),2,0x20);
  uVar36 = FloatVectorMult(uVar33,CONCAT44(extraout_s5_02,*(undefined4 *)(param_1 + 0x20)),2,0x20);
  uVar34 = FloatVectorMult(uVar33,CONCAT44(extraout_s1_05,*(undefined4 *)(param_1 + 0x1c)),2,0x20);
  uVar23 = FloatVectorMult(uVar27,uVar23,2,0x20);
  uVar35 = FloatVectorMult(uVar27,uVar28,2,0x20);
  uVar28 = FloatVectorMult(uVar33,CONCAT44(extraout_s3_03,*(undefined4 *)(param_1 + 0x24)),2,0x20);
  uVar27 = FloatVectorAdd(uVar23,uVar34,2);
  uVar23 = FloatVectorAdd(uVar35,uVar36,2);
  uVar28 = FloatVectorAdd(uVar30,uVar28,2);
  *(int *)(param_1 + 0x1c) = (int)uVar27;
  uVar9 = (undefined4)uVar23;
  *(undefined4 *)(param_1 + 0x20) = uVar9;
  *(int *)(param_1 + 0x24) = (int)uVar28;
  if (((*(char *)(param_1 + 0x1ba) == '\0') &&
      (*(int *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x314) != 0x32)) &&
     (*(char *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x330) == '\0')) {
    if (*(char *)(param_1 + 0x1b8) == '\0') {
      uVar9 = FUN_00021a78(param_1 + 0xd8);
    }
  }
  else {
    uVar9 = FUN_003010b8(*(short *)(param_1 + 0x108) + 0x3ffc);
    uVar16 = FUN_003010d0(*(short *)(param_1 + 0x108) + 0x3ffc);
    *(undefined4 *)(param_1 + 0x130) = 0;
    uVar23 = FloatVectorMult(uVar26,CONCAT44(uVar9,uVar9),2,0x20);
    uVar27 = FloatVectorMult(uVar26,CONCAT44(uVar16,uVar16),2,0x20);
    uVar23 = FPToFixed(uVar23,0,0,3,0x20);
    uVar27 = FPToFixed(uVar27,0,0,3,0x20);
    uVar23 = FixedToFP(uVar23,0,0,0,0x20);
    uVar27 = FixedToFP(uVar27,0,0,0,0x20);
    uVar23 = FloatVectorMult(uVar23,0x3fe000003fe00000,2,0x20);
    uVar27 = FloatVectorMult(uVar27,0x3fe000003fe00000,2,0x20);
    *(int *)(param_1 + 0x128) = (int)uVar23;
    *(int *)(param_1 + 300) = (int)uVar27;
    uVar9 = FUN_003010b8((int)uVar23,*(short *)(param_1 + 0x108) + -0x3ffc);
    uVar23 = FloatVectorMult(uVar26,CONCAT44(uVar9,uVar9),2,0x20);
    uVar9 = FUN_003010d0(*(short *)(param_1 + 0x108) + -0x3ffc);
    *(undefined4 *)(param_1 + 0x24) = 0;
    uVar27 = FPToFixed(uVar23,0,0,3,0x20);
    uVar23 = FloatVectorMult(uVar26,CONCAT44(uVar9,uVar9),2,0x20);
    uVar26 = FixedToFP(uVar27,0,0,0,0x20);
    uVar27 = FPToFixed(uVar23,0,0,3,0x20);
    uVar23 = FloatVectorMult(uVar26,0x3fe000003fe00000,2,0x20);
    uVar27 = FixedToFP(uVar27,0,0,0,0x20);
    uVar27 = FloatVectorMult(uVar27,0x3fe000003fe00000,2,0x20);
    uVar9 = (undefined4)uVar23;
    *(undefined4 *)(param_1 + 0x1c) = uVar9;
    *(int *)(param_1 + 0x20) = (int)uVar27;
  }
  *(undefined1 *)(param_1 + 0x1bc) = 1;
  if (*(int **)(param_1 + 0xb4) != (int *)0x0) {
    uVar9 = (**(code **)(**(int **)(param_1 + 0xb4) + 4))();
    *(undefined4 *)(param_1 + 0xb4) = 0;
  }
  FUN_00011f30(uVar9,param_1,
               *(undefined1 *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x330),
               iVar21);
  if (*(int *)puVar7 == local_64) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

