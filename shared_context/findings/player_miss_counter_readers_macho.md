# 调用目标并访问字段的函数（完整反编译）

- 目标: 0001d10c
- 字段: 0x3c
- 直接引用函数数: 48

## FUN_0002bc94 — 0002bc94

```c

undefined4
FUN_0002bc94(undefined4 *param_1,char *param_2,undefined4 param_3,undefined4 param_4,
            undefined4 param_5,undefined4 param_6)

{
  undefined *puVar1;
  undefined4 uVar2;
  int iVar3;
  size_t sVar4;
  int iVar5;
  int iVar6;
  undefined4 extraout_s1;
  undefined8 uVar7;
  
  puVar1 = PTR_DAT_004d9048;
  uVar2 = 0;
  if (*(char *)(param_1 + 0x1e2) != '\0') {
    iVar3 = FUN_0001d10c(PTR_DAT_004d9048);
    if (iVar3 != 0) {
      FUN_0001d10c(puVar1);
      iVar3 = FUN_000617e8();
      if (iVar3 != 0) {
        return 0;
      }
    }
    iVar3 = FUN_0002bc3c(param_2);
    if (iVar3 == 1) {
      iVar5 = 0;
      iVar3 = 0;
      do {
        iVar6 = iVar3;
        if (0x1f < iVar5) {
          return 0;
        }
        iVar5 = iVar5 + 1;
        iVar3 = iVar6 + 0x3c;
      } while (*(char *)((int)param_1 + iVar6 + 0x10) == '\0');
      uVar2 = 0;
      if ((iVar6 + 0x3c != 0) && (uVar2 = 0, *(char *)(param_1 + 0x1e2) != '\0')) {
        iVar3 = FUN_0001d10c(puVar1);
        if (iVar3 != 0) {
          FUN_0001d10c(puVar1);
          iVar3 = FUN_000617e8();
          if (iVar3 != 0) {
            return 0;
          }
        }
        uVar2 = FUN_0030a1d8(0);
        FUN_00309d38(uVar2,param_2,0,*(undefined4 *)((int)param_1 + iVar6 + 8),0x40,0);
        *(undefined1 *)((int)param_1 + iVar6 + 0x10) = 0;
        sVar4 = _strlen(param_2);
        uVar2 = FUN_002f69c4(param_2,sVar4);
        *(undefined4 *)((int)param_1 + iVar6 + 0xc) = uVar2;
        FUN_0002c1b4((int)param_1 + iVar6 + 0x20,param_5);
        *(undefined4 *)((int)param_1 + iVar6 + 0x14) = param_3;
        *(undefined4 *)((int)param_1 + iVar6 + 0x18) = param_4;
        uVar7 = FloatVectorSub(0x3f8000003f800000,CONCAT44(extraout_s1,*param_1),2,0x20);
        uVar7 = FloatVectorMult(uVar7,CONCAT44(param_3,param_3),2,0x20);
        uVar7 = FloatVectorSub(0x3f8000003f800000,uVar7,2,0x20);
        uVar7 = FloatVectorMult(uVar7,CONCAT44(param_4,param_4),2,0x20);
        FUN_00309b38((int)uVar7,*(undefined4 *)((int)param_1 + iVar6 + 8),(int)uVar7);
        FUN_00309b1c(*(undefined4 *)((int)param_1 + iVar6 + 8),param_6);
        uVar2 = *(undefined4 *)((int)param_1 + iVar6 + 8);
      }
    }
    else {
      uVar2 = FUN_0030a1d8();
      FUN_00309d38(uVar2,param_2,0,0,0x40,0);
      uVar2 = 0;
    }
  }
  return uVar2;
}


```

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

## FUN_000568f4 — 000568f4

```c

int * FUN_000568f4(int param_1,int param_2,int param_3)

{
  short sVar1;
  undefined *puVar2;
  undefined *puVar3;
  undefined *puVar4;
  uint *puVar5;
  undefined4 *puVar6;
  int iVar7;
  undefined4 *puVar8;
  int *piVar9;
  undefined4 uVar10;
  int iVar11;
  uint uVar12;
  undefined4 uVar13;
  undefined4 *puVar14;
  int iVar15;
  uint uVar16;
  undefined1 *puVar17;
  undefined1 *puVar18;
  uint uVar19;
  uint uVar20;
  uint uVar21;
  undefined4 *puVar22;
  uint uVar23;
  uint *puVar24;
  uint uVar25;
  uint *puVar26;
  uint *puVar27;
  float fVar30;
  undefined8 in_d0;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  uint extraout_s1_01;
  uint extraout_s1_02;
  longlong lVar31;
  float fVar32;
  undefined4 uVar33;
  undefined8 in_d1;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  uint extraout_s3_01;
  uint extraout_s3_02;
  undefined4 extraout_s3_03;
  longlong lVar34;
  float fVar35;
  undefined8 in_d2;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  undefined4 extraout_s5_01;
  undefined4 extraout_s5_02;
  uint extraout_s5_03;
  undefined4 extraout_s5_04;
  undefined4 extraout_s5_05;
  undefined4 extraout_s5_06;
  undefined4 extraout_s5_07;
  float fVar36;
  undefined8 uVar37;
  undefined4 extraout_s7;
  undefined4 extraout_s7_00;
  undefined4 extraout_s7_01;
  undefined4 extraout_s7_02;
  undefined4 extraout_s7_03;
  undefined4 extraout_s7_04;
  undefined4 extraout_s9;
  undefined4 extraout_s11;
  undefined8 uVar38;
  undefined8 unaff_d8;
  undefined8 uVar39;
  undefined8 uVar40;
  undefined8 unaff_d10;
  undefined8 uVar41;
  undefined8 uVar42;
  undefined8 uVar43;
  undefined8 uVar44;
  undefined8 unaff_d12;
  undefined8 uVar45;
  undefined8 uVar46;
  undefined8 uVar47;
  undefined8 uVar48;
  undefined4 *local_70;
  undefined4 local_6c;
  undefined4 local_68;
  undefined4 local_64;
  uint *puVar28;
  uint *puVar29;
  
  puVar5 = DAT_005a7930;
  fVar30 = DAT_00056c68;
  if (param_2 < 1) {
    return (int *)0x0;
  }
  if (param_3 == 0) {
    uVar47 = 0x3f8000003f800000;
    uVar46 = 0xbf800000bf800000;
    uVar41 = 0;
LAB_0005694c:
    lVar31 = (ulonglong)*DAT_005a7930 * (ulonglong)DAT_005a7930[2];
    uVar12 = (uint)lVar31;
    uVar16 = DAT_005a7930[1] * DAT_005a7930[2] +
             *DAT_005a7930 * DAT_005a7930[3] + (int)((ulonglong)lVar31 >> 0x20) +
             DAT_005a7930[5] + (uint)CARRY4(uVar12,DAT_005a7930[4]);
    uVar10 = (undefined4)((ulonglong)uVar16 * 0x7ffff >> 0x20);
    *DAT_005a7930 = uVar12 + DAT_005a7930[4];
    puVar5[1] = uVar16;
    uVar37 = FixedToFP(CONCAT44(uVar10,uVar10),0,1,0,0x20);
    uVar45 = FloatVectorSub(uVar47,uVar46,2,0x20);
    uVar37 = FloatVectorMult(uVar45,CONCAT44((int)((ulonglong)in_d2 >> 0x20),(float)uVar37 / fVar30)
                             ,2,0x20);
    uVar46 = FloatVectorAdd(uVar46,uVar37,2);
    uVar47 = FloatVectorMult(uVar46,CONCAT44((int)((ulonglong)uVar47 >> 0x20),DAT_00056c6c),2,0x20);
    uVar47 = FPToFixed(uVar47,0,1,3,0x20);
    puVar18 = (undefined1 *)uVar47;
    if (param_3 != 0) goto LAB_000569b8;
    uVar10 = FUN_000251a8();
    uVar47 = FloatVectorMult(CONCAT44(uVar10,uVar10),0xbf000000bf000000,2,0x20);
    uVar47 = FPToFixed(uVar47,0,0,3,0x20);
    local_70 = (undefined4 *)uVar47;
    uVar10 = extraout_s7_02;
    uVar33 = extraout_s5_02;
  }
  else {
    puVar18 = *(undefined1 **)(param_3 + 0x2c);
    uVar41 = CONCAT44((int)((ulonglong)unaff_d10 >> 0x20),*(undefined4 *)(param_3 + 0x80));
    if (puVar18 == &LAB_0001869e_1) {
      uVar46 = CONCAT44((int)((ulonglong)in_d0 >> 0x20),*(undefined4 *)(param_3 + 0x50));
      uVar47 = CONCAT44((int)((ulonglong)in_d1 >> 0x20),*(undefined4 *)(param_3 + 0x54));
      goto LAB_0005694c;
    }
LAB_000569b8:
    puVar17 = *(undefined1 **)(param_3 + 0x30);
    uVar47 = FUN_000251a8();
    iVar11 = (int)((ulonglong)uVar47 >> 0x20);
    uVar47 = FloatVectorMult(CONCAT44((int)uVar47,(int)uVar47),0xbf000000bf000000,2,0x20);
    uVar47 = FPToFixed(uVar47,0,0,3,0x20);
    local_70 = (undefined4 *)uVar47;
    if (puVar17 != &LAB_0001869e_1) {
      local_70 = (undefined4 *)((int)local_70 - *(int *)(param_3 + 0x30));
    }
    iVar7 = *(int *)(param_3 + 0x34);
    if (iVar7 != 0) {
      iVar11 = *(int *)(param_3 + 0x3c);
    }
    uVar10 = extraout_s7;
    uVar33 = extraout_s5;
    if (iVar7 != 0 && iVar11 != 0) {
      uVar46 = FUN_003010b8(iVar7 * 0xb6 & 0xffff);
      iVar11 = (int)((ulonglong)uVar46 >> 0x20);
      uVar47 = FixedToFP(CONCAT44(extraout_s1,*(undefined4 *)(param_3 + 0x3c)),0,0,0,0x20);
      uVar47 = FloatVectorMult(CONCAT44((int)uVar46,(int)uVar46),uVar47,2,0x20);
      uVar47 = FPToFixed(uVar47,0,0,3,0x20);
      local_70 = (undefined4 *)((int)local_70 + (int)uVar47);
      uVar10 = extraout_s7_00;
      uVar33 = extraout_s5_00;
    }
    iVar7 = *(int *)(param_3 + 0x38);
    if (iVar7 != 0) {
      iVar11 = *(int *)(param_3 + 0x3c);
    }
    if (iVar7 != 0 && iVar11 != 0) {
      uVar10 = FUN_003010d0(iVar7 * 0xb6 & 0xffff);
      uVar47 = FixedToFP(CONCAT44(extraout_s1_00,*(undefined4 *)(param_3 + 0x3c)),0,0,0,0x20);
      uVar47 = FloatVectorMult(CONCAT44(uVar10,uVar10),uVar47,2,0x20);
      uVar47 = FPToFixed(uVar47,0,0,3,0x20);
      puVar18 = puVar18 + (int)uVar47;
      uVar10 = extraout_s7_01;
      uVar33 = extraout_s5_01;
    }
  }
  puVar5 = DAT_005a7930;
  fVar30 = DAT_00056c68;
  uVar21 = DAT_005a7930[2];
  uVar25 = DAT_005a7930[3];
  uVar20 = DAT_005a7930[4];
  lVar31 = (ulonglong)*DAT_005a7930 * (ulonglong)uVar21;
  uVar12 = (uint)lVar31;
  uVar23 = DAT_005a7930[5];
  uVar16 = uVar12 + uVar20;
  uVar12 = DAT_005a7930[1] * uVar21 + *DAT_005a7930 * uVar25 + (int)((ulonglong)lVar31 >> 0x20) +
           uVar23 + CARRY4(uVar12,uVar20);
  iVar11 = (int)((ulonglong)uVar12 * 0x7ffff);
  uVar13 = (undefined4)((ulonglong)uVar12 * 0x7ffff >> 0x20);
  *DAT_005a7930 = uVar16;
  puVar5[1] = uVar12;
  uVar47 = FixedToFP(CONCAT44(uVar13,uVar13),0,1,0,0x20);
  uVar13 = (undefined4)((ulonglong)uVar47 >> 0x20);
  uVar46 = CONCAT44(uVar13,(float)uVar47 / fVar30);
  uVar37 = FloatVectorMult(uVar46,0x3fc000003fc00000,2,0x20);
  uVar47 = 0x4120000041200000;
  uVar37 = FloatVectorAdd(uVar37,0x4118000041180000,2);
  if (param_3 != 0) {
    fVar30 = *(float *)(param_3 + 0x40);
    uVar46 = CONCAT44(uVar13,*(float *)(param_3 + 0x44));
    if (fVar30 != 0.0 || (fVar30 != 0.0 || *(float *)(param_3 + 0x44) != 0.0)) {
      lVar31 = CONCAT44(uVar33,*(undefined4 *)(param_3 + 0x48));
      uVar45 = FloatVectorMult(CONCAT44(0x41200000,fVar30),lVar31,2,0x20);
      uVar47 = FloatVectorMult(uVar46,CONCAT44(uVar10,*(undefined4 *)(param_3 + 0x4c)),2,0x20);
      goto LAB_00056bd4;
    }
    puVar14 = &DAT_00056fe0;
    if (1 < *(int *)(param_3 + 0x58)) {
      puVar14 = &DAT_00056fe4;
    }
    uVar47 = CONCAT44(0x41200000,*puVar14);
  }
  uVar45 = FixedToFP(CONCAT44(puVar18,puVar18),0,0,0,0x20);
  uVar19 = (uint)((ulonglong)uVar16 * (ulonglong)uVar21);
  fVar30 = (float)uVar45 / DAT_00056c70;
  *puVar5 = uVar19 + uVar20;
  uVar16 = uVar12 * uVar21 + uVar16 * uVar25 + (int)((ulonglong)uVar16 * (ulonglong)uVar21 >> 0x20)
           + uVar23 + CARRY4(uVar19,uVar20);
  puVar5[1] = uVar16;
  uVar46 = FloatVectorMult(uVar47,CONCAT44((int)((ulonglong)uVar46 >> 0x20),fVar30),2,0x20);
  uVar46 = FPToFixed(uVar46,0,0,3,0x20);
  uVar46 = FixedToFP(uVar46,0,0,0,0x20);
  uVar45 = FloatVectorSub(uVar46,uVar47,2,0x20);
  uVar46 = FloatVectorAdd(uVar47,uVar46,2);
  uVar47 = FPToFixed(uVar45,0,0,3,0x20);
  uVar46 = FPToFixed(uVar46,0,0,3,0x20);
  uVar12 = (int)uVar46 - (int)uVar47;
  if (uVar12 != 0 && uVar12 != 0xffffffff) {
    uVar16 = (uint)((ulonglong)uVar12 * (ulonglong)uVar16 >> 0x20);
  }
  sVar1 = ((short)uVar16 + (short)uVar47) * 0xb6;
  uVar10 = FUN_003010b8(sVar1);
  unaff_d8 = 0x3f8000003f800000;
  if (param_3 != 0) {
    unaff_d8 = CONCAT44(0x3f800000,*(undefined4 *)(param_3 + 0x48));
  }
  uVar45 = FloatVectorMult(uVar37,CONCAT44(uVar10,uVar10),2,0x20);
  uVar38 = FUN_003010d0(sVar1);
  iVar11 = (int)((ulonglong)uVar38 >> 0x20);
  lVar31 = (ulonglong)extraout_s5_03 << 0x20;
  uVar46 = CONCAT44(extraout_s3,DAT_00056c74);
  uVar47 = 0x3f8000003f800000;
  uVar38 = FloatVectorMult(uVar37,CONCAT44((int)uVar38,(int)uVar38),2,0x20);
  if (param_3 != 0) {
    uVar47 = CONCAT44(0x3f800000,*(undefined4 *)(param_3 + 0x4c));
  }
  uVar45 = FloatVectorMult(uVar45,unaff_d8,2,0x20);
  uVar38 = FloatVectorMult(uVar38,uVar46,2,0x20);
  uVar47 = FloatVectorMult(uVar38,uVar47,2,0x20);
LAB_00056bd4:
  puVar5 = DAT_005a7930;
  iVar7 = 0x3f800000;
  if (param_3 != 0) {
    iVar7 = *(int *)(param_3 + 0x14);
  }
  uVar44 = CONCAT44((int)((ulonglong)uVar46 >> 0x20),DAT_0052bf04);
  uVar48 = CONCAT44((int)((ulonglong)lVar31 >> 0x20),DAT_0052bf08);
  uVar42 = FloatVectorNeg(uVar44,2,2);
  uVar39 = FloatVectorNeg(uVar48,2,2);
  uVar43 = FloatVectorNeg(CONCAT44(0x3f800000,DAT_0052bf00),2,2);
  uVar46 = CONCAT44((int)((ulonglong)unaff_d12 >> 0x20),DAT_0052bf80);
  uVar38 = CONCAT44((int)((ulonglong)unaff_d8 >> 0x20),DAT_0052bf84);
  puVar14 = &DAT_0052bf80;
  uVar40 = uVar45;
  if (param_3 == 0) {
    puVar22 = (undefined4 *)0x0;
  }
  else {
    puVar22 = *(undefined4 **)(param_3 + 0x58);
    iVar11 = (int)puVar22 + -1;
    puVar8 = (undefined4 *)0x3;
    puVar6 = (undefined4 *)0x2;
    switch(puVar22) {
    case (undefined4 *)0x1:
      puVar22 = (undefined4 *)0x1;
      uVar38 = FloatVectorNeg(uVar38,2,2);
      uVar46 = FloatVectorNeg(uVar46,2,2);
      uVar47 = FloatVectorMult(uVar47,0x3f0000003f000000,2,0x20);
      puVar14 = puVar8;
      uVar39 = uVar48;
      uVar42 = uVar44;
      uVar43 = CONCAT44(0x3f800000,DAT_0052bf00);
      break;
    case (undefined4 *)0x4:
      puVar24 = DAT_005a7930 + 2;
      uVar12 = *DAT_005a7930;
      puVar26 = DAT_005a7930 + 1;
      puVar27 = DAT_005a7930 + 3;
      puVar28 = DAT_005a7930 + 4;
      puVar29 = DAT_005a7930 + 5;
      lVar31 = (ulonglong)uVar12 * (ulonglong)*puVar24;
      uVar16 = (uint)lVar31;
      *DAT_005a7930 = uVar16 + *puVar28;
      uVar12 = *puVar26 * *puVar24 + uVar12 * *puVar27 + (int)((ulonglong)lVar31 >> 0x20) +
               *puVar29 + (uint)CARRY4(uVar16,*puVar28);
      puVar5[1] = uVar12;
      puVar8 = (undefined4 *)0x2;
      if ((int)uVar12 < 0) {
        puVar8 = (undefined4 *)0x3;
      }
    case (undefined4 *)0x3:
      uVar38 = 0x3f8000003f800000;
      uVar43 = CONCAT44((int)((ulonglong)uVar43 >> 0x20),DAT_0052c000);
      uVar42 = CONCAT44((int)((ulonglong)uVar42 >> 0x20),DAT_0052c004);
      uVar39 = CONCAT44((int)((ulonglong)uVar39 >> 0x20),DAT_0052c008);
      puVar6 = puVar8;
      uVar46 = uVar38;
    case (undefined4 *)0x2:
      puVar22 = puVar6;
      uVar40 = FixedToFP(CONCAT44(puVar18,puVar18),0,0,0,0x20);
      uVar10 = FUN_00025164();
      uVar44 = FixedToFP(CONCAT44(-(int)local_70,-(int)local_70),0,0,0,0x20);
      fVar30 = (float)FUN_000251a8();
      uVar44 = FloatVectorMult(uVar44,CONCAT44(uVar10,uVar10),2,0x20);
      uVar10 = FUN_000251a8();
      uVar40 = FloatVectorMult(uVar40,CONCAT44(uVar10,uVar10),2,0x20);
      uVar48 = FUN_00025164();
      iVar11 = (int)((ulonglong)uVar48 >> 0x20);
      uVar44 = FPToFixed(CONCAT44(extraout_s3_00,(float)uVar44 / fVar30),0,0,3,0x20);
      uVar40 = FPToFixed(CONCAT44((float)uVar48,(float)uVar40 / (float)uVar48),0,0,3,0x20);
      puVar18 = (undefined1 *)uVar44;
      local_70 = (undefined4 *)uVar40;
      uVar10 = (undefined4)((ulonglong)uVar40 >> 0x20);
      uVar37 = FloatVectorMult(uVar37,CONCAT44(uVar10,*(undefined4 *)(param_3 + 0x24)),2,0x20);
      uVar37 = FloatVectorMult(uVar37,CONCAT44(uVar10,DAT_00056fe8),2,0x20);
      uVar40 = FloatVectorMult(uVar47,0xbf400000bf400000,2,0x20);
      uVar47 = FloatVectorAdd(uVar45,uVar37,2);
      puVar14 = local_70;
      if (puVar22 == (undefined4 *)0x2) {
        uVar46 = 0xbf800000bf800000;
        uVar38 = 0x3f8000003f800000;
        puVar22 = (undefined4 *)0x2;
        uVar43 = FloatVectorNeg(CONCAT44((int)((ulonglong)uVar44 >> 0x20),DAT_0052c000),2,2);
        uVar42 = FloatVectorNeg(CONCAT44(extraout_s5_04,DAT_0052c004),2,2);
        uVar39 = FloatVectorNeg(CONCAT44(extraout_s7_03,DAT_0052c008),2,2);
        puVar14 = &DAT_0052c000;
      }
    }
  }
  uVar10 = FUN_000065c4(puVar14,iVar11);
  piVar9 = (int *)FUN_0000698c(uVar10,2,1);
  uVar37 = FPToFixed(uVar46,0,0,3,0x20);
  uVar45 = FloatVectorMult(uVar46,uVar40,2,0x20);
  uVar46 = FPToFixed(uVar38,0,0,3,0x20);
  uVar47 = FloatVectorMult(uVar38,uVar47,2,0x20);
  iVar11 = (int)puVar18 * (int)uVar37;
  uVar37 = CONCAT44(extraout_s9,*(undefined4 *)(param_1 + 100));
  iVar15 = (int)local_70 * (int)uVar46;
  uVar38 = FloatVectorMult(CONCAT44(extraout_s11,DAT_0052bf80),uVar37,2,0x20);
  uVar46 = FloatVectorMult(uVar37,CONCAT44(extraout_s5_05,DAT_0052bf88),2,0x20);
  uVar37 = FloatVectorMult(uVar37,CONCAT44(extraout_s7_04,DAT_0052bf84),2,0x20);
  local_6c = (undefined4)uVar38;
  local_68 = (undefined4)uVar37;
  uVar37 = FixedToFP(CONCAT44(iVar15,iVar15),0,0,0,0x20);
  local_64 = (undefined4)uVar46;
  uVar46 = FixedToFP(CONCAT44(iVar11,iVar11),0,0,0,0x20);
  piVar9[4] = (int)uVar46;
  piVar9[5] = (int)uVar37;
  piVar9[6] = 0x42000000;
  piVar9[9] = 0;
  piVar9[7] = (int)uVar45;
  piVar9[8] = (int)uVar47;
  (**(code **)(*piVar9 + 8))((int)uVar47,piVar9,0,0,&local_6c);
  piVar9[0x32] = iVar7;
  puVar2 = PTR_DAT_004d9048;
  iVar11 = FUN_0001d10c(iVar7,PTR_DAT_004d9048);
  lVar34 = (ulonglong)extraout_s3_01 << 0x20;
  lVar31 = (ulonglong)extraout_s1_01 << 0x20;
  uVar10 = extraout_s5_06;
  if (iVar11 != 0) {
    FUN_0001d10c(puVar2);
    puVar4 = PTR_DAT_004d907c;
    puVar3 = PTR_DAT_004d9078;
    iVar11 = FUN_00063fe0(PTR_DAT_004d907c,*(undefined4 *)PTR_DAT_004d9078);
    lVar34 = (ulonglong)extraout_s3_02 << 0x20;
    lVar31 = (ulonglong)extraout_s1_02 << 0x20;
    uVar10 = extraout_s5_07;
    if (iVar11 == 1) {
      FUN_0001d10c(puVar2);
      iVar11 = FUN_00063e80(puVar4,*(undefined4 *)puVar3);
      uVar10 = 0xbf800000;
      lVar31 = 0x4040000040400000;
      if (*(float *)(iVar11 + 0x10) != -1.0) {
        lVar31 = CONCAT44(0x40400000,*(float *)(iVar11 + 0x10));
      }
      uVar47 = FloatVectorMult(CONCAT44(extraout_s3_03,piVar9[10]),lVar31,2,0x20);
      piVar9[10] = (int)uVar47;
      uVar47 = FloatVectorMult(lVar31,CONCAT44((int)((ulonglong)uVar47 >> 0x20),piVar9[0xb]),2,0x20)
      ;
      piVar9[0xb] = (int)uVar47;
      uVar47 = FloatVectorMult(lVar31,CONCAT44((int)((ulonglong)uVar47 >> 0x20),piVar9[0xc]),2,0x20)
      ;
      piVar9[0xc] = (int)uVar47;
      iVar7 = piVar9[0xe];
      if (iVar7 != 0) {
        uVar47 = CONCAT44((int)((ulonglong)uVar47 >> 0x20),DAT_00056fec);
      }
      uVar46 = FloatVectorMult(lVar31,uVar47,2,0x20);
      lVar34 = FloatVectorMult(uVar46,CONCAT44((int)((ulonglong)uVar47 >> 0x20),
                                               *(undefined4 *)(iVar7 + 0x14)),2,0x20);
      if (iVar7 != 0) {
        *(int *)(iVar7 + 0x14) = (int)lVar34;
      }
      *(int *)(iVar11 + 0x10) = (int)lVar31;
      *(undefined1 *)(piVar9 + 0x35) = 1;
    }
  }
  if (param_3 != 0) {
    fVar36 = (float)piVar9[0x28];
    uVar13 = (undefined4)((ulonglong)lVar34 >> 0x20);
    fVar35 = *(float *)(param_3 + 0x28);
    fVar30 = -(fVar36 * *(float *)(param_3 + 0x20));
    lVar31 = CONCAT44((int)((ulonglong)lVar31 >> 0x20),fVar30);
    fVar32 = -(fVar36 * *(float *)(param_3 + 0x24));
    lVar34 = CONCAT44(uVar13,fVar32);
    piVar9[0x27] = (int)fVar30;
    piVar9[0x28] = (int)fVar32;
    piVar9[0x29] = (int)-(fVar36 * fVar35);
    uVar33 = DAT_00056ff0;
    if ((puVar22 == (undefined4 *)0x3) || (uVar33 = DAT_00056ff4, puVar22 == (undefined4 *)0x2)) {
      lVar34 = CONCAT44(uVar13,uVar33);
      lVar31 = FloatVectorAdd(lVar31,lVar34,2);
      piVar9[0x27] = (int)lVar31;
    }
  }
  uVar46 = CONCAT44(uVar10,piVar9[0xb]);
  uVar47 = CONCAT44((int)((ulonglong)lVar31 >> 0x20),DAT_00056ff8);
  uVar37 = FloatVectorMult(uVar43,uVar46,2,0x20);
  uVar45 = FloatVectorMult(uVar42,uVar46,2,0x20);
  uVar38 = FloatVectorMult(uVar37,uVar47,2,0x20);
  uVar45 = FloatVectorMult(uVar45,uVar47,2,0x20);
  uVar37 = FloatVectorMult(uVar39,uVar46,2,0x20);
  uVar46 = FloatVectorAdd(CONCAT44((int)((ulonglong)lVar34 >> 0x20),piVar9[4]),uVar38,2);
  uVar37 = FloatVectorMult(uVar37,uVar47,2,0x20);
  piVar9[4] = (int)uVar46;
  uVar47 = FloatVectorAdd(uVar45,CONCAT44((int)((ulonglong)uVar46 >> 0x20),piVar9[5]),2);
  piVar9[5] = (int)uVar47;
  uVar47 = FloatVectorAdd(uVar37,CONCAT44((int)((ulonglong)uVar47 >> 0x20),piVar9[6]),2);
  piVar9[6] = (int)uVar47;
  if (-10.0 < (float)uVar41) {
    uVar47 = FloatVectorMax(0,uVar41,2,0x20);
    uVar47 = FloatVectorAdd(uVar47,CONCAT44(0xc1200000,DAT_00056ffc),2);
    FUN_00008a50(piVar9,(int)uVar47);
  }
  return piVar9;
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

## FUN_0000e6a4 — 0000e6a4

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

## FUN_00010bec — 00010bec

```c

