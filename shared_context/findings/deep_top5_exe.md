# 完整反编译导出（无截断）

- 程序: FruitNinjaPIB.exe

## FUN_00bda510 — 00bda510

- 函数名: FUN_00bda510
- 函数体: 5240 字节
- 调用者数: 0 / 被调用者数: 50

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00bda510(float param_1)

{
  float fVar1;
  char cVar2;
  int iVar3;
  int *piVar4;
  uint uVar5;
  undefined4 uVar6;
  float10 fVar7;
  undefined8 uStack_1e8;
  float fStack_1e0;
  undefined1 auStack_1dc [12];
  undefined1 auStack_1d0 [12];
  float fStack_1c4;
  undefined1 auStack_1c0 [12];
  undefined1 auStack_1b4 [12];
  undefined1 auStack_1a8 [12];
  undefined4 uStack_19c;
  undefined1 auStack_198 [12];
  float fStack_18c;
  undefined1 auStack_188 [12];
  undefined1 auStack_17c [12];
  float fStack_170;
  undefined1 auStack_16c [12];
  undefined1 auStack_160 [76];
  int iStack_114;
  int iStack_110;
  int iStack_10c;
  int iStack_108;
  int iStack_104;
  int iStack_100;
  undefined1 auStack_f0 [64];
  undefined1 auStack_b0 [12];
  float fStack_a4;
  float fStack_a0;
  undefined1 auStack_9c [12];
  float fStack_90;
  float fStack_8c;
  undefined1 auStack_88 [12];
  undefined1 auStack_7c [12];
  float fStack_70;
  float fStack_6c;
  undefined1 auStack_68 [12];
  float fStack_5c;
  float fStack_58;
  undefined1 auStack_54 [12];
  int iStack_48;
  char cStack_41;
  int *piStack_40;
  undefined1 auStack_3c [12];
  int *piStack_30;
  undefined1 auStack_2c [12];
  float fStack_20;
  float fStack_1c;
  int iStack_18;
  uint uStack_14;
  void *pvStack_10;
  undefined *puStack_c;
  uint uStack_8;
  
  uStack_8 = 0xffffffff;
  puStack_c = &UNK_01624c4e;
  pvStack_10 = ExceptionList;
  uStack_14 = _DAT_018bcc60 ^ (uint)&stack0xfffffffc;
  ExceptionList = &pvStack_10;
  fStack_1c = 0.0;
  if (param_1 != 0.0) {
    DAT_019514b5 = 1;
    fStack_1c = _DAT_0197f47c;
    param_1 = _DAT_0197f47c;
  }
  thunk_FUN_00bdf180(param_1,uStack_14);
  if (*(char *)(iStack_18 + 0x50) != '\0') {
    fVar7 = (float10)thunk_FUN_00aa61b0();
    if (fVar7 / (float10)_DAT_016f2028 <= (float10)_DAT_016ef478) {
      fVar7 = (float10)thunk_FUN_00aa61b0();
      fVar1 = (float)(fVar7 / (float10)_DAT_016f2028);
    }
    else {
      fVar1 = 1.0;
    }
    fStack_20 = fVar1 * (float)_DAT_016f29f0 + (float)_DAT_016f29f0;
    if (_DAT_019514c0 < fStack_20) {
      _DAT_019514c0 = fStack_20;
    }
  }
  if (*(char *)(iStack_18 + 0xa5) == '\0') {
    *(undefined4 *)(iStack_18 + 0x17c) = 0;
  }
  else {
    *(float *)(iStack_18 + 0x17c) = *(float *)(iStack_18 + 0x17c) + param_1;
    if ((float)_DAT_016f2018 < *(float *)(iStack_18 + 0x17c)) {
      thunk_FUN_00bd8a60();
      *(undefined1 *)(iStack_18 + 0xa5) = 0;
      *(undefined4 *)(iStack_18 + 0x17c) = 0;
    }
  }
  if (*(int *)(iStack_18 + 0xb4) < 4) {
    *(undefined4 *)(iStack_18 + 0xf4) = 0;
  }
  else if ((_DAT_0197f45c < (float)_DAT_016ec7e0 != (_DAT_0197f45c == (float)_DAT_016ec7e0)) &&
          ((_DAT_019514dc & 0x40) == 0)) {
    iVar3 = thunk_FUN_00ab0d20();
    if (iVar3 != 0) {
      piVar4 = (int *)thunk_FUN_00ab0d20();
      cVar2 = (**(code **)(*piVar4 + 0x24))();
      if (cVar2 == '\0') goto LAB_00bdb3da;
    }
    thunk_FUN_00a85100();
    uStack_8 = 0;
    thunk_FUN_00bab5e0(1,auStack_2c);
    piStack_30 = (int *)thunk_FUN_00bb0610();
    while ((((piStack_30 != (int *)0x0 && (DAT_019514b7 == '\0')) &&
            (*(char *)((int)piStack_30 + 0x35) == '\x01')) &&
           (cVar2 = thunk_FUN_00bc5c90(), cVar2 != '\0'))) {
      thunk_FUN_00aa38b0();
      uStack_8._0_1_ = 1;
      piStack_40 = piStack_30;
      cVar2 = thunk_FUN_00ae68b0();
      if (((cVar2 == '\0') && (cVar2 = thunk_FUN_00b26f90(), cVar2 != '\0')) &&
         (((piStack_30[3] & 1U) == 0 && ((char)piStack_40[0x30] != '\0')))) {
        cVar2 = thunk_FUN_00be1440(piStack_30);
        if (cVar2 == '\0') {
          if ((_DAT_019514dc & 2) == 0) {
            if ((_DAT_019514dc & 1) != 0) {
              thunk_FUN_00a9a530(auStack_68,iStack_18 + 0x10);
              uStack_8._0_1_ = 5;
              fVar7 = (float10)thunk_FUN_00aa62b0();
              fStack_6c = (float)fVar7;
              if ((float)_DAT_016fcf38 <= fStack_6c / (float)_DAT_016f2008) {
                uStack_1e8 = _DAT_016fcf38;
              }
              else {
                uStack_1e8 = (double)(fStack_6c / (float)_DAT_016f2008);
              }
              fStack_1c4 = (float)uStack_1e8;
              thunk_FUN_00a8ac90(auStack_1c0,&fStack_1c4,auStack_1b4,&param_1);
              uStack_8._0_1_ = 6;
              uVar6 = thunk_FUN_00a8ac90();
              uStack_8._0_1_ = 7;
              thunk_FUN_00aa6470(uVar6);
              uStack_8._0_1_ = 6;
              thunk_FUN_00a7a5e0();
              uStack_8._0_1_ = 5;
              thunk_FUN_00a7a5e0();
              fVar7 = (float10)thunk_FUN_00aa62b0();
              fStack_70 = (float)fVar7;
              fVar1 = _DAT_01713248;
              if (fStack_70 < (float)_DAT_016f8410) {
                fVar1 = fStack_70;
              }
              thunk_FUN_00aa64d0(fVar1);
              uStack_8._0_1_ = 1;
              thunk_FUN_00a7a5e0();
            }
          }
          else {
            thunk_FUN_00a9a530(auStack_54,iStack_18 + 0x10);
            uStack_8._0_1_ = 2;
            fVar7 = (float10)thunk_FUN_00aa62b0();
            fStack_58 = (float)fVar7;
            if ((float)_DAT_016fcf38 <= fStack_58 / (float)_DAT_016f2008) {
              uStack_1e8 = _DAT_016fcf38;
            }
            else {
              uStack_1e8 = (double)(fStack_58 / (float)_DAT_016f2008);
            }
            fStack_1e0 = (float)uStack_1e8;
            thunk_FUN_00a8ac90(auStack_1dc,&fStack_1e0,auStack_1d0,&param_1);
            uStack_8._0_1_ = 3;
            uVar6 = thunk_FUN_00a8ac90();
            uStack_8._0_1_ = 4;
            thunk_FUN_00b031b0(uVar6);
            uStack_8._0_1_ = 3;
            thunk_FUN_00a7a5e0();
            uStack_8._0_1_ = 2;
            thunk_FUN_00a7a5e0();
            fVar7 = (float10)thunk_FUN_00aa62b0();
            fStack_5c = (float)fVar7;
            fVar1 = _DAT_01713248;
            if (fStack_5c < (float)_DAT_016f8410) {
              fVar1 = fStack_5c;
            }
            thunk_FUN_00aa64d0(fVar1);
            uStack_8._0_1_ = 1;
            thunk_FUN_00a7a5e0();
          }
        }
        else {
          thunk_FUN_00a833e0(iStack_18 + 0xc0);
          if (DAT_019514cd != '\0') {
            *(undefined1 *)(iStack_18 + 0xa5) = 1;
          }
          cVar2 = thunk_FUN_00bdbee0();
          if (((cVar2 == '\0') || (uVar5 = thunk_FUN_00bdbeb0(), 3 < uVar5)) &&
             (*(char *)((int)piStack_40 + 0xc1) == '\0')) {
            *(int *)(iStack_18 + 0x3c) = *(int *)(iStack_18 + 0x3c) + 2;
          }
          *(undefined4 *)(iStack_18 + 0x44) = 0;
          *(undefined4 *)(iStack_18 + 0x40) = 0;
          thunk_FUN_00a833e0(auStack_3c);
          uVar6 = thunk_FUN_00ae8820();
          *(undefined4 *)(iStack_18 + 0x110) = uVar6;
          thunk_FUN_00a833e0(piStack_30 + 4);
          if ((((char)piStack_40[0x6e] == '\0') && (iVar3 = thunk_FUN_00bcf400(), iVar3 != 2)) &&
             (*(int **)(iStack_18 + 0x180) != piStack_30)) {
            *(int **)(iStack_18 + 0x180) = piStack_30;
            *(undefined4 *)(iStack_18 + 0x174) = 0;
            *(undefined4 *)(iStack_18 + 0x60 + *(int *)(iStack_18 + 0x8c) * 4) =
                 *(undefined4 *)(iStack_18 + 0x110);
            iVar3 = thunk_FUN_00bcf400();
            if (iVar3 == 0) {
              uStack_1e8._4_4_ = 0;
            }
            else {
              iVar3 = thunk_FUN_00bcf400();
              uStack_1e8._4_4_ = 2 - (uint)(iVar3 != 2);
            }
            *(int *)(iStack_18 + 0x90) = uStack_1e8._4_4_;
            cStack_41 = '\0';
            if ((*(char *)(iStack_18 + 0x51) != '\0') && (*(int *)(iStack_18 + 0x8c) == 0)) {
              if (_DAT_0197f494 != 0) {
                uVar6 = thunk_FUN_00a6dff0(&UNK_016ef178,1,0,0);
                thunk_FUN_00c37ff0(&UNK_016ef178,uVar6);
              }
              cStack_41 = '\x01';
            }
            if ((*(char *)(iStack_18 + 0x51) == '\0') || (cStack_41 != '\0')) {
              uVar6 = thunk_FUN_00a6dff0(&UNK_016ef164,1,0,0);
              thunk_FUN_00c37ff0(&UNK_016ef164,uVar6);
            }
            *(undefined1 *)(iStack_18 + 0x51) = 1;
            *(int *)(iStack_18 + 0x8c) = *(int *)(iStack_18 + 0x8c) + 1;
            if (9 < *(int *)(iStack_18 + 0x8c)) {
              *(undefined4 *)(iStack_18 + 0x174) = _DAT_01713ef8;
            }
            iVar3 = *(int *)(iStack_18 + 0x8c);
            fVar7 = (float10)thunk_FUN_00a82f20(_DAT_016ef758);
            *(float *)(iStack_18 + 0x54) =
                 (float)((float10)*(float *)(iStack_18 + 0x54) -
                        (fVar7 + (float10)_DAT_016f8810) * (float10)iVar3 * (float10)_DAT_016ef478);
            iVar3 = thunk_FUN_00ab0d20();
            if (iVar3 != 0) {
              piVar4 = (int *)thunk_FUN_00ab0d20();
              (**(code **)(*piVar4 + 0x44))(iStack_18);
            }
          }
          else if (*(float *)(iStack_18 + 0x174) < (float)_DAT_016fcc88) {
            *(undefined4 *)(iStack_18 + 0x174) = _DAT_01713ef8;
          }
          (**(code **)(*piStack_30 + 0x20))(iStack_18,0,0,auStack_3c);
          if (*(char *)((int)piStack_40 + 0x1ba) != '\0') {
            *(int *)(iStack_18 + 0x110) = *(int *)(iStack_18 + 0x110) + _DAT_01950f9c;
            fVar7 = (float10)thunk_FUN_00a82f20(_DAT_016ef758);
            *(float *)(iStack_18 + 0x54) =
                 (float)((float10)*(float *)(iStack_18 + 0x54) -
                        (fVar7 + (float10)_DAT_016f8810) * (float10)_DAT_016ffc60);
          }
          if ((char)piStack_40[0x6e] == '\0') {
            if (_DAT_019514d4 != 0) {
              thunk_FUN_00b651c0(_DAT_019514d4,0,1);
              iStack_48 = thunk_FUN_00b68fd0();
              if (iStack_48 != 0) {
                thunk_FUN_00a833e0(iStack_18 + 0x10);
              }
            }
          }
          else {
            _DAT_019514bc = 0;
            DAT_019514b7 = '\x01';
          }
        }
      }
      thunk_FUN_00bab5e0(1,auStack_2c);
      piStack_30 = (int *)thunk_FUN_00bb0910();
      uStack_8 = (uint)uStack_8._1_3_ << 8;
      thunk_FUN_00a7a5e0();
    }
    thunk_FUN_00bab5e0(2,auStack_2c);
    piStack_30 = (int *)thunk_FUN_00bb0610();
    while ((piStack_30 != (int *)0x0 && (DAT_019514b7 == '\0'))) {
      thunk_FUN_00a83390(iStack_18 + 0xc0);
      uStack_8._0_1_ = 8;
      cVar2 = thunk_FUN_00bc5f50();
      if ((cVar2 != '\0') &&
         (((piStack_30[3] & 1U) == 0 && (*(char *)((int)piStack_30 + 0x7d) != '\0')))) {
        cVar2 = thunk_FUN_00be1440(piStack_30);
        if (cVar2 == '\0') {
          cVar2 = thunk_FUN_00be1a10(piStack_30);
          if ((cVar2 != '\0') && (_DAT_0197f494 != 0)) {
            uVar6 = thunk_FUN_00a6dff0(&UNK_01713eec,1,0,0);
            thunk_FUN_00c37ff0(&UNK_01713eec,uVar6);
          }
          if ((_DAT_019514dc & 4) == 0) {
            if ((_DAT_019514dc & 8) != 0) {
              thunk_FUN_00a9a530(auStack_9c,iStack_18 + 0x10);
              uStack_8._0_1_ = 0xe;
              fVar7 = (float10)thunk_FUN_00aa62b0();
              fStack_a0 = (float)fVar7;
              if ((float)_DAT_016fcf38 <= fStack_a0 / (float)_DAT_016f2008) {
                uStack_1e8 = _DAT_016fcf38;
              }
              else {
                uStack_1e8 = (double)(fStack_a0 / (float)_DAT_016f2008);
              }
              fStack_170 = (float)uStack_1e8;
              thunk_FUN_00a8ac90(auStack_16c,&fStack_170,auStack_160,&param_1);
              uStack_8._0_1_ = 0xf;
              uVar6 = thunk_FUN_00a8ac90();
              uStack_8._0_1_ = 0x10;
              thunk_FUN_00b031b0(uVar6);
              uStack_8._0_1_ = 0xf;
              thunk_FUN_00a7a5e0();
              uStack_8._0_1_ = 0xe;
              thunk_FUN_00a7a5e0();
              fVar7 = (float10)thunk_FUN_00aa62b0();
              fStack_a4 = (float)fVar7;
              fVar1 = _DAT_01713248;
              if (fStack_a4 < (float)_DAT_016f8410) {
                fVar1 = fStack_a4;
              }
              thunk_FUN_00aa64d0(fVar1);
              uStack_8._0_1_ = 8;
              thunk_FUN_00a7a5e0();
            }
          }
          else {
            thunk_FUN_00a9a530(auStack_88,iStack_18 + 0x10);
            uStack_8._0_1_ = 0xb;
            fVar7 = (float10)thunk_FUN_00aa62b0();
            fStack_8c = (float)fVar7;
            if ((float)_DAT_016fcf38 <= fStack_8c / (float)_DAT_016f2008) {
              uStack_1e8 = _DAT_016fcf38;
            }
            else {
              uStack_1e8 = (double)(fStack_8c / (float)_DAT_016f2008);
            }
            fStack_18c = (float)uStack_1e8;
            thunk_FUN_00a8ac90(auStack_188,&fStack_18c,auStack_17c,&param_1);
            uStack_8._0_1_ = 0xc;
            uVar6 = thunk_FUN_00a8ac90();
            uStack_8._0_1_ = 0xd;
            thunk_FUN_00aa6470(uVar6);
            uStack_8._0_1_ = 0xc;
            thunk_FUN_00a7a5e0();
            uStack_8._0_1_ = 0xb;
            thunk_FUN_00a7a5e0();
            fVar7 = (float10)thunk_FUN_00aa62b0();
            fStack_90 = (float)fVar7;
            fVar1 = _DAT_01713248;
            if (fStack_90 < (float)_DAT_016f8410) {
              fVar1 = fStack_90;
            }
            thunk_FUN_00aa64d0(fVar1);
            uStack_8._0_1_ = 8;
            thunk_FUN_00a7a5e0();
          }
        }
        else if ((_DAT_019514dc & 0x10) == 0) {
          thunk_FUN_00a833e0(iStack_18 + 0xc0);
          (**(code **)(*piStack_30 + 0x20))(iStack_18,0,0,auStack_7c);
          _DAT_019514bc = 0;
          DAT_019514b7 = '\x01';
          if ((*(char *)((int)piStack_30 + 0x7e) != '\0') && ((char)piStack_30[0x26] == '\0')) {
            *(undefined1 *)(iStack_18 + 0xa4) = 1;
          }
        }
        else {
          uStack_19c = _DAT_016ec7d8;
          thunk_FUN_00a8ac90(auStack_1a8,&param_1,auStack_198,&uStack_19c);
          uStack_8._0_1_ = 9;
          uVar6 = thunk_FUN_00a8ac90();
          uStack_8._0_1_ = 10;
          thunk_FUN_00aa6470(uVar6);
          uStack_8._0_1_ = 9;
          thunk_FUN_00a7a5e0();
          uStack_8._0_1_ = 8;
          thunk_FUN_00a7a5e0();
        }
      }
      thunk_FUN_00bab5e0(2,auStack_2c);
      piStack_30 = (int *)thunk_FUN_00bb0910();
      uStack_8 = (uint)uStack_8._1_3_ << 8;
      thunk_FUN_00a7a5e0();
    }
    thunk_FUN_00bab5e0(0,auStack_2c);
    piStack_30 = (int *)thunk_FUN_00bb0610();
    while (piStack_30 != (int *)0x0) {
      thunk_FUN_00a83390(iStack_18 + 0xc0);
      uStack_8 = CONCAT31(uStack_8._1_3_,0x11);
      cVar2 = thunk_FUN_00ae4b00();
      if (((cVar2 != '\0') && ((piStack_30[3] & 1U) == 0)) &&
         (cVar2 = thunk_FUN_00be1440(piStack_30), cVar2 != '\0')) {
        thunk_FUN_00a833e0(iStack_18 + 0xc0);
        (**(code **)(*piStack_30 + 0x20))(iStack_18,0,0,auStack_b0);
        if (*(char *)(iStack_18 + 0x51) == '\0') {
          uVar6 = thunk_FUN_00a6dff0(&UNK_016ef164,1,0,0);
          thunk_FUN_00c37ff0(&UNK_016ef164,uVar6);
        }
        *(undefined1 *)(iStack_18 + 0x51) = 1;
      }
      thunk_FUN_00bab5e0(0,auStack_2c);
      piStack_30 = (int *)thunk_FUN_00bb0910();
      uStack_8 = uStack_8 & 0xffffff00;
      thunk_FUN_00a7a5e0();
    }
    uStack_8 = 0xffffffff;
    thunk_FUN_00a82140();
  }
LAB_00bdb3da:
  if ((float)_DAT_016fcc88 <= *(float *)(iStack_18 + 0x174)) {
    *(undefined4 *)(iStack_18 + 0x180) = 0;
    *(undefined4 *)(iStack_18 + 0x8c) = 0;
    *(undefined4 *)(iStack_18 + 0x90) = 0;
    for (iStack_114 = 0; iStack_114 < 0xb; iStack_114 = iStack_114 + 1) {
      *(undefined4 *)(iStack_18 + 0x60 + iStack_114 * 4) = 0xffffffff;
    }
    *(undefined4 *)(iStack_18 + 0x178) = 0;
  }
  else {
    *(float *)(iStack_18 + 0x174) = *(float *)(iStack_18 + 0x174) + fStack_1c;
    if ((float)_DAT_01713ee0 <= *(float *)(iStack_18 + 0x174)) {
      *(undefined4 *)(iStack_18 + 0x174) = _DAT_016f7b50;
      thunk_FUN_00be2430(iStack_18);
      iVar3 = thunk_FUN_00ab0d20();
      if (iVar3 != 0) {
        piVar4 = (int *)thunk_FUN_00ab0d20();
        (**(code **)(*piVar4 + 0x4c))(iStack_18);
      }
      if ((1 < *(int *)(iStack_18 + 0x8c)) && (-1 < *(int *)(iStack_18 + 0x60))) {
        if (_DAT_0197f478 - *(int *)(iStack_18 + 0x8c) < 2) {
          uStack_1e8._4_4_ = 2;
        }
        else {
          uStack_1e8._4_4_ = _DAT_0197f478 - *(int *)(iStack_18 + 0x8c);
        }
        _DAT_0197f478 = uStack_1e8._4_4_;
        if ((2 < *(int *)(iStack_18 + 0x8c)) && (-1 < *(int *)(iStack_18 + 100))) {
          cVar2 = thunk_FUN_00c597a0();
          if ((cVar2 == '\0') || (*(int *)(iStack_18 + 0x90) != 2)) {
            thunk_FUN_00c592e0(*(undefined4 *)(iStack_18 + 0x8c),*(undefined4 *)(iStack_18 + 0x90),1
                               ,0);
          }
          thunk_FUN_00b44e10(*(undefined4 *)(iStack_18 + 0x8c));
          thunk_FUN_00b46d00();
          uVar6 = thunk_FUN_00c62270(_DAT_0197f448);
          thunk_FUN_01552460(auStack_f0,&UNK_01713ed0,uVar6);
          uVar6 = thunk_FUN_00a6dff0(auStack_f0,1,1,1);
          thunk_FUN_00c37ff0(auStack_f0,uVar6);
          uVar6 = thunk_FUN_00a6dff0(&UNK_016f81a4,1,0,1);
          thunk_FUN_00c37ff0(&UNK_016f81a4,uVar6);
          thunk_FUN_00a83390(iStack_18 + 0x104);
          uStack_8 = 0x12;
          if (*(int *)(iStack_18 + 0x178) != 0) {
            thunk_FUN_00a833e0(*(int *)(iStack_18 + 0x178) + 8);
          }
          uStack_8 = 0xffffffff;
          thunk_FUN_00a7a5e0();
        }
        thunk_FUN_00c4a500(*(undefined4 *)(iStack_18 + 0x8c),iStack_18 + 0x60);
        thunk_FUN_00c4d8a0();
        if (2 < *(int *)(iStack_18 + 0x8c)) {
          if ((_DAT_019514ac & 1) == 0) {
            _DAT_019514ac = _DAT_019514ac | 1;
            uStack_8 = 0x13;
            _DAT_019514a8 = thunk_FUN_00bbde60(&UNK_01709054,0);
            uStack_8 = 0xffffffff;
          }
          for (iStack_100 = 0; iStack_100 < *(int *)(iStack_18 + 0x8c); iStack_100 = iStack_100 + 1)
          {
            if (*(int *)(iStack_18 + 0x60 + iStack_100 * 4) == _DAT_019514a8) {
              if ((_DAT_019514ac & 2) == 0) {
                _DAT_019514ac = _DAT_019514ac | 2;
                uStack_8 = 0x14;
                _DAT_019514a4 = thunk_FUN_00a6dff0(_DAT_018b7bd4);
                uStack_8 = 0xffffffff;
              }
              thunk_FUN_00c37ff0(_DAT_018b7bd4,_DAT_019514a4,1,1,0);
              break;
            }
          }
        }
        if (*(int *)(_DAT_0197f494 + 0x2dc) < *(int *)(iStack_18 + 0x8c)) {
          for (iStack_104 = 0; iStack_104 < 0xb; iStack_104 = iStack_104 + 1) {
            *(undefined4 *)(_DAT_0197f494 + 0x2e0 + iStack_104 * 4) =
                 *(undefined4 *)(iStack_18 + 0x60 + iStack_104 * 4);
          }
          *(undefined4 *)(_DAT_0197f494 + 0x2dc) = *(undefined4 *)(iStack_18 + 0x8c);
          _DAT_018b7bd0 = thunk_FUN_00b53080(iStack_18 + 0x60,*(undefined4 *)(iStack_18 + 0x8c),0);
        }
        else if (*(int *)(iStack_18 + 0x8c) == *(int *)(_DAT_0197f494 + 0x2dc)) {
          if (_DAT_018b7bd0 == -1) {
            _DAT_018b7bd0 =
                 thunk_FUN_00b53080(_DAT_0197f494 + 0x2e0,*(undefined4 *)(_DAT_0197f494 + 0x2dc),0);
          }
          iStack_108 = thunk_FUN_00b53080(iStack_18 + 0x60,*(undefined4 *)(iStack_18 + 0x8c),0);
          if (_DAT_018b7bd0 < iStack_108) {
            for (iStack_10c = 0; iStack_10c < 0xb; iStack_10c = iStack_10c + 1) {
              *(undefined4 *)(_DAT_0197f494 + 0x2e0 + iStack_10c * 4) =
                   *(undefined4 *)(iStack_18 + 0x60 + iStack_10c * 4);
            }
            *(undefined4 *)(_DAT_0197f494 + 0x2dc) = *(undefined4 *)(iStack_18 + 0x8c);
          }
        }
      }
      *(undefined4 *)(iStack_18 + 0x8c) = 0;
      *(undefined4 *)(iStack_18 + 0x90) = 0;
      *(undefined4 *)(iStack_18 + 0x180) = 0;
      *(undefined4 *)(iStack_18 + 0x178) = 0;
      for (iStack_110 = 0; iStack_110 < 0xb; iStack_110 = iStack_110 + 1) {
        *(undefined4 *)(iStack_18 + 0x60 + iStack_110 * 4) = 0xffffffff;
      }
    }
  }
  thunk_FUN_00bdbf10();
  thunk_FUN_00bdc360(param_1);
  thunk_FUN_00bdc050(param_1);
  ExceptionList = pvStack_10;
  thunk_FUN_01550950();
  return;
}


