# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_00021110 — 00021110

- 函数名: FUN_00021110
- 函数体: 647 字节
- 调用者数: 2 / 被调用者数: 23

```c

void FUN_00021110(int param_1)

{
  undefined *puVar1;
  byte bVar2;
  int iVar3;
  undefined4 uVar4;
  int iVar5;
  _List_node_base *p_Var6;
  undefined *puVar7;
  int *piVar8;
  int iVar9;
  undefined4 *puVar10;
  undefined4 *puVar11;
  undefined1 auStack_c4 [40];
  undefined *local_9c;
  undefined1 *local_98;
  undefined1 local_7c;
  undefined1 auStack_78 [40];
  undefined4 local_50 [8];
  undefined1 local_30;
  undefined4 local_2c;
  undefined4 local_28;
  int local_24;
  
  puVar7 = PTR_DAT_004d9048;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  if ((PTR_DAT_004d9048[10] != '\0') || (PTR_DAT_004d9048[0x1b1] == '\0')) goto LAB_00021378;
  *(undefined4 *)(PTR_DAT_004d9048 + 0x20) = 0;
  FUN_00040ebc(DAT_005577e0);
  FUN_0003ea08(*(undefined4 *)(puVar7 + 0x4c));
  FUN_0004f14c();
  puVar7 = PTR_DAT_004d9048;
  if (param_1 == 1) {
    FUN_0001d130(PTR_DAT_004d9048);
    FUN_0001d154(puVar7);
    puVar1 = PTR_DAT_004d9048;
    iVar3 = *(int *)(puVar7 + 0x10);
    if (iVar3 == 0) {
      uVar4 = FUN_0001ccec(PTR_DAT_004d9048);
      FUN_0007106c(uVar4,*(undefined4 *)(*(int *)(puVar1 + 0x5c) + 0x108),
                   *(undefined4 *)(*(int *)(puVar1 + 0x5c) + 0x10c));
      iVar3 = FUN_0001ccec(puVar1);
    }
    else {
      if (iVar3 != 1) {
        PTR_DAT_004d9048[0x17] = 0;
        goto LAB_00021308;
      }
      uVar4 = FUN_0001d10c(PTR_DAT_004d9048);
      FUN_000619d0(uVar4,*(undefined4 *)(puVar1 + 0x5c));
      iVar3 = FUN_0001d10c(puVar1);
    }
    iVar3 = *(int *)(iVar3 + 4);
    PTR_DAT_004d9048[0x17] = 0;
    if (iVar3 != 0) {
      FUN_0030f7cc(auStack_78,"@pause");
      iVar5 = FUN_0039725c(iVar3,auStack_78);
      FUN_0030f7e0(auStack_78);
      if (iVar5 != 0) {
        puVar11 = (undefined4 *)(iVar5 + 0xb34);
        if (*(int *)(iVar5 + 0xb3c) == 0) {
          FUN_00022608(puVar11);
          *puVar11 = puVar11;
          *(undefined4 **)(iVar5 + 0xb38) = puVar11;
        }
        else {
          puVar10 = (undefined4 *)*puVar11;
          if (puVar10 != puVar11) {
            puVar10[0xb] = *(int *)(iVar5 + 0xb3c);
            puVar10[0xc] = 2;
            *(int *)(iVar5 + 0xb40) = *(int *)(iVar5 + 0xb40) + 1;
            for (puVar10 = (undefined4 *)*puVar10; puVar10 != puVar11;
                puVar10 = (undefined4 *)*puVar10) {
              puVar10[0xb] = *(undefined4 *)(iVar5 + 0xb3c);
              puVar10[0xc] = 2;
              *(int *)(iVar5 + 0xb40) = *(int *)(iVar5 + 0xb40) + 1;
            }
          }
        }
        local_7c = 1;
        local_9c = (undefined *)0x0;
        FUN_00022510(&local_9c);
        local_7c = 0;
        local_9c = &DAT_0052c108;
        local_98 = &FUN_00021398_1;
        local_30 = 1;
        local_50[0] = 0;
        (*(code *)PTR_FUN_0052c110)(&local_9c,local_50);
        local_2c = 0;
        local_28 = 0;
        p_Var6 = (_List_node_base *)FUN_0002256c(puVar11,local_50);
        std::_List_node_base::hook(p_Var6);
        FUN_00022510(local_50);
        if (*(int *)(iVar5 + 0xb3c) != 0) {
          iVar9 = *(int *)(iVar5 + 0xb38);
          *(int *)(iVar9 + 0x2c) = *(int *)(iVar5 + 0xb3c);
          *(undefined4 *)(iVar9 + 0x30) = 1;
          *(int *)(iVar5 + 0xb40) = *(int *)(iVar5 + 0xb40) + 1;
        }
        FUN_00022510(&local_9c);
      }
      FUN_0030f7cc(auStack_c4,"@backgroundControl");
      iVar3 = FUN_0039725c(iVar3,auStack_c4);
      FUN_0030f7e0(auStack_c4);
      if (iVar3 != 0) {
        FUN_0007c97c(iVar3);
      }
    }
  }
LAB_00021308:
  if (*(int *)(PTR_DAT_004d9048 + 0x10) == 1) {
    if ((PTR_DAT_004d9048[0x17] != '\0') ||
       (iVar3 = (**(code **)(**(int **)PTR_DAT_004d9048 + 0x2c))(), iVar3 != 1)) goto LAB_00021378;
  }
  else if (*(int *)(PTR_DAT_004d9048 + 0x10) == 0) {
    puVar7 = PTR_DAT_004d9048;
    if (*(float *)(PTR_DAT_004d9048 + 0x24) == 0.0) {
      puVar7 = (undefined *)(uint)(byte)PTR_DAT_004d9048[0x17];
    }
    if ((*(float *)(PTR_DAT_004d9048 + 0x24) != 0.0 || ((uint)puVar7 & 0xff) != 0) ||
       (iVar3 = (**(code **)(**(int **)PTR_DAT_004d9048 + 0x2c))(), iVar3 == 0)) goto LAB_00021378;
  }
  piVar8 = operator_new(0xb4);
  FUN_00047100();
  (**(code **)(*piVar8 + 8))(piVar8);
  puVar7 = PTR_DAT_004d9048;
  FUN_0003e9e8(*(undefined4 *)(PTR_DAT_004d9048 + 0x4c),piVar8,0);
  bVar2 = FUN_0001cd6c();
  puVar7[10] = bVar2 ^ 1;
LAB_00021378:
  if (*(int *)PTR____stack_chk_guard_004d9044 == local_24) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
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

