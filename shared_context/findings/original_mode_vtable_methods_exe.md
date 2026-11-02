# 完整反编译导出（无截断）

- 程序: FruitNinjaPIB.exe

## FUN_00a183cc — 00e18340

- 函数名: FUN_00e18340
- 函数体: 453 字节
- 调用者数: 0 / 被调用者数: 13

```c

void FUN_00e18340(undefined4 param_1,undefined4 param_2)

{
  char cVar1;
  undefined4 uVar2;
  int iVar3;
  undefined4 extraout_EDX;
  undefined4 extraout_EDX_00;
  undefined4 *puVar4;
  undefined4 auStack_154 [2];
  char cStack_149;
  undefined1 auStack_140 [20];
  undefined4 uStack_12c;
  undefined1 auStack_120 [40];
  uint uStack_f8;
  undefined1 auStack_2c [8];
  undefined4 uStack_24;
  undefined4 uStack_18;
  
  puVar4 = auStack_154;
  for (iVar3 = 0x54; iVar3 != 0; iVar3 = iVar3 + -1) {
    *puVar4 = 0xcccccccc;
    puVar4 = puVar4 + 1;
  }
  uStack_f8 = 0;
  uStack_18 = thunk_FUN_00e22960(param_2);
  thunk_FUN_00e224a0(auStack_2c,uStack_18);
  do {
    uVar2 = thunk_FUN_00e22580(auStack_140,uStack_18);
    cStack_149 = thunk_FUN_00e15150(uVar2);
    thunk_FUN_00e0b8b0();
    if (cStack_149 == '\0') {
      thunk_FUN_00e0b8b0();
      thunk_FUN_00e0fad0(param_1);
      uVar2 = extraout_EDX_00;
LAB_00e184de:
      thunk_FUN_0155aee0(param_1,uVar2);
      uStack_24 = 0xe184ff;
      thunk_FUN_0155aeb0();
      return;
    }
    uVar2 = thunk_FUN_00e20a70(param_2);
    uVar2 = thunk_FUN_00e4fd00(uVar2);
    cVar1 = thunk_FUN_00cd2490(uVar2);
    if (cVar1 == '\0') {
      uVar2 = thunk_FUN_00e20a70();
      uVar2 = thunk_FUN_00e4fd00(uVar2);
      cVar1 = thunk_FUN_00cd2490(param_2,uVar2);
      if (cVar1 == '\0') {
        auStack_154[0] = thunk_FUN_00e212c0(auStack_2c);
        uStack_f8 = uStack_f8 | 2;
      }
      else {
        auStack_154[0] = thunk_FUN_00e0fad0(auStack_120);
        uStack_f8 = uStack_f8 | 1;
      }
      uStack_12c = auStack_154[0];
      thunk_FUN_00e212c0(auStack_154[0]);
      if ((uStack_f8 & 2) != 0) {
        uStack_f8 = uStack_f8 & 0xfffffffd;
        thunk_FUN_00e0b8b0();
      }
      if ((uStack_f8 & 1) != 0) {
        uStack_f8 = uStack_f8 & 0xfffffffe;
        thunk_FUN_00e0b8b0();
      }
      thunk_FUN_00e0b8b0();
      uVar2 = extraout_EDX;
      goto LAB_00e184de;
    }
    thunk_FUN_00e2afa0();
  } while( true );
}


```

## FUN_00a22b47 — 00e22b00

- 函数名: FUN_00e22b00
- 函数体: 80 字节
- 调用者数: 0 / 被调用者数: 3

```c

void __thiscall FUN_00e22b00(undefined4 param_1,undefined4 param_2)

{
  int iVar1;
  undefined4 *puVar2;
  undefined4 auStack_dc [51];
  undefined4 uStack_10;
  undefined4 uStack_c;
  
  puVar2 = auStack_dc;
  for (iVar1 = 0x36; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = 0xcccccccc;
    puVar2 = puVar2 + 1;
  }
  uStack_c = param_1;
  thunk_FUN_00e2c410(param_2,param_1);
  thunk_FUN_00e2c5e0();
  uStack_10 = 0xe22b4a;
  thunk_FUN_0155aeb0();
  return;
}


```

## FUN_00a3cc4f — 00e3cb90

- 函数名: FUN_00e3cb90
- 函数体: 360 字节
- 调用者数: 0 / 被调用者数: 6

