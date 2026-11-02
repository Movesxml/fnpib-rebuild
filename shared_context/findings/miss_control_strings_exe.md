# 字符串定位报告（立即数扫描）

- 程序: FruitNinjaPIB.exe
- 已定义函数: 129503
- 命中函数: 7，裸引用点(未纳入函数): 0

## FUN_00ab1bf0 — 00ab1bf0
命中: misscounters.cross@016f5aa8(imm)

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_00ab1bf0(undefined4 param_1,char param_2)

{
  char cVar1;
  int iVar2;
  undefined4 uVar3;
  undefined1 auStack_348 [16];
  undefined4 uStack_338;
  undefined1 *puStack_334;
  undefined1 *puStack_330;
  undefined1 *puStack_32c;
  undefined *puStack_328;
  undefined *puStack_324;
  undefined *puStack_320;
  uint uStack_31c;
  char cStack_304;
  undefined1 auStack_300 [36];
  undefined auStack_2dc [40];
  undefined auStack_2b4 [28];
  undefined auStack_298 [40];
  undefined auStack_270 [31];
  char cStack_251;
  undefined auStack_250 [40];
  undefined1 *puStack_228;
  undefined auStack_21c [40];
  undefined1 auStack_1f4 [12];
  undefined1 auStack_1e8 [43];
  char cStack_1bd;
  undefined1 auStack_1bc [40];
  undefined auStack_194 [40];
  uint uStack_16c;
  undefined1 auStack_128 [128];
  uint uStack_a8;
  int *piStack_a4;
  int iStack_a0;
  undefined1 auStack_9c [128];
  uint uStack_1c;
  undefined4 uStack_18;
  uint uStack_14;
  void *pvStack_10;
  undefined *puStack_c;
  undefined4 uStack_8;
  
  uStack_8 = 0xffffffff;
  puStack_c = &UNK_01606175;
  pvStack_10 = ExceptionList;
  uStack_31c = _DAT_018bcc60 ^ (uint)&stack0xfffffffc;
  ExceptionList = &pvStack_10;
  uStack_16c = 0;
  uStack_18 = param_1;
  uStack_14 = uStack_31c;
  if (param_2 == '\0') {
    piStack_a4 = (int *)0x0;
    for (uStack_a8 = 1; uStack_a8 < 4; uStack_a8 = uStack_a8 + 1) {
      puStack_320 = (undefined *)uStack_a8;
      puStack_324 = &UNK_016f5aa8;
      puStack_328 = auStack_128;
      puStack_32c = (undefined1 *)0xab1d4e;
      thunk_FUN_01552460();
      puStack_320 = auStack_128;
      puStack_324 = (undefined *)0xab1d63;
      thunk_FUN_00c9f550();
      uStack_8 = 1;
      puStack_324 = auStack_298;
      puStack_328 = (undefined *)0xab1d7f;
      piStack_a4 = (int *)thunk_FUN_00cabb70();
      uStack_8 = 0xffffffff;
      puStack_328 = (undefined *)0xab1d97;
      thunk_FUN_00c9f6a0();
      if (piStack_a4 != (int *)0x0) {
        puStack_320 = auStack_270;
        puStack_324 = (undefined *)0xab1db5;
        thunk_FUN_00c5a200();
        puStack_324 = (undefined *)0xab1dbc;
        thunk_FUN_00a82f80();
        puStack_324 = (undefined *)0xab1dc3;
        iVar2 = thunk_FUN_00a7aa00();
        if (iVar2 < (int)uStack_a8) {
          puStack_324 = (undefined *)0xab1fd8;
          thunk_FUN_00ab24f0();
          puStack_324 = (undefined *)0xab1fe3;
          cVar1 = thunk_FUN_00ab2250();
          if (cVar1 == '\0') {
            puStack_324 = (undefined *)0x1;
            puStack_328 = (undefined *)0xab1ff7;
            thunk_FUN_00a7ae50();
            puStack_328 = &UNK_016f5a9c;
            puStack_32c = (undefined1 *)0xab2007;
            thunk_FUN_00c9f550();
            uStack_8 = 7;
            puStack_32c = (undefined1 *)0x1;
            puStack_330 = auStack_1e8;
            puStack_334 = (undefined1 *)0xab202a;
            (**(code **)(*piStack_a4 + 0x34))();
            uStack_8 = 0xffffffff;
            puStack_334 = (undefined1 *)0xab203e;
            thunk_FUN_00c9f6a0();
          }
          else {
            puStack_324 = &UNK_016f5a8c;
            puStack_328 = (undefined *)0xab2053;
            thunk_FUN_00c9f550();
            uStack_8 = 8;
            puStack_328 = (undefined *)0x0;
            puStack_32c = auStack_1bc;
            puStack_330 = (undefined1 *)0xab206e;
            cVar1 = thunk_FUN_00cafbf0();
            cStack_1bd = '\x01' - (cVar1 != '\0');
            uStack_8 = 0xffffffff;
            puStack_330 = (undefined1 *)0xab2090;
            thunk_FUN_00c9f6a0();
            if (cStack_1bd != '\0') {
              puStack_320 = &UNK_016f5a8c;
              puStack_324 = (undefined *)0xab20ab;
              thunk_FUN_00c9f550();
              uStack_8 = 9;
              puStack_324 = (und
/* ...截断... */
```

## FUN_00b279c0 — 00b279c0
命中: misscounters.cross@01703d30(imm)

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __fastcall FUN_00b279c0(int param_1)

{
  undefined4 uVar1;
  float10 fVar2;
  undefined1 auStack_1b8 [40];
  undefined1 auStack_190 [40];
  undefined1 auStack_168 [52];
  undefined1 auStack_134 [40];
  undefined1 auStack_10c [104];
  undefined4 uStack_a4;
  undefined1 auStack_a0 [128];
  int iStack_20;
  int *piStack_1c;
  int iStack_18;
  uint uStack_14;
  void *pvStack_10;
  undefined *puStack_c;
  undefined4 uStack_8;
  
  uStack_8 = 0xffffffff;
  puStack_c = &UNK_01612952;
  pvStack_10 = ExceptionList;
  uStack_14 = _DAT_018bcc60 ^ (uint)&stack0xfffffffc;
  ExceptionList = &pvStack_10;
  *(undefined4 *)(param_1 + 0x4c) = 0;
  piStack_1c = (int *)0x0;
  iStack_18 = param_1;
  thunk_FUN_00c9f550(&UNK_01703cb4,uStack_14);
  uStack_8 = 0;
  piStack_1c = (int *)thunk_FUN_00cabb70(auStack_1b8);
  uStack_8 = 0xffffffff;
  thunk_FUN_00c9f6a0();
  for (iStack_20 = 0; iStack_20 < 3; iStack_20 = iStack_20 + 1) {
    thunk_FUN_01552460(auStack_a0,&UNK_01703d30,iStack_20 + 1);
    thunk_FUN_00c9f550(auStack_a0);
    uStack_8 = 1;
    piStack_1c = (int *)thunk_FUN_00cabb70(auStack_190);
    uStack_8 = 0xffffffff;
    thunk_FUN_00c9f6a0();
    if (piStack_1c != (int *)0x0) {
      thunk_FUN_00a7ae50(1);
      thunk_FUN_00c9f550(&UNK_01703d58);
      uStack_8 = 2;
      (**(code **)(*piStack_1c + 0x34))(auStack_168,1);
      uStack_8 = 0xffffffff;
      thunk_FUN_00c9f6a0();
      thunk_FUN_00ab24f0();
      fVar2 = (float10)thunk_FUN_00c63640(0);
      fVar2 = (float10)thunk_FUN_00c635b0((float)(fVar2 / (float10)_DAT_016f2008));
      uVar1 = thunk_FUN_00a7a5a0((float)(fVar2 / (float10)_DAT_016f2008));
      uStack_8 = 3;
      thunk_FUN_00a833e0(uVar1);
      uStack_8 = 0xffffffff;
      thunk_FUN_00a7a5e0();
    }
  }
  thunk_FUN_00c9f550(&UNK_01703ce8);
  uStack_8 = 4;
  piStack_1c = (int *)thunk_FUN_00cabb70(auStack_134);
  uStack_8 = 0xffffffff;
  thunk_FUN_00c9f6a0();
  if (piStack_1c != (int *)0x0) {
    uStack_a4 = thunk_FUN_00c590a0();
    thunk_FUN_00abd9f0(uStack_a4);
    thunk_FUN_00cafe80(1);
    thunk_FUN_00c9f550(&UNK_01703d4c);
    uStack_8 = 5;
    (**(code **)(*piStack_1c + 0x34))(auStack_10c,1);
    uStack_8 = 0xffffffff;
    thunk_FUN_00c9f6a0();
  }
  ExceptionList = pvStack_10;
  thunk_FUN_01550950();
  return;
}


```

## FUN_00c4a780 — 00c4a780
命中: isGameOver@0171b61c(imm)

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

## FUN_00b26630 — 00b26630
命中: game_over_real@01703ca0(imm)

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_00b26630(int param_1,float param_2)

{
  char cVar1;
  int iVar2;
  undefined4 uVar3;
  float10 fVar4;
  char cStack_21c;
  undefined1 auStack_210 [43];
  char cStack_1e5;
  undefined1 auStack_1e4 [40];
  undefined1 auStack_1bc [40];
  undefined1 auStack_194 [40];
  undefined1 auStack_16c [40];
  undefined1 auStack_144 [43];
  char cStack_119;
  undefined1 auStack_118 [40];
  undefined1 auStack_f0 [43];
  char cStack_c5;
  undefined1 auStack_c4 [40];
  undefined1 auStack_9c [40];
  uint uStack_74;
  undefined1 auStack_30 [8];
  int *piStack_28;
  undefined4 uStack_24;
  int *piStack_20;
  undefined4 uStack_1c;
  int iStack_18;
  int iStack_14;
  void *pvStack_10;
  undefined *puStack_c;
  undefined4 uStack_8;
  
  uStack_8 = 0xffffffff;
  puStack_c = &UNK_01612767;
  pvStack_10 = ExceptionList;
  uStack_74 = 0;
  if (*(int *)(param_1 + 4) == 0) {
    return;
  }
  ExceptionList = &pvStack_10;
  iStack_14 = param_1;
  thunk_FUN_00b25e10(param_2,_DAT_018bcc60 ^ (uint)&stack0xfffffffc);
  *(float *)(iStack_14 + 0x48) = *(float *)(iStack_14 + 0x48) + param_2;
  if (*(int *)(iStack_14 + 0x3c) != 0) {
    thunk_FUN_00b2a550();
    cVar1 = thunk_FUN_00b2a790();
    if ((cVar1 != '\0') && (*(int *)(iStack_14 + 0x3c) != 0)) {
      if (*(int *)(iStack_14 + 0x3c) != 0) {
        thunk_FUN_00b262a0(1);
      }
      *(undefined4 *)(iStack_14 + 0x3c) = 0;
    }
  }
  thunk_FUN_00b26d60();
  switch(*(undefined4 *)(iStack_14 + 0x44)) {
  case 0:
    thunk_FUN_00c9f550(&UNK_01703d18);
    uStack_8 = 0;
    iStack_18 = thunk_FUN_00cabb70(auStack_210);
    uStack_8 = 0xffffffff;
    thunk_FUN_00c9f6a0();
    if (iStack_18 == 0) {
LAB_00b267c0:
      cStack_21c = '\0';
    }
    else {
      thunk_FUN_00c9f550(&UNK_01703d10);
      uStack_8 = 1;
      uStack_74 = uStack_74 | 1;
      cVar1 = thunk_FUN_00cafbf0(auStack_1e4,1);
      if (cVar1 != '\0') goto LAB_00b267c0;
      cStack_21c = '\x01';
    }
    cStack_1e5 = cStack_21c;
    uStack_8 = 0xffffffff;
    if ((uStack_74 & 1) != 0) {
      uStack_74 = uStack_74 & 0xfffffffe;
      thunk_FUN_00c9f6a0();
    }
    if (cStack_1e5 != '\0') {
      thunk_FUN_00b27140();
    }
    break;
  case 1:
    if (*(int *)(iStack_14 + 4) != 0) {
      thunk_FUN_00c9f550(&UNK_01703d00);
      uStack_8 = 2;
      uStack_1c = thunk_FUN_00cabb70(auStack_1bc);
      uStack_8 = 0xffffffff;
      thunk_FUN_00c9f6a0();
      fVar4 = (float10)thunk_FUN_00b26d30();
      iVar2 = thunk_FUN_00c590a0();
      if ((double)iVar2 < (double)fVar4) {
        thunk_FUN_00c9f550(&UNK_01703ce8);
        uStack_8 = 3;
        piStack_20 = (int *)thunk_FUN_00cabb70(auStack_194);
        uStack_8 = 0xffffffff;
        thunk_FUN_00c9f6a0();
        if (piStack_20 != (int *)0x0) {
          thunk_FUN_00b26d30();
          uVar3 = thunk_FUN_01553d40();
          thunk_FUN_00abd9f0(uVar3);
        }
        if (*(char *)(iStack_14 + 0x10) == '\0') {
          if (piStack_20 != (int *)0x0) {
            thunk_FUN_00c9f550(&UNK_01703ce0);
            uStack_8 = 4;
            (**(code **)(*piStack_20 + 0x34))(auStack_16c,1);
            uStack_8 = 0xffffffff;
            thunk_FUN_00c9f6a0();
          }
          *(undefined1 *)(iStack_14 + 0x10) = 1;
        }
      }
    }
    if ((*(char *)(iStack_14 + 0x58) == '\0') && ((float)_DAT_016f32c0 < _DAT_0197fa10)) {
      uVar3 = thunk_FUN_00a6dff0(&UNK_01703ccc,1,0,1);
      thunk_FUN_00c37ff0(&UNK_01703ccc,uVar3);
      *(undefined1 *)(iStack_14 + 0x58) = 1;
    }
    if ((_DAT_0197fa9c == 2) || ((_DAT_0197fa9c != 1 && (2 < *(uint *)(iStack_14 + 0x14))))) {
      thunk_FUN_00b28420();
    }
    break;
  case 2:
    thunk_FUN_00c9f550(&UNK_01703cb4);
    uStack_8 = 7;
    piStack_28 = (int *)thunk_FUN_00cabb70(auStack_f0);
    uStack_8 = 0xffffffff;
/* ...截断... */
```

## FUN_00ab6e70 — 00ab6e70
命中: life_trigger@016f6b10(imm)

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __fastcall FUN_00ab6e70(int param_1)

{
  bool bVar1;
  void *pvVar2;
  char cVar3;
  uint uVar4;
  undefined4 uVar5;
  char cStack_214;
  undefined1 auStack_20c [40];
  undefined1 auStack_1e4 [43];
  char cStack_1b9;
  undefined1 auStack_1b8 [40];
  undefined1 auStack_190 [43];
  char cStack_165;
  undefined1 auStack_164 [40];
  undefined1 auStack_13c [40];
  undefined1 auStack_114 [28];
  undefined1 auStack_f8 [31];
  char cStack_d9;
  undefined1 auStack_d8 [40];
  undefined1 auStack_b0 [43];
  char cStack_85;
  undefined1 auStack_84 [40];
  uint uStack_5c;
  uint uStack_18;
  int iStack_14;
  void *pvStack_10;
  undefined *puStack_c;
  undefined4 uStack_8;
  
  pvVar2 = ExceptionList;
  uStack_8 = 0xffffffff;
  puStack_c = &UNK_01606a74;
  pvStack_10 = ExceptionList;
  uVar4 = _DAT_018bcc60 ^ (uint)&stack0xfffffffc;
  ExceptionList = &pvStack_10;
  uStack_5c = 0;
  *(float *)(param_1 + 0x20) = *(float *)(param_1 + 0x20) + (float)_DAT_016f5a68;
  iStack_14 = param_1;
  if (*(int *)(param_1 + 0x1c) != 0) {
    if (*(int *)(param_1 + 0x1c) != 2) {
      ExceptionList = pvVar2;
      return;
    }
    thunk_FUN_00c9f550(&UNK_016ef240,uVar4);
    uStack_8 = 8;
    cVar3 = thunk_FUN_00cafbf0(auStack_84,1);
    cStack_85 = '\x01' - (cVar3 != '\0');
    uStack_8 = 0xffffffff;
    thunk_FUN_00c9f6a0();
    if (cStack_85 == '\0') {
      ExceptionList = pvStack_10;
      return;
    }
    *(undefined4 *)(iStack_14 + 0x1c) = 3;
    ExceptionList = pvStack_10;
    return;
  }
  if (*(int *)(param_1 + 0x30) == 0) {
    if (*(int *)(param_1 + 0x24) != 0) {
      thunk_FUN_00c9f550(&UNK_016ef468,uVar4);
      uStack_8 = 0;
      uStack_5c = uStack_5c | 1;
      cVar3 = thunk_FUN_00cafbf0(auStack_20c,1);
      if (cVar3 != '\0') goto LAB_00ab6f37;
    }
    bVar1 = true;
  }
  else {
LAB_00ab6f37:
    bVar1 = false;
  }
  uStack_8 = 0xffffffff;
  if ((uStack_5c & 1) != 0) {
    uStack_5c = uStack_5c & 0xfffffffe;
    thunk_FUN_00c9f6a0();
  }
  if (bVar1) {
    (**(code **)(**(int **)(iStack_14 + 0x2c) + 0x9c))
              (*(int *)(iStack_14 + 0xc) - *(int *)(iStack_14 + 0x14) * *(int *)(iStack_14 + 0x18));
    thunk_FUN_00c9f550(&UNK_016f6b10);
    uStack_8 = 1;
    (**(code **)(**(int **)(iStack_14 + 4) + 0x34))(auStack_1e4,1);
    uStack_8 = 0xffffffff;
    thunk_FUN_00c9f6a0();
    *(undefined4 *)(iStack_14 + 0x20) = 0;
    *(undefined4 *)(iStack_14 + 0x30) = 1;
    thunk_FUN_00ae46f0(1,1);
  }
  if (*(int *)(iStack_14 + 0x30) == 1) {
    if (*(int *)(iStack_14 + 0x28) != 0) {
      thunk_FUN_00c9f550(&UNK_016f6b10,uVar4);
      uStack_8 = 2;
      uStack_5c = uStack_5c | 2;
      cVar3 = thunk_FUN_00cafbf0(auStack_1b8,1);
      if (cVar3 != '\0') goto LAB_00ab7064;
    }
    cStack_214 = '\x01';
  }
  else {
LAB_00ab7064:
    cStack_214 = '\0';
  }
  cStack_1b9 = cStack_214;
  uStack_8 = 0xffffffff;
  if ((uStack_5c & 2) != 0) {
    uStack_5c = uStack_5c & 0xfffffffd;
    thunk_FUN_00c9f6a0();
  }
  if (cStack_1b9 != '\0') {
    (**(code **)(**(int **)(iStack_14 + 0x2c) + 0x9c))(*(undefined4 *)(iStack_14 + 0xc));
    thunk_FUN_00c9f550(&UNK_016f40a4);
    uStack_8 = 3;
    (**(code **)(**(int **)(iStack_14 + 0x2c) + 0x34))(auStack_190,1);
    uStack_8 = 0xffffffff;
    thunk_FUN_00c9f6a0();
    *(undefined4 *)(iStack_14 + 0x20) = 0;
    *(undefined4 *)(iStack_14 + 0x30) = 2;
  }
  if (*(int *)(iStack_14 + 0x30) == 2) {
    thunk_FUN_00c9f550(&UNK_016f40a4);
    uStack_8 = 4;
    uStack_5c = uStack_5c | 4;
    cVar3 = thunk_FUN_00cafbf0(auStack_164,1);
    if (cVar3 != '\0') goto LAB_00ab7169;
    cStack_214 = '\x01';
  }
  else {
LAB_00ab7169:
    cStack_214 = '\0';
  }
  cStack_165 = cStack_214;
  uStack_8 = 0xffffffff;
  if ((uStack_5c & 4) != 0) {
    uStack_5c = uStack_5c & 0xfffffffb;
    thunk_FUN_0
/* ...截断... */
```

## FUN_00ab77f0 — 00ab77f0
命中: life_trigger@016f6b10(imm)

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_00ab77f0(int param_1,int param_2)

{
  int iVar1;
  uint uVar2;
  undefined1 auStack_144 [40];
  undefined1 auStack_11c [40];
  undefined1 auStack_f4 [40];
  undefined1 auStack_cc [40];
  undefined1 auStack_a4 [40];
  undefined1 auStack_7c [104];
  int iStack_14;
  void *pvStack_10;
  undefined *puStack_c;
  undefined4 uStack_8;
  
  uStack_8 = 0xffffffff;
  puStack_c = &UNK_01606b4f;
  pvStack_10 = ExceptionList;
  uVar2 = _DAT_018bcc60 ^ (uint)&stack0xfffffffc;
  ExceptionList = &pvStack_10;
  *(undefined4 *)(param_1 + 0xc) = *(undefined4 *)(param_2 + 0x1d4);
  *(undefined4 *)(param_1 + 0x10) = *(undefined4 *)(param_2 + 0x1d8);
  *(undefined4 *)(param_1 + 0x14) = *(undefined4 *)(param_2 + 0x1dc);
  *(undefined4 *)(param_1 + 0x18) = *(undefined4 *)(param_2 + 0x1e0);
  iStack_14 = param_1;
  thunk_FUN_00ab6a10(uVar2);
  *(undefined4 *)(iStack_14 + 0x1c) = *(undefined4 *)(param_2 + 0x1c8);
  *(undefined4 *)(iStack_14 + 0x30) = *(undefined4 *)(param_2 + 0x1cc);
  thunk_FUN_00ab7c30(*(undefined4 *)(param_2 + 0x1e4));
  if (*(int *)(iStack_14 + 0x1c) == 0) {
    iVar1 = *(int *)(iStack_14 + 0x30);
    if (iVar1 == 1) {
      thunk_FUN_00cafe80(1);
      (**(code **)(**(int **)(iStack_14 + 0x2c) + 0x9c))
                (*(int *)(iStack_14 + 0xc) - *(int *)(iStack_14 + 0x14) * *(int *)(iStack_14 + 0x18)
                );
      thunk_FUN_00c9f550(&UNK_016f6b10);
      uStack_8 = 0;
      (**(code **)(**(int **)(iStack_14 + 4) + 0x34))(auStack_144,1);
      uStack_8 = 0xffffffff;
      thunk_FUN_00c9f6a0();
    }
    else if (iVar1 == 2) {
      thunk_FUN_00cafe80(1);
      thunk_FUN_00c9f550(&UNK_016f6b38);
      uStack_8 = 1;
      (**(code **)(**(int **)(iStack_14 + 4) + 0x34))(auStack_11c,1);
      uStack_8 = 0xffffffff;
      thunk_FUN_00c9f6a0();
      (**(code **)(**(int **)(iStack_14 + 0x2c) + 0x9c))(*(undefined4 *)(iStack_14 + 0xc));
      thunk_FUN_00c9f550(&UNK_016f40a4);
      uStack_8 = 2;
      (**(code **)(**(int **)(iStack_14 + 0x2c) + 0x34))(auStack_f4,1);
      uStack_8 = 0xffffffff;
      thunk_FUN_00c9f6a0();
    }
    else if (iVar1 == 3) {
      thunk_FUN_00cafe80(1);
      thunk_FUN_00c9f550(&UNK_016f6b38);
      uStack_8 = 3;
      (**(code **)(**(int **)(iStack_14 + 4) + 0x34))(auStack_cc,1);
      uStack_8 = 0xffffffff;
      thunk_FUN_00c9f6a0();
      thunk_FUN_00c9f550(&UNK_016f6b00);
      uStack_8 = 4;
      (**(code **)(**(int **)(iStack_14 + 0x2c) + 0x34))(auStack_a4,1);
      uStack_8 = 0xffffffff;
      thunk_FUN_00c9f6a0();
    }
  }
  else if (*(int *)(iStack_14 + 0x1c) == 2) {
    thunk_FUN_00c9f550(&UNK_016ef240);
    uStack_8 = 5;
    (**(code **)(**(int **)(iStack_14 + 4) + 0x34))(auStack_7c,1);
    uStack_8 = 0xffffffff;
    thunk_FUN_00c9f6a0();
  }
  *(undefined4 *)(iStack_14 + 0x20) = *(undefined4 *)(param_2 + 0x1d0);
  thunk_FUN_00cade20(*(undefined4 *)(iStack_14 + 0x20),0);
  ExceptionList = pvStack_10;
  return;
}


```

## FUN_00b2a8d0 — 00b2a8d0
命中: @beanExtraLife@017040ac(imm)

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_00b2a8d0(int param_1,int param_2)

{
  undefined4 uVar1;
  undefined1 auStack_144 [40];
  undefined1 auStack_11c [40];
  undefined1 auStack_f4 [40];
  undefined1 auStack_cc [40];
  undefined1 auStack_a4 [104];
  undefined1 auStack_3c [32];
  uint uStack_1c;
  int iStack_18;
  uint uStack_14;
  void *pvStack_10;
  undefined *puStack_c;
  undefined4 uStack_8;
  
  uStack_8 = 0xffffffff;
  puStack_c = &UNK_01612e77;
  pvStack_10 = ExceptionList;
  uStack_14 = _DAT_018bcc60 ^ (uint)&stack0xfffffffc;
  ExceptionList = &pvStack_10;
  iStack_18 = param_1;
  if (param_2 != 0) {
    thunk_FUN_00c9f550(&UNK_017040d0,uStack_14);
    uStack_8 = 0;
    uVar1 = thunk_FUN_00cabb70(auStack_144);
    *(undefined4 *)(iStack_18 + 0x18) = uVar1;
    uStack_8 = 0xffffffff;
    thunk_FUN_00c9f6a0();
    if (*(int *)(iStack_18 + 0x18) != 0) {
      thunk_FUN_00aa8cc0(*(undefined4 *)(iStack_18 + 0x18));
    }
    thunk_FUN_00c9f550(&UNK_017040c0);
    uStack_8 = 1;
    uVar1 = thunk_FUN_00cabb70(auStack_11c);
    *(undefined4 *)(iStack_18 + 0x20) = uVar1;
    uStack_8 = 0xffffffff;
    thunk_FUN_00c9f6a0();
    if (*(int *)(iStack_18 + 0x20) != 0) {
      thunk_FUN_00aa8cc0(*(undefined4 *)(iStack_18 + 0x20));
    }
    thunk_FUN_00c9f550(&UNK_017040ac);
    uStack_8 = 2;
    uVar1 = thunk_FUN_00cabb70(auStack_f4);
    *(undefined4 *)(iStack_18 + 0x1c) = uVar1;
    uStack_8 = 0xffffffff;
    thunk_FUN_00c9f6a0();
    if (*(int *)(iStack_18 + 0x1c) != 0) {
      thunk_FUN_00aa8cc0(*(undefined4 *)(iStack_18 + 0x1c));
    }
    thunk_FUN_00c9f550(&UNK_017040a0);
    uStack_8 = 3;
    uVar1 = thunk_FUN_00cabb70(auStack_cc);
    *(undefined4 *)(iStack_18 + 0x24) = uVar1;
    uStack_8 = 0xffffffff;
    thunk_FUN_00c9f6a0();
    if (*(int *)(iStack_18 + 0x24) != 0) {
      thunk_FUN_00aa8cc0(*(undefined4 *)(iStack_18 + 0x24));
    }
    for (uStack_1c = 0; uStack_1c < 3; uStack_1c = uStack_1c + 1) {
      thunk_FUN_00c916e0(auStack_3c,0x20,&UNK_01704094,uStack_1c + 1);
      thunk_FUN_00c9f550(auStack_3c);
      uStack_8 = 4;
      uVar1 = thunk_FUN_00cabb70(auStack_a4);
      *(undefined4 *)(iStack_18 + 0x28 + uStack_1c * 4) = uVar1;
      uStack_8 = 0xffffffff;
      thunk_FUN_00c9f6a0();
    }
  }
  ExceptionList = pvStack_10;
  thunk_FUN_01550950();
  return;
}


```

