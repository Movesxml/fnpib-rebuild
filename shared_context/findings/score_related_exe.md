# 完整反编译导出（无截断）

- 程序: FruitNinjaPIB.exe

## FUN_00b853d0 — 00b853d0

- 函数名: FUN_00b853d0
- 函数体: 528 字节
- 调用者数: 0 / 被调用者数: 19

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00b853d0(void)

{
  char cVar1;
  int iVar2;
  int aiStack_d0 [3];
  undefined4 *puStack_c4;
  undefined4 uStack_c0;
  undefined1 *puStack_bc;
  undefined1 *puStack_b8;
  undefined4 *puStack_b4;
  undefined *puStack_b0;
  undefined *puStack_ac;
  undefined4 *puStack_a8;
  undefined *puStack_a4;
  uint uStack_a0;
  undefined1 auStack_84 [12];
  undefined1 *puStack_78;
  int iStack_34;
  undefined4 uStack_30;
  undefined1 auStack_2c [12];
  undefined4 uStack_20;
  undefined4 uStack_1c;
  int iStack_18;
  void *pvStack_10;
  undefined *puStack_c;
  int iStack_8;
  
  iStack_8 = 0xffffffff;
  puStack_c = &UNK_0161c510;
  pvStack_10 = ExceptionList;
  uStack_a0 = _DAT_018bcc60 ^ (uint)&stack0xfffffffc;
  ExceptionList = &pvStack_10;
  puStack_a4 = &UNK_0170cfa4;
  puStack_a8 = (undefined4 *)0xb8540b;
  iStack_18 = thunk_FUN_00a6ef60();
  do {
    if (iStack_18 == 0) {
      ExceptionList = pvStack_10;
      return;
    }
    uStack_1c = 0;
    puStack_a8 = &uStack_1c;
    puStack_ac = &UNK_016ec7d0;
    puStack_b0 = (undefined *)0xb85440;
    thunk_FUN_00a71290();
    puStack_b0 = &UNK_016ec4a0;
    puStack_b4 = (undefined4 *)0xb8544d;
    puStack_b4 = (undefined4 *)thunk_FUN_00c971c0();
    puStack_b8 = (undefined1 *)0xb85453;
    uStack_20 = thunk_FUN_00a6dff0();
    puStack_b4 = &uStack_20;
    puStack_b8 = auStack_2c;
    puStack_bc = (undefined1 *)0xb85469;
    thunk_FUN_00b876c0();
    iStack_8 = 0;
    puStack_bc = auStack_84;
    uStack_c0 = 0xb8547c;
    uStack_c0 = thunk_FUN_00b86bd0();
    iStack_8._0_1_ = 1;
    puStack_c4 = (undefined4 *)0xb854a1;
    cVar1 = thunk_FUN_00b89d50();
    iStack_8 = (uint)iStack_8._1_3_ << 8;
    puStack_c4 = (undefined4 *)0xb854b3;
    thunk_FUN_00b82280();
    if (cVar1 == '\0') {
LAB_00b855b8:
      iStack_8 = 0xffffffff;
      puStack_c4 = (undefined4 *)0xb855c7;
      thunk_FUN_00b82280();
    }
    else {
      puStack_c4 = (undefined4 *)0xb854ca;
      iVar2 = thunk_FUN_00b89cc0();
      uStack_30 = *(undefined4 *)(iVar2 + 4);
      puStack_c4 = (undefined4 *)0xb854d8;
      cVar1 = thunk_FUN_00b82ba0();
      if (cVar1 == '\0') {
        puStack_c4 = (undefined4 *)0xb854e7;
        cVar1 = thunk_FUN_00b7ec80();
        if (cVar1 == '\0') {
          puStack_c4 = &uStack_1c;
          puStack_78 = (undefined1 *)aiStack_d0;
          thunk_FUN_00a83390(0x18bebcc);
          uStack_30 = thunk_FUN_00b82570(uStack_20);
          thunk_FUN_00b856a0(uStack_1c);
          thunk_FUN_00a71290(&UNK_0170d0ec,&uStack_1c);
          thunk_FUN_00b80720(uStack_1c);
          thunk_FUN_00a71290(&UNK_0170d0e8,&uStack_1c);
          thunk_FUN_00b85670(uStack_1c);
          iStack_34 = -1;
          thunk_FUN_00c973d0(&UNK_0170d0d8,&iStack_34);
          if (-1 < iStack_34) {
            puStack_c4 = (undefined4 *)0x0;
            aiStack_d0[2] = 0;
            aiStack_d0[1] = 0;
            aiStack_d0[0] = iStack_34;
            thunk_FUN_00c592e0();
          }
          goto LAB_00b855b8;
        }
      }
      iStack_8 = 0xffffffff;
      puStack_c4 = (undefined4 *)0xb854fd;
      thunk_FUN_00b82280();
    }
    puStack_a4 = &UNK_0170cfa4;
    puStack_a8 = (undefined4 *)0xb8541d;
    iStack_18 = thunk_FUN_00a6ef30();
  } while( true );
}


```

## FUN_00c0edd0 — 00c0edd0

- 函数名: FUN_00c0edd0
- 函数体: 121 字节
- 调用者数: 0 / 被调用者数: 5

```c

void __fastcall FUN_00c0edd0(int param_1)

{
  if ((*(int *)(param_1 + 0x88) == 0) && (0 < *(int *)(param_1 + 0x8c))) {
    thunk_FUN_00b88dc0(&UNK_00a16c98);
    thunk_FUN_00c591c0();
    thunk_FUN_00c592e0();
    thunk_FUN_00b81cd0();
    thunk_FUN_00b85c50();
    *(undefined4 *)(param_1 + 0x8c) = 0;
  }
  return;
}


