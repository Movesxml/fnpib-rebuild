# 完整反编译导出（无截断）

- 程序: FruitNinjaPIB.exe

## FUN_00a03fbb — 00e03f70

- 函数名: FUN_00e03f70
- 函数体: 1577 字节
- 调用者数: 0 / 被调用者数: 40

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00e03f70(undefined4 param_1)

{
  char cVar1;
  undefined4 uVar2;
  int iVar3;
  undefined4 extraout_EDX;
  undefined4 extraout_EDX_00;
  undefined4 extraout_EDX_01;
  undefined4 extraout_EDX_02;
  int *piVar4;
  undefined8 uVar5;
  int aiStack_4a0 [14];
  undefined1 auStack_468 [104];
  undefined1 auStack_400 [48];
  undefined4 auStack_3d0 [3];
  int iStack_3c4;
  undefined4 auStack_3b8 [3];
  int iStack_3ac;
  int iStack_3a0;
  int iStack_394;
  int iStack_388;
  undefined4 auStack_37c [3];
  undefined4 auStack_370 [3];
  int iStack_364;
  undefined1 auStack_298 [35];
  char cStack_275;
  undefined1 auStack_26c [72];
  undefined1 auStack_224 [412];
  undefined1 auStack_88 [48];
  int iStack_58;
  undefined1 auStack_4c [48];
  int iStack_1c;
  int *piStack_10;
  undefined4 uStack_c;
  uint uStack_8;
  
  piVar4 = aiStack_4a0;
  for (iVar3 = 0x127; iVar3 != 0; iVar3 = iVar3 + -1) {
    *piVar4 = -0x33333334;
    piVar4 = piVar4 + 1;
  }
  uStack_8 = _DAT_018bcc60 ^ (uint)&stack0xfffffffc;
  uVar5 = thunk_FUN_00e03cf0(param_1);
  iVar3 = (int)uVar5;
  if (iVar3 == 0) {
    iStack_1c = iVar3;
    thunk_FUN_00c9f550(&UNK_0175ce8c,auStack_468,param_1,auStack_4c,&UNK_0175ce98);
    thunk_FUN_00cab740();
    thunk_FUN_00cab970();
    thunk_FUN_00c9f6a0();
    thunk_FUN_00c9f6a0();
    uVar2 = thunk_FUN_00e04910();
    thunk_FUN_00e13460(param_1,uVar2);
    iStack_58 = thunk_FUN_00e04a70();
    thunk_FUN_00e04a20();
    thunk_FUN_00a84dd0(auStack_4c);
    thunk_FUN_00e04980(auStack_400,&DAT_0175c5f8,auStack_88,auStack_4c);
    thunk_FUN_00cab970();
    thunk_FUN_00cab740();
    thunk_FUN_00c9f6a0();
    uVar2 = thunk_FUN_00a84e90(0);
    cVar1 = thunk_FUN_00eaf4a0(uVar2);
    if (cVar1 == '\0') {
      thunk_FUN_00c93660(&UNK_016ec4b0);
      thunk_FUN_00c93660(&UNK_016ec4a8);
      thunk_FUN_00c93660(&UNK_016ec4b0);
      auStack_3d0[0] = thunk_FUN_00a84e90();
      thunk_FUN_00a8ada0(&UNK_0175ce54,auStack_3d0);
      thunk_FUN_00c93610(&UNK_016ec474);
      thunk_FUN_00c93660(&UNK_016ec434);
      thunk_FUN_00c93660(&UNK_0175cdd8);
      thunk_FUN_00c94580(0xffff);
      thunk_FUN_00c93660(&UNK_016ec434);
      if (DAT_01983f54 == '\0') {
        aiStack_4a0[0] = thunk_FUN_00c93390();
        if (aiStack_4a0[0] == 0) {
          DebugBreak();
          thunk_FUN_0155aeb0();
        }
        else if (aiStack_4a0[0] == 2) {
          DAT_01983f54 = '\x01';
        }
      }
      iStack_3c4 = 0;
      thunk_FUN_00c9f6a0();
      thunk_FUN_00c9f6a0();
      uVar5 = CONCAT44(extraout_EDX,iStack_1c);
      iVar3 = iStack_3c4;
    }
    else {
      thunk_FUN_00e04af0();
      uVar2 = thunk_FUN_00a84e90(0,0);
      thunk_FUN_00eaf180(uVar2);
      cStack_275 = thunk_FUN_00eb00d0(0);
      if (cStack_275 == '\0') {
        thunk_FUN_00c93660(&UNK_016ec4b0);
        thunk_FUN_00c93660(&UNK_016ec4a8);
        thunk_FUN_00c93660(&UNK_016ec4b0);
        auStack_3b8[0] = thunk_FUN_00a84e90();
        thunk_FUN_00a8ada0(&UNK_0175cd9c,auStack_3b8);
        thunk_FUN_00c93610(&UNK_016ec474);
        thunk_FUN_00c93660(&UNK_016ec434);
        thunk_FUN_00c93660(&UNK_0175cd20);
        thunk_FUN_00c94580(0xffff);
        thunk_FUN_00c93660(&UNK_016ec434);
        if (DAT_01983f55 == '\0') {
          aiStack_4a0[0] = thunk_FUN_00c93390();
          if (aiStack_4a0[0] == 0) {
            DebugBreak();
            thunk_FUN_0155aeb0();
          }
          else if (aiStack_4a0[0] == 2) {
            DAT_01983f55 = '\x01';
          }
        }
        iStack_3ac = 0;
        thunk_FUN_00eaf340();
        thunk_FUN_00e04b90();
        thunk_FUN_00c9f6a0();
        thunk_FUN_00c9f6a0();
        uVar5 = CONCAT44(extraout_EDX_00,iStack_1c);
        iVar3 = iStack_3ac;
      }
      else {
        thunk_FUN_01275650(auStack_26c,0x1020304);
        thunk_FUN_0119a710(auStack_298);
        thunk_FUN_00e0ec30(auStack_224);
        thunk_FUN_00eaf340();
        thunk_FUN_00e04b90();
        thunk_FUN_00c9f6a0();
        uVar2 = thunk_FUN_00caba30(*(undefined4 *)(iStack_58 + 0x2c));
        uVar2 = thunk_FUN_00e02d90(uVar2);
        *(undefined4 *)(iStack_58 + 0x28) = uVar2;
        if (*(int *)(iStack_58 + 0x28) == 0) {
          if (*(int *)(iStack_58 + 0x2c) != 0) {
            iStack_3a0 = *(int *)(iStack_58 + 0x2c);
            iStack_394 = iStack_3a0;
            if (iStack_3a0 == 0) {
              aiStack_4a0[0] = 0;
            }
            else {
              aiStack_4a0[0] = thunk_FUN_00ca5700(1);
            }
            *(undefined4 *)(iStack_58 + 0x2c) = 0;
          }
          iStack_388 = 0;
          thunk_FUN_00c9f6a0();
          uVar5 = CONCAT44(extraout_EDX_01,iStack_1c);
          iVar3 = iStack_388;
        }
        else {
          thunk_FUN_00a7ae50(0);
          thunk_FUN_00b085c0(param_1);
          cVar1 = thunk_FUN_00a84e40();
          if (cVar1 == '\0') {
            thunk_FUN_00c93660(&UNK_016ec4b0);
            thunk_FUN_00c93660(&UNK_016ec4a8);
            thunk_FUN_00c93660(&UNK_016ec4b0);
            auStack_37c[0] = thunk_FUN_00a84e90();
            thunk_FUN_00b085c0();
            auStack_370[0] = thunk_FUN_00a84e90();
            thunk_FUN_00a75b00(&UNK_0175ccb0,auStack_370,auStack_37c);
            thunk_FUN_00c93610(&UNK_016ec474);
            thunk_FUN_00c93660(&UNK_016ec434);
            thunk_FUN_00c93660(&UNK_0175cc30);
            thunk_FUN_00c94580(0xffff);
            thunk_FUN_00c93660(&UNK_016ec434);
            if (DAT_01983f56 == '\0') {
              aiStack_4a0[0] = thunk_FUN_00c93390();
              if (aiStack_4a0[0] == 0) {
                DebugBreak();
                thunk_FUN_0155aeb0();
              }
              else if (aiStack_4a0[0] == 2) {
                DAT_01983f56 = '\x01';
              }
            }
            thunk_FUN_00e049c0(1);
            thunk_FUN_00cb53f0(param_1);
          }
          thunk_FUN_00e049c0(0);
          thunk_FUN_00e04850();
          thunk_FUN_00e047c0();
          (**(code **)(*piStack_10 + 0x60))(iStack_58);
          thunk_FUN_0155aeb0();
          iStack_364 = *(int *)(iStack_58 + 0x28);
          thunk_FUN_00c9f6a0();
          uVar5 = CONCAT44(extraout_EDX_02,iStack_1c);
          iVar3 = iStack_364;
        }
      }
    }
  }
  iStack_1c = (int)uVar5;
  thunk_FUN_0155aee0(iVar3,(int)((ulonglong)uVar5 >> 0x20));
  thunk_FUN_01550950();
  uStack_c = 0xe04599;
  thunk_FUN_0155aeb0();
  return;
}


```

