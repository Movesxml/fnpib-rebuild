# 完整反编译导出（无截断）

- 程序: FruitNinjaPIB.exe

## FUN_00bbed50 — 00bbed50

- 函数名: FUN_00bbed50
- 函数体: 945 字节
- 调用者数: 0 / 被调用者数: 3

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

int FUN_00bbed50(char param_1,int param_2,int param_3)

{
  int iVar1;
  char cVar2;
  int iVar3;
  int iStack_40;
  int iStack_34;
  int iStack_2c;
  int iStack_24;
  int iStack_1c;
  int iStack_14;
  int iStack_8;
  
  if (_DAT_01950fb8 < 1) {
    _DAT_01950fb8 = 0;
    for (iStack_8 = 0; iStack_8 < param_3; iStack_8 = iStack_8 + 1) {
      iVar3 = *(int *)(param_2 + iStack_8 * 4);
      _DAT_01950fb8 = _DAT_01950fb8 + *(int *)(_DAT_01950fa0 + 0x308 + iVar3 * 0x338);
      *(int *)(_DAT_01950fa0 + 0x30c + iVar3 * 0x338) = _DAT_01950fb8;
      if (*(int *)(_DAT_01950fa0 + 0x328 + iVar3 * 0x338) < 1) {
        _DAT_01950fbc = _DAT_01950fbc + *(int *)(_DAT_01950fa0 + 0x308 + iVar3 * 0x338);
      }
      if ((*(char *)(_DAT_01950fa0 + 0x318 + iVar3 * 0x338) != '\0') &&
         (_DAT_01950fc0 = _DAT_01950fc0 + *(int *)(_DAT_01950fa0 + 0x308 + iVar3 * 0x338),
         *(int *)(_DAT_01950fa0 + 0x328 + iVar3 * 0x338) < 1)) {
        _DAT_01950fc4 = _DAT_01950fc4 + *(int *)(_DAT_01950fa0 + 0x308 + iVar3 * 0x338);
      }
      *(int *)(_DAT_01950fa0 + 0x310 + iVar3 * 0x338) = _DAT_01950fc0;
    }
  }
  thunk_FUN_00c6b930(0);
  cVar2 = thunk_FUN_00c78c90();
  if (cVar2 == '\0') {
    if (param_1 == '\0') {
      iStack_2c = 0;
      thunk_FUN_00c6b930(_DAT_01950fbc);
      iVar3 = thunk_FUN_00a7d930();
      for (iStack_34 = 0; iStack_34 < param_3; iStack_34 = iStack_34 + 1) {
        iVar1 = *(int *)(param_2 + iStack_34 * 4);
        if ((*(int *)(_DAT_01950fa0 + 0x328 + iVar1 * 0x338) < 1) &&
           (iStack_2c = iStack_2c + *(int *)(_DAT_01950fa0 + 0x308 + iVar1 * 0x338),
           iVar3 < iStack_2c)) {
          return iVar1;
        }
      }
    }
    else {
      thunk_FUN_00c6b930(_DAT_01950fb8);
      iVar3 = thunk_FUN_00a7d930();
      for (iStack_40 = 0; iStack_40 < param_3; iStack_40 = iStack_40 + 1) {
        iVar1 = *(int *)(param_2 + iStack_40 * 4);
        if (iVar3 < *(int *)(_DAT_01950fa0 + 0x30c + iVar1 * 0x338)) {
          return iVar1;
        }
      }
    }
  }
  else if (param_1 == '\0') {
    iStack_1c = 0;
    thunk_FUN_00c6b930(_DAT_01950fc4);
    iVar3 = thunk_FUN_00a7d930();
    for (iStack_24 = 0; iStack_24 < param_3; iStack_24 = iStack_24 + 1) {
      iVar1 = *(int *)(param_2 + iStack_24 * 4);
      if (((*(int *)(_DAT_01950fa0 + 0x328 + iVar1 * 0x338) < 1) &&
          (*(char *)(_DAT_01950fa0 + 0x318 + iVar1 * 0x338) != '\0')) &&
         (iStack_1c = iStack_1c + *(int *)(_DAT_01950fa0 + 0x308 + iVar1 * 0x338), iVar3 < iStack_1c
         )) {
        return iVar1;
      }
    }
  }
  else {
    thunk_FUN_00c6b930(_DAT_01950fc0);
    iVar3 = thunk_FUN_00a7d930();
    for (iStack_14 = 0; iStack_14 < param_3; iStack_14 = iStack_14 + 1) {
      iVar1 = *(int *)(param_2 + iStack_14 * 4);
      if (iVar3 < *(int *)(_DAT_01950fa0 + 0x310 + iVar1 * 0x338)) {
        return iVar1;
      }
    }
  }
  thunk_FUN_00c6b930(param_3 + -1);
  iVar3 = thunk_FUN_00a7d930();
  return *(int *)(param_2 + iVar3 * 4);
}


```

## FUN_00bbf1f0 — 00bbf1f0

- 函数名: FUN_00bbf1f0
- 函数体: 98 字节
- 调用者数: 0 / 被调用者数: 1

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00bbf1f0(undefined1 param_1)

{
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  uStack_8 = 0;
  for (uStack_c = 0; uStack_c < _DAT_01950f9c; uStack_c = uStack_c + 1) {
    *(int *)(uStack_c * 4 + 0x1950b70) = uStack_c;
    uStack_8 = uStack_8 + 1;
  }
  thunk_FUN_00bbed50(param_1,0x1950b70,uStack_8);
  return;
}


```

## FUN_00bbf270 — 00bbf270

- 函数名: FUN_00bbf270
- 函数体: 118 字节
- 调用者数: 0 / 被调用者数: 2

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00bbf270(undefined1 param_1)

{
  int iVar1;
  int iStack_c;
  int iStack_8;
  
  iStack_8 = 0;
  for (iStack_c = 0; iStack_c < _DAT_01950f9c; iStack_c = iStack_c + 1) {
    iVar1 = thunk_FUN_00bbde60(&UNK_01709044,0);
    if (iStack_c != iVar1) {
      *(int *)(iStack_c * 4 + 0x1950a50) = iStack_c;
      iStack_8 = iStack_8 + 1;
    }
  }
  thunk_FUN_00bbed50(param_1,0x1950a50,iStack_8);
  return;
}


