# 完整反编译导出（无截断）

- 程序: FruitNinjaPIB.exe

## FUN_00e75650 — 01275650

- 函数名: FUN_01275650
- 函数体: 76 字节
- 调用者数: 0 / 被调用者数: 2

```c

void FUN_01275650(undefined4 param_1,undefined4 param_2)

{
  int iVar1;
  undefined4 *puVar2;
  undefined4 auStack_d0 [48];
  undefined4 uStack_10;
  
  puVar2 = auStack_d0;
  for (iVar1 = 0x33; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = 0xcccccccc;
    puVar2 = puVar2 + 1;
  }
  thunk_FUN_012757a0(param_1,param_2);
  uStack_10 = 0x1275696;
  thunk_FUN_0155aeb0();
  return;
}


```

## FUN_00e0ec30 — 00e0ec30

- 函数名: FUN_00e0ec30
- 函数体: 83 字节
- 调用者数: 0 / 被调用者数: 3

```c

void FUN_00e0ec30(undefined4 param_1)

{
  undefined4 uVar1;
  int iVar2;
  undefined4 *puVar3;
  undefined4 auStack_d0 [49];
  int iStack_c;
  
  puVar3 = auStack_d0;
  for (iVar2 = 0x33; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar3 = 0xcccccccc;
    puVar3 = puVar3 + 1;
  }
  uVar1 = thunk_FUN_0116b7d0();
  *(undefined4 *)(iStack_c + 0x2c) = uVar1;
  thunk_FUN_01172370(param_1);
  iStack_c = 0xe0ec7d;
  thunk_FUN_0155aeb0();
  return;
}


```

## FUN_00eb00d0 — 00eb00d0

- 函数名: FUN_00eb00d0
- 函数体: 1361 字节
- 调用者数: 0 / 被调用者数: 13

