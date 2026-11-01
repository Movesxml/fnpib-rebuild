# 完整反编译导出（无截断）

- 程序: FruitNinjaPIB.exe

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

