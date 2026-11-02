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

## FUN_0006af94 — 0006af94

- 函数名: FUN_0006af94
- 函数体: 205 字节
- 调用者数: 4 / 被调用者数: 6

```c

void FUN_0006af94(int param_1,undefined4 param_2)

{
  undefined *puVar1;
  int iVar2;
  undefined4 uVar3;
  undefined **local_48;
  undefined *local_44;
  undefined1 local_28;
  int local_24;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  if ((*(int *)(param_1 + 0x14) == 7) &&
     (iVar2 = FUN_0006ed58(*(undefined4 *)(*(int *)(param_1 + 0xc) + 0x68),param_2),
     *(int *)(iVar2 + 4) == 0)) {
    local_28 = 1;
    local_48 = (undefined **)0x0;
    uVar3 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
    FUN_0000a298(&local_48);
    local_28 = 0;
    local_48 = &PTR_LAB_0052bf38;
    local_44 = PTR_FUN_004d9058;
    FUN_0002bb34(uVar3,"button-press",0x3f800000,0x3f800000,&local_48,0);
    FUN_0000a298(&local_48);
    FUN_0006af28(param_1);
    *(undefined4 *)(param_1 + 0x10) = param_2;
    FUN_000610cc(*(undefined4 *)(param_1 + 0xc),1,0);
  }
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail(*(int *)puVar1);
  }
  return;
}


```

## FUN_00301080 — 00301080

- 函数名: FUN_00301080
- 函数体: 51 字节
- 调用者数: 2 / 被调用者数: 0

```c

void FUN_00301080(undefined4 *param_1)

{
  *param_1 = 0xdeadbeef;
  param_1[1] = 0;
  param_1[2] = 0x6c078965;
  param_1[3] = 0x5d588b65;
  param_1[4] = 0x269ec3;
  param_1[5] = 0;
  return;
}


```

## FUN_00052f80 — 00052f80

- 函数名: FUN_00052f80
- 函数体: 83 字节
- 调用者数: 44 / 被调用者数: 4

```c

undefined * FUN_00052f80(void)

{
  int iVar1;
  
  if (((DAT_005a7928 & 1) == 0) && (iVar1 = ___cxa_guard_acquire(&DAT_005a7928), iVar1 != 0)) {
    FUN_00052fe4(&DAT_005a7b80);
    ___cxa_atexit(&FUN_00052fd4_1,&DAT_005a7b80,PTR___mh_execute_header_004d9040);
    ___cxa_guard_release(&DAT_005a7928);
  }
  return &DAT_005a7b80;
}


```

## FUN_0005fd7c — 0005fd7c

- 函数名: FUN_0005fd7c
- 函数体: 551 字节
- 调用者数: 0 / 被调用者数: 23