void FUN_00010bec(int param_1,int param_2,undefined4 param_3,undefined4 param_4,undefined4 *param_5)

{
  char cVar1;
  byte bVar2;
  longlong lVar3;
  bool bVar4;
  undefined *puVar5;
  undefined *puVar6;
  undefined *puVar7;
  undefined2 uVar8;
  int iVar9;
  int iVar10;
  undefined4 uVar11;
  uint uVar12;
  int iVar13;
  float fVar14;
  float *pfVar15;
  undefined4 uVar16;
  int *piVar17;
  size_t sVar18;
  uint uVar19;
  undefined1 uVar20;
  uint uVar21;
  undefined4 uVar22;
  int iVar23;
  undefined4 *puVar24;
  uint *puVar25;
  int *piVar26;
  int *piVar27;
  undefined4 extraout_s0;
  undefined4 extraout_s0_00;
  undefined4 extraout_s1;
  undefined8 uVar29;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined4 extraout_s1_03;
  undefined4 extraout_s1_04;
  undefined4 extraout_s1_05;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  undefined4 extraout_s3_01;
  undefined4 extraout_s3_02;
  undefined4 extraout_s3_03;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  undefined4 extraout_s5_01;
  undefined4 extraout_s5_02;
  undefined4 extraout_s5_03;
  undefined4 extraout_s5_04;
  undefined8 uVar30;
  undefined8 uVar31;
  undefined4 local_180;
  undefined4 local_17c;
  undefined4 local_178;
  undefined4 local_174;
  undefined4 local_170;
  undefined4 local_16c;
  undefined4 local_168;
  undefined4 local_164;
  undefined4 local_160;
  undefined4 local_15c;
  undefined4 local_158;
  undefined4 local_154;
  undefined1 local_150;
  undefined1 local_14f;
  undefined1 local_14e;
  undefined1 local_14d;
  undefined4 local_14c;
  undefined4 local_148;
  undefined4 local_144;
  undefined1 local_140;
  undefined1 local_13f;
  undefined1 local_13e;
  undefined1 local_13d;
  undefined4 local_13c;
  undefined4 local_138;
  undefined4 local_134;
  undefined **local_130;
  undefined *local_12c;
  undefined4 local_128 [8];
  undefined1 local_108;
  undefined **local_104;
  undefined *local_100;
  undefined4 local_fc [8];
  undefined1 local_dc;
  undefined **local_d8;
  undefined *local_d4;
  undefined4 local_d0 [8];
  undefined1 local_b0;
  char acStack_ac [128];
  int local_2c;
  uint *puVar28;
  
  puVar6 = PTR_DAT_004d9048;
  puVar5 = PTR____stack_chk_guard_004d9044;
  local_2c = *(int *)PTR____stack_chk_guard_004d9044;
  uVar20 = 1;
  if ((*(char *)(param_1 + 0x1bc) != '\0') || (uVar20 = 1, -1.0 < *(float *)(param_1 + 0x104)))
  goto LAB_00011caa;
  if (0.0 < *(float *)(param_1 + 0xac)) {
    uVar20 = 0;
    *(undefined1 *)(param_1 + 0x1ba) = 0;
    goto LAB_00011caa;
  }
  iVar9 = FUN_0001d10c();
  if (((iVar9 != 0) &&
      (iVar10 = FUN_00063fe0(PTR_DAT_004d907c,*(undefined4 *)PTR_DAT_004d9090), iVar10 == 1)) &&
     (iVar10 = FUN_0005edbc(PTR_DAT_004d9024), iVar10 == 0)) {
    uVar11 = FUN_000065c4();
    uVar12 = FUN_00006a84(uVar11,2);
    puVar7 = PTR_DAT_004d9050;
    if (0 < (int)uVar12) {
      do {
        lVar3 = (ulonglong)*(uint *)puVar7 * (ulonglong)*(uint *)(puVar7 + 8);
        uVar19 = (uint)lVar3;
        iVar10 = *(int *)(puVar7 + 4) * *(uint *)(puVar7 + 8) +
                 *(uint *)puVar7 * *(int *)(puVar7 + 0xc) + (int)((ulonglong)lVar3 >> 0x20);
        lVar3 = CONCAT44(iVar10,uVar19);
        uVar21 = *(int *)(puVar7 + 0x14) + iVar10 + (uint)CARRY4(uVar19,*(uint *)(puVar7 + 0x10));
        *(uint *)puVar7 = uVar19 + *(uint *)(puVar7 + 0x10);
        *(uint *)(puVar7 + 4) = uVar21;
        if (uVar12 != 0 && uVar12 != 0xffffffff) {
          lVar3 = (ulonglong)uVar21 * (ulonglong)uVar12;
          uVar21 = (uint)((ulonglong)lVar3 >> 0x20);
        }
        uVar11 = FUN_000065c4((int)((ulonglong)lVar3 >> 0x20),(int)lVar3);
        iVar10 = FUN_00006aa4(uVar11,2,uVar21);
      } while (iVar10 == 0);
      uVar11 = FUN_00052f80();
      iVar13 = FUN_00057000(uVar11,1,*(undefined1 *)(param_1 + 0x3c),0,0);
      *(undefined4 *)(iVar13 + 0xd0) = 0;
      *(undefined4 *)(iVar13 + 0x1c) = *(undefined4 *)(iVar10 + 0x1c);
      *(undefined4 *)(iVar13 + 0x20) = *(undefined4 *)(iVar10 + 0x20);
      *(undefined4 *)(iVar13 + 0x24) = *(undefined4 *)(iVar10 + 0x24);
      *(undefined4 *)(iVar13 + 0x10) = *(undefined4 *)(iVar10 + 0x10);
      *(undefined4 *)(iVar13 + 0x14) = *(undefined4 *)(iVar10 + 0x14);
      *(undefined4 *)(iVar13 + 0x18) = *(undefined4 *)(iVar10 + 0x18);
      local_b0 = 1;
      local_d8 = &PTR_LAB_0052bf38;
      local_d4 = PTR_FUN_004d9058;
      local_d0[0] = 0;
      uVar11 = *(undefined4 *)(puVar6 + 0x1a4);
      FUN_0000a23c(&local_d8,local_d0);
      FUN_0002bc94(uVar11,"fruit-spawn",0x3f800000,0x3f800000,local_d0,0);
      FUN_0000a298(local_d0);
      uVar11 = FUN_002f69c4("fruit_bomb_transform",0x14);
      FUN_00011cc4(iVar13,uVar11);
      FUN_00008450(iVar10);
    }
  }
  bVar4 = false;
  if (((*(char *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x330) == '\0') &&
      (bVar4 = true, *(char *)(param_1 + 0xcc) != '\0')) &&
     (bVar4 = false, 3 < *(int *)(param_1 + 200))) {
    bVar4 = true;
  }
  *(undefined4 *)(param_1 + 0x70) = 0;
  iVar10 = FUN_0001cd94(*(undefined4 *)(param_1 + 0x84));
  if (bVar4) {
    uVar20 = 0;
    if (((iVar9 != 0) &&
        ((iVar13 = FUN_0005eef0(PTR_DAT_004d9024), iVar13 != 1 ||
         (uVar20 = 1, *(char *)(param_1 + 0xcc) != '\0')))) &&
       (uVar20 = 0, 3 < *(int *)(param_1 + 200))) {
      uVar20 = 1;
    }
    *(undefined1 *)(param_1 + 0x1bb) = uVar20;
    iVar13 = FUN_0001cd14();
    if ((((iVar10 < 2) || (iVar13 != 1)) ||
        (*(char *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x318) == '\0')) ||
       ((puVar6[0x17] != '\0' || (0.0 < *(float *)(puVar6 + 0x24))))) {
LAB_00011054:
      *(undefined1 *)(param_1 + 0x1ba) = 0;
    }
    else {
      iVar10 = *(int *)(puVar6 + 0x40) + -1;
      if (iVar10 < 2) {
        iVar10 = 2;
      }
      *(int *)(puVar6 + 0x40) = iVar10;
      if (param_2 == 0) {
        *(undefined1 *)(param_1 + 0x1ba) = 0;
      }
      else {
        uVar11 = FUN_00052f80();
        uVar20 = 0;
        fVar14 = (float)FUN_000580e4(uVar11,0);
        iVar10 = DAT_0052bf68;
        if (0.0 < fVar14) {
          iVar23 = *(int *)(puVar6 + 0x40);
          uVar11 = FUN_00052f80();
          fVar14 = (float)FUN_000580e4(uVar11,0);
          iVar13 = DAT_0052bf68;
          puVar7 = PTR_DAT_004d9050;
          if (iVar23 < iVar10) {
            iVar10 = iVar23;
          }
          uVar29 = FixedToFP(CONCAT44(iVar10,iVar10),0,0,0,0x20);
          if ((float)uVar29 / fVar14 <= 1.0) {
            puVar25 = (uint *)(PTR_DAT_004d9050 + 8);
            uVar12 = *(uint *)PTR_DAT_004d9050;
            piVar17 = (int *)(PTR_DAT_004d9050 + 4);
            piVar27 = (int *)(PTR_DAT_004d9050 + 0xc);
            puVar28 = (uint *)(PTR_DAT_004d9050 + 0x10);
            piVar26 = (int *)(PTR_DAT_004d9050 + 0x14);
            lVar3 = (ulonglong)uVar12 * (ulonglong)*puVar25;
            uVar21 = (uint)lVar3;
            *(uint *)PTR_DAT_004d9050 = uVar21 + *puVar28;
            uVar12 = *piVar17 * *puVar25 + uVar12 * *piVar27 + (int)((ulonglong)lVar3 >> 0x20) +
                     *piVar26 + (uint)CARRY4(uVar21,*puVar28);
            *(uint *)(puVar7 + 4) = uVar12;
            uVar21 = 1;
LAB_00010fd2:
            uVar12 = (uint)((ulonglong)uVar21 * (ulonglong)uVar12 >> 0x20);
          }
          else {
            iVar10 = *(int *)(puVar6 + 0x40);
            uVar11 = FUN_00052f80();
            fVar14 = (float)FUN_000580e4(uVar11,0);
            puVar7 = PTR_DAT_004d9050;
            if (iVar10 < iVar13) {
              iVar13 = iVar10;
            }
            uVar29 = FixedToFP(CONCAT44(iVar13,iVar13),0,0,0,0x20);
            uVar12 = *(uint *)PTR_DAT_004d9050;
            piVar26 = (int *)(PTR_DAT_004d9050 + 4);
            puVar28 = (uint *)(PTR_DAT_004d9050 + 8);
            piVar27 = (int *)(PTR_DAT_004d9050 + 0xc);
            puVar25 = (uint *)(PTR_DAT_004d9050 + 0x10);
            lVar3 = (ulonglong)uVar12 * (ulonglong)*puVar28;
            uVar21 = (uint)lVar3;
            piVar17 = (int *)(PTR_DAT_004d9050 + 0x14);
            *(uint *)PTR_DAT_004d9050 = uVar21 + *puVar25;
            uVar12 = *piVar26 * *puVar28 + uVar12 * *piVar27 + (int)((ulonglong)lVar3 >> 0x20) +
                     *piVar17 + (uint)CARRY4(uVar21,*puVar25);
            *(uint *)(puVar7 + 4) = uVar12;
            uVar29 = FPToFixed(CONCAT44((int)((ulonglong)uVar29 >> 0x20),(float)uVar29 / fVar14),0,1
                               ,3,0x20);
            uVar21 = (uint)uVar29;
            if ((uVar21 != 0) && (uVar21 != 0xffffffff)) goto LAB_00010fd2;
          }
          uVar20 = 0;
          if (uVar12 == 0) {
            uVar20 = 1;
          }
        }
        *(undefined1 *)(param_1 + 0x1ba) = uVar20;
      }
      if ((iVar9 != 0) && (iVar10 = FUN_00063fe0(PTR_DAT_004d907c,DAT_00556ca8._4_4_), iVar10 == 1))
      {
        *(undefined1 *)(param_1 + 0x1ba) = 0;
      }
      if (((DAT_00556cfc & 1) == 0) && (iVar10 = ___cxa_guard_acquire(&DAT_00556cfc), iVar10 != 0))
      {
        DAT_00556cf8 = FUN_0000aae0("bean",0);
        ___cxa_guard_release(&DAT_00556cfc);
      }
      if (*(byte *)(param_1 + 0x3c) == DAT_00556cf8) goto LAB_00011054;
      if (*(char *)(param_1 + 0x1ba) != '\0') {
        *(int *)(puVar6 + 0x40) = DAT_0052bf68 + DAT_0052bf6c;
        piVar17 = *(int **)puVar6;
        if (piVar17 != (int *)0x0) {
          (**(code **)(*piVar17 + 0x54))(piVar17,param_1);
        }
      }
    }
    if ((puVar6[0x18] == '\0') ||
       (iVar10 = FUN_0000fa78(param_1), uVar11 = extraout_s5_00, uVar22 = extraout_s1_00,
       uVar16 = extraout_s3_00, iVar10 == 0)) {
      if (*(char *)(param_1 + 0x1ba) == '\0') {
        uVar11 = FUN_0002ede8();
        iVar10 = FUN_000305c4(uVar11,0x3f800000,0x3f000000);
        puVar7 = PTR_FUN_004d9058;
        uVar11 = extraout_s5_02;
        uVar22 = extraout_s1_02;
        uVar16 = extraout_s3_02;
        if ((iVar10 == 0) &&
           (uVar12 = (uint)*(byte *)(param_1 + 0x3c),
           0 < *(int *)(uVar12 * 0x338 + DAT_005d4cdc + 800))) {
          iVar13 = 0;
          iVar10 = 0;
          do {
            uVar22 = *(undefined4 *)(puVar6 + 0x1a4);
            uVar11 = *(undefined4 *)(*(int *)(uVar12 * 0x338 + DAT_005d4cdc + 0x31c) + iVar10);
            local_130 = &PTR_LAB_0052bf38;
            local_108 = 1;
            local_128[0] = 0;
            local_12c = puVar7;
            FUN_0000a23c(&local_130,local_128);
            FUN_0002bc94(uVar22,uVar11,0x3f000000,0x3f800000,local_128,0);
            FUN_0000a298(local_128);
            uVar12 = (uint)*(byte *)(param_1 + 0x3c);
            iVar10 = iVar10 + 0xc;
            iVar13 = iVar13 + 1;
            uVar11 = extraout_s5_03;
            uVar22 = extraout_s1_03;
            uVar16 = extraout_s3_03;
          } while (iVar13 < *(int *)(uVar12 * 0x338 + DAT_005d4cdc + 800));
        }
      }
      else {
        local_104 = &PTR_LAB_0052bf38;
        local_100 = PTR_FUN_004d9058;
        local_dc = 1;
        local_fc[0] = 0;
        uVar11 = *(undefined4 *)(puVar6 + 0x1a4);
        FUN_0000a23c(&local_104,local_fc);
        FUN_0002bc94(uVar11,"Critical",0x3e800000,0x3f800000,local_fc,0);
        FUN_0000a298(local_fc);
        uVar11 = FUN_0002ede8();
        FUN_000305c4(uVar11,0x3f800000,0x3f000000);
        uVar11 = extraout_s5_01;
        uVar22 = extraout_s1_01;
        uVar16 = extraout_s3_01;
      }
    }
  }
  else {
    *(undefined1 *)(param_1 + 0x1ba) = 0;
    uVar11 = extraout_s5;
    uVar22 = extraout_s1;
    uVar16 = extraout_s3;
  }
  *(undefined4 *)(param_1 + 0x4c) = *(undefined4 *)(param_1 + 0x10);
  *(undefined4 *)(param_1 + 0x50) = *(undefined4 *)(param_1 + 0x14);
  *(undefined4 *)(param_1 + 0x54) = *(undefined4 *)(param_1 + 0x18);
  *(undefined4 *)(param_1 + 0x104) = 0x3cf5c28f;
  uVar31 = FloatVectorMult(CONCAT44(uVar22,*param_5),CONCAT44(uVar22,*param_5),2,0x20);
  uVar30 = FloatVectorMult(CONCAT44(uVar11,param_5[1]),CONCAT44(uVar11,param_5[1]),2,0x20);
  uVar29 = FloatVectorMult(CONCAT44(uVar16,param_5[2]),CONCAT44(uVar16,param_5[2]),2,0x20);
  uVar30 = FloatVectorAdd(uVar31,uVar30,2);
  uVar29 = FloatVectorAdd(uVar30,uVar29,2);
  uVar11 = FUN_00301044((int)uVar29);
  uVar29 = FloatVectorMult(CONCAT44(uVar11,uVar11),CONCAT44(extraout_s1_04,DAT_00011458),2,0x20);
  uVar30 = FloatVectorMin(0x4100000041000000,uVar29,2,0x20);
  uVar11 = (undefined4)((ulonglong)uVar29 >> 0x20);
  if (*(char *)(param_1 + 0x1ba) == '\0') {
    if (*(int *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x314) == 0x32) {
      cVar1 = puVar6[0x17];
    }
    else {
      if (*(char *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x330) == '\0')
      goto LAB_000112a6;
      cVar1 = puVar6[0x17];
    }
    if (cVar1 == '\0') {
      uVar30 = FloatVectorMin(0x4100000041000000,uVar29,2,0x20);
      uVar29 = FloatVectorMult(CONCAT44(uVar11,*(undefined4 *)(param_1 + 0x104)),0x3f0000003f000000,
                               2,0x20);
      *(int *)(param_1 + 0x104) = (int)uVar29;
      local_14c = *(undefined4 *)(param_1 + 0x10);
      local_148 = *(undefined4 *)(param_1 + 0x14);
      local_144 = *(undefined4 *)(param_1 + 0x18);
      local_14d = 0x80;
      local_14e = 0xff;
      local_14f = 0xff;
      local_150 = 0xff;
      FUN_00020ea8((int)uVar29,&local_14c,&local_150);
      if (*(int *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x314) == 0x32) {
        uVar11 = FUN_00043d2c();
        local_15c = *(undefined4 *)(param_1 + 0x10);
        local_158 = *(undefined4 *)(param_1 + 0x14);
        local_154 = *(undefined4 *)(param_1 + 0x18);
        FUN_000447b0(uVar11,&local_15c);
      }
    }
  }
  else {
    uVar30 = FloatVectorMin(0x4100000041000000,uVar29,2,0x20);
    uVar29 = FloatVectorMult(CONCAT44(uVar11,*(undefined4 *)(param_1 + 0x104)),0x4020000040200000,2,
                             0x20);
    *(int *)(param_1 + 0x104) = (int)uVar29;
    local_13c = *(undefined4 *)(param_1 + 0x10);
    local_138 = *(undefined4 *)(param_1 + 0x14);
    local_134 = *(undefined4 *)(param_1 + 0x18);
    local_140 = (undefined1)DAT_005d4cd4;
    local_13f = (undefined1)((uint)DAT_005d4cd4 >> 8);
    local_13e = (undefined1)((uint)DAT_005d4cd4 >> 0x10);
    local_13d = (undefined1)((uint)DAT_005d4cd4 >> 0x18);
    FUN_00020ea8((int)uVar29,&local_13c,&local_140);
  }
LAB_000112a6:
  uVar8 = FUN_0030113c(*param_5,param_5[1]);
  *(undefined2 *)(param_1 + 0x108) = uVar8;
  iVar10 = 0x10;
  *(int *)(param_1 + 0x10c) = (int)uVar30;
  *(undefined4 *)(param_1 + 0x110) = *param_5;
  *(undefined4 *)(param_1 + 0x114) = param_5[1];
  *(undefined4 *)(param_1 + 0x118) = param_5[2];
  uVar11 = extraout_s0;
  do {
    if (*(int *)(param_1 + iVar10 * 4) != 0) {
      uVar11 = FUN_00033ca0();
      uVar11 = FUN_00036f4c(uVar11,*(undefined4 *)(param_1 + iVar10 * 4));
      *(undefined4 *)(param_1 + iVar10 * 4) = 0;
    }
    iVar10 = iVar10 + 1;
  } while (iVar10 != 0x12);
  if (puVar6[0x18] != '\0') {
    iVar10 = FUN_0000fa78(param_1);
    uVar20 = 0;
    uVar11 = extraout_s0_00;
    if (iVar10 != 0) goto LAB_00011caa;
  }
  iVar10 = FUN_0001cd6c(uVar11,0);
  if ((iVar10 == 1) && (param_1 == param_2)) {
    *(undefined4 *)(param_1 + 0x70) = 2;
  }
  if (bVar4) {
    pfVar15 = (float *)FUN_00033ca0();
    if (*pfVar15 <= 0.0) {
      local_168 = *(undefined4 *)(param_1 + 0x10);
      local_164 = *(undefined4 *)(param_1 + 0x14);
      local_160 = *(undefined4 *)(param_1 + 0x18);
      uVar29 = FixedToFP((ulonglong)
                         CONCAT24(*(ushort *)(param_1 + 0x108),(uint)*(ushort *)(param_1 + 0x108)),0
                         ,1,0,0x20);
      uVar31 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar29 >> 0x20),(float)uVar29 / DAT_0001145c
                                      ),CONCAT44(extraout_s5_04,DAT_00011460),2);
      uVar29 = FloatVectorMult(uVar30,CONCAT44(extraout_s1_05,DAT_00011464),2,0x20);
      if (*(char *)(param_1 + 0x1ba) == '\0') {
        uVar11 = *(undefined4 *)(param_1 + 0x70);
      }
      else {
        uVar11 = 1;
      }
      FUN_00011d10(&local_168,(int)uVar31,(int)uVar29,uVar11,0,0x3f800000);
    }
    uVar11 = FUN_0002ede8();
    local_174 = *(undefined4 *)(param_1 + 0x10);
    local_170 = *(undefined4 *)(param_1 + 0x14);
    local_16c = *(undefined4 *)(param_1 + 0x18);
    FUN_000305f4(uVar11,&local_174);
    puVar24 = (undefined4 *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x250);
    if (((*(char *)(param_1 + 0x1ba) != '\0') && (puVar24 = &DAT_00556d00, (DAT_00556d04 & 1) == 0))
       && (iVar10 = ___cxa_guard_acquire(&DAT_00556d04), iVar10 != 0)) {
      DAT_00556d00 = FUN_002f69c4("crit_hit",8);
      puVar24 = &DAT_00556d00;
      ___cxa_guard_release(&DAT_00556d04);
    }
    uVar22 = *puVar24;
    uVar11 = FUN_00033ca0();
    iVar10 = FUN_000359cc(uVar11,uVar22);
    if (iVar10 == 1) {
      uVar11 = FUN_00033ca0();
      uVar11 = FUN_00035a08(uVar11,uVar22,param_1 + 0x40,1);
      *(undefined4 *)(param_1 + 0x40) = uVar11;
      uVar11 = FUN_00033ca0();
      iVar10 = FUN_00035a08(uVar11,uVar22,param_1 + 0x44,1);
      *(int *)(param_1 + 0x44) = iVar10;
      iVar13 = *(int *)(param_1 + 0x40);
      if (iVar13 != 0) {
        *(undefined4 *)(iVar13 + 8) = *(undefined4 *)(param_1 + 0x10);
        *(undefined4 *)(iVar13 + 0xc) = *(undefined4 *)(param_1 + 0x14);
        *(undefined4 *)(iVar13 + 0x10) = *(undefined4 *)(param_1 + 0x18);
        uVar12 = FUN_003010b8(-*(short *)(param_1 + 0x108));
        *(uint *)(*(int *)(param_1 + 0x40) + 0x34) = uVar12 ^ 0x80000000;
        uVar11 = FUN_003010d0(-*(short *)(param_1 + 0x108));
        *(undefined4 *)(*(int *)(param_1 + 0x40) + 0x30) = uVar11;
        iVar10 = *(int *)(param_1 + 0x44);
      }
      if (iVar10 != 0) {
        *(undefined4 *)(iVar10 + 8) = *(undefined4 *)(param_1 + 0x11c);
        *(undefined4 *)(iVar10 + 0xc) = *(undefined4 *)(param_1 + 0x120);
        *(undefined4 *)(iVar10 + 0x10) = *(undefined4 *)(param_1 + 0x124);
        uVar12 = FUN_003010b8(-*(short *)(param_1 + 0x108));
        *(uint *)(*(int *)(param_1 + 0x44) + 0x34) = uVar12 ^ 0x80000000;
        uVar11 = FUN_003010d0(-*(short *)(param_1 + 0x108));
        *(undefined4 *)(*(int *)(param_1 + 0x44) + 0x30) = uVar11;
      }
    }
    uVar22 = *(undefined4 *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x25c);
    uVar11 = FUN_00033ca0();
    iVar10 = FUN_000359cc(uVar11,uVar22);
    if (iVar10 == 1) {
      uVar11 = FUN_00033ca0();
      iVar10 = FUN_00035a08(uVar11,uVar22,0,
                            (int)((uint)(*(float *)(puVar6 + 0x20) < 1.0) << 0x1f) < 0);
      if (iVar10 != 0) {
        uVar12 = FUN_003010b8(-*(short *)(param_1 + 0x108));
        *(uint *)(iVar10 + 0x34) = uVar12 ^ 0x80000000;
        uVar11 = FUN_003010d0(-*(short *)(param_1 + 0x108));
        *(undefined4 *)(iVar10 + 0x30) = uVar11;
        *(undefined4 *)(iVar10 + 8) = *(undefined4 *)(param_1 + 0x10);
        *(undefined4 *)(iVar10 + 0xc) = *(undefined4 *)(param_1 + 0x14);
        *(undefined4 *)(iVar10 + 0x10) = *(undefined4 *)(param_1 + 0x18);
      }
    }
  }
  uVar20 = 0;
  if (puVar6[0x18] == '\0') {
    uVar11 = FUN_0000342c(0);
    FUN_000040b0(uVar11,*(undefined4 *)
                         ((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x250));
    if ((*(char *)(param_1 + 0xcc) == '\0') || (3 < *(int *)(param_1 + 200))) {
      if (((param_2 == 0) || (*(char *)(param_1 + 0xc4) != '\0')) ||
         ((puVar6[0x17] != '\0' &&
          (((*(int *)(puVar6 + 0x10) != 1 ||
            (-1 < (int)((uint)(*(float *)(puVar6 + 0x20) < DAT_00011468) << 0x1f))) ||
           (*(float *)(puVar6 + 0x20) <= DAT_0001146c)))))) {
        uVar20 = 0;
        if ((*(char *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x330) == '\0') ||
           (param_2 == 0)) goto LAB_00011caa;
        DAT_005d4cf0 = DAT_005d4cf0 + 1;
        for (puVar24 = DAT_005d4ce8; (undefined4 **)puVar24 != &DAT_005d4ce8;
            puVar24 = (undefined4 *)*puVar24) {
          piVar17 = puVar24 + 2;
          if ((puVar24[0xb] == 0) || (((int)puVar24[0xb] < DAT_005d4cf0 && (puVar24[0xc] == 1)))) {
            if (*(char *)(puVar24 + 10) != '\0') {
              piVar17 = (int *)*piVar17;
            }
            if (piVar17 != (int *)0x0) {
              (**(code **)(*piVar17 + 0xc))(piVar17,param_1,0,param_2);
            }
          }
        }
        FUN_00014d20(&DAT_005d4ce8);
        *(int *)(param_1 + 0x1cc) = *(int *)(param_1 + 0x1cc) + 1;
        for (puVar24 = *(undefined4 **)(param_1 + 0x1c4); puVar24 != (undefined4 *)(param_1 + 0x1c4)
            ; puVar24 = (undefined4 *)*puVar24) {
          piVar17 = puVar24 + 2;
          if ((puVar24[0xb] == 0) ||
             (((int)puVar24[0xb] < *(int *)(param_1 + 0x1cc) && (puVar24[0xc] == 1)))) {
            if (*(char *)(puVar24 + 10) != '\0') {
              piVar17 = (int *)*piVar17;
            }
            if (piVar17 != (int *)0x0) {
              (**(code **)(*piVar17 + 0xc))(piVar17,param_1,0,param_2);
            }
          }
        }
        FUN_00014d20((undefined4 *)(param_1 + 0x1c4));
      }
      else {
        uVar11 = *(undefined4 *)(param_1 + 0x84);
        if (*(int *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x32c) != 0) {
          uVar22 = FUN_00031290();
          uVar16 = FUN_00014934(*(undefined4 *)
                                 ((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x32c));
          local_180 = *(undefined4 *)(param_1 + 0x10);
          local_17c = *(undefined4 *)(param_1 + 0x14);
          local_178 = *(undefined4 *)(param_1 + 0x18);
          FUN_00031d68(uVar22,uVar16,&local_180,0);
        }
        if (*(char *)(param_1 + 0x1ba) == '\0') {
          uVar12 = (uint)*(byte *)(param_1 + 0x3c);
          iVar10 = *(int *)(uVar12 * 0x338 + DAT_005d4cdc + 0x314);
        }
        else {
          uVar12 = (uint)*(byte *)(param_1 + 0x3c);
          iVar10 = *(int *)(uVar12 * 0x338 + DAT_005d4cdc + 0x314) + DAT_0052bf64;
        }
        if ((DAT_0052bf7c == uVar12) &&
           (*(char *)(DAT_0052bf7c * 0x338 + DAT_005d4cdc + 0x330) == '\0')) {
          DAT_005d4ce0 = DAT_005d4ce0 + 1;
        }
        else {
          DAT_005d4ce0 = 1;
          DAT_0052bf7c = uVar12;
        }
        uVar22 = FUN_00052f80();
        FUN_00057bd0(uVar22,0x3d4ccccd,0);
        if (((DAT_00556d0c & 1) == 0) && (iVar13 = ___cxa_guard_acquire(&DAT_00556d0c), iVar13 != 0)
           ) {
          DAT_00556d08 = FUN_002f69c4("first_fruit",0xb);
          ___cxa_guard_release(&DAT_00556d0c);
        }
        if (((DAT_00556d14 & 1) == 0) && (iVar13 = ___cxa_guard_acquire(&DAT_00556d14), iVar13 != 0)
           ) {
          DAT_00556d10 = FUN_002f69c4("last_fruit",10);
          ___cxa_guard_release(&DAT_00556d14);
        }
        iVar13 = FUN_00027508(*(undefined4 *)(puVar6 + 0x5c),DAT_00556d08);
        if (iVar13 < 1) {
          FUN_00027588(*(undefined4 *)(puVar6 + 0x5c),"first_fruit",DAT_00556d08,
                       *(byte *)(param_1 + 0x3c) + 1,0,0);
        }
        uVar22 = DAT_00556d10;
        uVar16 = *(undefined4 *)(puVar6 + 0x5c);
        bVar2 = *(byte *)(param_1 + 0x3c);
        iVar13 = FUN_00027508(uVar16,DAT_00556d10);
        FUN_00027588(uVar16,"last_fruit",uVar22,(bVar2 + 1) - iVar13,0,0);
        bVar2 = *(byte *)(param_1 + 0x3c);
        uVar12 = FUN_0000aae0("starfruit",0);
        if (bVar2 != uVar12) {
          FUN_0001cb08(iVar10,uVar11,1,0);
        }
        DAT_005d4cf0 = DAT_005d4cf0 + 1;
        for (puVar24 = DAT_005d4ce8; (undefined4 **)puVar24 != &DAT_005d4ce8;
            puVar24 = (undefined4 *)*puVar24) {
          piVar17 = puVar24 + 2;
          if ((puVar24[0xb] == 0) || (((int)puVar24[0xb] < DAT_005d4cf0 && (puVar24[0xc] == 1)))) {
            if (*(char *)(puVar24 + 10) != '\0') {
              piVar17 = (int *)*piVar17;
            }
            if (piVar17 != (int *)0x0) {
              (**(code **)(*piVar17 + 0xc))(piVar17,param_1,iVar10,param_2);
            }
          }
        }
        FUN_00014d20(&DAT_005d4ce8);
        *(int *)(param_1 + 0x1cc) = *(int *)(param_1 + 0x1cc) + 1;
        for (puVar24 = *(undefined4 **)(param_1 + 0x1c4); puVar24 != (undefined4 *)(param_1 + 0x1c4)
            ; puVar24 = (undefined4 *)*puVar24) {
          piVar17 = puVar24 + 2;
          if ((puVar24[0xb] == 0) ||
             (((int)puVar24[0xb] < *(int *)(param_1 + 0x1cc) && (puVar24[0xc] == 1)))) {
            if (*(char *)(puVar24 + 10) != '\0') {
              piVar17 = (int *)*piVar17;
            }
            if (piVar17 != (int *)0x0) {
              (**(code **)(*piVar17 + 0xc))(piVar17,param_1,iVar10,param_2);
            }
          }
        }
        FUN_00014d20((undefined4 *)(param_1 + 0x1c4));
        if (((DAT_00556d1c & 1) == 0) && (iVar10 = ___cxa_guard_acquire(&DAT_00556d1c), iVar10 != 0)
           ) {
          DAT_00556d18 = FUN_002f69c4("crit",4);
          ___cxa_guard_release(&DAT_00556d1c);
        }
        if (((DAT_00556d24 & 1) == 0) && (iVar10 = ___cxa_guard_acquire(&DAT_00556d24), iVar10 != 0)
           ) {
          DAT_00556d20 = FUN_002f69c4("crits_total",0xb);
          ___cxa_guard_release(&DAT_00556d24);
        }
        uVar11 = FUN_0000342c();
        if (puVar6[0x19] == '\0') {
          uVar22 = FUN_0001cd94(0);
          FUN_00003e1c(uVar11,uVar22);
        }
        FUN_00003fb4(uVar11,DAT_005d4ce0,
                     *(undefined4 *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x250)
                    );
        iVar10 = (uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc;
        FUN_00027588(*(undefined4 *)(puVar6 + 0x5c),iVar10,*(undefined4 *)(iVar10 + 0x250),1,0,1);
        iVar10 = (uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc;
        FUN_00027588(*(undefined4 *)(puVar6 + 0x5c),iVar10 + 0x140,*(undefined4 *)(iVar10 + 0x260),1
                     ,1,1);
        if (((DAT_00556d2c & 1) == 0) && (iVar10 = ___cxa_guard_acquire(&DAT_00556d2c), iVar10 != 0)
           ) {
          DAT_00556d28 = FUN_002f69c4("tomato",6);
          ___cxa_guard_release(&DAT_00556d2c);
        }
        if (DAT_00556d28 == *(int *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x250)
           ) {
          uVar22 = *(undefined4 *)(puVar6 + 0x5c);
          uVar11 = FUN_002f69c4("tomato_total_since_103",0x16);
          FUN_00027588(uVar22,"tomato_total_since_103",uVar11,1,1,1);
        }
        uVar22 = *(undefined4 *)(puVar6 + 0x5c);
        uVar11 = FUN_002f69c4("totalfruit",10);
        FUN_00027588(uVar22,"totalfruit",uVar11,1,0,0);
        if (*(char *)(param_1 + 0x1ba) != '\0') {
          FUN_00027588(*(undefined4 *)(puVar6 + 0x5c),"crit",DAT_00556d18,1,0,0);
          FUN_00027588(*(undefined4 *)(puVar6 + 0x5c),"crits_total",DAT_00556d20,1,1,0);
          if (iVar9 != 0) {
            *(int *)(iVar9 + 0x70) = *(int *)(iVar9 + 0x70) + 1;
          }
          FUN_002f702c(acStack_ac,0x80,"%scrit",
                       (uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc);
          sVar18 = _strlen(acStack_ac);
          uVar11 = FUN_002f69c4(acStack_ac,sVar18);
          FUN_00027588(*(undefined4 *)(puVar6 + 0x5c),acStack_ac,uVar11,1,0,1);
        }
        piVar17 = *(int **)puVar6;
        uVar20 = 0;
        if (piVar17 == (int *)0x0) goto LAB_00011caa;
        (**(code **)(*piVar17 + 0x40))(piVar17,param_1);
      }
    }
    else {
      uVar20 = 0;
      if (iVar9 == 0) goto LAB_00011caa;
      FUN_00060fac(iVar9,param_1);
    }
    uVar20 = 0;
  }
LAB_00011caa:
  if (*(int *)puVar5 != local_2c) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail(uVar20);
  }
  return;
}


```

## FUN_00057000 — 00057000

```c

int * FUN_00057000(int param_1,int param_2,int param_3,int param_4,int param_5)

{
  uint *puVar1;
  short sVar2;
  undefined *puVar3;
  undefined *puVar4;
  undefined *puVar5;
  undefined *puVar6;
  int iVar7;
  int *piVar8;
  int iVar9;
  undefined1 extraout_r1;
  undefined1 uVar10;
  undefined4 uVar11;
  int iVar12;
  uint uVar13;
  uint uVar14;
  undefined1 *puVar15;
  uint uVar16;
  int iVar17;
  uint uVar18;
  uint uVar19;
  undefined4 uVar20;
  undefined4 *puVar21;
  uint uVar22;
  uint uVar23;
  uint *puVar24;
  uint *puVar25;
  uint *puVar26;
  uint *puVar27;
  float fVar29;
  float fVar30;
  undefined8 in_d0;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined4 uVar31;
  undefined4 extraout_s1_02;
  undefined8 in_d1;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  undefined4 extraout_s3_01;
  undefined4 extraout_s3_02;
  undefined4 extraout_s3_03;
  uint extraout_s3_04;
  undefined4 extraout_s3_05;
  uint extraout_s3_06;
  uint extraout_s3_07;
  undefined4 uVar33;
  undefined4 extraout_s3_08;
  undefined4 extraout_s3_09;
  uint extraout_s3_10;
  longlong lVar32;
  float fVar34;
  undefined8 in_d2;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  undefined4 extraout_s5_01;
  undefined4 extraout_s5_02;
  ulonglong uVar35;
  undefined4 extraout_s5_03;
  undefined4 extraout_s5_04;
  undefined4 extraout_s5_05;
  undefined4 extraout_s5_06;
  undefined4 extraout_s5_07;
  undefined4 extraout_s5_08;
  undefined4 extraout_s5_09;
  float fVar36;
  undefined8 uVar37;
  undefined4 extraout_s7;
  undefined4 extraout_s7_00;
  undefined4 uVar38;
  undefined4 extraout_s7_01;
  undefined4 extraout_s7_02;
  undefined4 extraout_s7_03;
  undefined4 extraout_s9;
  undefined4 extraout_s9_00;
  undefined4 extraout_s9_01;
  undefined4 extraout_s9_02;
  undefined4 extraout_s9_03;
  undefined4 extraout_s9_04;
  undefined8 unaff_d8;
  undefined8 uVar39;
  undefined8 uVar40;
  undefined8 unaff_d10;
  undefined8 uVar41;
  undefined8 uVar42;
  undefined8 uVar43;
  undefined8 uVar44;
  undefined8 uVar45;
  undefined8 unaff_d14;
  undefined8 uVar46;
  undefined8 unaff_d15;
  undefined8 uVar47;
  undefined8 uVar48;
  undefined8 uVar49;
  undefined8 uVar50;
  undefined8 uVar51;
  undefined1 *local_84;
  undefined4 local_6c;
  undefined4 local_68;
  undefined4 local_64;
  uint *puVar28;
  
  puVar1 = DAT_005a7930;
  fVar30 = DAT_000573ec;
  if (param_2 < 1) {
    return (int *)0x0;
  }
  if (param_4 == 0) {
    uVar50 = 0x3f8000003f800000;
    uVar49 = 0xbf800000bf800000;
    uVar41 = 0;
LAB_0005705a:
    lVar32 = (ulonglong)*DAT_005a7930 * (ulonglong)DAT_005a7930[2];
    uVar13 = (uint)lVar32;
    uVar14 = DAT_005a7930[1] * DAT_005a7930[2] +
             *DAT_005a7930 * DAT_005a7930[3] + (int)((ulonglong)lVar32 >> 0x20) +
             DAT_005a7930[5] + (uint)CARRY4(uVar13,DAT_005a7930[4]);
    uVar11 = (undefined4)((ulonglong)uVar14 * 0x7ffff >> 0x20);
    *DAT_005a7930 = uVar13 + DAT_005a7930[4];
    puVar1[1] = uVar14;
    uVar37 = FixedToFP(CONCAT44(uVar11,uVar11),0,1,0,0x20);
    uVar48 = FloatVectorSub(uVar50,uVar49,2,0x20);
    uVar37 = FloatVectorMult(uVar48,CONCAT44((int)((ulonglong)in_d2 >> 0x20),(float)uVar37 / fVar30)
                             ,2,0x20);
    uVar49 = FloatVectorAdd(uVar49,uVar37,2);
    uVar50 = FloatVectorMult(uVar49,CONCAT44((int)((ulonglong)uVar50 >> 0x20),DAT_000573f0),2,0x20);
    uVar50 = FPToFixed(uVar50,0,1,3,0x20);
    local_84 = (undefined1 *)uVar50;
    if (param_4 != 0) goto LAB_000570c6;
    uVar11 = FUN_000251a8();
    uVar50 = FloatVectorMult(CONCAT44(uVar11,uVar11),0xbf000000bf000000,2,0x20);
    uVar50 = FPToFixed(uVar50,0,0,3,0x20);
    iVar17 = (int)uVar50;
    uVar11 = extraout_s9_02;
    uVar31 = extraout_s3_02;
    uVar33 = extraout_s5_02;
    uVar38 = extraout_s7_02;
  }
  else {
    local_84 = *(undefined1 **)(param_4 + 0x2c);
    uVar41 = CONCAT44((int)((ulonglong)unaff_d10 >> 0x20),*(undefined4 *)(param_4 + 0x80));
    if (local_84 == &LAB_0001869e_1) {
      uVar49 = CONCAT44((int)((ulonglong)in_d0 >> 0x20),*(undefined4 *)(param_4 + 0x50));
      uVar50 = CONCAT44((int)((ulonglong)in_d1 >> 0x20),*(undefined4 *)(param_4 + 0x54));
      goto LAB_0005705a;
    }
LAB_000570c6:
    puVar15 = *(undefined1 **)(param_4 + 0x30);
    uVar50 = FUN_000251a8();
    iVar12 = (int)((ulonglong)uVar50 >> 0x20);
    uVar50 = FloatVectorMult(CONCAT44((int)uVar50,(int)uVar50),0xbf000000bf000000,2,0x20);
    uVar50 = FPToFixed(uVar50,0,0,3,0x20);
    iVar17 = (int)uVar50;
    if (puVar15 != &LAB_0001869e_1) {
      iVar17 = iVar17 - *(int *)(param_4 + 0x30);
    }
    iVar7 = *(int *)(param_4 + 0x34);
    if (iVar7 != 0) {
      iVar12 = *(int *)(param_4 + 0x3c);
    }
    uVar11 = extraout_s9;
    uVar31 = extraout_s3;
    uVar33 = extraout_s5;
    uVar38 = extraout_s7;
    if (iVar7 != 0 && iVar12 != 0) {
      uVar49 = FUN_003010b8(iVar7 * 0xb6 & 0xffff);
      iVar12 = (int)((ulonglong)uVar49 >> 0x20);
      uVar50 = FixedToFP(CONCAT44(extraout_s1,*(undefined4 *)(param_4 + 0x3c)),0,0,0,0x20);
      uVar50 = FloatVectorMult(CONCAT44((int)uVar49,(int)uVar49),uVar50,2,0x20);
      uVar50 = FPToFixed(uVar50,0,0,3,0x20);
      iVar17 = iVar17 + (int)uVar50;
      uVar11 = extraout_s9_00;
      uVar31 = extraout_s3_00;
      uVar33 = extraout_s5_00;
      uVar38 = extraout_s7_00;
    }
    iVar7 = *(int *)(param_4 + 0x38);
    if (iVar7 != 0) {
      iVar12 = *(int *)(param_4 + 0x3c);
    }
    if (iVar7 != 0 && iVar12 != 0) {
      uVar11 = FUN_003010d0(iVar7 * 0xb6 & 0xffff);
      uVar50 = FixedToFP(CONCAT44(extraout_s1_00,*(undefined4 *)(param_4 + 0x3c)),0,0,0,0x20);
      uVar50 = FloatVectorMult(CONCAT44(uVar11,uVar11),uVar50,2,0x20);
      uVar50 = FPToFixed(uVar50,0,0,3,0x20);
      local_84 = local_84 + (int)uVar50;
      uVar11 = extraout_s9_01;
      uVar31 = extraout_s3_01;
      uVar33 = extraout_s5_01;
      uVar38 = extraout_s7_01;
    }
  }
  puVar1 = DAT_005a7930;
  fVar30 = DAT_000573ec;
  uVar14 = *DAT_005a7930;
  puVar25 = DAT_005a7930 + 1;
  uVar13 = DAT_005a7930[2];
  uVar16 = DAT_005a7930[3];
  uVar22 = DAT_005a7930[4];
  uVar23 = DAT_005a7930[5];
  lVar32 = (ulonglong)uVar14 * (ulonglong)uVar13;
  uVar18 = (uint)lVar32;
  uVar19 = uVar18 + uVar22;
  *DAT_005a7930 = uVar19;
  uVar14 = *puVar25 * uVar13 + uVar14 * uVar16 + (int)((ulonglong)lVar32 >> 0x20) +
           uVar23 + CARRY4(uVar18,uVar22);
  puVar1[1] = uVar14;
  uVar20 = (undefined4)((ulonglong)uVar14 * 0x7ffff >> 0x20);
  uVar50 = FixedToFP(CONCAT44(uVar20,uVar20),0,1,0,0x20);
  uVar49 = FloatVectorMult(CONCAT44(uVar33,(float)uVar50 / fVar30),0x3fc000003fc00000,2,0x20);
  uVar50 = 0x41a0000041a00000;
  uVar49 = FloatVectorAdd(uVar49,0x4118000041180000,2);
  if (param_4 != 0) {
    fVar29 = *(float *)(param_4 + 0x40);
    if (fVar29 != 0.0 || (fVar29 != 0.0 || *(float *)(param_4 + 0x44) != 0.0)) {
      uVar50 = FloatVectorMult(CONCAT44(0x41a00000,fVar29),
                               CONCAT44(uVar31,*(undefined4 *)(param_4 + 0x48)),2,0x20);
      uVar37 = FloatVectorMult(CONCAT44(uVar33,*(float *)(param_4 + 0x44)),
                               CONCAT44(uVar38,*(undefined4 *)(param_4 + 0x4c)),2,0x20);
      goto LAB_00057322;
    }
    puVar21 = &DAT_0005799c;
    if (1 < *(int *)(param_4 + 0x58)) {
      puVar21 = &DAT_000579a0;
    }
    uVar50 = CONCAT44(0x41a00000,*puVar21);
  }
  uVar18 = (uint)((ulonglong)uVar19 * (ulonglong)uVar13);
  uVar48 = FixedToFP(CONCAT44(local_84,local_84),0,0,0,0x20);
  fVar29 = (float)uVar48 / DAT_000573f0;
  uVar13 = uVar14 * uVar13 + uVar19 * uVar16 + (int)((ulonglong)uVar19 * (ulonglong)uVar13 >> 0x20)
           + uVar23 + CARRY4(uVar18,uVar22);
  uVar11 = (undefined4)((ulonglong)uVar13 * 0x7ffff >> 0x20);
  *puVar1 = uVar18 + uVar22;
  puVar1[1] = uVar13;
  puVar21 = &DAT_000579a4;
  uVar37 = FixedToFP(CONCAT44(uVar11,uVar11),0,1,0,0x20);
  uVar51 = FloatVectorMult(uVar50,0xbf000000bf000000,2,0x20);
  uVar37 = FloatVectorAdd(CONCAT44(uVar31,(float)uVar37 / fVar30),0xbf000000bf000000,2);
  uVar48 = FloatVectorMult(uVar51,CONCAT44((int)((ulonglong)uVar48 >> 0x20),fVar29),2,0x20);
  uVar35 = FPToFixed(uVar48,0,0,3,0x20);
  uVar48 = FloatVectorNeg(uVar37,2,2);
  uVar48 = FloatVectorSub(0x3f0000003f000000,uVar48,2,0x20);
  uVar48 = FloatVectorMult(uVar48,uVar48,2,0x20);
  uVar48 = FloatVectorMult(uVar48,0xc0000000c0000000,2,0x20);
  uVar51 = FloatVectorAdd(uVar48,0x3f0000003f000000,2);
  uVar48 = FixedToFP((uVar35 << 0x20) + (uVar35 & 0xffffffff),0,0,0,0x20);
  if ((int)((uint)((float)uVar37 < 0.0) << 0x1f) < 0) {
    puVar21 = &DAT_000579a8;
  }
  uVar37 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar37 >> 0x20),*puVar21),uVar51,2,0x20);
  uVar50 = FloatVectorMult(uVar50,uVar37,2,0x20);
  uVar50 = FloatVectorAdd(uVar48,uVar50,2);
  uVar50 = FPToFixed(uVar50,0,0,3,0x20);
  sVar2 = (short)uVar50 * 0xb6;
  uVar11 = FUN_003010b8(sVar2);
  unaff_d8 = 0x3f8000003f800000;
  uVar50 = FloatVectorMult(uVar49,CONCAT44(uVar11,uVar11),2,0x20);
  if (param_4 != 0) {
    unaff_d8 = CONCAT44(0x3f800000,*(undefined4 *)(param_4 + 0x48));
  }
  uVar11 = FUN_003010d0(sVar2);
  uVar37 = 0x3f8000003f800000;
  uVar48 = FloatVectorMult(uVar49,CONCAT44(uVar11,uVar11),2,0x20);
  if (param_4 != 0) {
    uVar37 = CONCAT44(0x3f800000,*(undefined4 *)(param_4 + 0x4c));
  }
  uVar50 = FloatVectorMult(uVar50,unaff_d8,2,0x20);
  uVar48 = FloatVectorMult(uVar48,CONCAT44(extraout_s3_03,DAT_000573f4),2,0x20);
  uVar37 = FloatVectorMult(uVar48,uVar37,2,0x20);
  uVar11 = extraout_s9_03;
LAB_00057322:
  puVar1 = DAT_005a7930;
  puVar3 = PTR_DAT_004d9048;
  uVar48 = 0x3f8000003f800000;
  if (param_4 != 0) {
    uVar48 = CONCAT44(0x3f800000,*(undefined4 *)(param_4 + 0x14));
  }
  if (param_3 == -1) {
    param_3 = -1;
    iVar12 = param_1 + param_5 * 4;
    uVar13 = *(uint *)(iVar12 + 0x204);
    if (0 < (int)uVar13) {
      if (*(int *)(PTR_DAT_004d9048 + 0x10) == 1) {
        while( true ) {
          puVar25 = DAT_005a7930;
          puVar24 = DAT_005a7930 + 3;
          uVar14 = *DAT_005a7930;
          puVar26 = DAT_005a7930 + 1;
          puVar1 = DAT_005a7930 + 2;
          puVar27 = DAT_005a7930 + 4;
          puVar28 = DAT_005a7930 + 5;
          lVar32 = (ulonglong)uVar14 * (ulonglong)*puVar1;
          uVar16 = (uint)lVar32;
          *DAT_005a7930 = uVar16 + *puVar27;
          uVar14 = *puVar26 * *puVar1 + uVar14 * *puVar24 + (int)((ulonglong)lVar32 >> 0x20) +
                   *puVar28 + (uint)CARRY4(uVar16,*puVar27);
          puVar25[1] = uVar14;
          if (uVar13 != 0 && uVar13 != 0xffffffff) {
            uVar14 = (uint)((ulonglong)uVar14 * (ulonglong)uVar13 >> 0x20);
          }
          param_3 = *(int *)(param_1 + param_5 * 0x80 + uVar14 * 4 + 0x180);
          FUN_0001d10c(puVar3);
          iVar7 = FUN_000617a8();
          uVar11 = extraout_s9_04;
          if (param_3 != iVar7) break;
          uVar13 = *(uint *)(iVar12 + 0x204);
        }
      }
      else {
        lVar32 = (ulonglong)*DAT_005a7930 * (ulonglong)DAT_005a7930[2];
        uVar14 = (uint)lVar32;
        uVar16 = DAT_005a7930[1] * DAT_005a7930[2] +
                 *DAT_005a7930 * DAT_005a7930[3] + (int)((ulonglong)lVar32 >> 0x20) +
                 DAT_005a7930[5] + (uint)CARRY4(uVar14,DAT_005a7930[4]);
        *DAT_005a7930 = uVar14 + DAT_005a7930[4];
        puVar1[1] = uVar16;
        param_3 = *(int *)(param_1 + param_5 * 0x80 +
                           (int)((ulonglong)uVar16 * (ulonglong)uVar13 >> 0x20) * 4 + 0x180);
      }
    }
  }
  puVar1 = DAT_005a7930;
  uVar42 = CONCAT44((int)((ulonglong)uVar41 >> 0x20),DAT_0052bf00);
  uVar47 = CONCAT44((int)((ulonglong)unaff_d15 >> 0x20),DAT_0052bf04);
  uVar46 = CONCAT44((int)((ulonglong)unaff_d14 >> 0x20),DAT_0052bf08);
  uVar44 = FloatVectorNeg(uVar47,2,2);
  uVar43 = FloatVectorNeg(uVar46,2,2);
  uVar45 = FloatVectorNeg(uVar42,2,2);
  uVar51 = CONCAT44(uVar11,DAT_0052bf80);
  uVar39 = CONCAT44((int)((ulonglong)unaff_d8 >> 0x20),DAT_0052bf84);
  uVar40 = uVar50;
  if (param_4 == 0) {
    iVar12 = 0;
  }
  else {
    iVar9 = 3;
    iVar7 = 2;
    iVar12 = *(int *)(param_4 + 0x58);
    switch(*(int *)(param_4 + 0x58)) {
    case 1:
      uVar39 = FloatVectorNeg(uVar39,2,2);
      uVar51 = FloatVectorNeg(uVar51,2,2);
      uVar37 = FloatVectorMult(uVar37,0x3f0000003f000000,2,0x20);
      iVar12 = 1;
      uVar45 = uVar42;
      uVar43 = uVar46;
      uVar44 = uVar47;
      break;
    case 4:
      puVar25 = DAT_005a7930 + 2;
      uVar13 = *DAT_005a7930;
      puVar24 = DAT_005a7930 + 1;
      puVar26 = DAT_005a7930 + 3;
      puVar27 = DAT_005a7930 + 4;
      puVar28 = DAT_005a7930 + 5;
      lVar32 = (ulonglong)uVar13 * (ulonglong)*puVar25;
      uVar14 = (uint)lVar32;
      *DAT_005a7930 = uVar14 + *puVar27;
      uVar13 = *puVar24 * *puVar25 + uVar13 * *puVar26 + (int)((ulonglong)lVar32 >> 0x20) +
               *puVar28 + (uint)CARRY4(uVar14,*puVar27);
      puVar1[1] = uVar13;
      iVar9 = 2;
      if ((int)uVar13 < 0) {
        iVar9 = 3;
      }
    case 3:
      uVar51 = 0x3f8000003f800000;
      uVar45 = CONCAT44((int)((ulonglong)uVar45 >> 0x20),DAT_0052c000);
      uVar44 = CONCAT44((int)((ulonglong)uVar44 >> 0x20),DAT_0052c004);
      uVar43 = CONCAT44((int)((ulonglong)uVar43 >> 0x20),DAT_0052c008);
      iVar7 = iVar9;
      uVar39 = uVar51;
    case 2:
      uVar42 = FixedToFP(CONCAT44(local_84,local_84),0,0,0,0x20);
      uVar11 = FUN_00025164();
      uVar40 = FixedToFP(CONCAT44(-iVar17,-iVar17),0,0,0,0x20);
      fVar30 = (float)FUN_000251a8();
      uVar46 = FloatVectorMult(uVar40,CONCAT44(uVar11,uVar11),2,0x20);
      uVar11 = FUN_000251a8();
      uVar40 = FloatVectorMult(uVar42,CONCAT44(uVar11,uVar11),2,0x20);
      fVar29 = (float)FUN_00025164();
      uVar40 = FPToFixed(CONCAT44(fVar29,(float)uVar40 / fVar29),0,0,3,0x20);
      uVar42 = FPToFixed(CONCAT44(extraout_s3_09,(float)uVar46 / fVar30),0,0,3,0x20);
      iVar17 = (int)uVar40;
      uVar11 = (undefined4)((ulonglong)uVar40 >> 0x20);
      local_84 = (undefined1 *)uVar42;
      uVar49 = FloatVectorMult(uVar49,CONCAT44(uVar11,*(undefined4 *)(param_4 + 0x24)),2,0x20);
      uVar49 = FloatVectorMult(uVar49,CONCAT44(uVar11,DAT_000579ac),2,0x20);
      uVar40 = FloatVectorMult(uVar37,0xbf400000bf400000,2,0x20);
      uVar37 = FloatVectorAdd(uVar50,uVar49,2);
      iVar12 = iVar7;
      if (iVar7 == 2) {
        uVar51 = 0xbf800000bf800000;
        uVar39 = 0x3f8000003f800000;
        uVar45 = FloatVectorNeg(CONCAT44((int)((ulonglong)uVar42 >> 0x20),DAT_0052c000),2,2);
        uVar44 = FloatVectorNeg(CONCAT44(extraout_s5_07,DAT_0052c004),2,2);
        uVar43 = FloatVectorNeg(CONCAT44(extraout_s7_03,DAT_0052c008),2,2);
        iVar12 = 2;
      }
    }
  }
  uVar50 = FPToFixed(uVar39,0,0,3,0x20);
  uVar37 = FloatVectorMult(uVar39,uVar37,2,0x20);
  uVar39 = FloatVectorMult(uVar51,uVar40,2,0x20);
  uVar49 = FPToFixed(uVar51,0,0,3,0x20);
  iVar17 = iVar17 * (int)uVar50;
  iVar7 = (int)local_84 * (int)uVar49;
  uVar11 = FUN_000065c4();
  piVar8 = (int *)FUN_0000698c(uVar11,1,1);
  uVar50 = FixedToFP(CONCAT44(iVar7,iVar7),0,0,0,0x20);
  uVar49 = FixedToFP(CONCAT44(iVar17,iVar17),0,0,0,0x20);
  local_6c = DAT_0052bf80;
  local_68 = DAT_0052bf84;
  local_64 = DAT_0052bf88;
  piVar8[4] = (int)uVar50;
  piVar8[5] = (int)uVar49;
  piVar8[6] = 0;
  piVar8[9] = 0;
  piVar8[7] = (int)uVar39;
  piVar8[8] = (int)uVar37;
  (**(code **)(*piVar8 + 8))((int)uVar50,piVar8,0,param_3,&local_6c);
  puVar3 = PTR_DAT_004d9048;
  iVar17 = FUN_0001d10c(PTR_DAT_004d9048);
  puVar4 = PTR_DAT_004d9094;
  puVar5 = PTR_DAT_004d907c;
  lVar32 = (ulonglong)extraout_s3_04 << 0x20;
  uVar11 = extraout_s5_03;
  if (iVar17 != 0) {
    iVar17 = FUN_00063fe0(PTR_DAT_004d907c,*(undefined4 *)PTR_DAT_004d9094);
    puVar21 = (undefined4 *)PTR_DAT_004d905c;
    if (iVar17 == 1) {
      iVar17 = FUN_00063e80(puVar5,*(undefined4 *)puVar4);
      fVar30 = *(float *)(iVar17 + 0x10);
      fVar29 = *(float *)(iVar17 + 0x14);
      lVar32 = CONCAT44(extraout_s3_05,fVar29);
      fVar34 = *(float *)(iVar17 + 0x18);
      *(int *)(iVar17 + 0x10) = piVar8[4];
      *(int *)(iVar17 + 0x14) = piVar8[5];
      *(int *)(iVar17 + 0x18) = piVar8[6];
      *(int *)(iVar17 + 0xc) = *(int *)(iVar17 + 0xc) + 1;
      if (((fVar30 == -1.0) && (fVar29 == -1.0)) && (fVar34 == -1.0)) {
        *(undefined4 *)(iVar17 + 8) = 0x16c0;
        uVar11 = extraout_s5_04;
      }
      else {
        uVar50 = FloatVectorSub(CONCAT44(extraout_s5_04,piVar8[4]),CONCAT44(extraout_s1_01,fVar30),2
                                ,0x20);
        uVar49 = FloatVectorSub(CONCAT44(0xbf800000,piVar8[5]),lVar32,2,0x20);
        uVar11 = FUN_0030113c((int)uVar49,(int)uVar50);
        lVar32 = (ulonglong)extraout_s3_06 << 0x20;
        *(undefined4 *)(iVar17 + 4) = uVar11;
        uVar11 = extraout_s5_05;
      }
    }
    else {
      iVar17 = FUN_00063fe0(puVar5,*(undefined4 *)PTR_DAT_004d905c);
      puVar4 = PTR_DAT_004d906c;
      if ((iVar17 == 1) ||
         (iVar17 = FUN_00063fe0(puVar5,*(undefined4 *)PTR_DAT_004d906c), puVar6 = PTR_DAT_004d90a0,
         puVar21 = (undefined4 *)puVar4, iVar17 == 1)) {
        iVar17 = FUN_00063e80(puVar5,*puVar21);
        lVar32 = (ulonglong)extraout_s3_07 << 0x20;
        *(undefined4 *)(iVar17 + 0x10) = *(undefined4 *)(piVar8[0xe] + 0x14);
        uVar11 = extraout_s5_06;
      }
      else {
        iVar17 = FUN_00063fe0(puVar5,*(undefined4 *)PTR_DAT_004d90a0);
        lVar32 = (ulonglong)extraout_s3_10 << 0x20;
        uVar11 = extraout_s5_08;
        if (iVar17 == 1) {
          iVar17 = FUN_00063e80(puVar5,*(undefined4 *)puVar6);
          uVar10 = extraout_r1;
          if (*(float *)(iVar17 + 0x10) == -1.0) {
            uVar10 = 1;
          }
          *(undefined1 *)((int)piVar8 + 0xc3) = uVar10;
          uVar50 = FloatVectorMult(0x4040000040400000,CONCAT44(0xbf800000,piVar8[10]),2,0x20);
          piVar8[10] = (int)uVar50;
          uVar50 = FloatVectorMult(0x4040000040400000,
                                   CONCAT44((int)((ulonglong)uVar50 >> 0x20),piVar8[0xb]),2,0x20);
          piVar8[0xb] = (int)uVar50;
          uVar50 = FloatVectorMult(0x4040000040400000,
                                   CONCAT44((int)((ulonglong)uVar50 >> 0x20),piVar8[0xc]),2,0x20);
          piVar8[0xc] = (int)uVar50;
          iVar7 = piVar8[0xe];
          if (iVar7 != 0) {
            uVar50 = CONCAT44((int)((ulonglong)uVar50 >> 0x20),*(undefined4 *)(iVar7 + 0x14));
          }
          lVar32 = FloatVectorMult(0x4040000040400000,uVar50,2,0x20);
          *(int *)(iVar7 + 0x14) = (int)lVar32;
          *(undefined4 *)(iVar17 + 0x10) = 0x40400000;
          uVar11 = extraout_s5_09;
        }
      }
    }
  }
  piVar8[0x35] = (int)uVar48;
  if (param_4 != 0) {
    fVar36 = (float)piVar8[0x38];
    uVar33 = (undefined4)((ulonglong)lVar32 >> 0x20);
    fVar34 = *(float *)(param_4 + 0x28);
    fVar30 = -(fVar36 * *(float *)(param_4 + 0x20));
    uVar48 = CONCAT44((int)((ulonglong)uVar48 >> 0x20),fVar30);
    fVar29 = -(fVar36 * *(float *)(param_4 + 0x24));
    lVar32 = CONCAT44(uVar33,fVar29);
    piVar8[0x37] = (int)fVar30;
    piVar8[0x38] = (int)fVar29;
    piVar8[0x39] = (int)-(fVar36 * fVar34);
    uVar31 = DAT_000579b0;
    if ((iVar12 == 3) || (uVar31 = DAT_000579b4, iVar12 == 2)) {
      lVar32 = CONCAT44(uVar33,uVar31);
      uVar48 = FloatVectorAdd(uVar48,lVar32,2);
      piVar8[0x37] = (int)uVar48;
    }
  }
  uVar49 = CONCAT44((int)((ulonglong)lVar32 >> 0x20),DAT_000579b8);
  uVar31 = (undefined4)((ulonglong)uVar48 >> 0x20);
  uVar50 = CONCAT44(uVar31,DAT_000579bc);
  uVar37 = FloatVectorMult(uVar45,uVar49,2,0x20);
  uVar48 = FloatVectorMult(uVar44,uVar49,2,0x20);
  uVar51 = FloatVectorMult(uVar37,uVar50,2,0x20);
  uVar37 = FloatVectorMult(uVar43,uVar49,2,0x20);
  uVar48 = FloatVectorMult(uVar48,uVar50,2,0x20);
  uVar49 = FloatVectorAdd(uVar51,CONCAT44(uVar11,piVar8[4]),2);
  uVar37 = FloatVectorMult(uVar37,uVar50,2,0x20);
  piVar8[4] = (int)uVar49;
  uVar50 = FloatVectorAdd(uVar48,CONCAT44((int)((ulonglong)uVar49 >> 0x20),piVar8[5]),2);
  piVar8[5] = (int)uVar50;
  uVar50 = FloatVectorAdd(uVar37,CONCAT44(uVar31,piVar8[6]),2);
  piVar8[6] = (int)uVar50;
  iVar17 = FUN_0001d10c((int)uVar50,puVar3);
  if (iVar17 != 0) {
    FUN_0001d10c(puVar3);
    puVar4 = PTR_DAT_004d9094;
    puVar5 = PTR_DAT_004d907c;
    iVar17 = FUN_00063fe0(PTR_DAT_004d907c,*(undefined4 *)PTR_DAT_004d9094);
    if (iVar17 == 1) {
      FUN_0001d10c(puVar3);
      iVar17 = FUN_00063e80(puVar5,*(undefined4 *)puVar4);
      if (2 < *(int *)(iVar17 + 0xc)) {
        uVar50 = CONCAT44(extraout_s1_02,DAT_000579c0);
        uVar49 = FloatVectorMult(CONCAT44(extraout_s3_08,piVar8[10]),uVar50,2,0x20);
        piVar8[10] = (int)uVar49;
        uVar49 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar49 >> 0x20),piVar8[0xb]),uVar50,2,
                                 0x20);
        piVar8[0xb] = (int)uVar49;
        uVar50 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar49 >> 0x20),piVar8[0xc]),uVar50,2,
                                 0x20);
        piVar8[0xc] = (int)uVar50;
        FUN_0000c0b4((int)uVar50,piVar8,0);
      }
    }
  }
  if (-10.0 < (float)uVar41) {
    uVar50 = FloatVectorMax(0,uVar41,2,0x20);
    uVar50 = FloatVectorAdd(uVar50,CONCAT44(0xc1200000,DAT_000579c4),2);
    FUN_0000f274(piVar8,(int)uVar50);
  }
  iVar17 = FUN_0001cd6c();
  if (iVar17 == 1) {
    FUN_0000a654(piVar8,0,0);
    FUN_0000c080(piVar8,param_5);
  }
  return piVar8;
}