```

## FUN_00c0ee70 — 00c0ee70

- 函数名: FUN_00c0ee70
- 函数体: 2056 字节
- 调用者数: 0 / 被调用者数: 18

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_00c0ee70(int param_1,float param_2)

{
  double dVar1;
  float fVar2;
  undefined4 uVar3;
  float10 fVar4;
  float10 fVar5;
  undefined1 auStack_19c [12];
  undefined4 uStack_190;
  undefined4 uStack_18c;
  undefined4 uStack_188;
  undefined1 *puStack_184;
  undefined *puStack_180;
  undefined1 *puStack_17c;
  undefined4 *puStack_178;
  undefined4 uStack_174;
  undefined1 *puStack_170;
  undefined4 uStack_16c;
  undefined4 uStack_168;
  undefined4 uStack_164;
  undefined4 uStack_160;
  undefined1 *puStack_15c;
  float *pfStack_158;
  undefined1 *puStack_154;
  undefined4 uStack_150;
  undefined4 uStack_14c;
  undefined4 uStack_148;
  undefined4 uStack_144;
  undefined1 *puStack_140;
  float *pfStack_13c;
  uint uStack_138;
  undefined4 uStack_108;
  undefined2 uStack_104;
  undefined2 uStack_102;
  double dStack_100;
  undefined1 auStack_ec [12];
  undefined1 auStack_e0 [24];
  undefined1 auStack_c8 [12];
  undefined1 auStack_bc [24];
  undefined1 auStack_a4 [12];
  undefined1 auStack_98 [12];
  undefined4 uStack_8c;
  undefined1 auStack_88 [12];
  undefined1 auStack_7c [12];
  undefined1 *puStack_70;
  int iStack_24;
  float fStack_20;
  float fStack_1c;
  float fStack_18;
  int iStack_14;
  void *pvStack_10;
  undefined *puStack_c;
  int iStack_8;
  
  iStack_8 = 0xffffffff;
  puStack_c = &UNK_0162a60e;
  pvStack_10 = ExceptionList;
  uStack_138 = _DAT_018bcc60 ^ (uint)&stack0xfffffffc;
  ExceptionList = &pvStack_10;
  iStack_14 = param_1;
  if (*(int *)(param_1 + 0x88) == 0) {
    if (DAT_0197f442 == '\0') {
      fStack_18 = *(float *)(param_1 + 0x94);
      *(float *)(param_1 + 0x94) = *(float *)(param_1 + 0x94) + param_2;
      fVar2 = (*(float *)(param_1 + 0x94) - (float)_DAT_016ec7e0) / (float)_DAT_017132d8;
      if (fVar2 < (float)_DAT_016ec7e0 == (fVar2 == (float)_DAT_016ec7e0)) {
        if ((*(float *)(param_1 + 0x94) - (float)_DAT_016ec7e0) / (float)_DAT_017132d8 <
            (float)_DAT_016ef478) {
          dVar1 = (double)((*(float *)(param_1 + 0x94) - (float)_DAT_016ec7e0) /
                          (float)_DAT_017132d8);
          uStack_108 = SUB84(dVar1,0);
          uStack_104 = (undefined2)((ulonglong)dVar1 >> 0x20);
          uStack_102 = (undefined2)((ulonglong)dVar1 >> 0x30);
        }
        else {
          uStack_108 = 0;
          uStack_104 = 0;
          uStack_102 = 0x3ff0;
        }
        dStack_100 = (double)CONCAT26(uStack_102,CONCAT24(uStack_104,uStack_108));
      }
      else {
        dStack_100 = 0.0;
      }
      fStack_1c = 1.0 - (1.0 - (float)dStack_100) * (1.0 - (float)dStack_100);
      if (*(int *)(param_1 + 0x90) == 0) {
        pfStack_13c = &fStack_1c;
        puStack_140 = auStack_ec;
        uStack_144 = 0;
        uStack_148 = _DAT_01713014;
        uStack_14c = 0;
        uStack_150 = 0xc0efcf;
        thunk_FUN_00a7a5a0();
        iStack_8 = 0;
        uStack_150 = 0xc0eff3;
        uStack_150 = thunk_FUN_00a8ac90();
        iStack_8._0_1_ = 1;
        puStack_154 = auStack_e0;
        pfStack_158 = (float *)0xc0f022;
        pfStack_158 = (float *)thunk_FUN_00a9a530();
        iStack_8._0_1_ = 2;
        puStack_15c = (undefined1 *)0xc0f04a;
        thunk_FUN_00a833e0();
        iStack_8._0_1_ = 1;
        puStack_15c = (undefined1 *)0xc0f059;
        thunk_FUN_00a7a5e0();
        iStack_8 = (uint)iStack_8._1_3_ << 8;
        puStack_15c = (undefined1 *)0xc0f068;
        thunk_FUN_00a7a5e0();
        iStack_8 = 0xffffffff;
        puStack_15c = (undefined1 *)0xc0f07a;
        thunk_FUN_00a7a5e0();
        if ((float)_DAT_01716b50 < fStack_1c) {
          *(undefined1 *)(iStack_14 + 0x33) = 1;
        }
      }
      else {
        fVar2 = (*(float *)(param_1 + 0x94) - (float)_DAT_01716b40) / (float)_DAT_016f1fb0;
        if (fVar2 < (float)_DAT_016ec7e0 == (fVar2 == (float)_DAT_016ec7e0)) {
          if ((*(float *)(param_1 + 0x94) - (float)_DAT_01716b40) / (float)_DAT_016f1fb0 <
              (float)_DAT_016ef478) {
            dVar1 = (double)((*(float *)(param_1 + 0x94) - (float)_DAT_01716b40) /
                            (float)_DAT_016f1fb0);
            uStack_108 = SUB84(dVar1,0);
            uStack_104 = (undefined2)((ulonglong)dVar1 >> 0x20);
            uStack_102 = (undefined2)((ulonglong)dVar1 >> 0x30);
          }
          else {
            uStack_108 = 0;
            uStack_104 = 0;
            uStack_102 = 0x3ff0;
          }
          dStack_100 = (double)CONCAT26(uStack_102,CONCAT24(uStack_104,uStack_108));
        }
        else {
          dStack_100 = 0.0;
        }
        fStack_20 = (float)dStack_100 * (float)dStack_100;
        pfStack_13c = &fStack_20;
        puStack_140 = auStack_a4;
        uStack_144 = 0;
        uStack_148 = 0;
        uStack_14c = _DAT_01716b3c;
        uStack_150 = 0xc0f153;
        thunk_FUN_00a7a5a0();
        iStack_8 = 3;
        uStack_150 = 0xc0f177;
        uStack_150 = thunk_FUN_00a8ac90();
        iStack_8._0_1_ = 4;
        puStack_154 = auStack_98;
        pfStack_158 = &fStack_1c;
        puStack_15c = auStack_c8;
        uStack_160 = 0;
        uStack_164 = _DAT_01713014;
        uStack_168 = 0;
        uStack_16c = 0xc0f1c7;
        thunk_FUN_00a7a5a0();
        iStack_8._0_1_ = 5;
        uStack_16c = 0xc0f1e8;
        uStack_16c = thunk_FUN_00a8ac90();
        iStack_8._0_1_ = 6;
        puStack_170 = auStack_bc;
        uStack_174 = 0xc0f217;
        thunk_FUN_00a9a4a0();
        iStack_8._0_1_ = 7;
        uStack_174 = 0xc0f238;
        uStack_174 = thunk_FUN_00a9a4a0();
        iStack_8._0_1_ = 8;
        puStack_178 = (undefined4 *)0xc0f260;
        thunk_FUN_00a833e0();
        iStack_8._0_1_ = 7;
        puStack_178 = (undefined4 *)0xc0f26f;
        thunk_FUN_00a7a5e0();
        iStack_8._0_1_ = 6;
        puStack_178 = (undefined4 *)0xc0f27e;
        thunk_FUN_00a7a5e0();
        iStack_8._0_1_ = 5;
        puStack_178 = (undefined4 *)0xc0f28d;
        thunk_FUN_00a7a5e0();
        iStack_8._0_1_ = 4;
        puStack_178 = (undefined4 *)0xc0f29c;
        thunk_FUN_00a7a5e0();
        iStack_8 = CONCAT31(iStack_8._1_3_,3);
        puStack_178 = (undefined4 *)0xc0f2ab;
        thunk_FUN_00a7a5e0();
        iStack_8 = 0xffffffff;
        puStack_178 = (undefined4 *)0xc0f2bd;
        thunk_FUN_00a7a5e0();
        if ((float)_DAT_016f29f0 <= *(float *)(iStack_14 + 0x94)) {
          if (fStack_18 < (float)_DAT_016f29f0) {
            puStack_178 = (undefined4 *)0x0;
            puStack_17c = (undefined1 *)0x0;
            puStack_180 = &UNK_01716b24;
            puStack_184 = (undefined1 *)0xc0f3e0;
            puStack_180 = (undefined *)thunk_FUN_00a6dff0();
            puStack_184 = (undefined1 *)0xc0f3e9;
            thunk_FUN_00b651c0();
            puStack_184 = (undefined1 *)0xc0f3f0;
            iStack_24 = thunk_FUN_00b68fd0();
            if (iStack_24 != 0) {
              uStack_8c = _DAT_016ec7d8;
              puStack_178 = &uStack_8c;
              puStack_17c = auStack_88;
              puStack_180 = (undefined *)0xc0f421;
              puStack_180 = (undefined *)thunk_FUN_00a8ac90();
              iStack_8 = 9;
              puStack_184 = auStack_7c;
              uStack_188 = 0xc0f450;
              uStack_188 = thunk_FUN_00a9a4a0();
              iStack_8._0_1_ = 10;
              uStack_18c = 0xc0f478;
              thunk_FUN_00a833e0();
              iStack_8 = CONCAT31(iStack_8._1_3_,9);
              uStack_18c = 0xc0f484;
              thunk_FUN_00a7a5e0();
              iStack_8 = 0xffffffff;
              uStack_18c = 0xc0f496;
              thunk_FUN_00a7a5e0();
            }
          }
          fVar2 = (*(float *)(iStack_14 + 0x94) - (float)_DAT_016f29f0) / (float)_DAT_016f2038;
          if (fVar2 < (float)_DAT_016ec7e0 == (fVar2 == (float)_DAT_016ec7e0)) {
            if ((*(float *)(iStack_14 + 0x94) - (float)_DAT_016f29f0) / (float)_DAT_016f2038 <
                (float)_DAT_016ef478) {
              dVar1 = (double)((*(float *)(iStack_14 + 0x94) - (float)_DAT_016f29f0) /
                              (float)_DAT_016f2038);
              uStack_108 = SUB84(dVar1,0);
              uStack_104 = (undefined2)((ulonglong)dVar1 >> 0x20);
              uStack_102 = (undefined2)((ulonglong)dVar1 >> 0x30);
            }
            else {
              uStack_108 = 0;
              uStack_104 = 0;
              uStack_102 = 0x3ff0;
            }
            dStack_100 = (double)CONCAT26(uStack_102,CONCAT24(uStack_104,uStack_108));
          }
          else {
            dStack_100 = 0.0;
          }
          *(float *)(iStack_14 + 0x98) = (float)dStack_100;
          puStack_178 = (undefined4 *)
                        ((int)ROUND(*(float *)(iStack_14 + 0x98) * (float)_DAT_01716b18) & 0xffff);
          puStack_17c = (undefined1 *)0xc0f56a;
          fVar4 = (float10)thunk_FUN_00dacf30();
          puStack_178 = (undefined4 *)0x5056;
          puStack_17c = (undefined1 *)0xc0f57d;
          fVar5 = (float10)thunk_FUN_00dacf30();
          *(float *)(iStack_14 + 0x98) =
               (float)(((float10)(double)fVar4 / fVar5) * (float10)_DAT_01716b08);
        }
        else {
          fVar2 = (*(float *)(iStack_14 + 0x94) - (float)_DAT_017132d8) / (float)_DAT_016f2038;
          if (fVar2 < (float)_DAT_016ec7e0 == (fVar2 == (float)_DAT_016ec7e0)) {
            if ((*(float *)(iStack_14 + 0x94) - (float)_DAT_017132d8) / (float)_DAT_016f2038 <
                (float)_DAT_016ef478) {
              dVar1 = (double)((*(float *)(iStack_14 + 0x94) - (float)_DAT_017132d8) /
                              (float)_DAT_016f2038);
              uStack_108 = SUB84(dVar1,0);
              uStack_104 = (undefined2)((ulonglong)dVar1 >> 0x20);
              uStack_102 = (undefined2)((ulonglong)dVar1 >> 0x30);
            }
            else {
              uStack_108 = 0;
              uStack_104 = 0;
              uStack_102 = 0x3ff0;
            }
            dStack_100 = (double)CONCAT26(uStack_102,CONCAT24(uStack_104,uStack_108));
          }
          else {
            dStack_100 = 0.0;
          }
          *(float *)(iStack_14 + 0x98) = 1.0 - (float)dStack_100;
          puStack_178 = (undefined4 *)
                        ((int)ROUND(*(float *)(iStack_14 + 0x98) * (float)_DAT_017157d0) & 0xffff);
          puStack_17c = (undefined1 *)0xc0f3ad;
          fVar4 = (float10)thunk_FUN_00dacf30();
          *(float *)(iStack_14 + 0x98) = (float)fVar4;
        }
        if (((float)_DAT_016ffc70 < *(float *)(iStack_14 + 0x94)) &&
           (0 < *(int *)(iStack_14 + 0x8c))) {
          puStack_178 = (undefined4 *)&UNK_00a16c98;
          puStack_17c = (undefined1 *)0xc0f5cc;
          uVar3 = thunk_FUN_00b8cc20();
          iStack_8 = 0xb;
          puStack_70 = auStack_19c;
          thunk_FUN_00b88d30(uVar3);
          thunk_FUN_00c591c0();
          iStack_8 = 0xffffffff;
          puStack_180 = (undefined *)0xc0f616;
          thunk_FUN_00b8a1f0();
          puStack_180 = (undefined *)0x0;
          puStack_184 = (undefined1 *)0x0;
          uStack_188 = 0;
          uStack_18c = *(undefined4 *)(iStack_14 + 0x90);
          uStack_190 = 0xc0f62b;
          thunk_FUN_00c592e0();
          puStack_180 = (undefined *)0xc0f633;
          thunk_FUN_00b81cd0();
          puStack_180 = (undefined *)0xc0f63a;
          thunk_FUN_00b85c50();
          *(undefined4 *)(iStack_14 + 0x8c) = 0;
        }
        if ((float)_DAT_01716b08 < *(float *)(iStack_14 + 0x94)) {
          *(undefined1 *)(iStack_14 + 0x33) = 1;
        }
      }
    }
  }
  else {
    pfStack_13c = (float *)0xc0eeb8;
    uVar3 = thunk_FUN_00b85340();
    *(undefined4 *)(iStack_14 + 0x8c) = uVar3;
  }
  ExceptionList = pvStack_10;
  return;
}


```

