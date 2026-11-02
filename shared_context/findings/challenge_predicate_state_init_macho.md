# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_000547e4 — 000547e4

- 函数名: FUN_000547e4
- 函数体: 5 字节
- 调用者数: 1 / 被调用者数: 0

```c

void FUN_000547e4(int param_1,undefined4 param_2)

{
  *(undefined4 *)(param_1 + 0x164) = param_2;
  return;
}


```

## FUN_000547ec — 000547ec

- 函数名: FUN_000547ec
- 函数体: 997 字节
- 调用者数: 4 / 被调用者数: 19

```c

undefined4 FUN_000547ec(undefined1 *param_1,int param_2)

{
  longlong lVar1;
  undefined *puVar2;
  undefined *puVar3;
  uint *puVar4;
  int iVar5;
  undefined4 uVar6;
  float fVar7;
  undefined4 uVar8;
  uint uVar9;
  uint uVar10;
  void *pvVar11;
  undefined4 *puVar12;
  int iVar13;
  undefined4 uVar14;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined4 extraout_s1_03;
  undefined8 uVar15;
  undefined4 local_54;
  undefined4 local_50;
  undefined4 local_4c;
  undefined4 local_48;
  undefined4 local_44;
  float local_40;
  undefined4 local_3c;
  undefined4 local_38;
  undefined4 local_34;
  
  iVar5 = FUN_0001cd6c();
  puVar4 = DAT_005a7930;
  puVar2 = PTR_DAT_004d9050;
  if (iVar5 == 0) {
    lVar1 = (ulonglong)*(uint *)PTR_DAT_004d9050 * (ulonglong)*(uint *)(PTR_DAT_004d9050 + 8);
    uVar10 = (uint)lVar1;
    uVar9 = *(int *)(PTR_DAT_004d9050 + 4) * *(uint *)(PTR_DAT_004d9050 + 8) +
            *(uint *)PTR_DAT_004d9050 * *(int *)(PTR_DAT_004d9050 + 0xc) +
            (int)((ulonglong)lVar1 >> 0x20) +
            *(int *)(PTR_DAT_004d9050 + 0x14) +
            (uint)CARRY4(uVar10,*(uint *)(PTR_DAT_004d9050 + 0x10));
    *(uint *)PTR_DAT_004d9050 = uVar10 + *(uint *)(PTR_DAT_004d9050 + 0x10);
    *(uint *)(puVar2 + 4) = uVar9;
    *puVar4 = uVar9;
    puVar4[1] = 0;
    puVar4[2] = 0x6c078965;
    puVar4[3] = 0x5d588b65;
    puVar4[4] = 0x269ec3;
    puVar4[5] = 0;
  }
  FUN_00031290();
  FUN_00031d2c();
  param_1[0x35] = 1;
  param_1[0x36] = 0;
  param_1[0x37] = 0;
  *(undefined4 *)(param_1 + 0x38) = 0xffffffff;
  *(undefined4 *)(param_1 + 0x28) = 0;
  *(undefined4 *)(param_1 + 0x208) = 1;
  *(undefined4 *)(param_1 + 0x20c) = 0;
  *(undefined4 *)(param_1 + 0x210) = 0;
  pvVar11 = *(void **)(param_1 + 0x24);
  uVar14 = extraout_s1;
  if (pvVar11 != (void *)0x0) {
    FUN_00058fb0(pvVar11);
    operator_delete(pvVar11);
    *(undefined4 *)(param_1 + 0x24) = 0;
    uVar14 = extraout_s1_00;
  }
  puVar12 = *(undefined4 **)(param_1 + 0x20);
  if (puVar12 != (undefined4 *)0x0) {
    if ((void *)*puVar12 != (void *)0x0) {
      operator_delete((void *)*puVar12);
    }
    operator_delete(puVar12);
    *(undefined4 *)(param_1 + 0x20) = 0;
    uVar14 = extraout_s1_01;
  }
  *(undefined4 *)(param_1 + 0x214) = 0;
  puVar2 = PTR_DAT_004d9048;
  *(undefined4 *)(param_1 + 0x40) = 0;
  *(undefined4 *)(param_1 + 0x44) = 0;
  *(undefined4 *)(param_1 + 0x48) = 0;
  puVar2[0x17] = 0;
  param_1[0x179] = 0;
  param_1[0x17a] = 0;
  *param_1 = 0;
  puVar4 = DAT_005a7930;
  fVar7 = DAT_00054bd4;
  lVar1 = (ulonglong)*DAT_005a7930 * (ulonglong)DAT_005a7930[2];
  uVar10 = (uint)lVar1;
  uVar9 = DAT_005a7930[1] * DAT_005a7930[2] +
          *DAT_005a7930 * DAT_005a7930[3] + (int)((ulonglong)lVar1 >> 0x20) +
          DAT_005a7930[5] + (uint)CARRY4(uVar10,DAT_005a7930[4]);
  uVar8 = (undefined4)((ulonglong)uVar9 * 0x7ffff >> 0x20);
  *DAT_005a7930 = uVar10 + DAT_005a7930[4];
  puVar4[1] = uVar9;
  uVar15 = FixedToFP(CONCAT44(uVar8,uVar8),0,1,0,0x20);
  uVar15 = FloatVectorMult(CONCAT44(uVar14,(float)uVar15 / fVar7),0x4120000041200000,2,0x20);
  uVar15 = FloatVectorAdd(uVar15,0x4120000041200000,2);
  uVar14 = (undefined4)uVar15;
  *(undefined4 *)(param_1 + 0x17c) = uVar14;
  if (*(int *)(puVar2 + 0x10) != 1) {
    uVar14 = FUN_0001cda4(0,0xffffffff);
  }
  FUN_0000a6e4(uVar14,0xffffffff);
  puVar2[0x19] = 0;
  puVar3 = PTR_DAT_004d90f8;
  *(undefined4 *)PTR_DAT_004d90fc = 0;
  *(undefined4 *)puVar3 = 1;
  *(undefined4 *)(param_1 + 0x16c) = 0xffffffff;
  *(undefined4 *)(param_1 + 0x218) = 0;
  *(undefined4 *)(param_1 + 0x174) = 0;
  *(undefined4 *)(param_1 + 0x54) = 0;
  *(undefined4 *)(param_1 + 0x58) = 0;
  *(undefined4 *)(param_1 + 0x4c) = 0;
  *(undefined4 *)(param_1 + 0x60) = 0;
  *(undefined4 *)(param_1 + 0x5c) = 0;
  param_1[0x178] = 1;
  puVar2[0x5d0] = 1;
  *(undefined4 *)(puVar2 + 0x5d4) = 0;
  uVar6 = (**(code **)(**(int **)(puVar2 + 0x58) + 0x2c))();
  uVar8 = DAT_0052bfe4;
  uVar14 = DAT_0052bfe0;
  uVar15 = FloatVectorMult(CONCAT44(uVar6,uVar6),CONCAT44(extraout_s1_02,DAT_00054bd8),2,0x20);
  uVar15 = FPToFixed(uVar15,0,0,3,0x20);
  fVar7 = (float)FUN_003010ec((uint)uVar15 & 0xffff);
  uVar6 = FUN_000251a8();
  local_3c = DAT_0052bfe0;
  local_38 = DAT_0052bfe4;
  local_34 = DAT_0052bfe8;
  (**(code **)(**(int **)(puVar2 + 0x58) + 0x30))(DAT_0052bfe0,*(int **)(puVar2 + 0x58),&local_3c);
  uVar15 = FloatVectorMult(CONCAT44(uVar6,uVar6),0x3f0000003f000000,2,0x20);
  local_48 = uVar14;
  local_40 = (float)uVar15 / fVar7;
  local_44 = uVar8;
  (**(code **)(**(int **)(puVar2 + 0x58) + 0x38))(local_40,*(int **)(puVar2 + 0x58),&local_48);
  local_54 = 0;
  local_50 = 0x3f800000;
  local_4c = 0;
  (**(code **)(**(int **)(puVar2 + 0x58) + 0x40))(*(int **)(puVar2 + 0x58),&local_54);
  if (*(int *)(puVar2 + 0x4c) != 0) {
    FUN_0003e854();
  }
  FUN_000137e8(0);
  FUN_000096c4();
  if (param_2 == 1) {
    uVar14 = FUN_000065c4();
    iVar5 = FUN_00006aa4(uVar14,1,0);
    if (iVar5 != 0) {
      iVar13 = 1;
      do {
        *(undefined1 *)(iVar5 + 0xc4) = 1;
        uVar14 = FUN_000065c4();
        iVar5 = FUN_00006aa4(uVar14,1,iVar13);
        iVar13 = iVar13 + 1;
      } while (iVar5 != 0);
    }
    uVar14 = FUN_000065c4();
    iVar5 = FUN_00006aa4(uVar14,2,0);
    if (iVar5 != 0) {
      iVar13 = 1;
      do {
        *(undefined1 *)(iVar5 + 0x8c) = 1;
        uVar14 = FUN_000065c4();
        iVar5 = FUN_00006aa4(uVar14,2,iVar13);
        iVar13 = iVar13 + 1;
      } while (iVar5 != 0);
    }
  }
  FUN_00054bdc(param_1);
  *(undefined4 *)(param_1 + 0x2c) = 0;
  *(undefined4 *)(param_1 + 0x200) = 0;
  *(undefined4 *)(param_1 + 0x204) = 1;
  _memset(param_1 + 0x180,0xff,0x80);
  if (*(int *)(puVar2 + 0x10) == 1) {
    iVar5 = *(int *)(param_1 + 0x164) * 0xc + 0x140;
  }
  else {
    iVar5 = *(int *)(puVar2 + 0x10) * 0xc + 0x98;
  }
  if (*(int *)((int)(param_1 + iVar5) + 4) != *(int *)(param_1 + iVar5)) {
    iVar5 = FUN_0001cd6c();
    if (iVar5 == 0) {
      FUN_00054dd8(param_1,0);
    }
    FUN_0001cd70();
    uVar15 = FloatVectorAdd(CONCAT44(extraout_s1_03,*(undefined4 *)(param_1 + 0x170)),
                            0x3f8000003f800000,2);
    *(int *)(param_1 + 0x170) = (int)uVar15;
  }
  uVar9 = 0;
  puVar2[0x1bf] = 0;
  *(undefined4 *)(param_1 + 0x78) = 0x3f800000;
  uVar14 = *(undefined4 *)(param_1 + *(int *)(puVar2 + 0x10) * 4 + 0x88);
  *(undefined4 *)(param_1 + 0x74) = uVar14;
  *(undefined4 *)(param_1 + 0x7c) = 0x3f800000;
  iVar5 = *(int *)(param_1 + 0x21c);
  if (*(int *)(param_1 + 0x220) != iVar5) {
    do {
      uVar14 = (**(code **)(**(int **)(iVar5 + uVar9 * 4) + 0x10))();
      iVar5 = *(int *)(param_1 + 0x21c);
      uVar9 = uVar9 + 1;
    } while (uVar9 < (uint)(*(int *)(param_1 + 0x220) - iVar5 >> 2));
  }
  if (param_2 == 1) {
    *(undefined4 *)(param_1 + 0x74) = 0x3f800000;
    *(undefined4 *)(param_1 + 0x214) = 0;
    uVar14 = FUN_00031290();
    uVar14 = FUN_000322dc(uVar14,1);
  }
  return uVar14;
}


```

