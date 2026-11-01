# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_00010bec — 00010bec

- 函数名: FUN_00010bec
- 函数体: 4287 字节
- 调用者数: 0 / 被调用者数: 54

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

## FUN_00070bc8 — 00070bc8

- 函数名: FUN_00070bc8
- 函数体: 669 字节
- 调用者数: 0 / 被调用者数: 18

```c

void FUN_00070bc8(int param_1,int param_2)

{
  undefined *puVar1;
  undefined *puVar2;
  int iVar3;
  uint uVar4;
  uint uVar5;
  undefined4 *puVar6;
  void *pvVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  undefined **local_7c;
  undefined *local_78;
  undefined4 local_74 [8];
  undefined1 local_54;
  undefined **local_50;
  undefined *local_4c;
  undefined4 local_48 [8];
  undefined1 local_28;
  int local_24;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  if (((DAT_005a86d8 & 1) == 0) && (iVar3 = ___cxa_guard_acquire(&DAT_005a86d8), iVar3 != 0)) {
    DAT_005a86d4 = FUN_002f69c4("bean",4);
    ___cxa_guard_release(&DAT_005a86d8);
  }
  if ((param_2 != 0) && (iVar3 = FUN_0000bd38(param_2), *(int *)(iVar3 + 0x250) == DAT_005a86d4)) {
    if (*(int *)(param_1 + 0x40) != 0) {
      FUN_0002be70(*(undefined4 *)(PTR_DAT_004d9048 + 0x1a4),*(int *)(param_1 + 0x40),"bean-lp");
      *(undefined4 *)(param_1 + 0x40) = 0;
    }
    puVar2 = PTR_DAT_004d9048;
    local_50 = &PTR_LAB_0052bf38;
    local_4c = PTR_FUN_004d9058;
    local_28 = 1;
    local_48[0] = 0;
    uVar8 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
    FUN_0000a23c(&local_50,local_48);
    FUN_0002bc94(uVar8,"bean-collect",0x3f800000,0x3f800000,local_48,0);
    FUN_0000a298(local_48);
    local_7c = &PTR_LAB_0052bf38;
    local_54 = 1;
    local_78 = PTR_FUN_004d9154;
    local_74[0] = 0;
    uVar8 = *(undefined4 *)(puVar2 + 0x1a8);
    FUN_0000a23c(&local_7c,local_74);
    FUN_0007268c(uVar8,0x3f000000,0x3f800000,local_74);
    FUN_0000a298(local_74);
    iVar3 = FUN_000276e8(*(undefined4 *)(puVar2 + 0x5c),"bean");
    if (iVar3 == 1) {
      uVar9 = *(undefined4 *)(puVar2 + 0x5c);
      uVar8 = FUN_002f69c4("bean_game_consecutive_total",0x1b);
      FUN_00027588(uVar9,"bean_game_consecutive_total",uVar8,1,1,1);
    }
    pvVar7 = *(void **)(param_1 + 0x3c);
    if (pvVar7 != (void *)0x0) {
      FUN_00071d50(pvVar7);
      operator_delete(pvVar7);
      *(undefined4 *)(param_1 + 0x3c) = 0;
    }
    uVar4 = *(uint *)(param_1 + 0x14);
    uVar5 = 0;
    if ((uVar4 != 0) && (uVar5 = uVar4, 1 < uVar4)) {
      uVar5 = 2;
    }
    iVar3 = FUN_00070e68(param_1);
    if (iVar3 == 1) {
      puVar6 = operator_new(0x4c);
      puVar6[0xf] = 0;
      puVar6[0x10] = 0x3f800000;
      puVar2 = PTR_FUN_004d9158;
      puVar6[0x11] = uVar5;
      puVar6[9] = 0;
      puVar6[0xb] = puVar2;
      puVar6[0xd] = 0;
      puVar6[0xe] = 0x3f000000;
      puVar6[0xc] = 0x3e4ccccd;
      uVar8 = *(undefined4 *)(param_2 + 0x10);
      iVar3 = param_1 + uVar5 * 0xc;
      puVar6[6] = uVar8;
      uVar9 = *(undefined4 *)(param_2 + 0x14);
      puVar6[7] = uVar9;
      uVar10 = *(undefined4 *)(param_2 + 0x18);
      puVar6[8] = uVar10;
      *puVar6 = uVar8;
      puVar6[1] = uVar9;
      puVar6[2] = uVar10;
      puVar6[3] = *(undefined4 *)(iVar3 + 0x18);
      puVar6[4] = *(undefined4 *)(iVar3 + 0x1c);
      puVar6[5] = *(undefined4 *)(iVar3 + 0x20);
      puVar6[10] = 0;
      *(undefined4 **)(param_1 + 0x3c) = puVar6;
      puVar6 = (undefined4 *)(*(int *)(param_1 + 0x54) + 0x1c);
    }
    else {
      uVar9 = *(undefined4 *)(puVar2 + 0x5c);
      uVar8 = FUN_002f69c4("magic_bean_points",0x11);
      FUN_00027588(uVar9,"magic_bean_points",uVar8,DAT_005f9624,0,1);
      uVar8 = FUN_0001cb08(DAT_005f9624,0,1,0);
      puVar6 = (undefined4 *)(*(int *)(param_1 + 0x54) + 0x20);
    }
    FUN_00074254(uVar8,*puVar6,param_2 + 0x10,0xffffffff);
  }
  if (*(int *)puVar1 == local_24) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

## FUN_00048b38 — 00048b38

- 函数名: FUN_00048b38
- 函数体: 857 字节
- 调用者数: 0 / 被调用者数: 11

```c

