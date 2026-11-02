# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

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

## FUN_000690f0 — 000690f0

- 函数名: FUN_000690f0
- 函数体: 1671 字节
- 调用者数: 1 / 被调用者数: 13

```c

void FUN_000690f0(int param_1,undefined4 param_2)

{
  undefined *puVar1;
  undefined4 uVar2;
  int iVar3;
  _List_node_base *p_Var4;
  int iVar5;
  int iVar6;
  undefined4 *puVar7;
  undefined4 *puVar8;
  int iVar9;
  undefined *local_29c;
  int local_298;
  undefined1 *local_294;
  undefined4 local_290;
  undefined1 local_27c;
  undefined4 local_278;
  undefined4 local_274;
  undefined1 auStack_270 [40];
  undefined1 auStack_248 [40];
  undefined4 local_220;
  undefined4 local_21c;
  undefined1 auStack_218 [40];
  undefined1 auStack_1f0 [40];
  undefined *local_1c8;
  int local_1c4;
  undefined1 *local_1c0;
  undefined4 local_1bc;
  undefined1 local_1a8;
  undefined4 local_1a4;
  undefined4 local_1a0;
  undefined1 auStack_19c [40];
  undefined *local_174;
  int local_170;
  undefined1 *local_16c;
  undefined4 local_168;
  undefined1 local_154;
  undefined4 local_150;
  undefined4 local_14c;
  undefined1 auStack_148 [40];
  undefined *local_120;
  int local_11c;
  undefined1 *local_118;
  undefined4 local_114;
  undefined1 local_100;
  undefined4 local_fc;
  undefined4 local_f8;
  undefined1 auStack_f4 [40];
  undefined *local_cc;
  int local_c8;
  undefined1 *local_c4;
  undefined4 local_c0;
  undefined1 local_ac;
  undefined4 local_a8;
  undefined4 local_a4;
  undefined1 auStack_a0 [40];
  undefined1 auStack_78 [40];
  uint local_50 [8];
  undefined1 local_30;
  undefined4 local_2c;
  undefined4 local_28;
  int local_24;
  
  puVar1 = PTR_DAT_004d9048;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0x20) = 0;
  uVar2 = FUN_0001cfb0(*(undefined4 *)(puVar1 + 0x654),"inGameChallengeMapScreen",0);
  *(undefined4 *)(param_1 + 4) = uVar2;
  *(undefined1 *)(param_1 + 0x24) = 1;
  *(undefined4 *)(param_1 + 0xc) = param_2;
  *(undefined4 *)(param_1 + 0x10) = 0xffffffff;
  FUN_0030f7cc(auStack_78,"challengeContainer.spinner");
  uVar2 = FUN_0039725c(uVar2,auStack_78);
  FUN_0030f7e0(auStack_78);
  FUN_0030f7cc(auStack_a0,"adventureNode_1");
  iVar3 = FUN_0039725c(uVar2,auStack_a0);
  FUN_0030f7e0(auStack_a0);
  if (iVar3 != 0) {
    local_a8 = 0x3e000000;
    local_a4 = 0x3e000000;
    FUN_0006bc4c(*(undefined4 *)(iVar3 + 0x748),&local_a8);
    puVar8 = (undefined4 *)(iVar3 + 0xb34);
    if (*(int *)(iVar3 + 0xb3c) == 0) {
      FUN_00022608(puVar8);
      *puVar8 = puVar8;
      *(undefined4 **)(iVar3 + 0xb38) = puVar8;
    }
    else {
      puVar7 = (undefined4 *)*puVar8;
      if (puVar7 != puVar8) {
        puVar7[0xb] = *(int *)(iVar3 + 0xb3c);
        puVar7[0xc] = 2;
        *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
        for (puVar7 = (undefined4 *)*puVar7; puVar7 != puVar8; puVar7 = (undefined4 *)*puVar7) {
          puVar7[0xb] = *(undefined4 *)(iVar3 + 0xb3c);
          puVar7[0xc] = 2;
          *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
        }
      }
    }
    local_ac = 1;
    local_cc = (undefined *)0x0;
    FUN_00022510(&local_cc);
    local_ac = 0;
    local_cc = &DAT_0052cc18;
    local_c0 = 0;
    local_c4 = &FUN_00069778_1;
    local_30 = 1;
    local_50[0] = 0;
    local_c8 = param_1;
    (*(code *)PTR_FUN_0052cc20)(&local_cc,local_50);
    local_2c = 0;
    local_28 = 0;
    p_Var4 = (_List_node_base *)FUN_0002256c(puVar8,local_50);
    std::_List_node_base::hook(p_Var4);
    FUN_00022510(local_50);
    if (*(int *)(iVar3 + 0xb3c) != 0) {
      iVar6 = *(int *)(iVar3 + 0xb38);
      *(int *)(iVar6 + 0x2c) = *(int *)(iVar3 + 0xb3c);
      *(undefined4 *)(iVar6 + 0x30) = 1;
      *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
    }
    FUN_00022510(&local_cc);
    local_50[0] = local_50[0] & 0xffffff00;
    FUN_0001da28(*(undefined4 *)(iVar3 + 0x264),local_50);
  }
  FUN_0030f7cc(auStack_f4,"adventureNode_2");
  iVar3 = FUN_0039725c(uVar2,auStack_f4);
  FUN_0030f7e0(auStack_f4);
  if (iVar3 != 0) {
    local_fc = 0x3e000000;
    local_f8 = 0x3e000000;
    FUN_0006bc4c(*(undefined4 *)(iVar3 + 0x748),&local_fc);
    puVar8 = (undefined4 *)(iVar3 + 0xb34);
    if (*(int *)(iVar3 + 0xb3c) == 0) {
      FUN_00022608(puVar8);
      *puVar8 = puVar8;
      *(undefined4 **)(iVar3 + 0xb38) = puVar8;
    }
    else {
      puVar7 = (undefined4 *)*puVar8;
      if (puVar7 != puVar8) {
        puVar7[0xb] = *(int *)(iVar3 + 0xb3c);
        puVar7[0xc] = 2;
        *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
        for (puVar7 = (undefined4 *)*puVar7; puVar7 != puVar8; puVar7 = (undefined4 *)*puVar7) {
          puVar7[0xb] = *(undefined4 *)(iVar3 + 0xb3c);
          puVar7[0xc] = 2;
          *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
        }
      }
    }
    local_100 = 1;
    local_120 = (undefined *)0x0;
    FUN_00022510(&local_120);
    local_100 = 0;
    local_120 = &DAT_0052cc18;
    local_114 = 0;
    local_118 = &FUN_0006981c_1;
    local_30 = 1;
    local_50[0] = 0;
    local_11c = param_1;
    (*(code *)PTR_FUN_0052cc20)(&local_120,local_50);
    local_2c = 0;
    local_28 = 0;
    p_Var4 = (_List_node_base *)FUN_0002256c(puVar8,local_50);
    std::_List_node_base::hook(p_Var4);
    FUN_00022510(local_50);
    if (*(int *)(iVar3 + 0xb3c) != 0) {
      iVar6 = *(int *)(iVar3 + 0xb38);
      *(int *)(iVar6 + 0x2c) = *(int *)(iVar3 + 0xb3c);
      *(undefined4 *)(iVar6 + 0x30) = 1;
      *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
    }
    FUN_00022510(&local_120);
    local_50[0] = local_50[0] & 0xffffff00;
    FUN_0001da28(*(undefined4 *)(iVar3 + 0x264),local_50);
  }
  FUN_0030f7cc(auStack_148,"adventureNode_3");
  iVar3 = FUN_0039725c(uVar2,auStack_148);
  FUN_0030f7e0(auStack_148);
  if (iVar3 != 0) {
    local_150 = 0x3e000000;
    local_14c = 0x3e000000;
    FUN_0006bc4c(*(undefined4 *)(iVar3 + 0x748),&local_150);
    puVar8 = (undefined4 *)(iVar3 + 0xb34);
    if (*(int *)(iVar3 + 0xb3c) == 0) {
      FUN_00022608(puVar8);
      *puVar8 = puVar8;
      *(undefined4 **)(iVar3 + 0xb38) = puVar8;
    }
    else {
      puVar7 = (undefined4 *)*puVar8;
      if (puVar7 != puVar8) {
        puVar7[0xb] = *(int *)(iVar3 + 0xb3c);
        puVar7[0xc] = 2;
        *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
        for (puVar7 = (undefined4 *)*puVar7; puVar7 != puVar8; puVar7 = (undefined4 *)*puVar7) {
          puVar7[0xb] = *(undefined4 *)(iVar3 + 0xb3c);
          puVar7[0xc] = 2;
          *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
        }
      }
    }
    local_154 = 1;
    local_174 = (undefined *)0x0;
    FUN_00022510(&local_174);
    local_154 = 0;
    local_174 = &DAT_0052cc18;
    local_168 = 0;
    local_16c = &FUN_000698c0_1;
    local_30 = 1;
    local_50[0] = 0;
    local_170 = param_1;
    (*(code *)PTR_FUN_0052cc20)(&local_174,local_50);
    local_2c = 0;
    local_28 = 0;
    p_Var4 = (_List_node_base *)FUN_0002256c(puVar8,local_50);
    std::_List_node_base::hook(p_Var4);
    FUN_00022510(local_50);
    if (*(int *)(iVar3 + 0xb3c) != 0) {
      iVar6 = *(int *)(iVar3 + 0xb38);
      *(int *)(iVar6 + 0x2c) = *(int *)(iVar3 + 0xb3c);
      *(undefined4 *)(iVar6 + 0x30) = 1;
      *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
    }
    FUN_00022510(&local_174);
    local_50[0] = local_50[0] & 0xffffff00;
    FUN_0001da28(*(undefined4 *)(iVar3 + 0x264),local_50);
  }
  FUN_0030f7cc(auStack_19c,"adventureNode_4");
  iVar3 = FUN_0039725c(uVar2,auStack_19c);
  FUN_0030f7e0(auStack_19c);
  if (iVar3 != 0) {
    local_1a4 = 0x3e000000;
    local_1a0 = 0x3e000000;
    FUN_0006bc4c(*(undefined4 *)(iVar3 + 0x748),&local_1a4);
    puVar8 = (undefined4 *)(iVar3 + 0xb34);
    if (*(int *)(iVar3 + 0xb3c) == 0) {
      FUN_00022608(puVar8);
      *puVar8 = puVar8;
      *(undefined4 **)(iVar3 + 0xb38) = puVar8;
    }
    else {
      puVar7 = (undefined4 *)*puVar8;
      if (puVar7 != puVar8) {
        puVar7[0xb] = *(int *)(iVar3 + 0xb3c);
        puVar7[0xc] = 2;
        *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
        for (puVar7 = (undefined4 *)*puVar7; puVar7 != puVar8; puVar7 = (undefined4 *)*puVar7) {
          puVar7[0xb] = *(undefined4 *)(iVar3 + 0xb3c);
          puVar7[0xc] = 2;
          *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
        }
      }
    }
    local_1a8 = 1;
    local_1c8 = (undefined *)0x0;
    FUN_00022510(&local_1c8);
    local_1a8 = 0;
    local_1c8 = &DAT_0052cc18;
    local_1bc = 0;
    local_1c0 = &FUN_00069964_1;
    local_30 = 1;
    local_50[0] = 0;
    local_1c4 = param_1;
    (*(code *)PTR_FUN_0052cc20)(&local_1c8,local_50);
    local_2c = 0;
    local_28 = 0;
    p_Var4 = (_List_node_base *)FUN_0002256c(puVar8,local_50);
    std::_List_node_base::hook(p_Var4);
    FUN_00022510(local_50);
    if (*(int *)(iVar3 + 0xb3c) != 0) {
      iVar6 = *(int *)(iVar3 + 0xb38);
      *(int *)(iVar6 + 0x2c) = *(int *)(iVar3 + 0xb3c);
      *(undefined4 *)(iVar6 + 0x30) = 1;
      *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
    }
    FUN_00022510(&local_1c8);
    local_50[0] = local_50[0] & 0xffffff00;
    FUN_0001da28(*(undefined4 *)(iVar3 + 0x264),local_50);
  }
  uVar2 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_1f0,"@map");
  iVar3 = FUN_0039725c(uVar2,auStack_1f0);
  FUN_0030f7e0(auStack_1f0);
  if (iVar3 != 0) {
    iVar6 = 1;
    do {
      iVar9 = 1;
      do {
        _sprintf(&DAT_005f9590,"challenge_%d_%d.challenge",iVar6,iVar9);
        FUN_0030f7cc(auStack_218,&DAT_005f9590);
        iVar5 = FUN_0039725c(iVar3,auStack_218);
        FUN_0030f7e0(auStack_218);
        if (iVar5 != 0) {
          local_220 = 0x3e000000;
          local_21c = 0x3e000000;
          FUN_0006bc4c(*(undefined4 *)(iVar5 + 0x748),&local_220);
        }
        iVar9 = iVar9 + 1;
      } while (iVar9 != 5);
      iVar6 = iVar6 + 1;
    } while (iVar6 != 5);
  }
  uVar2 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_248,"bossChallengeContainer.spinner");
  iVar3 = FUN_0039725c(uVar2,auStack_248);
  FUN_0030f7e0(auStack_248);
  if (iVar3 != 0) {
    FUN_0030f7cc(auStack_270,"adventureNode_1");
    iVar3 = FUN_0039725c(iVar3,auStack_270);
    FUN_0030f7e0(auStack_270);
    if (iVar3 != 0) {
      local_278 = 0x3e000000;
      local_274 = 0x3e000000;
      FUN_0006bc4c(*(undefined4 *)(iVar3 + 0x748),&local_278);
      puVar8 = (undefined4 *)(iVar3 + 0xb34);
      if (*(int *)(iVar3 + 0xb3c) == 0) {
        FUN_00022608(puVar8);
        *puVar8 = puVar8;
        *(undefined4 **)(iVar3 + 0xb38) = puVar8;
      }
      else {
        puVar7 = (undefined4 *)*puVar8;
        if (puVar7 != puVar8) {
          puVar7[0xb] = *(int *)(iVar3 + 0xb3c);
          puVar7[0xc] = 2;
          *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
          for (puVar7 = (undefined4 *)*puVar7; puVar7 != puVar8; puVar7 = (undefined4 *)*puVar7) {
            puVar7[0xb] = *(undefined4 *)(iVar3 + 0xb3c);
            puVar7[0xc] = 2;
            *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
          }
        }
      }
      local_27c = 1;
      local_29c = (undefined *)0x0;
      FUN_00022510(&local_29c);
      local_27c = 0;
      local_29c = &DAT_0052cc18;
      local_290 = 0;
      local_294 = &FUN_00069778_1;
      local_30 = 1;
      local_50[0] = 0;
      local_298 = param_1;
      (*(code *)PTR_FUN_0052cc20)(&local_29c,local_50);
      local_2c = 0;
      local_28 = 0;
      p_Var4 = (_List_node_base *)FUN_0002256c(puVar8,local_50);
      std::_List_node_base::hook(p_Var4);
      FUN_00022510(local_50);
      if (*(int *)(iVar3 + 0xb3c) != 0) {
        iVar6 = *(int *)(iVar3 + 0xb38);
        *(int *)(iVar6 + 0x2c) = *(int *)(iVar3 + 0xb3c);
        *(undefined4 *)(iVar6 + 0x30) = 1;
        *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
      }
      FUN_00022510(&local_29c);
    }
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 == local_24) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

## FUN_00069a3c — 00069a3c

- 函数名: FUN_00069a3c
- 函数体: 895 字节
- 调用者数: 2 / 被调用者数: 10

```c

