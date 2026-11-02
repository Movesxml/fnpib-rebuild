# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0003a1b8 — 0003a1b8

- 函数名: FUN_0003a1b8
- 函数体: 45 字节
- 调用者数: 1 / 被调用者数: 1

```c

void FUN_0003a1b8(int param_1,undefined4 *param_2)

{
  int iVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined4 *puVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  
  puVar4 = *(undefined4 **)(param_1 + 4);
  if (puVar4 != *(undefined4 **)(param_1 + 8)) {
    iVar1 = 0;
    if (puVar4 != (undefined4 *)0x0) {
      uVar3 = param_2[1];
      uVar5 = param_2[2];
      uVar6 = param_2[3];
      uVar2 = param_2[4];
      *puVar4 = *param_2;
      puVar4[1] = uVar3;
      puVar4[2] = uVar5;
      puVar4[3] = uVar6;
      puVar4[4] = uVar2;
      iVar1 = *(int *)(param_1 + 4);
    }
    *(int *)(param_1 + 4) = iVar1 + 0x14;
    return;
  }
  FUN_0003a1e8(param_1,puVar4);
  return;
}


```

