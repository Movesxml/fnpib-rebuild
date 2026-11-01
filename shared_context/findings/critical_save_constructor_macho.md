# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0002914c — 0002914c

- 函数名: FUN_0002914c
- 函数体: 401 字节
- 调用者数: 1 / 被调用者数: 12

```c

undefined4 FUN_0002914c(int param_1)

{
  undefined4 *puVar1;
  undefined4 *puVar2;
  undefined *puVar3;
  char cVar4;
  int iVar5;
  undefined4 uVar6;
  int iVar7;
  undefined4 *puVar8;
  undefined1 auStack_68 [72];
  
  if (DAT_00557a20 == '\0') {
    DAT_00557a20 = '\x01';
    FUN_00027474(&DAT_00557abc,"FruityPussSave.xml",0x200);
  }
  iVar5 = FUN_002f4a78(&DAT_00557abc,0);
  cVar4 = DAT_00557a20;
  puVar3 = PTR_DAT_004d9048;
  if (iVar5 == 1) {
    PTR_DAT_004d9048[0x1bd] = 0;
    if (cVar4 == '\0') {
      DAT_00557a20 = '\x01';
      FUN_00027474(&DAT_00557abc,"FruityPussSave.xml",0x200);
    }
    FUN_0030cda0(auStack_68,&DAT_00557abc);
    puVar1 = (undefined4 *)(param_1 + 0x34);
    puVar2 = (void *)*puVar1;
    while (puVar2 != puVar1) {
      puVar8 = (undefined4 *)*puVar2;
      operator_delete(puVar2);
      puVar2 = puVar8;
    }
    *(undefined4 **)(param_1 + 0x34) = puVar1;
    *(undefined4 **)(param_1 + 0x38) = puVar1;
    if (DAT_00557a20 == '\0') {
      DAT_00557a20 = '\x01';
      FUN_00027474(&DAT_00557abc,"FruityPussSave.xml",0x200);
    }
    iVar5 = FUN_0030cebc(auStack_68,&DAT_00557abc,0);
    if ((iVar5 == 1) && (FUN_00028350(auStack_68,param_1), 1 < *(int *)(param_1 + 0x5c))) {
      *(undefined4 *)(param_1 + 0x5c) = 0;
    }
    iVar7 = *(int *)(param_1 + 0x2d4);
    iVar5 = FUN_0002612c();
    puVar3[8] = iVar7 != iVar5;
    FUN_0002b8e8(auStack_68);
  }
  else {
    PTR_DAT_004d9048[0x1bd] = 1;
  }
  iVar5 = *(int *)(param_1 + 0x2d4);
  if ((iVar5 != 0) && (iVar7 = FUN_0002612c(), iVar5 != iVar7)) {
    uVar6 = FUN_002f69c4("unrated_games",0xd);
    FUN_00027708(param_1,uVar6);
    iVar5 = 0;
    do {
      iVar7 = param_1 + iVar5;
      FUN_00022c1c(iVar7 + 0x2a4,*(undefined4 *)(iVar7 + 0x2ac));
      iVar5 = iVar5 + 0x18;
      *(undefined4 *)(iVar7 + 0x2ac) = 0;
      *(int *)(iVar7 + 0x2b0) = iVar7 + 0x2a8;
      *(int *)(iVar7 + 0x2b4) = iVar7 + 0x2a8;
      *(undefined4 *)(iVar7 + 0x2b8) = 0;
    } while (iVar5 != 0x30);
    *(undefined1 *)(param_1 + 0x32) = 0;
  }
  FUN_000278ec(param_1);
  return 0;
}


```

## FUN_00021524 — 00021524

- 函数名: FUN_00021524
- 函数体: 547 字节
- 调用者数: 4 / 被调用者数: 16

