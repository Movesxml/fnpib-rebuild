# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0000f2f8 — 0000f2f8

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

## FUN_0000f574 — 0000f574

- 函数名: FUN_0000f574
- 函数体: 341 字节
- 调用者数: 1 / 被调用者数: 5

```c

void FUN_0000f574(int param_1,undefined4 param_2)

{
  float fVar1;
  float fVar2;
  undefined *puVar3;
  int iVar4;
  undefined4 uVar5;
  undefined4 *puVar6;
  undefined4 extraout_s1;
  undefined4 uVar8;
  undefined8 uVar7;
  undefined4 extraout_s1_00;
  undefined4 extraout_s3;
  undefined4 uVar10;
  undefined8 uVar9;
  undefined4 extraout_s3_00;
  undefined4 extraout_s5;
  undefined4 uVar11;
  undefined4 extraout_s5_00;
  undefined4 extraout_s7;
  undefined4 extraout_s7_00;
  undefined4 extraout_s9;
  undefined4 uVar12;
  undefined4 extraout_s9_00;
  undefined8 extraout_d5;
  undefined8 extraout_d5_00;
  undefined4 extraout_s13;
  undefined4 uVar13;
  undefined4 extraout_s13_00;
  undefined4 extraout_s15;
  undefined4 uVar14;
  undefined4 extraout_s15_00;
  undefined8 unaff_d12;
  undefined8 uVar15;
  undefined8 uVar16;
  undefined8 uVar17;
  undefined8 uVar18;
  undefined4 local_44;
  
  puVar3 = PTR_DAT_004d9048;
  if (*(char *)(param_1 + 0x1bc) == '\0') {
    iVar4 = FUN_0001d10c(PTR_DAT_004d9048);
    if (iVar4 != 0) {
      FUN_0001d10c(puVar3);
      iVar4 = FUN_00063fe0(PTR_DAT_004d907c,*(undefined4 *)PTR_DAT_004d9098);
      if (iVar4 != 0) {
        return;
      }
    }
    local_44 = 0;
    uVar5 = FUN_000065c4();
    iVar4 = FUN_00006ad0(uVar5,2,&local_44);
    fVar2 = DAT_0000f6d0;
    fVar1 = DAT_0000f6cc;
    if (iVar4 != 0) {
      uVar5 = extraout_s7;
      uVar12 = extraout_s9;
      uVar16 = extraout_d5;
      uVar13 = extraout_s13;
      uVar14 = extraout_s15;
      uVar8 = extraout_s1;
      uVar10 = extraout_s3;
      uVar11 = extraout_s5;
      do {
        uVar7 = CONCAT44(uVar8,*(float *)(iVar4 + 0xc0));
        if ((*(float *)(iVar4 + 0xc0) <= 0.0) && (*(int *)(iVar4 + 0x38) != 0)) {
          unaff_d12 = CONCAT44((int)((ulonglong)unaff_d12 >> 0x20),*(undefined4 *)(iVar4 + 0x10));
          uVar9 = FloatVectorSub(unaff_d12,CONCAT44(uVar10,*(undefined4 *)(param_1 + 0x10)),2,0x20);
          uVar15 = FloatVectorSub(CONCAT44(uVar13,*(undefined4 *)(iVar4 + 0x14)),
                                  CONCAT44(uVar12,*(undefined4 *)(param_1 + 0x14)),2,0x20);
          uVar17 = FloatVectorSub(CONCAT44(uVar14,*(undefined4 *)(iVar4 + 0x18)),
                                  CONCAT44((int)((ulonglong)uVar16 >> 0x20),
                                           *(undefined4 *)(param_1 + 0x18)),2,0x20);
          uVar7 = CONCAT44(uVar8,*(undefined4 *)(iVar4 + 0x1c));
          uVar18 = FloatVectorMult(uVar9,uVar9,2,0x20);
          uVar16 = FloatVectorMult(uVar15,uVar15,2,0x20);
          uVar15 = FloatVectorMult(uVar17,uVar17,2,0x20);
          uVar16 = FloatVectorAdd(uVar18,uVar16,2);
          uVar16 = FloatVectorAdd(uVar16,uVar15,2);
          if ((int)((uint)((float)uVar16 < fVar1) << 0x1f) < 0) {
            uVar16 = FloatVectorSub(CONCAT44(uVar12,*(undefined4 *)(param_1 + 0x20)),
                                    CONCAT44(uVar5,*(undefined4 *)(iVar4 + 0x20)),2,0x20);
            uVar15 = FloatVectorSub(CONCAT44(uVar11,*(undefined4 *)(param_1 + 0x1c)),uVar7,2,0x20);
            uVar16 = FloatVectorMult(uVar16,uVar16,2,0x20);
            uVar15 = FloatVectorMult(uVar15,uVar15,2,0x20);
            uVar16 = FloatVectorAdd(uVar15,uVar16,2);
            if ((int)((uint)((float)uVar16 < fVar2) << 0x1f) < 0) {
              puVar6 = &DAT_0000f6d4;
              if ((int)((uint)((float)uVar9 < 0.0) << 0x1f) < 0) {
                puVar6 = &DAT_0000f6d8;
              }
              uVar16 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar9 >> 0x20),*puVar6),
                                       CONCAT44(param_2,param_2),2,0x20);
              uVar16 = FloatVectorMult(uVar16,0x4140000041400000,2,0x20);
              uVar7 = FloatVectorAdd(uVar16,uVar7,2);
              *(int *)(iVar4 + 0x1c) = (int)uVar7;
            }
          }
        }
        uVar5 = FUN_000065c4((int)uVar7);
        iVar4 = FUN_00006af0(uVar5,2,&local_44);
        uVar5 = extraout_s7_00;
        uVar12 = extraout_s9_00;
        uVar16 = extraout_d5_00;
        uVar13 = extraout_s13_00;
        uVar14 = extraout_s15_00;
        uVar8 = extraout_s1_00;
        uVar10 = extraout_s3_00;
        uVar11 = extraout_s5_00;
      } while (iVar4 != 0);
    }
  }
  return;
}


```

