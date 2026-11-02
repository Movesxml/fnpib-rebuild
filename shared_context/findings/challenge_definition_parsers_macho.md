# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_00062618 — 00062618

- 函数名: FUN_00062618
- 函数体: 69 字节
- 调用者数: 1 / 被调用者数: 1

```c

int FUN_00062618(int param_1)

{
  undefined4 *puVar1;
  
  *(undefined4 *)(param_1 + 0xe0) = 0;
  puVar1 = (undefined4 *)(param_1 + 0xdc);
  *puVar1 = 0;
  *puVar1 = puVar1;
  *(undefined4 **)(param_1 + 0xe0) = puVar1;
  *(undefined4 *)(param_1 + 0xe8) = 0;
  puVar1 = (undefined4 *)(param_1 + 0xe4);
  *puVar1 = 0;
  *puVar1 = puVar1;
  *(undefined4 **)(param_1 + 0xe8) = puVar1;
  FUN_00065958(param_1 + 0xec,0);
  *(undefined4 *)(param_1 + 0x100) = 0;
  *(undefined4 *)(param_1 + 0x48) = 0;
  *(undefined1 *)(param_1 + 0x51) = 0;
  *(undefined1 *)(param_1 + 0x59) = 0;
  *(undefined1 *)(param_1 + 0x58) = 0;
  return param_1;
}


```

## FUN_00062698 — 00062698

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

## FUN_0006ed58 — 0006ed58

- 函数名: FUN_0006ed58
- 函数体: 7 字节
- 调用者数: 7 / 被调用者数: 0

```c

int FUN_0006ed58(int param_1,int param_2)

{
  return *(int *)(param_1 + 0x78) + param_2 * 8;
}


```

## FUN_0006ed60 — 0006ed60

- 函数名: FUN_0006ed60
- 函数体: 23 字节
- 调用者数: 4 / 被调用者数: 0

```c

int FUN_0006ed60(int param_1)

{
  if (*(int *)(param_1 + 0xb0) != 0) {
    return *(int *)(param_1 + 0xb0);
  }
  return *(int *)(*(int *)(param_1 + 0x78) + *(int *)(param_1 + 0x90) * 8);
}


```

## FUN_0006f040 — 0006f040

- 函数名: FUN_0006f040
- 函数体: 307 字节
- 调用者数: 1 / 被调用者数: 3

