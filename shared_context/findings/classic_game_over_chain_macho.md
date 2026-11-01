# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_00070050 — 00070050

- 函数名: FUN_00070050
- 函数体: 855 字节
- 调用者数: 0 / 被调用者数: 19

```c

void FUN_00070050(int param_1,undefined4 param_2)

{
  undefined *puVar1;
  int *piVar2;
  int iVar3;
  void *pvVar4;
  undefined4 uVar5;
  code *pcVar6;
  undefined4 extraout_s1;
  undefined8 uVar7;
  undefined4 extraout_s1_00;
  float fVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  undefined1 auStack_1c8 [40];
  undefined1 auStack_1a0 [40];
  undefined1 auStack_178 [40];
  undefined1 auStack_150 [40];
  undefined1 auStack_128 [40];
  undefined1 auStack_100 [40];
  undefined1 auStack_d8 [40];
  undefined1 auStack_b0 [40];
  undefined1 auStack_88 [40];
  undefined1 auStack_60 [40];
  undefined1 local_38 [4];
  int local_34;
  
  local_34 = *(int *)PTR____stack_chk_guard_004d9044;
  if (*(int *)(param_1 + 4) == 0) goto switchD_000700de_default;
  FUN_00074418(param_1,param_2);
  uVar7 = FloatVectorAdd(CONCAT44(extraout_s1,*(undefined4 *)(param_1 + 0x48)),
                         CONCAT44(param_2,param_2),2);
  *(int *)(param_1 + 0x48) = (int)uVar7;
  if (*(int *)(param_1 + 0x3c) != 0) {
    FUN_000703b4();
    pvVar4 = *(void **)(param_1 + 0x3c);
    if ((0.5 <= *(float *)((int)pvVar4 + 0x24)) && (pvVar4 != (void *)0x0)) {
      FUN_00071d50(pvVar4);
      operator_delete(pvVar4);
      *(undefined4 *)(param_1 + 0x3c) = 0;
    }
  }
  FUN_0007048c(param_1);
  switch(*(undefined4 *)(param_1 + 0x44)) {
  case 0:
    uVar5 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_60,"gameStartContainer");
    iVar3 = FUN_0039725c(uVar5,auStack_60);
    FUN_0030f7e0(auStack_60);
    if (iVar3 != 0) {
      FUN_0030f7cc(auStack_88,"intro");
      iVar3 = FUN_0039834c(iVar3,auStack_88,1);
      FUN_0030f7e0(auStack_88);
      if (iVar3 == 0) {
        FUN_000705fc(param_1);
      }
    }
    break;
  case 1:
    iVar3 = *(int *)(param_1 + 4);
    if (iVar3 != 0) {
      FUN_0030f7cc(auStack_b0,"score.text");
      iVar3 = FUN_0039725c(iVar3,auStack_b0);
      FUN_0030f7e0(auStack_b0);
      fVar8 = *(float *)(iVar3 + 0x884);
      uVar5 = FUN_0001ca48();
      uVar7 = FixedToFP(CONCAT44(uVar5,uVar5),0,0,0,0x20);
      if ((float)uVar7 < fVar8) {
        uVar5 = *(undefined4 *)(param_1 + 4);
        FUN_0030f7cc(auStack_d8,"score.bestScoreText");
        piVar2 = (int *)FUN_0039725c(uVar5,auStack_d8);
        FUN_0030f7e0(auStack_d8);
        if (piVar2 != (int *)0x0) {
          uVar7 = FPToFixed(CONCAT44(extraout_s1_00,*(float *)(iVar3 + 0x884)),0,0,3,0x20);
          piVar2[0x220] = (int)uVar7;
          FUN_003d0bf4((int)uVar7,piVar2);
        }
        if (*(char *)(param_1 + 0x10) == '\0') {
          if (piVar2 != (int *)0x0) {
            pcVar6 = *(code **)(*piVar2 + 0x40);
            FUN_0030f7cc(auStack_100,"beaten");
            (*pcVar6)(piVar2,auStack_100,1);
            FUN_0030f7e0(auStack_100);
          }
          *(undefined1 *)(param_1 + 0x10) = 1;
        }
      }
    }
    if ((*(char *)(param_1 + 0x58) == '\0') && (DAT_000703b0 < *(float *)(PTR_DAT_004d9048 + 0x5d4))
       ) {
      uVar9 = *(undefined4 *)(PTR_DAT_004d9048 + 0x5c);
      uVar5 = FUN_002f69c4("survive_90secs",0xe);
      FUN_00027588(uVar9,"survive_90secs",uVar5,1,0,1);
      *(undefined1 *)(param_1 + 0x58) = 1;
    }
    if (2 < *(uint *)(param_1 + 0x14)) {
      FUN_000707cc(param_1);
    }
    break;
  case 2:
    uVar5 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_178,"gameOverContainer");
    piVar2 = (int *)FUN_0039725c(uVar5,auStack_178);
    FUN_0030f7e0(auStack_178);
    FUN_0030f7cc(auStack_1a0,"game_over");
    iVar3 = FUN_0039834c(piVar2,auStack_1a0,1);
    FUN_0030f7e0(auStack_1a0);
    if (iVar3 != 0) break;
    pcVar6 = *(code **)(*piVar2 + 0x40);
    FUN_0030f7cc(auStack_1c8,"game_over_real");
    (*pcVar6)(piVar2,auStack_1c8,1);
    FUN_0030f7e0(auStack_1c8);
    puVar1 = PTR_DAT_004d9048;
    uVar9 = *(undefined4 *)(PTR_DAT_004d9048 + 0xb0);
    uVar10 = *(undefined4 *)(PTR_DAT_004d9048 + 0xac);
    FUN_0001cfac(*(undefined4 *)(PTR_DAT_004d9048 + 0x654),"results",0,0);
    uVar5 = 3;
    *(undefined4 *)(puVar1 + 0xb4) = uVar10;
    *(undefined4 *)(puVar1 + 0xb8) = uVar9;
    *(undefined4 *)(puVar1 + 0xbc) = uVar10;
    *(undefined4 *)(puVar1 + 0xc0) = uVar9;
    goto LAB_00070388;
  case 3:
    uVar5 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_128,"gameOverContainer");
    uVar5 = FUN_0039725c(uVar5,auStack_128);
    FUN_0030f7e0(auStack_128);
    FUN_0030f7cc(auStack_150,"game_over_real");
    iVar3 = FUN_0039834c(uVar5,auStack_150,1);
    FUN_0030f7e0(auStack_150);
    if (iVar3 != 0) break;
    local_38[0] = 0;
    FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 4) + 0x260),local_38);
    FUN_000209b8(0xffffffff,0xbf800000,0xffffffff);
    uVar5 = 4;
LAB_00070388:
    *(undefined4 *)(param_1 + 0x44) = uVar5;
  }
switchD_000700de_default:
  if (*(int *)PTR____stack_chk_guard_004d9044 == local_34) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

## FUN_000707cc — 000707cc

- 函数名: FUN_000707cc
- 函数体: 235 字节
- 调用者数: 2 / 被调用者数: 15

```c