## FUN_0005520c — 0005520c

- 函数名: FUN_0005520c
- 函数体: 27 字节
- 调用者数: 3 / 被调用者数: 2

```c

void FUN_0005520c(int param_1)

{
  undefined4 uVar1;
  
  *(undefined4 *)(param_1 + 0x74) = 0x3f800000;
  *(undefined4 *)(param_1 + 0x214) = 0;
  uVar1 = FUN_00031290();
  FUN_000322dc(uVar1,1);
  return;
}


```

## FUN_000559e4 — 000559e4

- 函数名: FUN_000559e4
- 函数体: 1689 字节
- 调用者数: 1 / 被调用者数: 27

```c

void FUN_000559e4(int param_1,undefined4 param_2)

{
  undefined *puVar1;
  undefined *puVar2;
  undefined *puVar3;
  undefined *puVar4;
  undefined *puVar5;
  byte bVar6;
  int iVar7;
  undefined4 uVar8;
  uint uVar9;
  int *piVar10;
  int iVar11;
  int iVar12;
  undefined4 uVar13;
  float *pfVar14;
  int iVar15;
  uint uVar16;
  int iVar17;
  bool bVar18;
  bool bVar19;
  float fVar20;
  float fVar21;
  undefined4 extraout_s1;
  longlong lVar22;
  undefined4 extraout_s1_00;
  uint extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined4 extraout_s1_03;
  undefined4 extraout_s1_04;
  undefined4 extraout_s1_05;
  undefined4 extraout_s1_06;
  undefined4 extraout_s1_07;
  float fVar23;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  undefined4 extraout_s5_01;
  undefined8 uVar24;
  undefined8 unaff_d9;
  undefined8 unaff_d10;
  undefined8 unaff_d11;
  undefined8 uVar25;
  undefined8 uVar26;
  undefined8 uVar27;
  undefined8 uVar28;
  undefined8 uVar29;
  undefined8 uVar30;
  undefined8 uVar31;
  undefined8 uVar32;
  undefined8 uVar33;
  int local_110;
  undefined4 local_10c;
  undefined4 local_108;
  undefined4 local_104;
  undefined4 local_100;
  undefined4 local_fc;
  undefined4 local_f8;
  undefined4 local_ec;
  undefined4 local_e8;
  undefined4 local_e4;
  undefined4 local_e0;
  undefined1 *local_dc;
  undefined4 local_d8;
  undefined4 local_d4;
  undefined4 local_d0;
  undefined4 local_cc;
  undefined4 local_c8;
  undefined4 local_c4;
  undefined4 local_c0;
  undefined4 local_bc;
  undefined4 local_b8;
  undefined4 local_b4;
  undefined4 local_b0;
  undefined4 local_ac;
  undefined4 local_a8;
  undefined4 local_a4;
  undefined4 local_a0;
  undefined4 local_9c;
  undefined4 local_98;
  undefined4 local_8c;
  undefined1 local_80;
  undefined1 local_7f;
  undefined4 local_7c;
  undefined8 local_78;
  undefined8 uStack_70;
  undefined4 local_68;
  int local_64;
  
  puVar2 = PTR_DAT_004d9048;
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_64 = *(int *)PTR____stack_chk_guard_004d9044;
  if ((*(int **)PTR_DAT_004d9048 != (int *)0x0) &&
     (iVar7 = (**(code **)(**(int **)PTR_DAT_004d9048 + 0x24))(), iVar7 == 0)) {
    *(undefined4 *)(param_1 + 0x78) = 0x3f800000;
    *(undefined4 *)(param_1 + 100) = 0x3f800000;
    *(undefined4 *)(param_1 + 0x68) = 0x3f800000;
    *(undefined4 *)(param_1 + 0x6c) = 0x3f800000;
    *(undefined4 *)(param_1 + 0x70) = 0x3f800000;
    bVar6 = FUN_0001cd6c();
    uVar8 = param_2;
    if ((bVar6 & puVar2[0x1bf] == '\0') != 0) {
      uVar8 = 0;
    }
    uVar24 = FloatVectorMult(CONCAT44(extraout_s5,*(undefined4 *)(param_1 + 0x7c)),
                             CONCAT44(uVar8,param_2),2,0x20);
    fVar21 = (float)uVar24;
    if (((int)((uint)(*(float *)(puVar2 + 0x20) < 1.0) << 0x1f) < 0) &&
       (iVar7 = FUN_0001cd30(), iVar7 == 1)) {
      uVar8 = FUN_00031290();
      FUN_00032064(uVar8,fVar21);
      FUN_00031290();
      iVar7 = FUN_00031290();
      uVar8 = *(undefined4 *)(iVar7 + 100);
    }
    else {
      FUN_00031290();
      FUN_0003200c();
      uVar8 = 0x3f800000;
    }
    *(undefined4 *)(param_1 + 0x78) = uVar8;
    if ((puVar2[0x17] == '\0') || (*(int *)(param_1 + 0x16c) < 1)) {
      uVar9 = FUN_0001cd6c();
      bVar19 = uVar9 == 1;
      if (bVar19) {
        uVar9 = (uint)(byte)puVar2[0x1bf];
      }
      if (!bVar19 || (uVar9 & 0xff) != 0) {
        iVar7 = param_1 + *(int *)(puVar2 + 0x10) * 4;
        uVar28 = FloatVectorMult(uVar24,CONCAT44(extraout_s5_00,*(undefined4 *)(iVar7 + 0x80)),2,
                                 0x20);
        uVar28 = FloatVectorAdd(CONCAT44(extraout_s3,*(undefined4 *)(param_1 + 0x74)),uVar28,2);
        fVar23 = (float)uVar28;
        fVar20 = *(float *)(iVar7 + 0x88);
        if ((*(float *)(iVar7 + 0x88) < fVar23) &&
           (fVar20 = *(float *)(iVar7 + 0x90), fVar23 < *(float *)(iVar7 + 0x90))) {
          fVar20 = fVar23;
        }
        pfVar14 = (float *)(puVar2 + 0x5d4);
        *(float *)(param_1 + 0x74) = fVar20;
        lVar22 = FloatVectorAdd(uVar24,CONCAT44(extraout_s1,*pfVar14),2);
        *pfVar14 = (float)lVar22;
        if ((10.5 < (float)lVar22) &&
           (uVar28 = FloatVectorSub(lVar22,uVar24,2,0x20), (float)uVar28 <= 10.5)) {
          uVar13 = *(undefined4 *)(puVar2 + 0x5c);
          uVar8 = FUN_002f69c4("retries_in_a_row",0x10);
          FUN_00027708(uVar13,uVar8);
          lVar22 = CONCAT44(extraout_s1_00,*pfVar14);
        }
        if (puVar2[0x5d0] != '\0') {
          fVar20 = (float)lVar22;
          bVar19 = fVar20 < 5.0;
          bVar18 = fVar20 == 5.0;
          if (!bVar18 && !bVar19) {
            bVar19 = fVar21 < 0.0;
            bVar18 = fVar21 == 0.0;
            fVar20 = fVar21;
          }
          if (!bVar18 && bVar19 == NAN(fVar20)) {
            iVar7 = FUN_0001cf84();
            lVar22 = (ulonglong)extraout_s1_01 << 0x20;
            if (iVar7 == 0) {
              puVar2[0x5d0] = 0;
            }
          }
        }
        fVar21 = DAT_00055bd8;
        uVar24 = FloatVectorAdd(uVar24,CONCAT44((int)((ulonglong)lVar22 >> 0x20),
                                                *(undefined4 *)(param_1 + 0x214)),2);
        if (DAT_00055bd8 < (float)uVar24) {
          unaff_d10 = CONCAT44((int)((ulonglong)unaff_d10 >> 0x20),DAT_00055bdc);
          do {
            if (*(int *)(puVar2 + 0x10) == 1) {
              piVar10 = (int *)(param_1 + *(int *)(param_1 + 0x164) * 0xc + 0x140);
            }
            else {
              piVar10 = (int *)(param_1 + *(int *)(puVar2 + 0x10) * 0xc + 0x98);
            }
            if (piVar10[1] != *piVar10) {
              FUN_00056098(param_1,0x3c888889,0);
            }
            uVar24 = FloatVectorAdd(uVar24,unaff_d10,2);
          } while (fVar21 < (float)uVar24);
        }
        *(int *)(param_1 + 0x214) = (int)uVar24;
        iVar7 = FUN_0001d10c(puVar2);
        if (iVar7 != 0) {
          FUN_0001d10c(puVar2);
          puVar5 = PTR_DAT_004d907c;
          puVar3 = PTR_DAT_004d905c;
          iVar7 = FUN_00063fe0(PTR_DAT_004d907c,*(undefined4 *)PTR_DAT_004d905c);
          if (iVar7 == 0) {
            FUN_0001d10c(puVar2);
            iVar7 = FUN_00063fe0(puVar5,*(undefined4 *)PTR_DAT_004d906c);
            if (iVar7 != 1) goto LAB_0005605e;
          }
          FUN_0001d10c(puVar2);
          iVar7 = FUN_0005edbc(PTR_DAT_004d9024);
          if (iVar7 == 0) {
            FUN_0001d10c(puVar2);
            puVar4 = PTR_DAT_004d906c;
            iVar7 = FUN_00063fe0(puVar5,*(undefined4 *)PTR_DAT_004d906c);
            iVar15 = 0;
            if (iVar7 == 1) {
              FUN_0001d10c(puVar2);
              iVar15 = FUN_00063e80(puVar5,*(undefined4 *)puVar4);
            }
            FUN_0001d10c(puVar2);
            iVar7 = FUN_00063fe0(puVar5,*(undefined4 *)puVar3);
            if (iVar7 == 1) {
              FUN_0001d10c(puVar2);
              iVar15 = FUN_00063e80(puVar5,*(undefined4 *)puVar3);
            }
            fVar21 = *(float *)(iVar15 + 0x10);
            if (fVar21 == -1.0) {
              FUN_0001d10c(puVar2);
              FUN_000617a8();
              iVar7 = FUN_0000ac08();
              uVar24 = FloatVectorMult(CONCAT44(extraout_s3_00,*(undefined4 *)(iVar7 + 0x244)),
                                       CONCAT44(extraout_s5_01,DAT_00056088),2,0x20);
              uVar24 = FloatVectorAdd(uVar24,CONCAT44(extraout_s1_02,*(undefined4 *)(iVar7 + 0x248))
                                      ,2);
              fVar21 = (float)uVar24;
              *(float *)(iVar15 + 0x10) = fVar21;
            }
            local_7c = 0;
            local_78 = 0;
            uStack_70 = 0;
            local_68 = 0;
            uVar8 = FUN_000065c4(fVar21);
            iVar7 = FUN_00006ad0(uVar8,1,&local_7c);
            fVar21 = DAT_0005608c;
            if (iVar7 != 0) {
              uVar8 = extraout_s1_03;
              do {
                if (*(char *)(iVar7 + 0x1bc) == '\0') {
                  uVar24 = FPToFixed(CONCAT44(uVar8,*(float *)(iVar7 + 0x10) / fVar21),0,0,3,0x20);
                  iVar11 = (int)uVar24 + 2;
                  iVar7 = 0;
                  if ((0 < iVar11) && (iVar7 = iVar11, 3 < iVar11)) {
                    iVar7 = 4;
                  }
                  *(int *)((int)&local_78 + iVar7 * 4) = *(int *)((int)&local_78 + iVar7 * 4) + 1;
                }
                uVar8 = FUN_000065c4();
                iVar7 = FUN_00006af0(uVar8,1,&local_7c);
                uVar8 = extraout_s1_04;
              } while (iVar7 != 0);
            }
            uVar8 = FUN_000065c4();
            iVar7 = FUN_00006ad0(uVar8,2,&local_7c);
            fVar21 = DAT_0005608c;
            if (iVar7 != 0) {
              uVar8 = extraout_s1_05;
              do {
                uVar24 = FPToFixed(CONCAT44(uVar8,*(float *)(iVar7 + 0x10) / fVar21),0,0,3,0x20);
                iVar11 = (int)uVar24 + 2;
                iVar7 = 0;
                if ((0 < iVar11) && (iVar7 = iVar11, 3 < iVar11)) {
                  iVar7 = 4;
                }
                *(int *)((int)&local_78 + iVar7 * 4) = *(int *)((int)&local_78 + iVar7 * 4) + 1;
                uVar8 = FUN_000065c4();
                iVar7 = FUN_00006af0(uVar8,2,&local_7c);
                uVar8 = extraout_s1_06;
              } while (iVar7 != 0);
            }
            FUN_0001d10c(puVar2);
            iVar7 = FUN_00063fe0(puVar5,*(undefined4 *)puVar3);
            iVar11 = 4;
            if (iVar7 != 0) {
              iVar11 = 5;
            }
            if (iVar7 == 1) {
              piVar10 = (int *)FUN_0001d10c(puVar2);
              iVar7 = (**(code **)(*piVar10 + 0x28))();
              if (iVar7 != 0) goto LAB_0005605e;
            }
            puVar3 = PTR_DAT_004d9050;
            uVar24 = CONCAT44((int)((ulonglong)unaff_d9 >> 0x20),DAT_0005608c);
            uVar28 = CONCAT44((int)((ulonglong)unaff_d10 >> 0x20),DAT_00056090);
            uVar25 = CONCAT44((int)((ulonglong)unaff_d11 >> 0x20),DAT_00056094);
            iVar7 = 0;
            do {
              if (*(int *)((int)&local_78 + iVar7 * 4) == 0) {
                iVar17 = 0;
                local_110 = 0;
                uVar29 = FixedToFP(CONCAT44(iVar7,iVar7),0,0,0,0x20);
                uVar29 = FloatVectorMult(uVar29,uVar24,2,0x20);
                uVar26 = FloatVectorAdd(uVar29,uVar28,2);
                uVar29 = FPToFixed(uVar26,0,0,3,0x20);
                uVar27 = FloatVectorNeg(uVar26,2,2);
                uVar30 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar29 >> 0x20),
                                                  *(undefined4 *)(iVar15 + 0x10)),0x4020000040200000
                                         ,2,0x20);
                uVar30 = FloatVectorAdd(uVar30,uVar25,2);
                do {
                  local_108 = 0;
                  local_104 = 0;
                  local_100 = 0;
                  local_f8 = 0x3f800000;
                  local_7f = 0;
                  local_bc = 0xbf800000;
                  local_b8 = 0x3f800000;
                  local_ec = 0;
                  local_e8 = 0xbf800000;
                  local_e4 = 0;
                  local_fc = 0;
                  local_8c = 0;
                  local_10c = 0;
                  local_b4 = 0;
                  local_b0 = 0;
                  local_ac = 0;
                  local_a8 = 0;
                  local_a4 = 0;
                  local_a0 = 0;
                  local_9c = 0;
                  local_98 = 0;
                  local_dc = &LAB_0001869e_1;
                  local_d8 = 0;
                  local_d4 = 0;
                  local_d0 = 0;
                  local_cc = 0;
                  local_c8 = 0;
                  local_c4 = 0x3f800000;
                  local_c0 = 0x3f800000;
                  local_80 = 0;
                  local_e0 = (int)uVar29;
                  uVar8 = FUN_000251a8();
                  uVar31 = CONCAT44(extraout_s1_07,*(undefined4 *)(iVar15 + 0x10));
                  uVar32 = FloatVectorMult(CONCAT44(uVar8,uVar8),0x3f0000003f000000,2,0x20);
                  uVar33 = FloatVectorAdd(uVar31,uVar31,2);
                  uVar31 = FixedToFP(CONCAT44(iVar17,iVar17),0,0,0,0x20);
                  uVar32 = FloatVectorAdd(uVar30,uVar32,2);
                  uVar31 = FloatVectorMult(uVar31,uVar33,2,0x20);
                  uVar31 = FloatVectorSub(uVar31,uVar32,2,0x20);
                  uVar31 = FPToFixed(uVar31,0,0,3,0x20);
                  local_dc = (undefined1 *)uVar31;
                  local_a0 = 0;
                  local_8c = 0;
                  local_cc = 0;
                  local_c8 = 0;
                  local_c4 = 0;
                  local_c0 = 0;
                  local_b0 = 0x3f800000;
                  local_a8 = 0x3f800000;
                  lVar22 = (ulonglong)*(uint *)puVar3 * (ulonglong)*(uint *)(puVar3 + 8);
                  uVar16 = (uint)lVar22;
                  uVar9 = *(int *)(puVar3 + 4) * *(uint *)(puVar3 + 8) +
                          *(uint *)puVar3 * *(int *)(puVar3 + 0xc) +
                          (int)((ulonglong)lVar22 >> 0x20) +
                          *(int *)(puVar3 + 0x14) + (uint)CARRY4(uVar16,*(uint *)(puVar3 + 0x10));
                  *(uint *)puVar3 = uVar16 + *(uint *)(puVar3 + 0x10);
                  *(uint *)(puVar3 + 4) = uVar9;
                  uVar8 = (undefined4)((ulonglong)uVar26 >> 0x20);
                  if (((uVar9 < 0x80000000) || (iVar11 + -1 == iVar17)) || (2 < local_110)) {
                    FUN_00052f80(local_dc);
                    FUN_0001d10c(puVar2);
                    uVar13 = FUN_000617a8();
                    iVar12 = FUN_00057000(&DAT_005a7b80,1,uVar13,&local_10c,0);
                    *(undefined4 *)(iVar12 + 0x1c) = 0;
                    *(undefined4 *)(iVar12 + 0x20) = 0;
                    *(undefined4 *)(iVar12 + 0x24) = 0;
                    FUN_0000f274(iVar12,0);
                    uVar31 = uVar26;
                    if ((int)((uint)((float)uVar26 < 0.0) << 0x1f) < 0) {
                      uVar31 = CONCAT44(uVar8,(int)uVar27);
                    }
                    uVar31 = FPToFixed(uVar31,0,1,3,0x20);
                    *(int *)(iVar12 + 4) = (int)uVar31 + iVar17;
                  }
                  else {
                    FUN_00052f80(local_dc);
                    iVar12 = FUN_000568f4(&DAT_005a7b80,1,&local_10c);
                    *(undefined4 *)(iVar12 + 0x1c) = 0;
                    *(undefined4 *)(iVar12 + 0x20) = 0;
                    *(undefined4 *)(iVar12 + 0x24) = 0;
                    FUN_00008a50(iVar12,0);
                    uVar31 = uVar26;
                    if ((int)((uint)((float)uVar26 < 0.0) << 0x1f) < 0) {
                      uVar31 = CONCAT44(uVar8,(int)uVar27);
                    }
                    uVar31 = FPToFixed(uVar31,0,1,3,0x20);
                    *(int *)(iVar12 + 4) = (int)uVar31 + iVar17;
                    local_110 = local_110 + 1;
                  }
                  FUN_0001549c(&local_10c);
                  iVar17 = iVar17 + 1;
                } while (iVar17 < iVar11);
              }
              iVar7 = iVar7 + 1;
            } while (iVar7 != 5);
          }
        }
      }
    }
    else {
      FUN_000557ac(uVar8,param_1,fVar21);
    }
  }
LAB_0005605e:
  if (*(int *)puVar1 != local_64) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00053cb8 — 00053cb8

- 函数名: FUN_00053cb8
- 函数体: 2859 字节
- 调用者数: 1 / 被调用者数: 25

```c

