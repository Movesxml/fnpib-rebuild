# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_00057000 — 00057000

- 函数名: FUN_00057000
- 函数体: 2437 字节
- 调用者数: 6 / 被调用者数: 16

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

## FUN_000568f4 — 000568f4

- 函数名: FUN_000568f4
- 函数体: 1749 字节
- 调用者数: 3 / 被调用者数: 10

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

## FUN_000537b4 — 000537b4

- 函数名: FUN_000537b4
- 函数体: 55 字节
- 调用者数: 1 / 被调用者数: 0

```c

undefined4 FUN_000537b4(int param_1,undefined4 param_2)

{
  int *piVar1;
  int iVar2;
  uint uVar3;
  
  uVar3 = 0;
  do {
    if ((uint)(*(int *)(param_1 + 0x220) - *(int *)(param_1 + 0x21c) >> 2) <= uVar3) {
      return 0;
    }
    piVar1 = *(int **)(*(int *)(param_1 + 0x21c) + uVar3 * 4);
    iVar2 = (**(code **)(*piVar1 + 8))(piVar1,param_2);
    uVar3 = uVar3 + 1;
  } while (iVar2 != 1);
  return *(undefined4 *)(*(int *)(param_1 + 0x21c) + uVar3 * 4 + -4);
}


```

## FUN_000537ec — 000537ec

- 函数名: FUN_000537ec
- 函数体: 935 字节
- 调用者数: 1 / 被调用者数: 13

