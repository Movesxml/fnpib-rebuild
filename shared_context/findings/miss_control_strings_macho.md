# 字符串定位报告（立即数扫描）

- 程序: FruitNinjaPuss
- 已定义函数: 27861
- 命中函数: 16，裸引用点(未纳入函数): 0

## FUN_0006c2b4 — 0006c2b4
命中: @missAmount@0041ca78

```c

void FUN_0006c2b4(int param_1)

{
  undefined *puVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  _List_node_base *p_Var6;
  char *pcVar7;
  undefined1 *puVar8;
  int *piVar9;
  undefined4 *puVar10;
  undefined4 uVar11;
  code *pcVar12;
  undefined4 *puVar13;
  undefined1 auStack_464 [40];
  undefined1 auStack_43c [40];
  undefined1 auStack_414 [40];
  undefined1 auStack_3ec [40];
  undefined1 auStack_3c4 [40];
  undefined4 local_39c;
  undefined4 local_398;
  undefined4 uStack_394;
  undefined4 uStack_390;
  undefined4 local_38c;
  undefined4 local_388;
  undefined4 local_384;
  undefined1 auStack_380 [40];
  undefined1 auStack_358 [40];
  undefined1 auStack_330 [40];
  undefined1 auStack_308 [40];
  undefined1 auStack_2e0 [40];
  undefined1 auStack_2b8 [40];
  undefined1 auStack_290 [40];
  undefined1 auStack_268 [40];
  undefined1 auStack_240 [40];
  undefined1 auStack_218 [40];
  undefined1 auStack_1f0 [40];
  undefined *local_1c8;
  int local_1c4;
  undefined *local_1c0;
  undefined4 local_1bc;
  undefined1 local_1a8;
  undefined1 auStack_1a4 [40];
  undefined1 auStack_17c [40];
  undefined1 auStack_154 [40];
  undefined1 auStack_12c [40];
  undefined1 auStack_104 [40];
  uint local_dc [8];
  undefined1 local_bc;
  undefined4 local_b8;
  undefined4 local_b4;
  undefined1 auStack_b0 [128];
  undefined1 auStack_30 [12];
  int iStack_24;
  
  iStack_24 = *(int *)PTR____stack_chk_guard_004d9044;
  uVar11 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_104,"resultsContainer.BonusList");
  iVar2 = FUN_0039725c(uVar11,auStack_104);
  FUN_0030f7e0(auStack_104);
  uVar11 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_12c,"resultsContainer.BonusListFail");
  iVar3 = FUN_0039725c(uVar11,auStack_12c);
  FUN_0030f7e0(auStack_12c);
  if (iVar2 == 0) goto LAB_0006c938;
  iVar4 = FUN_0005edbc(PTR_DAT_004d9024);
  if (iVar4 != 1) {
    local_dc[0] = (uint)local_dc[0]._1_3_ << 8;
    FUN_0001da28(*(undefined4 *)(iVar2 + 0x260),local_dc);
    local_dc[0] = CONCAT31(local_dc[0]._1_3_,1);
    FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),local_dc);
    uVar11 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_3ec,"resultsContainer.Fail");
    iVar2 = FUN_0039725c(uVar11,auStack_3ec);
    FUN_0030f7e0(auStack_3ec);
    if (iVar2 != 0) {
      local_dc[0] = CONCAT31(local_dc[0]._1_3_,1);
      FUN_0001da28(*(undefined4 *)(iVar2 + 0x260),local_dc);
    }
    uVar11 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_414,"resultsContainer.Success");
    iVar2 = FUN_0039725c(uVar11,auStack_414);
    FUN_0030f7e0(auStack_414);
    if (iVar2 != 0) {
      local_dc[0] = local_dc[0] & 0xffffff00;
      FUN_0001da28(*(undefined4 *)(iVar2 + 0x260),local_dc);
    }
    uVar11 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_43c,"resultsContainer.textTotal");
    iVar2 = FUN_0039725c(uVar11,auStack_43c);
    FUN_0030f7e0(auStack_43c);
    if (iVar2 != 0) {
      local_dc[0] = local_dc[0] & 0xffffff00;
      FUN_0001da28(*(undefined4 *)(iVar2 + 0x260),local_dc);
    }
    uVar11 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_464,"@totalScore");
    iVar2 = FUN_0039725c(uVar11,auStack_464);
    FUN_0030f7e0(auStack_464);
    if (iVar2 != 0) {
      local_dc[0] = local_dc[0] & 0xffffff00;
      FUN_0001da28(*(undefined4 *)(iVar2 + 0x260),local_dc);
    }
    goto LAB_0006c938;
  }
  local_dc[0]._0_1_ = 1;
  FUN_0001da28(*(undefined4 *)(iVar2 + 0x260),local_dc);
  iVar4 = 0;
  local_dc[0] = (uint)local_dc[0]._1_3_ << 8;
  FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),local_dc);
  uVar11 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_154,"@totalScore");
  iVar3 = FUN_0039725c(uVar11,auStack_154);
  FUN_0030f7e0(auStack_154);
  do {
    uVar11 = FUN_000659a0(*(int *)(param_1 + 8) + 8,iVar4);
    FUN_0030f7cc(auStack_17c,(&DAT_00538c54)[iVar4]);
    iVar5 = FUN_0039725c(iVar2,auStack_1
/* ...截断... */
```

## FUN_000681e8 — 000681e8
命中: misscounters.cross@0041c5fb

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
       
/* ...截断... */
```

## FUN_0006e254 — 0006e254
命中: misscounters.cross@0041c5fb

```c

void FUN_0006e254(int param_1)

