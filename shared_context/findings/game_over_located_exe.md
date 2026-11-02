# 字符串定位报告（立即数扫描）

- 程序: FruitNinjaPIB.exe
- 已定义函数: 129503
- 命中函数: 4，裸引用点(未纳入函数): 0

## FUN_00b29ab0 — 00b29ab0
命中: originalmodecontrol.cpp@01703f28(imm)

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __fastcall FUN_00b29ab0(char *param_1)

{
  char cVar1;
  int iVar2;
  undefined4 *puStack_7c;
  void *pvStack_10;
  undefined *puStack_c;
  undefined4 uStack_8;
  
  uStack_8 = 0xffffffff;
  puStack_c = &UNK_01612c8b;
  pvStack_10 = ExceptionList;
  ExceptionList = &pvStack_10;
  if (*param_1 != '\0') {
    thunk_FUN_00c93660(&UNK_016ec4b0,_DAT_018bcc60 ^ (uint)&stack0xfffffffc);
    thunk_FUN_00c93660(&UNK_01704050);
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00a6fd50(&UNK_0170403c);
    thunk_FUN_00c93610(&UNK_016ec474);
    thunk_FUN_00c93660(&UNK_016ec434);
    thunk_FUN_00c93660(&UNK_01703fd0);
    thunk_FUN_00c94580(0xffff);
    thunk_FUN_00c93660(&UNK_016ec434);
    if (DAT_018c55d4 == '\0') {
      iVar2 = thunk_FUN_00c93390();
      if (iVar2 == 0) {
        DebugBreak();
      }
      else if (iVar2 == 2) {
        DAT_018c55d4 = '\x01';
      }
    }
  }
  iVar2 = thunk_FUN_00c8c9a0(0x48);
  uStack_8 = 0;
  if (iVar2 == 0) {
    puStack_7c = (undefined4 *)0x0;
  }
  else {
    puStack_7c = (undefined4 *)thunk_FUN_00c98ca0(&UNK_01703fac);
  }
  uStack_8 = 0xffffffff;
  if (puStack_7c != (undefined4 *)0x0) {
    cVar1 = thunk_FUN_00c98e40(0);
    if (cVar1 == '\0') {
      if ((puStack_7c != (undefined4 *)0x0) && (puStack_7c != (undefined4 *)0x0)) {
        (**(code **)*puStack_7c)(1);
      }
      thunk_FUN_00c93660(&UNK_016ec4b0);
      thunk_FUN_00c93660(&UNK_016ec4a8);
      thunk_FUN_00c93660(&UNK_016ec4b0);
      thunk_FUN_00a6fd50(&UNK_01703e7c);
      thunk_FUN_00c93610(&UNK_016ec474);
      thunk_FUN_00c93660(&UNK_016ec434);
      thunk_FUN_00c93660(&UNK_01703e10);
      thunk_FUN_00c94580(0xffff);
      thunk_FUN_00c93660(&UNK_016ec434);
      if (DAT_018c55d6 == '\0') {
        iVar2 = thunk_FUN_00c93390();
        if (iVar2 == 0) {
          DebugBreak();
        }
        else if (iVar2 == 2) {
          DAT_018c55d6 = '\x01';
        }
      }
    }
    else {
      iVar2 = thunk_FUN_00a6ef60(&UNK_01703f9c);
      if (iVar2 == 0) {
        thunk_FUN_00c93660(&UNK_016ec4b0);
        thunk_FUN_00c93660(&UNK_016ec78c);
        thunk_FUN_00c93660(&UNK_016ec4b0);
        thunk_FUN_00a6fd50(&UNK_01703f94);
        thunk_FUN_00c93610(&UNK_016ec474);
        thunk_FUN_00c93660(&UNK_016ec434);
        thunk_FUN_00c93660(&UNK_01703f28);
        thunk_FUN_00c94580(0xffff);
        thunk_FUN_00c93660(&UNK_016ec434);
        if (DAT_018c55d5 == '\0') {
          iVar2 = thunk_FUN_00c93390();
          if (iVar2 == 0) {
            DebugBreak();
          }
          else if (iVar2 == 2) {
            DAT_018c55d5 = '\x01';
          }
        }
      }
      thunk_FUN_00a6ef60(&UNK_01703f1c);
      thunk_FUN_00a71290(&UNK_01703f0c,param_1 + 4);
      thunk_FUN_00a71290(&UNK_01703ef8,param_1 + 8);
      thunk_FUN_00a71290(&UNK_01703ee0,param_1 + 0xc);
      thunk_FUN_00a71290(&UNK_01703ed0,param_1 + 0x10);
      thunk_FUN_00c973d0(&UNK_01703ec4,param_1 + 0x14);
      thunk_FUN_00a6ef60(&UNK_01703ebc);
      thunk_FUN_00a71290(&UNK_016f4970,param_1 + 0x18);
      thunk_FUN_00a71290(&UNK_01703eac,param_1 + 0x1c);
      *param_1 = '\x01';
    }
  }
  ExceptionList = pvStack_10;
  return;
}