```c

void __thiscall FUN_00e3cb90(int param_1)

{
  undefined4 uVar1;
  undefined4 uVar2;
  undefined4 *puVar3;
  undefined4 *puVar4;
  int iVar5;
  int in_stack_00000010;
  int in_stack_0000002c;
  undefined4 auStack_dc [49];
  undefined4 uStack_18;
  int iStack_c;
  undefined4 uStack_8;
  
  puVar3 = auStack_dc;
  for (iVar5 = 0x36; iVar5 != 0; iVar5 = iVar5 + -1) {
    *puVar3 = 0xcccccccc;
    puVar3 = puVar3 + 1;
  }
  iStack_c = param_1;
  if (param_1 != in_stack_00000010) {
    thunk_FUN_00e43eb0(in_stack_0000002c);
    *(int *)(in_stack_00000010 + 8) = *(int *)(in_stack_00000010 + 8) - in_stack_0000002c;
  }
  uVar1 = thunk_FUN_00e48730();
  uVar2 = thunk_FUN_00e48730();
  puVar3 = (undefined4 *)thunk_FUN_00e35860(uVar2);
  puVar3 = (undefined4 *)thunk_FUN_00e2c6b0(*puVar3);
  *puVar3 = uVar1;
  uVar1 = thunk_FUN_00e48730();
  uVar2 = thunk_FUN_00e48730();
  puVar3 = (undefined4 *)thunk_FUN_00e35860(uVar2);
  puVar3 = (undefined4 *)thunk_FUN_00e2c6b0(*puVar3);
  *puVar3 = uVar1;
  uVar1 = thunk_FUN_00e48730();
  uVar2 = thunk_FUN_00e48730();
  puVar3 = (undefined4 *)thunk_FUN_00e35860(uVar2);
  puVar3 = (undefined4 *)thunk_FUN_00e2c6b0(*puVar3);
  *puVar3 = uVar1;
  uVar1 = thunk_FUN_00e48730();
  puVar3 = (undefined4 *)thunk_FUN_00e35860(uVar1);
  uStack_18 = *puVar3;
  uVar1 = thunk_FUN_00e48730();
  puVar3 = (undefined4 *)thunk_FUN_00e35860(uVar1);
  uVar1 = thunk_FUN_00e48730();
  puVar4 = (undefined4 *)thunk_FUN_00e35860(uVar1);
  *puVar4 = *puVar3;
  uVar1 = thunk_FUN_00e48730();
  puVar3 = (undefined4 *)thunk_FUN_00e35860(uVar1);
  uVar1 = thunk_FUN_00e48730();
  puVar4 = (undefined4 *)thunk_FUN_00e35860(uVar1);
  *puVar4 = *puVar3;
  uVar1 = thunk_FUN_00e48730();
  puVar3 = (undefined4 *)thunk_FUN_00e35860(uVar1);
  *puVar3 = uStack_18;
  thunk_FUN_00e0b0c0();
  thunk_FUN_00e0b0c0();
  thunk_FUN_00e0b0c0();
  uStack_8 = 0xe3ccf2;
  thunk_FUN_0155aeb0();
  return;
}


```

## FUN_00a364da — 00e36480

- 函数名: FUN_00e36480
- 函数体: 595 字节
- 调用者数: 0 / 被调用者数: 19