```c

void FUN_00eb00d0(int *param_1)

{
  undefined1 uVar1;
  undefined4 uVar2;
  int iVar3;
  undefined4 *puVar4;
  undefined4 uStack_f8;
  undefined4 auStack_f0 [3];
  undefined4 auStack_e4 [3];
  undefined4 auStack_d8 [51];
  int *piStack_c;
  undefined4 uStack_8;
  
  puVar4 = &uStack_f8;
  for (iVar3 = 0x3d; iVar3 != 0; iVar3 = iVar3 + -1) {
    *puVar4 = 0xcccccccc;
    puVar4 = puVar4 + 1;
  }
  iVar3 = thunk_FUN_00a84ec0();
  if (iVar3 == 0) {
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00c93660(&UNK_017752e4);
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00a6fd50(&UNK_0177584c);
    thunk_FUN_00c93610(&UNK_016ec474);
    thunk_FUN_00c93660(&UNK_016ec434);
    thunk_FUN_00c93660(&UNK_017757e8);
    thunk_FUN_00c94580(0xffff);
    thunk_FUN_00c93660(&UNK_016ec434);
    if (DAT_01984ccc == '\0') {
      uStack_f8 = thunk_FUN_00c93390();
      if (uStack_f8 == 0) {
        DebugBreak();
        thunk_FUN_0155aeb0();
      }
      else if (uStack_f8 == 2) {
        DAT_01984ccc = '\x01';
      }
    }
  }
  if (*(char *)((int)piStack_c + 0x36) != '\0') {
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00c93660(&UNK_017757ac);
    thunk_FUN_00c93660(&UNK_016ec4b0);
    auStack_f0[0] = thunk_FUN_00a84e90();
    thunk_FUN_00a8ada0(&UNK_0177577c,auStack_f0);
    thunk_FUN_00c93610(&UNK_016ec474);
    thunk_FUN_00c93660(&UNK_016ec434);
    thunk_FUN_00c93660(&UNK_01775718);
    thunk_FUN_00c94580(0xffff);
    thunk_FUN_00c93660(&UNK_016ec434);
    if (DAT_01984ccd == '\0') {
      uStack_f8 = thunk_FUN_00c93390();
      if (uStack_f8 == 0) {
        DebugBreak();
        thunk_FUN_0155aeb0();
      }
      else if (uStack_f8 == 2) {
        DAT_01984ccd = '\x01';
      }
    }
  }
  if (((piStack_c[0xf] & 6U) != 0) && ((piStack_c[0xf] & 1U) == 0)) {
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00c93660(&UNK_017756b8);
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00a6fd50(&UNK_01775660);
    thunk_FUN_00c93610(&UNK_016ec474);
    thunk_FUN_00c93660(&UNK_016ec434);
    thunk_FUN_00c93660(&UNK_017755f8);
    thunk_FUN_00c94580(0xffff);
    thunk_FUN_00c93660(&UNK_016ec434);
    if (DAT_01984cce == '\0') {
      uStack_f8 = thunk_FUN_00c93390();
      if (uStack_f8 == 0) {
        DebugBreak();
        thunk_FUN_0155aeb0();
      }
      else if (uStack_f8 == 2) {
        DAT_01984cce = '\x01';
      }
    }
  }
  if ((char)piStack_c[0xd] == '\0') {
    if (*piStack_c != 0) {
      thunk_FUN_00c93660(&UNK_016ec4b0);
      thunk_FUN_00c93660(&UNK_01774ed8);
      thunk_FUN_00c93660(&UNK_016ec4b0);
      auStack_e4[0] = thunk_FUN_00a84e90();
      thunk_FUN_00a8ada0(&UNK_017755a8,auStack_e4);
      thunk_FUN_00c93610(&UNK_016ec474);
      thunk_FUN_00c93660(&UNK_016ec434);
      thunk_FUN_00c93660(&UNK_01775540);
      thunk_FUN_00c94580(0xffff);
      thunk_FUN_00c93660(&UNK_016ec434);
      if (DAT_01984ccf == '\0') {
        uStack_f8 = thunk_FUN_00c93390();
        if (uStack_f8 == 0) {
          DebugBreak();
          thunk_FUN_0155aeb0();
        }
        else if (uStack_f8 == 2) {
          DAT_01984ccf = '\x01';
        }
      }
    }
    if ((piStack_c[0xf] & 1U) == 0) {
      if (param_1 == (int *)0x0) {
        uVar2 = thunk_FUN_00a84e90(piStack_c[1]);
        thunk_FUN_00f8fe40(uVar2);
        uVar1 = thunk_FUN_00f90950();
        uStack_f8 = CONCAT13(uVar1,(undefined3)uStack_f8);
      }
      else {
        uVar2 = thunk_FUN_00a84e90();
        (**(code **)(*param_1 + 4))(uVar2);
        uVar1 = thunk_FUN_0155aeb0();
        uStack_f8 = CONCAT13(uVar1,(undefined3)uStack_f8);
      }
      if (uStack_f8._3_1_ == '\0') goto LAB_00eb0613;
    }
    if (param_1 == (int *)0x0) {
      uVar2 = thunk_FUN_00a84e90(piStack_c[0xf],piStack_c[1]);
      thunk_FUN_00f8fe40(uVar2);
      uStack_f8 = thunk_FUN_00f90db0();
    }
    else {
      uVar2 = thunk_FUN_00a84e90(piStack_c[0xf]);
      (**(code **)(*param_1 + 0x10))(uVar2);
      uStack_f8 = thunk_FUN_0155aeb0();
    }
    *piStack_c = uStack_f8;
    if (*piStack_c != 0) {
      *(undefined1 *)(piStack_c + 0xd) = 1;
      (**(code **)(*(int *)*piStack_c + 4))();
      iVar3 = thunk_FUN_0155aeb0();
      piStack_c[0xe] = iVar3;
    }
  }
  else {
    thunk_FUN_00c93610(&UNK_016ec4b0);
    thunk_FUN_00c93610(&UNK_016eead8);
    thunk_FUN_00c93610(&UNK_016ec4b0);
    auStack_d8[0] = thunk_FUN_00a84e90();
    thunk_FUN_00aa6590(&UNK_017754f4,auStack_d8);
    thunk_FUN_00c93610(&UNK_016ec474);
    thunk_FUN_00c93610(&UNK_016ec434);
    thunk_FUN_00c93610(&UNK_01775490);
    thunk_FUN_00c94580(0xffff);
    thunk_FUN_00c93610(&UNK_016ec434);
  }
LAB_00eb0613:
  uStack_8 = 0xeb0623;
  thunk_FUN_0155aeb0();
  return;
}


```

