# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0005809c — 0005809c

- 函数名: FUN_0005809c
- 函数体: 71 字节
- 调用者数: 3 / 被调用者数: 0

```c

bool FUN_0005809c(int param_1,int param_2)

{
  int iVar1;
  undefined8 uVar2;
  undefined8 in_d1;
  undefined8 uVar3;
  
  uVar2 = 0x3f8000003f800000;
  iVar1 = *(int *)(param_1 + param_2 * 4 + 0x168);
  if (iVar1 != 0) {
    uVar2 = CONCAT44(0x3f800000,*(undefined4 *)(iVar1 + 0xa4));
  }
  uVar2 = FloatVectorMult(uVar2,CONCAT44((int)((ulonglong)in_d1 >> 0x20),
                                         *(undefined4 *)(param_1 + 0x70)),2,0x20);
  uVar3 = FixedToFP(CONCAT44(*(int *)PTR_DAT_004d916c / 2,*(int *)PTR_DAT_004d916c / 2),0,0,0,0x20);
  return (float)uVar3 < (float)uVar2;
}


```

## FUN_00052fe4 — 00052fe4

- 函数名: FUN_00052fe4
- 函数体: 209 字节
- 调用者数: 1 / 被调用者数: 1

```c

int FUN_00052fe4(int param_1)

{
  undefined4 *puVar1;
  undefined4 *puVar2;
  int iVar3;
  int iVar4;
  
  FUN_00301080(param_1 + 8);
  puVar2 = (undefined4 *)(param_1 + 0x98);
  do {
    *puVar2 = 0;
    puVar2[1] = 0;
    puVar2[2] = 0;
    puVar2 = puVar2 + 3;
  } while (puVar2 != (undefined4 *)(param_1 + 0xb0));
  iVar4 = 0;
  do {
    iVar3 = param_1 + iVar4;
    iVar4 = iVar4 + 0x40;
    *(undefined4 *)(iVar3 + 0xe0) = 0;
    *(undefined4 *)(iVar3 + 0xe8) = 0;
    *(undefined4 *)(iVar3 + 0xec) = 0xffffffff;
    *(undefined4 *)(iVar3 + 0xb0) = 10;
    *(undefined4 *)(iVar3 + 0xb4) = 0x3e800000;
    *(undefined4 *)(iVar3 + 0xb8) = 0x3f800000;
    *(undefined4 *)(iVar3 + 0xbc) = 0x3f800000;
    *(undefined4 *)(iVar3 + 0xc0) = 0;
    *(undefined4 *)(iVar3 + 0xc4) = 0;
    *(undefined4 *)(iVar3 + 0xd0) = 0;
    *(undefined4 *)(iVar3 + 0xd4) = 0;
    *(undefined4 *)(iVar3 + 0xd8) = 0;
    *(undefined4 *)(iVar3 + 200) = 0x40000000;
    *(undefined4 *)(iVar3 + 0xcc) = 0;
    *(undefined4 *)(iVar3 + 0xe4) = 100;
    *(undefined1 *)(iVar3 + 0xdc) = 1;
    *(undefined1 *)(iVar3 + 0xdd) = 1;
  } while (iVar4 != 0x80);
  puVar2 = (undefined4 *)(param_1 + 0x140);
  puVar1 = (undefined4 *)(param_1 + 0x130);
  do {
    *puVar1 = 0;
    puVar1[1] = 0;
    puVar1 = puVar1 + 2;
  } while (puVar1 != puVar2);
  do {
    *puVar2 = 0;
    puVar2[1] = 0;
    puVar2[2] = 0;
    puVar2 = puVar2 + 3;
  } while (puVar2 != (undefined4 *)(param_1 + 0x164));
  *(undefined4 *)(param_1 + 0x21c) = 0;
  *(undefined4 *)(param_1 + 0x220) = 0;
  *(undefined4 *)(param_1 + 0x224) = 0;
  *(undefined4 *)(param_1 + 0x214) = 0;
  *(undefined1 *)(param_1 + 0x17b) = 0;
  return param_1;
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