void FUN_00048b38(int param_1,undefined4 param_2)

{
  bool bVar1;
  undefined *puVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  int iVar5;
  float fVar6;
  byte bVar7;
  float fVar8;
  undefined8 in_d0;
  undefined4 extraout_s1;
  undefined8 uVar9;
  uint extraout_s3;
  longlong lVar10;
  undefined4 extraout_s3_00;
  undefined4 extraout_s5;
  float fVar11;
  undefined8 in_d3;
  undefined4 extraout_s7;
  undefined8 in_d4;
  undefined8 uVar12;
  undefined4 extraout_s9;
  undefined8 in_d5;
  undefined4 extraout_s11;
  undefined4 in_s13;
  undefined8 uVar13;
  undefined8 uVar14;
  undefined8 uVar15;
  undefined8 uVar16;
  undefined8 uVar17;
  undefined8 uVar18;
  undefined **local_50;
  undefined1 *local_4c;
  undefined4 local_48 [8];
  undefined1 local_28;
  int local_24;
  
  puVar2 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  if (*(int *)(param_1 + 0x88) == 0) {
    if (PTR_DAT_004d9048[10] == '\0') {
      uVar3 = (undefined4)((ulonglong)in_d0 >> 0x20);
      fVar8 = *(float *)(param_1 + 0x94);
      uVar9 = FloatVectorAdd(CONCAT44(uVar3,fVar8),CONCAT44(param_2,param_2),2);
      fVar6 = (float)uVar9;
      uVar4 = (undefined4)((ulonglong)in_d3 >> 0x20);
      fVar11 = fVar6 / DAT_00048e94;
      *(float *)(param_1 + 0x94) = fVar6;
      uVar14 = 0;
      if (0.0 < fVar11) {
        uVar14 = CONCAT44(uVar4,fVar11);
      }
      uVar14 = FloatVectorSub(0x3f8000003f800000,uVar14,2,0x20);
      uVar14 = FloatVectorMult(uVar14,uVar14,2,0x20);
      uVar14 = FloatVectorSub(0x3f8000003f800000,uVar14,2,0x20);
      if (*(int *)(param_1 + 0x90) == 0) {
        uVar15 = FloatVectorMult(uVar14,CONCAT44((int)((ulonglong)in_d4 >> 0x20),DAT_00048ebc),2,
                                 0x20);
        uVar12 = FloatVectorMult(uVar14,0,2,0x20);
        uVar15 = FloatVectorAdd(CONCAT44(uVar3,*(undefined4 *)(param_1 + 0x80)),uVar15,2);
        uVar9 = FloatVectorSub(CONCAT44((int)((ulonglong)uVar9 >> 0x20),
                                        *(undefined4 *)(param_1 + 0x7c)),uVar12,2,0x20);
        uVar12 = FloatVectorSub(CONCAT44(uVar4,*(undefined4 *)(param_1 + 0x84)),uVar12,2,0x20);
        fVar8 = (float)uVar14;
        bVar1 = NAN(fVar8) || NAN(DAT_00048ec0);
        bVar7 = (byte)(((uint)(fVar8 < DAT_00048ec0) << 0x1f) >> 0x18) |
                (byte)(((uint)(fVar8 == DAT_00048ec0) << 0x1e) >> 0x18);
        *(int *)(param_1 + 8) = (int)uVar9;
        *(int *)(param_1 + 0xc) = (int)uVar15;
        *(int *)(param_1 + 0x10) = (int)uVar12;
      }
      else {
        uVar15 = FloatVectorAdd(uVar9,CONCAT44(uVar4,DAT_00048e98),2);
        uVar12 = FloatVectorMult(uVar15,0x4080000040800000,2,0x20);
        uVar15 = 0;
        if (0.0 < (float)uVar12) {
          uVar15 = uVar12;
        }
        uVar16 = FloatVectorMult(uVar15,uVar15,2,0x20);
        uVar17 = FloatVectorMult(uVar14,CONCAT44(in_s13,DAT_00048e9c),2,0x20);
        uVar14 = FloatVectorMult(uVar14,0,2,0x20);
        uVar13 = FloatVectorMult(uVar16,0,2,0x20);
        uVar16 = FloatVectorMult(uVar16,CONCAT44(in_s13,DAT_00048ea0),2,0x20);
        uVar18 = FloatVectorAdd(uVar14,CONCAT44((int)((ulonglong)in_d5 >> 0x20),
                                                *(undefined4 *)(param_1 + 0x84)),2);
        uVar12 = FloatVectorAdd(uVar14,CONCAT44((int)((ulonglong)uVar12 >> 0x20),
                                                *(undefined4 *)(param_1 + 0x7c)),2);
        uVar17 = FloatVectorAdd(uVar17,CONCAT44((int)((ulonglong)uVar15 >> 0x20),
                                                *(undefined4 *)(param_1 + 0x80)),2);
        uVar14 = FloatVectorAdd(uVar13,uVar18,2);
        uVar15 = FloatVectorAdd(uVar12,uVar16,2);
        uVar12 = FloatVectorAdd(uVar13,uVar17,2);
        *(int *)(param_1 + 8) = (int)uVar15;
        *(int *)(param_1 + 0xc) = (int)uVar12;
        *(int *)(param_1 + 0x10) = (int)uVar14;
        if ((int)((uint)(fVar6 < 0.5) << 0x1f) < 0) {
          uVar14 = FloatVectorAdd(uVar9,CONCAT44(0x3f000000,DAT_00048eb0),2);
          uVar3 = (undefined4)((ulonglong)uVar14 >> 0x20);
          fVar8 = (float)uVar14 / DAT_00048ea4;
          uVar14 = 0;
          if (0.0 < fVar8) {
            uVar14 = CONCAT44(uVar3,fVar8);
          }
          uVar14 = FloatVectorSub(0x3f8000003f800000,uVar14,2,0x20);
          uVar9 = FloatVectorMult(uVar14,CONCAT44(uVar3,DAT_00048eb4),2,0x20);
          *(int *)(param_1 + 0x98) = (int)uVar14;
          uVar9 = FPToFixed(uVar9,0,0,3,0x20);
          uVar3 = FUN_003010b8((int)uVar14,(int)uVar9);
          *(undefined4 *)(param_1 + 0x98) = uVar3;
        }
        else {
          lVar10 = 0x3f0000003f000000;
          if ((int)((uint)(fVar8 < 0.5) << 0x1f) < 0) {
            uVar3 = FUN_00033ca0();
            uVar4 = FUN_002f69c4("bonus_star_impact",0x11);
            iVar5 = FUN_00035a08(uVar3,uVar4,0,0);
            lVar10 = (ulonglong)extraout_s3 << 0x20;
            if (iVar5 != 0) {
              uVar9 = FloatVectorMult(CONCAT44(extraout_s9,DAT_0052bf00),0x4120000041200000,2,0x20);
              uVar15 = FloatVectorMult(CONCAT44(extraout_s11,DAT_0052bf08),0x4120000041200000,2,0x20
                                      );
              uVar14 = FloatVectorMult(CONCAT44(extraout_s5,DAT_0052bf04),0x4120000041200000,2,0x20)
              ;
              lVar10 = FloatVectorAdd(uVar9,CONCAT44(extraout_s3,*(undefined4 *)(param_1 + 8)),2);
              uVar9 = FloatVectorAdd(uVar15,CONCAT44(extraout_s7,*(undefined4 *)(param_1 + 0x10)),2)
              ;
              uVar14 = FloatVectorAdd(uVar14,CONCAT44(extraout_s1,*(undefined4 *)(param_1 + 0xc)),2)
              ;
              *(int *)(iVar5 + 8) = (int)lVar10;
              *(int *)(iVar5 + 0xc) = (int)uVar14;
              *(int *)(iVar5 + 0x10) = (int)uVar9;
            }
          }
          uVar14 = FloatVectorAdd(CONCAT44((int)((ulonglong)lVar10 >> 0x20),
                                           *(undefined4 *)(param_1 + 0x94)),0xbf000000bf000000,2);
          uVar3 = (undefined4)((ulonglong)uVar14 >> 0x20);
          fVar8 = (float)uVar14 / DAT_00048ea4;
          uVar14 = 0;
          if (0.0 < fVar8) {
            uVar14 = CONCAT44(uVar3,fVar8);
          }
          uVar9 = CONCAT44(uVar3,DAT_00048ea8);
          *(int *)(param_1 + 0x98) = (int)uVar14;
          uVar9 = FloatVectorMult(uVar14,uVar9,2,0x20);
          uVar9 = FPToFixed(uVar9,0,0,3,0x20);
          fVar8 = (float)FUN_003010b8((int)uVar14,(int)uVar9);
          fVar6 = (float)FUN_003010b8(0x5056);
          uVar14 = FloatVectorMult(CONCAT44(fVar6,fVar8 / fVar6),
                                   CONCAT44(extraout_s3_00,DAT_00048eac),2,0x20);
          *(int *)(param_1 + 0x98) = (int)uVar14;
        }
        fVar8 = *(float *)(param_1 + 0x94);
        if ((DAT_00048eb8 < fVar8) && (0 < *(int *)(param_1 + 0x8c))) {
          local_50 = &PTR_LAB_0052c0a8;
          local_4c = &FUN_00048a88_1;
          local_28 = 1;
          local_48[0] = 0;
          FUN_0001d9a0(&local_50,local_48);
          FUN_0001cab8(local_48);
          FUN_0001d964(local_48);
          FUN_0001cb08(*(undefined4 *)(param_1 + 0x90),0,0,0);
          FUN_00031290();
          FUN_000325f8();
          *(undefined4 *)(param_1 + 0x8c) = 0;
          fVar8 = *(float *)(param_1 + 0x94);
        }
        bVar1 = NAN(fVar8) || NAN(DAT_00048eac);
        bVar7 = (byte)(((uint)(fVar8 < DAT_00048eac) << 0x1f) >> 0x18) |
                (byte)(((uint)(fVar8 == DAT_00048eac) << 0x1e) >> 0x18);
      }
      if (!(bool)(bVar7 >> 6 & 1) && (bool)(bVar7 >> 7) == bVar1) {
        *(undefined1 *)(param_1 + 0x33) = 1;
      }
    }
  }
  else {
    *(undefined4 *)(param_1 + 0x8c) = *(undefined4 *)(*(int *)(param_1 + 0x88) + 0xc4);
  }
  if (*(int *)puVar2 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_000323b4 — 000323b4

- 函数名: FUN_000323b4
- 函数体: 439 字节
- 调用者数: 1 / 被调用者数: 10

```c

void FUN_000323b4(int param_1,undefined4 param_2)

{
  int iVar1;
  int iVar2;
  char *pcVar3;
  size_t sVar4;
  uint uVar5;
  int *piVar6;
  int iVar7;
  int iVar8;
  int local_3c;
  undefined4 local_38;
  undefined4 local_34;
  undefined4 local_30;
  float local_2c;
  double local_28;
  
  iVar1 = FUN_0030c328(param_2,"power");
  if (iVar1 != 0) {
    iVar8 = param_1 + 4;
    do {
      local_2c = 0.0;
      iVar2 = FUN_0030c718(iVar1,"time",&local_28);
      if (iVar2 == 0) {
        local_2c = (float)local_28;
      }
      pcVar3 = (char *)FUN_0030c660(iVar1,"name");
      sVar4 = _strlen(pcVar3);
      uVar5 = FUN_002f69c4(pcVar3,sVar4);
      iVar2 = iVar8;
      piVar6 = (int *)(param_1 + 8);
      while (iVar7 = *piVar6, iVar7 != 0) {
        piVar6 = (int *)(iVar7 + 0xc);
        if (uVar5 <= *(uint *)(iVar7 + 0x10)) {
          piVar6 = (int *)(iVar7 + 8);
          iVar2 = iVar7;
        }
      }
      if (iVar2 != iVar8) {
        if (uVar5 < *(uint *)(iVar2 + 0x10)) {
          iVar2 = iVar8;
        }
        if (iVar2 != iVar8) {
          iVar2 = *(int *)(iVar2 + 0x14);
          if (*(float *)(iVar2 + 0xa0) <= 0.0) {
            if (*(char *)(iVar2 + 0x91) == '\0') goto LAB_0003249a;
          }
          else if (((*(char *)(iVar2 + 0x91) == '\0') && (*(int *)(iVar2 + 0x94) != 0)) &&
                  (*(int *)(*(int *)(iVar2 + 0x94) + 4) != 0)) {
LAB_0003249a:
            local_38 = DAT_0052bfe0;
            local_34 = DAT_0052bfe4;
            local_30 = DAT_0052bfe8;
            iVar2 = FUN_00031d68(param_1,uVar5,&local_38,&local_2c);
            *(float *)(iVar2 + 0x9c) = local_2c;
            iVar7 = FUN_0030c718(iVar1,"totalTime",&local_28);
            if (iVar7 == 0) {
              local_2c = (float)local_28;
            }
            FUN_00031730(iVar2,local_2c);
            iVar7 = FUN_0030c718(iVar1,"osa",&local_28);
            if (iVar7 == 0) {
              local_2c = (float)local_28;
            }
            *(float *)(iVar2 + 0xa8) = local_2c;
            local_3c = -1;
            FUN_0030c6c0(local_2c,iVar1,"deferedPoints",&local_3c);
            if (-1 < local_3c) {
              FUN_0001cb08(local_3c,0,0,0);
            }
          }
        }
      }
      iVar1 = FUN_0030c3a0(iVar1,"power");
    } while (iVar1 != 0);
  }
  return;
}


```

## FUN_00048aa0 — 00048aa0

- 函数名: FUN_00048aa0
- 函数体: 151 字节
- 调用者数: 0 / 被调用者数: 6

```c

void FUN_00048aa0(int param_1)

{
  undefined *puVar1;
  undefined **local_40;
  undefined1 *local_3c;
  undefined1 local_20;
  int local_1c;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_1c = *(int *)PTR____stack_chk_guard_004d9044;
  if ((*(int *)(param_1 + 0x88) == 0) && (0 < *(int *)(param_1 + 0x8c))) {
    local_20 = 1;
    local_40 = (undefined **)0x0;
    FUN_0001d964(&local_40);
    local_20 = 0;
    local_40 = &PTR_LAB_0052c0a8;
    local_3c = &FUN_00048a88_1;
    FUN_0001cab8(&local_40);
    FUN_0001d964(&local_40);
    FUN_0001cb08(*(undefined4 *)(param_1 + 0x90),0,0,0);
    FUN_00031290();
    FUN_000325f8();
    *(undefined4 *)(param_1 + 0x8c) = 0;
  }
  if (*(int *)puVar1 != local_1c) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0000342c — 0000342c

- 函数名: FUN_0000342c
- 函数体: 197 字节
- 调用者数: 13 / 被调用者数: 3

```c

undefined * FUN_0000342c(void)

{
  undefined4 *puVar1;
  int iVar2;
  int iVar3;
  
  if (((DAT_005556b8 & 1) == 0) && (iVar2 = ___cxa_guard_acquire(&DAT_005556b8), iVar2 != 0)) {
    DAT_0055575c = 0;
    DAT_00555768 = 0;
    DAT_00555758 = 0;
    DAT_00555760 = &DAT_00555758;
    DAT_00555764 = &DAT_00555758;
    iVar2 = 0;
    do {
      iVar3 = iVar2 + 0x18;
      *(undefined4 *)((int)&DAT_00555774 + iVar2) = 0;
      *(undefined4 *)((int)&DAT_00555778 + iVar2) = 0;
      *(undefined4 *)((int)&DAT_0055577c + iVar2) = 0;
      *(undefined4 *)((int)&DAT_00555780 + iVar2) = 0;
      puVar1 = (undefined4 *)((int)&DAT_00555770 + iVar2);
      *puVar1 = 0;
      *(undefined4 **)((int)&DAT_00555778 + iVar2) = puVar1;
      *(undefined4 **)((int)&DAT_0055577c + iVar2) = puVar1;
      iVar2 = iVar3;
    } while (iVar3 != 0x120);
    DAT_0055588c = 0;
    DAT_00555890 = 0;
    DAT_00555894 = 0;
    DAT_0055589c = 0;
    DAT_005558a0 = 0;
    DAT_005558ac = 0;
    DAT_005558a4 = &DAT_0055589c;
    DAT_005558a8 = &DAT_0055589c;
    ___cxa_atexit(&FUN_000034f4_1,&DAT_00555754,PTR___mh_execute_header_004d9040);
    ___cxa_guard_release(&DAT_005556b8);
  }
  return &DAT_00555754;
}


```

## FUN_000042b4 — 000042b4

- 函数名: FUN_000042b4
- 函数体: 215 字节
- 调用者数: 1 / 被调用者数: 4

```c

undefined4 FUN_000042b4(int param_1,int param_2,undefined4 *param_3)

{
  undefined *puVar1;
  _Rb_tree_node_base *p_Var2;
  uint uVar3;
  int iVar4;
  undefined4 uVar5;
  int iVar6;
  _Rb_tree_node_base *p_Var7;
  uint uVar8;
  int iVar9;
  undefined4 *puVar10;
  int iVar11;
  _Rb_tree_node_base *local_24;
  
  puVar1 = PTR_DAT_004d9048;
  local_24 = *(_Rb_tree_node_base **)(param_1 + 0xcc);
  p_Var2 = (_Rb_tree_node_base *)(param_1 + 0xc4);
  if (local_24 == p_Var2) {
    return 0;
  }
  uVar5 = 0;
  do {
    while ((p_Var7 = local_24, param_2 < *(int *)(*(int *)(local_24 + 0x14) + 0x8c) ||
           (uVar8 = *(uint *)(*(int *)(local_24 + 0x14) + 0x9c),
           uVar3 = FUN_000254c0(*(undefined4 *)(puVar1 + 0x10)), (uVar3 & uVar8) == 0))) {
LAB_00004362:
      local_24 = (_Rb_tree_node_base *)std::_Rb_tree_increment(p_Var7);
      if (local_24 == p_Var2) {
        return uVar5;
      }
    }
    iVar6 = *(int *)(p_Var7 + 0x14);
    if (*(int *)(iVar6 + 0xa8) != 0) {
      if (0 < param_2) {
        iVar11 = *(int *)(*(int *)(iVar6 + 0xa8) + 8);
        iVar9 = 0;
        iVar6 = param_2;
        puVar10 = param_3;
        do {
          iVar4 = FUN_0000ab90(*puVar10);
          if (iVar4 == iVar11) {
            iVar9 = iVar9 + 1;
          }
          iVar6 = iVar6 + -1;
          puVar10 = puVar10 + 1;
        } while (iVar6 != 0);
        if (iVar9 != 0) {
          iVar6 = *(int *)(p_Var7 + 0x14);
          goto LAB_00004336;
        }
      }
      goto LAB_00004362;
    }
LAB_00004336:
    if (((*(char *)(iVar6 + 0xa0) != '\0') &&
        (((iVar9 = *(int *)(puVar1 + 0x19c), iVar9 == 0 || (param_2 < 3)) ||
         (0.0 < *(float *)(iVar9 + 0x7c))))) ||
       (iVar6 = FUN_00003d6c(param_1,iVar6,&local_24), p_Var7 = local_24, iVar6 == 0))
    goto LAB_00004362;
    uVar5 = 1;
    if (local_24 == p_Var2) {
      return 1;
    }
  } while( true );
}


```

## FUN_0002c450 — 0002c450

- 函数名: FUN_0002c450
- 函数体: 95 字节
- 调用者数: 2 / 被调用者数: 3

```c

undefined4 * FUN_0002c450(void)

{
  int iVar1;
  
  if (((DAT_00557da4 & 1) == 0) && (iVar1 = ___cxa_guard_acquire(&DAT_00557da4), iVar1 != 0)) {
    DAT_00557dc0 = 0;
    DAT_00557dbc = 0;
    DAT_00557db8 = 0;
    DAT_00557dc4 = &DAT_00557dc4;
    DAT_00557dc8 = &DAT_00557dc4;
    DAT_00557dcc = 0;
    DAT_00557dd0 = 0;
    DAT_00557dd4 = 0;
    ___cxa_atexit(&FUN_0002c41c_1,&DAT_00557db8,PTR___mh_execute_header_004d9040);
    ___cxa_guard_release(&DAT_00557da4);
  }
  return &DAT_00557db8;
}


```

## FUN_0002ca24 — 0002ca24

- 函数名: FUN_0002ca24
- 函数体: 219 字节
- 调用者数: 1 / 被调用者数: 5

```c

void FUN_0002ca24(int param_1,int param_2)

{
  undefined *puVar1;
  undefined4 uVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  undefined4 uVar6;
  
  puVar1 = PTR_DAT_004d9048;
  uVar6 = *(undefined4 *)(PTR_DAT_004d9048 + 0x5c);
  uVar2 = FUN_002f69c4("combo_bonus",0xb);
  iVar5 = param_2 + -3;
  if (iVar5 < 1) {
    iVar3 = *(int *)(param_1 + 0x14);
    iVar4 = 0;
  }
  else {
    iVar3 = *(int *)(param_1 + 0x14);
    iVar4 = (*(int *)(param_1 + 0x18) - iVar3 >> 2) + -1;
    if (iVar5 < iVar4) {
      iVar4 = iVar5;
    }
  }
  FUN_00027588(uVar6,"combo_bonus",uVar2,*(undefined4 *)(iVar3 + iVar4 * 4),0,0);
  if (((DAT_00557dac & 1) == 0) && (iVar5 = ___cxa_guard_acquire(&DAT_00557dac), iVar5 != 0)) {
    DAT_00557da8 = FUN_002f69c4("best_combo",10);
    ___cxa_guard_release(&DAT_00557dac);
  }
  iVar5 = FUN_00027508(*(undefined4 *)(puVar1 + 0x5c),DAT_00557da8);
  param_2 = param_2 - iVar5;
  if (param_2 < 0) {
    param_2 = 0;
  }
  FUN_00027588(*(undefined4 *)(puVar1 + 0x5c),"best_combo",DAT_00557da8,param_2,0,0);
  return;
}


```

## FUN_000254b0 — 000254b0

- 函数名: FUN_000254b0
- 函数体: 15 字节
- 调用者数: 6 / 被调用者数: 0

```c

undefined4 FUN_000254b0(int param_1)

{
  return *(undefined4 *)(&DAT_0052c324 + param_1 * 4);
}


```

## FUN_0000aae0 — 0000aae0

- 函数名: FUN_0000aae0
- 函数体: 175 字节
- 调用者数: 22 / 被调用者数: 3

```c

uint FUN_0000aae0(char *param_1,int param_2)

{
  int *piVar1;
  char cVar2;
  longlong lVar3;
  uint uVar4;
  size_t sVar5;
  int iVar6;
  uint uVar7;
  int *piVar8;
  uint uVar9;
  
  cVar2 = '\0';
  if (param_1 != (char *)0x0) {
    cVar2 = *param_1;
  }
  if (param_1 == (char *)0x0 || cVar2 == '\0') {
LAB_0000ab3c:
    uVar7 = 0xffffffff;
    if (param_2 == 1) {
      iVar6 = FUN_00052f80(0xffffffff);
      uVar4 = DAT_005d4cd0;
      uVar7 = *(uint *)(iVar6 + 8);
      lVar3 = (ulonglong)uVar7 * (ulonglong)*(uint *)(iVar6 + 0x10);
      uVar9 = (uint)lVar3;
      *(uint *)(iVar6 + 8) = uVar9 + *(uint *)(iVar6 + 0x18);
      uVar7 = *(int *)(iVar6 + 0xc) * *(uint *)(iVar6 + 0x10) +
              uVar7 * *(int *)(iVar6 + 0x14) + (int)((ulonglong)lVar3 >> 0x20) +
              *(int *)(iVar6 + 0x1c) + (uint)CARRY4(uVar9,*(uint *)(iVar6 + 0x18));
      *(uint *)(iVar6 + 0xc) = uVar7;
      if (uVar4 < 2) {
        return uVar7;
      }
      uVar7 = (uint)((ulonglong)uVar7 * (ulonglong)(uVar4 - 1) >> 0x20);
    }
  }
  else {
    sVar5 = _strlen(param_1);
    iVar6 = FUN_002f69c4(param_1,sVar5);
    piVar8 = (int *)(DAT_005d4cdc + 0x250);
    uVar4 = 0;
    do {
      uVar7 = uVar4;
      if ((int)DAT_005d4cd0 <= (int)uVar7) goto LAB_0000ab3c;
      if (*piVar8 == iVar6) {
        return uVar7;
      }
      piVar1 = piVar8 + 1;
      piVar8 = piVar8 + 0xce;
      uVar4 = uVar7 + 1;
    } while (*piVar1 != iVar6);
  }
  return uVar7;
}


```

## FUN_0002e030 — 0002e030

- 函数名: FUN_0002e030
- 函数体: 859 字节
- 调用者数: 1 / 被调用者数: 3

```c

int FUN_0002e030(int *param_1,uint param_2,int *param_3)

{
  int *piVar1;
  bool bVar2;
  bool bVar3;
  uint uVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  uint uVar9;
  uint uVar10;
  
  uVar9 = 0;
  bVar3 = true;
  iVar8 = 0;
  DAT_00557e44 = 0;
  if (0 < (int)param_2) {
    iVar7 = 0;
    uVar4 = 0;
    uVar10 = uVar9;
    do {
      if ((int)uVar10 < 1) {
LAB_0002e0b2:
        (&DAT_00557e4c)[uVar10 * 2] = param_1[uVar4];
        uVar9 = uVar10 + 1;
        (&DAT_00557e50)[uVar10 * 2] = 1;
        DAT_00557e44 = uVar9;
        if (iVar7 == 0) {
          iVar8 = param_1[uVar4];
          iVar7 = 1;
        }
      }
      else {
        bVar2 = false;
        iVar5 = 0;
        do {
          if ((&DAT_00557e4c)[iVar5 * 2] == param_1[uVar4]) {
            iVar6 = (&DAT_00557e50)[iVar5 * 2] + 1;
            (&DAT_00557e50)[iVar5 * 2] = iVar6;
            if (iVar7 < iVar6) {
              iVar8 = param_1[uVar4];
              iVar7 = iVar6;
            }
            bVar2 = true;
            bVar3 = (bool)(bVar3 & uVar10 - 1 == iVar5);
          }
          iVar5 = iVar5 + 1;
        } while (iVar5 < (int)uVar10);
        uVar9 = uVar10;
        if (!bVar2) goto LAB_0002e0b2;
      }
      uVar4 = uVar4 + 1;
      uVar10 = uVar9;
    } while (uVar4 != param_2);
  }
  if (param_3 != (int *)0x0) {
    *param_3 = iVar8;
    uVar9 = DAT_00557e44;
  }
  if (uVar9 == 3) {
    if (param_2 == 5) {
      iVar8 = DAT_00557e50;
      if (DAT_00557e50 != 2) {
        iVar8 = DAT_00557e58;
      }
      if (DAT_00557e50 == 2 || iVar8 == 2) {
        return 0x15;
      }
    }
LAB_0002e308:
    if ((uVar9 == param_2) && (4 < (int)param_2)) {
      return 4;
    }
LAB_0002e31a:
    if ((int)uVar9 < 2) goto LAB_0002e36e;
  }
  else {
    if (uVar9 != 2) {
      if (uVar9 != 1) goto LAB_0002e308;
      iVar8 = 0;
      if ((DAT_00557e48 & 1) == 0) {
        iVar7 = ___cxa_guard_acquire(&DAT_00557e48);
        iVar8 = 0;
        if (iVar7 != 0) {
          DAT_00557f04 = FUN_0000aae0("apple",0);
          DAT_00557f08 = 6;
          DAT_00557f0c = FUN_0000aae0("apple_red",0);
          DAT_00557f10 = 6;
          DAT_00557f14 = FUN_0000aae0("orange",0);
          DAT_00557f18 = 7;
          DAT_00557f1c = FUN_0000aae0("pineapple",0);
          DAT_00557f20 = 8;
          DAT_00557f24 = FUN_0000aae0("watermelon",0);
          DAT_00557f28 = 9;
          DAT_00557f2c = FUN_0000aae0("kiwi",0);
          DAT_00557f30 = 10;
          DAT_00557f34 = FUN_0000aae0("mango",0);
          DAT_00557f38 = 0xb;
          DAT_00557f3c = FUN_0000aae0("strawberry",0);
          DAT_00557f40 = 0xc;
          DAT_00557f44 = FUN_0000aae0("pear",0);
          DAT_00557f48 = 0xd;
          DAT_00557f4c = FUN_0000aae0("banana",0);
          DAT_00557f50 = 0xe;
          DAT_00557f54 = FUN_0000aae0("lime",0);
          DAT_00557f58 = 0xf;
          DAT_00557f5c = FUN_0000aae0("lemon",0);
          DAT_00557f60 = 0x10;
          DAT_00557f64 = FUN_0000aae0("coconut",0);
          DAT_00557f68 = 0x11;
          DAT_00557f6c = FUN_0000aae0("passionfruit",0);
          DAT_00557f70 = 0x12;
          DAT_00557f74 = 0;
          DAT_00557f78 = 0;
          DAT_00557f7c = 0;
          DAT_00557f80 = 0;
          ___cxa_guard_release(&DAT_00557e48);
        }
      }
      while (uVar9 = DAT_00557e44, iVar8 < 0x10) {
        iVar5 = iVar8 + 1;
        iVar7 = iVar8 * 2;
        iVar8 = iVar5;
        if (*param_1 == (&DAT_00557f04)[iVar7]) {
          return (&DAT_00557f00)[iVar5 * 2];
        }
      }
      goto LAB_0002e31a;
    }
    if (!bVar3) {
      uVar9 = 0;
      do {
        if ((int)param_2 <= (int)uVar9) {
          return 0x18;
        }
        iVar8 = DAT_00557e54;
        if ((uVar9 & 1) == 0) {
          iVar8 = DAT_00557e4c;
        }
        piVar1 = param_1 + uVar9;
        uVar9 = uVar9 + 1;
      } while (*piVar1 == iVar8);
    }
    uVar9 = 2;
    if (param_2 == 5) {
      if (DAT_00557e50 == 2) {
        return 0x14;
      }
      uVar9 = 2;
      if (DAT_00557e58 == 2) {
        return 0x14;
      }
    }
  }
  iVar8 = -1;
  iVar7 = 0;
  do {
    iVar5 = iVar7 * 2;
    iVar7 = iVar7 + 1;
    if ((&DAT_00557e50)[iVar5] == 3 && iVar8 == -1) {
      iVar8 = 0x16;
    }
    if ((&DAT_00557e50)[iVar5] == 4 && iVar8 < 0x17) {
      iVar8 = 0x17;
    }
  } while (iVar7 < (int)uVar9);
  if (iVar8 != -1) {
    return iVar8;
  }
LAB_0002e36e:
  iVar8 = 5;
  if (param_2 < 7) {
    iVar8 = *(int *)(&DAT_00471250 + param_2 * 4);
  }
  return iVar8;
}


```

