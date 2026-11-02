# 字符串定位报告（立即数扫描）

- 程序: FruitNinjaPuss
- 已定义函数: 27873
- 命中函数: 1，裸引用点(未纳入函数): 0

## FUN_00062698 — 00062698
命中: customWave@0041c1be

```c

undefined4 FUN_00062698(char *param_1,undefined4 param_2)

{
  char *pcVar1;
  undefined4 uVar2;
  size_t sVar3;
  int iVar4;
  char *pcVar5;
  int iVar6;
  char *pcVar7;
  char *pcVar8;
  undefined4 local_40;
  undefined4 local_3c;
  undefined4 local_38;
  undefined4 local_34;
  undefined4 uStack_30;
  undefined4 uStack_2c;
  undefined4 local_28;
  undefined4 local_24;
  
  uVar2 = FUN_0030c660(param_2,"name");
  FUN_002f7050(param_1,uVar2);
  sVar3 = _strlen(param_1);
  uVar2 = FUN_002f69c4(param_1,sVar3);
  *(undefined4 *)(param_1 + 0x40) = uVar2;
  iVar4 = FUN_0030c660(param_2,"prioritySelection");
  if (iVar4 != 0) {
    param_1[0x58] = '\x01';
  }
  iVar4 = FUN_0030c660(param_2,"instructions");
  if (iVar4 == 0) {
    pcVar5 = "No Instructions";
  }
  else {
    pcVar5 = (char *)FUN_00038844(iVar4,0);
  }
  FUN_002f7050(param_1 + 0x5a,pcVar5);
  iVar4 = FUN_0030c660(param_2,"challengeFruitSize");
  if (iVar4 == 0) {
    uVar2 = 0;
  }
  else {
    iVar6 = FUN_002f7060(iVar4,"small");
    if (iVar6 == 0) {
      uVar2 = 1;
    }
    else {
      iVar6 = FUN_002f7060(iVar4,"medium");
      if (iVar6 == 0) {
        uVar2 = 2;
      }
      else {
        iVar4 = FUN_002f7060(iVar4,"big");
        if (iVar4 != 0) goto LAB_0006277a;
        uVar2 = 3;
      }
    }
  }
  *(undefined4 *)(param_1 + 0x4c) = uVar2;
LAB_0006277a:
  pcVar5 = param_1 + 0xdc;
  pcVar1 = *(char **)pcVar5;
  while (pcVar1 != pcVar5) {
    pcVar7 = *(char **)pcVar1;
    operator_delete(pcVar1);
    pcVar1 = pcVar7;
  }
  *(char **)(param_1 + 0xdc) = pcVar5;
  *(char **)(param_1 + 0xe0) = pcVar5;
  pcVar1 = param_1 + 0xe4;
  pcVar7 = *(char **)pcVar1;
  while (pcVar7 != pcVar1) {
    pcVar8 = *(char **)pcVar7;
    operator_delete(pcVar7);
    pcVar7 = pcVar8;
  }
  *(char **)(param_1 + 0xe4) = pcVar1;
  *(char **)(param_1 + 0xe8) = pcVar1;
  iVar4 = FUN_0030c328(param_2,"condition");
  if (iVar4 != 0) {
    do {
      pcVar7 = (char *)FUN_0030c660(iVar4,"name");
      if (pcVar7 != (char *)0x0) {
        sVar3 = _strlen(pcVar7);
        local_24 = FUN_002f69c4(pcVar7,sVar3);
        FUN_0006309c(pcVar5,pcVar5,&local_24);
      }
      iVar4 = FUN_0030c3a0(iVar4,"condition");
    } while (iVar4 != 0);
  }
  iVar4 = FUN_0030c328(param_2,"mod");
  if (iVar4 != 0) {
    do {
      pcVar5 = (char *)FUN_0030c660(iVar4,"name");
      if (pcVar5 != (char *)0x0) {
        sVar3 = _strlen(pcVar5);
        local_28 = FUN_002f69c4(pcVar5,sVar3);
        FUN_0006307c(pcVar1,pcVar1,&local_28);
      }
      iVar4 = FUN_0030c3a0(iVar4,"mod");
    } while (iVar4 != 0);
  }
  uVar2 = FUN_0030c328(param_2,"bonusMods");
  FUN_00065958(&local_34,uVar2);
  *(undefined4 *)(param_1 + 0xec) = local_34;
  *(undefined4 *)(param_1 + 0xf0) = uStack_30;
  *(undefined4 *)(param_1 + 0xf4) = uStack_2c;
  FUN_0030c6c0(param_2,"points",&local_38);
  *(undefined4 *)(param_1 + 0xf8) = local_38;
  local_3c = 1;
  FUN_0030c6c0(param_2,"numWaves",&local_3c);
  *(undefined4 *)(param_1 + 0xfc) = local_3c;
  pcVar5 = (char *)FUN_0030c660(param_2,"customWave");
  if (pcVar5 != (char *)0x0) {
    sVar3 = _strlen(pcVar5);
    uVar2 = FUN_002f69c4(pcVar5,sVar3);
    *(undefined4 *)(param_1 + 0x44) = uVar2;
  }
  local_40 = 0;
  FUN_0030c6c0(param_2,"timeLimit",&local_40);
  *(undefined4 *)(param_1 + 0x48) = local_40;
  param_1[0x51] = '\0';
  pcVar5 = (char *)FUN_0030c660(param_2,"startActive");
  if (pcVar5 != (char *)0x0) {
    sVar3 = _strlen(pcVar5);
    iVar4 = FUN_002f69c4(pcVar5,sVar3);
    param_1[0x51] = iVar4 == DAT_005a8064;
  }
  param_1[0x50] = *(int *)(param_1 + 0xfc) == 1;
  pcVar5 = (char *)FUN_0030c660(param_2,"forceWave");
  if (pcVar5 != (char *)0x0) {
    sVar3 = _strlen(pcVar5);
    iVar4 = FUN_002f69c4(pcVar5,sVar3);
    param_1[0x50] = iVar4 == DAT_005a8064;
  }
  pcVar5 = (char *)FUN_0030c660(param_2,"type");
  if (pcVar5 != (char *)0x0) {
/* ...截断... */
```