```

## FUN_00aa7890 — 00aa7890

- 函数名: FUN_00aa7890
- 函数体: 575 字节
- 调用者数: 0 / 被调用者数: 12

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_00aa7890(int *param_1,int param_2)

{
  int iVar1;
  undefined4 uVar2;
  undefined1 auStack_5c [64];
  int iStack_1c;
  int *piStack_18;
  uint uStack_14;
  void *pvStack_10;
  undefined *puStack_c;
  undefined4 uStack_8;
  
  uStack_8 = 0xffffffff;
  puStack_c = &UNK_01605136;
  pvStack_10 = ExceptionList;
  uStack_14 = _DAT_018bcc60 ^ (uint)&stack0xfffffffc;
  ExceptionList = &pvStack_10;
  piStack_18 = param_1;
  if ((((char)param_1[10] != '\0') && (2 < *(int *)(param_2 + 0x8c))) &&
     (iStack_1c = *(int *)(*param_1 + 0x20), iStack_1c != 0)) {
    thunk_FUN_00b25e70();
    thunk_FUN_00aa77d0();
    thunk_FUN_00b25b70();
    thunk_FUN_00a83d00();
    uStack_8 = 0;
    thunk_FUN_00a83c40();
    thunk_FUN_00b2bcb0();
    uStack_8 = 0xffffffff;
    thunk_FUN_00a7e630();
    if (piStack_18[0xc] != 0) {
      thunk_FUN_00c4a410();
    }
    thunk_FUN_00c916e0();
    iVar1 = thunk_FUN_00a6dff0();
    piStack_18[0xc] = iVar1;
    uVar2 = thunk_FUN_00a83d00();
    uStack_8 = 1;
    thunk_FUN_00a83c40(uVar2);
    thunk_FUN_00c49730(auStack_5c,_DAT_016f40cc,0x3f800000);
    uStack_8 = 0xffffffff;
    thunk_FUN_00a7e630();
  }
  ExceptionList = pvStack_10;
  thunk_FUN_01550950();
  return;
}


```

