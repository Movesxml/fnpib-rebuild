# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0000ac24 — 0000ac24

- 函数名: FUN_0000ac24
- 函数体: 733 字节
- 调用者数: 5 / 被调用者数: 2

```c

int FUN_0000ac24(int param_1,int *param_2,uint param_3)

{
  longlong lVar1;
  uint uVar2;
  undefined4 uVar3;
  int iVar4;
  int iVar5;
  uint uVar6;
  uint *puVar7;
  int *piVar8;
  int *piVar9;
  uint uVar10;
  uint uVar11;
  int iVar12;
  
  iVar4 = DAT_005d4cdc;
  if (((int)DAT_00556cc0 < 1) && (DAT_00556cc0 = 0, 0 < (int)param_3)) {
    DAT_00556cc0 = 0;
    uVar6 = param_3;
    piVar8 = param_2;
    while( true ) {
      iVar5 = *piVar8 * 0x338 + iVar4;
      piVar9 = (int *)(iVar5 + 0x308);
      DAT_00556cc0 = *(int *)(iVar5 + 0x308) + DAT_00556cc0;
      *(uint *)(iVar5 + 0x30c) = DAT_00556cc0;
      if (*(int *)(iVar5 + 0x328) < 1) {
        DAT_00556cc4 = *piVar9 + DAT_00556cc4;
      }
      if ((*(char *)(iVar5 + 0x318) != '\0') &&
         (DAT_00556cc8 = *piVar9 + DAT_00556cc8, *(int *)(iVar5 + 0x328) < 1)) {
        DAT_00556ccc = *piVar9 + DAT_00556ccc;
      }
      uVar6 = uVar6 - 1;
      *(uint *)(iVar5 + 0x310) = DAT_00556cc8;
      if (uVar6 == 0) break;
      piVar8 = piVar8 + 1;
    }
  }
  uVar3 = FUN_00052f80();
  iVar4 = FUN_0005809c(uVar3,0);
  iVar5 = FUN_00052f80();
  uVar2 = DAT_00556ccc;
  uVar11 = DAT_00556cc8;
  uVar10 = DAT_00556cc4;
  uVar6 = DAT_00556cc0;
  puVar7 = (uint *)(iVar5 + 8);
  if (iVar4 == 1) {
    if (param_1 == 1) {
      uVar10 = *puVar7;
      lVar1 = (ulonglong)uVar10 * (ulonglong)*(uint *)(iVar5 + 0x10);
      uVar6 = (uint)lVar1;
      *puVar7 = uVar6 + *(uint *)(iVar5 + 0x18);
      uVar6 = *(int *)(iVar5 + 0xc) * *(uint *)(iVar5 + 0x10) +
              uVar10 * *(int *)(iVar5 + 0x14) + (int)((ulonglong)lVar1 >> 0x20) +
              *(int *)(iVar5 + 0x1c) + (uint)CARRY4(uVar6,*(uint *)(iVar5 + 0x18));
      *(uint *)(iVar5 + 0xc) = uVar6;
      if (uVar11 != 0 && uVar11 != 0xffffffff) {
        uVar6 = (uint)((ulonglong)uVar6 * (ulonglong)uVar11 >> 0x20);
      }
      iVar4 = 0;
      while (iVar4 < (int)param_3) {
        piVar8 = param_2 + iVar4;
        iVar4 = iVar4 + 1;
        if ((int)uVar6 < *(int *)(*piVar8 * 0x338 + DAT_005d4cdc + 0x310)) {
          return *piVar8;
        }
      }
    }
    else {
      uVar6 = *puVar7;
      lVar1 = (ulonglong)uVar6 * (ulonglong)*(uint *)(iVar5 + 0x10);
      uVar10 = (uint)lVar1;
      *puVar7 = uVar10 + *(uint *)(iVar5 + 0x18);
      uVar6 = *(int *)(iVar5 + 0xc) * *(uint *)(iVar5 + 0x10) +
              uVar6 * *(int *)(iVar5 + 0x14) + (int)((ulonglong)lVar1 >> 0x20) +
              *(int *)(iVar5 + 0x1c) + (uint)CARRY4(uVar10,*(uint *)(iVar5 + 0x18));
      lVar1 = CONCAT44(uVar6,uVar10);
      *(uint *)(iVar5 + 0xc) = uVar6;
      if (uVar2 != 0 && uVar2 != 0xffffffff) {
        lVar1 = (ulonglong)uVar6 * (ulonglong)uVar2;
      }
      if (0 < (int)param_3) {
        iVar4 = 0;
        iVar5 = 0;
        do {
          iVar12 = param_2[iVar4] * 0x338 + DAT_005d4cdc;
          if (((*(int *)(iVar12 + 0x328) < 1) && (*(char *)(iVar12 + 0x318) != '\0')) &&
             (iVar5 = iVar5 + *(int *)(iVar12 + 0x308), (int)((ulonglong)lVar1 >> 0x20) < iVar5)) {
            return param_2[iVar4];
          }
          iVar4 = iVar4 + 1;
        } while (iVar4 < (int)param_3);
      }
    }
  }
  else if (param_1 == 0) {
    uVar6 = *puVar7;
    lVar1 = (ulonglong)uVar6 * (ulonglong)*(uint *)(iVar5 + 0x10);
    uVar11 = (uint)lVar1;
    *puVar7 = uVar11 + *(uint *)(iVar5 + 0x18);
    uVar6 = *(int *)(iVar5 + 0xc) * *(uint *)(iVar5 + 0x10) +
            uVar6 * *(int *)(iVar5 + 0x14) + (int)((ulonglong)lVar1 >> 0x20) +
            *(int *)(iVar5 + 0x1c) + (uint)CARRY4(uVar11,*(uint *)(iVar5 + 0x18));
    lVar1 = CONCAT44(uVar6,uVar11);
    *(uint *)(iVar5 + 0xc) = uVar6;
    if (uVar10 != 0 && uVar10 != 0xffffffff) {
      lVar1 = (ulonglong)uVar6 * (ulonglong)uVar10;
    }
    if (0 < (int)param_3) {
      iVar4 = 0;
      iVar5 = 0;
      do {
        iVar12 = param_2[iVar4] * 0x338 + DAT_005d4cdc;
        if ((*(int *)(iVar12 + 0x328) < 1) &&
           (iVar5 = iVar5 + *(int *)(iVar12 + 0x308), (int)((ulonglong)lVar1 >> 0x20) < iVar5)) {
          return param_2[iVar4];
        }
        iVar4 = iVar4 + 1;
      } while (iVar4 < (int)param_3);
    }
  }
  else {
    uVar11 = *puVar7;
    lVar1 = (ulonglong)uVar11 * (ulonglong)*(uint *)(iVar5 + 0x10);
    uVar10 = (uint)lVar1;
    *puVar7 = uVar10 + *(uint *)(iVar5 + 0x18);
    uVar10 = *(int *)(iVar5 + 0xc) * *(uint *)(iVar5 + 0x10) +
             uVar11 * *(int *)(iVar5 + 0x14) + (int)((ulonglong)lVar1 >> 0x20) +
             *(int *)(iVar5 + 0x1c) + (uint)CARRY4(uVar10,*(uint *)(iVar5 + 0x18));
    *(uint *)(iVar5 + 0xc) = uVar10;
    if (uVar6 != 0 && uVar6 != 0xffffffff) {
      uVar10 = (uint)((ulonglong)uVar10 * (ulonglong)uVar6 >> 0x20);
    }
    iVar4 = 0;
    while (iVar4 < (int)param_3) {
      piVar8 = param_2 + iVar4;
      iVar4 = iVar4 + 1;
      if ((int)uVar10 < *(int *)(*piVar8 * 0x338 + DAT_005d4cdc + 0x30c)) {
        return *piVar8;
      }
    }
  }
  iVar4 = FUN_00052f80();
  uVar6 = *(uint *)(iVar4 + 8);
  lVar1 = (ulonglong)uVar6 * (ulonglong)*(uint *)(iVar4 + 0x10);
  uVar10 = (uint)lVar1;
  *(uint *)(iVar4 + 8) = uVar10 + *(uint *)(iVar4 + 0x18);
  uVar6 = *(int *)(iVar4 + 0xc) * *(uint *)(iVar4 + 0x10) +
          uVar6 * *(int *)(iVar4 + 0x14) + (int)((ulonglong)lVar1 >> 0x20) +
          *(int *)(iVar4 + 0x1c) + (uint)CARRY4(uVar10,*(uint *)(iVar4 + 0x18));
  *(uint *)(iVar4 + 0xc) = uVar6;
  if (1 < param_3) {
    uVar6 = (uint)((ulonglong)uVar6 * (ulonglong)(param_3 - 1) >> 0x20);
  }
  return param_2[uVar6];
}


```