```

## FUN_00bbf310 — 00bbf310

- 函数名: FUN_00bbf310
- 函数体: 158 字节
- 调用者数: 0 / 被调用者数: 2

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00bbf310(undefined1 param_1)

{
  int iVar1;
  int iStack_c;
  int iStack_8;
  
  iStack_8 = 0;
  iStack_c = 0;
  do {
    if (_DAT_01950f9c <= iStack_c) {
      thunk_FUN_00bbed50(param_1,0x1950e88,iStack_8);
      return;
    }
    iVar1 = thunk_FUN_00bbde60(&UNK_01709054,0);
    if (iStack_c == iVar1) {
LAB_00bbf379:
      *(int *)(iStack_8 * 4 + 0x1950e88) = iStack_c;
      iStack_8 = iStack_8 + 1;
    }
    else {
      iVar1 = thunk_FUN_00bbde60(&UNK_01703de4,0);
      if (iStack_c == iVar1) goto LAB_00bbf379;
      iVar1 = thunk_FUN_00bbde60(&UNK_0170903c,0);
      if (iStack_c == iVar1) goto LAB_00bbf379;
    }
    iStack_c = iStack_c + 1;
  } while( true );
}


```

## FUN_00bbf3e0 — 00bbf3e0

- 函数名: FUN_00bbf3e0
- 函数体: 317 字节
- 调用者数: 0 / 被调用者数: 2

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00bbf3e0(undefined1 param_1)

{
  int iVar1;
  int iStack_c;
  int iStack_8;
  
  iStack_8 = 0;
  iStack_c = 0;
  do {
    if (_DAT_01950f9c <= iStack_c) {
      thunk_FUN_00bbed50(param_1,0x1950c78,iStack_8);
      return;
    }
    iVar1 = thunk_FUN_00bbde60(&UNK_01709090,0);
    if (iStack_c == iVar1) {
LAB_00bbf4e5:
      *(int *)(iStack_8 * 4 + 0x1950c78) = iStack_c;
      iStack_8 = iStack_8 + 1;
    }
    else {
      iVar1 = thunk_FUN_00bbde60(&UNK_01709064,0);
      if (iStack_c == iVar1) goto LAB_00bbf4e5;
      iVar1 = thunk_FUN_00bbde60(&UNK_01709098,0);
      if (iStack_c == iVar1) goto LAB_00bbf4e5;
      iVar1 = thunk_FUN_00bbde60(&UNK_01712ee8,0);
      if (iStack_c == iVar1) goto LAB_00bbf4e5;
      iVar1 = thunk_FUN_00bbde60(&UNK_017090a4,0);
      if (iStack_c == iVar1) goto LAB_00bbf4e5;
      iVar1 = thunk_FUN_00bbde60(&UNK_01712ee0,0);
      if (iStack_c == iVar1) goto LAB_00bbf4e5;
      iVar1 = thunk_FUN_00bbde60(&UNK_01709018,0);
      if (iStack_c == iVar1) goto LAB_00bbf4e5;
      iVar1 = thunk_FUN_00bbde60(&UNK_01709034,0);
      if (iStack_c == iVar1) goto LAB_00bbf4e5;
      iVar1 = thunk_FUN_00bbde60(&UNK_01712ed8,0);
      if (iStack_c == iVar1) goto LAB_00bbf4e5;
      iVar1 = thunk_FUN_00bbde60(&UNK_0170904c,0);
      if (iStack_c == iVar1) goto LAB_00bbf4e5;
    }
    iStack_c = iStack_c + 1;
  } while( true );
}


```

## FUN_00bbf570 — 00bbf570

- 函数名: FUN_00bbf570
- 函数体: 158 字节
- 调用者数: 0 / 被调用者数: 2

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00bbf570(undefined1 param_1)

{
  int iVar1;
  int iStack_c;
  int iStack_8;
  
  iStack_8 = 0;
  iStack_c = 0;
  do {
    if (_DAT_01950f9c <= iStack_c) {
      thunk_FUN_00bbed50(param_1,0x1950d88,iStack_8);
      return;
    }
    iVar1 = thunk_FUN_00bbde60(&UNK_01709044,0);
    if (iStack_c == iVar1) {
LAB_00bbf5d9:
      *(int *)(iStack_8 * 4 + 0x1950d88) = iStack_c;
      iStack_8 = iStack_8 + 1;
    }
    else {
      iVar1 = thunk_FUN_00bbde60(&UNK_01709074,0);
      if (iStack_c == iVar1) goto LAB_00bbf5d9;
      iVar1 = thunk_FUN_00bbde60(&UNK_01709084,0);
      if (iStack_c == iVar1) goto LAB_00bbf5d9;
    }
    iStack_c = iStack_c + 1;
  } while( true );
}


```

## FUN_00bbf640 — 00bbf640

- 函数名: FUN_00bbf640
- 函数体: 527 字节
- 调用者数: 0 / 被调用者数: 5

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 * __fastcall FUN_00bbf640(undefined4 *param_1)