## FUN_00b29620 — 00b29620

- 函数名: FUN_00b29620
- 函数体: 899 字节
- 调用者数: 0 / 被调用者数: 17

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_00b29620(int param_1,int param_2)

{
  undefined4 uVar1;
  undefined1 auStack_148 [24];
  undefined4 uStack_130;
  undefined1 *puStack_12c;
  undefined4 uStack_128;
  undefined *puStack_124;
  undefined4 *puStack_120;
  undefined4 uStack_11c;
  undefined4 uStack_118;
  undefined4 uStack_114;
  undefined1 auStack_110 [20];
  undefined4 uStack_fc;
  int iStack_f8;
  int iStack_f4;
  undefined *puStack_f0;
  code *pcStack_ec;
  undefined *puStack_e8;
  uint uStack_e4;
  int iStack_d0;
  int iStack_cc;
  undefined1 auStack_c8 [40];
  undefined1 *puStack_a0;
  undefined1 *puStack_94;
  undefined4 uStack_48;
  undefined2 uStack_44;
  undefined1 uStack_42;
  undefined4 uStack_41;
  undefined4 uStack_3d;
  undefined4 uStack_39;
  undefined4 uStack_35;
  undefined4 uStack_31;
  undefined4 uStack_2d;
  undefined1 uStack_29;
  undefined2 uStack_28;
  undefined4 uStack_26;
  undefined2 uStack_22;
  int iStack_20;
  int iStack_1c;
  int iStack_18;
  uint uStack_14;
  void *pvStack_10;
  undefined *puStack_c;
  undefined4 uStack_8;
  
  uStack_8 = 0xffffffff;
  puStack_c = &UNK_01612c3f;
  pvStack_10 = ExceptionList;
  uStack_e4 = _DAT_018bcc60 ^ (uint)&stack0xfffffffc;
  ExceptionList = &pvStack_10;
  iStack_18 = param_1;
  uStack_14 = uStack_e4;
  if ((2 < *(int *)(param_2 + 0x8c)) &&
     (iStack_1c = *(int *)(*(int *)(param_1 + 0x54) + 0x18), iStack_1c != 0)) {
    puStack_e8 = *(undefined **)(param_2 + 0x8c);
    puStack_f0 = (undefined *)0xb2968a;
    pcStack_ec = (code *)iStack_1c;
    thunk_FUN_00b25e70();
    if ((_DAT_018c55a0 & 1) == 0) {
      _DAT_018c55a0 = _DAT_018c55a0 | 1;
      uStack_8 = 0;
      puStack_e8 = &UNK_01703e00;
      pcStack_ec = (code *)0xb296ba;
      thunk_FUN_00c9f550();
      pcStack_ec = FUN_016af5a0;
      puStack_f0 = (undefined *)0xb296c4;
      thunk_FUN_01552290();
      uStack_8 = 0xffffffff;
    }
    puStack_e8 = (undefined *)0x18c55ac;
    pcStack_ec = (code *)0xb296db;
    iStack_20 = thunk_FUN_00cabb70();
    if (iStack_20 != 0) {
      uStack_28 = _DAT_01703dfc;
      uStack_26 = 0;
      uStack_22 = 0;
      pcStack_ec = *(code **)(param_2 + 0x8c);
      puStack_f0 = &UNK_016f40e8;
      iStack_f4 = 8;
      iStack_f8 = (int)&uStack_28 + 1;
      uStack_fc = 0xb29711;
      thunk_FUN_00c916e0();
      pcStack_ec = (code *)&uStack_28;
      puStack_f0 = (undefined *)0xb29723;
      thunk_FUN_00c9f550();
      uStack_8 = 1;
      puStack_f0 = auStack_c8;
      iStack_f4 = 0xb29739;
      thunk_FUN_00a7ea00();
      uStack_8 = 0xffffffff;
      iStack_f4 = 0xb2974b;
      thunk_FUN_00c9f6a0();
    }
    if (*(int *)(param_2 + 0x8c) == 3 || *(int *)(param_2 + 0x8c) + -3 < 0) {
      iStack_cc = 0;
    }
    else {
      if (*(int *)(param_2 + 0x8c) + -3 < _DAT_018b6414) {
        iStack_d0 = *(int *)(param_2 + 0x8c) + -3;
      }
      else {
        iStack_d0 = _DAT_018b6414;
      }
      iStack_cc = iStack_d0;
    }
    pcStack_ec = (code *)iStack_cc;
    puStack_f0 = (undefined *)0xb297b6;
    puStack_f0 = (undefined *)thunk_FUN_00aa77d0();
    iStack_f4 = iStack_1c;
    iStack_f8 = 0xb297c0;
    thunk_FUN_00b25b70();
    pcStack_ec = (code *)&UNK_00a39aea;
    puStack_f0 = (undefined *)0xb297d3;
    uStack_114 = thunk_FUN_00a83d00();
    uStack_8 = 2;
    puStack_a0 = auStack_110;
    uStack_118 = 0xb29803;
    thunk_FUN_00a83c40();
    uStack_118 = 0x3f800000;
    uStack_11c = _DAT_016f4094;
    puStack_120 = (undefined4 *)0xb29824;
    thunk_FUN_00b2bcb0();
    uStack_8 = 0xffffffff;
    puStack_120 = (undefined4 *)0xb29836;
    thunk_FUN_00a7e630();
    if (*(int *)(iStack_18 + 0x4c) != 0) {
      puStack_120 = *(undefined4 **)(iStack_18 + 0x4c);
      puStack_124 = (undefined *)0xb29851;
      thunk_FUN_00c4a410();
    }
    uStack_48 = _DAT_01703df4;
    uStack_44 = _DAT_01703df8;
    uStack_42 = DAT_01703dfa;
    uStack_41 = 0;
    uStack_3d = 0;
    uStack_39 = 0;
    uStack_35 = 0;
    uStack_31 = 0;
    uStack_2d = 0;
    uStack_29 = 0;
    if (*(int *)(param_2 + 0x8c) + -2 < 2) {
      iStack_cc = 1;
    }
    else {
      if (*(int *)(param_2 + 0x8c) + -2 < 5) {
        iStack_d0 = *(int *)(param_2 + 0x8c) + -2;
      }
      else {
        iStack_d0 = 5;
      }
      iStack_cc = iStack_d0;
    }
    puStack_120 = (undefined4 *)iStack_cc;
    puStack_124 = &UNK_016f40e8;
    uStack_128 = 0x20;
    puStack_12c = &uStack_42;
    uStack_130 = 0xb298f3;
    thunk_FUN_00c916e0();
    puStack_120 = &uStack_48;
    puStack_124 = (undefined *)0xb298ff;
    uVar1 = thunk_FUN_00a6dff0();
    *(undefined4 *)(iStack_18 + 0x4c) = uVar1;
    puStack_120 = (undefined4 *)0x0;
    puStack_124 = &UNK_00a38ee2;
    uStack_128 = 0xb2991e;
    uVar1 = thunk_FUN_00a83d00();
    uStack_8 = 3;
    puStack_94 = auStack_148;
    thunk_FUN_00a83c40(uVar1);
    thunk_FUN_00c49730(&uStack_48,_DAT_016f40cc,0x3f800000);
    uStack_8 = 0xffffffff;
    thunk_FUN_00a7e630();
  }
  ExceptionList = pvStack_10;
  thunk_FUN_01550950();
  return;
}


