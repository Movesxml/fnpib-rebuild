# 字符串定位报告（立即数扫描）

- 程序: FruitNinjaPuss
- 已定义函数: 27857
- 命中函数: 42，裸引用点(未纳入函数): 1

## FUN_000035e8 — 000035e8
命中: combo@00418318, combo@0041831e, score@0041829b, score@004182d3, score@004182d9, achiev@00418239, achiev@00418250, achiev@00418287

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
  local_198 = &PTR_LAB_0000498c_1_0052bee8;
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
          pcVar14[0x
/* ...截断... */
```

## FUN_0006c2b4 — 0006c2b4
命中: combo@00418983, slash@00418958, slash@00418960

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

## FUN_00016214 — 00016214
命中: combo@00418983, slash@00418958, slash@00418960

```c

void FUN_00016214(int param_1,float param_2)

{
  bool bVar1;
  char cVar2;
  byte bVar3;
  longlong lVar4;
  float fVar5;
  undefined *puVar6;
  undefined *puVar7;
  undefined *puVar8;
  undefined *puVar9;
  float fVar10;
  int iVar11;
  undefined4 uVar12;
  int *piVar13;
  int iVar14;
  size_t sVar15;
  uint uVar16;
  int extraout_r1;
  int extraout_r1_00;
  int *extraout_r2;
  int *piVar17;
  int iVar18;
  uint uVar19;
  undefined4 uVar20;
  undefined4 *puVar21;
  float fVar22;
  float extraout_s0;
  float extraout_s0_00;
  undefined4 extraout_s0_01;
  undefined4 extraout_s0_02;
  ulonglong uVar23;
  ulonglong uVar24;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined4 extraout_s1_03;
  undefined4 extraout_s1_04;
  undefined4 extraout_s1_05;
  undefined4 extraout_s1_06;
  undefined4 uVar25;
  undefined4 extraout_s1_07;
  undefined4 extraout_s1_08;
  undefined4 extraout_s1_09;
  undefined4 extraout_s1_10;
  float extraout_s3;
  undefined4 extraout_s3_00;
  undefined4 extraout_s3_01;
  undefined4 extraout_s3_02;
  undefined4 extraout_s3_03;
  undefined4 extraout_s3_04;
  undefined4 extraout_s3_05;
  undefined4 uVar26;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  undefined4 extraout_s5_01;
  undefined4 extraout_s5_02;
  undefined4 extraout_s5_03;
  undefined4 extraout_s5_04;
  undefined4 extraout_s5_05;
  undefined4 extraout_s5_06;
  undefined4 uVar27;
  undefined4 extraout_s5_07;
  undefined4 extraout_s5_08;
  undefined4 extraout_s7;
  undefined4 extraout_s7_00;
  undefined4 extraout_s7_01;
  undefined4 extraout_s7_02;
  undefined4 extraout_s7_03;
  undefined4 extraout_s7_04;
  undefined4 extraout_s7_05;
  undefined4 extraout_s9;
  undefined4 extraout_s9_00;
  undefined4 extraout_s9_01;
  undefined4 uVar28;
  undefined4 extraout_s11;
  undefined4 extraout_s11_00;
  undefined4 extraout_s11_01;
  float fVar29;
  undefined8 uVar30;
  undefined8 unaff_d11;
  float fVar31;
  undefined8 uVar32;
  undefined8 uVar33;
  undefined8 uVar34;
  undefined8 uVar35;
  undefined8 uVar36;
  undefined4 local_fc;
  undefined4 local_f8;
  undefined4 local_f4;
  undefined4 local_f0;
  undefined4 local_ec;
  undefined4 local_e8;
  undefined4 local_e4;
  undefined4 local_e0;
  undefined4 local_dc;
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
  char acStack_a4 [64];
  int local_64;
  
  puVar7 = PTR_DAT_004d9048;
  puVar6 = PTR____stack_chk_guard_004d9044;
  local_64 = *(int *)PTR____stack_chk_guard_004d9044;
  fVar29 = *(float *)(PTR_DAT_004d9048 + 0x44);
  fVar10 = param_2;
  if (param_2 != 0.0) {
    fVar10 = fVar29;
  }
  uVar30 = CONCAT44(fVar10,param_2);
  FUN_0001702c(param_1);
  uVar23 = 0;
  if (param_2 != 0.0) {
    uVar23 = (ulonglong)(uint)fVar29;
  }
  uVar24 = uVar23;
  fVar10 = extraout_s3;
  if (*(char *)(param_1 + 0x50) != '\0') {
    uVar33 = CONCAT44(extraout_s5,*(undefined4 *)(param_1 + 0xc4));
    uVar35 = FloatVectorMult((ulonglong)*(uint *)(param_1 + 0xc0),
                             (ulonglong)*(uint *)(param_1 + 0xc0),2,0x20);
    uVar32 = CONCAT44(extraout_s3,*(undefined4 *)(param_1 + 200));
    uVar33 = FloatVectorMult(uVar33,uVar33,2,0x20);
    uVar32 = FloatVectorMult(uVar32,uVar32,2,0x20);
    uVar33 = FloatVectorAdd(uVar35,uVar33,2);
    uVar32 = FloatVectorAdd(uVar33,uVar32,2);
    fVar10 = (float)FUN_00301044((int)uVar32);
    uVar24 = 0x3f8000003f800000;
    if (fVar10 / 15.0 <= 1.0) {
      uVar32 = CONCAT44(0x3f800000,*(undefined4 *)(param_1 + 0xc0));
      uVar33 = CONCAT44(extraout_s5_00,*(undefined4 *)(param_1 + 0xc4));
      uVar35 
/* ...截断... */
```

## FUN_0006cae0 — 0006cae0
命中: combo@0041942c

```c

void FUN_0006cae0(int param_1,int param_2)

{
  undefined *puVar1;
  undefined *puVar2;
  int *piVar3;
  int iVar4;
  code *pcVar5;
  int iVar6;
  undefined4 uVar7;
  undefined **local_98;
  undefined *local_94;
  undefined1 local_78;
  undefined1 auStack_74 [40];
  undefined1 auStack_4c [40];
  int local_24;
  
  puVar2 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0x14) = 0;
  if (param_2 == 0) {
    FUN_00020698(1,1);
  }
  uVar7 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_4c,"resultsContainer");
  piVar3 = (int *)FUN_0039725c(uVar7,auStack_4c);
  iVar4 = FUN_0030f7e0(auStack_4c);
  if (piVar3 != (int *)0x0) {
    iVar4 = piVar3[0x13];
  }
  if (piVar3 != (int *)0x0 && iVar4 != 0) {
    for (iVar4 = piVar3[0x98]; *(int *)(iVar4 + 0x38) != 0;
        iVar4 = *(int *)(*(int *)(iVar4 + 0x38) + 4)) {
    }
    if (*(char *)(iVar4 + 0x48) != '\0') {
      pcVar5 = *(code **)(*piVar3 + 0x40);
      FUN_0030f7cc(auStack_74,"animate_trigger");
      (*pcVar5)(piVar3,auStack_74,1);
      FUN_0030f7e0(auStack_74);
    }
  }
  puVar1 = PTR_DAT_004d9024;
  iVar4 = FUN_0005edbc(PTR_DAT_004d9024);
  iVar6 = *(int *)(PTR_DAT_004d9048 + 0x1a4);
  if ((iVar6 != 0) && (iVar4 == 1 && param_2 == 0)) {
    local_78 = 1;
    local_98 = (undefined **)0x0;
    FUN_0000a298(&local_98);
    local_78 = 0;
    local_98 = &PTR_LAB_00009c18_1_0052bf38;
    local_94 = PTR_FUN_004d9058;
    FUN_0002bb34(iVar6,"Combo",0x3f800000,0x3f800000,&local_98,0);
    FUN_0000a298(&local_98);
  }
  iVar4 = FUN_0005edbc(puVar1);
  uVar7 = 1;
  if (iVar4 != 1) {
    uVar7 = 2;
  }
  *(undefined4 *)(param_1 + 0x10) = uVar7;
  if (*(int *)puVar2 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0002447c — 0002447c
命中: combo@0041942c, critical@004185c6, blade@004191b4, blade@004191c1, blade@004191ce, blade@004191db, blade@004191e8, blade@004191f5, achiev@00418250

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

## FUN_00010bec — 00010bec
命中: critical@004185c6

```c

void FUN_00010bec(int param_1,int param_2,undefined4 param_3,undefined4 param_4,undefined4 *param_5)

{
  char cVar1;
  byte bVar2;
  longlong lVar3;
  bool bVar4;
  undefined *puVar5;
  undefined *puVar6;
  undefined *puVar7;
  undefined2 uVar8;
  int iVar9;
  int iVar10;
  undefined4 uVar11;
  uint uVar12;
  int iVar13;
  float fVar14;
  float *pfVar15;
  undefined4 uVar16;
  int *piVar17;
  size_t sVar18;
  uint uVar19;
  undefined1 uVar20;
  uint uVar21;
  undefined4 uVar22;
  int iVar23;
  undefined4 *puVar24;
  uint *puVar25;
  int *piVar26;
  int *piVar27;
  undefined4 extraout_s0;
  undefined4 extraout_s0_00;
  undefined4 extraout_s1;
  undefined8 uVar29;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined4 extraout_s1_03;
  undefined4 extraout_s1_04;
  undefined4 extraout_s1_05;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  undefined4 extraout_s3_01;
  undefined4 extraout_s3_02;
  undefined4 extraout_s3_03;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  undefined4 extraout_s5_01;
  undefined4 extraout_s5_02;
  undefined4 extraout_s5_03;
  undefined4 extraout_s5_04;
  undefined8 uVar30;
  undefined8 uVar31;
  undefined4 local_180;
  undefined4 local_17c;
  undefined4 local_178;
  undefined4 local_174;
  undefined4 local_170;
  undefined4 local_16c;
  undefined4 local_168;
  undefined4 local_164;
  undefined4 local_160;
  undefined4 local_15c;
  undefined4 local_158;
  undefined4 local_154;
  undefined1 local_150;
  undefined1 local_14f;
  undefined1 local_14e;
  undefined1 local_14d;
  undefined4 local_14c;
  undefined4 local_148;
  undefined4 local_144;
  undefined1 local_140;
  undefined1 local_13f;
  undefined1 local_13e;
  undefined1 local_13d;
  undefined4 local_13c;
  undefined4 local_138;
  undefined4 local_134;
  undefined **local_130;
  undefined *local_12c;
  undefined4 local_128 [8];
  undefined1 local_108;
  undefined **local_104;
  undefined *local_100;
  undefined4 local_fc [8];
  undefined1 local_dc;
  undefined **local_d8;
  undefined *local_d4;
  undefined4 local_d0 [8];
  undefined1 local_b0;
  char acStack_ac [128];
  int local_2c;
  uint *puVar28;
  
  puVar6 = PTR_DAT_004d9048;
  puVar5 = PTR____stack_chk_guard_004d9044;
  local_2c = *(int *)PTR____stack_chk_guard_004d9044;
  uVar20 = 1;
  if ((*(char *)(param_1 + 0x1bc) != '\0') || (uVar20 = 1, -1.0 < *(float *)(param_1 + 0x104)))
  goto LAB_00011caa;
  if (0.0 < *(float *)(param_1 + 0xac)) {
    uVar20 = 0;
    *(undefined1 *)(param_1 + 0x1ba) = 0;
    goto LAB_00011caa;
  }
  iVar9 = FUN_0001d10c();
  if (((iVar9 != 0) &&
      (iVar10 = FUN_00063fe0(PTR_DAT_004d907c,*(undefined4 *)PTR_DAT_004d9090), iVar10 == 1)) &&
     (iVar10 = FUN_0005edbc(PTR_DAT_004d9024), iVar10 == 0)) {
    uVar11 = FUN_000065c4();
    uVar12 = FUN_00006a84(uVar11,2);
    puVar7 = PTR_DAT_004d9050;
    if (0 < (int)uVar12) {
      do {
        lVar3 = (ulonglong)*(uint *)puVar7 * (ulonglong)*(uint *)(puVar7 + 8);
        uVar19 = (uint)lVar3;
        iVar10 = *(int *)(puVar7 + 4) * *(uint *)(puVar7 + 8) +
                 *(uint *)puVar7 * *(int *)(puVar7 + 0xc) + (int)((ulonglong)lVar3 >> 0x20);
        lVar3 = CONCAT44(iVar10,uVar19);
        uVar21 = *(int *)(puVar7 + 0x14) + iVar10 + (uint)CARRY4(uVar19,*(uint *)(puVar7 + 0x10));
        *(uint *)puVar7 = uVar19 + *(uint *)(puVar7 + 0x10);
        *(uint *)(puVar7 + 4) = uVar21;
        if (uVar12 != 0 && uVar12 != 0xffffffff) {
          lVar3 = (ulonglong)uVar21 * (ulonglong)uVar12;
          uVar21 = (uint)((ulonglong)lVar3 >> 0x20);
        }
        uVar11 = FUN_000065c4((int)((ulonglong)lVar3 >> 0x20),(int)lVar3);
        iVar10 = FUN_00006aa4(uVar11,2,uVar21);
      } while (iVar10 == 0);
      uVar11 = FUN_00052f80();
      iVar13 = FUN_00057000(uVar11,1,*(undefined1 *)(param_1 + 0x3c),0,0);
      *(undefined4
/* ...截断... */
```

## FUN_0001267c — 0001267c
命中: critical@004186ab, score@0041829b, bomb@00418454

```c

void FUN_0001267c(void)

{
  char cVar1;
  undefined4 *puVar2;
  int iVar3;
  undefined4 uVar4;
  int *piVar5;
  char *pcVar6;
  int iVar7;
  byte *pbVar8;
  undefined4 extraout_r0;
  undefined4 extraout_r0_00;
  ulong uVar9;
  char *pcVar10;
  size_t sVar11;
  int iVar12;
  undefined4 *puVar13;
  void *pvVar14;
  uint uVar15;
  undefined4 extraout_r1;
  undefined4 extraout_r1_00;
  uint uVar16;
  int iVar17;
  char *pcVar18;
  int *piVar19;
  bool bVar20;
  undefined8 uVar21;
  int local_b8;
  int local_b4 [7];
  undefined4 local_98;
  undefined4 local_94;
  int local_90 [4];
  undefined4 local_80;
  undefined4 local_7c;
  double local_78;
  double local_70;
  char acStack_64 [64];
  int local_24;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  if (DAT_005d4cdc == (char *)0x0) {
    DAT_00556d30 = operator_new(0x14);
    *DAT_00556d30 = 0;
    DAT_00556d30[1] = 0;
    DAT_00556d30[2] = 0;
    DAT_00556d30[3] = 0;
    DAT_00556d30[4] = 0;
    FUN_00014b04();
    puVar2 = operator_new(0x14);
    *puVar2 = "-";
    FUN_00014c70(puVar2,100);
    DAT_00556d34 = puVar2;
    iVar3 = FUN_000260f0();
    if (iVar3 == 1) {
      uVar4 = FUN_0036aa24();
      FUN_0036ab34(&local_7c,uVar4,"textures/effects/fruit_shadow.tex");
      FUN_00026e98(&DAT_00556ca0,local_7c);
      FUN_00026ed0(&local_7c);
      uVar4 = FUN_0036aa24();
      FUN_0036ab34(&local_80,uVar4,"textures/effects/menuFruitShadow.tex");
      FUN_00026e98(0x556ca4,local_80);
      FUN_00026ed0(&local_80);
    }
    piVar5 = operator_new(0x48);
    FUN_0030cda0(piVar5,"xml/fruitlist.xml");
    if (piVar5 != (int *)0x0) {
      iVar3 = FUN_0030ceac(piVar5,0);
      if (iVar3 == 1) {
        uVar4 = FUN_0030c328(piVar5,"fruitInfoFile");
        iVar3 = FUN_0030c328(uVar4,"critical");
        if (iVar3 != 0) {
          pcVar6 = (char *)FUN_0030c660(iVar3,"colour");
          cVar1 = '\0';
          if (pcVar6 != (char *)0x0) {
            cVar1 = *pcVar6;
          }
          if (pcVar6 != (char *)0x0 && cVar1 != '\0') {
            local_90[3] = DAT_004711ac;
            local_90[0] = DAT_004711a0;
            local_90[1] = DAT_004711a4;
            local_90[2] = DAT_004711a8;
            iVar17 = 0;
            do {
              iVar7 = _atoi(pcVar6);
              local_90[iVar17] = iVar7;
              pcVar10 = pcVar6;
              do {
                pcVar6 = pcVar10 + 1;
                cVar1 = *pcVar10;
                pcVar10 = pcVar6;
              } while (cVar1 != ',' && cVar1 != '\0');
            } while ((cVar1 != '\0') && (iVar17 = iVar17 + 1, iVar17 < 4));
            DAT_005d4cd4._2_1_ = (undefined1)local_90[0];
            DAT_005d4cd4._1_1_ = (undefined1)local_90[1];
            DAT_005d4cd4._0_1_ = (undefined1)local_90[2];
            DAT_005d4cd4._3_1_ = (undefined1)local_90[3];
          }
          FUN_0030c6c0(iVar3,"new_life_at",&DAT_0052bf78);
          FUN_0030c6c0(iVar3,"score",&DAT_0052bf64);
          FUN_0030c6c0(iVar3,"chance",&DAT_0052bf68);
          FUN_0030c6c0(iVar3,"chance_inc",&DAT_0052bf6c);
          FUN_0030c6c0(iVar3,"splats",&DAT_0052bf54);
          iVar17 = FUN_0030c718(iVar3,"scale",&local_70);
          if (iVar17 == 0) {
            DAT_0052bf58 = (float)local_70;
          }
          iVar17 = FUN_0030c718(iVar3,"spread",&local_70);
          if (iVar17 == 0) {
            DAT_0052bf5c = (float)local_70;
          }
          iVar3 = FUN_0030c718(iVar3,"disappear_speed",&local_78);
          if (iVar3 == 0) {
            DAT_0052bf60 = (float)local_78;
          }
        }
        iVar3 = FUN_0030c328(uVar4,"bomb");
        if (iVar3 != 0) {
          uVar21 = FUN_0030c660(iVar3,"size");
          uVar15 = (uint)((ulonglong)uVar21 >> 0x20);
          pbVar8 = (byte *)uVar21;
          if (pbVar8 != (byte *)0x0) {
            uVar15 = (uint)*pbVar8;
          }
          if (pbVar8 != 
/* ...截断... */
```

## FUN_000292e0 — 000292e0
命中: critical@00419be6, wave@00419ae8, wave@00419b1f, wave@00419b29, wave@00419b9c, highscore@00419bdc, score@0041829b

```c

void FUN_000292e0(int param_1)

{
  char cVar1;
  void *pvVar2;
  undefined4 uVar3;
  void *pvVar4;
  void *pvVar5;
  char *pcVar6;
  void *pvVar7;
  void *pvVar8;
  float *pfVar9;
  char *pcVar10;
  char *pcVar11;
  char *pcVar12;
  int iVar13;
  _Rb_tree_node_base *p_Var14;
  int *piVar15;
  int *piVar16;
  int iVar17;
  bool bVar18;
  undefined4 extraout_s1;
  undefined4 extraout_s3;
  undefined8 uVar19;
  undefined4 local_1f0;
  undefined1 auStack_1ec [72];
  undefined1 auStack_1a4 [128];
  char local_124 [128];
  undefined1 auStack_a4 [64];
  char acStack_64 [64];
  int local_24;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_000278ec(param_1);
  FUN_0030cd24(auStack_1ec);
  pvVar2 = operator_new(0x50);
  FUN_0030c410(pvVar2,"save_file");
  uVar3 = FUN_0002611c();
  iVar13 = 0;
  FUN_0030c828(pvVar2,0,"version",uVar3);
  _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0x40));
  FUN_0030c81c(pvVar2,0,"highscore",acStack_64);
  do {
    uVar3 = FUN_000254b0(iVar13);
    FUN_002f702c(auStack_a4,0x40,"%shighscore",uVar3);
    iVar17 = param_1 + iVar13 * 4;
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(iVar17 + 0x44));
    FUN_0030c81c(pvVar2,0,auStack_a4,acStack_64);
    if (0 < *(int *)(iVar17 + 0x4c)) {
      uVar3 = FUN_000254b0(iVar13);
      FUN_002f702c(auStack_a4,0x40,"%s_unposted",uVar3);
      _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(iVar17 + 0x4c));
      FUN_0030c81c(pvVar2,0,auStack_a4,acStack_64);
    }
    uVar3 = FUN_000254b0(iVar13);
    FUN_002f702c(auStack_a4,0x40,"%s_dolg",uVar3);
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(iVar17 + 0x2dc));
    FUN_0030c81c(pvVar2,0,auStack_a4,acStack_64);
    iVar13 = iVar13 + 1;
  } while (iVar13 != 2);
  _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0x100));
  FUN_0030c81c(pvVar2,0,"critical_chance",acStack_64);
  pcVar6 = "false";
  if (*(char *)(param_1 + 0x32) != '\0') {
    pcVar6 = "true";
  }
  FUN_0030c828(pvVar2,0,"rated",pcVar6);
  pcVar6 = "false";
  if (*(char *)(param_1 + 0x3c) != '\0') {
    pcVar6 = "true";
  }
  FUN_0030c828(pvVar2,0,"p2pCancelled",pcVar6);
  _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(PTR_DAT_004d9048 + 0x1ac));
  FUN_0030c81c(pvVar2,0,"appLicensedState",acStack_64);
  FUN_0030c22c(auStack_1ec,pvVar2);
  p_Var14 = *(_Rb_tree_node_base **)(param_1 + 0xc);
  if (p_Var14 != (_Rb_tree_node_base *)(param_1 + 4)) {
    do {
      pvVar4 = operator_new(0x50);
      FUN_0030c410(pvVar4,"total");
      FUN_0030c81c(pvVar4,0,"type",p_Var14 + 0x14);
      _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(p_Var14 + 0x58));
      FUN_0030c81c(pvVar4,0,"score",acStack_64);
      FUN_0030c22c(pvVar2,pvVar4);
      p_Var14 = (_Rb_tree_node_base *)std::_Rb_tree_increment(p_Var14);
    } while (p_Var14 != (_Rb_tree_node_base *)(param_1 + 4));
  }
  p_Var14 = *(_Rb_tree_node_base **)(param_1 + 0x24);
  pvVar4 = operator_new(0x50);
  if (p_Var14 != (_Rb_tree_node_base *)(param_1 + 0x1c)) {
    do {
      FUN_0030c410(pvVar4,"total");
      FUN_0030c828(pvVar4,0,"u","true");
      FUN_0030c81c(pvVar4,0,"type",p_Var14 + 0x14);
      _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(p_Var14 + 0x58));
      FUN_0030c81c(pvVar4,0,"score",acStack_64);
      FUN_0030c22c(pvVar2,pvVar4);
      p_Var14 = (_Rb_tree_node_base *)std::_Rb_tree_increment(p_Var14);
      pvVar4 = operator_new(0x50);
    } while (p_Var14 != (_Rb_tree_node_base *)(param_1 + 0x1c));
  }
  FUN_0030c410(pvVar4,"que");
  for (p_Var14 = *(_Rb_tree_node_base **)(param_1 + 0x274);
      p_Var14 != (_Rb_tree_node_base *)(param_1 + 0x26c);
      p_Var14 = (_Rb_tree_node_base *)std::_Rb_tree_increment(p_Var14)) {
    pvVar5 = operator_new(0x50);
    FUN_0030c410(pvVar5,"ach");
    FUN_0030c81c(pvVar5,0,"name",p_Var14 + 0x14);
    FUN_0030c770(pvVar5,"time",SUB84((double)*(float *)(p_Var14 + 0x94),0),
                 (int)((ulonglong)(double
/* ...截断... */
```

## FUN_00028350 — 00028350
命中: critical@00419be6, highscore@00419bdc, score@0041829b, bomb@00418454

```c

void FUN_00028350(int param_1,int param_2)

{
  int *piVar1;
  char cVar2;
  bool bVar3;
  undefined *puVar4;
  uint uVar5;
  int iVar6;
  undefined4 uVar7;
  int iVar8;
  undefined4 *puVar9;
  size_t sVar10;
  byte *pbVar11;
  undefined4 extraout_r0;
  char *pcVar12;
  _List_node_base *p_Var13;
  undefined4 extraout_r1;
  undefined1 uVar14;
  int iVar15;
  byte *pbVar16;
  undefined8 uVar17;
  undefined4 local_178;
  undefined4 local_174;
  undefined4 local_170;
  undefined4 local_16c;
  undefined4 local_168;
  undefined4 local_164;
  undefined4 local_160;
  undefined4 local_15c;
  undefined4 local_158;
  undefined4 local_154;
  undefined4 local_150;
  undefined4 local_14c;
  undefined4 local_148;
  undefined4 local_144;
  undefined4 local_140;
  undefined4 local_13c;
  undefined4 local_138;
  undefined4 local_134;
  undefined4 local_130;
  undefined4 local_12c;
  undefined4 local_128;
  undefined4 local_124;
  undefined4 local_120;
  undefined4 local_11c;
  undefined4 local_118;
  undefined4 local_114;
  undefined4 local_110;
  undefined1 local_10c;
  int local_108;
  undefined1 auStack_104 [4];
  undefined4 local_100;
  float local_fc;
  float local_f8;
  undefined4 *local_f4;
  double local_f0;
  char acStack_e4 [128];
  undefined1 auStack_64 [64];
  int local_24;
  
  puVar4 = PTR_DAT_004d9048;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  PTR_DAT_004d9048[0x1b1] = 0;
  *(undefined1 *)(*(int *)(puVar4 + 0x5c) + 0x31) = 0;
  if (*(int *)(param_1 + 0x14) == 1) {
    uVar5 = *(uint *)(param_1 + 0x20);
    pbVar16 = (byte *)(uVar5 + 8);
    if (pbVar16 != (byte *)0x0) {
      uVar5 = (uint)*pbVar16;
    }
    if (pbVar16 != (byte *)0x0 && uVar5 != 0) {
      iVar6 = _strcmp((char *)pbVar16,"save_file");
      if (iVar6 == 0) {
        FUN_0030c660(param_1,"version");
        uVar7 = FUN_000282c4();
        *(undefined4 *)(param_2 + 0x2d4) = uVar7;
        FUN_0030c6c0(param_1,"highscore",param_2 + 0x40);
        FUN_0030c6c0(param_1,"critical_chance",param_2 + 0x100);
        FUN_0030c6c0(param_1,"appLicensedState",PTR_DAT_004d9048 + 0x1ac);
        pcVar12 = (char *)FUN_0030c660(param_1,"rated");
        uVar14 = 0;
        if (((pcVar12 != (char *)0x0) && (uVar14 = 0, *pcVar12 != '\0')) &&
           (iVar6 = _strcmp(pcVar12,"true"), iVar6 == 0)) {
          uVar14 = 1;
        }
        *(undefined1 *)(param_2 + 0x32) = uVar14;
        pcVar12 = (char *)FUN_0030c660(param_1,"p2pCancelled");
        uVar14 = 0;
        if (((pcVar12 != (char *)0x0) && (uVar14 = 0, *pcVar12 != '\0')) &&
           (iVar6 = _strcmp(pcVar12,"true"), iVar6 == 0)) {
          uVar14 = 1;
        }
        *(undefined1 *)(param_2 + 0x3c) = uVar14;
        iVar15 = param_2 + 0x2dc;
        *(undefined4 *)(param_2 + 0x44) = *(undefined4 *)(param_2 + 0x40);
        iVar6 = 0;
        do {
          uVar7 = FUN_000254b0(iVar6);
          FUN_002f702c(auStack_64,0x40,"%shighscore",uVar7);
          FUN_0030c6c0(param_1,auStack_64,iVar15 + -0x298);
          uVar7 = FUN_000254b0(iVar6);
          FUN_002f702c(auStack_64,0x40,"%s_unposted",uVar7);
          FUN_0030c6c0(param_1,auStack_64,iVar15 + -0x290);
          uVar7 = FUN_000254b0(iVar6);
          FUN_002f702c(auStack_64,0x40,"%s_dolg",uVar7);
          FUN_0030c6c0(param_1,auStack_64,iVar15);
          iVar6 = iVar6 + 1;
          iVar15 = iVar15 + 4;
        } while (iVar6 != 2);
      }
      else {
        iVar6 = _strcmp((char *)pbVar16,"que");
        if (iVar6 == 0) {
          FUN_000281c8(param_1,param_2,1);
        }
        else {
          iVar6 = _strcmp((char *)pbVar16,"challengeData");
          if (iVar6 == 0) {
            FUN_00028b20(param_2 + 0x13c,param_1);
          }
          else {
            iVar6 = _strcmp((char *)pbVar16,"challengeDataPersistent");
            if (iVar6 == 0) {
              FUN_00028ffc(param_2 + 0x13c,param_1);
   
/* ...截断... */
```

## FUN_00053cb8 — 00053cb8
命中: critical@0041a7bf

```c

void FUN_00053cb8(int param_1,undefined4 param_2,int param_3)

{
  undefined4 *puVar1;
  float *pfVar2;
  float *pfVar3;
  float *pfVar4;
  float *pfVar5;
  float *pfVar6;
  float *pfVar7;
  float *pfVar8;
  float *pfVar9;
  float *pfVar10;
  float *pfVar11;
  float *pfVar12;
  undefined1 *puVar13;
  byte *pbVar14;
  char cVar15;
  int *piVar16;
  undefined1 uVar17;
  byte bVar18;
  int *piVar19;
  int iVar20;
  int iVar21;
  int iVar22;
  int iVar23;
  int *piVar24;
  void *pvVar25;
  undefined4 *puVar26;
  int iVar27;
  size_t sVar28;
  ulong uVar29;
  undefined4 uVar30;
  int *piVar31;
  undefined4 *puVar32;
  uint uVar33;
  uint uVar34;
  undefined4 *puVar35;
  char *pcVar36;
  string *psVar37;
  string *this;
  undefined4 *puVar38;
  string *psVar39;
  bool bVar40;
  undefined4 extraout_s1;
  undefined4 extraout_s3;
  undefined8 uVar41;
  int local_50;
  int local_48;
  int *local_44;
  double local_40;
  double local_38;
  double local_30;
  
  piVar19 = operator_new(0x48);
  FUN_0030cda0(piVar19,param_2);
  if (piVar19 != (int *)0x0) {
    iVar20 = FUN_0030ceac(piVar19,0);
    if (iVar20 == 1) {
      FUN_0030c328(piVar19,"waveManagerFile");
      iVar20 = FUN_0030c300();
      iVar21 = param_1 + param_3 * 0x40;
      pfVar2 = (float *)(iVar21 + 0xe0);
      *pfVar2 = 0.0;
      piVar31 = (int *)(iVar21 + 0xe8);
      *piVar31 = 0;
      puVar32 = (undefined4 *)(iVar21 + 0xec);
      *puVar32 = 0xffffffff;
      puVar38 = (undefined4 *)(iVar21 + 0xb0);
      *puVar38 = 10;
      pfVar3 = (float *)(iVar21 + 0xb4);
      *pfVar3 = 0.25;
      pfVar4 = (float *)(iVar21 + 0xb8);
      *pfVar4 = 1.0;
      pfVar5 = (float *)(iVar21 + 0xbc);
      *pfVar5 = 1.0;
      pfVar6 = (float *)(iVar21 + 0xc0);
      *pfVar6 = 0.0;
      pfVar7 = (float *)(iVar21 + 0xc4);
      *pfVar7 = 0.0;
      pfVar8 = (float *)(iVar21 + 0xd0);
      *pfVar8 = 0.0;
      pfVar9 = (float *)(iVar21 + 0xd4);
      *pfVar9 = 0.0;
      pfVar10 = (float *)(iVar21 + 0xd8);
      *pfVar10 = 0.0;
      pfVar11 = (float *)(iVar21 + 200);
      *pfVar11 = 2.0;
      pfVar12 = (float *)(iVar21 + 0xcc);
      *pfVar12 = 0.0;
      puVar35 = (undefined4 *)(iVar21 + 0xe4);
      *puVar35 = 100;
      puVar13 = (undefined1 *)(iVar21 + 0xdc);
      *puVar13 = 1;
      pbVar14 = (byte *)(iVar21 + 0xdd);
      *pbVar14 = 1;
      if (iVar20 != 0) {
        iVar22 = param_1 + param_3 * 4;
        local_50 = 0;
        do {
          pcVar36 = (char *)(*(int *)(iVar20 + 0x20) + 8);
          iVar23 = _strcmp(pcVar36,"WaveInfo");
          if (iVar23 == 0) {
            piVar24 = operator_new(0xc4);
            FUN_00058ee4(piVar24,puVar38);
            piVar24[0x2a] = local_50;
            local_48 = -1;
            local_44 = piVar24;
            FUN_0030c6c0(iVar20,"waveNo",&local_48);
            if (-1 < local_48) {
              *local_44 = local_48;
            }
            FUN_0030c6c0(iVar20,"overideProbabiltyPool",local_44 + 0x2c);
            pcVar36 = (char *)FUN_0030c660(iVar20,"until");
            cVar15 = '\0';
            if (pcVar36 != (char *)0x0) {
              cVar15 = *pcVar36;
            }
            if (pcVar36 != (char *)0x0 && cVar15 != '\0') {
              iVar23 = _strcmp(pcVar36,"forever");
              if (iVar23 == 0) {
                local_44[1] = -2;
              }
              else {
                iVar23 = _atoi(pcVar36);
                if ((-1 < iVar23) && (*local_44 <= iVar23)) {
                  local_44[1] = iVar23;
                }
              }
            }
            local_48 = -1;
            FUN_0030c6c0(iVar20,"chance",&local_48);
            piVar24 = local_44;
            if (-1 < local_48) {
              local_44[0x1f] = local_48;
            }
            iVar23 = FUN_0030c718(iVar20,"criticalChance",&local_30);
            piVar16 = local_44;
            if (iVar
/* ...截断... */
```

## FUN_00027f24 — 00027f24
命中: wave@00419ae8, wave@00419b1f, wave@00419b29, wave@00419b9c

```c

undefined4 FUN_00027f24(undefined4 param_1,int param_2)

{
  undefined4 ***pppuVar1;
  undefined1 uVar2;
  int iVar3;
  undefined4 uVar4;
  char *pcVar5;
  int iVar6;
  int iVar7;
  _List_node_base *p_Var8;
  int iVar9;
  undefined4 ***pppuVar10;
  undefined1 auStack_58 [4];
  float local_54;
  undefined4 **local_50;
  undefined4 **local_4c;
  float local_48;
  undefined1 auStack_44 [4];
  undefined4 local_40;
  undefined4 local_3c;
  undefined4 local_38;
  undefined4 local_34;
  undefined4 local_30;
  undefined4 local_2c;
  double local_28;
  
  FUN_0030c6c0(param_1,"waveCount",param_2 + 0x248);
  FUN_0030c6c0(param_1,"numberOfWavesSpawned",param_2 + 0x24c);
  FUN_0030c6c0(param_1,"numberOfWavesSinceReset",param_2 + 0x250);
  iVar3 = FUN_0030c718(param_1,"waveDelay",&local_28);
  if (iVar3 == 0) {
    *(float *)(param_2 + 0x254) = (float)local_28;
  }
  iVar3 = FUN_0030c718(param_1,"waveWait",&local_28);
  if (iVar3 == 0) {
    *(float *)(param_2 + 600) = (float)local_28;
  }
  FUN_0030c6c0(param_1,"blitzSpawnedThisGame",param_2 + 0x298);
  FUN_0030c6c0(param_1,"blitzForceSpawnedCounter",param_2 + 0x29c);
  iVar3 = FUN_0030c718(param_1,"blitzSpawnTime",&local_28);
  if (iVar3 == 0) {
    *(float *)(param_2 + 0x2a0) = (float)local_28;
  }
  uVar4 = FUN_0030c660(param_1,"beanStartPos");
  FUN_000394a0(&local_34,uVar4);
  *(undefined4 *)(param_2 + 0x11c) = local_34;
  *(undefined4 *)(param_2 + 0x120) = local_30;
  *(undefined4 *)(param_2 + 0x124) = local_2c;
  uVar4 = FUN_0030c660(param_1,"beanEndPos");
  FUN_000394a0(&local_40,uVar4);
  *(undefined4 *)(param_2 + 0x128) = local_40;
  *(undefined4 *)(param_2 + 300) = local_3c;
  *(undefined4 *)(param_2 + 0x130) = local_38;
  iVar3 = FUN_0030c718(param_1,"beanTime",&local_28);
  if (iVar3 == 0) {
    *(float *)(param_2 + 0x134) = (float)local_28;
  }
  pcVar5 = (char *)FUN_0030c660(param_1,"beanVisible");
  uVar2 = 1;
  if ((pcVar5 != (char *)0x0) && (uVar2 = 1, *pcVar5 != '\0')) {
    iVar3 = _strcmp(pcVar5,"false");
    uVar2 = 0;
    if (iVar3 != 0) {
      uVar2 = 1;
    }
  }
  iVar9 = param_2 + 0x260;
  *(undefined1 *)(param_2 + 0x138) = uVar2;
  FUN_00022bb4(iVar9);
  *(int *)(param_2 + 0x260) = iVar9;
  *(int *)(param_2 + 0x264) = iVar9;
  iVar3 = FUN_0030c328(param_1,"wave");
  if (iVar3 != 0) {
    do {
      local_50 = &local_50;
      local_4c = &local_50;
      iVar6 = FUN_0030c718(iVar3,"inc",&local_28);
      if (iVar6 == 0) {
        local_48 = (float)local_28;
      }
      FUN_0030c6c0(iVar3,"index",auStack_44);
      for (iVar6 = FUN_0030c328(iVar3,"spawner"); iVar6 != 0; iVar6 = FUN_0030c3a0(iVar6,"spawner"))
      {
        iVar7 = FUN_0030c718(iVar6,"delay",&local_28);
        if (iVar7 == 0) {
          local_54 = (float)local_28;
        }
        FUN_0030c6c0(iVar6,"toSpawn",auStack_58);
        FUN_00023104(&local_50,&local_50,auStack_58);
      }
      p_Var8 = (_List_node_base *)FUN_000230b0(iVar9,&local_50);
      std::_List_node_base::hook(p_Var8);
      pppuVar1 = (undefined4 ***)local_50;
      while (pppuVar1 != &local_50) {
        pppuVar10 = (undefined4 ***)*pppuVar1;
        operator_delete(pppuVar1);
        pppuVar1 = pppuVar10;
      }
      iVar3 = FUN_0030c3a0(iVar3,"wave");
    } while (iVar3 != 0);
  }
  return 1;
}


```

## FUN_0002a878 — 0002a878
命中: score@0041829b

```c

void FUN_0002a878(int param_1,undefined4 param_2)

{
  int *piVar1;
  void *pvVar2;
  void *pvVar3;
  int *piVar4;
  undefined1 auStack_e4 [128];
  char acStack_64 [64];
  int local_24;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  if (*(char *)(param_1 + 0x38) != '\0') {
    pvVar2 = operator_new(0x50);
    FUN_0030c410(pvVar2,"challengeData");
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0x3c));
    FUN_0030c81c(pvVar2,0,"state",acStack_64);
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0x40));
    FUN_0030c81c(pvVar2,0,"currentChallenge",acStack_64);
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0x44));
    FUN_0030c81c(pvVar2,0,"uistate",acStack_64);
    FUN_0030c770(pvVar2,"uiTime",SUB84((double)*(float *)(param_1 + 0x48),0),
                 (int)((ulonglong)(double)*(float *)(param_1 + 0x48) >> 0x20));
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0x4c));
    FUN_0030c81c(pvVar2,0,"uimapstate",acStack_64);
    FUN_0030c770(pvVar2,"uimapTime",SUB84((double)*(float *)(param_1 + 0x50),0),
                 (int)((ulonglong)(double)*(float *)(param_1 + 0x50) >> 0x20));
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0x58));
    FUN_0030c81c(pvVar2,0,"quickShotState",acStack_64);
    FUN_0030c770(pvVar2,"quickShotTime",SUB84((double)*(float *)(param_1 + 0x54),0),
                 (int)((ulonglong)(double)*(float *)(param_1 + 0x54) >> 0x20));
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0x5c));
    FUN_0030c81c(pvVar2,0,"comboPoints",acStack_64);
    FUN_0030c770(pvVar2,"challengeTime",SUB84((double)*(float *)(param_1 + 0x60),0),
                 (int)((ulonglong)(double)*(float *)(param_1 + 0x60) >> 0x20));
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 100));
    FUN_0030c81c(pvVar2,0,"challengeFruit",acStack_64);
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0x68));
    FUN_0030c81c(pvVar2,0,"lastRoundScore",acStack_64);
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0x6c));
    FUN_0030c81c(pvVar2,0,"score",acStack_64);
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0x70));
    FUN_0030c81c(pvVar2,0,"fails",acStack_64);
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0x74));
    FUN_0030c81c(pvVar2,0,"resultMenuState",acStack_64);
    FUN_0030c770(pvVar2,"resultMenuTime",SUB84((double)*(float *)(param_1 + 0x78),0),
                 (int)((ulonglong)(double)*(float *)(param_1 + 0x78) >> 0x20));
    FUN_0030c770(pvVar2,"resultDisplayScore",SUB84((double)*(float *)(param_1 + 0x7c),0),
                 (int)((ulonglong)(double)*(float *)(param_1 + 0x7c) >> 0x20));
    FUN_0030c770(pvVar2,"resultDisplayScoreTotal",SUB84((double)*(float *)(param_1 + 0x80),0),
                 (int)((ulonglong)(double)*(float *)(param_1 + 0x80) >> 0x20));
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0x84));
    FUN_0030c81c(pvVar2,0,"instructMenuState",acStack_64);
    FUN_0030c770(pvVar2,"instructMenuTime",SUB84((double)*(float *)(param_1 + 0x88),0),
                 (int)((ulonglong)(double)*(float *)(param_1 + 0x88) >> 0x20));
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0x8c));
    FUN_0030c81c(pvVar2,0,"finaleScreenState",acStack_64);
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0x90));
    FUN_0030c81c(pvVar2,0,"finaleScreenTotalState",acStack_64);
    FUN_0030c770(pvVar2,"finaleScreenTime",SUB84((double)*(float *)(param_1 + 0x94),0),
                 (int)((ulonglong)(double)*(float *)(param_1 + 0x94) >> 0x20));
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0x98));
    FUN_0030c81c(pvVar2,0,"finaleScreenFinalTotal",acStack_64);
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0x9c));
    FUN_0030c81c(pvVar2,0,"finaleScreenFinalRoundScore",acStack_64);
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0xa0));
    FUN_00
/* ...截断... */
```

## FUN_00211268 — 00211268
命中: score@0041829b

```c

void FUN_00211268(int *param_1,LeagueFeedUser *param_2)

{
  bool bVar1;
  int iVar2;
  int *piVar3;
  int iVar4;
  int *piVar5;
  char *pcVar6;
  undefined4 uVar7;
  int iVar8;
  undefined *local_44;
  undefined *local_40;
  undefined *local_3c;
  undefined1 local_38;
  undefined4 local_34;
  uint local_30;
  undefined4 local_2c;
  
  iVar2 = (**(code **)(*param_1 + 0x4c))(param_1);
  if ((iVar2 == 1) && (iVar2 = (**(code **)(*param_1 + 0x90))(param_1), iVar2 != 0)) {
    iVar8 = 0;
    do {
      piVar3 = (int *)(**(code **)(*param_1 + 0x8c))(param_1,iVar8);
      iVar4 = (**(code **)(*piVar3 + 0x4c))(piVar3);
      if (iVar4 == 1) {
        local_44 = PTR__S_empty_rep_storage_004d9038 + 0xc;
        local_38 = 0;
        local_34 = 0;
        local_30 = 0;
        local_2c = 0;
        local_40 = local_44;
        local_3c = local_44;
        piVar5 = (int *)(**(code **)(*piVar3 + 0x130))(piVar3,"displayName");
        iVar4 = (**(code **)(*piVar5 + 0x44))();
        if (iVar4 == 1) {
          piVar5 = (int *)(**(code **)(*piVar3 + 0x130))(piVar3,"displayName");
          pcVar6 = (char *)(**(code **)(*piVar5 + 0x60))(piVar5,"");
          _strlen(pcVar6);
          std::string::assign((char *)&local_44,(ulong)pcVar6);
        }
        piVar5 = (int *)(**(code **)(*piVar3 + 0x130))(piVar3,"score");
        iVar4 = (**(code **)(*piVar5 + 0x40))();
        if (iVar4 == 0) {
          piVar5 = (int *)(**(code **)(*piVar3 + 0x130))(piVar3,"score");
          iVar4 = (**(code **)(*piVar5 + 0x44))();
          if (iVar4 == 1) goto LAB_002113ec;
        }
        else {
LAB_002113ec:
          piVar5 = (int *)(**(code **)(*piVar3 + 0x130))(piVar3,"score");
          local_34 = (**(code **)(*piVar5 + 0x6c))(piVar5,0);
        }
        piVar5 = (int *)(**(code **)(*piVar3 + 0x130))(piVar3,"countryId");
        iVar4 = (**(code **)(*piVar5 + 0x44))();
        if (iVar4 == 1) {
          piVar5 = (int *)(**(code **)(*piVar3 + 0x130))(piVar3,"countryId");
          pcVar6 = (char *)(**(code **)(*piVar5 + 0x60))(piVar5,"");
          _strlen(pcVar6);
          std::string::assign((char *)&local_40,(ulong)pcVar6);
        }
        piVar5 = (int *)(**(code **)(*piVar3 + 0x130))(piVar3,"leagueId");
        iVar4 = (**(code **)(*piVar5 + 0x44))();
        if (iVar4 == 1) {
          piVar5 = (int *)(**(code **)(*piVar3 + 0x130))(piVar3,"leagueId");
          pcVar6 = (char *)(**(code **)(*piVar5 + 0x60))(piVar5,"");
          _strlen(pcVar6);
          std::string::assign((char *)&local_3c,(ulong)pcVar6);
        }
        piVar5 = (int *)(**(code **)(*piVar3 + 0x130))(piVar3,"type");
        iVar4 = (**(code **)(*piVar5 + 0x44))();
        if (iVar4 == 1) {
          piVar3 = (int *)(**(code **)(*piVar3 + 0x130))(piVar3,"type");
          uVar7 = (**(code **)(*piVar3 + 0x60))(piVar3,"");
          iVar4 = FUN_002f7060(uVar7,"global");
          if (iVar4 == 0) {
            local_38 = 1;
          }
        }
        piVar3 = (int *)(**(code **)(*param_1 + 0x74))(param_1,iVar8);
        local_30 = (**(code **)(*piVar3 + 0x68))(piVar3,0);
        local_2c = 0;
        if (DAT_005f9ba4 == 0 && DAT_005f9ba0 < local_30) {
          DAT_005f9ba4 = 0;
          DAT_005f9ba0 = local_30;
        }
        std::vector<Mortar::LeagueFeedUser,std::allocator<Mortar::LeagueFeedUser>>::push_back
                  (param_2);
        if ((allocator *)(local_3c + -0xc) != (allocator *)PTR__S_empty_rep_storage_004d9038) {
          piVar3 = (int *)(local_3c + -4);
          DataMemoryBarrier(0x1b);
          do {
            ExclusiveAccess(piVar3);
            iVar4 = *piVar3;
            bVar1 = (bool)hasExclusiveAccess(piVar3);
          } while (!bVar1);
          *piVar3 = iVar4 + -1;
          DataMemoryBarrier(0x1b);
          if (iVar4 < 1) {
            std::string::_Rep::_M_destroy((allocator *)(local_3c + -0xc));
          }
        }
     
/* ...截断... */
```

## FUN_002115b0 — 002115b0
命中: score@0041829b

```c

void FUN_002115b0(int *param_1,pair *param_2)

{
  bool bVar1;
  int iVar2;
  int *piVar3;
  int iVar4;
  int *piVar5;
  char *pcVar6;
  undefined4 uVar7;
  undefined4 *puVar8;
  int iVar9;
  int iVar10;
  int local_5c;
  undefined4 local_58;
  int local_54;
  int local_50;
  undefined4 local_4c;
  allocator aaStack_48 [4];
  int local_44;
  string asStack_40 [4];
  undefined4 local_3c;
  undefined4 local_38;
  undefined4 *local_34;
  undefined4 *local_30;
  undefined4 local_2c;
  
  iVar2 = (**(code **)(*param_1 + 0x4c))(param_1);
  if (iVar2 == 1) {
    local_2c = 0;
    local_38 = 0;
    local_3c = 0;
    local_34 = &local_3c;
    local_30 = &local_3c;
    iVar2 = (**(code **)(*param_1 + 0x90))(param_1);
    if (iVar2 != 0) {
      iVar10 = 0;
      do {
        piVar3 = (int *)(**(code **)(*param_1 + 0x74))(param_1,iVar10);
        iVar4 = (**(code **)(*piVar3 + 0x44))(piVar3);
        if (iVar4 == 1) {
          piVar5 = (int *)(**(code **)(*param_1 + 0x8c))(param_1,iVar10);
          pcVar6 = (char *)(**(code **)(*piVar3 + 0x60))(piVar3,"");
          std::string::string((string *)&local_44,pcVar6,aaStack_48);
          iVar4 = (**(code **)(*piVar5 + 0x4c))(piVar5);
          if (iVar4 == 1) {
            piVar3 = (int *)(**(code **)(*piVar5 + 0x130))(piVar5,"score");
            iVar4 = (**(code **)(*piVar3 + 0x40))(piVar3);
            if (iVar4 == 1) {
              uVar7 = (**(code **)(*piVar3 + 0x6c))(piVar3,0);
              puVar8 = (undefined4 *)
                       std::
                       map<std::string,float,std::less<std::string>,std::allocator<std::pair<std::string_const,float>>>
                       ::operator[](asStack_40);
              *puVar8 = uVar7;
            }
          }
          if ((allocator *)(local_44 + -0xc) != (allocator *)PTR__S_empty_rep_storage_004d9038) {
            piVar3 = (int *)(local_44 + -4);
            DataMemoryBarrier(0x1b);
            do {
              ExclusiveAccess(piVar3);
              iVar4 = *piVar3;
              bVar1 = (bool)hasExclusiveAccess(piVar3);
            } while (!bVar1);
            *piVar3 = iVar4 + -1;
            DataMemoryBarrier(0x1b);
            if (iVar4 < 1) {
              std::string::_Rep::_M_destroy((allocator *)(local_44 + -0xc));
            }
          }
        }
        iVar10 = iVar10 + 1;
      } while (iVar2 != iVar10);
    }
    local_54 = 0;
    local_50 = 0;
    local_4c = 0;
    std::vector<std::pair<std::string,float>,std::allocator<std::pair<std::string,float>>>::
    _M_range_initialize<std::_Rb_tree_iterator<std::pair<std::string_const,float>>>
              (&local_54,local_34,&local_3c);
    iVar10 = local_50;
    iVar2 = local_54;
    if (local_54 != local_50) {
      iVar9 = 0;
      for (iVar4 = local_50 - local_54 >> 3; iVar4 != 1; iVar4 = iVar4 >> 1) {
        iVar9 = iVar9 + 2;
      }
      std::
      __introsort_loop<__gnu_cxx::__normal_iterator<std::pair<std::string,float>*,std::vector<std::pair<std::string,float>,std::allocator<std::pair<std::string,float>>>>,int,bool(*)(std::pair<std::string,float>const&,std::pair<std::string,float>const&)>
                (local_54,local_50,iVar9,&LAB_00211598_1);
      std::
      __final_insertion_sort<__gnu_cxx::__normal_iterator<std::pair<std::string,float>*,std::vector<std::pair<std::string,float>,std::allocator<std::pair<std::string,float>>>>,bool(*)(std::pair<std::string,float>const&,std::pair<std::string,float>const&)>
                (iVar2,iVar10,&LAB_00211598_1);
      iVar2 = local_50;
    }
    if (0 < iVar2 - local_54) {
      iVar10 = 0;
      iVar2 = 4;
      do {
        iVar4 = local_54;
        std::string::string((string *)&local_5c,(string *)(local_54 + iVar2 + -4));
        local_58 = *(undefined4 *)(iVar4 + iVar2);
        std::vector<std::pair<std::string,float>,std::allocator<std::pair<std::string,float>>>::
        push_back(param_2);
/* ...截断... */
```

## FUN_00028b20 — 00028b20
命中: score@0041829b

```c

void FUN_00028b20(int param_1,undefined4 param_2)

{
  char cVar1;
  int iVar2;
  undefined4 uVar3;
  char *pcVar4;
  char local_c8 [127];
  undefined1 local_49;
  undefined1 auStack_48 [4];
  undefined1 auStack_44 [4];
  undefined1 auStack_40 [4];
  undefined4 local_3c;
  undefined4 local_38;
  undefined4 local_34;
  double local_30;
  int local_24;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_0030c6c0(param_2,"state",param_1 + 0x3c);
  FUN_0030c6c0(param_2,"currentChallenge",param_1 + 0x40);
  FUN_0030c6c0(param_2,"uistate",param_1 + 0x44);
  iVar2 = FUN_0030c718(param_2,"uiTime",&local_30);
  if (iVar2 == 0) {
    *(float *)(param_1 + 0x48) = (float)local_30;
  }
  FUN_0030c6c0(param_2,"uimapstate",param_1 + 0x4c);
  iVar2 = FUN_0030c718(param_2,"uimapTime",&local_30);
  if (iVar2 == 0) {
    *(float *)(param_1 + 0x50) = (float)local_30;
  }
  FUN_0030c6c0(param_2,"quickShotState",param_1 + 0x58);
  iVar2 = FUN_0030c718(param_2,"quickShotTime",&local_30);
  if (iVar2 == 0) {
    *(float *)(param_1 + 0x54) = (float)local_30;
  }
  FUN_0030c6c0(param_2,"comboPoints",param_1 + 0x5c);
  iVar2 = FUN_0030c718(param_2,"challengeTime",&local_30);
  if (iVar2 == 0) {
    *(float *)(param_1 + 0x60) = (float)local_30;
  }
  FUN_0030c6c0(param_2,"challengeFruit",param_1 + 100);
  FUN_0030c6c0(param_2,"lastRoundScore",param_1 + 0x68);
  FUN_0030c6c0(param_2,"score",param_1 + 0x6c);
  FUN_0030c6c0(param_2,"fails",param_1 + 0x70);
  FUN_0030c6c0(param_2,"resultMenuState",param_1 + 0x74);
  iVar2 = FUN_0030c718(param_2,"resultMenuTime",&local_30);
  if (iVar2 == 0) {
    *(float *)(param_1 + 0x78) = (float)local_30;
  }
  iVar2 = FUN_0030c718(param_2,"resultDisplayScore",&local_30);
  if (iVar2 == 0) {
    *(float *)(param_1 + 0x7c) = (float)local_30;
  }
  iVar2 = FUN_0030c718(param_2,"resultDisplayScoreTotal",&local_30);
  if (iVar2 == 0) {
    *(float *)(param_1 + 0x80) = (float)local_30;
  }
  FUN_0030c6c0(param_2,"instructMenuState",param_1 + 0x84);
  iVar2 = FUN_0030c718(param_2,"instructMenuTime",&local_30);
  if (iVar2 == 0) {
    *(float *)(param_1 + 0x88) = (float)local_30;
  }
  FUN_0030c6c0(param_2,"finaleScreenState",param_1 + 0x8c);
  FUN_0030c6c0(param_2,"finaleScreenTotalState",param_1 + 0x90);
  iVar2 = FUN_0030c718(param_2,"finaleScreenTime",&local_30);
  if (iVar2 == 0) {
    *(float *)(param_1 + 0x94) = (float)local_30;
  }
  FUN_0030c6c0(param_2,"finaleScreenFinalTotal",param_1 + 0x98);
  FUN_0030c6c0(param_2,"finaleScreenFinalRoundScore",param_1 + 0x9c);
  FUN_0030c6c0(param_2,"finaleScreenSpareLives",param_1 + 0xa0);
  FUN_0030c6c0(param_2,"finaleScreenBonusPerLife",param_1 + 0xa4);
  iVar2 = FUN_0030c718(param_2,"finaleScreenDisplayScore",&local_30);
  if (iVar2 == 0) {
    *(float *)(param_1 + 0xa8) = (float)local_30;
  }
  FUN_0030c6c0(param_2,"finaleFailScreenState",param_1 + 0xac);
  iVar2 = FUN_0030c718(param_2,"finaleFailScreenTime",&local_30);
  if (iVar2 == 0) {
    *(float *)(param_1 + 0xb0) = (float)local_30;
  }
  iVar2 = FUN_0030c718(param_2,"finaleFailScreenDisplayScore",&local_30);
  if (iVar2 == 0) {
    *(float *)(param_1 + 0xb4) = (float)local_30;
  }
  iVar2 = FUN_0030c718(param_2,"megaBomb",&local_30);
  if (iVar2 == 0) {
    *(float *)(param_1 + 0xb8) = (float)local_30;
  }
  iVar2 = FUN_0030c718(param_2,"megaFruit",&local_30);
  if (iVar2 == 0) {
    *(float *)(param_1 + 0xbc) = (float)local_30;
  }
  iVar2 = FUN_0030c718(param_2,"Stack1",&local_30);
  if (iVar2 == 0) {
    *(float *)(param_1 + 0xc0) = (float)local_30;
  }
  iVar2 = FUN_0030c718(param_2,"Stack2",&local_30);
  if (iVar2 == 0) {
    *(float *)(param_1 + 0xc4) = (float)local_30;
  }
  uVar3 = FUN_0030c660(param_2,"snakeVec");
  FUN_000394a0(&local_3c,uVar3);
  *(undefined4 *)(param_1 + 200) = local_3c;
  *(undefined4 *)(param_1 + 0xcc) = local_38;
  *(undefined4 *)(param_1 + 0xd0) = local_34;
  FUN_0030c6c0
/* ...截断... */
```

## FUN_00080ca0 — 00080ca0
命中: score@0041829b

```c

void FUN_00080ca0(int param_1)

{
  int iVar1;
  int iVar2;
  int *piVar3;
  undefined4 uVar4;
  size_t sVar5;
  int iVar6;
  int *piVar7;
  int iVar8;
  int *piVar9;
  int *piVar10;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined8 uVar11;
  int local_374;
  undefined1 auStack_370 [40];
  undefined1 auStack_348 [40];
  undefined1 auStack_320 [40];
  undefined1 auStack_2f8 [40];
  undefined1 auStack_2d0 [40];
  undefined1 auStack_2a8 [40];
  undefined1 auStack_280 [40];
  undefined1 auStack_258 [40];
  undefined1 auStack_230 [40];
  undefined1 auStack_208 [40];
  undefined1 auStack_1e0 [40];
  undefined1 auStack_1b8 [40];
  undefined1 auStack_190 [40];
  int local_168;
  char acStack_164 [10];
  undefined4 local_15a;
  char acStack_64 [63];
  undefined1 local_25;
  int local_24;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined1 *)(param_1 + 0x7b5) = 0;
  FUN_000813f8(param_1);
  if ((uint)((*(int *)(param_1 + 0x7a0) - *(int *)(param_1 + 0x79c) >> 2) * -0x3b13b13b) < 2) {
    FUN_0030f7cc(auStack_190,"addFriends");
    iVar1 = FUN_0039725c(param_1,auStack_190);
    FUN_0030f7e0(auStack_190);
    if (iVar1 != 0) {
      local_168._0_1_ = 1;
      FUN_0001da28(*(undefined4 *)(iVar1 + 0x260),&local_168);
      local_168 = (uint)local_168._1_3_ << 8;
      FUN_0001da28(*(undefined4 *)(param_1 + 0x610),&local_168);
    }
  }
  else {
    local_168 = CONCAT31(local_168._1_3_,1);
    FUN_0001da28(*(undefined4 *)(param_1 + 0x610),&local_168);
    FUN_0030f7cc(auStack_1b8,"textureDivider_0");
    iVar1 = FUN_0039725c(param_1,auStack_1b8);
    FUN_0030f7e0(auStack_1b8);
    if (iVar1 != 0) {
      local_168 = CONCAT31(local_168._1_3_,1);
      FUN_0001da28(*(undefined4 *)(iVar1 + 0x260),&local_168);
    }
    FUN_0030f7cc(auStack_1e0,"textureDivider_1");
    iVar1 = FUN_0039725c(param_1,auStack_1e0);
    FUN_0030f7e0(auStack_1e0);
    if (iVar1 != 0) {
      local_168 = CONCAT31(local_168._1_3_,1);
      FUN_0001da28(*(undefined4 *)(iVar1 + 0x260),&local_168);
    }
    iVar1 = *(int *)(param_1 + 0x79c);
    iVar8 = *(int *)(param_1 + 0x7a0);
    if (iVar1 != iVar8) {
      iVar6 = 0;
      if (iVar8 - iVar1 != 0x34) {
        iVar6 = 0;
        iVar2 = (iVar8 - iVar1 >> 2) * -0x3b13b13b;
        do {
          iVar6 = iVar6 + 2;
          iVar2 = iVar2 >> 1;
        } while (iVar2 != 1);
      }
      FUN_00081da8(iVar1,iVar8,iVar6,&FUN_00081850_1);
      FUN_00081ebc(iVar1,iVar8,&FUN_00081850_1);
      piVar9 = *(int **)(param_1 + 0x79c);
      piVar3 = *(int **)(param_1 + 0x7a0);
      if (piVar9 != piVar3) {
        iVar1 = 1;
        piVar10 = piVar9;
        do {
          piVar7 = piVar10 + 0xd;
          *piVar10 = iVar1;
          iVar1 = iVar1 + 1;
          piVar10 = piVar7;
        } while (piVar3 != piVar7);
        if (piVar9 != piVar3) {
          local_374 = -1;
          do {
            iVar1 = piVar9[0xc];
            uVar4 = FUN_003ecb20();
            if ((char)iVar1 == '\0') {
              FUN_0030f7cc(auStack_280,"ComponentLeaderboardItem");
              FUN_0030f7cc(auStack_2a8,piVar9 + 1);
              piVar3 = (int *)FUN_003ee190(uVar4,param_1,auStack_280,auStack_2a8);
              FUN_0030f7e0(auStack_2a8);
              FUN_0030f7e0(auStack_280);
              FUN_00397c28(piVar3,0);
              iVar1 = *piVar9;
              piVar10 = piVar3;
              uVar4 = extraout_s1;
            }
            else {
              FUN_0030f7cc(auStack_208,"ComponentLeaderboardItemPlayer");
              FUN_0030f7cc(auStack_230,piVar9 + 1);
              piVar3 = (int *)FUN_003ee190(uVar4,param_1,auStack_208,auStack_230);
              FUN_0030f7e0(auStack_230);
              FUN_0030f7e0(auStack_208);
              FUN_00397c28(piVar3,0);
              for (iVar1 = *(int *)(param_1 + 0x7c4); *(in
/* ...截断... */
```

## FUN_0022ca90 — 0022ca90
命中: score@0041829b

```c

void FUN_0022ca90(int param_1,int *param_2)

{
  int iVar1;
  int *piVar2;
  int iVar3;
  int *piVar4;
  int *piVar5;
  undefined4 uVar6;
  int iVar7;
  int *local_ac;
  undefined1 auStack_a8 [68];
  undefined1 auStack_64 [68];
  
  iVar1 = (**(code **)(*param_2 + 0x90))(param_2);
  if (iVar1 != 0) {
    iVar7 = 0;
    do {
      piVar2 = (int *)(**(code **)(*param_2 + 0x8c))(param_2,iVar7);
      iVar3 = (**(code **)(*piVar2 + 0x4c))();
      if (iVar3 != 0) {
        piVar4 = (int *)(**(code **)(**(int **)(param_1 + 0x2c) + 0x68))();
        piVar4 = (int *)(**(code **)(*piVar4 + 0x14))(piVar4,*(undefined4 *)(param_1 + 0x30));
        piVar5 = (int *)(**(code **)(*piVar2 + 0x84))(piVar2,"bricknetId");
        iVar3 = (**(code **)(*piVar5 + 0x60))(piVar5,0);
        if (iVar3 != 0) {
          piVar5 = (int *)(**(code **)(*piVar4 + 0x14))(piVar4,"bricknetId",iVar3);
          if (piVar5 == (int *)0x0) {
            piVar5 = operator_new(0x4c);
            FUN_00225d70(piVar5,*(undefined4 *)(param_1 + 0x2c));
            (**(code **)(*piVar5 + 8))(piVar5);
          }
          FUN_00226f6c(piVar5,piVar2);
          FUN_0026d030(piVar4,piVar5);
          piVar4 = (int *)(**(code **)(*piVar2 + 0x84))(piVar2,"score");
          uVar6 = (**(code **)(*piVar2 + 0x84))(piVar2,"metaData");
          FUN_0022a700(auStack_a8,uVar6);
          uVar6 = (**(code **)(*piVar4 + 100))(piVar4,0);
          FUN_0022a7c0(auStack_64,auStack_a8);
          piVar2 = operator_new(0x54);
          FUN_0022aa2c(piVar2,piVar5,uVar6,auStack_64);
          local_ac = piVar2;
          FUN_00229bdc(auStack_64);
          (**(code **)(*piVar2 + 8))(piVar2);
          FUN_00233640(param_1 + 0x20,&local_ac);
          (**(code **)(*piVar5 + 0xc))(piVar5);
          FUN_00229bdc(auStack_a8);
        }
      }
      iVar7 = iVar7 + 1;
    } while (iVar1 != iVar7);
  }
  return;
}


```

## FUN_0001cb08 — 0001cb08
命中: score@00418a74

```c

void FUN_0001cb08(int param_1,int param_2,int param_3)

{
  undefined4 uVar1;
  int *piVar2;
  undefined4 uVar3;
  int iVar4;
  undefined4 *puVar5;
  
  DAT_005576f0 = DAT_005576f0 + 1;
  for (puVar5 = DAT_005576e8; (undefined4 **)puVar5 != &DAT_005576e8; puVar5 = (undefined4 *)*puVar5
      ) {
    piVar2 = puVar5 + 2;
    if ((puVar5[0xb] == 0) || (((int)puVar5[0xb] < DAT_005576f0 && (puVar5[0xc] == 1)))) {
      if (*(char *)(puVar5 + 10) != '\0') {
        piVar2 = (int *)*piVar2;
      }
      if (piVar2 != (int *)0x0) {
        (**(code **)(*piVar2 + 0xc))(piVar2,param_1,param_2);
      }
    }
  }
  FUN_0001d888(&DAT_005576e8);
  if (DAT_005f8db8 == 4) {
    piVar2 = (int *)&DAT_00557718;
    if ((DAT_00557738 == '\0') || (iVar4 = 0, piVar2 = DAT_00557718, DAT_00557718 != (int *)0x0)) {
      iVar4 = (**(code **)(*piVar2 + 0xc))(piVar2,param_1);
    }
    DAT_005f8dd4 = DAT_005f8dd4 + iVar4;
  }
  else {
    piVar2 = (int *)&DAT_00557718;
    if ((DAT_00557738 == '\0') || (iVar4 = 0, piVar2 = DAT_00557718, DAT_00557718 != (int *)0x0)) {
      iVar4 = (**(code **)(*piVar2 + 0xc))(piVar2,param_1);
    }
    DAT_005f8dd4 = DAT_005f8dd4 + iVar4;
    if ((0x7fffffff < DAT_005f8dd4) && (DAT_005f8db8 != 5)) {
      DAT_005f8dd4 = 0;
    }
  }
  if (((DAT_00557714 & 1) == 0) && (iVar4 = ___cxa_guard_acquire(&DAT_00557714), iVar4 != 0)) {
    DAT_00557710 = FUN_002f69c4("all",3);
    ___cxa_guard_release(&DAT_00557714);
  }
  if (((0 < param_1) && (param_3 == 1)) && (param_2 < 2)) {
    DAT_005f8f3c = FUN_00027588(DAT_005f8e04,"all",DAT_00557710,param_1,1,0);
    uVar1 = DAT_005f8e04;
    if (DAT_005f9378 != '\0') {
      uVar3 = FUN_002f69c4("upside_down_points",0x12);
      FUN_00027588(uVar1,"upside_down_points",uVar3,param_1,0,1);
    }
    iVar4 = FUN_000276e8(DAT_005f8e04,"bean");
    uVar1 = DAT_005f8e04;
    if (iVar4 == 0) {
      uVar3 = FUN_002f69c4("score_without_beans",0x13);
      FUN_00027588(uVar1,"score_without_beans",uVar3,param_1,0,1);
    }
  }
  if ((((undefined4 *)DAT_005f8da8 != (undefined4 *)0x0) &&
      (iVar4 = (**(code **)*(undefined4 *)DAT_005f8da8)(), iVar4 == 0)) &&
     ((undefined4 *)DAT_005f8da8 != (undefined4 *)0x0)) {
    iVar4 = (**(code **)*(undefined4 *)DAT_005f8da8)();
    puVar5 = (undefined4 *)0x0;
    if (iVar4 == 0) {
      puVar5 = (undefined4 *)DAT_005f8da8;
    }
    FUN_00070ba4(puVar5);
  }
  return;
}


```

## FUN_00053388 — 00053388
命中: fruit@0041844e

```c

void FUN_00053388(int *param_1,undefined4 param_2)

{
  undefined *puVar1;
  undefined1 uVar2;
  char *pcVar3;
  size_t sVar4;
  char *pcVar5;
  int iVar6;
  undefined4 uVar7;
  int iVar8;
  int *piVar9;
  int *unaff_r6;
  bool bVar10;
  allocator aaStack_38 [4];
  int local_34;
  undefined *local_30;
  int local_2c;
  int local_28;
  
  pcVar3 = (char *)FUN_0030c660(param_2,"name");
  bVar10 = pcVar3 == (char *)0x0;
  if (!bVar10) {
    unaff_r6 = param_1 + 5;
    bVar10 = unaff_r6 == (int *)0x0;
  }
  if (!bVar10) {
    if ((void *)*unaff_r6 != (void *)0x0) {
      operator_delete__((void *)*unaff_r6);
      *unaff_r6 = 0;
    }
    sVar4 = _strlen(pcVar3);
    pcVar5 = operator_new__(sVar4 + 1);
    *unaff_r6 = (int)pcVar5;
    _strcpy(pcVar5,pcVar3);
  }
  pcVar3 = (char *)param_1[5];
  sVar4 = _strlen(pcVar3);
  iVar6 = FUN_002f69c4(pcVar3,sVar4);
  param_1[6] = iVar6;
  FUN_0030c660(param_2,"mode");
  iVar6 = FUN_00039714();
  param_1[7] = iVar6;
  FUN_0030c6c0(param_2,"minWait",param_1 + 8);
  FUN_0030c6c0(param_2,"maxWait",param_1 + 9);
  FUN_0030c6c0(param_2,"dontSpawnBeforeWave",param_1 + 0xb);
  iVar6 = FUN_0030c660(param_2,"canSpawnWithPowers");
  if (iVar6 != 0) {
    uVar7 = FUN_0030c660(param_2,"canSpawnWithPowers");
    uVar2 = FUN_00039580("true",uVar7);
    *(undefined1 *)(param_1 + 10) = uVar2;
  }
  param_1[1] = 0;
  iVar6 = FUN_0030c328(param_2,"fruit");
  if (iVar6 != 0) {
    do {
      puVar1 = PTR__S_empty_rep_storage_004d9038;
      local_30 = PTR__S_empty_rep_storage_004d9038 + 0xc;
      local_2c = 100;
      pcVar3 = (char *)FUN_0030c660(iVar6,"type");
      std::string::string((string *)&local_34,pcVar3,aaStack_38);
      std::string::assign((string *)&local_30);
      if ((allocator *)(local_34 + -0xc) != (allocator *)puVar1) {
        piVar9 = (int *)(local_34 + -4);
        DataMemoryBarrier(0x1b);
        do {
          ExclusiveAccess(piVar9);
          iVar8 = *piVar9;
          bVar10 = (bool)hasExclusiveAccess(piVar9);
        } while (!bVar10);
        *piVar9 = iVar8 + -1;
        DataMemoryBarrier(0x1b);
        if (iVar8 < 1) {
          std::string::_Rep::_M_destroy((allocator *)(local_34 + -0xc));
        }
      }
      FUN_0030c6c0(iVar6,"chance",&local_2c);
      local_28 = param_1[1] + local_2c;
      param_1[1] = local_28;
      FUN_000584c8(param_1 + 2,&local_30);
      if ((allocator *)(local_30 + -0xc) != (allocator *)PTR__S_empty_rep_storage_004d9038) {
        piVar9 = (int *)(local_30 + -4);
        DataMemoryBarrier(0x1b);
        do {
          ExclusiveAccess(piVar9);
          iVar8 = *piVar9;
          bVar10 = (bool)hasExclusiveAccess(piVar9);
        } while (!bVar10);
        *piVar9 = iVar8 + -1;
        DataMemoryBarrier(0x1b);
        if (iVar8 < 1) {
          std::string::_Rep::_M_destroy((allocator *)(local_30 + -0xc));
        }
      }
      iVar6 = FUN_0030c3a0(iVar6,"fruit");
    } while (iVar6 != 0);
  }
  (**(code **)(*param_1 + 4))(param_1,param_2);
  return;
}


```

## FUN_0000a3a0 — 0000a3a0
命中: fruit@0041844e, fruit@00418471, slash@00418459, bomb@00418454

```c

int FUN_0000a3a0(int param_1,undefined1 *param_2)

{
  int *piVar1;
  uint uVar2;
  int iVar3;
  int *piVar4;
  
  uVar2 = 0xffffffff;
  piVar1 = &DAT_00556b18;
  if ((DAT_00556b10 & 1) == 0) {
    iVar3 = ___cxa_guard_acquire(&DAT_00556b10);
    if (iVar3 != 0) {
      DAT_00556b14 = 1;
      DAT_00556b18 = FUN_002f69c4("fruit",5);
      DAT_00556b1c = 1;
      DAT_00556b20 = 1;
      DAT_00556b24 = FUN_002f69c4("bomb",4);
      DAT_00556b28 = 2;
      DAT_00556b2c = 1;
      DAT_00556b30 = FUN_002f69c4("slash",5);
      DAT_00556b34 = 4;
      DAT_00556b38 = 1;
      DAT_00556b3c = FUN_002f69c4("blast",5);
      DAT_00556b40 = 5;
      DAT_00556b44 = 1;
      DAT_00556b48 = FUN_002f69c4("coin",4);
      DAT_00556b4c = 3;
      DAT_00556b50 = 1;
      DAT_00556b54 = FUN_002f69c4("jiblet",6);
      DAT_00556b58 = 6;
      DAT_00556b5c = 1;
      DAT_00556b60 = FUN_002f69c4("fruitray",8);
      DAT_00556b64 = 7;
      ___cxa_guard_release(&DAT_00556b10);
    }
    uVar2 = 0xffffffff;
    piVar1 = &DAT_00556b18;
  }
  do {
    piVar4 = piVar1;
    uVar2 = uVar2 + 1;
    if (6 < uVar2) {
      *param_2 = 0;
      return -1;
    }
    piVar1 = piVar4 + 3;
  } while (*piVar4 != param_1);
  *param_2 = (char)piVar4[-1];
  return piVar4[1];
}


```

## FUN_00059ee0 — 00059ee0
命中: fruit@0041844e

```c

void FUN_00059ee0(undefined4 param_1,byte *param_2)

{
  bool bVar1;
  byte bVar2;
  undefined4 uVar3;
  int *piVar4;
  int *piVar5;
  int iVar6;
  code *pcVar7;
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
  uVar3 = FUN_003ecb20();
  FUN_0030f7cc(auStack_50,"extras.backgroundControl.openfeint");
  piVar4 = (int *)FUN_003f06d0(uVar3,auStack_50);
  FUN_0030f7e0(auStack_50);
  uVar3 = FUN_003ecb20();
  FUN_0030f7cc(auStack_78,"extras.backgroundControl.gamecenter");
  piVar5 = (int *)FUN_003f06d0(uVar3,auStack_78);
  FUN_0030f7e0(auStack_78);
  bVar1 = false;
  if (piVar5 == (int *)0x0) {
LAB_00059f82:
    if (piVar4 == (int *)0x0) {
      if (bVar1) {
        FUN_0030f7e0(auStack_a0);
      }
      bVar2 = *param_2;
    }
    else {
      FUN_0030f7cc(auStack_c8,"animate_out");
      iVar6 = FUN_0039834c(piVar4,auStack_c8,1);
      FUN_0030f7e0(auStack_c8);
      if (bVar1) {
        FUN_0030f7e0(auStack_a0);
      }
      bVar2 = *param_2;
      if (iVar6 != 0) goto LAB_00059fc0;
    }
    if (bVar2 == 0) {
      if (piVar4 != (int *)0x0) {
        local_28[0] = 1;
        FUN_0001da28(piVar4[0x98],local_28);
        pcVar7 = *(code **)(*piVar4 + 0x40);
        FUN_0030f7cc(auStack_168,"animate_in");
        (*pcVar7)(piVar4,auStack_168,1);
        FUN_0030f7e0(auStack_168);
        FUN_0030f7cc(auStack_190,"fruit");
        iVar6 = FUN_0039725c(piVar4,auStack_190);
        FUN_0030f7e0(auStack_190);
        if (iVar6 != 0) {
          local_28[0] = 1;
          FUN_0001da28(*(undefined4 *)(iVar6 + 0x260),local_28);
        }
      }
      if (piVar5 != (int *)0x0) {
        pcVar7 = *(code **)(*piVar5 + 0x40);
        FUN_0030f7cc(auStack_1b8,"animate_out");
        (*pcVar7)(piVar5,auStack_1b8,1);
        FUN_0030f7e0(auStack_1b8);
      }
    }
    else {
      if (piVar4 != (int *)0x0) {
        pcVar7 = *(code **)(*piVar4 + 0x40);
        FUN_0030f7cc(auStack_f0,"animate_out");
        (*pcVar7)(piVar4,auStack_f0,1);
        FUN_0030f7e0(auStack_f0);
      }
      if (piVar5 != (int *)0x0) {
        local_28[0] = 1;
        FUN_0001da28(piVar5[0x98],local_28);
        pcVar7 = *(code **)(*piVar5 + 0x40);
        FUN_0030f7cc(auStack_118,"animate_in");
        (*pcVar7)(piVar5,auStack_118,1);
        FUN_0030f7e0(auStack_118);
        FUN_0030f7cc(auStack_140,"fruit");
        iVar6 = FUN_0039725c(piVar5,auStack_140);
        FUN_0030f7e0(auStack_140);
        if (iVar6 != 0) {
          local_28[0] = 1;
          FUN_0001da28(*(undefined4 *)(iVar6 + 0x260),local_28);
        }
      }
    }
    uVar3 = 1;
    if (*param_2 != 0) {
      uVar3 = 2;
    }
    FUN_00021fbc(uVar3,0);
  }
  else {
    FUN_0030f7cc(auStack_a0,"animate_out");
    bVar1 = true;
    iVar6 = FUN_0039834c(piVar5,auStack_a0,1);
    if (iVar6 != 1) goto LAB_00059f82;
    FUN_0030f7e0(auStack_a0);
    bVar2 = *param_2;
LAB_00059fc0:
    *param_2 = bVar2 ^ 1;
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00018e60 — 00018e60
命中: slash@00418958

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
    uVar5 
/* ...截断... */
```

## FUN_00060108 — 00060108
命中: slash@00418958, slash@00418960, bandito@0041c054, bandito@0041c07a

```c

void FUN_00060108(int param_1)

{
  undefined *puVar1;
  undefined *puVar2;
  int iVar3;
  undefined4 uVar4;
  int iVar5;
  uint uVar6;
  undefined4 uVar7;
  _Rb_tree_node_base *p_Var8;
  int iVar9;
  undefined4 uVar10;
  char *pcVar11;
  int *piVar12;
  code *pcVar13;
  undefined **local_78;
  undefined *local_74;
  undefined4 local_70 [8];
  undefined1 local_50;
  undefined1 auStack_4c [40];
  int local_24;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  piVar12 = *(int **)(param_1 + 4);
  pcVar13 = *(code **)(*piVar12 + 0x40);
  FUN_0030f7cc(auStack_4c,"animate_out");
  (*pcVar13)(piVar12,auStack_4c,1);
  FUN_0030f7e0(auStack_4c);
  FUN_0005edc8(&DAT_005f94b4);
  iVar3 = FUN_0005edbc(&DAT_005f94b4);
  if (iVar3 == 0) goto LAB_000604fe;
  iVar9 = *(int *)(param_1 + 0x68);
  iVar3 = FUN_0005edbc(&DAT_005f94b4);
  *(int *)(iVar9 + 0x80) = *(int *)(iVar9 + 0x80) + 1;
  if (iVar3 == 1) {
    *(int *)(iVar9 + 0x84) = *(int *)(iVar9 + 0x84) + 1;
  }
  iVar3 = *(int *)(param_1 + 0x68);
  uVar4 = FUN_0005edbc(&DAT_005f94b4);
  iVar9 = param_1 + 8;
  *(undefined4 *)(*(int *)(iVar3 + 0x78) + *(int *)(iVar3 + 0x90) * 8 + 4) = uVar4;
  FUN_000663a0(iVar9,&DAT_005f94b4);
  iVar3 = 0;
  if ((*(int *)(param_1 + 0x68) != 0) && (iVar3 = 0, *(int *)(*(int *)(param_1 + 0x68) + 0x98) != 0)
     ) {
    iVar3 = 1;
  }
  iVar5 = FUN_0005edbc(&DAT_005f94b4);
  if (iVar5 == 1 || iVar3 == 1) {
    if (iVar3 == 0) {
      uVar4 = FUN_00065968(iVar9);
      FUN_00066a8c(param_1 + 0x48,uVar4);
      uVar6 = FUN_000659a0(iVar9,1);
      if (99 < uVar6) {
        uVar7 = *(undefined4 *)(PTR_DAT_004d9048 + 0x5c);
        uVar4 = FUN_002f69c4("full_slice_bonus_total",0x16);
        FUN_00027588(uVar7,"full_slice_bonus_total",uVar4,1,1,1);
      }
      puVar2 = PTR_DAT_004d9048;
      iVar9 = FUN_000276e8(*(undefined4 *)(PTR_DAT_004d9048 + 0x5c),"slashes");
      iVar5 = FUN_000276e8(*(undefined4 *)(puVar2 + 0x5c),"slashesScoring");
      uVar4 = *(undefined4 *)(puVar2 + 0x5c);
      if (iVar9 == iVar5) {
        uVar7 = FUN_002f69c4("no_misses_consecutive_total",0x1b);
        FUN_00027588(uVar4,"no_misses_consecutive_total",uVar7,1,1,1);
      }
      else {
        FUN_000274bc(uVar4,"no_misses_consecutive_total",0,1,1);
      }
      uVar7 = *(undefined4 *)(puVar2 + 0x5c);
      pcVar11 = "bandito_round_score";
      uVar4 = FUN_002f69c4("bandito_round_score",0x13);
      uVar10 = *(undefined4 *)(param_1 + 0x5c);
LAB_00060430:
      FUN_00027588(uVar7,pcVar11,uVar4,uVar10,0,1);
    }
    else {
      if ((*(int *)(param_1 + 0x68) == 0) || (*(int *)(*(int *)(param_1 + 0x68) + 0x98) == 0)) {
        iVar5 = FUN_00065968(iVar9);
        iVar9 = FUN_00066afc(param_1 + 0x48);
        iVar9 = iVar9 + iVar5;
      }
      else {
        iVar9 = FUN_00066afc(param_1 + 0x48);
      }
      FUN_00066a8c(param_1 + 0x48,iVar9);
      puVar2 = PTR_DAT_004d9048;
      uVar10 = *(undefined4 *)(PTR_DAT_004d9048 + 0x5c);
      uVar4 = FUN_002f69c4("bonus_round_score",0x11);
      uVar7 = FUN_00066b48(param_1 + 0x48);
      FUN_00027588(uVar10,"bonus_round_score",uVar4,uVar7,0,1);
      if (*(int *)(param_1 + 0x4c) == 2) {
        uVar7 = *(undefined4 *)(puVar2 + 0x5c);
        pcVar11 = "bandito_1_heart_finish";
        uVar4 = FUN_002f69c4("bandito_1_heart_finish",0x16);
        uVar10 = 1;
        goto LAB_00060430;
      }
    }
    puVar2 = PTR_DAT_004d9048;
    if (*(char *)(*(int *)(param_1 + 100) + 0x59) != '\0') {
      uVar7 = *(undefined4 *)(PTR_DAT_004d9048 + 0x5c);
      uVar4 = FUN_002f69c4("challenge_hard_pass",0x13);
      FUN_00027588(uVar7,"challenge_hard_pass",uVar4,1,1,1);
      uVar7 = *(undefined4 *)(puVar2 + 0x5c);
      uVar4 = FUN_002f69c4("challenge_hard_pass_total",0x19);
      FUN_00027588(uVar7,"challenge_hard_pass_total",uVar4,1,1,1);
    }
  }
  else {
    FUN_00066b0c(para
/* ...截断... */
```

## FUN_00065ad4 — 00065ad4
命中: slash@00418958, slash@00418960

```c

undefined4 FUN_00065ad4(int param_1)

{
  undefined *puVar1;
  int iVar2;
  int iVar3;
  undefined4 uVar4;
  undefined4 extraout_s1;
  ulonglong uVar5;
  float fVar6;
  undefined4 extraout_s3;
  undefined8 uVar7;
  undefined8 uVar8;
  undefined8 uVar9;
  
  puVar1 = PTR_DAT_004d9048;
  iVar2 = FUN_000276e8(*(undefined4 *)(PTR_DAT_004d9048 + 0x5c),"slashes");
  iVar3 = FUN_000276e8(*(undefined4 *)(puVar1 + 0x5c),"slashesScoring");
  uVar7 = FixedToFP(CONCAT44(iVar2 - iVar3,iVar2 - iVar3),0,0,0,0x20);
  uVar4 = FUN_000276e8(*(undefined4 *)(puVar1 + 0x5c),"totalfruit");
  uVar8 = FloatVectorMult(uVar7,CONCAT44(extraout_s1,DAT_00065b70),2,0x20);
  uVar7 = FixedToFP(CONCAT44(uVar4,uVar4),0,0,0,0x20);
  uVar9 = FixedToFP(CONCAT44(extraout_s3,*(undefined4 *)(param_1 + 0x2c)),0,1,0,0x20);
  uVar8 = FloatVectorMult(uVar8,uVar7,2,0x20);
  uVar9 = FloatVectorAdd(uVar7,uVar9,2);
  uVar8 = FloatVectorAdd(uVar9,uVar8,2);
  fVar6 = (float)uVar8 / (float)uVar7;
  uVar5 = 0;
  if (-1 < (int)((uint)(fVar6 < 0.0) << 0x1f)) {
    uVar5 = (ulonglong)DAT_00065b74;
  }
  uVar7 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar8 >> 0x20),fVar6),uVar5,2,0x20);
  return (int)uVar7;
}


```

## FUN_0002ee94 — 0002ee94
命中: slash@0041a1dd

```c

int FUN_0002ee94(char *param_1)

{
  int iVar1;
  int iVar2;
  size_t sVar3;
  int iVar4;
  
  if (((DAT_00558078 & 1) == 0) && (iVar2 = ___cxa_guard_acquire(&DAT_00558078), iVar2 != 0)) {
    DAT_0055807c = FUN_002f69c4("SLASH_MODIFIER",0xe);
    DAT_00558080 = FUN_002f69c4("BACKGROUND",10);
    DAT_00558084 = FUN_002f69c4("REMOVEADS",9);
    ___cxa_guard_release(&DAT_00558078);
  }
  iVar2 = -1;
  if (param_1 != (char *)0x0) {
    if (*param_1 == '\0') {
      return -1;
    }
    sVar3 = _strlen(param_1);
    iVar4 = FUN_002f69c4(param_1,sVar3);
    iVar1 = 0;
    do {
      iVar2 = iVar1;
      if (2 < iVar2) {
        return -1;
      }
      iVar1 = iVar2 + 1;
    } while (iVar4 != (&DAT_0055807c)[iVar2]);
  }
  return iVar2;
}


```

## FUN_0002f2e8 — 0002f2e8
命中: slash@0041a27a

```c

void FUN_0002f2e8(int param_1,undefined4 param_2)

{
  undefined4 uVar1;
  undefined4 *puVar2;
  undefined4 *puVar3;
  undefined4 *puVar5;
  undefined4 *puVar4;
  
  FUN_0002ef34();
  *(undefined4 *)(param_1 + 0xd8) = 0;
  *(undefined4 *)(param_1 + 0xdc) = 0;
  *(undefined4 *)(param_1 + 0xe0) = 0;
  uVar1 = FUN_0030c328(param_2,"slashModInfo");
  FUN_0002f36c(param_1,uVar1);
  if (*(int *)(param_1 + 0xd8) != 0) {
    return;
  }
  *(undefined4 *)(param_1 + 0xdc) = 1;
  puVar2 = operator_new__(0xc);
  *puVar2 = 4;
  puVar2[1] = 1;
  puVar5 = puVar2 + 2;
  puVar3 = puVar5;
  do {
    puVar4 = puVar3 + 1;
    *puVar3 = 0xff000000;
    puVar3 = puVar4;
  } while (puVar4 != puVar2 + 3);
  *(undefined4 **)(param_1 + 0xd8) = puVar5;
  *(undefined1 *)((int)puVar2 + 0xb) = *(undefined1 *)(param_1 + 0x37);
  *(undefined1 *)((int)puVar2 + 10) = *(undefined1 *)(param_1 + 0x36);
  *(undefined1 *)((int)puVar2 + 9) = *(undefined1 *)(param_1 + 0x35);
  *(undefined1 *)puVar5 = *(undefined1 *)(param_1 + 0x34);
  return;
}


```

## FUN_0002f36c — 0002f36c
命中: slash@0041a2b1

```c

void FUN_0002f36c(int param_1,int param_2)

{
  char cVar1;
  undefined1 uVar2;
  int iVar3;
  undefined4 uVar4;
  char *pcVar5;
  size_t sVar6;
  char *pcVar7;
  int iVar8;
  ulong uVar9;
  undefined4 *puVar10;
  undefined4 *puVar11;
  uint uVar12;
  uint uVar13;
  undefined4 *unaff_r6;
  undefined4 *puVar14;
  bool bVar15;
  double local_30;
  double local_28;
  
  if (param_2 != 0) {
    iVar3 = FUN_0030c718(param_2,"speed",&local_30);
    if (iVar3 == 0) {
      *(float *)(param_1 + 0xe4) = (float)local_30;
    }
    FUN_0030c660(param_2,"type");
    uVar4 = FUN_00019a90();
    *(undefined4 *)(param_1 + 0xe0) = uVar4;
    pcVar5 = (char *)FUN_0030c660(param_2,"particles");
    bVar15 = pcVar5 == (char *)0x0;
    if (!bVar15) {
      unaff_r6 = (undefined4 *)(param_1 + 0xf0);
      bVar15 = unaff_r6 == (undefined4 *)0x0;
    }
    if (!bVar15) {
      if ((void *)*unaff_r6 != (void *)0x0) {
        operator_delete__((void *)*unaff_r6);
        *unaff_r6 = 0;
      }
      sVar6 = _strlen(pcVar5);
      pcVar7 = operator_new__(sVar6 + 1);
      *unaff_r6 = pcVar7;
      _strcpy(pcVar7,pcVar5);
    }
    pcVar5 = (char *)FUN_0030c660(param_2,"release_particles");
    bVar15 = pcVar5 == (char *)0x0;
    if (!bVar15) {
      unaff_r6 = (undefined4 *)(param_1 + 0x128);
      bVar15 = unaff_r6 == (undefined4 *)0x0;
    }
    if (!bVar15) {
      if ((void *)*unaff_r6 != (void *)0x0) {
        operator_delete__((void *)*unaff_r6);
        *unaff_r6 = 0;
      }
      sVar6 = _strlen(pcVar5);
      pcVar7 = operator_new__(sVar6 + 1);
      *unaff_r6 = pcVar7;
      _strcpy(pcVar7,pcVar5);
    }
    pcVar5 = (char *)FUN_0030c660(param_2,"contact_particles");
    bVar15 = pcVar5 == (char *)0x0;
    if (!bVar15) {
      unaff_r6 = (undefined4 *)(param_1 + 0x124);
      bVar15 = unaff_r6 == (undefined4 *)0x0;
    }
    if (!bVar15) {
      if ((void *)*unaff_r6 != (void *)0x0) {
        operator_delete__((void *)*unaff_r6);
        *unaff_r6 = 0;
      }
      sVar6 = _strlen(pcVar5);
      pcVar7 = operator_new__(sVar6 + 1);
      *unaff_r6 = pcVar7;
      _strcpy(pcVar7,pcVar5);
    }
    uVar4 = FUN_0030c660(param_2,"slash_flash");
    uVar2 = FUN_00039580("true",uVar4);
    *(undefined1 *)(param_1 + 0xe9) = uVar2;
    uVar4 = FUN_0030c660(param_2,"particles_directional");
    uVar2 = FUN_00039580("true",uVar4);
    *(undefined1 *)(param_1 + 0xe8) = uVar2;
    uVar4 = FUN_0030c660(param_2,"flipForUpsideDown");
    uVar2 = FUN_00039580("true",uVar4);
    *(undefined1 *)(param_1 + 0xea) = uVar2;
    uVar4 = FUN_0030c660(param_2,"splat_override");
    FUN_00039404(param_1 + 0xec,uVar4);
    pcVar5 = (char *)FUN_0030c660(param_2,"texture");
    cVar1 = '\0';
    if (pcVar5 != (char *)0x0) {
      cVar1 = *pcVar5;
    }
    if (pcVar5 != (char *)0x0 && cVar1 != '\0') {
      pcVar7 = operator_new__(0x40);
      *(char **)(param_1 + 0xf4) = pcVar7;
      _sprintf(pcVar7,"%s.tex",pcVar5);
    }
    iVar3 = FUN_0030c328(param_2,"impactParticles");
    *(undefined4 *)(param_1 + 0x120) = 0;
    if (iVar3 != 0) {
      for (iVar3 = FUN_0030c328(iVar3,"particle"); iVar3 != 0;
          iVar3 = FUN_0030c3a0(iVar3,"particle")) {
        pcVar5 = (char *)FUN_0030cd00(iVar3);
        sVar6 = _strlen(pcVar5);
        uVar4 = FUN_002f69c4(pcVar5,sVar6);
        *(undefined4 *)(param_1 + 0xf8 + *(int *)(param_1 + 0x120) * 4) = uVar4;
        uVar4 = FUN_00033ca0();
        iVar8 = FUN_000359cc(uVar4,*(undefined4 *)(param_1 + 0xf8 + *(int *)(param_1 + 0x120) * 4));
        if (iVar8 == 0) {
          *(undefined4 *)(param_1 + *(int *)(param_1 + 0x120) * 4 + 0xf8) = 0;
        }
        else {
          *(int *)(param_1 + 0x120) = *(int *)(param_1 + 0x120) + 1;
        }
      }
    }
    iVar3 = FUN_0030c328(param_2,"scales");
    if (iVar3 != 0) {
      iVar8 = FUN_0030c718(iVar3,"start_thickness",&local_30);
      if (iVar8 == 0)
/* ...截断... */
```

## FUN_00056098 — 00056098
命中: freeze@0041a436

```c

/* WARNING: Type propagation algorithm not settling */

void FUN_00056098(char *param_1,undefined4 param_2,int param_3)

{
  uint *puVar1;
  uint *puVar2;
  longlong lVar3;
  int *piVar4;
  float fVar5;
  undefined *puVar6;
  uint *puVar7;
  int iVar8;
  int *piVar9;
  undefined4 uVar10;
  int iVar11;
  uint uVar12;
  uint uVar13;
  _List_node_base *p_Var14;
  uint uVar15;
  uint uVar16;
  uint uVar17;
  uint uVar18;
  int *piVar19;
  uint uVar20;
  undefined4 uVar21;
  float *pfVar22;
  uint uVar23;
  int iVar24;
  int iVar25;
  undefined4 *puVar26;
  int iVar27;
  bool bVar28;
  uint extraout_s0;
  uint extraout_s0_00;
  uint extraout_s0_01;
  uint uVar29;
  uint extraout_s1;
  undefined8 uVar30;
  longlong lVar31;
  undefined4 extraout_s1_00;
  ulonglong uVar32;
  uint extraout_s1_01;
  uint extraout_s1_02;
  uint extraout_s1_03;
  undefined4 uVar33;
  undefined4 extraout_s1_04;
  undefined4 extraout_s1_05;
  undefined4 extraout_s1_06;
  undefined4 extraout_s1_07;
  uint extraout_s3;
  uint extraout_s3_00;
  uint extraout_s3_01;
  longlong lVar34;
  undefined4 extraout_s3_02;
  undefined4 extraout_s3_03;
  undefined4 extraout_s3_04;
  undefined4 extraout_s3_05;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  undefined4 extraout_s5_01;
  undefined4 extraout_s5_02;
  undefined4 extraout_s5_03;
  undefined4 extraout_s5_04;
  undefined4 extraout_s5_05;
  undefined4 extraout_s5_06;
  undefined8 uVar35;
  undefined8 uVar36;
  undefined8 uVar37;
  int local_f8;
  undefined *local_e0;
  int local_dc;
  undefined *local_d8;
  undefined4 uStack_d4;
  undefined1 local_c0;
  undefined *local_bc;
  int local_b8;
  undefined *local_b4;
  undefined4 uStack_b0;
  undefined1 local_9c;
  undefined *local_98;
  int local_94;
  undefined *local_90;
  undefined4 uStack_8c;
  undefined1 local_78;
  int local_74 [9];
  undefined1 local_50;
  undefined4 local_4c;
  undefined4 local_48;
  int local_44;
  
  local_44 = *(int *)PTR____stack_chk_guard_004d9044;
  param_1[0x17b] = '\0';
  if (*param_1 == '\0') {
    uVar35 = CONCAT44(param_2,param_2);
    FUN_000557ac(param_1,param_2);
    lVar31 = (ulonglong)extraout_s1 << 0x20;
    if (PTR_DAT_004d9048[0xab] != '\0') {
      uVar30 = FloatVectorAdd(CONCAT44(extraout_s1,*(undefined4 *)(param_1 + 0x40)),uVar35,2);
      *(int *)(param_1 + 0x40) = (int)uVar30;
      lVar31 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar30 >> 0x20),
                                       *(undefined4 *)(param_1 + 0x44)),uVar35,2);
      *(int *)(param_1 + 0x44) = (int)lVar31;
    }
    pfVar22 = (float *)(param_1 + param_3 * 4 + 0x170);
    uVar32 = CONCAT44((int)((ulonglong)lVar31 >> 0x20),*(float *)(param_1 + param_3 * 4 + 0x170));
    if (*(float *)(param_1 + param_3 * 4 + 0x170) <= 0.0) {
      *pfVar22 = 0.0;
      iVar8 = *(int *)(param_1 + param_3 * 4 + 0x168);
      if ((iVar8 == 0) || (*(int *)(iVar8 + 0xb8) < *(int *)(iVar8 + 0xbc))) {
        param_1[0x17b] = '\0';
      }
      else {
        uVar29 = *(uint *)(iVar8 + 0x4c);
        if (0 < (int)uVar29) {
          uVar15 = 0;
          uVar10 = extraout_s5;
          do {
            iVar25 = *(int *)(iVar8 + 0x48);
            iVar11 = iVar25 + uVar15 * 0x90;
            if (*(int *)(iVar11 + 0x18) < 2) {
              uVar30 = 0x3f8000003f800000;
              if (1.0 < *(float *)(param_1 + 0x78)) {
                uVar30 = CONCAT44(0x3f800000,*(float *)(param_1 + 0x78));
              }
              uVar16 = *(uint *)(iVar11 + 0x1c);
              uVar36 = FloatVectorMult(uVar30,uVar35,2,0x20);
              if (0x7fffffff < uVar16) {
                uVar16 = uVar15;
              }
              iVar11 = iVar25 + uVar16 * 0x90;
              uVar32 = FloatVectorSub(CONCAT44((int)(uVar32 >> 0x20),*(undefined4 *)(iVar11 + 0x80))
                                      ,uVar36,2,0x20);
              *(int *)(iVar11 
/* ...截断... */
```

## FUN_00006ddc — 00006ddc
命中: bomb@004183cf

```c

void FUN_00006ddc(void)

{
  undefined *puVar1;
  int iVar2;
  undefined1 auStack_7c [40];
  undefined4 local_54;
  undefined1 auStack_50 [40];
  undefined4 local_28;
  int local_24;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  if (DAT_00556a70 == '\0') {
    FUN_00009ae0();
    FUN_0030f7cc(auStack_50,"models/Fruit/Bomb.mmd");
    FUN_00304664(&local_28,&DAT_0052c308,auStack_50);
    FUN_00009e50(&DAT_00556a94,local_28);
    FUN_0000a2c8(&local_28);
    FUN_0030f7e0(auStack_50);
    DAT_00556aa4 = FUN_002f69c4("bomb_smoke",10);
    FUN_00009ae0();
    FUN_0030f7cc(auStack_7c,"models/Fruit/Bomb_purple.mmd");
    FUN_00304664(&local_54,&DAT_0052c308,auStack_7c);
    FUN_00009e50(&DAT_00556a98,local_54);
    FUN_0000a2c8(&local_54);
    FUN_0030f7e0(auStack_7c);
    DAT_00556aa8 = FUN_002f69c4("purple_bomb_smoke",0x11);
    iVar2 = 0;
    do {
      if (*(int *)((int)&DAT_00556a94 + iVar2) != 0) {
        FUN_00012678((int *)((int)&DAT_00556a94 + iVar2));
      }
      iVar2 = iVar2 + 4;
    } while (iVar2 != 8);
    DAT_00556a70 = '\x01';
  }
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0007ebd0 — 0007ebd0
命中: bomb@00418454

```c

void FUN_0007ebd0(int param_1)

{
  undefined *puVar1;
  float fVar2;
  int iVar3;
  undefined4 uVar4;
  int *piVar5;
  undefined2 uVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  undefined4 *puVar10;
  int iVar11;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined8 uVar12;
  undefined4 extraout_s1_01;
  undefined4 uVar13;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  undefined8 uVar14;
  undefined4 extraout_s3_01;
  undefined4 uVar15;
  undefined4 uVar16;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  undefined8 uVar17;
  undefined8 uVar18;
  undefined4 extraout_s5_01;
  undefined4 extraout_s7;
  undefined4 extraout_s7_00;
  undefined8 uVar19;
  undefined8 uVar20;
  undefined8 uVar21;
  undefined8 uVar22;
  undefined8 uVar23;
  undefined4 local_dc [8];
  undefined1 local_bc;
  undefined4 local_b8;
  undefined4 local_b4;
  undefined4 local_b0;
  undefined1 auStack_ac [40];
  undefined1 auStack_84 [40];
  undefined1 auStack_5c [40];
  int local_34;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_34 = *(int *)PTR____stack_chk_guard_004d9044;
  for (iVar3 = *(int *)(param_1 + 0x73c); *(int *)(iVar3 + 0x38) != 0;
      iVar3 = *(int *)(*(int *)(iVar3 + 0x38) + 4)) {
  }
  FUN_0030f870(auStack_5c,iVar3 + 0x48);
  FUN_0030f7cc(auStack_84,"bomb");
  iVar3 = FUN_0030fc80(auStack_5c,auStack_84);
  FUN_0030f7e0(auStack_84);
  FUN_0030f7e0(auStack_5c);
  if (iVar3 == 0) {
    iVar3 = *(int *)(param_1 + 0x784);
    if (iVar3 != 0) {
      *(uint *)(iVar3 + 0xc) = *(uint *)(iVar3 + 0xc) | 0x10;
      *(undefined4 *)(param_1 + 0x784) = 0;
    }
    if (*(int *)(param_1 + 0x788) != 0) goto LAB_0007ef06;
    uVar4 = FUN_000065c4();
    uVar4 = FUN_0000698c(uVar4,2,1);
    *(undefined4 *)(param_1 + 0x788) = uVar4;
    iVar3 = *(int *)(param_1 + 0x784);
LAB_0007ecb0:
    if (iVar3 == 0) goto LAB_0007ef06;
  }
  else {
    if (*(int *)(param_1 + 0x788) != 0) {
      FUN_00008450();
      *(uint *)(*(int *)(param_1 + 0x788) + 0xc) = *(uint *)(*(int *)(param_1 + 0x788) + 0xc) | 0x10
      ;
      *(undefined4 *)(param_1 + 0x788) = 0;
    }
    if (*(int *)(param_1 + 0x784) == 0) {
      uVar4 = FUN_000065c4();
      iVar3 = FUN_0000698c(uVar4,1,1);
      *(int *)(param_1 + 0x784) = iVar3;
      goto LAB_0007ecb0;
    }
  }
  for (iVar3 = *(int *)(param_1 + 0x73c); *(int *)(iVar3 + 0x38) != 0;
      iVar3 = *(int *)(*(int *)(iVar3 + 0x38) + 4)) {
  }
  FUN_0030f870(auStack_ac,iVar3 + 0x48);
  uVar4 = FUN_0030f8f0(auStack_ac);
  uVar4 = FUN_0000aae0(uVar4,0);
  *(undefined4 *)(param_1 + 0x780) = uVar4;
  FUN_0030f7e0(auStack_ac);
  fVar2 = DAT_0052bfe0;
  piVar5 = *(int **)(param_1 + 0x784);
  piVar5[7] = (int)DAT_0052bfe0;
  piVar5[8] = (int)DAT_0052bfe4;
  piVar5[9] = (int)DAT_0052bfe8;
  (**(code **)(*piVar5 + 8))(fVar2,piVar5,0,*(undefined4 *)(param_1 + 0x780),0);
  iVar7 = *(int *)(param_1 + 0x628);
  iVar8 = *(int *)(iVar7 + 0x38);
  iVar3 = iVar7;
  iVar9 = iVar8;
  while (iVar9 != 0) {
    iVar3 = *(int *)(iVar9 + 4);
    iVar9 = *(int *)(iVar3 + 0x38);
  }
  if (((*(float *)(iVar3 + 0x48) != DAT_0052bfe0) || (*(float *)(iVar3 + 0x4c) != DAT_0052bfe4)) ||
     (uVar4 = extraout_s1, uVar16 = extraout_s3, uVar13 = extraout_s5, uVar15 = extraout_s7,
     *(float *)(iVar3 + 0x50) != DAT_0052bfe8)) {
    while (iVar8 != 0) {
      iVar7 = *(int *)(iVar8 + 4);
      iVar8 = *(int *)(iVar7 + 0x38);
    }
    local_b8 = *(undefined4 *)(iVar7 + 0x48);
    local_b4 = *(undefined4 *)(iVar7 + 0x4c);
    local_b0 = *(undefined4 *)(iVar7 + 0x50);
    FUN_00013cec(*(undefined4 *)(param_1 + 0x784),&local_b8);
    uVar4 = extraout_s1_00;
    uVar16 = extraout_s3_00;
    uVar13 = extraout_s5_00;
    uVar15 = extraout_s7_00;
  }
  iVar7 = *(int *)(param_1 + 0x744);
  iVar8 = *(int *)(iVar7 + 0x38);
  iVar3 = iVar7;
  iVar9 = iVar8;
  while (iVar9 != 0) {
    iVar3 = *(int *)(iVar9 + 4);
  
/* ...截断... */
```

## FUN_00055670 — 00055670
命中: bomb@00418454

```c

void FUN_00055670(int *param_1)

{
  undefined *puVar1;
  undefined *puVar2;
  undefined4 uVar3;
  size_t sVar4;
  int iVar5;
  int iVar6;
  char *pcVar7;
  int iVar8;
  
  puVar2 = PTR_DAT_004d9048;
  puVar1 = PTR_DAT_004d9024;
  if (0 < param_1[4]) {
    iVar8 = 0;
    do {
      *(undefined4 *)(*param_1 + iVar8 * 4) = 0xffffffff;
      pcVar7 = *(char **)(param_1[1] + iVar8 * 4);
      sVar4 = _strlen(pcVar7);
      iVar5 = FUN_002f69c4(pcVar7,sVar4);
      if (((DAT_005a7950 & 1) == 0) && (iVar6 = ___cxa_guard_acquire(&DAT_005a7950), iVar6 != 0)) {
        DAT_005a7948 = FUN_002f69c4("bomb",4);
        DAT_005a794c = FUN_002f69c4("Bomb",4);
        ___cxa_guard_release(&DAT_005a7950);
      }
      if ((iVar5 == DAT_005a7948) || (iVar5 == DAT_005a794c)) {
        *(undefined4 *)(*param_1 + iVar8 * 4) = 0xfffffffe;
      }
      else {
        if (iVar5 == DAT_005a7924) {
          FUN_0001d10c(puVar2);
          iVar5 = FUN_0005ef30(puVar1);
          if (iVar5 == 1) {
            do {
              iVar5 = FUN_0000af04(0);
              *(int *)(*param_1 + iVar8 * 4) = iVar5;
              FUN_0001d10c(puVar2);
              iVar6 = FUN_000617a8();
            } while (iVar5 == iVar6);
            goto LAB_0005579a;
          }
          uVar3 = FUN_0000af04(0);
        }
        else if (iVar5 == DAT_005f949c) {
          FUN_0001d10c(puVar2);
          uVar3 = FUN_000617a8();
        }
        else {
          uVar3 = FUN_0000aae0(*(undefined4 *)(param_1[1] + iVar8 * 4),0);
        }
        *(undefined4 *)(*param_1 + iVar8 * 4) = uVar3;
      }
LAB_0005579a:
      iVar8 = iVar8 + 1;
    } while (iVar8 < param_1[4]);
  }
  return;
}


```

## FUN_00020c38 — 00020c38
命中: bomb@00418454

```c

void FUN_00020c38(undefined4 *param_1)

{
  undefined *puVar1;
  undefined *puVar2;
  int iVar3;
  undefined4 uVar4;
  undefined **local_5c;
  undefined *local_58;
  undefined4 local_54 [8];
  undefined1 local_34;
  undefined4 local_30;
  undefined4 local_2c;
  undefined4 local_28;
  int local_24;
  
  puVar2 = PTR_DAT_004d9048;
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  if (PTR_DAT_004d9048[0x17] == '\0') {
    if (((DAT_005577f4 & 1) == 0) && (iVar3 = ___cxa_guard_acquire(&DAT_005577f4), iVar3 != 0)) {
      DAT_005577f0 = FUN_002f69c4("bomb",4);
      ___cxa_guard_release(&DAT_005577f4);
    }
    FUN_00027588(*(undefined4 *)(puVar2 + 0x5c),"bomb",DAT_005577f0,1,1,1);
    *(undefined4 *)(puVar2 + 0x24) = 0x404ccccd;
    local_30 = *param_1;
    local_2c = param_1[1];
    local_28 = param_1[2];
    FUN_0000577c(local_30,*(undefined4 *)(puVar2 + 0x58),&local_30,0x3fcccccd,0x40000000,0x41100000)
    ;
    DAT_00557804 = *param_1;
    DAT_00557808 = param_1[1];
    DAT_0055780c = param_1[2];
    uVar4 = *(undefined4 *)(puVar2 + 0x1a4);
    DAT_005577b0 = 0;
    local_5c = &PTR_LAB_00009c18_1_0052bf38;
    local_58 = PTR_FUN_004d9058;
    local_34 = 1;
    local_54[0] = 0;
    FUN_0000a23c(&local_5c,local_54);
    FUN_0002bb34(uVar4,"Bomb-explode",0x3f800000,0x3f800000,local_54,0);
    FUN_0000a298(local_54);
  }
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0005bf9c — 0005bf9c
命中: bandito@0041b957

```c

void FUN_0005bf9c(int *param_1)

{
  longlong lVar1;
  undefined *puVar2;
  char cVar3;
  undefined4 uVar4;
  int *piVar5;
  int iVar6;
  uint uVar7;
  int iVar8;
  BaseAggregateType *pBVar9;
  undefined4 uVar10;
  undefined4 uVar11;
  undefined4 uVar12;
  uint uVar13;
  int iVar14;
  int iVar15;
  code *pcVar16;
  int iVar17;
  undefined1 *puVar18;
  char *pcVar19;
  undefined **local_418;
  undefined1 *local_414;
  undefined1 local_3f8;
  undefined **local_3f4;
  undefined1 *local_3f0;
  undefined1 local_3d4;
  undefined4 local_3d0 [8];
  undefined1 local_3b0;
  undefined4 local_3ac [8];
  undefined1 local_38c;
  undefined1 auStack_388 [40];
  undefined1 auStack_360 [40];
  undefined1 auStack_338 [40];
  undefined1 auStack_310 [40];
  undefined1 auStack_2e8 [40];
  undefined1 auStack_2c0 [40];
  undefined1 auStack_298 [40];
  undefined1 auStack_270 [40];
  undefined1 auStack_248 [40];
  undefined1 auStack_220 [40];
  undefined1 auStack_1f8 [40];
  undefined1 auStack_1d0 [40];
  undefined1 auStack_1a8 [40];
  undefined1 auStack_180 [40];
  undefined1 auStack_158 [40];
  undefined1 auStack_130 [40];
  undefined1 auStack_108 [40];
  undefined1 auStack_e0 [40];
  undefined1 auStack_b8 [40];
  undefined1 auStack_90 [40];
  undefined1 local_68 [4];
  char acStack_64 [64];
  int iStack_24;
  
  puVar2 = PTR_DAT_004d9048;
  iStack_24 = *(int *)PTR____stack_chk_guard_004d9044;
  PTR_DAT_004d9048[0x1b1] = 0;
  *(undefined4 *)(puVar2 + 0x20) = 0x3f800000;
  *(undefined1 *)(param_1 + 0x2e) = 0;
  *(undefined1 *)((int)param_1 + 0xb9) = 0;
  (**(code **)(*param_1 + 0x10))(param_1);
  iVar15 = param_1[0x2b];
  FUN_0030f7cc(auStack_90,"backgroundControl.score.score");
  iVar15 = FUN_0039725c(iVar15,auStack_90);
  FUN_0030f7e0(auStack_90);
  if (iVar15 != 0) {
    if (*(int *)(PTR_DAT_004d9048 + 0x10) == 1) {
      FUN_00083564(iVar15);
    }
    else {
      *(undefined4 *)(iVar15 + 0x884) = 0;
      FUN_003d0bf4(iVar15);
    }
    *(undefined1 *)(iVar15 + 0x888) = 0;
    *(undefined1 *)(iVar15 + 0x889) = 1;
    *(undefined4 *)(iVar15 + 0x880) = 0;
  }
  iVar14 = param_1[0x2b];
  FUN_0030f7cc(auStack_b8,"backgroundControl.score.bestScore");
  iVar14 = FUN_0039725c(iVar14,auStack_b8);
  FUN_0030f7e0(auStack_b8);
  if (iVar14 != 0) {
    uVar4 = FUN_0001ca48();
    *(undefined4 *)(iVar14 + 0x880) = uVar4;
    FUN_003d0bf4(iVar14);
  }
  iVar14 = param_1[0x2b];
  FUN_0030f7cc(auStack_e0,"backgroundControl.score.newBest");
  piVar5 = (int *)FUN_0039725c(iVar14,auStack_e0);
  FUN_0030f7e0(auStack_e0);
  if (piVar5 != (int *)0x0) {
    local_68[0] = 0;
    FUN_0001da28(piVar5[0x98],local_68);
    FUN_00396d98(piVar5,1);
    FUN_0030f7cc(auStack_108,"bestScore");
    iVar14 = FUN_0039725c(piVar5,auStack_108);
    FUN_0030f7e0(auStack_108);
    if (iVar14 != 0) {
      uVar4 = FUN_0001cd94(0);
      *(undefined4 *)(iVar14 + 0x880) = uVar4;
      FUN_003d0bf4(iVar14);
    }
  }
  iVar14 = FUN_0001ca48();
  iVar6 = FUN_0001cd94(0);
  if (iVar14 <= iVar6) {
    if (*(int *)(PTR_DAT_004d9048 + 0x10) == 1) {
      if (piVar5 != (int *)0x0) {
        local_68[0] = 1;
        FUN_0001da28(piVar5[0x98],local_68);
        pcVar16 = *(code **)(*piVar5 + 0x40);
        FUN_0030f7cc(auStack_130,"animate_in_delay");
        (*pcVar16)(piVar5,auStack_130,1);
        FUN_0030f7e0(auStack_130);
      }
    }
    else if (iVar15 != 0) {
      *(int **)(iVar15 + 0x880) = piVar5;
    }
  }
  iVar15 = param_1[0x2b];
  FUN_0030f7cc(auStack_158,"backgroundControl.fruitFact.poster.animation_wrapper.text2");
  iVar15 = FUN_0039725c(iVar15,auStack_158);
  FUN_0030f7e0(auStack_158);
  if (iVar15 != 0) {
    uVar7 = FUN_000276e8(*(undefined4 *)(PTR_DAT_004d9048 + 0x5c),"lastFruitFact");
    puVar2 = PTR_DAT_004d9050;
    if (uVar7 == 0) {
      lVar1 = (ulonglong)*(uint *)PTR_DAT_004d9050 * (ulonglong)*(uint *)(PTR_DAT_004d9050 + 8);
      uVar
/* ...截断... */
```

## FUN_0006d80c — 0006d80c
命中: bandito@0041cbb2, bandito@0041cbc8

(反编译未完成)

## FUN_002e1100 — 002e1100
命中: achiev@00418250

```c

void FUN_002e1100(int param_1)

{
  bool bVar1;
  int iVar2;
  undefined4 uVar3;
  char *pcVar4;
  char *pcVar5;
  char *pcVar6;
  int iVar7;
  void *pvVar8;
  int *piVar9;
  undefined4 uVar10;
  int iVar11;
  undefined4 uVar12;
  undefined1 auStack_48 [8];
  allocator aaStack_40 [4];
  int local_3c;
  int local_38;
  void *local_34;
  int local_30;
  void *local_2c;
  void *local_28 [2];
  
  iVar2 = FUN_003527fc();
  uVar10 = *(undefined4 *)(iVar2 + 0x58);
  FUN_00026470();
  uVar3 = FUN_0030f8f0(&DAT_00530e90);
  iVar2 = FUN_00350cc8(uVar10,uVar3,"IAchievementService");
  if ((iVar2 != 0) && (iVar2 = FUN_0030c328(iVar2,"achievement"), iVar2 != 0)) {
    do {
      pcVar4 = (char *)FUN_0030c660(iVar2,"id");
      uVar3 = FUN_0030c660(iVar2,"name");
      uVar10 = FUN_0030c660(iVar2,"providerID");
      pcVar5 = (char *)FUN_0030c660(iVar2,"range");
      pcVar6 = (char *)FUN_0030c660(iVar2,"visible");
      iVar11 = 100;
      if ((pcVar5 != (char *)0x0) && (iVar11 = _atoi(pcVar5), iVar11 < 1)) {
        return;
      }
      uVar12 = 1;
      if (pcVar6 != (char *)0x0) {
        iVar7 = _strcmp(pcVar6,"TRUE");
        uVar12 = 1;
        if (iVar7 != 0) {
          iVar7 = _strcmp(pcVar6,"True");
          uVar12 = 1;
          if (iVar7 != 0) {
            iVar7 = _strcmp(pcVar6,"true");
            uVar12 = 1;
            if (iVar7 != 0) {
              iVar7 = _strcmp(pcVar6,"1");
              uVar12 = 0;
              if (iVar7 == 0) {
                uVar12 = 1;
              }
            }
          }
        }
      }
      pvVar8 = operator_new(0x1c);
      FUN_002e2a0c(pvVar8,param_1,uVar3,pcVar4,uVar10,iVar11,uVar12);
      local_28[0] = pvVar8;
      if (pvVar8 != (void *)0x0) {
        std::string::string((string *)&local_3c,pcVar4,aaStack_40);
        std::string::string((string *)&local_38,(string *)&local_3c);
        local_34 = pvVar8;
        std::string::string((string *)&local_30,(string *)&local_38);
        local_2c = local_34;
        FUN_002e1e88(auStack_48,param_1 + 0x84,(string *)&local_30);
        if ((allocator *)(local_30 + -0xc) != (allocator *)PTR__S_empty_rep_storage_004d9038) {
          piVar9 = (int *)(local_30 + -4);
          DataMemoryBarrier(0x1b);
          do {
            ExclusiveAccess(piVar9);
            iVar11 = *piVar9;
            bVar1 = (bool)hasExclusiveAccess(piVar9);
          } while (!bVar1);
          *piVar9 = iVar11 + -1;
          DataMemoryBarrier(0x1b);
          if (iVar11 < 1) {
            std::string::_Rep::_M_destroy((allocator *)(local_30 + -0xc));
          }
        }
        if ((allocator *)(local_38 + -0xc) != (allocator *)PTR__S_empty_rep_storage_004d9038) {
          piVar9 = (int *)(local_38 + -4);
          DataMemoryBarrier(0x1b);
          do {
            ExclusiveAccess(piVar9);
            iVar11 = *piVar9;
            bVar1 = (bool)hasExclusiveAccess(piVar9);
          } while (!bVar1);
          *piVar9 = iVar11 + -1;
          DataMemoryBarrier(0x1b);
          if (iVar11 < 1) {
            std::string::_Rep::_M_destroy((allocator *)(local_38 + -0xc));
          }
        }
        if ((allocator *)(local_3c + -0xc) != (allocator *)PTR__S_empty_rep_storage_004d9038) {
          piVar9 = (int *)(local_3c + -4);
          DataMemoryBarrier(0x1b);
          do {
            ExclusiveAccess(piVar9);
            iVar11 = *piVar9;
            bVar1 = (bool)hasExclusiveAccess(piVar9);
          } while (!bVar1);
          *piVar9 = iVar11 + -1;
          DataMemoryBarrier(0x1b);
          if (iVar11 < 1) {
            std::string::_Rep::_M_destroy((allocator *)(local_3c + -0xc));
          }
        }
        FUN_002e19a8(param_1 + 0x60,local_28);
      }
      iVar2 = FUN_0030c3a0(iVar2,"achievement");
    } while (iVar2 != 0);
  }
  return;
}


```

## FUN_0026ea7c — 0026ea7c
命中: achiev@00418250

```c

void FUN_0026ea7c(int param_1,int *param_2)

{
  int iVar1;
  int *piVar2;
  int *piVar3;
  int iVar4;
  int *piVar5;
  char *pcVar6;
  undefined4 uVar7;
  undefined *puVar8;
  int iVar9;
  string asStack_2c [4];
  int *local_28;
  allocator<char> aaStack_24 [4];
  
  iVar1 = (**(code **)(*param_2 + 0x4c))(param_2);
  if (iVar1 != 0) {
    piVar2 = (int *)(**(code **)(*param_2 + 0x130))(param_2,"transactionals");
    iVar1 = (**(code **)(*piVar2 + 0x48))();
    if ((iVar1 != 0) && (iVar1 = (**(code **)(*piVar2 + 0x90))(), iVar1 != 0)) {
      iVar9 = 0;
      do {
        piVar3 = (int *)(**(code **)(*piVar2 + 0x8c))(piVar2,iVar9);
        iVar4 = (**(code **)(*piVar3 + 0x4c))();
        if (iVar4 != 0) {
          piVar5 = (int *)(**(code **)(*piVar3 + 0x130))(piVar3,"type");
          iVar4 = (**(code **)(*piVar5 + 0x38))();
          if (iVar4 == 0) {
            local_28 = (int *)0x0;
            pcVar6 = (char *)(**(code **)(*piVar5 + 0x60))(piVar5,"");
            std::allocator<char>::allocator();
            std::string::string(asStack_2c,pcVar6,(allocator *)aaStack_24);
            std::allocator<char>::~allocator(aaStack_24);
            iVar4 = std::string::compare((char *)asStack_2c);
            if (iVar4 == 0) {
              piVar5 = operator_new(0x14);
              iVar4 = *(int *)(param_1 + 8);
              puVar8 = &UNK_0053cf50;
LAB_0026eb72:
              *piVar5 = (int)(puVar8 + 8);
              piVar5[1] = 0;
              piVar5[2] = iVar4;
              std::string::string((string *)(piVar5 + 3));
              piVar5[4] = 0;
LAB_0026ecb6:
              local_28 = piVar5;
              (**(code **)(*piVar5 + 0x1c))(piVar5,piVar3);
              (**(code **)(*piVar5 + 8))(piVar5);
              FUN_0027cd70(param_1 + 0x14,&local_28);
            }
            else {
              iVar4 = std::string::compare((char *)asStack_2c);
              if (iVar4 == 0) {
                piVar5 = operator_new(0x14);
                iVar4 = *(int *)(param_1 + 8);
                puVar8 = &UNK_0053cf20;
                goto LAB_0026eb72;
              }
              iVar4 = std::string::compare((char *)asStack_2c);
              if (iVar4 == 0) {
                piVar5 = operator_new(0x14);
                iVar4 = *(int *)(param_1 + 8);
                puVar8 = &UNK_0053cef0;
                goto LAB_0026eb72;
              }
              iVar4 = std::string::compare((char *)asStack_2c);
              if (iVar4 == 0) {
                piVar5 = operator_new(0x18);
                iVar4 = *(int *)(param_1 + 8);
                *piVar5 = (int)&PTR_FUN_00269664_1_0053cec8;
                piVar5[1] = 0;
                piVar5[2] = iVar4;
                std::string::string((string *)(piVar5 + 3));
                std::string::string((string *)(piVar5 + 4));
                std::string::string((string *)(piVar5 + 5));
                goto LAB_0026ecb6;
              }
              iVar4 = std::string::compare((char *)asStack_2c);
              if (iVar4 == 0) {
                piVar5 = operator_new(0x1c);
                FUN_00269354(piVar5,*(undefined4 *)(param_1 + 8));
                goto LAB_0026ecb6;
              }
              iVar4 = std::string::compare((char *)asStack_2c);
              if (iVar4 == 0) {
                piVar5 = operator_new(0x58);
                iVar4 = *(int *)(param_1 + 8);
                *piVar5 = (int)&DAT_0053d308;
                piVar5[1] = 0;
                piVar5[2] = iVar4;
                std::string::string((string *)(piVar5 + 3));
                std::string::string((string *)(piVar5 + 4));
                FUN_002236a8(piVar5 + 5);
                goto LAB_0026ecb6;
              }
            }
            std::string::~string(asStack_2c);
          }
        }
        iVar9 = iVar9 + 1;
      } while (iVar1 != iVar9);
    }
    piVar2 = (int *)(**(code **)(*param_2 + 
/* ...截断... */
```

## FUN_00045b78 — 00045b78
命中: achiev@00418250

```c

void FUN_00045b78(undefined4 *param_1,undefined4 param_2,uint param_3,undefined4 *param_4,
                 int param_5,int param_6)

{
  char *pcVar1;
  char cVar2;
  undefined *puVar3;
  undefined *puVar4;
  char *pcVar5;
  undefined4 *puVar6;
  void *pvVar7;
  undefined ***pppuVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  undefined4 *puVar11;
  undefined4 extraout_s1;
  undefined8 uVar12;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined4 uVar13;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  undefined4 extraout_s3_01;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  undefined4 extraout_s5_01;
  undefined4 extraout_s7;
  undefined8 uVar14;
  undefined4 local_c8;
  undefined4 local_c4;
  undefined4 local_c0;
  undefined4 local_bc;
  undefined4 local_b8;
  undefined4 local_b4;
  undefined1 local_b0;
  undefined1 local_af;
  undefined1 local_ae;
  undefined1 local_ad;
  undefined4 local_ac;
  undefined4 local_a8;
  undefined4 local_a4;
  undefined4 local_a0;
  undefined1 local_9c;
  undefined1 local_9b;
  undefined1 local_9a;
  undefined1 local_99;
  undefined1 local_98;
  undefined1 local_97;
  undefined1 local_96;
  undefined1 local_95;
  undefined4 local_94;
  undefined **local_90;
  undefined *local_8c;
  undefined1 local_70;
  undefined **local_6c;
  undefined *local_68;
  undefined1 local_4c;
  undefined **local_48;
  undefined *local_44;
  undefined1 local_28;
  int local_24;
  
  puVar3 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_0003ee7c(param_1);
  *param_1 = &PTR_FUN_00046068_1_005382f8;
  param_1[0x66] = 0;
  param_1[99] = param_5;
  FUN_00026e98(param_1 + 0x1d,*param_4);
  pcVar5 = (char *)(param_1 + 0x22);
  *(undefined1 *)((int)param_1 + 0x32) = 0;
  FUN_002f702c(pcVar5,0x80,"%s",param_2);
  param_1[99] = param_5;
  param_1[0x20] = 0;
  param_1[0x21] = param_3;
  param_1[0xd] = 0x200;
  if (param_5 == 1) {
    pppuVar8 = &local_6c;
    local_4c = 1;
    local_6c = (undefined **)0x0;
    uVar10 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a8);
    FUN_0000a298(pppuVar8);
    local_4c = 0;
    local_6c = &PTR_LAB_00009c18_1_0052bf38;
    local_68 = PTR_FUN_004d9154;
    FUN_00072874(uVar10,0x3ecccccd,0x3f800000,pppuVar8);
  }
  else {
    if (param_5 != 2) goto LAB_00045cc0;
    pppuVar8 = &local_48;
    local_28 = 1;
    local_48 = (undefined **)0x0;
    uVar10 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a8);
    FUN_0000a298(pppuVar8);
    local_28 = 0;
    local_48 = &PTR_LAB_00009c18_1_0052bf38;
    local_44 = PTR_FUN_004d9154;
    FUN_00072878(uVar10,0x3ecccccd,0x3f800000,pppuVar8);
  }
  FUN_0000a298(pppuVar8);
LAB_00045cc0:
  puVar4 = PTR_DAT_004d9048;
  local_70 = 1;
  local_90 = (undefined **)0x0;
  uVar10 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
  FUN_0000a298(&local_90);
  local_70 = 0;
  local_90 = &PTR_LAB_00009c18_1_0052bf38;
  local_8c = PTR_FUN_004d9058;
  FUN_0002bb34(uVar10,"achievement",0x3f800000,0x3f800000,&local_90,0);
  FUN_0000a298(&local_90);
  puVar6 = param_1 + 0x42;
  if (param_6 == 0) {
    *(undefined1 *)puVar6 = 0;
  }
  else {
    FUN_002f702c(puVar6,0x80,"%s");
  }
  puVar11 = param_1 + 0x62;
  if (0x7fffffff < param_3 || param_5 != 1) {
    *(undefined1 *)puVar11 = 0;
  }
  else {
    FUN_002f702c(puVar11,4,"%i",param_3);
  }
  cVar2 = *pcVar5;
  pcVar1 = pcVar5;
  while (cVar2 != '\0') {
    if ((byte)(cVar2 + 0x9fU) < 0x1a) {
      *pcVar1 = cVar2 + -0x20;
    }
    pcVar1 = pcVar1 + 1;
    cVar2 = *pcVar1;
  }
  pvVar7 = operator_new(0xf4);
  if (param_5 == 0) {
    FUN_00320590(pvVar7,*(undefined4 *)(puVar4 + 0x64c),0x41600000,0x89,0x32,0xf,2,3);
    param_1[0x65] = pvVar7;
    FUN_003213c4(pvVar7,pcVar5);
    param_1[100] = 0;
  }
  else {
    FUN_00320590(pvVar7,*(undefined4 *)(puVar4 + 0x64c),0x41400000,0x89,0x14,0xd,
/* ...截断... */
```

## FUN_0002c540 — 0002c540
命中: achiev@00418250

```c

void FUN_0002c540(int *param_1,int param_2)

{
  undefined1 *puVar1;
  undefined4 uVar2;
  int iVar3;
  size_t sVar4;
  undefined4 *puVar5;
  int iVar7;
  int iVar8;
  char *pcVar9;
  undefined4 local_3c;
  int local_38 [3];
  undefined1 local_2c;
  undefined1 local_2b;
  undefined1 local_2a;
  undefined1 local_29;
  undefined4 local_28;
  int local_24;
  int *piVar6;
  
  FUN_0030c6c0(param_2,"min",param_1);
  FUN_0030c6c0(param_2,"max",param_1 + 1);
  local_24 = -1;
  FUN_0030c6c0(param_2,"equals",&local_24);
  if (-1 < local_24) {
    *param_1 = local_24;
    param_1[1] = local_24;
  }
  FUN_0030c6c0(param_2,"points");
  FUN_0030c6c0(param_2,"multiple",param_1 + 0xe);
  uVar2 = FUN_0030c660(param_2,"texture");
  FUN_0003925c(&local_28,uVar2);
  FUN_00026e98(param_1 + 0x35,local_28);
  FUN_00026ed0(&local_28);
  iVar3 = FUN_0030c660(param_2,"colour");
  if (iVar3 != 0) {
    uVar2 = FUN_0030c660(param_2,"colour");
    FUN_003ebfe0(&local_2c,uVar2);
    *(undefined1 *)((int)param_1 + 0xc3) = local_29;
    *(undefined1 *)((int)param_1 + 0xc2) = local_2a;
    *(undefined1 *)((int)param_1 + 0xc1) = local_2b;
    *(undefined1 *)(param_1 + 0x30) = local_2c;
  }
  local_38[0] = 0;
  local_38[1] = 0;
  local_38[2] = 0;
  uVar2 = FUN_0030c660(param_2,"valuesEqual");
  iVar3 = FUN_000395ac(uVar2,local_38);
  if (0 < iVar3) {
    iVar7 = 0;
    do {
      pcVar9 = *(char **)(local_38[0] + iVar7 * 4);
      sVar4 = _strlen(pcVar9);
      local_3c = FUN_002f69c4(pcVar9,sVar4);
      FUN_00004ac8(param_1 + 0x31,&local_3c);
      iVar7 = iVar7 + 1;
    } while (iVar3 != iVar7);
  }
  iVar3 = *(int *)(param_2 + 0x4c);
  if (iVar3 == param_2 + 0x2c) {
    iVar3 = 0;
  }
  if (iVar3 != 0) {
    do {
      iVar8 = *(int *)(iVar3 + 0x14);
      iVar7 = FUN_000396c4(iVar8 + 8,"min-");
      if (iVar7 == 1) {
        sVar4 = _strlen((char *)(iVar8 + 0xc));
        FUN_002f69c4((char *)(iVar8 + 0xc),sVar4);
        uVar2 = FUN_0030d3b8(iVar3);
        puVar1 = &stack0xffffffec;
        piVar6 = param_1 + 2;
LAB_0002c712:
        puVar5 = (undefined4 *)FUN_0002cd3c(piVar6,puVar1 + -0x2c);
        *puVar5 = uVar2;
      }
      else {
        iVar7 = FUN_000396c4(iVar8 + 8,"max-");
        if (iVar7 == 1) {
          sVar4 = _strlen((char *)(iVar8 + 0xc));
          FUN_002f69c4((char *)(iVar8 + 0xc),sVar4);
          uVar2 = FUN_0030d3b8(iVar3);
          puVar1 = &stack0xffffffe8;
          piVar6 = param_1 + 8;
          goto LAB_0002c712;
        }
      }
      iVar3 = FUN_0030cc6c(iVar3);
    } while (iVar3 != 0);
  }
  pcVar9 = (char *)FUN_0030c660(param_2,"achievement");
  if (pcVar9 == (char *)0x0) {
    param_1[0x34] = 0;
  }
  else {
    sVar4 = _strlen(pcVar9);
    iVar3 = FUN_002f69c4(pcVar9,sVar4);
    param_1[0x34] = iVar3;
    iVar3 = FUN_0030c660(param_2,"points");
    if (iVar3 == 0) {
      param_1[0xf] = -1;
    }
  }
  iVar3 = FUN_0030cd00(param_2);
  if (iVar3 == 0) {
    *(char *)(param_1 + 0x10) = '\0';
  }
  else {
    uVar2 = FUN_0030cd00(param_2);
    pcVar9 = (char *)FUN_00038844(uVar2,0);
    _strcpy((char *)(param_1 + 0x10),pcVar9);
  }
  std::vector<std::string,std::allocator<std::string>>::~vector
            ((vector<std::string,std::allocator<std::string>> *)local_38);
  return;
}


```

## FUN_0026a308 — 0026a308
命中: achiev@00418250

```c

void FUN_0026a308(int param_1,int *param_2)

{
  int *piVar1;
  undefined4 uVar2;
  code *pcVar3;
  
  piVar1 = (int *)(**(code **)(*param_2 + 0x128))(param_2,"type");
  (**(code **)(*piVar1 + 0xe4))(piVar1,"achievement");
  piVar1 = (int *)(**(code **)(*param_2 + 0x128))(param_2,&DAT_00460814);
  pcVar3 = *(code **)(*piVar1 + 0xe4);
  uVar2 = std::string::c_str();
  (*pcVar3)(piVar1,uVar2);
  piVar1 = (int *)(**(code **)(*param_2 + 0x128))(param_2,&DAT_00460857);
  (**(code **)(*piVar1 + 0xe4))(piVar1,&DAT_0046085a);
  piVar1 = (int *)(**(code **)(*param_2 + 0x128))(param_2,"value");
  (**(code **)(*piVar1 + 0xe8))(piVar1,*(undefined4 *)(param_1 + 0x10));
  return;
}


```

## FUN_0004afe8 — 0004afe8
命中: dojo@0041aea9

```c

void FUN_0004afe8(int param_1,int param_2)

{
  uint uVar1;
  undefined4 uVar2;
  int iVar3;
  int iVar4;
  undefined4 uVar5;
  undefined4 extraout_s1;
  undefined8 uVar6;
  undefined4 extraout_s3;
  undefined8 uVar7;
  undefined1 local_24;
  undefined1 local_23;
  undefined1 local_22;
  undefined1 local_21;
  undefined1 local_20;
  undefined1 local_1f;
  undefined1 local_1e;
  undefined1 local_1d;
  undefined1 local_1c;
  undefined1 local_1b;
  undefined1 local_1a;
  undefined1 local_19;
  undefined1 local_18;
  undefined1 local_17;
  undefined1 local_16;
  undefined1 local_15;
  
  *(int *)(param_1 + 0xa0) = param_2;
  uVar1 = (uint)*(byte *)(*(int *)(param_1 + 0x9c) + 0xc9);
  if (uVar1 != 0) {
    iVar4 = *(int *)(param_1 + 0x98);
    if (iVar4 != 0) {
      uVar1 = *(uint *)(param_2 + 0x278);
    }
    if ((iVar4 != 0 && uVar1 != 0) && (*(int *)(param_1 + 0x7c) == 1)) {
      if (*(int *)(uVar1 + 0xc) < 1) {
        FUN_00026e98(iVar4 + 0x74,*(undefined4 *)(PTR_DAT_004d9048 + 0x650));
        uVar5 = *(undefined4 *)(param_1 + 0x98);
        uVar2 = FUN_00038844("DOJO_OPTION_ANDROID_01",0);
        local_20 = (undefined1)DAT_005a74d8;
        local_1f = (undefined1)((uint)DAT_005a74d8 >> 8);
        local_1e = (undefined1)((uint)DAT_005a74d8 >> 0x10);
        local_1d = (undefined1)((uint)DAT_005a74d8 >> 0x18);
        local_24 = (undefined1)DAT_005a74d4;
        local_23 = (undefined1)((uint)DAT_005a74d4 >> 8);
        local_22 = (undefined1)((uint)DAT_005a74d4 >> 0x10);
        local_21 = (undefined1)((uint)DAT_005a74d4 >> 0x18);
        FUN_00041d00(uVar5,uVar2,&local_20,&local_24,0,0x41800000,1,1);
        FUN_0000e4e8(*(undefined4 *)(*(int *)(param_1 + 0x98) + 0x134),0);
        if (*(int *)(*(int *)(param_1 + 0x98) + 0x134) == 0) {
          return;
        }
        uVar2 = FUN_0000aae0("mango",0);
        uVar2 = FUN_0000bd54(*(undefined4 *)(*(int *)(param_1 + 0x98) + 0x134),uVar2,0x3f800000);
        iVar4 = *(int *)(param_1 + 0x98);
      }
      else {
        uVar2 = FUN_00038844("MENU_TEXTURE_55",0);
        local_18 = (undefined1)DAT_005a74dc;
        local_17 = (undefined1)((uint)DAT_005a74dc >> 8);
        local_16 = (undefined1)((uint)DAT_005a74dc >> 0x10);
        local_15 = (undefined1)((uint)DAT_005a74dc >> 0x18);
        local_1c = (undefined1)DAT_005a74d4;
        local_1b = (undefined1)((uint)DAT_005a74d4 >> 8);
        local_1a = (undefined1)((uint)DAT_005a74d4 >> 0x10);
        local_19 = (undefined1)((uint)DAT_005a74d4 >> 0x18);
        FUN_00041d00(iVar4,uVar2,&local_18,&local_1c,0,0x41800000,1,1);
        if (*(int *)(*(int *)(param_1 + 0x98) + 0x134) == 0) {
          return;
        }
        uVar2 = FUN_0000aae0("black_pineapple",0);
        FUN_0000e4e8(*(undefined4 *)(*(int *)(param_1 + 0x98) + 0x134),0);
        FUN_0000bd54(*(undefined4 *)(*(int *)(param_1 + 0x98) + 0x134),uVar2,0x3f800000);
        iVar4 = *(int *)(param_1 + 0x98);
        uVar6 = CONCAT44(extraout_s1,DAT_0004b1d0);
        iVar3 = *(int *)(iVar4 + 0x134);
        uVar7 = FloatVectorMult(CONCAT44(extraout_s3,*(undefined4 *)(iVar3 + 0x28)),uVar6,2,0x20);
        *(int *)(iVar3 + 0x28) = (int)uVar7;
        uVar7 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar7 >> 0x20),
                                         *(undefined4 *)(iVar3 + 0x2c)),uVar6,2,0x20);
        *(int *)(iVar3 + 0x2c) = (int)uVar7;
        uVar6 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar7 >> 0x20),
                                         *(undefined4 *)(iVar3 + 0x30)),uVar6,2,0x20);
        uVar2 = (undefined4)uVar6;
        *(undefined4 *)(iVar3 + 0x30) = uVar2;
      }
      FUN_00041c80(uVar2,iVar4);
    }
  }
  return;
}


```

## FUN_000718b0 — 000718b0
命中: combo@00471312

```c

void FUN_000718b0(int param_1,int param_2)

{
  undefined *puVar1;
  undefined *puVar2;
  int iVar3;
  int iVar4;
  size_t sVar5;
  undefined4 uVar6;
  int iVar7;
  undefined **local_c0;
  undefined *local_bc;
  undefined1 local_a0;
  undefined **local_9c;
  undefined *local_98;
  undefined1 local_7c;
  undefined1 auStack_78 [40];
  undefined4 local_50;
  undefined4 local_4c;
  char acStack_44 [6];
  undefined1 auStack_3e [26];
  int local_24;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  if ((2 < *(int *)(param_2 + 0x8c)) &&
     (iVar7 = *(int *)(*(int *)(param_1 + 0x54) + 0x18), iVar7 != 0)) {
    FUN_00074428(iVar7);
    if (((DAT_005a86dc & 1) == 0) && (iVar3 = ___cxa_guard_acquire(&DAT_005a86dc), iVar3 != 0)) {
      FUN_0030f7cc(&DAT_005a86e4,"comboValue");
      ___cxa_atexit(PTR_FUN_004d9034,&DAT_005a86e4,PTR___mh_execute_header_004d9040);
      ___cxa_guard_release(&DAT_005a86dc);
    }
    iVar3 = FUN_0039725c(iVar7,&DAT_005a86e4);
    if (iVar3 != 0) {
      local_4c = 0;
      local_50 = 0x2b;
      FUN_002f702c((uint)&local_50 | 1,8,"%i",*(undefined4 *)(param_2 + 0x8c));
      FUN_0030f7cc(auStack_78,&local_50);
      FUN_00022950(*(undefined4 *)(iVar3 + 0x7dc),auStack_78);
      FUN_0030f7e0(auStack_78);
    }
    iVar4 = *(int *)(param_2 + 0x8c) + -3;
    iVar3 = 0;
    if ((0 < iVar4) && (iVar3 = iVar4, 1 < iVar4)) {
      iVar3 = 2;
    }
    FUN_00074254(iVar7,param_2 + 0x104,iVar3);
    puVar2 = PTR_DAT_004d9048;
    local_7c = 1;
    local_9c = (undefined **)0x0;
    uVar6 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a8);
    FUN_0000a298(&local_9c);
    local_7c = 0;
    local_9c = &PTR_LAB_00009c18_1_0052bf38;
    local_98 = PTR_FUN_004d9154;
    FUN_0007250c(uVar6,0x3ecccccd,0x3f800000,&local_9c);
    FUN_0000a298(&local_9c);
    if (*(int *)(param_1 + 0x4c) != 0) {
      FUN_0002bf3c(*(undefined4 *)(puVar2 + 0x1a4));
    }
    _memcpy(acStack_44,"combo-",0x20);
    iVar3 = *(int *)(param_2 + 0x8c) + -2;
    iVar7 = 1;
    if ((1 < iVar3) && (iVar7 = iVar3, 4 < iVar3)) {
      iVar7 = 5;
    }
    FUN_002f702c(auStack_3e,0x20,"%i",iVar7);
    sVar5 = _strlen(acStack_44);
    uVar6 = FUN_002f69c4(acStack_44,sVar5);
    *(undefined4 *)(param_1 + 0x4c) = uVar6;
    local_a0 = 1;
    uVar6 = *(undefined4 *)(puVar2 + 0x1a4);
    local_c0 = (undefined **)0x0;
    FUN_0000a298(&local_c0);
    local_a0 = 0;
    local_c0 = &PTR_LAB_00009c18_1_0052bf38;
    local_bc = PTR_FUN_004d9058;
    FUN_0002bc94(uVar6,acStack_44,0x3e800000,0x3f800000);
    FUN_0000a298(&local_c0);
  }
  if (*(int *)puVar1 == local_24) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

