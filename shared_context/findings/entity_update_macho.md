# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0000701c — 0000701c

- 函数名: FUN_0000701c
- 函数体: 803 字节
- 调用者数: 0 / 被调用者数: 11

```c

void FUN_0000701c(int param_1,undefined4 param_2,undefined4 param_3,undefined4 *param_4)

{
  longlong lVar1;
  undefined *puVar2;
  undefined *puVar3;
  undefined4 uVar4;
  int iVar5;
  int iVar6;
  uint uVar7;
  uint uVar8;
  int iVar9;
  int iVar10;
  void *pvVar11;
  undefined4 uVar12;
  undefined8 in_d0;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined8 uVar13;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  undefined4 extraout_s3_01;
  undefined4 uVar14;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  undefined4 extraout_s5_01;
  undefined4 uVar15;
  undefined4 extraout_s7;
  undefined4 extraout_s7_00;
  undefined4 extraout_s7_01;
  undefined8 uVar16;
  undefined8 uVar17;
  undefined8 uVar18;
  undefined8 uVar19;
  undefined8 uVar20;
  undefined4 local_2c;
  
  uVar4 = (undefined4)((ulonglong)in_d0 >> 0x20);
  pvVar11 = *(void **)(param_1 + 0x38);
  if (pvVar11 == (void *)0x0) {
    pvVar11 = operator_new(0x20);
    FUN_002ed28c();
    *(void **)(param_1 + 0x38) = pvVar11;
    uVar4 = extraout_s1;
  }
  *(undefined1 *)(param_1 + 0x7c) = 0;
  *(undefined1 *)(param_1 + 0xd4) = 0;
  uVar13 = 0x3f8000003f800000;
  *(undefined4 *)(param_1 + 0xb4) = DAT_0052bfe0;
  *(undefined4 *)(param_1 + 0xb8) = DAT_0052bfe4;
  *(undefined4 *)(param_1 + 0xbc) = DAT_0052bfe8;
  *(undefined1 *)(param_1 + 0x7d) = 1;
  *(undefined1 *)(param_1 + 0xc4) = 0;
  if (param_4 != (undefined4 *)0x0) {
    uVar13 = CONCAT44(0x3f800000,*param_4);
  }
  uVar12 = *(undefined4 *)(param_1 + 0x14);
  *(undefined4 *)((int)pvVar11 + 4) = *(undefined4 *)(param_1 + 0x10);
  puVar2 = PTR_DAT_004d9048;
  *(undefined4 *)((int)pvVar11 + 8) = uVar12;
  *(undefined4 *)((int)pvVar11 + 0xc) = 0;
  uVar16 = FloatVectorMult(CONCAT44(uVar4,*(undefined4 *)(puVar2 + 0x98)),0x3f0000003f000000,2,0x20)
  ;
  uVar16 = FloatVectorMult(uVar13,uVar16,2,0x20);
  uVar4 = (undefined4)uVar16;
  *(undefined4 *)((int)pvVar11 + 0x14) = uVar4;
  if (DAT_00556a88 == 0) {
    uVar4 = FUN_0036aa24();
    FUN_0036ab34(&local_2c,uVar4,"textures/effects/bomb_explode.tex");
    FUN_00026e98(&DAT_00556a88,local_2c);
    uVar4 = FUN_00026ed0(&local_2c);
  }
  *(undefined4 *)(param_1 + 100) = 0;
  *(uint *)(param_1 + 0xc) = *(uint *)(param_1 + 0xc) & 0xffffffed | 2;
  *(undefined1 *)(param_1 + 0x8c) = 0;
  *(undefined1 *)(param_1 + 0x90) = 1;
  *(undefined1 *)(param_1 + 0x7e) = 0;
  *(undefined4 *)(param_1 + 200) = 0x3f800000;
  *(undefined4 *)(param_1 + 0xcc) = 0;
  *(undefined4 *)(param_1 + 0xd0) = 0;
  iVar5 = FUN_0001d10c(uVar4,puVar2);
  if (iVar5 != 0) {
    FUN_0001d10c(puVar2);
    puVar3 = PTR_DAT_004d907c;
    iVar5 = FUN_00064000(PTR_DAT_004d907c,3);
    if (iVar5 == 0) {
      FUN_0001d10c(puVar2);
      iVar5 = FUN_00063fe0(puVar3,*(undefined4 *)PTR_DAT_004d9068);
      if (iVar5 != 1) goto LAB_0000716a;
    }
    *(undefined1 *)(param_1 + 0x90) = 0;
  }
LAB_0000716a:
  iVar5 = 0;
  *(undefined4 *)(param_1 + 0x3c) = 0x3f19999a;
  do {
    iVar6 = FUN_00052f80();
    lVar1 = (ulonglong)*(uint *)(iVar6 + 8) * (ulonglong)*(uint *)(iVar6 + 0x10);
    uVar8 = (uint)lVar1;
    uVar7 = *(int *)(iVar6 + 0xc) * *(uint *)(iVar6 + 0x10) +
            *(uint *)(iVar6 + 8) * *(int *)(iVar6 + 0x14) + (int)((ulonglong)lVar1 >> 0x20) +
            *(int *)(iVar6 + 0x1c) + (uint)CARRY4(uVar8,*(uint *)(iVar6 + 0x18));
    *(uint *)(iVar6 + 8) = uVar8 + *(uint *)(iVar6 + 0x18);
    *(uint *)(iVar6 + 0xc) = uVar7;
    iVar9 = param_1 + iVar5 * 2;
    *(short *)(iVar9 + 0x84) = (short)((ulonglong)uVar7 * 7 >> 0x20) + 1;
    iVar6 = FUN_00052f80();
    iVar5 = iVar5 + 1;
    lVar1 = (ulonglong)*(uint *)(iVar6 + 8) * (ulonglong)*(uint *)(iVar6 + 0x10);
    uVar8 = (uint)lVar1;
    uVar7 = *(int *)(iVar6 + 0xc) * *(uint *)(iVar6 + 0x10) +
            *(uint *)(iVar6 + 8) * *(int *)(iVar6 + 0x14) + (int)((ulonglong)lVar1 >> 0x20) +
            *(int *)(iVar6 + 0x1c) + (uint)CARRY4(uVar8,*(uint *)(iVar6 + 0x18));
    *(uint *)(iVar6 + 8) = uVar8 + *(uint *)(iVar6 + 0x18);
    *(uint *)(iVar6 + 0xc) = uVar7;
    *(short *)(iVar9 + 0x88) = (short)((ulonglong)uVar7 * 0x167 >> 0x20);
  } while (iVar5 != 2);
  iVar5 = FUN_0001d10c(puVar2);
  uVar4 = extraout_s7;
  uVar12 = extraout_s1_00;
  uVar15 = extraout_s5;
  uVar14 = extraout_s3;
  if (iVar5 != 0) {
    FUN_0001d10c(puVar2);
    iVar5 = FUN_00063fe0(PTR_DAT_004d907c,*(undefined4 *)PTR_DAT_004d9078);
    uVar4 = extraout_s7_00;
    uVar12 = extraout_s1_01;
    uVar15 = extraout_s5_00;
    uVar14 = extraout_s3_00;
    if (iVar5 == 1) {
      iVar5 = 0;
      do {
        iVar6 = FUN_00052f80();
        lVar1 = (ulonglong)*(uint *)(iVar6 + 8) * (ulonglong)*(uint *)(iVar6 + 0x10);
        uVar7 = (uint)lVar1;
        iVar10 = param_1 + iVar5 * 2;
        iVar9 = *(int *)(iVar6 + 0xc) * *(uint *)(iVar6 + 0x10) +
                *(uint *)(iVar6 + 8) * *(int *)(iVar6 + 0x14) + (int)((ulonglong)lVar1 >> 0x20) +
                *(int *)(iVar6 + 0x1c) + (uint)CARRY4(uVar7,*(uint *)(iVar6 + 0x18));
        *(uint *)(iVar6 + 8) = uVar7 + *(uint *)(iVar6 + 0x18);
        *(int *)(iVar6 + 0xc) = iVar9;
        *(short *)(iVar10 + 0x84) = 1 - (short)(iVar9 >> 0x1f);
        iVar6 = FUN_00052f80();
        iVar5 = iVar5 + 1;
        lVar1 = (ulonglong)*(uint *)(iVar6 + 8) * (ulonglong)*(uint *)(iVar6 + 0x10);
        uVar8 = (uint)lVar1;
        uVar7 = *(int *)(iVar6 + 0xc) * *(uint *)(iVar6 + 0x10) +
                *(uint *)(iVar6 + 8) * *(int *)(iVar6 + 0x14) + (int)((ulonglong)lVar1 >> 0x20) +
                *(int *)(iVar6 + 0x1c) + (uint)CARRY4(uVar8,*(uint *)(iVar6 + 0x18));
        *(uint *)(iVar6 + 8) = uVar8 + *(uint *)(iVar6 + 0x18);
        *(uint *)(iVar6 + 0xc) = uVar7;
        *(short *)(iVar10 + 0x88) = (short)((ulonglong)uVar7 * 0x77 >> 0x20);
        uVar4 = extraout_s7_01;
        uVar12 = extraout_s1_02;
        uVar15 = extraout_s5_01;
        uVar14 = extraout_s3_01;
      } while (iVar5 != 2);
    }
  }
  *(undefined1 *)(param_1 + 0x98) = 0;
  *(undefined4 *)(param_1 + 0x78) = 0;
  *(undefined4 *)(param_1 + 0x94) = 0;
  uVar18 = CONCAT44(uVar15,*(undefined4 *)(puVar2 + 0x94));
  uVar17 = FloatVectorMult(CONCAT44(uVar12,DAT_0052bf80),uVar18,2,0x20);
  uVar19 = FloatVectorMult(uVar18,CONCAT44(uVar14,DAT_0052bf84),2,0x20);
  uVar16 = CONCAT44(uVar12,DAT_00007340);
  uVar20 = FloatVectorMult(uVar18,CONCAT44(uVar4,DAT_0052bf88),2,0x20);
  uVar18 = FloatVectorMult(uVar17,uVar16,2,0x20);
  uVar17 = FloatVectorMult(uVar19,uVar16,2,0x20);
  uVar19 = FloatVectorMult(uVar20,uVar16,2,0x20);
  uVar16 = FloatVectorMult(uVar13,uVar18,2,0x20);
  uVar18 = FloatVectorMult(uVar13,uVar17,2,0x20);
  uVar13 = FloatVectorMult(uVar13,uVar19,2,0x20);
  *(int *)(param_1 + 0x28) = (int)uVar16;
  *(int *)(param_1 + 0x2c) = (int)uVar18;
  uVar4 = (undefined4)uVar13;
  *(undefined4 *)(param_1 + 0x30) = uVar4;
  *(undefined4 *)(param_1 + 0xc0) = 0;
  *(int *)(param_1 + 0xa8) = (int)uVar16;
  *(int *)(param_1 + 0xac) = (int)uVar18;
  *(undefined4 *)(param_1 + 0xb0) = uVar4;
  *(undefined4 *)(param_1 + 0x9c) = 0;
  *(undefined4 *)(param_1 + 0xa0) = 0xc1400000;
  *(undefined4 *)(param_1 + 0xa4) = 0;
  uVar4 = FUN_000219f4(uVar4);
  *(undefined4 *)(param_1 + 0x80) = uVar4;
  return;
}


```