```

## FUN_00003e98 — 00003e98

```c

undefined4 FUN_00003e98(int param_1,int param_2)

{
  undefined *puVar1;
  int iVar2;
  undefined4 uVar3;
  uint uVar4;
  _Rb_tree_node_base *p_Var5;
  uint uVar6;
  _Rb_tree_node_base *local_24;
  
  puVar1 = PTR_DAT_004d9048;
  iVar2 = FUN_0001d10c(PTR_DAT_004d9048);
  if (iVar2 != 0) {
    FUN_0001d10c(puVar1);
    FUN_0005ee30(PTR_DAT_004d9024);
  }
  local_24 = *(_Rb_tree_node_base **)(param_1 + 0x3c);
  uVar3 = 0;
  do {
    if (local_24 == (_Rb_tree_node_base *)(param_1 + 0x34)) {
      return uVar3;
    }
    while (((p_Var5 = local_24, param_2 < *(int *)(*(int *)(local_24 + 0x14) + 0x8c) ||
            (uVar6 = *(uint *)(*(int *)(local_24 + 0x14) + 0x9c),
            uVar4 = FUN_000254c0(*(undefined4 *)(puVar1 + 0x10)), (uVar4 & uVar6) == 0)) ||
           (iVar2 = FUN_00003d6c(param_1,*(undefined4 *)(p_Var5 + 0x14),&local_24),
           p_Var5 = local_24, iVar2 == 0))) {
      local_24 = (_Rb_tree_node_base *)std::_Rb_tree_increment(p_Var5);
      if (local_24 == (_Rb_tree_node_base *)(param_1 + 0x34)) {
        return uVar3;
      }
    }
    uVar3 = 1;
  } while( true );
}