```c

void FUN_00e36480(undefined4 param_1,undefined4 param_2)

{
  char cVar1;
  undefined4 uVar2;
  int iVar3;
  undefined4 extraout_EDX;
  undefined4 extraout_EDX_00;
  undefined4 *puVar4;
  undefined4 uStack_198;
  char cStack_191;
  undefined1 auStack_188 [32];
  undefined1 auStack_168 [23];
  undefined1 auStack_151 [72];
  undefined1 auStack_109 [201];
  undefined1 auStack_40 [16];
  undefined4 uStack_30;
  undefined1 auStack_2c [20];
  undefined4 uStack_18;
  
  puVar4 = &uStack_198;
  for (iVar3 = 0x65; iVar3 != 0; iVar3 = iVar3 + -1) {
    *puVar4 = 0xcccccccc;
    puVar4 = puVar4 + 1;
  }
  uVar2 = thunk_FUN_00d6a590(param_2);
  uStack_18 = thunk_FUN_00d69f60(uVar2);
  thunk_FUN_00e23250(auStack_2c,uStack_18);
  do {
    uVar2 = thunk_FUN_00e231e0(auStack_188,uStack_18);
    cStack_191 = thunk_FUN_00d69640(uVar2);
    thunk_FUN_00d69eb0();
    if (cStack_191 == '\0') goto LAB_00e365e7;
    thunk_FUN_00e3adc0();
    uVar2 = thunk_FUN_00e2a080();
    uVar2 = thunk_FUN_00d6a590(uVar2);
    uVar2 = thunk_FUN_00d6a590(param_2,uVar2);
    cVar1 = thunk_FUN_00cd2490(uVar2);
  } while (cVar1 != '\0');
  uVar2 = thunk_FUN_00d6a590(param_2);
  uVar2 = thunk_FUN_00e2a080(uVar2);
  uVar2 = thunk_FUN_00d6a590(uVar2);
  cVar1 = thunk_FUN_00cd2490(uVar2);
  if (cVar1 == '\0') {
    thunk_FUN_00d69910(&stack0x0000000c);
    thunk_FUN_00e3dee0(auStack_168);
    thunk_FUN_00d69eb0();
    auStack_151[0] = 0;
    thunk_FUN_00e526f0(auStack_2c,auStack_151);
    thunk_FUN_00d69eb0();
    thunk_FUN_00d69eb0();
    uVar2 = extraout_EDX;
  }
  else {
    thunk_FUN_00d6a3f0();
LAB_00e365e7:
    thunk_FUN_00d69f00(&stack0x0000000c);
    uVar2 = thunk_FUN_00d6a3f0();
    cVar1 = thunk_FUN_00d69640(uVar2);
    if (cVar1 != '\0') {
      thunk_FUN_00d69910(auStack_40);
      thunk_FUN_00d69910(&stack0x0000000c);
      thunk_FUN_00d69910(auStack_2c);
      thunk_FUN_00e3e090();
    }
    thunk_FUN_00d69f00(auStack_2c);
    thunk_FUN_00d69f00(&stack0x0000000c);
    thunk_FUN_00e3dc10();
    thunk_FUN_00e3dd80();
    auStack_109[0] = 1;
    thunk_FUN_00e526f0(&stack0x0000000c,auStack_109);
    thunk_FUN_00d69eb0();
    thunk_FUN_00d69eb0();
    thunk_FUN_00d69eb0();
    uVar2 = extraout_EDX_00;
  }
  thunk_FUN_0155aee0(param_1,uVar2);
  uStack_30 = 0xe366cf;
  thunk_FUN_0155aeb0();
  return;
}


```

## FUN_00a48dc4 — 未找到

(函数未找到)

## FUN_00a1fe79 — 00e1fe50

- 函数名: FUN_00e1fe50
- 函数体: 209 字节
- 调用者数: 0 / 被调用者数: 6

```c

void FUN_00e1fe50(void)

{
  code *pcVar1;
  int iVar2;
  undefined4 *puVar3;
  undefined4 auStack_d0 [49];
  int iStack_c;
  undefined4 uStack_8;
  
  puVar3 = auStack_d0;
  for (iVar2 = 0x33; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar3 = 0xcccccccc;
    puVar3 = puVar3 + 1;
  }
  iVar2 = thunk_FUN_00a72cb0();
  if (((iVar2 == 0) || (*(int *)(iStack_c + 8) == 0)) ||
     (iVar2 = thunk_FUN_00a72cb0(), *(int *)(iStack_c + 8) == *(int *)(iVar2 + 4))) {
    thunk_FUN_0154d660(&UNK_016ed430,&UNK_016ec848,0xcf);
    iVar2 = thunk_FUN_01551510(2,&UNK_016ec848,0xd0,0,&UNK_016ecb58);
    if (iVar2 == 1) {
      pcVar1 = (code *)swi(3);
      (*pcVar1)();
      return;
    }
    thunk_FUN_01550dd0(&UNK_016ec8ec,&UNK_017607c8,&UNK_016ec848,0xd0,0);
  }
  thunk_FUN_00e26820(*(undefined4 *)(iStack_c + 8));
  uStack_8 = 0xe1ff1d;
  thunk_FUN_0155aeb0();
  return;
}


```

## FUN_00a52f9a — 00e52f50

- 函数名: FUN_00e52f50
- 函数体: 139 字节
- 调用者数: 0 / 被调用者数: 5

```c

void FUN_00e52f50(uint param_1)

{
  int iVar1;
  undefined4 *puVar2;
  undefined4 auStack_e0 [53];
  int iStack_c;
  undefined4 uStack_8;
  
  puVar2 = auStack_e0;
  for (iVar1 = 0x37; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = 0xcccccccc;
    puVar2 = puVar2 + 1;
  }
  iStack_c = 0;
  if ((param_1 != 0) &&
     ((0xfffffff < param_1 || (iStack_c = thunk_FUN_00c8c9a0(param_1 << 4), iStack_c == 0)))) {
    thunk_FUN_00a760e0(0);
    thunk_FUN_00a76070();
    thunk_FUN_00a76240();
  }
  uStack_8 = 0xe52fd7;
  thunk_FUN_0155aeb0();
  return;
}


```

