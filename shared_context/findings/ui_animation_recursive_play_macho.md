# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_00398154 — 00398154

- 函数名: FUN_00398154
- 函数体: 143 字节
- 调用者数: 5 / 被调用者数: 7

```c

void FUN_00398154(int param_1,undefined4 param_2,int param_3)

{
  undefined4 uVar1;
  int iVar2;
  undefined4 *local_2c;
  int local_28;
  int local_24 [2];
  
  FUN_003a1988(local_24,param_1 + 0x280,param_2);
  if (local_24[0] != *(int *)(*(int *)(param_1 + 0x288) + *(int *)(param_1 + 0x28c) * 4)) {
    FUN_0039abbc(param_1 + 0x280,param_2);
    uVar1 = FUN_003e4f54();
    FUN_003e5528(local_24[0] + 0x28,uVar1);
    FUN_003e4e88(local_24[0] + 0x28);
  }
  if (param_3 == 1) {
    local_2c = &DAT_0052cb68;
    local_28 = *(int *)(param_1 + 0x10);
    while (local_28 != 0) {
      iVar2 = 0;
      if (local_28 != -4) {
        iVar2 = local_28;
      }
      FUN_00398154(iVar2,param_2,1);
      (*(code *)*local_2c)(&local_2c);
    }
  }
  return;
}


```

## FUN_003972e8 — 003972e8

- 函数名: FUN_003972e8
- 函数体: 495 字节
- 调用者数: 1 / 被调用者数: 6

```c

int FUN_003972e8(int param_1,byte *param_2)

{
  byte bVar1;
  undefined4 uVar2;
  int iVar3;
  byte *pbVar4;
  int iVar5;
  undefined4 *local_3c;
  int local_38;
  undefined4 *local_34;
  int local_30;
  undefined4 local_2c;
  undefined4 *local_28;
  int local_24;
  
LAB_00397326:
  bVar1 = *param_2;
  pbVar4 = param_2;
  if (bVar1 < 0x2e) {
    if (bVar1 == 0) {
      return param_1;
    }
  }
  else {
    if (0x5d < bVar1) {
      if (bVar1 != 0x5e) goto LAB_0039744c;
      pbVar4 = param_2 + 1;
      iVar5 = 0;
      if ((&DAT_0048e1fc)[*pbVar4] == '\0') {
        param_1 = *(int *)(param_1 + 4);
        param_2 = pbVar4;
      }
      else {
        do {
          iVar3 = iVar5;
          iVar5 = iVar3 + 1;
        } while ((&DAT_0048e1fc)[param_2[iVar3 + 1]] != '\0');
        uVar2 = FUN_002f69c4(pbVar4,iVar3);
        local_28 = &DAT_00533e74;
        local_24 = *(int *)(param_1 + 4);
        if (local_24 == 0) {
          return 0;
        }
        param_2 = param_2 + iVar3 + 1;
        while( true ) {
          param_1 = 0;
          if (local_24 != -4) {
            param_1 = local_24;
          }
          iVar5 = FUN_0030fd6c(param_1 + 0x18,pbVar4,iVar3,uVar2);
          if (iVar5 != 0) break;
          (*(code *)*local_28)(&local_28);
          if (local_24 == 0) {
            return 0;
          }
        }
      }
      goto LAB_003974a6;
    }
    if (bVar1 != 0x2e) {
      if (bVar1 != 0x3a) {
        iVar5 = 0;
        if (bVar1 == 0x40) {
          do {
            iVar3 = iVar5;
            iVar5 = iVar3 + 1;
          } while ((&DAT_0048e1fc)[param_2[iVar3 + 1]] != '\0');
          pbVar4 = param_2 + 1;
          uVar2 = FUN_002f69c4(pbVar4,iVar3);
          local_34 = &DAT_00533e68;
          local_30 = *(int *)(param_1 + 0x10);
          local_2c = 1;
          if (local_30 == 0) {
            return 0;
          }
          param_2 = param_2 + iVar3 + 1;
          while( true ) {
            param_1 = 0;
            if (local_30 != -4) {
              param_1 = local_30;
            }
            iVar5 = FUN_0030fd6c(param_1 + 0x18,pbVar4,iVar3,uVar2);
            if (iVar5 != 0) break;
            (*(code *)*local_34)(&local_34);
            if (local_30 == 0) {
              return 0;
            }
          }
          goto LAB_003974a6;
        }
        goto LAB_0039744c;
      }
      while( true ) {
        iVar5 = *(int *)(param_1 + 4);
        if ((iVar5 == 0) || (iVar3 = FUN_003ecb20(), iVar5 == *(int *)(iVar3 + 0x19c))) break;
        param_1 = *(int *)(param_1 + 4);
      }
      param_2 = param_2 + 1;
      goto LAB_00397326;
    }
    pbVar4 = param_2 + 1;
  }
LAB_0039744c:
  iVar5 = 0;
  while ((&DAT_0048e1fc)[pbVar4[iVar5]] != '\0') {
    iVar5 = iVar5 + 1;
  }
  uVar2 = FUN_002f69c4(pbVar4,iVar5);
  local_3c = &DAT_0052cb68;
  local_38 = *(int *)(param_1 + 0x10);
  if (local_38 == 0) {
    return 0;
  }
  while( true ) {
    param_1 = 0;
    if (local_38 != -4) {
      param_1 = local_38;
    }
    iVar3 = FUN_0030fd6c(param_1 + 0x18,pbVar4,iVar5,uVar2);
    param_2 = pbVar4 + iVar5;
    if (iVar3 != 0) break;
    (*(code *)*local_3c)(&local_3c);
    if (local_38 == 0) {
      return 0;
    }
  }
LAB_003974a6:
  if (param_1 == 0) {
    return 0;
  }
  goto LAB_00397326;
}


```

## FUN_003e4df8 — 003e4df8

- 函数名: FUN_003e4df8
- 函数体: 9 字节
- 调用者数: 5 / 被调用者数: 0

```c

bool FUN_003e4df8(int *param_1)

{
  return *param_1 != 0;
}


```

