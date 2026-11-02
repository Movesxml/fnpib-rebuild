# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_00060e89 — 000619d0

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

## FUN_00060fcd — 000619d0

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

## FUN_00060fb9 — 000619d0

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

## FUN_00061009 — 000619d0

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

## FUN_00061021 — 000619d0

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

## FUN_00061015 — 000619d0

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

## FUN_00060e9d — 000619d0

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

## FUN_00060ea1 — 000619d0

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

## FUN_000607e9 — 未找到

(函数未找到)

## FUN_0005fb99 — 00060878

- 函数名: FUN_00060878
- 函数体: 831 字节
- 调用者数: 1 / 被调用者数: 21

```c

void FUN_00060878(void)

{
  int *piVar1;
  int iVar2;
  undefined4 uVar3;
  void *pvVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int *piVar9;
  int iVar10;
  int iVar11;
  undefined4 uVar12;
  undefined4 uVar13;
  undefined4 uVar14;
  undefined4 local_5c;
  undefined4 local_58;
  undefined4 uStack_54;
  float local_50;
  int local_4c;
  undefined4 local_48;
  void *local_44;
  double local_40;
  int *local_38;
  undefined4 uStack_34;
  
  FUN_00060bb8();
  piVar1 = operator_new(0x48);
  FUN_0030cda0(piVar1,"xml/challengeConditions.xml");
  if (piVar1 != (int *)0x0) {
    iVar2 = FUN_0030ceac(piVar1,0);
    if (iVar2 == 1) {
      uVar3 = FUN_0030c328(piVar1,"challengeConditions");
      FUN_0005eb6c(&DAT_005f94b4,uVar3);
    }
    else {
      (**(code **)(*piVar1 + 4))(piVar1);
    }
  }
  piVar1 = operator_new(0x48);
  FUN_0030cd24();
  if (piVar1 != (int *)0x0) {
    iVar2 = FUN_0030cebc(piVar1,"xml/challengeMods.xml",0);
    if (iVar2 == 1) {
      uVar3 = FUN_0030c328(piVar1,"challengeMods");
      FUN_00063da4(&DAT_005f94e4,uVar3);
    }
    else {
      (**(code **)(*piVar1 + 4))(piVar1);
    }
  }
  piVar1 = operator_new(0x48);
  FUN_0030cda0(piVar1,"xml/ch1challengeList.xml");
  if (piVar1 != (int *)0x0) {
    iVar2 = FUN_0030ceac(piVar1,0);
    if (iVar2 == 1) {
      uVar3 = FUN_0030c328(piVar1,"partyChallenges");
      iVar2 = FUN_0030c328(uVar3,"defaults");
      if (iVar2 != 0) {
        FUN_0030c6c0(iVar2,"chanceSelect",&DAT_0052cb54);
        iVar2 = FUN_0030c718(iVar2,"chanceRegrowth",&local_40);
        if (iVar2 == 0) {
          DAT_0052cb58 = (float)local_40;
        }
      }
      iVar2 = FUN_0030c328(uVar3,"challengeTier");
      if (iVar2 != 0) {
        uVar13 = 0;
        uVar14 = *(undefined4 *)((undefined1  [16])0x0 + (undefined1  [16])0xc);
        iVar10 = 0;
        do {
          pvVar4 = operator_new(0xb4);
          FUN_0006ea28(pvVar4,iVar2,iVar10);
          local_44 = pvVar4;
          FUN_00063000(&DAT_005f94f8,&local_44);
          iVar5 = FUN_0030c328(iVar2,"challengeGroup");
          if (iVar5 != 0) {
            iVar11 = 0;
            do {
              piVar1 = operator_new(0x48);
              piVar1[4] = 0;
              piVar1[5] = 0;
              piVar1[6] = 0;
              FUN_0003994c(piVar1 + 7,4);
              *piVar1 = 0;
              iVar6 = FUN_0006f178(piVar1,iVar5,iVar11);
              pvVar4 = local_44;
              if (iVar6 == 1) {
                local_38 = piVar1;
                FUN_0006335c((int)local_44 + 0x6c,&local_38);
                uVar12 = DAT_0052cb54;
                local_48 = 0;
                uStack_54 = DAT_0052cb54;
                local_50 = DAT_0052cb58;
                local_5c = DAT_0052cb54;
                local_58 = uVar13;
                local_4c = uVar14;
                FUN_0030c6c0(iVar5,"chanceSelect",&local_5c);
                local_58 = local_5c;
                iVar6 = FUN_0030c718(iVar5,"chanceRegrowth",&local_38);
                if (iVar6 == 0) {
                  local_50 = (float)(double)CONCAT44(uStack_34,local_38);
                }
                iVar7 = *(int *)(PTR_DAT_004d9048 + 0x5c) + 0x140;
                piVar9 = (int *)(*(int *)(PTR_DAT_004d9048 + 0x5c) + 0x144);
                iVar6 = iVar7;
                while (iVar8 = *piVar9, iVar8 != 0) {
                  piVar9 = (int *)(iVar8 + 0xc);
                  if ((uint)piVar1[2] <= *(uint *)(iVar8 + 0x10)) {
                    piVar9 = (int *)(iVar8 + 8);
                    iVar6 = iVar8;
                  }
                }
                local_48 = 0;
                if (iVar6 != iVar7) {
                  local_48 = 0;
                  if ((uint)piVar1[2] < *(uint *)(iVar6 + 0x10)) {
                    iVar6 = iVar7;
                  }
                  if (iVar6 != iVar7) {
                    uVar12 = *(undefined4 *)(iVar6 + 0x14);
                    local_48 = *(undefined4 *)(iVar6 + 0x18);
                  }
                }
                uStack_54 = uVar12;
                if (0 < *piVar1) {
                  uStack_54 = 0;
                  local_50 = 0.0;
                }
                local_4c = iVar11;
                FUN_00039bc0((int)pvVar4 + 0x40,&local_58);
                iVar11 = iVar11 + 1;
              }
              else if (piVar1 != (int *)0x0) {
                FUN_00063308(piVar1);
                operator_delete(piVar1);
              }
              iVar5 = FUN_0030c3a0(iVar5,"challengeGroup");
            } while (iVar5 != 0);
          }
          iVar2 = FUN_0030c3a0(iVar2,"challengeTier");
          iVar10 = iVar10 + 1;
        } while (iVar2 != 0);
      }
      uVar3 = FUN_0030c328(uVar3,"specialChallenges");
      FUN_00060d04(&DAT_005f9504,uVar3);
    }
    else {
      (**(code **)(*piVar1 + 4))(piVar1);
    }
  }
  DAT_005f94b0 = 1;
  return;
}


```