```c

void FUN_0006f040(int param_1,char *param_2,int param_3,int param_4)

{
  longlong lVar1;
  float fVar2;
  undefined *puVar3;
  size_t sVar4;
  int iVar5;
  int iVar6;
  uint uVar7;
  int iVar8;
  uint uVar9;
  int iVar10;
  undefined4 uVar11;
  int iVar12;
  int iVar13;
  undefined8 in_d0;
  undefined8 uVar14;
  undefined8 uVar15;
  undefined8 uVar16;
  
  puVar3 = PTR_DAT_004d9050;
  fVar2 = DAT_0006f174;
  if (*(int *)(param_1 + 0x78) == 0) {
    iVar5 = *(int *)(param_1 + 0x88);
    iVar13 = *(int *)(param_1 + 0x8c);
    if (iVar5 != iVar13) {
      lVar1 = (ulonglong)*(uint *)PTR_DAT_004d9050 * (ulonglong)*(uint *)(PTR_DAT_004d9050 + 8);
      uVar9 = (uint)lVar1;
      uVar7 = *(int *)(PTR_DAT_004d9050 + 4) * *(uint *)(PTR_DAT_004d9050 + 8) +
              *(uint *)PTR_DAT_004d9050 * *(int *)(PTR_DAT_004d9050 + 0xc) +
              (int)((ulonglong)lVar1 >> 0x20) +
              *(int *)(PTR_DAT_004d9050 + 0x14) +
              (uint)CARRY4(uVar9,*(uint *)(PTR_DAT_004d9050 + 0x10));
      uVar11 = (undefined4)((ulonglong)uVar7 * 0x7ffff >> 0x20);
      *(uint *)PTR_DAT_004d9050 = uVar9 + *(uint *)(PTR_DAT_004d9050 + 0x10);
      *(uint *)(puVar3 + 4) = uVar7;
      iVar13 = iVar13 - iVar5;
      uVar14 = FixedToFP(CONCAT44(uVar11,uVar11),0,1,0,0x20);
      uVar16 = FixedToFP(CONCAT44(iVar13,iVar13),0,0,0,0x20);
      uVar15 = FixedToFP(CONCAT44(iVar5,iVar5),0,0,0,0x20);
      uVar14 = FloatVectorMult(uVar16,CONCAT44((int)((ulonglong)in_d0 >> 0x20),(float)uVar14 / fVar2
                                              ),2,0x20);
      uVar14 = FloatVectorAdd(uVar15,uVar14,2);
      uVar14 = FPToFixed(uVar14,0,0,3,0x20);
      iVar5 = (int)uVar14;
    }
    *(int *)(param_1 + 0x7c) = iVar5;
    *(undefined4 *)(param_1 + 0x80) = 0;
    *(undefined4 *)(param_1 + 0x84) = 0;
    FUN_0006ee88(param_1);
  }
  sVar4 = _strlen(param_2);
  iVar5 = FUN_002f69c4(param_2,sVar4);
  iVar13 = *(int *)(param_1 + 0x6c);
  if (*(int *)(param_1 + 0x70) != iVar13) {
    uVar7 = 0;
    iVar6 = 0;
    do {
      iVar8 = *(int *)(iVar13 + uVar7 * 4);
      iVar10 = *(int *)(iVar8 + 0x10);
      iVar8 = *(int *)(iVar8 + 0x14);
      if (iVar8 != iVar10) {
        uVar9 = 0;
        do {
          iVar12 = *(int *)(iVar10 + uVar9 * 4);
          uVar9 = uVar9 + 1;
          if (*(int *)(iVar12 + 0x40) == iVar5) {
            iVar6 = iVar12;
          }
        } while (uVar9 < (uint)(iVar8 - iVar10 >> 2));
      }
      uVar7 = uVar7 + 1;
    } while (uVar7 < (uint)(*(int *)(param_1 + 0x70) - iVar13 >> 2));
    if (iVar6 != 0) {
      *(int *)(*(int *)(param_1 + 0x78) + param_3 * 8) = iVar6;
      *(int *)(*(int *)(param_1 + 0x78) + param_3 * 8 + 4) = param_4;
    }
  }
  if ((param_4 != 0) && (*(int *)(param_1 + 0x80) = *(int *)(param_1 + 0x80) + 1, param_4 == 1)) {
    *(int *)(param_1 + 0x84) = *(int *)(param_1 + 0x84) + 1;
  }
  return;
}


```

## FUN_0006f6d8 — 0006f6d8

- 函数名: FUN_0006f6d8
- 函数体: 31 字节
- 调用者数: 2 / 被调用者数: 3

```c

void FUN_0006f6d8(int param_1)

{
  undefined4 uVar1;
  
  uVar1 = FUN_00052f80();
  FUN_000547ec(uVar1,1);
  uVar1 = FUN_00052f80();
  FUN_00057c08(uVar1,*(undefined4 *)(param_1 + 0x44),*(undefined1 *)(param_1 + 0x50));
  return;
}


```

## FUN_00068a04 — 00068a04

- 函数名: FUN_00068a04
- 函数体: 573 字节
- 调用者数: 1 / 被调用者数: 32

