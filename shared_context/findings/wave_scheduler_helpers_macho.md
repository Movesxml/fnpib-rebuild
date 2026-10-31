# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_00057d48 — 00057d48

- 函数名: FUN_00057d48
- 函数体: 239 字节
- 调用者数: 1 / 被调用者数: 3

```c

void FUN_00057d48(int param_1,undefined4 param_2)

{
  uint *puVar1;
  uint *puVar2;
  uint *puVar3;
  uint *puVar4;
  longlong lVar5;
  uint *puVar6;
  int iVar7;
  uint uVar8;
  int iVar9;
  int iVar10;
  uint uVar11;
  int iVar12;
  uint uVar13;
  uint *puVar14;
  
  if (0 < *(int *)(param_1 + 0x4c)) {
    iVar10 = 0;
    iVar12 = 0;
    do {
      FUN_00057b84(*(int *)(param_1 + 0x48) + iVar10,param_2);
      uVar13 = *(uint *)(param_1 + 0x4c);
      iVar12 = iVar12 + 1;
      iVar10 = iVar10 + 0x90;
    } while (iVar12 < (int)uVar13);
    if (0 < (int)uVar13) {
      iVar10 = 0;
      iVar12 = *(int *)(param_1 + 0x48);
      do {
        puVar6 = DAT_005a7930;
        iVar7 = iVar12 + iVar10 * 0x90;
        if (*(int *)(iVar7 + 0x18) == 2) {
          uVar8 = *DAT_005a7930;
          puVar14 = DAT_005a7930 + 1;
          puVar2 = DAT_005a7930 + 2;
          puVar3 = DAT_005a7930 + 3;
          puVar1 = DAT_005a7930 + 4;
          lVar5 = (ulonglong)uVar8 * (ulonglong)*puVar2;
          uVar11 = (uint)lVar5;
          puVar4 = DAT_005a7930 + 5;
          *DAT_005a7930 = uVar11 + *puVar1;
          uVar8 = *puVar14 * *puVar2 + uVar8 * *puVar3 + (int)((ulonglong)lVar5 >> 0x20) + *puVar4 +
                  (uint)CARRY4(uVar11,*puVar1);
          puVar6[1] = uVar8;
          uVar11 = uVar13;
          if (uVar13 != 0 && uVar13 != 0xffffffff) {
            uVar8 = (uint)((ulonglong)uVar8 * (ulonglong)uVar13 >> 0x20);
          }
          for (; 0 < (int)uVar11; uVar11 = uVar11 - 1) {
            iVar9 = iVar12 + uVar8 * 0x90;
            if ((0x7fffffff < *(uint *)(iVar9 + 0x1c)) && (*(int *)(iVar9 + 0x18) == 1)) {
              FUN_0005868c(iVar7);
              iVar12 = *(int *)(param_1 + 0x48);
              *(int *)(iVar12 + uVar8 * 0x90 + 0x1c) = iVar10;
              uVar13 = *(uint *)(param_1 + 0x4c);
              break;
            }
            uVar8 = ___modsi3(uVar8 + 1,uVar13);
          }
        }
        iVar10 = iVar10 + 1;
      } while (iVar10 < (int)uVar13);
    }
  }
  return;
}


```

## FUN_00057a40 — 00057a40

- 函数名: FUN_00057a40
- 函数体: 173 字节
- 调用者数: 1 / 被调用者数: 5

```c

undefined4 FUN_00057a40(int param_1,int param_2)

{
  int iVar1;
  undefined4 uVar2;
  
  if (*(char *)(param_1 + param_2 + 0x178) == '\0') {
    return 0;
  }
  if (param_2 == 0) {
    iVar1 = *(int *)(param_1 + 0x168);
    if (iVar1 != 0) {
      if (*(char *)(iVar1 + 0x79) == '\0') goto LAB_00057ac8;
      if (*(char *)(iVar1 + 0x78) == '\0') {
        iVar1 = FUN_00013774(0xffffffff,0);
        if (0 < iVar1) {
          return 1;
        }
        iVar1 = FUN_00009628(0xffffffff,0);
        goto LAB_00057a72;
      }
    }
    uVar2 = FUN_000065c4();
    iVar1 = FUN_00006a84(uVar2,1);
    if (iVar1 != 0) {
      return 1;
    }
    iVar1 = FUN_0001cd68();
    if ((iVar1 == 1) && (iVar1 = FUN_00009628(0xffffffff,1), 0 < iVar1)) {
      return 1;
    }
    iVar1 = FUN_0001cd68();
    if (iVar1 == 0) {
      uVar2 = FUN_000065c4();
      iVar1 = FUN_00006a84(uVar2,2);
      if (iVar1 != 0) {
        return 1;
      }
    }
  }
  else {
    iVar1 = FUN_00013774(param_2,1);
    if (0 < iVar1) {
      return 1;
    }
    iVar1 = FUN_00009628(param_2,1);
LAB_00057a72:
    if (0 < iVar1) {
      return 1;
    }
  }
LAB_00057ac8:
  *(undefined1 *)(param_1 + param_2 + 0x178) = 0;
  return 0;
}


```

## FUN_00057cf0 — 00057cf0

- 函数名: FUN_00057cf0
- 函数体: 87 字节
- 调用者数: 1 / 被调用者数: 0

```c

undefined4 FUN_00057cf0(int *param_1,int *param_2)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  
  if ((((param_1 != (int *)0x0) && (iVar3 = param_1[1], iVar3 != 0 && param_2 != (int *)0x0)) &&
      (param_2[1] != 0)) && (0 < iVar3)) {
    iVar4 = 0;
    do {
      iVar2 = 0;
      while (iVar2 < param_2[1]) {
        iVar1 = iVar2 * 4;
        iVar2 = iVar2 + 1;
        if (*(int *)(*param_1 + iVar4 * 4) == *(int *)(*param_2 + iVar1)) {
          return 1;
        }
      }
      iVar4 = iVar4 + 1;
    } while (iVar4 < iVar3);
  }
  return 0;
}


```

## FUN_00058588 — 00058588

- 函数名: FUN_00058588
- 函数体: 39 字节
- 调用者数: 1 / 被调用者数: 1

```c

void FUN_00058588(int param_1,undefined4 *param_2)

{
  int iVar1;
  undefined4 *puVar2;
  
  puVar2 = *(undefined4 **)(param_1 + 4);
  if (puVar2 == *(undefined4 **)(param_1 + 8)) {
    FUN_000589c4(param_1,puVar2);
    return;
  }
  iVar1 = 0;
  if (puVar2 != (undefined4 *)0x0) {
    *puVar2 = *param_2;
    iVar1 = *(int *)(param_1 + 4);
  }
  *(int *)(param_1 + 4) = iVar1 + 4;
  return;
}


```