{
  undefined *puVar1;
  int *piVar2;
  int iVar3;
  uint uVar4;
  int iVar5;
  int iVar6;
  undefined4 uVar7;
  code *pcVar8;
  undefined8 uVar9;
  undefined8 uVar10;
  undefined1 auStack_270 [40];
  undefined1 auStack_248 [40];
  undefined1 auStack_220 [40];
  undefined4 local_1f8;
  undefined4 local_1f4;
  undefined4 local_1f0;
  undefined4 local_1ec;
  undefined1 auStack_1e8 [40];
  undefined1 auStack_1c0 [40];
  undefined1 auStack_198 [40];
  undefined1 auStack_170 [40];
  undefined1 auStack_148 [40];
  undefined1 auStack_120 [40];
  undefined1 auStack_f8 [40];
  undefined1 auStack_d0 [40];
  int local_a8;
  char acStack_a4 [128];
  int local_24;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  local_a8 = CONCAT31(local_a8._1_3_,1);
  FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 4) + 0x260),&local_a8);
  uVar7 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_d0,"@instructions");
  piVar2 = (int *)FUN_0039725c(uVar7,auStack_d0);
  FUN_0030f7e0(auStack_d0);
  if (piVar2 != (int *)0x0) {
    local_a8 = CONCAT31(local_a8._1_3_,1);
    FUN_0001da28(piVar2[0x98],&local_a8);
    FUN_0030f7cc(auStack_f8,*(int *)(param_1 + 8) + 0xa1);
    FUN_0030f7cc(auStack_120,"text");
    FUN_0030f870(auStack_148,auStack_f8);
    local_a8 = 0;
    FUN_000632ac(piVar2 + 0x28,auStack_120,&local_a8);
    FUN_00022950(*(undefined4 *)(piVar2[0x37] + local_a8 * 4),auStack_148);
    FUN_0030f7e0(auStack_148);
    FUN_0030f7e0(auStack_120);
    pcVar8 = *(code **)(*piVar2 + 0x40);
    FUN_0030f7cc(auStack_170,"transition_up");
    (*pcVar8)(piVar2,auStack_170,1);
    FUN_0030f7e0(auStack_170);
    FUN_0030f7e0(auStack_f8);
  }
  uVar7 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_198,"instructionsContainerLeft");
  iVar3 = FUN_0039725c(uVar7,auStack_198);
  FUN_0030f7e0(auStack_198);
  if (iVar3 != 0) {
    local_a8._0_1_ = 1;
    FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),&local_a8);
    FUN_00396d98(iVar3,1);
    uVar7 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_1c0,"instructionsContainerRight");
    iVar3 = FUN_0039725c(uVar7,auStack_1c0);
    FUN_0030f7e0(auStack_1c0);
    local_a8 = CONCAT31(local_a8._1_3_,1);
    FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),&local_a8);
    FUN_00396d98(iVar3,1);
  }
  uVar7 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_1e8,"@icon");
  iVar3 = FUN_0039725c(uVar7,auStack_1e8);
  FUN_0030f7e0(auStack_1e8);
  if (iVar3 != 0) {
    local_1f0 = 0x3e000000;
    local_1ec = 0x3e000000;
    FUN_0006bc4c(*(undefined4 *)(iVar3 + 0x748),&local_1f0);
    iVar6 = *(int *)(*(int *)(*(int *)(param_1 + 8) + 100) + 0x100);
    uVar4 = 0;
    if (iVar6 != 0) {
      uVar4 = *(uint *)(iVar6 + 0x44);
    }
    uVar10 = FixedToFP(CONCAT44(uVar4 >> 3,uVar4 >> 3),0,1,0,0x20);
    uVar9 = FixedToFP(CONCAT44(uVar4,uVar4) & 0x700000007,0,1,0,0x20);
    uVar10 = FloatVectorMult(uVar10,0x3e0000003e000000,2,0x20);
    uVar9 = FloatVectorMult(uVar9,0x3e0000003e000000,2,0x20);
    local_1f8 = (undefined4)uVar9;
    local_1f4 = (undefined4)uVar10;
    FUN_0006bc4c(local_1f4,*(undefined4 *)(iVar3 + 0x744),&local_1f8);
  }
  iVar3 = 1;
  do {
    _sprintf(acStack_a4,"@misscounters.cross%d",iVar3);
    uVar7 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_220,acStack_a4);
    iVar6 = FUN_0039725c(uVar7,auStack_220);
    FUN_0030f7e0(auStack_220);
    if (iVar6 != 0) {
      iVar5 = FUN_0001d10c(PTR_DAT_004d9048);
      local_a8 = CONCAT31(local_a8._1_3_,*(int *)(iVar5 + 0x4c) < iVar3);
      FUN_0001da28(*(undefined4 *)(iVar6 + 0x260),&local_a8);
    }
    iVar3 = iVar3 + 1;
  } while (iVar3 != 4);
  uVar7 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_248,"@scoreCounterTotal");
  iVar3 = FUN_0039725c(uVar7,auStack_248);
  FUN_0030f7e0(auStack_248);
  if (iVar3 != 0) {
    local_a8 = CONCAT31(local_a8._1_3_,1);
    FUN_0001da28(*(undefin
/* ...截断... */
```

## FUN_0007106c — 0007106c
命中: misscounters.cross@0041cd1d, misscounters.cross@0041cd6c, game_over_real@0041cd04

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
    uVar8 = FixedToFP(CONCAT44(
/* ...截断... */
```

## FUN_000713f4 — 000713f4
命中: misscounters.cross@0041cd1d

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
      fVar14 = *(fl
/* ...截断... */
```

## FUN_000705fc — 000705fc
命中: misscounters.cross@0041cd1d

```c

undefined4 FUN_000705fc(int param_1)

{
  int iVar1;
  int iVar2;
  undefined4 *puVar3;
  int iVar4;
  undefined4 uVar5;
  int iVar6;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined4 extraout_s3;
  undefined8 uVar7;
  undefined4 extraout_s3_00;
  undefined4 extraout_s5;
  undefined8 uVar8;
  undefined4 extraout_s7;
  undefined4 extraout_s9;
  undefined8 uVar9;
  undefined8 uVar10;
  undefined1 auStack_110 [4];
  float local_10c;
  undefined1 auStack_108 [40];
  undefined1 auStack_e0 [40];
  undefined1 local_b8 [4];
  char acStack_b4 [128];
  int local_34;
  
  local_34 = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0x44) = 1;
  uVar5 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_e0,"gameStartContainer");
  iVar1 = FUN_0039725c(uVar5,auStack_e0);
  FUN_0030f7e0(auStack_e0);
  if (iVar1 != 0) {
    local_b8[0] = 0;
    FUN_0001da28(*(undefined4 *)(iVar1 + 0x260),local_b8);
  }
  iVar1 = 0;
  do {
    iVar6 = iVar1 + 1;
    _sprintf(acStack_b4,"misscounters.cross%d",iVar6);
    uVar5 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_108,acStack_b4);
    iVar2 = FUN_0039725c(uVar5,auStack_108);
    uVar5 = FUN_0030f7e0(auStack_108);
    if (iVar2 != 0) {
      puVar3 = (undefined4 *)FUN_003d9438(iVar2);
      for (iVar4 = *(int *)(iVar2 + 0x608); *(int *)(iVar4 + 0x38) != 0;
          iVar4 = *(int *)(*(int *)(iVar4 + 0x38) + 4)) {
      }
      for (iVar2 = *(int *)(iVar2 + 0x60c); *(int *)(iVar2 + 0x38) != 0;
          iVar2 = *(int *)(*(int *)(iVar2 + 0x38) + 4)) {
      }
      uVar9 = FloatVectorMult(CONCAT44(extraout_s3,*(undefined4 *)(iVar4 + 0x48)),
                              CONCAT44(extraout_s1,DAT_000707c4),2,0x20);
      uVar10 = FloatVectorMult(CONCAT44(extraout_s9,*(undefined4 *)(iVar2 + 0x48)),
                               CONCAT44(extraout_s7,DAT_000707c4),2,0x20);
      uVar7 = FloatVectorAdd(uVar9,CONCAT44(extraout_s3,*puVar3),2);
      uVar8 = FloatVectorAdd(CONCAT44(extraout_s5,puVar3[2]),0,2);
      uVar9 = FloatVectorAdd(uVar10,CONCAT44(extraout_s1,puVar3[1]),2);
      iVar1 = param_1 + iVar1 * 0xc;
      *(int *)(iVar1 + 0x18) = (int)uVar7;
      *(int *)(iVar1 + 0x1c) = (int)uVar9;
      *(int *)(iVar1 + 0x20) = (int)uVar8;
      uVar5 = FUN_003ecb20((int)uVar9);
      FUN_003ed850(auStack_110,uVar5);
      uVar9 = CONCAT44(extraout_s1_00,DAT_000707c8 / local_10c);
      uVar7 = FloatVectorMult(uVar9,CONCAT44(extraout_s3_00,*(undefined4 *)(iVar1 + 0x18)),2,0x20);
      *(int *)(iVar1 + 0x18) = (int)uVar7;
      uVar7 = FloatVectorMult(uVar9,CONCAT44((int)((ulonglong)uVar7 >> 0x20),
                                             *(undefined4 *)(iVar1 + 0x1c)),2,0x20);
      *(int *)(iVar1 + 0x1c) = (int)uVar7;
      uVar9 = FloatVectorMult(uVar9,CONCAT44((int)((ulonglong)uVar7 >> 0x20),
                                             *(undefined4 *)(iVar1 + 0x20)),2,0x20);
      *(int *)(iVar1 + 0x20) = (int)uVar9;
      uVar5 = FUN_000251a8((int)uVar9);
      uVar9 = FloatVectorMult(CONCAT44(uVar5,uVar5),0x3f0000003f000000,2,0x20);
      uVar9 = FloatVectorSub(uVar9,CONCAT44(extraout_s1_01,*(undefined4 *)(iVar1 + 0x1c)),2,0x20);
      *(int *)(iVar1 + 0x1c) = (int)uVar9;
      uVar5 = FUN_00025164((int)uVar9);
      uVar9 = FloatVectorMult(CONCAT44(uVar5,uVar5),0x3f0000003f000000,2,0x20);
      uVar9 = FloatVectorSub(CONCAT44(extraout_s1_02,*(undefined4 *)(iVar1 + 0x18)),uVar9,2,0x20);
      uVar5 = (undefined4)uVar9;
      *(undefined4 *)(iVar1 + 0x18) = uVar5;
    }
    iVar1 = iVar6;
  } while (iVar6 != 3);
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_34) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return uVar5;
}


