# 字符串定位报告（立即数扫描）

- 程序: FruitNinjaPIB.exe
- 已定义函数: 129503
- 命中函数: 3，裸引用点(未纳入函数): 0

## FUN_0163ab10 — 0163ab10
命中: gravity@016f2b88(imm)

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_0163ab10(void)

{
  _DAT_018befe0 = thunk_FUN_00a6dff0(&UNK_016f2b88);
  return;
}


```

## FUN_00c6ded0 — 00c6ded0
命中: gravity@0170aef0(imm)

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

uint FUN_00c6ded0(undefined4 param_1,int *param_2)

{
  uint uVar1;
  undefined4 uVar2;
  int iVar3;
  bool bStack_6c;
  undefined1 auStack_64 [76];
  int iStack_18;
  char *pcStack_14;
  void *pvStack_10;
  undefined *puStack_c;
  undefined4 uStack_8;
  
  puStack_c = &UNK_01634086;
  pvStack_10 = ExceptionList;
  uVar1 = _DAT_018bcc60 ^ (uint)&stack0xfffffffc;
  ExceptionList = &pvStack_10;
  if ((_DAT_0198016c & 1) == 0) {
    _DAT_0198016c = _DAT_0198016c | 1;
    uStack_8 = 0;
    _DAT_0197ff04 = thunk_FUN_00a6dff0(&UNK_0170ffc4,uVar1);
  }
  uStack_8 = 0xffffffff;
  pcStack_14 = (char *)0x0;
  uVar2 = thunk_FUN_00b80500();
  uVar1 = thunk_FUN_00a6dff0(uVar2,uVar1);
  if (uVar1 == _DAT_0197ff04) {
    pcStack_14 = (char *)thunk_FUN_00c971c0(&UNK_016ec4f0);
    iVar3 = thunk_FUN_00b733a0(pcStack_14,param_2 + 1);
    param_2[6] = iVar3;
    if (0 < param_2[6]) {
      iVar3 = thunk_FUN_00c8cad0(-(uint)((int)((ulonglong)(uint)param_2[6] * 4 >> 0x20) != 0) |
                                 (uint)((ulonglong)(uint)param_2[6] * 4));
      *param_2 = iVar3;
      for (iStack_18 = 0; iStack_18 < param_2[6]; iStack_18 = iStack_18 + 1) {
        *(undefined4 *)(*param_2 + iStack_18 * 4) = 0xffffffff;
      }
    }
    thunk_FUN_00a71290(&UNK_0170738c,param_2 + 0x19);
    thunk_FUN_00a71290(&UNK_01707388,param_2 + 0x1b);
    thunk_FUN_00a71290(&UNK_017202e8,param_2 + 0x1c);
    thunk_FUN_00a71290(&UNK_017202e0,param_2 + 0x1c);
    thunk_FUN_00a71290(&UNK_01719e18,param_2 + 0x1d);
    thunk_FUN_00a71290(&UNK_017202d4,param_2 + 0x1e);
    thunk_FUN_00a71290(&UNK_017202c8,param_2 + 0x16);
    thunk_FUN_00a71290(&UNK_017202bc,param_2 + 0x17);
    thunk_FUN_00a71290(&UNK_017202b0,param_2 + 0x14);
    param_2[0x15] = param_2[0x14];
    thunk_FUN_00a71290(&UNK_017202a4,param_2 + 0x14);
    thunk_FUN_00a71290(&UNK_01720298,param_2 + 0x15);
    thunk_FUN_00a71290(&UNK_017101f8,param_2 + 7);
    thunk_FUN_00a71290(&UNK_01720290,param_2 + 0x12);
    thunk_FUN_00a71290(&UNK_01720288,param_2 + 0x13);
    thunk_FUN_00c973d0(&UNK_01720280,param_2 + 0xd);
    thunk_FUN_00c973d0(&UNK_01720278,param_2 + 0xe);
    thunk_FUN_00c973d0(&UNK_01720274,param_2 + 0xf);
    thunk_FUN_00c973d0(&UNK_01720270,param_2 + 0x10);
    thunk_FUN_00c973d0(&UNK_016f30d8,param_2 + 0x11);
    pcStack_14 = (char *)thunk_FUN_00c971c0(&UNK_0170aef0);
    if ((pcStack_14 != (char *)0x0) && (*pcStack_14 != '\0')) {
      uVar2 = thunk_FUN_00b72b20(auStack_64,pcStack_14);
      uStack_8 = 1;
      thunk_FUN_00a833e0(uVar2);
      uStack_8 = 0xffffffff;
      thunk_FUN_00a7a5e0();
    }
    uVar2 = thunk_FUN_00c971c0(&UNK_01720264);
    thunk_FUN_00c6e390(uVar2);
    pcStack_14 = (char *)thunk_FUN_00c971c0(&UNK_01720258);
    if ((pcStack_14 == (char *)0x0) || (*pcStack_14 == '\0')) {
      param_2[0x18] = 0;
    }
    else {
      iVar3 = thunk_FUN_00c6bd90(pcStack_14);
      param_2[0x18] = iVar3;
    }
    param_2[0x23] = 0;
    thunk_FUN_00c973d0(&UNK_01720238,param_2 + 0x23);
    pcStack_14 = (char *)thunk_FUN_00c971c0(&UNK_01720230);
    if (pcStack_14 == (char *)0x0) {
      bStack_6c = false;
    }
    else {
      iVar3 = thunk_FUN_015523b0(&UNK_016ec6d4,pcStack_14);
      bStack_6c = iVar3 == 0;
    }
    *(bool *)(param_2 + 0x25) = bStack_6c;
    uVar1 = 1;
  }
  else {
    uVar1 = uVar1 & 0xffffff00;
  }
  ExceptionList = pvStack_10;
  return uVar1;
}


```