## FUN_0000f6dc — 0000f6dc

- 函数名: FUN_0000f6dc
- 函数体: 917 字节
- 调用者数: 1 / 被调用者数: 2

```c

bool FUN_0000f6dc(int param_1)

{
  char cVar1;
  char cVar2;
  bool bVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  bool bVar6;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined4 extraout_s1_03;
  undefined4 extraout_s1_04;
  undefined4 extraout_s1_05;
  undefined4 extraout_s1_06;
  undefined4 extraout_s1_07;
  undefined4 extraout_s1_08;
  undefined4 extraout_s1_09;
  undefined4 extraout_s1_10;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  undefined4 extraout_s3_01;
  undefined4 extraout_s3_02;
  undefined8 unaff_d8;
  float fVar7;
  undefined8 uVar8;
  undefined8 uVar9;
  undefined8 uVar10;
  
  bVar3 = false;
  cVar1 = *(char *)(param_1 + 0x1bc);
  if (((*(float *)(param_1 + 0xdc) == DAT_0052bfe0) &&
      (bVar3 = false, *(float *)(param_1 + 0xe0) == DAT_0052bfe4)) &&
     (*(float *)(param_1 + 0xe4) == DAT_0052bfe8)) {
    bVar3 = true;
  }
  cVar2 = cVar1;
  if (((*(char *)(param_1 + 0x1b8) != '\0') && (cVar1 == '\0')) &&
     (cVar2 = '\0', *(char *)(param_1 + 500) == '\0')) {
    return false;
  }
  if (((*(char *)(param_1 + 0xc1) != '\0') || (*(char *)(param_1 + 0xc2) != '\0')) &&
     (bVar6 = cVar2 == '\0', cVar2 = '\0', bVar6)) {
    return false;
  }
  if (cVar1 == '\0') {
    if ((int)((uint)(*(float *)(param_1 + 0xe0) < 0.0) << 0x1f) < 0 || bVar3) {
      fVar7 = *(float *)(param_1 + 0x14);
      uVar4 = FUN_000251a8();
      uVar8 = FloatVectorMult(CONCAT44(extraout_s3,*(undefined4 *)(param_1 + 0x2c)),
                              CONCAT44(extraout_s1_07,DAT_0000fa74),2,0x20);
      uVar10 = FloatVectorMult(CONCAT44(uVar4,uVar4),0x3f0000003f000000,2,0x20);
      uVar8 = FloatVectorAdd(uVar10,uVar8,2);
      uVar8 = FloatVectorNeg(uVar8,2,2);
      if ((fVar7 <= (float)uVar8) && ((int)((uint)(*(float *)(param_1 + 0x20) < 0.0) << 0x1f) < 0))
      {
        return true;
      }
    }
    if (0.0 < *(float *)(param_1 + 0xe0) || bVar3) {
      fVar7 = *(float *)(param_1 + 0x14);
      uVar4 = FUN_000251a8();
      uVar8 = FloatVectorMult(CONCAT44(extraout_s3_00,*(undefined4 *)(param_1 + 0x2c)),
                              CONCAT44(extraout_s1_08,DAT_0000fa74),2,0x20);
      uVar10 = FloatVectorMult(CONCAT44(uVar4,uVar4),0x3f0000003f000000,2,0x20);
      uVar8 = FloatVectorAdd(uVar10,uVar8,2);
      if (((float)uVar8 <= fVar7) && (0.0 < *(float *)(param_1 + 0x20))) {
        return true;
      }
    }
    if ((int)((uint)(*(float *)(param_1 + 0xdc) < 0.0) << 0x1f) < 0 || bVar3) {
      fVar7 = *(float *)(param_1 + 0x10);
      uVar4 = FUN_00025164();
      uVar8 = FloatVectorMult(CONCAT44(extraout_s3_01,*(undefined4 *)(param_1 + 0x2c)),
                              CONCAT44(extraout_s1_09,DAT_0000fa74),2,0x20);
      uVar10 = FloatVectorMult(CONCAT44(uVar4,uVar4),0x3f0000003f000000,2,0x20);
      uVar8 = FloatVectorAdd(uVar10,uVar8,2);
      uVar8 = FloatVectorNeg(uVar8,2,2);
      if ((fVar7 <= (float)uVar8) && ((int)((uint)(*(float *)(param_1 + 0x1c) < 0.0) << 0x1f) < 0))
      {
        return true;
      }
    }
    if (0.0 < *(float *)(param_1 + 0xdc) || bVar3) {
      fVar7 = *(float *)(param_1 + 0x10);
      uVar4 = FUN_00025164();
      uVar8 = FloatVectorMult(CONCAT44(extraout_s3_02,*(undefined4 *)(param_1 + 0x2c)),
                              CONCAT44(extraout_s1_10,DAT_0000fa74),2,0x20);
      uVar10 = FloatVectorMult(CONCAT44(uVar4,uVar4),0x3f0000003f000000,2,0x20);
      uVar8 = FloatVectorAdd(uVar10,uVar8,2);
      if (((float)uVar8 <= fVar7) && (0.0 < *(float *)(param_1 + 0x1c))) {
        return true;
      }
    }
LAB_0000fa62:
    bVar3 = false;
  }
  else {
    fVar7 = *(float *)(param_1 + 0x14);
    uVar4 = FUN_000251a8(cVar2);
    uVar10 = CONCAT44((int)((ulonglong)unaff_d8 >> 0x20),DAT_0000fa74);
    uVar8 = FloatVectorMult(CONCAT44(extraout_s1,*(undefined4 *)(param_1 + 0x2c)),uVar10,2,0x20);
    uVar9 = FloatVectorMult(CONCAT44(uVar4,uVar4),0x3f0000003f000000,2,0x20);
    uVar8 = FloatVectorAdd(uVar9,uVar8,2);
    uVar8 = FloatVectorNeg(uVar8,2,2);
    if (fVar7 <= (float)uVar8) {
LAB_0000f7d8:
      fVar7 = *(float *)(param_1 + 0x120);
      uVar4 = FUN_000251a8();
      uVar8 = FloatVectorMult(CONCAT44(extraout_s1_01,*(undefined4 *)(param_1 + 0x2c)),uVar10,2,0x20
                             );
      uVar9 = FloatVectorMult(CONCAT44(uVar4,uVar4),0x3f0000003f000000,2,0x20);
      uVar8 = FloatVectorAdd(uVar9,uVar8,2);
      uVar8 = FloatVectorNeg(uVar8,2,2);
      if (fVar7 <= (float)uVar8) {
        return true;
      }
      fVar7 = *(float *)(param_1 + 0x120);
      uVar5 = FUN_000251a8(1);
      uVar4 = 1;
      uVar9 = FloatVectorMult(CONCAT44(extraout_s1_02,*(undefined4 *)(param_1 + 0x2c)),uVar10,2,0x20
                             );
      uVar8 = FloatVectorMult(CONCAT44(uVar5,uVar5),0x3f0000003f000000,2,0x20);
      uVar8 = FloatVectorAdd(uVar8,uVar9,2);
      if ((float)uVar8 <= fVar7) {
        return true;
      }
    }
    else {
      fVar7 = *(float *)(param_1 + 0x14);
      uVar4 = FUN_000251a8();
      uVar8 = FloatVectorMult(CONCAT44(extraout_s1_00,*(undefined4 *)(param_1 + 0x2c)),uVar10,2,0x20
                             );
      uVar9 = FloatVectorMult(CONCAT44(uVar4,uVar4),0x3f0000003f000000,2,0x20);
      uVar8 = FloatVectorAdd(uVar9,uVar8,2);
      if ((float)uVar8 <= fVar7) goto LAB_0000f7d8;
    }
    fVar7 = *(float *)(param_1 + 0x10);
    uVar4 = FUN_00025164(uVar4);
    uVar8 = FloatVectorMult(CONCAT44(extraout_s1_03,*(undefined4 *)(param_1 + 0x2c)),uVar10,2,0x20);
    uVar9 = FloatVectorMult(CONCAT44(uVar4,uVar4),0x3f0000003f000000,2,0x20);
    uVar8 = FloatVectorAdd(uVar9,uVar8,2);
    uVar8 = FloatVectorNeg(uVar8,2,2);
    if ((float)uVar8 < fVar7) {
      fVar7 = *(float *)(param_1 + 0x10);
      uVar4 = FUN_00025164();
      uVar8 = FloatVectorMult(CONCAT44(extraout_s1_04,*(undefined4 *)(param_1 + 0x2c)),uVar10,2,0x20
                             );
      uVar9 = FloatVectorMult(CONCAT44(uVar4,uVar4),0x3f0000003f000000,2,0x20);
      uVar8 = FloatVectorAdd(uVar9,uVar8,2);
      if (fVar7 < (float)uVar8) goto LAB_0000fa62;
    }
    fVar7 = *(float *)(param_1 + 0x11c);
    uVar4 = FUN_00025164();
    bVar3 = true;
    uVar8 = FloatVectorMult(CONCAT44(extraout_s1_05,*(undefined4 *)(param_1 + 0x2c)),uVar10,2,0x20);
    uVar9 = FloatVectorMult(CONCAT44(uVar4,uVar4),0x3f0000003f000000,2,0x20);
    uVar8 = FloatVectorAdd(uVar9,uVar8,2);
    uVar8 = FloatVectorNeg(uVar8,2,2);
    if ((float)uVar8 < fVar7) {
      fVar7 = *(float *)(param_1 + 0x11c);
      uVar4 = FUN_00025164(1);
      uVar10 = FloatVectorMult(CONCAT44(extraout_s1_06,*(undefined4 *)(param_1 + 0x2c)),uVar10,2,
                               0x20);
      uVar8 = FloatVectorMult(CONCAT44(uVar4,uVar4),0x3f0000003f000000,2,0x20);
      uVar8 = FloatVectorAdd(uVar8,uVar10,2);
      bVar3 = (float)uVar8 <= fVar7;
    }
  }
  return bVar3;
}


```

