# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_00057c08 — 00057c08

- 函数名: FUN_00057c08
- 函数体: 133 字节
- 调用者数: 1 / 被调用者数: 4

```c

undefined4 FUN_00057c08(int param_1,int param_2,int param_3)

{
  undefined4 uVar1;
  undefined4 *puVar2;
  size_t sVar3;
  int iVar4;
  undefined4 *puVar5;
  char *pcVar6;
  undefined4 *puVar7;
  
  *(undefined4 *)(param_1 + 0x228) = 0;
  if (param_3 == 1) {
    uVar1 = FUN_000579c8(param_1,param_2);
  }
  else {
    if (*(int *)(PTR_DAT_004d9048 + 0x10) == 1) {
      puVar2 = (undefined4 *)(param_1 + *(int *)(param_1 + 0x164) * 0xc + 0x140);
    }
    else {
      puVar2 = (undefined4 *)(param_1 + *(int *)(PTR_DAT_004d9048 + 0x10) * 0xc + 0x98);
    }
    puVar7 = (undefined4 *)puVar2[1];
    puVar2 = (undefined4 *)*puVar2;
    do {
      if (puVar7 == puVar2) {
        return 0;
      }
      puVar5 = (undefined4 *)*puVar2;
      pcVar6 = (char *)(puVar5 + 2);
      sVar3 = _strlen(pcVar6);
      iVar4 = FUN_002f69c4(pcVar6,sVar3);
      puVar2 = puVar2 + 1;
    } while (iVar4 != param_2);
    FUN_00057c90(param_1,*puVar5,0,0);
    uVar1 = 1;
  }
  return uVar1;
}


```

## FUN_00054dd8 — 00054dd8

- 函数名: FUN_00054dd8
- 函数体: 1071 字节
- 调用者数: 5 / 被调用者数: 13

