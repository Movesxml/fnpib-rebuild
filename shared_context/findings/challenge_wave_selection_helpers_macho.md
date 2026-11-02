# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_000579c8 — 000579c8

- 函数名: FUN_000579c8
- 函数体: 119 字节
- 调用者数: 1 / 被调用者数: 3

```c

undefined4 FUN_000579c8(int param_1,int param_2)

{
  undefined4 *puVar1;
  size_t sVar2;
  int iVar3;
  int iVar4;
  int *piVar5;
  char *pcVar6;
  int *piVar7;
  
  *(undefined4 *)(param_1 + 0x228) = 0;
  if (*(int *)(PTR_DAT_004d9048 + 0x10) == 1) {
    puVar1 = (undefined4 *)(param_1 + *(int *)(param_1 + 0x164) * 0xc + 0x140);
  }
  else {
    puVar1 = (undefined4 *)(param_1 + *(int *)(PTR_DAT_004d9048 + 0x10) * 0xc + 0x98);
  }
  piVar7 = (int *)puVar1[1];
  piVar5 = (int *)*puVar1;
  do {
    if (piVar7 == piVar5) {
      return 0;
    }
    iVar4 = *piVar5;
    pcVar6 = (char *)(iVar4 + 8);
    sVar2 = _strlen(pcVar6);
    iVar3 = FUN_002f69c4(pcVar6,sVar2);
    piVar5 = piVar5 + 1;
  } while (iVar3 != param_2);
  *(int *)(param_1 + 0x228) = iVar4;
  FUN_00054dd8(param_1,0);
  return 1;
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

## FUN_000587b8 — 000587b8

- 函数名: FUN_000587b8
- 函数体: 53 字节
- 调用者数: 1 / 被调用者数: 2

```c

undefined4 * FUN_000587b8(undefined4 *param_1,int *param_2)

{
  void *pvVar1;
  uint uVar2;
  
  FUN_000587f0(param_1,param_2[1] - *param_2 >> 2,param_2);
  pvVar1 = (void *)*param_1;
  uVar2 = param_2[1] - *param_2;
  _memmove(pvVar1,(void *)*param_2,uVar2);
  param_1[1] = (uVar2 & 0xfffffffc) + (int)pvVar1;
  return param_1;
}


```