## FUN_00a33c26 — 00e33bc0

- 函数名: FUN_00e33bc0
- 函数体: 104 字节
- 调用者数: 0 / 被调用者数: 5

```c

void __thiscall FUN_00e33bc0(undefined4 param_1,int param_2)

{
  undefined4 uVar1;
  int iVar2;
  undefined4 *puVar3;
  undefined4 auStack_dc [50];
  undefined4 uStack_14;
  undefined4 uStack_c;
  
  puVar3 = auStack_dc;
  for (iVar2 = 0x36; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar3 = 0xcccccccc;
    puVar3 = puVar3 + 1;
  }
  uStack_c = param_1;
  thunk_FUN_00e33fa0(param_2 + 0xd,param_1);
  thunk_FUN_00e2b290();
  uVar1 = thunk_FUN_00e52240(param_2);
  thunk_FUN_00e3b150(uVar1);
  uStack_14 = 0xe33c22;
  thunk_FUN_0155aeb0();
  return;
}


```

## FUN_00a2af8b — 00e2af40

- 函数名: FUN_00e2af40
- 函数体: 76 字节
- 调用者数: 0 / 被调用者数: 2

```c

void FUN_00e2af40(undefined4 param_1,undefined4 param_2)

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
  thunk_FUN_00e2ac30(param_1,param_2);
  uStack_10 = 0xe2af86;
  thunk_FUN_0155aeb0();
  return;
}


```

## FUN_00a5766c — 00e57590

- 函数名: FUN_00e57590
- 函数体: 595 字节
- 调用者数: 0 / 被调用者数: 19

```c

void FUN_00e57590(undefined4 param_1,undefined4 param_2)

{
  char cVar1;
  undefined4 uVar2;
  int iVar3;
  undefined4 extraout_EDX;
  undefined4 extraout_EDX_00;
  undefined4 *puVar4;
  undefined4 uStack_198;
  char cStack_191;
  undefined1 auStack_188 [32];
  undefined1 auStack_168 [23];
  undefined1 auStack_151 [72];
  undefined1 auStack_109 [201];
  undefined1 auStack_40 [16];
  undefined4 uStack_30;
  undefined1 auStack_2c [20];
  undefined4 uStack_18;
  
  puVar4 = &uStack_198;
  for (iVar3 = 0x65; iVar3 != 0; iVar3 = iVar3 + -1) {
    *puVar4 = 0xcccccccc;
    puVar4 = puVar4 + 1;
  }
  uVar2 = thunk_FUN_00e4ffd0(param_2);
  uStack_18 = thunk_FUN_00e25540(uVar2);
  thunk_FUN_00e25410(auStack_2c,uStack_18);
  do {
    uVar2 = thunk_FUN_00e253a0(auStack_188,uStack_18);
    cStack_191 = thunk_FUN_00e142c0(uVar2);
    thunk_FUN_00dfdba0();
    if (cStack_191 == '\0') goto LAB_00e576f7;
    thunk_FUN_00e5fae0();
    uVar2 = thunk_FUN_00e13fa0();
    uVar2 = thunk_FUN_00e4ffd0(uVar2);
    uVar2 = thunk_FUN_00e4ffd0(param_2,uVar2);
    cVar1 = thunk_FUN_00cd2490(uVar2);
  } while (cVar1 != '\0');
  uVar2 = thunk_FUN_00e4ffd0(param_2);
  uVar2 = thunk_FUN_00e13fa0(uVar2);
  uVar2 = thunk_FUN_00e4ffd0(uVar2);
  cVar1 = thunk_FUN_00cd2490(uVar2);
  if (cVar1 == '\0') {
    thunk_FUN_00e03860(&stack0x0000000c);
    thunk_FUN_00e5d1a0(auStack_168);
    thunk_FUN_00dfdba0();
    auStack_151[0] = 0;
    thunk_FUN_00e723d0(auStack_2c,auStack_151);
    thunk_FUN_00dfdba0();
    thunk_FUN_00dfdba0();
    uVar2 = extraout_EDX;
  }
  else {
    thunk_FUN_00e14040();
LAB_00e576f7:
    thunk_FUN_00e21430(&stack0x0000000c);
    uVar2 = thunk_FUN_00e14040();
    cVar1 = thunk_FUN_00e142c0(uVar2);
    if (cVar1 != '\0') {
      thunk_FUN_00e03860(auStack_40);
      thunk_FUN_00e03860(&stack0x0000000c);
      thunk_FUN_00e03860(auStack_2c);
      thunk_FUN_00e5d350();
    }
    thunk_FUN_00e21430(auStack_2c);
    thunk_FUN_00e21430(&stack0x0000000c);
    thunk_FUN_00e5cf40();
    thunk_FUN_00e5d0b0();
    auStack_109[0] = 1;
    thunk_FUN_00e723d0(&stack0x0000000c,auStack_109);
    thunk_FUN_00dfdba0();
    thunk_FUN_00dfdba0();
    thunk_FUN_00dfdba0();
    uVar2 = extraout_EDX_00;
  }
  thunk_FUN_0155aee0(param_1,uVar2);
  uStack_30 = 0xe577df;
  thunk_FUN_0155aeb0();
  return;
}


```

