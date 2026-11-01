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

## FUN_0001f8a0 — 0001f8a0

- 函数名: FUN_0001f8a0
- 函数体: 95 字节
- 调用者数: 1 / 被调用者数: 2

```c

void FUN_0001f8a0(float param_1)

{
  undefined *puVar1;
  float fVar2;
  
  puVar1 = PTR_DAT_004d9048;
  fVar2 = *(float *)(PTR_DAT_004d9048 + 0x24);
  if ((1.5 < param_1) && (fVar2 <= 1.5)) {
    FUN_00020698(0,0);
    fVar2 = *(float *)(puVar1 + 0x24);
  }
  if (fVar2 <= 0.0) {
    return;
  }
  if ((int)((uint)(fVar2 < DAT_0001f900) << 0x1f) < 0) {
    FUN_00020980();
  }
  return;
}


```

## FUN_0002504c — 0002504c

- 函数名: FUN_0002504c
- 函数体: 277 字节
- 调用者数: 1 / 被调用者数: 5

```c

void FUN_0002504c(void)

{
  undefined4 *puVar1;
  undefined *puVar2;
  undefined4 uVar3;
  void *pvVar4;
  undefined4 uVar5;
  
  puVar2 = PTR_DAT_004d9048;
  uVar5 = *(undefined4 *)(PTR_DAT_004d9048 + 0x5c);
  uVar3 = FUN_002f69c4("sessions",8);
  FUN_00027588(uVar5,"sessions",uVar3,1,1,1);
  *(undefined4 *)(puVar2 + 0x1ac) = 0;
  puVar2[9] = 2;
  uVar3 = FUN_00025164();
  *(undefined4 *)(puVar2 + 0xac) = uVar3;
  *(undefined4 *)(puVar2 + 0xb0) = 0x43a00000;
  *(undefined4 *)(puVar2 + 0xbc) = uVar3;
  *(undefined4 *)(puVar2 + 0xc0) = 0x43a00000;
  *(undefined4 *)(puVar2 + 0xb4) = uVar3;
  *(undefined4 *)(puVar2 + 0xb8) = 0x43a00000;
  puVar2[0x1bf] = 0;
  puVar2[0x1a] = 0;
  *(undefined4 *)(puVar2 + 0x94) = 0x42480000;
  *(undefined4 *)(puVar2 + 0x24) = 0;
  *(undefined4 *)(puVar2 + 0x3c) = 0;
  *(undefined4 *)(puVar2 + 0x40) = *(undefined4 *)(*(int *)(puVar2 + 0x5c) + 0x100);
  puVar2[0x19] = 0;
  puVar2[0x18] = 0;
  puVar2[0xab] = 0;
  *(undefined4 *)(puVar2 + 0x1c8) = 0;
  puVar2[0x1be] = 0;
  puVar2[0x1c4] = 0;
  puVar2[0x29] = 1;
  puVar2[0x2a] = 1;
  puVar2[0x17] = 1;
  *(undefined4 *)(puVar2 + 0x18c) = 0;
  *(undefined4 *)(puVar2 + 0x30) = 0;
  *(undefined4 *)(puVar2 + 0x34) = 0;
  *(undefined4 *)(puVar2 + 0x38) = 0;
  puVar2[0x1bc] = 0;
  puVar2[0x5d0] = 0;
  *(undefined4 *)(puVar2 + 0x5d4) = 0;
  puVar2[0x1bd] = 1;
  puVar2[0x15] = 0;
  puVar2[0x5d1] = 0;
  pvVar4 = operator_new(0x18);
  *(undefined4 *)((int)pvVar4 + 8) = 0;
  *(undefined4 *)((int)pvVar4 + 0xc) = 0;
  *(undefined4 *)((int)pvVar4 + 0x10) = 0;
  *(undefined4 *)((int)pvVar4 + 0x14) = 0;
  puVar1 = (undefined4 *)((int)pvVar4 + 4);
  *puVar1 = 0;
  *(undefined4 **)((int)pvVar4 + 0xc) = puVar1;
  *(undefined4 **)((int)pvVar4 + 0x10) = puVar1;
  *(void **)(puVar2 + 0x654) = pvVar4;
  FUN_00025a48(pvVar4,0);
  *(undefined4 *)((int)pvVar4 + 8) = 0;
  *(undefined4 **)((int)pvVar4 + 0xc) = puVar1;
  *(undefined4 **)((int)pvVar4 + 0x10) = puVar1;
  *(undefined4 *)((int)pvVar4 + 0x14) = 0;
  return;
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

## FUN_00020d8c — 00020d8c

- 函数名: FUN_00020d8c
- 函数体: 223 字节
- 调用者数: 1 / 被调用者数: 3

```c

void FUN_00020d8c(undefined4 *param_1)

