# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_003e7dc0 — 003e8db0

- 函数名: FUN_003e8db0
- 函数体: 21 字节
- 调用者数: 0 / 被调用者数: 1

```c

undefined4 * FUN_003e8db0(undefined4 *param_1)

{
  if ((void *)*param_1 != (void *)0x0) {
    operator_delete__((void *)*param_1);
    *param_1 = 0;
  }
  return param_1;
}


```

## FUN_003e7dc4 — 003e8db0

- 函数名: FUN_003e8db0
- 函数体: 21 字节
- 调用者数: 0 / 被调用者数: 1

```c

undefined4 * FUN_003e8db0(undefined4 *param_1)

{
  if ((void *)*param_1 != (void *)0x0) {
    operator_delete__((void *)*param_1);
    *param_1 = 0;
  }
  return param_1;
}


```

## FUN_003e7e0c — 003e7e0c

- 函数名: FUN_003e7e0c
- 函数体: 73 字节
- 调用者数: 0 / 被调用者数: 1

```c

float FUN_003e7e0c(undefined4 param_1)

{
  undefined4 uVar1;
  undefined8 uVar2;
  
  uVar2 = FloatVectorMult(CONCAT44(param_1,param_1),0xc0000000c0000000,2,0x20);
  uVar2 = FloatVectorAdd(uVar2,0x3f8000003f800000,2);
  uVar2 = FloatVectorMult(uVar2,0x40c0000040c00000,2,0x20);
  uVar1 = _powf(0x402df854,(int)uVar2);
  uVar2 = FloatVectorAdd(CONCAT44(uVar1,uVar1),0x3f8000003f800000,2);
  return 1.0 / (float)uVar2;
}


```

## FUN_003e7e58 — 003e8dfc

- 函数名: FUN_003e8dfc
- 函数体: 127 字节
- 调用者数: 1 / 被调用者数: 4

```c

void FUN_003e8dfc(int *param_1,int param_2,undefined4 param_3)

{
  undefined4 uVar1;
  int iVar2;
  undefined4 uVar3;
  int *piVar4;
  int iVar5;
  int iVar6;
  
  uVar1 = FUN_0030fc50(param_3);
  iVar6 = *(int *)(param_2 + 8);
  iVar5 = *(int *)(param_2 + 0xc);
  iVar2 = ___umodsi3(uVar1,iVar5);
  piVar4 = *(int **)(iVar6 + iVar2 * 4);
  if (piVar4 != (int *)0x0) {
    do {
      uVar1 = FUN_0030f8f0(piVar4);
      iVar5 = *piVar4;
      uVar3 = FUN_0030fc50(piVar4);
      iVar5 = FUN_0030fd20(param_3,uVar1,iVar5 + -1,uVar3);
      if (iVar5 != 0) {
        iVar5 = *(int *)(param_2 + 8);
        *param_1 = (int)piVar4;
        param_1[1] = iVar5 + iVar2 * 4;
        return;
      }
      piVar4 = (int *)piVar4[0xb];
    } while (piVar4 != (int *)0x0);
    iVar6 = *(int *)(param_2 + 8);
    iVar5 = *(int *)(param_2 + 0xc);
  }
  *param_1 = *(int *)(iVar6 + iVar5 * 4);
  param_1[1] = iVar6 + iVar5 * 4;
  return;
}


```

## FUN_003e7e5c — 003e7e5c

- 函数名: FUN_003e7e5c
- 函数体: 113 字节
- 调用者数: 0 / 被调用者数: 4

```c

void FUN_003e7e5c(undefined4 param_1)

{
  int iVar1;
  
  if (((DAT_005b0060 & 1) == 0) && (iVar1 = ___cxa_guard_acquire(&DAT_005b0060), iVar1 != 0)) {
    FUN_0038cac0(&DAT_005b0078);
    ___cxa_atexit(&FUN_003e87a8_1,&DAT_005b0078,PTR___mh_execute_header_004d9040);
    ___cxa_guard_release(&DAT_005b0060);
  }
  (*(code *)*DAT_005b0078)(&DAT_005b0078,param_1);
  return;
}


```

## FUN_003e7ed0 — 003e7ed0

- 函数名: FUN_003e7ed0
- 函数体: 105 字节
- 调用者数: 0 / 被调用者数: 4

```c

void FUN_003e7ed0(undefined4 param_1)

{
  int iVar1;
  
  if (((DAT_005b0064 & 1) == 0) && (iVar1 = ___cxa_guard_acquire(&DAT_005b0064), iVar1 != 0)) {
    FUN_0038cd08(&DAT_005b0084);
    ___cxa_atexit(&FUN_003e87b8_1,&DAT_005b0084,PTR___mh_execute_header_004d9040);
    ___cxa_guard_release(&DAT_005b0064);
  }
  (*(code *)*DAT_005b0084)(&DAT_005b0084,param_1);
  return;
}


```

## FUN_003e7f3c — 003e7f3c

- 函数名: FUN_003e7f3c
- 函数体: 107 字节
- 调用者数: 0 / 被调用者数: 4

```c

void FUN_003e7f3c(undefined4 param_1)

{
  int iVar1;
  
  if (((DAT_005b0068 & 1) == 0) && (iVar1 = ___cxa_guard_acquire(&DAT_005b0068), iVar1 != 0)) {
    FUN_0038cf0c(&DAT_005b0090);
    ___cxa_atexit(&FUN_003e87c8_1,&DAT_005b0090,PTR___mh_execute_header_004d9040);
    ___cxa_guard_release(&DAT_005b0068);
  }
  (*(code *)*DAT_005b0090)(&DAT_005b0090,param_1);
  return;
}


```

## FUN_003e7fa8 — 003e7fa8

- 函数名: FUN_003e7fa8
- 函数体: 107 字节
- 调用者数: 0 / 被调用者数: 4

```c

void FUN_003e7fa8(undefined4 param_1)

{
  int iVar1;
  
  if (((DAT_005b006c & 1) == 0) && (iVar1 = ___cxa_guard_acquire(&DAT_005b006c), iVar1 != 0)) {
    FUN_0038d154(&DAT_005b009c);
    ___cxa_atexit(&FUN_003e87d8_1,&DAT_005b009c,PTR___mh_execute_header_004d9040);
    ___cxa_guard_release(&DAT_005b006c);
  }
  (*(code *)*DAT_005b009c)(&DAT_005b009c,param_1);
  return;
}


```

## FUN_003e8014 — 003e8014

- 函数名: FUN_003e8014
- 函数体: 107 字节
- 调用者数: 0 / 被调用者数: 4

```c

void FUN_003e8014(undefined4 param_1)

{
  int iVar1;
  
  if (((DAT_005b0070 & 1) == 0) && (iVar1 = ___cxa_guard_acquire(&DAT_005b0070), iVar1 != 0)) {
    FUN_0038d33c(&DAT_005b00a8);
    ___cxa_atexit(&FUN_003e87e8_1,&DAT_005b00a8,PTR___mh_execute_header_004d9040);
    ___cxa_guard_release(&DAT_005b0070);
  }
  (*(code *)*DAT_005b00a8)(&DAT_005b00a8,param_1);
  return;
}


```

## FUN_003e8080 — 003e8080

- 函数名: FUN_003e8080
- 函数体: 57 字节
- 调用者数: 0 / 被调用者数: 1

```c

float FUN_003e8080(undefined4 param_1)

{
  undefined8 in_d0;
  undefined8 uVar1;
  double dVar2;
  
  uVar1 = FloatVectorMult(CONCAT44(param_1,param_1),
                          CONCAT44((int)((ulonglong)in_d0 >> 0x20),DAT_003e80c8),2,0x20);
  dVar2 = (double)_cos(SUB84((double)(float)uVar1,0),(int)((ulonglong)(double)(float)uVar1 >> 0x20))
  ;
  return (float)((1.0 - dVar2) + DAT_003e80c0);
}


```

## FUN_003e80cc — 003e8ef0

- 函数名: FUN_003e8ef0
- 函数体: 1619 字节
- 调用者数: 1 / 被调用者数: 7

```c

void FUN_003e8ef0(int param_1)

{
  undefined4 *puVar1;
  undefined *puVar2;
  int iVar3;
  int iVar4;
  undefined4 uVar5;
  undefined4 *puVar6;
  undefined4 extraout_s1;
  undefined8 uVar7;
  undefined1 auStack_680 [40];
  undefined1 auStack_658 [40];
  undefined1 auStack_630 [40];
  undefined1 auStack_608 [40];
  undefined1 auStack_5e0 [40];
  undefined1 auStack_5b8 [40];
  undefined1 auStack_590 [40];
  undefined1 auStack_568 [40];
  undefined1 auStack_540 [40];
  undefined1 auStack_518 [40];
  undefined1 auStack_4f0 [40];
  undefined1 auStack_4c8 [40];
  undefined1 auStack_4a0 [40];
  undefined1 auStack_478 [40];
  undefined1 auStack_450 [40];
  undefined1 auStack_428 [40];
  undefined1 auStack_400 [40];
  undefined1 auStack_3d8 [40];
  undefined1 auStack_3b0 [40];
  undefined1 auStack_388 [40];
  undefined1 auStack_360 [40];
  undefined1 auStack_338 [40];
  undefined1 auStack_310 [40];
  undefined1 auStack_2e8 [40];
  undefined1 auStack_2c0 [40];
  undefined1 auStack_298 [40];
  undefined1 auStack_270 [40];
  undefined1 auStack_248 [40];
  undefined1 auStack_220 [40];
  undefined1 auStack_1f8 [40];
  undefined1 auStack_1d0 [40];
  undefined1 auStack_1a8 [40];
  undefined1 auStack_180 [40];
  undefined1 auStack_158 [40];
  undefined1 auStack_130 [40];
  undefined1 auStack_108 [40];
  undefined1 auStack_e0 [40];
  undefined1 auStack_b8 [40];
  undefined1 auStack_90 [40];
  undefined1 auStack_68 [40];
  undefined1 auStack_40 [40];
  int iStack_18;
  
  puVar2 = PTR____stack_chk_guard_004d9044;
  iStack_18 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_0030f7cc(auStack_40,"Invalid");
  *(undefined4 *)(param_1 + 8) = 0;
  puVar6 = (undefined4 *)&UNK_0048cd04;
  *(undefined4 *)(param_1 + 0xc) = 0;
  *(undefined4 *)(param_1 + 0x10) = 0;
  *(undefined4 *)(param_1 + 0x14) = 0;
  puVar1 = (undefined4 *)(param_1 + 4);
  *puVar1 = 0;
  *(undefined4 **)(param_1 + 0xc) = puVar1;
  *(undefined4 **)(param_1 + 0x10) = puVar1;
  *(undefined4 *)(param_1 + 0x24) = 0;
  *(undefined4 *)(param_1 + 0x28) = 0;
  *(undefined4 *)(param_1 + 0x2c) = 0x3f800000;
  *(undefined4 *)(param_1 + 0x30) = 0x40000000;
  *(undefined4 *)(param_1 + 0x34) = 0;
  iVar4 = 0x100;
  while (iVar3 = iVar4, 0 < iVar3) {
    iVar4 = iVar3 >> 1;
    if ((uint)puVar6[iVar4] < 10) {
      puVar6 = puVar6 + iVar4 + 1;
      iVar4 = (iVar3 + -1) - iVar4;
    }
  }
  uVar7 = FixedToFP(CONCAT44(extraout_s1,*puVar6),0,1,0,0x20);
  uVar5 = _ceilf((int)uVar7);
  uVar7 = FPToFixed(CONCAT44(uVar5,uVar5),0,1,3,0x20);
  *(int *)(param_1 + 0x34) = (int)uVar7;
  *(undefined4 *)(param_1 + 0x24) = *puVar6;
  uVar5 = FUN_003e988c((int)uVar7,param_1 + 0x18);
  *(undefined4 *)(param_1 + 0x20) = uVar5;
  FUN_0030f870(param_1 + 0x38,auStack_40);
  *(undefined4 *)(param_1 + 0x60) = 0xffffffff;
  FUN_0030f7e0(auStack_40);
  FUN_0030f7cc(auStack_68,"Invalid");
  FUN_003e9544(param_1,0xffffffff,auStack_68);
  FUN_0030f7e0(auStack_68);
  FUN_0030f7cc(auStack_90,"Linear");
  FUN_003e9544(param_1,0,auStack_90);
  FUN_0030f7e0(auStack_90);
  FUN_0030f7cc(auStack_b8,&DAT_00470ab1);
  FUN_003e9544(param_1,1,auStack_b8);
  FUN_0030f7e0(auStack_b8);
  FUN_0030f7cc(auStack_e0,"SCurve");
  FUN_003e9544(param_1,2,auStack_e0);
  FUN_0030f7e0(auStack_e0);
  FUN_0030f7cc(auStack_108,&DAT_00470abc);
  FUN_003e9544(param_1,3,auStack_108);
  FUN_0030f7e0(auStack_108);
  FUN_0030f7cc(auStack_130,"EaseOutEaseIn");
  FUN_003e9544(param_1,4,auStack_130);
  FUN_0030f7e0(auStack_130);
  FUN_0030f7cc(auStack_158,"EaseOutHardIn");
  FUN_003e9544(param_1,5,auStack_158);
  FUN_0030f7e0(auStack_158);
  FUN_0030f7cc(auStack_180,"EaseOutLinearIn");
  FUN_003e9544(param_1,6,auStack_180);
  FUN_0030f7e0(auStack_180);
  FUN_0030f7cc(auStack_1a8,"HardOutEaseIn");
  FUN_003e9544(param_1,7,auStack_1a8);
  FUN_0030f7e0(auStack_1a8);
  FUN_0030f7cc(auStack_1d0,"LinearOutEaseIn");
  FUN_003e9544(param_1,8,auStack_1d0);
  FUN_0030f7e0(auStack_1d0);
  FUN_0030f7cc(auStack_1f8,"EaseInSine");
  FUN_003e9544(param_1,9,auStack_1f8);
  FUN_0030f7e0(auStack_1f8);
  FUN_0030f7cc(auStack_220,"EaseInCubic");
  FUN_003e9544(param_1,10,auStack_220);
  FUN_0030f7e0(auStack_220);
  FUN_0030f7cc(auStack_248,"EaseInQuint");
  FUN_003e9544(param_1,0xb,auStack_248);
  FUN_0030f7e0(auStack_248);
  FUN_0030f7cc(auStack_270,"EaseInCirc");
  FUN_003e9544(param_1,0xc,auStack_270);
  FUN_0030f7e0(auStack_270);
  FUN_0030f7cc(auStack_298,"EaseInBack");
  FUN_003e9544(param_1,0xd,auStack_298);
  FUN_0030f7e0(auStack_298);
  FUN_0030f7cc(auStack_2c0,"EaseInQuad");
  FUN_003e9544(param_1,0xe,auStack_2c0);
  FUN_0030f7e0(auStack_2c0);
  FUN_0030f7cc(auStack_2e8,"EaseInQuart");
  FUN_003e9544(param_1,0xf,auStack_2e8);
  FUN_0030f7e0(auStack_2e8);
  FUN_0030f7cc(auStack_310,"EaseInExpo");
  FUN_003e9544(param_1,0x10,auStack_310);
  FUN_0030f7e0(auStack_310);
  FUN_0030f7cc(auStack_338,"EaseInElastic");
  FUN_003e9544(param_1,0x11,auStack_338);
  FUN_0030f7e0(auStack_338);
  FUN_0030f7cc(auStack_360,"EaseInBounce");
  FUN_003e9544(param_1,0x12,auStack_360);
  FUN_0030f7e0(auStack_360);
  FUN_0030f7cc(auStack_388,"EaseOutSine");
  FUN_003e9544(param_1,0x13,auStack_388);
  FUN_0030f7e0(auStack_388);
  FUN_0030f7cc(auStack_3b0,"EaseOutCubic");
  FUN_003e9544(param_1,0x14,auStack_3b0);
  FUN_0030f7e0(auStack_3b0);
  FUN_0030f7cc(auStack_3d8,"EaseOutQuint");
  FUN_003e9544(param_1,0x15,auStack_3d8);
  FUN_0030f7e0(auStack_3d8);
  FUN_0030f7cc(auStack_400,"EaseOutCirc");
  FUN_003e9544(param_1,0x16,auStack_400);
  FUN_0030f7e0(auStack_400);
  FUN_0030f7cc(auStack_428,"EaseOutBack");
  FUN_003e9544(param_1,0x17,auStack_428);
  FUN_0030f7e0(auStack_428);
  FUN_0030f7cc(auStack_450,"EaseOutQuad");
  FUN_003e9544(param_1,0x18,auStack_450);
  FUN_0030f7e0(auStack_450);
  FUN_0030f7cc(auStack_478,"EaseOutQuart");
  FUN_003e9544(param_1,0x19,auStack_478);
  FUN_0030f7e0(auStack_478);
  FUN_0030f7cc(auStack_4a0,"EaseOutExpo");
  FUN_003e9544(param_1,0x1a,auStack_4a0);
  FUN_0030f7e0(auStack_4a0);
  FUN_0030f7cc(auStack_4c8,"EaseOutElastic");
  FUN_003e9544(param_1,0x1b,auStack_4c8);
  FUN_0030f7e0(auStack_4c8);
  FUN_0030f7cc(auStack_4f0,"EaseOutBounce");
  FUN_003e9544(param_1,0x1c,auStack_4f0);
  FUN_0030f7e0(auStack_4f0);
  FUN_0030f7cc(auStack_518,"EaseInOutSine");
  FUN_003e9544(param_1,0x1d,auStack_518);
  FUN_0030f7e0(auStack_518);
  FUN_0030f7cc(auStack_540,"EaseInOutCubic");
  FUN_003e9544(param_1,0x1e,auStack_540);
  FUN_0030f7e0(auStack_540);
  FUN_0030f7cc(auStack_568,"EaseInOutQuint");
  FUN_003e9544(param_1,0x1f,auStack_568);
  FUN_0030f7e0(auStack_568);
  FUN_0030f7cc(auStack_590,"EaseInOutCirc");
  FUN_003e9544(param_1,0x20,auStack_590);
  FUN_0030f7e0(auStack_590);
  FUN_0030f7cc(auStack_5b8,"EaseInOutBack");
  FUN_003e9544(param_1,0x21,auStack_5b8);
  FUN_0030f7e0(auStack_5b8);
  FUN_0030f7cc(auStack_5e0,"EaseInOutQuad");
  FUN_003e9544(param_1,0x22,auStack_5e0);
  FUN_0030f7e0(auStack_5e0);
  FUN_0030f7cc(auStack_608,"EaseInOutQuart");
  FUN_003e9544(param_1,0x23,auStack_608);
  FUN_0030f7e0(auStack_608);
  FUN_0030f7cc(auStack_630,"EaseInOutExpo");
  FUN_003e9544(param_1,0x24,auStack_630);
  FUN_0030f7e0(auStack_630);
  FUN_0030f7cc(auStack_658,"EaseInOutElastic");
  FUN_003e9544(param_1,0x25,auStack_658);
  FUN_0030f7e0(auStack_658);
  FUN_0030f7cc(auStack_680,"EaseInOutBounce");
  FUN_003e9544(param_1,0x26,auStack_680);
  FUN_0030f7e0(auStack_680);
  if (*(int *)puVar2 != iStack_18) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail(*(int *)puVar2);
  }
  return;
}


```

## FUN_003e80e8 — 003e8ef0

- 函数名: FUN_003e8ef0
- 函数体: 1619 字节
- 调用者数: 1 / 被调用者数: 7

```c

void FUN_003e8ef0(int param_1)

{
  undefined4 *puVar1;
  undefined *puVar2;
  int iVar3;
  int iVar4;
  undefined4 uVar5;
  undefined4 *puVar6;
  undefined4 extraout_s1;
  undefined8 uVar7;
  undefined1 auStack_680 [40];
  undefined1 auStack_658 [40];
  undefined1 auStack_630 [40];
  undefined1 auStack_608 [40];
  undefined1 auStack_5e0 [40];
  undefined1 auStack_5b8 [40];
  undefined1 auStack_590 [40];
  undefined1 auStack_568 [40];
  undefined1 auStack_540 [40];
  undefined1 auStack_518 [40];
  undefined1 auStack_4f0 [40];
  undefined1 auStack_4c8 [40];
  undefined1 auStack_4a0 [40];
  undefined1 auStack_478 [40];
  undefined1 auStack_450 [40];
  undefined1 auStack_428 [40];
  undefined1 auStack_400 [40];
  undefined1 auStack_3d8 [40];
  undefined1 auStack_3b0 [40];
  undefined1 auStack_388 [40];
  undefined1 auStack_360 [40];
  undefined1 auStack_338 [40];
  undefined1 auStack_310 [40];
  undefined1 auStack_2e8 [40];
  undefined1 auStack_2c0 [40];
  undefined1 auStack_298 [40];
  undefined1 auStack_270 [40];
  undefined1 auStack_248 [40];
  undefined1 auStack_220 [40];
  undefined1 auStack_1f8 [40];
  undefined1 auStack_1d0 [40];
  undefined1 auStack_1a8 [40];
  undefined1 auStack_180 [40];
  undefined1 auStack_158 [40];
  undefined1 auStack_130 [40];
  undefined1 auStack_108 [40];
  undefined1 auStack_e0 [40];
  undefined1 auStack_b8 [40];
  undefined1 auStack_90 [40];
  undefined1 auStack_68 [40];
  undefined1 auStack_40 [40];
  int iStack_18;
  
  puVar2 = PTR____stack_chk_guard_004d9044;
  iStack_18 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_0030f7cc(auStack_40,"Invalid");
  *(undefined4 *)(param_1 + 8) = 0;
  puVar6 = (undefined4 *)&UNK_0048cd04;
  *(undefined4 *)(param_1 + 0xc) = 0;
  *(undefined4 *)(param_1 + 0x10) = 0;
  *(undefined4 *)(param_1 + 0x14) = 0;
  puVar1 = (undefined4 *)(param_1 + 4);
  *puVar1 = 0;
  *(undefined4 **)(param_1 + 0xc) = puVar1;
  *(undefined4 **)(param_1 + 0x10) = puVar1;
  *(undefined4 *)(param_1 + 0x24) = 0;
  *(undefined4 *)(param_1 + 0x28) = 0;
  *(undefined4 *)(param_1 + 0x2c) = 0x3f800000;
  *(undefined4 *)(param_1 + 0x30) = 0x40000000;
  *(undefined4 *)(param_1 + 0x34) = 0;
  iVar4 = 0x100;
  while (iVar3 = iVar4, 0 < iVar3) {
    iVar4 = iVar3 >> 1;
    if ((uint)puVar6[iVar4] < 10) {
      puVar6 = puVar6 + iVar4 + 1;
      iVar4 = (iVar3 + -1) - iVar4;
    }
  }
  uVar7 = FixedToFP(CONCAT44(extraout_s1,*puVar6),0,1,0,0x20);
  uVar5 = _ceilf((int)uVar7);
  uVar7 = FPToFixed(CONCAT44(uVar5,uVar5),0,1,3,0x20);
  *(int *)(param_1 + 0x34) = (int)uVar7;
  *(undefined4 *)(param_1 + 0x24) = *puVar6;
  uVar5 = FUN_003e988c((int)uVar7,param_1 + 0x18);
  *(undefined4 *)(param_1 + 0x20) = uVar5;
  FUN_0030f870(param_1 + 0x38,auStack_40);
  *(undefined4 *)(param_1 + 0x60) = 0xffffffff;
  FUN_0030f7e0(auStack_40);
  FUN_0030f7cc(auStack_68,"Invalid");
  FUN_003e9544(param_1,0xffffffff,auStack_68);
  FUN_0030f7e0(auStack_68);
  FUN_0030f7cc(auStack_90,"Linear");
  FUN_003e9544(param_1,0,auStack_90);
  FUN_0030f7e0(auStack_90);
  FUN_0030f7cc(auStack_b8,&DAT_00470ab1);
  FUN_003e9544(param_1,1,auStack_b8);
  FUN_0030f7e0(auStack_b8);
  FUN_0030f7cc(auStack_e0,"SCurve");
  FUN_003e9544(param_1,2,auStack_e0);
  FUN_0030f7e0(auStack_e0);
  FUN_0030f7cc(auStack_108,&DAT_00470abc);
  FUN_003e9544(param_1,3,auStack_108);
  FUN_0030f7e0(auStack_108);
  FUN_0030f7cc(auStack_130,"EaseOutEaseIn");
  FUN_003e9544(param_1,4,auStack_130);
  FUN_0030f7e0(auStack_130);
  FUN_0030f7cc(auStack_158,"EaseOutHardIn");
  FUN_003e9544(param_1,5,auStack_158);
  FUN_0030f7e0(auStack_158);
  FUN_0030f7cc(auStack_180,"EaseOutLinearIn");
  FUN_003e9544(param_1,6,auStack_180);
  FUN_0030f7e0(auStack_180);
  FUN_0030f7cc(auStack_1a8,"HardOutEaseIn");
  FUN_003e9544(param_1,7,auStack_1a8);
  FUN_0030f7e0(auStack_1a8);
  FUN_0030f7cc(auStack_1d0,"LinearOutEaseIn");
  FUN_003e9544(param_1,8,auStack_1d0);
  FUN_0030f7e0(auStack_1d0);
  FUN_0030f7cc(auStack_1f8,"EaseInSine");
  FUN_003e9544(param_1,9,auStack_1f8);
  FUN_0030f7e0(auStack_1f8);
  FUN_0030f7cc(auStack_220,"EaseInCubic");
  FUN_003e9544(param_1,10,auStack_220);
  FUN_0030f7e0(auStack_220);
  FUN_0030f7cc(auStack_248,"EaseInQuint");
  FUN_003e9544(param_1,0xb,auStack_248);
  FUN_0030f7e0(auStack_248);
  FUN_0030f7cc(auStack_270,"EaseInCirc");
  FUN_003e9544(param_1,0xc,auStack_270);
  FUN_0030f7e0(auStack_270);
  FUN_0030f7cc(auStack_298,"EaseInBack");
  FUN_003e9544(param_1,0xd,auStack_298);
  FUN_0030f7e0(auStack_298);
  FUN_0030f7cc(auStack_2c0,"EaseInQuad");
  FUN_003e9544(param_1,0xe,auStack_2c0);
  FUN_0030f7e0(auStack_2c0);
  FUN_0030f7cc(auStack_2e8,"EaseInQuart");
  FUN_003e9544(param_1,0xf,auStack_2e8);
  FUN_0030f7e0(auStack_2e8);
  FUN_0030f7cc(auStack_310,"EaseInExpo");
  FUN_003e9544(param_1,0x10,auStack_310);
  FUN_0030f7e0(auStack_310);
  FUN_0030f7cc(auStack_338,"EaseInElastic");
  FUN_003e9544(param_1,0x11,auStack_338);
  FUN_0030f7e0(auStack_338);
  FUN_0030f7cc(auStack_360,"EaseInBounce");
  FUN_003e9544(param_1,0x12,auStack_360);
  FUN_0030f7e0(auStack_360);
  FUN_0030f7cc(auStack_388,"EaseOutSine");
  FUN_003e9544(param_1,0x13,auStack_388);
  FUN_0030f7e0(auStack_388);
  FUN_0030f7cc(auStack_3b0,"EaseOutCubic");
  FUN_003e9544(param_1,0x14,auStack_3b0);
  FUN_0030f7e0(auStack_3b0);
  FUN_0030f7cc(auStack_3d8,"EaseOutQuint");
  FUN_003e9544(param_1,0x15,auStack_3d8);
  FUN_0030f7e0(auStack_3d8);
  FUN_0030f7cc(auStack_400,"EaseOutCirc");
  FUN_003e9544(param_1,0x16,auStack_400);
  FUN_0030f7e0(auStack_400);
  FUN_0030f7cc(auStack_428,"EaseOutBack");
  FUN_003e9544(param_1,0x17,auStack_428);
  FUN_0030f7e0(auStack_428);
  FUN_0030f7cc(auStack_450,"EaseOutQuad");
  FUN_003e9544(param_1,0x18,auStack_450);
  FUN_0030f7e0(auStack_450);
  FUN_0030f7cc(auStack_478,"EaseOutQuart");
  FUN_003e9544(param_1,0x19,auStack_478);
  FUN_0030f7e0(auStack_478);
  FUN_0030f7cc(auStack_4a0,"EaseOutExpo");
  FUN_003e9544(param_1,0x1a,auStack_4a0);
  FUN_0030f7e0(auStack_4a0);
  FUN_0030f7cc(auStack_4c8,"EaseOutElastic");
  FUN_003e9544(param_1,0x1b,auStack_4c8);
  FUN_0030f7e0(auStack_4c8);
  FUN_0030f7cc(auStack_4f0,"EaseOutBounce");
  FUN_003e9544(param_1,0x1c,auStack_4f0);
  FUN_0030f7e0(auStack_4f0);
  FUN_0030f7cc(auStack_518,"EaseInOutSine");
  FUN_003e9544(param_1,0x1d,auStack_518);
  FUN_0030f7e0(auStack_518);
  FUN_0030f7cc(auStack_540,"EaseInOutCubic");
  FUN_003e9544(param_1,0x1e,auStack_540);
  FUN_0030f7e0(auStack_540);
  FUN_0030f7cc(auStack_568,"EaseInOutQuint");
  FUN_003e9544(param_1,0x1f,auStack_568);
  FUN_0030f7e0(auStack_568);
  FUN_0030f7cc(auStack_590,"EaseInOutCirc");
  FUN_003e9544(param_1,0x20,auStack_590);
  FUN_0030f7e0(auStack_590);
  FUN_0030f7cc(auStack_5b8,"EaseInOutBack");
  FUN_003e9544(param_1,0x21,auStack_5b8);
  FUN_0030f7e0(auStack_5b8);
  FUN_0030f7cc(auStack_5e0,"EaseInOutQuad");
  FUN_003e9544(param_1,0x22,auStack_5e0);
  FUN_0030f7e0(auStack_5e0);
  FUN_0030f7cc(auStack_608,"EaseInOutQuart");
  FUN_003e9544(param_1,0x23,auStack_608);
  FUN_0030f7e0(auStack_608);
  FUN_0030f7cc(auStack_630,"EaseInOutExpo");
  FUN_003e9544(param_1,0x24,auStack_630);
  FUN_0030f7e0(auStack_630);
  FUN_0030f7cc(auStack_658,"EaseInOutElastic");
  FUN_003e9544(param_1,0x25,auStack_658);
  FUN_0030f7e0(auStack_658);
  FUN_0030f7cc(auStack_680,"EaseInOutBounce");
  FUN_003e9544(param_1,0x26,auStack_680);
  FUN_0030f7e0(auStack_680);
  if (*(int *)puVar2 != iStack_18) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail(*(int *)puVar2);
  }
  return;
}


```

## FUN_003e8110 — 003e8ef0

- 函数名: FUN_003e8ef0
- 函数体: 1619 字节
- 调用者数: 1 / 被调用者数: 7

