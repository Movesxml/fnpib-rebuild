# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0006104c — 0006104c

- 函数名: FUN_0006104c
- 函数体: 65 字节
- 调用者数: 0 / 被调用者数: 1

```c

undefined4 FUN_0006104c(int param_1)

{
  undefined4 uVar1;
  float fVar2;
  
  uVar1 = 0;
  if (*(int *)(param_1 + 0x40) == 2) {
    fVar2 = (float)FUN_0005ee84(&DAT_005f94b4);
    uVar1 = 1;
    if (fVar2 == 0.0) {
      if (*(int *)(param_1 + 100) == 0) {
        return 0;
      }
      uVar1 = 0;
      if (*(int *)(*(int *)(param_1 + 100) + 0x48) != 0) {
        uVar1 = 1;
      }
    }
  }
  return uVar1;
}


```

## FUN_0005f928 — 0005f928

- 函数名: FUN_0005f928
- 函数体: 35 字节
- 调用者数: 0 / 被调用者数: 2

```c

undefined4 * FUN_0005f928(undefined4 *param_1)

{
  *param_1 = &DAT_005389a8;
  FUN_0005fb30(param_1);
  FUN_00074178(param_1);
  return param_1;
}


```

## FUN_0005f900 — 0005f900

- 函数名: FUN_0005f900
- 函数体: 39 字节
- 调用者数: 0 / 被调用者数: 3

```c

void FUN_0005f900(undefined4 *param_1)

{
  *param_1 = &DAT_005389a8;
  FUN_0005fb30(param_1);
  FUN_00074178(param_1);
  operator_delete(param_1);
  return;
}


```

## FUN_0005fb28 — 0005fb28

- 函数名: FUN_0005fb28
- 函数体: 5 字节
- 调用者数: 1 / 被调用者数: 0

```c

void FUN_0005fb28(int param_1)

{
  *(undefined4 *)(param_1 + 0x70) = 0;
  return;
}


```

## FUN_0005f94c — 0005f94c

- 函数名: FUN_0005f94c
- 函数体: 471 字节
- 调用者数: 1 / 被调用者数: 15

```c

void FUN_0005f94c(int param_1)

{
  uint *puVar1;
  longlong lVar2;
  float fVar3;
  undefined *puVar4;
  void *pvVar5;
  int iVar6;
  undefined4 *puVar7;
  uint uVar8;
  undefined4 uVar9;
  int iVar10;
  int iVar11;
  uint uVar12;
  int *piVar13;
  int *piVar14;
  uint *puVar15;
  undefined4 extraout_s1;
  undefined8 uVar17;
  undefined8 uVar18;
  undefined8 uVar19;
  undefined1 auStack_50 [40];
  undefined1 local_28 [4];
  int local_24;
  int *piVar16;
  
  puVar4 = PTR_DAT_004d9048;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_000274bc(*(undefined4 *)(PTR_DAT_004d9048 + 0x5c),"challenge_hard_pass",0,1,1);
  *(undefined1 *)(param_1 + 0xa0) = 1;
  *(undefined4 *)(param_1 + 0x40) = 0;
  *(undefined1 *)(param_1 + 0x8c) = 1;
  *(undefined4 *)(param_1 + 0x74) = 0;
  pvVar5 = operator_new(0xbc);
  FUN_00067e50();
  *(void **)(param_1 + 0x90) = pvVar5;
  iVar6 = FUN_0001cfb0(*(undefined4 *)(puVar4 + 0x654),"inGameChallengeHud",1);
  *(int *)(param_1 + 4) = iVar6;
  local_28[0] = 1;
  FUN_0001da28(*(undefined4 *)(iVar6 + 0x260),local_28);
  puVar7 = operator_new(0x4c);
  *puVar7 = &DAT_0052cb3c;
  puVar7[1] = 0;
  puVar7[2] = 0;
  puVar7[3] = 0;
  puVar7[4] = 0;
  puVar7[5] = 0;
  _memset(puVar7 + 7,0,0x2c);
  *(undefined4 **)(param_1 + 0x78) = puVar7;
  uVar9 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_50,"@popups");
  uVar9 = FUN_0039725c(uVar9,auStack_50);
  FUN_00066540(puVar7,uVar9);
  FUN_0030f7e0(auStack_50);
  FUN_00066398(param_1 + 8,*(undefined4 *)(param_1 + 0x78));
  FUN_00066a7c(param_1 + 0x48);
  DAT_005f950c = 0;
  iVar6 = *DAT_005f94f8;
  *(int *)(param_1 + 0x68) = iVar6;
  puVar4 = PTR_DAT_004d9050;
  fVar3 = DAT_0005fb24;
  iVar10 = *(int *)(iVar6 + 0x88);
  iVar11 = *(int *)(iVar6 + 0x8c);
  if (iVar10 != iVar11) {
    piVar13 = (int *)(PTR_DAT_004d9050 + 0xc);
    uVar8 = *(uint *)PTR_DAT_004d9050;
    piVar14 = (int *)(PTR_DAT_004d9050 + 4);
    puVar1 = (uint *)(PTR_DAT_004d9050 + 8);
    puVar15 = (uint *)(PTR_DAT_004d9050 + 0x10);
    piVar16 = (int *)(PTR_DAT_004d9050 + 0x14);
    lVar2 = (ulonglong)uVar8 * (ulonglong)*puVar1;
    uVar12 = (uint)lVar2;
    *(uint *)PTR_DAT_004d9050 = uVar12 + *puVar15;
    uVar8 = *piVar14 * *puVar1 + uVar8 * *piVar13 + (int)((ulonglong)lVar2 >> 0x20) +
            *piVar16 + (uint)CARRY4(uVar12,*puVar15);
    *(uint *)(puVar4 + 4) = uVar8;
    uVar9 = (undefined4)((ulonglong)uVar8 * 0x7ffff >> 0x20);
    iVar11 = iVar11 - iVar10;
    uVar17 = FixedToFP(CONCAT44(uVar9,uVar9),0,1,0,0x20);
    uVar19 = FixedToFP(CONCAT44(iVar11,iVar11),0,0,0,0x20);
    uVar18 = FixedToFP(CONCAT44(iVar10,iVar10),0,0,0,0x20);
    uVar17 = FloatVectorMult(uVar19,CONCAT44(extraout_s1,(float)uVar17 / fVar3),2,0x20);
    uVar17 = FloatVectorAdd(uVar18,uVar17,2);
    uVar17 = FPToFixed(uVar17,0,0,3,0x20);
    iVar10 = (int)uVar17;
  }
  *(int *)(iVar6 + 0x7c) = iVar10;
  *(undefined4 *)(iVar6 + 0x80) = 0;
  *(undefined4 *)(iVar6 + 0x84) = 0;
  FUN_0006ee88();
  FUN_00067f1c(*(undefined4 *)(param_1 + 0x90),param_1);
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0005fb98 — 0005fb98

- 函数名: FUN_0005fb98
- 函数体: 131 字节
- 调用者数: 0 / 被调用者数: 6

```c

void FUN_0005fb98(int param_1)

{
  undefined *puVar1;
  int iVar2;
  int *piVar3;
  code *pcVar4;
  undefined1 auStack_48 [40];
  int local_20;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_20 = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined1 *)(param_1 + 0xa0) = 1;
  iVar2 = FUN_0002ede8();
  *(undefined4 *)(param_1 + 0x1a4) = *(undefined4 *)(*(int *)(iVar2 + 4) + 8);
  FUN_0005fc1c(param_1);
  FUN_00067f94(*(undefined4 *)(param_1 + 0x90));
  *(undefined4 *)(param_1 + 0x40) = 3;
  piVar3 = *(int **)(param_1 + 4);
  pcVar4 = *(code **)(*piVar3 + 0x40);
  FUN_0030f7cc(auStack_48,"animate_in_start");
  (*pcVar4)(piVar3,auStack_48,1);
  FUN_0030f7e0(auStack_48);
  if (*(int *)puVar1 != local_20) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail(*(undefined4 *)(param_1 + 4));
  }
  return;
}


```

## FUN_000617b0 — 000617b0

- 函数名: FUN_000617b0
- 函数体: 53 字节
- 调用者数: 0 / 被调用者数: 1

```c

undefined4 FUN_000617b0(int param_1)

{
  undefined4 uVar1;
  int iVar2;
  
  uVar1 = 0;
  if (*(int *)(param_1 + 0x40) != 2) {
    uVar1 = 1;
    if (*(int *)(param_1 + 100) != 0) {
      if (*(char *)(*(int *)(param_1 + 100) + 0x51) == '\0') {
        return 1;
      }
      iVar2 = FUN_0005edbc(&DAT_005f94b4);
      uVar1 = 0;
      if (iVar2 != 0) {
        uVar1 = 1;
      }
    }
  }
  return uVar1;
}