```

## FUN_00c3a7e0 — 00c3a7e0

- 函数名: FUN_00c3a7e0
- 函数体: 782 字节
- 调用者数: 0 / 被调用者数: 14

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 FUN_00c3a7e0(undefined4 param_1,int param_2)

{
  undefined4 uVar1;
  int iVar2;
  undefined1 uStack_98;
  undefined1 auStack_94 [12];
  undefined1 auStack_88 [76];
  undefined1 auStack_3c [4];
  undefined1 auStack_38 [4];
  int iStack_34;
  undefined1 auStack_30 [16];
  undefined1 auStack_20 [4];
  undefined1 auStack_1c [4];
  int iStack_18;
  char *pcStack_14;
  void *pvStack_10;
  undefined *puStack_c;
  undefined4 uStack_8;
  
  uStack_8 = 0xffffffff;
  puStack_c = &UNK_0162f7ee;
  pvStack_10 = ExceptionList;
  ExceptionList = &pvStack_10;
  thunk_FUN_00c973d0(&UNK_01719f1c,param_2 + 0x248,_DAT_018bcc60 ^ (uint)&stack0xfffffffc);
  thunk_FUN_00c973d0(&UNK_01719f00,param_2 + 0x24c);
  thunk_FUN_00c973d0(&UNK_01719ee4,param_2 + 0x250);
  thunk_FUN_00a71290(&UNK_01719ed8,param_2 + 0x254);
  thunk_FUN_00a71290(&UNK_01719ecc,param_2 + 600);
  thunk_FUN_00c973d0(&UNK_01719eb0,param_2 + 0x298);
  thunk_FUN_00c973d0(&UNK_01719e90,param_2 + 0x29c);
  thunk_FUN_00a71290(&UNK_01719e7c,param_2 + 0x2a0);
  pcStack_14 = (char *)thunk_FUN_00c971c0(&UNK_01719e6c);
  uVar1 = thunk_FUN_00b72b20(auStack_94,pcStack_14);
  uStack_8 = 0;
  thunk_FUN_00a833e0(uVar1);
  uStack_8 = 0xffffffff;
  thunk_FUN_00a7a5e0();
  pcStack_14 = (char *)thunk_FUN_00c971c0(&UNK_01719e5c);
  uVar1 = thunk_FUN_00b72b20(auStack_88,pcStack_14);
  uStack_8 = 1;
  thunk_FUN_00a833e0(uVar1);
  uStack_8 = 0xffffffff;
  thunk_FUN_00a7a5e0();
  thunk_FUN_00a71290(&UNK_01719e50,param_2 + 0x134);
  pcStack_14 = (char *)thunk_FUN_00c971c0(&UNK_01719e40);
  if ((pcStack_14 != (char *)0x0) && (*pcStack_14 != '\0')) {
    iVar2 = thunk_FUN_015523b0(pcStack_14,&UNK_016f2a74);
    if (iVar2 == 0) {
      uStack_98 = 0;
      goto LAB_00c3a9e2;
    }
  }
  uStack_98 = 1;
LAB_00c3a9e2:
  *(undefined1 *)(param_2 + 0x138) = uStack_98;
  thunk_FUN_00aef250();
  iStack_18 = thunk_FUN_00a6ef60(&UNK_01719e38);
  while (iStack_18 != 0) {
    thunk_FUN_00c3abc0();
    uStack_8 = 2;
    thunk_FUN_00a71290(&UNK_01719e34,auStack_20);
    thunk_FUN_00c973d0(&UNK_01719e2c,auStack_1c);
    iStack_34 = thunk_FUN_00a6ef60(&UNK_01719e20);
    while (iStack_34 != 0) {
      thunk_FUN_00a71290(&UNK_01719e18,auStack_38);
      thunk_FUN_00c973d0(&UNK_01719e0c,auStack_3c);
      thunk_FUN_00c40160(auStack_3c);
      iStack_34 = thunk_FUN_00a6ef30(&UNK_01719e20);
    }
    thunk_FUN_00c408e0(auStack_30);
    uStack_8 = 0xffffffff;
    thunk_FUN_00afbfd0();
    iStack_18 = thunk_FUN_00a6ef30(&UNK_01719e38);
  }
  ExceptionList = pvStack_10;
  return 1;
}


```

## FUN_00b5a560 — 00b5a560

- 函数名: FUN_00b5a560
- 函数体: 1240 字节
- 调用者数: 0 / 被调用者数: 17

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_00b5a560(int param_1,int param_2)

{
  uint uVar1;
  undefined1 uVar2;
  char cVar3;
  undefined4 uVar4;
  char *pcVar5;
  int iVar6;
  uint uVar7;
  uint *puStack_88;
  int iStack_30;
  int iStack_2c;
  int iStack_28;
  int iStack_20;
  void *pvStack_10;
  undefined *puStack_c;
  undefined4 uStack_8;
  
  uStack_8 = 0xffffffff;
  puStack_c = &UNK_0161839b;
  pvStack_10 = ExceptionList;
  ExceptionList = &pvStack_10;
  if (param_2 != 0) {
    thunk_FUN_00a71290(&UNK_01709c68,param_1 + 0xe4,_DAT_018bcc60 ^ (uint)&stack0xfffffffc);
    uVar4 = thunk_FUN_00c971c0(&UNK_016ec4f0);
    uVar4 = thunk_FUN_00be20a0(uVar4);
    *(undefined4 *)(param_1 + 0xe0) = uVar4;
    uVar4 = thunk_FUN_00c971c0(&UNK_01709c5c);
    thunk_FUN_00b5a300(param_1 + 0xf0,uVar4);
    uVar4 = thunk_FUN_00c971c0(&UNK_01709c44);
    thunk_FUN_00b5a300(param_1 + 0x128,uVar4);
    uVar4 = thunk_FUN_00c971c0(&UNK_01709c2c);
    thunk_FUN_00b5a300(param_1 + 0x124,uVar4);
    uVar4 = thunk_FUN_00c971c0(&UNK_01709c1c);
    uVar2 = thunk_FUN_00b730a0(&UNK_016ec6d4,uVar4);
    *(undefined1 *)(param_1 + 0xe9) = uVar2;
    uVar4 = thunk_FUN_00c971c0(&UNK_01709c00);
    uVar2 = thunk_FUN_00b730a0(&UNK_016ec6d4,uVar4);
    *(undefined1 *)(param_1 + 0xe8) = uVar2;
    uVar4 = thunk_FUN_00c971c0(&UNK_01709be8);
    uVar2 = thunk_FUN_00b730a0(&UNK_016ec6d4,uVar4);
    *(undefined1 *)(param_1 + 0xea) = uVar2;
    uVar4 = thunk_FUN_00c971c0(&UNK_01709bd4);
    thunk_FUN_00b72910(param_1 + 0xec,uVar4);
    pcVar5 = (char *)thunk_FUN_00c971c0(&UNK_01707368);
    if ((pcVar5 != (char *)0x0) && (*pcVar5 != '\0')) {
      uVar4 = thunk_FUN_00c8cad0(0x40);
      *(undefined4 *)(param_1 + 0xf4) = uVar4;
      thunk_FUN_01552460(*(undefined4 *)(param_1 + 0xf4),&UNK_016fcf80,pcVar5);
    }
    iVar6 = thunk_FUN_00a6ef60(&UNK_01709bc0);
    *(undefined4 *)(param_1 + 0x120) = 0;
    if (iVar6 != 0) {
      iStack_20 = thunk_FUN_00a6ef60(&UNK_01709bb4);
      while (iStack_20 != 0) {
        uVar4 = thunk_FUN_00c987a0();
        uVar4 = thunk_FUN_00a6dff0(uVar4);
        *(undefined4 *)(param_1 + 0xf8 + *(int *)(param_1 + 0x120) * 4) = uVar4;
        thunk_FUN_00b651c0(*(undefined4 *)(param_1 + 0xf8 + *(int *)(param_1 + 0x120) * 4));
        cVar3 = thunk_FUN_00b68ed0();
        if (cVar3 == '\0') {
          *(undefined4 *)(param_1 + 0xf8 + *(int *)(param_1 + 0x120) * 4) = 0;
        }
        else {
          *(int *)(param_1 + 0x120) = *(int *)(param_1 + 0x120) + 1;
        }
        iStack_20 = thunk_FUN_00a6ef30(&UNK_01709bb4);
      }
    }
    iVar6 = thunk_FUN_00a6ef60(&UNK_01709bac);
    if (iVar6 != 0) {
      thunk_FUN_00a71290(&UNK_01709b98,param_1 + 300);
      thunk_FUN_00a71290(&UNK_01709b88,param_1 + 0x130);
      thunk_FUN_00a71290(&UNK_01709b80,param_1 + 0x134);
      thunk_FUN_00a71290(&UNK_01709b70,param_1 + 0x138);
      thunk_FUN_00a71290(&UNK_01709b64,param_1 + 0x13c);
    }
    iStack_28 = thunk_FUN_00a6ef60(&UNK_01707360);
    while (iStack_28 != 0) {
      *(int *)(param_1 + 0xdc) = *(int *)(param_1 + 0xdc) + 1;
      iStack_28 = thunk_FUN_00a6ef30(&UNK_01707360);
    }
    if (0 < *(int *)(param_1 + 0xdc)) {
      uVar1 = *(uint *)(param_1 + 0xdc);
      uVar7 = -(uint)((int)((ulonglong)uVar1 * 4 >> 0x20) != 0) | (uint)((ulonglong)uVar1 * 4);
      puStack_88 = (uint *)thunk_FUN_00c8cad0(-(uint)(0xfffffffb < uVar7) | uVar7 + 4);
      uStack_8 = 0;
      if (puStack_88 == (uint *)0x0) {
        puStack_88 = (uint *)0x0;
      }
      else {
        *puStack_88 = uVar1;
        thunk_FUN_01558ca0(puStack_88 + 1,4,uVar1,thunk_FUN_00b00d70,thunk_FUN_00a7a7e0);
        puStack_88 = puStack_88 + 1;
      }
      uStack_8 = 0xffffffff;
      *(uint **)(param_1 + 0xd8) = puStack_88;
      iStack_2c = *(int *)(param_1 + 0xd8);
      iStack_30 = thunk_FUN_00a6ef60(&UNK_01707360);
      while (iStack_30 != 0) {
        uVar4 = thunk_FUN_00c987a0();
        thunk_FUN_00b72910(iStack_2c,uVar4);
        iStack_2c = iStack_2c + 4;
        iStack_30 = thunk_FUN_00a6ef30(&UNK_01707360);
      }
    }
    iVar6 = thunk_FUN_00a6ef60(&UNK_01709b54);
    if (iVar6 != 0) {
      thunk_FUN_00b5ad30(iVar6);
      thunk_FUN_00b5b090(iVar6);
    }
    iVar6 = thunk_FUN_00a6ef60(&UNK_01709b44);
    if (iVar6 != 0) {
      uVar4 = thunk_FUN_00a6ef60(&UNK_01709b44);
      thunk_FUN_00b5ad30(uVar4);
    }
    iVar6 = thunk_FUN_00a6ef60(&UNK_01709b34);
    if (iVar6 != 0) {
      uVar4 = thunk_FUN_00a6ef60(&UNK_01709b34);
      thunk_FUN_00b5ad30(uVar4);
    }
  }
  ExceptionList = pvStack_10;
  return;
}