## FUN_00a42f23 — 00e42e90

- 函数名: FUN_00e42e90
- 函数体: 209 字节
- 调用者数: 0 / 被调用者数: 6

```c

void FUN_00e42e90(void)

{
  code *pcVar1;
  int iVar2;
  undefined4 *puVar3;
  undefined4 auStack_d0 [49];
  int iStack_c;
  undefined4 uStack_8;
  
  puVar3 = auStack_d0;
  for (iVar2 = 0x33; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar3 = 0xcccccccc;
    puVar3 = puVar3 + 1;
  }
  iVar2 = thunk_FUN_00a72cb0();
  if (((iVar2 == 0) || (*(int *)(iStack_c + 8) == 0)) ||
     (iVar2 = thunk_FUN_00a72cb0(), *(int *)(iStack_c + 8) == *(int *)(iVar2 + 4))) {
    thunk_FUN_0154d660(&UNK_016ed430,&UNK_016ec848,0xcf);
    iVar2 = thunk_FUN_01551510(2,&UNK_016ec848,0xd0,0,&UNK_016ecb58);
    if (iVar2 == 1) {
      pcVar1 = (code *)swi(3);
      (*pcVar1)();
      return;
    }
    thunk_FUN_01550dd0(&UNK_016ec8ec,&UNK_01768558,&UNK_016ec848,0xd0,0);
  }
  thunk_FUN_00e37440(*(undefined4 *)(iStack_c + 8));
  uStack_8 = 0xe42f5d;
  thunk_FUN_0155aeb0();
  return;
}


```

## FUN_00a28e7f — 未找到

(函数未找到)

## FUN_00a53986 — 00e53960

- 函数名: FUN_00e53960
- 函数体: 100 字节
- 调用者数: 0 / 被调用者数: 3

```c

void FUN_00e53960(undefined4 param_1,undefined4 param_2,undefined4 param_3)

{
  int iVar1;
  undefined4 *puVar2;
  undefined4 uStack_d0;
  undefined1 uStack_c9;
  undefined4 uStack_8;
  
  puVar2 = &uStack_d0;
  for (iVar1 = 0x33; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = 0xcccccccc;
    puVar2 = puVar2 + 1;
  }
  uStack_c9 = thunk_FUN_00e6e100(param_1,param_3);
  thunk_FUN_00e6f380(param_1,param_2,param_3,uStack_c9);
  uStack_8 = 0xe539c0;
  thunk_FUN_0155aeb0();
  return;
}


```

## FUN_00a34ad6 — 00e34a90

- 函数名: FUN_00e34a90
- 函数体: 84 字节
- 调用者数: 0 / 被调用者数: 2

```c

void FUN_00e34a90(int param_1)

{
  int iVar1;
  undefined4 *puVar2;
  undefined4 auStack_d0 [49];
  int iStack_c;
  
  puVar2 = auStack_d0;
  for (iVar1 = 0x33; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = 0xcccccccc;
    puVar2 = puVar2 + 1;
  }
  thunk_FUN_00e35130(param_1);
  *(undefined4 *)(iStack_c + 8) = *(undefined4 *)(param_1 + 8);
  iStack_c = 0xe34ade;
  thunk_FUN_0155aeb0();
  return;
}


```

## FUN_00a42820 — 未找到

(函数未找到)

## FUN_00a34d8d — 00e34d70

- 函数名: FUN_00e34d70
- 函数体: 66 字节
- 调用者数: 0 / 被调用者数: 2

```c

void FUN_00e34d70(void)

{
  int iVar1;
  undefined4 *puVar2;
  undefined4 auStack_d0 [50];
  undefined4 uStack_8;
  
  puVar2 = auStack_d0;
  for (iVar1 = 0x33; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = 0xcccccccc;
    puVar2 = puVar2 + 1;
  }
  thunk_FUN_00a75640();
  uStack_8 = 0xe34dae;
  thunk_FUN_0155aeb0();
  return;
}


```

