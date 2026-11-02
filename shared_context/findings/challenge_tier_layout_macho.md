# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0006ea38 — 0006ea38

- 函数名: FUN_0006ea38
- 函数体: 417 字节
- 调用者数: 1 / 被调用者数: 8

```c

int FUN_0006ea38(int param_1,undefined4 param_2,undefined4 param_3)

{
  int iVar1;
  char *pcVar2;
  undefined4 uVar3;
  size_t sVar4;
  undefined4 local_24;
  double local_20;
  
  FUN_0003994c(param_1 + 0x40,4);
  *(undefined4 *)(param_1 + 0x6c) = 0;
  *(undefined4 *)(param_1 + 0x70) = 0;
  *(undefined4 *)(param_1 + 0x74) = 0;
  *(undefined4 *)(param_1 + 0xa4) = param_3;
  *(undefined4 *)(param_1 + 0x78) = 0;
  *(undefined4 *)(param_1 + 0x90) = 0;
  *(undefined4 *)(param_1 + 0x7c) = 4;
  *(undefined4 *)(param_1 + 0xb0) = 0;
  iVar1 = FUN_0030c660(param_2,"name");
  if (iVar1 != 0) {
    FUN_002f7050(param_1);
  }
  local_24 = 3;
  FUN_0030c6c0(param_2,"numRounds",&local_24);
  *(undefined4 *)(param_1 + 0x7c) = local_24;
  *(undefined4 *)(param_1 + 0x88) = local_24;
  *(undefined4 *)(param_1 + 0x8c) = local_24;
  FUN_0030c6c0(param_2,"numRoundsMin",(undefined4 *)(param_1 + 0x88));
  FUN_0030c6c0(param_2,"numRoundsMax",(undefined4 *)(param_1 + 0x8c));
  pcVar2 = (char *)FUN_0030c660(param_2,"background");
  uVar3 = 0;
  if (pcVar2 != (char *)0x0) {
    sVar4 = _strlen(pcVar2);
    uVar3 = FUN_002f69c4(pcVar2,sVar4);
  }
  *(undefined4 *)(param_1 + 0xac) = uVar3;
  *(undefined4 *)(param_1 + 0x9c) = 0x3f800000;
  *(undefined4 *)(param_1 + 0xa0) = 0;
  iVar1 = FUN_0030c718(param_2,"dtStart",&local_20);
  if (iVar1 == 0) {
    *(float *)(param_1 + 0x9c) = (float)local_20;
  }
  iVar1 = FUN_0030c718(param_2,"dtRoundIncrement",&local_20);
  if (iVar1 == 0) {
    *(float *)(param_1 + 0xa0) = (float)local_20;
  }
  *(undefined4 *)(param_1 + 0x94) = 0;
  pcVar2 = (char *)FUN_0030c660(param_2,"progression");
  if (pcVar2 != (char *)0x0) {
    sVar4 = _strlen(pcVar2);
    iVar1 = FUN_002f69c4(pcVar2,sVar4);
    if (iVar1 == DAT_005a85f4) {
      *(undefined4 *)(param_1 + 0x94) = 1;
    }
  }
  uVar3 = FUN_000658a4(param_2);
  *(undefined4 *)(param_1 + 0xa8) = uVar3;
  *(undefined4 *)(param_1 + 0x98) = 0;
  pcVar2 = (char *)FUN_0030c660(param_2,"bossId");
  if (pcVar2 != (char *)0x0) {
    sVar4 = _strlen(pcVar2);
    uVar3 = FUN_002f69c4(pcVar2,sVar4);
    *(undefined4 *)(param_1 + 0x98) = uVar3;
  }
  *(undefined4 *)(param_1 + 0x70) = *(undefined4 *)(param_1 + 0x6c);
  return param_1;
}


```

