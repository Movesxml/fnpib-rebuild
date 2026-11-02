# 完整反编译导出（无截断）

- 程序: FruitNinjaPIB.exe

## FUN_00ae13c0 — 00ae13c0

- 函数名: FUN_00ae13c0
- 函数体: 1945 字节
- 调用者数: 0 / 被调用者数: 53

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00ae13c0(void)

{
  int iVar1;
  undefined4 uVar2;
  undefined4 *puVar3;
  int *piVar4;
  int *piStack_e0;
  undefined1 auStack_98 [40];
  undefined1 auStack_70 [4];
  int *piStack_6c;
  int iStack_68;
  int iStack_24;
  int iStack_20;
  undefined4 *puStack_1c;
  undefined4 uStack_18;
  undefined4 uStack_14;
  void *pvStack_10;
  undefined *puStack_c;
  undefined4 uStack_8;
  
  uStack_8 = 0xffffffff;
  puStack_c = &UNK_0160afe0;
  pvStack_10 = ExceptionList;
  ExceptionList = &pvStack_10;
  if (DAT_018c4908 == '\0') {
    thunk_FUN_00ee1a40();
    thunk_FUN_00ae1d70();
    DAT_018c48fe = 0;
    DAT_018c48fd = 0;
    if (_DAT_0197f484 == 0) {
      iVar1 = thunk_FUN_00c8c9a0();
      uStack_8 = 0;
      if (iVar1 == 0) {
        piStack_e0 = (int *)0x0;
      }
      else {
        piStack_e0 = (int *)thunk_FUN_00be6760();
      }
      uStack_8 = 0xffffffff;
      _DAT_0197f484 = (int)piStack_e0;
    }
    thunk_FUN_00be6880();
    uStack_14 = 0;
    thunk_FUN_00c05b30();
    iVar1 = thunk_FUN_00c8c9a0();
    uStack_8 = 1;
    if (iVar1 == 0) {
      piStack_e0 = (int *)0x0;
    }
    else {
      piStack_e0 = (int *)thunk_FUN_00c18db0();
    }
    uStack_8 = 0xffffffff;
    _DAT_0197f5d4 = piStack_e0;
    (**(code **)(*piStack_e0 + 4))();
    thunk_FUN_00c191d0();
    thunk_FUN_00be76a0();
    _DAT_0197f5d8 = 0;
    _DAT_0197faac = 0;
    _DAT_018c48e0 = _DAT_0197f49c;
    DAT_0197f442 = 0;
    DAT_018c48fc = 0;
    DAT_018c48ff = 0;
    DAT_018c4908 = '\x01';
    iVar1 = thunk_FUN_00c8c9a0();
    uStack_8 = 2;
    if (iVar1 == 0) {
      piStack_e0 = (int *)0x0;
    }
    else {
      piStack_e0 = (int *)thunk_FUN_00ac4310();
    }
    uStack_8 = 0xffffffff;
    _DAT_0197fa90 = piStack_e0;
    thunk_FUN_00da0f70();
    thunk_FUN_00f078e0();
    thunk_FUN_00ae1380();
    thunk_FUN_00aced50();
    thunk_FUN_00bab5e0();
    thunk_FUN_00bab680();
    thunk_FUN_00adb2d0();
    uStack_8 = 3;
    thunk_FUN_00aea240();
    uStack_8._0_1_ = 4;
    thunk_FUN_00bab5e0();
    uStack_8 = CONCAT31(uStack_8._1_3_,3);
    thunk_FUN_00ae1da0();
    uStack_8 = 0xffffffff;
    thunk_FUN_00ada160();
    uVar2 = thunk_FUN_00adb560();
    uStack_8 = 5;
    thunk_FUN_00aea330(uVar2);
    uStack_8._0_1_ = 6;
    thunk_FUN_00bab5e0();
    uStack_8 = CONCAT31(uStack_8._1_3_,5);
    thunk_FUN_00ae1e50();
    uStack_8 = 0xffffffff;
    thunk_FUN_00ada210();
    thunk_FUN_00ae13a0(&UNK_016fca2c);
    iVar1 = thunk_FUN_00c8c9a0(0xa4);
    uStack_8 = 7;
    if (iVar1 == 0) {
      piStack_e0 = (int *)0x0;
    }
    else {
      piStack_e0 = (int *)thunk_FUN_00c34800();
    }
    uStack_8 = 0xffffffff;
    _DAT_0197f5c8 = piStack_e0;
    (**(code **)(*piStack_e0 + 4))();
    thunk_FUN_00ae0580();
    thunk_FUN_00ae1380(&UNK_016fca20);
    uStack_18 = 2;
    puVar3 = (undefined4 *)thunk_FUN_00c8cad0(0x5c);
    uStack_8 = 8;
    if (puVar3 == (undefined4 *)0x0) {
      piStack_e0 = (undefined4 *)0x0;
    }
    else {
      *puVar3 = 2;
      thunk_FUN_01558ca0(puVar3 + 1,0x2c,2,&UNK_00a34351,thunk_FUN_00ae2090);
      piStack_e0 = puVar3 + 1;
    }
    uStack_8 = 0xffffffff;
    puStack_1c = piStack_e0;
    thunk_FUN_00ae1d40(&UNK_016fc9e8);
    puStack_1c[10] = 0;
    thunk_FUN_00ae1d40(&UNK_016fc9ac);
    puStack_1c[0x15] = 0;
    thunk_FUN_00c9f550(&UNK_016fc99c);
    uStack_8 = 9;
    thunk_FUN_00dfba20(auStack_98);
    thunk_FUN_00e03c70();
    uStack_8 = 0xffffffff;
    thunk_FUN_00c9f6a0();
    for (iStack_20 = 0; iStack_20 < 0x1e; iStack_20 = iStack_20 + 1) {
      thunk_FUN_00bab5e0(1,1);
      iStack_24 = thunk_FUN_00baca90();
      *(uint *)(iStack_24 + 0xc) = *(uint *)(iStack_24 + 0xc) | 1;
      *(uint *)(iStack_24 + 0xc) = *(uint *)(iStack_24 + 0xc) | 0x10;
      thunk_FUN_00bab5e0(2,1);
      iStack_24 = thunk_FUN_00baca90();
      *(uint *)(iStack_24 + 0xc) = *(uint *)(iStack_24 + 0xc) | 1;
      *(uint *)(iStack_24 + 0xc) = *(uint *)(iStack_24 + 0xc) | 0x10;
      thunk_FUN_00bab5e0(5,1);
      iStack_24 = thunk_FUN_00baca90();
      *(uint *)(iStack_24 + 0xc) = *(uint *)(iStack_24 + 0xc) | 1;
      *(uint *)(iStack_24 + 0xc) = *(uint *)(iStack_24 + 0xc) | 0x10;
    }
    thunk_FUN_00dbc1d0(auStack_70,&UNK_016fc97c);
    uVar2 = thunk_FUN_00dbc420();
    uStack_8 = 10;
    thunk_FUN_00a9a820(uVar2);
    uStack_8 = 0xffffffff;
    thunk_FUN_00a9a7c0();
    thunk_FUN_00be6300(0x100);
    iStack_68 = thunk_FUN_00c8c9a0(0xec);
    uStack_8 = 0xb;
    if (iStack_68 == 0) {
      piStack_e0 = (int *)0x0;
    }
    else {
      piStack_e0 = (int *)thunk_FUN_00bf7fe0();
    }
    piStack_6c = piStack_e0;
    uStack_8 = 0xffffffff;
    _DAT_018c4918 = piStack_e0;
    (**(code **)(*piStack_e0 + 4))();
    _DAT_0197f5c4 = _DAT_018c4918;
    *(undefined1 *)((int)_DAT_018c4918 + 0x32) = 1;
    thunk_FUN_00ae9fe0();
    DAT_0197f444 = 1;
    _DAT_0197f458 = _DAT_016ee204;
    thunk_FUN_00be76a0(_DAT_018c4918,0);
    thunk_FUN_00be76a0(_DAT_0197f5c8,0);
    thunk_FUN_00c6b930();
    thunk_FUN_00c6e510();
    thunk_FUN_00ae91d0();
    thunk_FUN_00a7c2a0();
    thunk_FUN_00b262f0();
    if (DAT_0197f5e9 == '\0') {
      thunk_FUN_00dfba20(_DAT_016f7f10);
      thunk_FUN_00e07aa0();
    }
    else {
      thunk_FUN_00c6b930();
      thunk_FUN_00c70b90();
      thunk_FUN_00dfba20(_DAT_016f7f10);
      thunk_FUN_00e07aa0();
    }
    thunk_FUN_00bbb8d0(0x20);
    thunk_FUN_00dfba20(DAT_0197f48c == '\0');
    thunk_FUN_00ae1f00();
    thunk_FUN_00c49700(DAT_0197f48c);
    thunk_FUN_00ae1fa0(DAT_0197f48e);
  }
  piVar4 = (int *)thunk_FUN_00ee1a40();
  (**(code **)(*piVar4 + 0x34))();
  ExceptionList = pvStack_10;
  return;
}


```