```c

undefined4 FUN_000537ec(int param_1,undefined4 *param_2)

{
  char cVar1;
  int iVar2;
  size_t sVar3;
  undefined4 uVar4;
  uint uVar5;
  ulong uVar6;
  void *pvVar7;
  byte *pbVar8;
  undefined1 uVar9;
  char *pcVar10;
  float fVar11;
  undefined8 uVar12;
  undefined4 local_2c;
  undefined4 local_28;
  undefined4 local_24;
  double local_20;
  
  if (((DAT_005a7938 & 1) == 0) && (iVar2 = ___cxa_guard_acquire(&DAT_005a7938), iVar2 != 0)) {
    DAT_005a7934 = FUN_002f69c4("Spawn",5);
    ___cxa_guard_release(&DAT_005a7938);
  }
  pcVar10 = (char *)(*(int *)(param_1 + 0x20) + 8);
  sVar3 = _strlen(pcVar10);
  iVar2 = FUN_002f69c4(pcVar10,sVar3);
  uVar4 = 0;
  if (iVar2 == DAT_005a7934) {
    uVar4 = FUN_0030c660(param_1,"type");
    uVar5 = FUN_000395ac(uVar4,param_2 + 1);
    param_2[4] = uVar5;
    if (0 < (int)uVar5) {
      uVar6 = (ulong)((ulonglong)uVar5 * 4);
      if ((int)((ulonglong)uVar5 * 4 >> 0x20) != 0) {
        uVar6 = 0xffffffff;
      }
      pvVar7 = operator_new__(uVar6);
      iVar2 = 0;
      *param_2 = pvVar7;
      do {
        *(undefined4 *)((int)pvVar7 + iVar2 * 4) = 0xffffffff;
        iVar2 = iVar2 + 1;
      } while (iVar2 < (int)uVar5);
    }
    iVar2 = FUN_0030c718(param_1,"min",&local_20);
    if (iVar2 == 0) {
      param_2[0x17] = (float)local_20;
    }
    iVar2 = FUN_0030c718(param_1,"max",&local_20);
    if (iVar2 == 0) {
      param_2[0x19] = (float)local_20;
    }
    iVar2 = FUN_0030c718(param_1,"mininc",&local_20);
    if (iVar2 == 0) {
      param_2[0x1a] = (float)local_20;
    }
    iVar2 = FUN_0030c718(param_1,"maxinc",&local_20);
    if (iVar2 == 0) {
      param_2[0x1a] = (float)local_20;
    }
    iVar2 = FUN_0030c718(param_1,"delay",&local_20);
    if (iVar2 == 0) {
      param_2[0x1b] = (float)local_20;
    }
    iVar2 = FUN_0030c718(param_1,"delayinc",&local_20);
    if (iVar2 == 0) {
      param_2[0x1c] = (float)local_20;
    }
    iVar2 = FUN_0030c718(param_1,"horizmin",&local_20);
    if (iVar2 == 0) {
      param_2[0x14] = (float)local_20;
    }
    iVar2 = FUN_0030c718(param_1,"horizmax",&local_20);
    if (iVar2 == 0) {
      param_2[0x15] = (float)local_20;
    }
    iVar2 = FUN_0030c718(param_1,"velscale",&local_20);
    if (iVar2 == 0) {
      fVar11 = (float)local_20;
      param_2[0x12] = fVar11;
    }
    else {
      fVar11 = (float)param_2[0x12];
    }
    param_2[0x13] = fVar11;
    iVar2 = FUN_0030c718(fVar11,param_1,"velXscale",&local_20);
    if (iVar2 == 0) {
      param_2[0x12] = (float)local_20;
    }
    iVar2 = FUN_0030c718(param_1,"velYscale",&local_20);
    if (iVar2 == 0) {
      param_2[0x13] = (float)local_20;
    }
    iVar2 = FUN_0030c718(param_1,"dt",&local_20);
    if (iVar2 == 0) {
      param_2[5] = (float)local_20;
    }
    iVar2 = FUN_0030c718(param_1,"velX",&local_20);
    if (iVar2 == 0) {
      param_2[0x10] = (float)local_20;
    }
    iVar2 = FUN_0030c718(param_1,"velY",&local_20);
    if (iVar2 == 0) {
      param_2[0x11] = (float)local_20;
    }
    FUN_0030c6c0(param_1,"posX",param_2 + 0xb);
    FUN_0030c6c0(param_1,"posY",param_2 + 0xc);
    FUN_0030c6c0(param_1,"sin",param_2 + 0xd);
    FUN_0030c6c0(param_1,"cos",param_2 + 0xe);
    FUN_0030c6c0(param_1,"radius",param_2 + 0xf);
    pcVar10 = (char *)FUN_0030c660(param_1,"gravity");
    cVar1 = '\0';
    if (pcVar10 != (char *)0x0) {
      cVar1 = *pcVar10;
    }
    if (pcVar10 != (char *)0x0 && cVar1 != '\0') {
      FUN_000394a0(&local_2c);
      param_2[8] = local_2c;
      param_2[9] = local_28;
      param_2[10] = local_24;
    }
    uVar4 = FUN_0030c660(param_1,"override");
    FUN_00058528(param_2,uVar4);
    uVar12 = FUN_0030c660(param_1,"placement");
    uVar5 = (uint)((ulonglong)uVar12 >> 0x20);
    pbVar8 = (byte *)uVar12;
    if (pbVar8 != (byte *)0x0) {
      uVar5 = (uint)*pbVar8;
    }
    if (pbVar8 == (byte *)0x0 || uVar5 == 0) {
      uVar4 = 0;
    }
    else {
      uVar4 = FUN_000531b8();
    }
    param_2[0x16] = uVar4;
    uVar9 = 0;
    param_2[0x21] = 0;
    FUN_0030c6c0(param_1,"replaceWithChallengeFruit",param_2 + 0x21);
    pcVar10 = (char *)FUN_0030c660(param_1,"mirror");
    if ((pcVar10 != (char *)0x0) && (iVar2 = _strcmp("true",pcVar10), iVar2 == 0)) {
      uVar9 = 1;
    }
    uVar4 = 1;
    *(undefined1 *)(param_2 + 0x23) = uVar9;
  }
  return uVar4;
}


```