```c

void FUN_003e8ef0(int param_1)

{
  undefined4 *puVar1;
  undefined *puVar2;
  int iVar3;
  int iVar4;
  undefined4 uVar5;
  undefined4 *puVar6;
  undefined4 extraout_s1;
  undefined8 uVar7;
  undefined1 auStack_680 [40];
  undefined1 auStack_658 [40];
  undefined1 auStack_630 [40];
  undefined1 auStack_608 [40];
  undefined1 auStack_5e0 [40];
  undefined1 auStack_5b8 [40];
  undefined1 auStack_590 [40];
  undefined1 auStack_568 [40];
  undefined1 auStack_540 [40];
  undefined1 auStack_518 [40];
  undefined1 auStack_4f0 [40];
  undefined1 auStack_4c8 [40];
  undefined1 auStack_4a0 [40];
  undefined1 auStack_478 [40];
  undefined1 auStack_450 [40];
  undefined1 auStack_428 [40];
  undefined1 auStack_400 [40];
  undefined1 auStack_3d8 [40];
  undefined1 auStack_3b0 [40];
  undefined1 auStack_388 [40];
  undefined1 auStack_360 [40];
  undefined1 auStack_338 [40];
  undefined1 auStack_310 [40];
  undefined1 auStack_2e8 [40];
  undefined1 auStack_2c0 [40];
  undefined1 auStack_298 [40];
  undefined1 auStack_270 [40];
  undefined1 auStack_248 [40];
  undefined1 auStack_220 [40];
  undefined1 auStack_1f8 [40];
  undefined1 auStack_1d0 [40];
  undefined1 auStack_1a8 [40];
  undefined1 auStack_180 [40];
  undefined1 auStack_158 [40];
  undefined1 auStack_130 [40];
  undefined1 auStack_108 [40];
  undefined1 auStack_e0 [40];
  undefined1 auStack_b8 [40];
  undefined1 auStack_90 [40];
  undefined1 auStack_68 [40];
  undefined1 auStack_40 [40];
  int iStack_18;
  
  puVar2 = PTR____stack_chk_guard_004d9044;
  iStack_18 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_0030f7cc(auStack_40,"Invalid");
  *(undefined4 *)(param_1 + 8) = 0;
  puVar6 = (undefined4 *)&UNK_0048cd04;
  *(undefined4 *)(param_1 + 0xc) = 0;
  *(undefined4 *)(param_1 + 0x10) = 0;
  *(undefined4 *)(param_1 + 0x14) = 0;
  puVar1 = (undefined4 *)(param_1 + 4);
  *puVar1 = 0;
  *(undefined4 **)(param_1 + 0xc) = puVar1;
  *(undefined4 **)(param_1 + 0x10) = puVar1;
  *(undefined4 *)(param_1 + 0x24) = 0;
  *(undefined4 *)(param_1 + 0x28) = 0;
  *(undefined4 *)(param_1 + 0x2c) = 0x3f800000;
  *(undefined4 *)(param_1 + 0x30) = 0x40000000;
  *(undefined4 *)(param_1 + 0x34) = 0;
  iVar4 = 0x100;
  while (iVar3 = iVar4, 0 < iVar3) {
    iVar4 = iVar3 >> 1;
    if ((uint)puVar6[iVar4] < 10) {
      puVar6 = puVar6 + iVar4 + 1;
      iVar4 = (iVar3 + -1) - iVar4;
    }
  }
  uVar7 = FixedToFP(CONCAT44(extraout_s1,*puVar6),0,1,0,0x20);
  uVar5 = _ceilf((int)uVar7);
  uVar7 = FPToFixed(CONCAT44(uVar5,uVar5),0,1,3,0x20);
  *(int *)(param_1 + 0x34) = (int)uVar7;
  *(undefined4 *)(param_1 + 0x24) = *puVar6;
  uVar5 = FUN_003e988c((int)uVar7,param_1 + 0x18);
  *(undefined4 *)(param_1 + 0x20) = uVar5;
  FUN_0030f870(param_1 + 0x38,auStack_40);
  *(undefined4 *)(param_1 + 0x60) = 0xffffffff;
  FUN_0030f7e0(auStack_40);
  FUN_0030f7cc(auStack_68,"Invalid");
  FUN_003e9544(param_1,0xffffffff,auStack_68);
  FUN_0030f7e0(auStack_68);
  FUN_0030f7cc(auStack_90,"Linear");
  FUN_003e9544(param_1,0,auStack_90);
  FUN_0030f7e0(auStack_90);
  FUN_0030f7cc(auStack_b8,&DAT_00470ab1);
  FUN_003e9544(param_1,1,auStack_b8);
  FUN_0030f7e0(auStack_b8);
  FUN_0030f7cc(auStack_e0,"SCurve");
  FUN_003e9544(param_1,2,auStack_e0);
  FUN_0030f7e0(auStack_e0);
  FUN_0030f7cc(auStack_108,&DAT_00470abc);
  FUN_003e9544(param_1,3,auStack_108);
  FUN_0030f7e0(auStack_108);
  FUN_0030f7cc(auStack_130,"EaseOutEaseIn");
  FUN_003e9544(param_1,4,auStack_130);
  FUN_0030f7e0(auStack_130);
  FUN_0030f7cc(auStack_158,"EaseOutHardIn");
  FUN_003e9544(param_1,5,auStack_158);
  FUN_0030f7e0(auStack_158);
  FUN_0030f7cc(auStack_180,"EaseOutLinearIn");
  FUN_003e9544(param_1,6,auStack_180);
  FUN_0030f7e0(auStack_180);
  FUN_0030f7cc(auStack_1a8,"HardOutEaseIn");
  FUN_003e9544(param_1,7,auStack_1a8);
  FUN_0030f7e0(auStack_1a8);
  FUN_0030f7cc(auStack_1d0,"LinearOutEaseIn");
  FUN_003e9544(param_1,8,auStack_1d0);
  FUN_0030f7e0(auStack_1d0);
  FUN_0030f7cc(auStack_1f8,"EaseInSine");
  FUN_003e9544(param_1,9,auStack_1f8);
  FUN_0030f7e0(auStack_1f8);
  FUN_0030f7cc(auStack_220,"EaseInCubic");
  FUN_003e9544(param_1,10,auStack_220);
  FUN_0030f7e0(auStack_220);
  FUN_0030f7cc(auStack_248,"EaseInQuint");
  FUN_003e9544(param_1,0xb,auStack_248);
  FUN_0030f7e0(auStack_248);
  FUN_0030f7cc(auStack_270,"EaseInCirc");
  FUN_003e9544(param_1,0xc,auStack_270);
  FUN_0030f7e0(auStack_270);
  FUN_0030f7cc(auStack_298,"EaseInBack");
  FUN_003e9544(param_1,0xd,auStack_298);
  FUN_0030f7e0(auStack_298);
  FUN_0030f7cc(auStack_2c0,"EaseInQuad");
  FUN_003e9544(param_1,0xe,auStack_2c0);
  FUN_0030f7e0(auStack_2c0);
  FUN_0030f7cc(auStack_2e8,"EaseInQuart");
  FUN_003e9544(param_1,0xf,auStack_2e8);
  FUN_0030f7e0(auStack_2e8);
  FUN_0030f7cc(auStack_310,"EaseInExpo");
  FUN_003e9544(param_1,0x10,auStack_310);
  FUN_0030f7e0(auStack_310);
  FUN_0030f7cc(auStack_338,"EaseInElastic");
  FUN_003e9544(param_1,0x11,auStack_338);
  FUN_0030f7e0(auStack_338);
  FUN_0030f7cc(auStack_360,"EaseInBounce");
  FUN_003e9544(param_1,0x12,auStack_360);
  FUN_0030f7e0(auStack_360);
  FUN_0030f7cc(auStack_388,"EaseOutSine");
  FUN_003e9544(param_1,0x13,auStack_388);
  FUN_0030f7e0(auStack_388);
  FUN_0030f7cc(auStack_3b0,"EaseOutCubic");
  FUN_003e9544(param_1,0x14,auStack_3b0);
  FUN_0030f7e0(auStack_3b0);
  FUN_0030f7cc(auStack_3d8,"EaseOutQuint");
  FUN_003e9544(param_1,0x15,auStack_3d8);
  FUN_0030f7e0(auStack_3d8);
  FUN_0030f7cc(auStack_400,"EaseOutCirc");
  FUN_003e9544(param_1,0x16,auStack_400);
  FUN_0030f7e0(auStack_400);
  FUN_0030f7cc(auStack_428,"EaseOutBack");
  FUN_003e9544(param_1,0x17,auStack_428);
  FUN_0030f7e0(auStack_428);
  FUN_0030f7cc(auStack_450,"EaseOutQuad");
  FUN_003e9544(param_1,0x18,auStack_450);
  FUN_0030f7e0(auStack_450);
  FUN_0030f7cc(auStack_478,"EaseOutQuart");
  FUN_003e9544(param_1,0x19,auStack_478);
  FUN_0030f7e0(auStack_478);
  FUN_0030f7cc(auStack_4a0,"EaseOutExpo");
  FUN_003e9544(param_1,0x1a,auStack_4a0);
  FUN_0030f7e0(auStack_4a0);
  FUN_0030f7cc(auStack_4c8,"EaseOutElastic");
  FUN_003e9544(param_1,0x1b,auStack_4c8);
  FUN_0030f7e0(auStack_4c8);
  FUN_0030f7cc(auStack_4f0,"EaseOutBounce");
  FUN_003e9544(param_1,0x1c,auStack_4f0);
  FUN_0030f7e0(auStack_4f0);
  FUN_0030f7cc(auStack_518,"EaseInOutSine");
  FUN_003e9544(param_1,0x1d,auStack_518);
  FUN_0030f7e0(auStack_518);
  FUN_0030f7cc(auStack_540,"EaseInOutCubic");
  FUN_003e9544(param_1,0x1e,auStack_540);
  FUN_0030f7e0(auStack_540);
  FUN_0030f7cc(auStack_568,"EaseInOutQuint");
  FUN_003e9544(param_1,0x1f,auStack_568);
  FUN_0030f7e0(auStack_568);
  FUN_0030f7cc(auStack_590,"EaseInOutCirc");
  FUN_003e9544(param_1,0x20,auStack_590);
  FUN_0030f7e0(auStack_590);
  FUN_0030f7cc(auStack_5b8,"EaseInOutBack");
  FUN_003e9544(param_1,0x21,auStack_5b8);
  FUN_0030f7e0(auStack_5b8);
  FUN_0030f7cc(auStack_5e0,"EaseInOutQuad");
  FUN_003e9544(param_1,0x22,auStack_5e0);
  FUN_0030f7e0(auStack_5e0);
  FUN_0030f7cc(auStack_608,"EaseInOutQuart");
  FUN_003e9544(param_1,0x23,auStack_608);
  FUN_0030f7e0(auStack_608);
  FUN_0030f7cc(auStack_630,"EaseInOutExpo");
  FUN_003e9544(param_1,0x24,auStack_630);
  FUN_0030f7e0(auStack_630);
  FUN_0030f7cc(auStack_658,"EaseInOutElastic");
  FUN_003e9544(param_1,0x25,auStack_658);
  FUN_0030f7e0(auStack_658);
  FUN_0030f7cc(auStack_680,"EaseInOutBounce");
  FUN_003e9544(param_1,0x26,auStack_680);
  FUN_0030f7e0(auStack_680);
  if (*(int *)puVar2 != iStack_18) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail(*(int *)puVar2);
  }
  return;
}


```

## FUN_003e8150 — 003e8ef0

- 函数名: FUN_003e8ef0
- 函数体: 1619 字节
- 调用者数: 1 / 被调用者数: 7

```c

void FUN_003e8ef0(int param_1)

{
  undefined4 *puVar1;
  undefined *puVar2;
  int iVar3;
  int iVar4;
  undefined4 uVar5;
  undefined4 *puVar6;
  undefined4 extraout_s1;
  undefined8 uVar7;
  undefined1 auStack_680 [40];
  undefined1 auStack_658 [40];
  undefined1 auStack_630 [40];
  undefined1 auStack_608 [40];
  undefined1 auStack_5e0 [40];
  undefined1 auStack_5b8 [40];
  undefined1 auStack_590 [40];
  undefined1 auStack_568 [40];
  undefined1 auStack_540 [40];
  undefined1 auStack_518 [40];
  undefined1 auStack_4f0 [40];
  undefined1 auStack_4c8 [40];
  undefined1 auStack_4a0 [40];
  undefined1 auStack_478 [40];
  undefined1 auStack_450 [40];
  undefined1 auStack_428 [40];
  undefined1 auStack_400 [40];
  undefined1 auStack_3d8 [40];
  undefined1 auStack_3b0 [40];
  undefined1 auStack_388 [40];
  undefined1 auStack_360 [40];
  undefined1 auStack_338 [40];
  undefined1 auStack_310 [40];
  undefined1 auStack_2e8 [40];
  undefined1 auStack_2c0 [40];
  undefined1 auStack_298 [40];
  undefined1 auStack_270 [40];
  undefined1 auStack_248 [40];
  undefined1 auStack_220 [40];
  undefined1 auStack_1f8 [40];
  undefined1 auStack_1d0 [40];
  undefined1 auStack_1a8 [40];
  undefined1 auStack_180 [40];
  undefined1 auStack_158 [40];
  undefined1 auStack_130 [40];
  undefined1 auStack_108 [40];
  undefined1 auStack_e0 [40];
  undefined1 auStack_b8 [40];
  undefined1 auStack_90 [40];
  undefined1 auStack_68 [40];
  undefined1 auStack_40 [40];
  int iStack_18;
  
  puVar2 = PTR____stack_chk_guard_004d9044;
  iStack_18 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_0030f7cc(auStack_40,"Invalid");
  *(undefined4 *)(param_1 + 8) = 0;
  puVar6 = (undefined4 *)&UNK_0048cd04;
  *(undefined4 *)(param_1 + 0xc) = 0;
  *(undefined4 *)(param_1 + 0x10) = 0;
  *(undefined4 *)(param_1 + 0x14) = 0;
  puVar1 = (undefined4 *)(param_1 + 4);
  *puVar1 = 0;
  *(undefined4 **)(param_1 + 0xc) = puVar1;
  *(undefined4 **)(param_1 + 0x10) = puVar1;
  *(undefined4 *)(param_1 + 0x24) = 0;
  *(undefined4 *)(param_1 + 0x28) = 0;
  *(undefined4 *)(param_1 + 0x2c) = 0x3f800000;
  *(undefined4 *)(param_1 + 0x30) = 0x40000000;
  *(undefined4 *)(param_1 + 0x34) = 0;
  iVar4 = 0x100;
  while (iVar3 = iVar4, 0 < iVar3) {
    iVar4 = iVar3 >> 1;
    if ((uint)puVar6[iVar4] < 10) {
      puVar6 = puVar6 + iVar4 + 1;
      iVar4 = (iVar3 + -1) - iVar4;
    }
  }
  uVar7 = FixedToFP(CONCAT44(extraout_s1,*puVar6),0,1,0,0x20);
  uVar5 = _ceilf((int)uVar7);
  uVar7 = FPToFixed(CONCAT44(uVar5,uVar5),0,1,3,0x20);
  *(int *)(param_1 + 0x34) = (int)uVar7;
  *(undefined4 *)(param_1 + 0x24) = *puVar6;
  uVar5 = FUN_003e988c((int)uVar7,param_1 + 0x18);
  *(undefined4 *)(param_1 + 0x20) = uVar5;
  FUN_0030f870(param_1 + 0x38,auStack_40);
  *(undefined4 *)(param_1 + 0x60) = 0xffffffff;
  FUN_0030f7e0(auStack_40);
  FUN_0030f7cc(auStack_68,"Invalid");
  FUN_003e9544(param_1,0xffffffff,auStack_68);
  FUN_0030f7e0(auStack_68);
  FUN_0030f7cc(auStack_90,"Linear");
  FUN_003e9544(param_1,0,auStack_90);
  FUN_0030f7e0(auStack_90);
  FUN_0030f7cc(auStack_b8,&DAT_00470ab1);
  FUN_003e9544(param_1,1,auStack_b8);
  FUN_0030f7e0(auStack_b8);
  FUN_0030f7cc(auStack_e0,"SCurve");
  FUN_003e9544(param_1,2,auStack_e0);
  FUN_0030f7e0(auStack_e0);
  FUN_0030f7cc(auStack_108,&DAT_00470abc);
  FUN_003e9544(param_1,3,auStack_108);
  FUN_0030f7e0(auStack_108);
  FUN_0030f7cc(auStack_130,"EaseOutEaseIn");
  FUN_003e9544(param_1,4,auStack_130);
  FUN_0030f7e0(auStack_130);
  FUN_0030f7cc(auStack_158,"EaseOutHardIn");
  FUN_003e9544(param_1,5,auStack_158);
  FUN_0030f7e0(auStack_158);
  FUN_0030f7cc(auStack_180,"EaseOutLinearIn");
  FUN_003e9544(param_1,6,auStack_180);
  FUN_0030f7e0(auStack_180);
  FUN_0030f7cc(auStack_1a8,"HardOutEaseIn");
  FUN_003e9544(param_1,7,auStack_1a8);
  FUN_0030f7e0(auStack_1a8);
  FUN_0030f7cc(auStack_1d0,"LinearOutEaseIn");
  FUN_003e9544(param_1,8,auStack_1d0);
  FUN_0030f7e0(auStack_1d0);
  FUN_0030f7cc(auStack_1f8,"EaseInSine");
  FUN_003e9544(param_1,9,auStack_1f8);
  FUN_0030f7e0(auStack_1f8);
  FUN_0030f7cc(auStack_220,"EaseInCubic");
  FUN_003e9544(param_1,10,auStack_220);
  FUN_0030f7e0(auStack_220);
  FUN_0030f7cc(auStack_248,"EaseInQuint");
  FUN_003e9544(param_1,0xb,auStack_248);
  FUN_0030f7e0(auStack_248);
  FUN_0030f7cc(auStack_270,"EaseInCirc");
  FUN_003e9544(param_1,0xc,auStack_270);
  FUN_0030f7e0(auStack_270);
  FUN_0030f7cc(auStack_298,"EaseInBack");
  FUN_003e9544(param_1,0xd,auStack_298);
  FUN_0030f7e0(auStack_298);
  FUN_0030f7cc(auStack_2c0,"EaseInQuad");
  FUN_003e9544(param_1,0xe,auStack_2c0);
  FUN_0030f7e0(auStack_2c0);
  FUN_0030f7cc(auStack_2e8,"EaseInQuart");
  FUN_003e9544(param_1,0xf,auStack_2e8);
  FUN_0030f7e0(auStack_2e8);
  FUN_0030f7cc(auStack_310,"EaseInExpo");
  FUN_003e9544(param_1,0x10,auStack_310);
  FUN_0030f7e0(auStack_310);
  FUN_0030f7cc(auStack_338,"EaseInElastic");
  FUN_003e9544(param_1,0x11,auStack_338);
  FUN_0030f7e0(auStack_338);
  FUN_0030f7cc(auStack_360,"EaseInBounce");
  FUN_003e9544(param_1,0x12,auStack_360);
  FUN_0030f7e0(auStack_360);
  FUN_0030f7cc(auStack_388,"EaseOutSine");
  FUN_003e9544(param_1,0x13,auStack_388);
  FUN_0030f7e0(auStack_388);
  FUN_0030f7cc(auStack_3b0,"EaseOutCubic");
  FUN_003e9544(param_1,0x14,auStack_3b0);
  FUN_0030f7e0(auStack_3b0);
  FUN_0030f7cc(auStack_3d8,"EaseOutQuint");
  FUN_003e9544(param_1,0x15,auStack_3d8);
  FUN_0030f7e0(auStack_3d8);
  FUN_0030f7cc(auStack_400,"EaseOutCirc");
  FUN_003e9544(param_1,0x16,auStack_400);
  FUN_0030f7e0(auStack_400);
  FUN_0030f7cc(auStack_428,"EaseOutBack");
  FUN_003e9544(param_1,0x17,auStack_428);
  FUN_0030f7e0(auStack_428);
  FUN_0030f7cc(auStack_450,"EaseOutQuad");
  FUN_003e9544(param_1,0x18,auStack_450);
  FUN_0030f7e0(auStack_450);
  FUN_0030f7cc(auStack_478,"EaseOutQuart");
  FUN_003e9544(param_1,0x19,auStack_478);
  FUN_0030f7e0(auStack_478);
  FUN_0030f7cc(auStack_4a0,"EaseOutExpo");
  FUN_003e9544(param_1,0x1a,auStack_4a0);
  FUN_0030f7e0(auStack_4a0);
  FUN_0030f7cc(auStack_4c8,"EaseOutElastic");
  FUN_003e9544(param_1,0x1b,auStack_4c8);
  FUN_0030f7e0(auStack_4c8);
  FUN_0030f7cc(auStack_4f0,"EaseOutBounce");
  FUN_003e9544(param_1,0x1c,auStack_4f0);
  FUN_0030f7e0(auStack_4f0);
  FUN_0030f7cc(auStack_518,"EaseInOutSine");
  FUN_003e9544(param_1,0x1d,auStack_518);
  FUN_0030f7e0(auStack_518);
  FUN_0030f7cc(auStack_540,"EaseInOutCubic");
  FUN_003e9544(param_1,0x1e,auStack_540);
  FUN_0030f7e0(auStack_540);
  FUN_0030f7cc(auStack_568,"EaseInOutQuint");
  FUN_003e9544(param_1,0x1f,auStack_568);
  FUN_0030f7e0(auStack_568);
  FUN_0030f7cc(auStack_590,"EaseInOutCirc");
  FUN_003e9544(param_1,0x20,auStack_590);
  FUN_0030f7e0(auStack_590);
  FUN_0030f7cc(auStack_5b8,"EaseInOutBack");
  FUN_003e9544(param_1,0x21,auStack_5b8);
  FUN_0030f7e0(auStack_5b8);
  FUN_0030f7cc(auStack_5e0,"EaseInOutQuad");
  FUN_003e9544(param_1,0x22,auStack_5e0);
  FUN_0030f7e0(auStack_5e0);
  FUN_0030f7cc(auStack_608,"EaseInOutQuart");
  FUN_003e9544(param_1,0x23,auStack_608);
  FUN_0030f7e0(auStack_608);
  FUN_0030f7cc(auStack_630,"EaseInOutExpo");
  FUN_003e9544(param_1,0x24,auStack_630);
  FUN_0030f7e0(auStack_630);
  FUN_0030f7cc(auStack_658,"EaseInOutElastic");
  FUN_003e9544(param_1,0x25,auStack_658);
  FUN_0030f7e0(auStack_658);
  FUN_0030f7cc(auStack_680,"EaseInOutBounce");
  FUN_003e9544(param_1,0x26,auStack_680);
  FUN_0030f7e0(auStack_680);
  if (*(int *)puVar2 != iStack_18) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail(*(int *)puVar2);
  }
  return;
}


```

## FUN_003e8184 — 003e8ef0

- 函数名: FUN_003e8ef0
- 函数体: 1619 字节
- 调用者数: 1 / 被调用者数: 7

```c

void FUN_003e8ef0(int param_1)

{
  undefined4 *puVar1;
  undefined *puVar2;
  int iVar3;
  int iVar4;
  undefined4 uVar5;
  undefined4 *puVar6;
  undefined4 extraout_s1;
  undefined8 uVar7;
  undefined1 auStack_680 [40];
  undefined1 auStack_658 [40];
  undefined1 auStack_630 [40];
  undefined1 auStack_608 [40];
  undefined1 auStack_5e0 [40];
  undefined1 auStack_5b8 [40];
  undefined1 auStack_590 [40];
  undefined1 auStack_568 [40];
  undefined1 auStack_540 [40];
  undefined1 auStack_518 [40];
  undefined1 auStack_4f0 [40];
  undefined1 auStack_4c8 [40];
  undefined1 auStack_4a0 [40];
  undefined1 auStack_478 [40];
  undefined1 auStack_450 [40];
  undefined1 auStack_428 [40];
  undefined1 auStack_400 [40];
  undefined1 auStack_3d8 [40];
  undefined1 auStack_3b0 [40];
  undefined1 auStack_388 [40];
  undefined1 auStack_360 [40];
  undefined1 auStack_338 [40];
  undefined1 auStack_310 [40];
  undefined1 auStack_2e8 [40];
  undefined1 auStack_2c0 [40];
  undefined1 auStack_298 [40];
  undefined1 auStack_270 [40];
  undefined1 auStack_248 [40];
  undefined1 auStack_220 [40];
  undefined1 auStack_1f8 [40];
  undefined1 auStack_1d0 [40];
  undefined1 auStack_1a8 [40];
  undefined1 auStack_180 [40];
  undefined1 auStack_158 [40];
  undefined1 auStack_130 [40];
  undefined1 auStack_108 [40];
  undefined1 auStack_e0 [40];
  undefined1 auStack_b8 [40];
  undefined1 auStack_90 [40];
  undefined1 auStack_68 [40];
  undefined1 auStack_40 [40];
  int iStack_18;
  
  puVar2 = PTR____stack_chk_guard_004d9044;
  iStack_18 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_0030f7cc(auStack_40,"Invalid");
  *(undefined4 *)(param_1 + 8) = 0;
  puVar6 = (undefined4 *)&UNK_0048cd04;
  *(undefined4 *)(param_1 + 0xc) = 0;
  *(undefined4 *)(param_1 + 0x10) = 0;
  *(undefined4 *)(param_1 + 0x14) = 0;
  puVar1 = (undefined4 *)(param_1 + 4);
  *puVar1 = 0;
  *(undefined4 **)(param_1 + 0xc) = puVar1;
  *(undefined4 **)(param_1 + 0x10) = puVar1;
  *(undefined4 *)(param_1 + 0x24) = 0;
  *(undefined4 *)(param_1 + 0x28) = 0;
  *(undefined4 *)(param_1 + 0x2c) = 0x3f800000;
  *(undefined4 *)(param_1 + 0x30) = 0x40000000;
  *(undefined4 *)(param_1 + 0x34) = 0;
  iVar4 = 0x100;
  while (iVar3 = iVar4, 0 < iVar3) {
    iVar4 = iVar3 >> 1;
    if ((uint)puVar6[iVar4] < 10) {
      puVar6 = puVar6 + iVar4 + 1;
      iVar4 = (iVar3 + -1) - iVar4;
    }
  }
  uVar7 = FixedToFP(CONCAT44(extraout_s1,*puVar6),0,1,0,0x20);
  uVar5 = _ceilf((int)uVar7);
  uVar7 = FPToFixed(CONCAT44(uVar5,uVar5),0,1,3,0x20);
  *(int *)(param_1 + 0x34) = (int)uVar7;
  *(undefined4 *)(param_1 + 0x24) = *puVar6;
  uVar5 = FUN_003e988c((int)uVar7,param_1 + 0x18);
  *(undefined4 *)(param_1 + 0x20) = uVar5;
  FUN_0030f870(param_1 + 0x38,auStack_40);
  *(undefined4 *)(param_1 + 0x60) = 0xffffffff;
  FUN_0030f7e0(auStack_40);
  FUN_0030f7cc(auStack_68,"Invalid");
  FUN_003e9544(param_1,0xffffffff,auStack_68);
  FUN_0030f7e0(auStack_68);
  FUN_0030f7cc(auStack_90,"Linear");
  FUN_003e9544(param_1,0,auStack_90);
  FUN_0030f7e0(auStack_90);
  FUN_0030f7cc(auStack_b8,&DAT_00470ab1);
  FUN_003e9544(param_1,1,auStack_b8);
  FUN_0030f7e0(auStack_b8);
  FUN_0030f7cc(auStack_e0,"SCurve");
  FUN_003e9544(param_1,2,auStack_e0);
  FUN_0030f7e0(auStack_e0);
  FUN_0030f7cc(auStack_108,&DAT_00470abc);
  FUN_003e9544(param_1,3,auStack_108);
  FUN_0030f7e0(auStack_108);
  FUN_0030f7cc(auStack_130,"EaseOutEaseIn");
  FUN_003e9544(param_1,4,auStack_130);
  FUN_0030f7e0(auStack_130);
  FUN_0030f7cc(auStack_158,"EaseOutHardIn");
  FUN_003e9544(param_1,5,auStack_158);
  FUN_0030f7e0(auStack_158);
  FUN_0030f7cc(auStack_180,"EaseOutLinearIn");
  FUN_003e9544(param_1,6,auStack_180);
  FUN_0030f7e0(auStack_180);
  FUN_0030f7cc(auStack_1a8,"HardOutEaseIn");
  FUN_003e9544(param_1,7,auStack_1a8);
  FUN_0030f7e0(auStack_1a8);
  FUN_0030f7cc(auStack_1d0,"LinearOutEaseIn");
  FUN_003e9544(param_1,8,auStack_1d0);
  FUN_0030f7e0(auStack_1d0);
  FUN_0030f7cc(auStack_1f8,"EaseInSine");
  FUN_003e9544(param_1,9,auStack_1f8);
  FUN_0030f7e0(auStack_1f8);
  FUN_0030f7cc(auStack_220,"EaseInCubic");
  FUN_003e9544(param_1,10,auStack_220);
  FUN_0030f7e0(auStack_220);
  FUN_0030f7cc(auStack_248,"EaseInQuint");
  FUN_003e9544(param_1,0xb,auStack_248);
  FUN_0030f7e0(auStack_248);
  FUN_0030f7cc(auStack_270,"EaseInCirc");
  FUN_003e9544(param_1,0xc,auStack_270);
  FUN_0030f7e0(auStack_270);
  FUN_0030f7cc(auStack_298,"EaseInBack");
  FUN_003e9544(param_1,0xd,auStack_298);
  FUN_0030f7e0(auStack_298);
  FUN_0030f7cc(auStack_2c0,"EaseInQuad");
  FUN_003e9544(param_1,0xe,auStack_2c0);
  FUN_0030f7e0(auStack_2c0);
  FUN_0030f7cc(auStack_2e8,"EaseInQuart");
  FUN_003e9544(param_1,0xf,auStack_2e8);
  FUN_0030f7e0(auStack_2e8);
  FUN_0030f7cc(auStack_310,"EaseInExpo");
  FUN_003e9544(param_1,0x10,auStack_310);
  FUN_0030f7e0(auStack_310);
  FUN_0030f7cc(auStack_338,"EaseInElastic");
  FUN_003e9544(param_1,0x11,auStack_338);
  FUN_0030f7e0(auStack_338);
  FUN_0030f7cc(auStack_360,"EaseInBounce");
  FUN_003e9544(param_1,0x12,auStack_360);
  FUN_0030f7e0(auStack_360);
  FUN_0030f7cc(auStack_388,"EaseOutSine");
  FUN_003e9544(param_1,0x13,auStack_388);
  FUN_0030f7e0(auStack_388);
  FUN_0030f7cc(auStack_3b0,"EaseOutCubic");
  FUN_003e9544(param_1,0x14,auStack_3b0);
  FUN_0030f7e0(auStack_3b0);
  FUN_0030f7cc(auStack_3d8,"EaseOutQuint");
  FUN_003e9544(param_1,0x15,auStack_3d8);
  FUN_0030f7e0(auStack_3d8);
  FUN_0030f7cc(auStack_400,"EaseOutCirc");
  FUN_003e9544(param_1,0x16,auStack_400);
  FUN_0030f7e0(auStack_400);
  FUN_0030f7cc(auStack_428,"EaseOutBack");
  FUN_003e9544(param_1,0x17,auStack_428);
  FUN_0030f7e0(auStack_428);
  FUN_0030f7cc(auStack_450,"EaseOutQuad");
  FUN_003e9544(param_1,0x18,auStack_450);
  FUN_0030f7e0(auStack_450);
  FUN_0030f7cc(auStack_478,"EaseOutQuart");
  FUN_003e9544(param_1,0x19,auStack_478);
  FUN_0030f7e0(auStack_478);
  FUN_0030f7cc(auStack_4a0,"EaseOutExpo");
  FUN_003e9544(param_1,0x1a,auStack_4a0);
  FUN_0030f7e0(auStack_4a0);
  FUN_0030f7cc(auStack_4c8,"EaseOutElastic");
  FUN_003e9544(param_1,0x1b,auStack_4c8);
  FUN_0030f7e0(auStack_4c8);
  FUN_0030f7cc(auStack_4f0,"EaseOutBounce");
  FUN_003e9544(param_1,0x1c,auStack_4f0);
  FUN_0030f7e0(auStack_4f0);
  FUN_0030f7cc(auStack_518,"EaseInOutSine");
  FUN_003e9544(param_1,0x1d,auStack_518);
  FUN_0030f7e0(auStack_518);
  FUN_0030f7cc(auStack_540,"EaseInOutCubic");
  FUN_003e9544(param_1,0x1e,auStack_540);
  FUN_0030f7e0(auStack_540);
  FUN_0030f7cc(auStack_568,"EaseInOutQuint");
  FUN_003e9544(param_1,0x1f,auStack_568);
  FUN_0030f7e0(auStack_568);
  FUN_0030f7cc(auStack_590,"EaseInOutCirc");
  FUN_003e9544(param_1,0x20,auStack_590);
  FUN_0030f7e0(auStack_590);
  FUN_0030f7cc(auStack_5b8,"EaseInOutBack");
  FUN_003e9544(param_1,0x21,auStack_5b8);
  FUN_0030f7e0(auStack_5b8);
  FUN_0030f7cc(auStack_5e0,"EaseInOutQuad");
  FUN_003e9544(param_1,0x22,auStack_5e0);
  FUN_0030f7e0(auStack_5e0);
  FUN_0030f7cc(auStack_608,"EaseInOutQuart");
  FUN_003e9544(param_1,0x23,auStack_608);
  FUN_0030f7e0(auStack_608);
  FUN_0030f7cc(auStack_630,"EaseInOutExpo");
  FUN_003e9544(param_1,0x24,auStack_630);
  FUN_0030f7e0(auStack_630);
  FUN_0030f7cc(auStack_658,"EaseInOutElastic");
  FUN_003e9544(param_1,0x25,auStack_658);
  FUN_0030f7e0(auStack_658);
  FUN_0030f7cc(auStack_680,"EaseInOutBounce");
  FUN_003e9544(param_1,0x26,auStack_680);
  FUN_0030f7e0(auStack_680);
  if (*(int *)puVar2 != iStack_18) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail(*(int *)puVar2);
  }
  return;
}


```

