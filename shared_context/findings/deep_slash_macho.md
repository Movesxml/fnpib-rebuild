# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_00017d74 — 00017d74

- 函数名: FUN_00017d74
- 函数体: 615 字节
- 调用者数: 1 / 被调用者数: 2

```c

uint FUN_00017d74(int param_1,int param_2)

{
  int iVar1;
  uint uVar2;
  undefined4 uVar3;
  int iVar4;
  uint uVar5;
  undefined4 extraout_s1;
  undefined8 uVar6;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  undefined4 extraout_s3_01;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  undefined4 extraout_s5_01;
  undefined4 extraout_s7;
  undefined8 uVar7;
  undefined4 extraout_s9;
  undefined8 uVar8;
  undefined4 extraout_s11;
  undefined4 extraout_s13;
  undefined8 unaff_d9;
  undefined8 unaff_d10;
  undefined8 uVar9;
  undefined8 uVar10;
  undefined8 uVar11;
  undefined8 uVar12;
  undefined8 uVar13;
  undefined8 uVar14;
  undefined8 uVar15;
  undefined8 uVar16;
  undefined8 uVar17;
  undefined8 uVar18;
  undefined8 uVar19;
  undefined4 local_48;
  undefined4 local_44;
  undefined4 local_40;
  undefined4 local_3c;
  undefined4 local_38;
  undefined4 local_34;
  
  uVar5 = 0;
  if (((*(int *)(param_1 + 0x38) != 0) && (uVar5 = 0, 0.0 < *(float *)(param_1 + 0xf0))) &&
     (param_2 != 0)) {
    uVar5 = 0;
    if ((*(int **)(param_2 + 0x38) != (int *)0x0) &&
       (uVar5 = 0, PTR_DAT_004d9048[0x18] == '\0' && PTR_DAT_004d9048[10] == '\0')) {
      iVar1 = (**(code **)(**(int **)(param_2 + 0x38) + 8))();
      uVar2 = (**(code **)(**(int **)(param_1 + 0x38) + 0xc))
                        (*(int **)(param_1 + 0x38),*(undefined4 *)(param_2 + 0x38),&local_3c);
      uVar5 = iVar1 != 1 & uVar2;
      if (iVar1 == 1) {
        uVar2 = uVar2 ^ 1;
      }
      if (iVar1 == 1 && uVar2 == 0) {
        iVar4 = *(int *)(param_2 + 0x38);
        uVar5 = 1;
        iVar1 = *(int *)(param_1 + 0x38);
        uVar8 = CONCAT44(extraout_s9,*(undefined4 *)(iVar4 + 8));
        uVar17 = CONCAT44(extraout_s3,*(undefined4 *)(iVar1 + 8));
        uVar16 = CONCAT44(extraout_s11,*(undefined4 *)(iVar4 + 4));
        uVar6 = CONCAT44(extraout_s1,*(undefined4 *)(iVar1 + 4));
        uVar10 = FloatVectorSub(uVar17,uVar8,2,0x20);
        uVar7 = CONCAT44(extraout_s7,*(undefined4 *)(iVar4 + 0xc));
        uVar13 = FloatVectorSub(uVar6,uVar16,2,0x20);
        uVar19 = CONCAT44(extraout_s5,*(undefined4 *)(iVar1 + 0xc));
        uVar14 = CONCAT44(extraout_s13,*(undefined4 *)(iVar4 + 0x14));
        uVar11 = FloatVectorMult(uVar10,uVar10,2,0x20);
        uVar10 = FloatVectorMult(uVar14,uVar14,2,0x20);
        uVar14 = FloatVectorMult(uVar13,uVar13,2,0x20);
        uVar14 = FloatVectorAdd(uVar14,uVar11,2);
        uVar11 = FloatVectorSub(uVar19,uVar7,2,0x20);
        uVar11 = FloatVectorMult(uVar11,uVar11,2,0x20);
        uVar14 = FloatVectorAdd(uVar14,uVar11,2);
        if (-1 < (int)((uint)((float)uVar14 < (float)uVar10) << 0x1f)) {
          uVar11 = CONCAT44((int)((ulonglong)unaff_d10 >> 0x20),local_3c);
          uVar13 = CONCAT44((int)((ulonglong)unaff_d9 >> 0x20),local_38);
          uVar18 = FloatVectorMult(uVar11,uVar11,2,0x20);
          uVar3 = (undefined4)((ulonglong)uVar14 >> 0x20);
          uVar14 = CONCAT44(uVar3,local_34);
          uVar15 = FloatVectorMult(uVar13,uVar13,2,0x20);
          uVar12 = FloatVectorMult(uVar14,uVar14,2,0x20);
          uVar9 = FloatVectorAdd(uVar16,uVar11,2);
          uVar11 = FloatVectorAdd(uVar7,uVar14,2);
          uVar16 = FloatVectorAdd(uVar18,uVar15,2);
          uVar7 = CONCAT44(extraout_s7,DAT_0052bfe0);
          uVar13 = FloatVectorAdd(uVar8,uVar13,2);
          uVar8 = CONCAT44(extraout_s9,DAT_0052bfe4);
          uVar14 = CONCAT44(uVar3,DAT_0052bfe8);
          local_48 = DAT_0052bfe0;
          uVar16 = FloatVectorAdd(uVar16,uVar12,2);
          local_44 = DAT_0052bfe4;
          local_40 = DAT_0052bfe8;
          if ((int)((uint)((float)uVar16 < (float)uVar10) << 0x1f) < 0) {
            uVar6 = FloatVectorSub(uVar10,uVar16,2,0x20);
            uVar3 = FUN_00301044((int)uVar6);
            uVar17 = FloatVectorMult(CONCAT44(extraout_s3_00,local_38),0,2,0x20);
            uVar19 = FloatVectorMult(CONCAT44(extraout_s1_00,local_3c),0,2,0x20);
            uVar6 = FloatVectorMult(CONCAT44(extraout_s5_00,local_34),0,2,0x20);
            uVar19 = FloatVectorSub(uVar19,uVar17,2,0x20);
            uVar17 = FloatVectorSub(CONCAT44(extraout_s3_00,local_38),uVar6,2,0x20);
            uVar6 = FloatVectorSub(uVar6,CONCAT44(extraout_s1_00,local_3c),2,0x20);
            local_48 = (undefined4)uVar17;
            local_44 = (undefined4)uVar6;
            local_40 = (undefined4)uVar19;
            FUN_00009b50(local_44,&local_48);
            uVar6 = FloatVectorSub(CONCAT44(extraout_s3_01,
                                            *(undefined4 *)(*(int *)(param_2 + 0x38) + 0x14)),
                                   CONCAT44(uVar3,uVar3),2,0x20);
            uVar7 = FloatVectorMult(CONCAT44(extraout_s1_01,local_48),uVar6,2,0x20);
            uVar8 = FloatVectorMult(uVar6,CONCAT44(extraout_s1_01,local_44),2,0x20);
            uVar14 = FloatVectorMult(uVar6,CONCAT44(extraout_s1_01,local_40),2,0x20);
            iVar1 = *(int *)(param_1 + 0x38);
            uVar6 = CONCAT44(extraout_s1_01,*(undefined4 *)(iVar1 + 4));
            uVar17 = CONCAT44(extraout_s3_01,*(undefined4 *)(iVar1 + 8));
            uVar19 = CONCAT44(extraout_s5_01,*(undefined4 *)(iVar1 + 0xc));
          }
          uVar10 = FloatVectorAdd(uVar13,uVar8,2);
          uVar16 = FloatVectorAdd(uVar9,uVar7,2);
          uVar12 = FloatVectorSub(uVar11,uVar14,2,0x20);
          uVar10 = FloatVectorSub(uVar17,uVar10,2,0x20);
          uVar15 = FloatVectorSub(uVar6,uVar16,2,0x20);
          uVar16 = FloatVectorAdd(uVar11,uVar14,2);
          uVar14 = FloatVectorMult(uVar10,uVar10,2,0x20);
          uVar11 = FloatVectorSub(uVar19,uVar16,2,0x20);
          uVar10 = FloatVectorMult(uVar15,uVar15,2,0x20);
          uVar16 = FloatVectorSub(uVar13,uVar8,2,0x20);
          uVar8 = FloatVectorSub(uVar9,uVar7,2,0x20);
          uVar11 = FloatVectorMult(uVar11,uVar11,2,0x20);
          uVar7 = FloatVectorAdd(uVar10,uVar14,2);
          uVar7 = FloatVectorAdd(uVar7,uVar11,2);
          if ((int)((uint)((float)uVar7 < *(float *)(param_1 + 0xf0)) << 0x1f) < 0) {
            uVar5 = 1;
          }
          else {
            uVar17 = FloatVectorSub(uVar17,uVar16,2,0x20);
            uVar5 = 0;
            uVar6 = FloatVectorSub(uVar6,uVar8,2,0x20);
            uVar19 = FloatVectorSub(uVar19,uVar12,2,0x20);
            uVar17 = FloatVectorMult(uVar17,uVar17,2,0x20);
            uVar7 = FloatVectorMult(uVar6,uVar6,2,0x20);
            uVar6 = FloatVectorMult(uVar19,uVar19,2,0x20);
            uVar17 = FloatVectorAdd(uVar7,uVar17,2);
            uVar6 = FloatVectorAdd(uVar17,uVar6,2);
            if ((int)((uint)((float)uVar6 < *(float *)(param_1 + 0xf0)) << 0x1f) < 0) {
              uVar5 = 1;
            }
          }
        }
      }
    }
  }
  return uVar5;
}


```

