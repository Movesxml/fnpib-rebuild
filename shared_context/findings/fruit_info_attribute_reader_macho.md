# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0030c6c0 — 0030c6c0

- 函数名: FUN_0030c6c0
- 函数体: 85 字节
- 调用者数: 30 / 被调用者数: 2

```c

undefined4 FUN_0030c6c0(int param_1,char *param_2,undefined4 param_3)

{
  int iVar1;
  undefined4 uVar2;
  int *piVar3;
  int iVar4;
  
  piVar3 = (int *)(param_1 + 0x4c);
  do {
    iVar4 = *piVar3;
    if (iVar4 == param_1 + 0x2c) {
      return 1;
    }
    iVar1 = _strcmp((char *)(*(int *)(iVar4 + 0x14) + 8),param_2);
    piVar3 = (int *)(iVar4 + 0x20);
  } while (iVar1 != 0);
  uVar2 = 1;
  if (iVar4 != 0) {
    iVar4 = _sscanf((char *)(*(int *)(iVar4 + 0x18) + 8),"%d",param_3);
    uVar2 = 2;
    if (iVar4 == 1) {
      uVar2 = 0;
    }
  }
  return uVar2;
}


```

## FUN_0030c660 — 0030c660

- 函数名: FUN_0030c660
- 函数体: 51 字节
- 调用者数: 81 / 被调用者数: 1

```c

int FUN_0030c660(int param_1,char *param_2)

{
  int iVar1;
  int *piVar2;
  int iVar3;
  
  piVar2 = (int *)(param_1 + 0x4c);
  do {
    iVar3 = *piVar2;
    if (iVar3 == param_1 + 0x2c) {
      return 0;
    }
    iVar1 = _strcmp((char *)(*(int *)(iVar3 + 0x14) + 8),param_2);
    piVar2 = (int *)(iVar3 + 0x20);
  } while (iVar1 != 0);
  iVar1 = 0;
  if (iVar3 != 0) {
    iVar1 = *(int *)(iVar3 + 0x18) + 8;
  }
  return iVar1;
}


```