## FUN_00a39fcc — 00e39f10

- 函数名: FUN_00e39f10
- 函数体: 340 字节
- 调用者数: 0 / 被调用者数: 15

```c

void __fastcall FUN_00e39f10(int param_1,undefined4 param_2,int param_3)

{
  char cVar1;
  undefined4 uVar2;
  int iVar3;
  undefined4 *puVar4;
  undefined8 uVar5;
  undefined4 uStack_11c;
  undefined1 auStack_115 [12];
  undefined1 auStack_109 [12];
  char cStack_fd;
  undefined1 auStack_f4 [212];
  undefined1 auStack_20 [20];
  int iStack_c;
  undefined4 uStack_8;
  
  puVar4 = &uStack_11c;
  for (iVar3 = 0x46; iVar3 != 0; iVar3 = iVar3 + -1) {
    *puVar4 = 0xcccccccc;
    puVar4 = puVar4 + 1;
  }
  iStack_c = param_1;
  if (param_1 != param_3) {
    uVar2 = thunk_FUN_00e41c10(auStack_115);
    uVar2 = thunk_FUN_00e41c10(auStack_109,uVar2);
    cVar1 = thunk_FUN_00e532e0(uVar2);
    if (cVar1 == '\0') {
      thunk_FUN_00cc7fb0();
      thunk_FUN_00b56730(param_3);
      *(undefined4 *)(iStack_c + 4) = *(undefined4 *)(param_3 + 4);
      *(undefined4 *)(iStack_c + 8) = *(undefined4 *)(param_3 + 8);
      param_2 = *(undefined4 *)(param_3 + 0xc);
      *(undefined4 *)(iStack_c + 0xc) = param_2;
      *(undefined4 *)(param_3 + 4) = 0;
      *(undefined4 *)(param_3 + 8) = 0;
      *(undefined4 *)(param_3 + 0xc) = 0;
      param_1 = param_3;
    }
    else {
      thunk_FUN_00e128f0();
      thunk_FUN_00cbdc30(auStack_20);
      while( true ) {
        uVar2 = thunk_FUN_00cbdca0(auStack_f4);
        cStack_fd = thunk_FUN_00cc0b30(uVar2);
        thunk_FUN_00ca56b0();
        if (cStack_fd == '\0') break;
        uVar2 = thunk_FUN_00cc09c0();
        uVar2 = thunk_FUN_00e53340(uVar2);
        thunk_FUN_00e41a80(uVar2);
        thunk_FUN_00cc0a10();
      }
      uVar5 = thunk_FUN_00ca56b0();
      param_2 = (undefined4)((ulonglong)uVar5 >> 0x20);
      param_1 = (int)uVar5;
    }
  }
  thunk_FUN_0155aee0(param_1,param_2);
  uStack_8 = 0xe3a05e;
  thunk_FUN_0155aeb0();
  return;
}


```

## FUN_00a1f348 — 未找到

(函数未找到)

## FUN_00a44990 — 00e44980

- 函数名: FUN_00e44980
- 函数体: 998 字节
- 调用者数: 0 / 被调用者数: 23

