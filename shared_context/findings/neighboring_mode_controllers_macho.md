# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_00072b88 — 00072b88

- 函数名: FUN_00072b88
- 函数体: 13 字节
- 调用者数: 0 / 被调用者数: 1

```c

undefined4 FUN_00072b88(undefined4 param_1)

{
  FUN_00072b98();
  return param_1;
}


```

## FUN_00072b74 — 00072b74

- 函数名: FUN_00072b74
- 函数体: 17 字节
- 调用者数: 0 / 被调用者数: 2

```c

void FUN_00072b74(void *param_1)

{
  FUN_00072b98();
  operator_delete(param_1);
  return;
}


```

## FUN_00074174 — 00075098

- 函数名: FUN_00075098
- 函数体: 229 字节
- 调用者数: 1 / 被调用者数: 3

```c

void FUN_00075098(float *param_1,undefined4 param_2)

{
  byte bVar1;
  undefined4 uVar2;
  char cVar3;
  float fVar4;
  undefined4 extraout_s1;
  undefined8 uVar5;
  undefined4 extraout_s3;
  float fVar6;
  undefined8 unaff_d8;
  undefined8 uVar7;
  
  if (*(char *)(param_1 + 2) == '\0') {
    return;
  }
  fVar6 = *param_1;
  uVar5 = CONCAT44((int)((ulonglong)unaff_d8 >> 0x20),fVar6);
  uVar7 = FloatVectorMult(CONCAT44(param_2,param_2),0x4080000040800000,2,0x20);
  if (PTR_DAT_004d9048[0x55] == '\0') {
    bVar1 = (byte)(((uint)(fVar6 == 0.0) << 0x1e) >> 0x18);
    cVar3 = -((char)((byte)(((uint)(fVar6 < 0.0) << 0x1f) >> 0x18) | bVar1) >> 7);
    if ((bool)(bVar1 >> 6) || (bool)cVar3 != NAN(fVar6)) {
      if (cVar3 == '\0') goto LAB_0007514a;
      uVar5 = FloatVectorAdd(uVar7,uVar5,2);
      fVar4 = 0.0;
      if ((int)((uint)((float)uVar5 < 0.0) << 0x1f) < 0) {
        fVar4 = (float)uVar5;
      }
    }
    else {
      uVar5 = FloatVectorSub(uVar5,uVar7,2,0x20);
      fVar4 = 0.0;
      if (0.0 < (float)uVar5) {
        fVar4 = (float)uVar5;
      }
    }
    *param_1 = fVar4;
  }
  else {
    uVar5 = FloatVectorSub(uVar5,uVar7,2,0x20);
    fVar4 = -1.0;
    if (-1.0 < (float)uVar5) {
      fVar4 = (float)uVar5;
    }
    *param_1 = fVar4;
    if (((int)((uint)(fVar4 < 0.0) << 0x1f) < 0) && (param_1[1] != -NAN)) {
      param_1[1] = -NAN;
      uVar2 = FUN_0030a1d8();
      FUN_0030a780(uVar2,param_1 + 2);
    }
  }
LAB_0007514a:
  if ((param_1[1] != 0.0) && (fVar6 != *param_1)) {
    uVar2 = FUN_0030a1d8();
    uVar5 = FloatVectorAbsolute(CONCAT44(extraout_s3,*param_1),4);
    uVar5 = FloatVectorMult(uVar5,CONCAT44(extraout_s1,DAT_00075180),2,0x20);
    FUN_0030a23c(uVar2,(int)uVar5);
  }
  return;
}


```

## FUN_00074168 — 00074168

- 函数名: FUN_00074168
- 函数体: 9 字节
- 调用者数: 0 / 被调用者数: 1

```c

void FUN_00074168(void *param_1)

{
  operator_delete(param_1);
  return;
}


```

## FUN_00074418 — 00074418

- 函数名: FUN_00074418
- 函数体: 11 字节
- 调用者数: 2 / 被调用者数: 0

```c

void FUN_00074418(int *param_1)

{
  (**(code **)(*param_1 + 0x18))();
  return;
}


```

## FUN_00074424 — 000753fc

- 函数名: FUN_000753fc
- 函数体: 791 字节
- 调用者数: 2 / 被调用者数: 7

