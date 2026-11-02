# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0005ed04 — 0005ed04

- 函数名: FUN_0005ed04
- 函数体: 20 字节
- 调用者数: 0 / 被调用者数: 0

```c

void FUN_0005ed04(void)

{
  int unaff_r4;
  int *unaff_r5;
  char in_ZR;
  
  while (in_ZR == '\0') {
    if (((int *)unaff_r5[2])[0x16] == 1) {
      (**(code **)(*(int *)unaff_r5[2] + 0x30))();
    }
    unaff_r5 = (int *)*unaff_r5;
    in_ZR = unaff_r5 == (int *)unaff_r4;
  }
  return;
}


```

## FUN_0005ed18 — 0005ed18

- 函数名: FUN_0005ed18
- 函数体: 50 字节
- 调用者数: 1 / 被调用者数: 0

```c

void FUN_0005ed18(int param_1)

{
  int *piVar1;
  int *piVar2;
  int iVar3;
  
  *(undefined4 *)(param_1 + 0x28) = 0;
  piVar1 = (int *)(param_1 + 0x1c);
  piVar2 = (int *)*piVar1;
  if (piVar2 != piVar1) {
    do {
      iVar3 = piVar2[2];
      if (((*(int *)(iVar3 + 0x58) == 1) && (*(char *)(iVar3 + 0x54) != '\0')) &&
         (*(int *)(iVar3 + 0x5c) == 1)) {
        *(undefined4 *)(param_1 + 0x28) = 1;
      }
      piVar2 = (int *)*piVar2;
    } while (piVar2 != piVar1);
    return;
  }
  return;
}


```

## FUN_0005ed20 — 0005fc1c

- 函数名: FUN_0005fc1c
- 函数体: 347 字节
- 调用者数: 2 / 被调用者数: 8

```c

void FUN_0005fc1c(int param_1)

{
  longlong lVar1;
  float fVar2;
  undefined *puVar3;
  undefined *puVar4;
  int iVar5;
  uint uVar6;
  undefined4 uVar7;
  int iVar8;
  uint uVar9;
  undefined4 uVar10;
  int iVar11;
  undefined8 in_d0;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined8 uVar12;
  undefined8 uVar13;
  undefined8 uVar14;
  undefined **local_48;
  undefined *local_44;
  undefined1 local_28;
  int local_24;
  
  puVar3 = PTR____stack_chk_guard_004d9044;
  uVar7 = (undefined4)((ulonglong)in_d0 >> 0x20);
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  iVar5 = *(int *)(param_1 + 0x68);
  if (*(int *)(iVar5 + 0xa4) == 0) {
    FUN_0030a1d8();
    FUN_0030a7e4();
    local_28 = 1;
    local_48 = (undefined **)0x0;
    uVar7 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
    FUN_0000a298(&local_48);
    local_28 = 0;
    local_48 = &PTR_LAB_0052bf38;
    local_44 = PTR_FUN_004d9058;
    FUN_0002bb34(uVar7,"act-change",0x3f800000,0x3f800000,&local_48,0);
    FUN_0000a298(&local_48);
    *(undefined1 *)(param_1 + 0x8c) = 0;
    iVar5 = *(int *)(param_1 + 0x68);
    uVar7 = extraout_s1;
  }
  if (*(int *)(iVar5 + 0xac) != 0) {
    uVar7 = FUN_0002ede8();
    FUN_000300e0(uVar7,*(undefined4 *)(*(int *)(param_1 + 0x68) + 0xac));
    iVar5 = *(int *)(param_1 + 0x68);
    uVar7 = extraout_s1_00;
  }
  puVar4 = PTR_DAT_004d9050;
  fVar2 = DAT_0005fd78;
  iVar8 = *(int *)(iVar5 + 0x88);
  iVar11 = *(int *)(iVar5 + 0x8c);
  if (iVar8 != iVar11) {
    lVar1 = (ulonglong)*(uint *)PTR_DAT_004d9050 * (ulonglong)*(uint *)(PTR_DAT_004d9050 + 8);
    uVar9 = (uint)lVar1;
    uVar6 = *(int *)(PTR_DAT_004d9050 + 4) * *(uint *)(PTR_DAT_004d9050 + 8) +
            *(uint *)PTR_DAT_004d9050 * *(int *)(PTR_DAT_004d9050 + 0xc) +
            (int)((ulonglong)lVar1 >> 0x20) +
            *(int *)(PTR_DAT_004d9050 + 0x14) +
            (uint)CARRY4(uVar9,*(uint *)(PTR_DAT_004d9050 + 0x10));
    uVar10 = (undefined4)((ulonglong)uVar6 * 0x7ffff >> 0x20);
    *(uint *)PTR_DAT_004d9050 = uVar9 + *(uint *)(PTR_DAT_004d9050 + 0x10);
    *(uint *)(puVar4 + 4) = uVar6;
    iVar11 = iVar11 - iVar8;
    uVar12 = FixedToFP(CONCAT44(uVar10,uVar10),0,1,0,0x20);
    uVar14 = FixedToFP(CONCAT44(iVar11,iVar11),0,0,0,0x20);
    uVar13 = FixedToFP(CONCAT44(iVar8,iVar8),0,0,0,0x20);
    uVar12 = FloatVectorMult(uVar14,CONCAT44(uVar7,(float)uVar12 / fVar2),2,0x20);
    uVar12 = FloatVectorAdd(uVar13,uVar12,2);
    uVar12 = FPToFixed(uVar12,0,0,3,0x20);
    iVar8 = (int)uVar12;
  }
  *(int *)(iVar5 + 0x7c) = iVar8;
  *(undefined4 *)(iVar5 + 0x80) = 0;
  *(undefined4 *)(iVar5 + 0x84) = 0;
  FUN_0006ee88();
  if (*(int *)puVar3 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0005ed4c — 0005ed4c

- 函数名: FUN_0005ed4c
- 函数体: 2 字节
- 调用者数: 0 / 被调用者数: 0

```c