## FUN_000073d0 — 000073d0

- 函数名: FUN_000073d0
- 函数体: 3727 字节
- 调用者数: 0 / 被调用者数: 37

```c

void FUN_000073d0(int param_1,undefined4 param_2)

{
  undefined *puVar1;
  undefined *puVar2;
  undefined *puVar3;
  undefined *puVar4;
  undefined *puVar5;
  int *piVar6;
  undefined4 uVar7;
  int *piVar8;
  int iVar9;
  int iVar10;
  undefined4 extraout_r1;
  int iVar11;
  undefined4 extraout_r1_00;
  undefined4 *puVar12;
  uint uVar13;
  int iVar14;
  bool bVar15;
  bool bVar16;
  undefined4 extraout_s0;
  float fVar17;
  undefined4 extraout_s0_00;
  uint extraout_s0_01;
  uint extraout_s0_02;
  float fVar18;
  uint uVar19;
  uint extraout_s0_03;
  uint extraout_s0_04;
  uint extraout_s0_05;
  undefined4 extraout_s0_06;
  undefined8 in_d0;
  undefined8 uVar20;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined4 extraout_s1_03;
  undefined4 extraout_s1_04;
  ulonglong uVar21;
  uint extraout_s1_05;
  undefined4 extraout_s1_06;
  undefined4 extraout_s1_07;
  undefined4 extraout_s1_08;
  undefined4 extraout_s1_09;
  undefined4 extraout_s1_10;
  undefined4 extraout_s1_11;
  undefined4 extraout_s1_12;
  uint extraout_s1_13;
  undefined4 extraout_s1_14;
  undefined4 extraout_s1_15;
  uint extraout_s1_16;
  uint extraout_s1_17;
  undefined4 extraout_s1_18;
  uint extraout_s3;
  ulonglong uVar22;
  undefined4 extraout_s3_00;
  uint extraout_s3_01;
  uint extraout_s3_02;
  undefined4 extraout_s3_03;
  undefined4 extraout_s3_04;
  longlong lVar23;
  uint extraout_s3_05;
  undefined4 extraout_s3_06;
  undefined4 extraout_s3_07;
  undefined4 extraout_s3_08;
  undefined4 extraout_s3_09;
  float fVar24;
  undefined8 in_d2;
  uint extraout_s5;
  uint extraout_s5_00;
  uint extraout_s5_01;
  undefined4 extraout_s5_02;
  undefined8 uVar25;
  longlong lVar26;
  uint extraout_s5_03;
  undefined4 extraout_s5_04;
  undefined4 extraout_s5_05;
  undefined4 extraout_s5_06;
  undefined4 extraout_s5_07;
  undefined4 extraout_s5_08;
  float fVar27;
  undefined4 extraout_s7;
  undefined4 extraout_s7_00;
  undefined4 extraout_s7_01;
  undefined4 extraout_s7_02;
  undefined4 extraout_s7_03;
  undefined4 extraout_s9;
  undefined4 extraout_s9_00;
  undefined4 extraout_s9_01;
  undefined4 extraout_s9_02;
  undefined4 extraout_s9_03;
  undefined4 extraout_s11;
  undefined4 extraout_s11_00;
  undefined4 extraout_s13;
  undefined4 extraout_s15;
  undefined8 uVar28;
  float fVar29;
  undefined8 unaff_d9;
  undefined4 uVar30;
  undefined8 unaff_d10;
  undefined4 uVar31;
  undefined8 unaff_d11;
  undefined4 uVar32;
  undefined8 unaff_d12;
  undefined8 uVar33;
  undefined8 uVar34;
  double dVar35;
  double dVar36;
  undefined8 uVar37;
  undefined8 uVar38;
  undefined8 uVar39;
  undefined8 uVar40;
  undefined8 uVar41;
  undefined8 uVar42;
  undefined8 uVar43;
  undefined1 auStack_154 [20];
  undefined4 local_140;
  undefined1 auStack_134 [20];
  undefined4 local_120;
  undefined1 auStack_114 [12];
  undefined1 auStack_108 [20];
  undefined4 local_f4;
  undefined1 auStack_e8 [20];
  undefined4 local_d4;
  undefined1 auStack_c8 [12];
  undefined4 local_bc;
  undefined1 auStack_b8 [12];
  undefined4 local_ac;
  undefined4 local_a8;
  undefined4 local_a4;
  undefined **local_a0;
  undefined *local_9c;
  undefined4 local_98 [8];
  undefined1 local_78;
  undefined1 auStack_74 [4];
  float local_70;
  undefined1 auStack_6c [4];
  float local_68;
  int local_64;
  
  puVar2 = PTR_DAT_004d9048;
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_64 = *(int *)PTR____stack_chk_guard_004d9044;
  uVar28 = FloatVectorMult(CONCAT44((int)((ulonglong)in_d2 >> 0x20),*(undefined4 *)(param_1 + 200)),
                           CONCAT44(param_2,param_2),2,0x20);
  uVar20 = FloatVectorAdd(uVar28,CONCAT44((int)((ulonglong)in_d0 >> 0x20),
                                          *(undefined4 *)(param_1 + 0xd0)),2);
  fVar18 = (float)uVar28;
  uVar7 = (undefined4)((ulonglong)unaff_d9 >> 0x20);
  uVar25 = CONCAT44(uVar7,fVar18 / DAT_00007764);
  *(int *)(param_1 + 0xd0) = (int)uVar20;
  piVar6 = (int *)FUN_0001d10c(puVar2);
  uVar20 = CONCAT44(extraout_s1,extraout_s0);
  if (*(char *)(param_1 + 0x7e) == '\0') {
    uVar21 = CONCAT44(extraout_s1,*(float *)(param_1 + 0xc0));
    uVar30 = extraout_s9;
    uVar19 = extraout_s3;
    uVar13 = extraout_s5;
    uVar31 = extraout_s7;
    if (0.0 < *(float *)(param_1 + 0xc0)) {
      if ((*(int *)(puVar2 + 0x10) != 1) &&
         ((0.0 < *(float *)(puVar2 + 0x24) || (puVar2[0x17] != '\0')))) {
        *(undefined4 *)(param_1 + 0xc0) = 0;
        uVar19 = FUN_000251a8();
        *(uint *)(param_1 + 0x14) = uVar19 ^ 0x80000000;
        *(undefined4 *)(param_1 + 0x1c) = 0;
        *(undefined4 *)(param_1 + 0x20) = 0xbf800000;
        *(undefined4 *)(param_1 + 0x24) = 0;
        uVar21 = CONCAT44(extraout_s1_01,*(undefined4 *)(param_1 + 0xc0));
      }
      fVar24 = DAT_00007768;
      uVar22 = uVar21;
      if (puVar2[10] == '\0') {
        uVar22 = CONCAT44((int)(uVar21 >> 0x20),*(undefined4 *)(puVar2 + 0x44));
      }
      uVar20 = FloatVectorSub(uVar21,uVar22,2,0x20);
      fVar17 = (float)uVar20;
      *(float *)(param_1 + 0xc0) = fVar17;
      if ((((fVar17 <= fVar24) && (fVar24 < (float)uVar21)) && (puVar2[0x17] == '\0')) &&
         (((DAT_00556a74 ^ 1) & 1) != 0)) {
        if ((piVar6 == (int *)0x0) || (iVar9 = FUN_00064000(PTR_DAT_004d907c,3), iVar9 == 0)) {
          local_a0 = &PTR_LAB_0052bf38;
          local_9c = PTR_FUN_004d9058;
          local_78 = 1;
          local_98[0] = 0;
          uVar30 = *(undefined4 *)(puVar2 + 0x1a4);
          FUN_0000a23c(&local_a0,local_98);
          FUN_0002bc94(uVar30,"Throw-bomb",0x3f800000,0x3f800000,local_98,0);
          FUN_0000a298(local_98);
        }
        DAT_00556a74 = 1;
        fVar17 = *(float *)(param_1 + 0xc0);
      }
      if (0.0 < fVar17) goto LAB_00007ff2;
      uVar20 = FUN_00052f80();
      uVar30 = (undefined4)((ulonglong)uVar20 >> 0x20);
      fVar24 = *(float *)((int)uVar20 + 0x68);
      unaff_d10 = CONCAT44((int)((ulonglong)unaff_d10 >> 0x20),fVar24);
      uVar20 = FPToFixed(unaff_d10,0,0,3,0x20);
      uVar33 = FixedToFP(uVar20,0,0,0,0x20);
      iVar9 = (int)uVar20;
      uVar20 = FloatVectorAdd(uVar33,CONCAT44(extraout_s1_02,DAT_0000776c),2);
      if ((float)uVar20 < fVar24) {
        iVar11 = FUN_00052f80();
        uVar20 = FloatVectorSub(unaff_d10,uVar33,2,0x20);
        lVar23 = (ulonglong)*(uint *)(iVar11 + 8) * (ulonglong)*(uint *)(iVar11 + 0x10);
        uVar13 = (uint)lVar23;
        uVar20 = FloatVectorMult(uVar20,CONCAT44(extraout_s1_03,DAT_00007770),2,0x20);
        uVar19 = *(int *)(iVar11 + 0xc) * *(uint *)(iVar11 + 0x10) +
                 *(uint *)(iVar11 + 8) * *(int *)(iVar11 + 0x14) + (int)((ulonglong)lVar23 >> 0x20)
                 + *(int *)(iVar11 + 0x1c) + (uint)CARRY4(uVar13,*(uint *)(iVar11 + 0x18));
        uVar30 = (undefined4)((ulonglong)uVar19 * 100 >> 0x20);
        *(uint *)(iVar11 + 8) = uVar13 + *(uint *)(iVar11 + 0x18);
        *(uint *)(iVar11 + 0xc) = uVar19;
        uVar33 = FixedToFP(CONCAT44(uVar30,uVar30),0,1,0,0x20);
        if ((float)uVar33 < (float)uVar20) {
          iVar9 = iVar9 + 1;
        }
      }
      if (iVar9 < 1) {
        *(undefined4 *)(param_1 + 0xc0) = 0;
        uVar20 = FUN_000251a8();
        uVar30 = (undefined4)((ulonglong)uVar20 >> 0x20);
        *(uint *)(param_1 + 0x14) = (uint)uVar20 ^ 0x80000000;
        *(undefined4 *)(param_1 + 0x1c) = 0;
        *(undefined4 *)(param_1 + 0x20) = 0xbf800000;
        *(undefined4 *)(param_1 + 0x24) = 0;
      }
      else if (1 < iVar9) {
        uVar30 = FUN_00052f80();
        FUN_000568f4(uVar30,iVar9 + -1,0,0);
        uVar30 = extraout_r1;
      }
      if (piVar6 != (int *)0x0) {
        (**(code **)(*piVar6 + 0x44))(piVar6,param_1);
        uVar30 = extraout_r1_00;
      }
      FUN_00006ee8(param_1,uVar30,0);
      uVar21 = (ulonglong)extraout_s1_05 << 0x20;
      uVar30 = extraout_s9_00;
      uVar19 = extraout_s3_01;
      uVar13 = extraout_s5_00;
      uVar31 = extraout_s7_00;
    }
    puVar5 = PTR_DAT_004d907c;
    if (piVar6 == (int *)0x0) {
LAB_00007a24:
      lVar26 = (ulonglong)uVar13 << 0x20;
      lVar23 = (ulonglong)uVar19 << 0x20;
      if (*(char *)(param_1 + 0x90) != '\0') {
        uVar7 = (undefined4)(uVar21 >> 0x20);
        fVar17 = *(float *)(param_1 + 0x9c);
        uVar21 = CONCAT44(uVar7,fVar17);
        fVar24 = *(float *)(param_1 + 0xa0);
        lVar26 = CONCAT44(uVar13,fVar24);
        uVar20 = FloatVectorMult(uVar28,uVar21,2,0x20);
        puVar12 = (undefined4 *)(param_1 + 0x9c);
        lVar23 = FloatVectorAdd(uVar20,CONCAT44(uVar19,*(undefined4 *)(param_1 + 0x1c)),2);
        uVar20 = FloatVectorMult(uVar28,lVar26,2,0x20);
        fVar29 = (float)lVar23;
        *(float *)(param_1 + 0x1c) = fVar29;
        uVar20 = FloatVectorAdd(uVar20,CONCAT44(uVar31,*(undefined4 *)(param_1 + 0x20)),2);
        uVar28 = FloatVectorMult(uVar28,CONCAT44(uVar30,*(undefined4 *)(param_1 + 0xa4)),2,0x20);
        fVar27 = (float)uVar20;
        *(float *)(param_1 + 0x20) = fVar27;
        uVar20 = FloatVectorAdd(uVar28,CONCAT44(uVar30,*(undefined4 *)(param_1 + 0x24)),2);
        *(int *)(param_1 + 0x24) = (int)uVar20;
        if (0.0 <= fVar24 || (0.0 <= fVar24 || 0.0 <= fVar27)) {
          bVar16 = fVar24 < 0.0;
          bVar15 = fVar24 == 0.0;
          if (!bVar15 && !bVar16) {
            bVar16 = fVar27 < 0.0;
            bVar15 = fVar27 == 0.0;
            fVar24 = fVar27;
          }
          if ((bVar15 || bVar16 != NAN(fVar24)) &&
             (0.0 <= fVar17 || (0.0 <= fVar17 || 0.0 <= fVar29))) {
            bVar16 = fVar17 < 0.0;
            bVar15 = fVar17 == 0.0;
            if (!bVar15 && !bVar16) {
              bVar16 = fVar29 < 0.0;
              bVar15 = fVar29 == 0.0;
              fVar17 = fVar29;
            }
            if (bVar15 || bVar16 != NAN(fVar17)) goto LAB_00007b20;
          }
        }
        uVar20 = FloatVectorMult(uVar25,CONCAT44(uVar7,DAT_00007768),2,0x20);
        uVar20 = FloatVectorAdd(uVar20,uVar20,2);
        uVar7 = FUN_00009b50(puVar12);
        lVar26 = (ulonglong)extraout_s5_03 << 0x20;
        lVar23 = (ulonglong)extraout_s3_05 << 0x20;
        uVar28 = FloatVectorAdd(uVar20,CONCAT44(uVar7,uVar7),2);
        uVar20 = FloatVectorMult(CONCAT44(extraout_s1_09,*puVar12),uVar28,2,0x20);
        *puVar12 = (int)uVar20;
        uVar20 = FloatVectorMult(uVar28,CONCAT44((int)((ulonglong)uVar20 >> 0x20),
                                                 *(undefined4 *)(param_1 + 0xa0)),2,0x20);
        *(int *)(param_1 + 0xa0) = (int)uVar20;
        uVar21 = FloatVectorMult(uVar28,CONCAT44((int)((ulonglong)uVar20 >> 0x20),
                                                 *(undefined4 *)(param_1 + 0xa4)),2,0x20);
        *(int *)(param_1 + 0xa4) = (int)uVar21;
      }
LAB_00007b20:
      uVar7 = (undefined4)(uVar21 >> 0x20);
      uVar20 = FloatVectorMult(uVar25,CONCAT44(uVar7,*(undefined4 *)(param_1 + 0x1c)),2,0x20);
      uVar30 = (undefined4)((ulonglong)lVar23 >> 0x20);
      uVar20 = FloatVectorAdd(uVar20,CONCAT44((int)((ulonglong)lVar26 >> 0x20),
                                              *(undefined4 *)(param_1 + 0x10)),2);
      uVar28 = FloatVectorMult(uVar25,CONCAT44(uVar30,*(undefined4 *)(param_1 + 0x20)),2,0x20);
      *(int *)(param_1 + 0x10) = (int)uVar20;
      uVar20 = FloatVectorAdd(uVar28,CONCAT44(uVar30,*(undefined4 *)(param_1 + 0x14)),2);
      uVar28 = FloatVectorMult(uVar25,CONCAT44(uVar7,*(undefined4 *)(param_1 + 0x24)),2,0x20);
      *(int *)(param_1 + 0x14) = (int)uVar20;
      uVar21 = FloatVectorAdd(uVar28,CONCAT44(uVar7,*(undefined4 *)(param_1 + 0x18)),2);
      *(int *)(param_1 + 0x18) = (int)uVar21;
    }
    else {
      iVar9 = FUN_00064020(PTR_DAT_004d907c,4);
      uVar19 = FUN_00063fe0(puVar5,*(undefined4 *)PTR_DAT_004d9074);
      uVar21 = CONCAT44(extraout_s1_06,extraout_s0_00);
      bVar16 = uVar19 != 0;
      if (!bVar16) {
        uVar19 = (uint)*(byte *)(param_1 + 0x7c);
      }
      if ((bVar16 || uVar19 != 0) || (*(int *)(param_1 + 0xd8) != 0)) {
        if (*(int *)(param_1 + 0xd8) == 0) {
          if (*(char *)(param_1 + 0x7c) == '\0') {
            uVar25 = CONCAT44(extraout_s5_01,*(undefined4 *)(param_1 + 0xa0));
            uVar40 = FloatVectorMult(uVar28,uVar28,2,0x20);
            uVar21 = CONCAT44(extraout_s1_06,*(undefined4 *)(param_1 + 0x20));
            uVar33 = CONCAT44(extraout_s7_01,*(undefined4 *)(param_1 + 0x9c));
            uVar37 = FloatVectorMult(uVar25,0x3f0000003f000000,2,0x20);
            uVar20 = CONCAT44(extraout_s3_02,*(undefined4 *)(param_1 + 0x1c));
            uVar41 = FloatVectorMult(uVar28,uVar21,2,0x20);
            uVar43 = FloatVectorMult(uVar28,uVar20,2,0x20);
            uVar39 = CONCAT44(extraout_s11,*(undefined4 *)(param_1 + 0xa4));
            uVar34 = CONCAT44(extraout_s9_01,*(undefined4 *)(param_1 + 0x24));
            uVar37 = FloatVectorMult(uVar40,uVar37,2,0x20);
            uVar41 = FloatVectorAdd(uVar37,uVar41,2);
            uVar42 = FloatVectorMult(uVar33,0x3f0000003f000000,2,0x20);
            uVar37 = FloatVectorMult(uVar39,0x3f0000003f000000,2,0x20);
            uVar38 = FloatVectorMult(uVar41,CONCAT44(extraout_s15,DAT_00008280),2,0x20);
            uVar42 = FloatVectorMult(uVar40,uVar42,2,0x20);
            uVar37 = FloatVectorMult(uVar40,uVar37,2,0x20);
            uVar41 = FloatVectorMult(uVar28,uVar34,2,0x20);
            uVar40 = FloatVectorAdd(uVar42,uVar43,2);
            uVar37 = FloatVectorAdd(uVar37,uVar41,2);
            uVar40 = FloatVectorMult(uVar40,CONCAT44(extraout_s15,DAT_00008280),2,0x20);
            uVar41 = FloatVectorMult(uVar37,CONCAT44(extraout_s15,DAT_00008280),2,0x20);
            uVar37 = FloatVectorAdd(uVar40,CONCAT44(extraout_s13,*(undefined4 *)(param_1 + 0x10)),2)
            ;
            *(int *)(param_1 + 0x10) = (int)uVar37;
            uVar37 = FloatVectorAdd(uVar38,CONCAT44((int)((ulonglong)uVar37 >> 0x20),
                                                    *(undefined4 *)(param_1 + 0x14)),2);
            *(int *)(param_1 + 0x14) = (int)uVar37;
            uVar37 = FloatVectorAdd(uVar41,CONCAT44((int)((ulonglong)uVar37 >> 0x20),
                                                    *(undefined4 *)(param_1 + 0x18)),2);
            *(int *)(param_1 + 0x18) = (int)uVar37;
            if (*(char *)(param_1 + 0x90) != '\0') {
              uVar33 = FloatVectorMult(uVar28,uVar33,2,0x20);
              uVar25 = FloatVectorMult(uVar28,uVar25,2,0x20);
              uVar28 = FloatVectorMult(uVar28,uVar39,2,0x20);
              uVar20 = FloatVectorAdd(uVar33,uVar20,2);
              uVar21 = FloatVectorAdd(uVar25,uVar21,2);
              uVar28 = FloatVectorAdd(uVar28,uVar34,2);
              *(int *)(param_1 + 0x1c) = (int)uVar20;
              *(int *)(param_1 + 0x20) = (int)uVar21;
              *(int *)(param_1 + 0x24) = (int)uVar28;
            }
          }
          else {
            *(undefined4 *)(param_1 + 0x1c) = DAT_0052bfe0;
            *(undefined4 *)(param_1 + 0x20) = DAT_0052bfe4;
            *(undefined4 *)(param_1 + 0x24) = DAT_0052bfe8;
          }
        }
        else {
          FUN_00072e58(*(int *)(param_1 + 0xd8),fVar18);
          iVar9 = FUN_00072b64(*(undefined4 *)(param_1 + 0xd8));
          uVar25 = FloatVectorSub(CONCAT44(extraout_s9_02,*(undefined4 *)(iVar9 + 4)),
                                  CONCAT44(extraout_s5_02,*(undefined4 *)(param_1 + 0x10)),2,0x20);
          uVar28 = FloatVectorSub(CONCAT44(extraout_s7_02,*(undefined4 *)(iVar9 + 8)),
                                  CONCAT44(extraout_s3_03,*(undefined4 *)(param_1 + 0x14)),2,0x20);
          uVar20 = FloatVectorSub(CONCAT44(extraout_s11_00,*(undefined4 *)(iVar9 + 0xc)),
                                  CONCAT44(extraout_s1_07,*(undefined4 *)(param_1 + 0x18)),2,0x20);
          *(int *)(param_1 + 0x1c) = (int)uVar25;
          *(int *)(param_1 + 0x20) = (int)uVar28;
          *(int *)(param_1 + 0x24) = (int)uVar20;
          iVar9 = FUN_00072b64((int)uVar20,*(undefined4 *)(param_1 + 0xd8));
          uVar21 = (ulonglong)extraout_s0_01;
          *(undefined4 *)(param_1 + 0x10) = *(undefined4 *)(iVar9 + 4);
          *(undefined4 *)(param_1 + 0x14) = *(undefined4 *)(iVar9 + 8);
          *(undefined4 *)(param_1 + 0x18) = *(undefined4 *)(iVar9 + 0xc);
        }
      }
      else {
        uVar30 = extraout_s9_01;
        uVar19 = extraout_s3_02;
        uVar13 = extraout_s5_01;
        uVar31 = extraout_s7_01;
        if (iVar9 == 0) goto LAB_00007a24;
        fVar17 = *(float *)(iVar9 + 0x68);
        fVar29 = *(float *)(iVar9 + 0x6c);
        uVar33 = FloatVectorSub(CONCAT44(extraout_s1_06,*(undefined4 *)(param_1 + 0x10)),
                                CONCAT44((int)((ulonglong)unaff_d10 >> 0x20),fVar17),2,0x20);
        uVar20 = CONCAT44(extraout_s3_02,*(undefined4 *)(param_1 + 0x18));
        uVar25 = FloatVectorSub(CONCAT44(extraout_s5_01,*(undefined4 *)(param_1 + 0x14)),
                                CONCAT44(uVar7,fVar29),2,0x20);
        uVar34 = FloatVectorSub(uVar20,uVar20,2,0x20);
        uVar39 = FloatVectorMult(uVar33,uVar33,2,0x20);
        uVar20 = FloatVectorMult(uVar25,uVar25,2,0x20);
        uVar34 = FloatVectorMult(uVar34,uVar34,2,0x20);
        uVar20 = FloatVectorAdd(uVar39,uVar20,2);
        uVar20 = FloatVectorAdd(uVar20,uVar34,2);
        fVar24 = (float)FUN_00301044((int)uVar20);
        dVar35 = (double)_atan2(SUB84((double)(float)uVar25,0),
                                (int)((ulonglong)(double)(float)uVar25 >> 0x20),
                                SUB84((double)(float)uVar33,0),
                                (int)((ulonglong)(double)(float)uVar33 >> 0x20));
        uVar20 = FloatVectorMult(uVar28,CONCAT44(extraout_s3_04,*(undefined4 *)(param_1 + 0x1c)),2,
                                 0x20);
        uVar20 = FloatVectorAdd(CONCAT44(extraout_s1_08,(float)dVar35),uVar20,2);
        uVar7 = (undefined4)((ulonglong)(double)(float)uVar20 >> 0x20);
        uVar30 = SUB84((double)(float)uVar20,0);
        dVar35 = (double)_cos(uVar30,uVar7);
        dVar36 = (double)_sin(uVar30,uVar7);
        fVar17 = (float)((double)fVar17 + (double)fVar24 * dVar35);
        uVar21 = (ulonglong)(uint)fVar17;
        *(float *)(param_1 + 0x10) = fVar17;
        *(float *)(param_1 + 0x14) = (float)((double)fVar29 + (double)fVar24 * dVar36);
      }
    }
    if (0.0 < fVar18) {
      iVar9 = 0;
      do {
        iVar11 = param_1 + iVar9 * 2;
        iVar9 = iVar9 + 1;
        *(short *)(iVar11 + 0x88) = *(short *)(iVar11 + 0x84) + *(short *)(iVar11 + 0x88);
      } while (iVar9 != 2);
    }
  }
  else {
    if (*(char *)(param_1 + 0x98) == '\0') {
      uVar21 = FloatVectorSub(CONCAT44(extraout_s1,*(undefined4 *)(param_1 + 0x3c)),
                              CONCAT44(extraout_s3,*(undefined4 *)(puVar2 + 0x44)),2,0x20);
      *(float *)(param_1 + 0x3c) = (float)uVar21;
      if ((int)((uint)((float)uVar21 < 0.0) << 0x1f) < 0) {
        uVar7 = FUN_000065c4();
        piVar8 = (int *)FUN_0000698c(uVar7,5,1);
        piVar8[4] = *(int *)(param_1 + 0x10);
        piVar8[5] = *(int *)(param_1 + 0x14);
        piVar8[6] = *(int *)(param_1 + 0x18);
        uVar19 = (**(code **)(*piVar8 + 8))(piVar8,0,0,0);
        uVar21 = (ulonglong)uVar19;
        *(undefined4 *)(param_1 + 0x3c) = 0x3d4ccccd;
      }
    }
    else {
      if (*(char *)(param_1 + 0x90) != '\0') {
        fVar17 = *(float *)(param_1 + 0x9c);
        uVar20 = CONCAT44(extraout_s1,fVar17);
        fVar24 = *(float *)(param_1 + 0xa0);
        uVar33 = FloatVectorMult(uVar28,uVar20,2,0x20);
        puVar12 = (undefined4 *)(param_1 + 0x9c);
        uVar33 = FloatVectorAdd(uVar33,CONCAT44(extraout_s3,*(undefined4 *)(param_1 + 0x1c)),2);
        uVar34 = FloatVectorMult(uVar28,CONCAT44(extraout_s5,fVar24),2,0x20);
        fVar29 = (float)uVar33;
        *(float *)(param_1 + 0x1c) = fVar29;
        uVar33 = FloatVectorAdd(uVar34,CONCAT44(extraout_s7,*(undefined4 *)(param_1 + 0x20)),2);
        uVar28 = FloatVectorMult(uVar28,CONCAT44(extraout_s9,*(undefined4 *)(param_1 + 0xa4)),2,0x20
                                );
        fVar27 = (float)uVar33;
        *(float *)(param_1 + 0x20) = fVar27;
        uVar28 = FloatVectorAdd(uVar28,CONCAT44(extraout_s9,*(undefined4 *)(param_1 + 0x24)),2);
        *(int *)(param_1 + 0x24) = (int)uVar28;
        if (0.0 <= fVar24 || (0.0 <= fVar24 || 0.0 <= fVar27)) {
          bVar16 = fVar24 < 0.0;
          bVar15 = fVar24 == 0.0;
          if (!bVar15 && !bVar16) {
            bVar16 = fVar27 < 0.0;
            bVar15 = fVar27 == 0.0;
            fVar24 = fVar27;
          }
          if ((bVar15 || bVar16 != NAN(fVar24)) &&
             (0.0 <= fVar17 || (0.0 <= fVar17 || 0.0 <= fVar29))) {
            bVar16 = fVar17 < 0.0;
            bVar15 = fVar17 == 0.0;
            if (!bVar15 && !bVar16) {
              bVar16 = fVar29 < 0.0;
              bVar15 = fVar29 == 0.0;
              fVar17 = fVar29;
            }
            if (bVar15 || bVar16 != NAN(fVar17)) goto LAB_00007784;
          }
        }
        uVar20 = FloatVectorMult(uVar25,CONCAT44(extraout_s1,DAT_00007768),2,0x20);
        unaff_d10 = FloatVectorAdd(uVar20,uVar20,2);
        uVar7 = FUN_00009b50(puVar12);
        uVar28 = FloatVectorAdd(unaff_d10,CONCAT44(uVar7,uVar7),2);
        uVar20 = FloatVectorMult(CONCAT44(extraout_s1_00,*puVar12),uVar28,2,0x20);
        *puVar12 = (int)uVar20;
        uVar20 = FloatVectorMult(uVar28,CONCAT44((int)((ulonglong)uVar20 >> 0x20),
                                                 *(undefined4 *)(param_1 + 0xa0)),2,0x20);
        *(int *)(param_1 + 0xa0) = (int)uVar20;
        uVar20 = FloatVectorMult(uVar28,CONCAT44((int)((ulonglong)uVar20 >> 0x20),
                                                 *(undefined4 *)(param_1 + 0xa4)),2,0x20);
        *(int *)(param_1 + 0xa4) = (int)uVar20;
      }
LAB_00007784:
      uVar30 = *(undefined4 *)(param_1 + 0x24);
      uVar31 = *(undefined4 *)(param_1 + 0x20);
      uVar32 = *(undefined4 *)(param_1 + 0x1c);
      fVar24 = *(float *)(puVar2 + 0xc4);
      uVar7 = FUN_003ecb20((int)uVar20);
      FUN_003ed850(auStack_6c,uVar7);
      fVar17 = *(float *)(puVar2 + 200);
      uVar7 = FUN_003ecb20();
      FUN_003ed850(auStack_74,uVar7);
      uVar20 = FloatVectorMult(uVar25,CONCAT44((int)((ulonglong)unaff_d12 >> 0x20),uVar32),2,0x20);
      uVar20 = FloatVectorSub(uVar20,CONCAT44(extraout_s3_00,fVar24 / (DAT_00007774 / local_68)),2,
                              0x20);
      uVar28 = FloatVectorMult(uVar25,CONCAT44((int)((ulonglong)unaff_d11 >> 0x20),uVar31),2,0x20);
      uVar20 = FloatVectorAdd(uVar20,CONCAT44(extraout_s3_00,*(undefined4 *)(param_1 + 0x10)),2);
      uVar28 = FloatVectorAdd(uVar28,CONCAT44(extraout_s1_04,fVar17 / (DAT_00007774 / local_70)),2);
      *(int *)(param_1 + 0x10) = (int)uVar20;
      uVar20 = FloatVectorAdd(uVar28,CONCAT44((int)((ulonglong)uVar20 >> 0x20),
                                              *(undefined4 *)(param_1 + 0x14)),2);
      uVar28 = FloatVectorMult(uVar25,CONCAT44((int)((ulonglong)unaff_d10 >> 0x20),uVar30),2,0x20);
      *(int *)(param_1 + 0x14) = (int)uVar20;
      uVar21 = FloatVectorAdd(uVar28,CONCAT44((int)((ulonglong)uVar20 >> 0x20),
                                              *(undefined4 *)(param_1 + 0x18)),2);
      *(int *)(param_1 + 0x18) = (int)uVar21;
      if (0.0 < fVar18) {
        iVar9 = 0;
        do {
          iVar11 = param_1 + iVar9 * 2;
          iVar9 = iVar9 + 1;
          uVar28 = FixedToFP((ulonglong)
                             CONCAT24(*(ushort *)(iVar11 + 0x84),(uint)*(ushort *)(iVar11 + 0x84)),0
                             ,0,0,0x20);
          uVar20 = FixedToFP((ulonglong)
                             CONCAT24(*(ushort *)(iVar11 + 0x88),(uint)*(ushort *)(iVar11 + 0x88)),0
                             ,0,0,0x20);
          uVar28 = FloatVectorMult(uVar25,uVar28,2,0x20);
          uVar20 = FloatVectorAdd(uVar20,uVar28,2);
          uVar21 = FPToFixed(uVar20,0,0,3,0x20);
          *(short *)(iVar11 + 0x88) = (short)uVar21;
        } while (iVar9 != 2);
      }
    }
    iVar9 = *(int *)(param_1 + 0x38);
    *(undefined4 *)(iVar9 + 0x14) = 0x3c23d70a;
    *(undefined4 *)(iVar9 + 4) = 0x447a0000;
    *(undefined4 *)(iVar9 + 8) = 0x447a0000;
    *(undefined4 *)(iVar9 + 0xc) = 0;
  }
  puVar5 = PTR_DAT_004d907c;
  if (piVar6 != (int *)0x0) {
    iVar9 = FUN_00064020(PTR_DAT_004d907c,2);
    iVar11 = FUN_00063fe0(puVar5,*(undefined4 *)PTR_DAT_004d9060);
    puVar3 = PTR_DAT_004d905c;
    uVar21 = (ulonglong)extraout_s0_02;
    if (iVar11 == 1) {
      if (*(char *)(param_1 + 0x98) == '\0') {
        iVar11 = FUN_00063fe0(puVar5,*(undefined4 *)PTR_DAT_004d9078);
        fVar18 = *(float *)(param_1 + 0x20);
        uVar21 = CONCAT44(extraout_s1_10,fVar18);
        iVar9 = (uint)(fVar18 < 0.0) << 0x1f;
        if (iVar11 == 1) {
          if (iVar9 < 0) {
            uVar20 = FloatVectorMult(CONCAT44(extraout_s9_03,
                                              *(undefined4 *)(*(int *)(param_1 + 0x38) + 0x14)),
                                     CONCAT44(extraout_s7_03,DAT_00007fa0),2,0x20);
            uVar20 = FloatVectorAdd(CONCAT44(extraout_s5_04,*(undefined4 *)(param_1 + 0x14)),uVar20,
                                    2);
            if ((int)((uint)((float)uVar20 < DAT_00007fa4) << 0x1f) < 0) {
              uVar28 = FloatVectorNeg(uVar21,2,2);
              uVar20 = 0x3f8000003f800000;
              fVar24 = (float)uVar28;
              *(float *)(param_1 + 0x20) = fVar24;
              if (-1 < (int)((uint)(fVar18 < -0.0) << 0x1f)) {
                puVar12 = &DAT_00008288;
                if (-0.0 < fVar18) {
                  puVar12 = &DAT_0000828c;
                }
                uVar20 = CONCAT44(0x80000000,*puVar12);
              }
              fVar17 = fVar24;
              if (-0.0 < fVar18) {
                fVar17 = fVar18;
              }
              if (-1 < (int)((uint)(fVar17 < 9.5) << 0x1f)) {
                fVar24 = 9.5;
              }
              if (fVar18 <= -0.0 || -1 < (int)((uint)(fVar17 < 9.5) << 0x1f)) {
                uVar21 = CONCAT44(extraout_s1_10,fVar24);
              }
              uVar20 = FloatVectorMult(uVar20,uVar21,2,0x20);
              *(int *)(param_1 + 0x20) = (int)uVar20;
              FUN_00063b4c((int)uVar20,1,*(undefined1 *)(param_1 + 0xd4));
              local_ac = 0;
              local_a8 = 0;
              local_a4 = 0;
              uVar19 = FUN_0000577c(*(undefined4 *)(puVar2 + 0x58),&local_ac,0x3f400000,0x3ccccccd,
                                    0x40c00000);
              uVar21 = (ulonglong)uVar19;
            }
          }
        }
        else if (iVar9 < 0) {
          uVar20 = FloatVectorMult(CONCAT44(extraout_s7_03,
                                            *(undefined4 *)(*(int *)(param_1 + 0x38) + 0x14)),
                                   0xc0000000c0000000,2,0x20);
          uVar20 = FloatVectorAdd(CONCAT44(extraout_s5_04,*(undefined4 *)(param_1 + 0x14)),uVar20,2)
          ;
          if ((int)((uint)((float)uVar20 < DAT_00007fa4) << 0x1f) < 0) {
            uVar28 = FloatVectorNeg(uVar21,2,2);
            uVar20 = 0x3f8000003f800000;
            fVar24 = (float)uVar28;
            *(float *)(param_1 + 0x20) = fVar24;
            if (-1 < (int)((uint)(fVar18 < -0.0) << 0x1f)) {
              puVar12 = &DAT_00008288;
              if (-0.0 < fVar18) {
                puVar12 = &DAT_0000828c;
              }
              uVar20 = CONCAT44(0x80000000,*puVar12);
            }
            fVar17 = fVar24;
            if (-0.0 < fVar18) {
              fVar17 = fVar18;
            }
            if (-1 < (int)((uint)(fVar17 < 9.5) << 0x1f)) {
              fVar24 = 9.5;
            }
            if (-1 < (int)((uint)(fVar17 < 9.5) << 0x1f) || fVar18 <= -0.0) {
              uVar21 = CONCAT44(extraout_s1_10,fVar24);
            }
            uVar20 = FloatVectorMult(uVar20,uVar21,2,0x20);
            *(int *)(param_1 + 0x20) = (int)uVar20;
            uVar19 = FUN_00063b4c((int)uVar20,1,*(undefined1 *)(param_1 + 0xd4));
            uVar21 = (ulonglong)uVar19;
          }
        }
      }
    }
    else if (iVar9 == 0) {
      iVar9 = FUN_00063fe0(puVar5,*(undefined4 *)PTR_DAT_004d905c);
      if (iVar9 == 0) {
        iVar9 = FUN_00063fe0(puVar5,*(undefined4 *)PTR_DAT_004d906c);
        uVar21 = (ulonglong)extraout_s0_03;
        if (iVar9 != 1) goto LAB_00007f18;
      }
      puVar4 = PTR_DAT_004d906c;
      iVar9 = FUN_00063fe0(puVar5,*(undefined4 *)PTR_DAT_004d906c);
      iVar11 = 0;
      if (iVar9 == 1) {
        iVar11 = FUN_00063e80(puVar5,*(undefined4 *)puVar4);
      }
      iVar9 = FUN_00063fe0(puVar5,*(undefined4 *)puVar3);
      uVar19 = extraout_s0_04;
      if (iVar9 == 1) {
        iVar11 = FUN_00063e80(puVar5,*(undefined4 *)puVar3);
        uVar19 = extraout_s0_05;
      }
      uVar21 = (ulonglong)uVar19;
      if (((*(char *)(param_1 + 0x98) == '\0') && (*(char *)(param_1 + 0x90) != '\0')) &&
         (uVar21 = (ulonglong)(uint)*(float *)(param_1 + 0x20),
         (int)((uint)(*(float *)(param_1 + 0x20) < 0.0) << 0x1f) < 0)) {
        iVar14 = 0;
        local_bc = 0;
        uVar7 = FUN_000065c4();
        iVar9 = FUN_00006ad0(uVar7,1,&local_bc);
        if (iVar9 != 0) {
          iVar14 = 0;
          do {
            if (((*(char *)(iVar9 + 0x1bc) == '\0') &&
                (*(float *)(iVar9 + 0x10) == *(float *)(param_1 + 0x10))) &&
               ((iVar14 = iVar14 + 1, *(uint *)(param_1 + 4) < *(uint *)(iVar9 + 4) &&
                (*(float *)(iVar9 + 0x20) == 0.0)))) {
              FUN_002ed2c0(auStack_e8,*(int *)(param_1 + 0x38) + 4,*(undefined4 *)(iVar11 + 0x10));
              FUN_002ed2c0(auStack_108,*(int *)(iVar9 + 0x38) + 4,*(undefined4 *)(iVar11 + 0x10));
              uVar20 = FloatVectorMult(CONCAT44(extraout_s1_11,local_d4),0x3f4000003f400000,2,0x20);
              local_d4 = (undefined4)uVar20;
              uVar20 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar20 >> 0x20),local_f4),
                                       0x3f4000003f400000,2,0x20);
              local_f4 = (undefined4)uVar20;
              iVar10 = FUN_002ed344(local_f4,auStack_e8,auStack_108,auStack_c8);
              if (iVar10 == 1) {
                uVar20 = FloatVectorMult(CONCAT44(extraout_s1_12,*(undefined4 *)(iVar11 + 0x10)),
                                         0x3f4000003f400000,2,0x20);
                uVar20 = FloatVectorAdd(uVar20,uVar20,2);
                uVar20 = FloatVectorAdd(CONCAT44(extraout_s1_12,
                                                 *(undefined4 *)(*(int *)(iVar9 + 0x38) + 8)),uVar20
                                        ,2);
                *(int *)(param_1 + 0x14) = (int)uVar20;
                *(undefined4 *)(param_1 + 0x20) = 0;
                iVar9 = *(int *)(param_1 + 0x38);
                uVar7 = *(undefined4 *)(param_1 + 0x10);
                *(undefined4 *)(iVar9 + 4) = uVar7;
                *(undefined4 *)(iVar9 + 8) = *(undefined4 *)(param_1 + 0x14);
                *(undefined4 *)(iVar9 + 0xc) = *(undefined4 *)(param_1 + 0x18);
                FUN_002ed304(uVar7,auStack_108);
                FUN_002ed304(auStack_e8);
                break;
              }
              FUN_002ed304(auStack_108);
              FUN_002ed304(auStack_e8);
            }
            uVar7 = FUN_000065c4();
            iVar9 = FUN_00006af0(uVar7,1,&local_bc);
          } while (iVar9 != 0);
        }
        uVar7 = FUN_000065c4();
        iVar9 = FUN_00006ad0(uVar7,2,&local_bc);
        uVar21 = (ulonglong)extraout_s1_13 << 0x20;
        uVar7 = extraout_s3_06;
        uVar30 = extraout_s5_05;
        if (iVar9 != 0) {
          do {
            if (((iVar9 != param_1) && (*(float *)(iVar9 + 0x10) == *(float *)(param_1 + 0x10))) &&
               ((*(uint *)(param_1 + 4) < *(uint *)(iVar9 + 4) && (*(float *)(iVar9 + 0x20) == 0.0))
               )) {
              FUN_002ed2c0(auStack_134,*(int *)(param_1 + 0x38) + 4,*(undefined4 *)(iVar11 + 0x10));
              FUN_002ed2c0(auStack_154,*(int *)(iVar9 + 0x38) + 4,*(undefined4 *)(iVar11 + 0x10));
              uVar20 = FloatVectorMult(CONCAT44(extraout_s1_14,local_120),0x3f4000003f400000,2,0x20)
              ;
              local_120 = (undefined4)uVar20;
              uVar20 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar20 >> 0x20),local_140),
                                       0x3f4000003f400000,2,0x20);
              local_140 = (undefined4)uVar20;
              iVar10 = FUN_002ed344(local_140,auStack_134,auStack_154,auStack_114);
              if (iVar10 == 1) {
                uVar20 = FloatVectorMult(CONCAT44(extraout_s1_15,*(undefined4 *)(iVar11 + 0x10)),
                                         0x3f4000003f400000,2,0x20);
                uVar20 = FloatVectorAdd(uVar20,uVar20,2);
                uVar20 = FloatVectorAdd(CONCAT44(extraout_s1_15,
                                                 *(undefined4 *)(*(int *)(iVar9 + 0x38) + 8)),uVar20
                                        ,2);
                *(int *)(param_1 + 0x14) = (int)uVar20;
                *(undefined4 *)(param_1 + 0x20) = 0;
                iVar9 = *(int *)(param_1 + 0x38);
                uVar7 = *(undefined4 *)(param_1 + 0x10);
                *(undefined4 *)(iVar9 + 4) = uVar7;
                *(undefined4 *)(iVar9 + 8) = *(undefined4 *)(param_1 + 0x14);
                *(undefined4 *)(iVar9 + 0xc) = *(undefined4 *)(param_1 + 0x18);
                FUN_002ed304(uVar7,auStack_154);
                FUN_002ed304(auStack_134);
                uVar21 = (ulonglong)extraout_s1_17 << 0x20;
                uVar7 = extraout_s3_08;
                uVar30 = extraout_s5_07;
                break;
              }
              FUN_002ed304(auStack_154);
              FUN_002ed304(auStack_134);
            }
            uVar7 = FUN_000065c4();
            iVar9 = FUN_00006af0(uVar7,2,&local_bc);
            uVar21 = (ulonglong)extraout_s1_16 << 0x20;
            uVar7 = extraout_s3_07;
            uVar30 = extraout_s5_06;
          } while (iVar9 != 0);
        }
        if (iVar14 < 1) {
          iVar9 = FUN_00063fe0(puVar5,*(undefined4 *)puVar3);
          uVar21 = CONCAT44(extraout_s1_18,extraout_s0_06);
          uVar7 = extraout_s3_09;
          uVar30 = extraout_s5_08;
          if (iVar9 != 1) goto LAB_00007f18;
        }
        uVar31 = (undefined4)(uVar21 >> 0x20);
        uVar21 = CONCAT44(uVar31,*(float *)(param_1 + 0x20));
        if ((int)((uint)(*(float *)(param_1 + 0x20) < 0.0) << 0x1f) < 0) {
          uVar20 = CONCAT44(uVar7,*(undefined4 *)(iVar11 + 0x10));
          uVar21 = CONCAT44(uVar31,DAT_00008284);
          uVar28 = FloatVectorAdd(CONCAT44(uVar30,*(undefined4 *)(param_1 + 0x14)),uVar20,2);
          if ((int)((uint)((float)uVar28 < DAT_00008284) << 0x1f) < 0) {
            uVar20 = FloatVectorSub(uVar21,uVar20,2,0x20);
            *(int *)(param_1 + 0x14) = (int)uVar20;
            *(undefined4 *)(param_1 + 0x20) = 0;
            iVar9 = *(int *)(param_1 + 0x38);
            uVar21 = (ulonglong)*(uint *)(param_1 + 0x10);
            *(uint *)(iVar9 + 4) = *(uint *)(param_1 + 0x10);
            *(undefined4 *)(iVar9 + 8) = *(undefined4 *)(param_1 + 0x14);
            *(undefined4 *)(iVar9 + 0xc) = *(undefined4 *)(param_1 + 0x18);
          }
        }
      }
    }
    else if (*(char *)(param_1 + 0x98) == '\0') {
      uVar19 = FUN_0006446c(iVar9,param_1,auStack_b8);
      uVar21 = (ulonglong)uVar19;
    }
  }
LAB_00007f18:
  iVar9 = *(int *)(param_1 + 0x38);
  if (iVar9 != 0) {
    *(undefined4 *)(iVar9 + 4) = *(undefined4 *)(param_1 + 0x10);
    *(undefined4 *)(iVar9 + 8) = *(undefined4 *)(param_1 + 0x14);
    *(undefined4 *)(iVar9 + 0xc) = 0;
  }
  iVar9 = FUN_00008290((int)uVar21,param_1);
  if (iVar9 == 1) {
    FUN_00008450(param_1);
  }
  else if ((*(int *)(param_1 + 0x78) == 0) && (*(char *)(param_1 + 0xc4) == '\0')) {
    if ((piVar6 == (int *)0x0) ||
       (iVar9 = FUN_00063fe0(PTR_DAT_004d907c,*(undefined4 *)PTR_DAT_004d9078), iVar9 != 1)) {
      uVar30 = FUN_00033ca0();
      bVar16 = false;
      uVar7 = (&DAT_00556aa4)[*(int *)(param_1 + 100)];
      if (*(float *)(puVar2 + 0x20) == 0.0) {
        bVar16 = true;
      }
    }
    else {
      uVar30 = FUN_00033ca0();
      uVar7 = FUN_002f69c4("bigbomb_smoke",0xd);
      bVar16 = *(float *)(puVar2 + 0x20) == 0.0;
    }
    iVar9 = FUN_00035a08(uVar30,uVar7,0,bVar16);
    *(int *)(param_1 + 0x78) = iVar9;
    if (iVar9 != 0) {
      *(undefined4 *)(iVar9 + 8) = *(undefined4 *)(param_1 + 0x10);
      *(undefined4 *)(iVar9 + 0xc) = *(undefined4 *)(param_1 + 0x14);
      *(undefined4 *)(iVar9 + 0x10) = *(undefined4 *)(param_1 + 0x18);
    }
  }
  *(undefined1 *)(param_1 + 0x7c) = 0;
LAB_00007ff2:
  if (*(int *)puVar1 != local_64) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00008290 — 00008290

- 函数名: FUN_00008290
- 函数体: 443 字节
- 调用者数: 1 / 被调用者数: 2

```c

