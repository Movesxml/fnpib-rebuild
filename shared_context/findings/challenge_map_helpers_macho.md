# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_00067f58 — 00067f58

- 函数名: FUN_00067f58
- 函数体: 57 字节
- 调用者数: 1 / 被调用者数: 4

```c

void FUN_00067f58(int param_1,undefined4 param_2)

{
  *(undefined1 *)(param_1 + 0xb4) = 1;
  FUN_0006bdc4(param_1 + 0x28,param_2,*(undefined4 *)(param_1 + 0xa8));
  FUN_0006d3a0(param_1 + 0x40,param_2);
  FUN_00074804(param_1 + 0x74,param_2);
  FUN_0006e088(param_1 + 0x88,param_2);
  return;
}


```

## FUN_00069778 — 00069778

- 函数名: FUN_00069778
- 函数体: 161 字节
- 调用者数: 0 / 被调用者数: 6

```c

void FUN_00069778(int param_1,undefined4 param_2,byte *param_3)

{
  byte bVar1;
  int iVar2;
  uint uVar3;
  undefined4 uVar4;
  undefined1 auStack_70 [40];
  undefined1 auStack_48 [40];
  undefined1 local_20 [4];
  int local_1c;
  
  local_1c = *(int *)PTR____stack_chk_guard_004d9044;
  bVar1 = FUN_0006af94(param_1,0);
  *param_3 = bVar1;
  uVar4 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_48,"challengeContainer");
  uVar4 = FUN_0039725c(uVar4,auStack_48);
  FUN_0030f7e0(auStack_48);
  FUN_0030f7cc(auStack_70,"adventureNode_1");
  iVar2 = FUN_0039725c(uVar4,auStack_70);
  uVar3 = FUN_0030f7e0(auStack_70);
  if (iVar2 != 0) {
    uVar3 = (uint)*param_3;
  }
  if (iVar2 != 0 && uVar3 != 0) {
    local_20[0] = 0;
    FUN_0001da28(*(undefined4 *)(iVar2 + 0x264),local_20);
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_1c) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0006981c — 0006981c

- 函数名: FUN_0006981c
- 函数体: 161 字节
- 调用者数: 0 / 被调用者数: 6

```c

void FUN_0006981c(int param_1,undefined4 param_2,byte *param_3)

{
  byte bVar1;
  int iVar2;
  uint uVar3;
  undefined4 uVar4;
  undefined1 auStack_70 [40];
  undefined1 auStack_48 [40];
  undefined1 local_20 [4];
  int local_1c;
  
  local_1c = *(int *)PTR____stack_chk_guard_004d9044;
  bVar1 = FUN_0006af94(param_1,1);
  *param_3 = bVar1;
  uVar4 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_48,"challengeContainer");
  uVar4 = FUN_0039725c(uVar4,auStack_48);
  FUN_0030f7e0(auStack_48);
  FUN_0030f7cc(auStack_70,"adventureNode_2");
  iVar2 = FUN_0039725c(uVar4,auStack_70);
  uVar3 = FUN_0030f7e0(auStack_70);
  if (iVar2 != 0) {
    uVar3 = (uint)*param_3;
  }
  if (iVar2 != 0 && uVar3 != 0) {
    local_20[0] = 0;
    FUN_0001da28(*(undefined4 *)(iVar2 + 0x264),local_20);
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_1c) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_000698c0 — 000698c0

- 函数名: FUN_000698c0
- 函数体: 161 字节
- 调用者数: 0 / 被调用者数: 6