```

## FUN_00bf8ed0 — 00bf8ed0

- 函数名: FUN_00bf8ed0
- 函数体: 1824 字节
- 调用者数: 0 / 被调用者数: 27

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00bf8ed0(float param_1)

{
  char cVar1;
  int *piVar2;
  int iVar3;
  int *piStack_120;
  undefined1 auStack_104 [40];
  undefined1 auStack_dc [40];
  undefined1 auStack_b4 [40];
  undefined1 auStack_8c [104];
  int *piStack_24;
  int iStack_20;
  int *piStack_1c;
  int *piStack_18;
  int iStack_14;
  void *pvStack_10;
  undefined *puStack_c;
  undefined4 uStack_8;
  
  uStack_8 = 0xffffffff;
  puStack_c = &UNK_016283e6;
  pvStack_10 = ExceptionList;
  ExceptionList = &pvStack_10;
  thunk_FUN_00bea2b0(param_1,_DAT_018bcc60 ^ (uint)&stack0xfffffffc);
  if (*(char *)(iStack_14 + 0xb0) != '\0') {
    *(undefined1 *)(iStack_14 + 0xb0) = 0;
    switch(*(undefined4 *)(iStack_14 + 0xdc)) {
    case 3:
    case 4:
    case 0xf:
      *(undefined4 *)(iStack_14 + 0xe8) = 0;
      piStack_18 = (int *)0x0;
      if (*(int *)(iStack_14 + 0xdc) != 3) {
        if (*(int *)(iStack_14 + 0xdc) == 4) {
          iVar3 = thunk_FUN_00c8c9a0(0xc0);
          uStack_8 = 0;
          if (iVar3 == 0) {
            piStack_120 = (int *)0x0;
          }
          else {
            piStack_120 = (int *)thunk_FUN_00bfde00();
          }
          uStack_8 = 0xffffffff;
          piStack_18 = piStack_120;
        }
        else if (*(int *)(iStack_14 + 0xdc) == 0xf) {
          iVar3 = thunk_FUN_00c8c9a0(0xbc);
          uStack_8 = 1;
          if (iVar3 == 0) {
            piStack_120 = (int *)0x0;
          }
          else {
            piStack_120 = (int *)thunk_FUN_00b03570();
          }
          uStack_8 = 0xffffffff;
          piStack_18 = piStack_120;
        }
      }
      (**(code **)(*piStack_18 + 4))();
      thunk_FUN_00be76a0(piStack_18,0);
      break;
    default:
      thunk_FUN_00bf82e0();
      break;
    case 0xe:
    case 0x10:
      thunk_FUN_00bf9a20();
      iVar3 = thunk_FUN_00c8c9a0(0xe4);
      uStack_8 = 2;
      if (iVar3 == 0) {
        piStack_120 = (int *)0x0;
      }
      else {
        piStack_120 = (int *)thunk_FUN_00bf23b0(0);
      }
      uStack_8 = 0xffffffff;
      piStack_1c = piStack_120;
      (**(code **)(*piStack_120 + 4))();
      thunk_FUN_00be76a0(piStack_1c,0);
    }
  }
  switch(*(undefined4 *)(iStack_14 + 0xdc)) {
  case 0:
    _DAT_0197f448 = 0;
    if (((float)_DAT_016ec7e0 < *(float *)(iStack_14 + 0xe4)) ||
       ((float)_DAT_01715b88 < _DAT_0197f45c)) {
      *(float *)(iStack_14 + 0xe4) = *(float *)(iStack_14 + 0xe4) - param_1;
      _DAT_0197f458 = ((float)_DAT_016fc540 - _DAT_0197f458) * (float)_DAT_01715b78 + _DAT_0197f458;
      if (_DAT_0197f458 < (float)_DAT_016ec7e0) {
        _DAT_0197f458 = 0.0;
      }
    }
    else {
      _DAT_0197f448 = 0;
      *(float *)(iStack_14 + 0xe8) = *(float *)(iStack_14 + 0xe8) + param_1;
      if ((float)_DAT_01715b68 <= _DAT_0197f458) {
        _DAT_0197f458 =
             ((float)_DAT_016fc540 - _DAT_0197f458) * (float)_DAT_01715b78 + _DAT_0197f458;
      }
      else {
        _DAT_0197f458 = _DAT_016ee204;
      }
    }
    if (_DAT_0197f458 < (float)_DAT_016ec7e0) {
      *(undefined4 *)(iStack_14 + 0xdc) = 1;
      _DAT_0197f458 = _DAT_016ee204;
    }
    break;
  case 1:
    if (*(char *)(iStack_14 + 0xc6) != '\0') {
      if (*(char *)(iStack_14 + 0xc5) == '\0') {
        *(undefined1 *)(iStack_14 + 0xc5) = 1;
        thunk_FUN_00f08d80(1);
        thunk_FUN_00f0beb0();
        *(undefined4 *)(iStack_14 + 200) = _DAT_016f8bc4;
        *(undefined1 *)(iStack_14 + 0xc6) = 0;
      }
      else {
        *(float *)(iStack_14 + 200) = *(float *)(iStack_14 + 200) - (float)_DAT_01715b58;
        if (*(float *)(iStack_14 + 200) < (float)_DAT_016ec7e0) {
          *(undefined1 *)(iStack_14 + 0xc5) = 0;
        }
      }
    }
    thunk_FUN_00c9f550(&UNK_017159e8);
    uStack_8 = 3;
    iStack_20 = thunk_FUN_00cabb70(auStack_104);
    uStack_8 = 0xffffffff;
    thunk_FUN_00c9f6a0();
    if (iStack_20 != 0) {
      cVar1 = thunk_FUN_00bf8c00();
      if ((cVar1 == '\0') || (cVar1 = thunk_FUN_00ab2250(), cVar1 != '\0')) {
        cVar1 = thunk_FUN_00bf8c00();
        if ((cVar1 == '\0') && (cVar1 = thunk_FUN_00ab2250(), cVar1 != '\0')) {
          thunk_FUN_00a7ae50(0);
        }
      }
      else {
        thunk_FUN_00a7ae50(1);
      }
    }
    if (_DAT_0197faac != (undefined4 *)0x0) {
      thunk_FUN_00c9f550(&UNK_01715b40);
      uStack_8 = 4;
      thunk_FUN_00dfba20(auStack_dc);
      piStack_24 = (int *)thunk_FUN_00e0b900();
      uStack_8 = 0xffffffff;
      thunk_FUN_00c9f6a0();
      if ((piStack_24 != (int *)0x0) && (cVar1 = thunk_FUN_00ab2250(), cVar1 == '\0')) {
        thunk_FUN_00a7ae50(1);
        iVar3 = (**(code **)*_DAT_0197faac)();
        if (iVar3 == 0) {
          thunk_FUN_00c9f550(&UNK_016ef468);
          uStack_8 = 6;
          (**(code **)(*piStack_24 + 0x34))(auStack_8c,1);
          uStack_8 = 0xffffffff;
          thunk_FUN_00c9f6a0();
        }
        else {
          thunk_FUN_00c9f550(&UNK_016ef468);
          uStack_8 = 5;
          (**(code **)(*piStack_24 + 0x34))(auStack_b4,1);
          uStack_8 = 0xffffffff;
          thunk_FUN_00c9f6a0();
        }
      }
    }
    break;
  default:
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00c93660(&UNK_016ec4a8);
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00a6fd50(&UNK_01715b18);
    thunk_FUN_00c93610(&UNK_016ec474);
    thunk_FUN_00c93660(&UNK_016ec434);
    thunk_FUN_00c93660(&UNK_01715ac0);
    thunk_FUN_00c94580(0xffff);
    thunk_FUN_00c93660(&UNK_016ec434);
    if (DAT_0197d0d8 == '\0') {
      iVar3 = thunk_FUN_00c93390();
      if (iVar3 == 0) {
        DebugBreak();
      }
      else if (iVar3 == 2) {
        DAT_0197d0d8 = '\x01';
      }
    }
    break;
  case 4:
  case 0xe:
  case 0xf:
  case 0x12:
    *(undefined1 *)(iStack_14 + 0xc6) = 0;
    break;
  case 8:
    thunk_FUN_00bf82e0();
    *(undefined4 *)(iStack_14 + 0xdc) = 0;
    break;
  case 0x16:
    thunk_FUN_00bf9830();
    iVar3 = thunk_FUN_00bf9850();
    if (iVar3 == 2) {
      *(undefined4 *)(iStack_14 + 0xdc) = 0x17;
    }
    else if (iVar3 == 3) {
      *(undefined4 *)(iStack_14 + 0xdc) = *(undefined4 *)(iStack_14 + 0xe0);
    }
    break;
  case 0x17:
    thunk_FUN_00c358d0(0);
    cVar1 = thunk_FUN_00ae5ba0();
    if (cVar1 != '\0') {
      piVar2 = (int *)thunk_FUN_00bf9830();
      (**(code **)(*piVar2 + 0x10))();
    }
  }
  ExceptionList = pvStack_10;
  return;
}


```

## FUN_00baaea0 — 00baaea0

- 函数名: FUN_00baaea0
- 函数体: 141 字节
- 调用者数: 0 / 被调用者数: 2

```c

void __fastcall FUN_00baaea0(int param_1)

{
  thunk_FUN_00a71290(&UNK_01710ac8,param_1 + 0x2c);
  thunk_FUN_00a71290(&UNK_01710ab4,param_1 + 0x24);
  thunk_FUN_00a71290(&UNK_01710aa8,param_1 + 0x28);
  thunk_FUN_00a71290(&UNK_01710a94,param_1 + 0x38);
  thunk_FUN_00a71290(&UNK_01710a84,param_1 + 0x30);
  thunk_FUN_00c973d0(&UNK_01710a74,param_1 + 0x34);
  return;
}


```

## FUN_00c6e770 — 00c6e770

- 函数名: FUN_00c6e770
- 函数体: 3650 字节
- 调用者数: 0 / 被调用者数: 41

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00c6e770(undefined4 param_1,int param_2)