## FUN_00017fdc — 00017fdc

- 函数名: FUN_00017fdc
- 函数体: 681 字节
- 调用者数: 1 / 被调用者数: 5

```c

undefined4 FUN_00017fdc(int param_1,int param_2)

{
  int iVar1;
  undefined4 uVar2;
  int *piVar3;
  undefined4 *puVar4;
  undefined4 extraout_s1;
  undefined8 uVar5;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined4 extraout_s3;
  undefined8 uVar6;
  undefined4 extraout_s3_00;
  undefined4 extraout_s3_01;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  undefined4 extraout_s7;
  longlong lVar7;
  uint extraout_s7_00;
  undefined4 extraout_s9;
  undefined8 extraout_d4;
  undefined4 extraout_s11;
  undefined4 extraout_s13;
  undefined8 uVar8;
  undefined8 uVar9;
  undefined8 uVar10;
  undefined8 uVar11;
  undefined8 uVar12;
  undefined8 uVar13;
  undefined8 uVar14;
  undefined8 uVar15;
  undefined8 uVar16;
  undefined8 uVar17;
  undefined4 local_78;
  undefined4 local_74;
  undefined4 local_70;
  undefined4 local_6c;
  undefined4 local_68;
  undefined4 local_64;
  undefined4 local_60;
  undefined4 uStack_5c;
  undefined4 local_58;
  undefined4 local_54;
  undefined4 local_50;
  undefined4 local_4c;
  undefined4 local_48;
  undefined4 local_44;
  
  if (*(int *)(param_1 + 0x38) == 0) {
    return 0;
  }
  if (*(float *)(param_1 + 0xf0) <= 0.0) {
    return 0;
  }
  if (param_2 == 0) {
    return 0;
  }
  piVar3 = *(int **)(param_2 + 0x38);
  if (piVar3 == (int *)0x0) {
    return 0;
  }
  if (PTR_DAT_004d9048[10] != '\0' || PTR_DAT_004d9048[0x18] != '\0') {
    return 0;
  }
  iVar1 = (**(code **)(*piVar3 + 8))(piVar3);
  if (iVar1 != 1) {
    uVar2 = (**(code **)(**(int **)(param_1 + 0x38) + 0xc))
                      (*(int **)(param_1 + 0x38),*(undefined4 *)(param_2 + 0x38),&local_4c);
    return uVar2;
  }
  FUN_002ed28c(&local_6c);
  puVar4 = *(undefined4 **)(param_2 + 0x38);
  local_6c = *puVar4;
  local_68 = puVar4[1];
  local_64 = puVar4[2];
  local_60 = puVar4[3];
  uStack_5c = puVar4[4];
  local_54 = puVar4[6];
  local_50 = puVar4[7];
  uVar5 = FloatVectorMult(CONCAT44(extraout_s1,puVar4[5]),0x3fc000003fc00000,2,0x20);
  local_58 = (undefined4)uVar5;
  iVar1 = FUN_002ed344(local_58,&local_6c,puVar4,&local_4c);
  if (iVar1 == 1) {
    iVar1 = *(int *)(param_2 + 0x38);
    uVar11 = CONCAT44(extraout_s7,*(undefined4 *)(iVar1 + 4));
    uVar15 = CONCAT44(extraout_s5,*(undefined4 *)(iVar1 + 8));
    uVar13 = FloatVectorSub(CONCAT44(extraout_s11,local_68),uVar11,2,0x20);
    uVar9 = FloatVectorSub(CONCAT44(extraout_s13,local_64),uVar15,2,0x20);
    uVar5 = CONCAT44(extraout_s1_00,*(undefined4 *)(iVar1 + 0xc));
    uVar12 = FloatVectorSub(CONCAT44(extraout_s9,local_60),uVar5,2,0x20);
    uVar6 = FloatVectorMult(CONCAT44(extraout_s3,local_58),CONCAT44(extraout_s3,local_58),2,0x20);
    uVar13 = FloatVectorMult(uVar13,uVar13,2,0x20);
    uVar9 = FloatVectorMult(uVar9,uVar9,2,0x20);
    uVar12 = FloatVectorMult(uVar12,uVar12,2,0x20);
    uVar9 = FloatVectorAdd(uVar13,uVar9,2);
    uVar9 = FloatVectorAdd(uVar9,uVar12,2);
    if (-1 < (int)((uint)((float)uVar9 < (float)uVar6) << 0x1f)) {
      uVar9 = CONCAT44((int)((ulonglong)uVar9 >> 0x20),local_4c);
      uVar14 = FloatVectorMult(uVar9,uVar9,2,0x20);
      uVar12 = CONCAT44(extraout_s11,local_44);
      uVar13 = FloatVectorMult(CONCAT44(extraout_s13,local_48),CONCAT44(extraout_s13,local_48),2,
                               0x20);
      uVar10 = FloatVectorMult(uVar12,uVar12,2,0x20);
      uVar8 = FloatVectorAdd(uVar11,uVar9,2);
      uVar12 = FloatVectorAdd(uVar5,uVar12,2);
      uVar14 = FloatVectorAdd(uVar14,uVar13,2);
      uVar5 = CONCAT44(extraout_s1_00,DAT_0052bfe0);
      uVar13 = FloatVectorAdd(uVar15,CONCAT44(extraout_s13,local_48),2);
      uVar15 = CONCAT44(extraout_s5,DAT_0052bfe4);
      uVar11 = CONCAT44(extraout_s11,DAT_0052bfe8);
      local_78 = DAT_0052bfe0;
      lVar7 = FloatVectorAdd(uVar14,uVar10,2);
      local_74 = DAT_0052bfe4;
      local_70 = DAT_0052bfe8;
      if ((int)((uint)((float)lVar7 < (float)uVar6) << 0x1f) < 0) {
        uVar5 = FloatVectorSub(uVar6,lVar7,2,0x20);
        uVar2 = FUN_00301044((int)uVar5);
        uVar6 = FloatVectorMult(CONCAT44(extraout_s3_00,local_48),0,2,0x20);
        uVar15 = FloatVectorMult(CONCAT44(extraout_s1_01,local_4c),0,2,0x20);
        uVar5 = FloatVectorMult(CONCAT44(extraout_s5_00,local_44),0,2,0x20);
        uVar15 = FloatVectorSub(uVar15,uVar6,2,0x20);
        uVar6 = FloatVectorSub(CONCAT44(extraout_s3_00,local_48),uVar5,2,0x20);
        uVar5 = FloatVectorSub(uVar5,CONCAT44(extraout_s1_01,local_4c),2,0x20);
        local_78 = (undefined4)uVar6;
        local_74 = (undefined4)uVar5;
        local_70 = (undefined4)uVar15;
        FUN_00009b50(local_74,&local_78);
        lVar7 = (ulonglong)extraout_s7_00 << 0x20;
        uVar11 = FloatVectorSub(CONCAT44(extraout_s3_01,local_58),CONCAT44(uVar2,uVar2),2,0x20);
        uVar5 = FloatVectorMult(CONCAT44(extraout_s1_02,local_78),uVar11,2,0x20);
        local_78 = (undefined4)uVar5;
        uVar15 = FloatVectorMult(uVar11,CONCAT44(extraout_s3_01,local_74),2,0x20);
        local_74 = (undefined4)uVar15;
        uVar6 = CONCAT44(extraout_s3_01,local_70);
        uVar11 = FloatVectorMult(uVar11,uVar6,2,0x20);
        local_70 = (undefined4)uVar11;
        uVar9 = extraout_d4;
      }
      iVar1 = *(int *)(param_1 + 0x38);
      uVar10 = FloatVectorAdd(uVar13,uVar15,2);
      uVar14 = FloatVectorSub(uVar13,uVar15,2,0x20);
      uVar16 = FloatVectorSub(uVar12,uVar11,2,0x20);
      uVar15 = CONCAT44((int)((ulonglong)lVar7 >> 0x20),*(undefined4 *)(iVar1 + 8));
      uVar6 = CONCAT44((int)((ulonglong)uVar6 >> 0x20),*(undefined4 *)(iVar1 + 4));
      uVar13 = FloatVectorSub(uVar15,uVar10,2,0x20);
      uVar9 = CONCAT44((int)((ulonglong)uVar9 >> 0x20),*(undefined4 *)(iVar1 + 0xc));
      uVar10 = FloatVectorMult(uVar13,uVar13,2,0x20);
      uVar13 = FloatVectorAdd(uVar8,uVar5,2);
      uVar13 = FloatVectorSub(uVar6,uVar13,2,0x20);
      uVar11 = FloatVectorAdd(uVar12,uVar11,2);
      uVar17 = FloatVectorSub(uVar9,uVar11,2,0x20);
      uVar12 = FloatVectorMult(uVar13,uVar13,2,0x20);
      uVar11 = FloatVectorSub(uVar8,uVar5,2,0x20);
      uVar13 = FloatVectorMult(uVar17,uVar17,2,0x20);
      uVar5 = FloatVectorAdd(uVar12,uVar10,2);
      uVar5 = FloatVectorAdd(uVar5,uVar13,2);
      if (-1 < (int)((uint)((float)uVar5 < *(float *)(param_1 + 0xf0)) << 0x1f)) {
        uVar15 = FloatVectorSub(uVar15,uVar14,2,0x20);
        uVar5 = FloatVectorSub(uVar6,uVar11,2,0x20);
        uVar6 = FloatVectorSub(uVar9,uVar16,2,0x20);
        uVar15 = FloatVectorMult(uVar15,uVar15,2,0x20);
        uVar11 = FloatVectorMult(uVar5,uVar5,2,0x20);
        uVar5 = FloatVectorMult(uVar6,uVar6,2,0x20);
        uVar6 = FloatVectorAdd(uVar11,uVar15,2);
        uVar5 = FloatVectorAdd(uVar6,uVar5,2);
        if (-1 < (int)((uint)((float)uVar5 < *(float *)(param_1 + 0xf0)) << 0x1f))
        goto LAB_00018268;
      }
    }
    FUN_002ed304(&local_6c);
    uVar2 = 1;
  }
  else {
LAB_00018268:
    FUN_002ed304(&local_6c);
    uVar2 = 0;
  }
  return uVar2;
}


```