```c

void FUN_00068a04(int param_1,int param_2)

{
  undefined4 uVar1;
  int iVar2;
  undefined1 *puVar3;
  int unaff_r6;
  undefined1 auStack_b0 [80];
  undefined4 local_60;
  undefined4 local_5c;
  undefined4 local_58;
  undefined4 local_54;
  undefined1 local_28 [4];
  int local_24;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  uVar1 = FUN_0001d10c(PTR_DAT_004d9048);
  FUN_00067f58(param_1,uVar1);
  *(undefined4 *)(param_1 + 0xac) = *(undefined4 *)(param_2 + 0x180);
  FUN_00069dbc(param_1);
  FUN_0006c0e0(param_1 + 0x28);
  FUN_0006d51c(param_1 + 0x40);
  FUN_00076634(param_1 + 0x9c);
  switch(*(undefined4 *)(param_1 + 0xac)) {
  case 0:
    FUN_00069a3c(param_1);
    *(undefined4 *)(param_1 + 0xac) = 0;
    break;
  case 1:
    FUN_000680f0(param_1);
    break;
  case 2:
    *(undefined4 *)(param_1 + 0x10) = *(undefined4 *)(param_2 + 0x17c);
    FUN_000610cc(*(undefined4 *)(param_1 + 0xc),0,1);
    uVar1 = FUN_0006ed60(*(undefined4 *)(*(int *)(param_1 + 0xc) + 0x68));
    *(undefined4 *)(*(int *)(param_1 + 0xc) + 100) = uVar1;
    FUN_00061128(*(undefined4 *)(param_1 + 0xc),1);
    FUN_0006e220(param_1 + 0x88);
    *(undefined4 *)(param_1 + 0xac) = 2;
    break;
  case 3:
    local_54 = *(undefined4 *)(param_2 + 0x1e0);
    local_5c = *(undefined4 *)(param_2 + 0x1d8);
    local_60 = *(undefined4 *)(param_2 + 0x1d4);
    local_58 = *(undefined4 *)(param_2 + 0x1dc);
    FUN_00068560(param_1,&local_60);
    iVar2 = *(int *)PTR_DAT_004d9048;
    if (iVar2 != 0) {
      unaff_r6 = *(int *)(iVar2 + 4);
    }
    if (iVar2 == 0 || unaff_r6 == 0) break;
    FUN_00396d98(unaff_r6,1);
    puVar3 = &stack0x00000008;
    goto LAB_00068b30;
  case 4:
    FUN_00068618(param_1);
    iVar2 = *(int *)PTR_DAT_004d9048;
    if (iVar2 != 0) {
      unaff_r6 = *(int *)(iVar2 + 4);
    }
    if (iVar2 == 0 || unaff_r6 == 0) break;
    FUN_00396d98(unaff_r6,1);
    puVar3 = &stack0x00000040;
LAB_00068b30:
    puVar3 = puVar3 + -0x90;
    FUN_0030f7cc(puVar3,"animate_out_pause");
    FUN_00398154(unaff_r6,puVar3,1);
    FUN_0030f7e0(puVar3);
    break;
  case 5:
    if (*(int *)(param_1 + 0xa8) != 0) {
      local_28[0] = 0;
      FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 0xa8) + 0x260),local_28);
    }
    FUN_00068018(param_1);
    break;
  case 6:
    *(undefined4 *)(param_1 + 0x10) = *(undefined4 *)(param_2 + 0x17c);
    FUN_000610cc(*(undefined4 *)(param_1 + 0xc),0,1);
    uVar1 = FUN_0006ed60(*(undefined4 *)(*(int *)(param_1 + 0xc) + 0x68));
    *(undefined4 *)(*(int *)(param_1 + 0xc) + 100) = uVar1;
    FUN_00061128(*(undefined4 *)(param_1 + 0xc),1);
    FUN_0006e220(param_1 + 0x88);
    *(undefined4 *)(param_1 + 0xac) = 2;
    FUN_000688c8(param_1,1);
    break;
  case 7:
    FUN_00068950(param_1);
  }
  FUN_000681e8(param_1,1);
  FUN_0006b074(param_1,param_2);
  FUN_0006cd70(param_1 + 0x28,param_2);
  FUN_0006e63c(param_1 + 0x88,param_2);
  FUN_0006daf4(param_1 + 0x40,param_2);
  FUN_00074c34(param_1 + 0x74,param_2);
  uVar1 = *(undefined4 *)(param_2 + 0x184);
  *(undefined4 *)(param_1 + 0xb8) = uVar1;
  if (*(int *)(param_1 + 0xa8) != 0) {
    FUN_00397e70(*(int *)(param_1 + 0xa8),uVar1,0,1);
    uVar1 = *(undefined4 *)(param_1 + 0xa8);
    FUN_0030f7cc(auStack_b0,"@backgroundControl");
    iVar2 = FUN_0039725c(uVar1,auStack_b0);
    FUN_0030f7e0(auStack_b0);
    if (iVar2 != 0) {
      FUN_0007c97c(iVar2);
    }
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 == local_24) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

## FUN_000610cc — 000610cc

- 函数名: FUN_000610cc
- 函数体: 89 字节
- 调用者数: 4 / 被调用者数: 3

```c