## FUN_00b7bba0 — 00b7bba0

- 函数名: FUN_00b7bba0
- 函数体: 143 字节
- 调用者数: 0 / 被调用者数: 4

```c

void __thiscall FUN_00b7bba0(int param_1,int param_2)

{
  if (param_2 == *(int *)(param_1 + 0x98)) {
    if ((2 < *(int *)(param_1 + 0xa0)) && (*(int *)(param_1 + 0x94) == 2)) {
      thunk_FUN_00c05e70();
      thunk_FUN_00a83390(param_1 + 8);
      thunk_FUN_00c08ad0();
      thunk_FUN_00c592e0(*(undefined4 *)(param_1 + 0xa0),0,0,0);
    }
    *(undefined1 *)(param_1 + 0x33) = 1;
  }
  return;
}


```

## FUN_00bc8460 — 00bc8460

- 函数名: FUN_00bc8460
- 函数体: 5240 字节
- 调用者数: 0 / 被调用者数: 66

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_00bc8460(int param_1,int param_2)

{
  byte bVar1;
  char cVar2;
  undefined2 uVar3;
  int iVar4;
  undefined4 uVar5;
  float *pfVar6;
  uint uVar7;
  int *piVar8;
  bool bVar9;
  float10 fVar10;
  float fStack_168;
  undefined1 auStack_dc [128];
  undefined4 uStack_5c;
  int iStack_58;
  undefined4 uStack_54;
  int iStack_50;
  undefined4 uStack_4c;
  int iStack_48;
  undefined4 uStack_44;
  float fStack_40;
  float fStack_3c;
  int iStack_38;
  int iStack_34;
  char cStack_2d;
  int iStack_2c;
  undefined4 uStack_28;
  int iStack_24;
  int iStack_20;
  int iStack_1c;
  int iStack_18;
  uint uStack_14;
  void *pvStack_10;
  undefined *puStack_c;
  undefined4 uStack_8;
  
  uStack_8 = 0xffffffff;
  puStack_c = &UNK_01622f7a;
  pvStack_10 = ExceptionList;
  uStack_14 = _DAT_018bcc60 ^ (uint)&stack0xfffffffc;
  ExceptionList = &pvStack_10;
  iStack_18 = param_1;
  if ((*(char *)(param_1 + 0x1bc) != '\0') || ((float)_DAT_016fc540 < *(float *)(param_1 + 0x104)))
  goto LAB_00bc98ba;
  if ((float)_DAT_016ec7e0 < *(float *)(param_1 + 0xac)) {
    *(undefined1 *)(param_1 + 0x1ba) = 0;
    goto LAB_00bc98ba;
  }
  iStack_1c = thunk_FUN_00c5a200();
  if (iStack_1c != 0) {
    thunk_FUN_00a80300();
    cVar2 = thunk_FUN_00a9ff40();
    if (cVar2 != '\0') {
      thunk_FUN_00a7ebf0();
      iVar4 = thunk_FUN_00a6fe80();
      if (iVar4 == 0) {
        thunk_FUN_00bab5e0();
        iStack_20 = thunk_FUN_00bad8d0();
        if (0 < iStack_20) {
          iStack_24 = 0;
          while (iStack_24 == 0) {
            uStack_28 = thunk_FUN_00a7d930();
            thunk_FUN_00bab5e0();
            iStack_24 = thunk_FUN_00baee90();
          }
          if (iStack_24 != 0) {
            thunk_FUN_00c6b930();
            iStack_2c = thunk_FUN_00c76a20();
            *(undefined4 *)(iStack_2c + 0xd0) = 0;
            thunk_FUN_00a833e0();
            thunk_FUN_00a833e0();
            uVar5 = thunk_FUN_00a83d00();
            uStack_8 = 0;
            thunk_FUN_00a83c40(uVar5);
            thunk_FUN_00c49730(&UNK_016ef4f8,0x3f800000,0x3f800000);
            uStack_8 = 0xffffffff;
            thunk_FUN_00a7e630();
            uVar5 = thunk_FUN_00a6dff0(&UNK_016ef4dc);
            thunk_FUN_00bcffe0(uVar5);
            thunk_FUN_00bba8a0();
          }
        }
      }
    }
  }
  iVar4 = thunk_FUN_00bd02a0();
  if ((*(char *)(iVar4 + 0x330) == '\0') &&
     ((*(char *)(iStack_18 + 0xcc) == '\0' || (3 < *(int *)(iStack_18 + 200))))) {
    fStack_168._0_1_ = '\x01';
  }
  else {
    fStack_168._0_1_ = '\0';
  }
  cStack_2d = fStack_168._0_1_;
  *(undefined4 *)(iStack_18 + 0x70) = 0;
  iStack_34 = thunk_FUN_00c59880();
  if (cStack_2d == '\0') {
    *(undefined1 *)(iStack_18 + 0x1ba) = 0;
  }
  else {
    if (iStack_1c == 0) {
LAB_00bc8726:
      fStack_168._0_1_ = 0;
    }
    else {
      thunk_FUN_00a7ebf0();
      iVar4 = thunk_FUN_00a709c0();
      if (((iVar4 != 1) || (*(char *)(iStack_18 + 0xcc) != '\0')) && (*(int *)(iStack_18 + 200) < 4)
         ) goto LAB_00bc8726;
      fStack_168._0_1_ = 1;
    }
    *(char *)(iStack_18 + 0x1bb) = fStack_168._0_1_;
    cVar2 = thunk_FUN_00c59670();
    if (((cVar2 == '\0') || (iStack_34 < 2)) ||
       ((iVar4 = thunk_FUN_00bd02a0(), *(char *)(iVar4 + 0x318) == '\0' ||
        ((DAT_0197f444 != '\0' || ((float)_DAT_016ec7e0 < _DAT_0197f45c)))))) {
      *(undefined1 *)(iStack_18 + 0x1ba) = 0;
    }
    else {
      if (_DAT_0197f478 + -1 < 2) {
        fStack_168 = 2.8026e-45;
      }
      else {
        fStack_168 = (float)(_DAT_0197f478 + -1);
      }
      _DAT_0197f478 = (int)fStack_168;
      if (param_2 == 0) {
        *(undefined1 *)(iStack_18 + 0x1ba) = 0;
      }
      else {
        thunk_FUN_00c6b930();
        fVar10 = (float10)thunk_FUN_00c78cf0();
        if (fVar10 <= (float10)_DAT_016ec7e0) {
          bVar9 = false;
        }
        else {
          if (_DAT_0197f478 < _DAT_018b7b30) {
            fStack_168 = (float)_DAT_0197f478;
          }
          else {
            fStack_168 = (float)_DAT_018b7b30;
          }
          thunk_FUN_00c6b930();
          fVar10 = (float10)thunk_FUN_00c78cf0();
          if ((float10)_DAT_016ef478 < (float10)(int)fStack_168 / fVar10) {
            thunk_FUN_00c6b930();
            thunk_FUN_00c78cf0();
          }
          iVar4 = thunk_FUN_00a7d930();
          bVar9 = iVar4 == 0;
        }
        *(bool *)(iStack_18 + 0x1ba) = bVar9;
      }
      if (iStack_1c != 0) {
        thunk_FUN_00a80300();
        cVar2 = thunk_FUN_00a9ff40();
        if (cVar2 != '\0') {
          *(undefined1 *)(iStack_18 + 0x1ba) = 0;
        }
      }
      if ((_DAT_01950b60 & 1) == 0) {
        _DAT_01950b60 = _DAT_01950b60 | 1;
        uStack_8 = 1;
        _DAT_01950a44 = thunk_FUN_00bbde60();
        uStack_8 = 0xffffffff;
      }
      iVar4 = thunk_FUN_00ae8820();
      if (iVar4 == _DAT_01950a44) {
        *(undefined1 *)(iStack_18 + 0x1ba) = 0;
      }
      if (*(char *)(iStack_18 + 0x1ba) != '\0') {
        _DAT_0197f478 = _DAT_018b7b30 + _DAT_018b7b34;
        iVar4 = thunk_FUN_00ab0d20();
        if (iVar4 != 0) {
          thunk_FUN_00ae1380();
          piVar8 = (int *)thunk_FUN_00ab0d20();
          (**(code **)(*piVar8 + 0x50))();
          thunk_FUN_00ae13a0();
        }
      }
    }
    if ((DAT_0197f44f == '\0') || (cVar2 = thunk_FUN_00bc60b0(), cVar2 == '\0')) {
      if (*(char *)(iStack_18 + 0x1ba) == '\0') {
        thunk_FUN_00b59db0();
        cVar2 = thunk_FUN_00b5dac0();
        if (cVar2 == '\0') {
          iStack_38 = 0;
          while (iVar4 = thunk_FUN_00bd02a0(), iStack_38 < *(int *)(iVar4 + 800)) {
            thunk_FUN_00a83d00();
            uStack_8 = 3;
            thunk_FUN_00a83c40();
            uStack_8._0_1_ = 4;
            thunk_FUN_00bd02a0();
            uStack_8 = CONCAT31(uStack_8._1_3_,3);
            thunk_FUN_00c49730();
            uStack_8 = 0xffffffff;
            thunk_FUN_00a7e630();
            iStack_38 = iStack_38 + 1;
          }
        }
      }
      else {
        thunk_FUN_00a83d00();
        uStack_8 = 2;
        thunk_FUN_00a83c40();
        thunk_FUN_00c49730();
        uStack_8 = 0xffffffff;
        thunk_FUN_00a7e630();
        thunk_FUN_00b59db0();
        thunk_FUN_00b5dac0();
      }
    }
  }
  thunk_FUN_00a833e0();
  *(undefined4 *)(iStack_18 + 0x104) = _DAT_0171324c;
  fVar10 = (float10)thunk_FUN_00aa61b0();
  fStack_3c = (float)(fVar10 * (float10)_DAT_016fcc88);
  if (fStack_3c < (float)_DAT_016fc550 == (fStack_3c == (float)_DAT_016fc550)) {
    fStack_168 = fStack_3c;
    if ((float)_DAT_016f8410 <= fStack_3c) {
      fStack_168 = _DAT_01713248;
    }
  }
  else {
    fStack_168 = _DAT_016fca60;
  }
  fStack_40 = fStack_168;
  if (*(char *)(iStack_18 + 0x1ba) == '\0') {
    iVar4 = thunk_FUN_00bd02a0();
    if (((*(int *)(iVar4 + 0x314) == 0x32) ||
        (iVar4 = thunk_FUN_00bd02a0(), *(char *)(iVar4 + 0x330) != '\0')) && (DAT_0197f444 == '\0'))
    {
      if (fStack_3c < (float)_DAT_016ffca0 == (fStack_3c == (float)_DAT_016ffca0)) {
        fStack_168 = fStack_3c;
        if ((float)_DAT_016f8410 <= fStack_3c) {
          fStack_168 = _DAT_01713248;
        }
      }
      else {
        fStack_168 = _DAT_01701d90;
      }
      fStack_40 = fStack_168;
      *(float *)(iStack_18 + 0x104) = *(float *)(iStack_18 + 0x104) * (float)_DAT_016f29f0;
      thunk_FUN_00a7a600();
      uStack_8 = 6;
      thunk_FUN_00a83390();
      uStack_8 = 0xffffffff;
      thunk_FUN_00ae60e0();
      iVar4 = thunk_FUN_00bd02a0();
      if (*(int *)(iVar4 + 0x314) == 0x32) {
        uStack_44 = thunk_FUN_00c05e70();
        thunk_FUN_00a83390();
        thunk_FUN_00c087b0();
      }
    }
  }
  else {
    if (fStack_3c < (float)_DAT_016ffca0 == (fStack_3c == (float)_DAT_016ffca0)) {
      fStack_168 = fStack_3c;
      if ((float)_DAT_016f8410 <= fStack_3c) {
        fStack_168 = _DAT_01713248;
      }
    }
    else {
      fStack_168 = _DAT_01701d90;
    }
    fStack_40 = fStack_168;
    *(float *)(iStack_18 + 0x104) = *(float *)(iStack_18 + 0x104) * (float)_DAT_01709dc0;
    thunk_FUN_00a92c00();
    uStack_8 = 5;
    thunk_FUN_00a83390();
    uStack_8 = 0xffffffff;
    thunk_FUN_00ae60e0();
  }
  uVar3 = thunk_FUN_00dad570();
  *(undefined2 *)(iStack_18 + 0x108) = uVar3;
  *(float *)(iStack_18 + 0x10c) = fStack_40;
  thunk_FUN_00a833e0();
  for (iStack_48 = 0; iStack_48 < 2; iStack_48 = iStack_48 + 1) {
    if (*(int *)(iStack_18 + 0x40 + iStack_48 * 4) != 0) {
      thunk_FUN_00b651c0();
      thunk_FUN_00b6c220();
      *(undefined4 *)(iStack_18 + 0x40 + iStack_48 * 4) = 0;
    }
  }
  if ((DAT_0197f44f == '\0') || (cVar2 = thunk_FUN_00bc60b0(), cVar2 == '\0')) {
    cVar2 = thunk_FUN_00c597a0();
    if ((cVar2 != '\0') && (param_2 == iStack_18)) {
      *(undefined4 *)(iStack_18 + 0x70) = 2;
    }
    if ((cStack_2d != '\0') &&
       (pfVar6 = (float *)thunk_FUN_00b651c0(),
       *pfVar6 < (float)_DAT_016ec7e0 != (*pfVar6 == (float)_DAT_016ec7e0))) {
      thunk_FUN_00a83390();
      thunk_FUN_00bd06c0();
    }
    if (cStack_2d != '\0') {
      thunk_FUN_00a83390();
      uStack_8 = 7;
      thunk_FUN_00b59db0();
      uStack_8 = 0xffffffff;
      thunk_FUN_00b5db10();
      iVar4 = thunk_FUN_00bd02a0();
      uStack_4c = *(undefined4 *)(iVar4 + 0x250);
      if (*(char *)(iStack_18 + 0x1ba) != '\0') {
        if ((_DAT_01950b60 & 2) == 0) {
          _DAT_01950b60 = _DAT_01950b60 | 2;
          uStack_8 = 8;
          _DAT_01950a48 = thunk_FUN_00a6dff0();
          uStack_8 = 0xffffffff;
        }
        uStack_4c = _DAT_01950a48;
      }
      thunk_FUN_00b651c0();
      cVar2 = thunk_FUN_00b68ed0();
      if (cVar2 != '\0') {
        thunk_FUN_00b651c0();
        uVar5 = thunk_FUN_00b68fd0();
        *(undefined4 *)(iStack_18 + 0x40) = uVar5;
        thunk_FUN_00b651c0();
        uVar5 = thunk_FUN_00b68fd0();
        *(undefined4 *)(iStack_18 + 0x44) = uVar5;
        if (*(int *)(iStack_18 + 0x40) != 0) {
          thunk_FUN_00a833e0();
          fVar10 = (float10)thunk_FUN_00dacf30();
          *(float *)(*(int *)(iStack_18 + 0x40) + 0x34) = (float)-fVar10;
          fVar10 = (float10)thunk_FUN_00dacf80();
          *(float *)(*(int *)(iStack_18 + 0x40) + 0x30) = (float)fVar10;
        }
        if (*(int *)(iStack_18 + 0x44) != 0) {
          thunk_FUN_00a833e0();
          fVar10 = (float10)thunk_FUN_00dacf30();
          *(float *)(*(int *)(iStack_18 + 0x44) + 0x34) = (float)-fVar10;
          fVar10 = (float10)thunk_FUN_00dacf80();
          *(float *)(*(int *)(iStack_18 + 0x44) + 0x30) = (float)fVar10;
        }
      }
      iVar4 = thunk_FUN_00bd02a0();
      uStack_4c = *(undefined4 *)(iVar4 + 0x25c);
      thunk_FUN_00b651c0();
      cVar2 = thunk_FUN_00b68ed0();
      if (cVar2 != '\0') {
        thunk_FUN_00b651c0();
        iStack_50 = thunk_FUN_00b68fd0();
        if (iStack_50 != 0) {
          fVar10 = (float10)thunk_FUN_00dacf30();
          *(float *)(iStack_50 + 0x34) = (float)-fVar10;
          fVar10 = (float10)thunk_FUN_00dacf80();
          *(float *)(iStack_50 + 0x30) = (float)fVar10;
          thunk_FUN_00a833e0();
        }
      }
    }
    if (DAT_0197f44f == '\0') {
      thunk_FUN_00bd02a0();
      thunk_FUN_00c4a500();
      thunk_FUN_00c4cf10();
      if ((*(char *)(iStack_18 + 0xcc) == '\0') || (3 < *(int *)(iStack_18 + 200))) {
        if ((((param_2 == 0) || (*(char *)(iStack_18 + 0xc4) != '\0')) ||
            ((DAT_0197f444 != '\0' &&
             (((_DAT_0197f448 != 1 || ((float)_DAT_01713230 <= _DAT_0197f458)) ||
              (_DAT_0197f458 <= (float)_DAT_01713220)))))) ||
           ((cVar2 = thunk_FUN_00bc6b50(), cVar2 != '\0' || (param_2 == 0)))) {
          iVar4 = thunk_FUN_00bd02a0();
          if ((*(char *)(iVar4 + 0x330) != '\0') && (param_2 != 0)) {
            thunk_FUN_00bd1300();
            thunk_FUN_00bd1300();
          }
        }
        else {
          uStack_54 = *(undefined4 *)(iStack_18 + 0x84);
          iVar4 = thunk_FUN_00bd02a0();
          if (*(int *)(iVar4 + 0x32c) != 0) {
            thunk_FUN_00a83390();
            uStack_8 = 9;
            thunk_FUN_00bd02a0();
            thunk_FUN_00bc9e00();
            thunk_FUN_00b81cd0();
            uStack_8 = 0xffffffff;
            thunk_FUN_00b82570();
          }
          if (*(char *)(iStack_18 + 0x1ba) == '\0') {
            iVar4 = thunk_FUN_00bd02a0();
            fStack_168 = *(float *)(iVar4 + 0x314);
          }
          else {
            iVar4 = thunk_FUN_00bd02a0();
            fStack_168 = (float)(_DAT_018b7b2c + *(int *)(iVar4 + 0x314));
          }
          iStack_58 = (int)fStack_168;
          if ((_DAT_018b7b48 != *(byte *)(iStack_18 + 0x3c)) ||
             (iVar4 = thunk_FUN_00bd02a0(), *(char *)(iVar4 + 0x330) != '\0')) {
            _DAT_018b7b48 = (uint)*(byte *)(iStack_18 + 0x3c);
            _DAT_01950fa4 = 0;
          }
          _DAT_01950fa4 = _DAT_01950fa4 + 1;
          thunk_FUN_00c6b930();
          thunk_FUN_00c73fc0();
          if ((_DAT_01950b60 & 4) == 0) {
            _DAT_01950b60 = _DAT_01950b60 | 4;
            uStack_8 = 10;
            _DAT_01950b64 = thunk_FUN_00a6dff0();
            uStack_8 = 0xffffffff;
          }
          if ((_DAT_01950b60 & 8) == 0) {
            _DAT_01950b60 = _DAT_01950b60 | 8;
            uStack_8 = 0xb;
            _DAT_01950c74 = thunk_FUN_00a6dff0();
            uStack_8 = 0xffffffff;
          }
          iVar4 = thunk_FUN_00c385d0();
          if (iVar4 < 1) {
            thunk_FUN_00c37ff0();
          }
          thunk_FUN_00c385d0();
          thunk_FUN_00c37ff0();
          bVar1 = *(byte *)(iStack_18 + 0x3c);
          uVar7 = thunk_FUN_00bbde60();
          if (bVar1 != uVar7) {
            thunk_FUN_00c592e0();
          }
          thunk_FUN_00bd1300();
          thunk_FUN_00bd1300();
          if ((_DAT_01950b60 & 0x10) == 0) {
            _DAT_01950b60 = _DAT_01950b60 | 0x10;
            uStack_8 = 0xc;
            _DAT_01950d78 = thunk_FUN_00a6dff0();
            uStack_8 = 0xffffffff;
          }
          if ((_DAT_01950b60 & 0x20) == 0) {
            _DAT_01950b60 = _DAT_01950b60 | 0x20;
            uStack_8 = 0xd;
            _DAT_01950b54 = thunk_FUN_00a6dff0();
            uStack_8 = 0xffffffff;
          }
          uStack_5c = thunk_FUN_00c4a500();
          if (DAT_0197f450 == '\0') {
            thunk_FUN_00c59880();
            thunk_FUN_00c4c350();
          }
          thunk_FUN_00bd02a0();
          thunk_FUN_00c4c920();
          iVar4 = thunk_FUN_00bd02a0(1,0,1);
          uVar5 = thunk_FUN_00bd02a0(*(undefined4 *)(iVar4 + 0x250));
          thunk_FUN_00c37ff0(uVar5);
          iVar4 = thunk_FUN_00bd02a0(1,1,1);
          iVar4 = thunk_FUN_00bd02a0(*(undefined4 *)(iVar4 + 0x260));
          thunk_FUN_00c37ff0(iVar4 + 0x140);
          if ((_DAT_01950b60 & 0x40) == 0) {
            _DAT_01950b60 = _DAT_01950b60 | 0x40;
            uStack_8 = 0xe;
            _DAT_01950b68 = thunk_FUN_00a6dff0(&UNK_01712ee8);
            uStack_8 = 0xffffffff;
          }
          iVar4 = thunk_FUN_00bd02a0();
          if (_DAT_01950b68 == *(int *)(iVar4 + 0x250)) {
            uVar5 = thunk_FUN_00a6dff0(&UNK_017131cc,1,1,1);
            thunk_FUN_00c37ff0(&UNK_017131cc,uVar5);
          }
          uVar5 = thunk_FUN_00a6dff0(&UNK_016f4064,1,0,0);
          thunk_FUN_00c37ff0(&UNK_016f4064,uVar5);
          if (*(char *)(iStack_18 + 0x1ba) != '\0') {
            thunk_FUN_00ae1380(&UNK_017131bc);
            thunk_FUN_00c37ff0(&UNK_017131f8,_DAT_01950d78,1,0,0);
            thunk_FUN_00c37ff0(&UNK_017131e8,_DAT_01950b54,1,1,0);
            if (iStack_1c != 0) {
              thunk_FUN_00bc9f90();
            }
            uVar5 = thunk_FUN_00bd02a0();
            thunk_FUN_00c916e0(auStack_dc,0x80,&UNK_017131b4,uVar5);
            uVar5 = thunk_FUN_00a6dff0(auStack_dc);
            thunk_FUN_00c37ff0(auStack_dc,uVar5,1,0,1);
          }
          iVar4 = thunk_FUN_00ab0d20();
          if (iVar4 != 0) {
            piVar8 = (int *)thunk_FUN_00ab0d20();
            (**(code **)(*piVar8 + 0x3c))();
          }
        }
      }
      else if (iStack_1c != 0) {
        thunk_FUN_00a7ea30();
      }
    }
  }
LAB_00bc98ba:
  ExceptionList = pvStack_10;
  thunk_FUN_01550950();
  return;
}