```

## FUN_000617f4 — 00062698

- 函数名: FUN_00062698
- 函数体: 825 字节
- 调用者数: 1 / 被调用者数: 14

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
    sVar3 = _strlen(pcVar5);
    FUN_002f69c4(pcVar5,sVar3);
    uVar2 = FUN_000607f8();
    *(undefined4 *)(param_1 + 0x100) = uVar2;
  }
  return 1;
}


```

## FUN_00061814 — 00062698

- 函数名: FUN_00062698
- 函数体: 825 字节
- 调用者数: 1 / 被调用者数: 14

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
    sVar3 = _strlen(pcVar5);
    FUN_002f69c4(pcVar5,sVar3);
    uVar2 = FUN_000607f8();
    *(undefined4 *)(param_1 + 0x100) = uVar2;
  }
  return 1;
}


```

## FUN_00060e54 — 00060e54

- 函数名: FUN_00060e54
- 函数体: 51 字节
- 调用者数: 0 / 被调用者数: 2

```c

void FUN_00060e54(int param_1)

{
  if (*(char *)(param_1 + 0x7c) != '\0') {
    return;
  }
  FUN_0005edc4(&DAT_005f94b4);
  *(undefined1 *)(param_1 + 0x7c) = 1;
  FUN_00064090(&DAT_005f94e4);
  return;
}


```

## FUN_00060e88 — 00060e88

- 函数名: FUN_00060e88
- 函数体: 19 字节
- 调用者数: 0 / 被调用者数: 1

```c

void FUN_00060e88(void)

{
  FUN_000640b0(&DAT_005f94e4);
  return;
}


```

## FUN_00060fcc — 00060fcc

- 函数名: FUN_00060fcc
- 函数体: 59 字节
- 调用者数: 0 / 被调用者数: 2

```c

void FUN_00060fcc(int param_1,undefined4 param_2)

{
  if (0.0 < *(float *)(PTR_DAT_004d9048 + 0x24)) {
    return;
  }
  FUN_00065f04(param_1 + 8,param_2);
  FUN_000640d0(&DAT_005f94e4,param_2);
  return;
}


```

## FUN_00060fb8 — 00060fb8

- 函数名: FUN_00060fb8
- 函数体: 19 字节
- 调用者数: 0 / 被调用者数: 1

```c

void FUN_00060fb8(void)

{
  FUN_000640f0(&DAT_005f94e4);
  return;
}


```

## FUN_00061008 — 00061008

- 函数名: FUN_00061008
- 函数体: 11 字节
- 调用者数: 0 / 被调用者数: 1

```c

void FUN_00061008(int param_1)

{
  FUN_00065da8(param_1 + 8);
  return;
}


```

## FUN_00061020 — 00061020

- 函数名: FUN_00061020
- 函数体: 41 字节
- 调用者数: 0 / 被调用者数: 2

```c

void FUN_00061020(undefined4 param_1,undefined4 *param_2)

{
  undefined4 local_14;
  undefined4 local_10;
  undefined4 local_c;
  
  local_14 = *param_2;
  local_10 = param_2[1];
  local_c = param_2[2];
  FUN_0007417c(param_1,&local_14);
  FUN_0005ee7c(&DAT_005f94b4);
  return;
}


```

## FUN_00061014 — 00061014

- 函数名: FUN_00061014
- 函数体: 11 字节
- 调用者数: 0 / 被调用者数: 1

```c

void FUN_00061014(int param_1)

{
  FUN_00065b98(param_1 + 8);
  return;
}


```

## FUN_00060e9c — 000619d0

- 函数名: FUN_000619d0
- 函数体: 3131 字节
- 调用者数: 1 / 被调用者数: 53

```c

void FUN_000619d0(int *param_1,int param_2)