```

## FUN_0001f018 — 0001f018

```c

void FUN_0001f018(undefined4 param_1,int param_2)

{
  bool bVar1;
  char cVar2;
  char cVar3;
  undefined *puVar4;
  undefined *puVar5;
  char *pcVar6;
  int *piVar7;
  float fVar8;
  undefined4 uVar9;
  undefined ***pppuVar10;
  int iVar11;
  undefined4 *puVar12;
  float *pfVar13;
  undefined4 uVar14;
  float extraout_s0;
  undefined4 extraout_s0_00;
  undefined4 extraout_s0_01;
  undefined4 extraout_s0_02;
  longlong in_d0;
  uint extraout_s1;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined4 extraout_s1_03;
  undefined4 extraout_s3;
  uint extraout_s3_00;
  uint extraout_s3_01;
  uint uVar16;
  longlong lVar15;
  undefined4 extraout_s3_02;
  undefined4 extraout_s3_03;
  undefined8 uVar17;
  undefined4 extraout_s5;
  undefined4 extraout_s7;
  undefined8 uVar18;
  undefined8 uVar19;
  float fVar20;
  undefined8 unaff_d10;
  undefined8 uVar21;
  undefined **local_8c;
  undefined *local_88;
  undefined1 local_6c;
  undefined **local_68;
  undefined *local_64;
  undefined1 local_48;
  int local_44;
  
  puVar4 = PTR____stack_chk_guard_004d9044;
  uVar19 = CONCAT44(param_1,param_1);
  local_44 = *(int *)PTR____stack_chk_guard_004d9044;
  if (DAT_005577d8 != 0) {
    FUN_0003e9e8(*(undefined4 *)(PTR_DAT_004d9048 + 0x4c),DAT_005577d8,0);
    in_d0 = (ulonglong)extraout_s1 << 0x20;
    DAT_005577d8 = 0;
  }
  if (DAT_005f9408 != '\0') {
    in_d0 = FloatVectorSub(CONCAT44((int)((ulonglong)in_d0 >> 0x20),DAT_005f940c),uVar19,2,0x20);
    DAT_005f940c = (float)in_d0;
    DAT_005f9408 = 0.0 < DAT_005f940c;
  }
  fVar20 = DAT_005577e4;
  if (0.0 < DAT_005577e4) {
    uVar17 = FloatVectorSub(CONCAT44((int)((ulonglong)in_d0 >> 0x20),DAT_005577e4),uVar19,2,0x20);
    fVar20 = (float)uVar17;
    if (fVar20 <= DAT_0001f464) {
      bVar1 = DAT_0001f464 < DAT_005577e4;
      DAT_005577e4 = fVar20;
      if (bVar1) {
        switch(DAT_0052c274) {
        case 10:
          pcVar6 = 
          "http://phobos.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=395627741&mt=8";
          break;
        case 0xb:
          pcVar6 = 
          "http://phobos.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=370070561&mt=8";
          break;
        case 0xc:
          iVar11 = FUN_003297f0("twitter://user?screen_name=halfbrick");
          if (iVar11 != 0) goto LAB_0001f152;
          pcVar6 = "http://www.twitter.com/halfbrick";
          break;
        case 0xd:
          iVar11 = FUN_003297f0("fb://profile/61597338747");
          if (iVar11 != 0) goto LAB_0001f152;
          pcVar6 = "http://www.facebook.com/halfbrick";
          break;
        default:
          pcVar6 = 
          "http://phobos.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=362949845&mt=8";
        }
        FUN_003297f0(pcVar6);
      }
LAB_0001f152:
      uVar19 = 0;
      *(undefined4 *)(PTR_DAT_004d9048 + 0x44) = 0;
      fVar20 = DAT_005577e4;
    }
  }
  DAT_005577e4 = fVar20;
  puVar5 = PTR_DAT_004d9048;
  iVar11 = 0xd4;
  PTR_DAT_004d9048[0xa9] = 0;
  puVar5[0xa8] = 0;
  do {
    pfVar13 = (float *)(puVar5 + iVar11);
    if (*pfVar13 == 0.0) {
      *pfVar13 = -1.0;
    }
    else {
      *pfVar13 = 0.0;
    }
    iVar11 = iVar11 + 0xc;
  } while (iVar11 != 0x194);
  if (((DAT_00537b20 & 1) == 0) && (iVar11 = ___cxa_guard_acquire(&DAT_00537b20), iVar11 != 0)) {
    FUN_002fa6fc(&DAT_00537af0);
    ___cxa_atexit(PTR_FUN_004d90c4,&DAT_00537af0,PTR___mh_execute_header_004d9040);
    ___cxa_guard_release(&DAT_00537b20);
  }
  uVar9 = (undefined4)uVar19;
  FUN_002fb388(&DAT_00537af0,uVar9);
  uVar14 = *(undefined4 *)(puVar5 + 0xb4);
  uVar18 = FloatVectorSub(CONCAT44(extraout_s1_00,uVar14),
                          CONCAT44(extraout_s7,*(undefined4 *)(puVar5 + 0xac)),2,0x20);
  uVar17 = FloatVectorSub(CONCAT44(extraout_s3,*(undefined4 *)(puVar5 + 0xb8)),
                          CONCAT44(extraout_s5,*(undefined4 *)(puVar5 + 0xb0)),2,0x20);
  *(int *)(puVar5 + 0xc4) = (int)uVar18;
  *(int *)(puVar5 + 200) = (int)uVar17;
  *(undefined4 *)(puVar5 + 0xac) = uVar14;
  *(undefined4 *)(puVar5 + 0xb0) = *(undefined4 *)(puVar5 + 0xb8);
  iVar11 = FUN_00025db0(uVar14);
  uVar14 = extraout_s1_01;
  uVar16 = extraout_s3_00;
  if (iVar11 == 1) {
    uVar14 = FUN_0030a1d8();
    FUN_0030a7f4(uVar14,uVar9);
    FUN_0002ba24(*(undefined4 *)(puVar5 + 0x1a4));
    if (*(int *)(puVar5 + 0x1a8) != 0) {
      FUN_00072338(*(int *)(puVar5 + 0x1a8),uVar9);
    }
    uVar14 = FUN_0007505c();
    FUN_00075098(uVar14,uVar9);
    uVar14 = FUN_0002ede8();
    FUN_000306e8(uVar14,uVar9);
    if (((puVar5[0x55] != '\0') && ((int)((uint)(*(float *)(puVar5 + 0x20) < 0.0) << 0x1f) < 0)) &&
       (((DAT_005577ac ^ 1) & 1) != 0)) {
      FUN_0004f14c();
      uVar14 = FUN_0007505c();
      FUN_00075184(uVar14,"Music-menu");
      DAT_005577ac = 1;
    }
    FUN_0001cf1c(uVar9);
    uVar14 = extraout_s1_02;
    uVar16 = extraout_s3_01;
  }
  lVar15 = (ulonglong)uVar16 << 0x20;
  if (param_2 == 1) {
    uVar17 = 0x3f8000003f800000;
    *(undefined1 *)(*(int *)(puVar5 + 0x5c) + 0x31) = 0;
    uVar18 = FloatVectorSub(CONCAT44(uVar14,*(undefined4 *)(puVar5 + 0x3c)),uVar19,2,0x20);
    *(int *)(puVar5 + 0x3c) = (int)uVar18;
    uVar18 = CONCAT44((int)((ulonglong)uVar18 >> 0x20),DAT_005577e8);
    if (0.0 < DAT_005577e8) {
      uVar17 = FloatVectorMult(uVar19,CONCAT44(uVar16,DAT_0052c27c),2,0x20);
      lVar15 = CONCAT44(uVar16,DAT_0052c278);
      uVar18 = FloatVectorSub(uVar18,uVar17,2,0x20);
      uVar17 = FloatVectorAdd(lVar15,0xbf800000bf800000,2);
      DAT_005577e8 = (float)uVar18;
      uVar17 = FloatVectorMult(uVar17,uVar18,2,0x20);
      uVar17 = FloatVectorAdd(uVar17,0x3f8000003f800000,2);
    }
    puVar12 = &DAT_0001f88c;
    if (puVar5[0x1b] != '\0') {
      puVar12 = &DAT_0001f890;
    }
    uVar21 = FloatVectorMult(uVar19,CONCAT44((int)((ulonglong)uVar18 >> 0x20),*puVar12),2,0x20);
    uVar18 = 0x3f8000003f800000;
    uVar21 = FloatVectorSub(CONCAT44((int)((ulonglong)lVar15 >> 0x20),DAT_0052c280),uVar21,2,0x20);
    if (1.0 < (float)uVar21) {
      uVar18 = CONCAT44(0x3f800000,(float)uVar21);
    }
    uVar21 = FloatVectorMult(uVar17,uVar18,2,0x20);
    DAT_0052c280 = (undefined4)uVar18;
    uVar17 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar18 >> 0x20),
                                      *(undefined4 *)(puVar5 + 0x44)),uVar21,2,0x20);
    *(int *)(puVar5 + 0x44) = (int)uVar17;
    puVar5[0x1b] = 0;
    FUN_000161c4((int)uVar17,uVar9);
    FUN_0001b384(uVar9);
    uVar19 = FloatVectorMult(uVar19,uVar21,2,0x20);
    fVar20 = *(float *)(puVar5 + 0x24);
    uVar14 = (undefined4)uVar19;
    if (fVar20 <= 0.0) {
      *(undefined1 *)(*(int *)(puVar5 + 0x5c) + 0x31) = 1;
      uVar9 = FUN_00052f80();
      FUN_000559e4(uVar9,uVar14);
      uVar9 = FUN_00052f80();
      uVar9 = FUN_000558f0(uVar9,0);
      unaff_d10 = FloatVectorMult(uVar19,CONCAT44(uVar9,uVar9),2,0x20);
      uVar17 = uVar19;
    }
    else {
      uVar17 = FloatVectorSub(CONCAT44((int)((ulonglong)unaff_d10 >> 0x20),fVar20),uVar19,2,0x20);
      if (DAT_005577b0 == '\0') {
        puVar5[0x1b] = 1;
      }
      *(int *)(puVar5 + 0x24) = (int)uVar17;
      if (*(int *)(puVar5 + 0x10) == 1) {
        uVar17 = FloatVectorSub(uVar17,uVar19,2,0x20);
        *(int *)(puVar5 + 0x24) = (int)uVar17;
      }
      fVar8 = (float)uVar17;
      if (fVar8 <= DAT_0001f468) {
        FUN_0001f8a0(fVar20);
        uVar17 = FloatVectorAdd(uVar19,uVar19,2);
        fVar8 = *(float *)(puVar5 + 0x24);
      }
      else {
        uVar17 = FloatVectorNeg(uVar19,2,2);
      }
      if ((fVar8 <= 1.5) && (1.5 < fVar20)) {
        cVar2 = puVar5[0x17];
        cVar3 = cVar2;
        if (cVar2 == '\0') {
          cVar3 = DAT_005577b0;
        }
        if ((cVar2 == '\0' && cVar3 == '\0') && (iVar11 = FUN_0001ccec(puVar5), iVar11 != 0)) {
          FUN_0001ccec(puVar5);
          FUN_000708b8();
        }
      }
      unaff_d10 = 0;
      *(undefined4 *)(puVar5 + 0x24) = 0;
    }
    piVar7 = *(int **)puVar5;
    if (piVar7 != (int *)0x0) {
      (**(code **)(*piVar7 + 0x14))(piVar7,uVar14);
    }
    if ((float)unaff_d10 == 0.0 && (int)((uint)(*(float *)(puVar5 + 0x20) < 0.0) << 0x1f) < 0) {
      unaff_d10 = CONCAT44((int)((ulonglong)unaff_d10 >> 0x20),uVar14);
    }
    FUN_00008e54((int)unaff_d10);
    uVar14 = FUN_000065c4();
    FUN_00006788(uVar14,(int)unaff_d10,0,0);
    iVar11 = FUN_0001cd68();
    if (iVar11 == 1) {
      FUN_0000fc14();
    }
  }
  else {
    iVar11 = 0;
    puVar5[0x1b] = 0;
    if (puVar5[10] != '\0') {
      *(undefined1 *)(*(int *)(puVar5 + 0x5c) + 0x31) = 1;
    }
    FUN_000161c4(0);
    do {
      piVar7 = (int *)(&DAT_0055781c)[iVar11];
      if (piVar7 != (int *)0x0) {
        (**(code **)(*piVar7 + 0x10))(piVar7,uVar9);
        (**(code **)(*(int *)(&DAT_0055781c)[iVar11] + 0x18))((int *)(&DAT_0055781c)[iVar11],uVar9);
      }
      iVar11 = iVar11 + 1;
    } while (iVar11 != 0x10);
    uVar14 = FUN_00052f80();
    FUN_000559e4(uVar14,0);
    uVar17 = uVar19;
  }
  DAT_0052c284 = 1.0;
  uVar14 = FUN_00052f80();
  fVar8 = (float)FUN_000558f0(uVar14,0);
  fVar20 = extraout_s0;
  if (puVar5[10] == '\0') {
    fVar20 = fVar8;
    if (fVar8 == 0.0) {
      fVar20 = 1.0;
    }
    uVar18 = FloatVectorMax(0x3f8000003f800000,CONCAT44(fVar8,1.0 / fVar20),2,0x20);
    fVar20 = (float)uVar18;
    DAT_0052c284 = fVar20;
  }
  uVar14 = FUN_00033ca0(fVar20);
  fVar8 = (float)uVar19;
  FUN_000349b8(uVar14,fVar8 / DAT_0052c284,puVar5[10] != '\0');
  uVar14 = (**(code **)(**(int **)(puVar5 + 0x58) + 0x1c))(*(int **)(puVar5 + 0x58),(int)uVar17);
  fVar20 = DAT_0001f894;
  if (puVar5[0x1b] == '\0') {
    uVar14 = *(undefined4 *)(puVar5 + 0x4c);
LAB_0001f5f8:
    uVar14 = FUN_0003e870(uVar14,fVar8);
  }
  else {
    if (fVar8 == 0.0) {
      uVar14 = *(undefined4 *)(puVar5 + 0x4c);
      fVar8 = 0.0;
      goto LAB_0001f5f8;
    }
    if (!NAN(fVar8)) {
      unaff_d10 = CONCAT44((int)((ulonglong)unaff_d10 >> 0x20),DAT_0001f898);
      uVar17 = uVar19;
      do {
        fVar8 = fVar20;
        if (fVar20 < (float)uVar17) {
          fVar8 = (float)uVar17;
        }
        uVar14 = FUN_0003e870(*(undefined4 *)(puVar5 + 0x4c),fVar8);
        uVar17 = FloatVectorAdd(uVar17,unaff_d10,2);
      } while (0.0 < (float)uVar17);
    }
  }
  if (puVar5[0x1b] != '\0') {
    uVar18 = CONCAT44((int)((ulonglong)unaff_d10 >> 0x20),DAT_0052c280);
    uVar17 = 0x3f8000003f800000;
    iVar11 = FUN_0001f904();
    if (iVar11 != 0) {
      uVar17 = 0x3f80000000000000;
    }
    uVar17 = FloatVectorMult(uVar18,uVar17,2,0x20);
    uVar17 = FloatVectorMin(0x40a0000040a00000,uVar17,2,0x20);
    uVar14 = (undefined4)uVar17;
    DAT_0052c280 = uVar14;
  }
  FUN_003527fc(uVar14);
  uVar14 = FUN_00352918();
  if (((puVar5[0x17] != '\0') ||
      (fVar20 = (float)FUN_00009560(), uVar14 = extraout_s0_00, fVar20 <= 0.0)) ||
     (puVar5[10] != '\0')) {
LAB_0001f674:
    if (DAT_005577ec == 0) goto LAB_0001f680;
    uVar14 = 0;
  }
  else {
    iVar11 = FUN_0001d10c(puVar5);
    if (iVar11 != 0) {
      FUN_0001d10c(puVar5);
      iVar11 = FUN_000617e8();
      uVar14 = extraout_s0_01;
      if (iVar11 != 0) goto LAB_0001f674;
    }
    if (DAT_005577ec == 0) {
      pppuVar10 = &local_68;
      local_48 = 1;
      local_68 = (undefined **)0x0;
      uVar14 = *(undefined4 *)(puVar5 + 0x1a4);
      FUN_0000a298(pppuVar10);
      local_48 = 0;
      local_68 = &PTR_LAB_0052bf38;
      local_64 = PTR_FUN_004d9058;
      DAT_005577ec = FUN_0002bc94(uVar14,"Bomb-Fuse",0,0,pppuVar10,0);
LAB_0001f842:
      uVar14 = FUN_0000a298(pppuVar10);
      uVar9 = extraout_s3_03;
    }
    else {
      iVar11 = FUN_00309b54();
      uVar14 = extraout_s0_02;
      uVar9 = extraout_s3_02;
      if (iVar11 == 0) {
        FUN_0002be70(*(undefined4 *)(puVar5 + 0x1a4),DAT_005577ec,"Bomb-Fuse");
        pppuVar10 = &local_8c;
        local_6c = 1;
        local_8c = (undefined **)0x0;
        uVar14 = *(undefined4 *)(puVar5 + 0x1a4);
        FUN_0000a298(pppuVar10);
        local_6c = 0;
        local_8c = &PTR_LAB_0052bf38;
        local_88 = PTR_FUN_004d9058;
        DAT_005577ec = FUN_0002bc94(uVar14,"Bomb-Fuse",0,0,pppuVar10,0);
        goto LAB_0001f842;
      }
    }
    if (DAT_005577ec == 0) goto LAB_0001f680;
    uVar17 = 0;
    if (0.0 < fVar20 / DAT_0001f89c) {
      uVar17 = CONCAT44(uVar9,fVar20 / DAT_0001f89c);
    }
    uVar17 = FloatVectorMult(uVar17,CONCAT44(uVar9,**(undefined4 **)(puVar5 + 0x1a4)),2,0x20);
    uVar14 = (undefined4)uVar17;
  }
  uVar14 = FUN_00309b38(DAT_005577ec,uVar14);