void FUN_00053cb8(int param_1,undefined4 param_2,int param_3)

{
  undefined4 *puVar1;
  float *pfVar2;
  float *pfVar3;
  float *pfVar4;
  float *pfVar5;
  float *pfVar6;
  float *pfVar7;
  float *pfVar8;
  float *pfVar9;
  float *pfVar10;
  float *pfVar11;
  float *pfVar12;
  undefined1 *puVar13;
  byte *pbVar14;
  char cVar15;
  int *piVar16;
  undefined1 uVar17;
  byte bVar18;
  int *piVar19;
  int iVar20;
  int iVar21;
  int iVar22;
  int iVar23;
  int *piVar24;
  void *pvVar25;
  undefined4 *puVar26;
  int iVar27;
  size_t sVar28;
  ulong uVar29;
  undefined4 uVar30;
  int *piVar31;
  undefined4 *puVar32;
  uint uVar33;
  uint uVar34;
  undefined4 *puVar35;
  char *pcVar36;
  string *psVar37;
  string *this;
  undefined4 *puVar38;
  string *psVar39;
  bool bVar40;
  undefined4 extraout_s1;
  undefined4 extraout_s3;
  undefined8 uVar41;
  int local_50;
  int local_48;
  int *local_44;
  double local_40;
  double local_38;
  double local_30;
  
  piVar19 = operator_new(0x48);
  FUN_0030cda0(piVar19,param_2);
  if (piVar19 != (int *)0x0) {
    iVar20 = FUN_0030ceac(piVar19,0);
    if (iVar20 == 1) {
      FUN_0030c328(piVar19,"waveManagerFile");
      iVar20 = FUN_0030c300();
      iVar21 = param_1 + param_3 * 0x40;
      pfVar2 = (float *)(iVar21 + 0xe0);
      *pfVar2 = 0.0;
      piVar31 = (int *)(iVar21 + 0xe8);
      *piVar31 = 0;
      puVar32 = (undefined4 *)(iVar21 + 0xec);
      *puVar32 = 0xffffffff;
      puVar38 = (undefined4 *)(iVar21 + 0xb0);
      *puVar38 = 10;
      pfVar3 = (float *)(iVar21 + 0xb4);
      *pfVar3 = 0.25;
      pfVar4 = (float *)(iVar21 + 0xb8);
      *pfVar4 = 1.0;
      pfVar5 = (float *)(iVar21 + 0xbc);
      *pfVar5 = 1.0;
      pfVar6 = (float *)(iVar21 + 0xc0);
      *pfVar6 = 0.0;
      pfVar7 = (float *)(iVar21 + 0xc4);
      *pfVar7 = 0.0;
      pfVar8 = (float *)(iVar21 + 0xd0);
      *pfVar8 = 0.0;
      pfVar9 = (float *)(iVar21 + 0xd4);
      *pfVar9 = 0.0;
      pfVar10 = (float *)(iVar21 + 0xd8);
      *pfVar10 = 0.0;
      pfVar11 = (float *)(iVar21 + 200);
      *pfVar11 = 2.0;
      pfVar12 = (float *)(iVar21 + 0xcc);
      *pfVar12 = 0.0;
      puVar35 = (undefined4 *)(iVar21 + 0xe4);
      *puVar35 = 100;
      puVar13 = (undefined1 *)(iVar21 + 0xdc);
      *puVar13 = 1;
      pbVar14 = (byte *)(iVar21 + 0xdd);
      *pbVar14 = 1;
      if (iVar20 != 0) {
        iVar22 = param_1 + param_3 * 4;
        local_50 = 0;
        do {
          pcVar36 = (char *)(*(int *)(iVar20 + 0x20) + 8);
          iVar23 = _strcmp(pcVar36,"WaveInfo");
          if (iVar23 == 0) {
            piVar24 = operator_new(0xc4);
            FUN_00058ee4(piVar24,puVar38);
            piVar24[0x2a] = local_50;
            local_48 = -1;
            local_44 = piVar24;
            FUN_0030c6c0(iVar20,"waveNo",&local_48);
            if (-1 < local_48) {
              *local_44 = local_48;
            }
            FUN_0030c6c0(iVar20,"overideProbabiltyPool",local_44 + 0x2c);
            pcVar36 = (char *)FUN_0030c660(iVar20,"until");
            cVar15 = '\0';
            if (pcVar36 != (char *)0x0) {
              cVar15 = *pcVar36;
            }
            if (pcVar36 != (char *)0x0 && cVar15 != '\0') {
              iVar23 = _strcmp(pcVar36,"forever");
              if (iVar23 == 0) {
                local_44[1] = -2;
              }
              else {
                iVar23 = _atoi(pcVar36);
                if ((-1 < iVar23) && (*local_44 <= iVar23)) {
                  local_44[1] = iVar23;
                }
              }
            }
            local_48 = -1;
            FUN_0030c6c0(iVar20,"chance",&local_48);
            piVar24 = local_44;
            if (-1 < local_48) {
              local_44[0x1f] = local_48;
            }
            iVar23 = FUN_0030c718(iVar20,"criticalChance",&local_30);
            piVar16 = local_44;
            if (iVar23 == 0) {
              piVar24[0x29] = (int)(float)local_30;
            }
            iVar23 = FUN_0030c718(iVar20,"chanceRegrowth",&local_30);
            if (iVar23 == 0) {
              piVar16[0x21] = (int)(float)local_30;
            }
            FUN_0030c6c0(iVar20,"games",local_44 + 0x23);
            FUN_0030c6c0(iVar20,"gamesMin",local_44 + 0x23);
            FUN_0030c6c0(iVar20,"gamesMax",local_44 + 0x24);
            local_44[0x2f] = 0;
            FUN_0030c6c0(iVar20,"ignoreTimes",local_44 + 0x2f);
            uVar33 = local_44[0x24];
            uVar34 = local_44[0x23];
            if (0x7fffffff < (uint)local_44[0x23]) {
              local_44[0x23] = uVar33;
              uVar34 = uVar33;
            }
            if (0x7fffffff < uVar33) {
              local_44[0x24] = uVar34;
            }
            iVar23 = FUN_0030c660(iVar20,"excludeTag");
            if (iVar23 != 0) {
              pvVar25 = operator_new(8);
              FUN_00058108(pvVar25,iVar23);
              local_44[0x30] = (int)pvVar25;
            }
            iVar23 = FUN_0030c328(iVar20,"coin_chances");
            if (iVar23 != 0) {
              puVar26 = operator_new(8);
              *puVar26 = 0;
              puVar26[1] = 0;
              local_44[0x2b] = (int)puVar26;
              FUN_0005326c(local_44[0x2b],iVar23);
            }
            iVar23 = FUN_0030c328(iVar20,"Spawn");
            iVar27 = FUN_002f69c4("Spawn",5);
            for (; piVar24 = local_44, iVar23 != 0; iVar23 = FUN_0030c378(iVar23)) {
              pcVar36 = (char *)(*(int *)(iVar23 + 0x20) + 8);
              sVar28 = _strlen(pcVar36);
              uVar41 = FUN_002f69c4(pcVar36,sVar28);
              bVar40 = (int)uVar41 == iVar27;
              if (bVar40) {
                uVar41 = CONCAT44(local_44[0x13] + 1,local_44);
              }
              if (bVar40) {
                *(int *)((int)uVar41 + 0x4c) = (int)((ulonglong)uVar41 >> 0x20);
              }
            }
            uVar33 = local_44[0x13];
            uVar34 = (uint)((ulonglong)uVar33 * 0x90);
            uVar29 = uVar34 + 8;
            if ((int)((ulonglong)uVar33 * 0x90 >> 0x20) != 0 || uVar29 < uVar34) {
              uVar29 = 0xffffffff;
            }
            puVar26 = operator_new__(uVar29);
            *puVar26 = 0x90;
            puVar26[1] = uVar33;
            if (uVar33 != 0) {
              iVar23 = 0;
              do {
                iVar27 = iVar23 + 0x90;
                *(undefined4 *)((int)puVar26 + iVar23 + 0xc) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x10) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x14) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x1c) = 0x3f800000;
                *(undefined1 *)((int)puVar26 + iVar23 + 0x95) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x28) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x2c) = 0xbf800000;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x30) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x18) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x88) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 8) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x7c) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x78) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x74) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x70) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x6c) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x68) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 100) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x58) = 0xbf800000;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x5c) = 0x3f800000;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x60) = 0;
                *(undefined1 **)((int)puVar26 + iVar23 + 0x38) = &LAB_0001869e_1;
                *(undefined1 **)((int)puVar26 + iVar23 + 0x34) = &LAB_0001869e_1;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x4c) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x48) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x44) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x40) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x3c) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x50) = 0x3f800000;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x54) = 0x3f800000;
                *(undefined1 *)((int)puVar26 + iVar23 + 0x94) = 0;
                iVar23 = iVar27;
                piVar24 = local_44;
              } while (uVar33 * 0x90 - iVar27 != 0);
            }
            piVar24[0x12] = (int)(puVar26 + 2);
            iVar23 = FUN_0030c328(iVar20,"Spawn");
            if (iVar23 != 0) {
              iVar27 = local_44[0x12];
              do {
                FUN_000537ec(iVar23,iVar27);
                iVar23 = FUN_0030c3a0(iVar23,"Spawn");
                puVar26 = (undefined4 *)(iVar27 + 0x5c);
                puVar1 = (undefined4 *)(iVar27 + 100);
                iVar27 = iVar27 + 0x90;
                uVar41 = FloatVectorAdd(CONCAT44(extraout_s1,*puVar26),CONCAT44(extraout_s3,*puVar1)
                                        ,2);
                uVar41 = FloatVectorMult(uVar41,0x3f0000003f000000,2,0x20);
                uVar41 = FloatVectorAdd(uVar41,0x3f0000003f000000,2);
                uVar41 = FPToFixed(uVar41,0,0,3,0x20);
                local_44[0x2d] = (int)uVar41 + local_44[0x2d];
              } while (iVar23 != 0);
            }
            iVar23 = FUN_0030c328(iVar20,"Wave_dt");
            piVar24 = local_44;
            if (iVar23 != 0) {
              iVar27 = FUN_0030c718(iVar23,"dt",&local_30);
              piVar16 = local_44;
              if (iVar27 == 0) {
                piVar24[0x14] = (int)(float)local_30;
              }
              iVar27 = FUN_0030c718(iVar23,"inc",&local_30);
              piVar24 = local_44;
              if (iVar27 == 0) {
                piVar16[0x15] = (int)(float)local_30;
              }
              iVar23 = FUN_0030c718(iVar23,"spinc",&local_40);
              if (iVar23 == 0) {
                piVar24[0x16] = (int)(float)local_40;
              }
            }
            iVar23 = FUN_0030c328(iVar20,"NextWaveDelay");
            piVar24 = local_44;
            if (iVar23 != 0) {
              iVar27 = FUN_0030c718(iVar23,"wait",&local_30);
              piVar16 = local_44;
              if (iVar27 == 0) {
                piVar24[0x1a] = (int)(float)local_30;
              }
              iVar27 = FUN_0030c718(iVar23,"waitSpinc",&local_30);
              piVar24 = local_44;
              if (iVar27 == 0) {
                piVar16[0x1c] = (int)(float)local_30;
              }
              iVar27 = FUN_0030c718(iVar23,"speedLoss",&local_30);
              piVar16 = local_44;
              if (iVar27 == 0) {
                piVar24[0x17] = (int)(float)local_30;
              }
              if (0.0 < (float)local_44[0x1a]) {
                local_44[0x18] = 0;
                local_44[0x19] = 0;
              }
              iVar27 = FUN_0030c718(iVar23,"delay",&local_30);
              piVar24 = local_44;
              if (iVar27 == 0) {
                piVar16[0x18] = (int)(float)local_30;
              }
              iVar27 = FUN_0030c718(iVar23,"inc",&local_30);
              if (iVar27 == 0) {
                piVar24[0x19] = (int)(float)local_30;
              }
              iVar27 = FUN_0030c660(iVar23,"waitForEntities");
              if (iVar27 != 0) {
                bVar18 = FUN_00039580(iVar27,"false");
                *(byte *)(local_44 + 0x1e) = bVar18 ^ 1;
              }
              iVar23 = FUN_0030c660(iVar23,"waitForProcessing");
              if (iVar23 != 0) {
                bVar18 = FUN_00039580(iVar23,"false");
                *(byte *)((int)local_44 + 0x79) = bVar18 ^ 1;
              }
            }
            iVar23 = FUN_0030c328(iVar20,"ChooseFrom");
            piVar24 = local_44;
            psVar39 = (string *)local_44[0x26];
            psVar37 = (string *)local_44[0x25];
            for (this = psVar37; psVar39 != this; this = this + 4) {
              std::string::~string(this);
            }
            piVar24[0x26] = (int)psVar37;
            local_50 = local_50 + 1;
            local_44[0x28] = 0;
            if (iVar23 != 0) {
              uVar30 = FUN_0030c660(iVar23,"types");
              FUN_000395ac(uVar30,local_44 + 0x25);
            }
            pcVar36 = (char *)FUN_0030c660(iVar20,"debugName");
            if (pcVar36 == (char *)0x0) {
              _sprintf((char *)(local_44 + 2),"waveNo. %i",local_44[0x2a]);
            }
            else {
              _strcpy((char *)(local_44 + 2),pcVar36);
            }
            if (param_3 == 1) {
              iVar23 = param_1 + *piVar31 * 0x24 + *(int *)(param_1 + 0x164) * 0xc + 0x140;
            }
            else {
              iVar23 = param_1 + *piVar31 * 0x18 + param_3 * 0xc + 0x98;
            }
            FUN_00058588(iVar23,&local_44);
          }
          else {
            iVar23 = _strcmp(pcVar36,"defaults");
            if (iVar23 == 0) {
              *pfVar2 = 0.0;
              *piVar31 = 0;
              *puVar32 = 0xffffffff;
              *puVar38 = 10;
              *pfVar3 = 0.25;
              *pfVar4 = 1.0;
              *pfVar5 = 1.0;
              *pfVar6 = 0.0;
              *pfVar7 = 0.0;
              *pfVar8 = 0.0;
              *pfVar9 = 0.0;
              *pfVar10 = 0.0;
              *pfVar11 = 2.0;
              *pfVar12 = 0.0;
              *puVar35 = 100;
              *puVar13 = 1;
              *pbVar14 = 1;
              FUN_0030c6c0(iVar20,"waveChance");
              iVar23 = FUN_0030c718(iVar20,"waveChanceRegrowth",&local_30);
              if (iVar23 == 0) {
                *pfVar3 = (float)local_30;
              }
              iVar23 = FUN_0030c718(iVar20,"criticalChance",&local_30);
              if (iVar23 == 0) {
                *pfVar4 = (float)local_30;
              }
              iVar23 = FUN_0030c718(iVar20,"dt",&local_30);
              if (iVar23 == 0) {
                *pfVar5 = (float)local_30;
              }
              iVar23 = FUN_0030c718(iVar20,"dtInc",&local_30);
              if (iVar23 == 0) {
                *pfVar6 = (float)local_30;
              }
              iVar23 = FUN_0030c718(iVar20,"dtSpInc",&local_30);
              if (iVar23 == 0) {
                *pfVar7 = (float)local_30;
              }
              iVar23 = FUN_0030c718(iVar20,"beforeDelay",&local_30);
              if (iVar23 == 0) {
                *pfVar11 = (float)local_30;
              }
              iVar23 = FUN_0030c718(iVar20,"beforeDelayInc",&local_30);
              if (iVar23 == 0) {
                *pfVar12 = (float)local_30;
              }
              iVar23 = FUN_0030c718(iVar20,"nextDelay",&local_30);
              if (iVar23 == 0) {
                *pfVar8 = (float)local_30;
              }
              iVar23 = FUN_0030c718(iVar20,"nextDelayInc",&local_30);
              if (iVar23 == 0) {
                *pfVar9 = (float)local_30;
              }
              iVar23 = FUN_0030c718(iVar20,"nextDelaySpInc",&local_30);
              if (iVar23 == 0) {
                *pfVar10 = (float)local_30;
              }
              iVar23 = FUN_0030c718(iVar20,"speedLoss",&local_30);
              if (iVar23 == 0) {
                *pfVar2 = (float)local_30;
              }
              FUN_0030c6c0(iVar20,"overideProbabiltyPool",puVar35);
              pcVar36 = (char *)FUN_0030c660(iVar20,"waitForEntities");
              uVar17 = 1;
              if ((pcVar36 != (char *)0x0) && (uVar17 = 1, *pcVar36 != '\0')) {
                iVar23 = _strcmp("false",pcVar36);
                uVar17 = 0;
                if (iVar23 != 0) {
                  uVar17 = 1;
                }
              }
              *puVar13 = uVar17;
              uVar30 = FUN_0030c660(iVar20,"waitForProcessing");
              bVar18 = FUN_00039580(uVar30,"false");
              *pbVar14 = bVar18 ^ 1;
              iVar23 = FUN_0030c660(iVar20,"players");
              if (iVar23 != 0) {
                pcVar36 = (char *)FUN_0030c660(iVar20,"players");
                iVar23 = _strcmp(pcVar36,"1,2");
                if (iVar23 == 0) {
                  *piVar31 = 1;
                  *puVar32 = 2;
                  *(undefined4 *)(iVar21 + 0xf0) = 0xffffffff;
                }
              }
              iVar23 = FUN_0030c718(iVar20,"globalDtInc",&local_30);
              if (iVar23 == 0) {
                *(float *)(iVar22 + 0x80) = (float)local_30;
              }
              iVar23 = FUN_0030c718(iVar20,"globalDtStart",&local_30);
              if (iVar23 == 0) {
                *(float *)(iVar22 + 0x88) = (float)local_30;
              }
              iVar23 = FUN_0030c718(iVar20,"globalDtMax",&local_38);
              if (iVar23 == 0) {
                *(float *)(iVar22 + 0x90) = (float)local_38;
              }
            }
            else {
              iVar23 = _strcmp(pcVar36,"coin_chances");
              if (iVar23 == 0) {
                FUN_0005326c(param_1 + param_3 * 8 + 0x130,iVar20);
              }
            }
          }
          iVar20 = FUN_0030c378(iVar20);
        } while (iVar20 != 0);
      }
    }
    if (param_3 == 1) {
      piVar31 = (int *)(param_1 + *(int *)(param_1 + 0x164) * 0xc + 0x140);
    }
    else {
      piVar31 = (int *)(param_1 + param_3 * 0xc + 0x98);
    }
    puVar32 = (undefined4 *)*piVar31;
    puVar38 = (undefined4 *)piVar31[1];
    if (puVar32 != puVar38) {
      do {
        piVar31 = (int *)*puVar32;
        if (piVar31[1] == -1) {
          piVar31[1] = -2;
          puVar35 = (undefined4 *)(param_1 + param_3 * 0xc + 0x98);
          if (param_3 == 1) {
            puVar35 = (undefined4 *)(param_1 + *(int *)(param_1 + 0x164) * 0xc + 0x140);
          }
          puVar26 = (undefined4 *)*puVar35;
          if (puVar26 != (undefined4 *)puVar35[1]) {
            iVar20 = 1000000;
            do {
              if ((*piVar31 < *(int *)*puVar26) && (iVar21 = *(int *)*puVar26 + -1, iVar21 < iVar20)
                 ) {
                iVar20 = iVar21;
              }
              puVar26 = puVar26 + 1;
            } while ((undefined4 *)puVar35[1] != puVar26);
            if (iVar20 < 1000000) {
              piVar31[1] = iVar20;
            }
          }
        }
        puVar32 = puVar32 + 1;
      } while (puVar32 != puVar38);
    }
    (**(code **)(*piVar19 + 4))();
  }
  return;
}


