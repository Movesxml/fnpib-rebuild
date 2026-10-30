# 字符串定位报告（立即数扫描）

- 程序: FruitNinjaPIB.exe
- 已定义函数: 129503
- 命中函数: 32，裸引用点(未纳入函数): 0

## FUN_00aa7890 — 00aa7890
命中: combo@016f40d0(imm)

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
命中: combo@01703df4, combo@01703df4(imm)

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
    uStack_48 = _DAT_01703d
/* ...截断... */
```

## FUN_00baaea0 — 00baaea0
命中: critical@01710a94(imm), wave@01710a74(imm)

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
命中: critical@01710a94(imm)

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
          pcStack_3c = (char *)thunk_FUN_00c971c0(&UNK_017205
/* ...截断... */
```

## FUN_00bcc3a0 — 00bcc3a0
命中: critical@01713550(imm)

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00bcc3a0(void)

{
  char cVar1;
  uint uVar2;
  int iVar3;
  undefined4 uVar4;
  float10 fVar5;
  uint *puStack_1a4;
  undefined1 auStack_190 [4];
  undefined1 auStack_18c [4];
  undefined4 *puStack_188;
  int iStack_184;
  uint uStack_180;
  uint *puStack_17c;
  uint *puStack_178;
  undefined1 auStack_174 [4];
  undefined1 auStack_170 [4];
  uint uStack_16c;
  uint *puStack_168;
  uint *puStack_164;
  undefined4 uStack_160;
  undefined4 *puStack_15c;
  undefined4 *puStack_158;
  undefined4 uStack_154;
  uint uStack_150;
  int iStack_14c;
  uint uStack_148;
  int iStack_144;
  int iStack_140;
  undefined4 *puStack_13c;
  undefined4 *puStack_138;
  char *pcStack_f4;
  int iStack_f0;
  int iStack_ec;
  undefined4 *puStack_e8;
  int iStack_e4;
  uint uStack_e0;
  int iStack_dc;
  undefined4 uStack_d8;
  int iStack_d4;
  int iStack_d0;
  undefined4 *puStack_cc;
  int iStack_c8;
  int iStack_c4;
  int iStack_c0;
  int iStack_bc;
  undefined4 uStack_b8;
  undefined4 uStack_b4;
  undefined4 uStack_b0;
  int iStack_ac;
  undefined4 uStack_a8;
  undefined4 uStack_a4;
  undefined4 uStack_a0;
  undefined4 uStack_9c;
  int iStack_98;
  int iStack_94;
  undefined1 auStack_90 [64];
  char *pcStack_50;
  uint *puStack_4c;
  int iStack_48;
  char *pcStack_44;
  int iStack_40;
  int iStack_3c;
  undefined4 uStack_38;
  undefined4 uStack_34;
  undefined4 uStack_30;
  undefined4 uStack_2c;
  char *pcStack_28;
  int iStack_24;
  int iStack_20;
  char cStack_19;
  undefined4 *puStack_18;
  uint uStack_14;
  void *pvStack_10;
  undefined *puStack_c;
  undefined4 uStack_8;
  
  uStack_8 = 0xffffffff;
  puStack_c = &UNK_0162327c;
  pvStack_10 = ExceptionList;
  uVar2 = _DAT_018bcc60 ^ (uint)&stack0xfffffffc;
  ExceptionList = &pvStack_10;
  uStack_14 = uVar2;
  if (_DAT_01950fa0 == (uint *)0x0) {
    iVar3 = thunk_FUN_00c8c9a0(0x14,uVar2);
    uStack_8 = 0;
    if (iVar3 == 0) {
      puStack_1a4 = (uint *)0x0;
    }
    else {
      puStack_1a4 = (uint *)thunk_FUN_00bd4c20();
    }
    uStack_8 = 0xffffffff;
    _DAT_01950f8c = puStack_1a4;
    thunk_FUN_00bd18d0();
    iVar3 = thunk_FUN_00c8c9a0(0x14,uVar2);
    uStack_8 = 1;
    if (iVar3 == 0) {
      puStack_1a4 = (uint *)0x0;
    }
    else {
      puStack_1a4 = (uint *)thunk_FUN_00bd1970(100,&UNK_017135d8);
    }
    uStack_8 = 0xffffffff;
    _DAT_01950f90 = puStack_1a4;
    cVar1 = thunk_FUN_00c69130();
    if (cVar1 != '\0') {
      thunk_FUN_00dbc1d0(auStack_190,&UNK_017135b0);
      uVar4 = thunk_FUN_00dbc420();
      uStack_8 = 2;
      thunk_FUN_00a9a820(uVar4);
      uStack_8 = 0xffffffff;
      thunk_FUN_00a9a7c0();
      thunk_FUN_00dbc1d0(auStack_18c,&UNK_01713584);
      uVar4 = thunk_FUN_00dbc420();
      uStack_8 = 3;
      thunk_FUN_00a9a820(uVar4);
      uStack_8 = 0xffffffff;
      thunk_FUN_00a9a7c0();
    }
    iStack_184 = thunk_FUN_00c8c9a0(0x48);
    uStack_8 = 4;
    if (iStack_184 == 0) {
      puStack_1a4 = (undefined4 *)0x0;
    }
    else {
      puStack_1a4 = (uint *)thunk_FUN_00c98ca0(&UNK_0171356c);
    }
    puStack_188 = puStack_1a4;
    uStack_8 = 0xffffffff;
    puStack_18 = puStack_1a4;
    if ((puStack_1a4 != (undefined4 *)0x0) && (cStack_19 = thunk_FUN_00c98e40(0), cStack_19 != '\0')
       ) {
      iStack_20 = thunk_FUN_00a6ef60(&UNK_0171355c);
      iStack_24 = thunk_FUN_00a6ef60(&UNK_01713550);
      if (iStack_24 != 0) {
        pcStack_28 = (char *)thunk_FUN_00c971c0(&UNK_01707360);
        if ((pcStack_28 != (char *)0x0) && (*pcStack_28 != '\0')) {
          uStack_38 = 0xff;
          uStack_34 = 0xff;
          uStack_30 = 0xff;
          uStack_2c = 0xff;
          for (iStack_3c = 0; iStack_3c < 4; iStack_3c = iStack_3c + 1) {
            uVar4 = thunk_FUN_015592c0(pcStack_28);
            (&uStack_38)[iSta
/* ...截断... */
```

## FUN_00c3a7e0 — 00c3a7e0
命中: wave@01719e38(imm)

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

## FUN_01638c90 — 01638c90
命中: score@016ee244(imm)

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_01638c90(void)

{
  _DAT_018beb80 = thunk_FUN_00a6dff0(&UNK_016ee24c);
  _DAT_018beb84 = thunk_FUN_00a6dff0(&UNK_016ee244);
  _DAT_018beb88 = thunk_FUN_00a6dff0(&UNK_016ee23c);
  _DAT_018beb8c = thunk_FUN_00a6dff0(&UNK_016ee22c);
  _DAT_018beb90 = thunk_FUN_00a6dff0(&UNK_016ee21c);
  _DAT_018beb94 = thunk_FUN_00a6dff0(&UNK_016ee214);
  return;
}


```

## FUN_00aa6ca0 — 00aa6ca0
命中: score@016f3ef4(imm)

```c

int FUN_00aa6ca0(void)

{
  int iVar1;
  int iStack_18;
  int aiStack_c [2];
  
  aiStack_c[0] = thunk_FUN_00a6dff0(&UNK_016f3f14);
  aiStack_c[1] = thunk_FUN_00a6dff0(&UNK_016f3f04);
  iVar1 = thunk_FUN_00c971c0(&UNK_016f3ef4);
  if (iVar1 != 0) {
    iVar1 = thunk_FUN_00a6dff0(iVar1);
    for (iStack_18 = 0; iStack_18 < 2; iStack_18 = iStack_18 + 1) {
      if (iVar1 == aiStack_c[iStack_18]) {
        return iStack_18;
      }
    }
  }
  return 0;
}


```

## FUN_00a7df70 — 00a7df70
命中: slash@016ef164(imm), slash@016ef178(imm), bandito@016ef0f4(imm)

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
          puStack_10c = (
/* ...截断... */
```

## FUN_00bda510 — 00bda510
命中: slash@016ef178(imm)

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
              fVar
/* ...截断... */
```

## FUN_00b5a560 — 00b5a560
命中: slash@01709c1c(imm)

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
      iStack_30 = thunk_FUN_00a6ef60(&
/* ...截断... */
```

## FUN_00b7f860 — 00b7f860
命中: slash@0170ce94(imm)

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00b7f860(void)

{
  undefined1 uVar1;
  int iVar2;
  undefined4 uVar3;
  undefined4 *puVar4;
  float10 fVar5;
  int iStack_e8;
  undefined1 auStack_e4 [4];
  undefined1 auStack_e0 [4];
  undefined4 uStack_dc;
  int iStack_d8;
  undefined4 uStack_d4;
  int iStack_d0;
  int iStack_cc;
  int iStack_c8;
  int iStack_c4;
  int iStack_c0;
  int iStack_bc;
  int iStack_b8;
  int iStack_b4;
  int iStack_b0;
  int iStack_ac;
  int iStack_a8;
  int iStack_a4;
  int iStack_a0;
  int iStack_9c;
  int iStack_98;
  int iStack_94;
  int iStack_90;
  char cStack_89;
  undefined1 auStack_88 [12];
  undefined1 auStack_7c [76];
  undefined4 uStack_30;
  undefined1 auStack_2c [12];
  int iStack_20;
  int iStack_1c;
  int iStack_18;
  int iStack_14;
  void *pvStack_10;
  undefined *puStack_c;
  undefined4 uStack_8;
  
  uStack_8 = 0xffffffff;
  puStack_c = &UNK_0161bc05;
  pvStack_10 = ExceptionList;
  ExceptionList = &pvStack_10;
  iVar2 = thunk_FUN_00c971c0(&UNK_016ec4a0,_DAT_018bcc60 ^ (uint)&stack0xfffffffc);
  if (iVar2 == 0) {
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00c93660(&UNK_016ec78c);
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00a6fd50(&UNK_0170cf44);
    thunk_FUN_00c93610(&UNK_016ec474);
    thunk_FUN_00c93660(&UNK_016ec434);
    thunk_FUN_00c93660(&UNK_0170cee8);
    thunk_FUN_00c94580(0xffff);
    thunk_FUN_00c93660(&UNK_016ec434);
    if (DAT_01923aed == '\0') {
      iVar2 = thunk_FUN_00c93390();
      if (iVar2 == 0) {
        DebugBreak();
      }
      else if (iVar2 == 2) {
        DAT_01923aed = '\x01';
      }
    }
  }
  uVar3 = thunk_FUN_00c971c0(&UNK_016ec4a0);
  thunk_FUN_01550c70(iStack_14 + 0x18,uVar3);
  uVar3 = thunk_FUN_00a6dff0(iStack_14 + 0x18);
  *(undefined4 *)(iStack_14 + 0x14) = uVar3;
  for (iStack_18 = 0; *(char *)(iStack_14 + iStack_18 + 0x18) != '\0'; iStack_18 = iStack_18 + 1) {
    *(undefined1 *)(iStack_14 + iStack_18 + 0x58) = *(undefined1 *)(iStack_14 + iStack_18 + 0x18);
    if (('`' < *(char *)(iStack_14 + iStack_18 + 0x58)) &&
       (*(char *)(iStack_14 + iStack_18 + 0x58) < '{')) {
      *(char *)(iStack_14 + iStack_18 + 0x58) = *(char *)(iStack_14 + iStack_18 + 0x58) + -0x20;
    }
  }
  *(undefined1 *)(iStack_14 + iStack_18 + 0x58) = 0;
  uVar3 = thunk_FUN_00c971c0(&UNK_0170cedc,&UNK_016ec6d4);
  uVar1 = thunk_FUN_00b730a0(uVar3);
  *(undefined1 *)(iStack_14 + 0x98) = uVar1;
  uVar3 = thunk_FUN_00c971c0(&UNK_0170ced0,&UNK_016ec6d4);
  uVar1 = thunk_FUN_00b730a0(uVar3);
  *(undefined1 *)(iStack_14 + 0x99) = uVar1;
  uVar3 = thunk_FUN_00c971c0(&UNK_01707360);
  thunk_FUN_00b72910(iStack_14 + 0xac,uVar3);
  uVar3 = thunk_FUN_00c971c0(&UNK_0170cecc);
  uVar3 = thunk_FUN_00b72520(auStack_e4,uVar3);
  uStack_8 = 0;
  thunk_FUN_00a9a820(uVar3);
  uStack_8 = 0xffffffff;
  thunk_FUN_00a9a7c0();
  uVar3 = thunk_FUN_00c971c0(&UNK_0170cec4);
  uVar3 = thunk_FUN_00b72520(auStack_e0,uVar3);
  uStack_8 = 1;
  thunk_FUN_00a9a820(uVar3);
  uStack_8 = 0xffffffff;
  thunk_FUN_00a9a7c0();
  *(undefined4 *)(iStack_14 + 0xa8) = 0;
  iStack_1c = thunk_FUN_00b80560();
  while (iStack_1c != 0) {
    uVar3 = thunk_FUN_00b80500();
    iVar2 = thunk_FUN_015523b0(&UNK_0170ceb4,uVar3);
    if (iVar2 == 0) {
      iStack_d8 = thunk_FUN_00c8c9a0(0xc4);
      uStack_8 = 2;
      if (iStack_d8 == 0) {
        iStack_e8 = 0;
      }
      else {
        iStack_e8 = thunk_FUN_00b7f5c0();
      }
      uStack_dc = iStack_e8;
      uStack_8 = 0xffffffff;
      *(int *)(iStack_14 + 0x9c) = iStack_e8;
      thunk_FUN_00b7e340(iStack_1c);
      *(undefined1 *)(iStack_14 + 0x98) = 1;
    }
    else {
      uVar3 = thunk_FUN_00b80500();
      iVar2 = thunk_FUN_015523b0(&UNK_0170ceac,uVar3);
      if (iVar2 == 0) {
        if (*(int *)(iStack_14 + 0xbc) == 0) {
          iStack_d0 = thunk_FUN_
/* ...截断... */
```

## FUN_00c622c0 — 00c622c0
命中: blade@0171e36c(imm), blade@0171e394(imm), bomb@016f2c34(imm), bomb@016fca74(imm)

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

## FUN_0163ab10 — 0163ab10
命中: bomb@016f2b88(imm)

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_0163ab10(void)

{
  _DAT_018befe0 = thunk_FUN_00a6dff0(&UNK_016f2b88);
  return;
}


```

## FUN_0163abd0 — 0163abd0
命中: bomb@016f2bd4(imm)

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_0163abd0(void)

{
  _DAT_018beff4 = thunk_FUN_00a6dff0(&UNK_016f2bd4);
  return;
}


```

## FUN_0163ac90 — 0163ac90
命中: bomb@016f2c14(imm)

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_0163ac90(void)

{
  _DAT_018bf004 = thunk_FUN_00a6dff0(&UNK_016f2c14);
  return;
}


```

## FUN_00ae2470 — 00ae2470
命中: bomb@016fca74(imm)

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00ae2470(float param_1,char param_2)

{
  double dVar1;
  float fVar2;
  char cVar3;
  int iVar4;
  int *piVar5;
  undefined4 uVar6;
  bool bVar7;
  float10 fVar8;
  undefined4 uStack_128;
  undefined4 uStack_124;
  undefined1 auStack_120 [24];
  undefined4 uStack_108;
  undefined *puStack_104;
  undefined *puStack_100;
  undefined *puStack_fc;
  undefined *puStack_f8;
  float fStack_f4;
  float fStack_f0;
  float fStack_ec;
  uint uStack_e8;
  undefined *puStack_e4;
  float fStack_e0;
  float fStack_dc;
  undefined1 *puStack_d8;
  undefined4 uStack_d4;
  undefined4 uStack_d0;
  undefined1 *puStack_cc;
  int iStack_c8;
  undefined *puStack_c4;
  uint uStack_c0;
  float fStack_ac;
  float fStack_a4;
  float fStack_a0;
  undefined1 auStack_9c [8];
  undefined1 *puStack_94;
  undefined1 *puStack_88;
  float fStack_3c;
  float fStack_38;
  float fStack_34;
  int iStack_30;
  float fStack_2c;
  float fStack_28;
  float fStack_24;
  float fStack_20;
  float fStack_1c;
  int iStack_18;
  float fStack_14;
  void *pvStack_10;
  undefined *puStack_c;
  undefined4 uStack_8;
  
  uStack_8 = 0xffffffff;
  puStack_c = &UNK_0160b0ee;
  pvStack_10 = ExceptionList;
  uStack_c0 = _DAT_018bcc60 ^ (uint)&stack0xfffffffc;
  ExceptionList = &pvStack_10;
  puStack_c4 = &UNK_016fcc74;
  iStack_c8 = 0xae24a5;
  thunk_FUN_00ae1380();
  if (_DAT_018c4920 != 0) {
    puStack_c4 = (undefined *)0x0;
    iStack_c8 = _DAT_018c4920;
    puStack_cc = (undefined1 *)0xae24c4;
    thunk_FUN_00be76a0();
    _DAT_018c4920 = 0;
  }
  if (DAT_018c490a != '\0') {
    _DAT_018c491c = _DAT_018c491c - param_1;
    DAT_018c490a = (float)_DAT_016ec7e0 < _DAT_018c491c;
  }
  fVar2 = _DAT_018c4928;
  if ((float)_DAT_016ec7e0 < _DAT_018c4928) {
    fStack_14 = _DAT_018c4928;
    fVar2 = _DAT_018c4928 - param_1;
    if (fVar2 < (float)_DAT_016f2038 != (fVar2 == (float)_DAT_016f2038)) {
      bVar7 = (float)_DAT_016f2038 < _DAT_018c4928;
      _DAT_018c4928 = fVar2;
      if (bVar7) {
        switch(_DAT_018b522c) {
        case 10:
          puStack_c4 = &UNK_016fcc10;
          iStack_c8 = 0xae25b0;
          thunk_FUN_00f3a1d0();
          break;
        case 0xb:
          puStack_c4 = &UNK_016fcba8;
          iStack_c8 = 0xae25bf;
          thunk_FUN_00f3a1d0();
          break;
        case 0xc:
          puStack_c4 = &UNK_016fcb7c;
          iStack_c8 = 0xae25ce;
          cVar3 = thunk_FUN_00f3a1d0();
          if (cVar3 == '\0') {
            puStack_c4 = &UNK_016fcb54;
            iStack_c8 = 0xae25e2;
            thunk_FUN_00f3a1d0();
          }
          break;
        case 0xd:
          puStack_c4 = &UNK_016fcb2c;
          iStack_c8 = 0xae25f1;
          thunk_FUN_00f3a1d0();
          break;
        default:
          puStack_c4 = &UNK_016fcac8;
          iStack_c8 = 0xae2600;
          thunk_FUN_00f3a1d0();
        }
      }
      param_1 = 0.0;
      _DAT_0197f47c = 0.0;
      fVar2 = _DAT_018c4928;
    }
  }
  _DAT_018c4928 = fVar2;
  DAT_0197f4e1 = 0;
  DAT_0197f4e0 = 0;
  for (iStack_18 = 0; iStack_18 < 0x10; iStack_18 = iStack_18 + 1) {
    if (*(float *)(iStack_18 * 0xc + 0x197f50c) <= (float)_DAT_016ec7e0) {
      if (*(float *)(iStack_18 * 0xc + 0x197f50c) == 0.0) {
        *(undefined4 *)(iStack_18 * 0xc + 0x197f50c) = _DAT_016ee204;
      }
    }
    else {
      *(undefined4 *)(iStack_18 * 0xc + 0x197f50c) = 0;
    }
  }
  fStack_1c = param_1;
  puStack_c4 = (undefined *)param_1;
  iStack_c8 = 0xae269c;
  thunk_FUN_00ae3540();
  iStack_c8 = 0xae26a3;
  thunk_FUN_00f32220();
  iStack_c8 = 0x197f4e4;
  puStack_cc = auStack_9c;
  uStack_d0 = 0xae26b9;
  uStack_d0 = thunk_FUN_00af7320();
  uStack_8 = 0;
  uStack_d4 = 0xae26e3;
  thunk_FUN_00abb9a0();
  uStack_8 = 0xffffffff;
  uStack_d4 = 0xae26f5;
  thunk_FUN_00
/* ...截断... */
```

## FUN_00c49680 — 00c49680
命中: bomb@016fca74(imm)

```c

undefined1 FUN_00c49680(undefined4 param_1)

{
  int iVar1;
  
  iVar1 = thunk_FUN_015523b0(param_1,&UNK_016fca74);
  if (((iVar1 != 0) && (iVar1 = thunk_FUN_015523b0(param_1,&UNK_016f7b40), iVar1 != 0)) &&
     (iVar1 = thunk_FUN_015523b0(param_1,&UNK_01703c6c), iVar1 != 0)) {
    return 0;
  }
  return 1;
}


```

## FUN_00b0ae60 — 00b0ae60
命中: bandito@01700ddc(imm)

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __fastcall FUN_00b0ae60(int *param_1)

{
  longlong lVar1;
  char cVar2;
  int iVar3;
  int iVar4;
  int *piVar5;
  undefined4 uVar6;
  undefined1 auStack_3e4 [32];
  undefined4 uStack_3c4;
  undefined *puStack_3c0;
  code *pcStack_3bc;
  undefined1 auStack_3b8 [8];
  undefined4 uStack_3b0;
  undefined8 uStack_3ac;
  undefined *puStack_3a4;
  undefined *puStack_3a0;
  undefined8 uStack_39c;
  undefined *puStack_394;
  undefined4 *puStack_390;
  undefined *puStack_38c;
  undefined1 *puStack_388;
  undefined1 *puStack_384;
  undefined *puStack_380;
  undefined *puStack_37c;
  int *piStack_378;
  undefined1 *puStack_374;
  undefined *puStack_370;
  undefined1 *puStack_36c;
  undefined *puStack_368;
  undefined1 *puStack_364;
  undefined *puStack_360;
  uint uStack_35c;
  undefined *puStack_33c;
  undefined1 auStack_338 [40];
  undefined1 auStack_310 [40];
  undefined1 auStack_2e8 [40];
  undefined1 auStack_2c0 [40];
  undefined1 auStack_298 [40];
  undefined1 auStack_270 [40];
  undefined1 auStack_248 [40];
  undefined1 auStack_220 [40];
  undefined auStack_1f8 [40];
  undefined1 auStack_1d0 [40];
  undefined auStack_1a8 [40];
  undefined1 auStack_180 [40];
  undefined auStack_158 [40];
  undefined1 auStack_130 [40];
  undefined1 auStack_108 [40];
  undefined4 uStack_e0;
  undefined1 *puStack_dc;
  undefined1 *puStack_d8;
  undefined *puStack_94;
  undefined *puStack_90;
  int iStack_8c;
  int iStack_88;
  int iStack_84;
  undefined4 uStack_80;
  undefined4 uStack_7c;
  undefined4 uStack_78;
  int iStack_74;
  undefined1 auStack_70 [64];
  undefined *puStack_30;
  int iStack_2c;
  int iStack_28;
  int *piStack_24;
  int iStack_20;
  int iStack_1c;
  int *piStack_18;
  uint uStack_14;
  void *pvStack_10;
  undefined *puStack_c;
  undefined4 uStack_8;
  
  uStack_8 = 0xffffffff;
  puStack_c = &UNK_0160fb9b;
  pvStack_10 = ExceptionList;
  uStack_35c = _DAT_018bcc60 ^ (uint)&stack0xfffffffc;
  ExceptionList = &pvStack_10;
  DAT_0197f5e9 = 0;
  _DAT_0197f458 = 0x3f800000;
  *(undefined1 *)(param_1 + 0x30) = 0;
  *(undefined1 *)((int)param_1 + 0xc1) = 0;
  puStack_360 = (undefined *)0xb0aec1;
  piStack_18 = param_1;
  uStack_14 = uStack_35c;
  (**(code **)(*param_1 + 0xc))();
  puStack_360 = &UNK_01701028;
  puStack_364 = (undefined1 *)0xb0aed1;
  thunk_FUN_00c9f550();
  uStack_8 = 0;
  puStack_364 = auStack_338;
  puStack_368 = (undefined *)0xb0aeed;
  iStack_1c = thunk_FUN_00cabb70();
  uStack_8 = 0xffffffff;
  puStack_368 = (undefined *)0xb0af02;
  thunk_FUN_00c9f6a0();
  if (iStack_1c != 0) {
    if (_DAT_0197f448 == 1) {
      puStack_368 = (undefined *)0xb0af19;
      thunk_FUN_00b42ff0();
    }
    else {
      puStack_368 = (undefined *)0xb0af23;
      thunk_FUN_00a800b0();
    }
    puStack_368 = (undefined *)0x0;
    puStack_36c = (undefined1 *)0xb0af2d;
    thunk_FUN_00b0bbc0();
    puStack_36c = (undefined1 *)0x1;
    puStack_370 = (undefined *)0xb0af37;
    thunk_FUN_00b0bc20();
    puStack_370 = (undefined *)0x0;
    puStack_374 = (undefined1 *)0xb0af41;
    thunk_FUN_00b0bbf0();
  }
  puStack_368 = &UNK_01701000;
  puStack_36c = (undefined1 *)0xb0af51;
  thunk_FUN_00c9f550();
  uStack_8 = 1;
  puStack_36c = auStack_310;
  puStack_370 = (undefined *)0xb0af6d;
  iStack_20 = thunk_FUN_00cabb70();
  uStack_8 = 0xffffffff;
  puStack_370 = (undefined *)0xb0af82;
  thunk_FUN_00c9f6a0();
  if (iStack_20 != 0) {
    puStack_370 = (undefined *)0xb0af8d;
    puStack_370 = (undefined *)thunk_FUN_00c590a0();
    puStack_374 = (undefined1 *)0xb0af96;
    thunk_FUN_00abd9f0();
  }
  puStack_370 = &UNK_01700fd8;
  puStack_374 = (undefined1 *)0xb0afa6;
  thunk_FUN_00c9f550();
  uStack_8 = 2;
  puStack_374 = auStack_2e8;
  piStack_378 = (int *)0xb0afc2;
  piStack_24 = (int *)thunk_FUN_00cabb70();
  uStack_8
/* ...截断... */
```

## FUN_00c2beb0 — 00c2beb0
命中: achiev@01707330(imm)

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 * __thiscall
FUN_00c2beb0(undefined4 *param_1,undefined4 param_2,int param_3,undefined4 param_4,int param_5,
            int param_6)

{
  undefined1 uVar1;
  int iVar2;
  undefined4 uStack_d0;
  char *pcStack_1c;
  void *pvStack_10;
  undefined *puStack_c;
  undefined4 uStack_8;
  
  puStack_c = &UNK_0162dfa1;
  pvStack_10 = ExceptionList;
  ExceptionList = &pvStack_10;
  uStack_8 = 0;
  thunk_FUN_00be9a10();
  uStack_8._0_1_ = 1;
  *param_1 = &UNK_017189a4;
  param_1[0x66] = 0;
  param_1[99] = param_5;
  thunk_FUN_00a9a820();
  *(undefined1 *)((int)param_1 + 0x32) = 0;
  thunk_FUN_00c916e0();
  param_1[99] = param_5;
  param_1[0x20] = 0;
  param_1[0x21] = param_3;
  param_1[0xd] = 0x200;
  if (param_5 == 2) {
    thunk_FUN_00a83d00();
    uStack_8._0_1_ = 2;
    thunk_FUN_00a83c40();
    thunk_FUN_00b2c390();
    uStack_8._0_1_ = 1;
    thunk_FUN_00a7e630();
  }
  else if (param_5 == 1) {
    thunk_FUN_00a83d00();
    uStack_8._0_1_ = 3;
    thunk_FUN_00a83c40();
    thunk_FUN_00b2c360();
    uStack_8._0_1_ = 1;
    thunk_FUN_00a7e630();
  }
  thunk_FUN_00a83d00();
  uStack_8._0_1_ = 4;
  thunk_FUN_00a83c40();
  thunk_FUN_00c49330();
  uStack_8 = CONCAT31(uStack_8._1_3_,1);
  thunk_FUN_00a7e630();
  if (param_6 == 0) {
    *(undefined1 *)(param_1 + 0x42) = 0;
  }
  else {
    thunk_FUN_00c916e0();
  }
  if ((param_3 < 0) || (param_5 != 1)) {
    *(undefined1 *)(param_1 + 0x62) = 0;
  }
  else {
    thunk_FUN_00c916e0();
  }
  for (pcStack_1c = (char *)(param_1 + 0x22); *pcStack_1c != '\0'; pcStack_1c = pcStack_1c + 1) {
    if (('`' < *pcStack_1c) && (*pcStack_1c < '{')) {
      *pcStack_1c = *pcStack_1c + -0x20;
    }
  }
  if (param_5 == 0) {
    iVar2 = thunk_FUN_00c8c9a0();
    uStack_8._0_1_ = 5;
    if (iVar2 == 0) {
      uStack_d0 = 0;
    }
    else {
      uStack_d0 = thunk_FUN_00dc7970();
    }
    uStack_8._0_1_ = 1;
    param_1[0x65] = uStack_d0;
    thunk_FUN_00dc8e20();
    param_1[100] = 0;
  }
  else {
    iVar2 = thunk_FUN_00c8c9a0();
    uStack_8._0_1_ = 6;
    if (iVar2 == 0) {
      uStack_d0 = 0;
    }
    else {
      uStack_d0 = thunk_FUN_00dc7970();
    }
    uStack_8._0_1_ = 1;
    param_1[100] = uStack_d0;
    iVar2 = thunk_FUN_00c8c9a0();
    uStack_8._0_1_ = 7;
    if (iVar2 == 0) {
      uStack_d0 = 0;
    }
    else {
      uStack_d0 = thunk_FUN_00dc7970();
    }
    uStack_8._0_1_ = 1;
    uVar1 = (undefined1)uStack_8;
    uStack_8._0_1_ = 1;
    param_1[0x65] = uStack_d0;
    if ((param_3 < 0) || (param_5 != 1)) {
      uStack_8._0_1_ = uVar1;
      thunk_FUN_00dc8e20();
      thunk_FUN_00dc8e20();
    }
    else {
      thunk_FUN_00dc8e20();
      thunk_FUN_00a82a80();
      thunk_FUN_00dc8e20();
      iVar2 = thunk_FUN_00c8c9a0();
      uStack_8._0_1_ = 8;
      if (iVar2 == 0) {
        uStack_d0 = 0;
      }
      else {
        uStack_d0 = thunk_FUN_00dc7970();
      }
      uStack_8._0_1_ = 1;
      param_1[0x66] = uStack_d0;
      thunk_FUN_00dc8e20();
      thunk_FUN_00dc9d40();
      thunk_FUN_00a7a600();
      thunk_FUN_00dc98e0();
    }
  }
  thunk_FUN_00dc9d40();
  thunk_FUN_00a7a600();
  thunk_FUN_00dc98e0();
  thunk_FUN_00a7a600();
  thunk_FUN_00dc9430();
  thunk_FUN_00c63640();
  thunk_FUN_00a7a5a0();
  uStack_8._0_1_ = 9;
  thunk_FUN_00a833e0();
  uStack_8 = CONCAT31(uStack_8._1_3_,1);
  thunk_FUN_00a7a5e0();
  thunk_FUN_00a7a5a0();
  thunk_FUN_00dcbf20();
  if (param_1[100] != 0) {
    thunk_FUN_00dc9d40();
    thunk_FUN_00a7a600();
    thunk_FUN_00dc98e0();
    thunk_FUN_00a7a600();
    thunk_FUN_00dc9430();
    thunk_FUN_00a7a5a0((float)param_1[2] + _DAT_018b8950 + (float)_DAT_01718970,
                       (float)param_1[3] - _DAT_018b895c,0);
    thunk_FUN_00dcbf20();
  }
  if (param_1[0x66] != 0) {
    thunk_FUN_00a7a5
/* ...截断... */
```

## FUN_00c4a780 — 00c4a780
命中: achiev@01707330(imm)

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00c4a780(void)

{
  char cVar1;
  undefined4 uVar2;
  int iVar3;
  int *piVar4;
  undefined4 *puVar5;
  undefined4 *puVar6;
  undefined1 auStack_280 [8];
  undefined4 uStack_278;
  undefined4 uStack_260;
  undefined *puStack_25c;
  undefined4 uStack_258;
  undefined1 *puStack_254;
  undefined *puStack_250;
  undefined1 *puStack_24c;
  undefined *puStack_248;
  uint uStack_244;
  undefined4 *puStack_228;
  undefined1 auStack_224 [4];
  undefined1 auStack_220 [4];
  undefined1 *puStack_21c;
  undefined4 *puStack_210;
  int iStack_20c;
  int iStack_208;
  int iStack_204;
  undefined1 auStack_200 [4];
  undefined4 uStack_1fc;
  int iStack_1f8;
  int iStack_1f4;
  undefined4 uStack_1f0;
  undefined4 uStack_1ec;
  int iStack_1e8;
  undefined4 *puStack_1e4;
  undefined4 *puStack_1e0;
  undefined4 uStack_17c;
  undefined4 uStack_178;
  int iStack_174;
  int iStack_170;
  undefined1 auStack_16c [256];
  int iStack_6c;
  undefined4 uStack_68;
  undefined4 uStack_64;
  undefined4 uStack_60;
  undefined4 uStack_5c;
  undefined1 uStack_58;
  char cStack_57;
  char cStack_56;
  undefined1 uStack_55;
  undefined4 auStack_54 [5];
  char cStack_3e;
  char cStack_3d;
  uint uStack_38;
  int iStack_34;
  undefined4 uStack_30;
  char *pcStack_2c;
  int iStack_28;
  undefined4 uStack_24;
  char cStack_1d;
  undefined4 *puStack_1c;
  uint uStack_14;
  void *pvStack_10;
  undefined *puStack_c;
  undefined4 uStack_8;
  
  uStack_8 = 0xffffffff;
  puStack_c = &UNK_01630d68;
  pvStack_10 = ExceptionList;
  uStack_244 = _DAT_018bcc60 ^ (uint)&stack0xfffffffc;
  ExceptionList = &pvStack_10;
  puStack_248 = (undefined *)0xc4a7b9;
  uStack_14 = uStack_244;
  thunk_FUN_00c4f220();
  puStack_248 = &UNK_0171b868;
  puStack_24c = auStack_224;
  puStack_250 = (undefined *)0xc4a7ca;
  puStack_248 = (undefined *)thunk_FUN_00c598c0();
  uStack_8 = 0;
  puStack_24c = (undefined1 *)0xc4a7f7;
  thunk_FUN_00a9a820();
  uStack_8 = 0xffffffff;
  puStack_24c = (undefined1 *)0xc4a809;
  thunk_FUN_00a9a7c0();
  puStack_24c = (undefined1 *)0x197e920;
  puStack_250 = (undefined *)0xc4a818;
  thunk_FUN_00a9a820();
  puStack_250 = &UNK_0171b844;
  puStack_254 = auStack_220;
  uStack_258 = 0xc4a829;
  thunk_FUN_00dbc1d0();
  uStack_258 = 0xc4a830;
  uStack_258 = thunk_FUN_00dbc420();
  uStack_8 = 1;
  puStack_25c = (undefined *)0xc4a85a;
  thunk_FUN_00a9a820();
  uStack_8 = 0xffffffff;
  puStack_25c = (undefined *)0xc4a86c;
  thunk_FUN_00a9a7c0();
  puStack_25c = &UNK_00a3338e;
  uStack_260 = 0xc4a87c;
  uVar2 = thunk_FUN_00c4fbf0();
  uStack_8 = 2;
  puStack_21c = auStack_280;
  thunk_FUN_00c4fb30(uVar2);
  uStack_8._0_1_ = 3;
  thunk_FUN_00f26620();
  uStack_8 = CONCAT31(uStack_8._1_3_,2);
  thunk_FUN_00f24fb0();
  uStack_8 = 0xffffffff;
  thunk_FUN_00c4bc00();
  iStack_20c = thunk_FUN_00c8c9a0(0x48);
  uStack_8 = 4;
  if (iStack_20c == 0) {
    puStack_228 = (undefined4 *)0x0;
  }
  else {
    puStack_228 = (undefined4 *)thunk_FUN_00c98ca0(&UNK_0171b828);
  }
  puStack_210 = puStack_228;
  uStack_8 = 0xffffffff;
  puStack_1c = puStack_228;
  if (puStack_228 != (undefined4 *)0x0) {
    cStack_1d = thunk_FUN_00c98e40(0);
    if (cStack_1d != '\0') {
      uStack_24 = thunk_FUN_00a6ef60(&UNK_0171b80c);
      iStack_28 = thunk_FUN_00a6ef60(&UNK_01707330);
      while (iStack_28 != 0) {
        pcStack_2c = (char *)thunk_FUN_00c971c0(&UNK_016f18d4);
        if ((pcStack_2c == (char *)0x0) || (*pcStack_2c == '\0')) {
          thunk_FUN_00c93660(&UNK_016ec4b0);
          thunk_FUN_00c93660(&UNK_016ec78c);
          thunk_FUN_00c93660(&UNK_016ec4b0);
          thunk_FUN_00a6fd50(&UNK_016ec77c);
          thunk_FUN_00c93610(&UNK_016ec474);
          thunk_FUN_00c93660(&UNK_016ec434);
          thunk_FUN_00c93660(&UNK_0171b7b8);
          thunk_FUN_00c
/* ...截断... */
```

## FUN_00f0cdd0 — 00f0cdd0
命中: achiev@01707330(imm)

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00f0cdd0(undefined4 param_1,undefined4 *param_2,int param_3)

{
  char cVar1;
  undefined4 *puVar2;
  undefined4 uVar3;
  int iVar4;
  undefined4 extraout_EDX;
  int **ppiVar5;
  undefined8 uVar6;
  undefined8 uVar7;
  int *apiStack_6f8 [44];
  undefined1 auStack_648 [132];
  undefined1 auStack_5c4 [224];
  undefined1 auStack_4e4 [132];
  undefined1 auStack_460 [224];
  int iStack_380;
  undefined4 uStack_374;
  int *piStack_368;
  char cStack_359;
  undefined1 auStack_350 [20];
  undefined1 auStack_33c [23];
  char cStack_325;
  undefined1 auStack_31c [20];
  undefined1 auStack_308 [23];
  char cStack_2f1;
  undefined1 auStack_2e8 [20];
  undefined1 auStack_2d4 [23];
  char cStack_2bd;
  undefined1 auStack_2b4 [20];
  undefined1 auStack_2a0 [20];
  undefined4 *puStack_28c;
  undefined4 *puStack_280;
  uint uStack_274;
  undefined4 uStack_1a8;
  int iStack_19c;
  int iStack_140;
  undefined4 uStack_134;
  int iStack_128;
  undefined4 uStack_11c;
  int iStack_110;
  int iStack_b4;
  undefined4 uStack_a8;
  int iStack_9c;
  int iStack_40;
  int iStack_34;
  undefined4 uStack_28;
  undefined4 *puStack_1c;
  undefined4 uStack_10;
  uint uStack_8;
  
  ppiVar5 = apiStack_6f8;
  for (iVar4 = 0x1bd; iVar4 != 0; iVar4 = iVar4 + -1) {
    *ppiVar5 = (int *)0xcccccccc;
    ppiVar5 = ppiVar5 + 1;
  }
  uStack_8 = _DAT_018bcc60 ^ (uint)&stack0xfffffffc;
  uStack_274 = 0;
  uVar6 = thunk_FUN_00c8c9a0(0x48);
  iStack_380 = (int)uVar6;
  if (iStack_380 == 0) {
    apiStack_6f8[2] = (undefined4 *)0x0;
  }
  else {
    uVar7 = thunk_FUN_00c98ca0(param_1);
    uVar6 = CONCAT44((int)((ulonglong)uVar7 >> 0x20),iStack_380);
    apiStack_6f8[2] = (int *)uVar7;
  }
  iStack_380 = (int)uVar6;
  puStack_1c = apiStack_6f8[2];
  if (apiStack_6f8[2] != (undefined4 *)0x0) {
    cVar1 = thunk_FUN_00c98e40(0);
    if (cVar1 != '\0') {
      uStack_28 = thunk_FUN_00a6ef60(&UNK_0177edfc);
      iStack_34 = thunk_FUN_00a6ef60(&UNK_0177edec);
      iStack_40 = thunk_FUN_00a6ef60(&UNK_0177eddc);
      if (param_3 == 0) {
        iVar4 = thunk_FUN_00f10910();
        if (iVar4 == 0) {
          apiStack_6f8[0] = (int *)thunk_FUN_00a83260(&DAT_016f2a71);
          uStack_274 = uStack_274 | 4;
        }
        else {
          puVar2 = (undefined4 *)thunk_FUN_00f10960(0);
          apiStack_6f8[1] = (int *)*puVar2;
          (**(code **)(*apiStack_6f8[1] + 0xa0))();
          uVar3 = thunk_FUN_0155aeb0();
          apiStack_6f8[0] = (int *)thunk_FUN_00a83260(uVar3);
          uStack_274 = uStack_274 | 2;
        }
        piStack_368 = apiStack_6f8[0];
        apiStack_6f8[2] = (int *)thunk_FUN_00a98410(apiStack_6f8[0]);
        uStack_274 = uStack_274 | 8;
      }
      else {
        apiStack_6f8[2] = (int *)thunk_FUN_00a83260(param_3);
        uStack_274 = uStack_274 | 1;
      }
      uStack_374 = apiStack_6f8[2];
      thunk_FUN_00a98410(apiStack_6f8[2]);
      if ((uStack_274 & 8) != 0) {
        uStack_274 = uStack_274 & 0xfffffff7;
        thunk_FUN_00a78940();
      }
      if ((uStack_274 & 4) != 0) {
        uStack_274 = uStack_274 & 0xfffffffb;
        thunk_FUN_00a78940();
      }
      if ((uStack_274 & 2) != 0) {
        uStack_274 = uStack_274 & 0xfffffffd;
        thunk_FUN_00a78940();
      }
      if ((uStack_274 & 1) != 0) {
        uStack_274 = uStack_274 & 0xfffffffe;
        thunk_FUN_00a78940();
      }
      if (param_2 == (undefined4 *)0x0) {
        apiStack_6f8[2] = (int *)&DAT_016f2a71;
      }
      else {
        apiStack_6f8[2] = param_2;
      }
      thunk_FUN_00a83260(apiStack_6f8[2]);
      if (iStack_34 != 0) {
        iStack_9c = thunk_FUN_00a6ef60(&UNK_01707330);
        while (iStack_9c != 0) {
          uStack_a8 = thunk_FUN_00c971c0(&UNK_016f18d4);
          thunk_FUN_00a83260(uStack_a8);
          u
/* ...截断... */
```

## FUN_00bf8ed0 — 00bf8ed0
命中: UNHANDLED@01715b18(imm)

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
/* ...截断... */
```

## FUN_00ca6bb0 — 00ca6bb0
命中: UNHANDLED@01724760(imm)

```c

void FUN_00ca6bb0(undefined4 param_1)

{
  int iVar1;
  int *piVar2;
  int aiStack_d4 [50];
  undefined4 uStack_c;
  
  piVar2 = aiStack_d4;
  for (iVar1 = 0x34; iVar1 != 0; iVar1 = iVar1 + -1) {
    *piVar2 = -0x33333334;
    piVar2 = piVar2 + 1;
  }
  iVar1 = thunk_FUN_00ae0fe0();
  aiStack_d4[0] = iVar1 + -1;
  switch(iVar1) {
  case 1:
    thunk_FUN_00d1be60(param_1);
    break;
  case 2:
    thunk_FUN_00d1bed0(param_1);
    break;
  case 3:
    thunk_FUN_00d1bf50(param_1);
    break;
  case 4:
    thunk_FUN_00d1bfd0(param_1);
    break;
  case 5:
    thunk_FUN_00d1c050(param_1);
    break;
  case 6:
    thunk_FUN_00d1c0c0(param_1);
    break;
  case 7:
    thunk_FUN_00d1c140(param_1);
    break;
  case 8:
    thunk_FUN_00d1c1b0(param_1);
    break;
  default:
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00c93660(&UNK_016ec4a8);
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00a6fd50(&UNK_01724760);
    thunk_FUN_00c93610(&UNK_016ec474);
    thunk_FUN_00c93660(&UNK_016ec434);
    thunk_FUN_00c93660(&UNK_017246f0);
    thunk_FUN_00c94580(0xffff);
    thunk_FUN_00c93660(&UNK_016ec434);
    if (DAT_01980645 == '\0') {
      aiStack_d4[0] = thunk_FUN_00c93390();
      if (aiStack_d4[0] == 0) {
        DebugBreak();
        thunk_FUN_0155aeb0();
      }
      else if (aiStack_d4[0] == 2) {
        DAT_01980645 = '\x01';
      }
    }
    break;
  case 0xff:
    thunk_FUN_00c93610(&UNK_016ec4b0);
    thunk_FUN_00c93610(&UNK_016eead8);
    thunk_FUN_00c93610(&UNK_016ec4b0);
    thunk_FUN_00ad6730(&UNK_017247f0);
    thunk_FUN_00c93610(&UNK_016ec474);
    thunk_FUN_00c93610(&UNK_016ec434);
    thunk_FUN_00c93610(&UNK_01724780);
    thunk_FUN_00c94580(0xffff);
    thunk_FUN_00c93610(&UNK_016ec434);
  }
  uStack_c = 0xca6de1;
  thunk_FUN_0155aeb0();
  return;
}


```

## FUN_00ff99f0 — 00ff99f0
命中: UNHANDLED@01724760(imm)

```c

void FUN_00ff99f0(undefined4 param_1,undefined4 param_2,undefined4 param_3)

{
  char cVar1;
  undefined4 uVar2;
  int iVar3;
  int *piVar4;
  float10 fVar5;
  int aiStack_190 [5];
  undefined1 auStack_179 [9];
  undefined1 auStack_170 [48];
  undefined1 auStack_140 [20];
  undefined1 auStack_12c [16];
  float afStack_11c [3];
  undefined1 auStack_110 [20];
  undefined4 auStack_fc [3];
  undefined1 auStack_f0 [12];
  undefined4 auStack_e4 [51];
  int iStack_18;
  undefined4 uStack_c;
  
  piVar4 = aiStack_190;
  for (iVar3 = 99; iVar3 != 0; iVar3 = iVar3 + -1) {
    *piVar4 = -0x33333334;
    piVar4 = piVar4 + 1;
  }
  cVar1 = thunk_FUN_01171c50(param_1);
  if (cVar1 == '\0') {
    aiStack_190[2] = thunk_FUN_00a84e90();
    thunk_FUN_00aa6590(&UNK_01798518,aiStack_190 + 2);
    thunk_FUN_00c93610(&UNK_016ec474);
  }
  else {
    cVar1 = thunk_FUN_00ca6370();
    if ((cVar1 == '\0') && (cVar1 = thunk_FUN_00ca32f0(0), cVar1 == '~')) {
      thunk_FUN_00ad6730(&UNK_017984c0);
      thunk_FUN_00c93610(&UNK_016ec474);
      thunk_FUN_00ffa090(param_1,param_3);
    }
    else {
      iStack_18 = thunk_FUN_01171db0(param_1);
      aiStack_190[0] = iStack_18 + -1;
      switch(iStack_18) {
      case 1:
        uVar2 = thunk_FUN_00a84e90();
        auStack_179[0] = thunk_FUN_00ee42e0(uVar2);
        thunk_FUN_00e4d5d0(param_1,auStack_179,param_3);
        break;
      case 2:
        uVar2 = thunk_FUN_00a84e90(param_3);
        uVar2 = thunk_FUN_00ee4fb0(auStack_170,uVar2);
        thunk_FUN_0100ca70(param_1,uVar2);
        thunk_FUN_00c9f6a0();
        break;
      case 3:
        uVar2 = thunk_FUN_00a84e90(param_3);
        uVar2 = thunk_FUN_00ee4870(auStack_140,uVar2);
        thunk_FUN_0100cd00(param_1,uVar2);
        thunk_FUN_00a7a5e0();
        break;
      case 4:
        uVar2 = thunk_FUN_00a84e90(param_3);
        uVar2 = thunk_FUN_00ee4b30(auStack_12c,uVar2);
        thunk_FUN_0100cf90(param_1,uVar2);
        thunk_FUN_00a7a800();
        break;
      case 5:
        uVar2 = thunk_FUN_00a84e90();
        fVar5 = (float10)thunk_FUN_00ee43e0(uVar2);
        afStack_11c[0] = (float)fVar5;
        thunk_FUN_00e4d860(param_1,afStack_11c,param_3);
        break;
      case 6:
        uVar2 = thunk_FUN_00a84e90(param_3);
        uVar2 = thunk_FUN_00ee5070(auStack_110,uVar2);
        thunk_FUN_0100d220(param_1,uVar2);
        thunk_FUN_00af7bf0();
        break;
      case 7:
        uVar2 = thunk_FUN_00a84e90();
        auStack_fc[0] = thunk_FUN_00ee4570(uVar2);
        thunk_FUN_0100d4b0(param_1,auStack_fc,param_3);
        break;
      case 8:
        uVar2 = thunk_FUN_00a84e90(param_3);
        uVar2 = thunk_FUN_00ee4d90(auStack_f0,uVar2);
        thunk_FUN_0100d740(param_1,uVar2);
        thunk_FUN_00a7a7e0();
        break;
      default:
        thunk_FUN_00c93660(&UNK_016ec4b0);
        thunk_FUN_00c93660(&UNK_016ec4a8);
        thunk_FUN_00c93660(&UNK_016ec4b0);
        thunk_FUN_00a6fd50(&UNK_01724760);
        thunk_FUN_00c93610(&UNK_016ec474);
        thunk_FUN_00c93660(&UNK_016ec434);
        thunk_FUN_00c93660(&UNK_01798380);
        thunk_FUN_00c94580(0xffff);
        thunk_FUN_00c93660(&UNK_016ec434);
        if (DAT_01994f07 == '\0') {
          aiStack_190[0] = thunk_FUN_00c93390();
          if (aiStack_190[0] == 0) {
            DebugBreak();
            thunk_FUN_0155aeb0();
          }
          else if (aiStack_190[0] == 2) {
            DAT_01994f07 = '\x01';
          }
        }
        break;
      case 0xff:
        thunk_FUN_00c93610(&UNK_016ec4b0);
        thunk_FUN_00c93610(&UNK_016eead8);
        thunk_FUN_00c93610(&UNK_016ec4b0);
        auStack_e4[0] = thunk_FUN_00a84e90();
        thunk_FUN_00aa6590(&UNK_01798490,auStack_e4);
        thunk_FUN_00c93610(&UNK_016ec474);
        thunk_FUN_00c93610(&UNK_016ec434);
        thunk_FUN_00c93610(&UNK_01798408);
        thunk_FUN_00c94580
/* ...截断... */
```

## FUN_00ffa8a0 — 00ffa8a0
命中: UNHANDLED@01724760(imm)

```c

void FUN_00ffa8a0(undefined4 param_1,undefined4 param_2,undefined4 param_3)

{
  char cVar1;
  undefined1 *puVar2;
  undefined4 *puVar3;
  undefined4 uVar4;
  int iVar5;
  undefined4 extraout_ECX;
  int *piVar6;
  int aiStack_134 [20];
  undefined4 auStack_e4 [51];
  int iStack_18;
  undefined4 uStack_10;
  
  piVar6 = aiStack_134;
  for (iVar5 = 0x4c; iVar5 != 0; iVar5 = iVar5 + -1) {
    *piVar6 = -0x33333334;
    piVar6 = piVar6 + 1;
  }
  cVar1 = thunk_FUN_01171c50(param_2);
  if (cVar1 == '\0') {
    aiStack_134[2] = thunk_FUN_00a84e90();
    thunk_FUN_00aa6590(&UNK_01798518,aiStack_134 + 2);
    thunk_FUN_00c93610(&UNK_016ec474);
    thunk_FUN_00c9f630(0x198060c);
    goto LAB_00ffac4d;
  }
  iStack_18 = thunk_FUN_01171db0(param_2);
  aiStack_134[0] = iStack_18 + -1;
  switch(iStack_18) {
  case 1:
    puVar2 = (undefined1 *)thunk_FUN_0100e5d0(param_2,param_3);
    thunk_FUN_00ee4360(param_1,*puVar2);
    break;
  case 2:
    uVar4 = thunk_FUN_0100e680(param_2,param_3);
    thunk_FUN_00c9f630(uVar4);
    thunk_FUN_00ee5010(param_1);
    break;
  case 3:
    uVar4 = thunk_FUN_0100e730(param_2,param_3);
    thunk_FUN_00a83390(uVar4);
    thunk_FUN_00ee4990(param_1);
    break;
  case 4:
    uVar4 = thunk_FUN_0100e7e0(param_2,param_3);
    thunk_FUN_00ac9660(uVar4);
    thunk_FUN_00ee4c30(param_1);
    break;
  case 5:
    puVar3 = (undefined4 *)thunk_FUN_0100e890(param_2,param_3);
    thunk_FUN_00ee44a0(param_1,*puVar3);
    break;
  case 6:
    uVar4 = thunk_FUN_0100e940(param_2,param_3);
    thunk_FUN_00b34780(uVar4);
    thunk_FUN_00ee5190(param_1);
    break;
  case 7:
    puVar3 = (undefined4 *)thunk_FUN_0100e9f0(param_2,param_3);
    thunk_FUN_00ee4630(param_1,*puVar3);
    break;
  case 8:
    uVar4 = thunk_FUN_0100eaa0(param_2,param_3);
    thunk_FUN_00a92c00(uVar4,extraout_ECX);
    thunk_FUN_00ee4ec0(param_1);
    break;
  default:
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00c93660(&UNK_016ec4a8);
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00a6fd50(&UNK_01724760);
    thunk_FUN_00c93610(&UNK_016ec474);
    thunk_FUN_00c93660(&UNK_016ec434);
    thunk_FUN_00c93660(&UNK_01798720);
    thunk_FUN_00c94580(0xffff);
    thunk_FUN_00c93660(&UNK_016ec434);
    if (DAT_01994f0a == '\0') {
      aiStack_134[0] = thunk_FUN_00c93390();
      if (aiStack_134[0] == 0) {
        DebugBreak();
        thunk_FUN_0155aeb0();
      }
      else if (aiStack_134[0] == 2) {
        DAT_01994f0a = '\x01';
      }
    }
    goto LAB_00ffac3d;
  case 0xff:
    thunk_FUN_00c93610(&UNK_016ec4b0);
    thunk_FUN_00c93610(&UNK_016eead8);
    thunk_FUN_00c93610(&UNK_016ec4b0);
    auStack_e4[0] = thunk_FUN_00a84e90();
    thunk_FUN_00aa6590(&UNK_01798490,auStack_e4);
    thunk_FUN_00c93610(&UNK_016ec474);
    thunk_FUN_00c93610(&UNK_016ec434);
    thunk_FUN_00c93610(&UNK_017987a8);
    thunk_FUN_00c94580(0xffff);
    thunk_FUN_00c93610(&UNK_016ec434);
LAB_00ffac3d:
    thunk_FUN_00c9f630(0x198060c);
  }
LAB_00ffac4d:
  uStack_10 = 0xffac5d;
  thunk_FUN_0155aeb0();
  return;
}


```

## FUN_00ffb720 — 00ffb720
命中: UNHANDLED@01724760(imm)

```c

void FUN_00ffb720(undefined4 param_1,undefined4 param_2)

{
  char cVar1;
  int iVar2;
  int *piVar3;
  int aiStack_ec [53];
  int iStack_18;
  undefined4 uStack_c;
  
  piVar3 = aiStack_ec;
  for (iVar2 = 0x3a; iVar2 != 0; iVar2 = iVar2 + -1) {
    *piVar3 = -0x33333334;
    piVar3 = piVar3 + 1;
  }
  cVar1 = thunk_FUN_01171c50(param_1);
  if ((cVar1 != '\0') && (cVar1 = thunk_FUN_00ffa5d0(param_1), cVar1 != '\0')) {
    iStack_18 = thunk_FUN_01171db0(param_1);
    aiStack_ec[0] = iStack_18 + -1;
    switch(iStack_18) {
    case 1:
      thunk_FUN_0100fef0(param_1,param_2);
      break;
    case 2:
      thunk_FUN_0100ff70(param_1,param_2);
      break;
    case 3:
      thunk_FUN_0100fff0(param_1,param_2);
      break;
    case 4:
      thunk_FUN_01010070(param_1,param_2);
      break;
    case 5:
      thunk_FUN_010100f0(param_1,param_2);
      break;
    case 6:
      thunk_FUN_01010170(param_1,param_2);
      break;
    case 7:
      thunk_FUN_010101f0(param_1,param_2);
      break;
    case 8:
      thunk_FUN_01010270(param_1,param_2);
      break;
    default:
      thunk_FUN_00c93660(&UNK_016ec4b0);
      thunk_FUN_00c93660(&UNK_016ec4a8);
      thunk_FUN_00c93660(&UNK_016ec4b0);
      thunk_FUN_00a6fd50(&UNK_01724760);
      thunk_FUN_00c93610(&UNK_016ec474);
      thunk_FUN_00c93660(&UNK_016ec434);
      thunk_FUN_00c93660(&UNK_017989f0);
      thunk_FUN_00c94580(0xffff);
      thunk_FUN_00c93660(&UNK_016ec434);
      if (DAT_01994f0c == '\0') {
        aiStack_ec[0] = thunk_FUN_00c93390();
        if (aiStack_ec[0] == 0) {
          DebugBreak();
          thunk_FUN_0155aeb0();
        }
        else if (aiStack_ec[0] == 2) {
          DAT_01994f0c = '\x01';
        }
      }
      break;
    case 0xff:
      thunk_FUN_00c93610(&UNK_016ec4b0);
      thunk_FUN_00c93610(&UNK_016eead8);
      thunk_FUN_00c93610(&UNK_016ec4b0);
      aiStack_ec[2] = thunk_FUN_00a84e90();
      thunk_FUN_00aa6590(&UNK_01798490,aiStack_ec + 2);
      thunk_FUN_00c93610(&UNK_016ec474);
      thunk_FUN_00c93610(&UNK_016ec434);
      thunk_FUN_00c93610(&UNK_01798a78);
      thunk_FUN_00c94580(0xffff);
      thunk_FUN_00c93610(&UNK_016ec434);
    }
  }
  uStack_c = 0xffb9e7;
  thunk_FUN_0155aeb0();
  return;
}


```

## FUN_00ee70b0 — 00ee70b0
命中: UNHANDLED@0177c87c(imm)

```c

void FUN_00ee70b0(undefined4 param_1)

{
  char cVar1;
  int iVar2;
  undefined4 extraout_EDX;
  uint *puVar3;
  ulonglong uVar4;
  uint auStack_128 [2];
  undefined1 auStack_120 [240];
  int iStack_30;
  undefined4 uStack_24;
  undefined4 auStack_18 [2];
  undefined4 uStack_10;
  
  puVar3 = auStack_128;
  for (iVar2 = 0x49; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar3 = 0xcccccccc;
    puVar3 = puVar3 + 1;
  }
  auStack_18[0] = thunk_FUN_00c971c0(&UNK_016ec4a0);
  uVar4 = thunk_FUN_00ee7590(auStack_18[0]);
  if ((uVar4 & 0xff) != 0) {
    uStack_24 = thunk_FUN_00c971c0(&UNK_016ec4f0);
    cVar1 = thunk_FUN_00e004c0(uStack_24);
    if (cVar1 == '\0') {
      thunk_FUN_00c9f550(uStack_24);
      iStack_30 = thunk_FUN_00ee3770(auStack_120);
      thunk_FUN_00c9f6a0();
      auStack_128[0] = iStack_30 - 1;
      switch(iStack_30) {
      case 1:
        uVar4 = thunk_FUN_00eec230(auStack_18[0],param_1);
        break;
      case 2:
        uVar4 = thunk_FUN_00eec7a0(auStack_18[0],param_1);
        break;
      case 3:
        uVar4 = thunk_FUN_00eecc50(auStack_18[0],param_1);
        break;
      case 4:
        uVar4 = thunk_FUN_00eed0f0(auStack_18[0],param_1);
        break;
      case 5:
        uVar4 = thunk_FUN_00eed590(auStack_18[0],param_1);
        break;
      case 6:
        uVar4 = thunk_FUN_00eeda00(auStack_18[0],param_1);
        break;
      case 7:
        uVar4 = thunk_FUN_00eedea0(auStack_18[0],param_1);
        break;
      case 8:
        uVar4 = thunk_FUN_00eee310(auStack_18[0],param_1);
        break;
      default:
        thunk_FUN_00c93660(&UNK_016ec4b0);
        thunk_FUN_00c93660(&UNK_016ec4a8);
        thunk_FUN_00c93660(&UNK_016ec4b0);
        thunk_FUN_00a6fd50(&UNK_0177c87c);
        thunk_FUN_00c93610(&UNK_016ec474);
        thunk_FUN_00c93660(&UNK_016ec434);
        thunk_FUN_00c93660(&UNK_0177c800);
        thunk_FUN_00c94580(0xffff);
        thunk_FUN_00c93660(&UNK_016ec434);
        uVar4 = CONCAT44(extraout_EDX,(uint)DAT_01987b47);
        if (DAT_01987b47 == 0) {
          uVar4 = thunk_FUN_00c93390();
          auStack_128[0] = (uint)uVar4;
          if (auStack_128[0] == 0) {
            DebugBreak();
            uVar4 = thunk_FUN_0155aeb0();
          }
          else if (auStack_128[0] == 2) {
            DAT_01987b47 = 1;
          }
        }
        break;
      case 0xff:
        thunk_FUN_00ad6730(&UNK_0177c8a8);
        uVar4 = thunk_FUN_00c93610(&UNK_016ec474);
      }
    }
    else {
      thunk_FUN_00aa6590(&UNK_0177c8dc,auStack_18);
      uVar4 = thunk_FUN_00c93610(&UNK_016ec474);
    }
  }
  thunk_FUN_0155aee0(uVar4);
  uStack_10 = 0xee734c;
  thunk_FUN_0155aeb0();
  return;
}


```

## FUN_0116b880 — 0116b880
命中: UNHANDLED@0177c87c(imm)

```c

void FUN_0116b880(undefined4 param_1,undefined1 param_2)

{
  char cVar1;
  char *pcVar2;
  undefined4 uVar3;
  uint uVar4;
  int iVar5;
  undefined4 extraout_EDX;
  undefined4 extraout_EDX_00;
  int *piVar6;
  bool bVar7;
  undefined8 uVar8;
  undefined8 uVar9;
  int aiStack_9c0 [2];
  byte bStack_9b6;
  byte bStack_9b5;
  byte *pbStack_9b4;
  byte *pbStack_9b0;
  undefined1 auStack_9a8 [48];
  int iStack_978;
  char cStack_969;
  undefined1 auStack_960 [48];
  undefined4 auStack_930 [3];
  undefined1 auStack_924 [720];
  undefined1 auStack_654 [112];
  undefined1 auStack_5e4 [48];
  undefined4 auStack_5b4 [155];
  undefined1 auStack_348 [76];
  undefined1 auStack_2fc [48];
  undefined1 auStack_2cc [240];
  int iStack_1dc;
  undefined1 auStack_1d0 [68];
  int iStack_18c;
  int iStack_180;
  int iStack_174;
  undefined4 uStack_168;
  int iStack_15c;
  undefined1 auStack_150 [48];
  int iStack_120;
  int iStack_114;
  undefined4 uStack_108;
  int iStack_fc;
  undefined4 uStack_f0;
  undefined4 uStack_e4;
  undefined4 uStack_d8;
  undefined1 auStack_cc [48];
  int iStack_9c;
  int iStack_90;
  undefined4 uStack_84;
  undefined4 auStack_78 [3];
  byte *pbStack_6c;
  undefined4 uStack_60;
  char *pcStack_54;
  undefined4 uStack_48;
  int iStack_3c;
  undefined4 uStack_30;
  undefined4 uStack_24;
  undefined4 uStack_18;
  undefined4 uStack_10;
  int iStack_c;
  
  piVar6 = aiStack_9c0;
  for (iVar5 = 0x26f; iVar5 != 0; iVar5 = iVar5 + -1) {
    *piVar6 = -0x33333334;
    piVar6 = piVar6 + 1;
  }
  thunk_FUN_00ae1f40(param_2);
  iVar5 = thunk_FUN_00c3c350();
  if (iVar5 != 1) {
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00c93660(&UNK_016ec78c);
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00a6fd50(&UNK_017c8050);
    thunk_FUN_00c93610(&UNK_016ec474);
    thunk_FUN_00c93660(&UNK_016ec434);
    thunk_FUN_00c93660(&UNK_017c7fc8);
    thunk_FUN_00c94580(0xffff);
    thunk_FUN_00c93660(&UNK_016ec434);
    if (DAT_019958c8 == '\0') {
      pbStack_9b0 = (byte *)thunk_FUN_00c93390();
      if (pbStack_9b0 == (byte *)0x0) {
        DebugBreak();
        thunk_FUN_0155aeb0();
      }
      else if (pbStack_9b0 == (byte *)0x2) {
        DAT_019958c8 = '\x01';
      }
    }
  }
  iVar5 = thunk_FUN_00b80500();
  if (iVar5 == 0) {
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00c93660(&UNK_016ec78c);
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00a6fd50(&UNK_017c7fb8);
    thunk_FUN_00c93610(&UNK_016ec474);
    thunk_FUN_00c93660(&UNK_016ec434);
    thunk_FUN_00c93660(&UNK_017c7f30);
    thunk_FUN_00c94580(0xffff);
    thunk_FUN_00c93660(&UNK_016ec434);
    if (DAT_019958c9 == '\0') {
      pbStack_9b0 = (byte *)thunk_FUN_00c93390();
      if (pbStack_9b0 == (byte *)0x0) {
        DebugBreak();
        thunk_FUN_0155aeb0();
      }
      else if (pbStack_9b0 == (byte *)0x2) {
        DAT_019958c9 = '\x01';
      }
    }
  }
  pcVar2 = (char *)thunk_FUN_00b80500();
  if (*pcVar2 == '\0') {
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00c93660(&UNK_016ec78c);
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00a6fd50(&UNK_017c7f18);
    thunk_FUN_00c93610(&UNK_016ec474);
    thunk_FUN_00c93660(&UNK_016ec434);
    thunk_FUN_00c93660(&UNK_017c7e90);
    thunk_FUN_00c94580(0xffff);
    thunk_FUN_00c93660(&UNK_016ec434);
    if (DAT_019958ca == '\0') {
      pbStack_9b0 = (byte *)thunk_FUN_00c93390();
      if (pbStack_9b0 == (byte *)0x0) {
        DebugBreak();
        thunk_FUN_0155aeb0();
      }
      else if (pbStack_9b0 == (byte *)0x2) {
        DAT_019958ca = '\x01';
      }
    }
  }
  pbStack_9b0 = &UNK_0175d924;
  pbStack_9b4 = (byte *)thunk_FUN_00b80500();
  do {
    bStack_9b5 = *pbStack_9b4;
    bVar7 = bStack_9b5 < *pbStack_9b0;
    if (bStack_9b5 != *pbStack_9b0) {
LAB_0116bb94:
      aiStack_9c0[1] = (1 - (uint)bVar7) - (uint)(bVar7 != 0);
      goto
/* ...截断... */
```

## FUN_011ae9d0 — 011ae9d0
命中: UNHANDLED@017cc240(imm)

```c

void FUN_011ae9d0(void)

{
  char cVar1;
  undefined4 uVar2;
  undefined4 *puVar3;
  int iVar4;
  int *piVar5;
  undefined8 uVar6;
  int aiStack_520 [2];
  char cStack_515;
  undefined1 auStack_50c [23];
  char cStack_4f5;
  undefined1 auStack_4ec [20];
  undefined1 auStack_4d8 [51];
  char cStack_4a5;
  undefined1 auStack_49c [23];
  char cStack_485;
  undefined1 auStack_47c [212];
  undefined1 auStack_3a8 [88];
  undefined1 auStack_350 [20];
  undefined1 auStack_33c [88];
  undefined1 auStack_2e4 [20];
  undefined1 auStack_2d0 [88];
  undefined1 auStack_278 [20];
  undefined1 auStack_264 [20];
  int iStack_250;
  undefined4 uStack_244;
  undefined1 auStack_238 [220];
  undefined1 auStack_15c [220];
  undefined1 auStack_80 [28];
  undefined1 auStack_64 [88];
  int *piStack_c;
  undefined4 uStack_8;
  
  piVar5 = aiStack_520;
  for (iVar4 = 0x147; iVar4 != 0; iVar4 = iVar4 + -1) {
    *piVar5 = -0x33333334;
    piVar5 = piVar5 + 1;
  }
  cVar1 = thunk_FUN_01172d70();
  if (cVar1 == '\x01') {
    uVar6 = 1;
  }
  else {
    thunk_FUN_00c96dc0(&UNK_017c79b0);
    uVar2 = thunk_FUN_00a84e90();
    thunk_FUN_00b624d0(&UNK_016ec4a0,uVar2);
    if (*piStack_c != 0) {
      if (*piStack_c == -1) {
        thunk_FUN_00b624d0(&UNK_01709cd4,&UNK_017205c0);
      }
      else {
        thunk_FUN_00b62510(&UNK_01709cd4,*piStack_c);
      }
    }
    iVar4 = thunk_FUN_00a84ec0();
    if (iVar4 != 0) {
      uVar2 = thunk_FUN_00a84e90();
      thunk_FUN_00b624d0(&UNK_017cc270,uVar2);
    }
    cVar1 = thunk_FUN_00ca7840();
    if (cVar1 != '\0') {
      thunk_FUN_00b624d0(&UNK_017cc260,&UNK_016ec6d4);
    }
    thunk_FUN_011b2300();
    thunk_FUN_010044a0(auStack_15c);
    thunk_FUN_01004500(auStack_238);
    while (cVar1 = thunk_FUN_01006bd0(auStack_238), cVar1 != '\0') {
      uStack_244 = thunk_FUN_011b2730();
      iStack_250 = thunk_FUN_011ae920();
      aiStack_520[0] = iStack_250 + -1;
      switch(aiStack_520[0]) {
      case 0:
        uVar2 = thunk_FUN_011b4d50();
        thunk_FUN_011b4db0(auStack_80,uVar2);
        break;
      case 1:
        uVar2 = thunk_FUN_011b5b90();
        thunk_FUN_011b5bf0(auStack_80,uVar2);
        break;
      case 2:
        uVar2 = thunk_FUN_011b5f80();
        thunk_FUN_011b5fe0(auStack_80,uVar2);
        break;
      case 3:
        uVar2 = thunk_FUN_011b6370();
        thunk_FUN_011b63d0(auStack_80,uVar2);
        break;
      case 4:
        uVar2 = thunk_FUN_011b6760();
        thunk_FUN_011b67c0(auStack_80,uVar2);
        break;
      case 5:
        uVar2 = thunk_FUN_011b6b50();
        thunk_FUN_011b6bb0(auStack_80,uVar2);
        break;
      case 6:
        uVar2 = thunk_FUN_011b6f40();
        thunk_FUN_011b6fa0(auStack_80,uVar2);
        break;
      case 7:
        uVar2 = thunk_FUN_011b7320();
        thunk_FUN_011b7380(auStack_80,uVar2);
        break;
      default:
        thunk_FUN_00c93660(&UNK_016ec4b0);
        thunk_FUN_00c93660(&UNK_016ec4a8);
        thunk_FUN_00c93660(&UNK_016ec4b0);
        thunk_FUN_00a6fd50(&UNK_017cc240);
        thunk_FUN_00c93610(&UNK_016ec474);
        thunk_FUN_00c93660(&UNK_016ec434);
        thunk_FUN_00c93660(&UNK_017cc1b8);
        thunk_FUN_00c94580(0xffff);
        thunk_FUN_00c93660(&UNK_016ec434);
        if (DAT_01995a24 == '\0') {
          aiStack_520[0] = thunk_FUN_00c93390();
          if (aiStack_520[0] == 0) {
            DebugBreak();
            thunk_FUN_0155aeb0();
          }
          else if (aiStack_520[0] == 2) {
            DAT_01995a24 = '\x01';
          }
        }
      }
      thunk_FUN_01006c40();
    }
    thunk_FUN_00ffeda0();
    thunk_FUN_00ffeda0();
    thunk_FUN_011b23d0(auStack_264);
    while( true ) {
      uVar2 = thunk_FUN_011b2440(auStack_50c);
      cStack_515 = thunk_FUN_011b2560(uVar2);
      thunk_FUN_011af320();
      if (cStack_515 == '\0') break;
      iVar4 = thun
/* ...截断... */
```

## FUN_011b17b0 — 011b17b0
命中: UNHANDLED@017ccbd8(imm)

```c

void __fastcall FUN_011b17b0(undefined4 *param_1)

{
  undefined1 uVar1;
  undefined4 uVar2;
  int iVar3;
  int *piVar4;
  float10 fVar5;
  undefined8 uVar6;
  int aiStack_304 [2];
  char cStack_2f9;
  undefined1 auStack_2f0 [220];
  undefined1 auStack_214 [23];
  char cStack_1fd;
  undefined1 auStack_1f4 [232];
  int iStack_10c;
  undefined4 uStack_100;
  undefined1 auStack_f4 [192];
  undefined4 uStack_34;
  undefined4 uStack_18;
  undefined4 *puStack_c;
  
  piVar4 = aiStack_304;
  for (iVar3 = 0xc0; iVar3 != 0; iVar3 = iVar3 + -1) {
    *piVar4 = -0x33333334;
    piVar4 = piVar4 + 1;
  }
  puStack_c = param_1;
  uStack_18 = thunk_FUN_00caec40(param_1 + 1,*param_1,param_1 + 0x15);
  uVar1 = thunk_FUN_00ca7840();
  thunk_FUN_011b1ca0(uVar1);
  thunk_FUN_010044a0(auStack_f4);
  while( true ) {
    uVar2 = thunk_FUN_01004500(auStack_2f0);
    cStack_2f9 = thunk_FUN_01006bd0(uVar2);
    thunk_FUN_00ffeda0();
    if (cStack_2f9 == '\0') break;
    uStack_100 = thunk_FUN_011b2730();
    iStack_10c = thunk_FUN_011ae920();
    aiStack_304[0] = iStack_10c + -1;
    switch(aiStack_304[0]) {
    case 0:
      uVar2 = thunk_FUN_011b4d50();
      thunk_FUN_011b7710(uStack_18,uVar2);
      break;
    case 1:
      uVar2 = thunk_FUN_011b5b90();
      thunk_FUN_011b78d0(uStack_18,uVar2);
      break;
    case 2:
      uVar2 = thunk_FUN_011b5f80();
      thunk_FUN_011b7ab0(uStack_18,uVar2);
      break;
    case 3:
      uVar2 = thunk_FUN_011b6370();
      thunk_FUN_011b7c90(uStack_18,uVar2);
      break;
    case 4:
      uVar2 = thunk_FUN_011b6760();
      thunk_FUN_011b7e70(uStack_18,uVar2);
      break;
    case 5:
      uVar2 = thunk_FUN_011b6b50();
      thunk_FUN_011b8030(uStack_18,uVar2);
      break;
    case 6:
      uVar2 = thunk_FUN_011b6f40();
      thunk_FUN_011b8210(uStack_18,uVar2);
      break;
    case 7:
      uVar2 = thunk_FUN_011b7320();
      thunk_FUN_011b83d0(uStack_18,uVar2);
      break;
    default:
      thunk_FUN_00c93660(&UNK_016ec4b0);
      thunk_FUN_00c93660(&UNK_016ec4a8);
      thunk_FUN_00c93660(&UNK_016ec4b0);
      thunk_FUN_00a6fd50(&UNK_017ccbd8);
      thunk_FUN_00c93610(&UNK_016ec474);
      thunk_FUN_00c93660(&UNK_016ec434);
      thunk_FUN_00c93660(&UNK_017ccb50);
      thunk_FUN_00c94580(0xffff);
      thunk_FUN_00c93660(&UNK_016ec434);
      if (DAT_01995a32 == '\0') {
        aiStack_304[0] = thunk_FUN_00c93390();
        if (aiStack_304[0] == 0) {
          DebugBreak();
          thunk_FUN_0155aeb0();
        }
        else if (aiStack_304[0] == 2) {
          DAT_01995a32 = '\x01';
        }
      }
    }
    thunk_FUN_01006c40();
  }
  thunk_FUN_00ffeda0();
  uVar2 = thunk_FUN_00ffcf70(auStack_214);
  thunk_FUN_00ff3600(uVar2);
  thunk_FUN_00ff3510();
  while( true ) {
    uVar2 = thunk_FUN_00ffcfe0(auStack_1f4);
    cStack_1fd = thunk_FUN_0109d640(uVar2);
    thunk_FUN_00ff3510();
    if (cStack_1fd == '\0') break;
    iVar3 = thunk_FUN_011b2830();
    thunk_FUN_011b2830(iVar3 + 4);
    fVar5 = (float10)thunk_FUN_01395d80();
    thunk_FUN_00cafab0(puStack_c + 1,(float)fVar5);
    thunk_FUN_01167ce0();
  }
  uVar6 = thunk_FUN_00ff3560();
  thunk_FUN_0155aee0(uVar6);
  uStack_34 = 0x11b1b45;
  thunk_FUN_0155aeb0();
  return;
}


```

