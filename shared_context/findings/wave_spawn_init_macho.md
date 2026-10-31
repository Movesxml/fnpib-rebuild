# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_00057b84 — 00057b84

- 函数名: FUN_00057b84
- 函数体: 75 字节
- 调用者数: 1 / 被调用者数: 2

```c

undefined4 FUN_00057b84(int param_1,undefined4 param_2)

{
  undefined4 uVar1;
  undefined4 extraout_s1;
  undefined4 extraout_s3;
  undefined8 uVar2;
  
  *(undefined4 *)(param_1 + 0x1c) = 0xffffffff;
  uVar1 = FUN_00057af0(param_1);
  *(undefined4 *)(param_1 + 0x88) = 0;
  *(undefined4 *)(param_1 + 0x74) = uVar1;
  *(undefined4 *)(param_1 + 0x78) = uVar1;
  *(undefined4 *)(param_1 + 0x7c) = 0;
  FUN_00055670(param_1);
  uVar2 = FloatVectorMult(CONCAT44(extraout_s3,*(undefined4 *)(param_1 + 0x70)),
                          CONCAT44(param_2,param_2),2,0x20);
  uVar2 = FloatVectorAdd(CONCAT44(extraout_s1,*(undefined4 *)(param_1 + 0x6c)),uVar2,2);
  uVar2 = FloatVectorMax(0,uVar2,2,0x20);
  *(int *)(param_1 + 0x80) = (int)uVar2;
  return (int)uVar2;
}


```