## FUN_00009b50 — 00009b50

- 函数名: FUN_00009b50
- 函数体: 195 字节
- 调用者数: 32 / 被调用者数: 2

```c

float FUN_00009b50(float *param_1)

{
  float fVar1;
  undefined8 in_d0;
  undefined4 uVar2;
  undefined4 extraout_s1;
  undefined8 in_d1;
  undefined4 extraout_s3;
  undefined8 uVar3;
  undefined8 uVar4;
  undefined8 uVar5;
  undefined8 uVar6;
  
  uVar2 = (undefined4)((ulonglong)in_d0 >> 0x20);
  fVar1 = *param_1;
  uVar4 = CONCAT44(uVar2,fVar1);
  uVar3 = CONCAT44((int)((ulonglong)in_d1 >> 0x20),param_1[1]);
  if ((fVar1 != 0.0 || (fVar1 != 0.0 || param_1[1] != 0.0)) || (fVar1 = 0.0, param_1[2] != 0.0)) {
    uVar5 = FloatVectorMult(uVar4,uVar4,2,0x20);
    uVar4 = CONCAT44(uVar2,param_1[2]);
    uVar3 = FloatVectorMult(uVar3,uVar3,2,0x20);
    uVar6 = FloatVectorMult(uVar4,uVar4,2,0x20);
    uVar4 = FloatVectorAdd(uVar5,uVar3,2);
    uVar4 = FloatVectorAdd(uVar4,uVar6,2);
    fVar1 = (float)FUN_00301044((int)uVar4);
    if (fVar1 == 0.0) {
      uVar4 = CONCAT44(extraout_s1,DAT_00009c14);
      uVar3 = FloatVectorMult(CONCAT44(extraout_s3,*param_1),uVar4,2,0x20);
      *param_1 = (float)uVar3;
      uVar3 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar3 >> 0x20),param_1[1]),uVar4,2,0x20);
      param_1[1] = (float)uVar3;
      uVar4 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar3 >> 0x20),param_1[2]),uVar4,2,0x20);
      param_1[2] = (float)uVar4;
      FUN_00009b50((float)uVar4,param_1);
    }
    else {
      *param_1 = *param_1 / fVar1;
      param_1[1] = param_1[1] / fVar1;
      param_1[2] = param_1[2] / fVar1;
    }
  }
  return fVar1;
}


```