```c

void FUN_000698c0(int param_1,undefined4 param_2,byte *param_3)

{
  byte bVar1;
  int iVar2;
  uint uVar3;
  undefined4 uVar4;
  undefined1 auStack_70 [40];
  undefined1 auStack_48 [40];
  undefined1 local_20 [4];
  int local_1c;
  
  local_1c = *(int *)PTR____stack_chk_guard_004d9044;
  bVar1 = FUN_0006af94(param_1,2);
  *param_3 = bVar1;
  uVar4 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_48,"challengeContainer");
  uVar4 = FUN_0039725c(uVar4,auStack_48);
  FUN_0030f7e0(auStack_48);
  FUN_0030f7cc(auStack_70,"adventureNode_3");
  iVar2 = FUN_0039725c(uVar4,auStack_70);
  uVar3 = FUN_0030f7e0(auStack_70);
  if (iVar2 != 0) {
    uVar3 = (uint)*param_3;
  }
  if (iVar2 != 0 && uVar3 != 0) {
    local_20[0] = 0;
    FUN_0001da28(*(undefined4 *)(iVar2 + 0x264),local_20);
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_1c) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00069964 — 00069964

- 函数名: FUN_00069964
- 函数体: 161 字节
- 调用者数: 0 / 被调用者数: 6

```c

void FUN_00069964(int param_1,undefined4 param_2,byte *param_3)

{
  byte bVar1;
  int iVar2;
  uint uVar3;
  undefined4 uVar4;
  undefined1 auStack_70 [40];
  undefined1 auStack_48 [40];
  undefined1 local_20 [4];
  int local_1c;
  
  local_1c = *(int *)PTR____stack_chk_guard_004d9044;
  bVar1 = FUN_0006af94(param_1,3);
  *param_3 = bVar1;
  uVar4 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_48,"challengeContainer");
  uVar4 = FUN_0039725c(uVar4,auStack_48);
  FUN_0030f7e0(auStack_48);
  FUN_0030f7cc(auStack_70,"adventureNode_4");
  iVar2 = FUN_0039725c(uVar4,auStack_70);
  uVar3 = FUN_0030f7e0(auStack_70);
  if (iVar2 != 0) {
    uVar3 = (uint)*param_3;
  }
  if (iVar2 != 0 && uVar3 != 0) {
    local_20[0] = 0;
    FUN_0001da28(*(undefined4 *)(iVar2 + 0x264),local_20);
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_1c) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00069a08 — 00069a08

- 函数名: FUN_00069a08
- 函数体: 49 字节
- 调用者数: 1 / 被调用者数: 0

```c

void FUN_00069a08(int param_1)

{
  int iVar1;
  int iVar2;
  int iVar3;
  
  iVar2 = 0;
  *(undefined1 *)(param_1 + 0x18) = 0;
  iVar3 = *(int *)(*(int *)(param_1 + 0xc) + 0x68);
  do {
    if (*(int *)(iVar3 + 0x7c) <= iVar2) goto LAB_00069a34;
    iVar1 = iVar2 * 8;
    iVar2 = iVar2 + 1;
  } while (*(int *)(*(int *)(iVar3 + 0x78) + iVar1 + 4) != 0);
  if (*(char *)(*(int *)(param_1 + 0xc) + 0xa0) == '\0') {
    return;
  }
LAB_00069a34:
  *(undefined1 *)(param_1 + 0x18) = 1;
  return;
}


```

## FUN_00069ddc — 00069ddc

- 函数名: FUN_00069ddc
- 函数体: 275 字节
- 调用者数: 1 / 被调用者数: 9