## FUN_0000fa78 — 0000fa78

- 函数名: FUN_0000fa78
- 函数体: 407 字节
- 调用者数: 2 / 被调用者数: 2

```c

bool FUN_0000fa78(int param_1)

{
  undefined4 uVar1;
  undefined4 uVar2;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined4 extraout_s1_03;
  undefined4 extraout_s1_04;
  undefined4 extraout_s1_05;
  undefined4 extraout_s1_06;
  undefined8 unaff_d8;
  float fVar3;
  undefined8 uVar4;
  undefined8 uVar5;
  undefined8 uVar6;
  
  uVar2 = (undefined4)((ulonglong)unaff_d8 >> 0x20);
  if ((*(float *)(param_1 + 0xe0) == 0.0) || (NAN(*(float *)(param_1 + 0xe0)))) {
    if (*(float *)(param_1 + 0xdc) == 0.0) {
      return false;
    }
    if (NAN(*(float *)(param_1 + 0xdc))) {
      return false;
    }
    fVar3 = *(float *)(param_1 + 0x10);
    uVar1 = FUN_00025164(0);
    uVar6 = CONCAT44(uVar2,DAT_0000fc10);
    uVar4 = FloatVectorMult(CONCAT44(extraout_s1_03,*(undefined4 *)(param_1 + 0x2c)),uVar6,2,0x20);
    uVar5 = FloatVectorMult(CONCAT44(uVar1,uVar1),0x3f0000003f000000,2,0x20);
    uVar4 = FloatVectorAdd(uVar5,uVar4,2);
    uVar4 = FloatVectorNeg(uVar4,2,2);
    if (-1 < (int)((uint)(fVar3 < (float)uVar4) << 0x1f)) {
      fVar3 = *(float *)(param_1 + 0x10);
      uVar2 = FUN_00025164();
      uVar4 = FloatVectorMult(CONCAT44(extraout_s1_04,*(undefined4 *)(param_1 + 0x2c)),uVar6,2,0x20)
      ;
      uVar5 = FloatVectorMult(CONCAT44(uVar2,uVar2),0x3f0000003f000000,2,0x20);
      uVar4 = FloatVectorAdd(uVar5,uVar4,2);
      if (fVar3 <= (float)uVar4) {
        fVar3 = *(float *)(param_1 + 0x11c);
        uVar2 = FUN_00025164();
        uVar4 = FloatVectorMult(CONCAT44(extraout_s1_05,*(undefined4 *)(param_1 + 0x2c)),uVar6,2,
                                0x20);
        uVar5 = FloatVectorMult(CONCAT44(uVar2,uVar2),0x3f0000003f000000,2,0x20);
        uVar4 = FloatVectorAdd(uVar5,uVar4,2);
        uVar4 = FloatVectorNeg(uVar4,2,2);
        if (-1 < (int)((uint)(fVar3 < (float)uVar4) << 0x1f)) {
          fVar3 = *(float *)(param_1 + 0x11c);
          uVar1 = FUN_00025164();
          uVar2 = extraout_s1_06;
          goto LAB_0000fbe8;
        }
      }
    }
  }
  else {
    fVar3 = *(float *)(param_1 + 0x14);
    uVar1 = FUN_000251a8();
    uVar6 = CONCAT44(uVar2,DAT_0000fc10);
    uVar4 = FloatVectorMult(CONCAT44(extraout_s1,*(undefined4 *)(param_1 + 0x2c)),uVar6,2,0x20);
    uVar5 = FloatVectorMult(CONCAT44(uVar1,uVar1),0x3f0000003f000000,2,0x20);
    uVar4 = FloatVectorAdd(uVar5,uVar4,2);
    uVar4 = FloatVectorNeg(uVar4,2,2);
    if (-1 < (int)((uint)(fVar3 < (float)uVar4) << 0x1f)) {
      fVar3 = *(float *)(param_1 + 0x14);
      uVar2 = FUN_000251a8();
      uVar4 = FloatVectorMult(CONCAT44(extraout_s1_00,*(undefined4 *)(param_1 + 0x2c)),uVar6,2,0x20)
      ;
      uVar5 = FloatVectorMult(CONCAT44(uVar2,uVar2),0x3f0000003f000000,2,0x20);
      uVar4 = FloatVectorAdd(uVar5,uVar4,2);
      if (fVar3 <= (float)uVar4) {
        fVar3 = *(float *)(param_1 + 0x120);
        uVar2 = FUN_000251a8();
        uVar4 = FloatVectorMult(CONCAT44(extraout_s1_01,*(undefined4 *)(param_1 + 0x2c)),uVar6,2,
                                0x20);
        uVar5 = FloatVectorMult(CONCAT44(uVar2,uVar2),0x3f0000003f000000,2,0x20);
        uVar4 = FloatVectorAdd(uVar5,uVar4,2);
        uVar4 = FloatVectorNeg(uVar4,2,2);
        if (-1 < (int)((uint)(fVar3 < (float)uVar4) << 0x1f)) {
          fVar3 = *(float *)(param_1 + 0x120);
          uVar1 = FUN_000251a8();
          uVar2 = extraout_s1_02;
LAB_0000fbe8:
          uVar6 = FloatVectorMult(CONCAT44(uVar2,*(undefined4 *)(param_1 + 0x2c)),uVar6,2,0x20);
          uVar4 = FloatVectorMult(CONCAT44(uVar1,uVar1),0x3f0000003f000000,2,0x20);
          uVar4 = FloatVectorAdd(uVar4,uVar6,2);
          return (float)uVar4 < fVar3;
        }
      }
    }
  }
  return true;
}


```