## FUN_003e819c — 003e8ef0

- 函数名: FUN_003e8ef0
- 函数体: 1619 字节
- 调用者数: 1 / 被调用者数: 7

```c

void FUN_003e8ef0(int param_1)

{
  undefined4 *puVar1;
  undefined *puVar2;
  int iVar3;
  int iVar4;
  undefined4 uVar5;
  undefined4 *puVar6;
  undefined4 extraout_s1;
  undefined8 uVar7;
  undefined1 auStack_680 [40];
  undefined1 auStack_658 [40];
  undefined1 auStack_630 [40];
  undefined1 auStack_608 [40];
  undefined1 auStack_5e0 [40];
  undefined1 auStack_5b8 [40];
  undefined1 auStack_590 [40];
  undefined1 auStack_568 [40];
  undefined1 auStack_540 [40];
  undefined1 auStack_518 [40];
  undefined1 auStack_4f0 [40];
  undefined1 auStack_4c8 [40];
  undefined1 auStack_4a0 [40];
  undefined1 auStack_478 [40];
  undefined1 auStack_450 [40];
  undefined1 auStack_428 [40];
  undefined1 auStack_400 [40];
  undefined1 auStack_3d8 [40];
  undefined1 auStack_3b0 [40];
  undefined1 auStack_388 [40];
  undefined1 auStack_360 [40];
  undefined1 auStack_338 [40];
  undefined1 auStack_310 [40];
  undefined1 auStack_2e8 [40];
  undefined1 auStack_2c0 [40];
  undefined1 auStack_298 [40];
  undefined1 auStack_270 [40];
  undefined1 auStack_248 [40];
  undefined1 auStack_220 [40];
  undefined1 auStack_1f8 [40];
  undefined1 auStack_1d0 [40];
  undefined1 auStack_1a8 [40];
  undefined1 auStack_180 [40];
  undefined1 auStack_158 [40];
  undefined1 auStack_130 [40];
  undefined1 auStack_108 [40];
  undefined1 auStack_e0 [40];
  undefined1 auStack_b8 [40];
  undefined1 auStack_90 [40];
  undefined1 auStack_68 [40];
  undefined1 auStack_40 [40];
  int iStack_18;
  
  puVar2 = PTR____stack_chk_guard_004d9044;
  iStack_18 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_0030f7cc(auStack_40,"Invalid");
  *(undefined4 *)(param_1 + 8) = 0;
  puVar6 = (undefined4 *)&UNK_0048cd04;
  *(undefined4 *)(param_1 + 0xc) = 0;
  *(undefined4 *)(param_1 + 0x10) = 0;
  *(undefined4 *)(param_1 + 0x14) = 0;
  puVar1 = (undefined4 *)(param_1 + 4);
  *puVar1 = 0;
  *(undefined4 **)(param_1 + 0xc) = puVar1;
  *(undefined4 **)(param_1 + 0x10) = puVar1;
  *(undefined4 *)(param_1 + 0x24) = 0;
  *(undefined4 *)(param_1 + 0x28) = 0;
  *(undefined4 *)(param_1 + 0x2c) = 0x3f800000;
  *(undefined4 *)(param_1 + 0x30) = 0x40000000;
  *(undefined4 *)(param_1 + 0x34) = 0;
  iVar4 = 0x100;
  while (iVar3 = iVar4, 0 < iVar3) {
    iVar4 = iVar3 >> 1;
    if ((uint)puVar6[iVar4] < 10) {
      puVar6 = puVar6 + iVar4 + 1;
      iVar4 = (iVar3 + -1) - iVar4;
    }
  }
  uVar7 = FixedToFP(CONCAT44(extraout_s1,*puVar6),0,1,0,0x20);
  uVar5 = _ceilf((int)uVar7);
  uVar7 = FPToFixed(CONCAT44(uVar5,uVar5),0,1,3,0x20);
  *(int *)(param_1 + 0x34) = (int)uVar7;
  *(undefined4 *)(param_1 + 0x24) = *puVar6;
  uVar5 = FUN_003e988c((int)uVar7,param_1 + 0x18);
  *(undefined4 *)(param_1 + 0x20) = uVar5;
  FUN_0030f870(param_1 + 0x38,auStack_40);
  *(undefined4 *)(param_1 + 0x60) = 0xffffffff;
  FUN_0030f7e0(auStack_40);
  FUN_0030f7cc(auStack_68,"Invalid");
  FUN_003e9544(param_1,0xffffffff,auStack_68);
  FUN_0030f7e0(auStack_68);
  FUN_0030f7cc(auStack_90,"Linear");
  FUN_003e9544(param_1,0,auStack_90);
  FUN_0030f7e0(auStack_90);
  FUN_0030f7cc(auStack_b8,&DAT_00470ab1);
  FUN_003e9544(param_1,1,auStack_b8);
  FUN_0030f7e0(auStack_b8);
  FUN_0030f7cc(auStack_e0,"SCurve");
  FUN_003e9544(param_1,2,auStack_e0);
  FUN_0030f7e0(auStack_e0);
  FUN_0030f7cc(auStack_108,&DAT_00470abc);
  FUN_003e9544(param_1,3,auStack_108);
  FUN_0030f7e0(auStack_108);
  FUN_0030f7cc(auStack_130,"EaseOutEaseIn");
  FUN_003e9544(param_1,4,auStack_130);
  FUN_0030f7e0(auStack_130);
  FUN_0030f7cc(auStack_158,"EaseOutHardIn");
  FUN_003e9544(param_1,5,auStack_158);
  FUN_0030f7e0(auStack_158);
  FUN_0030f7cc(auStack_180,"EaseOutLinearIn");
  FUN_003e9544(param_1,6,auStack_180);
  FUN_0030f7e0(auStack_180);
  FUN_0030f7cc(auStack_1a8,"HardOutEaseIn");
  FUN_003e9544(param_1,7,auStack_1a8);
  FUN_0030f7e0(auStack_1a8);
  FUN_0030f7cc(auStack_1d0,"LinearOutEaseIn");
  FUN_003e9544(param_1,8,auStack_1d0);
  FUN_0030f7e0(auStack_1d0);
  FUN_0030f7cc(auStack_1f8,"EaseInSine");
  FUN_003e9544(param_1,9,auStack_1f8);
  FUN_0030f7e0(auStack_1f8);
  FUN_0030f7cc(auStack_220,"EaseInCubic");
  FUN_003e9544(param_1,10,auStack_220);
  FUN_0030f7e0(auStack_220);
  FUN_0030f7cc(auStack_248,"EaseInQuint");
  FUN_003e9544(param_1,0xb,auStack_248);
  FUN_0030f7e0(auStack_248);
  FUN_0030f7cc(auStack_270,"EaseInCirc");
  FUN_003e9544(param_1,0xc,auStack_270);
  FUN_0030f7e0(auStack_270);
  FUN_0030f7cc(auStack_298,"EaseInBack");
  FUN_003e9544(param_1,0xd,auStack_298);
  FUN_0030f7e0(auStack_298);
  FUN_0030f7cc(auStack_2c0,"EaseInQuad");
  FUN_003e9544(param_1,0xe,auStack_2c0);
  FUN_0030f7e0(auStack_2c0);
  FUN_0030f7cc(auStack_2e8,"EaseInQuart");
  FUN_003e9544(param_1,0xf,auStack_2e8);
  FUN_0030f7e0(auStack_2e8);
  FUN_0030f7cc(auStack_310,"EaseInExpo");
  FUN_003e9544(param_1,0x10,auStack_310);
  FUN_0030f7e0(auStack_310);
  FUN_0030f7cc(auStack_338,"EaseInElastic");
  FUN_003e9544(param_1,0x11,auStack_338);
  FUN_0030f7e0(auStack_338);
  FUN_0030f7cc(auStack_360,"EaseInBounce");
  FUN_003e9544(param_1,0x12,auStack_360);
  FUN_0030f7e0(auStack_360);
  FUN_0030f7cc(auStack_388,"EaseOutSine");
  FUN_003e9544(param_1,0x13,auStack_388);
  FUN_0030f7e0(auStack_388);
  FUN_0030f7cc(auStack_3b0,"EaseOutCubic");
  FUN_003e9544(param_1,0x14,auStack_3b0);
  FUN_0030f7e0(auStack_3b0);
  FUN_0030f7cc(auStack_3d8,"EaseOutQuint");
  FUN_003e9544(param_1,0x15,auStack_3d8);
  FUN_0030f7e0(auStack_3d8);
  FUN_0030f7cc(auStack_400,"EaseOutCirc");
  FUN_003e9544(param_1,0x16,auStack_400);
  FUN_0030f7e0(auStack_400);
  FUN_0030f7cc(auStack_428,"EaseOutBack");
  FUN_003e9544(param_1,0x17,auStack_428);
  FUN_0030f7e0(auStack_428);
  FUN_0030f7cc(auStack_450,"EaseOutQuad");
  FUN_003e9544(param_1,0x18,auStack_450);
  FUN_0030f7e0(auStack_450);
  FUN_0030f7cc(auStack_478,"EaseOutQuart");
  FUN_003e9544(param_1,0x19,auStack_478);
  FUN_0030f7e0(auStack_478);
  FUN_0030f7cc(auStack_4a0,"EaseOutExpo");
  FUN_003e9544(param_1,0x1a,auStack_4a0);
  FUN_0030f7e0(auStack_4a0);
  FUN_0030f7cc(auStack_4c8,"EaseOutElastic");
  FUN_003e9544(param_1,0x1b,auStack_4c8);
  FUN_0030f7e0(auStack_4c8);
  FUN_0030f7cc(auStack_4f0,"EaseOutBounce");
  FUN_003e9544(param_1,0x1c,auStack_4f0);
  FUN_0030f7e0(auStack_4f0);
  FUN_0030f7cc(auStack_518,"EaseInOutSine");
  FUN_003e9544(param_1,0x1d,auStack_518);
  FUN_0030f7e0(auStack_518);
  FUN_0030f7cc(auStack_540,"EaseInOutCubic");
  FUN_003e9544(param_1,0x1e,auStack_540);
  FUN_0030f7e0(auStack_540);
  FUN_0030f7cc(auStack_568,"EaseInOutQuint");
  FUN_003e9544(param_1,0x1f,auStack_568);
  FUN_0030f7e0(auStack_568);
  FUN_0030f7cc(auStack_590,"EaseInOutCirc");
  FUN_003e9544(param_1,0x20,auStack_590);
  FUN_0030f7e0(auStack_590);
  FUN_0030f7cc(auStack_5b8,"EaseInOutBack");
  FUN_003e9544(param_1,0x21,auStack_5b8);
  FUN_0030f7e0(auStack_5b8);
  FUN_0030f7cc(auStack_5e0,"EaseInOutQuad");
  FUN_003e9544(param_1,0x22,auStack_5e0);
  FUN_0030f7e0(auStack_5e0);
  FUN_0030f7cc(auStack_608,"EaseInOutQuart");
  FUN_003e9544(param_1,0x23,auStack_608);
  FUN_0030f7e0(auStack_608);
  FUN_0030f7cc(auStack_630,"EaseInOutExpo");
  FUN_003e9544(param_1,0x24,auStack_630);
  FUN_0030f7e0(auStack_630);
  FUN_0030f7cc(auStack_658,"EaseInOutElastic");
  FUN_003e9544(param_1,0x25,auStack_658);
  FUN_0030f7e0(auStack_658);
  FUN_0030f7cc(auStack_680,"EaseInOutBounce");
  FUN_003e9544(param_1,0x26,auStack_680);
  FUN_0030f7e0(auStack_680);
  if (*(int *)puVar2 != iStack_18) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail(*(int *)puVar2);
  }
  return;
}


```

## FUN_003e81c0 — 003e8ef0

- 函数名: FUN_003e8ef0
- 函数体: 1619 字节
- 调用者数: 1 / 被调用者数: 7

```c

void FUN_003e8ef0(int param_1)

{
  undefined4 *puVar1;
  undefined *puVar2;
  int iVar3;
  int iVar4;
  undefined4 uVar5;
  undefined4 *puVar6;
  undefined4 extraout_s1;
  undefined8 uVar7;
  undefined1 auStack_680 [40];
  undefined1 auStack_658 [40];
  undefined1 auStack_630 [40];
  undefined1 auStack_608 [40];
  undefined1 auStack_5e0 [40];
  undefined1 auStack_5b8 [40];
  undefined1 auStack_590 [40];
  undefined1 auStack_568 [40];
  undefined1 auStack_540 [40];
  undefined1 auStack_518 [40];
  undefined1 auStack_4f0 [40];
  undefined1 auStack_4c8 [40];
  undefined1 auStack_4a0 [40];
  undefined1 auStack_478 [40];
  undefined1 auStack_450 [40];
  undefined1 auStack_428 [40];
  undefined1 auStack_400 [40];
  undefined1 auStack_3d8 [40];
  undefined1 auStack_3b0 [40];
  undefined1 auStack_388 [40];
  undefined1 auStack_360 [40];
  undefined1 auStack_338 [40];
  undefined1 auStack_310 [40];
  undefined1 auStack_2e8 [40];
  undefined1 auStack_2c0 [40];
  undefined1 auStack_298 [40];
  undefined1 auStack_270 [40];
  undefined1 auStack_248 [40];
  undefined1 auStack_220 [40];
  undefined1 auStack_1f8 [40];
  undefined1 auStack_1d0 [40];
  undefined1 auStack_1a8 [40];
  undefined1 auStack_180 [40];
  undefined1 auStack_158 [40];
  undefined1 auStack_130 [40];
  undefined1 auStack_108 [40];
  undefined1 auStack_e0 [40];
  undefined1 auStack_b8 [40];
  undefined1 auStack_90 [40];
  undefined1 auStack_68 [40];
  undefined1 auStack_40 [40];
  int iStack_18;
  
  puVar2 = PTR____stack_chk_guard_004d9044;
  iStack_18 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_0030f7cc(auStack_40,"Invalid");
  *(undefined4 *)(param_1 + 8) = 0;
  puVar6 = (undefined4 *)&UNK_0048cd04;
  *(undefined4 *)(param_1 + 0xc) = 0;
  *(undefined4 *)(param_1 + 0x10) = 0;
  *(undefined4 *)(param_1 + 0x14) = 0;
  puVar1 = (undefined4 *)(param_1 + 4);
  *puVar1 = 0;
  *(undefined4 **)(param_1 + 0xc) = puVar1;
  *(undefined4 **)(param_1 + 0x10) = puVar1;
  *(undefined4 *)(param_1 + 0x24) = 0;
  *(undefined4 *)(param_1 + 0x28) = 0;
  *(undefined4 *)(param_1 + 0x2c) = 0x3f800000;
  *(undefined4 *)(param_1 + 0x30) = 0x40000000;
  *(undefined4 *)(param_1 + 0x34) = 0;
  iVar4 = 0x100;
  while (iVar3 = iVar4, 0 < iVar3) {
    iVar4 = iVar3 >> 1;
    if ((uint)puVar6[iVar4] < 10) {
      puVar6 = puVar6 + iVar4 + 1;
      iVar4 = (iVar3 + -1) - iVar4;
    }
  }
  uVar7 = FixedToFP(CONCAT44(extraout_s1,*puVar6),0,1,0,0x20);
  uVar5 = _ceilf((int)uVar7);
  uVar7 = FPToFixed(CONCAT44(uVar5,uVar5),0,1,3,0x20);
  *(int *)(param_1 + 0x34) = (int)uVar7;
  *(undefined4 *)(param_1 + 0x24) = *puVar6;
  uVar5 = FUN_003e988c((int)uVar7,param_1 + 0x18);
  *(undefined4 *)(param_1 + 0x20) = uVar5;
  FUN_0030f870(param_1 + 0x38,auStack_40);
  *(undefined4 *)(param_1 + 0x60) = 0xffffffff;
  FUN_0030f7e0(auStack_40);
  FUN_0030f7cc(auStack_68,"Invalid");
  FUN_003e9544(param_1,0xffffffff,auStack_68);
  FUN_0030f7e0(auStack_68);
  FUN_0030f7cc(auStack_90,"Linear");
  FUN_003e9544(param_1,0,auStack_90);
  FUN_0030f7e0(auStack_90);
  FUN_0030f7cc(auStack_b8,&DAT_00470ab1);
  FUN_003e9544(param_1,1,auStack_b8);
  FUN_0030f7e0(auStack_b8);
  FUN_0030f7cc(auStack_e0,"SCurve");
  FUN_003e9544(param_1,2,auStack_e0);
  FUN_0030f7e0(auStack_e0);
  FUN_0030f7cc(auStack_108,&DAT_00470abc);
  FUN_003e9544(param_1,3,auStack_108);
  FUN_0030f7e0(auStack_108);
  FUN_0030f7cc(auStack_130,"EaseOutEaseIn");
  FUN_003e9544(param_1,4,auStack_130);
  FUN_0030f7e0(auStack_130);
  FUN_0030f7cc(auStack_158,"EaseOutHardIn");
  FUN_003e9544(param_1,5,auStack_158);
  FUN_0030f7e0(auStack_158);
  FUN_0030f7cc(auStack_180,"EaseOutLinearIn");
  FUN_003e9544(param_1,6,auStack_180);
  FUN_0030f7e0(auStack_180);
  FUN_0030f7cc(auStack_1a8,"HardOutEaseIn");
  FUN_003e9544(param_1,7,auStack_1a8);
  FUN_0030f7e0(auStack_1a8);
  FUN_0030f7cc(auStack_1d0,"LinearOutEaseIn");
  FUN_003e9544(param_1,8,auStack_1d0);
  FUN_0030f7e0(auStack_1d0);
  FUN_0030f7cc(auStack_1f8,"EaseInSine");
  FUN_003e9544(param_1,9,auStack_1f8);
  FUN_0030f7e0(auStack_1f8);
  FUN_0030f7cc(auStack_220,"EaseInCubic");
  FUN_003e9544(param_1,10,auStack_220);
  FUN_0030f7e0(auStack_220);
  FUN_0030f7cc(auStack_248,"EaseInQuint");
  FUN_003e9544(param_1,0xb,auStack_248);
  FUN_0030f7e0(auStack_248);
  FUN_0030f7cc(auStack_270,"EaseInCirc");
  FUN_003e9544(param_1,0xc,auStack_270);
  FUN_0030f7e0(auStack_270);
  FUN_0030f7cc(auStack_298,"EaseInBack");
  FUN_003e9544(param_1,0xd,auStack_298);
  FUN_0030f7e0(auStack_298);
  FUN_0030f7cc(auStack_2c0,"EaseInQuad");
  FUN_003e9544(param_1,0xe,auStack_2c0);
  FUN_0030f7e0(auStack_2c0);
  FUN_0030f7cc(auStack_2e8,"EaseInQuart");
  FUN_003e9544(param_1,0xf,auStack_2e8);
  FUN_0030f7e0(auStack_2e8);
  FUN_0030f7cc(auStack_310,"EaseInExpo");
  FUN_003e9544(param_1,0x10,auStack_310);
  FUN_0030f7e0(auStack_310);
  FUN_0030f7cc(auStack_338,"EaseInElastic");
  FUN_003e9544(param_1,0x11,auStack_338);
  FUN_0030f7e0(auStack_338);
  FUN_0030f7cc(auStack_360,"EaseInBounce");
  FUN_003e9544(param_1,0x12,auStack_360);
  FUN_0030f7e0(auStack_360);
  FUN_0030f7cc(auStack_388,"EaseOutSine");
  FUN_003e9544(param_1,0x13,auStack_388);
  FUN_0030f7e0(auStack_388);
  FUN_0030f7cc(auStack_3b0,"EaseOutCubic");
  FUN_003e9544(param_1,0x14,auStack_3b0);
  FUN_0030f7e0(auStack_3b0);
  FUN_0030f7cc(auStack_3d8,"EaseOutQuint");
  FUN_003e9544(param_1,0x15,auStack_3d8);
  FUN_0030f7e0(auStack_3d8);
  FUN_0030f7cc(auStack_400,"EaseOutCirc");
  FUN_003e9544(param_1,0x16,auStack_400);
  FUN_0030f7e0(auStack_400);
  FUN_0030f7cc(auStack_428,"EaseOutBack");
  FUN_003e9544(param_1,0x17,auStack_428);
  FUN_0030f7e0(auStack_428);
  FUN_0030f7cc(auStack_450,"EaseOutQuad");
  FUN_003e9544(param_1,0x18,auStack_450);
  FUN_0030f7e0(auStack_450);
  FUN_0030f7cc(auStack_478,"EaseOutQuart");
  FUN_003e9544(param_1,0x19,auStack_478);
  FUN_0030f7e0(auStack_478);
  FUN_0030f7cc(auStack_4a0,"EaseOutExpo");
  FUN_003e9544(param_1,0x1a,auStack_4a0);
  FUN_0030f7e0(auStack_4a0);
  FUN_0030f7cc(auStack_4c8,"EaseOutElastic");
  FUN_003e9544(param_1,0x1b,auStack_4c8);
  FUN_0030f7e0(auStack_4c8);
  FUN_0030f7cc(auStack_4f0,"EaseOutBounce");
  FUN_003e9544(param_1,0x1c,auStack_4f0);
  FUN_0030f7e0(auStack_4f0);
  FUN_0030f7cc(auStack_518,"EaseInOutSine");
  FUN_003e9544(param_1,0x1d,auStack_518);
  FUN_0030f7e0(auStack_518);
  FUN_0030f7cc(auStack_540,"EaseInOutCubic");
  FUN_003e9544(param_1,0x1e,auStack_540);
  FUN_0030f7e0(auStack_540);
  FUN_0030f7cc(auStack_568,"EaseInOutQuint");
  FUN_003e9544(param_1,0x1f,auStack_568);
  FUN_0030f7e0(auStack_568);
  FUN_0030f7cc(auStack_590,"EaseInOutCirc");
  FUN_003e9544(param_1,0x20,auStack_590);
  FUN_0030f7e0(auStack_590);
  FUN_0030f7cc(auStack_5b8,"EaseInOutBack");
  FUN_003e9544(param_1,0x21,auStack_5b8);
  FUN_0030f7e0(auStack_5b8);
  FUN_0030f7cc(auStack_5e0,"EaseInOutQuad");
  FUN_003e9544(param_1,0x22,auStack_5e0);
  FUN_0030f7e0(auStack_5e0);
  FUN_0030f7cc(auStack_608,"EaseInOutQuart");
  FUN_003e9544(param_1,0x23,auStack_608);
  FUN_0030f7e0(auStack_608);
  FUN_0030f7cc(auStack_630,"EaseInOutExpo");
  FUN_003e9544(param_1,0x24,auStack_630);
  FUN_0030f7e0(auStack_630);
  FUN_0030f7cc(auStack_658,"EaseInOutElastic");
  FUN_003e9544(param_1,0x25,auStack_658);
  FUN_0030f7e0(auStack_658);
  FUN_0030f7cc(auStack_680,"EaseInOutBounce");
  FUN_003e9544(param_1,0x26,auStack_680);
  FUN_0030f7e0(auStack_680);
  if (*(int *)puVar2 != iStack_18) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail(*(int *)puVar2);
  }
  return;
}


```

## FUN_003e8210 — 003e8ef0

- 函数名: FUN_003e8ef0
- 函数体: 1619 字节
- 调用者数: 1 / 被调用者数: 7

```c

void FUN_003e8ef0(int param_1)

{
  undefined4 *puVar1;
  undefined *puVar2;
  int iVar3;
  int iVar4;
  undefined4 uVar5;
  undefined4 *puVar6;
  undefined4 extraout_s1;
  undefined8 uVar7;
  undefined1 auStack_680 [40];
  undefined1 auStack_658 [40];
  undefined1 auStack_630 [40];
  undefined1 auStack_608 [40];
  undefined1 auStack_5e0 [40];
  undefined1 auStack_5b8 [40];
  undefined1 auStack_590 [40];
  undefined1 auStack_568 [40];
  undefined1 auStack_540 [40];
  undefined1 auStack_518 [40];
  undefined1 auStack_4f0 [40];
  undefined1 auStack_4c8 [40];
  undefined1 auStack_4a0 [40];
  undefined1 auStack_478 [40];
  undefined1 auStack_450 [40];
  undefined1 auStack_428 [40];
  undefined1 auStack_400 [40];
  undefined1 auStack_3d8 [40];
  undefined1 auStack_3b0 [40];
  undefined1 auStack_388 [40];
  undefined1 auStack_360 [40];
  undefined1 auStack_338 [40];
  undefined1 auStack_310 [40];
  undefined1 auStack_2e8 [40];
  undefined1 auStack_2c0 [40];
  undefined1 auStack_298 [40];
  undefined1 auStack_270 [40];
  undefined1 auStack_248 [40];
  undefined1 auStack_220 [40];
  undefined1 auStack_1f8 [40];
  undefined1 auStack_1d0 [40];
  undefined1 auStack_1a8 [40];
  undefined1 auStack_180 [40];
  undefined1 auStack_158 [40];
  undefined1 auStack_130 [40];
  undefined1 auStack_108 [40];
  undefined1 auStack_e0 [40];
  undefined1 auStack_b8 [40];
  undefined1 auStack_90 [40];
  undefined1 auStack_68 [40];
  undefined1 auStack_40 [40];
  int iStack_18;
  
  puVar2 = PTR____stack_chk_guard_004d9044;
  iStack_18 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_0030f7cc(auStack_40,"Invalid");
  *(undefined4 *)(param_1 + 8) = 0;
  puVar6 = (undefined4 *)&UNK_0048cd04;
  *(undefined4 *)(param_1 + 0xc) = 0;
  *(undefined4 *)(param_1 + 0x10) = 0;
  *(undefined4 *)(param_1 + 0x14) = 0;
  puVar1 = (undefined4 *)(param_1 + 4);
  *puVar1 = 0;
  *(undefined4 **)(param_1 + 0xc) = puVar1;
  *(undefined4 **)(param_1 + 0x10) = puVar1;
  *(undefined4 *)(param_1 + 0x24) = 0;
  *(undefined4 *)(param_1 + 0x28) = 0;
  *(undefined4 *)(param_1 + 0x2c) = 0x3f800000;
  *(undefined4 *)(param_1 + 0x30) = 0x40000000;
  *(undefined4 *)(param_1 + 0x34) = 0;
  iVar4 = 0x100;
  while (iVar3 = iVar4, 0 < iVar3) {
    iVar4 = iVar3 >> 1;
    if ((uint)puVar6[iVar4] < 10) {
      puVar6 = puVar6 + iVar4 + 1;
      iVar4 = (iVar3 + -1) - iVar4;
    }
  }
  uVar7 = FixedToFP(CONCAT44(extraout_s1,*puVar6),0,1,0,0x20);
  uVar5 = _ceilf((int)uVar7);
  uVar7 = FPToFixed(CONCAT44(uVar5,uVar5),0,1,3,0x20);
  *(int *)(param_1 + 0x34) = (int)uVar7;
  *(undefined4 *)(param_1 + 0x24) = *puVar6;
  uVar5 = FUN_003e988c((int)uVar7,param_1 + 0x18);
  *(undefined4 *)(param_1 + 0x20) = uVar5;
  FUN_0030f870(param_1 + 0x38,auStack_40);
  *(undefined4 *)(param_1 + 0x60) = 0xffffffff;
  FUN_0030f7e0(auStack_40);
  FUN_0030f7cc(auStack_68,"Invalid");
  FUN_003e9544(param_1,0xffffffff,auStack_68);
  FUN_0030f7e0(auStack_68);
  FUN_0030f7cc(auStack_90,"Linear");
  FUN_003e9544(param_1,0,auStack_90);
  FUN_0030f7e0(auStack_90);
  FUN_0030f7cc(auStack_b8,&DAT_00470ab1);
  FUN_003e9544(param_1,1,auStack_b8);
  FUN_0030f7e0(auStack_b8);
  FUN_0030f7cc(auStack_e0,"SCurve");
  FUN_003e9544(param_1,2,auStack_e0);
  FUN_0030f7e0(auStack_e0);
  FUN_0030f7cc(auStack_108,&DAT_00470abc);
  FUN_003e9544(param_1,3,auStack_108);
  FUN_0030f7e0(auStack_108);
  FUN_0030f7cc(auStack_130,"EaseOutEaseIn");
  FUN_003e9544(param_1,4,auStack_130);
  FUN_0030f7e0(auStack_130);
  FUN_0030f7cc(auStack_158,"EaseOutHardIn");
  FUN_003e9544(param_1,5,auStack_158);
  FUN_0030f7e0(auStack_158);
  FUN_0030f7cc(auStack_180,"EaseOutLinearIn");
  FUN_003e9544(param_1,6,auStack_180);
  FUN_0030f7e0(auStack_180);
  FUN_0030f7cc(auStack_1a8,"HardOutEaseIn");
  FUN_003e9544(param_1,7,auStack_1a8);
  FUN_0030f7e0(auStack_1a8);
  FUN_0030f7cc(auStack_1d0,"LinearOutEaseIn");
  FUN_003e9544(param_1,8,auStack_1d0);
  FUN_0030f7e0(auStack_1d0);
  FUN_0030f7cc(auStack_1f8,"EaseInSine");
  FUN_003e9544(param_1,9,auStack_1f8);
  FUN_0030f7e0(auStack_1f8);
  FUN_0030f7cc(auStack_220,"EaseInCubic");
  FUN_003e9544(param_1,10,auStack_220);
  FUN_0030f7e0(auStack_220);
  FUN_0030f7cc(auStack_248,"EaseInQuint");
  FUN_003e9544(param_1,0xb,auStack_248);
  FUN_0030f7e0(auStack_248);
  FUN_0030f7cc(auStack_270,"EaseInCirc");
  FUN_003e9544(param_1,0xc,auStack_270);
  FUN_0030f7e0(auStack_270);
  FUN_0030f7cc(auStack_298,"EaseInBack");
  FUN_003e9544(param_1,0xd,auStack_298);
  FUN_0030f7e0(auStack_298);
  FUN_0030f7cc(auStack_2c0,"EaseInQuad");
  FUN_003e9544(param_1,0xe,auStack_2c0);
  FUN_0030f7e0(auStack_2c0);
  FUN_0030f7cc(auStack_2e8,"EaseInQuart");
  FUN_003e9544(param_1,0xf,auStack_2e8);
  FUN_0030f7e0(auStack_2e8);
  FUN_0030f7cc(auStack_310,"EaseInExpo");
  FUN_003e9544(param_1,0x10,auStack_310);
  FUN_0030f7e0(auStack_310);
  FUN_0030f7cc(auStack_338,"EaseInElastic");
  FUN_003e9544(param_1,0x11,auStack_338);
  FUN_0030f7e0(auStack_338);
  FUN_0030f7cc(auStack_360,"EaseInBounce");
  FUN_003e9544(param_1,0x12,auStack_360);
  FUN_0030f7e0(auStack_360);
  FUN_0030f7cc(auStack_388,"EaseOutSine");
  FUN_003e9544(param_1,0x13,auStack_388);
  FUN_0030f7e0(auStack_388);
  FUN_0030f7cc(auStack_3b0,"EaseOutCubic");
  FUN_003e9544(param_1,0x14,auStack_3b0);
  FUN_0030f7e0(auStack_3b0);
  FUN_0030f7cc(auStack_3d8,"EaseOutQuint");
  FUN_003e9544(param_1,0x15,auStack_3d8);
  FUN_0030f7e0(auStack_3d8);
  FUN_0030f7cc(auStack_400,"EaseOutCirc");
  FUN_003e9544(param_1,0x16,auStack_400);
  FUN_0030f7e0(auStack_400);
  FUN_0030f7cc(auStack_428,"EaseOutBack");
  FUN_003e9544(param_1,0x17,auStack_428);
  FUN_0030f7e0(auStack_428);
  FUN_0030f7cc(auStack_450,"EaseOutQuad");
  FUN_003e9544(param_1,0x18,auStack_450);
  FUN_0030f7e0(auStack_450);
  FUN_0030f7cc(auStack_478,"EaseOutQuart");
  FUN_003e9544(param_1,0x19,auStack_478);
  FUN_0030f7e0(auStack_478);
  FUN_0030f7cc(auStack_4a0,"EaseOutExpo");
  FUN_003e9544(param_1,0x1a,auStack_4a0);
  FUN_0030f7e0(auStack_4a0);
  FUN_0030f7cc(auStack_4c8,"EaseOutElastic");
  FUN_003e9544(param_1,0x1b,auStack_4c8);
  FUN_0030f7e0(auStack_4c8);
  FUN_0030f7cc(auStack_4f0,"EaseOutBounce");
  FUN_003e9544(param_1,0x1c,auStack_4f0);
  FUN_0030f7e0(auStack_4f0);
  FUN_0030f7cc(auStack_518,"EaseInOutSine");
  FUN_003e9544(param_1,0x1d,auStack_518);
  FUN_0030f7e0(auStack_518);
  FUN_0030f7cc(auStack_540,"EaseInOutCubic");
  FUN_003e9544(param_1,0x1e,auStack_540);
  FUN_0030f7e0(auStack_540);
  FUN_0030f7cc(auStack_568,"EaseInOutQuint");
  FUN_003e9544(param_1,0x1f,auStack_568);
  FUN_0030f7e0(auStack_568);
  FUN_0030f7cc(auStack_590,"EaseInOutCirc");
  FUN_003e9544(param_1,0x20,auStack_590);
  FUN_0030f7e0(auStack_590);
  FUN_0030f7cc(auStack_5b8,"EaseInOutBack");
  FUN_003e9544(param_1,0x21,auStack_5b8);
  FUN_0030f7e0(auStack_5b8);
  FUN_0030f7cc(auStack_5e0,"EaseInOutQuad");
  FUN_003e9544(param_1,0x22,auStack_5e0);
  FUN_0030f7e0(auStack_5e0);
  FUN_0030f7cc(auStack_608,"EaseInOutQuart");
  FUN_003e9544(param_1,0x23,auStack_608);
  FUN_0030f7e0(auStack_608);
  FUN_0030f7cc(auStack_630,"EaseInOutExpo");
  FUN_003e9544(param_1,0x24,auStack_630);
  FUN_0030f7e0(auStack_630);
  FUN_0030f7cc(auStack_658,"EaseInOutElastic");
  FUN_003e9544(param_1,0x25,auStack_658);
  FUN_0030f7e0(auStack_658);
  FUN_0030f7cc(auStack_680,"EaseInOutBounce");
  FUN_003e9544(param_1,0x26,auStack_680);
  FUN_0030f7e0(auStack_680);
  if (*(int *)puVar2 != iStack_18) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail(*(int *)puVar2);
  }
  return;
}


```