undefined4 FUN_00008290(int param_1)

{
  undefined4 uVar1;
  bool bVar2;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  undefined4 extraout_s3_01;
  undefined4 extraout_s3_02;
  float fVar3;
  undefined8 uVar4;
  undefined8 uVar5;
  
  bVar2 = false;
  if (((*(float *)(param_1 + 0x9c) == DAT_0052bfe0) && (*(float *)(param_1 + 0xa0) == DAT_0052bfe4))
     && (bVar2 = false, *(float *)(param_1 + 0xa4) == DAT_0052bfe8)) {
    bVar2 = true;
  }
  if (((int)((uint)(*(float *)(param_1 + 0xa0) < 0.0) << 0x1f) < 0) || (bVar2)) {
    fVar3 = *(float *)(param_1 + 0x14);
    uVar1 = FUN_000251a8();
    uVar4 = FloatVectorMult(CONCAT44(extraout_s3,*(undefined4 *)(param_1 + 0x2c)),
                            CONCAT44(extraout_s1,DAT_0000844c),2,0x20);
    uVar5 = FloatVectorMult(CONCAT44(uVar1,uVar1),0x3f0000003f000000,2,0x20);
    uVar4 = FloatVectorAdd(uVar5,uVar4,2);
    uVar4 = FloatVectorNeg(uVar4,2,2);
    if ((fVar3 <= (float)uVar4) && ((int)((uint)(*(float *)(param_1 + 0x20) < 0.0) << 0x1f) < 0)) {
      return 1;
    }
  }
  if ((bool)(0.0 < *(float *)(param_1 + 0xa0) | bVar2)) {
    fVar3 = *(float *)(param_1 + 0x14);
    uVar1 = FUN_000251a8();
    uVar4 = FloatVectorMult(CONCAT44(extraout_s3_00,*(undefined4 *)(param_1 + 0x2c)),
                            CONCAT44(extraout_s1_00,DAT_0000844c),2,0x20);
    uVar5 = FloatVectorMult(CONCAT44(uVar1,uVar1),0x3f0000003f000000,2,0x20);
    uVar4 = FloatVectorAdd(uVar5,uVar4,2);
    if (((float)uVar4 <= fVar3) && (0.0 < *(float *)(param_1 + 0x20))) {
      return 1;
    }
  }
  if ((bool)((int)((uint)(*(float *)(param_1 + 0x9c) < 0.0) << 0x1f) < 0 | bVar2)) {
    fVar3 = *(float *)(param_1 + 0x10);
    uVar1 = FUN_00025164();
    uVar4 = FloatVectorMult(CONCAT44(extraout_s3_01,*(undefined4 *)(param_1 + 0x2c)),
                            CONCAT44(extraout_s1_01,DAT_0000844c),2,0x20);
    uVar5 = FloatVectorMult(CONCAT44(uVar1,uVar1),0x3f0000003f000000,2,0x20);
    uVar4 = FloatVectorAdd(uVar5,uVar4,2);
    uVar4 = FloatVectorNeg(uVar4,2,2);
    if ((fVar3 <= (float)uVar4) && ((int)((uint)(*(float *)(param_1 + 0x1c) < 0.0) << 0x1f) < 0)) {
      return 1;
    }
  }
  if ((bool)(0.0 < *(float *)(param_1 + 0x9c) | bVar2)) {
    fVar3 = *(float *)(param_1 + 0x10);
    uVar1 = FUN_00025164();
    uVar4 = FloatVectorMult(CONCAT44(extraout_s3_02,*(undefined4 *)(param_1 + 0x2c)),
                            CONCAT44(extraout_s1_02,DAT_0000844c),2,0x20);
    uVar5 = FloatVectorMult(CONCAT44(uVar1,uVar1),0x3f0000003f000000,2,0x20);
    uVar4 = FloatVectorAdd(uVar5,uVar4,2);
    if ((float)uVar4 <= fVar3) {
      if (0.0 < *(float *)(param_1 + 0x1c)) {
        return 1;
      }
      return 0;
    }
  }
  return 0;
}


