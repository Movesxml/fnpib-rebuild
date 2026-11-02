# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0006ed78 — 0006ed78

- 函数名: FUN_0006ed78
- 函数体: 239 字节
- 调用者数: 1 / 被调用者数: 5

```c

void FUN_0006ed78(int param_1)

{
  undefined *puVar1;
  int iVar2;
  undefined4 *puVar3;
  uint uVar4;
  undefined4 uVar5;
  int iVar6;
  uint uVar7;
  uint uVar8;
  int iVar9;
  undefined4 local_24;
  
  iVar9 = param_1 + 0x40;
  FUN_000399a0(iVar9);
  iVar2 = *(int *)(param_1 + 0x6c);
  if (*(int *)(param_1 + 0x70) != iVar2) {
    uVar8 = 0;
    iVar6 = 4;
    do {
      if (*(char *)(*(int *)(iVar2 + uVar8 * 4) + 0xc) != '\0') {
        if ((int)uVar8 < 0) break;
        uVar7 = (*(int *)(param_1 + 0x44) - *(int *)(param_1 + 0x40) >> 2) * -0x33333333;
        if ((uVar7 < uVar8 || uVar7 - uVar8 == 0) ||
           (*(int *)(*(int *)(param_1 + 0x40) + iVar6 * 4) == 0)) {
          FUN_00039a28(iVar9,uVar8);
          goto LAB_0006ede2;
        }
      }
      uVar8 = uVar8 + 1;
      iVar6 = iVar6 + 5;
    } while (uVar8 < (uint)(*(int *)(param_1 + 0x70) - iVar2 >> 2));
  }
  uVar8 = FUN_00039b24(iVar9);
LAB_0006ede2:
  puVar1 = PTR_DAT_004d9048;
  iVar2 = *(int *)(param_1 + 0x70);
  if (iVar2 != *(int *)(param_1 + 0x6c)) {
    iVar9 = 0;
    uVar7 = 0;
    iVar2 = *(int *)(param_1 + 0x6c);
    do {
      local_24 = *(undefined4 *)(*(int *)(iVar2 + uVar7 * 4) + 8);
      puVar3 = (undefined4 *)FUN_0002b2a8(*(int *)(puVar1 + 0x5c) + 0x13c,&local_24);
      if (((int)uVar7 < 0) ||
         (uVar4 = (*(int *)(param_1 + 0x44) - *(int *)(param_1 + 0x40) >> 2) * -0x33333333,
         uVar4 < uVar7 || uVar4 - uVar7 == 0)) {
        uVar5 = 0;
        *puVar3 = 0;
      }
      else {
        iVar2 = *(int *)(param_1 + 0x40) + iVar9 * 4;
        *puVar3 = *(undefined4 *)(iVar2 + 4);
        uVar5 = *(undefined4 *)(iVar2 + 0x10);
      }
      puVar3[1] = uVar5;
      iVar9 = iVar9 + 5;
      iVar2 = *(int *)(param_1 + 0x6c);
      uVar7 = uVar7 + 1;
    } while (uVar7 < (uint)(*(int *)(param_1 + 0x70) - iVar2 >> 2));
  }
  FUN_0006ec3c(*(undefined4 *)(iVar2 + uVar8 * 4));
  return;
}


```

## FUN_0006ec3c — 0006ec3c

- 函数名: FUN_0006ec3c
- 函数体: 281 字节
- 调用者数: 3 / 被调用者数: 5