void FUN_0005ed4c(void)

{
  return;
}


```

## FUN_0005ed50 — 0005ed50

- 函数名: FUN_0005ed50
- 函数体: 2 字节
- 调用者数: 0 / 被调用者数: 0

```c

void FUN_0005ed50(void)

{
  return;
}


```

## FUN_0005ecf4 — 0005ecf4

- 函数名: FUN_0005ecf4
- 函数体: 15 字节
- 调用者数: 1 / 被调用者数: 0

```c

void FUN_0005ecf4(int param_1)

{
  undefined4 *puVar1;
  
  for (puVar1 = *(undefined4 **)(param_1 + 0x1c); puVar1 != (undefined4 *)(param_1 + 0x1c);
      puVar1 = (undefined4 *)*puVar1) {
    if (((int *)puVar1[2])[0x16] == 1) {
      (**(code **)(*(int *)puVar1[2] + 0x30))();
    }
  }
  return;
}


```

## FUN_0005f21c — 0005f21c

- 函数名: FUN_0005f21c
- 函数体: 44 字节
- 调用者数: 0 / 被调用者数: 0

```c

undefined4 FUN_0005f21c(int param_1,int param_2,int param_3,undefined4 param_4)

{
  int iVar1;
  int iVar2;
  
  iVar1 = *(int *)(param_1 + 0x50);
  if (iVar1 != 0) {
    param_4 = 0;
  }
  if (iVar1 == 0 || iVar1 == param_3) {
    param_4 = 0;
    iVar2 = *(int *)(param_1 + 0x5c);
    iVar1 = 0;
    if (*(int *)(param_1 + 0x48) <= param_2) {
      iVar1 = *(int *)(param_1 + 0x58);
    }
    *(int *)(param_1 + 0x5c) = iVar1;
    if (iVar1 != iVar2) {
      param_4 = 1;
    }
  }
  return param_4;
}


```

## FUN_0005f83c — 0005f83c

- 函数名: FUN_0005f83c
- 函数体: 26 字节
- 调用者数: 0 / 被调用者数: 1

```c

void FUN_0005f83c(int param_1)

{
  FUN_00027508(*(undefined4 *)(PTR_DAT_004d9048 + 0x5c),*(undefined4 *)(param_1 + 0x50));
  return;
}


```

## FUN_0005f888 — 0005f888

- 函数名: FUN_0005f888
- 函数体: 12 字节
- 调用者数: 0 / 被调用者数: 1

```c

void FUN_0005f888(void)

{
  FUN_0001cd94(0);
  return;
}


```