```

## FUN_0006fdc4 — 0006fdc4
命中: misscounters.cross@0041cd1d

```c

void FUN_0006fdc4(int param_1)

{
  int *piVar1;
  undefined4 uVar2;
  int iVar3;
  int *piVar4;
  int iVar5;
  undefined4 uVar6;
  code *pcVar7;
  int *piVar8;
  undefined8 uVar9;
  undefined8 uVar10;
  undefined1 auStack_180 [40];
  undefined1 auStack_158 [40];
  undefined1 auStack_130 [40];
  undefined1 auStack_108 [40];
  undefined1 auStack_e0 [40];
  undefined1 local_b8 [4];
  char acStack_b4 [128];
  int local_34;
  
  local_34 = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0x4c) = 0;
  uVar6 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_e0,"gameOverContainer");
  FUN_0039725c(uVar6,auStack_e0);
  FUN_0030f7e0(auStack_e0);
  iVar3 = 0;
  do {
    iVar5 = iVar3 + 1;
    _sprintf(acStack_b4,"misscounters.cross%d");
    uVar6 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_108,acStack_b4);
    piVar1 = (int *)FUN_0039725c(uVar6,auStack_108);
    uVar6 = FUN_0030f7e0(auStack_108);
    if (piVar1 != (int *)0x0) {
      local_b8[0] = 1;
      FUN_0001da28(piVar1[0x98],local_b8);
      pcVar7 = *(code **)(*piVar1 + 0x40);
      FUN_0030f7cc(auStack_130,"in");
      (*pcVar7)(piVar1,auStack_130,1);
      FUN_0030f7e0(auStack_130);
      piVar8 = piVar1 + 0xf3;
      if (piVar1[0xf5] == 0) {
        FUN_0003ca68(piVar8);
        *piVar8 = (int)piVar8;
        piVar1[0xf4] = (int)piVar8;
      }
      else {
        piVar4 = (int *)*piVar8;
        if (piVar4 != piVar8) {
          piVar4[0xb] = piVar1[0xf5];
          piVar4[0xc] = 2;
          piVar1[0xf6] = piVar1[0xf6] + 1;
          for (piVar4 = (int *)*piVar4; piVar4 != piVar8; piVar4 = (int *)*piVar4) {
            piVar4[0xb] = piVar1[0xf5];
            piVar4[0xc] = 2;
            piVar1[0xf6] = piVar1[0xf6] + 1;
          }
        }
      }
      uVar6 = FUN_00025164();
      uVar2 = FUN_000251a8();
      uVar9 = FloatVectorMult(CONCAT44(uVar6,uVar6),0x3f0000003f000000,2,0x20);
      uVar10 = FloatVectorMult(CONCAT44(uVar2,uVar2),0x3f0000003f000000,2,0x20);
      iVar3 = param_1 + iVar3 * 0xc;
      *(undefined4 *)(iVar3 + 0x20) = 0;
      uVar6 = (undefined4)uVar9;
      *(undefined4 *)(iVar3 + 0x18) = uVar6;
      *(int *)(iVar3 + 0x1c) = (int)uVar10;
    }
    iVar3 = iVar5;
  } while (iVar5 != 3);
  uVar2 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(uVar6,auStack_158,"score.bestScoreText");
  piVar1 = (int *)FUN_0039725c(uVar2,auStack_158);
  FUN_0030f7e0(auStack_158);
  if (piVar1 != (int *)0x0) {
    iVar3 = FUN_0001ca48();
    piVar1[0x220] = iVar3;
    FUN_003d0bf4(piVar1);
    FUN_00396d98(piVar1,1);
    pcVar7 = *(code **)(*piVar1 + 0x40);
    FUN_0030f7cc(auStack_180,"unbeaten");
    (*pcVar7)(piVar1,auStack_180,1);
    FUN_0030f7e0(auStack_180);
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_34) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00070e68 — 00070e68
命中: misscounters.cross@0041cd6c