```c

/* WARNING: Removing unreachable block (ram,0x00e44ae1) */
/* WARNING: Removing unreachable block (ram,0x00e44ae7) */
/* WARNING: Removing unreachable block (ram,0x00e44afd) */
/* WARNING: Removing unreachable block (ram,0x00e44b03) */
/* WARNING: Removing unreachable block (ram,0x00e44b27) */
/* WARNING: Removing unreachable block (ram,0x00e44c3c) */

void FUN_00e44980(undefined4 param_1,undefined4 param_2,uint param_3,uint param_4,undefined4 param_5
                 )

{
  int iVar1;
  uint uVar2;
  undefined4 uVar3;
  int iVar4;
  undefined4 *puVar5;
  undefined8 uVar6;
  undefined4 auStack_134 [49];
  int iStack_70;
  undefined1 auStack_64 [20];
  undefined1 auStack_50 [20];
  int iStack_3c;
  int iStack_30;
  int iStack_24;
  int iStack_18;
  int iStack_c;
  undefined4 uStack_8;
  
  puVar5 = auStack_134;
  for (iVar4 = 0x4c; iVar4 != 0; iVar4 = iVar4 + -1) {
    *puVar5 = 0xcccccccc;
    puVar5 = puVar5 + 1;
  }
  iVar4 = thunk_FUN_00a72cb0();
  if (((iVar4 != iStack_c) || (param_3 < *(uint *)(iStack_c + 4))) ||
     (*(uint *)(iStack_c + 8) < param_3)) {
    thunk_FUN_0154d660(&UNK_017310a0,&UNK_016ef8c0,0x537);
  }
  if (param_4 != 0) {
    iVar4 = thunk_FUN_00e44920();
    iVar1 = thunk_FUN_00d70760();
    if ((uint)(iVar4 - iVar1) < param_4) {
      thunk_FUN_00e4ab70();
    }
    else {
      uVar2 = thunk_FUN_00e4a900();
      iVar4 = thunk_FUN_00d70760();
      if (uVar2 < iVar4 + param_4) {
        iVar4 = thunk_FUN_00d70760();
        iStack_18 = thunk_FUN_00e4aa40(iVar4 + param_4);
        iStack_24 = thunk_FUN_00e4abd0(iStack_18);
        iStack_30 = (int)(param_3 - *(int *)(iStack_c + 4)) / 0xc;
        iStack_3c = 0;
        uVar3 = thunk_FUN_00e548c0(param_5);
        thunk_FUN_00e4aaf0(iStack_30 * 0xc + iStack_24,param_4,uVar3);
        iStack_3c = iStack_3c + 1;
        thunk_FUN_00e54900(*(undefined4 *)(iStack_c + 4),param_3,iStack_24);
        iStack_3c = iStack_3c + 1;
        thunk_FUN_00e54900(param_3,*(undefined4 *)(iStack_c + 8),
                           (iStack_30 + param_4) * 0xc + iStack_24);
        iVar4 = thunk_FUN_00d70760();
        if (*(int *)(iStack_c + 4) != 0) {
          thunk_FUN_00d5f000(*(undefined4 *)(iStack_c + 4),*(undefined4 *)(iStack_c + 8));
          thunk_FUN_00d5f070(*(undefined4 *)(iStack_c + 4),
                             (*(int *)(iStack_c + 0xc) - *(int *)(iStack_c + 4)) / 0xc);
        }
        thunk_FUN_00a73e10();
        *(int *)(iStack_c + 0xc) = iStack_18 * 0xc + iStack_24;
        *(uint *)(iStack_c + 8) = (iVar4 + param_4) * 0xc + iStack_24;
        *(int *)(iStack_c + 4) = iStack_24;
      }
      else if ((uint)((int)(*(int *)(iStack_c + 8) - param_3) / 0xc) < param_4) {
        thunk_FUN_00d70120(param_5);
        thunk_FUN_00e54900(param_3,*(undefined4 *)(iStack_c + 8),param_4 * 0xc + param_3);
        uVar3 = thunk_FUN_00e54970(auStack_50);
        thunk_FUN_00e4aaf0(*(undefined4 *)(iStack_c + 8),
                           param_4 - (int)(*(int *)(iStack_c + 8) - param_3) / 0xc,uVar3);
        *(uint *)(iStack_c + 8) = param_4 * 0xc + *(int *)(iStack_c + 8);
        thunk_FUN_00e44ea0(param_3,*(undefined4 *)(iStack_c + 8));
        thunk_FUN_00e549b0(param_3,*(int *)(iStack_c + 8) + param_4 * -0xc,auStack_50);
        thunk_FUN_00d700d0();
      }
      else {
        thunk_FUN_00d70120(param_5);
        iStack_70 = *(int *)(iStack_c + 8);
        uVar3 = thunk_FUN_00e54900(iStack_70 + param_4 * -0xc,iStack_70,
                                   *(undefined4 *)(iStack_c + 8));
        *(undefined4 *)(iStack_c + 8) = uVar3;
        thunk_FUN_00e44ea0(param_3,*(undefined4 *)(iStack_c + 8));
        thunk_FUN_00e54a40(param_3,iStack_70 + param_4 * -0xc,iStack_70);
        thunk_FUN_00e549b0(param_3,param_4 * 0xc + param_3,auStack_64);
        thunk_FUN_00d700d0();
      }
    }
  }
  uVar6 = thunk_FUN_00e3b8e0();
  thunk_FUN_0155aee0(uVar6);
  uStack_8 = 0xe44d60;
  thunk_FUN_0155aeb0();
  return;
}


```

## FUN_00a280a1 — 00e28070

- 函数名: FUN_00e28070
- 函数体: 69 字节
- 调用者数: 0 / 被调用者数: 2