LAB_0001f680:
  if (puVar5[0x18] != '\0') {
    if (*(float *)(puVar5 + 0x1c) <= 0.0) {
      uVar14 = FUN_0001f964();
      *(undefined4 *)(puVar5 + 0x1c) = 0;
    }
    else {
      FUN_0001f9dc();
      uVar17 = FloatVectorSub(CONCAT44(extraout_s1_03,*(undefined4 *)(puVar5 + 0x1c)),uVar19,2,0x20)
      ;
      uVar14 = (undefined4)uVar17;
      *(undefined4 *)(puVar5 + 0x1c) = uVar14;
    }
  }
  uVar14 = FUN_003ecb20(uVar14);
  FUN_003f09d0(uVar14,0xffffffff);
  if (puVar5[10] != '\0') {
    uVar14 = FUN_003ecb20();
    FUN_003f09d0(uVar14,2);
  }
  uVar14 = FUN_003ecb20();
  iVar11 = FUN_0001d10c(puVar5);
  uVar17 = 0x3f8000003f800000;
  if ((iVar11 != 0) && (puVar5[0x17] == '\0')) {
    piVar7 = (int *)FUN_0001d10c(puVar5);
    uVar9 = (**(code **)(*piVar7 + 0x30))();
    uVar17 = CONCAT44(uVar9,uVar9);
  }
  uVar19 = FloatVectorMult(uVar19,uVar17,2,0x20);
  FUN_003ef458(uVar14,(int)uVar19);
  if (*(int *)puVar4 == local_44) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