{
  uint uVar1;
  char cVar2;
  int iVar3;
  undefined4 uVar4;
  undefined4 *puVar5;
  uint uVar6;
  uint *puStack_124;
  undefined4 uStack_f4;
  undefined1 auStack_f0 [12];
  undefined1 auStack_e4 [12];
  undefined4 *puStack_d8;
  undefined4 *puStack_d4;
  undefined1 auStack_90 [12];
  undefined1 auStack_84 [12];
  int iStack_78;
  int *piStack_74;
  undefined1 auStack_70 [12];
  undefined1 auStack_64 [12];
  int iStack_58;
  char *pcStack_54;
  undefined4 uStack_50;
  int iStack_4c;
  int iStack_48;
  int iStack_44;
  int iStack_40;
  char *pcStack_3c;
  int iStack_38;
  int iStack_34;
  int iStack_30;
  int *piStack_2c;
  undefined4 uStack_28;
  int iStack_24;
  int iStack_20;
  char cStack_19;
  undefined4 *puStack_18;
  int iStack_14;
  void *pvStack_10;
  undefined *puStack_c;
  undefined4 uStack_8;
  
  uStack_8 = 0xffffffff;
  puStack_c = &UNK_01634119;
  pvStack_10 = ExceptionList;
  ExceptionList = &pvStack_10;
  iVar3 = thunk_FUN_00c8c9a0(0x48,_DAT_018bcc60 ^ (uint)&stack0xfffffffc);
  uStack_8 = 0;
  if (iVar3 == 0) {
    puStack_124 = (undefined4 *)0x0;
  }
  else {
    puStack_124 = (uint *)thunk_FUN_00c98ca0(param_1);
  }
  uStack_8 = 0xffffffff;
  puStack_18 = puStack_124;
  if (puStack_124 != (undefined4 *)0x0) {
    cStack_19 = thunk_FUN_00c98e40(0);
    if (cStack_19 == '\0') {
      thunk_FUN_00c7fab0(&UNK_017203e8,&param_2);
      thunk_FUN_00c93610(&UNK_016ec474);
    }
    else {
      iStack_20 = thunk_FUN_00a6ef60(&UNK_01720604);
      iStack_20 = thunk_FUN_00b80560();
      thunk_FUN_00c6bbc0();
      iStack_24 = 0;
      while (iStack_20 != 0) {
        uStack_28 = thunk_FUN_00b80500();
        iVar3 = thunk_FUN_015523b0(uStack_28,&UNK_017205f8);
        if (iVar3 == 0) {
          iVar3 = thunk_FUN_00c8c9a0(0xcc);
          uStack_8 = 1;
          if (iVar3 == 0) {
            puStack_124 = (uint *)0x0;
          }
          else {
            puStack_124 = (uint *)thunk_FUN_00c6f950(iStack_14 + 0xc0 + param_2 * 0x40);
          }
          uStack_8 = 0xffffffff;
          piStack_2c = (int *)puStack_124;
          puStack_124[0x2c] = iStack_24;
          iStack_24 = iStack_24 + 1;
          iStack_30 = iStack_20;
          iStack_38 = -1;
          thunk_FUN_00c973d0(&UNK_017205f0,&iStack_38);
          if (-1 < iStack_38) {
            *piStack_2c = iStack_38;
          }
          thunk_FUN_00c973d0(&UNK_017205d4,piStack_2c + 0x2e);
          pcStack_3c = (char *)thunk_FUN_00c971c0(&UNK_017205cc);
          if ((pcStack_3c != (char *)0x0) && (*pcStack_3c != '\0')) {
            iVar3 = thunk_FUN_015523b0(pcStack_3c,&UNK_017205c0);
            if (iVar3 == 0) {
              piStack_2c[1] = -2;
            }
            else {
              iVar3 = thunk_FUN_015592c0(pcStack_3c);
              if ((-1 < iVar3) && (*piStack_2c <= iVar3)) {
                piStack_2c[1] = iVar3;
              }
            }
          }
          iStack_38 = -1;
          thunk_FUN_00c973d0(&UNK_01713538,&iStack_38);
          if (-1 < iStack_38) {
            piStack_2c[0x1f] = iStack_38;
          }
          thunk_FUN_00a71290(&UNK_01710a94,piStack_2c + 0x2b);
          thunk_FUN_00a71290(&UNK_016eeb08,piStack_2c + 0x21);
          thunk_FUN_00c973d0(&UNK_0170cdc8,piStack_2c + 0x23);
          thunk_FUN_00c973d0(&UNK_017205b4,piStack_2c + 0x23);
          thunk_FUN_00c973d0(&UNK_017205a8,piStack_2c + 0x24);
          piStack_2c[0x31] = 0;
          thunk_FUN_00c973d0(&UNK_01720598,piStack_2c + 0x31);
          if (piStack_2c[0x23] < 0) {
            piStack_2c[0x23] = piStack_2c[0x24];
          }
          if (piStack_2c[0x24] < 0) {
            piStack_2c[0x24] = piStack_2c[0x23];
          }
          pcStack_3c = (char *)thunk_FUN_00c971c0(&UNK_01720588);
          if (pcStack_3c != (char *)0x0) {
            iVar3 = thunk_FUN_00c8c9a0(8);
            uStack_8 = 2;
            if (iVar3 == 0) {
              puStack_124 = (uint *)0x0;
            }
            else {
              puStack_124 = (uint *)thunk_FUN_00c79350(pcStack_3c);
            }
            uStack_8 = 0xffffffff;
            piStack_2c[0x32] = (int)puStack_124;
          }
          iStack_34 = thunk_FUN_00a6ef60(&UNK_01720578);
          if (iStack_34 != 0) {
            iVar3 = thunk_FUN_00c8c9a0(8);
            uStack_8 = 3;
            if (iVar3 == 0) {
              puStack_124 = (uint *)0x0;
            }
            else {
              puStack_124 = (uint *)thunk_FUN_00c6bb00();
            }
            uStack_8 = 0xffffffff;
            piStack_2c[0x2d] = (int)puStack_124;
            thunk_FUN_00c6c0b0(piStack_2c[0x2d],iStack_34);
          }
          iStack_34 = thunk_FUN_00a6ef60(&UNK_0170ffc4);
          iStack_40 = thunk_FUN_00a6dff0(&UNK_0170ffc4);
          while (iStack_34 != 0) {
            uVar4 = thunk_FUN_00b80500();
            iVar3 = thunk_FUN_00a6dff0(uVar4);
            if (iVar3 == iStack_40) {
              piStack_2c[0x13] = piStack_2c[0x13] + 1;
            }
            iStack_34 = thunk_FUN_00b80530();
          }
          uVar1 = piStack_2c[0x13];
          uVar6 = -(uint)((int)((ulonglong)uVar1 * 0x98 >> 0x20) != 0) |
                  (uint)((ulonglong)uVar1 * 0x98);
          puStack_124 = (uint *)thunk_FUN_00c8cad0(-(uint)(0xfffffffb < uVar6) | uVar6 + 4);
          uStack_8 = 4;
          if (puStack_124 == (uint *)0x0) {
            puStack_124 = (uint *)0x0;
          }
          else {
            *puStack_124 = uVar1;
            thunk_FUN_01558ca0(puStack_124 + 1,0x98,uVar1,thunk_FUN_00ba5e10,thunk_FUN_00ba5bf0);
            puStack_124 = puStack_124 + 1;
          }
          uStack_8 = 0xffffffff;
          piStack_2c[0x12] = (int)puStack_124;
          iStack_34 = thunk_FUN_00a6ef60(&UNK_0170ffc4);
          pcStack_3c = (char *)0x0;
          iStack_44 = piStack_2c[0x12];
          while (iStack_34 != 0) {
            thunk_FUN_00c6ded0(iStack_34,iStack_44);
            iStack_34 = thunk_FUN_00a6ef30(&UNK_0170ffc4);
            iVar3 = thunk_FUN_01553d40();
            piStack_2c[0x2f] = iVar3 + piStack_2c[0x2f];
            iStack_44 = iStack_44 + 0x98;
          }
          iStack_34 = thunk_FUN_00a6ef60(&UNK_0172056c);
          if (iStack_34 != 0) {
            thunk_FUN_00a71290(&UNK_017101f8,piStack_2c + 0x14);
            thunk_FUN_00a71290(&UNK_01719e34,piStack_2c + 0x15);
            thunk_FUN_00a71290(&UNK_01720564,piStack_2c + 0x16);
          }
          iStack_34 = thunk_FUN_00a6ef60(&UNK_01720554);
          if (iStack_34 != 0) {
            thunk_FUN_00a71290(&UNK_0171a0f0,piStack_2c + 0x1a);
            thunk_FUN_00a71290(&UNK_01720548,piStack_2c + 0x1c);
            thunk_FUN_00a71290(&UNK_0172053c,piStack_2c + 0x17);
            if ((float)_DAT_016ec7e0 < (float)piStack_2c[0x1a]) {
              piStack_2c[0x18] = 0;
              piStack_2c[0x19] = 0;
            }
            thunk_FUN_00a71290(&UNK_01719e18,piStack_2c + 0x18);
            thunk_FUN_00a71290(&UNK_01719e34,piStack_2c + 0x19);
            iStack_48 = thunk_FUN_00c971c0(&UNK_01720528);
            if (iStack_48 != 0) {
              cVar2 = thunk_FUN_00b730a0(iStack_48,&UNK_016f2a74);
              *(char *)(piStack_2c + 0x1e) = '\x01' - (cVar2 != '\0');
            }
            iStack_48 = thunk_FUN_00c971c0(&UNK_01720510);
            if (iStack_48 != 0) {
              cVar2 = thunk_FUN_00b730a0(iStack_48,&UNK_016f2a74);
              *(char *)((int)piStack_2c + 0x79) = '\x01' - (cVar2 != '\0');
            }
          }
          iStack_34 = thunk_FUN_00a6ef60(&UNK_01720500);
          thunk_FUN_00c7a330();
          piStack_2c[0x2a] = 0;
          if (iStack_34 != 0) {
            pcStack_3c = (char *)thunk_FUN_00c971c0(&UNK_016fa1c8);
            thunk_FUN_00b733a0(pcStack_3c,piStack_2c + 0x25);
          }
          pcStack_3c = (char *)thunk_FUN_00c971c0(&UNK_017204f4);
          if (pcStack_3c == (char *)0x0) {
            thunk_FUN_01552460(piStack_2c + 2,&UNK_017204e4,piStack_2c[0x2c]);
          }
          else {
            thunk_FUN_01550c70(piStack_2c + 2,pcStack_3c);
          }
          thunk_FUN_00c6fd20(param_2,*(undefined4 *)(iStack_14 + 0xf8 + param_2 * 0x40),&piStack_2c)
          ;
          thunk_FUN_00c7ad30();
          for (iStack_4c = 1;
              (iStack_4c < 1 && (-1 < *(int *)(iStack_14 + param_2 * 0x40 + 0xf8 + iStack_4c * 4)));
              iStack_4c = iStack_4c + 2) {
            uStack_50 = thunk_FUN_00c78f80();
            thunk_FUN_00c6fd20(param_2,*(undefined4 *)
                                        (iStack_14 + param_2 * 0x40 + 0xf8 + iStack_4c * 4),
                               &uStack_50);
            thunk_FUN_00c7ad30();
          }
        }
        else {
          iVar3 = thunk_FUN_015523b0(uStack_28,&UNK_016eeb2c);
          if (iVar3 == 0) {
            thunk_FUN_00c6bbc0();
            thunk_FUN_00c973d0(&UNK_017204d4,iStack_14 + 0xc0 + param_2 * 0x40);
            thunk_FUN_00a71290(&UNK_017204bc,iStack_14 + 0xc4 + param_2 * 0x40);
            thunk_FUN_00a71290(&UNK_01710a94,iStack_14 + 200 + param_2 * 0x40);
            thunk_FUN_00a71290(&UNK_017101f8,iStack_14 + 0xcc + param_2 * 0x40);
            thunk_FUN_00a71290(&UNK_017204b4,iStack_14 + 0xd0 + param_2 * 0x40);
            thunk_FUN_00a71290(&UNK_017204a8,iStack_14 + 0xd4 + param_2 * 0x40);
            thunk_FUN_00a71290(&UNK_01720498,iStack_14 + 0xd8 + param_2 * 0x40);
            thunk_FUN_00a71290(&UNK_01720484,iStack_14 + 0xdc + param_2 * 0x40);
            thunk_FUN_00a71290(&UNK_01720478,iStack_14 + 0xe0 + param_2 * 0x40);
            thunk_FUN_00a71290(&UNK_01720468,iStack_14 + 0xe4 + param_2 * 0x40);
            thunk_FUN_00a71290(&UNK_01720454,iStack_14 + 0xe8 + param_2 * 0x40);
            thunk_FUN_00a71290(&UNK_0172053c,iStack_14 + 0xf0 + param_2 * 0x40);
            thunk_FUN_00c973d0(&UNK_017205d4,iStack_14 + 0xf4 + param_2 * 0x40);
            pcStack_54 = (char *)thunk_FUN_00c971c0(&UNK_01720528);
            if (((pcStack_54 == (char *)0x0) || (*pcStack_54 == '\0')) ||
               (iVar3 = thunk_FUN_015523b0(&UNK_016f2a74,pcStack_54), iVar3 != 0)) {
              puStack_124._0_1_ = 1;
            }
            else {
              puStack_124._0_1_ = 0;
            }
            *(undefined1 *)(iStack_14 + 0xec + param_2 * 0x40) = puStack_124._0_1_;
            uVar4 = thunk_FUN_00c971c0(&UNK_01720510,&UNK_016f2a74);
            cVar2 = thunk_FUN_00b730a0(uVar4);
            *(char *)(iStack_14 + 0xed + param_2 * 0x40) = '\x01' - (cVar2 != '\0');
            iVar3 = thunk_FUN_00c971c0(&UNK_01720448);
            if (iVar3 != 0) {
              uVar4 = thunk_FUN_00c971c0(&UNK_01720448,&UNK_01720444);
              iVar3 = thunk_FUN_015523b0(uVar4);
              if (iVar3 == 0) {
                *(undefined4 *)(iStack_14 + 0xf8 + param_2 * 0x40) = 1;
                *(undefined4 *)(iStack_14 + 0xfc + param_2 * 0x40) = 2;
                *(undefined4 *)(iStack_14 + 0x100 + param_2 * 0x40) = 0xffffffff;
              }
            }
            thunk_FUN_00a71290(&UNK_01720434,iStack_14 + 0x80 + param_2 * 4);
            thunk_FUN_00a71290(&UNK_01720424,iStack_14 + 0x88 + param_2 * 4);
            thunk_FUN_00a71290(&UNK_01720414,iStack_14 + 0x90 + param_2 * 4);
          }
          else {
            iVar3 = thunk_FUN_015523b0(uStack_28,&UNK_01720578);
            if (iVar3 == 0) {
              thunk_FUN_00c6c0b0(iStack_14 + 0x140 + param_2 * 8,iStack_20);
            }
          }
        }
        iStack_20 = thunk_FUN_00b80530();
      }
    }
    for (iStack_58 = 0; iStack_58 < 1; iStack_58 = iStack_58 + 1) {
      thunk_FUN_00c6fd20(param_2,iStack_58);
      uStack_f4 = thunk_FUN_00c7ac40();
      thunk_FUN_00c7fb20(&UNK_017203b8,&param_2,&uStack_f4,&iStack_58);
      thunk_FUN_00c93610(&UNK_016ec474);
      thunk_FUN_00c6fd20(param_2,iStack_58,auStack_64);
      thunk_FUN_00c7aba0();
      uStack_8 = 5;
      thunk_FUN_00c6fd20(param_2,iStack_58,auStack_70);
      thunk_FUN_00c7abf0();
      uStack_8._0_1_ = 6;
      while (cVar2 = thunk_FUN_00c7b850(auStack_70), cVar2 != '\0') {
        puVar5 = (undefined4 *)thunk_FUN_00c7b770();
        piStack_74 = (int *)*puVar5;
        if (piStack_74[1] == -1) {
          iStack_78 = 1000000;
          piStack_74[1] = -2;
          thunk_FUN_00c6fd20(param_2,iStack_58,auStack_84);
          thunk_FUN_00c7aba0();
          uStack_8._0_1_ = 7;
          thunk_FUN_00c6fd20(param_2,iStack_58,auStack_90);
          thunk_FUN_00c7abf0();
          uStack_8._0_1_ = 8;
          while (cVar2 = thunk_FUN_00c7b850(auStack_90), cVar2 != '\0') {
            puVar5 = (undefined4 *)thunk_FUN_00c7b770();
            if ((*piStack_74 < *(int *)*puVar5) &&
               (puVar5 = (undefined4 *)thunk_FUN_00c7b770(), *(int *)*puVar5 + -1 < iStack_78)) {
              puVar5 = (undefined4 *)thunk_FUN_00c7b770();
              iStack_78 = *(int *)*puVar5 + -1;
            }
            thunk_FUN_00c7b7a0(auStack_e4,0);
            thunk_FUN_00c6fd90();
          }
          if (iStack_78 < 1000000) {
            piStack_74[1] = iStack_78;
          }
          uStack_8._0_1_ = 7;
          thunk_FUN_00c6fd90();
          uStack_8._0_1_ = 6;
          thunk_FUN_00c6fd90();
        }
        thunk_FUN_00c7b7a0(auStack_f0,0);
        thunk_FUN_00c6fd90();
      }
      uStack_8 = CONCAT31(uStack_8._1_3_,5);
      thunk_FUN_00c6fd90();
      uStack_8 = 0xffffffff;
      thunk_FUN_00c6fd90();
    }
  }
  if (puStack_18 != (undefined4 *)0x0) {
    puStack_d4 = puStack_18;
    puStack_d8 = puStack_18;
    if (puStack_18 != (undefined4 *)0x0) {
      (**(code **)*puStack_18)(1);
    }
  }
  ExceptionList = pvStack_10;
  return;
}