```c

void FUN_000753fc(int param_1,undefined4 param_2)

{
  undefined *puVar1;
  undefined4 uVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int *piVar6;
  uint uVar7;
  uint uVar8;
  int iVar9;
  undefined4 extraout_s1;
  longlong lVar10;
  uint extraout_s1_00;
  uint extraout_s1_01;
  float fVar11;
  undefined4 extraout_s3;
  longlong lVar12;
  undefined4 extraout_s3_00;
  undefined4 extraout_s3_01;
  undefined4 uVar13;
  uint extraout_s3_02;
  uint extraout_s3_03;
  undefined4 extraout_s5;
  longlong lVar14;
  undefined4 extraout_s5_00;
  undefined4 extraout_s5_01;
  undefined4 uVar15;
  uint extraout_s5_02;
  undefined4 extraout_s5_03;
  undefined4 extraout_s7;
  undefined4 extraout_s7_00;
  undefined4 extraout_s7_01;
  undefined4 extraout_s7_02;
  undefined4 extraout_s7_03;
  undefined8 extraout_d4;
  longlong lVar16;
  longlong extraout_d5;
  longlong lVar17;
  undefined8 uVar18;
  ulonglong uVar19;
  undefined8 unaff_d14;
  undefined8 uVar20;
  ulonglong uVar21;
  undefined8 uVar22;
  undefined8 uVar23;
  undefined8 uVar24;
  undefined8 uVar25;
  undefined8 uVar26;
  undefined8 uVar27;
  undefined8 uVar28;
  undefined8 uVar29;
  undefined8 uVar30;
  undefined8 uVar31;
  undefined8 uVar32;
  undefined4 local_94;
  undefined4 local_90;
  undefined4 local_8c;
  int *local_88;
  undefined4 local_84;
  int *local_80;
  int *local_7c;
  undefined4 local_78;
  int *local_74;
  undefined4 local_70;
  undefined4 local_6c;
  undefined1 auStack_68 [8];
  
  uVar2 = FUN_003ecb20();
  FUN_003ed850(auStack_68,uVar2);
  uVar2 = FUN_003ecb20();
  FUN_003ed850(&local_70,uVar2);
  puVar1 = PTR_DAT_004d9050;
  local_7c = *(int **)(param_1 + 8);
  local_78 = *(undefined4 *)(param_1 + 0xc);
  lVar12 = CONCAT44(extraout_s3,local_6c);
  if (local_7c != (int *)0x0) {
    uVar25 = FloatVectorMult(lVar12,0x3f0000003f000000,2,0x20);
    uVar20 = CONCAT44((int)((ulonglong)unaff_d14 >> 0x20),DAT_00075718);
    uVar22 = FloatVectorMult(CONCAT44(extraout_s1,local_70),0x3f0000003f000000,2,0x20);
    lVar10 = CONCAT44(extraout_s1,DAT_00075714);
    uVar18 = CONCAT44(param_2,param_2);
    uVar28 = FloatVectorAdd(uVar22,lVar10,2);
    uVar22 = FloatVectorSub(uVar20,uVar22,2,0x20);
    uVar29 = FloatVectorAdd(uVar25,lVar10,2);
    uVar25 = FloatVectorSub(uVar20,uVar25,2,0x20);
    uVar2 = extraout_s7;
    local_74 = local_7c;
    uVar13 = extraout_s5;
    do {
      iVar9 = *local_74;
      if (*(int *)(iVar9 + 0x4c) != 0) {
        lVar10 = CONCAT44((int)((ulonglong)lVar10 >> 0x20),DAT_0052bfe0);
        lVar14 = CONCAT44(uVar13,DAT_0052bfe4);
        for (iVar3 = *(int *)(iVar9 + 0x260); *(int *)(iVar3 + 0x38) != 0;
            iVar3 = *(int *)(*(int *)(iVar3 + 0x38) + 4)) {
        }
        if (*(char *)(iVar3 + 0x48) != '\0') {
          iVar4 = *(int *)(iVar9 + 0x5f8);
          iVar5 = *(int *)(iVar4 + 0x38);
          iVar3 = iVar4;
          while (iVar5 != 0) {
            iVar3 = *(int *)(iVar5 + 4);
            iVar5 = *(int *)(iVar3 + 0x38);
          }
          fVar11 = *(float *)(iVar3 + 0x48);
          lVar12 = CONCAT44((int)((ulonglong)lVar12 >> 0x20),fVar11);
          if ((int)((uint)(fVar11 < (float)uVar22) << 0x1f) < 0) {
            uVar23 = FloatVectorSub(uVar22,lVar12,2,0x20);
            uVar24 = uVar22;
LAB_0007551c:
            lVar16 = FloatVectorAdd(lVar10,uVar23,2);
          }
          else {
            uVar24 = uVar28;
            lVar16 = lVar10;
            if ((float)uVar28 < fVar11) {
              uVar23 = FloatVectorSub(uVar28,lVar12,2,0x20);
              goto LAB_0007551c;
            }
          }
          fVar11 = *(float *)(iVar3 + 0x4c);
          uVar24 = CONCAT44((int)((ulonglong)uVar24 >> 0x20),fVar11);
          if ((int)((uint)(fVar11 < (float)uVar25) << 0x1f) < 0) {
            uVar23 = FloatVectorSub(uVar25,uVar24,2,0x20);
LAB_0007554e:
            lVar17 = FloatVectorAdd(lVar14,uVar23,2);
          }
          else {
            lVar17 = lVar14;
            if ((float)uVar29 < fVar11) {
              uVar23 = FloatVectorSub(uVar29,uVar24,2,0x20);
              goto LAB_0007554e;
            }
          }
          uVar23 = FloatVectorMult(lVar17,uVar18,2,0x20);
          uVar30 = FloatVectorMult(CONCAT44(uVar2,DAT_0052bfe8),uVar18,2,0x20);
          uVar26 = FloatVectorMult(lVar16,uVar18,2,0x20);
          local_84 = *(undefined4 *)(param_1 + 0xc);
          local_88 = *(int **)(param_1 + 8);
          uVar23 = FloatVectorMult(uVar23,0x4170000041700000,2,0x20);
          uVar31 = FloatVectorMult(uVar30,0x4170000041700000,2,0x20);
          uVar27 = FloatVectorMult(uVar26,0x4170000041700000,2,0x20);
          uVar30 = FloatVectorSub(lVar14,uVar23,2,0x20);
          uVar26 = FloatVectorSub(CONCAT44(uVar2,DAT_0052bfe8),uVar31,2,0x20);
          uVar23 = FloatVectorSub(lVar10,uVar27,2,0x20);
          local_80 = local_88;
          if (local_88 != (int *)0x0) {
            do {
              iVar5 = *local_80;
              piVar6 = local_80;
              if (iVar5 != iVar9) {
                piVar6 = *(int **)(iVar5 + 0x4c);
              }
              if (iVar5 != iVar9 && piVar6 != (int *)0x0) {
                for (iVar4 = *(int *)(iVar5 + 0x260); *(int *)(iVar4 + 0x38) != 0;
                    iVar4 = *(int *)(*(int *)(iVar4 + 0x38) + 4)) {
                }
                if (*(char *)(iVar4 + 0x48) != '\0') {
                  for (iVar5 = *(int *)(iVar5 + 0x5f8); *(int *)(iVar5 + 0x38) != 0;
                      iVar5 = *(int *)(*(int *)(iVar5 + 0x38) + 4)) {
                  }
                  uVar19 = FloatVectorSub(CONCAT44(uVar2,*(undefined4 *)(iVar5 + 0x48)),
                                          CONCAT44((int)((ulonglong)lVar12 >> 0x20),
                                                   *(undefined4 *)(iVar3 + 0x48)),2,0x20);
                  uVar21 = FloatVectorSub(CONCAT44((int)((ulonglong)lVar16 >> 0x20),
                                                   *(undefined4 *)(iVar5 + 0x4c)),
                                          CONCAT44((int)((ulonglong)uVar24 >> 0x20),
                                                   *(undefined4 *)(iVar3 + 0x4c)),2,0x20);
                  uVar27 = FloatVectorSub(CONCAT44((int)((ulonglong)lVar14 >> 0x20),
                                                   *(undefined4 *)(iVar5 + 0x50)),
                                          CONCAT44((int)((ulonglong)lVar10 >> 0x20),
                                                   *(undefined4 *)(iVar3 + 0x50)),2,0x20);
                  uVar32 = FloatVectorMult(uVar19,uVar19,2,0x20);
                  uVar24 = FloatVectorMult(uVar21,uVar21,2,0x20);
                  uVar31 = FloatVectorMult(uVar27,uVar27,2,0x20);
                  uVar24 = FloatVectorAdd(uVar32,uVar24,2);
                  uVar24 = FloatVectorAdd(uVar24,uVar31,2);
                  fVar11 = (float)uVar24;
                  if ((int)((uint)(fVar11 < DAT_0007571c) << 0x1f) < 0) {
                    if (fVar11 <= 0.0) {
                      lVar12 = (ulonglong)*(uint *)puVar1 * (ulonglong)*(uint *)(puVar1 + 8);
                      uVar8 = (uint)lVar12;
                      uVar7 = *(int *)(puVar1 + 4) * *(uint *)(puVar1 + 8) +
                              *(uint *)puVar1 * *(int *)(puVar1 + 0xc) +
                              (int)((ulonglong)lVar12 >> 0x20) + *(int *)(puVar1 + 0x14) +
                              (uint)CARRY4(uVar8,*(uint *)(puVar1 + 0x10));
                      uVar2 = (undefined4)((ulonglong)uVar7 * 0xff3a >> 0x20);
                      *(uint *)puVar1 = uVar8 + *(uint *)(puVar1 + 0x10);
                      *(uint *)(puVar1 + 4) = uVar7;
                      uVar7 = FUN_003010b8(uVar2,uVar7,(int)((ulonglong)uVar7 * 0xff3a));
                      uVar8 = FUN_003010d0(uVar2);
                      uVar27 = 0;
                      uVar24 = 0x3f8000003f800000;
                      uVar19 = (ulonglong)uVar7;
                      uVar21 = (ulonglong)uVar8;
                      uVar2 = extraout_s7_01;
                      uVar13 = extraout_s3_01;
                      uVar15 = extraout_s5_01;
                    }
                    else {
                      uVar2 = FUN_00301044(fVar11);
                      uVar24 = CONCAT44(uVar2,uVar2);
                      uVar2 = extraout_s7_00;
                      uVar13 = extraout_s3_00;
                      uVar15 = extraout_s5_00;
                    }
                    fVar11 = (float)uVar24;
                    uVar24 = FloatVectorSub(uVar20,uVar24,2,0x20);
                    uVar31 = FloatVectorMult(uVar24,CONCAT44(uVar15,(float)uVar21 / fVar11),2,0x20);
                    uVar32 = FloatVectorMult(CONCAT44(uVar13,(float)uVar19 / fVar11),uVar24,2,0x20);
                    uVar24 = FloatVectorMult(uVar24,CONCAT44(uVar2,(float)uVar27 / fVar11),2,0x20);
                    uVar27 = FloatVectorMult(uVar31,uVar18,2,0x20);
                    uVar31 = FloatVectorMult(uVar32,uVar18,2,0x20);
                    uVar24 = FloatVectorMult(uVar24,uVar18,2,0x20);
                    uVar27 = FloatVectorMult(uVar27,0x4170000041700000,2,0x20);
                    uVar32 = FloatVectorMult(uVar24,0x4170000041700000,2,0x20);
                    uVar24 = FloatVectorMult(uVar31,0x4170000041700000,2,0x20);
                    uVar30 = FloatVectorAdd(uVar30,uVar27,2);
                    uVar26 = FloatVectorAdd(uVar26,uVar32,2);
                    uVar23 = FloatVectorAdd(uVar23,uVar24,2);
                  }
                }
              }
              FUN_00075950(&local_88);
              lVar14 = (ulonglong)extraout_s5_02 << 0x20;
              lVar12 = (ulonglong)extraout_s3_02 << 0x20;
              lVar10 = (ulonglong)extraout_s1_00 << 0x20;
              uVar2 = extraout_s7_02;
              uVar24 = extraout_d4;
              lVar16 = extraout_d5;
            } while (local_80 != (int *)0x0);
            iVar4 = *(int *)(iVar9 + 0x5f8);
            lVar12 = CONCAT44(extraout_s3_02,*(undefined4 *)(iVar3 + 0x48));
            uVar24 = CONCAT44((int)((ulonglong)extraout_d4 >> 0x20),*(undefined4 *)(iVar3 + 0x4c));
          }
          uVar27 = FloatVectorSub(lVar12,uVar23,2,0x20);
          uVar23 = FloatVectorSub(uVar24,uVar30,2,0x20);
          uVar24 = FloatVectorSub(CONCAT44((int)((ulonglong)lVar10 >> 0x20),
                                           *(undefined4 *)(iVar3 + 0x50)),uVar26,2,0x20);
          local_94 = (undefined4)uVar27;
          local_90 = (undefined4)uVar23;
          local_8c = (undefined4)uVar24;
          FUN_0000606c(local_8c,iVar4,&local_94);
        }
      }
      FUN_00075950(&local_7c);
      lVar12 = (ulonglong)extraout_s3_03 << 0x20;
      lVar10 = (ulonglong)extraout_s1_01 << 0x20;
      uVar2 = extraout_s7_03;
      uVar13 = extraout_s5_03;
    } while (local_74 != (int *)0x0);
  }
  return;
}


```

## FUN_00074770 — 未找到

(函数未找到)

## FUN_00074778 — 未找到

(函数未找到)

## FUN_0007477c — 未找到

(函数未找到)

## FUN_000747ac — 000747ac

- 函数名: FUN_000747ac
- 函数体: 13 字节
- 调用者数: 1 / 被调用者数: 1

```c

undefined4 FUN_000747ac(undefined4 param_1)

{
  FUN_000747bc();
  return param_1;
}


```

## FUN_00074798 — 00074798

- 函数名: FUN_00074798
- 函数体: 17 字节
- 调用者数: 0 / 被调用者数: 2

```c

void FUN_00074798(void *param_1)

{
  FUN_000747bc();
  operator_delete(param_1);
  return;
}


```

