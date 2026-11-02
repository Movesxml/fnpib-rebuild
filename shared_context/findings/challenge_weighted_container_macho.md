# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_000399a0 — 000399a0

- 函数名: FUN_000399a0
- 函数体: 133 字节
- 调用者数: 7 / 被调用者数: 0

```c

void FUN_000399a0(int *param_1)

{
  uint uVar1;
  int iVar2;
  undefined4 *puVar3;
  int iVar4;
  uint uVar5;
  uint uVar6;
  uint uVar7;
  undefined8 in_d0;
  undefined4 in_s3;
  undefined8 uVar8;
  undefined8 uVar9;
  
  param_1[3] = 0;
  iVar2 = *param_1;
  iVar4 = param_1[1];
  if (iVar4 != iVar2) {
    puVar3 = (undefined4 *)(iVar2 + 8);
    uVar5 = 0;
    do {
      if ((int)puVar3[2] < 1) {
        uVar6 = puVar3[-2];
        uVar9 = FixedToFP(CONCAT44(uVar6,uVar6),0,1,0,0x20);
        uVar8 = FixedToFP(CONCAT44(in_s3,puVar3[-1]),0,1,0,0x20);
        uVar9 = FloatVectorMult(CONCAT44((int)((ulonglong)in_d0 >> 0x20),*puVar3),uVar9,2,0x20);
        uVar8 = FloatVectorAdd(uVar8,uVar9,2);
        in_d0 = FPToFixed(uVar8,0,1,3,0x20);
        uVar7 = (uint)in_d0;
        puVar3[-1] = uVar7;
        uVar1 = 0;
        if ((uVar7 != 0) && (uVar1 = uVar6, uVar7 < uVar6)) {
          uVar1 = uVar7;
        }
        puVar3[-1] = uVar1;
        param_1[3] = uVar1 + param_1[3];
      }
      else {
        puVar3[2] = puVar3[2] + -1;
      }
      uVar5 = uVar5 + 1;
      puVar3 = puVar3 + 5;
    } while (uVar5 < (uint)((iVar4 - iVar2 >> 2) * -0x33333333));
    return;
  }
  return;
}


```

## FUN_00039b24 — 00039b24

- 函数名: FUN_00039b24
- 函数体: 153 字节
- 调用者数: 7 / 被调用者数: 0

```c

undefined4 FUN_00039b24(int *param_1)

{
  longlong lVar1;
  uint uVar2;
  uint uVar3;
  undefined4 *puVar4;
  int iVar5;
  uint uVar6;
  uint uVar7;
  
  uVar7 = param_1[3];
  uVar2 = param_1[5];
  lVar1 = (ulonglong)uVar2 * (ulonglong)(uint)param_1[7];
  uVar3 = (uint)lVar1;
  param_1[5] = param_1[9] + uVar3;
  uVar2 = param_1[6] * param_1[7] + uVar2 * param_1[8] + (int)((ulonglong)lVar1 >> 0x20) +
          param_1[10] + (uint)CARRY4(param_1[9],uVar3);
  param_1[6] = uVar2;
  if (uVar7 != 0 && uVar7 != 0xffffffff) {
    uVar2 = (uint)((ulonglong)uVar2 * (ulonglong)uVar7 >> 0x20);
  }
  iVar5 = *param_1;
  if (param_1[1] != iVar5) {
    puVar4 = (undefined4 *)(iVar5 + 0xc);
    uVar3 = 0;
    uVar6 = 0;
    do {
      uVar6 = uVar6 + puVar4[-2];
      if (uVar2 < uVar6) {
        param_1[3] = uVar7 - puVar4[-2];
        puVar4[-2] = 0;
        puVar4[1] = param_1[4];
        return *puVar4;
      }
      puVar4 = puVar4 + 5;
      uVar3 = uVar3 + 1;
    } while (uVar3 < (uint)((param_1[1] - iVar5 >> 2) * -0x33333333));
  }
  return 0;
}


```

## FUN_00039bc0 — 00039bc0

- 函数名: FUN_00039bc0
- 函数体: 17 字节
- 调用者数: 3 / 被调用者数: 1

```c

void FUN_00039bc0(int param_1,int *param_2)

{
  *(int *)(param_1 + 0xc) = *param_2 + *(int *)(param_1 + 0xc);
  FUN_0003a1b8();
  return;
}


```

## FUN_0003994c — 0003994c

- 函数名: FUN_0003994c
- 函数体: 81 字节
- 调用者数: 4 / 被调用者数: 1

```c

undefined4 * FUN_0003994c(undefined4 *param_1,undefined4 param_2)

{
  param_1[4] = param_2;
  *param_1 = 0;
  param_1[1] = 0;
  param_1[2] = 0;
  FUN_00301080(param_1 + 5);
  param_1[5] = *(undefined4 *)(PTR_DAT_004d9048 + 0x1b4);
  param_1[6] = 0;
  param_1[7] = 0x6c078965;
  param_1[8] = 0x5d588b65;
  param_1[9] = 0x269ec3;
  param_1[10] = 0;
  return param_1;
}


```

## FUN_00065958 — 00065958

- 函数名: FUN_00065958
- 函数体: 13 字节
- 调用者数: 2 / 被调用者数: 1

```c

undefined4 FUN_00065958(undefined4 param_1)

{
  FUN_0006644c();
  return param_1;
}


```