```c

void FUN_0005fd7c(int *param_1,undefined4 param_2)

{
  undefined *puVar1;
  int iVar2;
  undefined4 uVar3;
  int iVar4;
  char *pcVar5;
  undefined8 uVar6;
  undefined4 extraout_s5;
  undefined1 auStack_44 [40];
  int local_1c;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_1c = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_00074418(param_1);
  if (((char)param_1[0x23] == '\0') &&
     (iVar2 = FUN_0002bec8(*(undefined4 *)(PTR_DAT_004d9048 + 0x1a4),"act-change"), iVar2 == 0)) {
    iVar2 = *(int *)(param_1[0x1a] + 0xa4);
    if (iVar2 == 2) {
      uVar3 = FUN_0007505c();
      pcVar5 = "Music-act3";
LAB_0005fe08:
      FUN_00075184(uVar3,pcVar5);
    }
    else {
      if (iVar2 == 1) {
        uVar3 = FUN_0007505c();
        pcVar5 = "Music-act2";
        goto LAB_0005fe08;
      }
      if (iVar2 == 0) {
        uVar3 = FUN_0007505c();
        pcVar5 = "Music-act1";
        goto LAB_0005fe08;
      }
    }
    *(undefined1 *)(param_1 + 0x23) = 1;
  }
  FUN_000686e8(param_1[0x24],param_1);
  switch(param_1[0x10]) {
  case 1:
    iVar2 = param_1[0x25];
    if (iVar2 != 0) {
      FUN_0030f7cc(auStack_44,"play");
      iVar2 = FUN_0039834c(iVar2,auStack_44,1);
      FUN_0030f7e0(auStack_44);
      if (iVar2 != 0) goto switchD_0005fe24_caseD_0;
    }
    param_1[0x25] = 0;
    FUN_0005ffa8(param_1);
  case 0:
switchD_0005fe24_caseD_0:
    *(undefined1 *)(param_1 + 0x6a) = 0;
    break;
  case 2:
    uVar6 = FloatVectorSub(CONCAT44(extraout_s5,param_1[0x11]),CONCAT44(param_2,param_2),2,0x20);
    param_1[0x11] = (int)uVar6;
    FUN_0005ec34(param_2,&DAT_005f94b4,param_2);
    FUN_00066410(param_1 + 2,param_2);
    FUN_00063e68(&DAT_005f94e4,param_2);
    FUN_0005ecf4(&DAT_005f94b4,param_1[0x1d]);
    if ((char)param_1[0x1f] == '\0') {
LAB_0005fef8:
      iVar2 = (**(code **)(*param_1 + 0x34))(param_1);
      if (((iVar2 == 1) && ((float)param_1[0x11] <= 0.0)) ||
         (iVar2 = FUN_0005edbc(&DAT_005f94b4), iVar2 != 0)) goto LAB_0005ff22;
    }
    else {
      iVar4 = param_1[0x1a];
      iVar2 = 0;
      if (iVar4 != 0) {
        iVar2 = *(int *)(iVar4 + 0x98);
      }
      if ((iVar4 != 0 && iVar2 != 0) ||
         (iVar2 = FUN_00052f80(), *(uint *)(iVar2 + 0x208) < *(uint *)(param_1[0x19] + 0xfc)))
      goto LAB_0005fef8;
      uVar3 = FUN_000065c4();
      iVar2 = FUN_00006a84(uVar3,1);
      if (iVar2 != 0) goto LAB_0005fef8;
LAB_0005ff22:
      FUN_00060108(param_1);
      *(undefined1 *)(param_1 + 0x1f) = 0;
    }
    iVar4 = param_1[0x1a];
    iVar2 = 0;
    if (iVar4 != 0) {
      iVar2 = *(int *)(iVar4 + 0x98);
    }
    if ((iVar4 != 0 && iVar2 != 0) && ((char)param_1[0x6a] == '\0')) {
      uVar3 = FUN_0030a1d8();
      FUN_0030a780(uVar3,"Music/Music-bonus-lp");
      *(undefined1 *)(param_1 + 0x6a) = 1;
    }
    break;
  case 3:
    if (*(int *)(param_1[0x24] + 0xac) == 7) {
      iVar2 = *(int *)(param_1[0x24] + 0xb0);
      if (iVar2 == 0) {
        FUN_00060514(param_1);
      }
      else {
        if (iVar2 == 5) {
          FUN_0006059c(param_1);
        }
        else if (iVar2 == 2) {
          FUN_0005ffa8(param_1);
          break;
        }
        param_1[0x10] = 5;
      }
    }
  }
  if (*(int *)puVar1 == local_1c) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

## FUN_0005e244 — 0005e244

- 函数名: FUN_0005e244
- 函数体: 99 字节
- 调用者数: 0 / 被调用者数: 4

```c

undefined4 FUN_0005e244(int param_1)

{
  int iVar1;
  undefined4 uVar2;
  float fVar3;
  undefined4 uVar4;
  
  iVar1 = FUN_00052f80();
  if ((*(int *)(iVar1 + 0x168) != 0) &&
     (iVar1 = FUN_00052f80(), *(int *)(*(int *)(iVar1 + 0x168) + 0x8c) == 0)) {
    return 1;
  }
  iVar1 = FUN_00052f80();
  uVar4 = 0;
  if ((*(int *)(param_1 + 0x2c) < *(int *)(iVar1 + 0x218)) &&
     (uVar4 = 1, *(char *)(param_1 + 0x28) == '\0')) {
    iVar1 = FUN_00013c88();
    uVar4 = 0;
    if (iVar1 < 1) {
      uVar2 = FUN_00031290();
      fVar3 = (float)FUN_0003256c(uVar2,0);
      if (0.0 <= fVar3) {
        uVar4 = 1;
      }
    }
  }
  return uVar4;
}


```

## FUN_0005f8a4 — 0005f8a4

- 函数名: FUN_0005f8a4
- 函数体: 91 字节
- 调用者数: 1 / 被调用者数: 7

```c

int * FUN_0005f8a4(int *param_1)