## FUN_003e8224 — 003e8224

- 函数名: FUN_003e8224
- 函数体: 63 字节
- 调用者数: 0 / 被调用者数: 1

```c

undefined4 FUN_003e8224(undefined4 param_1)

{
  undefined4 uVar1;
  undefined8 uVar2;
  
  uVar2 = FloatVectorSub(0x3f8000003f800000,CONCAT44(param_1,param_1),2,0x20);
  uVar1 = FUN_003e89a8((int)uVar2,0,0x3f800000,0x3f800000);
  uVar2 = FloatVectorSub(0x3f8000003f800000,CONCAT44(uVar1,uVar1),2,0x20);
  uVar2 = FloatVectorAdd(uVar2,0,2);
  return (int)uVar2;
}


```

## FUN_003e8268 — 003e8ef0

- 函数名: FUN_003e8ef0
- 函数体: 1619 字节
- 调用者数: 1 / 被调用者数: 7

```c

void FUN_003e8ef0(int param_1)

{
  undefined4 *puVar1;
  undefined *puVar2;
  int iVar3;
  int iVar4;
  undefined4 uVar5;
  undefined4 *puVar6;
  undefined4 extraout_s1;
  undefined8 uVar7;
  undefined1 auStack_680 [40];
  undefined1 auStack_658 [40];
  undefined1 auStack_630 [40];
  undefined1 auStack_608 [40];
  undefined1 auStack_5e0 [40];
  undefined1 auStack_5b8 [40];
  undefined1 auStack_590 [40];
  undefined1 auStack_568 [40];
  undefined1 auStack_540 [40];
  undefined1 auStack_518 [40];
  undefined1 auStack_4f0 [40];
  undefined1 auStack_4c8 [40];
  undefined1 auStack_4a0 [40];
  undefined1 auStack_478 [40];
  undefined1 auStack_450 [40];
  undefined1 auStack_428 [40];
  undefined1 auStack_400 [40];
  undefined1 auStack_3d8 [40];
  undefined1 auStack_3b0 [40];
  undefined1 auStack_388 [40];
  undefined1 auStack_360 [40];
  undefined1 auStack_338 [40];
  undefined1 auStack_310 [40];
  undefined1 auStack_2e8 [40];
  undefined1 auStack_2c0 [40];
  undefined1 auStack_298 [40];
  undefined1 auStack_270 [40];
  undefined1 auStack_248 [40];
  undefined1 auStack_220 [40];
  undefined1 auStack_1f8 [40];
  undefined1 auStack_1d0 [40];
  undefined1 auStack_1a8 [40];
  undefined1 auStack_180 [40];
  undefined1 auStack_158 [40];
  undefined1 auStack_130 [40];
  undefined1 auStack_108 [40];
  undefined1 auStack_e0 [40];
  undefined1 auStack_b8 [40];
  undefined1 auStack_90 [40];
  undefined1 auStack_68 [40];
  undefined1 auStack_40 [40];
  int iStack_18;
  
  puVar2 = PTR____stack_chk_guard_004d9044;
  iStack_18 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_0030f7cc(auStack_40,"Invalid");
  *(undefined4 *)(param_1 + 8) = 0;
  puVar6 = (undefined4 *)&UNK_0048cd04;
  *(undefined4 *)(param_1 + 0xc) = 0;
  *(undefined4 *)(param_1 + 0x10) = 0;
  *(undefined4 *)(param_1 + 0x14) = 0;
  puVar1 = (undefined4 *)(param_1 + 4);
  *puVar1 = 0;
  *(undefined4 **)(param_1 + 0xc) = puVar1;
  *(undefined4 **)(param_1 + 0x10) = puVar1;
  *(undefined4 *)(param_1 + 0x24) = 0;
  *(undefined4 *)(param_1 + 0x28) = 0;
  *(undefined4 *)(param_1 + 0x2c) = 0x3f800000;
  *(undefined4 *)(param_1 + 0x30) = 0x40000000;
  *(undefined4 *)(param_1 + 0x34) = 0;
  iVar4 = 0x100;
  while (iVar3 = iVar4, 0 < iVar3) {
    iVar4 = iVar3 >> 1;
    if ((uint)puVar6[iVar4] < 10) {
      puVar6 = puVar6 + iVar4 + 1;
      iVar4 = (iVar3 + -1) - iVar4;
    }
  }
  uVar7 = FixedToFP(CONCAT44(extraout_s1,*puVar6),0,1,0,0x20);
  uVar5 = _ceilf((int)uVar7);
  uVar7 = FPToFixed(CONCAT44(uVar5,uVar5),0,1,3,0x20);
  *(int *)(param_1 + 0x34) = (int)uVar7;
  *(undefined4 *)(param_1 + 0x24) = *puVar6;
  uVar5 = FUN_003e988c((int)uVar7,param_1 + 0x18);
  *(undefined4 *)(param_1 + 0x20) = uVar5;
  FUN_0030f870(param_1 + 0x38,auStack_40);
  *(undefined4 *)(param_1 + 0x60) = 0xffffffff;
  FUN_0030f7e0(auStack_40);
  FUN_0030f7cc(auStack_68,"Invalid");
  FUN_003e9544(param_1,0xffffffff,auStack_68);
  FUN_0030f7e0(auStack_68);
  FUN_0030f7cc(auStack_90,"Linear");
  FUN_003e9544(param_1,0,auStack_90);
  FUN_0030f7e0(auStack_90);
  FUN_0030f7cc(auStack_b8,&DAT_00470ab1);
  FUN_003e9544(param_1,1,auStack_b8);
  FUN_0030f7e0(auStack_b8);
  FUN_0030f7cc(auStack_e0,"SCurve");
  FUN_003e9544(param_1,2,auStack_e0);
  FUN_0030f7e0(auStack_e0);
  FUN_0030f7cc(auStack_108,&DAT_00470abc);
  FUN_003e9544(param_1,3,auStack_108);
  FUN_0030f7e0(auStack_108);
  FUN_0030f7cc(auStack_130,"EaseOutEaseIn");
  FUN_003e9544(param_1,4,auStack_130);
  FUN_0030f7e0(auStack_130);
  FUN_0030f7cc(auStack_158,"EaseOutHardIn");
  FUN_003e9544(param_1,5,auStack_158);
  FUN_0030f7e0(auStack_158);
  FUN_0030f7cc(auStack_180,"EaseOutLinearIn");
  FUN_003e9544(param_1,6,auStack_180);
  FUN_0030f7e0(auStack_180);
  FUN_0030f7cc(auStack_1a8,"HardOutEaseIn");
  FUN_003e9544(param_1,7,auStack_1a8);
  FUN_0030f7e0(auStack_1a8);
  FUN_0030f7cc(auStack_1d0,"LinearOutEaseIn");
  FUN_003e9544(param_1,8,auStack_1d0);
  FUN_0030f7e0(auStack_1d0);
  FUN_0030f7cc(auStack_1f8,"EaseInSine");
  FUN_003e9544(param_1,9,auStack_1f8);
  FUN_0030f7e0(auStack_1f8);
  FUN_0030f7cc(auStack_220,"EaseInCubic");
  FUN_003e9544(param_1,10,auStack_220);
  FUN_0030f7e0(auStack_220);
  FUN_0030f7cc(auStack_248,"EaseInQuint");
  FUN_003e9544(param_1,0xb,auStack_248);
  FUN_0030f7e0(auStack_248);
  FUN_0030f7cc(auStack_270,"EaseInCirc");
  FUN_003e9544(param_1,0xc,auStack_270);
  FUN_0030f7e0(auStack_270);
  FUN_0030f7cc(auStack_298,"EaseInBack");
  FUN_003e9544(param_1,0xd,auStack_298);
  FUN_0030f7e0(auStack_298);
  FUN_0030f7cc(auStack_2c0,"EaseInQuad");
  FUN_003e9544(param_1,0xe,auStack_2c0);
  FUN_0030f7e0(auStack_2c0);
  FUN_0030f7cc(auStack_2e8,"EaseInQuart");
  FUN_003e9544(param_1,0xf,auStack_2e8);
  FUN_0030f7e0(auStack_2e8);
  FUN_0030f7cc(auStack_310,"EaseInExpo");
  FUN_003e9544(param_1,0x10,auStack_310);
  FUN_0030f7e0(auStack_310);
  FUN_0030f7cc(auStack_338,"EaseInElastic");
  FUN_003e9544(param_1,0x11,auStack_338);
  FUN_0030f7e0(auStack_338);
  FUN_0030f7cc(auStack_360,"EaseInBounce");
  FUN_003e9544(param_1,0x12,auStack_360);
  FUN_0030f7e0(auStack_360);
  FUN_0030f7cc(auStack_388,"EaseOutSine");
  FUN_003e9544(param_1,0x13,auStack_388);
  FUN_0030f7e0(auStack_388);
  FUN_0030f7cc(auStack_3b0,"EaseOutCubic");
  FUN_003e9544(param_1,0x14,auStack_3b0);
  FUN_0030f7e0(auStack_3b0);
  FUN_0030f7cc(auStack_3d8,"EaseOutQuint");
  FUN_003e9544(param_1,0x15,auStack_3d8);
  FUN_0030f7e0(auStack_3d8);
  FUN_0030f7cc(auStack_400,"EaseOutCirc");
  FUN_003e9544(param_1,0x16,auStack_400);
  FUN_0030f7e0(auStack_400);
  FUN_0030f7cc(auStack_428,"EaseOutBack");
  FUN_003e9544(param_1,0x17,auStack_428);
  FUN_0030f7e0(auStack_428);
  FUN_0030f7cc(auStack_450,"EaseOutQuad");
  FUN_003e9544(param_1,0x18,auStack_450);
  FUN_0030f7e0(auStack_450);
  FUN_0030f7cc(auStack_478,"EaseOutQuart");
  FUN_003e9544(param_1,0x19,auStack_478);
  FUN_0030f7e0(auStack_478);
  FUN_0030f7cc(auStack_4a0,"EaseOutExpo");
  FUN_003e9544(param_1,0x1a,auStack_4a0);
  FUN_0030f7e0(auStack_4a0);
  FUN_0030f7cc(auStack_4c8,"EaseOutElastic");
  FUN_003e9544(param_1,0x1b,auStack_4c8);
  FUN_0030f7e0(auStack_4c8);
  FUN_0030f7cc(auStack_4f0,"EaseOutBounce");
  FUN_003e9544(param_1,0x1c,auStack_4f0);
  FUN_0030f7e0(auStack_4f0);
  FUN_0030f7cc(auStack_518,"EaseInOutSine");
  FUN_003e9544(param_1,0x1d,auStack_518);
  FUN_0030f7e0(auStack_518);
  FUN_0030f7cc(auStack_540,"EaseInOutCubic");
  FUN_003e9544(param_1,0x1e,auStack_540);
  FUN_0030f7e0(auStack_540);
  FUN_0030f7cc(auStack_568,"EaseInOutQuint");
  FUN_003e9544(param_1,0x1f,auStack_568);
  FUN_0030f7e0(auStack_568);
  FUN_0030f7cc(auStack_590,"EaseInOutCirc");
  FUN_003e9544(param_1,0x20,auStack_590);
  FUN_0030f7e0(auStack_590);
  FUN_0030f7cc(auStack_5b8,"EaseInOutBack");
  FUN_003e9544(param_1,0x21,auStack_5b8);
  FUN_0030f7e0(auStack_5b8);
  FUN_0030f7cc(auStack_5e0,"EaseInOutQuad");
  FUN_003e9544(param_1,0x22,auStack_5e0);
  FUN_0030f7e0(auStack_5e0);
  FUN_0030f7cc(auStack_608,"EaseInOutQuart");
  FUN_003e9544(param_1,0x23,auStack_608);
  FUN_0030f7e0(auStack_608);
  FUN_0030f7cc(auStack_630,"EaseInOutExpo");
  FUN_003e9544(param_1,0x24,auStack_630);
  FUN_0030f7e0(auStack_630);
  FUN_0030f7cc(auStack_658,"EaseInOutElastic");
  FUN_003e9544(param_1,0x25,auStack_658);
  FUN_0030f7e0(auStack_658);
  FUN_0030f7cc(auStack_680,"EaseInOutBounce");
  FUN_003e9544(param_1,0x26,auStack_680);
  FUN_0030f7e0(auStack_680);
  if (*(int *)puVar2 != iStack_18) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail(*(int *)puVar2);
  }
  return;
}


```

## FUN_003e82ac — 003e8ef0

- 函数名: FUN_003e8ef0
- 函数体: 1619 字节
- 调用者数: 1 / 被调用者数: 7

```c

void FUN_003e8ef0(int param_1)

{
  undefined4 *puVar1;
  undefined *puVar2;
  int iVar3;
  int iVar4;
  undefined4 uVar5;
  undefined4 *puVar6;
  undefined4 extraout_s1;
  undefined8 uVar7;
  undefined1 auStack_680 [40];
  undefined1 auStack_658 [40];
  undefined1 auStack_630 [40];
  undefined1 auStack_608 [40];
  undefined1 auStack_5e0 [40];
  undefined1 auStack_5b8 [40];
  undefined1 auStack_590 [40];
  undefined1 auStack_568 [40];
  undefined1 auStack_540 [40];
  undefined1 auStack_518 [40];
  undefined1 auStack_4f0 [40];
  undefined1 auStack_4c8 [40];
  undefined1 auStack_4a0 [40];
  undefined1 auStack_478 [40];
  undefined1 auStack_450 [40];
  undefined1 auStack_428 [40];
  undefined1 auStack_400 [40];
  undefined1 auStack_3d8 [40];
  undefined1 auStack_3b0 [40];
  undefined1 auStack_388 [40];
  undefined1 auStack_360 [40];
  undefined1 auStack_338 [40];
  undefined1 auStack_310 [40];
  undefined1 auStack_2e8 [40];
  undefined1 auStack_2c0 [40];
  undefined1 auStack_298 [40];
  undefined1 auStack_270 [40];
  undefined1 auStack_248 [40];
  undefined1 auStack_220 [40];
  undefined1 auStack_1f8 [40];
  undefined1 auStack_1d0 [40];
  undefined1 auStack_1a8 [40];
  undefined1 auStack_180 [40];
  undefined1 auStack_158 [40];
  undefined1 auStack_130 [40];
  undefined1 auStack_108 [40];
  undefined1 auStack_e0 [40];
  undefined1 auStack_b8 [40];
  undefined1 auStack_90 [40];
  undefined1 auStack_68 [40];
  undefined1 auStack_40 [40];
  int iStack_18;
  
  puVar2 = PTR____stack_chk_guard_004d9044;
  iStack_18 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_0030f7cc(auStack_40,"Invalid");
  *(undefined4 *)(param_1 + 8) = 0;
  puVar6 = (undefined4 *)&UNK_0048cd04;
  *(undefined4 *)(param_1 + 0xc) = 0;
  *(undefined4 *)(param_1 + 0x10) = 0;
  *(undefined4 *)(param_1 + 0x14) = 0;
  puVar1 = (undefined4 *)(param_1 + 4);
  *puVar1 = 0;
  *(undefined4 **)(param_1 + 0xc) = puVar1;
  *(undefined4 **)(param_1 + 0x10) = puVar1;
  *(undefined4 *)(param_1 + 0x24) = 0;
  *(undefined4 *)(param_1 + 0x28) = 0;
  *(undefined4 *)(param_1 + 0x2c) = 0x3f800000;
  *(undefined4 *)(param_1 + 0x30) = 0x40000000;
  *(undefined4 *)(param_1 + 0x34) = 0;
  iVar4 = 0x100;
  while (iVar3 = iVar4, 0 < iVar3) {
    iVar4 = iVar3 >> 1;
    if ((uint)puVar6[iVar4] < 10) {
      puVar6 = puVar6 + iVar4 + 1;
      iVar4 = (iVar3 + -1) - iVar4;
    }
  }
  uVar7 = FixedToFP(CONCAT44(extraout_s1,*puVar6),0,1,0,0x20);
  uVar5 = _ceilf((int)uVar7);
  uVar7 = FPToFixed(CONCAT44(uVar5,uVar5),0,1,3,0x20);
  *(int *)(param_1 + 0x34) = (int)uVar7;
  *(undefined4 *)(param_1 + 0x24) = *puVar6;
  uVar5 = FUN_003e988c((int)uVar7,param_1 + 0x18);
  *(undefined4 *)(param_1 + 0x20) = uVar5;
  FUN_0030f870(param_1 + 0x38,auStack_40);
  *(undefined4 *)(param_1 + 0x60) = 0xffffffff;
  FUN_0030f7e0(auStack_40);
  FUN_0030f7cc(auStack_68,"Invalid");
  FUN_003e9544(param_1,0xffffffff,auStack_68);
  FUN_0030f7e0(auStack_68);
  FUN_0030f7cc(auStack_90,"Linear");
  FUN_003e9544(param_1,0,auStack_90);
  FUN_0030f7e0(auStack_90);
  FUN_0030f7cc(auStack_b8,&DAT_00470ab1);
  FUN_003e9544(param_1,1,auStack_b8);
  FUN_0030f7e0(auStack_b8);
  FUN_0030f7cc(auStack_e0,"SCurve");
  FUN_003e9544(param_1,2,auStack_e0);
  FUN_0030f7e0(auStack_e0);
  FUN_0030f7cc(auStack_108,&DAT_00470abc);
  FUN_003e9544(param_1,3,auStack_108);
  FUN_0030f7e0(auStack_108);
  FUN_0030f7cc(auStack_130,"EaseOutEaseIn");
  FUN_003e9544(param_1,4,auStack_130);
  FUN_0030f7e0(auStack_130);
  FUN_0030f7cc(auStack_158,"EaseOutHardIn");
  FUN_003e9544(param_1,5,auStack_158);
  FUN_0030f7e0(auStack_158);
  FUN_0030f7cc(auStack_180,"EaseOutLinearIn");
  FUN_003e9544(param_1,6,auStack_180);
  FUN_0030f7e0(auStack_180);
  FUN_0030f7cc(auStack_1a8,"HardOutEaseIn");
  FUN_003e9544(param_1,7,auStack_1a8);
  FUN_0030f7e0(auStack_1a8);
  FUN_0030f7cc(auStack_1d0,"LinearOutEaseIn");
  FUN_003e9544(param_1,8,auStack_1d0);
  FUN_0030f7e0(auStack_1d0);
  FUN_0030f7cc(auStack_1f8,"EaseInSine");
  FUN_003e9544(param_1,9,auStack_1f8);
  FUN_0030f7e0(auStack_1f8);
  FUN_0030f7cc(auStack_220,"EaseInCubic");
  FUN_003e9544(param_1,10,auStack_220);
  FUN_0030f7e0(auStack_220);
  FUN_0030f7cc(auStack_248,"EaseInQuint");
  FUN_003e9544(param_1,0xb,auStack_248);
  FUN_0030f7e0(auStack_248);
  FUN_0030f7cc(auStack_270,"EaseInCirc");
  FUN_003e9544(param_1,0xc,auStack_270);
  FUN_0030f7e0(auStack_270);
  FUN_0030f7cc(auStack_298,"EaseInBack");
  FUN_003e9544(param_1,0xd,auStack_298);
  FUN_0030f7e0(auStack_298);
  FUN_0030f7cc(auStack_2c0,"EaseInQuad");
  FUN_003e9544(param_1,0xe,auStack_2c0);
  FUN_0030f7e0(auStack_2c0);
  FUN_0030f7cc(auStack_2e8,"EaseInQuart");
  FUN_003e9544(param_1,0xf,auStack_2e8);
  FUN_0030f7e0(auStack_2e8);
  FUN_0030f7cc(auStack_310,"EaseInExpo");
  FUN_003e9544(param_1,0x10,auStack_310);
  FUN_0030f7e0(auStack_310);
  FUN_0030f7cc(auStack_338,"EaseInElastic");
  FUN_003e9544(param_1,0x11,auStack_338);
  FUN_0030f7e0(auStack_338);
  FUN_0030f7cc(auStack_360,"EaseInBounce");
  FUN_003e9544(param_1,0x12,auStack_360);
  FUN_0030f7e0(auStack_360);
  FUN_0030f7cc(auStack_388,"EaseOutSine");
  FUN_003e9544(param_1,0x13,auStack_388);
  FUN_0030f7e0(auStack_388);
  FUN_0030f7cc(auStack_3b0,"EaseOutCubic");
  FUN_003e9544(param_1,0x14,auStack_3b0);
  FUN_0030f7e0(auStack_3b0);
  FUN_0030f7cc(auStack_3d8,"EaseOutQuint");
  FUN_003e9544(param_1,0x15,auStack_3d8);
  FUN_0030f7e0(auStack_3d8);
  FUN_0030f7cc(auStack_400,"EaseOutCirc");
  FUN_003e9544(param_1,0x16,auStack_400);
  FUN_0030f7e0(auStack_400);
  FUN_0030f7cc(auStack_428,"EaseOutBack");
  FUN_003e9544(param_1,0x17,auStack_428);
  FUN_0030f7e0(auStack_428);
  FUN_0030f7cc(auStack_450,"EaseOutQuad");
  FUN_003e9544(param_1,0x18,auStack_450);
  FUN_0030f7e0(auStack_450);
  FUN_0030f7cc(auStack_478,"EaseOutQuart");
  FUN_003e9544(param_1,0x19,auStack_478);
  FUN_0030f7e0(auStack_478);
  FUN_0030f7cc(auStack_4a0,"EaseOutExpo");
  FUN_003e9544(param_1,0x1a,auStack_4a0);
  FUN_0030f7e0(auStack_4a0);
  FUN_0030f7cc(auStack_4c8,"EaseOutElastic");
  FUN_003e9544(param_1,0x1b,auStack_4c8);
  FUN_0030f7e0(auStack_4c8);
  FUN_0030f7cc(auStack_4f0,"EaseOutBounce");
  FUN_003e9544(param_1,0x1c,auStack_4f0);
  FUN_0030f7e0(auStack_4f0);
  FUN_0030f7cc(auStack_518,"EaseInOutSine");
  FUN_003e9544(param_1,0x1d,auStack_518);
  FUN_0030f7e0(auStack_518);
  FUN_0030f7cc(auStack_540,"EaseInOutCubic");
  FUN_003e9544(param_1,0x1e,auStack_540);
  FUN_0030f7e0(auStack_540);
  FUN_0030f7cc(auStack_568,"EaseInOutQuint");
  FUN_003e9544(param_1,0x1f,auStack_568);
  FUN_0030f7e0(auStack_568);
  FUN_0030f7cc(auStack_590,"EaseInOutCirc");
  FUN_003e9544(param_1,0x20,auStack_590);
  FUN_0030f7e0(auStack_590);
  FUN_0030f7cc(auStack_5b8,"EaseInOutBack");
  FUN_003e9544(param_1,0x21,auStack_5b8);
  FUN_0030f7e0(auStack_5b8);
  FUN_0030f7cc(auStack_5e0,"EaseInOutQuad");
  FUN_003e9544(param_1,0x22,auStack_5e0);
  FUN_0030f7e0(auStack_5e0);
  FUN_0030f7cc(auStack_608,"EaseInOutQuart");
  FUN_003e9544(param_1,0x23,auStack_608);
  FUN_0030f7e0(auStack_608);
  FUN_0030f7cc(auStack_630,"EaseInOutExpo");
  FUN_003e9544(param_1,0x24,auStack_630);
  FUN_0030f7e0(auStack_630);
  FUN_0030f7cc(auStack_658,"EaseInOutElastic");
  FUN_003e9544(param_1,0x25,auStack_658);
  FUN_0030f7e0(auStack_658);
  FUN_0030f7cc(auStack_680,"EaseInOutBounce");
  FUN_003e9544(param_1,0x26,auStack_680);
  FUN_0030f7e0(auStack_680);
  if (*(int *)puVar2 != iStack_18) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail(*(int *)puVar2);
  }
  return;
}


```

## FUN_003e82d8 — 003e8ef0

- 函数名: FUN_003e8ef0
- 函数体: 1619 字节
- 调用者数: 1 / 被调用者数: 7

```c

void FUN_003e8ef0(int param_1)

{
  undefined4 *puVar1;
  undefined *puVar2;
  int iVar3;
  int iVar4;
  undefined4 uVar5;
  undefined4 *puVar6;
  undefined4 extraout_s1;
  undefined8 uVar7;
  undefined1 auStack_680 [40];
  undefined1 auStack_658 [40];
  undefined1 auStack_630 [40];
  undefined1 auStack_608 [40];
  undefined1 auStack_5e0 [40];
  undefined1 auStack_5b8 [40];
  undefined1 auStack_590 [40];
  undefined1 auStack_568 [40];
  undefined1 auStack_540 [40];
  undefined1 auStack_518 [40];
  undefined1 auStack_4f0 [40];
  undefined1 auStack_4c8 [40];
  undefined1 auStack_4a0 [40];
  undefined1 auStack_478 [40];
  undefined1 auStack_450 [40];
  undefined1 auStack_428 [40];
  undefined1 auStack_400 [40];
  undefined1 auStack_3d8 [40];
  undefined1 auStack_3b0 [40];
  undefined1 auStack_388 [40];
  undefined1 auStack_360 [40];
  undefined1 auStack_338 [40];
  undefined1 auStack_310 [40];
  undefined1 auStack_2e8 [40];
  undefined1 auStack_2c0 [40];
  undefined1 auStack_298 [40];
  undefined1 auStack_270 [40];
  undefined1 auStack_248 [40];
  undefined1 auStack_220 [40];
  undefined1 auStack_1f8 [40];
  undefined1 auStack_1d0 [40];
  undefined1 auStack_1a8 [40];
  undefined1 auStack_180 [40];
  undefined1 auStack_158 [40];
  undefined1 auStack_130 [40];
  undefined1 auStack_108 [40];
  undefined1 auStack_e0 [40];
  undefined1 auStack_b8 [40];
  undefined1 auStack_90 [40];
  undefined1 auStack_68 [40];
  undefined1 auStack_40 [40];
  int iStack_18;
  
  puVar2 = PTR____stack_chk_guard_004d9044;
  iStack_18 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_0030f7cc(auStack_40,"Invalid");
  *(undefined4 *)(param_1 + 8) = 0;
  puVar6 = (undefined4 *)&UNK_0048cd04;
  *(undefined4 *)(param_1 + 0xc) = 0;
  *(undefined4 *)(param_1 + 0x10) = 0;
  *(undefined4 *)(param_1 + 0x14) = 0;
  puVar1 = (undefined4 *)(param_1 + 4);
  *puVar1 = 0;
  *(undefined4 **)(param_1 + 0xc) = puVar1;
  *(undefined4 **)(param_1 + 0x10) = puVar1;
  *(undefined4 *)(param_1 + 0x24) = 0;
  *(undefined4 *)(param_1 + 0x28) = 0;
  *(undefined4 *)(param_1 + 0x2c) = 0x3f800000;
  *(undefined4 *)(param_1 + 0x30) = 0x40000000;
  *(undefined4 *)(param_1 + 0x34) = 0;
  iVar4 = 0x100;
  while (iVar3 = iVar4, 0 < iVar3) {
    iVar4 = iVar3 >> 1;
    if ((uint)puVar6[iVar4] < 10) {
      puVar6 = puVar6 + iVar4 + 1;
      iVar4 = (iVar3 + -1) - iVar4;
    }
  }
  uVar7 = FixedToFP(CONCAT44(extraout_s1,*puVar6),0,1,0,0x20);
  uVar5 = _ceilf((int)uVar7);
  uVar7 = FPToFixed(CONCAT44(uVar5,uVar5),0,1,3,0x20);
  *(int *)(param_1 + 0x34) = (int)uVar7;
  *(undefined4 *)(param_1 + 0x24) = *puVar6;
  uVar5 = FUN_003e988c((int)uVar7,param_1 + 0x18);
  *(undefined4 *)(param_1 + 0x20) = uVar5;
  FUN_0030f870(param_1 + 0x38,auStack_40);
  *(undefined4 *)(param_1 + 0x60) = 0xffffffff;
  FUN_0030f7e0(auStack_40);
  FUN_0030f7cc(auStack_68,"Invalid");
  FUN_003e9544(param_1,0xffffffff,auStack_68);
  FUN_0030f7e0(auStack_68);
  FUN_0030f7cc(auStack_90,"Linear");
  FUN_003e9544(param_1,0,auStack_90);
  FUN_0030f7e0(auStack_90);
  FUN_0030f7cc(auStack_b8,&DAT_00470ab1);
  FUN_003e9544(param_1,1,auStack_b8);
  FUN_0030f7e0(auStack_b8);
  FUN_0030f7cc(auStack_e0,"SCurve");
  FUN_003e9544(param_1,2,auStack_e0);
  FUN_0030f7e0(auStack_e0);
  FUN_0030f7cc(auStack_108,&DAT_00470abc);
  FUN_003e9544(param_1,3,auStack_108);
  FUN_0030f7e0(auStack_108);
  FUN_0030f7cc(auStack_130,"EaseOutEaseIn");
  FUN_003e9544(param_1,4,auStack_130);
  FUN_0030f7e0(auStack_130);
  FUN_0030f7cc(auStack_158,"EaseOutHardIn");
  FUN_003e9544(param_1,5,auStack_158);
  FUN_0030f7e0(auStack_158);
  FUN_0030f7cc(auStack_180,"EaseOutLinearIn");
  FUN_003e9544(param_1,6,auStack_180);
  FUN_0030f7e0(auStack_180);
  FUN_0030f7cc(auStack_1a8,"HardOutEaseIn");
  FUN_003e9544(param_1,7,auStack_1a8);
  FUN_0030f7e0(auStack_1a8);
  FUN_0030f7cc(auStack_1d0,"LinearOutEaseIn");
  FUN_003e9544(param_1,8,auStack_1d0);
  FUN_0030f7e0(auStack_1d0);
  FUN_0030f7cc(auStack_1f8,"EaseInSine");
  FUN_003e9544(param_1,9,auStack_1f8);
  FUN_0030f7e0(auStack_1f8);
  FUN_0030f7cc(auStack_220,"EaseInCubic");
  FUN_003e9544(param_1,10,auStack_220);
  FUN_0030f7e0(auStack_220);
  FUN_0030f7cc(auStack_248,"EaseInQuint");
  FUN_003e9544(param_1,0xb,auStack_248);
  FUN_0030f7e0(auStack_248);
  FUN_0030f7cc(auStack_270,"EaseInCirc");
  FUN_003e9544(param_1,0xc,auStack_270);
  FUN_0030f7e0(auStack_270);
  FUN_0030f7cc(auStack_298,"EaseInBack");
  FUN_003e9544(param_1,0xd,auStack_298);
  FUN_0030f7e0(auStack_298);
  FUN_0030f7cc(auStack_2c0,"EaseInQuad");
  FUN_003e9544(param_1,0xe,auStack_2c0);
  FUN_0030f7e0(auStack_2c0);
  FUN_0030f7cc(auStack_2e8,"EaseInQuart");
  FUN_003e9544(param_1,0xf,auStack_2e8);
  FUN_0030f7e0(auStack_2e8);
  FUN_0030f7cc(auStack_310,"EaseInExpo");
  FUN_003e9544(param_1,0x10,auStack_310);
  FUN_0030f7e0(auStack_310);
  FUN_0030f7cc(auStack_338,"EaseInElastic");
  FUN_003e9544(param_1,0x11,auStack_338);
  FUN_0030f7e0(auStack_338);
  FUN_0030f7cc(auStack_360,"EaseInBounce");
  FUN_003e9544(param_1,0x12,auStack_360);
  FUN_0030f7e0(auStack_360);
  FUN_0030f7cc(auStack_388,"EaseOutSine");
  FUN_003e9544(param_1,0x13,auStack_388);
  FUN_0030f7e0(auStack_388);
  FUN_0030f7cc(auStack_3b0,"EaseOutCubic");
  FUN_003e9544(param_1,0x14,auStack_3b0);
  FUN_0030f7e0(auStack_3b0);
  FUN_0030f7cc(auStack_3d8,"EaseOutQuint");
  FUN_003e9544(param_1,0x15,auStack_3d8);
  FUN_0030f7e0(auStack_3d8);
  FUN_0030f7cc(auStack_400,"EaseOutCirc");
  FUN_003e9544(param_1,0x16,auStack_400);
  FUN_0030f7e0(auStack_400);
  FUN_0030f7cc(auStack_428,"EaseOutBack");
  FUN_003e9544(param_1,0x17,auStack_428);
  FUN_0030f7e0(auStack_428);
  FUN_0030f7cc(auStack_450,"EaseOutQuad");
  FUN_003e9544(param_1,0x18,auStack_450);
  FUN_0030f7e0(auStack_450);
  FUN_0030f7cc(auStack_478,"EaseOutQuart");
  FUN_003e9544(param_1,0x19,auStack_478);
  FUN_0030f7e0(auStack_478);
  FUN_0030f7cc(auStack_4a0,"EaseOutExpo");
  FUN_003e9544(param_1,0x1a,auStack_4a0);
  FUN_0030f7e0(auStack_4a0);
  FUN_0030f7cc(auStack_4c8,"EaseOutElastic");
  FUN_003e9544(param_1,0x1b,auStack_4c8);
  FUN_0030f7e0(auStack_4c8);
  FUN_0030f7cc(auStack_4f0,"EaseOutBounce");
  FUN_003e9544(param_1,0x1c,auStack_4f0);
  FUN_0030f7e0(auStack_4f0);
  FUN_0030f7cc(auStack_518,"EaseInOutSine");
  FUN_003e9544(param_1,0x1d,auStack_518);
  FUN_0030f7e0(auStack_518);
  FUN_0030f7cc(auStack_540,"EaseInOutCubic");
  FUN_003e9544(param_1,0x1e,auStack_540);
  FUN_0030f7e0(auStack_540);
  FUN_0030f7cc(auStack_568,"EaseInOutQuint");
  FUN_003e9544(param_1,0x1f,auStack_568);
  FUN_0030f7e0(auStack_568);
  FUN_0030f7cc(auStack_590,"EaseInOutCirc");
  FUN_003e9544(param_1,0x20,auStack_590);
  FUN_0030f7e0(auStack_590);
  FUN_0030f7cc(auStack_5b8,"EaseInOutBack");
  FUN_003e9544(param_1,0x21,auStack_5b8);
  FUN_0030f7e0(auStack_5b8);
  FUN_0030f7cc(auStack_5e0,"EaseInOutQuad");
  FUN_003e9544(param_1,0x22,auStack_5e0);
  FUN_0030f7e0(auStack_5e0);
  FUN_0030f7cc(auStack_608,"EaseInOutQuart");
  FUN_003e9544(param_1,0x23,auStack_608);
  FUN_0030f7e0(auStack_608);
  FUN_0030f7cc(auStack_630,"EaseInOutExpo");
  FUN_003e9544(param_1,0x24,auStack_630);
  FUN_0030f7e0(auStack_630);
  FUN_0030f7cc(auStack_658,"EaseInOutElastic");
  FUN_003e9544(param_1,0x25,auStack_658);
  FUN_0030f7e0(auStack_658);
  FUN_0030f7cc(auStack_680,"EaseInOutBounce");
  FUN_003e9544(param_1,0x26,auStack_680);
  FUN_0030f7e0(auStack_680);
  if (*(int *)puVar2 != iStack_18) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail(*(int *)puVar2);
  }
  return;
}


```