{
  longlong lVar1;
  undefined *puVar2;
  int iVar3;
  undefined4 uVar4;
  undefined4 *puVar5;
  float fVar6;
  float fVar7;
  uint uVar8;
  uint uVar9;
  uint uVar10;
  int iVar11;
  undefined1 uVar12;
  int iVar13;
  int *piVar14;
  undefined1 *puVar15;
  int *piVar16;
  undefined4 *puVar17;
  code *pcVar18;
  float fVar19;
  undefined8 uVar20;
  undefined4 extraout_s1;
  undefined4 uVar21;
  undefined4 extraout_s1_00;
  undefined4 extraout_s3;
  undefined4 uVar23;
  undefined8 uVar22;
  undefined4 extraout_s3_00;
  undefined4 extraout_s5;
  undefined4 uVar25;
  undefined8 uVar24;
  undefined4 extraout_s5_00;
  undefined4 extraout_s7;
  undefined4 extraout_s7_00;
  undefined4 local_2f4;
  undefined **local_2f0;
  undefined *local_2ec;
  undefined4 local_2e8 [8];
  undefined1 local_2c8;
  undefined4 local_2c4;
  undefined4 local_2c0;
  undefined4 local_2bc;
  undefined4 local_2b8;
  undefined4 local_2b4;
  undefined1 auStack_2b0 [40];
  undefined1 auStack_288 [40];
  undefined1 auStack_260 [40];
  undefined1 auStack_238 [40];
  undefined1 auStack_210 [40];
  undefined1 auStack_1e8 [40];
  undefined1 auStack_1c0 [40];
  undefined1 auStack_198 [40];
  undefined1 auStack_170 [40];
  undefined1 auStack_148 [40];
  undefined1 auStack_120 [40];
  undefined1 auStack_f8 [40];
  undefined1 auStack_d0 [40];
  undefined1 auStack_a8 [40];
  undefined1 auStack_80 [40];
  undefined1 auStack_58 [40];
  undefined1 local_30 [4];
  int local_2c;
  
  local_2c = *(int *)PTR____stack_chk_guard_004d9044;
  (**(code **)(*param_1 + 0x20))(param_1);
  *(undefined1 *)(param_1 + 0x28) = 0;
  param_1[0x10] = *(int *)(param_2 + 0x178);
  iVar13 = -1;
  for (piVar16 = *(int **)(param_2 + 0x16c); piVar16 != (int *)(param_2 + 0x16c);
      piVar16 = (int *)*piVar16) {
    iVar3 = piVar16[0x22];
    if ((-1 < iVar3) && (iVar3 < DAT_005f94fc - DAT_005f94f8 >> 2)) {
      FUN_0006f040(*(undefined4 *)(DAT_005f94f8 + iVar3 * 4),piVar16 + 2,piVar16[0x23],piVar16[0x24]
                  );
      if (iVar13 <= piVar16[0x22]) {
        iVar13 = piVar16[0x22];
      }
    }
  }
  iVar3 = *(int *)(param_2 + 0x1a4);
  iVar11 = *(int *)(param_2 + 0x1ac);
  piVar16 = param_1 + 0x12;
  *piVar16 = *(int *)(param_2 + 0x1a8);
  param_1[0x13] = iVar11;
  param_1[0x17] = iVar3;
  param_1[0x22] = *(int *)(param_2 + 0x1a0);
  iVar13 = *(int *)(DAT_005f94f8 + iVar13 * 4);
  param_1[0x1a] = iVar13;
  uVar9 = *(uint *)(param_2 + 0x17c);
  uVar8 = 0;
  if ((uVar9 != 0) && (uVar8 = *(int *)(iVar13 + 0x7c) - 1, uVar9 < uVar8)) {
    uVar8 = uVar9;
  }
  *(uint *)(iVar13 + 0x90) = uVar8;
  iVar13 = FUN_0006ed60();
  puVar2 = PTR_DAT_004d9048;
  param_1[0x19] = iVar13;
  iVar13 = FUN_00052f80();
  *(undefined4 *)(iVar13 + 0x208) = *(undefined4 *)(*(int *)(puVar2 + 0x5c) + 0x118);
  puVar5 = DAT_005f94d0;
  if ((undefined4 **)DAT_005f94d0 != &DAT_005f94d0) {
    do {
      puVar17 = (undefined4 *)*puVar5;
      operator_delete(puVar5);
      puVar5 = puVar17;
    } while ((undefined4 **)puVar17 != &DAT_005f94d0);
  }
  DAT_005f94d0 = &DAT_005f94d0;
  DAT_005f94d4 = &DAT_005f94d0;
  if (param_1[0x19] != 0) {
    FUN_0005ed54(&DAT_005f94b4,param_1[0x19] + 0xdc);
  }
  if (param_1[0x10] != 1) {
    iVar13 = FUN_0006ed58(param_1[0x1a],*(undefined4 *)(param_1[0x1a] + 0x90));
    FUN_0005edc0(&DAT_005f94b4,*(undefined4 *)(iVar13 + 4));
  }
  piVar14 = param_1 + 2;
  FUN_00066428(piVar14,param_2);
  FUN_000663a0(piVar14,&DAT_005f94b4);
  iVar13 = param_1[1];
  FUN_0030f7cc(auStack_58,"bonusIntro");
  iVar13 = FUN_0039725c(iVar13,auStack_58);
  param_1[0x25] = iVar13;
  FUN_0030f7e0(auStack_58);
  iVar13 = param_1[1];
  FUN_0030f7cc(auStack_80,"@bonusCheer");
  iVar13 = FUN_0039725c(iVar13,auStack_80);
  param_1[0x27] = iVar13;
  FUN_0030f7e0(auStack_80);
  if (param_1[0x24] != 0) {
    FUN_00068a04(param_1[0x24],param_2);
  }
  iVar13 = param_1[0x10];
  if (iVar13 == 3) {
    if (param_1[1] != 0) {
      local_30[0] = 0;
      FUN_0001da28(*(undefined4 *)(param_1[1] + 0x260),local_30);
    }
    goto LAB_0006211e;
  }
  if (iVar13 != 2) {
    if (iVar13 == 1) {
      puVar5 = DAT_005f94d0;
      if ((undefined4 **)DAT_005f94d0 != &DAT_005f94d0) {
        do {
          puVar17 = (undefined4 *)*puVar5;
          operator_delete(puVar5);
          puVar5 = puVar17;
        } while ((undefined4 **)puVar17 != &DAT_005f94d0);
      }
      DAT_005f94d0 = &DAT_005f94d0;
      DAT_005f94d4 = &DAT_005f94d0;
      FUN_0005ed54(&DAT_005f94b4,param_1[0x19] + 0xdc);
      uVar12 = 1;
      if ((param_1[0x1a] != 0) && (uVar12 = 0, *(int *)(param_1[0x1a] + 0x98) == 0)) {
        uVar12 = 1;
      }
      iVar13 = param_1[2];
      iVar11 = param_1[0x19];
      *(undefined4 *)(iVar13 + 0x48) = 0;
      *(undefined1 *)(iVar13 + 0x18) = 0;
      FUN_000664b4();
      iVar13 = *(int *)(iVar11 + 0xf0);
      iVar3 = *(int *)(iVar11 + 0xf4);
      param_1[7] = *(int *)(iVar11 + 0xec);
      param_1[8] = iVar13;
      param_1[9] = iVar3;
      param_1[8] = 0x3f800000;
      param_1[10] = 0x40400000;
      param_1[0xb] = 0;
      *(undefined1 *)(param_1 + 0xc) = uVar12;
      param_1[0xd] = 0;
      param_1[0xf] = 0;
      FUN_0006f6d8(param_1[0x19],param_1);
      puVar5 = DAT_005f94f0;
      if ((undefined4 **)DAT_005f94f0 != &DAT_005f94f0) {
        do {
          puVar17 = (undefined4 *)*puVar5;
          operator_delete(puVar5);
          puVar5 = puVar17;
        } while ((undefined4 **)puVar17 != &DAT_005f94f0);
      }
      DAT_005f94f0 = &DAT_005f94f0;
      DAT_005f94f4 = &DAT_005f94f0;
      iVar13 = param_1[1];
      iVar3 = param_1[0x19];
      FUN_0030f7cc(auStack_a8,"challengeMods");
      uVar4 = FUN_0039725c(iVar13,auStack_a8);
      FUN_00063e98(&DAT_005f94e4,iVar3 + 0xe4,uVar4);
      FUN_0030f7e0(auStack_a8);
      FUN_00066b18(piVar16);
      *(undefined1 *)(param_1 + 0x1f) = 0;
      FUN_000612d0(param_1);
      FUN_000613e4(param_1);
      iVar13 = param_1[1];
      FUN_0030f7cc(auStack_d0,"instructionsText");
      iVar13 = FUN_0039725c(iVar13,auStack_d0);
      FUN_0030f7e0(auStack_d0);
      iVar3 = param_1[1];
      FUN_0030f7cc(auStack_f8,"@bonusScoreCounter");
      iVar3 = FUN_0039725c(iVar3,auStack_f8);
      FUN_0030f7e0(auStack_f8);
      if (*(int *)(param_1[0x1a] + 0x98) == 0) {
        if (iVar3 != 0) {
          local_30[0] = 0;
          FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),local_30);
        }
      }
      else {
        if (iVar13 != 0) {
          local_30[0] = 0;
          FUN_0001da28(*(undefined4 *)(iVar13 + 0x260),local_30);
        }
        if (iVar3 != 0) {
          local_30[0] = 0;
          FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),local_30);
          FUN_0030f7cc(auStack_120,"text");
          iVar13 = FUN_0039725c(iVar3,auStack_120);
          FUN_0030f7e0(auStack_120);
          if (iVar13 != 0) {
            *(undefined4 *)(iVar13 + 0x884) = 0;
            FUN_003d0bf4(iVar13);
          }
          param_1[0x26] = iVar3;
        }
      }
      FUN_00064110(&DAT_005f94e4);
      FUN_00060514(param_1);
    }
    goto LAB_0006211e;
  }
  puVar5 = DAT_005f94d0;
  if ((undefined4 **)DAT_005f94d0 != &DAT_005f94d0) {
    do {
      puVar17 = (undefined4 *)*puVar5;
      operator_delete(puVar5);
      puVar5 = puVar17;
    } while ((undefined4 **)puVar17 != &DAT_005f94d0);
  }
  DAT_005f94d0 = &DAT_005f94d0;
  DAT_005f94d4 = &DAT_005f94d0;
  FUN_0005ed54(&DAT_005f94b4,param_1[0x19] + 0xdc);
  uVar12 = 1;
  if ((param_1[0x1a] != 0) && (uVar12 = 0, *(int *)(param_1[0x1a] + 0x98) == 0)) {
    uVar12 = 1;
  }
  iVar13 = param_1[2];
  iVar11 = param_1[0x19];
  *(undefined4 *)(iVar13 + 0x48) = 0;
  *(undefined1 *)(iVar13 + 0x18) = 0;
  FUN_000664b4();
  iVar13 = *(int *)(iVar11 + 0xf0);
  iVar3 = *(int *)(iVar11 + 0xf4);
  param_1[7] = *(int *)(iVar11 + 0xec);
  param_1[8] = iVar13;
  param_1[9] = iVar3;
  param_1[8] = 0x3f800000;
  param_1[10] = 0x40400000;
  param_1[0xb] = 0;
  *(undefined1 *)(param_1 + 0xc) = uVar12;
  param_1[0xd] = 0;
  param_1[0xf] = 0;
  puVar5 = DAT_005f94f0;
  if ((undefined4 **)DAT_005f94f0 != &DAT_005f94f0) {
    do {
      puVar17 = (undefined4 *)*puVar5;
      operator_delete(puVar5);
      puVar5 = puVar17;
    } while ((undefined4 **)puVar17 != &DAT_005f94f0);
  }
  DAT_005f94f0 = &DAT_005f94f0;
  DAT_005f94f4 = &DAT_005f94f0;
  iVar13 = param_1[1];
  iVar3 = param_1[0x19];
  FUN_0030f7cc(auStack_148,"challengeMods");
  uVar4 = FUN_0039725c(iVar13,auStack_148);
  FUN_00063e98(&DAT_005f94e4,iVar3 + 0xe4,uVar4);
  FUN_0030f7e0(auStack_148);
  FUN_00066b18(piVar16);
  FUN_000612d0(param_1);
  FUN_000613e4(param_1);
  iVar13 = param_1[1];
  FUN_0030f7cc(auStack_170,"instructionsText");
  iVar13 = FUN_0039725c(iVar13,auStack_170);
  FUN_0030f7e0(auStack_170);
  iVar3 = param_1[1];
  FUN_0030f7cc(auStack_198,"@bonusScoreCounter");
  iVar3 = FUN_0039725c(iVar3,auStack_198);
  FUN_0030f7e0(auStack_198);
  if (*(int *)(param_1[0x1a] + 0x98) == 0) {
    if (iVar3 != 0) {
      local_30[0] = 0;
      FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),local_30);
    }
  }
  else {
    if (iVar13 != 0) {
      local_30[0] = 0;
      FUN_0001da28(*(undefined4 *)(iVar13 + 0x260),local_30);
    }
    if (iVar3 != 0) {
      local_30[0] = 0;
      FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),local_30);
      FUN_0030f7cc(auStack_1c0,"text");
      iVar11 = FUN_0039725c(iVar3,auStack_1c0);
      FUN_0030f7e0(auStack_1c0);
      if (iVar11 != 0) {
        *(undefined4 *)(iVar11 + 0x884) = 0;
        FUN_003d0bf4(iVar11);
      }
      param_1[0x26] = iVar3;
    }
  }
  FUN_00064110(&DAT_005f94e4);
  iVar3 = param_1[1];
  FUN_0030f7cc(auStack_1e8,"Timer");
  piVar16 = (int *)FUN_0039725c(iVar3,auStack_1e8);
  FUN_0030f7e0(auStack_1e8);
  if (piVar16 != (int *)0x0) {
    local_30[0] = 1;
    FUN_0001da28(piVar16[0x98],local_30);
    FUN_00396d98(piVar16,1);
    fVar6 = (float)FUN_0005ee84(&DAT_005f94b4);
    fVar7 = fVar6;
    if (fVar6 == 0.0) {
      fVar7 = (float)param_1[0x19];
    }
    fVar19 = fVar6;
    if (fVar6 == 0.0) {
      fVar19 = *(float *)((int)fVar7 + 0x48);
    }
    uVar20 = FixedToFP(CONCAT44(fVar19,fVar6),0,0,0,0x20);
    if ((float)uVar20 <= *(float *)(param_2 + 0x19c)) {
      puVar15 = auStack_210;
      pcVar18 = *(code **)(*piVar16 + 0x40);
      FUN_0030f7cc(puVar15,"animate_in");
      (*pcVar18)(piVar16,puVar15,1);
LAB_000620cc:
      FUN_0030f7e0(puVar15);
    }
    else {
      FUN_0030f7cc(auStack_238,"animate_in");
      FUN_00398154(piVar16,auStack_238,1);
      FUN_0030f7e0(auStack_238);
      if (iVar13 != 0) {
        FUN_00396d98(iVar13,1);
        FUN_0030f7cc(auStack_260,"animate_in");
        FUN_00398154(iVar13,auStack_260,1);
        FUN_0030f7e0(auStack_260);
      }
      iVar13 = param_1[1];
      FUN_0030f7cc(auStack_288,"challengeMods");
      iVar13 = FUN_0039725c(iVar13,auStack_288);
      FUN_0030f7e0(auStack_288);
      if (iVar13 != 0) {
        FUN_00396d98(iVar13,1);
        puVar15 = auStack_2b0;
        FUN_0030f7cc(puVar15,"animate_in");
        FUN_00398154(iVar13,puVar15,1);
        goto LAB_000620cc;
      }
    }
    FUN_00084394(piVar16);
  }
  param_1[0x11] = *(int *)(param_2 + 0x19c);
  (**(code **)(*param_1 + 0x18))(param_1,0);
