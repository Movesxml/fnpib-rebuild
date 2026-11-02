# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_00061090 — 00061090

- 函数名: FUN_00061090
- 函数体: 57 字节
- 调用者数: 1 / 被调用者数: 1

```c

void FUN_00061090(int param_1)

{
  int iVar1;
  
  iVar1 = *(int *)(*(int *)(param_1 + 0x68) + 0xa4);
  if (*(int *)(*(int *)(param_1 + 0x68) + 0xb0) == 0) {
    iVar1 = iVar1 + 1;
  }
  if (DAT_005f94fc - DAT_005f94f8 >> 2 <= iVar1) {
    return;
  }
  *(undefined4 *)(param_1 + 0x68) = *(undefined4 *)(DAT_005f94f8 + iVar1 * 4);
  FUN_0005fc1c();
  return;
}


```

## FUN_0005fc1c — 0005fc1c

- 函数名: FUN_0005fc1c
- 函数体: 347 字节
- 调用者数: 2 / 被调用者数: 8

```c

void FUN_0005fc1c(int param_1)

{
  longlong lVar1;
  float fVar2;
  undefined *puVar3;
  undefined *puVar4;
  int iVar5;
  uint uVar6;
  undefined4 uVar7;
  int iVar8;
  uint uVar9;
  undefined4 uVar10;
  int iVar11;
  undefined8 in_d0;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined8 uVar12;
  undefined8 uVar13;
  undefined8 uVar14;
  undefined **local_48;
  undefined *local_44;
  undefined1 local_28;
  int local_24;
  
  puVar3 = PTR____stack_chk_guard_004d9044;
  uVar7 = (undefined4)((ulonglong)in_d0 >> 0x20);
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  iVar5 = *(int *)(param_1 + 0x68);
  if (*(int *)(iVar5 + 0xa4) == 0) {
    FUN_0030a1d8();
    FUN_0030a7e4();
    local_28 = 1;
    local_48 = (undefined **)0x0;
    uVar7 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
    FUN_0000a298(&local_48);
    local_28 = 0;
    local_48 = &PTR_LAB_0052bf38;
    local_44 = PTR_FUN_004d9058;
    FUN_0002bb34(uVar7,"act-change",0x3f800000,0x3f800000,&local_48,0);
    FUN_0000a298(&local_48);
    *(undefined1 *)(param_1 + 0x8c) = 0;
    iVar5 = *(int *)(param_1 + 0x68);
    uVar7 = extraout_s1;
  }
  if (*(int *)(iVar5 + 0xac) != 0) {
    uVar7 = FUN_0002ede8();
    FUN_000300e0(uVar7,*(undefined4 *)(*(int *)(param_1 + 0x68) + 0xac));
    iVar5 = *(int *)(param_1 + 0x68);
    uVar7 = extraout_s1_00;
  }
  puVar4 = PTR_DAT_004d9050;
  fVar2 = DAT_0005fd78;
  iVar8 = *(int *)(iVar5 + 0x88);
  iVar11 = *(int *)(iVar5 + 0x8c);
  if (iVar8 != iVar11) {
    lVar1 = (ulonglong)*(uint *)PTR_DAT_004d9050 * (ulonglong)*(uint *)(PTR_DAT_004d9050 + 8);
    uVar9 = (uint)lVar1;
    uVar6 = *(int *)(PTR_DAT_004d9050 + 4) * *(uint *)(PTR_DAT_004d9050 + 8) +
            *(uint *)PTR_DAT_004d9050 * *(int *)(PTR_DAT_004d9050 + 0xc) +
            (int)((ulonglong)lVar1 >> 0x20) +
            *(int *)(PTR_DAT_004d9050 + 0x14) +
            (uint)CARRY4(uVar9,*(uint *)(PTR_DAT_004d9050 + 0x10));
    uVar10 = (undefined4)((ulonglong)uVar6 * 0x7ffff >> 0x20);
    *(uint *)PTR_DAT_004d9050 = uVar9 + *(uint *)(PTR_DAT_004d9050 + 0x10);
    *(uint *)(puVar4 + 4) = uVar6;
    iVar11 = iVar11 - iVar8;
    uVar12 = FixedToFP(CONCAT44(uVar10,uVar10),0,1,0,0x20);
    uVar14 = FixedToFP(CONCAT44(iVar11,iVar11),0,0,0,0x20);
    uVar13 = FixedToFP(CONCAT44(iVar8,iVar8),0,0,0,0x20);
    uVar12 = FloatVectorMult(uVar14,CONCAT44(uVar7,(float)uVar12 / fVar2),2,0x20);
    uVar12 = FloatVectorAdd(uVar13,uVar12,2);
    uVar12 = FPToFixed(uVar12,0,0,3,0x20);
    iVar8 = (int)uVar12;
  }
  *(int *)(iVar5 + 0x7c) = iVar8;
  *(undefined4 *)(iVar5 + 0x80) = 0;
  *(undefined4 *)(iVar5 + 0x84) = 0;
  FUN_0006ee88();
  if (*(int *)puVar3 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0006ee88 — 0006ee88

- 函数名: FUN_0006ee88
- 函数体: 437 字节
- 调用者数: 3 / 被调用者数: 12

```c