{
  int iStack_18;
  void *pvStack_10;
  undefined *puStack_c;
  undefined4 uStack_8;
  
  uStack_8 = 0xffffffff;
  puStack_c = &UNK_0162249d;
  pvStack_10 = ExceptionList;
  ExceptionList = &pvStack_10;
  thunk_FUN_00ace060(_DAT_018bcc60 ^ (uint)&stack0xfffffffc);
  uStack_8 = 0;
  *param_1 = &UNK_01712ef4;
  thunk_FUN_00aa38b0();
  uStack_8._0_1_ = 1;
  thunk_FUN_00aa38b0();
  uStack_8._0_1_ = 2;
  thunk_FUN_00aa38b0();
  uStack_8._0_1_ = 3;
  thunk_FUN_00aa38b0();
  uStack_8._0_1_ = 4;
  thunk_FUN_00aa38b0();
  uStack_8._0_1_ = 5;
  thunk_FUN_00aa38b0();
  uStack_8._0_1_ = 6;
  thunk_FUN_00aa38b0();
  uStack_8._0_1_ = 7;
  thunk_FUN_00aa38b0();
  uStack_8._0_1_ = 8;
  thunk_FUN_00aa38b0();
  uStack_8._0_1_ = 9;
  thunk_FUN_00aa38b0();
  uStack_8._0_1_ = 10;
  thunk_FUN_00aa38b0();
  uStack_8._0_1_ = 0xb;
  thunk_FUN_01558ca0(param_1 + 0x4d,0x10,2,thunk_FUN_00b16490,thunk_FUN_00b164e0);
  uStack_8._0_1_ = 0xc;
  thunk_FUN_01558ca0(param_1 + 0x55,0xc,2,thunk_FUN_00aa38b0,thunk_FUN_00a7a5e0);
  uStack_8._0_1_ = 0xd;
  thunk_FUN_01558ca0(param_1 + 0x5b,0xc,6,thunk_FUN_00aa38b0,thunk_FUN_00a7a5e0);
  uStack_8._0_1_ = 0xe;
  thunk_FUN_00bd1170();
  uStack_8._0_1_ = 0xf;
  thunk_FUN_00bd1400();
  uStack_8 = CONCAT31(uStack_8._1_3_,0x10);
  thunk_FUN_00bd1400();
  param_1[0xe] = 0;
  param_1[0x6d] = 0;
  *(undefined1 *)(param_1 + 0x6e) = 0;
  for (iStack_18 = 0; iStack_18 < 2; iStack_18 = iStack_18 + 1) {
    param_1[iStack_18 + 0x10] = 0;
  }
  param_1[0x2d] = 0;
  param_1[0x2f] = 0;
  ExceptionList = pvStack_10;
  return param_1;
}


```

## FUN_00bbf8e0 — 00bbf8e0

- 函数名: FUN_00bbf8e0
- 函数体: 52 字节
- 调用者数: 0 / 被调用者数: 2

```c

undefined4 __thiscall FUN_00bbf8e0(undefined4 param_1,uint param_2)

{
  thunk_FUN_00bbf930();
  if ((param_2 & 1) != 0) {
    thunk_FUN_00aceb10(param_1);
  }
  return param_1;
}


```

## FUN_00bbf930 — 00bbf930

- 函数名: FUN_00bbf930
- 函数体: 426 字节
- 调用者数: 0 / 被调用者数: 6

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __fastcall FUN_00bbf930(undefined4 *param_1)

{
  uint uVar1;
  void *pvStack_10;
  undefined *puStack_c;
  int iStack_8;
  
  puStack_c = &UNK_0162260b;
  pvStack_10 = ExceptionList;
  uVar1 = _DAT_018bcc60 ^ (uint)&stack0xfffffffc;
  ExceptionList = &pvStack_10;
  *param_1 = &UNK_01712ef4;
  iStack_8 = 0x11;
  thunk_FUN_00bc14b0(uVar1);
  iStack_8._0_1_ = 0x10;
  thunk_FUN_00bd1440();
  iStack_8._0_1_ = 0xf;
  thunk_FUN_00bd1440();
  iStack_8._0_1_ = 0xe;
  thunk_FUN_00bd11b0();
  iStack_8._0_1_ = 0xd;
  thunk_FUN_01550010(param_1 + 0x5b,0xc,6,thunk_FUN_00a7a5e0);
  iStack_8._0_1_ = 0xc;
  thunk_FUN_01550010(param_1 + 0x55,0xc,2,thunk_FUN_00a7a5e0);
  iStack_8._0_1_ = 0xb;
  thunk_FUN_01550010(param_1 + 0x4d,0x10,2,thunk_FUN_00b164e0);
  iStack_8._0_1_ = 10;
  thunk_FUN_00a7a5e0();
  iStack_8._0_1_ = 9;
  thunk_FUN_00a7a5e0();
  iStack_8._0_1_ = 8;
  thunk_FUN_00a7a5e0();
  iStack_8._0_1_ = 7;
  thunk_FUN_00a7a5e0();
  iStack_8._0_1_ = 6;
  thunk_FUN_00a7a5e0();
  iStack_8._0_1_ = 5;
  thunk_FUN_00a7a5e0();
  iStack_8._0_1_ = 4;
  thunk_FUN_00a7a5e0();
  iStack_8._0_1_ = 3;
  thunk_FUN_00a7a5e0();
  iStack_8._0_1_ = 2;
  thunk_FUN_00a7a5e0();
  iStack_8._0_1_ = 1;
  thunk_FUN_00a7a5e0();
  iStack_8 = (uint)iStack_8._1_3_ << 8;
  thunk_FUN_00a7a5e0();
  iStack_8 = 0xffffffff;
  thunk_FUN_00ace1c0();
  ExceptionList = pvStack_10;
  return;
}


```

## FUN_00bbfb50 — 00bbfb50

- 函数名: FUN_00bbfb50
- 函数体: 108 字节
- 调用者数: 0 / 被调用者数: 0

```c

void __thiscall FUN_00bbfb50(int param_1,undefined4 param_2)

{
  if (*(int *)(param_1 + 0xb4) != 0) {
    if (*(undefined4 **)(param_1 + 0xb4) != (undefined4 *)0x0) {
      (**(code **)**(undefined4 **)(param_1 + 0xb4))(1);
    }
    *(undefined4 *)(param_1 + 0xb4) = 0;
  }
  *(undefined4 *)(param_1 + 0xb4) = param_2;
  return;
}


```

## FUN_00bbfbe0 — 00bbfbe0

- 函数名: FUN_00bbfbe0
- 函数体: 769 字节
- 调用者数: 0 / 被调用者数: 21

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_00bbfbe0(int param_1,undefined4 param_2,char param_3)