```

## FUN_00c622c0 — 00c622c0
命中: Game-over@0171e270(imm)

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00c622c0(void)

{
  int iStack_98;
  int iStack_94;
  int iStack_90;
  undefined1 auStack_8c [128];
  undefined4 *puStack_c;
  uint uStack_8;
  
  uStack_8 = _DAT_018bcc60 ^ (uint)&stack0xfffffffc;
  puStack_c = (undefined4 *)thunk_FUN_00da0f70();
  (**(code **)*puStack_c)(&UNK_01707330);
  (**(code **)*puStack_c)(&UNK_016ee65c);
  (**(code **)*puStack_c)(&UNK_01703d98);
  (**(code **)*puStack_c)(&UNK_01703c6c);
  (**(code **)*puStack_c)(&UNK_0171e54c);
  (**(code **)*puStack_c)(&UNK_0171e53c);
  (**(code **)*puStack_c)(&UNK_0171e52c);
  (**(code **)*puStack_c)(&UNK_0171e51c);
  (**(code **)*puStack_c)(&UNK_0171e50c);
  (**(code **)*puStack_c)(&UNK_0171e4fc);
  (**(code **)*puStack_c)(&UNK_0171e4ec);
  (**(code **)*puStack_c)(&UNK_0171e4dc);
  (**(code **)*puStack_c)(&UNK_0171e4cc);
  (**(code **)*puStack_c)(&UNK_0171e4bc);
  (**(code **)*puStack_c)(&UNK_0171e4ac);
  (**(code **)*puStack_c)(&UNK_0171e49c);
  (**(code **)*puStack_c)(&UNK_0171e484);
  (**(code **)*puStack_c)(&UNK_0171e46c);
  (**(code **)*puStack_c)(&UNK_0171e454);
  (**(code **)*puStack_c)(&UNK_0171e43c);
  (**(code **)*puStack_c)(&UNK_0171e424);
  (**(code **)*puStack_c)(&UNK_0171e40c);
  (**(code **)*puStack_c)(&UNK_0171e3f4);
  (**(code **)*puStack_c)(&UNK_0171e3dc);
  (**(code **)*puStack_c)(&UNK_0171e3c4);
  (**(code **)*puStack_c)(&UNK_0171e3b4);
  (**(code **)*puStack_c)(&UNK_0171e3a4);
  (**(code **)*puStack_c)(&UNK_0171e394);
  (**(code **)*puStack_c)(&UNK_0171e380);
  (**(code **)*puStack_c)(&UNK_0171e36c);
  (**(code **)*puStack_c)(&UNK_0171e358);
  (**(code **)*puStack_c)(&UNK_016f2c34);
  (**(code **)*puStack_c)(&UNK_016fcd24);
  (**(code **)*puStack_c)(&UNK_016fca74);
  (**(code **)*puStack_c)(&UNK_0171e344);
  (**(code **)*puStack_c)(&UNK_016f6b20);
  (**(code **)*puStack_c)(&UNK_0171e32c);
  (**(code **)*puStack_c)(&UNK_0171e314);
  (**(code **)*puStack_c)(&UNK_016f410c);
  (**(code **)*puStack_c)(&UNK_016f2c5c);
  (**(code **)*puStack_c)(&UNK_016f2c50);
  (**(code **)*puStack_c)(&UNK_016f2c44);
  (**(code **)*puStack_c)(&UNK_016f7f00);
  (**(code **)*puStack_c)(&UNK_0171e300);
  (**(code **)*puStack_c)(&UNK_016f40f8);
  (**(code **)*puStack_c)(&UNK_016f7e7c);
  (**(code **)*puStack_c)(&UNK_0171e2f0);
  (**(code **)*puStack_c)(&UNK_0171e2e0);
  (**(code **)*puStack_c)(&UNK_0171e2d0);
  (**(code **)*puStack_c)(&UNK_01713054);
  (**(code **)*puStack_c)(&UNK_016f8214);
  (**(code **)*puStack_c)(&UNK_0171e2c4);
  (**(code **)*puStack_c)(&UNK_0171e2b8);
  (**(code **)*puStack_c)(&UNK_0171e2ac);
  (**(code **)*puStack_c)(&UNK_01704e70);
  (**(code **)*puStack_c)(&UNK_0171e29c);
  (**(code **)*puStack_c)(&UNK_01713250);
  (**(code **)*puStack_c)(&UNK_01716264);
  (**(code **)*puStack_c)(&UNK_0171624c);
  (**(code **)*puStack_c)(&UNK_0171e28c);
  (**(code **)*puStack_c)(&UNK_01703dd4);
  (**(code **)*puStack_c)(&UNK_0171e27c);
  (**(code **)*puStack_c)(&UNK_016ef4f8);
  (**(code **)*puStack_c)(&UNK_0171e270);
  (**(code **)*puStack_c)(&UNK_01715b94);
  (**(code **)*puStack_c)(&UNK_016ef0cc);
  (**(code **)*puStack_c)(&UNK_016f31c0);
  (**(code **)*puStack_c)(&UNK_016f31d8);
  (**(code **)*puStack_c)(&UNK_0171e260);
  (**(code **)*puStack_c)(&UNK_0171e250);
  (**(code **)*puStack_c)(&UNK_0171e230);
  (**(code **)*puStack_c)(&UNK_0171e21c);
  (**(code **)*puStack_c)(&UNK_0171e208);
  (**(code **)*puStack_c)(&UNK_0171e1f8);
  (**(code **)*puStack_c)(&UNK_0171e1e4);
  (**(code **)*puStack_c)(&UNK_0171e1d4);
  (**(code **)*puStack_c)(&UNK_0171e1bc);
  (**(code **)*puStack_c)(&UNK_0171e1a4);
  (**(code **)*puStack_c)(&UNK_0171e198);
  (**(code **)*puStack_c)(&UNK_016f2dc8);
  (**(code **)*puStack_c)(&UNK_016f2db4);
  (**(code **)*puStack_c)(&UNK_016fcd48);
  (**(code **)*puStack_c)(&UNK_01716568);
  (**(code **)*puStack_c)(&UNK_0171e180);
  (**(code **)*puStack_c)(&UN
/* ...截断... */
```