{
  undefined *puVar1;
  undefined *puVar2;
  undefined4 uVar3;
  undefined **local_48;
  undefined *local_44;
  undefined1 local_28;
  int local_24;
  
  puVar2 = PTR_DAT_004d9048;
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  if ((DAT_005577e0 == 0) || (*(int *)(DAT_005577e0 + 0xd4) != 1)) {
    local_28 = 1;
    local_48 = (undefined **)0x0;
    uVar3 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
    FUN_0000a298(&local_48);
    local_28 = 0;
    local_48 = &PTR_LAB_0052bf38;
    local_44 = PTR_FUN_004d9058;
    FUN_0002bb34(uVar3,"menu-bomb",0x3f800000,0x3f800000,&local_48,0);
    FUN_0000a298(&local_48);
    *(undefined4 *)(puVar2 + 0x24) = 0x40000000;
    DAT_00557804 = *param_1;
    DAT_00557808 = param_1[1];
    DAT_0055780c = param_1[2];
    DAT_005577b0 = 1;
  }
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_000213e4 — 000213e4

- 函数名: FUN_000213e4
- 函数体: 319 字节
- 调用者数: 1 / 被调用者数: 13

```c

void FUN_000213e4(int param_1,float param_2,undefined4 param_3,undefined4 param_4)

{
  undefined *puVar1;
  undefined *puVar2;
  int iVar3;
  undefined4 uVar4;
  float fVar5;
  undefined1 auStack_5c [40];
  int local_34;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_34 = *(int *)PTR____stack_chk_guard_004d9044;
  iVar3 = FUN_0001cd48();
  puVar2 = PTR_DAT_004d9048;
  if (iVar3 == 1) {
    *(undefined4 *)(*(int *)(PTR_DAT_004d9048 + 0x5c) + 0xfc) = 0;
    if (*(int *)(puVar2 + 0x19c) != 0) {
      *(undefined4 *)(*(int *)(puVar2 + 0x19c) + 0x7c) = 0;
    }
  }
  fVar5 = (float)FUN_00040ebc(DAT_005577e0);
  puVar2 = PTR_DAT_004d9048;
  *(undefined4 *)(PTR_DAT_004d9048 + 0x20) = param_3;
  *(undefined4 *)(puVar2 + 0x24) = param_4;
  puVar2[0x17] = 0;
  if ((param_1 < 0) || (fVar5 = param_2, param_2 <= -1.0)) {
    FUN_0001d130(fVar5,puVar2);
    FUN_0001d154(puVar2);
    if (*(int *)(puVar2 + 0x10) == 0) {
      uVar4 = FUN_0001ccec(puVar2);
      FUN_0007106c(uVar4,*(undefined4 *)(*(int *)(puVar2 + 0x5c) + 0x108),
                   *(undefined4 *)(*(int *)(puVar2 + 0x5c) + 0x10c));
      iVar3 = FUN_0001ccec(puVar2);
      iVar3 = *(int *)(iVar3 + 4);
      if (iVar3 != 0) {
        FUN_0030f7cc(auStack_5c,"@backgroundControl");
        iVar3 = FUN_0039725c(iVar3,auStack_5c);
        FUN_0030f7e0(auStack_5c);
        if (iVar3 != 0) {
          FUN_0007c97c(iVar3);
        }
      }
    }
  }
  else {
    FUN_000209b8(param_1);
  }
  DAT_005577b0 = 0;
  FUN_0003ea08(*(undefined4 *)(puVar2 + 0x4c));
  if (*(int *)puVar1 != local_34) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0001702c — 0001702c

- 函数名: FUN_0001702c
- 函数体: 3363 字节
- 调用者数: 1 / 被调用者数: 8

```c

void FUN_0001702c(int param_1,float param_2)

{
  byte bVar1;
  undefined *puVar2;
  undefined *puVar3;
  undefined4 uVar4;
  int iVar5;
  uint uVar6;
  uint uVar7;
  byte *pbVar8;
  byte *pbVar9;
  int iVar10;
  float fVar11;
  float fVar12;
  uint uVar13;
  float *pfVar14;
  int iVar15;
  int iVar16;
  uint uVar17;
  int iVar18;
  int iVar19;
  undefined4 *puVar20;
  undefined4 *puVar21;
  int iVar22;
  int iVar23;
  int iVar24;
  char cVar25;
  bool bVar26;
  undefined8 in_d0;
  undefined4 extraout_s1;
  longlong lVar27;
  uint extraout_s1_00;
  uint extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined4 extraout_s1_03;
  undefined8 in_d1;
  undefined8 uVar28;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  longlong lVar29;
  uint extraout_s3_01;
  uint extraout_s3_02;
  undefined4 extraout_s3_03;
  undefined4 uVar30;
  undefined8 uVar31;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  undefined4 extraout_s5_01;
  undefined4 extraout_s5_02;
  undefined8 uVar32;
  undefined8 uVar33;
  undefined8 uVar34;
  undefined4 extraout_s7;
  undefined4 in_s9;
  undefined4 extraout_s9;
  undefined4 extraout_s9_00;
  undefined4 extraout_s9_01;
  undefined4 extraout_s9_02;
  float fVar35;
  undefined8 in_d5;
  undefined8 extraout_d5;
  undefined8 extraout_d5_00;
  undefined8 extraout_d5_01;
  undefined4 extraout_s11;
  undefined8 uVar36;
  longlong lVar37;
  longlong lVar38;
  float fVar39;
  undefined8 unaff_d11;
  float fVar40;
  undefined8 unaff_d12;
  undefined8 uVar41;
  undefined8 uVar42;
  int local_25c;
  int local_244;
  undefined4 local_240;
  undefined4 local_23c;
  undefined4 local_238;
  undefined4 local_234;
  undefined4 local_230;
  undefined4 local_22c;
  float local_228 [100];
  undefined4 local_98;
  undefined4 local_94;
  undefined4 local_90;
  undefined4 local_8c;
  undefined4 local_88;
  undefined4 local_84;
  undefined4 local_80;
  undefined4 local_7c;
  undefined4 local_78;
  undefined4 local_74;
  undefined4 local_70;
  undefined4 local_6c;
  undefined1 local_68;
  undefined1 local_67;
  undefined1 local_66;
  undefined1 local_65;
  int local_64;
  
  puVar3 = PTR_DAT_004d9048;
  puVar2 = PTR____stack_chk_guard_004d9044;
  uVar36 = CONCAT44(param_2,param_2);
  local_64 = *(int *)PTR____stack_chk_guard_004d9044;
  if ((param_2 == 0.0) &&
     (in_d0 = CONCAT44((int)((ulonglong)in_d0 >> 0x20),*(float *)(PTR_DAT_004d9048 + 0x24)),
     0.0 < *(float *)(PTR_DAT_004d9048 + 0x24))) {
    if (*(char *)(param_1 + 0xa4) != '\0') {
      uVar4 = *(undefined4 *)PTR_DAT_004d90b8;
      local_68 = (undefined1)uVar4;
      local_67 = (undefined1)((uint)uVar4 >> 8);
      local_66 = (undefined1)((uint)uVar4 >> 0x10);
      local_65 = (undefined1)((uint)uVar4 >> 0x18);
      iVar5 = *(int *)(param_1 + 0xb4);
      local_244 = 0;
      do {
        if (-1 < iVar5) {
          iVar19 = 0;
          iVar18 = 0x18;
          do {
            puVar21 = (undefined4 *)(*(int *)(param_1 + local_244 * 4 + 0xb8) + iVar18);
            uVar6 = FUN_0031048c(&local_68);
            uVar13 = (uVar6 & 0xffff) >> 8;
            uVar7 = (uVar6 & 0xffffff) >> 0x10;
            uVar36 = FixedToFP(CONCAT44(uVar6 >> 0x18,uVar6 >> 0x18),0,1,0,0x20);
            uVar28 = FixedToFP(CONCAT44(uVar6,uVar6) & 0xff000000ff,0,1,0,0x20);
            iVar18 = iVar18 + 0x30;
            iVar19 = iVar19 + 1;
            uVar32 = FixedToFP(CONCAT44(uVar7,uVar7),0,1,0,0x20);
            uVar31 = FixedToFP(CONCAT44(uVar13,uVar13),0,1,0,0x20);
            *puVar21 = (int)uVar32;
            puVar21[1] = (int)uVar31;
            puVar21[2] = (int)uVar28;
            puVar21[3] = (int)uVar36;
            iVar5 = *(int *)(param_1 + 0xb4);
          } while (iVar19 <= iVar5);
        }
        local_244 = local_244 + 1;
      } while (local_244 != 2);
    }
    *(undefined4 *)(param_1 + 0xf0) = 0xbf800000;
    goto LAB_00017c5a;
  }
  *(undefined2 *)(param_1 + 0x36) = *(undefined2 *)(param_1 + 0x52);
  iVar5 = *(int *)(param_1 + 0xb4);
  if ((iVar5 < 4) || (*(char *)(param_1 + 0x50) == '\0')) {
LAB_0001716a:
    *(undefined4 *)(param_1 + 0xf0) = 0xbf800000;
    *(undefined4 *)(param_1 + 0x4c) = 0xffffffff;
    *(undefined4 *)(param_1 + 0x48) = 0xffffffff;
  }
  else {
    iVar18 = *(int *)(param_1 + 0x48);
    bVar26 = iVar18 != -1;
    if (bVar26) {
      iVar18 = *(int *)(param_1 + 0x4c);
    }
    if (!bVar26 || iVar18 == -1) goto LAB_0001716a;
    local_80 = *(undefined4 *)(param_1 + 0xd8);
    local_7c = *(undefined4 *)(param_1 + 0xdc);
    local_78 = *(undefined4 *)(param_1 + 0xe0);
    FUN_000050f8(&local_74,*(undefined4 *)(puVar3 + 0x58),&local_80,1,0);
    local_98 = *(undefined4 *)(param_1 + 0xcc);
    local_94 = *(undefined4 *)(param_1 + 0xd0);
    local_90 = *(undefined4 *)(param_1 + 0xd4);
    FUN_000050f8(local_98,&local_8c,*(undefined4 *)(puVar3 + 0x58),&local_98,1,0);
    uVar31 = FloatVectorAdd(CONCAT44(extraout_s7,local_74),CONCAT44(extraout_s3_03,local_8c),2);
    in_d5 = CONCAT44(extraout_s11,local_6c);
    uVar28 = FloatVectorAdd(CONCAT44(extraout_s5_02,local_70),CONCAT44(extraout_s1_03,local_88),2);
    uVar32 = FloatVectorAdd(in_d5,CONCAT44(extraout_s9_02,local_84),2);
    in_d1 = FloatVectorMult(uVar31,0x3f0000003f000000,2,0x20);
    uVar31 = FloatVectorMult(uVar28,0x3f0000003f000000,2,0x20);
    uVar28 = FloatVectorMult(uVar32,0x3f0000003f000000,2,0x20);
    local_74 = (int)in_d1;
    local_70 = (undefined4)uVar31;
    local_6c = (int)uVar28;
    iVar5 = *(int *)(param_1 + 0x38);
    *(int *)(iVar5 + 4) = (int)in_d1;
    *(undefined4 *)(iVar5 + 8) = local_70;
    *(int *)(iVar5 + 0xc) = (int)uVar28;
    *(undefined4 *)(iVar5 + 0x14) = local_8c;
    *(undefined4 *)(iVar5 + 0x18) = local_88;
    *(undefined4 *)(iVar5 + 0x1c) = local_84;
    uVar32 = FloatVectorSub(in_d1,CONCAT44((int)((ulonglong)uVar28 >> 0x20),local_8c),2,0x20);
    uVar28 = FloatVectorSub(CONCAT44(extraout_s7,local_70),
                            CONCAT44((int)((ulonglong)uVar31 >> 0x20),local_88),2,0x20);
    uVar31 = FloatVectorMult(uVar32,uVar32,2,0x20);
    uVar28 = FloatVectorMult(uVar28,uVar28,2,0x20);
    in_d0 = FloatVectorAdd(uVar31,uVar28,2);
    *(int *)(param_1 + 0xf0) = (int)in_d0;
    iVar5 = *(int *)(param_1 + 0xb4);
    in_s9 = extraout_s9_02;
  }
  uVar4 = (undefined4)((ulonglong)in_d1 >> 0x20);
  if (iVar5 < 4) {
    *(undefined4 *)(param_1 + 0xc0) = DAT_0052bfe0;
    *(undefined4 *)(param_1 + 0xc4) = DAT_0052bfe4;
    *(undefined4 *)(param_1 + 200) = DAT_0052bfe8;
  }
  puVar3 = PTR_DAT_004d90b0;
  if (DAT_005d4d5c == 0) {
    DAT_005d4d18 = 0;
  }
  local_228[0] = 0.0;
  if (*(char *)(param_1 + 0x50) == '\0') {
    iVar18 = 0;
    local_25c = 0;
    if (0 < iVar5) goto LAB_000171da;
  }
  else {
    if (iVar5 < 3) goto LAB_00017c5a;
LAB_000171da:
    uVar28 = FloatVectorAdd(uVar36,uVar36,2);
    iVar19 = param_1 + 0xb8;
    pbVar8 = (byte *)(param_1 + 0x9c);
    pbVar9 = (byte *)(param_1 + 0xa0);
    iVar18 = 0;
    uVar6 = 0;
    local_25c = 0;
    do {
      pfVar14 = (float *)(*(int *)(param_1 + 0xb8) + uVar6 * 0x30);
      puVar21 = (undefined4 *)(*(int *)(param_1 + 0xb8) + (uVar6 | 1) * 0x30);
      fVar39 = *pfVar14;
      unaff_d11 = CONCAT44((int)((ulonglong)unaff_d11 >> 0x20),fVar39);
      fVar40 = pfVar14[1];
      unaff_d12 = CONCAT44((int)((ulonglong)unaff_d12 >> 0x20),fVar40);
      uVar32 = FloatVectorSub(unaff_d11,CONCAT44((int)((ulonglong)in_d1 >> 0x20),*puVar21),2,0x20);
      uVar31 = FloatVectorSub(unaff_d12,CONCAT44((int)((ulonglong)in_d0 >> 0x20),puVar21[1]),2,0x20)
      ;
      local_234 = (undefined4)uVar32;
      local_230 = (undefined4)uVar31;
      local_22c = 0;
      uVar4 = FUN_00009b50(local_230,&local_234);
      uVar31 = uVar28;
      if ((int)uVar6 < *(int *)(param_1 + 0xac) * 2) {
        uVar31 = CONCAT44((int)((ulonglong)uVar28 >> 0x20),param_2);
      }
      uVar32 = FloatVectorMult(uVar31,CONCAT44(extraout_s9,DAT_0001762c),2,0x20);
      in_d0 = CONCAT44(param_2,DAT_005d4d78);
      in_d1 = CONCAT44(extraout_s3,DAT_0052bfcc);
      uVar31 = FloatVectorSub(in_d1,in_d0,2,0x20);
      uVar32 = FloatVectorMult(uVar32,uVar31,2,0x20);
      uVar30 = (undefined4)((ulonglong)uVar32 >> 0x20);
      uVar31 = FloatVectorMult(in_d0,0x4110000041100000,2,0x20);
      uVar32 = FloatVectorAdd(CONCAT44(uVar4,uVar4),CONCAT44(uVar30,(float)uVar32 / DAT_0052bfc8),2)
      ;
      fVar35 = (float)uVar32;
      if (((DAT_005d4d78 < DAT_0052bfcc) &&
          (uVar33 = FloatVectorMult(uVar31,CONCAT44(uVar30,*(undefined4 *)(param_1 + 0xf4)),2,0x20),
          fVar35 <= (float)uVar33)) ||
         (((int)((uint)(DAT_0052bfcc < DAT_005d4d78) << 0x1f) < 0 && ((float)uVar31 <= fVar35)))) {
        local_25c = local_25c + 2;
        in_s9 = extraout_s9;
        in_d5 = extraout_d5;
      }
      else if ((*(int *)(param_1 + 0xb4) < 3) || (*(int *)(param_1 + 0xb4) <= (int)(uVar6 + 3))) {
        fVar11 = (float)FUN_003010d0(*(undefined2 *)(param_1 + 0x36));
        uVar33 = FloatVectorMult(uVar32,CONCAT44(fVar11,fVar11),2,0x20);
        fVar12 = (float)FUN_003010b8(*(undefined2 *)(param_1 + 0x36));
        iVar24 = 0;
        iVar5 = 0;
        uVar31 = FloatVectorMult(uVar32,CONCAT44(fVar12,fVar12),2,0x20);
        if ((int)((uint)((float)uVar33 < 0.0) << 0x1f) < 0) {
          iVar5 = -1;
        }
        iVar22 = 0;
        if ((int)((uint)(fVar39 < 0.0) << 0x1f) < 0) {
          iVar22 = -1;
        }
        iVar10 = uVar6 - local_25c;
        iVar23 = iVar10 + 1;
        do {
          iVar15 = *(int *)(iVar19 + iVar24 * 4);
          *(undefined4 *)(iVar15 + iVar23 * 0x30 + 0x28) = 0x3f7ae148;
          *(undefined4 *)(iVar15 + iVar10 * 0x30 + 0x28) = 0x3f7ae148;
          if (DAT_0052bfd8 == '\0') {
LAB_00017730:
            puVar21 = &DAT_00017d68;
            if (iVar24 != 0) {
              puVar21 = &DAT_00017d6c;
            }
            *(undefined4 *)(iVar15 + iVar23 * 0x30 + 0x2c) = *puVar21;
          }
          else {
            iVar15 = FUN_0001cd70();
            if (iVar15 == 1) {
              iVar15 = iVar22;
              if (0.0 < fVar39) {
                iVar15 = 1;
              }
              iVar16 = iVar5;
              if (0.0 < (float)uVar33) {
                iVar16 = 1;
              }
              if (iVar16 == iVar15) goto LAB_000176f6;
            }
            else {
LAB_000176f6:
              iVar15 = FUN_0001cd70();
              if (((float)uVar31 <= 0.0) || (iVar15 == 1)) {
                iVar15 = *(int *)(iVar19 + iVar24 * 4);
                goto LAB_00017730;
              }
            }
            puVar21 = &DAT_00017d60;
            iVar15 = *(int *)(iVar19 + iVar24 * 4);
            if (iVar24 != 0) {
              puVar21 = &DAT_00017d64;
            }
            *(undefined4 *)(iVar15 + iVar23 * 0x30 + 0x2c) = *puVar21;
          }
          uVar41 = uVar33;
          uVar32 = uVar31;
          if (iVar24 == 0) {
            uVar32 = CONCAT44((int)((ulonglong)uVar31 >> 0x20),-(fVar35 * fVar12));
            uVar41 = CONCAT44((int)((ulonglong)uVar33 >> 0x20),-(fVar35 * fVar11));
          }
          uVar32 = FloatVectorAdd(unaff_d12,uVar32,2);
          uVar41 = FloatVectorAdd(unaff_d11,uVar41,2);
          puVar21 = (undefined4 *)(iVar15 + iVar23 * 0x30);
          pfVar14 = (float *)(iVar15 + iVar10 * 0x30);
          *pfVar14 = fVar39;
          pfVar14[1] = fVar40;
          *puVar21 = (int)uVar41;
          puVar21[1] = (int)uVar32;
          iVar15 = *(int *)(param_1 + 0xb8) + iVar10 * 0x30;
          uVar7 = FUN_0031048c((int)uVar32,pbVar8);
          uVar17 = (uVar7 & 0xffff) >> 8;
          uVar13 = (uVar7 & 0xffffff) >> 0x10;
          uVar32 = FixedToFP(CONCAT44(uVar7 >> 0x18,uVar7 >> 0x18),0,1,0,0x20);
          uVar41 = FixedToFP(CONCAT44(uVar7,uVar7) & 0xff000000ff,0,1,0,0x20);
          uVar34 = FixedToFP(CONCAT44(uVar13,uVar13),0,1,0,0x20);
          uVar42 = FixedToFP(CONCAT44(uVar17,uVar17),0,1,0,0x20);
          *(int *)(iVar15 + 0x18) = (int)uVar34;
          *(int *)(iVar15 + 0x1c) = (int)uVar42;
          *(int *)(iVar15 + 0x20) = (int)uVar41;
          *(int *)(iVar15 + 0x24) = (int)uVar32;
          iVar15 = *(int *)(param_1 + 0xb8) + iVar23 * 0x30;
          uVar7 = FUN_0031048c((int)uVar32,pbVar8);
          uVar17 = (uVar7 & 0xffff) >> 8;
          uVar13 = (uVar7 & 0xffffff) >> 0x10;
          uVar32 = FixedToFP(CONCAT44(uVar7 >> 0x18,uVar7 >> 0x18),0,1,0,0x20);
          uVar41 = FixedToFP(CONCAT44(uVar7,uVar7) & 0xff000000ff,0,1,0,0x20);
          uVar34 = FixedToFP(CONCAT44(uVar13,uVar13),0,1,0,0x20);
          uVar42 = FixedToFP(CONCAT44(uVar17,uVar17),0,1,0,0x20);
          *(int *)(iVar15 + 0x18) = (int)uVar34;
          *(int *)(iVar15 + 0x1c) = (int)uVar42;
          *(int *)(iVar15 + 0x20) = (int)uVar41;
          *(int *)(iVar15 + 0x24) = (int)uVar32;
          iVar15 = *(int *)(param_1 + 0xbc) + iVar10 * 0x30;
          uVar7 = FUN_0031048c((int)uVar32,pbVar8);
          uVar17 = (uVar7 & 0xffff) >> 8;
          uVar13 = (uVar7 & 0xffffff) >> 0x10;
          uVar32 = FixedToFP(CONCAT44(uVar7 >> 0x18,uVar7 >> 0x18),0,1,0,0x20);
          uVar41 = FixedToFP(CONCAT44(uVar7,uVar7) & 0xff000000ff,0,1,0,0x20);
          uVar34 = FixedToFP(CONCAT44(uVar13,uVar13),0,1,0,0x20);
          uVar42 = FixedToFP(CONCAT44(uVar17,uVar17),0,1,0,0x20);
          *(int *)(iVar15 + 0x18) = (int)uVar34;
          *(int *)(iVar15 + 0x1c) = (int)uVar42;
          *(int *)(iVar15 + 0x20) = (int)uVar41;
          *(int *)(iVar15 + 0x24) = (int)uVar32;
          iVar15 = *(int *)(param_1 + 0xbc) + iVar23 * 0x30;
          uVar7 = FUN_0031048c((int)uVar32,pbVar8);
          iVar24 = iVar24 + 1;
          uVar17 = (uVar7 & 0xffff) >> 8;
          uVar13 = (uVar7 & 0xffffff) >> 0x10;
          in_d0 = FixedToFP(CONCAT44(uVar7 >> 0x18,uVar7 >> 0x18),0,1,0,0x20);
          in_d1 = FixedToFP(CONCAT44(uVar7,uVar7) & 0xff000000ff,0,1,0,0x20);
          uVar41 = FixedToFP(CONCAT44(uVar13,uVar13),0,1,0,0x20);
          uVar32 = FixedToFP(CONCAT44(uVar17,uVar17),0,1,0,0x20);
          *(int *)(iVar15 + 0x18) = (int)uVar41;
          *(int *)(iVar15 + 0x1c) = (int)uVar32;
          *(int *)(iVar15 + 0x20) = (int)in_d1;
          *(int *)(iVar15 + 0x24) = (int)in_d0;
          in_s9 = extraout_s9_00;
          in_d5 = extraout_d5_00;
        } while (iVar24 != 2);
      }
      else {
        iVar5 = *(int *)(param_1 + 0xb8) + uVar6 * 0x30;
        uVar33 = FloatVectorSub(CONCAT44(extraout_s3,*(undefined4 *)(iVar5 + 0x60)),unaff_d11,2,0x20
                               );
        uVar31 = FloatVectorSub(CONCAT44(param_2,*(undefined4 *)(iVar5 + 100)),unaff_d12,2,0x20);
        local_240 = (undefined4)uVar33;
        local_23c = (undefined4)uVar31;
        local_238 = 0;
        uVar4 = FUN_00009b50(local_23c,&local_240);
        uVar33 = CONCAT44(extraout_s5,local_238);
        iVar5 = iVar18 + 1;
        uVar31 = CONCAT44(extraout_s1,local_23c);
        uVar41 = FloatVectorMult(uVar33,0,2,0x20);
        uVar42 = FloatVectorSub(uVar41,CONCAT44(extraout_s3_00,local_240),2,0x20);
        uVar41 = FloatVectorSub(uVar31,uVar41,2,0x20);
        lVar37 = FloatVectorMult(uVar32,uVar42,2,0x20);
        if (0 < iVar5) {
          uVar31 = FloatVectorAdd(CONCAT44(uVar4,uVar4),CONCAT44(extraout_s1,local_228[iVar18]),2);
          local_228[iVar5] = (float)uVar31;
        }
        lVar38 = FloatVectorMult(uVar32,uVar41,2,0x20);
        iVar18 = 1;
        fVar35 = (float)lVar37;
        bVar1 = (byte)(((uint)(fVar35 == 0.0) << 0x1e) >> 0x18);
        cVar25 = -((char)((byte)(((uint)(fVar35 < 0.0) << 0x1f) >> 0x18) | bVar1) >> 7);
        if (((bool)(bVar1 >> 6) || (bool)cVar25 != NAN(fVar35)) && (iVar18 = 0, cVar25 != '\0')) {
          iVar18 = -1;
        }
        iVar24 = 0;
        if (*(char *)(param_1 + 0xa6) != iVar18) {
          *(float *)(param_1 + 0xa8) = param_2;
          uVar31 = uVar36;
        }
        uVar41 = FixedToFP(CONCAT44(iVar18,iVar18),0,0,0,0x20);
        uVar32 = FixedToFP(CONCAT44(uVar6,uVar6),0,0,0,0x20);
        iVar22 = 0;
        if ((int)((uint)(fVar39 < 0.0) << 0x1f) < 0) {
          iVar24 = -1;
        }
        iVar10 = uVar6 - local_25c;
        iVar23 = iVar10 + 1;
        do {
          uVar4 = (undefined4)((ulonglong)uVar33 >> 0x20);
          if (DAT_0052bfd8 == '\0') {
LAB_0001741e:
            lVar27 = lVar37;
            lVar29 = lVar38;
            if (iVar22 == 0) {
              lVar27 = FloatVectorNeg(lVar37,2,2);
              lVar29 = FloatVectorNeg(lVar38,2,2);
            }
          }
          else {
            if (*(float *)(param_1 + 0xa8) <= 0.0) goto LAB_0001741e;
            uVar31 = FloatVectorMult(uVar41,CONCAT44((int)((ulonglong)uVar31 >> 0x20),
                                                     *(float *)(param_1 + 0xa8) / DAT_00017630),2,
                                     0x20);
            uVar33 = FloatVectorMult(lVar38,uVar31,2,0x20);
            uVar31 = FloatVectorMult(lVar37,uVar31,2,0x20);
            lVar37 = FloatVectorNeg(uVar31,2,2);
            lVar38 = FloatVectorNeg(uVar33,2,2);
            lVar27 = lVar37;
            lVar29 = lVar38;
          }
          uVar31 = FloatVectorAdd(unaff_d12,lVar27,2);
          uVar42 = FloatVectorAdd(unaff_d11,lVar29,2);
          bVar26 = DAT_0052bfd8 == '\0';
          iVar15 = *(int *)(iVar19 + iVar22 * 4);
          pfVar14 = (float *)(iVar15 + iVar10 * 0x30);
          *pfVar14 = fVar39;
          pfVar14[1] = fVar40;
          if (bVar26) {
LAB_000174ce:
            uVar7 = (uint)((ulonglong)lVar29 >> 0x20);
            puVar21 = &DAT_00017d68;
            if (iVar22 != 0) {
              puVar21 = &DAT_00017d6c;
            }
            uVar13 = (uint)((ulonglong)lVar27 >> 0x20);
            *(undefined4 *)(iVar15 + iVar23 * 0x30 + 0x2c) = *puVar21;
          }
          else {
            iVar15 = FUN_0001cd70((int)lVar27);
            if (iVar15 == 1) {
              fVar35 = (float)lVar38;
              bVar1 = (byte)(((uint)(fVar35 == 0.0) << 0x1e) >> 0x18);
              iVar15 = 1;
              cVar25 = -((char)((byte)(((uint)(fVar35 < 0.0) << 0x1f) >> 0x18) | bVar1) >> 7);
              if (((bool)(bVar1 >> 6) || (bool)cVar25 != NAN(fVar35)) &&
                 (iVar15 = 0, cVar25 != '\0')) {
                iVar15 = -1;
              }
              iVar16 = iVar24;
              if (0.0 < fVar39) {
                iVar16 = 1;
              }
              uVar4 = extraout_s5_00;
              uVar7 = extraout_s3_01;
              uVar13 = extraout_s1_00;
              if (iVar15 == iVar16) goto LAB_0001748e;
            }
            else {
LAB_0001748e:
              iVar15 = FUN_0001cd70();
              lVar29 = (ulonglong)extraout_s3_02 << 0x20;
              lVar27 = (ulonglong)extraout_s1_01 << 0x20;
              uVar4 = extraout_s5_01;
              if (((float)lVar37 <= 0.0) ||
                 (uVar7 = extraout_s3_02, uVar13 = extraout_s1_01, iVar15 == 1)) {
                iVar15 = *(int *)(iVar19 + iVar22 * 4);
                goto LAB_000174ce;
              }
            }
            iVar15 = *(int *)(iVar19 + iVar22 * 4);
            puVar21 = &DAT_00017d60;
            if (iVar22 != 0) {
              puVar21 = &DAT_00017d64;
            }
            *(undefined4 *)(iVar15 + iVar23 * 0x30 + 0x2c) = *puVar21;
          }
          uVar33 = CONCAT44(uVar4,DAT_00017634);
          iVar22 = iVar22 + 1;
          puVar21 = (undefined4 *)(iVar15 + iVar23 * 0x30);
          *puVar21 = (int)uVar42;
          puVar21[1] = (int)uVar31;
          uVar31 = FixedToFP(CONCAT44(uVar13,*(undefined4 *)(param_1 + 0xb4)),0,0,0,0x20);
          uVar42 = FloatVectorMult(CONCAT44(uVar7,(float)uVar32 / (float)uVar31),uVar33,2,0x20);
          puVar21[10] = (int)uVar42;
          *(int *)(iVar15 + iVar10 * 0x30 + 0x28) = (int)uVar42;
        } while (iVar22 != 2);
        if (0.0 < *(float *)(param_1 + 0xa8)) {
          uVar32 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar42 >> 0x20),
                                           *(float *)(param_1 + 0xa8)),uVar36,2);
          bVar26 = DAT_00017630 <= (float)uVar32;
          *(float *)(param_1 + 0xa8) = (float)uVar32;
          if (bVar26) {
            *(undefined4 *)(param_1 + 0xa8) = 0;
          }
        }
        *(char *)(param_1 + 0xa6) = (char)iVar18;
        if (DAT_005d4d5c == 0) {
          FUN_00015814(pbVar9,-2.0 / (float)uVar31);
          if (*(float *)(param_1 + 0x98) <= 0.0) {
            *(undefined1 *)(param_1 + 0x9f) = *(undefined1 *)(param_1 + 0xa3);
            *(undefined1 *)(param_1 + 0x9e) = *(undefined1 *)(param_1 + 0xa2);
            *(undefined1 *)(param_1 + 0x9d) = *(undefined1 *)(param_1 + 0xa1);
            *pbVar8 = *pbVar9;
          }
          else {
            uVar32 = FloatVectorSub(0x3f8000003f800000,
                                    CONCAT44(extraout_s1_02,*(float *)(param_1 + 0x98)),2,0x20);
            bVar1 = puVar3[2];
            iVar18 = (uint)*(byte *)(param_1 + 0xa2) - (uint)bVar1;
            uVar33 = FixedToFP(CONCAT44(iVar18,iVar18),0,0,0,0x20);
            uVar31 = FixedToFP((ulonglong)CONCAT14(bVar1,(uint)bVar1),0,0,0,0x20);
            uVar33 = FloatVectorMult(uVar32,uVar33,2,0x20);
            uVar31 = FloatVectorAdd(uVar31,uVar33,2);
            uVar31 = FPToFixed(uVar31,0,0,3,0x20);
            *(char *)(param_1 + 0x9e) = (char)uVar31;
            bVar1 = puVar3[1];
            iVar18 = (uint)*(byte *)(param_1 + 0xa1) - (uint)bVar1;
            uVar31 = FixedToFP((ulonglong)CONCAT14(bVar1,(uint)bVar1),0,0,0,0x20);
            uVar33 = FixedToFP(CONCAT44(iVar18,iVar18),0,0,0,0x20);
            uVar33 = FloatVectorMult(uVar32,uVar33,2,0x20);
            uVar31 = FloatVectorAdd(uVar31,uVar33,2);
            uVar31 = FPToFixed(uVar31,0,0,3,0x20);
            *(char *)(param_1 + 0x9d) = (char)uVar31;
            bVar1 = *puVar3;
            iVar18 = (uint)*pbVar9 - (uint)bVar1;
            uVar33 = FixedToFP((ulonglong)CONCAT14(bVar1,(uint)bVar1),0,0,0,0x20);
            uVar31 = FixedToFP(CONCAT44(iVar18,iVar18),0,0,0,0x20);
            uVar31 = FloatVectorMult(uVar32,uVar31,2,0x20);
            uVar31 = FloatVectorAdd(uVar33,uVar31,2);
            uVar31 = FPToFixed(uVar31,0,0,3,0x20);
            *(char *)(param_1 + 0x9c) = (char)uVar31;
            *(undefined1 *)(param_1 + 0x9f) = 0xff;
          }
        }
        iVar18 = *(int *)(param_1 + 0xb8) + iVar10 * 0x30;
        uVar7 = FUN_0031048c(pbVar8);
        uVar17 = (uVar7 & 0xffff) >> 8;
        uVar13 = (uVar7 & 0xffffff) >> 0x10;
        uVar31 = FixedToFP(CONCAT44(uVar7 >> 0x18,uVar7 >> 0x18),0,1,0,0x20);
        uVar32 = FixedToFP(CONCAT44(uVar7,uVar7) & 0xff000000ff,0,1,0,0x20);
        uVar41 = FixedToFP(CONCAT44(uVar13,uVar13),0,1,0,0x20);
        uVar33 = FixedToFP(CONCAT44(uVar17,uVar17),0,1,0,0x20);
        *(int *)(iVar18 + 0x18) = (int)uVar41;
        *(int *)(iVar18 + 0x1c) = (int)uVar33;
        *(int *)(iVar18 + 0x20) = (int)uVar32;
        *(int *)(iVar18 + 0x24) = (int)uVar31;
        iVar18 = *(int *)(param_1 + 0xb8) + iVar23 * 0x30;
        uVar7 = FUN_0031048c((int)uVar31,pbVar8);
        uVar17 = (uVar7 & 0xffff) >> 8;
        uVar13 = (uVar7 & 0xffffff) >> 0x10;
        uVar31 = FixedToFP(CONCAT44(uVar7 >> 0x18,uVar7 >> 0x18),0,1,0,0x20);
        uVar32 = FixedToFP(CONCAT44(uVar7,uVar7) & 0xff000000ff,0,1,0,0x20);
        uVar41 = FixedToFP(CONCAT44(uVar13,uVar13),0,1,0,0x20);
        uVar33 = FixedToFP(CONCAT44(uVar17,uVar17),0,1,0,0x20);
        *(int *)(iVar18 + 0x18) = (int)uVar41;
        *(int *)(iVar18 + 0x1c) = (int)uVar33;
        *(int *)(iVar18 + 0x20) = (int)uVar32;
        *(int *)(iVar18 + 0x24) = (int)uVar31;
        iVar18 = *(int *)(param_1 + 0xbc) + iVar10 * 0x30;
        uVar7 = FUN_0031048c((int)uVar31,pbVar8);
        uVar17 = (uVar7 & 0xffff) >> 8;
        uVar13 = (uVar7 & 0xffffff) >> 0x10;
        uVar31 = FixedToFP(CONCAT44(uVar7 >> 0x18,uVar7 >> 0x18),0,1,0,0x20);
        uVar32 = FixedToFP(CONCAT44(uVar7,uVar7) & 0xff000000ff,0,1,0,0x20);
        uVar41 = FixedToFP(CONCAT44(uVar13,uVar13),0,1,0,0x20);
        uVar33 = FixedToFP(CONCAT44(uVar17,uVar17),0,1,0,0x20);
        *(int *)(iVar18 + 0x18) = (int)uVar41;
        *(int *)(iVar18 + 0x1c) = (int)uVar33;
        *(int *)(iVar18 + 0x20) = (int)uVar32;
        *(int *)(iVar18 + 0x24) = (int)uVar31;
        iVar18 = *(int *)(param_1 + 0xbc) + iVar23 * 0x30;
        uVar7 = FUN_0031048c((int)uVar31,pbVar8);
        uVar17 = (uVar7 & 0xffff) >> 8;
        uVar13 = (uVar7 & 0xffffff) >> 0x10;
        in_d0 = FixedToFP(CONCAT44(uVar7 >> 0x18,uVar7 >> 0x18),0,1,0,0x20);
        in_d1 = FixedToFP(CONCAT44(uVar7,uVar7) & 0xff000000ff,0,1,0,0x20);
        uVar32 = FixedToFP(CONCAT44(uVar13,uVar13),0,1,0,0x20);
        uVar31 = FixedToFP(CONCAT44(uVar17,uVar17),0,1,0,0x20);
        *(int *)(iVar18 + 0x18) = (int)uVar32;
        *(int *)(iVar18 + 0x1c) = (int)uVar31;
        *(int *)(iVar18 + 0x20) = (int)in_d1;
        *(int *)(iVar18 + 0x24) = (int)in_d0;
        iVar18 = iVar5;
        in_s9 = extraout_s9_01;
        in_d5 = extraout_d5_01;
      }
      uVar4 = (undefined4)((ulonglong)in_d1 >> 0x20);
      iVar5 = *(int *)(param_1 + 0xb4);
      uVar6 = uVar6 + 2;
    } while ((int)uVar6 < iVar5);
  }
  uVar36 = 0x3f8000003f800000;
  if (0.0 < DAT_005d4d7c) {
    uVar36 = CONCAT44(0x3f800000,local_228[iVar18] / DAT_005d4d7c);
  }
  uVar28 = CONCAT44(uVar4,DAT_00017d70);
  iVar19 = 0;
  do {
    if (0 < iVar5) {
      fVar39 = local_228[iVar18];
      iVar24 = 0;
      pfVar14 = (float *)(*(int *)(param_1 + iVar19 * 4 + 0xb8) + 0x58);
      do {
        iVar22 = iVar18;
        if (iVar24 / 2 < iVar18) {
          iVar22 = iVar24 / 2;
        }
        uVar31 = FloatVectorMult(CONCAT44((int)((ulonglong)in_d5 >> 0x20),local_228[iVar22]),uVar28,
                                 2,0x20);
        uVar31 = FloatVectorSub(0x3f8000003f800000,
                                CONCAT44((int)((ulonglong)uVar31 >> 0x20),(float)uVar31 / fVar39),2,
                                0x20);
        uVar31 = FloatVectorMult(uVar36,uVar31,2,0x20);
        in_d5 = FloatVectorSub(uVar28,uVar31,2,0x20);
        fVar35 = (float)in_d5;
        fVar40 = 0.0;
        if ((0.0 < fVar35) && (fVar40 = 1.0, fVar35 < 1.0)) {
          fVar40 = fVar35;
        }
        pfVar14[-0xc] = fVar40;
        iVar24 = iVar24 + 2;
        *pfVar14 = fVar40;
        pfVar14 = pfVar14 + 0x18;
      } while (iVar24 < iVar5);
    }
    iVar19 = iVar19 + 1;
  } while (iVar19 != 2);
  iVar5 = iVar5 - local_25c;
  *(int *)(param_1 + 0xb4) = iVar5;
  if (2 < iVar5) {
    iVar24 = iVar5 + -1;
    DAT_005573cc = DAT_005573cc + 1;
    iVar19 = *(int *)(param_1 + 0xb8);
    puVar21 = (undefined4 *)(iVar19 + iVar24 * 0x30);
    puVar20 = (undefined4 *)(iVar19 + iVar5 * 0x30);
    uVar32 = FloatVectorSub(CONCAT44((int)((ulonglong)in_d5 >> 0x20),puVar20[-0x16]),
                            CONCAT44(in_s9,puVar21[2]),2,0x20);
    uVar36 = CONCAT44((int)((ulonglong)uVar36 >> 0x20),puVar20[-0x17]);
    uVar28 = FloatVectorSub(CONCAT44(uVar4,puVar20[-0x18]),CONCAT44(0x3f800000,*puVar21),2,0x20);
    uVar31 = FloatVectorSub(uVar36,(ulonglong)(uint)puVar21[1],2,0x20);
    uVar32 = FloatVectorMult(uVar32,0,2,0x20);
    uVar31 = FloatVectorSub(uVar31,uVar32,2,0x20);
    uVar28 = FloatVectorSub(uVar32,uVar28,2,0x20);
    uVar32 = FloatVectorMult(uVar31,0x4020000040200000,2,0x20);
    uVar31 = FloatVectorMult(uVar28,0x4020000040200000,2,0x20);
    uVar28 = FloatVectorMult(CONCAT44(0x3f800000,DAT_0052bfd0),uVar32,2,0x20);
    uVar31 = FloatVectorMult(CONCAT44(0x3f800000,DAT_0052bfd0),uVar31,2,0x20);
    uVar30 = 0x3f000000;
    uVar28 = FloatVectorSub(CONCAT44(uVar4,puVar20[-0x18]),uVar28,2,0x20);
    uVar36 = FloatVectorSub(uVar36,uVar31,2,0x20);
    *puVar20 = (int)uVar28;
    puVar20[1] = (int)uVar36;
    iVar18 = param_1;
    if (DAT_0052bfd4 != '\0') {
      iVar18 = iVar19 + iVar24 * 0x30;
    }
    if (DAT_0052bfd4 != '\0') {
      uVar30 = *(undefined4 *)(iVar18 + 0x2c);
    }
    bVar26 = DAT_0052bfd4 != '\0';
    iVar22 = 0;
    puVar20[0xb] = uVar30;
    uVar4 = 0x3f000000;
    iVar10 = *(int *)(param_1 + 0xbc);
    puVar21 = (undefined4 *)(iVar10 + iVar5 * 0x30);
    *puVar21 = (int)uVar28;
    puVar21[1] = (int)uVar36;
    iVar18 = 0;
    if (bVar26) {
      iVar18 = iVar10 + iVar24 * 0x30;
    }
    if (bVar26) {
      uVar4 = *(undefined4 *)(iVar18 + 0x2c);
    }
    puVar21[0xb] = uVar4;
    while( true ) {
      iVar19 = iVar19 + iVar5 * 0x30;
      uVar6 = FUN_0031048c((int)uVar36,param_1 + 0x9c);
      uVar13 = (uVar6 & 0xffff) >> 8;
      uVar7 = (uVar6 & 0xffffff) >> 0x10;
      uVar36 = FixedToFP(CONCAT44(uVar6 >> 0x18,uVar6 >> 0x18),0,1,0,0x20);
      iVar18 = param_1 + iVar22 * 4;
      uVar28 = FixedToFP(CONCAT44(uVar6,uVar6) & 0xff000000ff,0,1,0,0x20);
      uVar32 = FixedToFP(CONCAT44(uVar7,uVar7),0,1,0,0x20);
      uVar31 = FixedToFP(CONCAT44(uVar13,uVar13),0,1,0,0x20);
      *(int *)(iVar19 + 0x18) = (int)uVar32;
      *(int *)(iVar19 + 0x1c) = (int)uVar31;
      *(int *)(iVar19 + 0x20) = (int)uVar28;
      *(int *)(iVar19 + 0x24) = (int)uVar36;
      iVar5 = *(int *)(param_1 + 0xb4);
      *(undefined4 *)(*(int *)(iVar18 + 0xb8) + iVar5 * 0x30 + 0x28) = 0x3f800000;
      if (iVar22 == 1) break;
      iVar22 = iVar22 + 1;
      iVar19 = *(int *)(iVar18 + 0xbc);
    }
  }