```c

void FUN_00070e68(int param_1)

{
  undefined *puVar1;
  int *piVar2;
  int *piVar3;
  int *piVar4;
  code *pcVar5;
  undefined4 uVar6;
  undefined1 auStack_11c [40];
  undefined1 auStack_f4 [40];
  undefined **local_cc;
  undefined *local_c8;
  undefined1 local_ac;
  undefined1 local_a8 [4];
  char acStack_a4 [128];
  int local_24;
  
  puVar1 = PTR_DAT_004d9048;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  if (*(int *)(param_1 + 0x14) != 0) {
    *(int *)(param_1 + 0x14) = *(int *)(param_1 + 0x14) + -1;
    uVar6 = *(undefined4 *)(puVar1 + 0x1a4);
    local_ac = 1;
    local_cc = (undefined **)0x0;
    FUN_0000a298(&local_cc);
    local_ac = 0;
    local_cc = &PTR_LAB_0052bf38;
    local_c8 = PTR_FUN_004d9058;
    FUN_0002bc94(uVar6,"extra-life",0x3f800000,0x3f800000,&local_cc,0);
    FUN_0000a298(&local_cc);
    _sprintf(acStack_a4,"inGameClassic.misscounters.cross%d",*(int *)(param_1 + 0x14) + 1);
    uVar6 = FUN_003ecb20();
    FUN_0030f7cc(auStack_f4,acStack_a4);
    piVar2 = (int *)FUN_003f06d0(uVar6,auStack_f4);
    FUN_0030f7e0(auStack_f4);
    if (piVar2 != (int *)0x0) {
      local_a8[0] = 1;
      FUN_0001da28(piVar2[0x98],local_a8);
      piVar4 = piVar2 + 0xf3;
      if (piVar2[0xf5] == 0) {
        FUN_0003ca68(piVar4);
        *piVar4 = (int)piVar4;
        piVar2[0xf4] = (int)piVar4;
      }
      else {
        piVar3 = (int *)*piVar4;
        if (piVar3 != piVar4) {
          piVar3[0xb] = piVar2[0xf5];
          piVar3[0xc] = 2;
          piVar2[0xf6] = piVar2[0xf6] + 1;
          for (piVar3 = (int *)*piVar3; piVar3 != piVar4; piVar3 = (int *)*piVar3) {
            piVar3[0xb] = piVar2[0xf5];
            piVar3[0xc] = 2;
            piVar2[0xf6] = piVar2[0xf6] + 1;
          }
        }
      }
      pcVar5 = *(code **)(*piVar2 + 0x40);
      FUN_0030f7cc(auStack_11c,"in");
      (*pcVar5)(piVar2,auStack_11c,1);
      FUN_0030f7e0(auStack_11c);
    }
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 == local_24) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail(*(int *)PTR____stack_chk_guard_004d9044);
}


```

## FUN_000035e8 — 000035e8
命中: isGameOver@004182ae

