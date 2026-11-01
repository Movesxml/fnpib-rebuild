# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_00071838 — 00071838

- 函数名: FUN_00071838
- 函数体: 117 字节
- 调用者数: 0 / 被调用者数: 5

```c

void FUN_00071838(undefined4 param_1,int param_2,undefined4 param_3,undefined1 *param_4)

{
  undefined4 uVar1;
  undefined4 uVar2;
  int iVar3;
  undefined4 local_28;
  undefined4 local_24;
  undefined4 local_20;
  undefined1 local_1c [4];
  
  local_28 = *(undefined4 *)(param_2 + 0x688);
  local_24 = *(undefined4 *)(param_2 + 0x68c);
  local_20 = *(undefined4 *)(param_2 + 0x690);
  uVar1 = FUN_00033ca0();
  uVar2 = FUN_002f69c4("heartLostSml",0xc);
  iVar3 = FUN_00035a08(uVar1,uVar2,0,0);
  if (iVar3 != 0) {
    FUN_00039eb8(&local_28,iVar3 + 8);
    *(undefined4 *)(iVar3 + 0x10) = 0x42480000;
  }
  local_1c[0] = 0;
  FUN_0001da28(*(undefined4 *)(param_2 + 0x260),local_1c);
  *param_4 = 1;
  return;
}


```