```

## FUN_00b7b640 — 00b7b640

- 函数名: FUN_00b7b640
- 函数体: 770 字节
- 调用者数: 0 / 被调用者数: 16

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall
FUN_00b7b640(undefined4 *param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4,
            undefined4 param_5,undefined4 param_6,undefined4 param_7)

{
  int iStack_b0;
  void *pvStack_10;
  undefined *puStack_c;
  int iStack_8;
  
  iStack_8 = 0xffffffff;
  puStack_c = &UNK_0161b486;
  pvStack_10 = ExceptionList;
  ExceptionList = &pvStack_10;
  thunk_FUN_00be9a10();
  iStack_8 = 0;
  *param_1 = &UNK_0170c8cc;
  param_1[0x1f] = param_2;
  param_1[0x20] = 0;
  param_1[0x21] = param_3;
  param_1[0x22] = param_4;
  param_1[0x23] = param_5;
  param_1[0x24] = param_6;
  param_1[0x25] = param_7;
  param_1[0x26] = 0;
  param_1[0x27] = 0;
  thunk_FUN_00a833e0();
  thunk_FUN_00b7cca0();
  iStack_8._0_1_ = 1;
  thunk_FUN_00b16800();
  iStack_8 = (uint)iStack_8._1_3_ << 8;
  thunk_FUN_00b11750();
  param_1[4] = _DAT_0170c8c4;
  param_1[0xd] = 0x80;
  if (_DAT_01923978 == 0) {
    param_1[0x28] = 1;
  }
  else {
    param_1[0x28] = 0;
    if (*(int *)(_DAT_01923978 + 0x9c) == 0) {
      iStack_b0 = _DAT_01923978;
    }
    else {
      iStack_b0 = *(int *)(_DAT_01923978 + 0x9c);
    }
    param_1[0x27] = iStack_b0;
    *(undefined4 **)(param_1[0x27] + 0x98) = param_1;
    *(int *)(param_1[0x27] + 0xa0) = *(int *)(param_1[0x27] + 0xa0) + 1;
    if ((2 < *(int *)(param_1[0x27] + 0xa0)) && (param_1[0x25] == 1)) {
      thunk_FUN_00c05e70();
      thunk_FUN_00a83390(param_1 + 2);
      thunk_FUN_00c08ad0();
      thunk_FUN_00c592e0(*(undefined4 *)(param_1[0x27] + 0xa0),0,0,0);
    }
    thunk_FUN_00b7cd50();
    iStack_8._0_1_ = 2;
    thunk_FUN_00b7ba90();
    iStack_8 = (uint)iStack_8._1_3_ << 8;
    thunk_FUN_00b7ba60();
  }
  thunk_FUN_00c598c0();
  iStack_8._0_1_ = 3;
  thunk_FUN_00a9a820();
  iStack_8 = (uint)iStack_8._1_3_ << 8;
  thunk_FUN_00a9a7c0();
  iStack_8 = 0xffffffff;
  ExceptionList = pvStack_10;
  thunk_FUN_01550950();
  return;
}


```