void FUN_0006ee88(int param_1)

{
  undefined *puVar1;
  undefined4 **ppuVar2;
  ulong uVar3;
  undefined4 *puVar4;
  void *pvVar5;
  undefined4 uVar6;
  int iVar7;
  int iVar8;
  undefined4 ***pppuVar9;
  undefined4 *puVar10;
  uint uVar11;
  int iVar12;
  undefined4 ***pppuVar13;
  undefined4 local_30;
  undefined4 local_2c;
  undefined4 **local_28;
  undefined4 **local_24;
  
  if (*(void **)(param_1 + 0x78) != (void *)0x0) {
    operator_delete(*(void **)(param_1 + 0x78));
    *(undefined4 *)(param_1 + 0x78) = 0;
  }
  uVar11 = *(uint *)(param_1 + 0x7c);
  uVar3 = (ulong)((ulonglong)uVar11 * 8);
  if ((int)((ulonglong)uVar11 * 8 >> 0x20) != 0) {
    uVar3 = 0xffffffff;
  }
  puVar4 = operator_new__(uVar3);
  if (uVar11 != 0) {
    puVar10 = puVar4;
    do {
      *puVar10 = 0;
      puVar10[1] = 0;
      puVar10 = puVar10 + 2;
    } while (puVar10 != puVar4 + uVar11 * 2);
  }
  *(undefined4 **)(param_1 + 0x78) = puVar4;
  iVar7 = *(int *)(param_1 + 0x6c);
  iVar8 = *(int *)(param_1 + 0x70);
  local_28 = &local_28;
  local_24 = &local_28;
  if (iVar8 != iVar7) {
    uVar11 = 0;
    do {
      iVar12 = 0;
      if (0 < **(int **)(iVar7 + uVar11 * 4)) {
        do {
          local_2c = FUN_0006ec3c();
          FUN_0006f598(&local_28,&local_28,&local_2c);
          iVar7 = *(int *)(param_1 + 0x6c);
          iVar12 = iVar12 + 1;
        } while (iVar12 < **(int **)(iVar7 + uVar11 * 4));
        iVar8 = *(int *)(param_1 + 0x70);
      }
      uVar11 = uVar11 + 1;
    } while (uVar11 < (uint)(iVar8 - iVar7 >> 2));
  }
  FUN_0001d10c(PTR_DAT_004d9048);
  puVar1 = PTR_DAT_004d91a0;
  iVar7 = FUN_00062be4(PTR_DAT_004d91a0,*(undefined4 *)(param_1 + 0xa4));
  if (iVar7 == 1) {
    *(int *)(puVar1 + 8) = *(int *)(puVar1 + 8) + 1;
    local_30 = FUN_00062ca4(puVar1);
    FUN_0006f598(&local_28,&local_28,&local_30);
  }
  uVar11 = *(uint *)(param_1 + 0x7c);
  uVar3 = (ulong)((ulonglong)uVar11 * 4);
  if ((int)((ulonglong)uVar11 * 4 >> 0x20) != 0) {
    uVar3 = 0xffffffff;
  }
  pvVar5 = operator_new__(uVar3);
  if (0 < (int)uVar11) {
    iVar7 = 0;
    do {
      *(int *)((int)pvVar5 + iVar7 * 4) = iVar7;
      iVar7 = iVar7 + 1;
    } while (iVar7 < (int)uVar11);
  }
  FUN_00039a64(pvVar5,uVar11);
  if (0 < *(int *)(param_1 + 0x7c)) {
    iVar7 = 0;
    do {
      iVar8 = 0;
      iVar12 = *(int *)((int)pvVar5 + iVar7 * 4);
      pppuVar9 = (undefined4 ***)local_28;
      if ((undefined4 ***)local_28 == &local_28) {
LAB_0006efd8:
        uVar6 = FUN_0006ed78(param_1);
        *(undefined4 *)(*(int *)(param_1 + 0x78) + iVar12 * 8) = uVar6;
      }
      else {
        do {
          pppuVar9 = (undefined4 ***)*pppuVar9;
          iVar8 = iVar8 + -1;
        } while (pppuVar9 != &local_28);
        if (iVar8 == 0) goto LAB_0006efd8;
        *(undefined4 **)(*(int *)(param_1 + 0x78) + iVar12 * 8) = local_28[2];
        FUN_00039a28(param_1 + 0x40,
                     *(undefined4 *)(*(int *)(*(int *)(param_1 + 0x78) + iVar12 * 8) + 0x54));
        ppuVar2 = local_28;
        std::_List_node_base::unhook();
        operator_delete(ppuVar2);
      }
      iVar7 = iVar7 + 1;
    } while (iVar7 < *(int *)(param_1 + 0x7c));
  }
  pppuVar9 = (undefined4 ***)local_28;
  if (pvVar5 != (void *)0x0) {
    operator_delete__(pvVar5);
    pppuVar9 = (undefined4 ***)local_28;
  }
  while (pppuVar9 != &local_28) {
    pppuVar13 = (undefined4 ***)*pppuVar9;
    operator_delete(pppuVar9);
    pppuVar9 = pppuVar13;
  }
  return;
}


```