```c

void FUN_00069ddc(int param_1)

{
  int iVar1;
  int iVar2;
  int *piVar3;
  undefined4 uVar4;
  uint uVar5;
  undefined8 uVar6;
  undefined8 uVar7;
  undefined1 auStack_78 [40];
  undefined4 local_50;
  undefined4 local_4c;
  undefined1 auStack_48 [40];
  undefined1 local_20 [4];
  int local_1c;
  
  local_1c = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_000610cc(*(undefined4 *)(param_1 + 0xc),0,0);
  uVar4 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_48,"bossChallengeContainer");
  iVar1 = FUN_0039725c(uVar4,auStack_48);
  FUN_0030f7e0(auStack_48);
  if (iVar1 != 0) {
    local_20[0] = *(int *)(*(int *)(*(int *)(param_1 + 0xc) + 0x68) + 0x98) != 0;
    FUN_0001da28(*(undefined4 *)(iVar1 + 0x260),local_20);
    iVar2 = *(int *)(*(int *)(param_1 + 0xc) + 0x68);
    if (*(int *)(iVar2 + 0x98) != 0) {
      uVar5 = 0;
      piVar3 = (int *)FUN_0006ed58(iVar2,0);
      if (*(int *)(*piVar3 + 0x100) != 0) {
        uVar5 = *(uint *)(*(int *)(*piVar3 + 0x100) + 0x44);
      }
      uVar7 = FixedToFP(CONCAT44(uVar5 >> 3,uVar5 >> 3),0,1,0,0x20);
      uVar6 = FixedToFP(CONCAT44(uVar5,uVar5) & 0x700000007,0,1,0,0x20);
      uVar7 = FloatVectorMult(uVar7,0x3e0000003e000000,2,0x20);
      uVar6 = FloatVectorMult(uVar6,0x3e0000003e000000,2,0x20);
      local_50 = (undefined4)uVar6;
      local_4c = (undefined4)uVar7;
      _memcpy(&DAT_005f9590,"spinner.adventureNode_1",0x18);
      FUN_0030f7cc(auStack_78,&DAT_005f9590);
      iVar1 = FUN_0039725c(iVar1,auStack_78);
      FUN_0030f7e0(auStack_78);
      if (iVar1 != 0) {
        FUN_0006bc4c(*(undefined4 *)(iVar1 + 0x744),&local_50);
      }
    }
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_1c) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0006a90c — 0006a90c

- 函数名: FUN_0006a90c
- 函数体: 801 字节
- 调用者数: 3 / 被调用者数: 9

```c

void FUN_0006a90c(int param_1)