## FUN_003e8310 — 003e8ef0

- 函数名: FUN_003e8ef0
- 函数体: 1619 字节
- 调用者数: 1 / 被调用者数: 7

```c

void FUN_003e8ef0(int param_1)

{
  undefined4 *puVar1;
  undefined *puVar2;
  int iVar3;
  int iVar4;
  undefined4 uVar5;
  undefined4 *puVar6;
  undefined4 extraout_s1;
  undefined8 uVar7;
  undefined1 auStack_680 [40];
  undefined1 auStack_658 [40];
  undefined1 auStack_630 [40];
  undefined1 auStack_608 [40];
  undefined1 auStack_5e0 [40];
  undefined1 auStack_5b8 [40];
  undefined1 auStack_590 [40];
  undefined1 auStack_568 [40];
  undefined1 auStack_540 [40];
  undefined1 auStack_518 [40];
  undefined1 auStack_4f0 [40];
  undefined1 auStack_4c8 [40];
  undefined1 auStack_4a0 [40];
  undefined1 auStack_478 [40];
  undefined1 auStack_450 [40];
  undefined1 auStack_428 [40];
  undefined1 auStack_400 [40];
  undefined1 auStack_3d8 [40];
  undefined1 auStack_3b0 [40];
  undefined1 auStack_388 [40];
  undefined1 auStack_360 [40];
  undefined1 auStack_338 [40];
  undefined1 auStack_310 [40];
  undefined1 auStack_2e8 [40];
  undefined1 auStack_2c0 [40];
  undefined1 auStack_298 [40];
  undefined1 auStack_270 [40];
  undefined1 auStack_248 [40];
  undefined1 auStack_220 [40];
  undefined1 auStack_1f8 [40];
  undefined1 auStack_1d0 [40];
  undefined1 auStack_1a8 [40];
  undefined1 auStack_180 [40];
  undefined1 auStack_158 [40];
  undefined1 auStack_130 [40];
  undefined1 auStack_108 [40];
  undefined1 auStack_e0 [40];
  undefined1 auStack_b8 [40];
  undefined1 auStack_90 [40];
  undefined1 auStack_68 [40];
  undefined1 auStack_40 [40];
  int iStack_18;
  
  puVar2 = PTR____stack_chk_guard_004d9044;
  iStack_18 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_0030f7cc(auStack_40,"Invalid");
  *(undefined4 *)(param_1 + 8) = 0;
  puVar6 = (undefined4 *)&UNK_0048cd04;
  *(undefined4 *)(param_1 + 0xc) = 0;
  *(undefined4 *)(param_1 + 0x10) = 0;
  *(undefined4 *)(param_1 + 0x14) = 0;
  puVar1 = (undefined4 *)(param_1 + 4);
  *puVar1 = 0;
  *(undefined4 **)(param_1 + 0xc) = puVar1;
  *(undefined4 **)(param_1 + 0x10) = puVar1;
  *(undefined4 *)(param_1 + 0x24) = 0;
  *(undefined4 *)(param_1 + 0x28) = 0;
  *(undefined4 *)(param_1 + 0x2c) = 0x3f800000;
  *(undefined4 *)(param_1 + 0x30) = 0x40000000;
  *(undefined4 *)(param_1 + 0x34) = 0;
  iVar4 = 0x100;
  while (iVar3 = iVar4, 0 < iVar3) {
    iVar4 = iVar3 >> 1;
    if ((uint)puVar6[iVar4] < 10) {
      puVar6 = puVar6 + iVar4 + 1;
      iVar4 = (iVar3 + -1) - iVar4;
    }
  }
  uVar7 = FixedToFP(CONCAT44(extraout_s1,*puVar6),0,1,0,0x20);
  uVar5 = _ceilf((int)uVar7);
  uVar7 = FPToFixed(CONCAT44(uVar5,uVar5),0,1,3,0x20);
  *(int *)(param_1 + 0x34) = (int)uVar7;
  *(undefined4 *)(param_1 + 0x24) = *puVar6;
  uVar5 = FUN_003e988c((int)uVar7,param_1 + 0x18);
  *(undefined4 *)(param_1 + 0x20) = uVar5;
  FUN_0030f870(param_1 + 0x38,auStack_40);
  *(undefined4 *)(param_1 + 0x60) = 0xffffffff;
  FUN_0030f7e0(auStack_40);
  FUN_0030f7cc(auStack_68,"Invalid");
  FUN_003e9544(param_1,0xffffffff,auStack_68);
  FUN_0030f7e0(auStack_68);
  FUN_0030f7cc(auStack_90,"Linear");
  FUN_003e9544(param_1,0,auStack_90);
  FUN_0030f7e0(auStack_90);
  FUN_0030f7cc(auStack_b8,&DAT_00470ab1);
  FUN_003e9544(param_1,1,auStack_b8);
  FUN_0030f7e0(auStack_b8);
  FUN_0030f7cc(auStack_e0,"SCurve");
  FUN_003e9544(param_1,2,auStack_e0);
  FUN_0030f7e0(auStack_e0);
  FUN_0030f7cc(auStack_108,&DAT_00470abc);
  FUN_003e9544(param_1,3,auStack_108);
  FUN_0030f7e0(auStack_108);
  FUN_0030f7cc(auStack_130,"EaseOutEaseIn");
  FUN_003e9544(param_1,4,auStack_130);
  FUN_0030f7e0(auStack_130);
  FUN_0030f7cc(auStack_158,"EaseOutHardIn");
  FUN_003e9544(param_1,5,auStack_158);
  FUN_0030f7e0(auStack_158);
  FUN_0030f7cc(auStack_180,"EaseOutLinearIn");
  FUN_003e9544(param_1,6,auStack_180);
  FUN_0030f7e0(auStack_180);
  FUN_0030f7cc(auStack_1a8,"HardOutEaseIn");
  FUN_003e9544(param_1,7,auStack_1a8);
  FUN_0030f7e0(auStack_1a8);
  FUN_0030f7cc(auStack_1d0,"LinearOutEaseIn");
  FUN_003e9544(param_1,8,auStack_1d0);
  FUN_0030f7e0(auStack_1d0);
  FUN_0030f7cc(auStack_1f8,"EaseInSine");
  FUN_003e9544(param_1,9,auStack_1f8);
  FUN_0030f7e0(auStack_1f8);
  FUN_0030f7cc(auStack_220,"EaseInCubic");
  FUN_003e9544(param_1,10,auStack_220);
  FUN_0030f7e0(auStack_220);
  FUN_0030f7cc(auStack_248,"EaseInQuint");
  FUN_003e9544(param_1,0xb,auStack_248);
  FUN_0030f7e0(auStack_248);
  FUN_0030f7cc(auStack_270,"EaseInCirc");
  FUN_003e9544(param_1,0xc,auStack_270);
  FUN_0030f7e0(auStack_270);
  FUN_0030f7cc(auStack_298,"EaseInBack");
  FUN_003e9544(param_1,0xd,auStack_298);
  FUN_0030f7e0(auStack_298);
  FUN_0030f7cc(auStack_2c0,"EaseInQuad");
  FUN_003e9544(param_1,0xe,auStack_2c0);
  FUN_0030f7e0(auStack_2c0);
  FUN_0030f7cc(auStack_2e8,"EaseInQuart");
  FUN_003e9544(param_1,0xf,auStack_2e8);
  FUN_0030f7e0(auStack_2e8);
  FUN_0030f7cc(auStack_310,"EaseInExpo");
  FUN_003e9544(param_1,0x10,auStack_310);
  FUN_0030f7e0(auStack_310);
  FUN_0030f7cc(auStack_338,"EaseInElastic");
  FUN_003e9544(param_1,0x11,auStack_338);
  FUN_0030f7e0(auStack_338);
  FUN_0030f7cc(auStack_360,"EaseInBounce");
  FUN_003e9544(param_1,0x12,auStack_360);
  FUN_0030f7e0(auStack_360);
  FUN_0030f7cc(auStack_388,"EaseOutSine");
  FUN_003e9544(param_1,0x13,auStack_388);
  FUN_0030f7e0(auStack_388);
  FUN_0030f7cc(auStack_3b0,"EaseOutCubic");
  FUN_003e9544(param_1,0x14,auStack_3b0);
  FUN_0030f7e0(auStack_3b0);
  FUN_0030f7cc(auStack_3d8,"EaseOutQuint");
  FUN_003e9544(param_1,0x15,auStack_3d8);
  FUN_0030f7e0(auStack_3d8);
  FUN_0030f7cc(auStack_400,"EaseOutCirc");
  FUN_003e9544(param_1,0x16,auStack_400);
  FUN_0030f7e0(auStack_400);
  FUN_0030f7cc(auStack_428,"EaseOutBack");
  FUN_003e9544(param_1,0x17,auStack_428);
  FUN_0030f7e0(auStack_428);
  FUN_0030f7cc(auStack_450,"EaseOutQuad");
  FUN_003e9544(param_1,0x18,auStack_450);
  FUN_0030f7e0(auStack_450);
  FUN_0030f7cc(auStack_478,"EaseOutQuart");
  FUN_003e9544(param_1,0x19,auStack_478);
  FUN_0030f7e0(auStack_478);
  FUN_0030f7cc(auStack_4a0,"EaseOutExpo");
  FUN_003e9544(param_1,0x1a,auStack_4a0);
  FUN_0030f7e0(auStack_4a0);
  FUN_0030f7cc(auStack_4c8,"EaseOutElastic");
  FUN_003e9544(param_1,0x1b,auStack_4c8);
  FUN_0030f7e0(auStack_4c8);
  FUN_0030f7cc(auStack_4f0,"EaseOutBounce");
  FUN_003e9544(param_1,0x1c,auStack_4f0);
  FUN_0030f7e0(auStack_4f0);
  FUN_0030f7cc(auStack_518,"EaseInOutSine");
  FUN_003e9544(param_1,0x1d,auStack_518);
  FUN_0030f7e0(auStack_518);
  FUN_0030f7cc(auStack_540,"EaseInOutCubic");
  FUN_003e9544(param_1,0x1e,auStack_540);
  FUN_0030f7e0(auStack_540);
  FUN_0030f7cc(auStack_568,"EaseInOutQuint");
  FUN_003e9544(param_1,0x1f,auStack_568);
  FUN_0030f7e0(auStack_568);
  FUN_0030f7cc(auStack_590,"EaseInOutCirc");
  FUN_003e9544(param_1,0x20,auStack_590);
  FUN_0030f7e0(auStack_590);
  FUN_0030f7cc(auStack_5b8,"EaseInOutBack");
  FUN_003e9544(param_1,0x21,auStack_5b8);
  FUN_0030f7e0(auStack_5b8);
  FUN_0030f7cc(auStack_5e0,"EaseInOutQuad");
  FUN_003e9544(param_1,0x22,auStack_5e0);
  FUN_0030f7e0(auStack_5e0);
  FUN_0030f7cc(auStack_608,"EaseInOutQuart");
  FUN_003e9544(param_1,0x23,auStack_608);
  FUN_0030f7e0(auStack_608);
  FUN_0030f7cc(auStack_630,"EaseInOutExpo");
  FUN_003e9544(param_1,0x24,auStack_630);
  FUN_0030f7e0(auStack_630);
  FUN_0030f7cc(auStack_658,"EaseInOutElastic");
  FUN_003e9544(param_1,0x25,auStack_658);
  FUN_0030f7e0(auStack_658);
  FUN_0030f7cc(auStack_680,"EaseInOutBounce");
  FUN_003e9544(param_1,0x26,auStack_680);
  FUN_0030f7e0(auStack_680);
  if (*(int *)puVar2 != iStack_18) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail(*(int *)puVar2);
  }
  return;
}


```

## FUN_003e8350 — 003e8ef0

- 函数名: FUN_003e8ef0
- 函数体: 1619 字节
- 调用者数: 1 / 被调用者数: 7

```c

void FUN_003e8ef0(int param_1)

{
  undefined4 *puVar1;
  undefined *puVar2;
  int iVar3;
  int iVar4;
  undefined4 uVar5;
  undefined4 *puVar6;
  undefined4 extraout_s1;
  undefined8 uVar7;
  undefined1 auStack_680 [40];
  undefined1 auStack_658 [40];
  undefined1 auStack_630 [40];
  undefined1 auStack_608 [40];
  undefined1 auStack_5e0 [40];
  undefined1 auStack_5b8 [40];
  undefined1 auStack_590 [40];
  undefined1 auStack_568 [40];
  undefined1 auStack_540 [40];
  undefined1 auStack_518 [40];
  undefined1 auStack_4f0 [40];
  undefined1 auStack_4c8 [40];
  undefined1 auStack_4a0 [40];
  undefined1 auStack_478 [40];
  undefined1 auStack_450 [40];
  undefined1 auStack_428 [40];
  undefined1 auStack_400 [40];
  undefined1 auStack_3d8 [40];
  undefined1 auStack_3b0 [40];
  undefined1 auStack_388 [40];
  undefined1 auStack_360 [40];
  undefined1 auStack_338 [40];
  undefined1 auStack_310 [40];
  undefined1 auStack_2e8 [40];
  undefined1 auStack_2c0 [40];
  undefined1 auStack_298 [40];
  undefined1 auStack_270 [40];
  undefined1 auStack_248 [40];
  undefined1 auStack_220 [40];
  undefined1 auStack_1f8 [40];
  undefined1 auStack_1d0 [40];
  undefined1 auStack_1a8 [40];
  undefined1 auStack_180 [40];
  undefined1 auStack_158 [40];
  undefined1 auStack_130 [40];
  undefined1 auStack_108 [40];
  undefined1 auStack_e0 [40];
  undefined1 auStack_b8 [40];
  undefined1 auStack_90 [40];
  undefined1 auStack_68 [40];
  undefined1 auStack_40 [40];
  int iStack_18;
  
  puVar2 = PTR____stack_chk_guard_004d9044;
  iStack_18 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_0030f7cc(auStack_40,"Invalid");
  *(undefined4 *)(param_1 + 8) = 0;
  puVar6 = (undefined4 *)&UNK_0048cd04;
  *(undefined4 *)(param_1 + 0xc) = 0;
  *(undefined4 *)(param_1 + 0x10) = 0;
  *(undefined4 *)(param_1 + 0x14) = 0;
  puVar1 = (undefined4 *)(param_1 + 4);
  *puVar1 = 0;
  *(undefined4 **)(param_1 + 0xc) = puVar1;
  *(undefined4 **)(param_1 + 0x10) = puVar1;
  *(undefined4 *)(param_1 + 0x24) = 0;
  *(undefined4 *)(param_1 + 0x28) = 0;
  *(undefined4 *)(param_1 + 0x2c) = 0x3f800000;
  *(undefined4 *)(param_1 + 0x30) = 0x40000000;
  *(undefined4 *)(param_1 + 0x34) = 0;
  iVar4 = 0x100;
  while (iVar3 = iVar4, 0 < iVar3) {
    iVar4 = iVar3 >> 1;
    if ((uint)puVar6[iVar4] < 10) {
      puVar6 = puVar6 + iVar4 + 1;
      iVar4 = (iVar3 + -1) - iVar4;
    }
  }
  uVar7 = FixedToFP(CONCAT44(extraout_s1,*puVar6),0,1,0,0x20);
  uVar5 = _ceilf((int)uVar7);
  uVar7 = FPToFixed(CONCAT44(uVar5,uVar5),0,1,3,0x20);
  *(int *)(param_1 + 0x34) = (int)uVar7;
  *(undefined4 *)(param_1 + 0x24) = *puVar6;
  uVar5 = FUN_003e988c((int)uVar7,param_1 + 0x18);
  *(undefined4 *)(param_1 + 0x20) = uVar5;
  FUN_0030f870(param_1 + 0x38,auStack_40);
  *(undefined4 *)(param_1 + 0x60) = 0xffffffff;
  FUN_0030f7e0(auStack_40);
  FUN_0030f7cc(auStack_68,"Invalid");
  FUN_003e9544(param_1,0xffffffff,auStack_68);
  FUN_0030f7e0(auStack_68);
  FUN_0030f7cc(auStack_90,"Linear");
  FUN_003e9544(param_1,0,auStack_90);
  FUN_0030f7e0(auStack_90);
  FUN_0030f7cc(auStack_b8,&DAT_00470ab1);
  FUN_003e9544(param_1,1,auStack_b8);
  FUN_0030f7e0(auStack_b8);
  FUN_0030f7cc(auStack_e0,"SCurve");
  FUN_003e9544(param_1,2,auStack_e0);
  FUN_0030f7e0(auStack_e0);
  FUN_0030f7cc(auStack_108,&DAT_00470abc);
  FUN_003e9544(param_1,3,auStack_108);
  FUN_0030f7e0(auStack_108);
  FUN_0030f7cc(auStack_130,"EaseOutEaseIn");
  FUN_003e9544(param_1,4,auStack_130);
  FUN_0030f7e0(auStack_130);
  FUN_0030f7cc(auStack_158,"EaseOutHardIn");
  FUN_003e9544(param_1,5,auStack_158);
  FUN_0030f7e0(auStack_158);
  FUN_0030f7cc(auStack_180,"EaseOutLinearIn");
  FUN_003e9544(param_1,6,auStack_180);
  FUN_0030f7e0(auStack_180);
  FUN_0030f7cc(auStack_1a8,"HardOutEaseIn");
  FUN_003e9544(param_1,7,auStack_1a8);
  FUN_0030f7e0(auStack_1a8);
  FUN_0030f7cc(auStack_1d0,"LinearOutEaseIn");
  FUN_003e9544(param_1,8,auStack_1d0);
  FUN_0030f7e0(auStack_1d0);
  FUN_0030f7cc(auStack_1f8,"EaseInSine");
  FUN_003e9544(param_1,9,auStack_1f8);
  FUN_0030f7e0(auStack_1f8);
  FUN_0030f7cc(auStack_220,"EaseInCubic");
  FUN_003e9544(param_1,10,auStack_220);
  FUN_0030f7e0(auStack_220);
  FUN_0030f7cc(auStack_248,"EaseInQuint");
  FUN_003e9544(param_1,0xb,auStack_248);
  FUN_0030f7e0(auStack_248);
  FUN_0030f7cc(auStack_270,"EaseInCirc");
  FUN_003e9544(param_1,0xc,auStack_270);
  FUN_0030f7e0(auStack_270);
  FUN_0030f7cc(auStack_298,"EaseInBack");
  FUN_003e9544(param_1,0xd,auStack_298);
  FUN_0030f7e0(auStack_298);
  FUN_0030f7cc(auStack_2c0,"EaseInQuad");
  FUN_003e9544(param_1,0xe,auStack_2c0);
  FUN_0030f7e0(auStack_2c0);
  FUN_0030f7cc(auStack_2e8,"EaseInQuart");
  FUN_003e9544(param_1,0xf,auStack_2e8);
  FUN_0030f7e0(auStack_2e8);
  FUN_0030f7cc(auStack_310,"EaseInExpo");
  FUN_003e9544(param_1,0x10,auStack_310);
  FUN_0030f7e0(auStack_310);
  FUN_0030f7cc(auStack_338,"EaseInElastic");
  FUN_003e9544(param_1,0x11,auStack_338);
  FUN_0030f7e0(auStack_338);
  FUN_0030f7cc(auStack_360,"EaseInBounce");
  FUN_003e9544(param_1,0x12,auStack_360);
  FUN_0030f7e0(auStack_360);
  FUN_0030f7cc(auStack_388,"EaseOutSine");
  FUN_003e9544(param_1,0x13,auStack_388);
  FUN_0030f7e0(auStack_388);
  FUN_0030f7cc(auStack_3b0,"EaseOutCubic");
  FUN_003e9544(param_1,0x14,auStack_3b0);
  FUN_0030f7e0(auStack_3b0);
  FUN_0030f7cc(auStack_3d8,"EaseOutQuint");
  FUN_003e9544(param_1,0x15,auStack_3d8);
  FUN_0030f7e0(auStack_3d8);
  FUN_0030f7cc(auStack_400,"EaseOutCirc");
  FUN_003e9544(param_1,0x16,auStack_400);
  FUN_0030f7e0(auStack_400);
  FUN_0030f7cc(auStack_428,"EaseOutBack");
  FUN_003e9544(param_1,0x17,auStack_428);
  FUN_0030f7e0(auStack_428);
  FUN_0030f7cc(auStack_450,"EaseOutQuad");
  FUN_003e9544(param_1,0x18,auStack_450);
  FUN_0030f7e0(auStack_450);
  FUN_0030f7cc(auStack_478,"EaseOutQuart");
  FUN_003e9544(param_1,0x19,auStack_478);
  FUN_0030f7e0(auStack_478);
  FUN_0030f7cc(auStack_4a0,"EaseOutExpo");
  FUN_003e9544(param_1,0x1a,auStack_4a0);
  FUN_0030f7e0(auStack_4a0);
  FUN_0030f7cc(auStack_4c8,"EaseOutElastic");
  FUN_003e9544(param_1,0x1b,auStack_4c8);
  FUN_0030f7e0(auStack_4c8);
  FUN_0030f7cc(auStack_4f0,"EaseOutBounce");
  FUN_003e9544(param_1,0x1c,auStack_4f0);
  FUN_0030f7e0(auStack_4f0);
  FUN_0030f7cc(auStack_518,"EaseInOutSine");
  FUN_003e9544(param_1,0x1d,auStack_518);
  FUN_0030f7e0(auStack_518);
  FUN_0030f7cc(auStack_540,"EaseInOutCubic");
  FUN_003e9544(param_1,0x1e,auStack_540);
  FUN_0030f7e0(auStack_540);
  FUN_0030f7cc(auStack_568,"EaseInOutQuint");
  FUN_003e9544(param_1,0x1f,auStack_568);
  FUN_0030f7e0(auStack_568);
  FUN_0030f7cc(auStack_590,"EaseInOutCirc");
  FUN_003e9544(param_1,0x20,auStack_590);
  FUN_0030f7e0(auStack_590);
  FUN_0030f7cc(auStack_5b8,"EaseInOutBack");
  FUN_003e9544(param_1,0x21,auStack_5b8);
  FUN_0030f7e0(auStack_5b8);
  FUN_0030f7cc(auStack_5e0,"EaseInOutQuad");
  FUN_003e9544(param_1,0x22,auStack_5e0);
  FUN_0030f7e0(auStack_5e0);
  FUN_0030f7cc(auStack_608,"EaseInOutQuart");
  FUN_003e9544(param_1,0x23,auStack_608);
  FUN_0030f7e0(auStack_608);
  FUN_0030f7cc(auStack_630,"EaseInOutExpo");
  FUN_003e9544(param_1,0x24,auStack_630);
  FUN_0030f7e0(auStack_630);
  FUN_0030f7cc(auStack_658,"EaseInOutElastic");
  FUN_003e9544(param_1,0x25,auStack_658);
  FUN_0030f7e0(auStack_658);
  FUN_0030f7cc(auStack_680,"EaseInOutBounce");
  FUN_003e9544(param_1,0x26,auStack_680);
  FUN_0030f7e0(auStack_680);
  if (*(int *)puVar2 != iStack_18) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail(*(int *)puVar2);
  }
  return;
}


```

## FUN_003e8394 — 003e8ef0

- 函数名: FUN_003e8ef0
- 函数体: 1619 字节
- 调用者数: 1 / 被调用者数: 7