LAB_0006211e:
  iVar13 = FUN_00063fe0(&DAT_005f94e4,*(undefined4 *)PTR_DAT_004d9094);
  if (iVar13 == 1) {
    iVar13 = FUN_00063e80(&DAT_005f94e4,*(undefined4 *)PTR_DAT_004d9094);
    *(undefined4 *)(iVar13 + 0x10) = *(undefined4 *)(param_2 + 0x204);
    *(undefined4 *)(iVar13 + 0x14) = *(undefined4 *)(param_2 + 0x208);
    *(undefined4 *)(iVar13 + 0x18) = *(undefined4 *)(param_2 + 0x20c);
    *(undefined4 *)(iVar13 + 4) = *(undefined4 *)(param_2 + 0x210);
    *(undefined4 *)(iVar13 + 8) = *(undefined4 *)(param_2 + 0x214);
    *(undefined4 *)(iVar13 + 0xc) = *(undefined4 *)(param_2 + 0x218);
    local_2b4 = 0;
    uVar4 = FUN_000065c4();
    iVar13 = FUN_00006ad0(uVar4,1,&local_2b4);
    if (iVar13 != 0) {
      uVar4 = extraout_s7;
      uVar25 = extraout_s5;
      uVar23 = extraout_s3;
      uVar21 = extraout_s1;
      do {
        uVar24 = FloatVectorMult(CONCAT44(uVar25,*(undefined4 *)(iVar13 + 0xe8)),
                                 CONCAT44(uVar4,DAT_000620f0),2,0x20);
        uVar22 = FloatVectorMult(CONCAT44(uVar23,*(undefined4 *)(iVar13 + 0xec)),
                                 CONCAT44(uVar4,DAT_000620f0),2,0x20);
        uVar20 = FloatVectorMult(CONCAT44(uVar21,*(undefined4 *)(iVar13 + 0xf0)),
                                 CONCAT44(uVar4,DAT_000620f0),2,0x20);
        *(int *)(iVar13 + 0x28) = (int)uVar24;
        *(int *)(iVar13 + 0x2c) = (int)uVar22;
        *(int *)(iVar13 + 0x30) = (int)uVar20;
        FUN_0000c0b4((int)uVar20,iVar13,0);
        uVar4 = FUN_000065c4();
        iVar13 = FUN_00006af0(uVar4,1,&local_2b4);
        uVar4 = extraout_s7_00;
        uVar25 = extraout_s5_00;
        uVar23 = extraout_s3_00;
        uVar21 = extraout_s1_00;
      } while (iVar13 != 0);
    }
    iVar13 = 0;
    do {
      local_2b8 = 0;
      uVar4 = FUN_000065c4();
      iVar3 = FUN_00006ad0(uVar4,1,&local_2b8);
      if (iVar3 != 0) {
        iVar11 = 0;
        fVar7 = DAT_000620f4;
        do {
          if ((((*(float *)(iVar3 + 0x28) != *(float *)(iVar3 + 0xe8)) ||
               (*(float *)(iVar3 + 0x2c) != *(float *)(iVar3 + 0xec))) ||
              (*(float *)(iVar3 + 0x30) != *(float *)(iVar3 + 0xf0))) &&
             ((fVar7 < *(float *)(iVar3 + 0xbc) && ((*(uint *)(iVar3 + 0xc) & 0x10) == 0)))) {
            iVar11 = iVar3;
            fVar7 = *(float *)(iVar3 + 0xbc);
          }
          uVar4 = FUN_000065c4();
          iVar3 = FUN_00006af0(uVar4,1,&local_2b8);
        } while (iVar3 != 0);
        if (iVar11 != 0) {
          *(undefined4 *)(iVar11 + 0x28) = *(undefined4 *)(iVar11 + 0xe8);
          *(undefined4 *)(iVar11 + 0x2c) = *(undefined4 *)(iVar11 + 0xec);
          *(undefined4 *)(iVar11 + 0x30) = *(undefined4 *)(iVar11 + 0xf0);
          FUN_0000c0b4(iVar11,1);
        }
      }
      iVar13 = iVar13 + 1;
    } while (iVar13 != 3);
  }
  iVar13 = FUN_00063fa0(&DAT_005f94e4,"FloatingFruit");
  if ((iVar13 != 0) || (iVar13 = FUN_00064000(&DAT_005f94e4,3), iVar13 == 1)) {
    local_2bc = 0;
    uVar4 = FUN_000065c4();
    iVar13 = FUN_00006ad0(uVar4,1,&local_2bc);
    if (iVar13 != 0) {
      do {
        *(undefined1 *)(iVar13 + 0x3f) = 0;
        uVar4 = FUN_000065c4();
        iVar13 = FUN_00006af0(uVar4,1,&local_2bc);
      } while (iVar13 != 0);
    }
    uVar4 = FUN_000065c4();
    iVar13 = FUN_00006ad0(uVar4,2,&local_2bc);
    if (iVar13 != 0) {
      do {
        *(undefined1 *)(iVar13 + 0x90) = 0;
        uVar4 = FUN_000065c4();
        iVar13 = FUN_00006af0(uVar4,2,&local_2bc);
      } while (iVar13 != 0);
    }
  }
  iVar13 = FUN_00063fe0(&DAT_005f94e4,*(undefined4 *)PTR_DAT_004d918c);
  if (iVar13 == 1) {
    local_2c0 = 0;
    uVar4 = FUN_000065c4();
    iVar13 = FUN_00006ad0(uVar4,1,&local_2c0);
    if (iVar13 != 0) {
      do {
        *(undefined1 *)(iVar13 + 0xcc) = 1;
        uVar4 = FUN_000065c4();
        iVar13 = FUN_00006af0(uVar4,1,&local_2c0);
      } while (iVar13 != 0);
    }
  }
  iVar13 = FUN_00064000(&DAT_005f94e4,5);
  if ((iVar13 != 0) || (iVar13 = FUN_00064000(&DAT_005f94e4,7), iVar13 == 1)) {
    local_2c4 = 0;
    uVar4 = FUN_000065c4();
    iVar13 = FUN_00006ad0(uVar4,1,&local_2c4);
    if (iVar13 != 0) {
      do {
        if (*(float *)(iVar13 + 0xd0) <= 0.0) {
          FUN_0000b378(iVar13,iVar13 + 0x10,1);
        }
        uVar4 = FUN_000065c4();
        iVar13 = FUN_00006af0(uVar4,1,&local_2c4);
      } while (iVar13 != 0);
    }
    uVar4 = FUN_000065c4();
    iVar13 = FUN_00006ad0(uVar4,2,&local_2c4);
    if (iVar13 != 0) {
      do {
        if (*(float *)(iVar13 + 0xc0) <= 0.0) {
          FUN_00006ee8(iVar13,iVar13 + 0x10,1);
        }
        uVar4 = FUN_000065c4();
        iVar13 = FUN_00006af0(uVar4,2,&local_2c4);
      } while (iVar13 != 0);
    }
  }
  iVar13 = FUN_00063fa0(&DAT_005f94e4,"FruitOrder");
  if (iVar13 == 1) {
    FUN_0001d10c(PTR_DAT_004d9048);
    iVar13 = FUN_0005edbc(&DAT_005f94b4);
    if (iVar13 == 0) {
      uVar4 = FUN_000065c4();
      iVar13 = FUN_00006a84(uVar4,1);
      if (iVar13 == 0) {
        uVar4 = FUN_000065c4();
        uVar8 = FUN_00006a84(uVar4,2);
        if (0 < (int)uVar8) {
          do {
            puVar2 = PTR_DAT_004d9050;
            lVar1 = (ulonglong)*(uint *)PTR_DAT_004d9050 *
                    (ulonglong)*(uint *)(PTR_DAT_004d9050 + 8);
            uVar10 = (uint)lVar1;
            iVar13 = *(int *)(PTR_DAT_004d9050 + 4) * *(uint *)(PTR_DAT_004d9050 + 8) +
                     *(uint *)PTR_DAT_004d9050 * *(int *)(PTR_DAT_004d9050 + 0xc) +
                     (int)((ulonglong)lVar1 >> 0x20);
            lVar1 = CONCAT44(PTR_DAT_004d9050,iVar13);
            uVar9 = iVar13 + *(int *)(PTR_DAT_004d9050 + 0x14) +
                             (uint)CARRY4(uVar10,*(uint *)(PTR_DAT_004d9050 + 0x10));
            *(uint *)PTR_DAT_004d9050 = uVar10 + *(uint *)(PTR_DAT_004d9050 + 0x10);
            *(uint *)(puVar2 + 4) = uVar9;
            if (uVar8 != 0 && uVar8 != 0xffffffff) {
              lVar1 = (ulonglong)uVar9 * (ulonglong)uVar8;
              uVar9 = (uint)((ulonglong)lVar1 >> 0x20);
            }
            uVar4 = FUN_000065c4((int)((ulonglong)lVar1 >> 0x20),(int)lVar1);
            iVar13 = FUN_00006aa4(uVar4,2,uVar9);
          } while (iVar13 == 0);
          uVar4 = FUN_00052f80();
          iVar3 = FUN_00057000(uVar4,1,param_1[0x22],0,0);
          *(undefined4 *)(iVar3 + 0xd0) = 0;
          *(undefined4 *)(iVar3 + 0x1c) = *(undefined4 *)(iVar13 + 0x1c);
          *(undefined4 *)(iVar3 + 0x20) = *(undefined4 *)(iVar13 + 0x20);
          *(undefined4 *)(iVar3 + 0x24) = *(undefined4 *)(iVar13 + 0x24);
          *(undefined4 *)(iVar3 + 0x10) = *(undefined4 *)(iVar13 + 0x10);
          local_2ec = PTR_FUN_004d9058;
          puVar2 = PTR_DAT_004d9048;
          *(undefined4 *)(iVar3 + 0x14) = *(undefined4 *)(iVar13 + 0x14);
          *(undefined4 *)(iVar3 + 0x18) = *(undefined4 *)(iVar13 + 0x18);
          uVar4 = *(undefined4 *)(puVar2 + 0x1a4);
          local_2c8 = 1;
          local_2f0 = &PTR_LAB_0052bf38;
          local_2e8[0] = 0;
          FUN_0000a23c(&local_2f0,local_2e8);
          FUN_0002bc94(uVar4,"fruit-spawn",0x3f800000,0x3f800000,local_2e8,0);
          FUN_0000a298(local_2e8);
          uVar4 = FUN_002f69c4("fruit_bomb_transform",0x14);
          FUN_00011cc4(iVar3,uVar4);
          FUN_00008450(iVar13);
        }
      }
    }
  }
  FUN_00066428(piVar14,param_2);
  FUN_00061690(param_1);
  puVar2 = PTR_DAT_004d9048;
  *(undefined1 *)(param_1 + 0x23) = 0;
  FUN_0002bf1c(*(undefined4 *)(puVar2 + 0x1a4),"act-change");
  if (*(int *)(param_1[0x1a] + 0xac) != 0) {
    uVar4 = FUN_0002ede8();
    FUN_000300e0(uVar4,*(undefined4 *)(param_1[0x1a] + 0xac));
  }
  local_2f4 = 0;
  uVar4 = FUN_000065c4();
  iVar13 = FUN_00006ad0(uVar4,1,&local_2f4);
  if (iVar13 != 0) {
    do {
      *(undefined1 *)(iVar13 + 0xc4) = 0;
      uVar4 = FUN_000065c4();
      iVar13 = FUN_00006af0(uVar4,1,&local_2f4);
    } while (iVar13 != 0);
  }
  uVar4 = FUN_000065c4();
  iVar13 = FUN_00006ad0(uVar4,2,&local_2f4);
  if (iVar13 != 0) {
    do {
      *(undefined1 *)(iVar13 + 0x8c) = 0;
      uVar4 = FUN_000065c4();
      iVar13 = FUN_00006af0(uVar4,2,&local_2f4);
    } while (iVar13 != 0);
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_2c) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00060ea0 — 000619d0