{
  int *piVar1;
  int iVar2;
  char *pcVar3;
  int iVar4;
  undefined ***pppuVar5;
  undefined4 uVar6;
  code *pcVar7;
  int iVar8;
  undefined1 auStack_188 [40];
  undefined1 auStack_160 [40];
  undefined1 auStack_138 [40];
  undefined1 auStack_110 [40];
  undefined1 auStack_e8 [40];
  undefined **local_c0;
  undefined *local_bc;
  undefined1 local_a0;
  undefined **local_9c;
  undefined *local_98;
  undefined1 local_7c;
  undefined1 auStack_78 [40];
  undefined1 auStack_50 [40];
  undefined1 local_28 [4];
  int local_24;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  iVar8 = *(int *)(*(int *)(param_1 + 0xc) + 0x68);
  _sprintf(&DAT_005f9590,"challengeContainer.spinner.adventureNode_%d",*(int *)(iVar8 + 0x90) + 1);
  uVar6 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_50,&DAT_005f9590);
  piVar1 = (int *)FUN_0039725c(uVar6,auStack_50);
  FUN_0030f7e0(auStack_50);
  if (piVar1 != (int *)0x0) {
    pcVar7 = *(code **)(*piVar1 + 0x40);
    FUN_0030f7cc(auStack_78,"animate_trigger");
    (*pcVar7)(piVar1,auStack_78,1);
    FUN_0030f7e0(auStack_78);
  }
  iVar4 = *(int *)(iVar8 + 0x90);
  iVar2 = FUN_0006ed58(iVar8,iVar4);
  if (*(int *)(iVar2 + 4) != 0) {
    iVar4 = iVar4 + 1;
    iVar2 = FUN_0006ed58(iVar8,*(undefined4 *)(iVar8 + 0x90));
    if (*(int *)(iVar2 + 4) == 1) {
      _sprintf(&DAT_005f9590,"challengeContainer.spinner.adventureNodePass_%d",iVar4);
      pppuVar5 = &local_9c;
      uVar6 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
      local_7c = 1;
      local_9c = (undefined **)0x0;
      FUN_0000a298(pppuVar5);
      local_7c = 0;
      local_9c = &PTR_LAB_0052bf38;
      local_98 = PTR_FUN_004d9058;
      pcVar3 = "challenge-tick";
    }
    else {
      _sprintf(&DAT_005f9590,"challengeContainer.spinner.adventureNodeFail_%d",iVar4);
      pppuVar5 = &local_c0;
      uVar6 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
      local_a0 = 1;
      local_c0 = (undefined **)0x0;
      FUN_0000a298(pppuVar5);
      local_a0 = 0;
      pcVar3 = "gank";
      local_c0 = &PTR_LAB_0052bf38;
      local_bc = PTR_FUN_004d9058;
    }
    FUN_0002bb34(uVar6,pcVar3,0x3f800000,0x3f800000,pppuVar5,0);
    FUN_0000a298(pppuVar5);
    uVar6 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_e8,&DAT_005f9590);
    piVar1 = (int *)FUN_0039725c(uVar6,auStack_e8);
    FUN_0030f7e0(auStack_e8);
    if (piVar1 != (int *)0x0) {
      local_28[0] = 1;
      FUN_0001da28(piVar1[0x98],local_28);
      pcVar7 = *(code **)(*piVar1 + 0x40);
      FUN_0030f7cc(auStack_110,"animate_trigger");
      (*pcVar7)(piVar1,auStack_110,1);
      FUN_0030f7e0(auStack_110);
    }
    iVar2 = FUN_0006ed58(iVar8,*(undefined4 *)(iVar8 + 0x90));
    if (*(int *)(iVar2 + 4) == 1) {
      pcVar3 = "progressUIContainer.map.challenge_%d_%d.pass";
    }
    else {
      pcVar3 = "progressUIContainer.map.challenge_%d_%d.fail";
    }
    _sprintf(&DAT_005f9590,pcVar3,*(int *)(iVar8 + 0xa4) + 1,iVar4);
    uVar6 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_138,&DAT_005f9590);
    piVar1 = (int *)FUN_0039725c(uVar6,auStack_138);
    FUN_0030f7e0(auStack_138);
    if (piVar1 != (int *)0x0) {
      local_28[0] = 1;
      FUN_0001da28(piVar1[0x98],local_28);
      pcVar7 = *(code **)(*piVar1 + 0x40);
      FUN_0030f7cc(auStack_160,"animate_trigger");
      (*pcVar7)(piVar1,auStack_160,1);
      FUN_0030f7e0(auStack_160);
    }
  }
  if (0 < *(int *)(iVar8 + 0x7c)) {
    iVar2 = 0;
    do {
      iVar4 = FUN_0006ed58(iVar8,iVar2);
      iVar2 = iVar2 + 1;
      if (*(int *)(iVar4 + 4) == 0) {
        _sprintf(&DAT_005f9590,"challengeContainer.spinner.adventureNode_%d",iVar2);
        uVar6 = *(undefined4 *)(param_1 + 4);
        FUN_0030f7cc(auStack_188,&DAT_005f9590);
        iVar4 = FUN_0039725c(uVar6,auStack_188);
        FUN_0030f7e0(auStack_188);
        if (iVar4 != 0) {
          local_28[0] = 1;
          FUN_0001da28(*(undefined4 *)(iVar4 + 0x264),local_28);
        }
      }
    } while (iVar2 < *(int *)(iVar8 + 0x7c));
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0006ac30 — 0006ac30

- 函数名: FUN_0006ac30
- 函数体: 241 字节
- 调用者数: 1 / 被调用者数: 7

```c

void FUN_0006ac30(int param_1)

{
  int iVar1;
  int iVar2;
  undefined4 uVar3;
  undefined1 auStack_78 [40];
  undefined1 auStack_50 [40];
  undefined1 local_28 [4];
  int local_24;
  
  iVar2 = 1;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  do {
    _sprintf(&DAT_005f9590,"challengeContainer.spinner.adventureNodePass_%d",iVar2);
    uVar3 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_50,&DAT_005f9590);
    iVar1 = FUN_0039725c(uVar3,auStack_50);
    FUN_0030f7e0(auStack_50);
    if (iVar1 != 0) {
      local_28[0] = 0;
      FUN_0001da28(*(undefined4 *)(iVar1 + 0x260),local_28);
      FUN_00396d98(iVar1,1);
    }
    _sprintf(&DAT_005f9590,"challengeContainer.spinner.adventureNodeFail_%d",iVar2);
    uVar3 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_78,&DAT_005f9590);
    iVar1 = FUN_0039725c(uVar3,auStack_78);
    FUN_0030f7e0(auStack_78);
    if (iVar1 != 0) {
      local_28[0] = 0;
      FUN_0001da28(*(undefined4 *)(iVar1 + 0x260),local_28);
      FUN_00396d98(iVar1,1);
    }
    iVar2 = iVar2 + 1;
  } while (iVar2 != 5);
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0006ad24 — 0006ad24

- 函数名: FUN_0006ad24
- 函数体: 293 字节
- 调用者数: 2 / 被调用者数: 6

```c

void FUN_0006ad24(int param_1)

{
  undefined *puVar1;
  int iVar2;
  int *piVar3;
  int iVar4;
  undefined4 uVar5;
  code *pcVar6;
  undefined1 auStack_12c [40];
  undefined1 auStack_104 [40];
  undefined1 auStack_dc [40];
  undefined1 auStack_b4 [40];
  undefined1 auStack_8c [40];
  char acStack_64 [64];
  int local_24;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0x1c) = 0;
  uVar5 = *(undefined4 *)(param_1 + 4);
  iVar2 = *(int *)(*(int *)(param_1 + 0xc) + 0x68);
  FUN_0030f7cc(auStack_8c,"progressUIContainer");
  piVar3 = (int *)FUN_0039725c(uVar5,auStack_8c);
  FUN_0030f7e0(auStack_8c);
  if (*(char *)(param_1 + 0x18) != '\0') {
    FUN_0030f7cc(auStack_b4,"map");
    iVar4 = FUN_0039725c(piVar3,auStack_b4);
    FUN_0030f7e0(auStack_b4);
    if (iVar4 != 0) {
      pcVar6 = *(code **)(*piVar3 + 0x40);
      FUN_0030f7cc(auStack_dc,"animate_reset");
      (*pcVar6)(piVar3,auStack_dc,1);
      FUN_0030f7e0(auStack_dc);
    }
    FUN_0030f7cc(auStack_104,"pussMap");
    piVar3 = (int *)FUN_0039725c(iVar4,auStack_104);
    FUN_0030f7e0(auStack_104);
    if (piVar3 != (int *)0x0) {
      _sprintf(acStack_64,"animate_trigger_%d",*(int *)(iVar2 + 0xa4) + 1);
      pcVar6 = *(code **)(*piVar3 + 0x40);
      FUN_0030f7cc(auStack_12c,acStack_64);
      (*pcVar6)(piVar3,auStack_12c,1);
      FUN_0030f7e0(auStack_12c);
      *(undefined4 *)(param_1 + 0x14) = 3;
      goto LAB_0006ae34;
    }
  }
  FUN_0006ae4c(param_1);
LAB_0006ae34:
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0006ae4c — 0006ae4c

- 函数名: FUN_0006ae4c
- 函数体: 37 字节
- 调用者数: 2 / 被调用者数: 2

```c

void FUN_0006ae4c(int param_1)

{
  *(undefined4 *)(param_1 + 0x1c) = 0;
  if (*(char *)(param_1 + 0x18) != '\0') {
    FUN_0006ae74(param_1);
    return;
  }
  FUN_0006a90c(param_1);
  *(undefined4 *)(param_1 + 0x1c) = 0;
  *(undefined4 *)(param_1 + 0x20) = 0;
  *(undefined4 *)(param_1 + 0x14) = 7;
  return;
}


```

## FUN_0006b074 — 0006b074

- 函数名: FUN_0006b074
- 函数体: 877 字节
- 调用者数: 1 / 被调用者数: 15

```c

void FUN_0006b074(int param_1,int param_2)

{
  int iVar1;
  int *piVar2;
  undefined4 uVar3;
  char *pcVar4;
  undefined1 *puVar5;
  undefined4 uVar6;
  code *pcVar7;
  undefined1 auStack_230 [40];
  undefined1 auStack_208 [40];
  undefined1 auStack_1e0 [120];
  undefined1 auStack_168 [40];
  undefined1 auStack_140 [40];
  undefined1 auStack_118 [40];
  undefined1 auStack_f0 [40];
  undefined1 auStack_c8 [40];
  undefined1 auStack_a0 [40];
  undefined1 auStack_78 [40];
  undefined1 auStack_50 [40];
  undefined1 local_28 [4];
  int local_24;
  
  puVar5 = auStack_230;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  uVar6 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_50,"challengeContainer");
  iVar1 = FUN_0039725c(uVar6,auStack_50);
  FUN_0030f7e0(auStack_50);
  if (iVar1 != 0) {
    local_28[0] = *(int *)(*(int *)(*(int *)(param_1 + 0xc) + 0x68) + 0x98) == 0;
    FUN_0001da28(*(undefined4 *)(iVar1 + 0x260),local_28);
  }
  uVar6 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_78,"bossChallengeContainer");
  iVar1 = FUN_0039725c(uVar6,auStack_78);
  FUN_0030f7e0(auStack_78);
  if (iVar1 != 0) {
    local_28[0] = *(int *)(*(int *)(*(int *)(param_1 + 0xc) + 0x68) + 0x98) != 0;
    FUN_0001da28(*(undefined4 *)(iVar1 + 0x260),local_28);
  }
  *(undefined4 *)(param_1 + 0x14) = *(undefined4 *)(param_2 + 0x188);
  *(undefined4 *)(param_1 + 0x20) = *(undefined4 *)(param_2 + 0x18c);
  uVar6 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_a0,"@actContainer");
  piVar2 = (int *)FUN_0039725c(uVar6,auStack_a0);
  FUN_0030f7e0(auStack_a0);
  switch(*(undefined4 *)(param_1 + 0x14)) {
  case 0:
    FUN_00396d98(*(undefined4 *)(param_1 + 4),1);
    piVar2 = *(int **)(param_1 + 4);
    puVar5 = auStack_c8;
    pcVar7 = *(code **)(*piVar2 + 0x40);
    pcVar4 = "start_game";
    goto LAB_0006b1ec;
  case 1:
    FUN_00396d98(*(undefined4 *)(param_1 + 4),1);
    piVar2 = *(int **)(param_1 + 4);
    puVar5 = auStack_f0;
    pcVar7 = *(code **)(*piVar2 + 0x40);
    pcVar4 = "act_change";
    goto LAB_0006b1ec;
  case 2:
    FUN_00396d98(*(undefined4 *)(param_1 + 4),1);
    piVar2 = *(int **)(param_1 + 4);
    pcVar7 = *(code **)(*piVar2 + 0x40);
    FUN_0030f7cc(auStack_118,"animate_in");
    (*pcVar7)(piVar2,auStack_118,1);
    FUN_0030f7e0(auStack_118);
    piVar2 = *(int **)(param_1 + 4);
    puVar5 = auStack_140;
    pcVar7 = *(code **)(*piVar2 + 0x40);
    pcVar4 = "map_in";
LAB_0006b1ec:
    FUN_0030f7cc(puVar5,pcVar4);
    (*pcVar7)(piVar2,puVar5,1);
    FUN_0030f7e0(puVar5);
    break;
  case 3:
    FUN_00396d98(*(undefined4 *)(param_1 + 4),1);
    if (piVar2 != (int *)0x0) {
      pcVar7 = *(code **)(*piVar2 + 0x40);
      FUN_0030f7cc(auStack_168,"animate_in");
      (*pcVar7)(piVar2,auStack_168,1);
      FUN_0030f7e0(auStack_168);
      FUN_00397e70(piVar2,0x3a83126f,0,1);
    }
    FUN_0006ad24(param_1);
    break;
  case 4:
    FUN_00396d98(*(undefined4 *)(param_1 + 4),1);
    if (piVar2 == (int *)0x0) break;
    puVar5 = &stack0x00000080;
    pcVar7 = *(code **)(*piVar2 + 0x40);
    goto LAB_0006b28c;
  case 5:
    FUN_00396d98(*(undefined4 *)(param_1 + 4),1);
    if (piVar2 == (int *)0x0) break;
    puVar5 = &stack0x00000058;
    pcVar7 = *(code **)(*piVar2 + 0x40);
LAB_0006b28c:
    puVar5 = puVar5 + -0x210;
    FUN_0030f7cc(puVar5,"animate_in");
    (*pcVar7)(piVar2,puVar5,1);
    FUN_0030f7e0(puVar5);
    FUN_00397e70(piVar2,0x3a83126f,0,1);
    break;
  case 7:
    FUN_00396d98(*(undefined4 *)(param_1 + 4),1);
    if (piVar2 != (int *)0x0) {
      pcVar7 = *(code **)(*piVar2 + 0x40);
      FUN_0030f7cc(auStack_1e0,"animate_in");
      (*pcVar7)(piVar2,auStack_1e0,1);
      FUN_0030f7e0(auStack_1e0);
      FUN_00397e70(piVar2,0x3a83126f,0,1);
    }
    *(undefined4 *)(param_1 + 0x1c) = 0;
    *(undefined4 *)(param_1 + 0x20) = 0;
    *(undefined4 *)(param_1 + 0x14) = 7;
    break;
  case 8:
    FUN_00396d98(*(undefined4 *)(param_1 + 4),1);
    if (piVar2 != (int *)0x0) {
      puVar5 = auStack_208;
      pcVar7 = *(code **)(*piVar2 + 0x40);
LAB_0006b33c:
      FUN_0030f7cc(puVar5,"animate_in");
      (*pcVar7)(piVar2,puVar5,1);
      FUN_0030f7e0(puVar5);
    }
    goto LAB_0006b350;
  case 9:
    FUN_00396d98(*(undefined4 *)(param_1 + 4),1);
    if (piVar2 != (int *)0x0) {
      pcVar7 = *(code **)(*piVar2 + 0x40);
      goto LAB_0006b33c;
    }
LAB_0006b350:
    FUN_0006af28(param_1);
  }
  *(undefined4 *)(param_1 + 0x20) = *(undefined4 *)(param_2 + 0x18c);
  uVar6 = FUN_0006b400(param_1,param_2);
  switch(*(undefined4 *)(param_1 + 0x14)) {
  case 0:
  case 1:
    *(undefined1 *)(param_1 + 0x18) = 1;
    break;
  case 4:
    FUN_0006ae74(param_1);
    uVar6 = *(undefined4 *)(param_2 + 0x18c);
    *(undefined4 *)(param_1 + 0x1c) = uVar6;
    *(undefined4 *)(param_1 + 0x20) = uVar6;
    break;
  case 5:
    uVar6 = FUN_0006ae74(param_1);
    uVar3 = *(undefined4 *)(param_2 + 0x18c);
    *(undefined4 *)(param_1 + 0x1c) = 0x3f19999a;
    *(undefined4 *)(param_1 + 0x20) = uVar3;
    break;
  case 7:
    uVar6 = FUN_0006a90c(param_1);
    break;
  case 8:
  case 9:
    *(undefined4 *)(param_1 + 0x10) = *(undefined4 *)(param_2 + 0x17c);
    FUN_000610cc(*(undefined4 *)(param_1 + 0xc),0,1);
    uVar6 = FUN_0006ed60(*(undefined4 *)(*(int *)(param_1 + 0xc) + 0x68));
    *(undefined4 *)(*(int *)(param_1 + 0xc) + 100) = uVar6;
    uVar6 = FUN_00061128(*(undefined4 *)(param_1 + 0xc),1);
  }
  FUN_00397e70(uVar6,*(undefined4 *)(param_1 + 4),*(undefined4 *)(param_1 + 0x20),0,1);
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