void FUN_00069a3c(int param_1)

{
  undefined *puVar1;
  int *piVar2;
  int iVar3;
  int iVar4;
  int *piVar5;
  uint uVar6;
  undefined4 uVar7;
  code *pcVar8;
  int iVar9;
  undefined1 auStack_280 [40];
  undefined1 auStack_258 [40];
  undefined1 auStack_230 [40];
  undefined1 auStack_208 [40];
  undefined1 auStack_1e0 [40];
  undefined1 auStack_1b8 [40];
  undefined1 auStack_190 [40];
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
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  local_28[0] = 1;
  FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 4) + 0x260),local_28);
  FUN_00396d98(*(undefined4 *)(param_1 + 4),1);
  uVar7 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_50,"progressUIContainer");
  piVar2 = (int *)FUN_0039725c(uVar7,auStack_50);
  FUN_0030f7e0(auStack_50);
  local_28[0] = 1;
  FUN_0001da28(piVar2[0x98],local_28);
  uVar7 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_78,"challengeContainer");
  iVar3 = FUN_0039725c(uVar7,auStack_78);
  FUN_0030f7e0(auStack_78);
  local_28[0] = 1;
  FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),local_28);
  FUN_00069a08(param_1);
  iVar3 = *(int *)(*(int *)(param_1 + 0xc) + 0x68);
  uVar6 = 0;
  if (*(char *)(param_1 + 0x24) == '\0') {
    uVar6 = *(int *)(iVar3 + 0xa4) + 1;
  }
  uVar7 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_a0,"challengeContainer.spinner");
  uVar7 = FUN_0039725c(uVar7,auStack_a0);
  FUN_0030f7e0(auStack_a0);
  if (0 < *(int *)(iVar3 + 0x7c)) {
    iVar9 = 0;
    do {
      iVar9 = iVar9 + 1;
      _sprintf(&DAT_005f9590,"adventureNode_%d",iVar9);
      FUN_0030f7cc(auStack_c8,&DAT_005f9590);
      iVar4 = FUN_0039725c(uVar7,auStack_c8);
      FUN_0030f7e0(auStack_c8);
      if (iVar4 != 0) {
        local_28[0] = 0;
        FUN_0001da28(*(undefined4 *)(iVar4 + 0x264),local_28);
      }
    } while (iVar9 < *(int *)(iVar3 + 0x7c));
  }
  if (*(char *)(param_1 + 0x18) != '\0') {
    pcVar8 = *(code **)(*piVar2 + 0x40);
    FUN_0030f7cc(auStack_f0,"animate_reset");
    (*pcVar8)(piVar2,auStack_f0,1);
    FUN_0030f7e0(auStack_f0);
    _sprintf(&DAT_005f9590,"map.act%d",uVar6);
    FUN_0030f7cc(auStack_118,&DAT_005f9590);
    piVar5 = (int *)FUN_0039725c(piVar2,auStack_118);
    FUN_0030f7e0(auStack_118);
    if (piVar5 != (int *)0x0) {
      pcVar8 = *(code **)(*piVar5 + 0x40);
      FUN_0030f7cc(auStack_140,"animate_disappear");
      (*pcVar8)(piVar5,auStack_140,1);
      FUN_0030f7e0(auStack_140);
    }
    _sprintf(&DAT_005f9590,"map.act%d",uVar6 + 1);
    FUN_0030f7cc(auStack_168,&DAT_005f9590);
    piVar2 = (int *)FUN_0039725c(piVar2,auStack_168);
    FUN_0030f7e0(auStack_168);
    if (piVar2 != (int *)0x0) {
      pcVar8 = *(code **)(*piVar2 + 0x40);
      FUN_0030f7cc(auStack_190,"animate_appear");
      (*pcVar8)(piVar2,auStack_190,1);
      FUN_0030f7e0(auStack_190);
    }
    uVar7 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_1b8,"@actContainer.actLabel");
    iVar3 = FUN_0039725c(uVar7,auStack_1b8);
    FUN_0030f7e0(auStack_1b8);
    if (iVar3 != 0) {
      if (uVar6 < 3) {
        *(uint *)(iVar3 + 0x880) = uVar6 + 1;
        FUN_003d0bf4(iVar3);
      }
      else {
        FUN_0030f7cc(auStack_1e0,"FN_PUSS_FINALE");
        FUN_00022950(*(undefined4 *)(iVar3 + 0x7dc),auStack_1e0);
        FUN_0030f7e0(auStack_1e0);
      }
    }
  }
  if (*(char *)(param_1 + 0x24) == '\0') {
    piVar2 = *(int **)(param_1 + 4);
    pcVar8 = *(code **)(*piVar2 + 0x40);
    if (*(char *)(param_1 + 0x18) != '\0') {
      FUN_0030f7cc(auStack_230,"act_change");
      (*pcVar8)(piVar2,auStack_230,1);
      FUN_0030f7e0(auStack_230);
      *(undefined4 *)(param_1 + 0x14) = 1;
      goto LAB_00069d90;
    }
    FUN_0030f7cc(auStack_258,"animate_in");
    (*pcVar8)(piVar2,auStack_258,1);
    FUN_0030f7e0(auStack_258);
    piVar2 = *(int **)(param_1 + 4);
    pcVar8 = *(code **)(*piVar2 + 0x40);
    FUN_0030f7cc(auStack_280,"map_in");
    (*pcVar8)(piVar2,auStack_280,1);
    FUN_0030f7e0(auStack_280);
    uVar7 = 2;
  }
  else {
    piVar2 = *(int **)(param_1 + 4);
    pcVar8 = *(code **)(*piVar2 + 0x40);
    FUN_0030f7cc(auStack_208,"start_game");
    (*pcVar8)(piVar2,auStack_208,1);
    FUN_0030f7e0(auStack_208);
    uVar7 = 0;
  }
  *(undefined4 *)(param_1 + 0x14) = uVar7;