## FUN_00c592e0 — 00c592e0
命中: game.cpp@0171d0ec(imm)

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00c592e0(int param_1,int param_2,char param_3)

{
  int iVar1;
  undefined4 uVar2;
  int iStack_5c;
  void *pvStack_10;
  undefined *puStack_c;
  undefined4 uStack_8;
  
  uStack_8 = 0xffffffff;
  puStack_c = &UNK_0163220e;
  pvStack_10 = ExceptionList;
  ExceptionList = &pvStack_10;
  if ((param_2 < 0) || (0 < param_2)) {
    thunk_FUN_00c93660(&UNK_016ec4b0,_DAT_018bcc60 ^ (uint)&stack0xfffffffc);
    thunk_FUN_00c93660(&UNK_016ec78c);
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00a6fd50(&UNK_0171d138);
    thunk_FUN_00c93610(&UNK_016ec474);
    thunk_FUN_00c93660(&UNK_016ec434);
    thunk_FUN_00c93660(&UNK_0171d0ec);
    thunk_FUN_00c94580(0xffff);
    thunk_FUN_00c93660(&UNK_016ec434);
    if (DAT_0197f42e == '\0') {
      iVar1 = thunk_FUN_00c93390();
      if (iVar1 == 0) {
        DebugBreak();
      }
      else if (iVar1 == 2) {
        DAT_0197f42e = '\x01';
      }
    }
  }
  thunk_FUN_00c5abb0(param_1,param_2);
  if (_DAT_0197f448 == 4) {
    if (param_1 < 1) {
      iStack_5c = 1;
    }
    else {
      iStack_5c = thunk_FUN_00c59810(param_2);
    }
    iVar1 = thunk_FUN_00c5aa40(param_1 * iStack_5c);
    _DAT_0197f464 = iVar1 + _DAT_0197f464;
  }
  else {
    iVar1 = thunk_FUN_00c5aa40(param_1);
    _DAT_0197f464 = iVar1 + _DAT_0197f464;
    if ((_DAT_0197f464 < 0) && (_DAT_0197f448 != 5)) {
      _DAT_0197f464 = 0;
    }
  }
  if ((_DAT_0197f420 & 1) == 0) {
    _DAT_0197f420 = _DAT_0197f420 | 1;
    uStack_8 = 0;
    _DAT_0197f424 = thunk_FUN_00a6dff0(&UNK_01719cb8);
    uStack_8 = 0xffffffff;
  }
  if (((0 < param_1) && (param_3 != '\0')) && (param_2 < 2)) {
    _DAT_0197f5cc = thunk_FUN_00c37ff0(&UNK_01719cb8,_DAT_0197f424,param_1,1,0);
    if (DAT_0197fa0c != '\0') {
      uVar2 = thunk_FUN_00a6dff0(&UNK_0171d0d4,param_1,0,1);
      thunk_FUN_00c37ff0(&UNK_0171d0d4,uVar2);
    }
    iVar1 = thunk_FUN_00c38590(&UNK_016f87c0);
    if (iVar1 == 0) {
      uVar2 = thunk_FUN_00a6dff0(&UNK_0171d0bc,param_1,0,1);
      thunk_FUN_00c37ff0(&UNK_0171d0bc,uVar2);
    }
  }
  iVar1 = thunk_FUN_00c5a260();
  if (iVar1 != 0) {
    thunk_FUN_00c5a260();
    thunk_FUN_00b27980();
  }
  ExceptionList = pvStack_10;
  return;
}