```c

undefined4 FUN_0006ec3c(int param_1)

{
  undefined *puVar1;
  int iVar2;
  undefined4 *puVar3;
  uint uVar4;
  uint uVar5;
  undefined4 uVar6;
  int iVar7;
  uint uVar8;
  int iVar9;
  
  puVar1 = PTR_DAT_004d9048;
  iVar2 = *(int *)(param_1 + 0x10);
  if (*(int *)(param_1 + 0x14) != iVar2) {
    uVar8 = 0;
    iVar9 = 4;
    do {
      iVar7 = *(int *)(iVar2 + uVar8 * 4);
      iVar2 = FUN_0002b2a8(*(int *)(puVar1 + 0x5c) + 0x154,iVar7 + 0x40);
      if ((*(char *)(iVar7 + 0x58) != '\0') && (*(int *)(iVar2 + 8) == 0)) {
        if ((int)uVar8 < 0) break;
        uVar4 = (*(int *)(param_1 + 0x20) - *(int *)(param_1 + 0x1c) >> 2) * -0x33333333;
        if ((uVar4 < uVar8 || uVar4 - uVar8 == 0) ||
           (*(int *)(*(int *)(param_1 + 0x1c) + iVar9 * 4) == 0)) {
          FUN_000399a0(param_1 + 0x1c);
          FUN_00039a28(param_1 + 0x1c,uVar8);
          goto LAB_0006ecd8;
        }
      }
      iVar2 = *(int *)(param_1 + 0x10);
      iVar9 = iVar9 + 5;
      uVar8 = uVar8 + 1;
    } while (uVar8 < (uint)(*(int *)(param_1 + 0x14) - iVar2 >> 2));
  }
  FUN_000399a0(param_1 + 0x1c);
  uVar8 = FUN_00039b24(param_1 + 0x1c);
LAB_0006ecd8:
  puVar1 = PTR_DAT_004d9048;
  iVar2 = *(int *)(param_1 + 0x10);
  if (*(int *)(param_1 + 0x14) != iVar2) {
    iVar9 = 0;
    uVar4 = 0;
    do {
      puVar3 = (undefined4 *)
               FUN_0002b2a8(*(int *)(puVar1 + 0x5c) + 0x154,*(int *)(iVar2 + uVar4 * 4) + 0x40);
      if (((int)uVar4 < 0) ||
         (uVar5 = (*(int *)(param_1 + 0x20) - *(int *)(param_1 + 0x1c) >> 2) * -0x33333333,
         uVar5 < uVar4 || uVar5 - uVar4 == 0)) {
        uVar6 = 0;
        *puVar3 = 0;
      }
      else {
        iVar2 = *(int *)(param_1 + 0x1c) + iVar9 * 4;
        *puVar3 = *(undefined4 *)(iVar2 + 4);
        uVar6 = *(undefined4 *)(iVar2 + 0x10);
      }
      puVar3[1] = uVar6;
      iVar9 = iVar9 + 5;
      iVar2 = *(int *)(param_1 + 0x10);
      uVar4 = uVar4 + 1;
    } while (uVar4 < (uint)(*(int *)(param_1 + 0x14) - iVar2 >> 2));
  }
  FUN_0006ebdc(param_1);
  return *(undefined4 *)(*(int *)(param_1 + 0x10) + uVar8 * 4);
}


```

## FUN_00039a28 — 00039a28

- 函数名: FUN_00039a28
- 函数体: 57 字节
- 调用者数: 3 / 被调用者数: 0

```c

void FUN_00039a28(int *param_1,int param_2)

{
  int iVar1;
  
  if (-1 < param_2) {
    iVar1 = (param_1[1] - *param_1 >> 2) * -0x33333333;
    if (iVar1 - param_2 == 0 || iVar1 < param_2) {
      return;
    }
    iVar1 = *param_1 + param_2 * 0x14;
    param_1[3] = param_1[3] - *(int *)(iVar1 + 4);
    *(undefined4 *)(iVar1 + 4) = 0;
    *(int *)(iVar1 + 0x10) = param_1[4];
  }
  return;
}


```

## FUN_00039a64 — 00039a64

- 函数名: FUN_00039a64
- 函数体: 191 字节
- 调用者数: 1 / 被调用者数: 0