{
  uint uVar1;
  int iVar2;
  undefined4 uVar3;
  float10 fVar4;
  undefined4 uStack_b4;
  undefined1 auStack_a0 [12];
  undefined4 uStack_94;
  int iStack_90;
  undefined1 auStack_8c [12];
  uint uStack_80;
  float afStack_3c [4];
  int iStack_2c;
  undefined4 uStack_28;
  undefined1 auStack_24 [12];
  int iStack_18;
  int iStack_14;
  void *pvStack_10;
  undefined *puStack_c;
  int iStack_8;
  
  iStack_8 = 0xffffffff;
  puStack_c = &UNK_016226b5;
  pvStack_10 = ExceptionList;
  uVar1 = _DAT_018bcc60 ^ (uint)&stack0xfffffffc;
  ExceptionList = &pvStack_10;
  uStack_80 = 0;
  if (*(char *)(param_1 + 0xc1) == '\0') {
    *(undefined1 *)(param_1 + 0xb8) = 0;
    iStack_14 = param_1;
    if (*(int *)(param_1 + 0xb4) != 0) {
      if (*(undefined4 **)(param_1 + 0xb4) != (undefined4 *)0x0) {
        (**(code **)**(undefined4 **)(param_1 + 0xb4))(1,uVar1);
      }
      *(undefined4 *)(iStack_14 + 0xb4) = 0;
    }
    iVar2 = thunk_FUN_00c5a200();
    if (iVar2 != 0) {
      thunk_FUN_00c5a200(5);
      thunk_FUN_00a80300();
      iStack_18 = thunk_FUN_00aa02e0();
      if (iStack_18 != 0) {
        thunk_FUN_00a7a5a0(0,0,0);
        iStack_8 = 0;
        thunk_FUN_00bab5e0(0,1);
        uStack_28 = thunk_FUN_00baca90();
        fVar4 = (float10)thunk_FUN_00bb7ba0(iStack_14);
        fVar4 = (float10)thunk_FUN_00bb7b80((float)fVar4);
        uVar3 = thunk_FUN_00a9a4a0(auStack_a0,auStack_24,iStack_14 + 0x1c,(float)fVar4);
        iStack_8._0_1_ = 1;
        thunk_FUN_00accbb0(uVar3);
        iStack_8 = (uint)iStack_8._1_3_ << 8;
        thunk_FUN_00a7a5e0();
        *(undefined1 *)(iStack_14 + 0xb8) = 1;
        if (param_3 != '\0') {
          thunk_FUN_00bb7b60();
        }
        iStack_8 = 0xffffffff;
        thunk_FUN_00a7a5e0();
      }
      thunk_FUN_00c5a200(7);
      thunk_FUN_00a80300();
      iStack_2c = thunk_FUN_00aa02e0();
      if (iStack_2c != 0) {
        iStack_90 = thunk_FUN_00c8c9a0(0x2c);
        iStack_8 = 2;
        if (iStack_90 == 0) {
          uStack_b4 = 0;
        }
        else {
          fVar4 = (float10)thunk_FUN_00aa36c0();
          uVar3 = thunk_FUN_00aa3720(auStack_8c,param_2,(float)fVar4);
          iStack_8 = CONCAT31(iStack_8._1_3_,3);
          uStack_80 = uStack_80 | 1;
          uStack_b4 = thunk_FUN_00b6cfc0(param_2,uVar3);
        }
        uStack_94 = uStack_b4;
        *(undefined4 *)(iStack_14 + 0xb4) = uStack_b4;
        iStack_8 = 0xffffffff;
        if ((uStack_80 & 1) != 0) {
          uStack_80 = uStack_80 & 0xfffffffe;
          thunk_FUN_00a7a5e0();
        }
        thunk_FUN_00b6ed70();
        iStack_8 = 5;
        fVar4 = (float10)thunk_FUN_00bb7bc0();
        afStack_3c[0] = (float)fVar4;
        thunk_FUN_00a833e0(0x18c51f8);
        thunk_FUN_00bb7be0(afStack_3c);
        iStack_8 = 0xffffffff;
        thunk_FUN_00b6eda0();
      }
    }
  }
  ExceptionList = pvStack_10;
  return;
}


