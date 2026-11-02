# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_00060d04 — 00060d04

- 函数名: FUN_00060d04
- 函数体: 101 字节
- 调用者数: 1 / 被调用者数: 5

```c

void FUN_00060d04(undefined4 *param_1,int param_2)

{
  undefined4 *puVar1;
  undefined4 uVar2;
  
  if (param_2 != 0) {
    param_1[1] = 0;
    FUN_0030c6c0(param_2,"numPerGame",param_1 + 1);
    puVar1 = operator_new(0x48);
    puVar1[4] = 0;
    puVar1[5] = 0;
    puVar1[6] = 0;
    FUN_0003994c(puVar1 + 7,4);
    *puVar1 = 0;
    *param_1 = puVar1;
    uVar2 = FUN_0030c328(param_2,"challengeGroup");
    FUN_0006f178(puVar1,uVar2,0xffffffff);
  }
  return;
}


```

## FUN_00062be4 — 00062be4

- 函数名: FUN_00062be4
- 函数体: 179 字节
- 调用者数: 1 / 被调用者数: 1

```c

bool FUN_00062be4(int param_1,int param_2)

{
  longlong lVar1;
  float fVar2;
  undefined *puVar3;
  int iVar4;
  undefined4 uVar5;
  uint uVar6;
  uint uVar7;
  bool bVar8;
  float fVar9;
  undefined8 uVar10;
  
  if (*(int *)(param_1 + 4) != 0) {
    bVar8 = false;
    if ((*(int *)(param_1 + 8) == 0) && (bVar8 = param_2 != 0, bVar8 && param_2 != 2)) {
      iVar4 = FUN_0001d10c(PTR_DAT_004d9048);
      puVar3 = PTR_DAT_004d9050;
      fVar2 = DAT_00062ca0;
      iVar4 = *(int *)(iVar4 + 0x4c);
      fVar9 = DAT_00062c98;
      if (iVar4 != 2) {
        if (iVar4 == 1) {
          fVar9 = 0.5;
        }
        else {
          fVar9 = 0.0;
          if (iVar4 == 0) {
            fVar9 = DAT_00062c9c;
          }
        }
      }
      lVar1 = (ulonglong)*(uint *)PTR_DAT_004d9050 * (ulonglong)*(uint *)(PTR_DAT_004d9050 + 8);
      uVar7 = (uint)lVar1;
      uVar6 = *(int *)(PTR_DAT_004d9050 + 4) * *(uint *)(PTR_DAT_004d9050 + 8) +
              *(uint *)PTR_DAT_004d9050 * *(int *)(PTR_DAT_004d9050 + 0xc) +
              (int)((ulonglong)lVar1 >> 0x20) +
              *(int *)(PTR_DAT_004d9050 + 0x14) +
              (uint)CARRY4(uVar7,*(uint *)(PTR_DAT_004d9050 + 0x10));
      uVar5 = (undefined4)((ulonglong)uVar6 * 0x7ffff >> 0x20);
      *(uint *)PTR_DAT_004d9050 = uVar7 + *(uint *)(PTR_DAT_004d9050 + 0x10);
      *(uint *)(puVar3 + 4) = uVar6;
      bVar8 = false;
      uVar10 = FixedToFP(CONCAT44(uVar5,uVar5),0,1,0,0x20);
      if ((int)((uint)((float)uVar10 / fVar2 < fVar9) << 0x1f) < 0) {
        bVar8 = true;
      }
    }
    return bVar8;
  }
  return false;
}


```

## FUN_00062ca4 — 00062ca4

- 函数名: FUN_00062ca4
- 函数体: 11 字节
- 调用者数: 1 / 被调用者数: 1

```c

void FUN_00062ca4(undefined4 *param_1)

{
  FUN_0006ec3c(*param_1);
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