LAB_00069d90:
  puVar1 = PTR____stack_chk_guard_004d9044;
  *(undefined1 *)(param_1 + 0x24) = 0;
  *(undefined4 *)(param_1 + 0x20) = 0;
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00069ef0 — 00069ef0

- 函数名: FUN_00069ef0
- 函数体: 2553 字节
- 调用者数: 0 / 被调用者数: 23

```c

void FUN_00069ef0(int param_1)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int *piVar5;
  int *piVar6;
  uint uVar7;
  undefined4 uVar8;
  undefined1 *puVar9;
  undefined4 uVar10;
  int iVar11;
  code *pcVar12;
  undefined4 uVar13;
  float fVar14;
  undefined8 in_d0;
  undefined8 uVar15;
  undefined8 in_d1;
  undefined8 uVar16;
  float fVar17;
  undefined8 unaff_d8;
  int local_550;
  undefined1 auStack_544 [40];
  undefined1 auStack_51c [40];
  undefined1 auStack_4f4 [40];
  undefined4 uStack_4cc;
  undefined4 local_4c8;
  undefined1 auStack_4c4 [40];
  undefined1 auStack_49c [40];
  undefined1 auStack_474 [40];
  undefined1 auStack_44c [40];
  undefined1 auStack_424 [40];
  undefined4 local_3fc;
  undefined4 local_3f8;
  undefined1 auStack_3f4 [40];
  undefined1 auStack_3cc [40];
  undefined1 auStack_3a4 [40];
  undefined4 local_37c;
  undefined4 local_378;
  undefined **local_374;
  undefined *local_370;
  undefined1 local_354;
  undefined1 auStack_350 [40];
  undefined1 auStack_328 [40];
  undefined1 auStack_300 [40];
  undefined1 auStack_2d8 [40];
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
  undefined **ppuStack_f8;
  undefined *puStack_f4;
  undefined1 uStack_d8;
  undefined1 auStack_d4 [40];
  undefined1 auStack_ac [40];
  undefined1 auStack_84 [40];
  undefined1 auStack_5c [40];
  undefined1 auStack_34 [12];
  
  uVar15 = CONCAT44((int)((ulonglong)in_d0 >> 0x20),DAT_0006a2b8);
  iVar1 = *(int *)PTR____stack_chk_guard_004d9044;
  uVar16 = FloatVectorAdd(CONCAT44((int)((ulonglong)in_d1 >> 0x20),*(undefined4 *)(param_1 + 0x1c)),
                          uVar15,2);
  *(int *)(param_1 + 0x1c) = (int)uVar16;
  fVar17 = *(float *)(param_1 + 0x20);
  uVar15 = FloatVectorAdd(CONCAT44((int)((ulonglong)unaff_d8 >> 0x20),fVar17),uVar15,2);
  *(int *)(param_1 + 0x20) = (int)uVar15;
  uVar8 = *(undefined4 *)(param_1 + 4);
  iVar2 = *(int *)(*(int *)(param_1 + 0xc) + 0x68);
  FUN_0030f7cc((int)uVar15,auStack_5c,"progressUIContainer");
  uVar8 = FUN_0039725c(uVar8,auStack_5c);
  FUN_0030f7e0(auStack_5c);
  FUN_0030f7cc(auStack_84,"map");
  iVar3 = FUN_0039725c(uVar8,auStack_84);
  FUN_0030f7e0(auStack_84);
  switch(*(undefined4 *)(param_1 + 0x14)) {
  case 0:
    uVar8 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_ac,"start_game");
    iVar2 = FUN_0039834c(uVar8,auStack_ac,1);
    FUN_0030f7e0(auStack_ac);
    if (iVar2 != 0) break;
    puVar9 = auStack_d4;
    *(undefined4 *)(param_1 + 0x20) = 0;
    *(undefined4 *)(param_1 + 0x14) = 2;
    piVar5 = *(int **)(param_1 + 4);
    pcVar12 = *(code **)(*piVar5 + 0x40);
    goto LAB_0006a1d4;
  case 1:
    fVar14 = *(float *)(param_1 + 0x20);
    if ((DAT_0006a2bc < fVar14) && ((int)((uint)(fVar17 < DAT_0006a2bc) << 0x1f) < 0)) {
      FUN_0006a90c(param_1);
      fVar14 = *(float *)(param_1 + 0x20);
    }
    if ((((1.5 < fVar14) && ((int)((uint)(fVar17 < 1.5) << 0x1f) < 0)) &&
        (iVar2 = FUN_0001d10c(PTR_DAT_004d9048), *(char *)(iVar2 + 0x8c) != '\0')) &&
       (iVar2 = FUN_0001d10c(PTR_DAT_004d9048), *(int *)(*(int *)(iVar2 + 0x68) + 0x98) == 0)) {
      FUN_0030a1d8();
      FUN_0030a7e4();
      uVar8 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
      uStack_d8 = 1;
      ppuStack_f8 = (undefined **)0x0;
      FUN_0000a298(&ppuStack_f8);
      uStack_d8 = 0;
      ppuStack_f8 = &PTR_LAB_0052bf38;
      puStack_f4 = PTR_FUN_004d9058;
      FUN_0002bb34(uVar8,"act-change",0x3f800000,0x3f800000,&ppuStack_f8,0);
      FUN_0000a298(&ppuStack_f8);
    }
    uVar8 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_120,"act_change");
    iVar2 = FUN_0039834c(uVar8,auStack_120,1);
    FUN_0030f7e0(auStack_120);
    if (iVar2 != 0) break;
    *(undefined4 *)(param_1 + 0x20) = 0;
    *(undefined4 *)(param_1 + 0x14) = 2;
    FUN_0006ac30(param_1);
    FUN_00069ddc(param_1);
    iVar2 = FUN_0001d10c(PTR_DAT_004d9048);
    *(undefined1 *)(iVar2 + 0x8c) = 0;
    uVar8 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_148,"challengeContainer");
    iVar2 = FUN_0039725c(uVar8,auStack_148);
    FUN_0030f7e0(auStack_148);
    if (iVar2 != 0) {
      auStack_34[0] = *(int *)(*(int *)(*(int *)(param_1 + 0xc) + 0x68) + 0x98) == 0;
      FUN_0001da28(*(undefined4 *)(iVar2 + 0x260),auStack_34);
    }
    uVar8 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_170,"bossChallengeContainer");
    iVar2 = FUN_0039725c(uVar8,auStack_170);
    FUN_0030f7e0(auStack_170);
    if (iVar2 != 0) {
      auStack_34[0] = *(int *)(*(int *)(*(int *)(param_1 + 0xc) + 0x68) + 0x98) != 0;
      FUN_0001da28(*(undefined4 *)(iVar2 + 0x260),auStack_34);
    }
    piVar5 = *(int **)(param_1 + 4);
    puVar9 = auStack_198;
    pcVar12 = *(code **)(*piVar5 + 0x40);
LAB_0006a1d4:
    FUN_0030f7cc(puVar9,"animate_in");
    (*pcVar12)(piVar5,puVar9,1);
    FUN_0030f7e0(puVar9);
    FUN_00022070();
    break;
  case 2:
    uVar8 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_1c0,"animate_in");
    iVar2 = FUN_0039834c(uVar8,auStack_1c0,1);
    if (iVar2 != 1) {
      uVar8 = *(undefined4 *)(param_1 + 4);
      FUN_0030f7cc(auStack_1e8,"start_game");
      iVar2 = FUN_0039834c(uVar8,auStack_1e8,1);
      if (iVar2 == 0) {
        uVar8 = *(undefined4 *)(param_1 + 4);
        FUN_0030f7cc(auStack_210,"act_change");
        iVar2 = FUN_0039834c(uVar8,auStack_210,1);
        FUN_0030f7e0(auStack_210);
        FUN_0030f7e0(auStack_1e8);
        FUN_0030f7e0(auStack_1c0);
        if (iVar2 == 0) {
          FUN_0006ad24(param_1);
        }
        break;
      }
      FUN_0030f7e0(auStack_1e8);
    }
    FUN_0030f7e0(auStack_1c0);
    break;
  case 3:
    FUN_0030f7cc(auStack_238,"pussMap");
    iVar3 = FUN_0039725c(iVar3,auStack_238);
    FUN_0030f7e0(auStack_238);
    if (iVar3 != 0) {
      _sprintf(&DAT_005f9590,"animate_trigger_%d",*(undefined4 *)(iVar2 + 0x84));
      FUN_0030f7cc(auStack_260,&DAT_005f9590);
      iVar2 = FUN_0039834c(iVar3,auStack_260,1);
      FUN_0030f7e0(auStack_260);
      if (iVar2 == 0) {
        FUN_0006ae4c(param_1);
      }
    }
    break;
  case 4:
    uVar8 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_288,"progressUIContainer");
    uVar8 = FUN_0039725c(uVar8,auStack_288);
    FUN_0030f7e0(auStack_288);
    uVar10 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_2b0,"challengeContainer.spinner");
    uVar10 = FUN_0039725c(uVar10,auStack_2b0);
    FUN_0030f7e0(auStack_2b0);
    if (iVar3 != 0) {
      _sprintf(&DAT_005f9590,"adventureNode_%d",1);
      FUN_0030f7cc(auStack_2d8,&DAT_005f9590);
      piVar5 = (int *)FUN_0039725c(uVar10,auStack_2d8);
      FUN_0030f7e0(auStack_2d8);
      if (piVar5 != (int *)0x0) {
        local_550 = 2;
        do {
          FUN_0030f7cc(auStack_300,"animate_reset_in");
          iVar3 = FUN_0039834c(piVar5,auStack_300,0);
          if (iVar3 == 1) {
LAB_0006a4d6:
            FUN_0030f7e0(auStack_300);
          }
          else {
            FUN_0030f7cc(auStack_328,"animate_delay");
            iVar3 = FUN_0039834c(piVar5,auStack_328,0);
            if (iVar3 != 0) {
              FUN_0030f7e0(auStack_328);
              goto LAB_0006a4d6;
            }
            FUN_0030f7cc(auStack_350,"animate_stop");
            iVar3 = FUN_0039834c(piVar5,auStack_350,0);
            FUN_0030f7e0(auStack_350);
            FUN_0030f7e0(auStack_328);
            FUN_0030f7e0(auStack_300);
            if (iVar3 == 0) {
              if ((*(int *)(param_1 + 8) == 0) &&
                 ((int)((uint)(*(float *)(param_1 + 0x1c) < DAT_0006a2c0) << 0x1f) < 0)) {
                uVar13 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
                local_354 = 1;
                local_374 = (undefined **)0x0;
                FUN_0000a298(&local_374);
                local_354 = 0;
                local_374 = &PTR_LAB_0052bf38;
                local_370 = PTR_FUN_004d9058;
                uVar13 = FUN_0002bb34(uVar13,"slot_spin_lp",0x3f800000,0x3f800000,&local_374,0);
                *(undefined4 *)(param_1 + 8) = uVar13;
                FUN_0000a298(&local_374);
              }
              uVar7 = FUN_00060da0();
              uVar15 = FixedToFP(CONCAT44(uVar7 >> 3,uVar7 >> 3),0,1,0,0x20);
              uVar16 = FixedToFP(CONCAT44(uVar7,uVar7) & 0x700000007,0,1,0,0x20);
              uVar15 = FloatVectorMult(uVar15,0x3e0000003e000000,2,0x20);
              uVar16 = FloatVectorMult(uVar16,0x3e0000003e000000,2,0x20);
              local_37c = (undefined4)uVar16;
              local_378 = (undefined4)uVar15;
              FUN_0006bc4c(local_378,piVar5[0x1d1],&local_37c);
              pcVar12 = *(code **)(*piVar5 + 0x40);
              FUN_0030f7cc(auStack_3a4,"animate_delay");
              (*pcVar12)(piVar5,auStack_3a4,1);
              FUN_0030f7e0(auStack_3a4);
            }
          }
          _sprintf(&DAT_005f9590,"adventureNode_%d",local_550);
          FUN_0030f7cc(auStack_2d8,&DAT_005f9590);
          piVar5 = (int *)FUN_0039725c(uVar10,auStack_2d8);
          FUN_0030f7e0(auStack_2d8);
          local_550 = local_550 + 1;
        } while (piVar5 != (int *)0x0);
      }
    }
    if (*(float *)(param_1 + 0x1c) <= DAT_0006a2c0) break;
    if (*(int *)(param_1 + 8) != 0) {
      FUN_00309aac(*(int *)(param_1 + 8),0x3dcccccd);
      FUN_0002be70(*(undefined4 *)(PTR_DAT_004d9048 + 0x1a4),*(undefined4 *)(param_1 + 8),
                   "slot_spin_lp");
      *(undefined4 *)(param_1 + 8) = 0;
    }
    if (0 < *(int *)(iVar2 + 0x7c)) {
      iVar3 = 0;
      do {
        iVar11 = iVar3 + 1;
        _sprintf(&DAT_005f9590,"adventureNode_%d",iVar11);
        FUN_0030f7cc(auStack_3cc,&DAT_005f9590);
        iVar4 = FUN_0039725c(uVar10,auStack_3cc);
        FUN_0030f7e0(auStack_3cc);
        _sprintf(&DAT_005f9590,"map.challenge_%d_%d.challenge",*(int *)(iVar2 + 0xa4) + 1,iVar11);
        FUN_0030f7cc(auStack_3f4,&DAT_005f9590);
        piVar5 = (int *)FUN_0039725c(uVar8,auStack_3f4);
        FUN_0030f7e0(auStack_3f4);
        if (iVar4 != 0) {
          piVar6 = (int *)FUN_0006ed58(iVar2,iVar3);
          uVar7 = 0;
          if (*(int *)(*piVar6 + 0x100) != 0) {
            uVar7 = *(uint *)(*(int *)(*piVar6 + 0x100) + 0x44);
          }
          uVar15 = FixedToFP(CONCAT44(uVar7 >> 3,uVar7 >> 3),0,1,0,0x20);
          uVar16 = FixedToFP(CONCAT44(uVar7,uVar7) & 0x700000007,0,1,0,0x20);
          uVar15 = FloatVectorMult(uVar15,0x3e0000003e000000,2,0x20);
          uVar16 = FloatVectorMult(uVar16,0x3e0000003e000000,2,0x20);
          local_3fc = (undefined4)uVar16;
          local_3f8 = (undefined4)uVar15;
          FUN_0006bc4c(local_3f8,*(undefined4 *)(iVar4 + 0x744),&local_3fc);
          auStack_34[0] = 1;
          FUN_0001da28(*(undefined4 *)(iVar4 + 0x264),auStack_34);
          if (piVar5 != (int *)0x0) {
            FUN_0006bc4c(piVar5[0x1d1],&local_3fc);
            pcVar12 = *(code **)(*piVar5 + 0x40);
            FUN_0030f7cc(auStack_424,"animate_appear");
            (*pcVar12)(piVar5,auStack_424,0);
            FUN_0030f7e0(auStack_424);
          }
        }
        iVar3 = iVar11;
      } while (iVar11 < *(int *)(iVar2 + 0x7c));
    }
    goto LAB_0006a82e;
  case 5:
    uVar8 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_44c,"progressUIContainer");
    uVar8 = FUN_0039725c(uVar8,auStack_44c);
    FUN_0030f7e0(auStack_44c);
    uVar10 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_474,"bossChallengeContainer.spinner");
    uVar10 = FUN_0039725c(uVar10,auStack_474);
    FUN_0030f7e0(auStack_474);
    if (*(float *)(param_1 + 0x1c) <= DAT_0006a908) break;
    if (*(int *)(param_1 + 8) != 0) {
      FUN_00309aac(*(int *)(param_1 + 8),0x3dcccccd);
      *(undefined4 *)(param_1 + 8) = 0;
    }
    if (0 < *(int *)(iVar2 + 0x7c)) {
      iVar3 = 0;
      do {
        iVar11 = iVar3 + 1;
        _sprintf(&DAT_005f9590,"adventureNode_%d",iVar11);
        FUN_0030f7cc(auStack_49c,&DAT_005f9590);
        iVar4 = FUN_0039725c(uVar10,auStack_49c);
        FUN_0030f7e0(auStack_49c);
        _sprintf(&DAT_005f9590,"map.challenge_%d_%d.challenge",*(int *)(iVar2 + 0xa4) + 1,iVar11);
        FUN_0030f7cc(auStack_4c4,&DAT_005f9590);
        piVar5 = (int *)FUN_0039725c(uVar8,auStack_4c4);
        FUN_0030f7e0(auStack_4c4);
        if (iVar4 != 0) {
          piVar6 = (int *)FUN_0006ed58(iVar2,iVar3);
          uVar7 = 0;
          if (*(int *)(*piVar6 + 0x100) != 0) {
            uVar7 = *(uint *)(*(int *)(*piVar6 + 0x100) + 0x44);
          }
          uVar15 = FixedToFP(CONCAT44(uVar7 >> 3,uVar7 >> 3),0,1,0,0x20);
          uVar16 = FixedToFP(CONCAT44(uVar7,uVar7) & 0x700000007,0,1,0,0x20);
          uVar15 = FloatVectorMult(uVar15,0x3e0000003e000000,2,0x20);
          uVar16 = FloatVectorMult(uVar16,0x3e0000003e000000,2,0x20);
          uStack_4cc = (undefined4)uVar16;
          local_4c8 = (undefined4)uVar15;
          FUN_0006bc4c(local_4c8,*(undefined4 *)(iVar4 + 0x744),&uStack_4cc);
          if (piVar5 != (int *)0x0) {
            FUN_0006bc4c(piVar5[0x1d1],&uStack_4cc);
            pcVar12 = *(code **)(*piVar5 + 0x40);
            FUN_0030f7cc(auStack_4f4,"animate_appear");
            (*pcVar12)(piVar5,auStack_4f4,0);
            FUN_0030f7e0(auStack_4f4);
          }
        }
        iVar3 = iVar11;
      } while (iVar11 < *(int *)(iVar2 + 0x7c));
    }
LAB_0006a82e:
    *(undefined4 *)(param_1 + 0x1c) = 0;
    *(undefined4 *)(param_1 + 0x20) = 0;
    *(undefined4 *)(param_1 + 0x14) = 7;
    break;
  case 8:
    uVar8 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_51c,"progressUIContainer");
    uVar8 = FUN_0039725c(uVar8,auStack_51c);
    FUN_0030f7e0(auStack_51c);
    FUN_0030f7cc(auStack_544,"animate_out");
    iVar3 = FUN_0039834c(uVar8,auStack_544,1);
    if (iVar3 == 1) {
      iVar2 = *(int *)(iVar2 + 0x98);
      FUN_0030f7e0(auStack_544);
      if (iVar2 == 0) break;
    }
    else {
      FUN_0030f7e0(auStack_544);
    }
    *(undefined4 *)(param_1 + 0x14) = 9;
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 != iVar1) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_000688c8 — 000688c8

- 函数名: FUN_000688c8
- 函数体: 135 字节
- 调用者数: 1 / 被调用者数: 5

```c