```

## FUN_00058ee4 — 00058ee4

- 函数名: FUN_00058ee4
- 函数体: 201 字节
- 调用者数: 1 / 被调用者数: 0

```c

void FUN_00058ee4(undefined4 *param_1,undefined4 *param_2)

{
  param_1[0x25] = 0;
  param_1[0x26] = 0;
  param_1[0x27] = 0;
  param_1[0x1d] = 0;
  param_1[0x2c] = 100;
  param_1[0x23] = 0xffffffff;
  param_1[0x24] = 0xffffffff;
  param_1[0x13] = 0;
  *param_1 = 0;
  param_1[1] = 0xffffffff;
  param_1[0x14] = 0x3f800000;
  param_1[0x15] = 0;
  param_1[0x18] = 0x40000000;
  param_1[0x16] = 0;
  param_1[0x1c] = 0;
  param_1[0x1b] = 0;
  param_1[0x1a] = 0;
  param_1[0x19] = 0;
  param_1[0x21] = 0x3e800000;
  param_1[0x22] = 0x3e800000;
  param_1[0x12] = 0;
  param_1[0x29] = 0x3f800000;
  param_1[0x2a] = 0;
  param_1[0x2b] = 0;
  param_1[0x30] = 0;
  *(undefined1 *)(param_1 + 0x1e) = 1;
  *(undefined1 *)((int)param_1 + 0x79) = 1;
  param_1[0x17] = 0;
  *(undefined1 *)(param_1 + 2) = 0;
  param_1[0x2d] = 0;
  param_1[0x14] = param_2[3];
  param_1[0x15] = param_2[4];
  param_1[0x16] = param_2[5];
  param_1[0x18] = param_2[6];
  param_1[0x19] = param_2[7];
  param_1[0x1a] = param_2[8];
  param_1[0x1b] = param_2[9];
  param_1[0x1c] = param_2[10];
  param_1[0x1f] = *param_2;
  param_1[0x21] = param_2[1];
  param_1[0x22] = param_2[1];
  param_1[0x29] = param_2[2];
  *(undefined1 *)(param_1 + 0x1e) = *(undefined1 *)(param_2 + 0xb);
  param_1[0x17] = param_2[0xc];
  param_1[0x2c] = param_2[0xd];
  *(undefined1 *)((int)param_1 + 0x79) = *(undefined1 *)((int)param_2 + 0x2d);
  param_1[0x2e] = 0;
  return;
}


