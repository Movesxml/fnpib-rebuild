# 调用目标并访问字段的函数（完整反编译）

- 目标: 0001d10c
- 字段: 0xa4
- 直接引用函数数: 48

## FUN_0000701c — 0000701c

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

## FUN_0000b4b8 — 0000b4b8

```c

/* WARNING: Heritage AFTER dead removal. Example location: s1 : 0x0000bcbe */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void FUN_0000b4b8(undefined4 param_1,uint param_2,undefined4 param_3,int param_4)

{
  longlong lVar1;
  float fVar2;
  undefined *puVar3;
  undefined *puVar4;
  byte bVar5;
  undefined1 uVar6;
  int iVar7;
  undefined *puVar8;
  void *pvVar9;
  undefined4 uVar10;
  uint uVar11;
  undefined *puVar12;
  undefined4 uVar13;
  int iVar14;
  undefined4 *puVar15;
  uint uVar16;
  uint uVar17;
  undefined4 uVar18;
  int iVar19;
  undefined *puVar20;
  int iVar21;
  int iVar22;
  uint uVar23;
  uint uVar24;
  undefined8 uVar25;
  undefined8 in_d1;
  longlong lVar26;
  undefined8 uVar27;
  undefined8 uVar28;
  undefined8 uVar29;
  undefined4 local_7c;
  undefined4 local_78;
  undefined4 local_74;
  undefined4 local_70;
  undefined4 local_6c;
  undefined4 local_68;
  undefined4 local_64;
  undefined4 local_60;
  uint local_5c;
  undefined4 ***local_58;
  undefined4 ***local_54;
  undefined4 local_50;
  undefined4 local_4c;
  undefined4 ***local_48;
  undefined4 ***local_44;
  undefined4 local_40;
  undefined4 local_3c;
  undefined4 ***local_38;
  undefined4 ***local_34;
  undefined4 local_30;
  undefined4 local_2c;
  
  puVar3 = PTR_DAT_004d9048;
  uVar6 = 0;
  if (*(char *)(param_2 + 0x1b8) == '\0') {
    iVar7 = FUN_0001d10c(PTR_DAT_004d9048);
    uVar6 = 0;
    if (iVar7 != 0) {
      iVar7 = FUN_0001d10c(puVar3);
      uVar6 = 0;
      if ((*(int *)(iVar7 + 0x68) != 0) && (uVar6 = 0, *(int *)(*(int *)(iVar7 + 0x68) + 0x98) != 0)
         ) {
        uVar6 = 1;
      }
    }
  }
  *(undefined1 *)(param_2 + 0xb0) = uVar6;
  *(undefined1 *)(param_2 + 0x1bb) = 0;
  if (*(int **)(param_2 + 0xb4) != (int *)0x0) {
    (**(code **)(**(int **)(param_2 + 0xb4) + 4))();
    *(undefined4 *)(param_2 + 0xb4) = 0;
  }
  *(undefined1 *)(param_2 + 0xcc) = 0;
  *(undefined1 *)(param_2 + 0xc3) = 0;
  *(undefined4 *)(param_2 + 0x48) = 0;
  *(undefined4 *)(param_2 + 0xf4) = DAT_0052bfe0;
  *(undefined4 *)(param_2 + 0xf8) = DAT_0052bfe4;
  *(undefined4 *)(param_2 + 0xfc) = DAT_0052bfe8;
  *(undefined4 *)(param_2 + 0x110) = 0x3f800000;
  *(undefined4 *)(param_2 + 0x114) = 0;
  *(undefined4 *)(param_2 + 0x118) = 0;
  *(undefined1 *)(param_2 + 0xc0) = 1;
  *(undefined4 *)(param_2 + 0x1c0) = 0;
  *(undefined4 *)(param_2 + 0xd4) = 0x3f800000;
  *(undefined1 *)(param_2 + 0x1b9) = 0;
  local_30 = 0;
  local_2c = 0;
  local_38 = &local_38;
  local_34 = &local_38;
  FUN_0001560c(param_2 + 0x1c4,&local_38);
  *(undefined4 *)(param_2 + 0x1cc) = local_30;
  *(undefined4 *)(param_2 + 0x1d0) = local_2c;
  FUN_000152b8(&local_38);
  local_40 = 0;
  local_3c = 0;
  local_48 = &local_48;
  local_44 = &local_48;
  FUN_000154c0(param_2 + 0x1d4,&local_48);
  *(undefined4 *)(param_2 + 0x1dc) = local_40;
  *(undefined4 *)(param_2 + 0x1e0) = local_3c;
  FUN_00015290(&local_48);
  local_50 = 0;
  local_4c = 0;
  local_58 = &local_58;
  local_54 = &local_58;
  FUN_000154c0(param_2 + 0x1e4,&local_58);
  *(undefined4 *)(param_2 + 0x1ec) = local_50;
  *(undefined4 *)(param_2 + 0x1f0) = local_4c;
  FUN_00015290(&local_58);
  *(undefined4 *)(param_2 + 200) = 0;
  *(undefined4 *)(param_2 + 0xac) = 0;
  *(undefined4 *)(param_2 + 0x100) = 0;
  *(undefined1 *)(param_2 + 0xb1) = 0;
  *(undefined4 *)(param_2 + 0x9c) = *(undefined4 *)(param_2 + 0x1c);
  *(undefined4 *)(param_2 + 0xa0) = *(undefined4 *)(param_2 + 0x20);
  *(undefined4 *)(param_2 + 0xa4) = *(undefined4 *)(param_2 + 0x24);
  *(undefined2 *)(param_2 + 8) = 0;
  *(undefined1 *)(param_2 + 500) = 0;
  *(undefined4 *)(param_2 + 0xbc) = 0;
  puVar3 = PTR_DAT_004d9048;
  if ((param_4 < 0) || (DAT_005d4cd0 <= param_4)) {
    iVar7 = FUN_0001d10c(PTR_DAT_004d9048);
    if (iVar7 == 0) {
      uVar6 = FUN_0000af04(1);
      *(undefined1 *)(param_2 + 0x3c) = uVar6;
    }
    else {
      do {
        bVar5 = FUN_0000af04(1);
        *(byte *)(param_2 + 0x3c) = bVar5;
        FUN_0001d10c(puVar3);
        uVar11 = FUN_000617a8();
      } while (bVar5 == uVar11);
    }
  }
  else {
    *(char *)(param_2 + 0x3c) = (char)param_4;
  }
  if (((DAT_00556cd4 & 1) == 0) && (iVar7 = ___cxa_guard_acquire(&DAT_00556cd4), iVar7 != 0)) {
    DAT_00556cd0 = FUN_0000aae0("strawberry",0);
    ___cxa_guard_release(&DAT_00556cd4);
  }
  iVar7 = FUN_0001cd6c();
  uVar11 = (uint)*(byte *)(param_2 + 0x3c);
  if ((iVar7 == 1) && (uVar11 == DAT_00556cd0)) {
    uVar11 = uVar11 - 1;
    *(char *)(param_2 + 0x3c) = (char)uVar11;
  }
  if (*(int *)((uVar11 & 0xff) * 0x338 + DAT_005d4cdc + 0x32c) != 0) {
    DAT_005d4ce4 = DAT_005d4ce4 + 1;
    uVar11 = (uint)*(byte *)(param_2 + 0x3c);
  }
  FUN_0000bd54(param_2,uVar11 & 0xff,param_1);
  puVar4 = PTR_DAT_004d90a4;
  puVar3 = PTR_DAT_004d9048;
  if (*(char *)(param_2 + 0xc1) != '\0') {
    puVar8 = PTR_DAT_004d90a4 + 4;
    puVar15 = (undefined4 *)(PTR_DAT_004d90a4 + 8);
    puVar12 = puVar8;
    while (puVar20 = (undefined *)*puVar15, puVar20 != (undefined *)0x0) {
      puVar15 = (undefined4 *)(puVar20 + 0xc);
      if (param_2 <= *(uint *)(puVar20 + 0x10)) {
        puVar15 = (undefined4 *)(puVar20 + 8);
        puVar12 = puVar20;
      }
    }
    if (((puVar12 == puVar8) || (param_2 < *(uint *)(puVar12 + 0x10))) || (puVar12 == puVar8)) {
      iVar7 = FUN_0001cd2c();
      if ((puVar3[0x17] == '\0') || (iVar7 != 1)) {
        pvVar9 = operator_new(0x110);
        FUN_00079d18(pvVar9,param_2);
        FUN_0003e9e8(*(undefined4 *)(puVar3 + 0x4c),pvVar9,0);
        local_5c = param_2;
        puVar15 = (undefined4 *)FUN_00014770(puVar4,&local_5c);
        *puVar15 = pvVar9;
      }
      else {
        *(undefined4 *)(param_2 + 0x104) = 0;
      }
    }
  }
  *(uint *)(param_2 + 0xc) = *(uint *)(param_2 + 0xc) & 0xffffffed | 2;
  *(undefined1 *)(param_2 + 0x1bc) = 0;
  *(undefined1 *)(param_2 + 0xc4) = 0;
  *(undefined4 *)(param_2 + 0x104) = 0xbf800000;
  *(undefined4 *)(param_2 + 0xd0) = 0;
  *(undefined4 *)(param_2 + 0x84) = 0;
  *(undefined4 *)(param_2 + 0x78) = DAT_0052bfe0;
  *(undefined4 *)(param_2 + 0x7c) = DAT_0052bfe4;
  *(undefined4 *)(param_2 + 0x80) = DAT_0052bfe8;
  iVar7 = FUN_00052f80();
  lVar26 = (ulonglong)*(uint *)(iVar7 + 8) * (ulonglong)*(uint *)(iVar7 + 0x10);
  uVar16 = (uint)lVar26;
  uVar11 = *(int *)(iVar7 + 0xc) * *(uint *)(iVar7 + 0x10) +
           *(uint *)(iVar7 + 8) * *(int *)(iVar7 + 0x14) + (int)((ulonglong)lVar26 >> 0x20) +
           *(int *)(iVar7 + 0x1c) + (uint)CARRY4(*(uint *)(iVar7 + 0x18),uVar16);
  *(uint *)(iVar7 + 8) = *(uint *)(iVar7 + 0x18) + uVar16;
  *(uint *)(iVar7 + 0xc) = uVar11;
  iVar7 = FUN_00052f80();
  uVar16 = *(uint *)(iVar7 + 8);
  lVar26 = (ulonglong)uVar16 * (ulonglong)*(uint *)(iVar7 + 0x10);
  uVar17 = (uint)lVar26;
  *(uint *)(iVar7 + 8) = uVar17 + *(uint *)(iVar7 + 0x18);
  uVar23 = *(int *)(iVar7 + 0xc) * *(uint *)(iVar7 + 0x10) +
           uVar16 * *(int *)(iVar7 + 0x14) + (int)((ulonglong)lVar26 >> 0x20) +
           *(int *)(iVar7 + 0x1c) + (uint)CARRY4(uVar17,*(uint *)(iVar7 + 0x18));
  *(uint *)(iVar7 + 0xc) = uVar23;
  iVar7 = FUN_00052f80();
  lVar26 = (ulonglong)*(uint *)(iVar7 + 8) * (ulonglong)*(uint *)(iVar7 + 0x10);
  uVar16 = (uint)lVar26;
  uVar17 = *(int *)(iVar7 + 0xc) * *(uint *)(iVar7 + 0x10) +
           *(uint *)(iVar7 + 8) * *(int *)(iVar7 + 0x14) + (int)((ulonglong)lVar26 >> 0x20) +
           *(int *)(iVar7 + 0x1c) + (uint)CARRY4(uVar16,*(uint *)(iVar7 + 0x18));
  *(uint *)(iVar7 + 8) = uVar16 + *(uint *)(iVar7 + 0x18);
  *(uint *)(iVar7 + 0xc) = uVar17;
  local_6c = 0;
  local_68 = 0;
  local_64 = 0;
  local_60 = 0x3f800000;
  FUN_0000bef8(&local_6c,0);
  puVar3 = PTR_DAT_004d9050;
  fVar2 = DAT_0000b9e8;
  uVar13 = (undefined4)((ulonglong)uVar11 * 0x7ffff >> 0x20);
  uVar18 = (undefined4)((ulonglong)uVar23 * 0x7ffff >> 0x20);
  uVar10 = (undefined4)((ulonglong)uVar17 * 0x7ffff >> 0x20);
  uVar25 = FixedToFP(CONCAT44(uVar13,uVar13),0,1,0,0x20);
  uVar27 = FixedToFP(CONCAT44(uVar18,uVar18),0,1,0,0x20);
  uVar28 = FixedToFP(CONCAT44(uVar10,uVar10),0,1,0,0x20);
  uVar29 = FloatVectorMult(CONCAT44((int)((ulonglong)in_d1 >> 0x20),(float)uVar25 / DAT_0000b9e8),
                           0x4130000041300000,2,0x20);
  uVar27 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar27 >> 0x20),(float)uVar27 / DAT_0000b9e8),
                           0x4130000041300000,2,0x20);
  uVar25 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar25 >> 0x20),(float)uVar28 / DAT_0000b9e8),
                           0x4130000041300000,2,0x20);
  if (*(char *)((uint)*(byte *)(param_2 + 0x3c) * 0x338 + DAT_005d4cdc + 0x330) == '\0') {
    uVar25 = FloatVectorAdd(uVar25,0xc0b00000c0b00000,2);
    uVar28 = FloatVectorAdd(uVar29,0xc0b00000c0b00000,2);
    uVar10 = (undefined4)uVar28;
    lVar26 = FloatVectorAdd(uVar27,0xc0b00000c0b00000,2);
  }
  else {
    lVar26 = (ulonglong)*(uint *)PTR_DAT_004d9050 * (ulonglong)*(uint *)(PTR_DAT_004d9050 + 8);
    uVar16 = (uint)lVar26;
    uVar17 = *(int *)(PTR_DAT_004d9050 + 4) * *(uint *)(PTR_DAT_004d9050 + 8) +
             *(uint *)PTR_DAT_004d9050 * *(int *)(PTR_DAT_004d9050 + 0xc) +
             (int)((ulonglong)lVar26 >> 0x20) +
             *(int *)(PTR_DAT_004d9050 + 0x14) +
             (uint)CARRY4(uVar16,*(uint *)(PTR_DAT_004d9050 + 0x10));
    uVar10 = (undefined4)((ulonglong)uVar17 * 0x7ffff >> 0x20);
    *(uint *)PTR_DAT_004d9050 = uVar16 + *(uint *)(PTR_DAT_004d9050 + 0x10);
    *(uint *)(puVar3 + 4) = uVar17;
    uVar25 = FixedToFP(CONCAT44(uVar10,uVar10),0,1,0,0x20);
    uVar10 = (undefined4)((ulonglong)uVar25 >> 0x20);
    uVar25 = FloatVectorMult(CONCAT44(uVar10,(float)uVar25 / fVar2),0x41e0000041e00000,2,0x20);
    uVar25 = FloatVectorAdd(uVar25,0x4140000041400000,2);
    uVar25 = FloatVectorMult(uVar25,CONCAT44(uVar10,DAT_0000b9ec),2,0x20);
    uVar25 = FPToFixed(uVar25,0,0,3,0x20);
    FUN_000147c8(&local_6c,0,0x3f800000,0,(uint)uVar25 & 0xffff,uVar11);
    uVar11 = *(uint *)(puVar3 + 8);
    uVar24 = *(uint *)(puVar3 + 0x10);
    lVar26 = (ulonglong)*(uint *)puVar3 * (ulonglong)uVar11;
    uVar16 = (uint)lVar26;
    uVar17 = uVar16 + uVar24;
    lVar1 = (ulonglong)uVar11 * (ulonglong)uVar17;
    uVar23 = (uint)lVar1;
    uVar16 = *(int *)(puVar3 + 4) * uVar11 +
             *(uint *)puVar3 * *(int *)(puVar3 + 0xc) + (int)((ulonglong)lVar26 >> 0x20) +
             *(int *)(puVar3 + 0x14) + (uint)CARRY4(uVar16,uVar24);
    uVar10 = (undefined4)((ulonglong)uVar16 * 0x7ffff >> 0x20);
    uVar11 = *(int *)(puVar3 + 0x14) +
             *(int *)(puVar3 + 0xc) * uVar17 + uVar11 * uVar16 + (int)((ulonglong)lVar1 >> 0x20) +
             (uint)CARRY4(uVar23,uVar24);
    uVar13 = (undefined4)((ulonglong)uVar11 * 0x7ffff >> 0x20);
    *(uint *)puVar3 = uVar23 + uVar24;
    *(uint *)(puVar3 + 4) = uVar11;
    uVar25 = FixedToFP(CONCAT44(uVar10,uVar10),0,1,0,0x20);
    uVar25 = CONCAT44((int)((ulonglong)uVar25 >> 0x20),(float)uVar25 / fVar2);
    uVar27 = FixedToFP(CONCAT44(uVar13,uVar13),0,1,0,0x20);
    uVar25 = FloatVectorAdd(uVar25,uVar25,2);
    uVar25 = FloatVectorAdd(uVar25,0x4040000040400000,2);
    uVar11 = (uint)((ulonglong)uVar27 >> 0x20);
    if ((float)uVar27 / fVar2 <= 0.5) {
      uVar25 = FloatVectorNeg(uVar25,2,2);
      uVar10 = 0x41200000;
      lVar26 = (ulonglong)uVar11 << 0x20;
    }
    else {
      lVar26 = (ulonglong)uVar11 << 0x20;
      uVar10 = 0x41200000;
    }
  }
  iVar7 = 0x134;
  iVar14 = 0x10;
  iVar19 = 0;
  iVar21 = 0;
  do {
    iVar22 = param_2 + iVar21;
    iVar21 = iVar21 + 0x24;
    *(undefined4 *)(iVar22 + 0x16c) = DAT_0052c000;
    *(undefined4 *)(iVar22 + 0x170) = DAT_0052c004;
    *(undefined4 *)(iVar22 + 0x174) = DAT_0052c008;
    *(undefined4 *)(iVar22 + 0x178) = DAT_0052bf00;
    *(undefined4 *)(iVar22 + 0x17c) = DAT_0052bf04;
    *(undefined4 *)(iVar22 + 0x180) = DAT_0052bf08;
    *(undefined4 *)(iVar22 + 0x184) = DAT_0052ce60;
    *(undefined4 *)(iVar22 + 0x188) = DAT_0052ce64;
    *(undefined4 *)(iVar22 + 0x18c) = DAT_0052ce68;
    iVar22 = param_2 + iVar19;
    iVar19 = iVar19 + 0xc;
    *(undefined4 *)(iVar22 + 0x154) = uVar10;
    *(int *)(iVar22 + 0x158) = (int)lVar26;
    *(int *)(iVar22 + 0x15c) = (int)uVar25;
    *(undefined4 *)(param_2 + iVar7) = local_6c;
    iVar22 = param_2 + iVar7;
    iVar7 = iVar7 + 0x10;
    *(undefined4 *)(iVar22 + 4) = local_68;
    *(undefined4 *)(iVar22 + 8) = local_64;
    *(undefined4 *)(iVar22 + 0xc) = local_60;
    *(undefined4 *)(param_2 + iVar14 * 4) = 0;
    iVar14 = iVar14 + 1;
  } while (iVar21 != 0x48);
  if ((*(char *)(param_2 + 0xc1) != '\0') || (*(char *)(param_2 + 0xc2) != '\0')) {
    iVar7 = FUN_00052f80();
    uVar11 = *(uint *)(iVar7 + 8);
    lVar26 = (ulonglong)uVar11 * (ulonglong)*(uint *)(iVar7 + 0x10);
    uVar16 = (uint)lVar26;
    *(uint *)(iVar7 + 8) = uVar16 + *(uint *)(iVar7 + 0x18);
    *(uint *)(iVar7 + 0xc) =
         *(int *)(iVar7 + 0xc) * *(uint *)(iVar7 + 0x10) +
         uVar11 * *(int *)(iVar7 + 0x14) + (int)((ulonglong)lVar26 >> 0x20) +
         *(int *)(iVar7 + 0x1c) + (uint)CARRY4(uVar16,*(uint *)(iVar7 + 0x18));
    iVar7 = FUN_00052f80();
    uVar11 = *(uint *)(iVar7 + 8);
    lVar26 = (ulonglong)uVar11 * (ulonglong)*(uint *)(iVar7 + 0x10);
    uVar16 = (uint)lVar26;
    *(uint *)(iVar7 + 8) = uVar16 + *(uint *)(iVar7 + 0x18);
    *(uint *)(iVar7 + 0xc) =
         *(int *)(iVar7 + 0xc) * *(uint *)(iVar7 + 0x10) +
         uVar11 * *(int *)(iVar7 + 0x14) + (int)((ulonglong)lVar26 >> 0x20) +
         *(int *)(iVar7 + 0x1c) + (uint)CARRY4(uVar16,*(uint *)(iVar7 + 0x18));
    iVar7 = FUN_00052f80();
    uVar11 = *(uint *)(iVar7 + 8);
    lVar26 = (ulonglong)uVar11 * (ulonglong)*(uint *)(iVar7 + 0x10);
    uVar16 = (uint)lVar26;
    *(uint *)(iVar7 + 8) = uVar16 + *(uint *)(iVar7 + 0x18);
    *(uint *)(iVar7 + 0xc) =
         *(int *)(iVar7 + 0xc) * *(uint *)(iVar7 + 0x10) +
         uVar11 * *(int *)(iVar7 + 0x14) + (int)((ulonglong)lVar26 >> 0x20) +
         *(int *)(iVar7 + 0x1c) + (uint)CARRY4(uVar16,*(uint *)(iVar7 + 0x18));
    local_7c = 0;
    local_78 = 0;
    local_74 = 0;
    local_70 = 0x3f800000;
    FUN_000147c8(&local_7c,0x3f800000,0,0,0x3ffc);
    puVar3 = PTR_DAT_004d9050;
    uVar10 = 0x3f000000;
    uVar16 = *(uint *)(PTR_DAT_004d9050 + 8);
    uVar23 = *(uint *)(PTR_DAT_004d9050 + 0x10);
    lVar26 = (ulonglong)*(uint *)PTR_DAT_004d9050 * (ulonglong)uVar16;
    uVar17 = (uint)lVar26;
    uVar11 = uVar17 + uVar23;
    lVar1 = (ulonglong)uVar16 * (ulonglong)uVar11;
    uVar24 = (uint)lVar1;
    uVar17 = *(int *)(PTR_DAT_004d9050 + 4) * uVar16 +
             *(uint *)PTR_DAT_004d9050 * *(int *)(PTR_DAT_004d9050 + 0xc) +
             (int)((ulonglong)lVar26 >> 0x20) +
             *(int *)(PTR_DAT_004d9050 + 0x14) + (uint)CARRY4(uVar17,uVar23);
    uVar13 = (undefined4)((ulonglong)uVar17 * 0x7ffff >> 0x20);
    uVar11 = *(int *)(PTR_DAT_004d9050 + 0x14) +
             *(int *)(PTR_DAT_004d9050 + 0xc) * uVar11 +
             uVar16 * uVar17 + (int)((ulonglong)lVar1 >> 0x20) + (uint)CARRY4(uVar24,uVar23);
    uVar18 = (undefined4)((ulonglong)uVar11 * 0x7ffff >> 0x20);
    *(uint *)PTR_DAT_004d9050 = uVar24 + uVar23;
    *(uint *)(puVar3 + 4) = uVar11;
    uVar25 = FixedToFP(CONCAT44(uVar13,uVar13),0,1,0,0x20);
    iVar7 = 0x134;
    iVar14 = 0;
    iVar19 = 0;
    lVar26 = FixedToFP(CONCAT44(uVar18,uVar18),0,1,0,0x20);
    uVar25 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar25 >> 0x20),(float)uVar25 / fVar2),
                             0x4040000040400000,2,0x20);
    uVar25 = FloatVectorAdd(uVar25,0,2);
    uVar25 = FloatVectorNeg(uVar25,2,2);
    do {
      iVar21 = param_2 + iVar19;
      iVar19 = iVar19 + 0x24;
      *(undefined4 *)(iVar21 + 0x16c) = DAT_0052c000;
      *(undefined4 *)(iVar21 + 0x170) = DAT_0052c004;
      *(undefined4 *)(iVar21 + 0x174) = DAT_0052c008;
      *(undefined4 *)(iVar21 + 0x178) = DAT_0052bf00;
      *(undefined4 *)(iVar21 + 0x17c) = DAT_0052bf04;
      *(undefined4 *)(iVar21 + 0x180) = DAT_0052bf08;
      *(undefined4 *)(iVar21 + 0x184) = DAT_0052ce60;
      *(undefined4 *)(iVar21 + 0x188) = DAT_0052ce64;
      *(undefined4 *)(iVar21 + 0x18c) = DAT_0052ce68;
      iVar21 = param_2 + iVar14;
      iVar14 = iVar14 + 0xc;
      *(int *)(iVar21 + 0x15c) = (int)uVar25;
      *(undefined4 *)(iVar21 + 0x154) = 0;
      *(undefined4 *)(iVar21 + 0x158) = 0x40c00000;
      *(undefined4 *)(param_2 + iVar7) = local_7c;
      iVar21 = param_2 + iVar7;
      iVar7 = iVar7 + 0x10;
      *(undefined4 *)(iVar21 + 4) = local_78;
      *(undefined4 *)(iVar21 + 8) = local_74;
      *(undefined4 *)(iVar21 + 0xc) = local_70;
    } while (iVar19 != 0x48);
  }
  *(undefined4 *)(param_2 + 100) = 0;
  *(undefined4 *)(param_2 + 0x68) = 0x4b;
  puVar3 = PTR_DAT_004d9048;
  *(undefined4 *)(param_2 + 0x6c) = 4;
  *(undefined1 *)(param_2 + 0x3f) = 1;
  *(undefined4 *)(param_2 + 0x70) = 0;
  iVar7 = FUN_0001d10c((int)uVar25,(int)((ulonglong)uVar25 >> 0x20),(int)lVar26,
                       (int)((ulonglong)lVar26 >> 0x20),uVar10,puVar3);
  if (iVar7 != 0) {
    FUN_0001d10c(puVar3);
    puVar4 = PTR_DAT_004d907c;
    iVar7 = FUN_00064000(PTR_DAT_004d907c,3);
    if (iVar7 == 0) {
      FUN_0001d10c(puVar3);
      iVar7 = FUN_00063fe0(puVar4,*(undefined4 *)PTR_DAT_004d9068);
      if (iVar7 != 1) goto LAB_0000bd04;
    }
    *(undefined1 *)(param_2 + 0x3f) = 0;
  }
LAB_0000bd04:
  *(undefined4 *)(param_2 + 0x1b4) = 0;
  *(undefined1 *)(param_2 + 0x1b8) = 0;
  *(undefined1 *)(param_2 + 0x1ba) = 1;
  uVar10 = FUN_00021a34();
  *(undefined4 *)(param_2 + 0xd8) = uVar10;
  *(undefined4 *)(param_2 + 0xdc) = 0;
  *(undefined4 *)(param_2 + 0xe0) = 0xc1400000;
  *(undefined4 *)(param_2 + 0xe4) = 0;
  return;
}


```