void FUN_000688c8(int param_1,int param_2)

{
  undefined *puVar1;
  undefined4 uVar2;
  int *piVar3;
  code *pcVar4;
  undefined1 auStack_4c [40];
  int local_24;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_00396d98(*(undefined4 *)(param_1 + 0xa8),1);
  piVar3 = *(int **)(param_1 + 0xa8);
  pcVar4 = *(code **)(*piVar3 + 0x40);
  FUN_0030f7cc(auStack_4c,"animate_out");
  (*pcVar4)(piVar3,auStack_4c,1);
  FUN_0030f7e0(auStack_4c);
  *(undefined4 *)(param_1 + 0xb8) = 0;
  if (param_2 == 1) {
    FUN_00069dbc(param_1);
  }
  uVar2 = *(undefined4 *)(param_1 + 0xac);
  *(undefined4 *)(param_1 + 0xac) = 6;
  *(undefined4 *)(param_1 + 0xb0) = uVar2;
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00068018 — 00068018

- 函数名: FUN_00068018
- 函数体: 213 字节
- 调用者数: 1 / 被调用者数: 11

```c

void FUN_00068018(int param_1)

{
  undefined *puVar1;
  int iVar2;
  int *piVar3;
  undefined4 uVar4;
  code *pcVar5;
  undefined1 auStack_74 [40];
  undefined1 auStack_4c [40];
  undefined1 local_24 [4];
  int local_20;
  
  local_20 = *(int *)PTR____stack_chk_guard_004d9044;
  local_24[0] = 0;
  FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 0xa8) + 0x260),local_24);
  *(undefined4 *)(param_1 + 0xb8) = 0;
  FUN_00069dbc(param_1);
  FUN_0006c0e0(param_1 + 0x28);
  FUN_0006d51c(param_1 + 0x40);
  FUN_0007497c(param_1 + 0x74);
  iVar2 = FUN_0001d10c(PTR_DAT_004d9048);
  uVar4 = *(undefined4 *)(iVar2 + 4);
  FUN_0030f7cc(auStack_4c,"pause");
  piVar3 = (int *)FUN_0039725c(uVar4,auStack_4c);
  FUN_0030f7e0(auStack_4c);
  if (piVar3 != (int *)0x0) {
    pcVar5 = *(code **)(*piVar3 + 0x40);
    FUN_0030f7cc(auStack_74,"animate_out_end");
    (*pcVar5)(piVar3,auStack_74,1);
    FUN_0030f7e0(auStack_74);
  }
  FUN_00076654(param_1 + 0x9c);
  puVar1 = PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0xac) = 5;
  if (*(int *)puVar1 != local_20) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_000680f0 — 000680f0

- 函数名: FUN_000680f0
- 函数体: 245 字节
- 调用者数: 2 / 被调用者数: 11

```c

void FUN_000680f0(int param_1)

{
  undefined *puVar1;
  undefined4 uVar2;
  int *piVar3;
  code *pcVar4;
  undefined1 auStack_a0 [40];
  undefined1 auStack_78 [40];
  undefined1 auStack_50 [40];
  undefined1 local_28 [4];
  int local_24;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  local_28[0] = 1;
  FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 0xa8) + 0x260),local_28);
  piVar3 = *(int **)(param_1 + 0xa8);
  pcVar4 = *(code **)(*piVar3 + 0x40);
  FUN_0030f7cc(auStack_50,"animate_in");
  (*pcVar4)(piVar3,auStack_50,1);
  FUN_0030f7e0(auStack_50);
  *(undefined4 *)(param_1 + 0xb8) = 0;
  FUN_000681e8(param_1,0);
  uVar2 = FUN_003ecb20();
  FUN_0030f7cc(auStack_78,"inGameChallengeHud");
  piVar3 = (int *)FUN_003f06d0(uVar2,auStack_78);
  FUN_0030f7e0(auStack_78);
  if (piVar3 != (int *)0x0) {
    pcVar4 = *(code **)(*piVar3 + 0x40);
    FUN_0030f7cc(auStack_a0,"animate_out");
    (*pcVar4)(piVar3,auStack_a0,1);
    FUN_0030f7e0(auStack_a0);
  }
  FUN_00069dbc(param_1);
  FUN_0006c100(param_1 + 0x28);
  FUN_0006d51c(param_1 + 0x40);
  FUN_0007497c(param_1 + 0x74);
  puVar1 = PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0xac) = 1;
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_000681e8 — 000681e8