```c

void FUN_00039a64(int param_1,uint param_2)

{
  longlong lVar1;
  undefined *puVar2;
  uint uVar3;
  undefined4 uVar4;
  uint uVar5;
  int iVar6;
  uint uVar7;
  uint uVar8;
  uint uVar9;
  uint uVar10;
  int iVar11;
  uint uVar12;
  uint uVar13;
  
  puVar2 = PTR_DAT_004d9050;
  if (param_2 >> 1 != 0) {
    uVar3 = *(uint *)PTR_DAT_004d9050;
    uVar9 = *(uint *)(PTR_DAT_004d9050 + 4);
    uVar12 = *(uint *)(PTR_DAT_004d9050 + 8);
    uVar8 = *(uint *)(PTR_DAT_004d9050 + 0x10);
    iVar11 = *(int *)(PTR_DAT_004d9050 + 0x14);
    iVar6 = *(int *)(PTR_DAT_004d9050 + 0xc);
    uVar7 = 0;
    do {
      uVar5 = (uint)((ulonglong)uVar3 * (ulonglong)uVar12);
      uVar10 = uVar5 + uVar8;
      uVar9 = uVar9 * uVar12 + uVar3 * iVar6 + (int)((ulonglong)uVar3 * (ulonglong)uVar12 >> 0x20) +
              iVar11 + (uint)CARRY4(uVar5,uVar8);
      uVar5 = uVar9;
      if ((param_2 != 0) && (param_2 != 0xffffffff)) {
        uVar5 = (uint)((ulonglong)uVar9 * (ulonglong)param_2 >> 0x20);
      }
      lVar1 = (ulonglong)uVar10 * (ulonglong)uVar12;
      uVar13 = (uint)lVar1;
      uVar3 = uVar13 + uVar8;
      uVar9 = uVar9 * uVar12 + uVar10 * iVar6 + (int)((ulonglong)lVar1 >> 0x20) +
              iVar11 + (uint)CARRY4(uVar13,uVar8);
      uVar10 = uVar9;
      if ((param_2 != 0) && (param_2 != 0xffffffff)) {
        uVar10 = (uint)((ulonglong)uVar9 * (ulonglong)param_2 >> 0x20);
      }
      uVar4 = *(undefined4 *)(param_1 + uVar5 * 4);
      uVar7 = uVar7 + 1;
      *(undefined4 *)(param_1 + uVar5 * 4) = *(undefined4 *)(param_1 + uVar10 * 4);
      *(undefined4 *)(param_1 + uVar10 * 4) = uVar4;
    } while (uVar7 < param_2 >> 1);
    *(uint *)puVar2 = uVar3;
    *(uint *)(puVar2 + 4) = uVar9;
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

## FUN_000610cc — 000610cc

- 函数名: FUN_000610cc
- 函数体: 89 字节
- 调用者数: 4 / 被调用者数: 3

```c

void FUN_000610cc(int param_1,int param_2,int param_3)

{
  int iVar1;
  int iVar2;
  undefined4 uVar3;
  int iVar4;
  
  *(undefined1 *)(param_1 + 0xa0) = 0;
  iVar2 = *(int *)(param_1 + 0x68);
  if (param_2 == 0) {
    iVar4 = 0;
    do {
      if (*(int *)(iVar2 + 0x7c) <= iVar4) {
        if (param_3 == 0) {
          FUN_00061090(param_1);
          goto LAB_00061106;
        }
        break;
      }
      iVar1 = iVar4 * 8;
      iVar4 = iVar4 + 1;
    } while (*(int *)(*(int *)(iVar2 + 0x78) + iVar1 + 4) != 0);
  }
  *(undefined4 *)(iVar2 + 0x90) = *(undefined4 *)(*(int *)(param_1 + 0x90) + 0x10);
LAB_00061106:
  if (param_2 == 1) {
    uVar3 = FUN_0006ed60(*(undefined4 *)(param_1 + 0x68));
    *(undefined4 *)(param_1 + 100) = uVar3;
    FUN_00061128(param_1,0);
    return;
  }
  return;
}


```