```c

void FUN_003e8ef0(int param_1)

{
  undefined4 *puVar1;
  undefined *puVar2;
  int iVar3;
  int iVar4;
  undefined4 uVar5;
  undefined4 *puVar6;
  undefined4 extraout_s1;
  undefined8 uVar7;
  undefined1 auStack_680 [40];
  undefined1 auStack_658 [40];
  undefined1 auStack_630 [40];
  undefined1 auStack_608 [40];
  undefined1 auStack_5e0 [40];
  undefined1 auStack_5b8 [40];
  undefined1 auStack_590 [40];
  undefined1 auStack_568 [40];
  undefined1 auStack_540 [40];
  undefined1 auStack_518 [40];
  undefined1 auStack_4f0 [40];
  undefined1 auStack_4c8 [40];
  undefined1 auStack_4a0 [40];
  undefined1 auStack_478 [40];
  undefined1 auStack_450 [40];
  undefined1 auStack_428 [40];
  undefined1 auStack_400 [40];
  undefined1 auStack_3d8 [40];
  undefined1 auStack_3b0 [40];
  undefined1 auStack_388 [40];
  undefined1 auStack_360 [40];
  undefined1 auStack_338 [40];
  undefined1 auStack_310 [40];
  undefined1 auStack_2e8 [40];
  undefined1 auStack_2c0 [40];
  undefined1 auStack_298 [40];
  undefined1 auStack_270 [40];
  undefined1 auStack_248 [40];
  undefined1 auStack_220 [40];
  undefined1 auStack_1f8 [40];
  undefined1 auStack_1d0 [40];
  undefined1 auStack_1a8 [40];
  undefined1 auStack_180 [40];
  undefined1 auStack_158 [40];
  undefined1 auStack_130 [40];
  undefined1 auStack_108 [40];
  undefined1 auStack_e0 [40];
  undefined1 auStack_b8 [40];
  undefined1 auStack_90 [40];
  undefined1 auStack_68 [40];
  undefined1 auStack_40 [40];
  int iStack_18;
  
  puVar2 = PTR____stack_chk_guard_004d9044;
  iStack_18 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_0030f7cc(auStack_40,"Invalid");
  *(undefined4 *)(param_1 + 8) = 0;
  puVar6 = (undefined4 *)&UNK_0048cd04;
  *(undefined4 *)(param_1 + 0xc) = 0;
  *(undefined4 *)(param_1 + 0x10) = 0;
  *(undefined4 *)(param_1 + 0x14) = 0;
  puVar1 = (undefined4 *)(param_1 + 4);
  *puVar1 = 0;
  *(undefined4 **)(param_1 + 0xc) = puVar1;
  *(undefined4 **)(param_1 + 0x10) = puVar1;
  *(undefined4 *)(param_1 + 0x24) = 0;
  *(undefined4 *)(param_1 + 0x28) = 0;
  *(undefined4 *)(param_1 + 0x2c) = 0x3f800000;
  *(undefined4 *)(param_1 + 0x30) = 0x40000000;
  *(undefined4 *)(param_1 + 0x34) = 0;
  iVar4 = 0x100;
  while (iVar3 = iVar4, 0 < iVar3) {
    iVar4 = iVar3 >> 1;
    if ((uint)puVar6[iVar4] < 10) {
      puVar6 = puVar6 + iVar4 + 1;
      iVar4 = (iVar3 + -1) - iVar4;
    }
  }
  uVar7 = FixedToFP(CONCAT44(extraout_s1,*puVar6),0,1,0,0x20);
  uVar5 = _ceilf((int)uVar7);
  uVar7 = FPToFixed(CONCAT44(uVar5,uVar5),0,1,3,0x20);
  *(int *)(param_1 + 0x34) = (int)uVar7;
  *(undefined4 *)(param_1 + 0x24) = *puVar6;
  uVar5 = FUN_003e988c((int)uVar7,param_1 + 0x18);
  *(undefined4 *)(param_1 + 0x20) = uVar5;
  FUN_0030f870(param_1 + 0x38,auStack_40);
  *(undefined4 *)(param_1 + 0x60) = 0xffffffff;
  FUN_0030f7e0(auStack_40);
  FUN_0030f7cc(auStack_68,"Invalid");
  FUN_003e9544(param_1,0xffffffff,auStack_68);
  FUN_0030f7e0(auStack_68);
  FUN_0030f7cc(auStack_90,"Linear");
  FUN_003e9544(param_1,0,auStack_90);
  FUN_0030f7e0(auStack_90);
  FUN_0030f7cc(auStack_b8,&DAT_00470ab1);
  FUN_003e9544(param_1,1,auStack_b8);
  FUN_0030f7e0(auStack_b8);
  FUN_0030f7cc(auStack_e0,"SCurve");
  FUN_003e9544(param_1,2,auStack_e0);
  FUN_0030f7e0(auStack_e0);
  FUN_0030f7cc(auStack_108,&DAT_00470abc);
  FUN_003e9544(param_1,3,auStack_108);
  FUN_0030f7e0(auStack_108);
  FUN_0030f7cc(auStack_130,"EaseOutEaseIn");
  FUN_003e9544(param_1,4,auStack_130);
  FUN_0030f7e0(auStack_130);
  FUN_0030f7cc(auStack_158,"EaseOutHardIn");
  FUN_003e9544(param_1,5,auStack_158);
  FUN_0030f7e0(auStack_158);
  FUN_0030f7cc(auStack_180,"EaseOutLinearIn");
  FUN_003e9544(param_1,6,auStack_180);
  FUN_0030f7e0(auStack_180);
  FUN_0030f7cc(auStack_1a8,"HardOutEaseIn");
  FUN_003e9544(param_1,7,auStack_1a8);
  FUN_0030f7e0(auStack_1a8);
  FUN_0030f7cc(auStack_1d0,"LinearOutEaseIn");
  FUN_003e9544(param_1,8,auStack_1d0);
  FUN_0030f7e0(auStack_1d0);
  FUN_0030f7cc(auStack_1f8,"EaseInSine");
  FUN_003e9544(param_1,9,auStack_1f8);
  FUN_0030f7e0(auStack_1f8);
  FUN_0030f7cc(auStack_220,"EaseInCubic");
  FUN_003e9544(param_1,10,auStack_220);
  FUN_0030f7e0(auStack_220);
  FUN_0030f7cc(auStack_248,"EaseInQuint");
  FUN_003e9544(param_1,0xb,auStack_248);
  FUN_0030f7e0(auStack_248);
  FUN_0030f7cc(auStack_270,"EaseInCirc");
  FUN_003e9544(param_1,0xc,auStack_270);
  FUN_0030f7e0(auStack_270);
  FUN_0030f7cc(auStack_298,"EaseInBack");
  FUN_003e9544(param_1,0xd,auStack_298);
  FUN_0030f7e0(auStack_298);
  FUN_0030f7cc(auStack_2c0,"EaseInQuad");
  FUN_003e9544(param_1,0xe,auStack_2c0);
  FUN_0030f7e0(auStack_2c0);
  FUN_0030f7cc(auStack_2e8,"EaseInQuart");
  FUN_003e9544(param_1,0xf,auStack_2e8);
  FUN_0030f7e0(auStack_2e8);
  FUN_0030f7cc(auStack_310,"EaseInExpo");
  FUN_003e9544(param_1,0x10,auStack_310);
  FUN_0030f7e0(auStack_310);
  FUN_0030f7cc(auStack_338,"EaseInElastic");
  FUN_003e9544(param_1,0x11,auStack_338);
  FUN_0030f7e0(auStack_338);
  FUN_0030f7cc(auStack_360,"EaseInBounce");
  FUN_003e9544(param_1,0x12,auStack_360);
  FUN_0030f7e0(auStack_360);
  FUN_0030f7cc(auStack_388,"EaseOutSine");
  FUN_003e9544(param_1,0x13,auStack_388);
  FUN_0030f7e0(auStack_388);
  FUN_0030f7cc(auStack_3b0,"EaseOutCubic");
  FUN_003e9544(param_1,0x14,auStack_3b0);
  FUN_0030f7e0(auStack_3b0);
  FUN_0030f7cc(auStack_3d8,"EaseOutQuint");
  FUN_003e9544(param_1,0x15,auStack_3d8);
  FUN_0030f7e0(auStack_3d8);
  FUN_0030f7cc(auStack_400,"EaseOutCirc");
  FUN_003e9544(param_1,0x16,auStack_400);
  FUN_0030f7e0(auStack_400);
  FUN_0030f7cc(auStack_428,"EaseOutBack");
  FUN_003e9544(param_1,0x17,auStack_428);
  FUN_0030f7e0(auStack_428);
  FUN_0030f7cc(auStack_450,"EaseOutQuad");
  FUN_003e9544(param_1,0x18,auStack_450);
  FUN_0030f7e0(auStack_450);
  FUN_0030f7cc(auStack_478,"EaseOutQuart");
  FUN_003e9544(param_1,0x19,auStack_478);
  FUN_0030f7e0(auStack_478);
  FUN_0030f7cc(auStack_4a0,"EaseOutExpo");
  FUN_003e9544(param_1,0x1a,auStack_4a0);
  FUN_0030f7e0(auStack_4a0);
  FUN_0030f7cc(auStack_4c8,"EaseOutElastic");
  FUN_003e9544(param_1,0x1b,auStack_4c8);
  FUN_0030f7e0(auStack_4c8);
  FUN_0030f7cc(auStack_4f0,"EaseOutBounce");
  FUN_003e9544(param_1,0x1c,auStack_4f0);
  FUN_0030f7e0(auStack_4f0);
  FUN_0030f7cc(auStack_518,"EaseInOutSine");
  FUN_003e9544(param_1,0x1d,auStack_518);
  FUN_0030f7e0(auStack_518);
  FUN_0030f7cc(auStack_540,"EaseInOutCubic");
  FUN_003e9544(param_1,0x1e,auStack_540);
  FUN_0030f7e0(auStack_540);
  FUN_0030f7cc(auStack_568,"EaseInOutQuint");
  FUN_003e9544(param_1,0x1f,auStack_568);
  FUN_0030f7e0(auStack_568);
  FUN_0030f7cc(auStack_590,"EaseInOutCirc");
  FUN_003e9544(param_1,0x20,auStack_590);
  FUN_0030f7e0(auStack_590);
  FUN_0030f7cc(auStack_5b8,"EaseInOutBack");
  FUN_003e9544(param_1,0x21,auStack_5b8);
  FUN_0030f7e0(auStack_5b8);
  FUN_0030f7cc(auStack_5e0,"EaseInOutQuad");
  FUN_003e9544(param_1,0x22,auStack_5e0);
  FUN_0030f7e0(auStack_5e0);
  FUN_0030f7cc(auStack_608,"EaseInOutQuart");
  FUN_003e9544(param_1,0x23,auStack_608);
  FUN_0030f7e0(auStack_608);
  FUN_0030f7cc(auStack_630,"EaseInOutExpo");
  FUN_003e9544(param_1,0x24,auStack_630);
  FUN_0030f7e0(auStack_630);
  FUN_0030f7cc(auStack_658,"EaseInOutElastic");
  FUN_003e9544(param_1,0x25,auStack_658);
  FUN_0030f7e0(auStack_658);
  FUN_0030f7cc(auStack_680,"EaseInOutBounce");
  FUN_003e9544(param_1,0x26,auStack_680);
  FUN_0030f7e0(auStack_680);
  if (*(int *)puVar2 != iStack_18) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail(*(int *)puVar2);
  }
  return;
}


```

## FUN_003e83b4 — 003e8ef0

- 函数名: FUN_003e8ef0
- 函数体: 1619 字节
- 调用者数: 1 / 被调用者数: 7

```c

void FUN_003e8ef0(int param_1)

{
  undefined4 *puVar1;
  undefined *puVar2;
  int iVar3;
  int iVar4;
  undefined4 uVar5;
  undefined4 *puVar6;
  undefined4 extraout_s1;
  undefined8 uVar7;
  undefined1 auStack_680 [40];
  undefined1 auStack_658 [40];
  undefined1 auStack_630 [40];
  undefined1 auStack_608 [40];
  undefined1 auStack_5e0 [40];
  undefined1 auStack_5b8 [40];
  undefined1 auStack_590 [40];
  undefined1 auStack_568 [40];
  undefined1 auStack_540 [40];
  undefined1 auStack_518 [40];
  undefined1 auStack_4f0 [40];
  undefined1 auStack_4c8 [40];
  undefined1 auStack_4a0 [40];
  undefined1 auStack_478 [40];
  undefined1 auStack_450 [40];
  undefined1 auStack_428 [40];
  undefined1 auStack_400 [40];
  undefined1 auStack_3d8 [40];
  undefined1 auStack_3b0 [40];
  undefined1 auStack_388 [40];
  undefined1 auStack_360 [40];
  undefined1 auStack_338 [40];
  undefined1 auStack_310 [40];
  undefined1 auStack_2e8 [40];
  undefined1 auStack_2c0 [40];
  undefined1 auStack_298 [40];
  undefined1 auStack_270 [40];
  undefined1 auStack_248 [40];
  undefined1 auStack_220 [40];
  undefined1 auStack_1f8 [40];
  undefined1 auStack_1d0 [40];
  undefined1 auStack_1a8 [40];
  undefined1 auStack_180 [40];
  undefined1 auStack_158 [40];
  undefined1 auStack_130 [40];
  undefined1 auStack_108 [40];
  undefined1 auStack_e0 [40];
  undefined1 auStack_b8 [40];
  undefined1 auStack_90 [40];
  undefined1 auStack_68 [40];
  undefined1 auStack_40 [40];
  int iStack_18;
  
  puVar2 = PTR____stack_chk_guard_004d9044;
  iStack_18 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_0030f7cc(auStack_40,"Invalid");
  *(undefined4 *)(param_1 + 8) = 0;
  puVar6 = (undefined4 *)&UNK_0048cd04;
  *(undefined4 *)(param_1 + 0xc) = 0;
  *(undefined4 *)(param_1 + 0x10) = 0;
  *(undefined4 *)(param_1 + 0x14) = 0;
  puVar1 = (undefined4 *)(param_1 + 4);
  *puVar1 = 0;
  *(undefined4 **)(param_1 + 0xc) = puVar1;
  *(undefined4 **)(param_1 + 0x10) = puVar1;
  *(undefined4 *)(param_1 + 0x24) = 0;
  *(undefined4 *)(param_1 + 0x28) = 0;
  *(undefined4 *)(param_1 + 0x2c) = 0x3f800000;
  *(undefined4 *)(param_1 + 0x30) = 0x40000000;
  *(undefined4 *)(param_1 + 0x34) = 0;
  iVar4 = 0x100;
  while (iVar3 = iVar4, 0 < iVar3) {
    iVar4 = iVar3 >> 1;
    if ((uint)puVar6[iVar4] < 10) {
      puVar6 = puVar6 + iVar4 + 1;
      iVar4 = (iVar3 + -1) - iVar4;
    }
  }
  uVar7 = FixedToFP(CONCAT44(extraout_s1,*puVar6),0,1,0,0x20);
  uVar5 = _ceilf((int)uVar7);
  uVar7 = FPToFixed(CONCAT44(uVar5,uVar5),0,1,3,0x20);
  *(int *)(param_1 + 0x34) = (int)uVar7;
  *(undefined4 *)(param_1 + 0x24) = *puVar6;
  uVar5 = FUN_003e988c((int)uVar7,param_1 + 0x18);
  *(undefined4 *)(param_1 + 0x20) = uVar5;
  FUN_0030f870(param_1 + 0x38,auStack_40);
  *(undefined4 *)(param_1 + 0x60) = 0xffffffff;
  FUN_0030f7e0(auStack_40);
  FUN_0030f7cc(auStack_68,"Invalid");
  FUN_003e9544(param_1,0xffffffff,auStack_68);
  FUN_0030f7e0(auStack_68);
  FUN_0030f7cc(auStack_90,"Linear");
  FUN_003e9544(param_1,0,auStack_90);
  FUN_0030f7e0(auStack_90);
  FUN_0030f7cc(auStack_b8,&DAT_00470ab1);
  FUN_003e9544(param_1,1,auStack_b8);
  FUN_0030f7e0(auStack_b8);
  FUN_0030f7cc(auStack_e0,"SCurve");
  FUN_003e9544(param_1,2,auStack_e0);
  FUN_0030f7e0(auStack_e0);
  FUN_0030f7cc(auStack_108,&DAT_00470abc);
  FUN_003e9544(param_1,3,auStack_108);
  FUN_0030f7e0(auStack_108);
  FUN_0030f7cc(auStack_130,"EaseOutEaseIn");
  FUN_003e9544(param_1,4,auStack_130);
  FUN_0030f7e0(auStack_130);
  FUN_0030f7cc(auStack_158,"EaseOutHardIn");
  FUN_003e9544(param_1,5,auStack_158);
  FUN_0030f7e0(auStack_158);
  FUN_0030f7cc(auStack_180,"EaseOutLinearIn");
  FUN_003e9544(param_1,6,auStack_180);
  FUN_0030f7e0(auStack_180);
  FUN_0030f7cc(auStack_1a8,"HardOutEaseIn");
  FUN_003e9544(param_1,7,auStack_1a8);
  FUN_0030f7e0(auStack_1a8);
  FUN_0030f7cc(auStack_1d0,"LinearOutEaseIn");
  FUN_003e9544(param_1,8,auStack_1d0);
  FUN_0030f7e0(auStack_1d0);
  FUN_0030f7cc(auStack_1f8,"EaseInSine");
  FUN_003e9544(param_1,9,auStack_1f8);
  FUN_0030f7e0(auStack_1f8);
  FUN_0030f7cc(auStack_220,"EaseInCubic");
  FUN_003e9544(param_1,10,auStack_220);
  FUN_0030f7e0(auStack_220);
  FUN_0030f7cc(auStack_248,"EaseInQuint");
  FUN_003e9544(param_1,0xb,auStack_248);
  FUN_0030f7e0(auStack_248);
  FUN_0030f7cc(auStack_270,"EaseInCirc");
  FUN_003e9544(param_1,0xc,auStack_270);
  FUN_0030f7e0(auStack_270);
  FUN_0030f7cc(auStack_298,"EaseInBack");
  FUN_003e9544(param_1,0xd,auStack_298);
  FUN_0030f7e0(auStack_298);
  FUN_0030f7cc(auStack_2c0,"EaseInQuad");
  FUN_003e9544(param_1,0xe,auStack_2c0);
  FUN_0030f7e0(auStack_2c0);
  FUN_0030f7cc(auStack_2e8,"EaseInQuart");
  FUN_003e9544(param_1,0xf,auStack_2e8);
  FUN_0030f7e0(auStack_2e8);
  FUN_0030f7cc(auStack_310,"EaseInExpo");
  FUN_003e9544(param_1,0x10,auStack_310);
  FUN_0030f7e0(auStack_310);
  FUN_0030f7cc(auStack_338,"EaseInElastic");
  FUN_003e9544(param_1,0x11,auStack_338);
  FUN_0030f7e0(auStack_338);
  FUN_0030f7cc(auStack_360,"EaseInBounce");
  FUN_003e9544(param_1,0x12,auStack_360);
  FUN_0030f7e0(auStack_360);
  FUN_0030f7cc(auStack_388,"EaseOutSine");
  FUN_003e9544(param_1,0x13,auStack_388);
  FUN_0030f7e0(auStack_388);
  FUN_0030f7cc(auStack_3b0,"EaseOutCubic");
  FUN_003e9544(param_1,0x14,auStack_3b0);
  FUN_0030f7e0(auStack_3b0);
  FUN_0030f7cc(auStack_3d8,"EaseOutQuint");
  FUN_003e9544(param_1,0x15,auStack_3d8);
  FUN_0030f7e0(auStack_3d8);
  FUN_0030f7cc(auStack_400,"EaseOutCirc");
  FUN_003e9544(param_1,0x16,auStack_400);
  FUN_0030f7e0(auStack_400);
  FUN_0030f7cc(auStack_428,"EaseOutBack");
  FUN_003e9544(param_1,0x17,auStack_428);
  FUN_0030f7e0(auStack_428);
  FUN_0030f7cc(auStack_450,"EaseOutQuad");
  FUN_003e9544(param_1,0x18,auStack_450);
  FUN_0030f7e0(auStack_450);
  FUN_0030f7cc(auStack_478,"EaseOutQuart");
  FUN_003e9544(param_1,0x19,auStack_478);
  FUN_0030f7e0(auStack_478);
  FUN_0030f7cc(auStack_4a0,"EaseOutExpo");
  FUN_003e9544(param_1,0x1a,auStack_4a0);
  FUN_0030f7e0(auStack_4a0);
  FUN_0030f7cc(auStack_4c8,"EaseOutElastic");
  FUN_003e9544(param_1,0x1b,auStack_4c8);
  FUN_0030f7e0(auStack_4c8);
  FUN_0030f7cc(auStack_4f0,"EaseOutBounce");
  FUN_003e9544(param_1,0x1c,auStack_4f0);
  FUN_0030f7e0(auStack_4f0);
  FUN_0030f7cc(auStack_518,"EaseInOutSine");
  FUN_003e9544(param_1,0x1d,auStack_518);
  FUN_0030f7e0(auStack_518);
  FUN_0030f7cc(auStack_540,"EaseInOutCubic");
  FUN_003e9544(param_1,0x1e,auStack_540);
  FUN_0030f7e0(auStack_540);
  FUN_0030f7cc(auStack_568,"EaseInOutQuint");
  FUN_003e9544(param_1,0x1f,auStack_568);
  FUN_0030f7e0(auStack_568);
  FUN_0030f7cc(auStack_590,"EaseInOutCirc");
  FUN_003e9544(param_1,0x20,auStack_590);
  FUN_0030f7e0(auStack_590);
  FUN_0030f7cc(auStack_5b8,"EaseInOutBack");
  FUN_003e9544(param_1,0x21,auStack_5b8);
  FUN_0030f7e0(auStack_5b8);
  FUN_0030f7cc(auStack_5e0,"EaseInOutQuad");
  FUN_003e9544(param_1,0x22,auStack_5e0);
  FUN_0030f7e0(auStack_5e0);
  FUN_0030f7cc(auStack_608,"EaseInOutQuart");
  FUN_003e9544(param_1,0x23,auStack_608);
  FUN_0030f7e0(auStack_608);
  FUN_0030f7cc(auStack_630,"EaseInOutExpo");
  FUN_003e9544(param_1,0x24,auStack_630);
  FUN_0030f7e0(auStack_630);
  FUN_0030f7cc(auStack_658,"EaseInOutElastic");
  FUN_003e9544(param_1,0x25,auStack_658);
  FUN_0030f7e0(auStack_658);
  FUN_0030f7cc(auStack_680,"EaseInOutBounce");
  FUN_003e9544(param_1,0x26,auStack_680);
  FUN_0030f7e0(auStack_680);
  if (*(int *)puVar2 != iStack_18) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail(*(int *)puVar2);
  }
  return;
}


```

## FUN_003e83e0 — 003e8ef0

- 函数名: FUN_003e8ef0
- 函数体: 1619 字节
- 调用者数: 1 / 被调用者数: 7

```c

void FUN_003e8ef0(int param_1)

{
  undefined4 *puVar1;
  undefined *puVar2;
  int iVar3;
  int iVar4;
  undefined4 uVar5;
  undefined4 *puVar6;
  undefined4 extraout_s1;
  undefined8 uVar7;
  undefined1 auStack_680 [40];
  undefined1 auStack_658 [40];
  undefined1 auStack_630 [40];
  undefined1 auStack_608 [40];
  undefined1 auStack_5e0 [40];
  undefined1 auStack_5b8 [40];
  undefined1 auStack_590 [40];
  undefined1 auStack_568 [40];
  undefined1 auStack_540 [40];
  undefined1 auStack_518 [40];
  undefined1 auStack_4f0 [40];
  undefined1 auStack_4c8 [40];
  undefined1 auStack_4a0 [40];
  undefined1 auStack_478 [40];
  undefined1 auStack_450 [40];
  undefined1 auStack_428 [40];
  undefined1 auStack_400 [40];
  undefined1 auStack_3d8 [40];
  undefined1 auStack_3b0 [40];
  undefined1 auStack_388 [40];
  undefined1 auStack_360 [40];
  undefined1 auStack_338 [40];
  undefined1 auStack_310 [40];
  undefined1 auStack_2e8 [40];
  undefined1 auStack_2c0 [40];
  undefined1 auStack_298 [40];
  undefined1 auStack_270 [40];
  undefined1 auStack_248 [40];
  undefined1 auStack_220 [40];
  undefined1 auStack_1f8 [40];
  undefined1 auStack_1d0 [40];
  undefined1 auStack_1a8 [40];
  undefined1 auStack_180 [40];
  undefined1 auStack_158 [40];
  undefined1 auStack_130 [40];
  undefined1 auStack_108 [40];
  undefined1 auStack_e0 [40];
  undefined1 auStack_b8 [40];
  undefined1 auStack_90 [40];
  undefined1 auStack_68 [40];
  undefined1 auStack_40 [40];
  int iStack_18;
  
  puVar2 = PTR____stack_chk_guard_004d9044;
  iStack_18 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_0030f7cc(auStack_40,"Invalid");
  *(undefined4 *)(param_1 + 8) = 0;
  puVar6 = (undefined4 *)&UNK_0048cd04;
  *(undefined4 *)(param_1 + 0xc) = 0;
  *(undefined4 *)(param_1 + 0x10) = 0;
  *(undefined4 *)(param_1 + 0x14) = 0;
  puVar1 = (undefined4 *)(param_1 + 4);
  *puVar1 = 0;
  *(undefined4 **)(param_1 + 0xc) = puVar1;
  *(undefined4 **)(param_1 + 0x10) = puVar1;
  *(undefined4 *)(param_1 + 0x24) = 0;
  *(undefined4 *)(param_1 + 0x28) = 0;
  *(undefined4 *)(param_1 + 0x2c) = 0x3f800000;
  *(undefined4 *)(param_1 + 0x30) = 0x40000000;
  *(undefined4 *)(param_1 + 0x34) = 0;
  iVar4 = 0x100;
  while (iVar3 = iVar4, 0 < iVar3) {
    iVar4 = iVar3 >> 1;
    if ((uint)puVar6[iVar4] < 10) {
      puVar6 = puVar6 + iVar4 + 1;
      iVar4 = (iVar3 + -1) - iVar4;
    }
  }
  uVar7 = FixedToFP(CONCAT44(extraout_s1,*puVar6),0,1,0,0x20);
  uVar5 = _ceilf((int)uVar7);
  uVar7 = FPToFixed(CONCAT44(uVar5,uVar5),0,1,3,0x20);
  *(int *)(param_1 + 0x34) = (int)uVar7;
  *(undefined4 *)(param_1 + 0x24) = *puVar6;
  uVar5 = FUN_003e988c((int)uVar7,param_1 + 0x18);
  *(undefined4 *)(param_1 + 0x20) = uVar5;
  FUN_0030f870(param_1 + 0x38,auStack_40);
  *(undefined4 *)(param_1 + 0x60) = 0xffffffff;
  FUN_0030f7e0(auStack_40);
  FUN_0030f7cc(auStack_68,"Invalid");
  FUN_003e9544(param_1,0xffffffff,auStack_68);
  FUN_0030f7e0(auStack_68);
  FUN_0030f7cc(auStack_90,"Linear");
  FUN_003e9544(param_1,0,auStack_90);
  FUN_0030f7e0(auStack_90);
  FUN_0030f7cc(auStack_b8,&DAT_00470ab1);
  FUN_003e9544(param_1,1,auStack_b8);
  FUN_0030f7e0(auStack_b8);
  FUN_0030f7cc(auStack_e0,"SCurve");
  FUN_003e9544(param_1,2,auStack_e0);
  FUN_0030f7e0(auStack_e0);
  FUN_0030f7cc(auStack_108,&DAT_00470abc);
  FUN_003e9544(param_1,3,auStack_108);
  FUN_0030f7e0(auStack_108);
  FUN_0030f7cc(auStack_130,"EaseOutEaseIn");
  FUN_003e9544(param_1,4,auStack_130);
  FUN_0030f7e0(auStack_130);
  FUN_0030f7cc(auStack_158,"EaseOutHardIn");
  FUN_003e9544(param_1,5,auStack_158);
  FUN_0030f7e0(auStack_158);
  FUN_0030f7cc(auStack_180,"EaseOutLinearIn");
  FUN_003e9544(param_1,6,auStack_180);
  FUN_0030f7e0(auStack_180);
  FUN_0030f7cc(auStack_1a8,"HardOutEaseIn");
  FUN_003e9544(param_1,7,auStack_1a8);
  FUN_0030f7e0(auStack_1a8);
  FUN_0030f7cc(auStack_1d0,"LinearOutEaseIn");
  FUN_003e9544(param_1,8,auStack_1d0);
  FUN_0030f7e0(auStack_1d0);
  FUN_0030f7cc(auStack_1f8,"EaseInSine");
  FUN_003e9544(param_1,9,auStack_1f8);
  FUN_0030f7e0(auStack_1f8);
  FUN_0030f7cc(auStack_220,"EaseInCubic");
  FUN_003e9544(param_1,10,auStack_220);
  FUN_0030f7e0(auStack_220);
  FUN_0030f7cc(auStack_248,"EaseInQuint");
  FUN_003e9544(param_1,0xb,auStack_248);
  FUN_0030f7e0(auStack_248);
  FUN_0030f7cc(auStack_270,"EaseInCirc");
  FUN_003e9544(param_1,0xc,auStack_270);
  FUN_0030f7e0(auStack_270);
  FUN_0030f7cc(auStack_298,"EaseInBack");
  FUN_003e9544(param_1,0xd,auStack_298);
  FUN_0030f7e0(auStack_298);
  FUN_0030f7cc(auStack_2c0,"EaseInQuad");
  FUN_003e9544(param_1,0xe,auStack_2c0);
  FUN_0030f7e0(auStack_2c0);
  FUN_0030f7cc(auStack_2e8,"EaseInQuart");
  FUN_003e9544(param_1,0xf,auStack_2e8);
  FUN_0030f7e0(auStack_2e8);
  FUN_0030f7cc(auStack_310,"EaseInExpo");
  FUN_003e9544(param_1,0x10,auStack_310);
  FUN_0030f7e0(auStack_310);
  FUN_0030f7cc(auStack_338,"EaseInElastic");
  FUN_003e9544(param_1,0x11,auStack_338);
  FUN_0030f7e0(auStack_338);
  FUN_0030f7cc(auStack_360,"EaseInBounce");
  FUN_003e9544(param_1,0x12,auStack_360);
  FUN_0030f7e0(auStack_360);
  FUN_0030f7cc(auStack_388,"EaseOutSine");
  FUN_003e9544(param_1,0x13,auStack_388);
  FUN_0030f7e0(auStack_388);
  FUN_0030f7cc(auStack_3b0,"EaseOutCubic");
  FUN_003e9544(param_1,0x14,auStack_3b0);
  FUN_0030f7e0(auStack_3b0);
  FUN_0030f7cc(auStack_3d8,"EaseOutQuint");
  FUN_003e9544(param_1,0x15,auStack_3d8);
  FUN_0030f7e0(auStack_3d8);
  FUN_0030f7cc(auStack_400,"EaseOutCirc");
  FUN_003e9544(param_1,0x16,auStack_400);
  FUN_0030f7e0(auStack_400);
  FUN_0030f7cc(auStack_428,"EaseOutBack");
  FUN_003e9544(param_1,0x17,auStack_428);
  FUN_0030f7e0(auStack_428);
  FUN_0030f7cc(auStack_450,"EaseOutQuad");
  FUN_003e9544(param_1,0x18,auStack_450);
  FUN_0030f7e0(auStack_450);
  FUN_0030f7cc(auStack_478,"EaseOutQuart");
  FUN_003e9544(param_1,0x19,auStack_478);
  FUN_0030f7e0(auStack_478);
  FUN_0030f7cc(auStack_4a0,"EaseOutExpo");
  FUN_003e9544(param_1,0x1a,auStack_4a0);
  FUN_0030f7e0(auStack_4a0);
  FUN_0030f7cc(auStack_4c8,"EaseOutElastic");
  FUN_003e9544(param_1,0x1b,auStack_4c8);
  FUN_0030f7e0(auStack_4c8);
  FUN_0030f7cc(auStack_4f0,"EaseOutBounce");
  FUN_003e9544(param_1,0x1c,auStack_4f0);
  FUN_0030f7e0(auStack_4f0);
  FUN_0030f7cc(auStack_518,"EaseInOutSine");
  FUN_003e9544(param_1,0x1d,auStack_518);
  FUN_0030f7e0(auStack_518);
  FUN_0030f7cc(auStack_540,"EaseInOutCubic");
  FUN_003e9544(param_1,0x1e,auStack_540);
  FUN_0030f7e0(auStack_540);
  FUN_0030f7cc(auStack_568,"EaseInOutQuint");
  FUN_003e9544(param_1,0x1f,auStack_568);
  FUN_0030f7e0(auStack_568);
  FUN_0030f7cc(auStack_590,"EaseInOutCirc");
  FUN_003e9544(param_1,0x20,auStack_590);
  FUN_0030f7e0(auStack_590);
  FUN_0030f7cc(auStack_5b8,"EaseInOutBack");
  FUN_003e9544(param_1,0x21,auStack_5b8);
  FUN_0030f7e0(auStack_5b8);
  FUN_0030f7cc(auStack_5e0,"EaseInOutQuad");
  FUN_003e9544(param_1,0x22,auStack_5e0);
  FUN_0030f7e0(auStack_5e0);
  FUN_0030f7cc(auStack_608,"EaseInOutQuart");
  FUN_003e9544(param_1,0x23,auStack_608);
  FUN_0030f7e0(auStack_608);
  FUN_0030f7cc(auStack_630,"EaseInOutExpo");
  FUN_003e9544(param_1,0x24,auStack_630);
  FUN_0030f7e0(auStack_630);
  FUN_0030f7cc(auStack_658,"EaseInOutElastic");
  FUN_003e9544(param_1,0x25,auStack_658);
  FUN_0030f7e0(auStack_658);
  FUN_0030f7cc(auStack_680,"EaseInOutBounce");
  FUN_003e9544(param_1,0x26,auStack_680);
  FUN_0030f7e0(auStack_680);
  if (*(int *)puVar2 != iStack_18) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail(*(int *)puVar2);
  }
  return;
}


```

## FUN_003e8430 — 003e8ef0

- 函数名: FUN_003e8ef0
- 函数体: 1619 字节
- 调用者数: 1 / 被调用者数: 7