void FUN_000610cc(int param_1,int param_2,int param_3)

{
  int iVar1;
  int iVar2;
  undefined4 uVar3;
  int iVar4;
  
  *(undefined1 *)(param_1 + 0xa0) = 0;
  iVar2 = *(int *)(param_1 + 0x68);
  if (param_2 == 0) {
    iVar4 = 0;
    do {
      if (*(int *)(iVar2 + 0x7c) <= iVar4) {
        if (param_3 == 0) {
          FUN_00061090(param_1);
          goto LAB_00061106;
        }
        break;
      }
      iVar1 = iVar4 * 8;
      iVar4 = iVar4 + 1;
    } while (*(int *)(*(int *)(iVar2 + 0x78) + iVar1 + 4) != 0);
  }
  *(undefined4 *)(iVar2 + 0x90) = *(undefined4 *)(*(int *)(param_1 + 0x90) + 0x10);
LAB_00061106:
  if (param_2 == 1) {
    uVar3 = FUN_0006ed60(*(undefined4 *)(param_1 + 0x68));
    *(undefined4 *)(param_1 + 100) = uVar3;
    FUN_00061128(param_1,0);
    return;
  }
  return;
}


```

## FUN_000612d0 — 000612d0

- 函数名: FUN_000612d0
- 函数体: 275 字节
- 调用者数: 2 / 被调用者数: 10

```c

void FUN_000612d0(int param_1)

{
  bool bVar1;
  int iVar2;
  size_t sVar3;
  char *pcVar4;
  size_t sVar5;
  int *piVar6;
  int iVar7;
  allocator aaStack_24 [4];
  int local_20 [2];
  
  iVar2 = FUN_0005ef30(&DAT_005f94b4);
  if (iVar2 == 1) {
    sVar3 = _strlen((char *)(*(int *)(param_1 + 100) + 0x5a));
    pcVar4 = (char *)FUN_0000ac08(*(undefined4 *)(param_1 + 0x88));
    sVar5 = _strlen(pcVar4);
    std::string::string((string *)local_20,(char *)(*(int *)(param_1 + 100) + 0x5a),aaStack_24);
    iVar2 = std::string::find((char *)local_20,0x418781,0);
    if (iVar2 < 0) {
      iVar7 = *(int *)(param_1 + 100);
      iVar2 = FUN_0000ac08(*(undefined4 *)(param_1 + 0x88));
      _sprintf((char *)(param_1 + 0xa1),(char *)(iVar7 + 0x5a),iVar2 + 0xc0);
    }
    else {
      pcVar4 = operator_new__(sVar5 + sVar3);
      _strcpy(pcVar4,(char *)(*(int *)(param_1 + 100) + 0x5a));
      _strcpy(pcVar4 + iVar2 + 2,(char *)(*(int *)(param_1 + 100) + iVar2 + 0x5d));
      iVar2 = FUN_0000ac08(*(undefined4 *)(param_1 + 0x88));
      _sprintf((char *)(param_1 + 0xa1),pcVar4,iVar2 + 0x100);
      if (pcVar4 != (char *)0x0) {
        operator_delete(pcVar4);
      }
    }
    if ((allocator *)(local_20[0] + -0xc) != (allocator *)PTR__S_empty_rep_storage_004d9038) {
      piVar6 = (int *)(local_20[0] + -4);
      DataMemoryBarrier(0x1b);
      do {
        ExclusiveAccess(piVar6);
        iVar2 = *piVar6;
        bVar1 = (bool)hasExclusiveAccess(piVar6);
      } while (!bVar1);
      *piVar6 = iVar2 + -1;
      DataMemoryBarrier(0x1b);
      if (iVar2 < 1) {
        std::string::_Rep::_M_destroy((allocator *)(local_20[0] + -0xc));
      }
    }
  }
  else {
    _sprintf((char *)(param_1 + 0xa1),(char *)(*(int *)(param_1 + 100) + 0x5a));
  }
  return;
}