void FUN_000707cc(int param_1)

{
  byte bVar1;
  undefined *puVar2;
  int iVar3;
  undefined4 uVar4;
  uint uVar5;
  undefined4 uVar6;
  int iVar7;
  void *pvVar8;
  undefined4 local_24;
  
  pvVar8 = *(void **)(param_1 + 0x3c);
  if (pvVar8 != (void *)0x0) {
    FUN_00071d50(pvVar8);
    operator_delete(pvVar8);
    *(undefined4 *)(param_1 + 0x3c) = 0;
  }
  puVar2 = PTR_DAT_004d9048;
  iVar3 = FUN_000276e8(*(undefined4 *)(PTR_DAT_004d9048 + 0x5c),"bean");
  if (iVar3 == 0) {
    FUN_000274bc(*(undefined4 *)(puVar2 + 0x5c),"bean_game_consecutive_total",0,1,1);
  }
  local_24 = 0;
  uVar4 = FUN_000065c4();
  iVar3 = FUN_00006ad0(uVar4,1,&local_24);
  if (iVar3 != 0) {
    do {
      bVar1 = *(byte *)(iVar3 + 0x3c);
      uVar5 = FUN_0000aae0("bean",0);
      if (bVar1 == uVar5) {
        uVar4 = FUN_00033ca0();
        uVar6 = FUN_002f69c4("kiwifruit",9);
        iVar7 = FUN_00035a08(uVar4,uVar6,0,0);
        if (iVar7 != 0) {
          *(undefined4 *)(iVar7 + 8) = *(undefined4 *)(iVar3 + 0x10);
          *(undefined4 *)(iVar7 + 0xc) = *(undefined4 *)(iVar3 + 0x14);
          *(undefined4 *)(iVar7 + 0x10) = *(undefined4 *)(iVar3 + 0x18);
        }
        FUN_0000f2f8(iVar3,1);
      }
      uVar4 = FUN_000065c4();
      iVar3 = FUN_00006af0(uVar4,1,&local_24);
    } while (iVar3 != 0);
  }
  FUN_00052f80();
  FUN_00057ce0();
  FUN_000708c4(param_1);
  return;
}


```

## FUN_000713f4 — 000713f4

- 函数名: FUN_000713f4
- 函数体: 1091 字节
- 调用者数: 1 / 被调用者数: 17

```c

void FUN_000713f4(int param_1,int param_2)

