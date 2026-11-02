# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_00061128 — 00061128

- 函数名: FUN_00061128
- 函数体: 423 字节
- 调用者数: 3 / 被调用者数: 19

```c

void FUN_00061128(int param_1,int param_2)

{
  undefined *puVar1;
  int iVar2;
  undefined4 uVar3;
  undefined4 *puVar4;
  undefined4 uVar5;
  undefined1 uVar6;
  undefined4 *puVar7;
  int iVar8;
  undefined1 local_4c [40];
  int local_24;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  if (param_2 == 0) {
    FUN_000208f0();
    *(undefined4 *)(param_1 + 0x84) = 0;
    FUN_0001cda4(0,0);
    uVar3 = FUN_0000af50(0);
    *(undefined4 *)(param_1 + 0x88) = uVar3;
  }
  else {
    *(undefined4 *)(param_1 + 0x84) = 0;
    FUN_0001cda4(0,0);
  }
  iVar2 = *(int *)(*(int *)(param_1 + 100) + 0x4c);
  if (iVar2 == 3) {
    uVar3 = FUN_0000b1a4(0);
  }
  else if (iVar2 == 2) {
    uVar3 = FUN_0000b06c(0);
  }
  else {
    if (iVar2 != 1) goto LAB_000611a2;
    uVar3 = FUN_0000afc4(0);
  }
  *(undefined4 *)(param_1 + 0x88) = uVar3;
LAB_000611a2:
  *(undefined4 *)(param_1 + 0x44) = 0;
  *(undefined1 *)(param_1 + 0x7c) = 0;
  puVar4 = DAT_005f94d0;
  if ((undefined4 **)DAT_005f94d0 != &DAT_005f94d0) {
    do {
      puVar7 = (undefined4 *)*puVar4;
      operator_delete(puVar4);
      puVar4 = puVar7;
    } while ((undefined4 **)puVar7 != &DAT_005f94d0);
  }
  DAT_005f94d0 = &DAT_005f94d0;
  DAT_005f94d4 = &DAT_005f94d0;
  FUN_0005ed54(&DAT_005f94b4,*(int *)(param_1 + 100) + 0xdc);
  uVar6 = 1;
  if ((*(int *)(param_1 + 0x68) != 0) && (uVar6 = 0, *(int *)(*(int *)(param_1 + 0x68) + 0x98) == 0)
     ) {
    uVar6 = 1;
  }
  iVar2 = *(int *)(param_1 + 8);
  iVar8 = *(int *)(param_1 + 100);
  *(undefined4 *)(iVar2 + 0x48) = 0;
  *(undefined1 *)(iVar2 + 0x18) = 0;
  FUN_000664b4();
  uVar3 = *(undefined4 *)(iVar8 + 0xf0);
  uVar5 = *(undefined4 *)(iVar8 + 0xf4);
  *(undefined4 *)(param_1 + 0x1c) = *(undefined4 *)(iVar8 + 0xec);
  *(undefined4 *)(param_1 + 0x20) = uVar3;
  *(undefined4 *)(param_1 + 0x24) = uVar5;
  *(undefined4 *)(param_1 + 0x20) = 0x3f800000;
  *(undefined4 *)(param_1 + 0x28) = 0x40400000;
  *(undefined4 *)(param_1 + 0x2c) = 0;
  *(undefined1 *)(param_1 + 0x30) = uVar6;
  *(undefined4 *)(param_1 + 0x34) = 0;
  *(undefined4 *)(param_1 + 0x3c) = 0;
  FUN_0006f6d8(*(undefined4 *)(param_1 + 100),param_1);
  puVar4 = DAT_005f94f0;
  if ((undefined4 **)DAT_005f94f0 != &DAT_005f94f0) {
    do {
      puVar7 = (undefined4 *)*puVar4;
      operator_delete(puVar4);
      puVar4 = puVar7;
    } while ((undefined4 **)puVar7 != &DAT_005f94f0);
  }
  DAT_005f94f0 = &DAT_005f94f0;
  DAT_005f94f4 = &DAT_005f94f0;
  uVar3 = *(undefined4 *)(param_1 + 4);
  iVar2 = *(int *)(param_1 + 100);
  FUN_0030f7cc(local_4c,"challengeMods");
  uVar3 = FUN_0039725c(uVar3,local_4c);
  FUN_00063e98(&DAT_005f94e4,iVar2 + 0xe4,uVar3);
  FUN_0030f7e0(local_4c);
  FUN_00066b18(param_1 + 0x48);
  FUN_000612d0(param_1);
  FUN_000613e4(param_1);
  FUN_00064110(&DAT_005f94e4);
  if (*(int *)puVar1 == local_24) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

## FUN_000619d0 — 000619d0

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

## FUN_0006f178 — 0006f178

- 函数名: FUN_0006f178
- 函数体: 413 字节
- 调用者数: 2 / 被调用者数: 14

```c