## FUN_00b27d60 — 00b27d60

- 函数名: FUN_00b27d60
- 函数体: 933 字节
- 调用者数: 0 / 被调用者数: 18

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_00b27d60(int param_1,int param_2)

{
  char cVar1;
  int iVar2;
  undefined4 uVar3;
  int iStack_a4;
  int iStack_a0;
  undefined4 uStack_18;
  void *pvStack_10;
  undefined *puStack_c;
  undefined4 uStack_8;
  
  puStack_c = &UNK_016129df;
  pvStack_10 = ExceptionList;
  ExceptionList = &pvStack_10;
  if ((_DAT_018c55a4 & 1) == 0) {
    _DAT_018c55a4 = _DAT_018c55a4 | 1;
    uStack_8 = 0;
    _DAT_018c55a8 = thunk_FUN_00a6dff0();
  }
  uStack_8 = 0xffffffff;
  if ((param_2 != 0) && (iVar2 = thunk_FUN_00bd02a0(), *(int *)(iVar2 + 0x250) == _DAT_018c55a8)) {
    if (*(int *)(param_1 + 0x40) != 0) {
      thunk_FUN_00c49fd0();
      *(undefined4 *)(param_1 + 0x40) = 0;
    }
    thunk_FUN_00a83d00();
    uStack_8 = 1;
    thunk_FUN_00a83c40();
    thunk_FUN_00c49730();
    uStack_8 = 0xffffffff;
    thunk_FUN_00a7e630();
    uVar3 = thunk_FUN_00a83d00();
    uStack_8 = 2;
    thunk_FUN_00a83c40(uVar3);
    thunk_FUN_00b2bfa0(_DAT_016ef758,0x3f800000);
    uStack_8 = 0xffffffff;
    thunk_FUN_00a7e630();
    iVar2 = thunk_FUN_00c38590(&UNK_016f87c0);
    if (iVar2 == 1) {
      uVar3 = thunk_FUN_00a6dff0(&UNK_01703d74,1,1,1);
      thunk_FUN_00c37ff0(&UNK_01703d74,uVar3);
    }
    if (*(int *)(param_1 + 0x3c) != 0) {
      if (*(int *)(param_1 + 0x3c) != 0) {
        thunk_FUN_00b262a0(1);
      }
      *(undefined4 *)(param_1 + 0x3c) = 0;
    }
    if (*(int *)(param_1 + 0x14) == 0) {
      iStack_a0 = 0;
    }
    else {
      if (*(uint *)(param_1 + 0x14) < 2) {
        iStack_a4 = *(int *)(param_1 + 0x14);
      }
      else {
        iStack_a4 = 2;
      }
      iStack_a0 = iStack_a4;
    }
    cVar1 = thunk_FUN_00b281f0(0);
    if (cVar1 == '\0') {
      thunk_FUN_00a83390(0x18bebcc);
      uStack_8 = 4;
      thunk_FUN_00a83390(0x18bebcc);
      uStack_8._0_1_ = 5;
      uVar3 = thunk_FUN_00a6dff0(&UNK_01703d5c,_DAT_018c5664,0,1);
      thunk_FUN_00c37ff0(&UNK_01703d5c,uVar3);
      thunk_FUN_00c592e0(_DAT_018c5664,0,1,0);
      uStack_18 = *(undefined4 *)(*(int *)(param_1 + 0x54) + 0x20);
      uStack_8 = CONCAT31(uStack_8._1_3_,4);
      thunk_FUN_00a7a5e0();
      uStack_8 = 0xffffffff;
      thunk_FUN_00a7a5e0();
    }
    else {
      iVar2 = thunk_FUN_00c8c9a0(0x4c);
      uStack_8 = 3;
      if (iVar2 == 0) {
        iStack_a0 = 0;
      }
      else {
        iStack_a0 = thunk_FUN_00b29f80(param_2,param_1 + 0x18 + iStack_a0 * 0xc,iStack_a0);
      }
      uStack_8 = 0xffffffff;
      *(int *)(param_1 + 0x3c) = iStack_a0;
      uStack_18 = *(undefined4 *)(*(int *)(param_1 + 0x54) + 0x1c);
    }
    thunk_FUN_00b25b70(uStack_18,param_2 + 0x10,0xffffffff);
  }
  ExceptionList = pvStack_10;
  return;
}


```

