# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0001f018 — 0001f018

- 函数名: FUN_0001f018
- 函数体: 2147 字节
- 调用者数: 0 / 被调用者数: 52

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

## FUN_00020c38 — 00020c38

- 函数名: FUN_00020c38
- 函数体: 339 字节
- 调用者数: 1 / 被调用者数: 9

```c

void FUN_00020c38(undefined4 *param_1)

{
  undefined *puVar1;
  undefined *puVar2;
  int iVar3;
  undefined4 uVar4;
  undefined **local_5c;
  undefined *local_58;
  undefined4 local_54 [8];
  undefined1 local_34;
  undefined4 local_30;
  undefined4 local_2c;
  undefined4 local_28;
  int local_24;
  
  puVar2 = PTR_DAT_004d9048;
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  if (PTR_DAT_004d9048[0x17] == '\0') {
    if (((DAT_005577f4 & 1) == 0) && (iVar3 = ___cxa_guard_acquire(&DAT_005577f4), iVar3 != 0)) {
      DAT_005577f0 = FUN_002f69c4("bomb",4);
      ___cxa_guard_release(&DAT_005577f4);
    }
    FUN_00027588(*(undefined4 *)(puVar2 + 0x5c),"bomb",DAT_005577f0,1,1,1);
    *(undefined4 *)(puVar2 + 0x24) = 0x404ccccd;
    local_30 = *param_1;
    local_2c = param_1[1];
    local_28 = param_1[2];
    FUN_0000577c(local_30,*(undefined4 *)(puVar2 + 0x58),&local_30,0x3fcccccd,0x40000000,0x41100000)
    ;
    DAT_00557804 = *param_1;
    DAT_00557808 = param_1[1];
    DAT_0055780c = param_1[2];
    uVar4 = *(undefined4 *)(puVar2 + 0x1a4);
    DAT_005577b0 = 0;
    local_5c = &PTR_LAB_0052bf38;
    local_58 = PTR_FUN_004d9058;
    local_34 = 1;
    local_54[0] = 0;
    FUN_0000a23c(&local_5c,local_54);
    FUN_0002bb34(uVar4,"Bomb-explode",0x3f800000,0x3f800000,local_54,0);
    FUN_0000a298(local_54);
  }
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_000708b8 — 000708b8

- 函数名: FUN_000708b8
- 函数体: 9 字节
- 调用者数: 1 / 被调用者数: 1

```c

void FUN_000708b8(void)

{
  FUN_000707cc();
  return;
}


```

## FUN_000707cc — 000707cc

- 函数名: FUN_000707cc
- 函数体: 235 字节
- 调用者数: 2 / 被调用者数: 15

```c

void FUN_000707cc(int param_1)

{
  byte bVar1;
  undefined *puVar2;
  int iVar3;
  undefined4 uVar4;
  uint uVar5;
  undefined4 uVar6;
  int iVar7;
  void *pvVar8;
  undefined4 local_24;
  
  pvVar8 = *(void **)(param_1 + 0x3c);
  if (pvVar8 != (void *)0x0) {
    FUN_00071d50(pvVar8);
    operator_delete(pvVar8);
    *(undefined4 *)(param_1 + 0x3c) = 0;
  }
  puVar2 = PTR_DAT_004d9048;
  iVar3 = FUN_000276e8(*(undefined4 *)(PTR_DAT_004d9048 + 0x5c),"bean");
  if (iVar3 == 0) {
    FUN_000274bc(*(undefined4 *)(puVar2 + 0x5c),"bean_game_consecutive_total",0,1,1);
  }
  local_24 = 0;
  uVar4 = FUN_000065c4();
  iVar3 = FUN_00006ad0(uVar4,1,&local_24);
  if (iVar3 != 0) {
    do {
      bVar1 = *(byte *)(iVar3 + 0x3c);
      uVar5 = FUN_0000aae0("bean",0);
      if (bVar1 == uVar5) {
        uVar4 = FUN_00033ca0();
        uVar6 = FUN_002f69c4("kiwifruit",9);
        iVar7 = FUN_00035a08(uVar4,uVar6,0,0);
        if (iVar7 != 0) {
          *(undefined4 *)(iVar7 + 8) = *(undefined4 *)(iVar3 + 0x10);
          *(undefined4 *)(iVar7 + 0xc) = *(undefined4 *)(iVar3 + 0x14);
          *(undefined4 *)(iVar7 + 0x10) = *(undefined4 *)(iVar3 + 0x18);
        }
        FUN_0000f2f8(iVar3,1);
      }
      uVar4 = FUN_000065c4();
      iVar3 = FUN_00006af0(uVar4,1,&local_24);
    } while (iVar3 != 0);
  }
  FUN_00052f80();
  FUN_00057ce0();
  FUN_000708c4(param_1);
  return;
}


```

## FUN_000708c4 — 000708c4

- 函数名: FUN_000708c4
- 函数体: 253 字节
- 调用者数: 2 / 被调用者数: 9

```c

void FUN_000708c4(int param_1)

{
  int iVar1;
  code *pcVar2;
  undefined4 uVar3;
  int *piVar4;
  undefined4 local_a4;
  undefined1 auStack_a0 [40];
  undefined1 auStack_78 [40];
  undefined1 auStack_50 [40];
  undefined1 local_28 [4];
  int local_24;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  piVar4 = *(int **)(param_1 + 4);
  pcVar2 = *(code **)(*piVar4 + 0x40);
  FUN_0030f7cc(auStack_50,"animate_out");
  (*pcVar2)(piVar4,auStack_50,1);
  FUN_0030f7e0(auStack_50);
  uVar3 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_78,"gameOverContainer");
  piVar4 = (int *)FUN_0039725c(uVar3,auStack_78);
  FUN_0030f7e0(auStack_78);
  if (piVar4 == (int *)0x0) {
    FUN_000209b8(0xffffffff,0xbf800000,0xffffffff);
  }
  else {
    local_28[0] = 1;
    FUN_0001da28(piVar4[0x98],local_28);
    pcVar2 = *(code **)(*piVar4 + 0x40);
    FUN_0030f7cc(auStack_a0,"game_over");
    (*pcVar2)(piVar4,auStack_a0,1);
    FUN_0030f7e0(auStack_a0);
    *(undefined4 *)(param_1 + 0x44) = 2;
    local_a4 = 0;
    uVar3 = FUN_000065c4();
    iVar1 = FUN_00006ad0(uVar3,2,&local_a4);
    while (iVar1 != 0) {
      *(undefined1 *)(iVar1 + 0x7d) = 0;
      uVar3 = FUN_000065c4();
      iVar1 = FUN_00006af0(uVar3,2,&local_a4);
    }
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

