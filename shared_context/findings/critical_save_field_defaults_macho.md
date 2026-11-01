# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_00027c70 — 00027c70

- 函数名: FUN_00027c70
- 函数体: 691 字节
- 调用者数: 1 / 被调用者数: 6

```c

int FUN_00027c70(int param_1)

{
  undefined4 *puVar1;
  undefined4 *puVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  undefined4 *puVar9;
  int iVar10;
  
  *(undefined4 *)(param_1 + 8) = 0;
  *(undefined4 *)(param_1 + 0xc) = 0;
  *(undefined4 *)(param_1 + 0x10) = 0;
  *(undefined4 *)(param_1 + 0x14) = 0;
  puVar1 = (undefined4 *)(param_1 + 4);
  *puVar1 = 0;
  *(undefined4 **)(param_1 + 0xc) = puVar1;
  *(undefined4 **)(param_1 + 0x10) = puVar1;
  *(undefined4 *)(param_1 + 0x20) = 0;
  *(undefined4 *)(param_1 + 0x24) = 0;
  *(undefined4 *)(param_1 + 0x28) = 0;
  *(undefined4 *)(param_1 + 0x2c) = 0;
  puVar2 = (undefined4 *)(param_1 + 0x1c);
  *puVar2 = 0;
  *(undefined4 *)(param_1 + 0x38) = 0;
  *(undefined4 **)(param_1 + 0x24) = puVar2;
  *(undefined4 **)(param_1 + 0x28) = puVar2;
  puVar2 = (undefined4 *)(param_1 + 0x34);
  *puVar2 = 0;
  *puVar2 = puVar2;
  *(undefined4 **)(param_1 + 0x38) = puVar2;
  *(undefined4 *)(param_1 + 0x140) = 0;
  *(undefined4 *)(param_1 + 0x144) = 0;
  *(undefined4 *)(param_1 + 0x148) = 0;
  *(undefined4 *)(param_1 + 0x14c) = 0;
  *(undefined4 *)(param_1 + 0x150) = 0;
  *(int *)(param_1 + 0x148) = param_1 + 0x140;
  *(int *)(param_1 + 0x14c) = param_1 + 0x140;
  *(undefined4 *)(param_1 + 0x158) = 0;
  *(undefined4 *)(param_1 + 0x15c) = 0;
  *(undefined4 *)(param_1 + 0x160) = 0;
  *(undefined4 *)(param_1 + 0x164) = 0;
  *(undefined4 *)(param_1 + 0x168) = 0;
  *(int *)(param_1 + 0x160) = param_1 + 0x158;
  *(int *)(param_1 + 0x164) = param_1 + 0x158;
  *(undefined4 *)(param_1 + 0x16c) = 0;
  *(undefined4 *)(param_1 + 0x170) = 0;
  *(int *)(param_1 + 0x16c) = param_1 + 0x16c;
  *(int *)(param_1 + 0x170) = param_1 + 0x16c;
  iVar4 = param_1 + 0x260;
  *(undefined1 *)(param_1 + 0x174) = 0;
  *(undefined4 *)(param_1 + 0x260) = 0;
  *(undefined4 *)(param_1 + 0x264) = 0;
  *(int *)(param_1 + 0x260) = iVar4;
  *(int *)(param_1 + 0x264) = iVar4;
  iVar5 = param_1 + 0x26c;
  *(undefined4 *)(param_1 + 0x26c) = 0;
  *(undefined4 *)(param_1 + 0x270) = 0;
  *(undefined4 *)(param_1 + 0x274) = 0;
  *(undefined4 *)(param_1 + 0x278) = 0;
  *(undefined4 *)(param_1 + 0x27c) = 0;
  *(int *)(param_1 + 0x274) = iVar5;
  *(int *)(param_1 + 0x278) = iVar5;
  iVar6 = param_1 + 0x284;
  *(undefined4 *)(param_1 + 0x284) = 0;
  *(undefined4 *)(param_1 + 0x288) = 0;
  *(undefined4 *)(param_1 + 0x28c) = 0;
  *(undefined4 *)(param_1 + 0x290) = 0;
  *(undefined4 *)(param_1 + 0x294) = 0;
  *(int *)(param_1 + 0x28c) = iVar6;
  *(int *)(param_1 + 0x290) = iVar6;
  iVar7 = 0;
  do {
    iVar8 = param_1 + iVar7;
    iVar7 = iVar7 + 0x18;
    *(undefined4 *)(iVar8 + 0x2a8) = 0;
    *(undefined4 *)(iVar8 + 0x2ac) = 0;
    *(undefined4 *)(iVar8 + 0x2b0) = 0;
    *(undefined4 *)(iVar8 + 0x2b4) = 0;
    *(undefined4 *)(iVar8 + 0x2b8) = 0;
    *(int *)(iVar8 + 0x2b0) = iVar8 + 0x2a8;
    *(int *)(iVar8 + 0x2b4) = iVar8 + 0x2a8;
  } while (iVar7 != 0x30);
  *(undefined4 *)(param_1 + 0x54) = 0;
  *(undefined4 *)(param_1 + 0x58) = 0;
  *(undefined1 *)(param_1 + 0x32) = 0;
  *(undefined4 *)(param_1 + 0x220) = 0xbf800000;
  *(undefined4 *)(param_1 + 0x23c) = 0xbf800000;
  *(undefined4 *)(param_1 + 0x21c) = 0xffffffff;
  *(undefined4 *)(param_1 + 0x238) = 0;
  *(undefined4 *)(param_1 + 0x230) = 0xffffffff;
  *(undefined4 *)(param_1 + 0x22c) = 0xffffffff;
  *(undefined4 *)(param_1 + 0x228) = 0xffffffff;
  *(undefined4 *)(param_1 + 0x224) = 0xffffffff;
  *(undefined1 *)(param_1 + 0x234) = 0;
  *(undefined1 *)(param_1 + 0x235) = 0;
  *(undefined4 *)(param_1 + 0x100) = 0x46;
  *(undefined4 *)(param_1 + 0x244) = 0x3f800000;
  *(undefined4 *)(param_1 + 0x240) = 0;
  *(undefined4 *)(param_1 + 0x40) = 0;
  *(undefined4 *)(param_1 + 0x68) = 0;
  *(undefined4 *)(param_1 + 100) = 0xffffffff;
  *(undefined4 *)(param_1 + 0x5c) = 0;
  *(undefined4 *)(param_1 + 0xfc) = 0xbf800000;
  *(undefined4 *)(param_1 + 0x298) = 0;
  *(undefined4 *)(param_1 + 0x29c) = 0;
  *(undefined4 *)(param_1 + 0x2a0) = 0;
  *(undefined4 *)(param_1 + 0x6c) = 0;
  _memset((void *)(param_1 + 0x70),0xff,0x80);
  iVar8 = 0;
  iVar7 = 0;
  do {
    iVar3 = param_1 + iVar7 * 4;
    iVar10 = param_1 + iVar8;
    *(undefined4 *)(iVar3 + 0x4c) = 0;
    *(undefined4 *)(iVar3 + 0x44) = 0;
    *(undefined4 *)(iVar3 + 0x2dc) = 0;
    FUN_00022c1c(iVar10 + 0x2a4,*(undefined4 *)(iVar10 + 0x2ac));
    iVar8 = iVar8 + 0x18;
    iVar7 = iVar7 + 1;
    *(undefined4 *)(iVar10 + 0x2ac) = 0;
    *(int *)(iVar10 + 0x2b0) = iVar10 + 0x2a8;
    *(int *)(iVar10 + 0x2b4) = iVar10 + 0x2a8;
    *(undefined4 *)(iVar10 + 0x2b8) = 0;
  } while (iVar8 != 0x30);
  *(undefined4 *)(param_1 + 0x25c) = 0x3f800000;
  *(undefined4 *)(param_1 + 0x248) = 0;
  *(undefined4 *)(param_1 + 0x254) = 0;
  *(undefined4 *)(param_1 + 600) = 0;
  FUN_00022bb4(iVar4);
  *(int *)iVar4 = iVar4;
  *(int *)(param_1 + 0x264) = iVar4;
  FUN_00022bf4(param_1 + 0x268,*(undefined4 *)(param_1 + 0x270));
  *(undefined4 *)(param_1 + 0x270) = 0;
  *(int *)(param_1 + 0x274) = iVar5;
  *(int *)(param_1 + 0x278) = iVar5;
  *(undefined4 *)(param_1 + 0x27c) = 0;
  FUN_00022bf4(param_1 + 0x280,*(undefined4 *)(param_1 + 0x288));
  *(int *)(param_1 + 0x28c) = iVar6;
  *(undefined4 *)(param_1 + 0x288) = 0;
  *(int *)(param_1 + 0x290) = iVar6;
  *(undefined4 *)(param_1 + 0x294) = 0;
  *(undefined4 *)(param_1 + 0x2d4) = 0;
  *(undefined1 *)(param_1 + 0x3c) = 0;
  *(undefined1 *)(param_1 + 0x30) = 0;
  *(undefined1 *)(param_1 + 0x31) = 0;
  *(undefined1 *)(param_1 + 0x60) = 0;
  FUN_00022b64(param_1,*(undefined4 *)(param_1 + 8));
  *(undefined4 *)(param_1 + 8) = 0;
  *(undefined4 **)(param_1 + 0xc) = puVar1;
  *(undefined4 **)(param_1 + 0x10) = puVar1;
  *(undefined4 *)(param_1 + 0x14) = 0;
  puVar1 = (undefined4 *)*puVar2;
  while (puVar1 != puVar2) {
    puVar9 = (undefined4 *)*puVar1;
    operator_delete(puVar1);
    puVar1 = puVar9;
  }
  *(undefined4 *)(param_1 + 0x2e4) = 0;
  *(undefined4 **)(param_1 + 0x34) = puVar2;
  *(undefined4 **)(param_1 + 0x38) = puVar2;
  _memset((void *)(param_1 + 0x2e8),0xff,0x2c);
  *(undefined4 *)(param_1 + 0xf0) = 0;
  *(undefined4 *)(param_1 + 0xf4) = 0;
  *(undefined4 *)(param_1 + 0xf8) = 0;
  *(undefined1 *)(param_1 + 0x2d8) = 0;
  return param_1;
}


```

