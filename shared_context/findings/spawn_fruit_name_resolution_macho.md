# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0000aae0 — 0000aae0

- 函数名: FUN_0000aae0
- 函数体: 175 字节
- 调用者数: 22 / 被调用者数: 3

```c

uint FUN_0000aae0(char *param_1,int param_2)

{
  int *piVar1;
  char cVar2;
  longlong lVar3;
  uint uVar4;
  size_t sVar5;
  int iVar6;
  uint uVar7;
  int *piVar8;
  uint uVar9;
  
  cVar2 = '\0';
  if (param_1 != (char *)0x0) {
    cVar2 = *param_1;
  }
  if (param_1 == (char *)0x0 || cVar2 == '\0') {
LAB_0000ab3c:
    uVar7 = 0xffffffff;
    if (param_2 == 1) {
      iVar6 = FUN_00052f80(0xffffffff);
      uVar4 = DAT_005d4cd0;
      uVar7 = *(uint *)(iVar6 + 8);
      lVar3 = (ulonglong)uVar7 * (ulonglong)*(uint *)(iVar6 + 0x10);
      uVar9 = (uint)lVar3;
      *(uint *)(iVar6 + 8) = uVar9 + *(uint *)(iVar6 + 0x18);
      uVar7 = *(int *)(iVar6 + 0xc) * *(uint *)(iVar6 + 0x10) +
              uVar7 * *(int *)(iVar6 + 0x14) + (int)((ulonglong)lVar3 >> 0x20) +
              *(int *)(iVar6 + 0x1c) + (uint)CARRY4(uVar9,*(uint *)(iVar6 + 0x18));
      *(uint *)(iVar6 + 0xc) = uVar7;
      if (uVar4 < 2) {
        return uVar7;
      }
      uVar7 = (uint)((ulonglong)uVar7 * (ulonglong)(uVar4 - 1) >> 0x20);
    }
  }
  else {
    sVar5 = _strlen(param_1);
    iVar6 = FUN_002f69c4(param_1,sVar5);
    piVar8 = (int *)(DAT_005d4cdc + 0x250);
    uVar4 = 0;
    do {
      uVar7 = uVar4;
      if ((int)DAT_005d4cd0 <= (int)uVar7) goto LAB_0000ab3c;
      if (*piVar8 == iVar6) {
        return uVar7;
      }
      piVar1 = piVar8 + 1;
      piVar8 = piVar8 + 0xce;
      uVar4 = uVar7 + 1;
    } while (*piVar1 != iVar6);
  }
  return uVar7;
}


```

## FUN_0000af04 — 0000af04

- 函数名: FUN_0000af04
- 函数体: 75 字节
- 调用者数: 3 / 被调用者数: 1

```c

void FUN_0000af04(undefined4 param_1)

{
  int iVar1;
  int iVar2;
  
  iVar1 = DAT_005d4cd0;
  iVar2 = 0;
  if (0 < DAT_005d4cd0) {
    iVar2 = 0;
    do {
      (&DAT_00556e8c)[iVar2] = iVar2;
      iVar2 = iVar2 + 1;
    } while (iVar2 < iVar1);
    iVar2 = iVar1;
    if (iVar1 < 2) {
      iVar2 = 1;
    }
  }
  FUN_0000ac24(param_1,&DAT_00556e8c,iVar2);
  return;
}


```

## FUN_0005ef30 — 0005ef30

- 函数名: FUN_0005ef30
- 函数体: 49 字节
- 调用者数: 2 / 被调用者数: 0

```c

undefined4 FUN_0005ef30(int param_1)

{
  undefined *puVar1;
  int iVar2;
  int *piVar3;
  
  puVar1 = PTR_DAT_004d9184;
  piVar3 = (int *)(param_1 + 0x1c);
  do {
    piVar3 = (int *)*piVar3;
    if (piVar3 == (int *)(param_1 + 0x1c)) {
      return 0;
    }
    iVar2 = (**(code **)(*(int *)piVar3[2] + 0x3c))();
  } while (iVar2 != *(int *)puVar1);
  return 1;
}


```

## FUN_000617a8 — 000617a8

- 函数名: FUN_000617a8
- 函数体: 5 字节
- 调用者数: 6 / 被调用者数: 0

```c

undefined4 FUN_000617a8(int param_1)

{
  return *(undefined4 *)(param_1 + 0x88);
}


```

