# 完整反编译导出（无截断）

- 程序: FruitNinjaPIB.exe

## FUN_00ba5e10 — 00ba5e10

- 函数名: FUN_00ba5e10
- 函数体: 402 字节
- 调用者数: 0 / 被调用者数: 5

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 * __fastcall FUN_00ba5e10(undefined4 *param_1)

{
  undefined4 uVar1;
  void *pvStack_10;
  undefined *puStack_c;
  undefined4 uStack_8;
  
  uStack_8 = 0xffffffff;
  puStack_c = &UNK_0161ff0e;
  pvStack_10 = ExceptionList;
  ExceptionList = &pvStack_10;
  thunk_FUN_00b482e0(_DAT_018bcc60 ^ (uint)&stack0xfffffffc);
  uStack_8 = 0;
  thunk_FUN_00aa38b0();
  uStack_8._0_1_ = 1;
  param_1[7] = 0x3f800000;
  *(undefined1 *)((int)param_1 + 0x95) = 0;
  param_1[0x16] = _DAT_016ee204;
  param_1[0x17] = 0x3f800000;
  uVar1 = thunk_FUN_00a7a5a0(0,_DAT_016ee204,0);
  uStack_8._0_1_ = 2;
  thunk_FUN_00a833e0(uVar1);
  uStack_8 = CONCAT31(uStack_8._1_3_,1);
  thunk_FUN_00a7a5e0();
  param_1[0x18] = 0;
  param_1[0x1d] = 0;
  param_1[0x1e] = 0;
  param_1[6] = 0;
  param_1[0x1c] = 0;
  param_1[0x1b] = 0;
  param_1[0x1a] = 0;
  param_1[0x19] = 0;
  param_1[0x1f] = 0;
  param_1[0x22] = 0;
  *param_1 = 0;
  param_1[0xe] = 99999;
  param_1[0xd] = 99999;
  param_1[0x11] = 0;
  param_1[0x10] = 0;
  param_1[0xf] = 0;
  param_1[0x13] = 0;
  param_1[0x12] = 0;
  param_1[0x14] = 0x3f800000;
  param_1[0x15] = 0x3f800000;
  *(undefined1 *)(param_1 + 0x25) = 0;
  ExceptionList = pvStack_10;
  return param_1;
}


```

## FUN_00ba5bf0 — 00ba5bf0

- 函数名: FUN_00ba5bf0
- 函数体: 148 字节
- 调用者数: 0 / 被调用者数: 3

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __fastcall FUN_00ba5bf0(int *param_1)

{
  void *pvStack_10;
  undefined *puStack_c;
  undefined4 uStack_8;
  
  puStack_c = &UNK_0161fe9b;
  pvStack_10 = ExceptionList;
  ExceptionList = &pvStack_10;
  uStack_8 = 0;
  if ((*(char *)((int)param_1 + 0x95) == '\0') && (*param_1 != 0)) {
    thunk_FUN_00c8bb60(*param_1,_DAT_018bcc60 ^ (uint)&stack0xfffffffc);
    *param_1 = 0;
  }
  thunk_FUN_00a7a5e0();
  uStack_8 = 0xffffffff;
  thunk_FUN_00b48320();
  ExceptionList = pvStack_10;
  return;
}


```