```

## FUN_00fb0e80 — 00fb0e80
命中: game.cpp@0178f6c0(imm)

```c

void FUN_00fb0e80(void)

{
  int iVar1;
  int *piVar2;
  int aiStack_d4 [50];
  int iStack_c;
  undefined4 uStack_8;
  
  piVar2 = aiStack_d4;
  for (iVar1 = 0x34; iVar1 != 0; iVar1 = iVar1 + -1) {
    *piVar2 = -0x33333334;
    piVar2 = piVar2 + 1;
  }
  iStack_c = thunk_FUN_00fb0fd0();
  if (iStack_c == 0) {
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00c93660(&UNK_0178f750);
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00a6fd50(&UNK_0178f728);
    thunk_FUN_00c93610(&UNK_016ec474);
    thunk_FUN_00c93660(&UNK_016ec434);
    thunk_FUN_00c93660(&UNK_0178f6c0);
    thunk_FUN_00c94580(0xffff);
    thunk_FUN_00c93660(&UNK_016ec434);
    if (DAT_01993eed == '\0') {
      aiStack_d4[0] = thunk_FUN_00c93390();
      if (aiStack_d4[0] == 0) {
        DebugBreak();
        thunk_FUN_0155aeb0();
      }
      else if (aiStack_d4[0] == 2) {
        DAT_01993eed = '\x01';
      }
    }
  }
  uStack_8 = 0xfb0f7f;
  thunk_FUN_0155aeb0();
  return;
}


```