LAB_00017c5a:
  if (*(int *)puVar2 == local_64) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

## FUN_00020e70 — 00020e70

- 函数名: FUN_00020e70
- 函数体: 51 字节
- 调用者数: 1 / 被调用者数: 0

```c

bool FUN_00020e70(void)

{
  if (-1 < (int)((uint)(*(float *)(PTR_DAT_004d9048 + 0x24) < DAT_00020ea4) << 0x1f)) {
    return false;
  }
  return (int)((uint)(*(float *)(PTR_DAT_004d9048 + 0x24) < 1.0) << 0x1f) < 0;
}


```

## FUN_000161c4 — 000161c4

- 函数名: FUN_000161c4
- 函数体: 79 字节
- 调用者数: 1 / 被调用者数: 4

```c

void FUN_000161c4(undefined4 param_1)

{
  undefined4 uVar1;
  int iVar2;
  
  iVar2 = 0;
  do {
    FUN_0001a04c((int)&DAT_00557468 + iVar2,param_1);
    iVar2 = iVar2 + 0x10;
  } while (iVar2 != 0x80);
  if (DAT_005d4d5c == 1) {
    FUN_00015814(0,param_1);
  }
  uVar1 = FUN_0002ede8();
  FUN_000306cc(uVar1,DAT_005573b8);
  DAT_005573b8 = 0;
  return;
}


```