- 函数名: FUN_000681e8
- 函数体: 887 字节
- 调用者数: 2 / 被调用者数: 15

```c

void FUN_000681e8(int param_1,int param_2)

{
  int iVar1;
  int iVar2;
  int *piVar3;
  _List_node_base *p_Var4;
  int *piVar5;
  int iVar6;
  char *pcVar7;
  undefined4 uVar8;
  undefined1 *puVar9;
  int *piVar10;
  code *pcVar11;
  int iVar12;
  undefined1 auStack_2b0 [40];
  undefined1 auStack_288 [40];
  undefined1 auStack_260 [40];
  undefined *local_238;
  int local_234;
  undefined1 *local_230;
  undefined4 uStack_22c;
  undefined1 local_218;
  undefined1 auStack_214 [40];
  undefined **local_1ec;
  undefined *local_1e8;
  undefined1 local_1cc;
  undefined1 auStack_1c8 [40];
  undefined1 auStack_1a0 [40];
  undefined1 auStack_178 [40];
  undefined4 local_150 [8];
  undefined1 local_130;
  undefined4 local_12c;
  undefined4 local_128;
  char acStack_124 [128];
  char acStack_a4 [128];
  int local_24;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  if (param_2 == 0) {
    iVar12 = 1;
    do {
      _sprintf(acStack_124,"@misscounters.cross%d",iVar12);
      uVar8 = *(undefined4 *)(param_1 + 0xa8);
      FUN_0030f7cc(auStack_1a0,acStack_124);
      piVar3 = (int *)FUN_0039725c(uVar8,auStack_1a0);
      FUN_0030f7e0(auStack_1a0);
      if (piVar3 != (int *)0x0) {
        iVar1 = FUN_0001d10c(PTR_DAT_004d9048);
        if (*(int *)(iVar1 + 0x4c) < iVar12) {
          piVar10 = piVar3 + 0xf3;
          if (piVar3[0xf5] == 0) {
            FUN_0003ca68(piVar10);
            *piVar10 = (int)piVar10;
            piVar3[0xf4] = (int)piVar10;
          }
          else {
            piVar5 = (int *)*piVar10;
            if (piVar5 != piVar10) {
              piVar5[0xb] = piVar3[0xf5];
              piVar5[0xc] = 2;
              piVar3[0xf6] = piVar3[0xf6] + 1;
              for (piVar5 = (int *)*piVar5; piVar5 != piVar10; piVar5 = (int *)*piVar5) {
                piVar5[0xb] = piVar3[0xf5];
                piVar5[0xc] = 2;
                piVar3[0xf6] = piVar3[0xf6] + 1;
              }
            }
          }
          iVar1 = piVar3[0x98];
          if (piVar3[0x13] == 0) {
LAB_00068500:
            local_150[0] = CONCAT31(local_150[0]._1_3_,1);
            FUN_0001da28(iVar1,local_150);
            puVar9 = auStack_260;
            pcVar11 = *(code **)(*piVar3 + 0x40);
            pcVar7 = "get_life";
          }
          else {
            iVar6 = *(int *)(iVar1 + 0x38);
            iVar2 = iVar1;
            while (iVar6 != 0) {
              iVar2 = *(int *)(iVar6 + 4);
              iVar6 = *(int *)(iVar2 + 0x38);
            }
            if (*(char *)(iVar2 + 0x48) == '\0') goto LAB_00068500;
            FUN_0030f7cc(auStack_288,"animate_idle");
            iVar1 = FUN_0039834c(piVar3,auStack_288,0);
            FUN_0030f7e0(auStack_288);
            if (iVar1 != 0) goto LAB_00068532;
            puVar9 = auStack_2b0;
            pcVar11 = *(code **)(*piVar3 + 0x40);
            pcVar7 = "animate_idle";
          }
          FUN_0030f7cc(puVar9,pcVar7);
          (*pcVar11)(piVar3,puVar9,1);
          FUN_0030f7e0(puVar9);
        }
        else if (piVar3[0x13] != 0) {
          for (iVar1 = piVar3[0x98]; *(int *)(iVar1 + 0x38) != 0;
              iVar1 = *(int *)(*(int *)(iVar1 + 0x38) + 4)) {
          }
          if (*(char *)(iVar1 + 0x48) != '\0') {
            FUN_0030f7cc(auStack_1c8,"animate_trigger");
            iVar1 = FUN_0039834c(piVar3,auStack_1c8,0);
            FUN_0030f7e0(auStack_1c8);
            if (iVar1 == 0) {
              iVar1 = *(int *)(PTR_DAT_004d9048 + 0x1a4);
              if (iVar1 != 0) {
                local_1cc = 1;
                local_1ec = (undefined **)0x0;
                FUN_0000a298(&local_1ec);
                local_1cc = 0;
                local_1ec = &PTR_LAB_0052bf38;
                local_1e8 = PTR_FUN_004d9058;
                FUN_0002bb34(iVar1,"gank",0x3f800000,0x3f800000,&local_1ec,0);
                FUN_0000a298(&local_1ec);
              }
              pcVar11 = *(code **)(*piVar3 + 0x40);
              FUN_0030f7cc(auStack_214,"animate_trigger");
              (*pcVar11)(piVar3,auStack_214,1);
              FUN_0030f7e0(auStack_214);
              local_218 = 1;
              local_238 = (undefined *)0x0;
              FUN_0003c910(&local_238);
              local_218 = 0;
              local_238 = &DAT_0052cbd8;
              local_230 = &FUN_00068c4c_1;
              uStack_22c = 0;
              local_130 = 1;
              local_150[0] = 0;
              local_234 = param_1;
              (*(code *)PTR_FUN_0052cbe0)(&local_238,local_150);
              local_12c = 0;
              local_128 = 0;
              p_Var4 = (_List_node_base *)FUN_0003c96c(piVar3 + 0xf3,local_150);
              std::_List_node_base::hook(p_Var4);
              FUN_0003c910(local_150);
              if (piVar3[0xf5] != 0) {
                iVar1 = piVar3[0xf4];
                *(int *)(iVar1 + 0x2c) = piVar3[0xf5];
                *(undefined4 *)(iVar1 + 0x30) = 1;
                piVar3[0xf6] = piVar3[0xf6] + 1;
              }
              FUN_0003c910(&local_238);
            }
          }
        }
      }
LAB_00068532:
      iVar12 = iVar12 + 1;
    } while (iVar12 != 4);
  }
  else {
    iVar12 = 1;
    do {
      _sprintf(acStack_a4,"@misscounters.cross%d",iVar12);
      uVar8 = *(undefined4 *)(param_1 + 0xa8);
      FUN_0030f7cc(auStack_178,acStack_a4);
      iVar1 = FUN_0039725c(uVar8,auStack_178);
      FUN_0030f7e0(auStack_178);
      if (iVar1 != 0) {
        iVar2 = FUN_0001d10c(PTR_DAT_004d9048);
        local_150[0] = CONCAT31(local_150[0]._1_3_,*(int *)(iVar2 + 0x4c) < iVar12);
        FUN_0001da28(*(undefined4 *)(iVar1 + 0x260),local_150);
      }
      iVar12 = iVar12 + 1;
    } while (iVar12 != 4);
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 == local_24) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

## FUN_00068560 — 00068560

- 函数名: FUN_00068560
- 函数体: 183 字节
- 调用者数: 2 / 被调用者数: 8

```c

