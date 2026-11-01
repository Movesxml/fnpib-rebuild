# 字符串定位报告（立即数扫描）

- 程序: FruitNinjaPIB.exe
- 已定义函数: 129503
- 命中函数: 5，裸引用点(未纳入函数): 0

## FUN_00bbdf50 — 00bbdf50
命中: fruit.cpp@01712b50(imm)

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

int FUN_00bbdf50(int param_1)

{
  int iVar1;
  
  if ((param_1 < 0) || (_DAT_01950f9c <= param_1)) {
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00c93660(&UNK_016ec78c);
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00a6fd50(&UNK_01712ba8);
    thunk_FUN_00c93610(&UNK_016ec474);
    thunk_FUN_00c93660(&UNK_016ec434);
    thunk_FUN_00c93660(&UNK_01712b50);
    thunk_FUN_00c94580(0xffff);
    thunk_FUN_00c93660(&UNK_016ec434);
    if (DAT_01950f97 == '\0') {
      iVar1 = thunk_FUN_00c93390();
      if (iVar1 == 0) {
        DebugBreak();
      }
      else if (iVar1 == 2) {
        DAT_01950f97 = '\x01';
      }
    }
  }
  return param_1 * 0x338 + _DAT_01950fa0;
}


```

## FUN_00bbe070 — 00bbe070
命中: fruit.cpp@01712bd8(imm)

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 FUN_00bbe070(int param_1)

{
  int iVar1;
  
  if ((param_1 < 0) || (_DAT_01950f9c <= param_1)) {
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00c93660(&UNK_016ec78c);
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00a6fd50(&UNK_01712ba8);
    thunk_FUN_00c93610(&UNK_016ec474);
    thunk_FUN_00c93660(&UNK_016ec434);
    thunk_FUN_00c93660(&UNK_01712bd8);
    thunk_FUN_00c94580(0xffff);
    thunk_FUN_00c93660(&UNK_016ec434);
    if (DAT_01950fb0 == '\0') {
      iVar1 = thunk_FUN_00c93390();
      if (iVar1 == 0) {
        DebugBreak();
      }
      else if (iVar1 == 2) {
        DAT_01950fb0 = '\x01';
      }
    }
  }
  return *(undefined4 *)(_DAT_01950fa0 + 0x250 + param_1 * 0x338);
}


```

## FUN_00bbe190 — 00bbe190
命中: fruit.cpp@01712c30(imm)

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

int FUN_00bbe190(int param_1)

{
  int iVar1;
  
  if ((param_1 < 0) || (_DAT_01950f9c <= param_1)) {
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00c93660(&UNK_016ec78c);
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00a6fd50(&UNK_01712ba8);
    thunk_FUN_00c93610(&UNK_016ec474);
    thunk_FUN_00c93660(&UNK_016ec434);
    thunk_FUN_00c93660(&UNK_01712c30);
    thunk_FUN_00c94580(0xffff);
    thunk_FUN_00c93660(&UNK_016ec434);
    if (DAT_01950fb1 == '\0') {
      iVar1 = thunk_FUN_00c93390();
      if (iVar1 == 0) {
        DebugBreak();
      }
      else if (iVar1 == 2) {
        DAT_01950fb1 = '\x01';
      }
    }
  }
  return _DAT_01950fa0 + 0x278 + param_1 * 0x338;
}


```

## FUN_00bbe570 — 00bbe570
命中: fruit.cpp@01712d68(imm)

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

int FUN_00bbe570(int param_1)

{
  int iVar1;
  
  if ((param_1 < 0) || (_DAT_01950f9c <= param_1)) {
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00c93660(&UNK_016ec78c);
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00a6fd50(&UNK_01712ba8);
    thunk_FUN_00c93610(&UNK_016ec474);
    thunk_FUN_00c93660(&UNK_016ec434);
    thunk_FUN_00c93660(&UNK_01712d68);
    thunk_FUN_00c94580(0xffff);
    thunk_FUN_00c93660(&UNK_016ec434);
    if (DAT_01950fb4 == '\0') {
      iVar1 = thunk_FUN_00c93390();
      if (iVar1 == 0) {
        DebugBreak();
      }
      else if (iVar1 == 2) {
        DAT_01950fb4 = '\x01';
      }
    }
  }
  return param_1 * 0x338 + _DAT_01950fa0;
}


```

## FUN_00bbe690 — 00bbe690
命中: fruit.cpp@01712e80(imm)

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00bbe690(int *param_1,int *param_2,int param_3,int param_4)

