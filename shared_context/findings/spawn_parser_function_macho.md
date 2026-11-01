# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_000537ec — 000537ec

- 函数名: FUN_000537ec
- 函数体: 935 字节
- 调用者数: 1 / 被调用者数: 13

```c

undefined4 FUN_000537ec(int param_1,undefined4 *param_2)

{
  char cVar1;
  int iVar2;
  size_t sVar3;
  undefined4 uVar4;
  uint uVar5;
  ulong uVar6;
  void *pvVar7;
  byte *pbVar8;
  undefined1 uVar9;
  char *pcVar10;
  float fVar11;
  undefined8 uVar12;
  undefined4 local_2c;
  undefined4 local_28;
  undefined4 local_24;
  double local_20;
  
  if (((DAT_005a7938 & 1) == 0) && (iVar2 = ___cxa_guard_acquire(&DAT_005a7938), iVar2 != 0)) {
    DAT_005a7934 = FUN_002f69c4("Spawn",5);
    ___cxa_guard_release(&DAT_005a7938);
  }
  pcVar10 = (char *)(*(int *)(param_1 + 0x20) + 8);
  sVar3 = _strlen(pcVar10);
  iVar2 = FUN_002f69c4(pcVar10,sVar3);
  uVar4 = 0;
  if (iVar2 == DAT_005a7934) {
    uVar4 = FUN_0030c660(param_1,"type");
    uVar5 = FUN_000395ac(uVar4,param_2 + 1);
    param_2[4] = uVar5;
    if (0 < (int)uVar5) {
      uVar6 = (ulong)((ulonglong)uVar5 * 4);
      if ((int)((ulonglong)uVar5 * 4 >> 0x20) != 0) {
        uVar6 = 0xffffffff;
      }
      pvVar7 = operator_new__(uVar6);
      iVar2 = 0;
      *param_2 = pvVar7;
      do {
        *(undefined4 *)((int)pvVar7 + iVar2 * 4) = 0xffffffff;
        iVar2 = iVar2 + 1;
      } while (iVar2 < (int)uVar5);
    }
    iVar2 = FUN_0030c718(param_1,"min",&local_20);
    if (iVar2 == 0) {
      param_2[0x17] = (float)local_20;
    }
    iVar2 = FUN_0030c718(param_1,"max",&local_20);
    if (iVar2 == 0) {
      param_2[0x19] = (float)local_20;
    }
    iVar2 = FUN_0030c718(param_1,"mininc",&local_20);
    if (iVar2 == 0) {
      param_2[0x1a] = (float)local_20;
    }
    iVar2 = FUN_0030c718(param_1,"maxinc",&local_20);
    if (iVar2 == 0) {
      param_2[0x1a] = (float)local_20;
    }
    iVar2 = FUN_0030c718(param_1,"delay",&local_20);
    if (iVar2 == 0) {
      param_2[0x1b] = (float)local_20;
    }
    iVar2 = FUN_0030c718(param_1,"delayinc",&local_20);
    if (iVar2 == 0) {
      param_2[0x1c] = (float)local_20;
    }
    iVar2 = FUN_0030c718(param_1,"horizmin",&local_20);
    if (iVar2 == 0) {
      param_2[0x14] = (float)local_20;
    }
    iVar2 = FUN_0030c718(param_1,"horizmax",&local_20);
    if (iVar2 == 0) {
      param_2[0x15] = (float)local_20;
    }
    iVar2 = FUN_0030c718(param_1,"velscale",&local_20);
    if (iVar2 == 0) {
      fVar11 = (float)local_20;
      param_2[0x12] = fVar11;
    }
    else {
      fVar11 = (float)param_2[0x12];
    }
    param_2[0x13] = fVar11;
    iVar2 = FUN_0030c718(fVar11,param_1,"velXscale",&local_20);
    if (iVar2 == 0) {
      param_2[0x12] = (float)local_20;
    }
    iVar2 = FUN_0030c718(param_1,"velYscale",&local_20);
    if (iVar2 == 0) {
      param_2[0x13] = (float)local_20;
    }
    iVar2 = FUN_0030c718(param_1,"dt",&local_20);
    if (iVar2 == 0) {
      param_2[5] = (float)local_20;
    }
    iVar2 = FUN_0030c718(param_1,"velX",&local_20);
    if (iVar2 == 0) {
      param_2[0x10] = (float)local_20;
    }
    iVar2 = FUN_0030c718(param_1,"velY",&local_20);
    if (iVar2 == 0) {
      param_2[0x11] = (float)local_20;
    }
    FUN_0030c6c0(param_1,"posX",param_2 + 0xb);
    FUN_0030c6c0(param_1,"posY",param_2 + 0xc);
    FUN_0030c6c0(param_1,"sin",param_2 + 0xd);
    FUN_0030c6c0(param_1,"cos",param_2 + 0xe);
    FUN_0030c6c0(param_1,"radius",param_2 + 0xf);
    pcVar10 = (char *)FUN_0030c660(param_1,"gravity");
    cVar1 = '\0';
    if (pcVar10 != (char *)0x0) {
      cVar1 = *pcVar10;
    }
    if (pcVar10 != (char *)0x0 && cVar1 != '\0') {
      FUN_000394a0(&local_2c);
      param_2[8] = local_2c;
      param_2[9] = local_28;
      param_2[10] = local_24;
    }
    uVar4 = FUN_0030c660(param_1,"override");
    FUN_00058528(param_2,uVar4);
    uVar12 = FUN_0030c660(param_1,"placement");
    uVar5 = (uint)((ulonglong)uVar12 >> 0x20);
    pbVar8 = (byte *)uVar12;
    if (pbVar8 != (byte *)0x0) {
      uVar5 = (uint)*pbVar8;
    }
    if (pbVar8 == (byte *)0x0 || uVar5 == 0) {
      uVar4 = 0;
    }
    else {
      uVar4 = FUN_000531b8();
    }
    param_2[0x16] = uVar4;
    uVar9 = 0;
    param_2[0x21] = 0;
    FUN_0030c6c0(param_1,"replaceWithChallengeFruit",param_2 + 0x21);
    pcVar10 = (char *)FUN_0030c660(param_1,"mirror");
    if ((pcVar10 != (char *)0x0) && (iVar2 = _strcmp("true",pcVar10), iVar2 == 0)) {
      uVar9 = 1;
    }
    uVar4 = 1;
    *(undefined1 *)(param_2 + 0x23) = uVar9;
  }
  return uVar4;
}


```

## FUN_000537b4 — 000537b4

- 函数名: FUN_000537b4
- 函数体: 55 字节
- 调用者数: 1 / 被调用者数: 0

```c

undefined4 FUN_000537b4(int param_1,undefined4 param_2)

{
  int *piVar1;
  int iVar2;
  uint uVar3;
  
  uVar3 = 0;
  do {
    if ((uint)(*(int *)(param_1 + 0x220) - *(int *)(param_1 + 0x21c) >> 2) <= uVar3) {
      return 0;
    }
    piVar1 = *(int **)(*(int *)(param_1 + 0x21c) + uVar3 * 4);
    iVar2 = (**(code **)(*piVar1 + 8))(piVar1,param_2);
    uVar3 = uVar3 + 1;
  } while (iVar2 != 1);
  return *(undefined4 *)(*(int *)(param_1 + 0x21c) + uVar3 * 4 + -4);
}


```