```

## FUN_00bbffb0 — 00bbffb0

- 函数名: FUN_00bbffb0
- 函数体: 2837 字节
- 调用者数: 0 / 被调用者数: 38

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_00bbffb0(int param_1,undefined4 param_2,int param_3,undefined4 *param_4)

{
  byte bVar1;
  char cVar2;
  undefined1 uVar3;
  int iVar4;
  undefined4 uVar5;
  uint uVar6;
  undefined4 *puVar7;
  float10 fVar8;
  undefined4 uStack_14c;
  int iStack_ec;
  char cStack_e5;
  undefined1 auStack_e4 [12];
  undefined4 uStack_d8;
  int iStack_d4;
  int aiStack_d0 [26];
  int iStack_68;
  undefined4 uStack_64;
  undefined4 uStack_60;
  undefined4 uStack_5c;
  undefined4 uStack_58;
  float fStack_54;
  float fStack_50;
  float fStack_4c;
  int iStack_48;
  undefined2 uStack_44;
  undefined4 uStack_40;
  undefined4 uStack_3c;
  undefined4 uStack_38;
  undefined4 uStack_34;
  float fStack_30;
  float fStack_2c;
  float fStack_28;
  undefined4 uStack_24;
  undefined1 auStack_20 [12];
  int iStack_14;
  void *pvStack_10;
  undefined *puStack_c;
  undefined4 uStack_8;
  
  uStack_8 = 0xffffffff;
  puStack_c = &UNK_0162277c;
  pvStack_10 = ExceptionList;
  ExceptionList = &pvStack_10;
  iStack_14 = param_1;
  if ((*(char *)(param_1 + 0x1b8) == '\0') &&
     (iVar4 = thunk_FUN_00c5a200(_DAT_018bcc60 ^ (uint)&stack0xfffffffc), iVar4 != 0)) {
    thunk_FUN_00c5a200();
    cVar2 = thunk_FUN_00a7ba60();
    if (cVar2 == '\0') goto LAB_00bc001e;
    uStack_14c._0_1_ = 1;
  }
  else {
LAB_00bc001e:
    uStack_14c._0_1_ = 0;
  }
  *(undefined1 *)(iStack_14 + 0xb0) = (undefined1)uStack_14c;
  *(undefined1 *)(iStack_14 + 0x1bb) = 0;
  if (*(int *)(iStack_14 + 0xb4) != 0) {
    if (*(undefined4 **)(iStack_14 + 0xb4) != (undefined4 *)0x0) {
      (**(code **)**(undefined4 **)(iStack_14 + 0xb4))(1);
    }
    *(undefined4 *)(iStack_14 + 0xb4) = 0;
  }
  *(undefined1 *)(iStack_14 + 0xcc) = 0;
  *(undefined1 *)(iStack_14 + 0xc3) = 0;
  *(undefined4 *)(iStack_14 + 0x48) = 0;
  thunk_FUN_00a833e0(0x18bebcc);
  uVar5 = thunk_FUN_00a7a5a0(0x3f800000,0,0);
  uStack_8 = 0;
  thunk_FUN_00a833e0(uVar5);
  uStack_8 = 0xffffffff;
  thunk_FUN_00a7a5e0();
  *(undefined1 *)(iStack_14 + 0xc0) = 1;
  *(undefined4 *)(iStack_14 + 0x1c0) = 0;
  *(undefined4 *)(iStack_14 + 0xd4) = 0x3f800000;
  *(undefined1 *)(iStack_14 + 0x1b9) = 0;
  uVar5 = thunk_FUN_00bd1170();
  uStack_8 = 1;
  thunk_FUN_00bc0d90(uVar5);
  uStack_8 = 0xffffffff;
  thunk_FUN_00bd11b0();
  uVar5 = thunk_FUN_00bd1400();
  uStack_8 = 2;
  thunk_FUN_00bc0de0(uVar5);
  uStack_8 = 0xffffffff;
  thunk_FUN_00bd1440();
  uVar5 = thunk_FUN_00bd1400();
  uStack_8 = 3;
  thunk_FUN_00bc0de0(uVar5);
  uStack_8 = 0xffffffff;
  thunk_FUN_00bd1440();
  *(undefined4 *)(iStack_14 + 200) = 0;
  *(undefined4 *)(iStack_14 + 0xac) = 0;
  *(undefined4 *)(iStack_14 + 0x100) = 0;
  *(undefined1 *)(iStack_14 + 0xb1) = 0;
  thunk_FUN_00a833e0(iStack_14 + 0x1c);
  *(undefined2 *)(iStack_14 + 8) = 0;
  *(undefined1 *)(iStack_14 + 0x20c) = 0;
  *(undefined4 *)(iStack_14 + 0xbc) = 0;
  if ((param_3 < 0) || (_DAT_01950f9c <= param_3)) {
    iVar4 = thunk_FUN_00c5a200();
    if (iVar4 == 0) {
      uVar3 = thunk_FUN_00bbf1f0(1);
      *(undefined1 *)(iStack_14 + 0x3c) = uVar3;
    }
    else {
      do {
        uVar3 = thunk_FUN_00bbf1f0(1);
        *(undefined1 *)(iStack_14 + 0x3c) = uVar3;
        bVar1 = *(byte *)(iStack_14 + 0x3c);
        thunk_FUN_00c5a200();
        uVar6 = thunk_FUN_00a803e0();
      } while (bVar1 == uVar6);
    }
  }
  else {
    *(undefined1 *)(iStack_14 + 0x3c) = (undefined1)param_3;
  }
  if ((_DAT_01950b6c & 1) == 0) {
    _DAT_01950b6c = _DAT_01950b6c | 1;
    uStack_8 = 4;
    _DAT_01950c70 = thunk_FUN_00bbde60(&UNK_01709054,0);
    uStack_8 = 0xffffffff;
  }
  cVar2 = thunk_FUN_00c597a0();
  if ((cVar2 != '\0') && (*(byte *)(iStack_14 + 0x3c) == _DAT_01950c70)) {
    *(char *)(iStack_14 + 0x3c) = *(char *)(iStack_14 + 0x3c) + -1;
  }
  iVar4 = thunk_FUN_00bd02a0();
  if (*(int *)(iVar4 + 0x32c) != 0) {
    _DAT_01950fa8 = _DAT_01950fa8 + 1;
  }
  if (param_4 == (undefined4 *)0x0) {
    uStack_14c = 0x3f800000;
  }
  else {
    uStack_14c = *param_4;
  }
  thunk_FUN_00bc1090(*(undefined1 *)(iStack_14 + 0x3c),uStack_14c);
  if (*(char *)(iStack_14 + 0xc1) != '\0') {
    iStack_ec = iStack_14;
    thunk_FUN_00bd1680(auStack_20,&iStack_ec);
    uStack_8 = 5;
    uStack_24 = 0;
    uVar5 = thunk_FUN_00b16ef0(auStack_e4);
    uStack_8._0_1_ = 6;
    cStack_e5 = thunk_FUN_00bd1930(uVar5);
    uStack_8._0_1_ = 5;
    thunk_FUN_00b16a70();
    if (cStack_e5 == '\0') {
      cVar2 = thunk_FUN_00c596a0();
      if ((cVar2 == '\0') || (DAT_0197f444 == '\0')) {
        iStack_d4 = thunk_FUN_00c8c9a0(0x110);
        uStack_8._0_1_ = 7;
        if (iStack_d4 == 0) {
          uStack_14c = 0;
        }
        else {
          uStack_14c = thunk_FUN_00b1eee0(iStack_14);
        }
        uStack_d8 = uStack_14c;
        uStack_8 = CONCAT31(uStack_8._1_3_,5);
        uStack_24 = uStack_14c;
        thunk_FUN_00be76a0(uStack_14c,0);
        aiStack_d0[0] = iStack_14;
        puVar7 = (undefined4 *)thunk_FUN_00b16500(aiStack_d0);
        *puVar7 = uStack_24;
      }
      else {
        *(undefined4 *)(iStack_14 + 0x104) = 0;
      }
    }
    uStack_8 = 0xffffffff;
    thunk_FUN_00b16a70();
  }
  *(uint *)(iStack_14 + 0xc) = *(uint *)(iStack_14 + 0xc) | 2;
  *(uint *)(iStack_14 + 0xc) = *(uint *)(iStack_14 + 0xc) & 0xffffffef;
  *(undefined1 *)(iStack_14 + 0x1bc) = 0;
  *(undefined1 *)(iStack_14 + 0xc4) = 0;
  *(undefined4 *)(iStack_14 + 0x104) = _DAT_016ee204;
  *(undefined4 *)(iStack_14 + 0xd0) = 0;
  *(undefined4 *)(iStack_14 + 0x84) = 0;
  thunk_FUN_00a833e0(0x18bebcc);
  thunk_FUN_00c6b930(_DAT_01701da4);
  fVar8 = (float10)thunk_FUN_00a82f20();
  fStack_28 = (float)(fVar8 - (float10)_DAT_01701d98);
  thunk_FUN_00c6b930(_DAT_01701da4);
  fVar8 = (float10)thunk_FUN_00a82f20();
  fStack_2c = (float)(fVar8 - (float10)_DAT_01701d98);
  thunk_FUN_00c6b930(_DAT_01701da4);
  fVar8 = (float10)thunk_FUN_00a82f20();
  fStack_30 = (float)(fVar8 - (float10)_DAT_01701d98);
  thunk_FUN_00b16490();
  uStack_8 = 8;
  thunk_FUN_00bcfb60(&uStack_40,0);
  iVar4 = thunk_FUN_00bd02a0();
  if (*(char *)(iVar4 + 0x330) != '\0') {
    thunk_FUN_00b1a350(_DAT_016f844c,_DAT_01712f30,0);
    uStack_44 = thunk_FUN_01553d40();
    thunk_FUN_00b1a230(0,0x3f800000,0,uStack_44);
    fStack_28 = _DAT_016ec7d8;
    fStack_2c = 0.0;
    fVar8 = (float10)thunk_FUN_00b1a350(_DAT_01701ed0,_DAT_016fcab4,_DAT_016ef758);
    fStack_30 = (float)fVar8;
  }
  for (iStack_48 = 0; iStack_48 < 2; iStack_48 = iStack_48 + 1) {
    thunk_FUN_00a833e0(0x18bebbc);
    thunk_FUN_00a833e0(0x18c51f8);
    thunk_FUN_00a833e0(0x18c51e8);
    uVar5 = thunk_FUN_00a7a5a0(fStack_28,fStack_2c,fStack_30);
    uStack_8._0_1_ = 9;
    thunk_FUN_00a833e0(uVar5);
    uStack_8 = CONCAT31(uStack_8._1_3_,8);
    thunk_FUN_00a7a5e0();
    puVar7 = (undefined4 *)(iStack_14 + 0x134 + iStack_48 * 0x10);
    *puVar7 = uStack_40;
    puVar7[1] = uStack_3c;
    puVar7[2] = uStack_38;
    puVar7[3] = uStack_34;
    *(undefined4 *)(iStack_14 + 0x40 + iStack_48 * 4) = 0;
  }
  if ((*(char *)(iStack_14 + 0xc1) != '\0') || (*(char *)(iStack_14 + 0xc2) != '\0')) {
    thunk_FUN_00c6b930(_DAT_01701da4);
    fVar8 = (float10)thunk_FUN_00a82f20();
    fStack_4c = (float)(fVar8 - (float10)_DAT_01701d98);
    thunk_FUN_00c6b930(_DAT_01701da4);
    fVar8 = (float10)thunk_FUN_00a82f20();
    fStack_50 = (float)(fVar8 - (float10)_DAT_01701d98);
    thunk_FUN_00c6b930(_DAT_01701da4);
    fVar8 = (float10)thunk_FUN_00a82f20();
    fStack_54 = (float)(fVar8 - (float10)_DAT_01701d98);
    thunk_FUN_00b16490();
    uStack_8 = CONCAT31(uStack_8._1_3_,10);
    thunk_FUN_00b1a230(0x3f800000,0,0,0x3ffc);
    fStack_4c = 0.0;
    fStack_50 = (float)_DAT_01701d90;
    fVar8 = (float10)thunk_FUN_00b1a350(_DAT_016f2d84,_DAT_016fcab4,_DAT_016ef758);
    fStack_54 = (float)fVar8;
    for (iStack_68 = 0; iStack_68 < 2; iStack_68 = iStack_68 + 1) {
      thunk_FUN_00a833e0(0x18bebbc);
      thunk_FUN_00a833e0(0x18c51f8);
      thunk_FUN_00a833e0(0x18c51e8);
      uVar5 = thunk_FUN_00a7a5a0(fStack_4c,fStack_50,fStack_54);
      uStack_8._0_1_ = 0xb;
      thunk_FUN_00a833e0(uVar5);
      uStack_8 = CONCAT31(uStack_8._1_3_,10);
      thunk_FUN_00a7a5e0();
      puVar7 = (undefined4 *)(iStack_14 + 0x134 + iStack_68 * 0x10);
      *puVar7 = uStack_64;
      puVar7[1] = uStack_60;
      puVar7[2] = uStack_5c;
      puVar7[3] = uStack_58;
    }
    uStack_8 = CONCAT31(uStack_8._1_3_,8);
    thunk_FUN_00b164e0();
  }
  *(undefined4 *)(iStack_14 + 100) = 0;
  *(undefined4 *)(iStack_14 + 0x68) = 0x4b;
  *(undefined4 *)(iStack_14 + 0x6c) = 4;
  *(undefined1 *)(iStack_14 + 0x3f) = 1;
  *(undefined4 *)(iStack_14 + 0x70) = 0;
  iVar4 = thunk_FUN_00c5a200();
  if (iVar4 != 0) {
    thunk_FUN_00c5a200(3);
    thunk_FUN_00a80300();
    cVar2 = thunk_FUN_00a9ff70();
    if (cVar2 == '\0') {
      thunk_FUN_00c5a200(_DAT_018befe4);
      thunk_FUN_00a80300();
      cVar2 = thunk_FUN_00a9ff40();
      if (cVar2 == '\0') goto LAB_00bc0a18;
    }
    *(undefined1 *)(iStack_14 + 0x3f) = 0;
  }
LAB_00bc0a18:
  *(undefined4 *)(iStack_14 + 0x1b4) = 0;
  *(undefined1 *)(iStack_14 + 0x1b8) = 0;
  *(undefined1 *)(iStack_14 + 0x1ba) = 1;
  fVar8 = (float10)thunk_FUN_00ae8940();
  *(float *)(iStack_14 + 0xd8) = (float)fVar8;
  uVar5 = thunk_FUN_00a7a5a0(0,_DAT_016f8bc8,0);
  uStack_8._0_1_ = 0xc;
  thunk_FUN_00a833e0(uVar5);
  uStack_8 = CONCAT31(uStack_8._1_3_,8);
  thunk_FUN_00a7a5e0();
  uStack_8 = 0xffffffff;
  thunk_FUN_00b164e0();
  ExceptionList = pvStack_10;
  return;
}


```