```

## FUN_000613e4 — 000613e4

- 函数名: FUN_000613e4
- 函数体: 681 字节
- 调用者数: 2 / 被调用者数: 12

```c

void FUN_000613e4(int param_1)

{
  bool bVar1;
  float fVar2;
  int iVar3;
  int *piVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  code *pcVar8;
  undefined4 uVar9;
  undefined4 extraout_s0;
  undefined4 uVar10;
  undefined4 extraout_s1;
  undefined4 uVar11;
  undefined8 uVar12;
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
  uint local_30;
  int local_2c;
  
  local_2c = *(int *)PTR____stack_chk_guard_004d9044;
  local_30 = CONCAT31(local_30._1_3_,1);
  FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 4) + 0x260),&local_30);
  *(undefined4 *)(param_1 + 0x94) = 0;
  *(undefined4 *)(param_1 + 0x98) = 0;
  *(undefined4 *)(param_1 + 0x9c) = 0;
  fVar2 = (float)FUN_0005ee84(&DAT_005f94b4);
  bVar1 = fVar2 == 0.0;
  if (bVar1) {
    fVar2 = *(float *)(param_1 + 100);
  }
  uVar10 = extraout_s0;
  if (bVar1) {
    uVar10 = *(undefined4 *)((int)fVar2 + 0x48);
  }
  uVar12 = FixedToFP(CONCAT44(extraout_s1,uVar10),0,0,0,0x20);
  uVar11 = (undefined4)uVar12;
  *(undefined4 *)(param_1 + 0x44) = uVar11;
  uVar9 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(uVar10,auStack_58,"Timer");
  iVar3 = FUN_0039725c(uVar9,auStack_58);
  FUN_0030f7e0(auStack_58);
  if (iVar3 != 0) {
    local_30 = local_30 & 0xffffff00;
    uVar10 = FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),&local_30);
    *(undefined4 *)(iVar3 + 0x754) = uVar11;
    FUN_0008411c(uVar10,iVar3,uVar11);
  }
  uVar10 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_80,"instructionsText");
  piVar4 = (int *)FUN_0039725c(uVar10,auStack_80);
  FUN_0030f7e0(auStack_80);
  uVar10 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_a8,"@bonusScoreCounter");
  iVar3 = FUN_0039725c(uVar10,auStack_a8);
  FUN_0030f7e0(auStack_a8);
  uVar10 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_d0,"@bonusCheer");
  iVar5 = FUN_0039725c(uVar10,auStack_d0);
  FUN_0030f7e0(auStack_d0);
  if (iVar5 != 0) {
    local_30 = local_30 & 0xffffff00;
    FUN_0001da28(*(undefined4 *)(iVar5 + 0x260),&local_30);
  }
  if (iVar3 != 0) {
    local_30 = local_30 & 0xffffff00;
    FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),&local_30);
  }
  iVar6 = *(int *)(param_1 + 0x68);
  iVar7 = 0;
  if (iVar6 != 0) {
    iVar7 = *(int *)(iVar6 + 0x98);
  }
  if (iVar6 != 0 && iVar7 != 0) {
    if (piVar4 != (int *)0x0) {
      local_30 = (uint)local_30._1_3_ << 8;
      FUN_0001da28(piVar4[0x98],&local_30);
    }
    if (iVar3 != 0) {
      FUN_0030f7cc(auStack_198,"text");
      iVar7 = FUN_0039725c(iVar3,auStack_198);
      FUN_0030f7e0(auStack_198);
      if (iVar7 != 0) {
        *(undefined4 *)(iVar7 + 0x884) = 0;
        FUN_003d0bf4(iVar7);
      }
      *(int *)(param_1 + 0x98) = iVar3;
    }
    uVar10 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_1c0,"bonusIntro");
    uVar10 = FUN_0039725c(uVar10,auStack_1c0);
    *(undefined4 *)(param_1 + 0x94) = uVar10;
    FUN_0030f7e0(auStack_1c0);
    *(int *)(param_1 + 0x9c) = iVar5;
  }
  else if (piVar4 != (int *)0x0) {
    local_30 = CONCAT31(local_30._1_3_,1);
    FUN_0001da28(piVar4[0x98],&local_30);
    FUN_0030f7cc(auStack_f8,param_1 + 0xa1);
    FUN_0030f7cc(auStack_120,"text");
    FUN_0030f870(auStack_148,auStack_f8);
    local_30 = 0;
    FUN_000632ac(piVar4 + 0x28,auStack_120,&local_30);
    FUN_00022950(*(undefined4 *)(piVar4[0x37] + local_30 * 4),auStack_148);
    FUN_0030f7e0(auStack_148);
    FUN_0030f7e0(auStack_120);
    pcVar8 = *(code **)(*piVar4 + 0x40);
    FUN_0030f7cc(auStack_170,"transition_up");
    (*pcVar8)(piVar4,auStack_170,1);
    FUN_0030f7e0(auStack_170);
    FUN_0030f7e0(auStack_f8);
  }
  FUN_00061690(param_1);
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_2c) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00061690 — 00061690

