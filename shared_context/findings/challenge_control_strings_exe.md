# 字符串定位报告（立即数扫描）

- 程序: FruitNinjaPIB.exe
- 已定义函数: 129503
- 命中函数: 3，裸引用点(未纳入函数): 0

## FUN_00a7c2a0 — 00a7c2a0
命中: challengecontrol.cpp@016ee750(imm)

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00a7c2a0(void)

{
  char cVar1;
  int iVar2;
  undefined4 uVar3;
  undefined4 *puStack_110;
  undefined4 uStack_d4;
  char cStack_cd;
  undefined1 auStack_cc [12];
  int iStack_c0;
  int iStack_bc;
  undefined4 *puStack_b8;
  undefined4 *puStack_b4;
  undefined1 auStack_70 [12];
  undefined4 uStack_64;
  int iStack_60;
  int iStack_5c;
  int iStack_58;
  int iStack_54;
  float fStack_50;
  int iStack_4c;
  undefined4 uStack_48;
  int iStack_44;
  int iStack_40;
  int iStack_3c;
  undefined4 uStack_38;
  int iStack_34;
  int iStack_30;
  int iStack_2c;
  undefined4 uStack_28;
  int iStack_24;
  int iStack_20;
  undefined4 uStack_1c;
  char cStack_15;
  undefined4 *puStack_14;
  void *pvStack_10;
  undefined *puStack_c;
  undefined4 uStack_8;
  
  uStack_8 = 0xffffffff;
  puStack_c = &UNK_01601539;
  pvStack_10 = ExceptionList;
  ExceptionList = &pvStack_10;
  thunk_FUN_00a7d9e0(_DAT_018bcc60 ^ (uint)&stack0xfffffffc);
  iVar2 = thunk_FUN_00c8c9a0(0x48);
  uStack_8 = 0;
  if (iVar2 == 0) {
    puStack_110 = (undefined4 *)0x0;
  }
  else {
    puStack_110 = (undefined4 *)thunk_FUN_00c98ca0(&UNK_016eed84);
  }
  uStack_8 = 0xffffffff;
  puStack_14 = puStack_110;
  cStack_15 = '\x01';
  if (puStack_110 != (undefined4 *)0x0) {
    cStack_15 = thunk_FUN_00c98e40(0);
    if (cStack_15 == '\0') {
      if (puStack_14 != (undefined4 *)0x0) {
        if (puStack_14 != (undefined4 *)0x0) {
          (**(code **)*puStack_14)(1);
        }
        puStack_14 = (undefined4 *)0x0;
      }
      thunk_FUN_00c93660(&UNK_016ec4b0);
      thunk_FUN_00c93660(&UNK_016ec4a8);
      thunk_FUN_00c93660(&UNK_016ec4b0);
      thunk_FUN_00a6fd50(&UNK_016eed38);
      thunk_FUN_00c93610(&UNK_016ec474);
      thunk_FUN_00c93660(&UNK_016ec434);
      thunk_FUN_00c93660(&UNK_016eecd0);
      thunk_FUN_00c94580(0xffff);
      thunk_FUN_00c93660(&UNK_016ec434);
      if (DAT_018bec91 == '\0') {
        iVar2 = thunk_FUN_00c93390();
        if (iVar2 == 0) {
          DebugBreak();
        }
        else if (iVar2 == 2) {
          DAT_018bec91 = '\x01';
        }
      }
    }
    else {
      uStack_1c = thunk_FUN_00a6ef60(&UNK_016eed6c);
      thunk_FUN_00a6ed50(uStack_1c);
    }
  }
  iVar2 = thunk_FUN_00c8c9a0(0x48);
  uStack_8 = 1;
  if (iVar2 == 0) {
    puStack_110 = (undefined4 *)0x0;
  }
  else {
    puStack_110 = (undefined4 *)thunk_FUN_00c98b70();
  }
  uStack_8 = 0xffffffff;
  puStack_14 = puStack_110;
  cStack_15 = '\x01';
  if (puStack_110 != (undefined4 *)0x0) {
    cStack_15 = thunk_FUN_00c98f10(&UNK_016eecb0,0);
    if (cStack_15 == '\0') {
      if (puStack_14 != (undefined4 *)0x0) {
        if (puStack_14 != (undefined4 *)0x0) {
          (**(code **)*puStack_14)(1);
        }
        puStack_14 = (undefined4 *)0x0;
      }
      thunk_FUN_00c93660(&UNK_016ec4b0);
      thunk_FUN_00c93660(&UNK_016ec4a8);
      thunk_FUN_00c93660(&UNK_016ec4b0);
      thunk_FUN_00a6fd50(&UNK_016eebb8);
      thunk_FUN_00c93610(&UNK_016ec474);
      thunk_FUN_00c93660(&UNK_016ec434);
      thunk_FUN_00c93660(&UNK_016eeb50);
      thunk_FUN_00c94580(0xffff);
      thunk_FUN_00c93660(&UNK_016ec434);
      if (DAT_018bec93 == '\0') {
        iVar2 = thunk_FUN_00c93390();
        if (iVar2 == 0) {
          DebugBreak();
        }
        else if (iVar2 == 2) {
          DAT_018bec93 = '\x01';
        }
      }
    }
    else {
      iStack_20 = thunk_FUN_00a6ef60(&UNK_016ee674);
      if (iStack_20 == 0) {
        thunk_FUN_00c93660(&UNK_016ec4b0);
        thunk_FUN_00c93660(&UNK_016eec90);
        thunk_FUN_00c93660(&UNK_016ec4b0);
        thunk_FUN_00a6fd50(&UNK_016eec50);
        thunk_FUN_00c93610(&UNK_016ec474);
        thunk_FUN_00c93660(&UNK_016ec434);
        thunk_FUN_00c93660(&UNK_016eebe8);
        thunk_FUN_00c94580(0x
/* ...截断... */
```

## FUN_00a6ed50 — 00a6ed50
命中: challengeconditions.cpp@016ec3c8(imm)

```c

void FUN_00a6ed50(void)

{
  undefined4 uVar1;
  undefined4 *puVar2;
  int iVar3;
  undefined4 uStack_5c;
  undefined4 uStack_58;
  undefined4 auStack_54 [17];
  int *piStack_10;
  int iStack_c;
  
  iStack_c = thunk_FUN_00a6ef60(&UNK_016ec4f8);
  while (iStack_c != 0) {
    uVar1 = thunk_FUN_00c971c0(&UNK_016ec4f0);
    uVar1 = thunk_FUN_00a6df80(uVar1);
    piStack_10 = (int *)thunk_FUN_00a6e030(uVar1);
    if (piStack_10 == (int *)0x0) {
      thunk_FUN_00c93660(&UNK_016ec4b0);
      thunk_FUN_00c93660(&UNK_016ec4a8);
      thunk_FUN_00c93660(&UNK_016ec4b0);
      uStack_58 = thunk_FUN_00c971c0(&UNK_016ec4a0);
      auStack_54[0] = thunk_FUN_00c971c0(&UNK_016ec4f0);
      thunk_FUN_00a75b00(&UNK_016ec478,auStack_54,&uStack_58);
      thunk_FUN_00c93610(&UNK_016ec474);
      thunk_FUN_00c93660(&UNK_016ec434);
      thunk_FUN_00c93660(&UNK_016ec3c8);
      thunk_FUN_00c94580(0xffff);
      thunk_FUN_00c93660(&UNK_016ec434);
      if (DAT_018beb00 == '\0') {
        iVar3 = thunk_FUN_00c93390();
        if (iVar3 == 0) {
          DebugBreak();
        }
        else if (iVar3 == 2) {
          DAT_018beb00 = '\x01';
        }
      }
    }
    else {
      (**(code **)(*piStack_10 + 8))(iStack_c);
      uStack_5c = thunk_FUN_00a6ef90();
      puVar2 = (undefined4 *)thunk_FUN_00a71400(&uStack_5c);
      *puVar2 = piStack_10;
    }
    iStack_c = thunk_FUN_00a6ef30(&UNK_016ec4f8);
  }
  return;
}


```

## FUN_00a70df0 — 00a70df0
命中: challengeconditions.cpp@016ec710(imm)

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 __fastcall FUN_00a70df0(int param_1)

{
  char *pcVar1;
  undefined4 uVar2;
  int iVar3;
  int iVar4;
  
  pcVar1 = (char *)thunk_FUN_00c971c0(&UNK_016ec4a0);
  if ((pcVar1 == (char *)0x0) || (*pcVar1 == '\0')) {
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00c93660(&UNK_016ec78c);
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00a6fd50(&UNK_016ec77c);
    thunk_FUN_00c93610(&UNK_016ec474);
    thunk_FUN_00c93660(&UNK_016ec434);
    thunk_FUN_00c93660(&UNK_016ec710);
    thunk_FUN_00c94580(0xffff);
    thunk_FUN_00c93660(&UNK_016ec434);
    if (DAT_018beb02 == '\0') {
      iVar3 = thunk_FUN_00c93390();
      if (iVar3 == 0) {
        DebugBreak();
      }
      else if (iVar3 == 2) {
        DAT_018beb02 = '\x01';
      }
    }
  }
  thunk_FUN_01550c70(param_1 + 4,pcVar1);
  uVar2 = thunk_FUN_00a6dff0(pcVar1);
  *(undefined4 *)(param_1 + 0x44) = uVar2;
  *(undefined4 *)(param_1 + 0x58) = 1;
  iVar3 = thunk_FUN_00c971c0(&UNK_016ec704);
  if ((iVar3 != 0) && (iVar3 = thunk_FUN_00a6dff0(iVar3), iVar3 == _DAT_018beb7c)) {
    *(undefined4 *)(param_1 + 0x58) = 2;
  }
  thunk_FUN_00c973d0(&UNK_016ec6fc,param_1 + 0x48);
  iVar3 = thunk_FUN_00c971c0(&UNK_016ec6ec);
  if (iVar3 == 0) {
    *(undefined4 *)(param_1 + 0x50) = 0;
    *(undefined4 *)(param_1 + 0x4c) = 0;
  }
  else {
    uVar2 = thunk_FUN_00a6dff0(iVar3);
    *(undefined4 *)(param_1 + 0x50) = uVar2;
    *(undefined4 *)(param_1 + 0x4c) = uVar2;
  }
  iVar3 = thunk_FUN_00c971c0(&UNK_016ec6dc);
  if (iVar3 != 0) {
    iVar3 = thunk_FUN_00a6dff0(iVar3);
    iVar4 = thunk_FUN_00a6dff0(&UNK_016ec6d4);
    if (iVar3 == iVar4) {
      *(undefined1 *)(param_1 + 0x54) = 1;
    }
  }
  return 1;
}


```