```

## FUN_00057b84 — 00057b84

- 函数名: FUN_00057b84
- 函数体: 75 字节
- 调用者数: 1 / 被调用者数: 2

```c

undefined4 FUN_00057b84(int param_1,undefined4 param_2)

{
  undefined4 uVar1;
  undefined4 extraout_s1;
  undefined4 extraout_s3;
  undefined8 uVar2;
  
  *(undefined4 *)(param_1 + 0x1c) = 0xffffffff;
  uVar1 = FUN_00057af0(param_1);
  *(undefined4 *)(param_1 + 0x88) = 0;
  *(undefined4 *)(param_1 + 0x74) = uVar1;
  *(undefined4 *)(param_1 + 0x78) = uVar1;
  *(undefined4 *)(param_1 + 0x7c) = 0;
  FUN_00055670(param_1);
  uVar2 = FloatVectorMult(CONCAT44(extraout_s3,*(undefined4 *)(param_1 + 0x70)),
                          CONCAT44(param_2,param_2),2,0x20);
  uVar2 = FloatVectorAdd(CONCAT44(extraout_s1,*(undefined4 *)(param_1 + 0x6c)),uVar2,2);
  uVar2 = FloatVectorMax(0,uVar2,2,0x20);
  *(int *)(param_1 + 0x80) = (int)uVar2;
  return (int)uVar2;
}