```

## FUN_0000848c — 0000848c

- 函数名: FUN_0000848c
- 函数体: 633 字节
- 调用者数: 0 / 被调用者数: 5

```c

undefined4 FUN_0000848c(int param_1,undefined4 param_2)

{
  undefined *puVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  uint uVar4;
  int iVar5;
  undefined4 uVar6;
  uint extraout_s0;
  uint extraout_s0_00;
  uint extraout_s0_01;
  uint extraout_s0_02;
  undefined4 extraout_s1;
  ulonglong uVar7;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined4 extraout_s3;
  undefined4 extraout_s5;
  undefined4 extraout_s7;
  undefined4 extraout_s9;
  undefined4 extraout_s11;
  undefined8 unaff_d8;
  undefined4 uVar8;
  float fVar9;
  undefined8 unaff_d9;
  undefined4 uVar10;
  undefined8 uVar11;
  undefined8 uVar12;
  undefined8 uVar13;
  
  iVar5 = *(int *)(param_1 + 0x78);
  if (iVar5 != 0) {
    uVar2 = FUN_003010b8(*(short *)(param_1 + 0x8a) * -0xb6);
    unaff_d8 = CONCAT44((int)((ulonglong)unaff_d8 >> 0x20),*(undefined4 *)(param_1 + 0x28));
    uVar3 = FUN_003010d0(*(short *)(param_1 + 0x8a) * -0xb6);
    uVar11 = FloatVectorMult(unaff_d8,CONCAT44(extraout_s9,DAT_00008708),2,0x20);
    uVar6 = *(undefined4 *)(param_1 + 0x14);
    uVar12 = FloatVectorMult(uVar11,CONCAT44(extraout_s7,DAT_0000870c),2,0x20);
    uVar11 = FloatVectorMult(CONCAT44(extraout_s11,*(undefined4 *)(param_1 + 0x28)),
                             CONCAT44(extraout_s9,DAT_00008708),2,0x20);
    uVar12 = FloatVectorMult(CONCAT44(uVar2,uVar2),uVar12,2,0x20);
    uVar13 = FloatVectorMult(uVar11,CONCAT44(extraout_s7,DAT_0000870c),2,0x20);
    uVar11 = FloatVectorAdd(uVar12,CONCAT44(extraout_s5,*(undefined4 *)(param_1 + 0x10)),2);
    uVar12 = FloatVectorAdd(CONCAT44(extraout_s3,*(undefined4 *)(param_1 + 0x18)),0x40a0000040a00000
                            ,2);
    uVar13 = FloatVectorMult(CONCAT44(uVar3,uVar3),uVar13,2,0x20);
    *(int *)(iVar5 + 8) = (int)uVar11;
    uVar11 = FloatVectorAdd(CONCAT44(extraout_s1,uVar6),uVar13,2);
    *(int *)(iVar5 + 0xc) = (int)uVar11;
    *(int *)(iVar5 + 0x10) = (int)uVar12;
    uVar2 = FUN_003010d0((int)uVar11,*(short *)(param_1 + 0x8a) * -0xb6);
    *(undefined4 *)(*(int *)(param_1 + 0x78) + 0x30) = uVar2;
    uVar4 = FUN_003010b8(*(short *)(param_1 + 0x8a) * -0xb6);
    *(uint *)(*(int *)(param_1 + 0x78) + 0x34) = uVar4 ^ 0x80000000;
  }
  iVar5 = FUN_0001d10c(PTR_DAT_004d9048);
  puVar1 = PTR_DAT_004d907c;
  uVar7 = (ulonglong)extraout_s0;
  if (iVar5 != 0) {
    iVar5 = FUN_00063fe0(PTR_DAT_004d907c,*(undefined4 *)PTR_DAT_004d9070);
    uVar7 = (ulonglong)extraout_s0_00;
    if (iVar5 == 1) {
      if (*(float *)(param_1 + 0x9c) != 0.0) {
        uVar7 = (ulonglong)(uint)*(float *)(param_1 + 0xc0);
        if (*(float *)(param_1 + 0xc0) <= 0.0) goto LAB_000086f4;
      }
      iVar5 = FUN_00063fe0(puVar1,*(undefined4 *)PTR_DAT_004d9064);
      if (iVar5 == 1) {
        uVar6 = (undefined4)((ulonglong)unaff_d8 >> 0x20);
        uVar3 = *(undefined4 *)(param_1 + 0x10);
        uVar10 = (undefined4)((ulonglong)unaff_d9 >> 0x20);
        uVar8 = *(undefined4 *)(*(int *)(param_1 + 0x38) + 0x14);
        uVar2 = FUN_00025164();
        uVar12 = FloatVectorMult(CONCAT44(uVar2,uVar2),0xbf000000bf000000,2,0x20);
        uVar11 = FloatVectorSub(CONCAT44(uVar6,uVar3),CONCAT44(uVar10,uVar8),2,0x20);
        uVar12 = FloatVectorAdd(uVar12,0xc1b00000c1b00000,2);
        if ((int)((uint)((float)uVar11 < (float)uVar12) << 0x1f) < 0) {
          uVar11 = FloatVectorNeg(CONCAT44((int)((ulonglong)uVar11 >> 0x20),
                                           *(undefined4 *)(param_1 + 0x1c)),2,2);
          *(int *)(param_1 + 0x1c) = (int)uVar11;
        }
        uVar3 = *(undefined4 *)(param_1 + 0x10);
        uVar8 = *(undefined4 *)(*(int *)(param_1 + 0x38) + 0x14);
        uVar2 = FUN_00025164((int)uVar11);
        uVar11 = FloatVectorMult(CONCAT44(uVar2,uVar2),0x3f0000003f000000,2,0x20);
        uVar7 = FloatVectorAdd(CONCAT44(uVar6,uVar3),CONCAT44(uVar10,uVar8),2);
        uVar11 = FloatVectorAdd(uVar11,0x41b0000041b00000,2);
        if ((float)uVar7 <= (float)uVar11) goto LAB_000086f4;
        uVar11 = FloatVectorNeg(CONCAT44((int)(uVar7 >> 0x20),*(undefined4 *)(param_1 + 0x1c)),2,2);
        uVar7 = FloatVectorNeg(uVar11,2,2);
      }
      else {
        iVar5 = FUN_00063fe0(puVar1,*(undefined4 *)PTR_DAT_004d905c);
        uVar7 = (ulonglong)extraout_s0_01;
        if (iVar5 != 0) goto LAB_000086f4;
        iVar5 = FUN_00063fe0(puVar1,*(undefined4 *)PTR_DAT_004d906c);
        uVar7 = (ulonglong)extraout_s0_02;
        if (iVar5 != 0) goto LAB_000086f4;
        fVar9 = *(float *)(param_1 + 0x10);
        uVar2 = FUN_00025164();
        uVar11 = FloatVectorMult(CONCAT44(uVar2,uVar2),CONCAT44(extraout_s1_00,DAT_00008710),2,0x20)
        ;
        if ((int)((uint)(fVar9 < (float)uVar11) << 0x1f) < 0) {
          uVar12 = FloatVectorMult(CONCAT44(param_2,param_2),0x4180000041800000,2,0x20);
          uVar11 = FloatVectorAdd(uVar12,CONCAT44((int)((ulonglong)uVar11 >> 0x20),
                                                  *(undefined4 *)(param_1 + 0x1c)),2);
          *(int *)(param_1 + 0x1c) = (int)uVar11;
        }
        fVar9 = *(float *)(param_1 + 0x10);
        uVar2 = FUN_00025164((int)uVar11);
        uVar7 = FloatVectorMult(CONCAT44(uVar2,uVar2),CONCAT44(extraout_s1_01,DAT_00008714),2,0x20);
        if (fVar9 <= (float)uVar7) goto LAB_000086f4;
        uVar11 = FloatVectorMult(CONCAT44(param_2,param_2),0xc1800000c1800000,2,0x20);
        uVar7 = FloatVectorAdd(CONCAT44((int)(uVar7 >> 0x20),*(undefined4 *)(param_1 + 0x1c)),uVar11
                               ,2);
      }
      *(int *)(param_1 + 0x1c) = (int)uVar7;
    }
  }
LAB_000086f4:
  return (int)uVar7;
}


```