- 函数名: FUN_000619d0
- 函数体: 3131 字节
- 调用者数: 1 / 被调用者数: 53

```c

void FUN_000619d0(int *param_1,int param_2)

{
  longlong lVar1;
  undefined *puVar2;
  int iVar3;
  undefined4 uVar4;
  undefined4 *puVar5;
  float fVar6;
  float fVar7;
  uint uVar8;
  uint uVar9;
  uint uVar10;
  int iVar11;
  undefined1 uVar12;
  int iVar13;
  int *piVar14;
  undefined1 *puVar15;
  int *piVar16;
  undefined4 *puVar17;
  code *pcVar18;
  float fVar19;
  undefined8 uVar20;
  undefined4 extraout_s1;
  undefined4 uVar21;
  undefined4 extraout_s1_00;
  undefined4 extraout_s3;
  undefined4 uVar23;
  undefined8 uVar22;
  undefined4 extraout_s3_00;
  undefined4 extraout_s5;
  undefined4 uVar25;
  undefined8 uVar24;
  undefined4 extraout_s5_00;
  undefined4 extraout_s7;
  undefined4 extraout_s7_00;
  undefined4 local_2f4;
  undefined **local_2f0;
  undefined *local_2ec;
  undefined4 local_2e8 [8];
  undefined1 local_2c8;
  undefined4 local_2c4;
  undefined4 local_2c0;
  undefined4 local_2bc;
  undefined4 local_2b8;
  undefined4 local_2b4;
  undefined1 auStack_2b0 [40];
  undefined1 auStack_288 [40];
  undefined1 auStack_260 [40];
  undefined1 auStack_238 [40];
  undefined1 auStack_210 [40];
  undefined1 auStack_1e8 [40];
  undefined1 auStack_1c0 [40];
  undefined1 auStack_198 [40];
  undefined1 auStack_170 [40];
  undefined1 auStack_148 [40];
  undefined1 auStack_120 [40];
  undefined1 auStack_f8 [40];
  undefined1 auStack_d0 [40];
  undefined1 auStack_a8 [40];
  undefined1 auStack_80 [40];
  undefined1 auStack_58 [40];
  undefined1 local_30 [4];
  int local_2c;
  
  local_2c = *(int *)PTR____stack_chk_guard_004d9044;
  (**(code **)(*param_1 + 0x20))(param_1);
  *(undefined1 *)(param_1 + 0x28) = 0;
  param_1[0x10] = *(int *)(param_2 + 0x178);
  iVar13 = -1;
  for (piVar16 = *(int **)(param_2 + 0x16c); piVar16 != (int *)(param_2 + 0x16c);
      piVar16 = (int *)*piVar16) {
    iVar3 = piVar16[0x22];
    if ((-1 < iVar3) && (iVar3 < DAT_005f94fc - DAT_005f94f8 >> 2)) {
      FUN_0006f040(*(undefined4 *)(DAT_005f94f8 + iVar3 * 4),piVar16 + 2,piVar16[0x23],piVar16[0x24]
                  );
      if (iVar13 <= piVar16[0x22]) {
        iVar13 = piVar16[0x22];
      }
    }
  }
  iVar3 = *(int *)(param_2 + 0x1a4);
  iVar11 = *(int *)(param_2 + 0x1ac);
  piVar16 = param_1 + 0x12;
  *piVar16 = *(int *)(param_2 + 0x1a8);
  param_1[0x13] = iVar11;
  param_1[0x17] = iVar3;
  param_1[0x22] = *(int *)(param_2 + 0x1a0);
  iVar13 = *(int *)(DAT_005f94f8 + iVar13 * 4);
  param_1[0x1a] = iVar13;
  uVar9 = *(uint *)(param_2 + 0x17c);
  uVar8 = 0;
  if ((uVar9 != 0) && (uVar8 = *(int *)(iVar13 + 0x7c) - 1, uVar9 < uVar8)) {
    uVar8 = uVar9;
  }
  *(uint *)(iVar13 + 0x90) = uVar8;
  iVar13 = FUN_0006ed60();
  puVar2 = PTR_DAT_004d9048;
  param_1[0x19] = iVar13;
  iVar13 = FUN_00052f80();
  *(undefined4 *)(iVar13 + 0x208) = *(undefined4 *)(*(int *)(puVar2 + 0x5c) + 0x118);
  puVar5 = DAT_005f94d0;
  if ((undefined4 **)DAT_005f94d0 != &DAT_005f94d0) {
    do {
      puVar17 = (undefined4 *)*puVar5;
      operator_delete(puVar5);
      puVar5 = puVar17;
    } while ((undefined4 **)puVar17 != &DAT_005f94d0);
  }
  DAT_005f94d0 = &DAT_005f94d0;
  DAT_005f94d4 = &DAT_005f94d0;
  if (param_1[0x19] != 0) {
    FUN_0005ed54(&DAT_005f94b4,param_1[0x19] + 0xdc);
  }
  if (param_1[0x10] != 1) {
    iVar13 = FUN_0006ed58(param_1[0x1a],*(undefined4 *)(param_1[0x1a] + 0x90));
    FUN_0005edc0(&DAT_005f94b4,*(undefined4 *)(iVar13 + 4));
  }
  piVar14 = param_1 + 2;
  FUN_00066428(piVar14,param_2);
  FUN_000663a0(piVar14,&DAT_005f94b4);
  iVar13 = param_1[1];
  FUN_0030f7cc(auStack_58,"bonusIntro");
  iVar13 = FUN_0039725c(iVar13,auStack_58);
  param_1[0x25] = iVar13;
  FUN_0030f7e0(auStack_58);
  iVar13 = param_1[1];
  FUN_0030f7cc(auStack_80,"@bonusCheer");
  iVar13 = FUN_0039725c(iVar13,auStack_80);
  param_1[0x27] = iVar13;
  FUN_0030f7e0(auStack_80);
  if (param_1[0x24] != 0) {
    FUN_00068a04(param_1[0x24],param_2);
  }
  iVar13 = param_1[0x10];
  if (iVar13 == 3) {
    if (param_1[1] != 0) {
      local_30[0] = 0;
      FUN_0001da28(*(undefined4 *)(param_1[1] + 0x260),local_30);
    }
    goto LAB_0006211e;
  }
  if (iVar13 != 2) {
    if (iVar13 == 1) {
      puVar5 = DAT_005f94d0;
      if ((undefined4 **)DAT_005f94d0 != &DAT_005f94d0) {
        do {
          puVar17 = (undefined4 *)*puVar5;
          operator_delete(puVar5);
          puVar5 = puVar17;
        } while ((undefined4 **)puVar17 != &DAT_005f94d0);
      }
      DAT_005f94d0 = &DAT_005f94d0;
      DAT_005f94d4 = &DAT_005f94d0;
      FUN_0005ed54(&DAT_005f94b4,param_1[0x19] + 0xdc);
      uVar12 = 1;
      if ((param_1[0x1a] != 0) && (uVar12 = 0, *(int *)(param_1[0x1a] + 0x98) == 0)) {
        uVar12 = 1;
      }
      iVar13 = param_1[2];
      iVar11 = param_1[0x19];
      *(undefined4 *)(iVar13 + 0x48) = 0;
      *(undefined1 *)(iVar13 + 0x18) = 0;
      FUN_000664b4();
      iVar13 = *(int *)(iVar11 + 0xf0);
      iVar3 = *(int *)(iVar11 + 0xf4);
      param_1[7] = *(int *)(iVar11 + 0xec);
      param_1[8] = iVar13;
      param_1[9] = iVar3;
      param_1[8] = 0x3f800000;
      param_1[10] = 0x40400000;
      param_1[0xb] = 0;
      *(undefined1 *)(param_1 + 0xc) = uVar12;
      param_1[0xd] = 0;
      param_1[0xf] = 0;
      FUN_0006f6d8(param_1[0x19],param_1);
      puVar5 = DAT_005f94f0;
      if ((undefined4 **)DAT_005f94f0 != &DAT_005f94f0) {
        do {
          puVar17 = (undefined4 *)*puVar5;
          operator_delete(puVar5);
          puVar5 = puVar17;
        } while ((undefined4 **)puVar17 != &DAT_005f94f0);
      }
      DAT_005f94f0 = &DAT_005f94f0;
      DAT_005f94f4 = &DAT_005f94f0;
      iVar13 = param_1[1];
      iVar3 = param_1[0x19];
      FUN_0030f7cc(auStack_a8,"challengeMods");
      uVar4 = FUN_0039725c(iVar13,auStack_a8);
      FUN_00063e98(&DAT_005f94e4,iVar3 + 0xe4,uVar4);
      FUN_0030f7e0(auStack_a8);
      FUN_00066b18(piVar16);
      *(undefined1 *)(param_1 + 0x1f) = 0;
      FUN_000612d0(param_1);
      FUN_000613e4(param_1);
      iVar13 = param_1[1];
      FUN_0030f7cc(auStack_d0,"instructionsText");
      iVar13 = FUN_0039725c(iVar13,auStack_d0);
      FUN_0030f7e0(auStack_d0);
      iVar3 = param_1[1];
      FUN_0030f7cc(auStack_f8,"@bonusScoreCounter");
      iVar3 = FUN_0039725c(iVar3,auStack_f8);
      FUN_0030f7e0(auStack_f8);
      if (*(int *)(param_1[0x1a] + 0x98) == 0) {
        if (iVar3 != 0) {
          local_30[0] = 0;
          FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),local_30);
        }
      }
      else {
        if (iVar13 != 0) {
          local_30[0] = 0;
          FUN_0001da28(*(undefined4 *)(iVar13 + 0x260),local_30);
        }
        if (iVar3 != 0) {
          local_30[0] = 0;
          FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),local_30);
          FUN_0030f7cc(auStack_120,"text");
          iVar13 = FUN_0039725c(iVar3,auStack_120);
          FUN_0030f7e0(auStack_120);
          if (iVar13 != 0) {
            *(undefined4 *)(iVar13 + 0x884) = 0;
            FUN_003d0bf4(iVar13);
          }
          param_1[0x26] = iVar3;
        }
      }
      FUN_00064110(&DAT_005f94e4);
      FUN_00060514(param_1);
    }
    goto LAB_0006211e;
  }
  puVar5 = DAT_005f94d0;
  if ((undefined4 **)DAT_005f94d0 != &DAT_005f94d0) {
    do {
      puVar17 = (undefined4 *)*puVar5;
      operator_delete(puVar5);
      puVar5 = puVar17;
    } while ((undefined4 **)puVar17 != &DAT_005f94d0);
  }
  DAT_005f94d0 = &DAT_005f94d0;
  DAT_005f94d4 = &DAT_005f94d0;
  FUN_0005ed54(&DAT_005f94b4,param_1[0x19] + 0xdc);
  uVar12 = 1;
  if ((param_1[0x1a] != 0) && (uVar12 = 0, *(int *)(param_1[0x1a] + 0x98) == 0)) {
    uVar12 = 1;
  }
  iVar13 = param_1[2];
  iVar11 = param_1[0x19];
  *(undefined4 *)(iVar13 + 0x48) = 0;
  *(undefined1 *)(iVar13 + 0x18) = 0;
  FUN_000664b4();
  iVar13 = *(int *)(iVar11 + 0xf0);
  iVar3 = *(int *)(iVar11 + 0xf4);
  param_1[7] = *(int *)(iVar11 + 0xec);
  param_1[8] = iVar13;
  param_1[9] = iVar3;
  param_1[8] = 0x3f800000;
  param_1[10] = 0x40400000;
  param_1[0xb] = 0;
  *(undefined1 *)(param_1 + 0xc) = uVar12;
  param_1[0xd] = 0;
  param_1[0xf] = 0;
  puVar5 = DAT_005f94f0;
  if ((undefined4 **)DAT_005f94f0 != &DAT_005f94f0) {
    do {
      puVar17 = (undefined4 *)*puVar5;
      operator_delete(puVar5);
      puVar5 = puVar17;
    } while ((undefined4 **)puVar17 != &DAT_005f94f0);
  }
  DAT_005f94f0 = &DAT_005f94f0;
  DAT_005f94f4 = &DAT_005f94f0;
  iVar13 = param_1[1];
  iVar3 = param_1[0x19];
  FUN_0030f7cc(auStack_148,"challengeMods");
  uVar4 = FUN_0039725c(iVar13,auStack_148);
  FUN_00063e98(&DAT_005f94e4,iVar3 + 0xe4,uVar4);
  FUN_0030f7e0(auStack_148);
  FUN_00066b18(piVar16);
  FUN_000612d0(param_1);
  FUN_000613e4(param_1);
  iVar13 = param_1[1];
  FUN_0030f7cc(auStack_170,"instructionsText");
  iVar13 = FUN_0039725c(iVar13,auStack_170);
  FUN_0030f7e0(auStack_170);
  iVar3 = param_1[1];
  FUN_0030f7cc(auStack_198,"@bonusScoreCounter");
  iVar3 = FUN_0039725c(iVar3,auStack_198);
  FUN_0030f7e0(auStack_198);
  if (*(int *)(param_1[0x1a] + 0x98) == 0) {
    if (iVar3 != 0) {
      local_30[0] = 0;
      FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),local_30);
    }
  }
  else {
    if (iVar13 != 0) {
      local_30[0] = 0;
      FUN_0001da28(*(undefined4 *)(iVar13 + 0x260),local_30);
    }
    if (iVar3 != 0) {
      local_30[0] = 0;
      FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),local_30);
      FUN_0030f7cc(auStack_1c0,"text");
      iVar11 = FUN_0039725c(iVar3,auStack_1c0);
      FUN_0030f7e0(auStack_1c0);
      if (iVar11 != 0) {
        *(undefined4 *)(iVar11 + 0x884) = 0;
        FUN_003d0bf4(iVar11);
      }
      param_1[0x26] = iVar3;
    }
  }
  FUN_00064110(&DAT_005f94e4);
  iVar3 = param_1[1];
  FUN_0030f7cc(auStack_1e8,"Timer");
  piVar16 = (int *)FUN_0039725c(iVar3,auStack_1e8);
  FUN_0030f7e0(auStack_1e8);
  if (piVar16 != (int *)0x0) {
    local_30[0] = 1;
    FUN_0001da28(piVar16[0x98],local_30);
    FUN_00396d98(piVar16,1);
    fVar6 = (float)FUN_0005ee84(&DAT_005f94b4);
    fVar7 = fVar6;
    if (fVar6 == 0.0) {
      fVar7 = (float)param_1[0x19];
    }
    fVar19 = fVar6;
    if (fVar6 == 0.0) {
      fVar19 = *(float *)((int)fVar7 + 0x48);
    }
    uVar20 = FixedToFP(CONCAT44(fVar19,fVar6),0,0,0,0x20);
    if ((float)uVar20 <= *(float *)(param_2 + 0x19c)) {
      puVar15 = auStack_210;
      pcVar18 = *(code **)(*piVar16 + 0x40);
      FUN_0030f7cc(puVar15,"animate_in");
      (*pcVar18)(piVar16,puVar15,1);
LAB_000620cc:
      FUN_0030f7e0(puVar15);
    }
    else {
      FUN_0030f7cc(auStack_238,"animate_in");
      FUN_00398154(piVar16,auStack_238,1);
      FUN_0030f7e0(auStack_238);
      if (iVar13 != 0) {
        FUN_00396d98(iVar13,1);
        FUN_0030f7cc(auStack_260,"animate_in");
        FUN_00398154(iVar13,auStack_260,1);
        FUN_0030f7e0(auStack_260);
      }
      iVar13 = param_1[1];
      FUN_0030f7cc(auStack_288,"challengeMods");
      iVar13 = FUN_0039725c(iVar13,auStack_288);
      FUN_0030f7e0(auStack_288);
      if (iVar13 != 0) {
        FUN_00396d98(iVar13,1);
        puVar15 = auStack_2b0;
        FUN_0030f7cc(puVar15,"animate_in");
        FUN_00398154(iVar13,puVar15,1);
        goto LAB_000620cc;
      }
    }
    FUN_00084394(piVar16);
  }
  param_1[0x11] = *(int *)(param_2 + 0x19c);
  (**(code **)(*param_1 + 0x18))(param_1,0);
LAB_0006211e:
  iVar13 = FUN_00063fe0(&DAT_005f94e4,*(undefined4 *)PTR_DAT_004d9094);
  if (iVar13 == 1) {
    iVar13 = FUN_00063e80(&DAT_005f94e4,*(undefined4 *)PTR_DAT_004d9094);
    *(undefined4 *)(iVar13 + 0x10) = *(undefined4 *)(param_2 + 0x204);
    *(undefined4 *)(iVar13 + 0x14) = *(undefined4 *)(param_2 + 0x208);
    *(undefined4 *)(iVar13 + 0x18) = *(undefined4 *)(param_2 + 0x20c);
    *(undefined4 *)(iVar13 + 4) = *(undefined4 *)(param_2 + 0x210);
    *(undefined4 *)(iVar13 + 8) = *(undefined4 *)(param_2 + 0x214);
    *(undefined4 *)(iVar13 + 0xc) = *(undefined4 *)(param_2 + 0x218);
    local_2b4 = 0;
    uVar4 = FUN_000065c4();
    iVar13 = FUN_00006ad0(uVar4,1,&local_2b4);
    if (iVar13 != 0) {
      uVar4 = extraout_s7;
      uVar25 = extraout_s5;
      uVar23 = extraout_s3;
      uVar21 = extraout_s1;
      do {
        uVar24 = FloatVectorMult(CONCAT44(uVar25,*(undefined4 *)(iVar13 + 0xe8)),
                                 CONCAT44(uVar4,DAT_000620f0),2,0x20);
        uVar22 = FloatVectorMult(CONCAT44(uVar23,*(undefined4 *)(iVar13 + 0xec)),
                                 CONCAT44(uVar4,DAT_000620f0),2,0x20);
        uVar20 = FloatVectorMult(CONCAT44(uVar21,*(undefined4 *)(iVar13 + 0xf0)),
                                 CONCAT44(uVar4,DAT_000620f0),2,0x20);
        *(int *)(iVar13 + 0x28) = (int)uVar24;
        *(int *)(iVar13 + 0x2c) = (int)uVar22;
        *(int *)(iVar13 + 0x30) = (int)uVar20;
        FUN_0000c0b4((int)uVar20,iVar13,0);
        uVar4 = FUN_000065c4();
        iVar13 = FUN_00006af0(uVar4,1,&local_2b4);
        uVar4 = extraout_s7_00;
        uVar25 = extraout_s5_00;
        uVar23 = extraout_s3_00;
        uVar21 = extraout_s1_00;
      } while (iVar13 != 0);
    }
    iVar13 = 0;
    do {
      local_2b8 = 0;
      uVar4 = FUN_000065c4();
      iVar3 = FUN_00006ad0(uVar4,1,&local_2b8);
      if (iVar3 != 0) {
        iVar11 = 0;
        fVar7 = DAT_000620f4;
        do {
          if ((((*(float *)(iVar3 + 0x28) != *(float *)(iVar3 + 0xe8)) ||
               (*(float *)(iVar3 + 0x2c) != *(float *)(iVar3 + 0xec))) ||
              (*(float *)(iVar3 + 0x30) != *(float *)(iVar3 + 0xf0))) &&
             ((fVar7 < *(float *)(iVar3 + 0xbc) && ((*(uint *)(iVar3 + 0xc) & 0x10) == 0)))) {
            iVar11 = iVar3;
            fVar7 = *(float *)(iVar3 + 0xbc);
          }
          uVar4 = FUN_000065c4();
          iVar3 = FUN_00006af0(uVar4,1,&local_2b8);
        } while (iVar3 != 0);
        if (iVar11 != 0) {
          *(undefined4 *)(iVar11 + 0x28) = *(undefined4 *)(iVar11 + 0xe8);
          *(undefined4 *)(iVar11 + 0x2c) = *(undefined4 *)(iVar11 + 0xec);
          *(undefined4 *)(iVar11 + 0x30) = *(undefined4 *)(iVar11 + 0xf0);
          FUN_0000c0b4(iVar11,1);
        }
      }
      iVar13 = iVar13 + 1;
    } while (iVar13 != 3);
  }
  iVar13 = FUN_00063fa0(&DAT_005f94e4,"FloatingFruit");
  if ((iVar13 != 0) || (iVar13 = FUN_00064000(&DAT_005f94e4,3), iVar13 == 1)) {
    local_2bc = 0;
    uVar4 = FUN_000065c4();
    iVar13 = FUN_00006ad0(uVar4,1,&local_2bc);
    if (iVar13 != 0) {
      do {
        *(undefined1 *)(iVar13 + 0x3f) = 0;
        uVar4 = FUN_000065c4();
        iVar13 = FUN_00006af0(uVar4,1,&local_2bc);
      } while (iVar13 != 0);
    }
    uVar4 = FUN_000065c4();
    iVar13 = FUN_00006ad0(uVar4,2,&local_2bc);
    if (iVar13 != 0) {
      do {
        *(undefined1 *)(iVar13 + 0x90) = 0;
        uVar4 = FUN_000065c4();
        iVar13 = FUN_00006af0(uVar4,2,&local_2bc);
      } while (iVar13 != 0);
    }
  }
  iVar13 = FUN_00063fe0(&DAT_005f94e4,*(undefined4 *)PTR_DAT_004d918c);
  if (iVar13 == 1) {
    local_2c0 = 0;
    uVar4 = FUN_000065c4();
    iVar13 = FUN_00006ad0(uVar4,1,&local_2c0);
    if (iVar13 != 0) {
      do {
        *(undefined1 *)(iVar13 + 0xcc) = 1;
        uVar4 = FUN_000065c4();
        iVar13 = FUN_00006af0(uVar4,1,&local_2c0);
      } while (iVar13 != 0);
    }
  }
  iVar13 = FUN_00064000(&DAT_005f94e4,5);
  if ((iVar13 != 0) || (iVar13 = FUN_00064000(&DAT_005f94e4,7), iVar13 == 1)) {
    local_2c4 = 0;
    uVar4 = FUN_000065c4();
    iVar13 = FUN_00006ad0(uVar4,1,&local_2c4);
    if (iVar13 != 0) {
      do {
        if (*(float *)(iVar13 + 0xd0) <= 0.0) {
          FUN_0000b378(iVar13,iVar13 + 0x10,1);
        }
        uVar4 = FUN_000065c4();
        iVar13 = FUN_00006af0(uVar4,1,&local_2c4);
      } while (iVar13 != 0);
    }
    uVar4 = FUN_000065c4();
    iVar13 = FUN_00006ad0(uVar4,2,&local_2c4);
    if (iVar13 != 0) {
      do {
        if (*(float *)(iVar13 + 0xc0) <= 0.0) {
          FUN_00006ee8(iVar13,iVar13 + 0x10,1);
        }
        uVar4 = FUN_000065c4();
        iVar13 = FUN_00006af0(uVar4,2,&local_2c4);
      } while (iVar13 != 0);
    }
  }
  iVar13 = FUN_00063fa0(&DAT_005f94e4,"FruitOrder");
  if (iVar13 == 1) {
    FUN_0001d10c(PTR_DAT_004d9048);
    iVar13 = FUN_0005edbc(&DAT_005f94b4);
    if (iVar13 == 0) {
      uVar4 = FUN_000065c4();
      iVar13 = FUN_00006a84(uVar4,1);
      if (iVar13 == 0) {
        uVar4 = FUN_000065c4();
        uVar8 = FUN_00006a84(uVar4,2);
        if (0 < (int)uVar8) {
          do {
            puVar2 = PTR_DAT_004d9050;
            lVar1 = (ulonglong)*(uint *)PTR_DAT_004d9050 *
                    (ulonglong)*(uint *)(PTR_DAT_004d9050 + 8);
            uVar10 = (uint)lVar1;
            iVar13 = *(int *)(PTR_DAT_004d9050 + 4) * *(uint *)(PTR_DAT_004d9050 + 8) +
                     *(uint *)PTR_DAT_004d9050 * *(int *)(PTR_DAT_004d9050 + 0xc) +
                     (int)((ulonglong)lVar1 >> 0x20);
            lVar1 = CONCAT44(PTR_DAT_004d9050,iVar13);
            uVar9 = iVar13 + *(int *)(PTR_DAT_004d9050 + 0x14) +
                             (uint)CARRY4(uVar10,*(uint *)(PTR_DAT_004d9050 + 0x10));
            *(uint *)PTR_DAT_004d9050 = uVar10 + *(uint *)(PTR_DAT_004d9050 + 0x10);
            *(uint *)(puVar2 + 4) = uVar9;
            if (uVar8 != 0 && uVar8 != 0xffffffff) {
              lVar1 = (ulonglong)uVar9 * (ulonglong)uVar8;
              uVar9 = (uint)((ulonglong)lVar1 >> 0x20);
            }
            uVar4 = FUN_000065c4((int)((ulonglong)lVar1 >> 0x20),(int)lVar1);
            iVar13 = FUN_00006aa4(uVar4,2,uVar9);
          } while (iVar13 == 0);
          uVar4 = FUN_00052f80();
          iVar3 = FUN_00057000(uVar4,1,param_1[0x22],0,0);
          *(undefined4 *)(iVar3 + 0xd0) = 0;
          *(undefined4 *)(iVar3 + 0x1c) = *(undefined4 *)(iVar13 + 0x1c);
          *(undefined4 *)(iVar3 + 0x20) = *(undefined4 *)(iVar13 + 0x20);
          *(undefined4 *)(iVar3 + 0x24) = *(undefined4 *)(iVar13 + 0x24);
          *(undefined4 *)(iVar3 + 0x10) = *(undefined4 *)(iVar13 + 0x10);
          local_2ec = PTR_FUN_004d9058;
          puVar2 = PTR_DAT_004d9048;
          *(undefined4 *)(iVar3 + 0x14) = *(undefined4 *)(iVar13 + 0x14);
          *(undefined4 *)(iVar3 + 0x18) = *(undefined4 *)(iVar13 + 0x18);
          uVar4 = *(undefined4 *)(puVar2 + 0x1a4);
          local_2c8 = 1;
          local_2f0 = &PTR_LAB_0052bf38;
          local_2e8[0] = 0;
          FUN_0000a23c(&local_2f0,local_2e8);
          FUN_0002bc94(uVar4,"fruit-spawn",0x3f800000,0x3f800000,local_2e8,0);
          FUN_0000a298(local_2e8);
          uVar4 = FUN_002f69c4("fruit_bomb_transform",0x14);
          FUN_00011cc4(iVar3,uVar4);
          FUN_00008450(iVar13);
        }
      }
    }
  }
  FUN_00066428(piVar14,param_2);
  FUN_00061690(param_1);
  puVar2 = PTR_DAT_004d9048;
  *(undefined1 *)(param_1 + 0x23) = 0;
  FUN_0002bf1c(*(undefined4 *)(puVar2 + 0x1a4),"act-change");
  if (*(int *)(param_1[0x1a] + 0xac) != 0) {
    uVar4 = FUN_0002ede8();
    FUN_000300e0(uVar4,*(undefined4 *)(param_1[0x1a] + 0xac));
  }
  local_2f4 = 0;
  uVar4 = FUN_000065c4();
  iVar13 = FUN_00006ad0(uVar4,1,&local_2f4);
  if (iVar13 != 0) {
    do {
      *(undefined1 *)(iVar13 + 0xc4) = 0;
      uVar4 = FUN_000065c4();
      iVar13 = FUN_00006af0(uVar4,1,&local_2f4);
    } while (iVar13 != 0);
  }
  uVar4 = FUN_000065c4();
  iVar13 = FUN_00006ad0(uVar4,2,&local_2f4);
  if (iVar13 != 0) {
    do {
      *(undefined1 *)(iVar13 + 0x8c) = 0;
      uVar4 = FUN_000065c4();
      iVar13 = FUN_00006af0(uVar4,2,&local_2f4);
    } while (iVar13 != 0);
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_2c) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_000607e8 — 000607e8

- 函数名: FUN_000607e8
- 函数体: 15 字节
- 调用者数: 0 / 被调用者数: 1

```c

void FUN_000607e8(int param_1)

{
  FUN_00068998(*(undefined4 *)(param_1 + 0x90));
  return;
}


```