```c

void FUN_00021524(uint param_1)

{
  undefined *puVar1;
  ushort uVar2;
  uint uVar3;
  undefined4 uVar4;
  int iVar5;
  undefined1 auStack_334 [49];
  undefined1 local_303;
  undefined4 local_2e0;
  undefined4 local_2dc;
  int local_2d8;
  undefined1 local_2d4;
  undefined4 local_2d0;
  undefined4 local_2cc;
  undefined4 local_234;
  uint local_230;
  int local_22c;
  undefined4 local_228;
  undefined1 local_1c0;
  undefined4 local_118;
  undefined4 local_114;
  undefined4 local_110;
  undefined4 local_10c;
  undefined4 local_108;
  undefined4 local_104;
  undefined1 local_100;
  undefined1 local_ff;
  float local_fc;
  undefined4 local_f8;
  undefined4 local_f4;
  undefined4 local_f0;
  
  puVar1 = PTR_DAT_004d9048;
  uVar3 = FUN_0001cd68();
  iVar5 = *(int *)(puVar1 + 0x10);
  DAT_005f9414 = 1;
  FUN_0002ede8();
  FUN_00030720();
  FUN_00022c44(auStack_334,*(undefined4 *)(puVar1 + 0x5c));
  local_2d4 = puVar1[0x19];
  local_2e0 = FUN_0001cd94(0);
  local_2dc = FUN_0001cd74(0);
  local_234 = *(undefined4 *)(puVar1 + 0x40);
  local_2d0 = *(undefined4 *)PTR_DAT_004d90f8;
  local_2cc = *(undefined4 *)PTR_DAT_004d90fc;
  local_2d8 = *(int *)(puVar1 + 0x10);
  local_fc = 0.0;
  if ((0.0 < *(float *)(puVar1 + 0x24) & (DAT_005577b0 ^ 1)) != 0) {
    local_fc = *(float *)(puVar1 + 0x24);
  }
  if (puVar1[0x18] != '\0') {
    local_303 = 0;
  }
  local_118 = 0xffffffff;
  local_114 = 0xbf800000;
  local_104 = 0xffffffff;
  local_108 = 0xffffffff;
  local_10c = 0xffffffff;
  local_110 = 0xffffffff;
  local_100 = 0;
  local_ff = 0;
  local_f8 = 0;
  local_f0 = *(undefined4 *)(*(int *)(puVar1 + 0x58) + 0x174);
  local_f4 = *(undefined4 *)(*(int *)(puVar1 + 0x58) + 0x170);
  local_230 = 0;
  local_22c = -1;
  local_228 = 0;
  local_1c0 = 0;
  if ((((uint)(iVar5 != 5) | ~uVar3) & param_1) == 1) {
    local_230 = (uint)(byte)puVar1[0x1b1];
    if (local_2d8 == 1) {
      iVar5 = FUN_0001d10c(puVar1);
      if (iVar5 != 0) {
        uVar4 = FUN_0001d10c(puVar1);
        FUN_00061830(uVar4,auStack_334);
LAB_0002166e:
        if (local_22c == 4) goto LAB_00021672;
      }
    }
    else if ((local_2d8 == 0) && (iVar5 = FUN_0001ccec(puVar1), iVar5 != 0)) {
      uVar4 = FUN_0001ccec(puVar1);
      FUN_00070fe0(uVar4,auStack_334);
      if (local_22c != 2) goto LAB_0002166e;
LAB_00021672:
      local_230 = 2;
      local_118 = 0xffffffff;
      local_114 = 0xbf800000;
    }
    if (local_230 == 1) {
      uVar4 = FUN_00052f80();
      FUN_00057e38(uVar4,auStack_334);
      local_303 = puVar1[0x1b1];
      goto LAB_00021696;
    }
  }
  local_303 = 0;
LAB_00021696:
  uVar2 = *(ushort *)(puVar1 + 0x54) >> 8;
  if ((*(ushort *)(puVar1 + 0x54) & 0xff) == 0) {
    uVar4 = FUN_002f69c4("soundOff",8);
    FUN_00027588(auStack_334,"soundOff",uVar4,1,0,1);
    uVar2 = (ushort)(byte)puVar1[0x55];
  }
  if (uVar2 == 0) {
    uVar4 = FUN_002f69c4("musicOff",8);
    FUN_00027588(auStack_334,"musicOff",uVar4,1,0,1);
  }
  if (puVar1[0x56] == '\0') {
    uVar4 = FUN_002f69c4("voOff",5);
    FUN_00027588(auStack_334,"voOff",uVar4,1,0,1);
  }
  FUN_000292e0(auStack_334);
  DAT_005f9414 = 0;
  FUN_00022ac8(auStack_334);
  return;
}


```