{
  undefined4 uVar1;
  int iVar2;
  int iStack_a0;
  int iStack_9c;
  int iStack_58;
  undefined1 auStack_54 [64];
  uint uStack_14;
  void *pvStack_10;
  undefined *puStack_c;
  undefined4 uStack_8;
  
  uStack_8 = 0xffffffff;
  puStack_c = &UNK_0162235c;
  pvStack_10 = ExceptionList;
  uStack_14 = _DAT_018bcc60 ^ (uint)&stack0xfffffffc;
  ExceptionList = &pvStack_10;
  if (param_3 < 0) {
    param_3 = thunk_FUN_00a7d930(_DAT_01950f9c,uStack_14);
  }
  if ((param_3 < 0) || (_DAT_01950f9c <= param_3)) {
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00c93660(&UNK_016ec78c);
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00a6fd50(&UNK_01712ba8);
    thunk_FUN_00c93610(&UNK_016ec474);
    thunk_FUN_00c93660(&UNK_016ec434);
    thunk_FUN_00c93660(&UNK_01712e80);
    thunk_FUN_00c94580(0xffff);
    thunk_FUN_00c93660(&UNK_016ec434);
    if (DAT_01950fb5 == '\0') {
      iVar2 = thunk_FUN_00c93390();
      if (iVar2 == 0) {
        DebugBreak();
      }
      else if (iVar2 == 2) {
        DAT_01950fb5 = '\x01';
      }
    }
  }
  if (param_3 < 1) {
    iStack_9c = 0;
  }
  else {
    if (param_3 < _DAT_01950f9c + -2) {
      iStack_a0 = param_3;
    }
    else {
      iStack_a0 = _DAT_01950f9c + -2;
    }
    iStack_9c = iStack_a0;
  }
  param_3 = iStack_9c;
  if ((_DAT_01950b50 & 1) == 0) {
    _DAT_01950b50 = _DAT_01950b50 | 1;
    uStack_8 = 0;
    _DAT_01950d7c = thunk_FUN_00bbde60(&UNK_01709098,0);
    uStack_8 = 0xffffffff;
  }
  if ((_DAT_01950b50 & 2) == 0) {
    _DAT_01950b50 = _DAT_01950b50 | 2;
    uStack_8 = 1;
    _DAT_01950d84 = thunk_FUN_00bbde60(&UNK_017090a4,0);
    uStack_8 = 0xffffffff;
  }
  if (iStack_9c == _DAT_01950d7c) {
    param_3 = _DAT_01950d84;
  }
  if (param_1 != (int *)0x0) {
    *param_1 = param_3;
  }
  if (param_4 < 0) {
    if (*(int *)(_DAT_01950fa0 + 0x270 + param_3 * 0x338) < 1) {
      thunk_FUN_00bbe690(param_1,param_2,0xffffffff,0xffffffff);
      goto LAB_00bbebd9;
    }
    uVar1 = thunk_FUN_00a6dff0(&UNK_01712e74,1,1,1);
    thunk_FUN_00c37ff0(&UNK_01712e74,uVar1);
    thunk_FUN_00c916e0(auStack_54,0x40,&UNK_01712e68,param_3 * 0x338 + _DAT_01950fa0);
    uVar1 = thunk_FUN_00a6dff0(auStack_54,1,1,1);
    iVar2 = thunk_FUN_00c37ff0(auStack_54,uVar1);
    param_4 = (iVar2 + -1) % *(int *)(_DAT_01950fa0 + 0x270 + param_3 * 0x338);
  }
  if ((param_4 < 0) || (*(int *)(_DAT_01950fa0 + 0x270 + param_3 * 0x338) <= param_4)) {
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00c93660(&UNK_016ec78c);
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00a6fd50(&UNK_01712e30);
    thunk_FUN_00c93610(&UNK_016ec474);
    thunk_FUN_00c93660(&UNK_016ec434);
    thunk_FUN_00c93660(&UNK_01712dd8);
    thunk_FUN_00c94580(0xffff);
    thunk_FUN_00c93660(&UNK_016ec434);
    if (DAT_01950fb6 == '\0') {
      iVar2 = thunk_FUN_00c93390();
      if (iVar2 == 0) {
        DebugBreak();
      }
      else if (iVar2 == 2) {
        DAT_01950fb6 = '\x01';
      }
    }
  }
  if (param_4 < 1) {
    iStack_9c = 0;
  }
  else {
    if (param_4 < *(int *)(_DAT_01950fa0 + 0x270 + param_3 * 0x338) + -1) {
      iStack_a0 = param_4;
    }
    else {
      iStack_a0 = *(int *)(_DAT_01950fa0 + 0x270 + param_3 * 0x338) + -1;
    }
    iStack_9c = iStack_a0;
  }
  if (param_2 != (int *)0x0) {
    *param_2 = iStack_9c;
  }
  for (iStack_58 = 0;
      (iVar2 = thunk_FUN_015523b0(iStack_9c * 0x100 +
                                  *(int *)(_DAT_01950fa0 + 0x274 + param_3 * 0x338),&UNK_01712dc0),
      iVar2 == 0 || (*(int *)(_DAT_01950fa0 + 0x270 + param_3 * 0x338) <= iStack_58));
      iStack_58 = iStack_58 + 1) {
    if ((iStack_9c + 1 < 0) ||
       (*(int *)(_DAT_01950fa0 + 0x270 + param_3 * 0x338) + -1 < iStack_9c + 1)) 
/* ...截断... */
```