## FUN_00056098 — 00056098

```c

/* WARNING: Type propagation algorithm not settling */

void FUN_00056098(char *param_1,undefined4 param_2,int param_3)

{
  uint *puVar1;
  uint *puVar2;
  longlong lVar3;
  int *piVar4;
  float fVar5;
  undefined *puVar6;
  uint *puVar7;
  int iVar8;
  int *piVar9;
  undefined4 uVar10;
  int iVar11;
  uint uVar12;
  uint uVar13;
  _List_node_base *p_Var14;
  uint uVar15;
  uint uVar16;
  uint uVar17;
  uint uVar18;
  int *piVar19;
  uint uVar20;
  undefined4 uVar21;
  float *pfVar22;
  uint uVar23;
  int iVar24;
  int iVar25;
  undefined4 *puVar26;
  int iVar27;
  bool bVar28;
  uint extraout_s0;
  uint extraout_s0_00;
  uint extraout_s0_01;
  uint uVar29;
  uint extraout_s1;
  undefined8 uVar30;
  longlong lVar31;
  undefined4 extraout_s1_00;
  ulonglong uVar32;
  uint extraout_s1_01;
  uint extraout_s1_02;
  uint extraout_s1_03;
  undefined4 uVar33;
  undefined4 extraout_s1_04;
  undefined4 extraout_s1_05;
  undefined4 extraout_s1_06;
  undefined4 extraout_s1_07;
  uint extraout_s3;
  uint extraout_s3_00;
  uint extraout_s3_01;
  longlong lVar34;
  undefined4 extraout_s3_02;
  undefined4 extraout_s3_03;
  undefined4 extraout_s3_04;
  undefined4 extraout_s3_05;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  undefined4 extraout_s5_01;
  undefined4 extraout_s5_02;
  undefined4 extraout_s5_03;
  undefined4 extraout_s5_04;
  undefined4 extraout_s5_05;
  undefined4 extraout_s5_06;
  undefined8 uVar35;
  undefined8 uVar36;
  undefined8 uVar37;
  int local_f8;
  undefined *local_e0;
  int local_dc;
  undefined *local_d8;
  undefined4 uStack_d4;
  undefined1 local_c0;
  undefined *local_bc;
  int local_b8;
  undefined *local_b4;
  undefined4 uStack_b0;
  undefined1 local_9c;
  undefined *local_98;
  int local_94;
  undefined *local_90;
  undefined4 uStack_8c;
  undefined1 local_78;
  int local_74 [9];
  undefined1 local_50;
  undefined4 local_4c;
  undefined4 local_48;
  int local_44;
  
  local_44 = *(int *)PTR____stack_chk_guard_004d9044;
  param_1[0x17b] = '\0';
  if (*param_1 == '\0') {
    uVar35 = CONCAT44(param_2,param_2);
    FUN_000557ac(param_1,param_2);
    lVar31 = (ulonglong)extraout_s1 << 0x20;
    if (PTR_DAT_004d9048[0xab] != '\0') {
      uVar30 = FloatVectorAdd(CONCAT44(extraout_s1,*(undefined4 *)(param_1 + 0x40)),uVar35,2);
      *(int *)(param_1 + 0x40) = (int)uVar30;
      lVar31 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar30 >> 0x20),
                                       *(undefined4 *)(param_1 + 0x44)),uVar35,2);
      *(int *)(param_1 + 0x44) = (int)lVar31;
    }
    pfVar22 = (float *)(param_1 + param_3 * 4 + 0x170);
    uVar32 = CONCAT44((int)((ulonglong)lVar31 >> 0x20),*(float *)(param_1 + param_3 * 4 + 0x170));
    if (*(float *)(param_1 + param_3 * 4 + 0x170) <= 0.0) {
      *pfVar22 = 0.0;
      iVar8 = *(int *)(param_1 + param_3 * 4 + 0x168);
      if ((iVar8 == 0) || (*(int *)(iVar8 + 0xb8) < *(int *)(iVar8 + 0xbc))) {
        param_1[0x17b] = '\0';
      }
      else {
        uVar29 = *(uint *)(iVar8 + 0x4c);
        if (0 < (int)uVar29) {
          uVar15 = 0;
          uVar10 = extraout_s5;
          do {
            iVar25 = *(int *)(iVar8 + 0x48);
            iVar11 = iVar25 + uVar15 * 0x90;
            if (*(int *)(iVar11 + 0x18) < 2) {
              uVar30 = 0x3f8000003f800000;
              if (1.0 < *(float *)(param_1 + 0x78)) {
                uVar30 = CONCAT44(0x3f800000,*(float *)(param_1 + 0x78));
              }
              uVar16 = *(uint *)(iVar11 + 0x1c);
              uVar36 = FloatVectorMult(uVar30,uVar35,2,0x20);
              if (0x7fffffff < uVar16) {
                uVar16 = uVar15;
              }
              iVar11 = iVar25 + uVar16 * 0x90;
              uVar32 = FloatVectorSub(CONCAT44((int)(uVar32 >> 0x20),*(undefined4 *)(iVar11 + 0x80))
                                      ,uVar36,2,0x20);
              *(int *)(iVar11 + 0x80) = (int)uVar32;
              puVar1 = (uint *)(iVar11 + 0x74);
              uVar17 = *puVar1;
              if (0 < (int)uVar17) {
                puVar26 = (undefined4 *)(iVar11 + 0x80);
                piVar19 = (int *)(iVar25 + uVar16 * 0x90);
                piVar9 = piVar19 + 0x22;
                local_f8 = 0;
                while( true ) {
                  puVar2 = DAT_005a7930;
                  uVar21 = (undefined4)((ulonglong)uVar30 >> 0x20);
                  uVar12 = piVar19[4];
                  if ((int)uVar12 < 1) {
                    uVar36 = 0;
                    uVar12 = 0;
                    *puVar26 = 0;
                  }
                  else {
                    lVar31 = (ulonglong)*DAT_005a7930 * (ulonglong)DAT_005a7930[2];
                    uVar23 = (uint)lVar31;
                    uVar20 = DAT_005a7930[1] * DAT_005a7930[2] +
                             *DAT_005a7930 * DAT_005a7930[3] + (int)((ulonglong)lVar31 >> 0x20) +
                             DAT_005a7930[5] + (uint)CARRY4(uVar23,DAT_005a7930[4]);
                    *DAT_005a7930 = uVar23 + DAT_005a7930[4];
                    puVar2[1] = uVar20;
                    uVar12 = (uint)((ulonglong)uVar20 * (ulonglong)uVar12 >> 0x20);
                    local_74[0] = *(int *)(*piVar19 + uVar12 * 4);
                    iVar24 = *piVar9;
                    iVar27 = piVar19[0x21];
                    iVar11 = FUN_0001d10c(PTR_DAT_004d9048);
                    puVar2 = DAT_005a7930;
                    lVar34 = (ulonglong)extraout_s3 << 0x20;
                    lVar31 = (ulonglong)extraout_s1_01 << 0x20;
                    uVar10 = extraout_s5_00;
                    if ((iVar11 != 0) && (uVar20 = iVar27 - iVar24, 0 < (int)uVar20)) {
                      lVar3 = (ulonglong)*DAT_005a7930 * (ulonglong)DAT_005a7930[2];
                      uVar13 = (uint)lVar3;
                      uVar18 = *puVar1;
                      uVar23 = DAT_005a7930[1] * DAT_005a7930[2] +
                               *DAT_005a7930 * DAT_005a7930[3] + (int)((ulonglong)lVar3 >> 0x20) +
                               DAT_005a7930[5] + (uint)CARRY4(uVar13,DAT_005a7930[4]);
                      *DAT_005a7930 = uVar13 + DAT_005a7930[4];
                      puVar2[1] = uVar23;
                      if (uVar18 != 0 && uVar18 != 0xffffffff) {
                        uVar23 = (uint)((ulonglong)uVar23 * (ulonglong)uVar18 >> 0x20);
                      }
                      iVar11 = uVar23 - uVar20;
                      if ((int)uVar20 < (int)uVar23) {
                        iVar11 = uVar18 - uVar20;
                        uVar23 = uVar18;
                      }
                      if (uVar23 == uVar20 || iVar11 < 0 != SBORROW4(uVar23,uVar20)) {
                        FUN_0001d10c(PTR_DAT_004d9048);
                        local_74[0] = FUN_000617a8();
                        lVar34 = (ulonglong)extraout_s3_00 << 0x20;
                        lVar31 = (ulonglong)extraout_s1_02 << 0x20;
                        *piVar9 = *piVar9 + 1;
                        uVar10 = extraout_s5_01;
                      }
                    }
                    puVar7 = DAT_005a7930;
                    puVar2 = (uint *)(*(int *)(*(int *)(param_1 + param_3 * 4 + 0x168) + 0x48) +
                                      uVar16 * 0x90 + 0x10);
                    uVar20 = *puVar2;
                    if ((local_74[0] == -2) &&
                       (((int)uVar17 / 2 <= local_f8 && *(int *)(PTR_DAT_004d9048 + 0x10) != 1) &&
                        1 < (int)uVar20)) {
                      uVar13 = *DAT_005a7930;
                      uVar23 = DAT_005a7930[1];
                      while( true ) {
                        lVar3 = (ulonglong)uVar13 * (ulonglong)DAT_005a7930[2];
                        uVar12 = (uint)lVar3;
                        iVar11 = uVar13 * DAT_005a7930[3];
                        uVar13 = uVar12 + DAT_005a7930[4];
                        uVar23 = uVar23 * DAT_005a7930[2] + iVar11 + (int)((ulonglong)lVar3 >> 0x20)
                                 + DAT_005a7930[5] + (uint)CARRY4(uVar12,DAT_005a7930[4]);
                        uVar12 = uVar23;
                        if ((uVar20 != 0) && (uVar20 != 0xffffffff)) {
                          uVar12 = (uint)((ulonglong)uVar23 * (ulonglong)uVar20 >> 0x20);
                        }
                        local_74[0] = *(int *)(*(int *)(*(int *)(*(int *)(param_1 +
                                                                         param_3 * 4 + 0x168) + 0x48
                                                                ) + uVar16 * 0x90) + uVar12 * 4);
                        if (local_74[0] != -2) break;
                        uVar20 = *puVar2;
                      }
                      *DAT_005a7930 = uVar13;
                      puVar7[1] = uVar23;
                    }
                    iVar25 = iVar25 + uVar16 * 0x90;
                    if (local_74[0] == -1) {
                      bVar28 = *(int *)(PTR_DAT_004d9048 + 0x10) == 0;
                    }
                    else {
                      iVar11 = std::string::compare((char *)(piVar19[1] + uVar12 * 4));
                      lVar34 = (ulonglong)extraout_s3_01 << 0x20;
                      lVar31 = (ulonglong)extraout_s1_03 << 0x20;
                      bVar28 = iVar11 == 0 && *(int *)(PTR_DAT_004d9048 + 0x10) == 0;
                      uVar10 = extraout_s5_02;
                    }
                    if (bVar28) {
                      if (param_1[0x17a] == '\x01') {
                        if (param_1[0x179] == '\x01') {
                          param_1[0x17a] = '\x02';
                        }
                      }
                      else if (param_1[0x17a] == '\0') {
                        param_1[0x17a] = '\x01';
                        puVar2 = DAT_005a7930;
                        fVar5 = DAT_000568f0;
                        lVar34 = (ulonglong)*DAT_005a7930 * (ulonglong)DAT_005a7930[2];
                        uVar12 = (uint)lVar34;
                        uVar20 = DAT_005a7930[1] * DAT_005a7930[2] +
                                 *DAT_005a7930 * DAT_005a7930[3] + (int)((ulonglong)lVar34 >> 0x20)
                                 + DAT_005a7930[5] + (uint)CARRY4(uVar12,DAT_005a7930[4]);
                        *DAT_005a7930 = uVar12 + DAT_005a7930[4];
                        puVar2[1] = uVar20;
                        uVar21 = (undefined4)((ulonglong)uVar20 * 0x7ffff >> 0x20);
                        lVar34 = FixedToFP(CONCAT44(uVar21,uVar21),0,1,0,0x20);
                        uVar30 = FloatVectorMult(CONCAT44((int)((ulonglong)lVar31 >> 0x20),
                                                          (float)lVar34 / fVar5),0x4120000041200000,
                                                 2,0x20);
                        lVar31 = FloatVectorAdd(uVar30,0x4120000041200000,2);
                        *(int *)(param_1 + 0x17c) = (int)lVar31;
                      }
                    }
                    uVar21 = (undefined4)((ulonglong)lVar34 >> 0x20);
                    uVar33 = (undefined4)((ulonglong)lVar31 >> 0x20);
                    if (local_74[0] == -2) {
                      local_f8 = local_f8 + 1;
                      if (0.0 < *(float *)(param_1 + 0x68)) {
                        FUN_000568f4(param_1,1,iVar25);
                        uVar10 = extraout_s5_03;
                        uVar33 = extraout_s1_04;
                        uVar21 = extraout_s3_02;
                      }
                    }
                    else if (0.0 < *(float *)(param_1 + 0x6c)) {
                      iVar11 = FUN_000537b4(param_1,local_74);
                      iVar25 = FUN_00057000(param_1,1,local_74[0],iVar25,param_3);
                      uVar10 = extraout_s5_04;
                      uVar33 = extraout_s1_05;
                      uVar21 = extraout_s3_03;
                      if ((iVar25 != 0) && (iVar11 != 0)) {
                        local_78 = 1;
                        local_98 = (undefined *)0x0;
                        FUN_000150e8(&local_98);
                        piVar4 = local_74 + 1;
                        local_78 = 0;
                        local_98 = &DAT_0052c888;
                        local_90 = PTR_FUN_004d9164;
                        uStack_8c = 0;
                        local_50 = 1;
                        local_74[1] = 0;
                        local_94 = iVar11;
                        (*(code *)PTR_FUN_0052c890)(&local_98,piVar4);
                        local_4c = 0;
                        local_48 = 0;
                        p_Var14 = (_List_node_base *)FUN_000155b0(iVar25 + 0x1d4,piVar4);
                        std::_List_node_base::hook(p_Var14);
                        FUN_000150e8(piVar4);
                        if (*(int *)(iVar25 + 0x1dc) != 0) {
                          iVar24 = *(int *)(iVar25 + 0x1d8);
                          *(int *)(iVar24 + 0x2c) = *(int *)(iVar25 + 0x1dc);
                          *(undefined4 *)(iVar24 + 0x30) = 1;
                          *(int *)(iVar25 + 0x1e0) = *(int *)(iVar25 + 0x1e0) + 1;
                        }
                        FUN_000150e8(&local_98);
                        local_9c = 1;
                        local_bc = (undefined *)0x0;
                        FUN_000150e8(&local_bc);
                        local_9c = 0;
                        local_bc = &DAT_0052c888;
                        local_b4 = PTR_FUN_004d9168;
                        uStack_b0 = 0;
                        local_50 = 1;
                        local_74[1] = 0;
                        local_b8 = iVar11;
                        (*(code *)PTR_FUN_0052c890)(&local_bc,piVar4);
                        local_4c = 0;
                        local_48 = 0;
                        p_Var14 = (_List_node_base *)FUN_000155b0(iVar25 + 0x1e4,piVar4);
                        std::_List_node_base::hook(p_Var14);
                        FUN_000150e8(piVar4);
                        if (*(int *)(iVar25 + 0x1ec) != 0) {
                          iVar11 = *(int *)(iVar25 + 0x1e8);
                          *(int *)(iVar11 + 0x2c) = *(int *)(iVar25 + 0x1ec);
                          *(undefined4 *)(iVar11 + 0x30) = 1;
                          *(int *)(iVar25 + 0x1f0) = *(int *)(iVar25 + 0x1f0) + 1;
                        }
                        FUN_000150e8(&local_bc);
                        uVar12 = *(int *)(iVar8 + 0x4c) - 1;
                        bVar28 = uVar16 == uVar12;
                        if (bVar28) {
                          uVar12 = *puVar1;
                        }
                        uVar10 = extraout_s5_05;
                        uVar33 = extraout_s1_06;
                        uVar21 = extraout_s3_04;
                        if (bVar28 && uVar12 == 1) {
                          local_c0 = 1;
                          local_e0 = (undefined *)0x0;
                          FUN_000150e8(&local_e0);
                          local_c0 = 0;
                          local_e0 = &DAT_0052c868;
                          local_d8 = PTR_FUN_004d9170;
                          uStack_d4 = 0;
                          local_50 = 1;
                          local_74[1] = 0;
                          piVar4 = local_74 + 1;
                          local_dc = iVar25;
                          (*(code *)PTR_FUN_0052c870)(&local_e0,piVar4);
                          local_4c = 0;
                          local_48 = 0;
                          p_Var14 = (_List_node_base *)FUN_000155b0(iVar25 + 0x1e4,piVar4);
                          std::_List_node_base::hook(p_Var14);
                          FUN_000150e8(piVar4);
                          if (*(int *)(iVar25 + 0x1ec) != 0) {
                            iVar11 = *(int *)(iVar25 + 0x1e8);
                            *(int *)(iVar11 + 0x2c) = *(int *)(iVar25 + 0x1ec);
                            *(undefined4 *)(iVar11 + 0x30) = 1;
                            *(int *)(iVar25 + 0x1f0) = *(int *)(iVar25 + 0x1f0) + 1;
                          }
                          FUN_000150e8(&local_e0);
                          uVar10 = extraout_s5_06;
                          uVar33 = extraout_s1_07;
                          uVar21 = extraout_s3_05;
                        }
                      }
                    }
                    param_1[param_3 + 0x178] = '\x01';
                    uVar36 = CONCAT44(uVar33,*puVar26);
                    uVar12 = *puVar1 - 1;
                  }
                  *puVar1 = uVar12;
                  uVar37 = FloatVectorMult(CONCAT44(uVar10,piVar19[0x1c]),
                                           CONCAT44(uVar21,*(undefined4 *)(iVar8 + 0x74)),2,0x20);
                  uVar30 = CONCAT44(uVar21,piVar19[0x1b]);
                  uVar37 = FloatVectorAdd(uVar30,uVar37,2);
                  uVar37 = FloatVectorMax(0,uVar37,2,0x20);
                  uVar32 = FloatVectorAdd(uVar36,uVar37,2);
                  *puVar26 = (int)uVar32;
                  if ((int)uVar12 < 1) break;
                  iVar25 = *(int *)(iVar8 + 0x48);
                }
              }
            }
            uVar15 = uVar15 + 1;
          } while (uVar15 != uVar29);
        }
      }
    }
    else {
      uVar30 = FloatVectorSub(uVar32,uVar35,2,0x20);
      *pfVar22 = (float)uVar30;
      param_1[0x17b] = '\x01';
      iVar8 = FUN_0001d10c((float)uVar30,PTR_DAT_004d9048);
      uVar32 = (ulonglong)extraout_s0;
      if (iVar8 != 0) {
        FUN_0001d10c(PTR_DAT_004d9048);
        iVar8 = FUN_00064000(PTR_DAT_004d907c,3);
        uVar32 = (ulonglong)extraout_s0_00;
        if ((iVar8 == 1) && (uVar32 = (ulonglong)(uint)*pfVar22, *pfVar22 <= 0.0)) {
          FUN_00020698(1,0);
          iVar8 = FUN_0001d10c(PTR_DAT_004d9048);
          uVar32 = (ulonglong)extraout_s0_01;
          if (iVar8 != 0) {
            piVar9 = (int *)FUN_0001d10c(PTR_DAT_004d9048);
            uVar29 = (**(code **)(*piVar9 + 0x3c))();
            uVar32 = (ulonglong)uVar29;
          }
        }
      }
    }
    uVar29 = FUN_00057a40((int)uVar32,param_1,param_3);
    bVar28 = uVar29 == 0;
    if (bVar28) {
      uVar29 = (uint)(byte)param_1[0x17b];
    }
    if (bVar28 && uVar29 == 0) {
      if ((*(int *)(param_1 + param_3 * 4 + 0x168) != 0) &&
         (0.0 < *(float *)(param_1 + param_3 * 4 + 0x174))) {
        uVar35 = FloatVectorSub(CONCAT44(extraout_s1_00,*(float *)(param_1 + param_3 * 4 + 0x174)),
                                uVar35,2,0x20);
        *(float *)(param_1 + param_3 * 4 + 0x174) = (float)uVar35;
        if (0.0 < (float)uVar35) goto LAB_000568c2;
      }
      if (((DAT_005a7944 & 1) == 0) && (iVar8 = ___cxa_guard_acquire(&DAT_005a7944), iVar8 != 0)) {
        DAT_005a7940 = FUN_002f69c4("freeze",6);
        ___cxa_guard_release(&DAT_005a7944);
      }
      puVar6 = PTR_DAT_004d9048;
      iVar8 = FUN_0001cd6c();
      if ((iVar8 == 0) && (puVar6[0x17] != '\0')) {
        uVar10 = FUN_00031290();
        iVar8 = FUN_00031378(uVar10,DAT_005a7940);
        if (iVar8 == 0) goto LAB_000568c2;
      }
      iVar8 = *(int *)(param_1 + param_3 * 4 + 0x168);
      if (iVar8 != 0) {
        *(int *)(iVar8 + 0xb8) = *(int *)(iVar8 + 0xb8) + 1;
      }
      if (*(int **)PTR_DAT_004d9048 != (int *)0x0) {
        (**(code **)(**(int **)PTR_DAT_004d9048 + 0x38))();
      }
      iVar8 = FUN_0001d10c(PTR_DAT_004d9048);
      if (iVar8 == 0) {
        FUN_00054dd8(param_1,param_3);
      }
      else {
        iVar25 = *(int *)(param_1 + 0x208);
        iVar8 = FUN_0001d10c(PTR_DAT_004d9048);
        iVar11 = 0;
        if (*(int *)(iVar8 + 100) != 0) {
          iVar11 = *(int *)(*(int *)(iVar8 + 100) + 0xfc);
        }
        if (iVar25 < iVar11) {
          FUN_00054dd8(param_1,param_3);
        }
      }
      *(int *)(param_1 + 0x208) = *(int *)(param_1 + 0x208) + 1;
    }
  }
LAB_000568c2:
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_44) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00065f44 — 00065f44

```c