## FUN_00bc0d90 — 00bc0d90

- 函数名: FUN_00bc0d90
- 函数体: 60 字节
- 调用者数: 0 / 被调用者数: 1

```c

int __thiscall FUN_00bc0d90(int param_1,int param_2)

{
  thunk_FUN_00bd1340(param_2);
  *(undefined4 *)(param_1 + 0x10) = *(undefined4 *)(param_2 + 0x10);
  *(undefined4 *)(param_1 + 0x14) = *(undefined4 *)(param_2 + 0x14);
  return param_1;
}


```

## FUN_00bc0de0 — 00bc0de0

- 函数名: FUN_00bc0de0
- 函数体: 60 字节
- 调用者数: 0 / 被调用者数: 1

```c

int __thiscall FUN_00bc0de0(int param_1,int param_2)

{
  thunk_FUN_00bd15c0(param_2);
  *(undefined4 *)(param_1 + 0x10) = *(undefined4 *)(param_2 + 0x10);
  *(undefined4 *)(param_1 + 0x14) = *(undefined4 *)(param_2 + 0x14);
  return param_1;
}


```

## FUN_00bc0e30 — 00bc0e30

- 函数名: FUN_00bc0e30
- 函数体: 75 字节
- 调用者数: 0 / 被调用者数: 1

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_00bc0e30(int param_1,int param_2)

