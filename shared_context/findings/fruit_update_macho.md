# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0000e52c — 0000e52c

- 函数名: FUN_0000e52c
- 函数体: 365 字节
- 调用者数: 1 / 被调用者数: 7

```c

void FUN_0000e52c(int param_1,int param_2)

{
  undefined4 uVar1;
  int extraout_r1;
  int iVar2;
  bool bVar3;
  undefined8 in_d0;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined8 unaff_d9;
  undefined8 uVar4;
  undefined8 uVar5;
  undefined8 uVar6;
  undefined4 local_64;
  undefined4 local_60;
  undefined4 local_5c;
  undefined4 local_58;
  undefined4 local_54;
  undefined4 local_50;
  undefined1 auStack_4c [12];
  
  uVar1 = (undefined4)((ulonglong)in_d0 >> 0x20);
  if (*(char *)(param_1 + 0xb1) != '\0') goto LAB_0000e66a;
  iVar2 = param_2;
  if ((DAT_00556ce4 & 1) == 0) {
    uVar6 = ___cxa_guard_acquire(&DAT_00556ce4);
    iVar2 = (int)((ulonglong)uVar6 >> 0x20);
    uVar1 = extraout_s1;
    if ((int)uVar6 != 0) {
      local_58 = 0;
      local_54 = 0;
      local_50 = 0;
      uVar6 = CONCAT44((int)((ulonglong)unaff_d9 >> 0x20),DAT_0000e69c);
      uVar1 = FUN_00025164();
      uVar4 = FloatVectorAdd(CONCAT44(uVar1,uVar1),uVar6,2);
      uVar1 = FUN_000251a8();
      uVar5 = FloatVectorAdd(CONCAT44(uVar1,uVar1),uVar6,2);
      uVar6 = FloatVectorMult(uVar4,0x3f0000003f000000,2,0x20);
      uVar4 = FloatVectorMult(uVar5,0x3f0000003f000000,2,0x20);
      local_64 = (undefined4)uVar6;
      local_60 = (undefined4)uVar4;
      local_5c = 0;
      FUN_002ebe74(local_64,&DAT_00556e0c,&local_58,&local_64);
      ___cxa_atexit(PTR_FUN_004d90ac,&DAT_00556e0c,PTR___mh_execute_header_004d9040);
      ___cxa_guard_release(&DAT_00556ce4);
      iVar2 = extraout_r1;
      uVar1 = extraout_s1_00;
    }
  }
  if (*(float *)(param_1 + 0xac) <= 0.0) {
    if (*(int **)PTR_DAT_004d9048 != (int *)0x0) {
      uVar6 = (**(code **)(**(int **)PTR_DAT_004d9048 + 0x28))();
      iVar2 = (int)((ulonglong)uVar6 >> 0x20);
      uVar1 = extraout_s1_01;
      if ((int)uVar6 != 1) goto LAB_0000e664;
    }
    if ((((*(char *)(param_1 + 0x1bc) == '\0') && (*(float *)(param_1 + 0x104) <= -1.0)) &&
        (*(float *)(param_1 + 0xd0) <= 0.0)) && ((*(byte *)(param_1 + 0xc) & 1) == 0)) {
      bVar3 = *(char *)(param_1 + 0xc0) != '\0';
      if (bVar3) {
        iVar2 = *(int *)(param_1 + 0x38);
      }
      if ((bVar3 && iVar2 != 0) &&
         (iVar2 = FUN_002ebed4(&DAT_00556e0c,iVar2,auStack_4c), uVar1 = extraout_s1_02, iVar2 == 1))
      {
        *(undefined1 *)(param_1 + 0xb1) = 1;
        *(undefined4 *)(param_1 + 0x100) = 0;
      }
    }
  }
LAB_0000e664:
  if (*(char *)(param_1 + 0xb1) == '\0') {
    return;
  }
LAB_0000e66a:
  if (*(char *)(param_1 + 0x1bc) == '\0') {
    uVar6 = FloatVectorAdd(CONCAT44(uVar1,*(undefined4 *)(param_1 + 0x100)),
                           CONCAT44(param_2,param_2),2);
    *(int *)(param_1 + 0x100) = (int)uVar6;
  }
  return;
}


```

## FUN_0000e6a4 — 0000e6a4

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