```

## FUN_00a7df70 — 00a7df70

- 函数名: FUN_00a7df70
- 函数体: 1379 字节
- 调用者数: 0 / 被调用者数: 38

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00a7df70(void)

{
  char cVar1;
  int iVar2;
  uint uVar3;
  undefined4 uVar4;
  undefined4 uStack_118;
  undefined4 uStack_114;
  undefined *puStack_110;
  undefined *puStack_10c;
  undefined *puStack_108;
  undefined *puStack_104;
  undefined *puStack_100;
  undefined *puStack_fc;
  undefined *puStack_f8;
  undefined *puStack_f4;
  int iStack_f0;
  undefined4 uStack_ec;
  undefined4 uStack_e8;
  undefined *puStack_e4;
  undefined1 *puStack_e0;
  undefined4 uStack_dc;
  undefined *puStack_d8;
  uint uStack_d4;
  undefined1 auStack_b8 [40];
  undefined1 *puStack_90;
  char cStack_81;
  undefined1 auStack_80 [76];
  undefined1 auStack_34 [12];
  int iStack_28;
  int iStack_24;
  int iStack_20;
  int iStack_1c;
  char cStack_15;
  int iStack_14;
  void *pvStack_10;
  undefined *puStack_c;
  undefined4 uStack_8;
  
  uStack_8 = 0xffffffff;
  puStack_c = &UNK_01601686;
  pvStack_10 = ExceptionList;
  uStack_d4 = _DAT_018bcc60 ^ (uint)&stack0xfffffffc;
  ExceptionList = &pvStack_10;
  puStack_d8 = &UNK_016ef240;
  uStack_dc = 0xa7dfae;
  thunk_FUN_00c9f550();
  uStack_8 = 0;
  uStack_dc = 1;
  puStack_e0 = auStack_b8;
  puStack_e4 = (undefined *)0xa7dfd1;
  (**(code **)(**(int **)(iStack_14 + 4) + 0x34))();
  uStack_8 = 0xffffffff;
  puStack_e4 = (undefined *)0xa7dfe5;
  thunk_FUN_00c9f6a0();
  puStack_e4 = (undefined *)0xa7dfef;
  thunk_FUN_00a6ff30();
  puStack_e4 = (undefined *)0xa7dff9;
  iVar2 = thunk_FUN_00a6fe80();
  if (iVar2 == 0) {
    puStack_e4 = &UNK_016ec4b0;
    uStack_e8 = 0xa7e00c;
    thunk_FUN_00c93660();
    puStack_e4 = &UNK_016ec78c;
    uStack_e8 = 0xa7e019;
    thunk_FUN_00c93660();
    puStack_e4 = &UNK_016ec4b0;
    uStack_e8 = 0xa7e026;
    thunk_FUN_00c93660();
    puStack_e4 = &UNK_016ef208;
    uStack_e8 = 0xa7e033;
    thunk_FUN_00a6fd50();
    puStack_e4 = &UNK_016ec474;
    uStack_e8 = 0xa7e040;
    thunk_FUN_00c93610();
    puStack_e4 = &UNK_016ec434;
    uStack_e8 = 0xa7e04d;
    thunk_FUN_00c93660();
    puStack_e4 = &UNK_016ef1a0;
    uStack_e8 = 0xa7e05a;
    thunk_FUN_00c93660();
    puStack_e4 = (undefined *)0xffff;
    uStack_e8 = 0xa7e067;
    thunk_FUN_00c94580();
    puStack_e4 = &UNK_016ec434;
    uStack_e8 = 0xa7e074;
    thunk_FUN_00c93660();
    if (DAT_018bec9a == '\0') {
      puStack_e4 = (undefined *)0xa7e089;
      iVar2 = thunk_FUN_00c93390();
      if (iVar2 == 0) {
        puStack_e4 = (undefined *)0xa7e0a9;
        DebugBreak();
      }
      else if (iVar2 == 2) {
        DAT_018bec9a = '\x01';
      }
    }
  }
  puStack_e4 = (undefined *)0xa7e0be;
  iVar2 = thunk_FUN_00a6fe80();
  if (iVar2 != 0) {
    puStack_e4 = (undefined *)0xa7e0d0;
    puStack_e4 = (undefined *)thunk_FUN_00a6fe80();
    uStack_e8 = 0xa7e0dc;
    thunk_FUN_00a7e680();
    uStack_e8 = 0xa7e0e6;
    uStack_e8 = thunk_FUN_00a6fe80();
    uStack_ec = 0xa7e0f2;
    thunk_FUN_00a7e6e0();
    uStack_ec = 0x18bed48;
    iStack_f0 = 0xa7e102;
    thunk_FUN_00aa83a0();
    iStack_f0 = 0xa7e10a;
    cStack_15 = thunk_FUN_00a7ba60();
    iStack_f0 = 0xa7e117;
    iVar2 = thunk_FUN_00a6fe80();
    if ((iVar2 == 1) || (cStack_15 != '\0')) {
      if (cStack_15 == '\0') {
        iStack_f0 = 0xa7e13f;
        iStack_f0 = thunk_FUN_00aa6db0();
        puStack_f4 = (undefined *)0xa7e14b;
        thunk_FUN_00aaa1d0();
        puStack_f4 = (undefined *)0x1;
        puStack_f8 = (undefined *)0xa7e158;
        uVar3 = thunk_FUN_00aa6f00();
        if (99 < uVar3) {
          puStack_f8 = (undefined *)0x1;
          puStack_fc = (undefined *)0x1;
          puStack_100 = (undefined *)0x1;
          puStack_104 = &UNK_016ef184;
          puStack_108 = (undefined *)0xa7e16d;
          puStack_104 = (undefined *)thunk_FUN_00a6dff0();
          puStack_108 = &UNK_016ef184;
          puStack_10c = (undefined *)0xa7e181;
          thunk_FUN_00c37ff0();
        }
        puStack_f8 = &UNK_016ef178;
        puStack_fc = (undefined *)0xa7e191;
        iVar2 = thunk_FUN_00c38590();
        puStack_fc = &UNK_016ef164;
        puStack_100 = (undefined *)0xa7e1a3;
        iStack_1c = thunk_FUN_00c38590();
        iStack_1c = iVar2 - iStack_1c;
        if (iStack_1c == 0) {
          puStack_100 = (undefined *)0x1;
          puStack_104 = (undefined *)0x1;
          puStack_108 = (undefined *)0x1;
          puStack_10c = &UNK_016ef140;
          puStack_110 = (undefined *)0xa7e1ba;
          puStack_10c = (undefined *)thunk_FUN_00a6dff0();
          puStack_110 = &UNK_016ef140;
          uStack_114 = 0xa7e1ce;
          thunk_FUN_00c37ff0();
        }
        else {
          puStack_100 = (undefined *)0x1;
          puStack_104 = (undefined *)0x1;
          puStack_108 = (undefined *)0x0;
          puStack_10c = &UNK_016ef140;
          puStack_110 = (undefined *)0xa7e1e6;
          thunk_FUN_00c37f80();
        }
        uStack_114 = 1;
        uStack_118 = 0;
        uVar4 = thunk_FUN_00a7e750();
        uVar4 = thunk_FUN_00a6dff0(&UNK_016ef128,uVar4);
        thunk_FUN_00c37ff0(&UNK_016ef128,uVar4);
      }
      else {
        iStack_f0 = 0xa7e221;
        cVar1 = thunk_FUN_00a7ba60();
        if (cVar1 == '\0') {
          iStack_f0 = 0xa7e24c;
          iVar2 = thunk_FUN_00aa6db0();
          iStack_f0 = 0xa7e259;
          iStack_f0 = thunk_FUN_00aaa2b0();
          iStack_f0 = iVar2 + iStack_f0;
          puStack_f4 = (undefined *)0xa7e267;
          thunk_FUN_00aaa1d0();
        }
        else {
          iStack_f0 = 0xa7e233;
          iStack_f0 = thunk_FUN_00aaa2b0();
          puStack_f4 = (undefined *)0xa7e23f;
          thunk_FUN_00aaa1d0();
        }
        puStack_f4 = (undefined *)0x1;
        puStack_f8 = (undefined *)0x0;
        puStack_fc = (undefined *)0xa7e276;
        puStack_fc = (undefined *)thunk_FUN_00aaa440();
        puStack_100 = &UNK_016ef110;
        puStack_104 = (undefined *)0xa7e281;
        puStack_100 = (undefined *)thunk_FUN_00a6dff0();
        puStack_104 = &UNK_016ef110;
        puStack_108 = (undefined *)0xa7e295;
        thunk_FUN_00c37ff0();
        puStack_108 = (undefined *)0xa7e2a0;
        iVar2 = thunk_FUN_00a7e720();
        if (iVar2 == 1) {
          uVar4 = thunk_FUN_00a6dff0(&UNK_016ef0f4,1,0,1);
          thunk_FUN_00c37ff0(&UNK_016ef0f4,uVar4);
        }
      }
      cVar1 = thunk_FUN_00a7e660();
      if (cVar1 != '\0') {
        uVar4 = thunk_FUN_00a6dff0(&UNK_016ee45c,1,1,1);
        thunk_FUN_00c37ff0(&UNK_016ee45c,uVar4);
        uVar4 = thunk_FUN_00a6dff0(&UNK_016ef0d4,1,1,1);
        thunk_FUN_00c37ff0(&UNK_016ef0d4,uVar4);
      }
    }
    else {
      iStack_f0 = 0xa7e333;
      thunk_FUN_00aaa2e0();
      iStack_f0 = 0;
      puStack_f4 = &UNK_00a38ee2;
      puStack_f8 = (undefined *)0xa7e349;
      uVar4 = thunk_FUN_00a83d00();
      uStack_8 = 1;
      puStack_90 = (undefined1 *)&uStack_118;
      thunk_FUN_00a83c40(uVar4);
      thunk_FUN_00c49730(&UNK_016ef0cc,0x3f800000,0x3f800000);
      uStack_8 = 0xffffffff;
      thunk_FUN_00a7e630();
      thunk_FUN_00c37f80(&UNK_016ef0ac,0,1,1);
      thunk_FUN_00c37f80(&UNK_016ef140,0,1,1);
    }
    iStack_20 = _DAT_0197f494 + 0x150;
    iStack_24 = thunk_FUN_00a834b0(*(int *)(iStack_14 + 100) + 0x40);
    *(int *)(iStack_24 + 8) = *(int *)(iStack_24 + 8) + 1;
    iStack_28 = 0;
    thunk_FUN_00a83700(auStack_34);
    uStack_8 = 2;
    while( true ) {
      uVar4 = thunk_FUN_00a83750(auStack_80);
      uStack_8._0_1_ = 3;
      cStack_81 = thunk_FUN_00a84f70(uVar4);
      uStack_8 = CONCAT31(uStack_8._1_3_,2);
      thunk_FUN_00a7d3f0();
      if (cStack_81 == '\0') break;
      iVar2 = thunk_FUN_00a84f10();
      iStack_28 = (uint)(0 < *(int *)(iVar2 + 0xc)) + iStack_28;
      thunk_FUN_00a84f40();
    }
    uStack_8 = 0xffffffff;
    thunk_FUN_00a7d3f0();
    thunk_FUN_00c37f80(&UNK_016ef088,iStack_28,1,1);
    thunk_FUN_00a7bda0(cStack_15);
  }
  ExceptionList = pvStack_10;
  return;
}


```