{
  char cVar1;
  
  cVar1 = thunk_FUN_00c597a0();
  if ((cVar1 != '\0') && (param_2 == 2)) {
    *(float *)(*(int *)(param_1 + 0x38) + 0x14) =
         *(float *)(*(int *)(param_1 + 0x38) + 0x14) * (float)_DAT_01712f38;
  }
  *(int *)(param_1 + 0x84) = param_2;
  return;
}


```

## FUN_00bc0e90 — 00bc0e90

- 函数名: FUN_00bc0e90
- 函数体: 409 字节
- 调用者数: 0 / 被调用者数: 6

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_00bc0e90(int param_1,char param_2)

{
  float fVar1;
  float fVar2;
  int iVar3;
  undefined4 uVar4;
  undefined4 uStack_74;
  void *pvStack_10;
  undefined *puStack_c;
  undefined4 uStack_8;
  
  uStack_8 = 0xffffffff;
  puStack_c = &UNK_016227e3;
  pvStack_10 = ExceptionList;
  ExceptionList = &pvStack_10;
  if (param_2 != '\0') {
    iVar3 = thunk_FUN_00bd02a0(_DAT_018bcc60 ^ (uint)&stack0xfffffffc);
    fVar1 = *(float *)(iVar3 + 0x244);
    fVar2 = (float)_DAT_01712f48;
    iVar3 = thunk_FUN_00bd02a0();
    if ((float)_DAT_016ec7e0 < *(float *)(iVar3 + 0x248) + fVar1 * fVar2) {
      if (*(int *)(param_1 + 0x38) == 0) {
        iVar3 = thunk_FUN_00c8c9a0(0x20);
        uStack_8 = 0;
        if (iVar3 == 0) {
          uStack_74 = 0;
        }
        else {
          uStack_74 = thunk_FUN_00df0c80();
        }
        uStack_8 = 0xffffffff;
        *(undefined4 *)(param_1 + 0x38) = uStack_74;
      }
      uVar4 = thunk_FUN_00a7a5a0(*(undefined4 *)(param_1 + 0x10),*(undefined4 *)(param_1 + 0x14),0);
      uStack_8 = 1;
      thunk_FUN_00a833e0(uVar4);
      uStack_8 = 0xffffffff;
      thunk_FUN_00a7a5e0();
      iVar3 = thunk_FUN_00bd02a0();
      fVar1 = *(float *)(iVar3 + 0x244);
      fVar2 = (float)_DAT_01712f48;
      iVar3 = thunk_FUN_00bd02a0();
      *(float *)(*(int *)(param_1 + 0x38) + 0x14) = *(float *)(iVar3 + 0x248) + fVar1 * fVar2;
      ExceptionList = pvStack_10;
      return;
    }
  }
  if (*(int *)(param_1 + 0x38) != 0) {
    if (*(undefined4 **)(param_1 + 0x38) != (undefined4 *)0x0) {
      (**(code **)**(undefined4 **)(param_1 + 0x38))(1);
    }
    *(undefined4 *)(param_1 + 0x38) = 0;
  }
  ExceptionList = pvStack_10;
  return;
}


```

## FUN_00bc1090 — 00bc1090

- 函数名: FUN_00bc1090
- 函数体: 839 字节
- 调用者数: 0 / 被调用者数: 9

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_00bc1090(int param_1,int param_2,float param_3)