{
  undefined *puVar1;
  int *piVar2;
  int ****ppppiVar3;
  _List_node_base *p_Var4;
  int iVar5;
  int iVar6;
  int *piVar7;
  int iVar8;
  code *pcVar9;
  undefined4 uVar10;
  int *piVar11;
  int iVar12;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  float fVar13;
  undefined8 unaff_d8;
  float fVar14;
  undefined8 uVar15;
  undefined4 uVar16;
  undefined8 unaff_d12;
  undefined8 uVar17;
  undefined8 uVar18;
  undefined8 uVar19;
  undefined8 uVar20;
  undefined1 auStack_1e4 [40];
  float local_1bc;
  float local_1b8;
  undefined4 local_1b4;
  undefined1 auStack_1b0 [40];
  undefined **local_188;
  int local_184;
  undefined1 *local_180;
  undefined4 local_17c;
  int ***local_178 [8];
  char local_158;
  undefined1 auStack_154 [40];
  undefined **local_12c;
  undefined *local_128;
  undefined4 local_124 [8];
  undefined1 local_104;
  undefined4 local_100 [8];
  undefined1 local_e0;
  undefined4 local_dc;
  undefined4 local_d8;
  char acStack_d4 [128];
  int local_54;
  
  puVar1 = PTR_DAT_004d9048;
  local_54 = *(int *)PTR____stack_chk_guard_004d9044;
  if (PTR_DAT_004d9048[0x17] != '\0') goto LAB_00071806;
  *(int *)(param_1 + 0x14) = *(int *)(param_1 + 0x14) + 1;
  puVar1[0x19] = 1;
  if ((*(int *)(param_1 + 4) == 0) || (*(int *)(param_1 + 0x44) != 1)) goto LAB_00071806;
  uVar10 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
  local_12c = &PTR_LAB_0052bf38;
  local_128 = PTR_FUN_004d9058;
  local_104 = 1;
  local_124[0] = 0;
  FUN_0000a23c(&local_12c,local_124);
  FUN_0002bc94(uVar10,"gank",0x3f800000,0x3f800000,local_124,0);
  FUN_0000a298(local_124);
  _sprintf(acStack_d4,"misscounters.cross%d",*(undefined4 *)(param_1 + 0x14));
  uVar10 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_154,acStack_d4);
  piVar2 = (int *)FUN_0039725c(uVar10,auStack_154);
  FUN_0030f7e0(auStack_154);
  if (piVar2 != (int *)0x0) {
    piVar11 = piVar2 + 0xf3;
    if (piVar2[0xf5] == 0) {
      FUN_0003ca68(piVar11);
      *piVar11 = (int)piVar11;
      piVar2[0xf4] = (int)piVar11;
    }
    else {
      piVar7 = (int *)*piVar11;
      if (piVar7 != piVar11) {
        piVar7[0xb] = piVar2[0xf5];
        piVar7[0xc] = 2;
        piVar2[0xf6] = piVar2[0xf6] + 1;
        for (piVar7 = (int *)*piVar7; piVar7 != piVar11; piVar7 = (int *)*piVar7) {
          piVar7[0xb] = piVar2[0xf5];
          piVar7[0xc] = 2;
          piVar2[0xf6] = piVar2[0xf6] + 1;
        }
      }
    }
    local_188 = &PTR_LAB_0052cd28;
    local_17c = 0;
    local_180 = &FUN_00071838_1;
    local_158 = '\x01';
    local_178[0] = (int ***)0x0;
    local_184 = param_1;
    FUN_000720c8(&local_188,local_178);
    local_e0 = 1;
    local_100[0] = 0;
    if (local_158 == '\0') {
      ppppiVar3 = local_178;
LAB_00071592:
      (*(code *)(*ppppiVar3)[2])(ppppiVar3,local_100);
    }
    else {
      ppppiVar3 = (int ****)local_178[0];
      if ((int ****)local_178[0] != (int ****)0x0) goto LAB_00071592;
      local_e0 = 1;
      local_100[0] = 0;
    }
    local_dc = 0;
    local_d8 = 0;
    p_Var4 = (_List_node_base *)FUN_0003c96c(piVar11,local_100);
    std::_List_node_base::hook(p_Var4);
    FUN_0003c910(local_100);
    if (piVar2[0xf5] != 0) {
      iVar6 = piVar2[0xf4];
      *(int *)(iVar6 + 0x2c) = piVar2[0xf5];
      *(undefined4 *)(iVar6 + 0x30) = 1;
      piVar2[0xf6] = piVar2[0xf6] + 1;
    }
    FUN_0003c910(local_178);
    pcVar9 = *(code **)(*piVar2 + 0x40);
    FUN_0030f7cc(auStack_1b0,"out");
    (*pcVar9)(piVar2,auStack_1b0,1);
    FUN_0030f7e0(auStack_1b0);
  }
  iVar6 = 0;
  do {
    piVar2 = *(int **)(*(int *)(param_1 + 0x54) + iVar6 * 4 + 0x28);
    if (piVar2 == (int *)0x0) break;
    iVar5 = piVar2[0x98];
    if (piVar2[0x13] == 0) {
LAB_00071632:
      local_100[0] = CONCAT31(local_100[0]._1_3_,1);
      uVar10 = FUN_0001da28(iVar5,local_100);
      fVar14 = *(float *)(param_2 + 0x10);
      fVar13 = *(float *)(param_2 + 0x14);
      uVar18 = CONCAT44((int)((ulonglong)unaff_d8 >> 0x20),fVar13);
      local_1b4 = *(undefined4 *)(param_2 + 0x18);
      local_1bc = fVar14;
      local_1b8 = fVar13;
      uVar10 = FUN_00025164(uVar10);
      for (iVar6 = piVar2[0x182]; *(int *)(iVar6 + 0x38) != 0;
          iVar6 = *(int *)(*(int *)(iVar6 + 0x38) + 4)) {
      }
      uVar15 = FloatVectorMult(CONCAT44(uVar10,uVar10),0x3f0000003f000000,2,0x20);
      uVar16 = *(undefined4 *)(iVar6 + 0x48);
      uVar10 = FUN_00025164();
      uVar19 = FloatVectorMult(CONCAT44((int)((ulonglong)unaff_d12 >> 0x20),uVar16),
                               0x3f0000003f000000,2,0x20);
      iVar5 = piVar2[0x182];
      uVar17 = FloatVectorMult(CONCAT44(uVar10,uVar10),0x3f0000003f000000,2,0x20);
      iVar6 = *(int *)(iVar5 + 0x38);
      uVar19 = FloatVectorSub(uVar19,uVar15,2,0x20);
      uVar10 = (undefined4)((ulonglong)uVar19 >> 0x20);
      if (fVar14 <= (float)uVar19) {
        while (iVar6 != 0) {
          iVar5 = *(int *)(iVar6 + 4);
          iVar6 = *(int *)(iVar5 + 0x38);
        }
        uVar19 = CONCAT44(uVar10,*(undefined4 *)(iVar5 + 0x48));
        uVar20 = FloatVectorMult(uVar19,0x3f0000003f000000,2,0x20);
        uVar17 = FloatVectorSub(uVar20,uVar17,2,0x20);
        fVar14 = (float)uVar17;
      }
      else {
        while (iVar6 != 0) {
          iVar5 = *(int *)(iVar6 + 4);
          iVar6 = *(int *)(iVar5 + 0x38);
        }
        uVar19 = FloatVectorMult(CONCAT44(uVar10,*(undefined4 *)(iVar5 + 0x48)),0xbf000000bf000000,2
                                 ,0x20);
        uVar19 = FloatVectorAdd(uVar17,uVar19,2);
        if ((float)uVar19 <= fVar14) {
          uVar10 = FUN_00025164();
          for (iVar6 = piVar2[0x182]; *(int *)(iVar6 + 0x38) != 0;
              iVar6 = *(int *)(*(int *)(iVar6 + 0x38) + 4)) {
          }
          uVar17 = FloatVectorMult(CONCAT44(uVar10,uVar10),0x3f0000003f000000,2,0x20);
          uVar19 = CONCAT44(extraout_s1,*(undefined4 *)(iVar6 + 0x48));
          uVar20 = FloatVectorMult(uVar19,0xbf000000bf000000,2,0x20);
          uVar17 = FloatVectorAdd(uVar17,uVar20,2);
          fVar14 = (float)uVar17;
        }
      }
      local_1bc = fVar14;
      uVar10 = FUN_000251a8((int)uVar19);
      for (iVar6 = piVar2[0x183]; *(int *)(iVar6 + 0x38) != 0;
          iVar6 = *(int *)(*(int *)(iVar6 + 0x38) + 4)) {
      }
      uVar19 = FloatVectorMult(CONCAT44(uVar10,uVar10),0x3f0000003f000000,2,0x20);
      uVar16 = *(undefined4 *)(iVar6 + 0x48);
      uVar10 = FUN_000251a8();
      uVar17 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar15 >> 0x20),uVar16),0x3f0000003f000000,
                               2,0x20);
      iVar5 = piVar2[0x183];
      uVar15 = FloatVectorMult(CONCAT44(uVar10,uVar10),0x3f0000003f000000,2,0x20);
      iVar6 = *(int *)(iVar5 + 0x38);
      uVar19 = FloatVectorSub(uVar17,uVar19,2,0x20);
      uVar10 = (undefined4)((ulonglong)uVar19 >> 0x20);
      if (fVar13 <= (float)uVar19) {
        while (iVar6 != 0) {
          iVar5 = *(int *)(iVar6 + 4);
          iVar6 = *(int *)(iVar5 + 0x38);
        }
        uVar18 = FloatVectorMult(CONCAT44(uVar10,*(undefined4 *)(iVar5 + 0x48)),0x3f0000003f000000,2
                                 ,0x20);
        uVar18 = FloatVectorSub(uVar18,uVar15,2,0x20);
      }
      else {
        while (iVar6 != 0) {
          iVar5 = *(int *)(iVar6 + 4);
          iVar6 = *(int *)(iVar5 + 0x38);
        }
        uVar19 = FloatVectorMult(CONCAT44(uVar10,*(undefined4 *)(iVar5 + 0x48)),0xbf000000bf000000,2
                                 ,0x20);
        uVar19 = FloatVectorAdd(uVar15,uVar19,2);
        if ((float)uVar19 <= fVar13) {
          uVar10 = FUN_000251a8();
          for (iVar6 = piVar2[0x183]; *(int *)(iVar6 + 0x38) != 0;
              iVar6 = *(int *)(*(int *)(iVar6 + 0x38) + 4)) {
          }
          uVar18 = FloatVectorMult(CONCAT44(uVar10,uVar10),0x3f0000003f000000,2,0x20);
          uVar19 = FloatVectorMult(CONCAT44(extraout_s1_00,*(undefined4 *)(iVar6 + 0x48)),
                                   0xbf000000bf000000,2,0x20);
          uVar18 = FloatVectorAdd(uVar18,uVar19,2);
        }
      }
      uVar18 = FloatVectorNeg(uVar18,2,2);
      local_1b8 = (float)uVar18;
      FUN_0000606c(local_1b8,piVar2[0x17e],&local_1bc);
      pcVar9 = *(code **)(*piVar2 + 0x40);
      FUN_0030f7cc(auStack_1e4,"animate_trigger");
      (*pcVar9)(piVar2,auStack_1e4,1);
      FUN_0030f7e0(auStack_1e4);
      break;
    }
    iVar8 = *(int *)(iVar5 + 0x38);
    iVar12 = iVar5;
    while (iVar8 != 0) {
      iVar12 = *(int *)(iVar8 + 4);
      iVar8 = *(int *)(iVar12 + 0x38);
    }
    if (*(char *)(iVar12 + 0x48) == '\0') goto LAB_00071632;
    iVar6 = iVar6 + 1;
  } while (iVar6 < 3);