```c

void FUN_00e28070(undefined4 param_1)

{
  int iVar1;
  undefined4 *puVar2;
  undefined4 auStack_d0 [50];
  undefined4 uStack_8;
  
  puVar2 = auStack_d0;
  for (iVar1 = 0x33; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = 0xcccccccc;
    puVar2 = puVar2 + 1;
  }
  thunk_FUN_00c8ba80(param_1);
  uStack_8 = 0xe280af;
  thunk_FUN_0155aeb0();
  return;
}


```

## FUN_00a47a7d — 00e47a40

- 函数名: FUN_00e47a40
- 函数体: 140 字节
- 调用者数: 0 / 被调用者数: 3

```c

void FUN_00e47a40(uint param_1)

{
  int iVar1;
  uint *puVar2;
  uint auStack_e0 [50];
  uint uStack_18;
  undefined4 uStack_8;
  
  puVar2 = auStack_e0;
  for (iVar1 = 0x37; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = 0xcccccccc;
    puVar2 = puVar2 + 1;
  }
  uStack_18 = thunk_FUN_00e47990();
  iVar1 = thunk_FUN_00e479e0();
  if (iVar1 - (uStack_18 >> 1) < uStack_18) {
    auStack_e0[0] = 0;
  }
  else {
    auStack_e0[0] = (uStack_18 >> 1) + uStack_18;
  }
  uStack_18 = auStack_e0[0];
  if (auStack_e0[0] < param_1) {
    uStack_18 = param_1;
  }
  uStack_8 = 0xe47ac6;
  thunk_FUN_0155aeb0();
  return;
}


```

## FUN_00a48e2d — 00e48e20

- 函数名: FUN_00e48e20
- 函数体: 89 字节
- 调用者数: 0 / 被调用者数: 3

```c

void FUN_00e48e20(undefined4 param_1,undefined4 param_2)

{
  int iVar1;
  undefined4 *puVar2;
  undefined4 auStack_d0 [49];
  int iStack_c;
  
  puVar2 = auStack_d0;
  for (iVar1 = 0x33; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = 0xcccccccc;
    puVar2 = puVar2 + 1;
  }
  thunk_FUN_00e4a220();
  *(undefined4 *)(iStack_c + 8) = param_1;
  thunk_FUN_00a723c0(param_2);
  iStack_c = 0xe48e73;
  thunk_FUN_0155aeb0();
  return;
}


```

## FUN_00a5ae89 — 00e5ae40

- 函数名: FUN_00e5ae40
- 函数体: 81 字节
- 调用者数: 0 / 被调用者数: 2

```c

void FUN_00e5ae40(undefined4 param_1)

{
  int iVar1;
  undefined4 *puVar2;
  undefined4 auStack_d0 [49];
  undefined4 *puStack_c;
  
  puVar2 = auStack_d0;
  for (iVar1 = 0x33; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = 0xcccccccc;
    puVar2 = puVar2 + 1;
  }
  thunk_FUN_00f3d4d0(param_1);
  *puStack_c = &UNK_0176d0f0;
  puStack_c = (undefined4 *)0xe5ae8b;
  thunk_FUN_0155aeb0();
  return;
}


```

## FUN_00a219ae — 00e21970

- 函数名: FUN_00e21970
- 函数体: 72 字节
- 调用者数: 0 / 被调用者数: 2

```c

void FUN_00e21970(undefined4 param_1)

{
  int iVar1;
  undefined4 *puVar2;
  undefined4 auStack_d0 [49];
  undefined4 uStack_c;
  
  puVar2 = auStack_d0;
  for (iVar1 = 0x33; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = 0xcccccccc;
    puVar2 = puVar2 + 1;
  }
  thunk_FUN_00e21c40(param_1);
  uStack_c = 0xe219b2;
  thunk_FUN_0155aeb0();
  return;
}


```

## FUN_00a4df31 — 00e4dee0

- 函数名: FUN_00e4dee0
- 函数体: 107 字节
- 调用者数: 0 / 被调用者数: 4

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00e4dee0(void)

{
  undefined4 uVar1;
  int iVar2;
  undefined4 *puVar3;
  undefined4 auStack_c4 [47];
  undefined4 uStack_8;
  
  puVar3 = auStack_c4;
  for (iVar2 = 0x30; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar3 = 0xcccccccc;
    puVar3 = puVar3 + 1;
  }
  if ((_DAT_019848f0 & 1) == 0) {
    _DAT_019848f0 = _DAT_019848f0 | 1;
    uVar1 = thunk_FUN_00a84e90();
    thunk_FUN_00e5a8f0(uVar1);
    thunk_FUN_01552290(&UNK_00a309db);
  }
  uStack_8 = 0xe4df47;
  thunk_FUN_0155aeb0();
  return;
}


```