{
  undefined4 uVar1;
  
  FUN_00074150();
  *param_1 = (int)&DAT_005389a8;
  FUN_00065930(param_1 + 2);
  FUN_00066a6c(param_1 + 0x12);
  param_1[0x24] = 0;
  param_1[1] = 0;
  param_1[0x1e] = 0;
  (**(code **)(*param_1 + 0xc))(param_1);
  uVar1 = FUN_00052f80();
  FUN_000547e4(uVar1,0);
  (**(code **)(*param_1 + 0x10))(param_1);
  param_1[0x22] = 0;
  param_1[0x19] = 0;
  *(undefined1 *)(param_1 + 0x23) = 1;
  return param_1;
}


```

## FUN_0005cba4 — 0005cba4

- 函数名: FUN_0005cba4
- 函数体: 431 字节
- 调用者数: 0 / 被调用者数: 14

```c

void FUN_0005cba4(int param_1)

{
  undefined *puVar1;
  undefined4 uVar2;
  int *piVar3;
  int iVar4;
  _List_node_base *p_Var5;
  int iVar6;
  undefined4 *puVar7;
  undefined4 *puVar8;
  code *pcVar9;
  undefined *local_c4;
  undefined *local_c0;
  undefined1 local_a4;
  undefined1 auStack_a0 [40];
  undefined1 auStack_78 [40];
  undefined4 local_50 [8];
  undefined1 local_30;
  undefined4 local_2c;
  undefined4 local_28;
  int local_24;
  
  puVar1 = PTR_DAT_004d9048;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(PTR_DAT_004d9048 + 0x38) = *(undefined4 *)(PTR_DAT_004d9048 + 0x30);
  uVar2 = FUN_00052f80();
  FUN_000547ec(uVar2,0);
  *(undefined4 *)(puVar1 + 0x20) = 0;
  puVar1[0x17] = 0;
  puVar1[0x1b1] = 1;
  FUN_00052f80();
  FUN_0005520c();
  FUN_0001d130(puVar1);
  FUN_0001d154(puVar1);
  piVar3 = (int *)(**(code **)(**(int **)puVar1 + 0x20))();
  if (piVar3 != (int *)0x0) {
    pcVar9 = *(code **)(*piVar3 + 0x40);
    FUN_0030f7cc(auStack_78,"animate_in");
    (*pcVar9)(piVar3,auStack_78,1);
    FUN_0030f7e0(auStack_78);
    FUN_0030f7cc(auStack_a0,"pause");
    iVar4 = FUN_0039725c(piVar3,auStack_a0);
    FUN_0030f7e0(auStack_a0);
    if (iVar4 != 0) {
      puVar8 = (undefined4 *)(iVar4 + 0xb34);
      if (*(int *)(iVar4 + 0xb3c) == 0) {
        FUN_00022608(puVar8);
        *puVar8 = puVar8;
        *(undefined4 **)(iVar4 + 0xb38) = puVar8;
      }
      else {
        puVar7 = (undefined4 *)*puVar8;
        if (puVar7 != puVar8) {
          puVar7[0xb] = *(int *)(iVar4 + 0xb3c);
          puVar7[0xc] = 2;
          *(int *)(iVar4 + 0xb40) = *(int *)(iVar4 + 0xb40) + 1;
          for (puVar7 = (undefined4 *)*puVar7; puVar7 != puVar8; puVar7 = (undefined4 *)*puVar7) {
            puVar7[0xb] = *(undefined4 *)(iVar4 + 0xb3c);
            puVar7[0xc] = 2;
            *(int *)(iVar4 + 0xb40) = *(int *)(iVar4 + 0xb40) + 1;
          }
        }
      }
      local_a4 = 1;
      local_c4 = (undefined *)0x0;
      FUN_00022510(&local_c4);
      local_a4 = 0;
      local_c4 = &DAT_0052c108;
      local_c0 = PTR_FUN_004d9180;
      local_30 = 1;
      local_50[0] = 0;
      (*(code *)PTR_FUN_0052c110)(&local_c4,local_50);
      local_2c = 0;
      local_28 = 0;
      p_Var5 = (_List_node_base *)FUN_0002256c(puVar8,local_50);
      std::_List_node_base::hook(p_Var5);
      FUN_00022510(local_50);
      if (*(int *)(iVar4 + 0xb3c) != 0) {
        iVar6 = *(int *)(iVar4 + 0xb38);
        *(int *)(iVar6 + 0x2c) = *(int *)(iVar4 + 0xb3c);
        *(undefined4 *)(iVar6 + 0x30) = 1;
        *(int *)(iVar4 + 0xb40) = *(int *)(iVar4 + 0xb40) + 1;
      }
      FUN_00022510(&local_c4);
    }
  }
  puVar1 = PTR____stack_chk_guard_004d9044;
  *(undefined1 *)(param_1 + 0x33) = 1;
  if (*(int *)puVar1 == local_24) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