```c

void FUN_000035e8(int param_1)

{
  char *pcVar1;
  char *pcVar2;
  char cVar3;
  bool bVar4;
  undefined *puVar5;
  undefined4 uVar6;
  int *piVar7;
  int iVar8;
  char *pcVar9;
  size_t sVar10;
  string *psVar11;
  char *pcVar12;
  int iVar13;
  char *pcVar14;
  char *pcVar15;
  undefined4 *puVar16;
  int iVar17;
  void *pvVar18;
  int iVar19;
  int *piVar20;
  int iVar21;
  undefined4 local_1bc;
  undefined4 local_1b8;
  int local_1b4;
  undefined4 local_1b0;
  undefined4 local_1ac;
  int local_1a8;
  allocator aaStack_1a4 [4];
  int local_1a0;
  undefined4 local_19c;
  undefined **local_198;
  undefined *local_194;
  undefined4 local_190 [8];
  undefined1 local_170;
  undefined4 local_16c;
  undefined4 local_168 [2];
  double local_160;
  char acStack_154 [256];
  undefined1 auStack_54 [17];
  char local_43;
  char local_42;
  undefined1 auStack_40 [22];
  char local_2a;
  char local_29;
  int local_24;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_00004f88(param_1,*(undefined4 *)(param_1 + 8));
  *(undefined4 *)(param_1 + 8) = 0;
  *(int *)(param_1 + 0xc) = param_1 + 4;
  *(int *)(param_1 + 0x10) = param_1 + 4;
  *(undefined4 *)(param_1 + 0x14) = 0;
  FUN_0001cdb4(local_168,"hud/hud_unlocked_dialog.tex");
  puVar5 = PTR_DAT_004d9030;
  FUN_00026e98(PTR_DAT_004d9030,local_168[0]);
  FUN_00026ed0(local_168);
  FUN_00026e98(PTR_DAT_004d9028,*(undefined4 *)puVar5);
  uVar6 = FUN_0036aa24();
  FUN_0036ab34(&local_16c,uVar6,"textures/hud/pointscircle.tex");
  FUN_00026e98(PTR_DAT_004d902c,local_16c);
  FUN_00026ed0(&local_16c);
  puVar5 = PTR_FUN_004d9020;
  uVar6 = FUN_00305d78();
  local_198 = &PTR_LAB_0052bee8;
  local_170 = 1;
  local_194 = puVar5;
  local_190[0] = 0;
  FUN_00004ef4(&local_198,local_190);
  FUN_00305c0c(uVar6,local_190);
  FUN_00004f58(local_190);
  piVar7 = operator_new(0x48);
  FUN_0030cda0(piVar7,"xml/achievementList.xml");
  if (piVar7 != (int *)0x0) {
    iVar8 = FUN_0030ceac(piVar7,0);
    if (iVar8 == 1) {
      uVar6 = FUN_0030c328(piVar7,"achievementManagerFile");
      iVar8 = FUN_0030c328(uVar6,"achievement");
      if (iVar8 != 0) {
        do {
          pcVar9 = (char *)FUN_0030c660(iVar8,"id");
          sVar10 = _strlen(pcVar9);
          local_19c = FUN_002f69c4(pcVar9,sVar10);
          if ((byte)(*pcVar9 - 0x30U) < 10) {
            psVar11 = (string *)FUN_00004990(param_1 + 0x144,&local_19c);
            pcVar12 = (char *)FUN_0030c660(iVar8,"social_id");
            std::string::string((string *)&local_1a0,pcVar12,aaStack_1a4);
            std::string::assign(psVar11);
            if ((allocator *)(local_1a0 + -0xc) != (allocator *)PTR__S_empty_rep_storage_004d9038) {
              piVar20 = (int *)(local_1a0 + -4);
              DataMemoryBarrier(0x1b);
              do {
                ExclusiveAccess(piVar20);
                iVar13 = *piVar20;
                bVar4 = (bool)hasExclusiveAccess(piVar20);
              } while (!bVar4);
              *piVar20 = iVar13 + -1;
              DataMemoryBarrier(0x1b);
              if (iVar13 < 1) {
                std::string::_Rep::_M_destroy((allocator *)(local_1a0 + -0xc));
              }
            }
          }
          iVar13 = FUN_00027800(*(undefined4 *)(PTR_DAT_004d9048 + 0x5c),local_19c);
          if (iVar13 == 1) goto LAB_00003c30;
          pcVar14 = operator_new(0xac);
          pcVar12 = pcVar14 + 0x84;
          pcVar12[0] = '\0';
          pcVar12[1] = '\0';
          pcVar12[2] = '\0';
          pcVar12[3] = '\0';
          FUN_00026e98(pcVar12,0);
          pcVar14[0xa8] = '\0';
          pcVar14[0xa9] = '\0';
          pcVar14[0xaa] = '\0';
          pcVar14[0xab] = '\0';
          pcVar1 = pcVar14 + 0x8c;
          pcVar1[0] = '\0';
          pcVar1[1] = '\0';
          pcVar1[2] = '\0';
          pcVar1[3] = '\0';
          pcVar14[0x90] = '\0';
          pcVar14[0x91] = '\0';
/* ...截断... */
```

## FUN_00070050 — 00070050
命中: game_over_real@0041cd04

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

/* ...截断... */
```

## FUN_0002447c — 0002447c
命中: life-lose@00419585

```c

void FUN_0002447c(void)

