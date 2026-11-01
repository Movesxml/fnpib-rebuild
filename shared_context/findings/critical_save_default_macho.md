# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_00024284 — 00024284

- 函数名: FUN_00024284
- 函数体: 495 字节
- 调用者数: 1 / 被调用者数: 17

```c

void FUN_00024284(void)

{
  undefined *puVar1;
  void *pvVar2;
  undefined4 uVar3;
  int iVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 *puVar7;
  undefined4 uVar8;
  
  puVar1 = PTR_DAT_004d9048;
  _memset(PTR_DAT_004d9048 + 0x1cc,0,0x400);
  *(undefined4 *)(puVar1 + 0x10) = 0;
  puVar1[0x57] = 0;
  pvVar2 = operator_new(0x78c);
  FUN_0002b968();
  *(void **)(puVar1 + 0x1a4) = pvVar2;
  pvVar2 = operator_new(0x170);
  FUN_000721fc();
  *(void **)(puVar1 + 0x1a8) = pvVar2;
  *(undefined4 *)(puVar1 + 4) = 0;
  puVar1[0x1b1] = 0;
  pvVar2 = operator_new(0x314);
  FUN_00027c60();
  *(void **)(puVar1 + 0x5c) = pvVar2;
  FUN_0002914c(pvVar2);
  *(undefined4 *)(puVar1 + 0x10) = *(undefined4 *)(*(int *)(puVar1 + 0x5c) + 0x5c);
  FUN_0002504c();
  uVar5 = *(undefined4 *)(puVar1 + 0x5c);
  uVar3 = FUN_002f69c4("soundOff",8);
  iVar4 = FUN_00027508(uVar5,uVar3);
  puVar1[0x54] = iVar4 == 0;
  uVar5 = *(undefined4 *)(puVar1 + 0x5c);
  uVar3 = FUN_002f69c4("musicOff",8);
  iVar4 = FUN_00027508(uVar5,uVar3);
  puVar1[0x55] = iVar4 == 0;
  uVar5 = *(undefined4 *)(puVar1 + 0x5c);
  uVar3 = FUN_002f69c4("voOff",5);
  iVar4 = FUN_00027508(uVar5,uVar3);
  puVar1[0x56] = iVar4 == 0;
  uVar6 = *(undefined4 *)(puVar1 + 0x5c);
  uVar3 = FUN_002f69c4("soundOff",8);
  uVar8 = *(undefined4 *)(puVar1 + 0x5c);
  uVar5 = FUN_002f69c4("soundOff",8);
  iVar4 = FUN_00027508(uVar8,uVar5);
  FUN_00027588(uVar6,"soundOff",uVar3,-iVar4,0,1);
  uVar6 = *(undefined4 *)(puVar1 + 0x5c);
  uVar3 = FUN_002f69c4("musicOff",8);
  uVar8 = *(undefined4 *)(puVar1 + 0x5c);
  uVar5 = FUN_002f69c4("musicOff",8);
  iVar4 = FUN_00027508(uVar8,uVar5);
  FUN_00027588(uVar6,"musicOff",uVar3,-iVar4,0,1);
  uVar8 = *(undefined4 *)(puVar1 + 0x5c);
  uVar3 = FUN_002f69c4("voOff",5);
  uVar6 = *(undefined4 *)(puVar1 + 0x5c);
  uVar5 = FUN_002f69c4("voOff",5);
  iVar4 = FUN_00027508(uVar6,uVar5);
  FUN_00027588(uVar8,"voOff",uVar3,-iVar4,0,1);
  FUN_00015758();
  FUN_0000342c();
  FUN_000035e8();
  FUN_0002c450();
  FUN_0002c8f0();
  puVar7 = &DAT_00024474;
  if (puVar1[0xb] == '\x13') {
    puVar7 = &DAT_00024478;
  }
  uVar3 = FUN_0031fa44();
  FUN_0031ff48(uVar3,0x3f800000,*puVar7,2,0);
  return;
}


```

