# 完整反编译导出（无截断）

- 程序: FruitNinjaPIB.exe

## FUN_00e757a0 — 012757a0

- 函数名: FUN_012757a0
- 函数体: 115 字节
- 调用者数: 0 / 被调用者数: 2

```c

void __thiscall FUN_012757a0(undefined4 *param_1,undefined4 param_2,undefined4 param_3)

{
  undefined4 uVar1;
  int iVar2;
  undefined4 *puVar3;
  undefined4 auStack_d0 [49];
  undefined4 *puStack_c;
  undefined4 uStack_8;
  
  puVar3 = auStack_d0;
  for (iVar2 = 0x33; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar3 = 0xcccccccc;
    puVar3 = puVar3 + 1;
  }
  param_1[1] = 0;
  *param_1 = 0;
  puStack_c = param_1;
  uVar1 = thunk_FUN_00eafea0();
  puStack_c[2] = uVar1;
  puStack_c[3] = param_3;
  puStack_c[5] = param_2;
  *(undefined1 *)(puStack_c + 4) = 0;
  uStack_8 = 0x127580d;
  thunk_FUN_0155aeb0();
  return;
}


```

## FUN_00d72370 — 01172370

- 函数名: FUN_01172370
- 函数体: 587 字节
- 调用者数: 0 / 被调用者数: 14

```c

void FUN_01172370(int param_1)

{
  longlong lVar1;
  undefined4 uVar2;
  int *piVar3;
  int iVar4;
  int aiStack_158 [2];
  undefined4 *puStack_150;
  undefined4 *puStack_144;
  undefined4 uStack_78;
  int iStack_6c;
  int iStack_60;
  undefined4 uStack_54;
  uint uStack_48;
  undefined4 uStack_3c;
  uint uStack_30;
  undefined4 *puStack_24;
  int iStack_18;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  piVar3 = aiStack_158;
  for (iVar4 = 0x55; iVar4 != 0; iVar4 = iVar4 + -1) {
    *piVar3 = -0x33333334;
    piVar3 = piVar3 + 1;
  }
  iStack_18 = param_1 + 4;
  if (*(int *)(param_1 + 0x148) == 0) {
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00c93660(&UNK_016ec4a8);
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00a6fd50(&UNK_017c8f54);
    thunk_FUN_00c93610(&UNK_016ec474);
    thunk_FUN_00c93660(&UNK_016ec434);
    thunk_FUN_00c93660(&UNK_017c8ec8);
    thunk_FUN_00c94580(0xffff);
    thunk_FUN_00c93660(&UNK_016ec434);
    if (DAT_019958e2 == '\0') {
      aiStack_158[0] = thunk_FUN_00c93390();
      if (aiStack_158[0] == 0) {
        DebugBreak();
        thunk_FUN_0155aeb0();
      }
      else if (aiStack_158[0] == 2) {
        DAT_019958e2 = '\x01';
      }
    }
  }
  else {
    uVar2 = thunk_FUN_0113aad0();
    thunk_FUN_00ae1d40(uVar2);
    lVar1 = (ulonglong)*(uint *)(iStack_18 + 0x144) * 4;
    puStack_150 = (undefined4 *)
                  thunk_FUN_00c8cad0(-(uint)((int)((ulonglong)lVar1 >> 0x20) != 0) | (uint)lVar1);
    *puStack_150 = uStack_c;
    puStack_24 = puStack_150;
    thunk_FUN_01172650(param_1,0);
    for (uStack_30 = 1; uStack_30 < *(uint *)(iStack_18 + 0x144); uStack_30 = uStack_30 + 1) {
      uStack_3c = thunk_FUN_0116b740();
      thunk_FUN_01172650(param_1,uStack_30);
      puStack_24[uStack_30] = uStack_3c;
    }
    for (uStack_48 = 0; uStack_48 < *(uint *)(iStack_18 + 0x144); uStack_48 = uStack_48 + 1) {
      uStack_54 = puStack_24[uStack_48];
      piVar3 = (int *)thunk_FUN_00e13c10(uStack_48);
      iStack_60 = *piVar3;
      iStack_6c = *(int *)(iStack_60 + 0x120);
      if (-1 < iStack_6c) {
        uStack_78 = puStack_24[iStack_6c];
        thunk_FUN_01172b40(uStack_54);
      }
    }
    if (puStack_24 != (undefined4 *)0x0) {
      puStack_144 = puStack_24;
      thunk_FUN_00c8bb60(puStack_24);
      puStack_24 = (undefined4 *)0x0;
    }
  }
  uStack_8 = 0x11725b7;
  thunk_FUN_0155aeb0();
  return;
}


```

## FUN_00d6b7d0 — 0116b7d0

- 函数名: FUN_0116b7d0
- 函数体: 134 字节
- 调用者数: 0 / 被调用者数: 4

```c

void FUN_0116b7d0(void)

{
  int iVar1;
  int *piVar2;
  int aiStack_e0 [53];
  int iStack_c;
  
  piVar2 = aiStack_e0;
  for (iVar1 = 0x37; iVar1 != 0; iVar1 = iVar1 + -1) {
    *piVar2 = -0x33333334;
    piVar2 = piVar2 + 1;
  }
  aiStack_e0[2] = thunk_FUN_00c8c9a0(0x2d4);
  if (aiStack_e0[2] == 0) {
    aiStack_e0[0] = 0;
  }
  else {
    aiStack_e0[0] = thunk_FUN_0116b610(1);
  }
  iStack_c = aiStack_e0[0];
  thunk_FUN_01172850(0x1995b30);
  iStack_c = 0x116b852;
  thunk_FUN_0155aeb0();
  return;
}


```