## FUN_00018cb8 — 00018cb8

```c

undefined4 FUN_00018cb8(int param_1)

{
  undefined *puVar1;
  int iVar2;
  
  if ((*(char *)(param_1 + 0x50) == '\0') && (*(char *)(param_1 + 0xa4) == '\0')) {
    FUN_00018d2c(param_1);
    if (DAT_005d4d5c == 2) {
      FUN_00015814(param_1 + 0xa0,0x3f800000);
    }
    puVar1 = PTR_DAT_004d9048;
    iVar2 = FUN_0001d10c(PTR_DAT_004d9048);
    if (iVar2 != 0) {
      FUN_0001d10c(puVar1);
      iVar2 = FUN_00063f5c(PTR_DAT_004d907c);
      if (iVar2 != 1) {
        return 0;
      }
    }
  }
  FUN_00018e60(param_1);
  return 1;
}


```

## FUN_0006ee88 — 0006ee88

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

## FUN_00079120 — 00079120

```c

void FUN_00079120(int param_1)

{
  undefined *puVar1;
  undefined *puVar2;
  undefined4 uVar3;
  int iVar4;
  char *pcVar5;
  undefined4 uVar6;
  int iVar7;
  undefined8 uVar8;
  undefined8 unaff_d8;
  undefined8 uVar9;
  float fVar10;
  undefined8 unaff_d9;
  undefined4 uVar11;
  undefined **local_94;
  undefined *local_90;
  undefined4 local_8c [8];
  undefined1 local_6c;
  undefined4 local_68;
  undefined4 local_64;
  undefined4 local_60;
  undefined4 local_5c;
  undefined4 local_58;
  undefined4 local_54;
  undefined4 local_50;
  undefined4 local_4c;
  undefined4 local_48;
  int local_44;
  
  puVar2 = PTR_DAT_004d9048;
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_44 = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0x10c) = 1;
  uVar3 = FUN_0001d10c(puVar2);
  iVar4 = FUN_00062aec(uVar3,*(undefined4 *)(param_1 + 0x7c));
  iVar7 = *(int *)(param_1 + 0x110);
  if (iVar4 == 2) {
    local_48 = 0;
    FUN_00009e50(&local_48,DAT_005a8d28);
    FUN_00009e50(iVar7 + 0x40,local_48);
    FUN_0000a2c8(&local_48);
    uVar3 = FUN_00033ca0();
    uVar6 = 8;
    pcVar5 = "chestDud";
  }
  else {
    local_4c = 0;
    FUN_00009e50(&local_4c,DAT_005a8d24);
    FUN_00009e50(iVar7 + 0x40,local_4c);
    FUN_0000a2c8(&local_4c);
    uVar3 = FUN_00033ca0();
    uVar6 = 9;
    pcVar5 = "chestOpen";
  }
  uVar6 = FUN_002f69c4(pcVar5,uVar6);
  iVar4 = FUN_00035a08(uVar3,uVar6,0,0);
  if (iVar4 != 0) {
    iVar7 = *(int *)(param_1 + 0x110);
    *(undefined4 *)(iVar4 + 8) = *(undefined4 *)(iVar7 + 0x10);
    *(undefined4 *)(iVar4 + 0xc) = *(undefined4 *)(iVar7 + 0x14);
    *(undefined4 *)(iVar4 + 0x10) = *(undefined4 *)(iVar7 + 0x18);
  }
  uVar3 = DAT_0052bfe0;
  iVar4 = *(int *)(param_1 + 0x110);
  *(undefined4 *)(iVar4 + 0xa0) = DAT_0052bfe0;
  *(undefined4 *)(iVar4 + 0xa4) = DAT_0052bfe4;
  *(undefined4 *)(iVar4 + 0xa8) = DAT_0052bfe8;
  FUN_000449ac(uVar3);
  iVar4 = *(int *)(param_1 + 0x7c);
  uVar3 = *(undefined4 *)(iVar4 + 0x10);
  *(undefined4 *)(param_1 + 0xf4) = uVar3;
  *(undefined4 *)(param_1 + 0xf8) = *(undefined4 *)(iVar4 + 0x14);
  *(undefined4 *)(param_1 + 0xfc) = *(undefined4 *)(iVar4 + 0x18);
  FUN_00013f00(uVar3);
  if (*(int *)(param_1 + 0x94) != 0) {
    *(undefined4 *)(*(int *)(param_1 + 0x94) + 0x7c) = 0;
  }
  uVar11 = (undefined4)((ulonglong)unaff_d9 >> 0x20);
  fVar10 = *(float *)(*(int *)(param_1 + 0x7c) + 0x10);
  uVar3 = FUN_00025164();
  uVar6 = (undefined4)((ulonglong)unaff_d8 >> 0x20);
  uVar9 = CONCAT44(uVar6,DAT_0007942c);
  uVar8 = FloatVectorMult(CONCAT44(uVar3,uVar3),uVar9,2,0x20);
  if (fVar10 <= (float)uVar8) {
LAB_000792b6:
    uVar3 = FUN_00025164();
    uVar8 = FloatVectorMult(CONCAT44(uVar3,uVar3),uVar9,2,0x20);
    uVar3 = (undefined4)uVar8;
  }
  else {
    fVar10 = *(float *)(*(int *)(param_1 + 0x7c) + 0x10);
    uVar3 = FUN_00025164();
    uVar9 = CONCAT44(uVar6,DAT_00079430);
    uVar8 = FloatVectorMult(CONCAT44(uVar3,uVar3),uVar9,2,0x20);
    if ((float)uVar8 <= fVar10) goto LAB_000792b6;
    uVar3 = *(undefined4 *)(*(int *)(param_1 + 0x7c) + 0x10);
  }
  fVar10 = *(float *)(*(int *)(param_1 + 0x7c) + 0x14);
  uVar6 = FUN_000251a8();
  uVar9 = CONCAT44(uVar11,DAT_00079434);
  uVar8 = FloatVectorMult(CONCAT44(uVar6,uVar6),uVar9,2,0x20);
  if ((float)uVar8 < fVar10) {
    fVar10 = *(float *)(*(int *)(param_1 + 0x7c) + 0x14);
    uVar6 = FUN_000251a8();
    uVar9 = CONCAT44(uVar11,DAT_00079438);
    uVar8 = FloatVectorMult(CONCAT44(uVar6,uVar6),uVar9,2,0x20);
    if (fVar10 < (float)uVar8) {
      uVar6 = *(undefined4 *)(*(int *)(param_1 + 0x7c) + 0x14);
      goto LAB_00079316;
    }
  }
  uVar6 = FUN_000251a8();
  uVar8 = FloatVectorMult(CONCAT44(uVar6,uVar6),uVar9,2,0x20);
  uVar6 = (undefined4)uVar8;
LAB_00079316:
  *(undefined4 *)(param_1 + 0x108) = 0;
  *(undefined4 *)(param_1 + 0x100) = uVar3;
  *(undefined4 *)(param_1 + 0x104) = uVar6;
  FUN_0005032c(uVar6,param_1);
  if (*(int *)(param_1 + 0xe0) != 0) {
    FUN_0002be70(*(undefined4 *)(puVar2 + 0x1a4),*(int *)(param_1 + 0xe0),"pome-lp");
    *(undefined4 *)(param_1 + 0xe0) = 0;
  }
  local_58 = *(undefined4 *)(param_1 + 8);
  local_54 = *(undefined4 *)(param_1 + 0xc);
  local_50 = *(undefined4 *)(param_1 + 0x10);
  FUN_0000577c(local_58,*(undefined4 *)(puVar2 + 0x58),&local_58,0x3f800000,0x40000000,0x41100000);
  iVar4 = *(int *)(param_1 + 0x7c);
  local_64 = *(undefined4 *)(iVar4 + 0x10);
  local_60 = *(undefined4 *)(iVar4 + 0x14);
  local_5c = *(undefined4 *)(iVar4 + 0x18);
  local_68 = 0xffffffff;
  FUN_00020ea8(local_64,&local_64,&local_68);
  uVar3 = *(undefined4 *)(puVar2 + 0x1a4);
  local_94 = &PTR_LAB_0052bf38;
  local_90 = PTR_FUN_004d9058;
  local_6c = 1;
  local_8c[0] = 0;
  FUN_0000a23c(&local_94,local_8c);
  FUN_0002bc94(uVar3,"pome-burst",0x3e000000,0x40000000,local_8c,0);
  FUN_0000a298(local_8c);
  *(undefined4 *)(param_1 + 0x10c) = 1;
  *(undefined4 *)(param_1 + 0x88) = 0;
  *(undefined4 *)(param_1 + 0x8c) = 0;
  if (*(int *)puVar1 != local_44) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00069ef0 — 00069ef0

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

命中函数数: 7