{
  float fVar1;
  float fVar2;
  uint uVar3;
  int iVar4;
  int iVar5;
  undefined4 uVar6;
  undefined4 uStack_9c;
  undefined1 auStack_98 [12];
  undefined4 uStack_8c;
  undefined1 auStack_88 [12];
  undefined1 auStack_7c [12];
  undefined4 uStack_70;
  int iStack_6c;
  undefined4 *puStack_5c;
  undefined4 *puStack_58;
  int iStack_14;
  void *pvStack_10;
  undefined *puStack_c;
  int iStack_8;
  
  iStack_8 = 0xffffffff;
  puStack_c = &UNK_01622841;
  pvStack_10 = ExceptionList;
  uVar3 = _DAT_018bcc60 ^ (uint)&stack0xfffffffc;
  ExceptionList = &pvStack_10;
  *(undefined1 *)(param_1 + 0x3c) = (undefined1)param_2;
  iStack_14 = param_1;
  if (param_2 < 0) {
LAB_00bc10f8:
    uStack_9c._0_1_ = 0;
  }
  else {
    iVar4 = thunk_FUN_00bbe070(param_2,uVar3);
    iVar5 = thunk_FUN_00a6dff0(&UNK_016f87c8);
    if (iVar4 != iVar5) goto LAB_00bc10f8;
    uStack_9c._0_1_ = 1;
  }
  *(undefined1 *)(iStack_14 + 0xc1) = (undefined1)uStack_9c;
  if (-1 < param_2) {
    iVar4 = thunk_FUN_00bbe070(param_2,uVar3);
    iVar5 = thunk_FUN_00a6dff0(&UNK_01701cd0);
    if (iVar4 == iVar5) {
      uStack_9c._0_1_ = 1;
      goto LAB_00bc114c;
    }
  }
  uStack_9c._0_1_ = 0;
LAB_00bc114c:
  *(undefined1 *)(iStack_14 + 0xc2) = (undefined1)uStack_9c;
  uStack_8c = _DAT_01701f10;
  iVar4 = thunk_FUN_00bd02a0(auStack_88,&uStack_8c,auStack_7c,&param_3);
  thunk_FUN_00a8ac90(auStack_98,iVar4 + 0x244);
  iStack_8 = 0;
  thunk_FUN_00a8ac90();
  iStack_8._0_1_ = 1;
  uVar6 = thunk_FUN_00a8ac90();
  iStack_8._0_1_ = 2;
  thunk_FUN_00a833e0(uVar6);
  iStack_8._0_1_ = 1;
  thunk_FUN_00a7a5e0();
  iStack_8 = (uint)iStack_8._1_3_ << 8;
  thunk_FUN_00a7a5e0();
  iStack_8 = 0xffffffff;
  thunk_FUN_00a7a5e0();
  thunk_FUN_00a833e0(iStack_14 + 0x28);
  iVar4 = thunk_FUN_00bd02a0();
  fVar1 = *(float *)(iVar4 + 0x244);
  fVar2 = (float)_DAT_01712f48;
  iVar4 = thunk_FUN_00bd02a0();
  if (*(float *)(iVar4 + 0x248) + fVar1 * fVar2 <= (float)_DAT_016ec7e0) {
    if (*(int *)(iStack_14 + 0x38) != 0) {
      puStack_5c = *(undefined4 **)(iStack_14 + 0x38);
      if (puStack_5c != (undefined4 *)0x0) {
        puStack_58 = puStack_5c;
        (**(code **)*puStack_5c)(1);
      }
      *(undefined4 *)(iStack_14 + 0x38) = 0;
    }
  }
  else {
    if (*(int *)(iStack_14 + 0x38) == 0) {
      iStack_6c = thunk_FUN_00c8c9a0(0x20);
      iStack_8 = 3;
      if (iStack_6c == 0) {
        uStack_9c = 0;
      }
      else {
        uStack_9c = thunk_FUN_00df0c80();
      }
      uStack_70 = uStack_9c;
      iStack_8 = 0xffffffff;
      *(undefined4 *)(iStack_14 + 0x38) = uStack_9c;
    }
    uVar6 = thunk_FUN_00a7a5a0(*(undefined4 *)(iStack_14 + 0x10),*(undefined4 *)(iStack_14 + 0x14),0
                              );
    iStack_8 = 4;
    thunk_FUN_00a833e0(uVar6);
    iStack_8 = 0xffffffff;
    thunk_FUN_00a7a5e0();
    iVar4 = thunk_FUN_00bd02a0();
    fVar1 = *(float *)(iVar4 + 0x244);
    fVar2 = (float)_DAT_01712f48;
    iVar4 = thunk_FUN_00bd02a0();
    *(float *)(*(int *)(iStack_14 + 0x38) + 0x14) =
         (*(float *)(iVar4 + 0x248) + fVar1 * fVar2) * param_3;
  }
  ExceptionList = pvStack_10;
  return;
}


```

## FUN_00bc14b0 — 00bc14b0

- 函数名: FUN_00bc14b0
- 函数体: 229 字节
- 调用者数: 0 / 被调用者数: 3

```c

void __fastcall FUN_00bc14b0(int param_1)

{
  int iStack_c;
  
  for (iStack_c = 0; iStack_c < 2; iStack_c = iStack_c + 1) {
    if (*(int *)(param_1 + 0x40 + iStack_c * 4) != 0) {
      thunk_FUN_00b651c0(*(undefined4 *)(param_1 + 0x40 + iStack_c * 4));
      thunk_FUN_00b6c220();
      *(undefined4 *)(param_1 + 0x40 + iStack_c * 4) = 0;
    }
  }
  if ((*(int *)(param_1 + 0x1b4) != 0) && (*(int *)(*(int *)(param_1 + 0x1b4) + 0x13c) == param_1))
  {
    *(undefined4 *)(*(int *)(param_1 + 0x1b4) + 0x13c) = 0;
  }
  if (*(int *)(param_1 + 0xb4) != 0) {
    if (*(undefined4 **)(param_1 + 0xb4) != (undefined4 *)0x0) {
      (**(code **)**(undefined4 **)(param_1 + 0xb4))(1);
    }
    *(undefined4 *)(param_1 + 0xb4) = 0;
  }
  thunk_FUN_00ace260();
  return;
}


```