```c

void FUN_003e8ef0(int param_1)

{
  undefined4 *puVar1;
  undefined *puVar2;
  int iVar3;
  int iVar4;
  undefined4 uVar5;
  undefined4 *puVar6;
  undefined4 extraout_s1;
  undefined8 uVar7;
  undefined1 auStack_680 [40];
  undefined1 auStack_658 [40];
  undefined1 auStack_630 [40];
  undefined1 auStack_608 [40];
  undefined1 auStack_5e0 [40];
  undefined1 auStack_5b8 [40];
  undefined1 auStack_590 [40];
  undefined1 auStack_568 [40];
  undefined1 auStack_540 [40];
  undefined1 auStack_518 [40];
  undefined1 auStack_4f0 [40];
  undefined1 auStack_4c8 [40];
  undefined1 auStack_4a0 [40];
  undefined1 auStack_478 [40];
  undefined1 auStack_450 [40];
  undefined1 auStack_428 [40];
  undefined1 auStack_400 [40];
  undefined1 auStack_3d8 [40];
  undefined1 auStack_3b0 [40];
  undefined1 auStack_388 [40];
  undefined1 auStack_360 [40];
  undefined1 auStack_338 [40];
  undefined1 auStack_310 [40];
  undefined1 auStack_2e8 [40];
  undefined1 auStack_2c0 [40];
  undefined1 auStack_298 [40];
  undefined1 auStack_270 [40];
  undefined1 auStack_248 [40];
  undefined1 auStack_220 [40];
  undefined1 auStack_1f8 [40];
  undefined1 auStack_1d0 [40];
  undefined1 auStack_1a8 [40];
  undefined1 auStack_180 [40];
  undefined1 auStack_158 [40];
  undefined1 auStack_130 [40];
  undefined1 auStack_108 [40];
  undefined1 auStack_e0 [40];
  undefined1 auStack_b8 [40];
  undefined1 auStack_90 [40];
  undefined1 auStack_68 [40];
  undefined1 auStack_40 [40];
  int iStack_18;
  
  puVar2 = PTR____stack_chk_guard_004d9044;
  iStack_18 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_0030f7cc(auStack_40,"Invalid");
  *(undefined4 *)(param_1 + 8) = 0;
  puVar6 = (undefined4 *)&UNK_0048cd04;
  *(undefined4 *)(param_1 + 0xc) = 0;
  *(undefined4 *)(param_1 + 0x10) = 0;
  *(undefined4 *)(param_1 + 0x14) = 0;
  puVar1 = (undefined4 *)(param_1 + 4);
  *puVar1 = 0;
  *(undefined4 **)(param_1 + 0xc) = puVar1;
  *(undefined4 **)(param_1 + 0x10) = puVar1;
  *(undefined4 *)(param_1 + 0x24) = 0;
  *(undefined4 *)(param_1 + 0x28) = 0;
  *(undefined4 *)(param_1 + 0x2c) = 0x3f800000;
  *(undefined4 *)(param_1 + 0x30) = 0x40000000;
  *(undefined4 *)(param_1 + 0x34) = 0;
  iVar4 = 0x100;
  while (iVar3 = iVar4, 0 < iVar3) {
    iVar4 = iVar3 >> 1;
    if ((uint)puVar6[iVar4] < 10) {
      puVar6 = puVar6 + iVar4 + 1;
      iVar4 = (iVar3 + -1) - iVar4;
    }
  }
  uVar7 = FixedToFP(CONCAT44(extraout_s1,*puVar6),0,1,0,0x20);
  uVar5 = _ceilf((int)uVar7);
  uVar7 = FPToFixed(CONCAT44(uVar5,uVar5),0,1,3,0x20);
  *(int *)(param_1 + 0x34) = (int)uVar7;
  *(undefined4 *)(param_1 + 0x24) = *puVar6;
  uVar5 = FUN_003e988c((int)uVar7,param_1 + 0x18);
  *(undefined4 *)(param_1 + 0x20) = uVar5;
  FUN_0030f870(param_1 + 0x38,auStack_40);
  *(undefined4 *)(param_1 + 0x60) = 0xffffffff;
  FUN_0030f7e0(auStack_40);
  FUN_0030f7cc(auStack_68,"Invalid");
  FUN_003e9544(param_1,0xffffffff,auStack_68);
  FUN_0030f7e0(auStack_68);
  FUN_0030f7cc(auStack_90,"Linear");
  FUN_003e9544(param_1,0,auStack_90);
  FUN_0030f7e0(auStack_90);
  FUN_0030f7cc(auStack_b8,&DAT_00470ab1);
  FUN_003e9544(param_1,1,auStack_b8);
  FUN_0030f7e0(auStack_b8);
  FUN_0030f7cc(auStack_e0,"SCurve");
  FUN_003e9544(param_1,2,auStack_e0);
  FUN_0030f7e0(auStack_e0);
  FUN_0030f7cc(auStack_108,&DAT_00470abc);
  FUN_003e9544(param_1,3,auStack_108);
  FUN_0030f7e0(auStack_108);
  FUN_0030f7cc(auStack_130,"EaseOutEaseIn");
  FUN_003e9544(param_1,4,auStack_130);
  FUN_0030f7e0(auStack_130);
  FUN_0030f7cc(auStack_158,"EaseOutHardIn");
  FUN_003e9544(param_1,5,auStack_158);
  FUN_0030f7e0(auStack_158);
  FUN_0030f7cc(auStack_180,"EaseOutLinearIn");
  FUN_003e9544(param_1,6,auStack_180);
  FUN_0030f7e0(auStack_180);
  FUN_0030f7cc(auStack_1a8,"HardOutEaseIn");
  FUN_003e9544(param_1,7,auStack_1a8);
  FUN_0030f7e0(auStack_1a8);
  FUN_0030f7cc(auStack_1d0,"LinearOutEaseIn");
  FUN_003e9544(param_1,8,auStack_1d0);
  FUN_0030f7e0(auStack_1d0);
  FUN_0030f7cc(auStack_1f8,"EaseInSine");
  FUN_003e9544(param_1,9,auStack_1f8);
  FUN_0030f7e0(auStack_1f8);
  FUN_0030f7cc(auStack_220,"EaseInCubic");
  FUN_003e9544(param_1,10,auStack_220);
  FUN_0030f7e0(auStack_220);
  FUN_0030f7cc(auStack_248,"EaseInQuint");
  FUN_003e9544(param_1,0xb,auStack_248);
  FUN_0030f7e0(auStack_248);
  FUN_0030f7cc(auStack_270,"EaseInCirc");
  FUN_003e9544(param_1,0xc,auStack_270);
  FUN_0030f7e0(auStack_270);
  FUN_0030f7cc(auStack_298,"EaseInBack");
  FUN_003e9544(param_1,0xd,auStack_298);
  FUN_0030f7e0(auStack_298);
  FUN_0030f7cc(auStack_2c0,"EaseInQuad");
  FUN_003e9544(param_1,0xe,auStack_2c0);
  FUN_0030f7e0(auStack_2c0);
  FUN_0030f7cc(auStack_2e8,"EaseInQuart");
  FUN_003e9544(param_1,0xf,auStack_2e8);
  FUN_0030f7e0(auStack_2e8);
  FUN_0030f7cc(auStack_310,"EaseInExpo");
  FUN_003e9544(param_1,0x10,auStack_310);
  FUN_0030f7e0(auStack_310);
  FUN_0030f7cc(auStack_338,"EaseInElastic");
  FUN_003e9544(param_1,0x11,auStack_338);
  FUN_0030f7e0(auStack_338);
  FUN_0030f7cc(auStack_360,"EaseInBounce");
  FUN_003e9544(param_1,0x12,auStack_360);
  FUN_0030f7e0(auStack_360);
  FUN_0030f7cc(auStack_388,"EaseOutSine");
  FUN_003e9544(param_1,0x13,auStack_388);
  FUN_0030f7e0(auStack_388);
  FUN_0030f7cc(auStack_3b0,"EaseOutCubic");
  FUN_003e9544(param_1,0x14,auStack_3b0);
  FUN_0030f7e0(auStack_3b0);
  FUN_0030f7cc(auStack_3d8,"EaseOutQuint");
  FUN_003e9544(param_1,0x15,auStack_3d8);
  FUN_0030f7e0(auStack_3d8);
  FUN_0030f7cc(auStack_400,"EaseOutCirc");
  FUN_003e9544(param_1,0x16,auStack_400);
  FUN_0030f7e0(auStack_400);
  FUN_0030f7cc(auStack_428,"EaseOutBack");
  FUN_003e9544(param_1,0x17,auStack_428);
  FUN_0030f7e0(auStack_428);
  FUN_0030f7cc(auStack_450,"EaseOutQuad");
  FUN_003e9544(param_1,0x18,auStack_450);
  FUN_0030f7e0(auStack_450);
  FUN_0030f7cc(auStack_478,"EaseOutQuart");
  FUN_003e9544(param_1,0x19,auStack_478);
  FUN_0030f7e0(auStack_478);
  FUN_0030f7cc(auStack_4a0,"EaseOutExpo");
  FUN_003e9544(param_1,0x1a,auStack_4a0);
  FUN_0030f7e0(auStack_4a0);
  FUN_0030f7cc(auStack_4c8,"EaseOutElastic");
  FUN_003e9544(param_1,0x1b,auStack_4c8);
  FUN_0030f7e0(auStack_4c8);
  FUN_0030f7cc(auStack_4f0,"EaseOutBounce");
  FUN_003e9544(param_1,0x1c,auStack_4f0);
  FUN_0030f7e0(auStack_4f0);
  FUN_0030f7cc(auStack_518,"EaseInOutSine");
  FUN_003e9544(param_1,0x1d,auStack_518);
  FUN_0030f7e0(auStack_518);
  FUN_0030f7cc(auStack_540,"EaseInOutCubic");
  FUN_003e9544(param_1,0x1e,auStack_540);
  FUN_0030f7e0(auStack_540);
  FUN_0030f7cc(auStack_568,"EaseInOutQuint");
  FUN_003e9544(param_1,0x1f,auStack_568);
  FUN_0030f7e0(auStack_568);
  FUN_0030f7cc(auStack_590,"EaseInOutCirc");
  FUN_003e9544(param_1,0x20,auStack_590);
  FUN_0030f7e0(auStack_590);
  FUN_0030f7cc(auStack_5b8,"EaseInOutBack");
  FUN_003e9544(param_1,0x21,auStack_5b8);
  FUN_0030f7e0(auStack_5b8);
  FUN_0030f7cc(auStack_5e0,"EaseInOutQuad");
  FUN_003e9544(param_1,0x22,auStack_5e0);
  FUN_0030f7e0(auStack_5e0);
  FUN_0030f7cc(auStack_608,"EaseInOutQuart");
  FUN_003e9544(param_1,0x23,auStack_608);
  FUN_0030f7e0(auStack_608);
  FUN_0030f7cc(auStack_630,"EaseInOutExpo");
  FUN_003e9544(param_1,0x24,auStack_630);
  FUN_0030f7e0(auStack_630);
  FUN_0030f7cc(auStack_658,"EaseInOutElastic");
  FUN_003e9544(param_1,0x25,auStack_658);
  FUN_0030f7e0(auStack_658);
  FUN_0030f7cc(auStack_680,"EaseInOutBounce");
  FUN_003e9544(param_1,0x26,auStack_680);
  FUN_0030f7e0(auStack_680);
  if (*(int *)puVar2 != iStack_18) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail(*(int *)puVar2);
  }
  return;
}


```

## FUN_003e8444 — 003e8ef0

- 函数名: FUN_003e8ef0
- 函数体: 1619 字节
- 调用者数: 1 / 被调用者数: 7

```c

void FUN_003e8ef0(int param_1)

{
  undefined4 *puVar1;
  undefined *puVar2;
  int iVar3;
  int iVar4;
  undefined4 uVar5;
  undefined4 *puVar6;
  undefined4 extraout_s1;
  undefined8 uVar7;
  undefined1 auStack_680 [40];
  undefined1 auStack_658 [40];
  undefined1 auStack_630 [40];
  undefined1 auStack_608 [40];
  undefined1 auStack_5e0 [40];
  undefined1 auStack_5b8 [40];
  undefined1 auStack_590 [40];
  undefined1 auStack_568 [40];
  undefined1 auStack_540 [40];
  undefined1 auStack_518 [40];
  undefined1 auStack_4f0 [40];
  undefined1 auStack_4c8 [40];
  undefined1 auStack_4a0 [40];
  undefined1 auStack_478 [40];
  undefined1 auStack_450 [40];
  undefined1 auStack_428 [40];
  undefined1 auStack_400 [40];
  undefined1 auStack_3d8 [40];
  undefined1 auStack_3b0 [40];
  undefined1 auStack_388 [40];
  undefined1 auStack_360 [40];
  undefined1 auStack_338 [40];
  undefined1 auStack_310 [40];
  undefined1 auStack_2e8 [40];
  undefined1 auStack_2c0 [40];
  undefined1 auStack_298 [40];
  undefined1 auStack_270 [40];
  undefined1 auStack_248 [40];
  undefined1 auStack_220 [40];
  undefined1 auStack_1f8 [40];
  undefined1 auStack_1d0 [40];
  undefined1 auStack_1a8 [40];
  undefined1 auStack_180 [40];
  undefined1 auStack_158 [40];
  undefined1 auStack_130 [40];
  undefined1 auStack_108 [40];
  undefined1 auStack_e0 [40];
  undefined1 auStack_b8 [40];
  undefined1 auStack_90 [40];
  undefined1 auStack_68 [40];
  undefined1 auStack_40 [40];
  int iStack_18;
  
  puVar2 = PTR____stack_chk_guard_004d9044;
  iStack_18 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_0030f7cc(auStack_40,"Invalid");
  *(undefined4 *)(param_1 + 8) = 0;
  puVar6 = (undefined4 *)&UNK_0048cd04;
  *(undefined4 *)(param_1 + 0xc) = 0;
  *(undefined4 *)(param_1 + 0x10) = 0;
  *(undefined4 *)(param_1 + 0x14) = 0;
  puVar1 = (undefined4 *)(param_1 + 4);
  *puVar1 = 0;
  *(undefined4 **)(param_1 + 0xc) = puVar1;
  *(undefined4 **)(param_1 + 0x10) = puVar1;
  *(undefined4 *)(param_1 + 0x24) = 0;
  *(undefined4 *)(param_1 + 0x28) = 0;
  *(undefined4 *)(param_1 + 0x2c) = 0x3f800000;
  *(undefined4 *)(param_1 + 0x30) = 0x40000000;
  *(undefined4 *)(param_1 + 0x34) = 0;
  iVar4 = 0x100;
  while (iVar3 = iVar4, 0 < iVar3) {
    iVar4 = iVar3 >> 1;
    if ((uint)puVar6[iVar4] < 10) {
      puVar6 = puVar6 + iVar4 + 1;
      iVar4 = (iVar3 + -1) - iVar4;
    }
  }
  uVar7 = FixedToFP(CONCAT44(extraout_s1,*puVar6),0,1,0,0x20);
  uVar5 = _ceilf((int)uVar7);
  uVar7 = FPToFixed(CONCAT44(uVar5,uVar5),0,1,3,0x20);
  *(int *)(param_1 + 0x34) = (int)uVar7;
  *(undefined4 *)(param_1 + 0x24) = *puVar6;
  uVar5 = FUN_003e988c((int)uVar7,param_1 + 0x18);
  *(undefined4 *)(param_1 + 0x20) = uVar5;
  FUN_0030f870(param_1 + 0x38,auStack_40);
  *(undefined4 *)(param_1 + 0x60) = 0xffffffff;
  FUN_0030f7e0(auStack_40);
  FUN_0030f7cc(auStack_68,"Invalid");
  FUN_003e9544(param_1,0xffffffff,auStack_68);
  FUN_0030f7e0(auStack_68);
  FUN_0030f7cc(auStack_90,"Linear");
  FUN_003e9544(param_1,0,auStack_90);
  FUN_0030f7e0(auStack_90);
  FUN_0030f7cc(auStack_b8,&DAT_00470ab1);
  FUN_003e9544(param_1,1,auStack_b8);
  FUN_0030f7e0(auStack_b8);
  FUN_0030f7cc(auStack_e0,"SCurve");
  FUN_003e9544(param_1,2,auStack_e0);
  FUN_0030f7e0(auStack_e0);
  FUN_0030f7cc(auStack_108,&DAT_00470abc);
  FUN_003e9544(param_1,3,auStack_108);
  FUN_0030f7e0(auStack_108);
  FUN_0030f7cc(auStack_130,"EaseOutEaseIn");
  FUN_003e9544(param_1,4,auStack_130);
  FUN_0030f7e0(auStack_130);
  FUN_0030f7cc(auStack_158,"EaseOutHardIn");
  FUN_003e9544(param_1,5,auStack_158);
  FUN_0030f7e0(auStack_158);
  FUN_0030f7cc(auStack_180,"EaseOutLinearIn");
  FUN_003e9544(param_1,6,auStack_180);
  FUN_0030f7e0(auStack_180);
  FUN_0030f7cc(auStack_1a8,"HardOutEaseIn");
  FUN_003e9544(param_1,7,auStack_1a8);
  FUN_0030f7e0(auStack_1a8);
  FUN_0030f7cc(auStack_1d0,"LinearOutEaseIn");
  FUN_003e9544(param_1,8,auStack_1d0);
  FUN_0030f7e0(auStack_1d0);
  FUN_0030f7cc(auStack_1f8,"EaseInSine");
  FUN_003e9544(param_1,9,auStack_1f8);
  FUN_0030f7e0(auStack_1f8);
  FUN_0030f7cc(auStack_220,"EaseInCubic");
  FUN_003e9544(param_1,10,auStack_220);
  FUN_0030f7e0(auStack_220);
  FUN_0030f7cc(auStack_248,"EaseInQuint");
  FUN_003e9544(param_1,0xb,auStack_248);
  FUN_0030f7e0(auStack_248);
  FUN_0030f7cc(auStack_270,"EaseInCirc");
  FUN_003e9544(param_1,0xc,auStack_270);
  FUN_0030f7e0(auStack_270);
  FUN_0030f7cc(auStack_298,"EaseInBack");
  FUN_003e9544(param_1,0xd,auStack_298);
  FUN_0030f7e0(auStack_298);
  FUN_0030f7cc(auStack_2c0,"EaseInQuad");
  FUN_003e9544(param_1,0xe,auStack_2c0);
  FUN_0030f7e0(auStack_2c0);
  FUN_0030f7cc(auStack_2e8,"EaseInQuart");
  FUN_003e9544(param_1,0xf,auStack_2e8);
  FUN_0030f7e0(auStack_2e8);
  FUN_0030f7cc(auStack_310,"EaseInExpo");
  FUN_003e9544(param_1,0x10,auStack_310);
  FUN_0030f7e0(auStack_310);
  FUN_0030f7cc(auStack_338,"EaseInElastic");
  FUN_003e9544(param_1,0x11,auStack_338);
  FUN_0030f7e0(auStack_338);
  FUN_0030f7cc(auStack_360,"EaseInBounce");
  FUN_003e9544(param_1,0x12,auStack_360);
  FUN_0030f7e0(auStack_360);
  FUN_0030f7cc(auStack_388,"EaseOutSine");
  FUN_003e9544(param_1,0x13,auStack_388);
  FUN_0030f7e0(auStack_388);
  FUN_0030f7cc(auStack_3b0,"EaseOutCubic");
  FUN_003e9544(param_1,0x14,auStack_3b0);
  FUN_0030f7e0(auStack_3b0);
  FUN_0030f7cc(auStack_3d8,"EaseOutQuint");
  FUN_003e9544(param_1,0x15,auStack_3d8);
  FUN_0030f7e0(auStack_3d8);
  FUN_0030f7cc(auStack_400,"EaseOutCirc");
  FUN_003e9544(param_1,0x16,auStack_400);
  FUN_0030f7e0(auStack_400);
  FUN_0030f7cc(auStack_428,"EaseOutBack");
  FUN_003e9544(param_1,0x17,auStack_428);
  FUN_0030f7e0(auStack_428);
  FUN_0030f7cc(auStack_450,"EaseOutQuad");
  FUN_003e9544(param_1,0x18,auStack_450);
  FUN_0030f7e0(auStack_450);
  FUN_0030f7cc(auStack_478,"EaseOutQuart");
  FUN_003e9544(param_1,0x19,auStack_478);
  FUN_0030f7e0(auStack_478);
  FUN_0030f7cc(auStack_4a0,"EaseOutExpo");
  FUN_003e9544(param_1,0x1a,auStack_4a0);
  FUN_0030f7e0(auStack_4a0);
  FUN_0030f7cc(auStack_4c8,"EaseOutElastic");
  FUN_003e9544(param_1,0x1b,auStack_4c8);
  FUN_0030f7e0(auStack_4c8);
  FUN_0030f7cc(auStack_4f0,"EaseOutBounce");
  FUN_003e9544(param_1,0x1c,auStack_4f0);
  FUN_0030f7e0(auStack_4f0);
  FUN_0030f7cc(auStack_518,"EaseInOutSine");
  FUN_003e9544(param_1,0x1d,auStack_518);
  FUN_0030f7e0(auStack_518);
  FUN_0030f7cc(auStack_540,"EaseInOutCubic");
  FUN_003e9544(param_1,0x1e,auStack_540);
  FUN_0030f7e0(auStack_540);
  FUN_0030f7cc(auStack_568,"EaseInOutQuint");
  FUN_003e9544(param_1,0x1f,auStack_568);
  FUN_0030f7e0(auStack_568);
  FUN_0030f7cc(auStack_590,"EaseInOutCirc");
  FUN_003e9544(param_1,0x20,auStack_590);
  FUN_0030f7e0(auStack_590);
  FUN_0030f7cc(auStack_5b8,"EaseInOutBack");
  FUN_003e9544(param_1,0x21,auStack_5b8);
  FUN_0030f7e0(auStack_5b8);
  FUN_0030f7cc(auStack_5e0,"EaseInOutQuad");
  FUN_003e9544(param_1,0x22,auStack_5e0);
  FUN_0030f7e0(auStack_5e0);
  FUN_0030f7cc(auStack_608,"EaseInOutQuart");
  FUN_003e9544(param_1,0x23,auStack_608);
  FUN_0030f7e0(auStack_608);
  FUN_0030f7cc(auStack_630,"EaseInOutExpo");
  FUN_003e9544(param_1,0x24,auStack_630);
  FUN_0030f7e0(auStack_630);
  FUN_0030f7cc(auStack_658,"EaseInOutElastic");
  FUN_003e9544(param_1,0x25,auStack_658);
  FUN_0030f7e0(auStack_658);
  FUN_0030f7cc(auStack_680,"EaseInOutBounce");
  FUN_003e9544(param_1,0x26,auStack_680);
  FUN_0030f7e0(auStack_680);
  if (*(int *)puVar2 != iStack_18) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail(*(int *)puVar2);
  }
  return;
}


```

## FUN_003e8458 — 003e8ef0

- 函数名: FUN_003e8ef0
- 函数体: 1619 字节
- 调用者数: 1 / 被调用者数: 7

```c

void FUN_003e8ef0(int param_1)

{
  undefined4 *puVar1;
  undefined *puVar2;
  int iVar3;
  int iVar4;
  undefined4 uVar5;
  undefined4 *puVar6;
  undefined4 extraout_s1;
  undefined8 uVar7;
  undefined1 auStack_680 [40];
  undefined1 auStack_658 [40];
  undefined1 auStack_630 [40];
  undefined1 auStack_608 [40];
  undefined1 auStack_5e0 [40];
  undefined1 auStack_5b8 [40];
  undefined1 auStack_590 [40];
  undefined1 auStack_568 [40];
  undefined1 auStack_540 [40];
  undefined1 auStack_518 [40];
  undefined1 auStack_4f0 [40];
  undefined1 auStack_4c8 [40];
  undefined1 auStack_4a0 [40];
  undefined1 auStack_478 [40];
  undefined1 auStack_450 [40];
  undefined1 auStack_428 [40];
  undefined1 auStack_400 [40];
  undefined1 auStack_3d8 [40];
  undefined1 auStack_3b0 [40];
  undefined1 auStack_388 [40];
  undefined1 auStack_360 [40];
  undefined1 auStack_338 [40];
  undefined1 auStack_310 [40];
  undefined1 auStack_2e8 [40];
  undefined1 auStack_2c0 [40];
  undefined1 auStack_298 [40];
  undefined1 auStack_270 [40];
  undefined1 auStack_248 [40];
  undefined1 auStack_220 [40];
  undefined1 auStack_1f8 [40];
  undefined1 auStack_1d0 [40];
  undefined1 auStack_1a8 [40];
  undefined1 auStack_180 [40];
  undefined1 auStack_158 [40];
  undefined1 auStack_130 [40];
  undefined1 auStack_108 [40];
  undefined1 auStack_e0 [40];
  undefined1 auStack_b8 [40];
  undefined1 auStack_90 [40];
  undefined1 auStack_68 [40];
  undefined1 auStack_40 [40];
  int iStack_18;
  
  puVar2 = PTR____stack_chk_guard_004d9044;
  iStack_18 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_0030f7cc(auStack_40,"Invalid");
  *(undefined4 *)(param_1 + 8) = 0;
  puVar6 = (undefined4 *)&UNK_0048cd04;
  *(undefined4 *)(param_1 + 0xc) = 0;
  *(undefined4 *)(param_1 + 0x10) = 0;
  *(undefined4 *)(param_1 + 0x14) = 0;
  puVar1 = (undefined4 *)(param_1 + 4);
  *puVar1 = 0;
  *(undefined4 **)(param_1 + 0xc) = puVar1;
  *(undefined4 **)(param_1 + 0x10) = puVar1;
  *(undefined4 *)(param_1 + 0x24) = 0;
  *(undefined4 *)(param_1 + 0x28) = 0;
  *(undefined4 *)(param_1 + 0x2c) = 0x3f800000;
  *(undefined4 *)(param_1 + 0x30) = 0x40000000;
  *(undefined4 *)(param_1 + 0x34) = 0;
  iVar4 = 0x100;
  while (iVar3 = iVar4, 0 < iVar3) {
    iVar4 = iVar3 >> 1;
    if ((uint)puVar6[iVar4] < 10) {
      puVar6 = puVar6 + iVar4 + 1;
      iVar4 = (iVar3 + -1) - iVar4;
    }
  }
  uVar7 = FixedToFP(CONCAT44(extraout_s1,*puVar6),0,1,0,0x20);
  uVar5 = _ceilf((int)uVar7);
  uVar7 = FPToFixed(CONCAT44(uVar5,uVar5),0,1,3,0x20);
  *(int *)(param_1 + 0x34) = (int)uVar7;
  *(undefined4 *)(param_1 + 0x24) = *puVar6;
  uVar5 = FUN_003e988c((int)uVar7,param_1 + 0x18);
  *(undefined4 *)(param_1 + 0x20) = uVar5;
  FUN_0030f870(param_1 + 0x38,auStack_40);
  *(undefined4 *)(param_1 + 0x60) = 0xffffffff;
  FUN_0030f7e0(auStack_40);
  FUN_0030f7cc(auStack_68,"Invalid");
  FUN_003e9544(param_1,0xffffffff,auStack_68);
  FUN_0030f7e0(auStack_68);
  FUN_0030f7cc(auStack_90,"Linear");
  FUN_003e9544(param_1,0,auStack_90);
  FUN_0030f7e0(auStack_90);
  FUN_0030f7cc(auStack_b8,&DAT_00470ab1);
  FUN_003e9544(param_1,1,auStack_b8);
  FUN_0030f7e0(auStack_b8);
  FUN_0030f7cc(auStack_e0,"SCurve");
  FUN_003e9544(param_1,2,auStack_e0);
  FUN_0030f7e0(auStack_e0);
  FUN_0030f7cc(auStack_108,&DAT_00470abc);
  FUN_003e9544(param_1,3,auStack_108);
  FUN_0030f7e0(auStack_108);
  FUN_0030f7cc(auStack_130,"EaseOutEaseIn");
  FUN_003e9544(param_1,4,auStack_130);
  FUN_0030f7e0(auStack_130);
  FUN_0030f7cc(auStack_158,"EaseOutHardIn");
  FUN_003e9544(param_1,5,auStack_158);
  FUN_0030f7e0(auStack_158);
  FUN_0030f7cc(auStack_180,"EaseOutLinearIn");
  FUN_003e9544(param_1,6,auStack_180);
  FUN_0030f7e0(auStack_180);
  FUN_0030f7cc(auStack_1a8,"HardOutEaseIn");
  FUN_003e9544(param_1,7,auStack_1a8);
  FUN_0030f7e0(auStack_1a8);
  FUN_0030f7cc(auStack_1d0,"LinearOutEaseIn");
  FUN_003e9544(param_1,8,auStack_1d0);
  FUN_0030f7e0(auStack_1d0);
  FUN_0030f7cc(auStack_1f8,"EaseInSine");
  FUN_003e9544(param_1,9,auStack_1f8);
  FUN_0030f7e0(auStack_1f8);
  FUN_0030f7cc(auStack_220,"EaseInCubic");
  FUN_003e9544(param_1,10,auStack_220);
  FUN_0030f7e0(auStack_220);
  FUN_0030f7cc(auStack_248,"EaseInQuint");
  FUN_003e9544(param_1,0xb,auStack_248);
  FUN_0030f7e0(auStack_248);
  FUN_0030f7cc(auStack_270,"EaseInCirc");
  FUN_003e9544(param_1,0xc,auStack_270);
  FUN_0030f7e0(auStack_270);
  FUN_0030f7cc(auStack_298,"EaseInBack");
  FUN_003e9544(param_1,0xd,auStack_298);
  FUN_0030f7e0(auStack_298);
  FUN_0030f7cc(auStack_2c0,"EaseInQuad");
  FUN_003e9544(param_1,0xe,auStack_2c0);
  FUN_0030f7e0(auStack_2c0);
  FUN_0030f7cc(auStack_2e8,"EaseInQuart");
  FUN_003e9544(param_1,0xf,auStack_2e8);
  FUN_0030f7e0(auStack_2e8);
  FUN_0030f7cc(auStack_310,"EaseInExpo");
  FUN_003e9544(param_1,0x10,auStack_310);
  FUN_0030f7e0(auStack_310);
  FUN_0030f7cc(auStack_338,"EaseInElastic");
  FUN_003e9544(param_1,0x11,auStack_338);
  FUN_0030f7e0(auStack_338);
  FUN_0030f7cc(auStack_360,"EaseInBounce");
  FUN_003e9544(param_1,0x12,auStack_360);
  FUN_0030f7e0(auStack_360);
  FUN_0030f7cc(auStack_388,"EaseOutSine");
  FUN_003e9544(param_1,0x13,auStack_388);
  FUN_0030f7e0(auStack_388);
  FUN_0030f7cc(auStack_3b0,"EaseOutCubic");
  FUN_003e9544(param_1,0x14,auStack_3b0);
  FUN_0030f7e0(auStack_3b0);
  FUN_0030f7cc(auStack_3d8,"EaseOutQuint");
  FUN_003e9544(param_1,0x15,auStack_3d8);
  FUN_0030f7e0(auStack_3d8);
  FUN_0030f7cc(auStack_400,"EaseOutCirc");
  FUN_003e9544(param_1,0x16,auStack_400);
  FUN_0030f7e0(auStack_400);
  FUN_0030f7cc(auStack_428,"EaseOutBack");
  FUN_003e9544(param_1,0x17,auStack_428);
  FUN_0030f7e0(auStack_428);
  FUN_0030f7cc(auStack_450,"EaseOutQuad");
  FUN_003e9544(param_1,0x18,auStack_450);
  FUN_0030f7e0(auStack_450);
  FUN_0030f7cc(auStack_478,"EaseOutQuart");
  FUN_003e9544(param_1,0x19,auStack_478);
  FUN_0030f7e0(auStack_478);
  FUN_0030f7cc(auStack_4a0,"EaseOutExpo");
  FUN_003e9544(param_1,0x1a,auStack_4a0);
  FUN_0030f7e0(auStack_4a0);
  FUN_0030f7cc(auStack_4c8,"EaseOutElastic");
  FUN_003e9544(param_1,0x1b,auStack_4c8);
  FUN_0030f7e0(auStack_4c8);
  FUN_0030f7cc(auStack_4f0,"EaseOutBounce");
  FUN_003e9544(param_1,0x1c,auStack_4f0);
  FUN_0030f7e0(auStack_4f0);
  FUN_0030f7cc(auStack_518,"EaseInOutSine");
  FUN_003e9544(param_1,0x1d,auStack_518);
  FUN_0030f7e0(auStack_518);
  FUN_0030f7cc(auStack_540,"EaseInOutCubic");
  FUN_003e9544(param_1,0x1e,auStack_540);
  FUN_0030f7e0(auStack_540);
  FUN_0030f7cc(auStack_568,"EaseInOutQuint");
  FUN_003e9544(param_1,0x1f,auStack_568);
  FUN_0030f7e0(auStack_568);
  FUN_0030f7cc(auStack_590,"EaseInOutCirc");
  FUN_003e9544(param_1,0x20,auStack_590);
  FUN_0030f7e0(auStack_590);
  FUN_0030f7cc(auStack_5b8,"EaseInOutBack");
  FUN_003e9544(param_1,0x21,auStack_5b8);
  FUN_0030f7e0(auStack_5b8);
  FUN_0030f7cc(auStack_5e0,"EaseInOutQuad");
  FUN_003e9544(param_1,0x22,auStack_5e0);
  FUN_0030f7e0(auStack_5e0);
  FUN_0030f7cc(auStack_608,"EaseInOutQuart");
  FUN_003e9544(param_1,0x23,auStack_608);
  FUN_0030f7e0(auStack_608);
  FUN_0030f7cc(auStack_630,"EaseInOutExpo");
  FUN_003e9544(param_1,0x24,auStack_630);
  FUN_0030f7e0(auStack_630);
  FUN_0030f7cc(auStack_658,"EaseInOutElastic");
  FUN_003e9544(param_1,0x25,auStack_658);
  FUN_0030f7e0(auStack_658);
  FUN_0030f7cc(auStack_680,"EaseInOutBounce");
  FUN_003e9544(param_1,0x26,auStack_680);
  FUN_0030f7e0(auStack_680);
  if (*(int *)puVar2 != iStack_18) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail(*(int *)puVar2);
  }
  return;
}


```

## FUN_003e84ac — 003e8ef0

- 函数名: FUN_003e8ef0
- 函数体: 1619 字节
- 调用者数: 1 / 被调用者数: 7