```c

void FUN_00054dd8(int param_1,int param_2)

{
  int iVar1;
  int **ppiVar2;
  longlong lVar3;
  undefined *puVar4;
  undefined *puVar5;
  undefined *puVar6;
  uint *puVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  int *piVar10;
  int iVar11;
  int *piVar12;
  uint uVar13;
  int iVar14;
  int iVar15;
  uint uVar16;
  undefined4 *puVar17;
  int iVar18;
  uint *puVar19;
  uint *puVar20;
  uint *puVar21;
  undefined4 extraout_s0;
  undefined4 extraout_s0_00;
  undefined4 extraout_s0_01;
  undefined4 extraout_s0_02;
  undefined4 extraout_s1;
  longlong lVar24;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined4 extraout_s1_03;
  uint extraout_s1_04;
  float fVar25;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  undefined4 extraout_s3_01;
  undefined4 extraout_s3_02;
  undefined4 extraout_s3_03;
  undefined4 extraout_s3_04;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  undefined4 extraout_s5_01;
  undefined4 extraout_s5_02;
  undefined4 extraout_s5_03;
  undefined4 uVar26;
  undefined4 extraout_s5_04;
  undefined4 extraout_s7;
  undefined4 extraout_s7_00;
  undefined4 extraout_s7_01;
  undefined4 extraout_s7_02;
  undefined4 extraout_s7_03;
  undefined4 uVar27;
  undefined4 extraout_s7_04;
  undefined8 uVar28;
  undefined8 uVar29;
  int local_23c;
  int *local_238 [128];
  undefined4 *local_38;
  undefined4 *local_34;
  int local_2c;
  uint *puVar22;
  uint *puVar23;
  
  puVar5 = PTR_DAT_004d9048;
  puVar4 = PTR____stack_chk_guard_004d9044;
  local_2c = *(int *)PTR____stack_chk_guard_004d9044;
  uVar8 = FUN_0000342c();
  FUN_000276a0(*(undefined4 *)(puVar5 + 0x5c));
  uVar9 = FUN_0001cd94(0);
  FUN_00003e98(uVar8,uVar9);
  FUN_00003d14(uVar8,*(undefined4 *)(puVar5 + 0x194));
  if (*(int *)(puVar5 + 0x10) == 1) {
    iVar11 = param_1 + param_2 * 0x24 + *(int *)(param_1 + 0x164) * 0xc + 0x140;
  }
  else {
    iVar11 = param_1 + param_2 * 0x18 + *(int *)(puVar5 + 0x10) * 0xc + 0x98;
  }
  uVar8 = FUN_000587b8(&local_38,iVar11);
  lVar24 = CONCAT44(extraout_s1,uVar8);
  iVar15 = param_1 + param_2 * 4;
  uVar8 = 0;
  iVar11 = *(int *)(iVar15 + 0x16c);
  *(int *)(iVar15 + 0x16c) = iVar11 + 1;
  *(int *)(iVar15 + 0x218) = *(int *)(iVar15 + 0x218) + 1;
  if (0 < iVar11) {
    iVar11 = *(int *)(iVar15 + 0x168);
    uVar8 = 0;
    lVar24 = FloatVectorAdd(CONCAT44(extraout_s1,*(undefined4 *)(iVar11 + 0x74)),0x3f8000003f800000,
                            2);
    *(int *)(iVar11 + 0x74) = (int)lVar24;
    if (iVar11 != 0) {
      uVar8 = *(undefined4 *)(iVar11 + 0xc0);
    }
  }
  uVar9 = extraout_s3;
  uVar26 = extraout_s5;
  uVar27 = extraout_s7;
  if (*(int *)(param_1 + 0x20) == 0) {
    *(undefined4 *)(iVar15 + 0x168) = *local_38;
    piVar12 = (int *)(iVar15 + 0x168);
    if ((*(int *)(puVar5 + 0x10) == 1) && (*(int *)(param_1 + 0x228) != 0)) {
      *piVar12 = *(int *)(param_1 + 0x228);
    }
    else if (local_38 != local_34) {
      iVar11 = 0;
      local_23c = 0;
      puVar17 = local_38;
      do {
        piVar10 = (int *)*puVar17;
        lVar24 = CONCAT44((int)((ulonglong)lVar24 >> 0x20),piVar10[0x22]);
        if (0.0 < (float)piVar10[0x22]) {
          iVar14 = piVar10[0x1f];
          if (piVar10[0x20] < iVar14) {
            uVar29 = FixedToFP(CONCAT44(iVar14,iVar14),0,0,0,0x20);
            uVar29 = FloatVectorMult(lVar24,uVar29,2,0x20);
            lVar24 = FPToFixed(uVar29,0,0,3,0x20);
            iVar18 = piVar10[0x20] + (int)lVar24;
            piVar10[0x20] = iVar18;
            if (iVar14 < iVar18) {
              piVar10[0x20] = iVar14;
            }
          }
          else {
            piVar10[0x20] = iVar14;
          }
        }
        if ((*piVar10 <= *(int *)(iVar15 + 0x16c)) &&
           ((*(int *)(iVar15 + 0x16c) <= piVar10[1] || (piVar10[1] == -2)))) {
          iVar14 = FUN_00057cf0(uVar8,piVar10[0x30]);
          lVar24 = CONCAT44(extraout_s1_00,extraout_s0);
          uVar9 = extraout_s3_00;
          uVar26 = extraout_s5_00;
          uVar27 = extraout_s7_00;
          if (iVar14 == 0) {
            if (iVar11 == 0) {
              *piVar12 = (int)piVar10;
            }
            local_238[iVar11] = piVar10;
            iVar11 = iVar11 + 1;
            local_23c = local_23c + piVar10[0x20];
          }
        }
        puVar17 = puVar17 + 1;
      } while (local_34 != puVar17);
      if (0 < iVar11) {
        iVar14 = local_238[0][0x28];
        if ((0 < iVar14) && (*(int *)(iVar15 + 0x200) < *local_238[0])) {
          *(int *)(iVar15 + 0x200) = *local_238[0];
          if (0x20 < iVar14) {
            iVar14 = 0x20;
          }
          *(int *)(iVar15 + 0x204) = iVar14;
          puVar6 = PTR_DAT_004d90b4;
          if (0 < iVar14) {
            iVar14 = 0;
            param_1 = param_1 + param_2 * 0x80;
            do {
              uVar13 = FUN_0000aae0(*(undefined4 *)(local_238[0][0x25] + iVar14 * 4),0);
              lVar24 = CONCAT44(extraout_s1_01,extraout_s0_00);
              uVar9 = extraout_s3_01;
              uVar26 = extraout_s5_01;
              uVar27 = extraout_s7_01;
              if (0x7fffffff < uVar13) {
                uVar13 = FUN_0000af04(0);
                lVar24 = CONCAT44(extraout_s1_02,extraout_s0_01);
                uVar9 = extraout_s3_02;
                uVar26 = extraout_s5_02;
                uVar27 = extraout_s7_02;
                if (iVar14 < *(int *)puVar6 + -2) {
                  do {
                    iVar18 = 0;
                    do {
                      if (iVar14 <= iVar18) goto LAB_0005503a;
                      iVar1 = iVar18 * 4;
                      iVar18 = iVar18 + 1;
                    } while (uVar13 != *(uint *)(param_1 + 0x180 + iVar1));
                    uVar13 = FUN_0000af04(0);
                    lVar24 = CONCAT44(extraout_s1_03,extraout_s0_02);
                    uVar9 = extraout_s3_03;
                    uVar26 = extraout_s5_03;
                    uVar27 = extraout_s7_03;
                  } while( true );
                }
              }
LAB_0005503a:
              iVar18 = iVar14 * 4;
              iVar14 = iVar14 + 1;
              *(uint *)(param_1 + iVar18 + 0x180) = uVar13;
            } while (iVar14 < *(int *)(iVar15 + 0x204));
          }
        }
        puVar7 = DAT_005a7930;
        if (1 < iVar11) {
          puVar19 = DAT_005a7930 + 2;
          uVar13 = *DAT_005a7930;
          puVar20 = DAT_005a7930 + 1;
          puVar21 = DAT_005a7930 + 3;
          puVar22 = DAT_005a7930 + 4;
          puVar23 = DAT_005a7930 + 5;
          lVar3 = (ulonglong)uVar13 * (ulonglong)*puVar19;
          uVar16 = (uint)lVar3;
          *DAT_005a7930 = uVar16 + *puVar22;
          uVar13 = *puVar20 * *puVar19 + uVar13 * *puVar21 + (int)((ulonglong)lVar3 >> 0x20) +
                   *puVar23 + (uint)CARRY4(uVar16,*puVar22);
          puVar7[1] = uVar13;
          if (local_23c * 10 != 0) {
            uVar13 = (uint)((ulonglong)uVar13 * (ulonglong)(uint)(local_23c * 10) >> 0x20);
          }
          iVar14 = 0;
          iVar18 = 0;
          do {
            if (iVar11 <= iVar18) goto LAB_000550bc;
            ppiVar2 = local_238 + iVar18;
            iVar18 = iVar18 + 1;
            iVar14 = iVar14 + (*ppiVar2)[0x20] * 10;
          } while (iVar14 <= (int)uVar13);
          *piVar12 = (int)*ppiVar2;
        }
      }
    }
LAB_000550bc:
    puVar7 = DAT_005a7930;
    iVar11 = *piVar12;
    iVar14 = *(int *)(iVar11 + 0x8c);
    if (0 < iVar14) {
      iVar18 = *(int *)(iVar11 + 0x90);
      if (iVar14 != iVar18) {
        puVar20 = DAT_005a7930 + 2;
        uVar13 = *DAT_005a7930;
        puVar21 = DAT_005a7930 + 1;
        puVar22 = DAT_005a7930 + 3;
        puVar23 = DAT_005a7930 + 4;
        puVar19 = DAT_005a7930 + 5;
        lVar3 = (ulonglong)uVar13 * (ulonglong)*puVar20;
        uVar16 = (uint)lVar3;
        *DAT_005a7930 = uVar16 + *puVar23;
        uVar13 = *puVar21 * *puVar20 + uVar13 * *puVar22 + (int)((ulonglong)lVar3 >> 0x20) +
                 *puVar19 + (uint)CARRY4(uVar16,*puVar23);
        uVar16 = iVar18 - iVar14;
        puVar7[1] = uVar13;
        if (uVar16 != 0 && uVar16 != 0xffffffff) {
          uVar13 = (uint)((ulonglong)uVar13 * (ulonglong)uVar16 >> 0x20);
        }
        iVar14 = iVar14 + uVar13;
      }
      piVar10 = (int *)FUN_0002b240((int)lVar24,
                                    *(int *)(puVar5 + 0x5c) + *(int *)(puVar5 + 0x10) * 0x18 + 0x2a4
                                    ,iVar11 + 0xa8);
      lVar24 = (ulonglong)extraout_s1_04 << 0x20;
      *piVar10 = iVar14;
      iVar11 = *piVar12;
      *(undefined4 *)(iVar11 + 0x88) = 0;
      uVar9 = extraout_s3_04;
      uVar26 = extraout_s5_04;
      uVar27 = extraout_s7_04;
    }
    *(undefined4 *)(iVar11 + 0x80) = 0;
  }
  else {
    iVar11 = local_38[*(int *)(*(int *)(param_1 + 0x20) + 0x18)];
    *(int *)(iVar15 + 0x168) = iVar11;
  }
  uVar29 = CONCAT44((int)((ulonglong)lVar24 >> 0x20),*(float *)(iVar11 + 0x60));
  if (*(float *)(iVar11 + 0x60) <= 0.0) {
    *(undefined4 *)(iVar15 + 0x170) = 0;
  }
  else {
    uVar28 = FloatVectorMult(CONCAT44(uVar9,*(undefined4 *)(iVar11 + 100)),
                             CONCAT44(uVar26,*(undefined4 *)(iVar11 + 0x74)),2,0x20);
    uVar29 = FloatVectorAdd(uVar29,uVar28,2);
    uVar29 = FloatVectorMax(CONCAT44(uVar9,DAT_00055208),uVar29,2,0x20);
    *(int *)(iVar15 + 0x170) = (int)uVar29;
  }
  uVar8 = *(undefined4 *)(iVar11 + 0x68);
  *(undefined4 *)(iVar15 + 0x174) = uVar8;
  if (*(float *)(iVar11 + 0x70) != 0.0) {
    uVar28 = FloatVectorMult(CONCAT44(uVar26,*(float *)(iVar11 + 0x70)),
                             CONCAT44(uVar27,*(undefined4 *)(iVar15 + 0x54)),2,0x20);
    uVar29 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar29 >> 0x20),uVar8),uVar28,2);
    fVar25 = DAT_00055208;
    if (DAT_00055208 < (float)uVar29) {
      fVar25 = (float)uVar29;
    }
    *(float *)(iVar15 + 0x174) = fVar25;
  }
  FUN_00057d48(iVar11,*(undefined4 *)(iVar11 + 0x74));
  if (local_38 != (undefined4 *)0x0) {
    operator_delete(local_38);
  }
  if (*(int *)puVar4 != local_2c) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail(*(int *)puVar4);
  }
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

## FUN_0006f6d8 — 0006f6d8

- 函数名: FUN_0006f6d8
- 函数体: 31 字节
- 调用者数: 2 / 被调用者数: 3

```c

void FUN_0006f6d8(int param_1)

{
  undefined4 uVar1;
  
  uVar1 = FUN_00052f80();
  FUN_000547ec(uVar1,1);
  uVar1 = FUN_00052f80();
  FUN_00057c08(uVar1,*(undefined4 *)(param_1 + 0x44),*(undefined1 *)(param_1 + 0x50));
  return;
}


```