{
  undefined *puVar1;
  undefined4 *puVar2;
  int iVar3;
  char acStack_a4 [128];
  int local_24;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  puVar2 = (undefined4 *)FUN_0030a1d8();
  (**(code **)*puVar2)(puVar2,"achievement");
  (**(code **)*puVar2)(puVar2,"act-change");
  (**(code **)*puVar2)(puVar2,"bean-collect");
  (**(code **)*puVar2)(puVar2,"bean-lp");
  (**(code **)*puVar2)(puVar2,"blade-bean-1");
  (**(code **)*puVar2)(puVar2,"blade-bean-2");
  (**(code **)*puVar2)(puVar2,"blade-bean-3");
  (**(code **)*puVar2)(puVar2,"blade-bean-4");
  (**(code **)*puVar2)(puVar2,"blade-bean-5");
  (**(code **)*puVar2)(puVar2,"blade-fire-1");
  (**(code **)*puVar2)(puVar2,"blade-fire-2");
  (**(code **)*puVar2)(puVar2,"blade-fire-3");
  (**(code **)*puVar2)(puVar2,"blade-fire-4");
  (**(code **)*puVar2)(puVar2,"blade-fire-5");
  (**(code **)*puVar2)(puVar2,"blade-fire-6");
  (**(code **)*puVar2)(puVar2,"blade-fire-7");
  (**(code **)*puVar2)(puVar2,"blade-fire-impact-1");
  (**(code **)*puVar2)(puVar2,"blade-fire-impact-2");
  (**(code **)*puVar2)(puVar2,"blade-fire-impact-3");
  (**(code **)*puVar2)(puVar2,"blade-fire-impact-4");
  (**(code **)*puVar2)(puVar2,"blade-fire-impact-5");
  (**(code **)*puVar2)(puVar2,"blade-guitar-hit-1");
  (**(code **)*puVar2)(puVar2,"blade-guitar-hit-2");
  (**(code **)*puVar2)(puVar2,"blade-guitar-hit-3");
  (**(code **)*puVar2)(puVar2,"blade-guitar-hit-4");
  (**(code **)*puVar2)(puVar2,"blade-paw-1");
  (**(code **)*puVar2)(puVar2,"blade-paw-2");
  (**(code **)*puVar2)(puVar2,"blade-paw-3");
  (**(code **)*puVar2)(puVar2,"blade-paw-cut-1");
  (**(code **)*puVar2)(puVar2,"blade-paw-cut-2");
  (**(code **)*puVar2)(puVar2,"blade-paw-cut-3");
  (**(code **)*puVar2)(puVar2,"bomb-bounce");
  (**(code **)*puVar2)(puVar2,"Bomb-explode");
  (**(code **)*puVar2)(puVar2,"Bomb-Fuse");
  (**(code **)*puVar2)(puVar2,"Bonus-drum-roll");
  (**(code **)*puVar2)(puVar2,"Bonus-Explosion-1");
  (**(code **)*puVar2)(puVar2,"Bonus-Explosion-3");
  (**(code **)*puVar2)(puVar2,"Bonus-Explosion-5");
  (**(code **)*puVar2)(puVar2,"bonus");
  (**(code **)*puVar2)(puVar2,"bounce-1");
  (**(code **)*puVar2)(puVar2,"bounce-2");
  (**(code **)*puVar2)(puVar2,"bounce-3");
  (**(code **)*puVar2)(puVar2,"button-press");
  (**(code **)*puVar2)(puVar2,"challenge-cross");
  (**(code **)*puVar2)(puVar2,"challenge-pass");
  (**(code **)*puVar2)(puVar2,"challenge-tick");
  (**(code **)*puVar2)(puVar2,"Clean-Slice-1");
  (**(code **)*puVar2)(puVar2,"Clean-Slice-2");
  (**(code **)*puVar2)(puVar2,"Clean-Slice-3");
  (**(code **)*puVar2)(puVar2,"coconut-bounce");
  (**(code **)*puVar2)(puVar2,"Combo");
  (**(code **)*puVar2)(puVar2,"count-1");
  (**(code **)*puVar2)(puVar2,"count-2");
  (**(code **)*puVar2)(puVar2,"count-3");
  (**(code **)*puVar2)(puVar2,"count-complete");
  (**(code **)*puVar2)(puVar2,"count-display");
  (**(code **)*puVar2)(puVar2,"Critical");
  (**(code **)*puVar2)(puVar2,"equip-new-sword");
  (**(code **)*puVar2)(puVar2,"equip-new-wallpaper");
  (**(code **)*puVar2)(puVar2,"equip-unlock");
  (**(code **)*puVar2)(puVar2,"extra-life");
  (**(code **)*puVar2)(puVar2,"final-score");
  (**(code **)*puVar2)(puVar2,"fruit-spawn");
  (**(code **)*puVar2)(puVar2,"Game-over");
  (**(code **)*puVar2)(puVar2,"Game-start");
  (**(code **)*puVar2)(puVar2,"gank");
  (**(code **)*puVar2)(puVar2,"hatch-close");
  (**(code **)*puVar2)(puVar2,"hatch-open");
  (**(code **)*puVar2)(puVar2,"Impact-Apple");
  (**(code **)*puVar2)(puVar2,"Impact-Banana");
  (**(code **)*puVar2)(puVar2,"Impact-Coconut-More-Attack");
  (**(code **)*puVar2)(puVar2,"Impact-Coconut");
  (**(code **)*puVar2)(puVar2,"Impact-kiwifruit");
  (**(code **)*puVar2)(puVar2,"Impact-Orange");
  (**(code **)*puVar2)(puVar2,"Impact-Pineapple");
  (**(code **)*puVar2)(puVar2,"Impact-Plum");
  (**(code **)*p
/* ...截断... */
```

## FUN_0006d80c — 0006d80c
命中: life_trigger@0041cb97

(反编译未完成)

## FUN_0006daf4 — 0006daf4
命中: life_trigger@0041cb97

```c

void FUN_0006daf4(int param_1,int param_2)

{
  undefined *puVar1;
  int iVar2;
  undefined1 *puVar3;
  char *pcVar4;
  int *piVar5;
  code *pcVar6;
  undefined4 uVar7;
  undefined1 auStack_114 [40];
  undefined1 auStack_ec [40];
  undefined1 auStack_c4 [40];
  undefined1 auStack_9c [40];
  undefined1 auStack_74 [40];
  undefined1 auStack_4c [40];
  int local_24;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  puVar3 = auStack_114;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0xc) = *(undefined4 *)(param_2 + 0x1d4);
  *(undefined4 *)(param_1 + 0x10) = *(undefined4 *)(param_2 + 0x1d8);
  *(undefined4 *)(param_1 + 0x14) = *(undefined4 *)(param_2 + 0x1dc);
  *(undefined4 *)(param_1 + 0x18) = *(undefined4 *)(param_2 + 0x1e0);
  FUN_0006d5c8(param_1);
  *(undefined4 *)(param_1 + 0x1c) = *(undefined4 *)(param_2 + 0x1c8);
  *(undefined4 *)(param_1 + 0x30) = *(undefined4 *)(param_2 + 0x1cc);
  FUN_0006d13c(*(undefined4 *)(param_1 + 0x2c),*(undefined4 *)(param_2 + 0x1e4));
  if (*(int *)(param_1 + 0x1c) == 2) {
    piVar5 = *(int **)(param_1 + 4);
    pcVar6 = *(code **)(*piVar5 + 0x40);
    FUN_0030f7cc(auStack_114,"animate_out");
    (*pcVar6)(piVar5,auStack_114,1);
  }
  else {
    if (*(int *)(param_1 + 0x1c) != 0) goto LAB_0006dc64;
    iVar2 = *(int *)(param_1 + 0x30);
    if (iVar2 == 3) {
      FUN_00396d98(*(undefined4 *)(param_1 + 4),1);
      piVar5 = *(int **)(param_1 + 4);
      pcVar6 = *(code **)(*piVar5 + 0x40);
      FUN_0030f7cc(auStack_c4,"animate_trigger_setup");
      (*pcVar6)(piVar5,auStack_c4,1);
      FUN_0030f7e0(auStack_c4);
      piVar5 = *(int **)(param_1 + 0x2c);
      puVar3 = auStack_ec;
      pcVar6 = *(code **)(*piVar5 + 0x40);
      pcVar4 = "score_trigger";
    }
    else if (iVar2 == 2) {
      FUN_00396d98(*(undefined4 *)(param_1 + 4),1);
      piVar5 = *(int **)(param_1 + 4);
      pcVar6 = *(code **)(*piVar5 + 0x40);
      FUN_0030f7cc(auStack_74,"animate_trigger_setup");
      (*pcVar6)(piVar5,auStack_74,1);
      FUN_0030f7e0(auStack_74);
      (**(code **)(**(int **)(param_1 + 0x2c) + 0xbc))
                (*(int **)(param_1 + 0x2c),*(undefined4 *)(param_1 + 0xc));
      piVar5 = *(int **)(param_1 + 0x2c);
      puVar3 = auStack_9c;
      pcVar6 = *(code **)(*piVar5 + 0x40);
      pcVar4 = "animate_trigger";
    }
    else {
      if (iVar2 != 1) goto LAB_0006dc64;
      FUN_00396d98(*(undefined4 *)(param_1 + 4),1);
      (**(code **)(**(int **)(param_1 + 0x2c) + 0xbc))
                (*(int **)(param_1 + 0x2c),
                 *(int *)(param_1 + 0xc) - *(int *)(param_1 + 0x18) * *(int *)(param_1 + 0x14));
      piVar5 = *(int **)(param_1 + 4);
      puVar3 = auStack_4c;
      pcVar6 = *(code **)(*piVar5 + 0x40);
      pcVar4 = "life_trigger";
    }
    FUN_0030f7cc(puVar3,pcVar4);
    (*pcVar6)(piVar5,puVar3,1);
  }
  FUN_0030f7e0(puVar3);
LAB_0006dc64:
  uVar7 = *(undefined4 *)(param_2 + 0x1d0);
  *(undefined4 *)(param_1 + 0x20) = uVar7;
  FUN_00397e7c(uVar7,*(undefined4 *)(param_1 + 4),uVar7,0);
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0006d5c8 — 0006d5c8
命中: @lifeScore@0041cb85

```c

void FUN_0006d5c8(int param_1)

{
  undefined *puVar1;
  int iVar2;
  int iVar3;
  int *piVar4;
  undefined4 uVar5;
  undefined1 auStack_1a4 [40];
  undefined1 local_17c [4];
  undefined1 auStack_178 [40];
  undefined1 auStack_150 [40];
  undefined1 auStack_128 [40];
  undefined1 auStack_100 [40];
  undefined1 auStack_d8 [40];
  undefined1 auStack_b0 [40];
  undefined1 local_88 [4];
  undefined1 auStack_84 [32];
  undefined1 auStack_64 [64];
  int local_24;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0x30) = 0;
  uVar5 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_b0,"scoreContainer");
  iVar2 = FUN_0039725c(uVar5,auStack_b0);
  FUN_0030f7e0(auStack_b0);
  local_88[0] = 1;
  FUN_0001da28(*(undefined4 *)(iVar2 + 0x260),local_88);
  uVar5 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_d8,"@finaleScore");
  iVar2 = FUN_0039725c(uVar5,auStack_d8);
  FUN_0030f7e0(auStack_d8);
  if (iVar2 != 0) {
    FUN_002f702c(auStack_64,0x40,"%i",*(undefined4 *)(param_1 + 0x10));
    FUN_0030f7cc(auStack_100,auStack_64);
    FUN_00022950(*(undefined4 *)(iVar2 + 0x7dc),auStack_100);
    FUN_0030f7e0(auStack_100);
  }
  *(int *)(param_1 + 0x24) = iVar2;
  iVar2 = 1;
  do {
    FUN_002f702c(auStack_84,0x20,"%s%i","@lifeScore",iVar2);
    uVar5 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_128,auStack_84);
    iVar3 = FUN_0039725c(uVar5,auStack_128);
    FUN_0030f7e0(auStack_128);
    if (iVar3 != 0) {
      if (iVar2 + -1 < *(int *)(param_1 + 0x14)) {
        local_88[0] = 1;
        FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),local_88);
        *(int *)(param_1 + 0x28) = iVar3;
      }
      else {
        local_88[0] = 0;
        FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),local_88);
      }
    }
    FUN_002f702c(auStack_84,0x20,"%s%i","@cross",iVar2);
    uVar5 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_150,auStack_84);
    iVar3 = FUN_0039725c(uVar5,auStack_150);
    FUN_0030f7e0(auStack_150);
    if (iVar3 != 0) {
      local_88[0] = iVar2 + -1 < *(int *)(param_1 + 0x14);
      FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),local_88);
    }
    iVar2 = iVar2 + 1;
  } while (iVar2 != 4);
  uVar5 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_178,"@scoreCounterTotal");
  piVar4 = (int *)FUN_0039725c(uVar5,auStack_178);
  FUN_0030f7e0(auStack_178);
  if (piVar4 != (int *)0x0) {
    (**(code **)(*piVar4 + 0xbc))
              (piVar4,(*(int *)(param_1 + 0xc) - *(int *)(param_1 + 0x10)) -
                      *(int *)(param_1 + 0x14) * *(int *)(param_1 + 0x18));
    FUN_0007daa8(piVar4);
    FUN_0007d9e8(piVar4);
    if (*(int *)(param_1 + 0x10) == 0) {
      local_17c[0] = 0;
      FUN_0030f7cc(auStack_1a4,"animate_trigger");
      FUN_0007d958(piVar4,0,auStack_1a4,local_17c);
      FUN_0030f7e0(auStack_1a4);
    }
  }
  puVar1 = PTR____stack_chk_guard_004d9044;
  *(int **)(param_1 + 0x2c) = piVar4;
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00071ad4 — 00071ad4
命中: @beanExtraLife@0041cdc0

```c

void FUN_00071ad4(void)

{
  int iVar1;
  undefined4 uVar2;
  int iVar3;
  undefined1 auStack_c8 [40];
  undefined1 auStack_a0 [40];
  undefined1 auStack_78 [40];
  undefined1 auStack_50 [40];
  undefined1 local_28 [4];
  int local_24;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  iVar1 = FUN_0001cfb0(*(undefined4 *)(PTR_DAT_004d9048 + 0x654),"inGameClassic",1);
  local_28[0] = 1;
  FUN_0001da28(*(undefined4 *)(iVar1 + 0x260),local_28);
  FUN_0030f7cc(auStack_50,"popups.combo");
  uVar2 = FUN_0039725c(iVar1,auStack_50);
  FUN_0030f7e0(auStack_50);
  iVar3 = 3;
  do {
    FUN_00074428(uVar2,iVar3);
    iVar3 = iVar3 + 1;
  } while (iVar3 != 10);
  if (((DAT_005a86e0 & 1) == 0) && (iVar3 = ___cxa_guard_acquire(&DAT_005a86e0), iVar3 != 0)) {
    FUN_0030f7cc(&DAT_005a870c,"labelTop");
    ___cxa_atexit(PTR_FUN_004d9034,&DAT_005a870c,PTR___mh_execute_header_004d9040);
    ___cxa_guard_release(&DAT_005a86e0);
  }
  FUN_0030f7cc(auStack_78,"@beanPlus25");
  iVar3 = FUN_0039725c(iVar1,auStack_78);
  FUN_0030f7e0(auStack_78);
  if ((iVar3 != 0) && (iVar3 = FUN_0039725c(iVar3,&DAT_005a870c), iVar3 != 0)) {
    FUN_003d184c();
  }
  FUN_0030f7cc(auStack_a0,"@beanExtraLife");
  iVar3 = FUN_0039725c(iVar1,auStack_a0);
  FUN_0030f7e0(auStack_a0);
  if ((iVar3 != 0) && (iVar3 = FUN_0039725c(iVar3,&DAT_005a870c), iVar3 != 0)) {
    FUN_003d184c();
  }
  FUN_0030f7cc(auStack_c8,"@critical");
  iVar3 = FUN_0039725c(iVar1,auStack_c8);
  FUN_0030f7e0(auStack_c8);
  if ((iVar3 != 0) && (iVar3 = FUN_0039725c(iVar3,&DAT_005a870c), iVar3 != 0)) {
    FUN_003d184c();
  }
  FUN_0001cfac(*(undefined4 *)(PTR_DAT_004d9048 + 0x654),"inGameClassic",0,0);
  local_28[0] = 0;
  FUN_0001da28(*(undefined4 *)(iVar1 + 0x260),local_28);
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0006fc88 — 0006fc88
命中: @beanExtraLife@0041cdc0

```c

void FUN_0006fc88(int param_1,int param_2)

{
  undefined *puVar1;
  undefined4 uVar2;
  int iVar3;
  int iVar4;
  undefined1 auStack_10c [40];
  undefined1 auStack_e4 [40];
  undefined1 auStack_bc [40];
  undefined1 auStack_94 [40];
  undefined1 auStack_6c [40];
  undefined1 auStack_44 [32];
  int local_24;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  if (param_2 != 0) {
    FUN_0030f7cc(auStack_6c,"@combo");
    uVar2 = FUN_0039725c(param_2,auStack_6c);
    *(undefined4 *)(param_1 + 0x18) = uVar2;
    FUN_0030f7e0(auStack_6c);
    if (*(int *)(param_1 + 0x18) != 0) {
      FUN_00066a00(param_1 + 4);
    }
    FUN_0030f7cc(auStack_94,"@beanPlus25");
    uVar2 = FUN_0039725c(param_2,auStack_94);
    *(undefined4 *)(param_1 + 0x20) = uVar2;
    FUN_0030f7e0(auStack_94);
    if (*(int *)(param_1 + 0x20) != 0) {
      FUN_00066a00(param_1 + 4);
    }
    FUN_0030f7cc(auStack_bc,"@beanExtraLife");
    uVar2 = FUN_0039725c(param_2,auStack_bc);
    *(undefined4 *)(param_1 + 0x1c) = uVar2;
    FUN_0030f7e0(auStack_bc);
    if (*(int *)(param_1 + 0x1c) != 0) {
      FUN_00066a00(param_1 + 4);
    }
    FUN_0030f7cc(auStack_e4,"@critical");
    uVar2 = FUN_0039725c(param_2,auStack_e4);
    *(undefined4 *)(param_1 + 0x24) = uVar2;
    FUN_0030f7e0(auStack_e4);
    if (*(int *)(param_1 + 0x24) != 0) {
      FUN_00066a00(param_1 + 4);
    }
    iVar3 = 0;
    do {
      iVar4 = iVar3 + 1;
      FUN_002f702c(auStack_44,0x20,"@cross%i",iVar4);
      FUN_0030f7cc(auStack_10c,auStack_44);
      uVar2 = FUN_0039725c(param_2,auStack_10c);
      *(undefined4 *)(param_1 + 0x28 + iVar3 * 4) = uVar2;
      FUN_0030f7e0(auStack_10c);
      iVar3 = iVar4;
    } while (iVar4 != 3);
  }
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

