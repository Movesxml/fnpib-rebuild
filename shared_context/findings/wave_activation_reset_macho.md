# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

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

## FUN_00057c90 — 00057c90

- 函数名: FUN_00057c90
- 函数体: 77 字节
- 调用者数: 1 / 被调用者数: 3

```c

undefined4 FUN_00057c90(int param_1,int param_2,undefined4 param_3,int param_4)

{
  int iVar1;
  undefined4 extraout_s1;
  undefined8 uVar2;

  FUN_000137e8(0);
  iVar1 = param_1 + param_4 * 4;
  FUN_000096c4();
  *(int *)(iVar1 + 0x16c) = param_2 + -1;
  FUN_00054dd8(param_1,0);
  uVar2 = FloatVectorAdd(CONCAT44(extraout_s1,*(undefined4 *)(iVar1 + 0x170)),
                         CONCAT44(param_3,param_3),2);
  uVar2 = FloatVectorMax(0,uVar2,2,0x20);
  *(int *)(iVar1 + 0x170) = (int)uVar2;
  return (int)uVar2;
}


```