void FUN_00068560(int *param_1,undefined4 param_2)

{
  undefined *puVar1;
  undefined *puVar2;
  undefined4 uVar3;
  int iVar4;
  undefined4 uVar5;
  code *pcVar6;
  undefined1 auStack_48 [40];
  int local_20;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_20 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_0006c0e0(param_1 + 10);
  FUN_00069dbc(param_1);
  FUN_0006d53c(param_1 + 0x10,param_2);
  puVar2 = PTR_DAT_004d9048;
  uVar5 = *(undefined4 *)(PTR_DAT_004d9048 + 0x5c);
  uVar3 = FUN_002f69c4("NEW_MODE_complete",0x11);
  FUN_00027588(uVar5,"NEW_MODE_complete",uVar3,1,1,1);
  param_1[0x2b] = 3;
  iVar4 = *(int *)puVar2;
  if (iVar4 != 0) {
    param_1 = *(int **)(iVar4 + 4);
  }
  if (iVar4 != 0 && param_1 != (int *)0x0) {
    pcVar6 = *(code **)(*param_1 + 0x40);
    FUN_0030f7cc(auStack_48,"animate_out_pause");
    (*pcVar6)(param_1,auStack_48,1);
    FUN_0030f7e0(auStack_48);
  }
  if (*(int *)puVar1 != local_20) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00068618 — 00068618

- 函数名: FUN_00068618
- 函数体: 157 字节
- 调用者数: 1 / 被调用者数: 9

```c

void FUN_00068618(int *param_1)

{
  undefined *puVar1;
  int iVar2;
  code *pcVar3;
  undefined1 auStack_44 [40];
  int local_1c;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_1c = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_0030a1d8();
  FUN_0030a7e4();
  FUN_0006c0e0(param_1 + 10);
  FUN_00069dbc(param_1);
  FUN_0006d51c(param_1 + 0x10);
  FUN_0007499c(param_1 + 0x1d);
  param_1[0x2b] = 4;
  iVar2 = *(int *)PTR_DAT_004d9048;
  if (iVar2 != 0) {
    param_1 = *(int **)(iVar2 + 4);
  }
  if (iVar2 != 0 && param_1 != (int *)0x0) {
    pcVar3 = *(code **)(*param_1 + 0x40);
    FUN_0030f7cc(auStack_44,"animate_out_pause");
    (*pcVar3)(param_1,auStack_44,1);
    FUN_0030f7e0(auStack_44);
  }
  if (*(int *)puVar1 != local_1c) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00068950 — 00068950

- 函数名: FUN_00068950
- 函数体: 69 字节
- 调用者数: 1 / 被调用者数: 6

```c

void FUN_00068950(int param_1)

{
  undefined1 local_10 [4];
  
  local_10[0] = 0;
  FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 0xa8) + 0x260),local_10);
  FUN_0006c0e0(param_1 + 0x28);
  FUN_00069dbc(param_1);
  FUN_0006d51c(param_1 + 0x40);
  FUN_0007497c(param_1 + 0x74);
  FUN_0006e200(param_1 + 0x88);
  return;
}


```