LAB_00071806:
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_54) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0007048c — 0007048c

- 函数名: FUN_0007048c
- 函数体: 367 字节
- 调用者数: 1 / 被调用者数: 9

```c

void FUN_0007048c(int param_1)

{
  int *piVar1;
  byte bVar2;
  bool bVar3;
  undefined *puVar4;
  undefined4 uVar5;
  int iVar6;
  uint uVar7;
  undefined **local_4c;
  undefined *local_48;
  undefined1 local_2c;
  undefined4 local_28;
  int local_24;
  
  puVar4 = PTR____stack_chk_guard_004d9044;
  bVar3 = false;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  local_28 = 0;
  uVar5 = FUN_000065c4();
  iVar6 = FUN_00006ad0(uVar5,1,&local_28);
  if (iVar6 == 0) {
    iVar6 = *(int *)(param_1 + 0x40);
  }
  else {
    do {
      if ((*(float *)(iVar6 + 0xd0) <= 0.0) && (*(char *)(iVar6 + 0x1bc) == '\0')) {
        bVar2 = *(byte *)(iVar6 + 0x3c);
        uVar7 = FUN_0000aae0("bean",0);
        bVar3 = (bool)(bVar3 | bVar2 == uVar7);
      }
      uVar5 = FUN_000065c4();
      iVar6 = FUN_00006af0(uVar5,1,&local_28);
    } while (iVar6 != 0);
    piVar1 = (int *)(param_1 + 0x40);
    iVar6 = *piVar1;
    if (bVar3) {
      if (iVar6 != 0) {
        iVar6 = FUN_00309b54(iVar6);
        if (iVar6 == 0) {
          FUN_0002be70(*(undefined4 *)(PTR_DAT_004d9048 + 0x1a4),*piVar1,"bean-lp");
          *piVar1 = 0;
        }
        else if (*piVar1 != 0) goto LAB_000705e6;
      }
      local_2c = 1;
      local_4c = (undefined **)0x0;
      uVar5 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
      FUN_0000a298(&local_4c);
      local_2c = 0;
      local_4c = &PTR_LAB_0052bf38;
      local_48 = PTR_FUN_004d9058;
      iVar6 = FUN_0002bc94(uVar5,"bean-lp",0x3f800000,0x3f800000,&local_4c,0);
      *piVar1 = iVar6;
      FUN_0000a298(&local_4c);
      goto LAB_000705e6;
    }
  }
  if (iVar6 != 0) {
    FUN_0002be70(*(undefined4 *)(PTR_DAT_004d9048 + 0x1a4),iVar6,"bean-lp");
    *(undefined4 *)(param_1 + 0x40) = 0;
  }
LAB_000705e6:
  if (*(int *)puVar4 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0007106c — 0007106c

- 函数名: FUN_0007106c
- 函数体: 899 字节
- 调用者数: 2 / 被调用者数: 21

```c

void FUN_0007106c(int *param_1,undefined4 param_2,undefined4 param_3)