## FUN_00c622c0 — 00c622c0

- 函数名: FUN_00c622c0
- 函数体: 2971 字节
- 调用者数: 0 / 被调用者数: 4

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
  (**(code **)*puStack_c)(&UNK_01715df4);
  (**(code **)*puStack_c)(&UNK_01715df4);
  (**(code **)*puStack_c)(&UNK_01702004);
  (**(code **)*puStack_c)(&UNK_01701dac);
  (**(code **)*puStack_c)(&UNK_01701db8);
  (**(code **)*puStack_c)(&UNK_0171e170);
  (**(code **)*puStack_c)(&UNK_0171e160);
  (**(code **)*puStack_c)(&UNK_0171e150);
  (**(code **)*puStack_c)(&UNK_01701e5c);
  (**(code **)*puStack_c)(&UNK_0171e144);
  (**(code **)*puStack_c)(&UNK_0171e13c);
  (**(code **)*puStack_c)(&UNK_0171e130);
  (**(code **)*puStack_c)(&UNK_016f7b40);
  (**(code **)*puStack_c)(&UNK_01714188);
  (**(code **)*puStack_c)(&UNK_01714170);
  (**(code **)*puStack_c)(&UNK_017141b4);
  (**(code **)*puStack_c)(&UNK_017141a0);
  (**(code **)*puStack_c)(&UNK_0171e128);
  (**(code **)*puStack_c)(&UNK_017129fc);
  (**(code **)*puStack_c)(&UNK_017130d0);
  (**(code **)*puStack_c)(&UNK_017072c4);
  (**(code **)*puStack_c)(&UNK_016f84d0);
  (**(code **)*puStack_c)(&UNK_016f87b4);
  (**(code **)*puStack_c)(&UNK_017072e4);
  (**(code **)*puStack_c)(&UNK_017072d4);
  (**(code **)*puStack_c)(&UNK_0171e120);
  (**(code **)*puStack_c)(&UNK_0171e118);
  (**(code **)*puStack_c)(&UNK_0171e110);
  (**(code **)*puStack_c)(&UNK_0171e108);
  (**(code **)*puStack_c)(&UNK_0171e100);
  (**(code **)*puStack_c)(&UNK_0171e0f0);
  (**(code **)*puStack_c)(&UNK_0171e0e0);
  (**(code **)*puStack_c)(&UNK_0171e0cc);
  (**(code **)*puStack_c)(&UNK_0171e0bc);
  (**(code **)*puStack_c)(&UNK_0171e0b0);
  (**(code **)*puStack_c)(&UNK_0171e0a4);
  (**(code **)*puStack_c)(&UNK_01715de8);
  (**(code **)*puStack_c)(&UNK_0171e094);
  (**(code **)*puStack_c)(&UNK_0171e088);
  (**(code **)*puStack_c)(&UNK_0171e07c);
  (**(code **)*puStack_c)(&UNK_0171e070);
  (**(code **)*puStack_c)(&UNK_0171e064);
  (**(code **)*puStack_c)(&UNK_0171e058);
  (**(code **)*puStack_c)(&UNK_0171e04c);
  (**(code **)*puStack_c)(&UNK_0171e040);
  (**(code **)*puStack_c)(&UNK_0171e034);
  (**(code **)*puStack_c)(&UNK_0171e024);
  (**(code **)*puStack_c)(&UNK_0171e014);
  (**(code **)*puStack_c)(&UNK_0171e004);
  (**(code **)*puStack_c)(&UNK_0171dff4);
  (**(code **)*puStack_c)(&UNK_0171dfe4);
  (**(code **)*puStack_c)(&UNK_0171dfd4);
  (**(code **)*puStack_c)(&UNK_0171dfc4);
  (**(code **)*puStack_c)(&UNK_0171dfb4);
  (**(code **)*puStack_c)(&UNK_0171dfa4);
  (**(code **)*puStack_c)(&UNK_0171df94);
  (**(code **)*puStack_c)(&UNK_0171df84);
  (**(code **)*puStack_c)(&UNK_0171df74);
  (**(code **)*puStack_c)(&UNK_0171df64);
  (**(code **)*puStack_c)(&UNK_0171df54);
  (**(code **)*puStack_c)(&UNK_0171df44);
  (**(code **)*puStack_c)(&UNK_0171df34);
  (**(code **)*puStack_c)(&UNK_0171df24);
  (**(code **)*puStack_c)(&UNK_0171df14);
  (**(code **)*puStack_c)(&UNK_0171df04);
  (**(code **)*puStack_c)(&UNK_0171def4);
  (**(code **)*puStack_c)(&UNK_0171dee0);
  (**(code **)*puStack_c)(&UNK_0171decc);
  (**(code **)*puStack_c)(&UNK_0171deb8);
  (**(code **)*puStack_c)(&UNK_0171deac);
  (**(code **)*puStack_c)(&UNK_0171dea0);
  (**(code **)*puStack_c)(&UNK_0171de94);
  for (iStack_90 = 1; iStack_90 < 8; iStack_90 = iStack_90 + 1) {
    thunk_FUN_01552460(auStack_8c,&UNK_0171de7c,&UNK_0171de84,iStack_90);
    (**(code **)*puStack_c)(auStack_8c);
  }
  for (iStack_94 = 1; iStack_94 < 4; iStack_94 = iStack_94 + 1) {
    thunk_FUN_01552460(auStack_8c,&UNK_0171de7c,&UNK_0171de68,iStack_94);
    (**(code **)*puStack_c)(auStack_8c);
  }
  for (iStack_98 = 1; iStack_98 < 9; iStack_98 = iStack_98 + 1) {
    thunk_FUN_00c916e0(auStack_8c,0x80,&UNK_0171de7c,&UNK_0171de60,iStack_98);
    (**(code **)*puStack_c)(auStack_8c);
  }
  thunk_FUN_01550950();
  return;
}


```