```

## FUN_00057af0 — 00057af0

- 函数名: FUN_00057af0
- 函数体: 147 字节
- 调用者数: 1 / 被调用者数: 0

```c

undefined8 FUN_00057af0(int param_1,undefined4 param_2)

{
  uint *puVar1;
  longlong lVar2;
  ulonglong uVar3;
  uint *puVar4;
  int iVar5;
  uint uVar6;
  uint uVar7;
  uint uVar8;
  uint *puVar9;
  uint *puVar10;
  uint *puVar11;
  undefined8 in_d0;
  undefined8 in_d1;
  undefined4 in_s5;
  undefined4 in_s7;
  undefined8 uVar13;
  undefined8 uVar14;
  undefined8 uVar15;
  uint *puVar12;
  
  puVar4 = DAT_005a7930;
  uVar14 = FloatVectorMult(CONCAT44(in_s5,*(undefined4 *)(param_1 + 0x60)),CONCAT44(param_2,param_2)
                           ,2,0x20);
  uVar13 = FloatVectorMult(CONCAT44(in_s7,*(undefined4 *)(param_1 + 0x68)),CONCAT44(param_2,param_2)
                           ,2,0x20);
  uVar15 = FloatVectorAdd(CONCAT44((int)((ulonglong)in_d1 >> 0x20),*(undefined4 *)(param_1 + 0x5c)),
                          uVar14,2);
  uVar14 = FloatVectorAdd(CONCAT44((int)((ulonglong)in_d0 >> 0x20),*(undefined4 *)(param_1 + 100)),
                          uVar13,2);
  uVar13 = FPToFixed(uVar15,0,0,3,0x20);
  uVar14 = FPToFixed(uVar14,0,0,3,0x20);
  iVar5 = (int)uVar13;
  uVar6 = (uint)uVar14;
  if (iVar5 < 0) {
    iVar5 = 0;
  }
  if ((int)uVar6 < 0) {
    uVar6 = 0;
  }
  uVar3 = (ulonglong)uVar6;
  if (0 < (int)(uVar6 - iVar5)) {
    puVar9 = DAT_005a7930 + 2;
    uVar7 = *DAT_005a7930;
    puVar10 = DAT_005a7930 + 1;
    puVar11 = DAT_005a7930 + 3;
    puVar12 = DAT_005a7930 + 4;
    puVar1 = DAT_005a7930 + 5;
    lVar2 = (ulonglong)uVar7 * (ulonglong)*puVar9;
    uVar8 = (uint)lVar2;
    *DAT_005a7930 = uVar8 + *puVar12;
    uVar7 = *puVar10 * *puVar9 + uVar7 * *puVar11 + (int)((ulonglong)lVar2 >> 0x20) +
            *puVar1 + (uint)CARRY4(uVar8,*puVar12);
    puVar4[1] = uVar7;
    uVar3 = (ulonglong)uVar7 * (ulonglong)(uVar6 - iVar5);
  }
  return CONCAT44((int)uVar3,iVar5 + (int)(uVar3 >> 0x20));
}


