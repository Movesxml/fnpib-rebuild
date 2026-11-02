# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0039834c — 0039834c

- 函数名: FUN_0039834c
- 函数体: 249 字节
- 调用者数: 18 / 被调用者数: 5

```c

int FUN_0039834c(int param_1,int *param_2,int param_3)

{
  int iVar1;
  int iVar2;
  int *piVar3;
  undefined4 *local_2c;
  int local_28;
  int local_24 [2];
  
  if (*(int *)(param_1 + 0x4c) == 0) {
    return 0;
  }
  for (iVar2 = *(int *)(param_1 + 0x260); *(int *)(iVar2 + 0x38) != 0;
      iVar2 = *(int *)(*(int *)(iVar2 + 0x38) + 4)) {
  }
  if (*(char *)(iVar2 + 0x48) != '\0') {
    if (*param_2 == 1) {
      piVar3 = *(int **)(param_1 + 0x288);
      iVar2 = *piVar3;
      while (iVar2 == 0) {
        piVar3 = piVar3 + 1;
        iVar2 = *piVar3;
      }
      while (iVar2 != *(int *)(*(int *)(param_1 + 0x288) + *(int *)(param_1 + 0x28c) * 4)) {
        iVar1 = FUN_003e4df8(iVar2 + 0x28);
        if (iVar1 != 0) {
          return 1;
        }
        iVar2 = *(int *)(iVar2 + 0x1b4);
        while (iVar2 == 0) {
          piVar3 = piVar3 + 1;
          iVar2 = *piVar3;
        }
      }
    }
    else {
      FUN_003a1988(local_24,param_1 + 0x280,param_2);
      if (local_24[0] != *(int *)(*(int *)(param_1 + 0x288) + *(int *)(param_1 + 0x28c) * 4)) {
        FUN_0039abbc(param_1 + 0x280,param_2);
        iVar2 = FUN_003e4df8();
        if (iVar2 != 0) {
          return iVar2;
        }
      }
    }
    if (param_3 == 1) {
      local_2c = &DAT_0052cb68;
      local_28 = *(int *)(param_1 + 0x10);
      while (local_28 != 0) {
        iVar2 = 0;
        if (local_28 != -4) {
          iVar2 = local_28;
        }
        iVar2 = FUN_0039834c(iVar2,param_2,1);
        if (iVar2 != 0) {
          return 1;
        }
        (*(code *)*local_2c)(&local_2c);
      }
    }
    return 0;
  }
  return 0;
}


```

## FUN_0039725c — 0039725c

- 函数名: FUN_0039725c
- 函数体: 31 字节
- 调用者数: 118 / 被调用者数: 2

```c

undefined4 FUN_0039725c(undefined4 param_1,int *param_2)

{
  undefined4 uVar1;
  
  if (*param_2 == 1) {
    return 0;
  }
  uVar1 = FUN_0030f8f0(param_2);
  uVar1 = FUN_003972e8(param_1,uVar1);
  return uVar1;
}


```

## FUN_00396d98 — 00396d98

- 函数名: FUN_00396d98
- 函数体: 145 字节
- 调用者数: 28 / 被调用者数: 4

```c

void FUN_00396d98(int param_1,int param_2)

{
  int iVar1;
  int iVar2;
  int *piVar3;
  undefined4 *local_24;
  int local_20;
  
  piVar3 = *(int **)(param_1 + 0x288);
  iVar2 = *piVar3;
  while (iVar2 == 0) {
    piVar3 = piVar3 + 1;
    iVar2 = *piVar3;
  }
  while (iVar2 != *(int *)(*(int *)(param_1 + 0x288) + *(int *)(param_1 + 0x28c) * 4)) {
    iVar1 = FUN_003e4df8(iVar2 + 0x28);
    if (iVar1 == 1) {
      FUN_003e4ee0(iVar2 + 0x28);
    }
    iVar2 = *(int *)(iVar2 + 0x1b4);
    while (iVar2 == 0) {
      piVar3 = piVar3 + 1;
      iVar2 = *piVar3;
    }
  }
  if (param_2 == 1) {
    local_24 = &DAT_0052cb68;
    local_20 = *(int *)(param_1 + 0x10);
    while (local_20 != 0) {
      iVar2 = 0;
      if (local_20 != -4) {
        iVar2 = local_20;
      }
      FUN_00396d98(iVar2,1);
      (*(code *)*local_24)(&local_24);
    }
  }
  return;
}


```

