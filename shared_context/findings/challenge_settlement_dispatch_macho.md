# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_00067e60 — 00067e60

- 函数名: FUN_00067e60
- 函数体: 63 字节
- 调用者数: 1 / 被调用者数: 6

```c

int FUN_00067e60(int param_1)

{
  FUN_00069038();
  FUN_0006bd40(param_1 + 0x28);
  FUN_0006d318(param_1 + 0x40);
  FUN_00074780(param_1 + 0x74);
  FUN_0006e004(param_1 + 0x88);
  FUN_0007661c(param_1 + 0x9c);
  *(undefined1 *)(param_1 + 0xb4) = 0;
  *(undefined4 *)(param_1 + 0xb8) = 0;
  return param_1;
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

## FUN_00068218 — 000690f0

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

## FUN_000682b0 — 000690f0

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

## FUN_00068330 — 000690f0

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

## FUN_000683a0 — 000690f0

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

## FUN_00068418 — 000690f0

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

## FUN_000686b8 — 000686b8

- 函数名: FUN_000686b8
- 函数体: 45 字节
- 调用者数: 1 / 被调用者数: 3

```c

void FUN_000686b8(int param_1)

{
  undefined1 local_10 [4];
  
  local_10[0] = 0;
  FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 0xa8) + 0x260),local_10);
  FUN_0006c0e0(param_1 + 0x28);
  FUN_00069dbc(param_1);
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