{
  undefined *puVar1;
  int iVar2;
  void *pvVar3;
  undefined4 uVar4;
  int *piVar5;
  int iVar6;
  code *pcVar7;
  undefined8 uVar8;
  undefined4 extraout_s1;
  float fVar9;
  undefined1 auStack_2ac [40];
  undefined1 auStack_284 [40];
  undefined1 auStack_25c [40];
  undefined1 auStack_234 [40];
  undefined4 local_20c;
  undefined4 local_208;
  undefined4 local_204;
  undefined1 auStack_200 [40];
  undefined1 auStack_1d8 [40];
  undefined1 auStack_1b0 [40];
  undefined1 auStack_188 [40];
  undefined1 auStack_160 [40];
  undefined1 local_138 [4];
  char acStack_134 [128];
  char acStack_b4 [128];
  int local_34;
  
  local_34 = *(int *)PTR____stack_chk_guard_004d9044;
  (**(code **)(*param_1 + 0x20))(param_1);
  puVar1 = PTR_DAT_004d9048;
  iVar2 = *(int *)(PTR_DAT_004d9048 + 0x5c);
  param_1[5] = *(int *)(iVar2 + 0x58);
  param_1[2] = *(int *)(iVar2 + 0x110);
  param_1[0x14] = *(int *)(iVar2 + 0x114);
  iVar2 = FUN_00052f80();
  *(undefined4 *)(iVar2 + 0x208) = *(undefined4 *)(*(int *)(puVar1 + 0x5c) + 0x118);
  if (param_1[1] != 0) {
    iVar2 = 1;
    FUN_00396d98(param_1[1],1);
    do {
      _sprintf(acStack_b4,"misscounters.cross%d",iVar2);
      iVar6 = param_1[1];
      FUN_0030f7cc(auStack_160,acStack_b4);
      iVar6 = FUN_0039725c(iVar6,auStack_160);
      FUN_0030f7e0(auStack_160);
      if ((iVar6 != 0) && (iVar2 - 1U < (uint)param_1[5])) {
        local_138[0] = 0;
        FUN_0001da28(*(undefined4 *)(iVar6 + 0x260),local_138);
      }
      iVar2 = iVar2 + 1;
    } while (iVar2 != 4);
  }
  switch(param_2) {
  case 0:
    FUN_0006ffa4(param_1);
    break;
  case 1:
    FUN_000705fc(param_1);
    break;
  case 2:
    FUN_000708c4(param_1);
    break;
  case 3:
    iVar2 = param_1[1];
    FUN_0030f7cc(auStack_188,"gameOverContainer");
    piVar5 = (int *)FUN_0039725c(iVar2,auStack_188);
    FUN_0030f7e0(auStack_188);
    if (piVar5 != (int *)0x0) {
      local_138[0] = 1;
      FUN_0001da28(piVar5[0x98],local_138);
      pcVar7 = *(code **)(*piVar5 + 0x40);
      FUN_0030f7cc(auStack_1b0,"game_over_real");
      (*pcVar7)(piVar5,auStack_1b0,1);
      FUN_0030f7e0(auStack_1b0);
    }
  }
  iVar2 = *(int *)(PTR_DAT_004d9048 + 0x5c);
  if (0.0 <= *(float *)(iVar2 + 0x134)) {
    pvVar3 = operator_new(0x4c);
    FUN_00071c94(pvVar3,iVar2 + 0x11c,iVar2 + 0x128,*(undefined4 *)(iVar2 + 0x134),
                 *(undefined1 *)(iVar2 + 0x138));
    puVar1 = PTR_DAT_004d9048;
    param_1[0xf] = (int)pvVar3;
    if (*(char *)(*(int *)(puVar1 + 0x5c) + 0x138) != '\0') {
      _sprintf(acStack_134,"inGameClassic.misscounters.cross%d",param_1[5] + 1);
      uVar4 = FUN_003ecb20();
      FUN_0030f7cc(auStack_1d8,acStack_134);
      piVar5 = (int *)FUN_003f06d0(uVar4,auStack_1d8);
      FUN_0030f7e0(auStack_1d8);
      if (piVar5 != (int *)0x0) {
        local_138[0] = 1;
        FUN_0001da28(piVar5[0x98],local_138);
        pcVar7 = *(code **)(*piVar5 + 0x40);
        FUN_0030f7cc(auStack_200,"in");
        (*pcVar7)(piVar5,auStack_200,1);
        FUN_0030f7e0(auStack_200);
      }
    }
    piVar5 = (int *)FUN_00043d2c();
    puVar1 = PTR_DAT_004d9048;
    if (piVar5 != (int *)0x0) {
      iVar2 = *(int *)(PTR_DAT_004d9048 + 0x5c);
      local_20c = *(undefined4 *)(iVar2 + 0x11c);
      local_208 = *(undefined4 *)(iVar2 + 0x120);
      local_204 = *(undefined4 *)(iVar2 + 0x124);
      FUN_000445b0(local_20c,piVar5,&local_20c,0);
      (**(code **)(*piVar5 + 0x28))(piVar5,*(undefined4 *)(*(int *)(puVar1 + 0x5c) + 0x134));
    }
  }
  iVar2 = param_1[1];
  if (iVar2 != 0) {
    FUN_0030f7cc(auStack_234,"score.text");
    iVar2 = FUN_0039725c(iVar2,auStack_234);
    FUN_0030f7e0(auStack_234);
    FUN_00083564(iVar2);
    fVar9 = *(float *)(iVar2 + 0x884);
    uVar4 = FUN_0001ca48();
    iVar6 = param_1[1];
    uVar8 = FixedToFP(CONCAT44(uVar4,uVar4),0,0,0,0x20);
    if (fVar9 <= (float)uVar8) {
      FUN_0030f7cc(auStack_2ac,"score.bestScoreText");
      iVar2 = FUN_0039725c(iVar6,auStack_2ac);
      FUN_0030f7e0(auStack_2ac);
      if (iVar2 != 0) {
        uVar4 = FUN_0001ca48();
        *(undefined4 *)(iVar2 + 0x880) = uVar4;
        FUN_003d0bf4(iVar2);
      }
    }
    else {
      FUN_0030f7cc(auStack_25c,"score.bestScoreText");
      piVar5 = (int *)FUN_0039725c(iVar6,auStack_25c);
      FUN_0030f7e0(auStack_25c);
      if (piVar5 != (int *)0x0) {
        uVar8 = FPToFixed(CONCAT44(extraout_s1,*(float *)(iVar2 + 0x884)),0,0,3,0x20);
        piVar5[0x220] = (int)uVar8;
        FUN_003d0bf4((int)uVar8,piVar5);
        pcVar7 = *(code **)(*piVar5 + 0x40);
        FUN_0030f7cc(auStack_284,"beaten");
        (*pcVar7)(piVar5,auStack_284,1);
        FUN_0030f7e0(auStack_284);
      }
      *(undefined1 *)(param_1 + 4) = 1;
    }
    (**(code **)(*(int *)param_1[1] + 0x34))((int *)param_1[1],param_3);
    FUN_00397e7c(param_1[1],param_3,0);
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 == local_34) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

## FUN_00018cb8 — 00018cb8

- 函数名: FUN_00018cb8
- 函数体: 113 字节
- 调用者数: 2 / 被调用者数: 5

```c

undefined4 FUN_00018cb8(int param_1)

{
  undefined *puVar1;
  int iVar2;
  
  if ((*(char *)(param_1 + 0x50) == '\0') && (*(char *)(param_1 + 0xa4) == '\0')) {
    FUN_00018d2c(param_1);
    if (DAT_005d4d5c == 2) {
      FUN_00015814(param_1 + 0xa0,0x3f800000);
    }
    puVar1 = PTR_DAT_004d9048;
    iVar2 = FUN_0001d10c(PTR_DAT_004d9048);
    if (iVar2 != 0) {
      FUN_0001d10c(puVar1);
      iVar2 = FUN_00063f5c(PTR_DAT_004d907c);
      if (iVar2 != 1) {
        return 0;
      }
    }
  }
  FUN_00018e60(param_1);
  return 1;
}


```

## FUN_00018e60 — 00018e60

- 函数名: FUN_00018e60
- 函数体: 1309 字节
- 调用者数: 1 / 被调用者数: 16

```c

void FUN_00018e60(int param_1)

{
  undefined *puVar1;
  byte bVar2;
  short sVar3;
  uint uVar4;
  undefined4 uVar5;
  int iVar6;
  int iVar7;
  float fVar8;
  undefined4 uVar9;
  undefined4 *puVar10;
  float fVar11;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined4 extraout_s1_03;
  ulonglong uVar12;
  undefined4 uVar14;
  uint extraout_s1_04;
  longlong lVar13;
  uint extraout_s1_05;
  uint extraout_s1_06;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  undefined4 extraout_s3_01;
  undefined4 extraout_s3_02;
  undefined4 extraout_s3_03;
  undefined4 uVar16;
  undefined8 uVar15;
  undefined4 uVar17;
  undefined4 extraout_s3_04;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  undefined4 extraout_s5_01;
  undefined4 extraout_s5_02;
  undefined4 extraout_s5_03;
  undefined8 uVar18;
  undefined4 extraout_s5_04;
  undefined4 extraout_s5_05;
  undefined4 extraout_s5_06;
  undefined4 extraout_s7;
  undefined4 extraout_s7_00;
  undefined4 extraout_s7_01;
  undefined4 extraout_s7_02;
  undefined4 extraout_s7_03;
  undefined8 uVar19;
  undefined4 extraout_s9;
  undefined4 extraout_s9_00;
  undefined4 extraout_s9_01;
  undefined4 extraout_s9_02;
  undefined4 extraout_s9_03;
  undefined4 extraout_s11;
  undefined4 extraout_s11_00;
  undefined4 extraout_s11_01;
  undefined4 extraout_s11_02;
  undefined4 extraout_s11_03;
  undefined4 uVar20;
  undefined4 extraout_s11_04;
  undefined8 unaff_d9;
  undefined8 unaff_d10;
  undefined8 unaff_d11;
  undefined8 unaff_d12;
  undefined8 uVar21;
  undefined8 uVar22;
  undefined8 uVar23;
  undefined8 uVar24;
  undefined8 uVar25;
  undefined8 uVar26;
  undefined8 uVar27;
  undefined4 local_d8;
  undefined4 local_d4;
  undefined4 local_d0;
  undefined4 local_cc;
  undefined4 local_c8;
  undefined4 local_c4;
  undefined4 local_c0;
  undefined4 local_bc;
  undefined4 local_b8;
  undefined4 local_b4;
  undefined4 local_b0;
  undefined4 local_ac;
  undefined4 local_a8;
  undefined4 local_a4;
  undefined4 local_a0;
  undefined4 local_9c;
  undefined4 local_98;
  undefined4 local_94;
  undefined4 local_90;
  undefined4 local_8c;
  undefined4 local_88;
  undefined4 local_84;
  undefined4 local_80;
  undefined4 local_7c;
  undefined4 local_78;
  undefined4 local_74;
  undefined4 local_70;
  undefined4 local_6c;
  undefined4 local_68;
  undefined4 local_64;
  
  puVar1 = PTR_DAT_004d9048;
  if (*(int **)PTR_DAT_004d9048 != (int *)0x0) {
    uVar4 = (**(code **)(**(int **)PTR_DAT_004d9048 + 0x28))();
    if (puVar1[10] == '\0') {
      uVar4 = uVar4 ^ 1;
    }
    if (puVar1[10] != '\0' || uVar4 != 0) {
      return;
    }
  }
  uVar5 = FUN_00052f80();
  iVar6 = FUN_0005809c(uVar5,0);
  if (iVar6 == 1) {
    iVar6 = *(int *)(param_1 + 0x94);
    if (*(int *)(param_1 + 0x94) == 0) {
      if (((DAT_005573d4 & 1) == 0) && (iVar6 = ___cxa_guard_acquire(&DAT_005573d4), iVar6 != 0)) {
        DAT_005573d0 = FUN_002f69c4("crit_hit_stars",0xe);
        ___cxa_guard_release(&DAT_005573d4);
      }
      uVar5 = FUN_00033ca0();
      iVar7 = FUN_00035a08(uVar5,DAT_005573d0,0,1);
      *(int *)(param_1 + 0x94) = iVar7;
      iVar6 = 0;
      if (iVar7 != 0) {
        *(undefined1 *)(iVar7 + 0x4c) = 1;
        iVar6 = iVar7;
      }
    }
    local_78 = *(undefined4 *)(param_1 + 0x10);
    local_74 = *(undefined4 *)(param_1 + 0x14);
    local_70 = *(undefined4 *)(param_1 + 0x18);
    FUN_000050f8(local_78,&local_6c,*(undefined4 *)(puVar1 + 0x58),&local_78,1,0);
    *(undefined4 *)(iVar6 + 8) = local_6c;
    *(undefined4 *)(iVar6 + 0xc) = local_68;
    *(undefined4 *)(iVar6 + 0x10) = local_64;
    uVar5 = extraout_s9_00;
    uVar20 = extraout_s11_00;
    uVar17 = extraout_s1_00;
    uVar14 = extraout_s5_00;
    uVar9 = extraout_s7_00;
    uVar16 = extraout_s3_00;
  }
  else {
    uVar5 = extraout_s9;
    uVar20 = extraout_s11;
    uVar17 = extraout_s1;
    uVar14 = extraout_s5;
    uVar9 = extraout_s7;
    uVar16 = extraout_s3;
    if (DAT_005d4d64 == '\0') {
      if (*(int *)(param_1 + 0x94) != 0) {
        uVar5 = FUN_00033ca0();
        FUN_00036f4c(uVar5,*(undefined4 *)(param_1 + 0x94));
        *(undefined4 *)(param_1 + 0x94) = 0;
        uVar5 = extraout_s9_02;
        uVar20 = extraout_s11_02;
        uVar17 = extraout_s1_02;
        uVar14 = extraout_s5_02;
        uVar9 = extraout_s7_02;
        uVar16 = extraout_s3_02;
      }
    }
    else if (*(int *)(param_1 + 0x94) == 0) {
      uVar5 = FUN_00033ca0();
      iVar6 = FUN_00035a08(uVar5,DAT_005d4d68,0,1);
      *(int *)(param_1 + 0x94) = iVar6;
      uVar5 = extraout_s9_01;
      uVar20 = extraout_s11_01;
      uVar17 = extraout_s1_01;
      uVar14 = extraout_s5_01;
      uVar9 = extraout_s7_01;
      uVar16 = extraout_s3_01;
      if (iVar6 != 0) {
        *(undefined1 *)(iVar6 + 0x4c) = 1;
      }
    }
  }
  if (0.0 < *(float *)(puVar1 + 0x24)) {
    return;
  }
  if (DAT_00557398 != '\x01') {
    return;
  }
  iVar6 = *(int *)(param_1 + 0x94);
  if (iVar6 != 0) {
    fVar11 = 1.0;
    *(undefined1 *)(iVar6 + 0x4d) = 1;
    if (puVar1[10] == '\0') {
      iVar7 = FUN_00052f80();
      iVar6 = *(int *)(param_1 + 0x94);
      fVar11 = 1.0 / *(float *)(iVar7 + 0x7c);
    }
    *(float *)(iVar6 + 0x2c) = fVar11;
    local_90 = *(undefined4 *)(param_1 + 0x10);
    local_8c = *(undefined4 *)(param_1 + 0x14);
    local_88 = *(undefined4 *)(param_1 + 0x18);
    FUN_000050f8(local_90,&local_84,*(undefined4 *)(puVar1 + 0x58),&local_90,1,0);
    *(undefined4 *)(iVar6 + 8) = local_84;
    *(undefined4 *)(iVar6 + 0xc) = local_80;
    *(undefined4 *)(iVar6 + 0x10) = local_7c;
    uVar5 = extraout_s9_03;
    uVar20 = extraout_s11_03;
    uVar17 = extraout_s1_03;
    uVar14 = extraout_s5_03;
    uVar9 = extraout_s7_03;
    uVar16 = extraout_s3_03;
  }
  puVar10 = (undefined4 *)(param_1 + 0x10);
  fVar11 = *(float *)(param_1 + 0xcc);
  uVar12 = CONCAT44(uVar17,*puVar10);
  uVar18 = FloatVectorSub(CONCAT44(uVar9,*(undefined4 *)(param_1 + 0x14)),
                          CONCAT44(uVar14,*(undefined4 *)(param_1 + 0xd0)),2,0x20);
  uVar19 = FloatVectorSub(uVar12,CONCAT44((int)((ulonglong)unaff_d12 >> 0x20),fVar11),2,0x20);
  uVar15 = FloatVectorSub(CONCAT44(uVar5,*(undefined4 *)(param_1 + 0x18)),
                          CONCAT44(uVar16,*(undefined4 *)(param_1 + 0xd4)),2,0x20);
  uVar21 = FloatVectorMult(uVar18,uVar18,2,0x20);
  uVar27 = FloatVectorMult(uVar19,uVar19,2,0x20);
  local_9c = (undefined4)uVar19;
  local_98 = (undefined4)uVar18;
  local_94 = (undefined4)uVar15;
  bVar2 = *(byte *)(param_1 + 0x50);
  uVar18 = FloatVectorAdd(uVar27,uVar21,2);
  if (bVar2 == 0) {
    uVar17 = (undefined4)((ulonglong)uVar15 >> 0x20);
    if (DAT_00019384 <= (float)uVar18) goto LAB_000190c8;
    iVar6 = 0;
    uVar14 = uVar17;
    if (DAT_00019380 < fVar11) goto LAB_000190be;
LAB_000190de:
    while( true ) {
      iVar7 = param_1 + iVar6;
      iVar6 = iVar6 + 0xc;
      *(int *)(iVar7 + 0xcc) = (int)uVar12;
      *(undefined4 *)(iVar7 + 0xd0) = *(undefined4 *)(param_1 + 0x14);
      *(undefined4 *)(iVar7 + 0xd4) = *(undefined4 *)(param_1 + 0x18);
      uVar14 = (undefined4)(uVar12 >> 0x20);
      if (iVar6 == 0x24) break;
      uVar12 = CONCAT44(uVar14,*puVar10);
    }
    uVar21 = FloatVectorSub(CONCAT44(uVar5,DAT_0052bfe0),
                            CONCAT44((int)((ulonglong)uVar18 >> 0x20),
                                     *(undefined4 *)(param_1 + 0xcc)),2,0x20);
    uVar18 = FloatVectorSub(CONCAT44((int)((ulonglong)uVar19 >> 0x20),DAT_0052bfe4),
                            CONCAT44(uVar17,*(undefined4 *)(param_1 + 0xd0)),2,0x20);
    uVar15 = FloatVectorSub(CONCAT44(uVar20,DAT_0052bfe8),
                            CONCAT44(uVar14,*(undefined4 *)(param_1 + 0xd4)),2,0x20);
    local_9c = (undefined4)uVar21;
    local_98 = (undefined4)uVar18;
    local_94 = (undefined4)uVar15;
    uVar4 = FUN_00009b50(local_94,&local_9c);
    uVar12 = (ulonglong)uVar4;
    *(undefined1 *)(param_1 + 0x51) = 0;
    iVar6 = *(int *)(puVar1 + 0x5c);
    if (iVar6 != 0) {
      uVar5 = FUN_002f69c4("slashes",7);
      uVar4 = FUN_00027588(iVar6,"slashes",uVar5,1,0,0);
      uVar12 = (ulonglong)uVar4;
    }
  }
  else {
    uVar17 = 0x41c80000;
    if ((float)uVar18 < 25.0) {
      uVar17 = 0x41c80000;
      uVar14 = 0x41c80000;
      if (DAT_00019380 < fVar11) {
LAB_000190be:
        uVar17 = uVar14;
        if (0 < *(int *)(param_1 + 0xb4)) goto LAB_00019360;
      }
    }
LAB_000190c8:
    iVar6 = 0;
    if (fVar11 <= DAT_00019380) goto LAB_000190de;
  }
  uVar17 = local_94;
  uVar20 = local_98;
  uVar5 = local_9c;
  *(int *)(param_1 + 0x48) = *(int *)(param_1 + 0xb4) + -2;
  local_a8 = local_9c;
  local_a4 = local_98;
  local_a0 = local_94;
  fVar8 = (float)FUN_00009b50((int)uVar12,&local_a8);
  uVar9 = FUN_0001938c(param_1);
  uVar19 = CONCAT44((int)((ulonglong)unaff_d11 >> 0x20),*(undefined4 *)(param_1 + 0xcc));
  uVar18 = CONCAT44((int)((ulonglong)unaff_d10 >> 0x20),*(undefined4 *)(param_1 + 0xd0));
  uVar15 = CONCAT44((int)((ulonglong)unaff_d9 >> 0x20),*(undefined4 *)(param_1 + 0xd4));
  uVar4 = extraout_s1_04;
  uVar14 = extraout_s5_04;
  if ((DAT_00019388 < fVar8) && (DAT_00019380 < fVar11)) {
    uVar22 = FloatVectorSub(0x3f8000003f800000,CONCAT44(uVar9,uVar9),2,0x20);
    lVar13 = CONCAT44(extraout_s1_04,local_a8);
    uVar21 = CONCAT44(extraout_s11_04,DAT_00019388);
    uVar27 = CONCAT44(extraout_s11_04,DAT_00019388);
    uVar23 = FloatVectorMult(CONCAT44(extraout_s5_04,local_a0),
                             CONCAT44(extraout_s11_04,DAT_00019388),2,0x20);
    uVar24 = FloatVectorMult(CONCAT44(extraout_s3_04,local_a4),
                             CONCAT44(extraout_s11_04,DAT_00019388),2,0x20);
    uVar25 = FloatVectorMult(lVar13,CONCAT44(extraout_s11_04,DAT_00019388),2,0x20);
    do {
      uVar26 = FloatVectorMult(uVar22,CONCAT44((int)((ulonglong)lVar13 >> 0x20),
                                               (float)uVar21 / fVar8),2,0x20);
      local_c0 = uVar5;
      local_bc = uVar20;
      local_b8 = uVar17;
      uVar26 = FloatVectorAdd(CONCAT44(uVar9,uVar9),uVar26,2);
      uVar15 = FloatVectorAdd(uVar15,uVar23,2);
      uVar19 = FloatVectorAdd(uVar19,uVar25,2);
      uVar18 = FloatVectorAdd(uVar18,uVar24,2);
      local_b4 = (undefined4)uVar19;
      local_b0 = (undefined4)uVar18;
      local_ac = (undefined4)uVar15;
      FUN_0001943c((int)uVar26,param_1,&local_b4,&local_c0,(int)uVar26);
      lVar13 = (ulonglong)extraout_s1_05 << 0x20;
      uVar21 = FloatVectorAdd(uVar21,uVar27,2);
      uVar4 = extraout_s1_05;
      uVar14 = extraout_s5_05;
    } while ((int)((uint)((float)uVar21 < fVar8) << 0x1f) < 0);
  }
  if ((*(int *)(param_1 + 0x94) != 0) && (DAT_005d4d64 == '\x02')) {
    sVar3 = FUN_0030113c(uVar5,uVar20);
    uVar4 = FUN_003010b8(-sVar3);
    *(uint *)(*(int *)(param_1 + 0x94) + 0x34) = uVar4 ^ 0x80000000;
    uVar5 = FUN_003010d0(-sVar3);
    *(undefined4 *)(*(int *)(param_1 + 0x94) + 0x30) = uVar5;
    uVar4 = extraout_s1_06;
    uVar14 = extraout_s5_06;
  }
  local_cc = *puVar10;
  uVar19 = FloatVectorSub(CONCAT44(uVar4,local_cc),uVar19,2,0x20);
  local_c8 = *(undefined4 *)(param_1 + 0x14);
  uVar18 = FloatVectorSub(CONCAT44(uVar14,local_c8),uVar18,2,0x20);
  local_c4 = *(undefined4 *)(param_1 + 0x18);
  local_d8 = (undefined4)uVar19;
  uVar15 = FloatVectorSub(CONCAT44(uVar14,local_c4),uVar15,2,0x20);
  local_d4 = (undefined4)uVar18;
  local_d0 = (undefined4)uVar15;
  FUN_0001943c(local_d8,param_1,&local_cc,&local_d8,0x3f800000);
  iVar6 = 0;
  do {
    iVar7 = param_1 + iVar6;
    iVar6 = iVar6 + -0xc;
    *(undefined4 *)(iVar7 + 0xe4) = *(undefined4 *)(iVar7 + 0xd8);
    *(undefined4 *)(iVar7 + 0xe8) = *(undefined4 *)(iVar7 + 0xdc);
    *(undefined4 *)(iVar7 + 0xec) = *(undefined4 *)(iVar7 + 0xe0);
  } while (iVar6 != -0x18);
  *(undefined4 *)(param_1 + 0xcc) = *(undefined4 *)(param_1 + 0x10);
  *(undefined4 *)(param_1 + 0xd0) = *(undefined4 *)(param_1 + 0x14);
  *(undefined4 *)(param_1 + 0xd4) = *(undefined4 *)(param_1 + 0x18);
  *(int *)(param_1 + 0x4c) = *(int *)(param_1 + 0xb4) + -2;
  bVar2 = *(byte *)(param_1 + 0x50);
LAB_00019360:
  *(byte *)(param_1 + 0x50) = bVar2 | 1;
  return;
}


```