```

## FUN_00055670 — 00055670

- 函数名: FUN_00055670
- 函数体: 315 字节
- 调用者数: 2 / 被调用者数: 9

```c

void FUN_00055670(int *param_1)

{
  undefined *puVar1;
  undefined *puVar2;
  undefined4 uVar3;
  size_t sVar4;
  int iVar5;
  int iVar6;
  char *pcVar7;
  int iVar8;
  
  puVar2 = PTR_DAT_004d9048;
  puVar1 = PTR_DAT_004d9024;
  if (0 < param_1[4]) {
    iVar8 = 0;
    do {
      *(undefined4 *)(*param_1 + iVar8 * 4) = 0xffffffff;
      pcVar7 = *(char **)(param_1[1] + iVar8 * 4);
      sVar4 = _strlen(pcVar7);
      iVar5 = FUN_002f69c4(pcVar7,sVar4);
      if (((DAT_005a7950 & 1) == 0) && (iVar6 = ___cxa_guard_acquire(&DAT_005a7950), iVar6 != 0)) {
        DAT_005a7948 = FUN_002f69c4("bomb",4);
        DAT_005a794c = FUN_002f69c4("Bomb",4);
        ___cxa_guard_release(&DAT_005a7950);
      }
      if ((iVar5 == DAT_005a7948) || (iVar5 == DAT_005a794c)) {
        *(undefined4 *)(*param_1 + iVar8 * 4) = 0xfffffffe;
      }
      else {
        if (iVar5 == DAT_005a7924) {
          FUN_0001d10c(puVar2);
          iVar5 = FUN_0005ef30(puVar1);
          if (iVar5 == 1) {
            do {
              iVar5 = FUN_0000af04(0);
              *(int *)(*param_1 + iVar8 * 4) = iVar5;
              FUN_0001d10c(puVar2);
              iVar6 = FUN_000617a8();
            } while (iVar5 == iVar6);
            goto LAB_0005579a;
          }
          uVar3 = FUN_0000af04(0);
        }
        else if (iVar5 == DAT_005f949c) {
          FUN_0001d10c(puVar2);
          uVar3 = FUN_000617a8();
        }
        else {
          uVar3 = FUN_0000aae0(*(undefined4 *)(param_1[1] + iVar8 * 4),0);
        }
        *(undefined4 *)(*param_1 + iVar8 * 4) = uVar3;
      }
LAB_0005579a:
      iVar8 = iVar8 + 1;
    } while (iVar8 < param_1[4]);
  }
  return;
}


```