## FUN_0000fc14 — 0000fc14

- 函数名: FUN_0000fc14
- 函数体: 87 字节
- 调用者数: 1 / 被调用者数: 1

```c

undefined4 FUN_0000fc14(void)

{
  undefined4 uVar1;
  
  if (DAT_00556cf4 < 1) {
    if (DAT_00556cf8 < 1) {
      return 0;
    }
    uVar1 = 2;
  }
  else {
    if (DAT_00556cf8 < 1) {
      FUN_000209b8(0xffffffff,0xbf800000,1);
      return 1;
    }
    uVar1 = 0;
  }
  FUN_000209b8(0xffffffff,0xbf800000,uVar1);
  return 1;
}


```

## FUN_0000fc6c — 0000fc6c

- 函数名: FUN_0000fc6c
- 函数体: 706 字节
- 调用者数: 0 / 被调用者数: 4

```c

/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Removing unreachable block (ram,0x007cb56c) */
/* WARNING: Removing unreachable block (ram,0x0000ff18) */
/* WARNING: Removing unreachable block (ram,0x0000ff04) */
/* WARNING: Removing unreachable block (ram,0x0020b52c) */
/* WARNING: Removing unreachable block (ram,0x0020b53a) */
/* WARNING: Removing unreachable block (ram,0x0020b530) */
/* WARNING: Removing unreachable block (ram,0x0020b538) */

uint FUN_0000fc6c(int param_1,undefined4 param_2)

{
  undefined *puVar1;
  uint uVar2;
  int iVar3;
  undefined4 uVar4;
  int *piVar5;
  undefined4 *puVar6;
  int *unaff_r5;
  undefined4 unaff_r6;
  IFriendsService **unaff_r8;
  uint *unaff_r10;
  int *unaff_r11;
  undefined8 in_d0;
  undefined8 uVar7;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined8 in_d1;
  undefined8 uVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  float fVar11;
  float fVar12;
  undefined8 unaff_d9;
  undefined4 uVar13;
  undefined8 uVar14;
  undefined4 in_stack_00000008;
  uint in_stack_0000000c;
  
  uVar7 = CONCAT44((int)((ulonglong)in_d0 >> 0x20),DAT_0000ff34);
  uVar8 = FloatVectorMult(CONCAT44((int)((ulonglong)in_d1 >> 0x20),*(undefined4 *)(param_1 + 0x78)),
                          uVar7,2,0x20);
  *(int *)(param_1 + 0x78) = (int)uVar8;
  uVar8 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar8 >> 0x20),*(undefined4 *)(param_1 + 0x7c)),
                          uVar7,2,0x20);
  *(int *)(param_1 + 0x7c) = (int)uVar8;
  uVar7 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar8 >> 0x20),*(undefined4 *)(param_1 + 0x80)),
                          uVar7,2,0x20);
  *(int *)(param_1 + 0x80) = (int)uVar7;
  uVar2 = (uint)*(byte *)(param_1 + 0x1bc);
  if ((uVar2 == 0) && (*(float *)(param_1 + 0xd0) <= 0.0)) {
    uVar7 = CONCAT44(param_2,param_2);
    uVar2 = FUN_0001d10c(PTR_DAT_004d9048);
    puVar1 = PTR_DAT_004d907c;
    if (*(float *)(param_1 + 0xdc) == 0.0) {
      if (uVar2 != 0) {
        iVar3 = FUN_00063fe0(PTR_DAT_004d907c,*(undefined4 *)PTR_DAT_004d9064);
        if (iVar3 == 1) {
          uVar9 = *(undefined4 *)(param_1 + 0x10);
          uVar13 = (undefined4)((ulonglong)unaff_d9 >> 0x20);
          uVar10 = *(undefined4 *)(*(int *)(param_1 + 0x38) + 0x14);
          uVar4 = FUN_00025164();
          uVar8 = FloatVectorMult(CONCAT44(uVar4,uVar4),0xbf000000bf000000,2,0x20);
          uVar7 = FloatVectorSub(CONCAT44(param_2,uVar9),CONCAT44(uVar13,uVar10),2,0x20);
          uVar8 = FloatVectorAdd(uVar8,0xc1b00000c1b00000,2);
          if ((int)((uint)((float)uVar7 < (float)uVar8) << 0x1f) < 0) {
            uVar7 = FloatVectorNeg(CONCAT44((int)((ulonglong)uVar7 >> 0x20),
                                            *(undefined4 *)(param_1 + 0x1c)),2,2);
            *(int *)(param_1 + 0x1c) = (int)uVar7;
          }
          uVar4 = *(undefined4 *)(param_1 + 0x10);
          uVar9 = *(undefined4 *)(*(int *)(param_1 + 0x38) + 0x14);
          uVar2 = FUN_00025164((int)uVar7);
          uVar8 = FloatVectorMult(CONCAT44(uVar2,uVar2),0x3f0000003f000000,2,0x20);
          uVar7 = FloatVectorAdd(CONCAT44(param_2,uVar4),CONCAT44(uVar13,uVar9),2);
          uVar8 = FloatVectorAdd(uVar8,0x41b0000041b00000,2);
          if ((float)uVar7 <= (float)uVar8) {
            return uVar2;
          }
          uVar7 = FloatVectorNeg(CONCAT44((int)((ulonglong)uVar7 >> 0x20),
                                          *(undefined4 *)(param_1 + 0x1c)),2,2);
          uVar7 = FloatVectorNeg(uVar7,2,2);
          *(int *)(param_1 + 0x1c) = (int)uVar7;
          return uVar2;
        }
        uVar2 = FUN_00063fe0(puVar1,*(undefined4 *)PTR_DAT_004d909c);
        if (uVar2 != 0) {
          return uVar2;
        }
        uVar2 = FUN_00063fe0(puVar1,*(undefined4 *)PTR_DAT_004d905c);
        if (uVar2 != 0) {
          return uVar2;
        }
        uVar2 = FUN_00063fe0(puVar1,*(undefined4 *)PTR_DAT_004d906c);
        unaff_r5 = (int *)puVar1;
        if (uVar2 != 0) {
          return uVar2;
        }
      }
      fVar11 = *(float *)(param_1 + 0x10);
      uVar4 = FUN_00025164();
      uVar8 = FloatVectorMult(CONCAT44(uVar4,uVar4),CONCAT44(extraout_s1_01,DAT_0000ff38),2,0x20);
      if ((int)((uint)(fVar11 < (float)uVar8) << 0x1f) < 0) {
        uVar7 = FloatVectorMult(uVar7,0x4180000041800000,2,0x20);
        uVar7 = FloatVectorAdd(uVar7,CONCAT44((int)((ulonglong)uVar8 >> 0x20),
                                              *(undefined4 *)(param_1 + 0x1c)),2);
        *(int *)(param_1 + 0x1c) = (int)uVar7;
        uVar8 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar7 >> 0x20),
                                        *(undefined4 *)(param_1 + 0x78)),0x41a0000041a00000,2);
        *(int *)(param_1 + 0x78) = (int)uVar8;
      }
      fVar12 = *(float *)(param_1 + 0x10);
      uVar8 = FUN_00025164((int)uVar8);
      uVar2 = (uint)uVar8;
      uVar7 = FloatVectorMult(CONCAT44(uVar2,uVar2),CONCAT44(extraout_s1_02,DAT_0000ff3c),2,0x20);
      fVar11 = (float)uVar7;
      if ((fVar12 != fVar11 && fVar11 <= fVar12) && (fVar12 == fVar11)) {
        FUN_0030fb10(uVar2,(int)((ulonglong)uVar8 >> 0x20));
        Mortar::IFriendsServiceAggregate::GetServiceName();
        FUN_0030f978(unaff_r6,PTR_s_serviceName_004d9764);
        piVar5 = (int *)(**(code **)(*unaff_r5 + 0x18))(unaff_r5);
        if (*piVar5 != 1) {
          FUN_0030fb10(&stack0xffffffe0,"/");
          uVar4 = (**(code **)(*unaff_r5 + 0x18))(unaff_r5);
          FUN_0030f978(&stack0xffffffe0,uVar4);
        }
        iVar3 = std::
                _Rb_tree<Mortar::AsciiString,std::pair<Mortar::AsciiString_const,Mortar::IService*>,std::_Select1st<std::pair<Mortar::AsciiString_const,Mortar::IService*>>,std::less<Mortar::AsciiString>,std::allocator<std::pair<Mortar::AsciiString_const,Mortar::IService*>>>
                ::find((AsciiString *)(*unaff_r11 + 0x40));
        if (iVar3 == *unaff_r11 + 0x44) {
          std::vector<Mortar::IFriendsService*,std::allocator<Mortar::IFriendsService*>>::push_back
                    (unaff_r8);
          puVar6 = (undefined4 *)
                   std::
                   map<Mortar::AsciiString,Mortar::IService*,std::less<Mortar::AsciiString>,std::allocator<std::pair<Mortar::AsciiString_const,Mortar::IService*>>>
                   ::operator[]((AsciiString *)(*unaff_r11 + 0x40));
          *puVar6 = in_stack_00000008;
        }
        FUN_0030f7e0(&stack0xffffffe0);
        if (*unaff_r10 == in_stack_0000000c) {
          return *unaff_r10;
        }
                    /* WARNING: Subroutine does not return */
        ___stack_chk_fail();
      }
    }
    else if (*(float *)(param_1 + 0xe0) == 0.0) {
      fVar11 = *(float *)(param_1 + 0x14);
      uVar4 = FUN_000251a8();
      uVar8 = FloatVectorMult(CONCAT44(uVar4,uVar4),CONCAT44(extraout_s1,DAT_0000ff38),2,0x20);
      if ((int)((uint)(fVar11 < (float)uVar8) << 0x1f) < 0) {
        uVar14 = FloatVectorMult(uVar7,0x4180000041800000,2,0x20);
        uVar8 = FloatVectorAdd(uVar14,CONCAT44((int)((ulonglong)uVar8 >> 0x20),
                                               *(undefined4 *)(param_1 + 0x20)),2);
        *(int *)(param_1 + 0x20) = (int)uVar8;
        uVar8 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar8 >> 0x20),
                                        *(undefined4 *)(param_1 + 0x7c)),0x41a0000041a00000,2);
        *(int *)(param_1 + 0x7c) = (int)uVar8;
      }
      fVar11 = *(float *)(param_1 + 0x14);
      uVar2 = FUN_000251a8((int)uVar8);
      uVar8 = FloatVectorMult(CONCAT44(uVar2,uVar2),CONCAT44(extraout_s1_00,DAT_0000ff3c),2,0x20);
      if ((float)uVar8 < fVar11) {
        uVar7 = FloatVectorMult(uVar7,0xc1800000c1800000,2,0x20);
        uVar7 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar8 >> 0x20),
                                        *(undefined4 *)(param_1 + 0x20)),uVar7,2);
        *(int *)(param_1 + 0x20) = (int)uVar7;
        uVar7 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar7 >> 0x20),
                                        *(undefined4 *)(param_1 + 0x7c)),0xc1a00000c1a00000,2);
        *(int *)(param_1 + 0x7c) = (int)uVar7;
      }
    }
  }
  return uVar2;
}


```

## FUN_0000ff40 — 0000ff40

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