- 函数名: FUN_00061690
- 函数体: 277 字节
- 调用者数: 2 / 被调用者数: 9

```c

void FUN_00061690(int param_1)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int *piVar4;
  undefined4 uVar5;
  code *pcVar6;
  undefined1 auStack_a4 [40];
  undefined1 auStack_7c [40];
  undefined1 auStack_54 [40];
  undefined4 local_2c;
  undefined1 local_28 [4];
  int local_24;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  local_2c = 0;
  iVar1 = FUN_00064038(&DAT_005f94e4,&local_2c,8);
  uVar5 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_54,"challengeMods");
  iVar2 = FUN_0039725c(uVar5,auStack_54);
  FUN_0030f7e0(auStack_54);
  local_28[0] = 1;
  FUN_0001da28(*(undefined4 *)(iVar2 + 0x260),local_28);
  if (iVar1 != 0) {
    do {
      iVar3 = FUN_00063fa0(&DAT_005f94e4,iVar1 + 0x1c);
      FUN_0030f7cc(auStack_7c,iVar1 + 0x1c);
      piVar4 = (int *)FUN_0039725c(iVar2,auStack_7c);
      FUN_0030f7e0(auStack_7c);
      if (piVar4 != (int *)0x0) {
        FUN_00396d98(piVar4,1);
        local_28[0] = (undefined1)iVar3;
        FUN_0001da28(piVar4[0x98],local_28);
        if (iVar3 == 1) {
          pcVar6 = *(code **)(*piVar4 + 0x40);
          FUN_0030f7cc(auStack_a4,"idle");
          (*pcVar6)(piVar4,auStack_a4,1);
          FUN_0030f7e0(auStack_a4);
        }
      }
      iVar1 = FUN_00064064(&DAT_005f94e4,&local_2c,8);
    } while (iVar1 != 0);
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