bool FUN_0006f178(int *param_1,undefined4 param_2,int param_3)

{
  char *pcVar1;
  size_t sVar2;
  int iVar3;
  void *pvVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  undefined4 local_50;
  undefined4 local_4c;
  undefined4 uStack_48;
  float local_44;
  int local_40;
  undefined4 local_3c;
  void *local_38;
  undefined4 uStack_34;
  
  *(undefined1 *)(param_1 + 3) = 0;
  param_1[1] = param_3;
  pcVar1 = (char *)FUN_0030c660(param_2,"name");
  if (pcVar1 == (char *)0x0) {
    param_1[2] = 0;
  }
  else {
    sVar2 = _strlen(pcVar1);
    iVar3 = FUN_002f69c4(pcVar1,sVar2);
    param_1[2] = iVar3;
  }
  FUN_0030c6c0(param_2,"mustSelect",param_1);
  iVar3 = FUN_0030c328(param_2,"challenge");
  if (iVar3 != 0) {
    uVar8 = 0;
    uVar9 = *(undefined4 *)((undefined1  [16])0x0 + (undefined1  [16])0xc);
    iVar6 = 0;
    do {
      pvVar4 = operator_new(0x104);
      FUN_00062618();
      *(int *)((int)pvVar4 + 0x54) = param_1[1];
      FUN_00062698(pvVar4,iVar3);
      local_38 = pvVar4;
      FUN_0006f5b8(param_1 + 4,&local_38);
      *(bool *)((int)pvVar4 + 0x59) = 0 < *param_1;
      local_3c = 0;
      uStack_48 = 0x14;
      local_44 = 0.2;
      local_50 = 0x14;
      local_4c = uVar8;
      local_40 = uVar9;
      FUN_0030c6c0(iVar3,"chanceSelect",&local_50);
      local_4c = local_50;
      iVar5 = FUN_0030c718(iVar3,"chanceRegrowth",&local_38);
      if (iVar5 == 0) {
        local_44 = (float)(double)CONCAT44(uStack_34,local_38);
      }
      iVar7 = *(int *)(PTR_DAT_004d9048 + 0x5c);
      local_40 = iVar6;
      iVar5 = FUN_0006f558(iVar7 + 0x154,(int)pvVar4 + 0x40);
      if (iVar5 == iVar7 + 0x158) {
        uStack_48 = 0x14;
        local_3c = 0;
      }
      else {
        uStack_48 = *(undefined4 *)(iVar5 + 0x14);
        local_3c = *(undefined4 *)(iVar5 + 0x18);
      }
      FUN_00039bc0(param_1 + 7,&local_4c);
      iVar3 = FUN_0030c3a0(iVar3,"challenge");
      iVar6 = iVar6 + 1;
    } while (iVar3 != 0);
  }
  iVar3 = param_1[4];
  iVar6 = param_1[5];
  if (iVar6 != iVar3) {
    FUN_0006ebdc(param_1);
  }
  return iVar6 != iVar3;
}


```

## FUN_0006ea28 — 0006ea28

- 函数名: FUN_0006ea28
- 函数体: 13 字节
- 调用者数: 1 / 被调用者数: 1

```c

undefined4 FUN_0006ea28(undefined4 param_1)

{
  FUN_0006ea38();
  return param_1;
}


```

## FUN_00063000 — 00063000

- 函数名: FUN_00063000
- 函数体: 39 字节
- 调用者数: 1 / 被调用者数: 1

```c

void FUN_00063000(int param_1,undefined4 *param_2)

{
  int iVar1;
  undefined4 *puVar2;
  
  puVar2 = *(undefined4 **)(param_1 + 4);
  if (puVar2 == *(undefined4 **)(param_1 + 8)) {
    FUN_000631b4(param_1,puVar2);
    return;
  }
  iVar1 = 0;
  if (puVar2 != (undefined4 *)0x0) {
    *puVar2 = *param_2;
    iVar1 = *(int *)(param_1 + 4);
  }
  *(int *)(param_1 + 4) = iVar1 + 4;
  return;
}


```

## FUN_0006335c — 0006335c

- 函数名: FUN_0006335c
- 函数体: 39 字节
- 调用者数: 1 / 被调用者数: 1

```c

void FUN_0006335c(int param_1,undefined4 *param_2)

{
  int iVar1;
  undefined4 *puVar2;
  
  puVar2 = *(undefined4 **)(param_1 + 4);
  if (puVar2 == *(undefined4 **)(param_1 + 8)) {
    FUN_00063384(param_1,puVar2);
    return;
  }
  iVar1 = 0;
  if (puVar2 != (undefined4 *)0x0) {
    *puVar2 = *param_2;
    iVar1 = *(int *)(param_1 + 4);
  }
  *(int *)(param_1 + 4) = iVar1 + 4;
  return;
}


```

