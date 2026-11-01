# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_000580e4 — 000580e4

- 函数名: FUN_000580e4
- 函数体: 33 字节
- 调用者数: 1 / 被调用者数: 0

```c

undefined4 FUN_000580e4(int param_1,int param_2)

{
  int iVar1;
  undefined8 uVar2;
  undefined4 in_s3;
  
  uVar2 = 0x3f8000003f800000;
  iVar1 = *(int *)(param_1 + param_2 * 4 + 0x168);
  if (iVar1 != 0) {
    uVar2 = CONCAT44(0x3f800000,*(undefined4 *)(iVar1 + 0xa4));
  }
  uVar2 = FloatVectorMult(uVar2,CONCAT44(in_s3,*(undefined4 *)(param_1 + 0x70)),2,0x20);
  return (int)uVar2;
}


```

## FUN_00057bd0 — 00057bd0

- 函数名: FUN_00057bd0
- 函数体: 53 字节
- 调用者数: 3 / 被调用者数: 0

```c

void FUN_00057bd0(int param_1,undefined4 param_2,int param_3)

{
  float fVar1;
  undefined8 in_d0;
  undefined8 uVar2;
  
  param_1 = param_1 + param_3 * 4;
  fVar1 = *(float *)(param_1 + 0x4c);
  if (fVar1 <= 0.0) {
    return;
  }
  uVar2 = FloatVectorAdd(CONCAT44((int)((ulonglong)in_d0 >> 0x20),fVar1),CONCAT44(param_2,param_2),2
                        );
  fVar1 = 1.0;
  if ((int)((uint)((float)uVar2 < 1.0) << 0x1f) < 0) {
    fVar1 = (float)uVar2;
  }
  *(float *)(param_1 + 0x4c) = fVar1;
  return;
}


```

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