void FUN_00065f44(int *param_1,int param_2)

{
  undefined *puVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int *piVar5;
  undefined4 uVar6;
  uint uVar7;
  uint uVar8;
  code *pcVar9;
  int *piVar10;
  float fVar11;
  float fVar12;
  undefined1 auStack_1a8 [40];
  undefined1 auStack_180 [12];
  undefined1 auStack_174 [4];
  float local_170;
  float local_16c;
  float local_168;
  undefined1 auStack_164 [40];
  undefined1 auStack_13c [40];
  undefined **local_114;
  undefined *local_110;
  undefined1 local_f4;
  undefined **local_f0;
  undefined *local_ec;
  undefined1 local_d0;
  undefined **local_cc;
  undefined *local_c8;
  undefined1 local_ac;
  undefined **local_a8;
  undefined *local_a4;
  undefined1 local_88;
  undefined1 local_84 [4];
  undefined1 auStack_80 [12];
  undefined1 auStack_74 [64];
  int local_34;
  
  local_34 = *(int *)PTR____stack_chk_guard_004d9044;
  if (*(char *)(param_2 + 0x1b8) == '\0') {
    FUN_0001d10c(PTR_DAT_004d9048);
    iVar2 = FUN_0005eef0(PTR_DAT_004d9024);
    if (iVar2 < 0x15) {
      FUN_0001d10c(PTR_DAT_004d9048);
      iVar2 = FUN_00063fa0(PTR_DAT_004d907c,"NoFeedback");
      if (iVar2 == 0) {
        FUN_0001d10c(PTR_DAT_004d9048);
        iVar2 = FUN_0005eef0(PTR_DAT_004d9024);
        puVar1 = PTR_DAT_004d9048;
        if (iVar2 < 0) {
          iVar2 = *param_1;
          piVar5 = *(int **)(iVar2 + *(int *)(iVar2 + 0x48) * 4 + 0x3c);
          *(uint *)(iVar2 + 0x48) = (*(int *)(iVar2 + 0x48) + 1U) % 3;
          puVar1 = PTR_DAT_004d9048;
          piVar10 = (int *)0x0;
          if (piVar5 != (int *)0x0) {
            iVar4 = piVar5[0x10];
            iVar2 = *(int *)(PTR_DAT_004d9054 + 0x28);
            piVar10 = piVar5;
            if ((*(int *)(iVar4 + 0x28) != iVar2) && (piVar10 = (int *)0x0, iVar4 != 0)) {
              iVar4 = *(int *)(iVar4 + 0x2c);
              piVar10 = (int *)0x0;
              if (iVar4 != 0) {
                do {
                  iVar3 = *(int *)(iVar4 + 0x28);
                  if (iVar3 != iVar2) {
                    iVar4 = *(int *)(iVar4 + 0x2c);
                  }
                } while (iVar3 != iVar2 && iVar4 != 0);
                piVar10 = (int *)0x0;
                if (iVar3 == iVar2) {
                  piVar10 = piVar5;
                }
              }
            }
          }
          FUN_0002bf1c(*(undefined4 *)(PTR_DAT_004d9048 + 0x1a4),"bonus");
          uVar6 = *(undefined4 *)(puVar1 + 0x1a4);
          local_88 = 1;
          local_a8 = (undefined **)0x0;
          FUN_0000a298(&local_a8);
          local_88 = 0;
          local_a8 = &PTR_LAB_0052bf38;
          local_a4 = PTR_FUN_004d9058;
          FUN_0002bc94(uVar6,"bonus",0x3f800000,0x3f800000,&local_a8,0);
          FUN_0000a298(&local_a8);
        }
        else {
          uVar7 = 0;
          if (iVar2 == 0) {
            FUN_0002bf1c(*(undefined4 *)(PTR_DAT_004d9048 + 0x1a4),"challenge-pass");
            uVar6 = *(undefined4 *)(puVar1 + 0x1a4);
            local_ac = 1;
            local_cc = (undefined **)0x0;
            FUN_0000a298(&local_cc);
            local_ac = 0;
            local_cc = &PTR_LAB_0052bf38;
            local_c8 = PTR_FUN_004d9058;
            FUN_0002bc94(uVar6,"challenge-pass",0x3f800000,0x3f800000,&local_cc,0);
            FUN_0000a298(&local_cc);
            uVar6 = *(undefined4 *)(puVar1 + 0x1a8);
            piVar10 = *(int **)(*param_1 + 0x28);
            local_d0 = 1;
            local_f0 = (undefined **)0x0;
            FUN_0000a298(&local_f0);
            local_d0 = 0;
            local_f0 = &PTR_LAB_0052bf38;
            local_ec = PTR_FUN_004d9154;
            FUN_000724ac(uVar6,0x3ecccccd,0x3f800000,&local_f0);
            FUN_0000a298(&local_f0);
          }
          else {
            do {
              if (4 < uVar7) goto LAB_00066366;
              piVar10 = &DAT_004712cc + uVar7;
              uVar7 = uVar7 + 1;
            } while (*piVar10 != iVar2);
            uVar7 = 6 - uVar7;
            uVar8 = 1;
            if (((1 < uVar7) && (uVar8 = uVar7, (int)uVar7 < 1)) ||
               (piVar10 = *(int **)(*param_1 + 0x24), piVar10 == (int *)0x0)) goto LAB_00066366;
            iVar3 = uVar8 - 1;
            iVar4 = 1;
            if ((1 < iVar3) && (iVar4 = iVar3, 4 < iVar3)) {
              iVar4 = 5;
            }
            FUN_002f702c(auStack_74,0x40,"togo-%i",iVar4);
            uVar7 = 1;
            if ((1 < (int)uVar8) && (uVar7 = uVar8, 4 < (int)uVar8)) {
              uVar7 = 5;
            }
            FUN_002f702c(auStack_74,0x40,"togo-%i",uVar7);
            uVar6 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
            local_f4 = 1;
            local_114 = (undefined **)0x0;
            FUN_0000a298(&local_114);
            local_f4 = 0;
            local_114 = &PTR_LAB_0052bf38;
            local_110 = PTR_FUN_004d9058;
            FUN_0002bc94(uVar6,auStack_74,0x3e800000,0x3f800000,&local_114,0);
            FUN_0000a298(&local_114);
            FUN_0030f7cc(auStack_13c,"value");
            iVar4 = FUN_0039725c(piVar10,auStack_13c);
            FUN_0030f7e0(auStack_13c);
            if (iVar4 != 0) {
              FUN_002f702c(auStack_80,10,"%i",iVar2);
              FUN_0030f7cc(auStack_164,auStack_80);
              FUN_00022950(*(undefined4 *)(iVar4 + 0x7dc),auStack_164);
              FUN_0030f7e0(auStack_164);
            }
          }
        }
        if (piVar10 != (int *)0x0) {
          for (iVar2 = piVar10[0x182]; *(int *)(iVar2 + 0x38) != 0;
              iVar2 = *(int *)(*(int *)(iVar2 + 0x38) + 4)) {
          }
          fVar11 = *(float *)(iVar2 + 0x48);
          for (iVar2 = piVar10[0x183]; *(int *)(iVar2 + 0x38) != 0;
              iVar2 = *(int *)(*(int *)(iVar2 + 0x38) + 4)) {
          }
          fVar12 = *(float *)(iVar2 + 0x48);
          uVar6 = FUN_003ecb20();
          FUN_003ed850(auStack_174,uVar6);
          local_16c = fVar11 / (DAT_00066394 / local_170);
          local_168 = fVar12 / (DAT_00066394 / local_170);
          FUN_00044590(auStack_180,param_2 + 0x10,&local_16c);
          FUN_0000606c(piVar10[0x17e],auStack_180);
          local_84[0] = 1;
          FUN_0001da28(piVar10[0x98],local_84);
          FUN_00396d98(piVar10,1);
          pcVar9 = *(code **)(*piVar10 + 0x40);
          FUN_0030f7cc(auStack_1a8,"trigger");
          (*pcVar9)(piVar10,auStack_1a8,1);
          FUN_0030f7e0(auStack_1a8);
        }
      }
    }
  }
LAB_00066366:
  if (*(int *)PTR____stack_chk_guard_004d9044 == local_34) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

## FUN_000783b8 — 000783b8

```c

/* WARNING: Heritage AFTER dead removal. Example location: s1 : 0x00078922 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void FUN_000783b8(int param_1,int param_2)

{
  longlong lVar1;
  undefined *puVar2;
  undefined *puVar3;
  undefined *puVar4;
  int *piVar5;
  int iVar6;
  undefined1 *puVar7;
  undefined4 uVar8;
  int iVar9;
  undefined4 uVar10;
  uint uVar11;
  uint uVar12;
  uint uVar13;
  uint in_fpscr;
  byte bVar14;
  float fVar15;
  undefined8 in_d0;
  undefined8 uVar16;
  float fVar17;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  undefined8 uVar18;
  undefined4 extraout_s3_01;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  undefined4 extraout_s5_01;
  undefined4 extraout_s7;
  undefined4 extraout_s7_00;
  undefined4 extraout_s7_01;
  undefined4 extraout_s7_02;
  undefined4 extraout_s9;
  undefined4 extraout_s11;
  undefined4 extraout_s13;
  undefined8 uVar19;
  undefined8 uVar20;
  undefined8 uVar21;
  undefined8 uVar22;
  undefined4 local_90 [8];
  undefined1 local_70;
  undefined4 local_6c;
  undefined4 local_68;
  undefined4 local_64;
  undefined4 local_60;
  undefined4 local_5c;
  undefined4 local_58;
  char acStack_54 [32];
  int local_34;
  
  puVar2 = PTR____stack_chk_guard_004d9044;
  local_34 = *(int *)PTR____stack_chk_guard_004d9044;
  fVar15 = *(float *)(param_1 + 0x88);
  uVar12 = in_fpscr & 0xfffffff | (uint)(fVar15 < 0.0) << 0x1f | (uint)(fVar15 == 0.0) << 0x1e |
           (uint)(0.0 <= fVar15) << 0x1d;
  if ((int)uVar12 < 0) {
    *(undefined4 *)(param_1 + 0x88) = 0;
  }
  else {
    fVar15 = *(float *)(param_1 + 0x84);
    uVar13 = in_fpscr & 0xfffffff | (uint)(fVar15 < 1.5) << 0x1f | (uint)(fVar15 == 1.5) << 0x1e;
    uVar12 = uVar13 | (uint)NAN(fVar15) << 0x1c;
    bVar14 = (byte)(uVar13 >> 0x18);
    if (!(bool)(bVar14 >> 6 & 1) && bVar14 >> 7 == ((byte)(uVar12 >> 0x1c) & 1)) goto LAB_00078944;
  }
  puVar3 = PTR_DAT_004d9048;
  piVar5 = (int *)FUN_0001d10c();
  (**(code **)(*piVar5 + 0x40))(piVar5,*(undefined4 *)(param_1 + 0x7c));
  uVar16 = FloatVectorAdd(CONCAT44((int)((ulonglong)in_d0 >> 0x20),*(undefined4 *)(param_1 + 0x84)),
                          0x3f8000003f800000,2);
  *(undefined4 *)(param_1 + 0x84) = (int)uVar16;
  *(int *)(param_1 + 0x90) = *(int *)(param_1 + 0x90) + 1;
  puVar4 = PTR_DAT_004d9050;
  fVar15 = DAT_0007857c;
  if (*(int *)(param_1 + 0xdc) < 1) {
    lVar1 = (ulonglong)*(uint *)PTR_DAT_004d9050 * (ulonglong)*(uint *)(PTR_DAT_004d9050 + 8);
    uVar11 = (uint)lVar1;
    uVar13 = *(int *)(PTR_DAT_004d9050 + 4) * *(uint *)(PTR_DAT_004d9050 + 8) +
             *(uint *)PTR_DAT_004d9050 * *(int *)(PTR_DAT_004d9050 + 0xc) +
             (int)((ulonglong)lVar1 >> 0x20) +
             *(int *)(PTR_DAT_004d9050 + 0x14) +
             (uint)CARRY4(uVar11,*(uint *)(PTR_DAT_004d9050 + 0x10));
    lVar1 = (ulonglong)uVar13 * 0x7ffff;
    uVar8 = (undefined4)((ulonglong)lVar1 >> 0x20);
    *(uint *)PTR_DAT_004d9050 = uVar11 + *(uint *)(PTR_DAT_004d9050 + 0x10);
    *(uint *)(puVar4 + 4) = uVar13;
    uVar19 = CONCAT44(extraout_s5,*(undefined4 *)(param_1 + 0xd0));
    uVar18 = FixedToFP(CONCAT44(uVar8,uVar8),0,1,0,0x20);
    uVar21 = FloatVectorMult(CONCAT44(extraout_s7,(float)uVar18 / fVar15),0x4040000040400000,2,0x20)
    ;
    uVar18 = CONCAT44((int)((ulonglong)uVar18 >> 0x20),*(undefined4 *)(param_1 + 0xcc));
    uVar16 = CONCAT44((int)((ulonglong)uVar16 >> 0x20),*(undefined4 *)(param_1 + 0xd4));
    uVar20 = FloatVectorMult(uVar18,uVar18,2,0x20);
    uVar22 = FloatVectorMult(uVar16,uVar16,2,0x20);
    uVar18 = FPToFixed(uVar21,0,0,3,0x20);
    uVar16 = FloatVectorMult(uVar19,uVar19,2,0x20);
    uVar16 = FloatVectorAdd(uVar20,uVar16,2);
    uVar16 = FloatVectorAdd(uVar16,uVar22,2);
    iVar6 = (int)uVar18 + 7;
    fVar15 = (float)FUN_00301044((int)uVar16,(int)uVar18,uVar8,(int)lVar1);
    uVar18 = FixedToFP(CONCAT44(iVar6,iVar6),0,0,0,0x20);
    uVar13 = uVar12 & 0xfffffff;
    uVar12 = uVar13 | (uint)(fVar15 < 1.0) << 0x1f | (uint)(fVar15 == 1.0) << 0x1e |
             (uint)(1.0 <= fVar15) << 0x1d;
    if ((int)uVar12 < 0) {
      uVar13 = *(uint *)puVar4;
      lVar1 = (ulonglong)uVar13 * (ulonglong)*(uint *)(puVar4 + 8);
      uVar11 = (uint)lVar1;
      *(uint *)puVar4 = uVar11 + *(uint *)(puVar4 + 0x10);
      puVar7 = (undefined1 *)
               (*(int *)(puVar4 + 4) * *(uint *)(puVar4 + 8) +
                uVar13 * *(int *)(puVar4 + 0xc) + (int)((ulonglong)lVar1 >> 0x20) +
                *(int *)(puVar4 + 0x14) + (uint)CARRY4(uVar11,*(uint *)(puVar4 + 0x10)));
      *(undefined1 **)(puVar4 + 4) = puVar7;
    }
    else {
      uVar13 = uVar13 | (uint)(fVar15 < 22.0) << 0x1f | (uint)(fVar15 == 22.0) << 0x1e;
      uVar12 = uVar13 | (uint)NAN(fVar15) << 0x1c;
      bVar14 = (byte)(uVar13 >> 0x18);
      if ((bool)(bVar14 >> 6 & 1) || bVar14 >> 7 != ((byte)(uVar12 >> 0x1c) & 1)) {
        uVar19 = FloatVectorSub(CONCAT44(extraout_s7_00,*(undefined4 *)(param_1 + 0xd0)),
                                CONCAT44(extraout_s5_00,*(undefined4 *)(param_1 + 0xc4)),2,0x20);
        uVar16 = FloatVectorSub(CONCAT44(0x41b00000,*(undefined4 *)(param_1 + 0xcc)),
                                CONCAT44(fVar15,*(undefined4 *)(param_1 + 0xc0)),2,0x20);
        puVar7 = (undefined1 *)FUN_0030113c((int)uVar19,(int)uVar16);
      }
      else {
        iVar6 = FUN_0030113c(*(undefined4 *)(param_1 + 0xd0),*(undefined4 *)(param_1 + 0xcc));
        lVar1 = (ulonglong)*(uint *)puVar4 * (ulonglong)*(uint *)(puVar4 + 8);
        uVar11 = (uint)lVar1;
        uVar13 = *(int *)(puVar4 + 4) * *(uint *)(puVar4 + 8) +
                 *(uint *)puVar4 * *(int *)(puVar4 + 0xc) + (int)((ulonglong)lVar1 >> 0x20) +
                 *(int *)(puVar4 + 0x14) + (uint)CARRY4(uVar11,*(uint *)(puVar4 + 0x10));
        *(uint *)puVar4 = uVar11 + *(uint *)(puVar4 + 0x10);
        *(uint *)(puVar4 + 4) = uVar13;
        puVar7 = &LAB_00005ffa + iVar6 + (int)((ulonglong)uVar13 * 0x3ffc >> 0x20);
      }
    }
    uVar8 = FUN_003010d0((uint)puVar7 & 0xffff);
    uVar19 = FloatVectorMult(uVar18,CONCAT44(uVar8,uVar8),2,0x20);
    uVar8 = FUN_003010b8((uint)puVar7 & 0xffff);
    uVar16 = FloatVectorAdd(uVar19,CONCAT44((int)((ulonglong)uVar16 >> 0x20),
                                            *(undefined4 *)(param_1 + 0xcc)),2);
    uVar19 = FloatVectorMult(uVar18,CONCAT44(uVar8,uVar8),2,0x20);
    uVar18 = FloatVectorMult(uVar18,0,2,0x20);
    *(int *)(param_1 + 0xcc) = (int)uVar16;
    uVar16 = FloatVectorAdd(uVar19,CONCAT44((int)((ulonglong)uVar16 >> 0x20),
                                            *(undefined4 *)(param_1 + 0xd0)),2);
    *(int *)(param_1 + 0xd0) = (int)uVar16;
    uVar16 = FloatVectorAdd(uVar18,CONCAT44((int)((ulonglong)uVar16 >> 0x20),
                                            *(undefined4 *)(param_1 + 0xd4)),2);
    *(int *)(param_1 + 0xd4) = (int)uVar16;
    *(undefined4 *)(param_1 + 0xc0) = *(undefined4 *)(param_1 + 0xb4);
    *(undefined4 *)(param_1 + 0xc4) = *(undefined4 *)(param_1 + 0xb8);
    *(undefined4 *)(param_1 + 200) = *(undefined4 *)(param_1 + 0xbc);
    iVar6 = 0;
    *(undefined4 *)(param_1 + 0xd8) = 0;
  }
  else {
    iVar6 = *(int *)(param_1 + 0xdc) + -1;
  }
  bVar14 = (byte)(uVar12 >> 0x18);
  *(int *)(param_1 + 0xdc) = iVar6;
  uVar8 = FUN_00052f80((int)uVar16);
  FUN_00057bd0(uVar8,0x3dcccccd,0);
  FUN_00013c5c(*(undefined4 *)(param_1 + 0x7c));
  uVar16 = FloatVectorMult(CONCAT44(extraout_s3,*(undefined4 *)(param_1 + 0x2c)),
                           CONCAT44((int)((ulonglong)uVar16 >> 0x20),DAT_0007896c),2,0x20);
  uVar16 = FPToFixed(uVar16,0,0,3,0x20);
  FUN_00079860(&local_60,*(undefined4 *)(param_1 + 0x7c),(uint)uVar16 & 0xffff);
  puVar4 = PTR_DAT_004d9050;
  iVar6 = *(int *)(param_1 + 0x7c);
  uVar18 = CONCAT44(extraout_s5_01,*(undefined4 *)(iVar6 + 0x10c));
  uVar21 = FloatVectorMult(CONCAT44(extraout_s3_00,local_60),uVar18,2,0x20);
  uVar22 = FloatVectorMult(uVar18,CONCAT44(extraout_s7_01,local_58),2,0x20);
  uVar19 = FloatVectorMult(uVar18,CONCAT44((int)((ulonglong)uVar16 >> 0x20),local_5c),2,0x20);
  uVar18 = FloatVectorMult(uVar21,0x4040000040400000,2,0x20);
  uVar16 = FloatVectorMult(uVar22,0x4040000040400000,2,0x20);
  uVar19 = FloatVectorMult(uVar19,0x4040000040400000,2,0x20);
  *(int *)(param_1 + 0xa8) = (int)uVar18;
  *(int *)(param_1 + 0xac) = (int)uVar19;
  *(int *)(param_1 + 0xb0) = (int)uVar16;
  lVar1 = (ulonglong)*(uint *)puVar4 * (ulonglong)*(uint *)(puVar4 + 8);
  uVar12 = (uint)lVar1;
  local_68 = *(undefined4 *)(iVar6 + 0x14);
  local_6c = *(undefined4 *)(iVar6 + 0x10);
  iVar9 = *(int *)(param_2 + 0x38);
  uVar18 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar19 >> 0x20),*(undefined4 *)(iVar6 + 0xd8)),
                          0xc0a00000c0a00000,2);
  uVar21 = FloatVectorSub(CONCAT44(extraout_s11,*(undefined4 *)(iVar9 + 8)),
                          CONCAT44(extraout_s13,*(undefined4 *)(iVar9 + 0x18)),2,0x20);
  uVar13 = *(int *)(puVar4 + 4) * *(uint *)(puVar4 + 8) +
           *(uint *)puVar4 * *(int *)(puVar4 + 0xc) + (int)((ulonglong)lVar1 >> 0x20) +
           *(int *)(puVar4 + 0x14) + (uint)CARRY4(uVar12,*(uint *)(puVar4 + 0x10));
  uVar19 = FloatVectorSub(CONCAT44(extraout_s7_01,*(undefined4 *)(iVar9 + 4)),
                          CONCAT44(extraout_s9,*(undefined4 *)(iVar9 + 0x14)),2,0x20);
  *(uint *)puVar4 = uVar12 + *(uint *)(puVar4 + 0x10);
  *(uint *)(puVar4 + 4) = uVar13;
  local_64 = (undefined4)uVar18;
  uVar8 = FUN_0030113c(local_68,(int)uVar21,(int)uVar19);
  fVar15 = DAT_00078968;
  uVar10 = (undefined4)((ulonglong)uVar13 * 0x7ffff >> 0x20);
  uVar18 = FixedToFP(CONCAT44(uVar10,uVar10),0,1,0,0x20);
  uVar19 = FixedToFP(CONCAT44(uVar8,uVar8),0,1,0,0x20);
  uVar18 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar18 >> 0x20),(float)uVar18 / DAT_00078968),
                           CONCAT44(extraout_s7_02,DAT_00078974),2,0x20);
  uVar18 = FloatVectorAdd(uVar18,CONCAT44((int)((ulonglong)uVar19 >> 0x20),DAT_00078978),2);
  FUN_00011d10(&local_6c,(float)uVar19 / DAT_00078970,(int)uVar18,0);
  *(undefined4 *)(param_2 + 0x3c) = 0xffffffff;
  if (*(int *)(param_1 + 0x94) != 0) {
    *(undefined4 *)(*(int *)(param_1 + 0x94) + 0x7c) = 0;
    FUN_0004e950(*(undefined4 *)(param_1 + 0x94));
  }
  uVar8 = *(undefined4 *)
           ((uint)*(byte *)(*(int *)(param_1 + 0x7c) + 0x3c) * 0x338 + *(int *)PTR_DAT_004d91b8 +
           0x250);
  DAT_005a8d18 = DAT_005a8d18 + 1;
  if ((((*(ushort *)(param_1 + 0x90) & 0x111) != 0) && (iVar6 = FUN_000260f0(), iVar6 != 0)) ||
     (DAT_005a8d18 == 2)) {
    DAT_005a8d18 = 0;
    uVar10 = FUN_00033ca0();
    iVar6 = FUN_000359cc(uVar10,uVar8);
    if (iVar6 == 1) {
      uVar10 = FUN_00033ca0();
      fVar17 = *(float *)(puVar3 + 0x20);
      iVar6 = FUN_00035a08(uVar10,uVar8,0,
                           (char)(bVar14 & 0xf | (byte)(((uint)(fVar17 < 1.0) << 0x1f) >> 0x18) |
                                  (byte)(((uint)(fVar17 == 1.0) << 0x1e) >> 0x18) |
                                 (byte)(((uint)(1.0 <= fVar17) << 0x1d) >> 0x18)) < '\0');
      if (iVar6 != 0) {
        uVar12 = FUN_003010b8(-*(short *)(*(int *)(param_1 + 0x7c) + 0x108));
        *(uint *)(iVar6 + 0x34) = uVar12 ^ 0x80000000;
        uVar8 = FUN_003010d0(-*(short *)(*(int *)(param_1 + 0x7c) + 0x108));
        *(undefined4 *)(iVar6 + 0x30) = uVar8;
        iVar9 = *(int *)(param_2 + 0x38);
        *(undefined4 *)(iVar6 + 8) = *(undefined4 *)(iVar9 + 4);
        *(undefined4 *)(iVar6 + 0xc) = *(undefined4 *)(iVar9 + 8);
        *(undefined4 *)(iVar6 + 0x10) = *(undefined4 *)(iVar9 + 0xc);
        uVar16 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar16 >> 0x20),
                                          *(undefined4 *)(iVar6 + 0x28)),0x3f0000003f000000,2,0x20);
        *(int *)(iVar6 + 0x28) = (int)uVar16;
      }
    }
  }
  _sprintf(acStack_54,"%i HITS",(int)uVar16,*(undefined4 *)(param_1 + 0x90));
  lVar1 = (ulonglong)*(uint *)puVar4 * (ulonglong)*(uint *)(puVar4 + 8);
  uVar12 = (uint)lVar1;
  uVar13 = *(int *)(puVar4 + 4) * *(uint *)(puVar4 + 8) +
           *(uint *)puVar4 * *(int *)(puVar4 + 0xc) + (int)((ulonglong)lVar1 >> 0x20) +
           *(int *)(puVar4 + 0x14) + (uint)CARRY4(uVar12,*(uint *)(puVar4 + 0x10));
  uVar8 = (undefined4)((ulonglong)uVar13 * 0x7ffff >> 0x20);
  uVar16 = FixedToFP(CONCAT44(uVar8,uVar8),0,1,0,0x20);
  *(uint *)puVar4 = uVar12 + *(uint *)(puVar4 + 0x10);
  *(uint *)(puVar4 + 4) = uVar13;
  uVar16 = CONCAT44((int)((ulonglong)uVar16 >> 0x20),(float)uVar16 / fVar15);
  uVar16 = FloatVectorAdd(uVar16,uVar16,2);
  uVar16 = FloatVectorAdd(uVar16,0x3f8000003f800000,2);
  uVar16 = FPToFixed(uVar16,0,0,3,0x20);
  _sprintf(acStack_54,"pome-slice-%i",(int)uVar16);
  local_70 = 1;
  local_90[0] = 0;
  uVar8 = *(undefined4 *)(puVar3 + 0x1a4);
  FUN_0000a298(local_90);
  uVar16 = FixedToFP(CONCAT44(extraout_s3_01,*(undefined4 *)(param_1 + 0x90)),0,0,0,0x20);
  fVar17 = (float)uVar16 / 28.0;
  fVar15 = DAT_00078980;
  if (fVar17 <= DAT_00078980) {
    fVar15 = DAT_00078984;
  }
  FloatVectorAdd(CONCAT44(0x41e00000,fVar17),CONCAT44((int)((ulonglong)uVar16 >> 0x20),fVar15),2);
  FUN_0002bc94(DAT_0007897c,0x41e00000,fVar15,uVar8,acStack_54,0x3e000000,0x3f800000);
  FUN_0000a298(local_90);
  if (*(int *)(param_1 + 0x90) % 2 == 1) {
    FUN_0004ff50(param_1);
  }
LAB_00078944:
  if (*(int *)puVar2 != local_34) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

命中函数数: 13