```c

void FUN_003e8ef0(int param_1)

{
  undefined4 *puVar1;
  undefined *puVar2;
  int iVar3;
  int iVar4;
  undefined4 uVar5;
  undefined4 *puVar6;
  undefined4 extraout_s1;
  undefined8 uVar7;
  undefined1 auStack_680 [40];
  undefined1 auStack_658 [40];
  undefined1 auStack_630 [40];
  undefined1 auStack_608 [40];
  undefined1 auStack_5e0 [40];
  undefined1 auStack_5b8 [40];
  undefined1 auStack_590 [40];
  undefined1 auStack_568 [40];
  undefined1 auStack_540 [40];
  undefined1 auStack_518 [40];
  undefined1 auStack_4f0 [40];
  undefined1 auStack_4c8 [40];
  undefined1 auStack_4a0 [40];
  undefined1 auStack_478 [40];
  undefined1 auStack_450 [40];
  undefined1 auStack_428 [40];
  undefined1 auStack_400 [40];
  undefined1 auStack_3d8 [40];
  undefined1 auStack_3b0 [40];
  undefined1 auStack_388 [40];
  undefined1 auStack_360 [40];
  undefined1 auStack_338 [40];
  undefined1 auStack_310 [40];
  undefined1 auStack_2e8 [40];
  undefined1 auStack_2c0 [40];
  undefined1 auStack_298 [40];
  undefined1 auStack_270 [40];
  undefined1 auStack_248 [40];
  undefined1 auStack_220 [40];
  undefined1 auStack_1f8 [40];
  undefined1 auStack_1d0 [40];
  undefined1 auStack_1a8 [40];
  undefined1 auStack_180 [40];
  undefined1 auStack_158 [40];
  undefined1 auStack_130 [40];
  undefined1 auStack_108 [40];
  undefined1 auStack_e0 [40];
  undefined1 auStack_b8 [40];
  undefined1 auStack_90 [40];
  undefined1 auStack_68 [40];
  undefined1 auStack_40 [40];
  int iStack_18;
  
  puVar2 = PTR____stack_chk_guard_004d9044;
  iStack_18 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_0030f7cc(auStack_40,"Invalid");
  *(undefined4 *)(param_1 + 8) = 0;
  puVar6 = (undefined4 *)&UNK_0048cd04;
  *(undefined4 *)(param_1 + 0xc) = 0;
  *(undefined4 *)(param_1 + 0x10) = 0;
  *(undefined4 *)(param_1 + 0x14) = 0;
  puVar1 = (undefined4 *)(param_1 + 4);
  *puVar1 = 0;
  *(undefined4 **)(param_1 + 0xc) = puVar1;
  *(undefined4 **)(param_1 + 0x10) = puVar1;
  *(undefined4 *)(param_1 + 0x24) = 0;
  *(undefined4 *)(param_1 + 0x28) = 0;
  *(undefined4 *)(param_1 + 0x2c) = 0x3f800000;
  *(undefined4 *)(param_1 + 0x30) = 0x40000000;
  *(undefined4 *)(param_1 + 0x34) = 0;
  iVar4 = 0x100;
  while (iVar3 = iVar4, 0 < iVar3) {
    iVar4 = iVar3 >> 1;
    if ((uint)puVar6[iVar4] < 10) {
      puVar6 = puVar6 + iVar4 + 1;
      iVar4 = (iVar3 + -1) - iVar4;
    }
  }
  uVar7 = FixedToFP(CONCAT44(extraout_s1,*puVar6),0,1,0,0x20);
  uVar5 = _ceilf((int)uVar7);
  uVar7 = FPToFixed(CONCAT44(uVar5,uVar5),0,1,3,0x20);
  *(int *)(param_1 + 0x34) = (int)uVar7;
  *(undefined4 *)(param_1 + 0x24) = *puVar6;
  uVar5 = FUN_003e988c((int)uVar7,param_1 + 0x18);
  *(undefined4 *)(param_1 + 0x20) = uVar5;
  FUN_0030f870(param_1 + 0x38,auStack_40);
  *(undefined4 *)(param_1 + 0x60) = 0xffffffff;
  FUN_0030f7e0(auStack_40);
  FUN_0030f7cc(auStack_68,"Invalid");
  FUN_003e9544(param_1,0xffffffff,auStack_68);
  FUN_0030f7e0(auStack_68);
  FUN_0030f7cc(auStack_90,"Linear");
  FUN_003e9544(param_1,0,auStack_90);
  FUN_0030f7e0(auStack_90);
  FUN_0030f7cc(auStack_b8,&DAT_00470ab1);
  FUN_003e9544(param_1,1,auStack_b8);
  FUN_0030f7e0(auStack_b8);
  FUN_0030f7cc(auStack_e0,"SCurve");
  FUN_003e9544(param_1,2,auStack_e0);
  FUN_0030f7e0(auStack_e0);
  FUN_0030f7cc(auStack_108,&DAT_00470abc);
  FUN_003e9544(param_1,3,auStack_108);
  FUN_0030f7e0(auStack_108);
  FUN_0030f7cc(auStack_130,"EaseOutEaseIn");
  FUN_003e9544(param_1,4,auStack_130);
  FUN_0030f7e0(auStack_130);
  FUN_0030f7cc(auStack_158,"EaseOutHardIn");
  FUN_003e9544(param_1,5,auStack_158);
  FUN_0030f7e0(auStack_158);
  FUN_0030f7cc(auStack_180,"EaseOutLinearIn");
  FUN_003e9544(param_1,6,auStack_180);
  FUN_0030f7e0(auStack_180);
  FUN_0030f7cc(auStack_1a8,"HardOutEaseIn");
  FUN_003e9544(param_1,7,auStack_1a8);
  FUN_0030f7e0(auStack_1a8);
  FUN_0030f7cc(auStack_1d0,"LinearOutEaseIn");
  FUN_003e9544(param_1,8,auStack_1d0);
  FUN_0030f7e0(auStack_1d0);
  FUN_0030f7cc(auStack_1f8,"EaseInSine");
  FUN_003e9544(param_1,9,auStack_1f8);
  FUN_0030f7e0(auStack_1f8);
  FUN_0030f7cc(auStack_220,"EaseInCubic");
  FUN_003e9544(param_1,10,auStack_220);
  FUN_0030f7e0(auStack_220);
  FUN_0030f7cc(auStack_248,"EaseInQuint");
  FUN_003e9544(param_1,0xb,auStack_248);
  FUN_0030f7e0(auStack_248);
  FUN_0030f7cc(auStack_270,"EaseInCirc");
  FUN_003e9544(param_1,0xc,auStack_270);
  FUN_0030f7e0(auStack_270);
  FUN_0030f7cc(auStack_298,"EaseInBack");
  FUN_003e9544(param_1,0xd,auStack_298);
  FUN_0030f7e0(auStack_298);
  FUN_0030f7cc(auStack_2c0,"EaseInQuad");
  FUN_003e9544(param_1,0xe,auStack_2c0);
  FUN_0030f7e0(auStack_2c0);
  FUN_0030f7cc(auStack_2e8,"EaseInQuart");
  FUN_003e9544(param_1,0xf,auStack_2e8);
  FUN_0030f7e0(auStack_2e8);
  FUN_0030f7cc(auStack_310,"EaseInExpo");
  FUN_003e9544(param_1,0x10,auStack_310);
  FUN_0030f7e0(auStack_310);
  FUN_0030f7cc(auStack_338,"EaseInElastic");
  FUN_003e9544(param_1,0x11,auStack_338);
  FUN_0030f7e0(auStack_338);
  FUN_0030f7cc(auStack_360,"EaseInBounce");
  FUN_003e9544(param_1,0x12,auStack_360);
  FUN_0030f7e0(auStack_360);
  FUN_0030f7cc(auStack_388,"EaseOutSine");
  FUN_003e9544(param_1,0x13,auStack_388);
  FUN_0030f7e0(auStack_388);
  FUN_0030f7cc(auStack_3b0,"EaseOutCubic");
  FUN_003e9544(param_1,0x14,auStack_3b0);
  FUN_0030f7e0(auStack_3b0);
  FUN_0030f7cc(auStack_3d8,"EaseOutQuint");
  FUN_003e9544(param_1,0x15,auStack_3d8);
  FUN_0030f7e0(auStack_3d8);
  FUN_0030f7cc(auStack_400,"EaseOutCirc");
  FUN_003e9544(param_1,0x16,auStack_400);
  FUN_0030f7e0(auStack_400);
  FUN_0030f7cc(auStack_428,"EaseOutBack");
  FUN_003e9544(param_1,0x17,auStack_428);
  FUN_0030f7e0(auStack_428);
  FUN_0030f7cc(auStack_450,"EaseOutQuad");
  FUN_003e9544(param_1,0x18,auStack_450);
  FUN_0030f7e0(auStack_450);
  FUN_0030f7cc(auStack_478,"EaseOutQuart");
  FUN_003e9544(param_1,0x19,auStack_478);
  FUN_0030f7e0(auStack_478);
  FUN_0030f7cc(auStack_4a0,"EaseOutExpo");
  FUN_003e9544(param_1,0x1a,auStack_4a0);
  FUN_0030f7e0(auStack_4a0);
  FUN_0030f7cc(auStack_4c8,"EaseOutElastic");
  FUN_003e9544(param_1,0x1b,auStack_4c8);
  FUN_0030f7e0(auStack_4c8);
  FUN_0030f7cc(auStack_4f0,"EaseOutBounce");
  FUN_003e9544(param_1,0x1c,auStack_4f0);
  FUN_0030f7e0(auStack_4f0);
  FUN_0030f7cc(auStack_518,"EaseInOutSine");
  FUN_003e9544(param_1,0x1d,auStack_518);
  FUN_0030f7e0(auStack_518);
  FUN_0030f7cc(auStack_540,"EaseInOutCubic");
  FUN_003e9544(param_1,0x1e,auStack_540);
  FUN_0030f7e0(auStack_540);
  FUN_0030f7cc(auStack_568,"EaseInOutQuint");
  FUN_003e9544(param_1,0x1f,auStack_568);
  FUN_0030f7e0(auStack_568);
  FUN_0030f7cc(auStack_590,"EaseInOutCirc");
  FUN_003e9544(param_1,0x20,auStack_590);
  FUN_0030f7e0(auStack_590);
  FUN_0030f7cc(auStack_5b8,"EaseInOutBack");
  FUN_003e9544(param_1,0x21,auStack_5b8);
  FUN_0030f7e0(auStack_5b8);
  FUN_0030f7cc(auStack_5e0,"EaseInOutQuad");
  FUN_003e9544(param_1,0x22,auStack_5e0);
  FUN_0030f7e0(auStack_5e0);
  FUN_0030f7cc(auStack_608,"EaseInOutQuart");
  FUN_003e9544(param_1,0x23,auStack_608);
  FUN_0030f7e0(auStack_608);
  FUN_0030f7cc(auStack_630,"EaseInOutExpo");
  FUN_003e9544(param_1,0x24,auStack_630);
  FUN_0030f7e0(auStack_630);
  FUN_0030f7cc(auStack_658,"EaseInOutElastic");
  FUN_003e9544(param_1,0x25,auStack_658);
  FUN_0030f7e0(auStack_658);
  FUN_0030f7cc(auStack_680,"EaseInOutBounce");
  FUN_003e9544(param_1,0x26,auStack_680);
  FUN_0030f7e0(auStack_680);
  if (*(int *)puVar2 != iStack_18) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail(*(int *)puVar2);
  }
  return;
}


```

## FUN_003e8504 — 003e8ef0

- 函数名: FUN_003e8ef0
- 函数体: 1619 字节
- 调用者数: 1 / 被调用者数: 7

```c

void FUN_003e8ef0(int param_1)

{
  undefined4 *puVar1;
  undefined *puVar2;
  int iVar3;
  int iVar4;
  undefined4 uVar5;
  undefined4 *puVar6;
  undefined4 extraout_s1;
  undefined8 uVar7;
  undefined1 auStack_680 [40];
  undefined1 auStack_658 [40];
  undefined1 auStack_630 [40];
  undefined1 auStack_608 [40];
  undefined1 auStack_5e0 [40];
  undefined1 auStack_5b8 [40];
  undefined1 auStack_590 [40];
  undefined1 auStack_568 [40];
  undefined1 auStack_540 [40];
  undefined1 auStack_518 [40];
  undefined1 auStack_4f0 [40];
  undefined1 auStack_4c8 [40];
  undefined1 auStack_4a0 [40];
  undefined1 auStack_478 [40];
  undefined1 auStack_450 [40];
  undefined1 auStack_428 [40];
  undefined1 auStack_400 [40];
  undefined1 auStack_3d8 [40];
  undefined1 auStack_3b0 [40];
  undefined1 auStack_388 [40];
  undefined1 auStack_360 [40];
  undefined1 auStack_338 [40];
  undefined1 auStack_310 [40];
  undefined1 auStack_2e8 [40];
  undefined1 auStack_2c0 [40];
  undefined1 auStack_298 [40];
  undefined1 auStack_270 [40];
  undefined1 auStack_248 [40];
  undefined1 auStack_220 [40];
  undefined1 auStack_1f8 [40];
  undefined1 auStack_1d0 [40];
  undefined1 auStack_1a8 [40];
  undefined1 auStack_180 [40];
  undefined1 auStack_158 [40];
  undefined1 auStack_130 [40];
  undefined1 auStack_108 [40];
  undefined1 auStack_e0 [40];
  undefined1 auStack_b8 [40];
  undefined1 auStack_90 [40];
  undefined1 auStack_68 [40];
  undefined1 auStack_40 [40];
  int iStack_18;
  
  puVar2 = PTR____stack_chk_guard_004d9044;
  iStack_18 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_0030f7cc(auStack_40,"Invalid");
  *(undefined4 *)(param_1 + 8) = 0;
  puVar6 = (undefined4 *)&UNK_0048cd04;
  *(undefined4 *)(param_1 + 0xc) = 0;
  *(undefined4 *)(param_1 + 0x10) = 0;
  *(undefined4 *)(param_1 + 0x14) = 0;
  puVar1 = (undefined4 *)(param_1 + 4);
  *puVar1 = 0;
  *(undefined4 **)(param_1 + 0xc) = puVar1;
  *(undefined4 **)(param_1 + 0x10) = puVar1;
  *(undefined4 *)(param_1 + 0x24) = 0;
  *(undefined4 *)(param_1 + 0x28) = 0;
  *(undefined4 *)(param_1 + 0x2c) = 0x3f800000;
  *(undefined4 *)(param_1 + 0x30) = 0x40000000;
  *(undefined4 *)(param_1 + 0x34) = 0;
  iVar4 = 0x100;
  while (iVar3 = iVar4, 0 < iVar3) {
    iVar4 = iVar3 >> 1;
    if ((uint)puVar6[iVar4] < 10) {
      puVar6 = puVar6 + iVar4 + 1;
      iVar4 = (iVar3 + -1) - iVar4;
    }
  }
  uVar7 = FixedToFP(CONCAT44(extraout_s1,*puVar6),0,1,0,0x20);
  uVar5 = _ceilf((int)uVar7);
  uVar7 = FPToFixed(CONCAT44(uVar5,uVar5),0,1,3,0x20);
  *(int *)(param_1 + 0x34) = (int)uVar7;
  *(undefined4 *)(param_1 + 0x24) = *puVar6;
  uVar5 = FUN_003e988c((int)uVar7,param_1 + 0x18);
  *(undefined4 *)(param_1 + 0x20) = uVar5;
  FUN_0030f870(param_1 + 0x38,auStack_40);
  *(undefined4 *)(param_1 + 0x60) = 0xffffffff;
  FUN_0030f7e0(auStack_40);
  FUN_0030f7cc(auStack_68,"Invalid");
  FUN_003e9544(param_1,0xffffffff,auStack_68);
  FUN_0030f7e0(auStack_68);
  FUN_0030f7cc(auStack_90,"Linear");
  FUN_003e9544(param_1,0,auStack_90);
  FUN_0030f7e0(auStack_90);
  FUN_0030f7cc(auStack_b8,&DAT_00470ab1);
  FUN_003e9544(param_1,1,auStack_b8);
  FUN_0030f7e0(auStack_b8);
  FUN_0030f7cc(auStack_e0,"SCurve");
  FUN_003e9544(param_1,2,auStack_e0);
  FUN_0030f7e0(auStack_e0);
  FUN_0030f7cc(auStack_108,&DAT_00470abc);
  FUN_003e9544(param_1,3,auStack_108);
  FUN_0030f7e0(auStack_108);
  FUN_0030f7cc(auStack_130,"EaseOutEaseIn");
  FUN_003e9544(param_1,4,auStack_130);
  FUN_0030f7e0(auStack_130);
  FUN_0030f7cc(auStack_158,"EaseOutHardIn");
  FUN_003e9544(param_1,5,auStack_158);
  FUN_0030f7e0(auStack_158);
  FUN_0030f7cc(auStack_180,"EaseOutLinearIn");
  FUN_003e9544(param_1,6,auStack_180);
  FUN_0030f7e0(auStack_180);
  FUN_0030f7cc(auStack_1a8,"HardOutEaseIn");
  FUN_003e9544(param_1,7,auStack_1a8);
  FUN_0030f7e0(auStack_1a8);
  FUN_0030f7cc(auStack_1d0,"LinearOutEaseIn");
  FUN_003e9544(param_1,8,auStack_1d0);
  FUN_0030f7e0(auStack_1d0);
  FUN_0030f7cc(auStack_1f8,"EaseInSine");
  FUN_003e9544(param_1,9,auStack_1f8);
  FUN_0030f7e0(auStack_1f8);
  FUN_0030f7cc(auStack_220,"EaseInCubic");
  FUN_003e9544(param_1,10,auStack_220);
  FUN_0030f7e0(auStack_220);
  FUN_0030f7cc(auStack_248,"EaseInQuint");
  FUN_003e9544(param_1,0xb,auStack_248);
  FUN_0030f7e0(auStack_248);
  FUN_0030f7cc(auStack_270,"EaseInCirc");
  FUN_003e9544(param_1,0xc,auStack_270);
  FUN_0030f7e0(auStack_270);
  FUN_0030f7cc(auStack_298,"EaseInBack");
  FUN_003e9544(param_1,0xd,auStack_298);
  FUN_0030f7e0(auStack_298);
  FUN_0030f7cc(auStack_2c0,"EaseInQuad");
  FUN_003e9544(param_1,0xe,auStack_2c0);
  FUN_0030f7e0(auStack_2c0);
  FUN_0030f7cc(auStack_2e8,"EaseInQuart");
  FUN_003e9544(param_1,0xf,auStack_2e8);
  FUN_0030f7e0(auStack_2e8);
  FUN_0030f7cc(auStack_310,"EaseInExpo");
  FUN_003e9544(param_1,0x10,auStack_310);
  FUN_0030f7e0(auStack_310);
  FUN_0030f7cc(auStack_338,"EaseInElastic");
  FUN_003e9544(param_1,0x11,auStack_338);
  FUN_0030f7e0(auStack_338);
  FUN_0030f7cc(auStack_360,"EaseInBounce");
  FUN_003e9544(param_1,0x12,auStack_360);
  FUN_0030f7e0(auStack_360);
  FUN_0030f7cc(auStack_388,"EaseOutSine");
  FUN_003e9544(param_1,0x13,auStack_388);
  FUN_0030f7e0(auStack_388);
  FUN_0030f7cc(auStack_3b0,"EaseOutCubic");
  FUN_003e9544(param_1,0x14,auStack_3b0);
  FUN_0030f7e0(auStack_3b0);
  FUN_0030f7cc(auStack_3d8,"EaseOutQuint");
  FUN_003e9544(param_1,0x15,auStack_3d8);
  FUN_0030f7e0(auStack_3d8);
  FUN_0030f7cc(auStack_400,"EaseOutCirc");
  FUN_003e9544(param_1,0x16,auStack_400);
  FUN_0030f7e0(auStack_400);
  FUN_0030f7cc(auStack_428,"EaseOutBack");
  FUN_003e9544(param_1,0x17,auStack_428);
  FUN_0030f7e0(auStack_428);
  FUN_0030f7cc(auStack_450,"EaseOutQuad");
  FUN_003e9544(param_1,0x18,auStack_450);
  FUN_0030f7e0(auStack_450);
  FUN_0030f7cc(auStack_478,"EaseOutQuart");
  FUN_003e9544(param_1,0x19,auStack_478);
  FUN_0030f7e0(auStack_478);
  FUN_0030f7cc(auStack_4a0,"EaseOutExpo");
  FUN_003e9544(param_1,0x1a,auStack_4a0);
  FUN_0030f7e0(auStack_4a0);
  FUN_0030f7cc(auStack_4c8,"EaseOutElastic");
  FUN_003e9544(param_1,0x1b,auStack_4c8);
  FUN_0030f7e0(auStack_4c8);
  FUN_0030f7cc(auStack_4f0,"EaseOutBounce");
  FUN_003e9544(param_1,0x1c,auStack_4f0);
  FUN_0030f7e0(auStack_4f0);
  FUN_0030f7cc(auStack_518,"EaseInOutSine");
  FUN_003e9544(param_1,0x1d,auStack_518);
  FUN_0030f7e0(auStack_518);
  FUN_0030f7cc(auStack_540,"EaseInOutCubic");
  FUN_003e9544(param_1,0x1e,auStack_540);
  FUN_0030f7e0(auStack_540);
  FUN_0030f7cc(auStack_568,"EaseInOutQuint");
  FUN_003e9544(param_1,0x1f,auStack_568);
  FUN_0030f7e0(auStack_568);
  FUN_0030f7cc(auStack_590,"EaseInOutCirc");
  FUN_003e9544(param_1,0x20,auStack_590);
  FUN_0030f7e0(auStack_590);
  FUN_0030f7cc(auStack_5b8,"EaseInOutBack");
  FUN_003e9544(param_1,0x21,auStack_5b8);
  FUN_0030f7e0(auStack_5b8);
  FUN_0030f7cc(auStack_5e0,"EaseInOutQuad");
  FUN_003e9544(param_1,0x22,auStack_5e0);
  FUN_0030f7e0(auStack_5e0);
  FUN_0030f7cc(auStack_608,"EaseInOutQuart");
  FUN_003e9544(param_1,0x23,auStack_608);
  FUN_0030f7e0(auStack_608);
  FUN_0030f7cc(auStack_630,"EaseInOutExpo");
  FUN_003e9544(param_1,0x24,auStack_630);
  FUN_0030f7e0(auStack_630);
  FUN_0030f7cc(auStack_658,"EaseInOutElastic");
  FUN_003e9544(param_1,0x25,auStack_658);
  FUN_0030f7e0(auStack_658);
  FUN_0030f7cc(auStack_680,"EaseInOutBounce");
  FUN_003e9544(param_1,0x26,auStack_680);
  FUN_0030f7e0(auStack_680);
  if (*(int *)puVar2 != iStack_18) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail(*(int *)puVar2);
  }
  return;
}


```

## FUN_003e856c — 003e9544

- 函数名: FUN_003e9544
- 函数体: 41 字节
- 调用者数: 1 / 被调用者数: 3

```c

void FUN_003e9544(int param_1,undefined4 param_2,undefined4 param_3)

{
  undefined4 uVar1;
  undefined4 *puVar2;
  undefined4 local_18;
  
  local_18 = param_2;
  uVar1 = FUN_003e9570(param_1,&local_18);
  FUN_0030f884(uVar1,param_3);
  uVar1 = local_18;
  puVar2 = (undefined4 *)FUN_003e9614(param_1 + 0x18,param_3);
  *puVar2 = uVar1;
  return;
}


```

## FUN_003e8580 — 003e9570

- 函数名: FUN_003e9570
- 函数体: 161 字节
- 调用者数: 1 / 被调用者数: 5

```c

void FUN_003e9570(int param_1,int *param_2)

{
  undefined *puVar1;
  int *piVar2;
  int iVar3;
  int iVar4;
  undefined1 auStack_78 [40];
  int local_50;
  undefined1 auStack_4c [40];
  int local_24;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  piVar2 = (int *)(param_1 + 8);
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  iVar4 = param_1 + 4;
  while (iVar3 = *piVar2, iVar3 != 0) {
    piVar2 = (int *)(iVar3 + 0xc);
    if (*param_2 <= *(int *)(iVar3 + 0x10)) {
      piVar2 = (int *)(iVar3 + 8);
      iVar4 = iVar3;
    }
  }
  if ((iVar4 == param_1 + 4) || (*param_2 < *(int *)(iVar4 + 0x10))) {
    FUN_0030f7cc(auStack_78,0);
    local_50 = *param_2;
    FUN_0030f870(auStack_4c,auStack_78);
    FUN_003e98c8(param_1,iVar4,&local_50);
    FUN_0030f7e0(auStack_4c);
    FUN_0030f7e0(auStack_78);
  }
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail(*(int *)puVar1);
  }
  return;
}


```

## FUN_003e85fc — 003e9570

- 函数名: FUN_003e9570
- 函数体: 161 字节
- 调用者数: 1 / 被调用者数: 5

```c

void FUN_003e9570(int param_1,int *param_2)

{
  undefined *puVar1;
  int *piVar2;
  int iVar3;
  int iVar4;
  undefined1 auStack_78 [40];
  int local_50;
  undefined1 auStack_4c [40];
  int local_24;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  piVar2 = (int *)(param_1 + 8);
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  iVar4 = param_1 + 4;
  while (iVar3 = *piVar2, iVar3 != 0) {
    piVar2 = (int *)(iVar3 + 0xc);
    if (*param_2 <= *(int *)(iVar3 + 0x10)) {
      piVar2 = (int *)(iVar3 + 8);
      iVar4 = iVar3;
    }
  }
  if ((iVar4 == param_1 + 4) || (*param_2 < *(int *)(iVar4 + 0x10))) {
    FUN_0030f7cc(auStack_78,0);
    local_50 = *param_2;
    FUN_0030f870(auStack_4c,auStack_78);
    FUN_003e98c8(param_1,iVar4,&local_50);
    FUN_0030f7e0(auStack_4c);
    FUN_0030f7e0(auStack_78);
  }
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail(*(int *)puVar1);
  }
  return;
}


```

## FUN_003e8650 — 003e9614

- 函数名: FUN_003e9614
- 函数体: 199 字节
- 调用者数: 1 / 被调用者数: 8

```c

void FUN_003e9614(int param_1,undefined4 param_2)

{
  undefined *puVar1;
  undefined4 uVar2;
  int iVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  int iVar6;
  int *piVar7;
  undefined1 local_ac [8];
  undefined1 auStack_a4 [40];
  undefined1 auStack_7c [40];
  undefined4 local_54;
  undefined1 auStack_50 [40];
  undefined4 local_28;
  int local_24;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  uVar2 = FUN_0030fc50(param_2);
  iVar6 = *(int *)(param_1 + 8);
  iVar3 = ___umodsi3(uVar2,*(undefined4 *)(param_1 + 0xc));
  for (piVar7 = *(int **)(iVar6 + iVar3 * 4); piVar7 != (int *)0x0; piVar7 = (int *)piVar7[0xb]) {
    uVar4 = FUN_0030f8f0(piVar7);
    iVar6 = *piVar7;
    uVar5 = FUN_0030fc50(piVar7);
    iVar6 = FUN_0030fd20(param_2,uVar4,iVar6 + -1,uVar5);
    if (iVar6 != 0) goto LAB_003e96c2;
  }
  FUN_0030f870(auStack_a4,param_2);
  FUN_0030f870(auStack_7c,auStack_a4);
  local_54 = 0;
  FUN_0030f870(auStack_50,auStack_7c);
  local_28 = local_54;
  FUN_003e96dc(local_ac,param_1,auStack_50,iVar3,uVar2);
  FUN_0030f7e0(auStack_50);
  FUN_0030f7e0(auStack_7c);
  FUN_0030f7e0(auStack_a4);
LAB_003e96c2:
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail(*(int *)puVar1);
  }
  return;
}


```

## FUN_003e86ac — 003e9614

- 函数名: FUN_003e9614
- 函数体: 199 字节
- 调用者数: 1 / 被调用者数: 8

```c

void FUN_003e9614(int param_1,undefined4 param_2)

{
  undefined *puVar1;
  undefined4 uVar2;
  int iVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  int iVar6;
  int *piVar7;
  undefined1 local_ac [8];
  undefined1 auStack_a4 [40];
  undefined1 auStack_7c [40];
  undefined4 local_54;
  undefined1 auStack_50 [40];
  undefined4 local_28;
  int local_24;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  uVar2 = FUN_0030fc50(param_2);
  iVar6 = *(int *)(param_1 + 8);
  iVar3 = ___umodsi3(uVar2,*(undefined4 *)(param_1 + 0xc));
  for (piVar7 = *(int **)(iVar6 + iVar3 * 4); piVar7 != (int *)0x0; piVar7 = (int *)piVar7[0xb]) {
    uVar4 = FUN_0030f8f0(piVar7);
    iVar6 = *piVar7;
    uVar5 = FUN_0030fc50(piVar7);
    iVar6 = FUN_0030fd20(param_2,uVar4,iVar6 + -1,uVar5);
    if (iVar6 != 0) goto LAB_003e96c2;
  }
  FUN_0030f870(auStack_a4,param_2);
  FUN_0030f870(auStack_7c,auStack_a4);
  local_54 = 0;
  FUN_0030f870(auStack_50,auStack_7c);
  local_28 = local_54;
  FUN_003e96dc(local_ac,param_1,auStack_50,iVar3,uVar2);
  FUN_0030f7e0(auStack_50);
  FUN_0030f7e0(auStack_7c);
  FUN_0030f7e0(auStack_a4);
LAB_003e96c2:
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail(*(int *)puVar1);
  }
  return;
}


```

## FUN_003e86c0 — 003e9614

- 函数名: FUN_003e9614
- 函数体: 199 字节
- 调用者数: 1 / 被调用者数: 8

```c

void FUN_003e9614(int param_1,undefined4 param_2)

{
  undefined *puVar1;
  undefined4 uVar2;
  int iVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  int iVar6;
  int *piVar7;
  undefined1 local_ac [8];
  undefined1 auStack_a4 [40];
  undefined1 auStack_7c [40];
  undefined4 local_54;
  undefined1 auStack_50 [40];
  undefined4 local_28;
  int local_24;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  uVar2 = FUN_0030fc50(param_2);
  iVar6 = *(int *)(param_1 + 8);
  iVar3 = ___umodsi3(uVar2,*(undefined4 *)(param_1 + 0xc));
  for (piVar7 = *(int **)(iVar6 + iVar3 * 4); piVar7 != (int *)0x0; piVar7 = (int *)piVar7[0xb]) {
    uVar4 = FUN_0030f8f0(piVar7);
    iVar6 = *piVar7;
    uVar5 = FUN_0030fc50(piVar7);
    iVar6 = FUN_0030fd20(param_2,uVar4,iVar6 + -1,uVar5);
    if (iVar6 != 0) goto LAB_003e96c2;
  }
  FUN_0030f870(auStack_a4,param_2);
  FUN_0030f870(auStack_7c,auStack_a4);
  local_54 = 0;
  FUN_0030f870(auStack_50,auStack_7c);
  local_28 = local_54;
  FUN_003e96dc(local_ac,param_1,auStack_50,iVar3,uVar2);
  FUN_0030f7e0(auStack_50);
  FUN_0030f7e0(auStack_7c);
  FUN_0030f7e0(auStack_a4);
LAB_003e96c2:
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail(*(int *)puVar1);
  }
  return;
}


```

## FUN_003e86d4 — 003e9614

- 函数名: FUN_003e9614
- 函数体: 199 字节
- 调用者数: 1 / 被调用者数: 8

```c

void FUN_003e9614(int param_1,undefined4 param_2)

{
  undefined *puVar1;
  undefined4 uVar2;
  int iVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  int iVar6;
  int *piVar7;
  undefined1 local_ac [8];
  undefined1 auStack_a4 [40];
  undefined1 auStack_7c [40];
  undefined4 local_54;
  undefined1 auStack_50 [40];
  undefined4 local_28;
  int local_24;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  uVar2 = FUN_0030fc50(param_2);
  iVar6 = *(int *)(param_1 + 8);
  iVar3 = ___umodsi3(uVar2,*(undefined4 *)(param_1 + 0xc));
  for (piVar7 = *(int **)(iVar6 + iVar3 * 4); piVar7 != (int *)0x0; piVar7 = (int *)piVar7[0xb]) {
    uVar4 = FUN_0030f8f0(piVar7);
    iVar6 = *piVar7;
    uVar5 = FUN_0030fc50(piVar7);
    iVar6 = FUN_0030fd20(param_2,uVar4,iVar6 + -1,uVar5);
    if (iVar6 != 0) goto LAB_003e96c2;
  }
  FUN_0030f870(auStack_a4,param_2);
  FUN_0030f870(auStack_7c,auStack_a4);
  local_54 = 0;
  FUN_0030f870(auStack_50,auStack_7c);
  local_28 = local_54;
  FUN_003e96dc(local_ac,param_1,auStack_50,iVar3,uVar2);
  FUN_0030f7e0(auStack_50);
  FUN_0030f7e0(auStack_7c);
  FUN_0030f7e0(auStack_a4);
LAB_003e96c2:
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail(*(int *)puVar1);
  }
  return;
}


```

