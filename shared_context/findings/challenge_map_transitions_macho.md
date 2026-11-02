# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0006ae74 — 0006ae74

- 函数名: FUN_0006ae74
- 函数体: 179 字节
- 调用者数: 2 / 被调用者数: 6

```c

void FUN_0006ae74(int param_1)

{
  undefined *puVar1;
  undefined4 uVar2;
  int iVar3;
  int iVar4;
  undefined1 auStack_4c [40];
  int local_24;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0x1c) = 0;
  iVar3 = *(int *)(*(int *)(param_1 + 0xc) + 0x68);
  iVar4 = 0;
  if (iVar3 != 0) {
    iVar4 = *(int *)(iVar3 + 0x98);
  }
  if (iVar3 == 0 || iVar4 == 0) {
    *(undefined4 *)(param_1 + 0x1c) = 0;
    *(undefined4 *)(param_1 + 0x20) = 0;
    uVar2 = 4;
  }
  else {
    *(undefined4 *)(param_1 + 0x20) = 0;
    uVar2 = 5;
  }
  *(undefined4 *)(param_1 + 0x14) = uVar2;
  iVar4 = 1;
  do {
    _sprintf(&DAT_005f9590,"challengeContainer.spinner.adventureNode_%d",iVar4);
    uVar2 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_4c,&DAT_005f9590);
    iVar3 = FUN_0039725c(uVar2,auStack_4c);
    FUN_0030f7e0(auStack_4c);
    if (iVar3 != 0) {
      FUN_00396d98(iVar3,1);
    }
    iVar4 = iVar4 + 1;
  } while (iVar4 != 5);
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0006af28 — 0006af28

- 函数名: FUN_0006af28
- 函数体: 103 字节
- 调用者数: 2 / 被调用者数: 3

```c

void FUN_0006af28(int param_1)

{
  undefined *puVar1;
  int *piVar2;
  code *pcVar3;
  undefined1 local_4c [40];
  int local_24;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0x1c) = 0;
  piVar2 = *(int **)(param_1 + 4);
  pcVar3 = *(code **)(*piVar2 + 0x40);
  FUN_0030f7cc(local_4c,"animate_out");
  (*pcVar3)(piVar2,local_4c,1);
  FUN_0030f7e0(local_4c);
  *(undefined4 *)(param_1 + 0x14) = 8;
  *(undefined4 *)(param_1 + 0x20) = 0;
  if (*(int *)puVar1 != local_24) {
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

## FUN_0006b400 — 0006b400

- 函数名: FUN_0006b400
- 函数体: 1207 字节
- 调用者数: 1 / 被调用者数: 11

```c

void FUN_0006b400(int param_1,int param_2)

{
  int *piVar1;
  uint uVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  char *pcVar7;
  int iVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  int iVar11;
  bool bVar12;
  undefined8 uVar13;
  undefined8 uVar14;
  int local_1fc;
  int local_1f8;
  undefined1 auStack_1f0 [40];
  undefined1 auStack_1c8 [40];
  undefined1 auStack_1a0 [40];
  undefined1 auStack_178 [40];
  undefined1 auStack_150 [40];
  undefined1 auStack_128 [40];
  undefined1 auStack_100 [40];
  undefined1 auStack_d8 [40];
  undefined4 local_b0;
  undefined4 local_ac;
  undefined1 auStack_a8 [40];
  undefined1 auStack_80 [40];
  undefined1 auStack_58 [40];
  undefined1 local_30 [4];
  int local_2c;
  
  local_2c = *(int *)PTR____stack_chk_guard_004d9044;
  if (*(int *)(param_1 + 0xc) != 0) {
    uVar9 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_58,"progressUIContainer");
    uVar9 = FUN_0039725c(uVar9,auStack_58);
    FUN_0030f7e0(auStack_58);
    uVar10 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_80,"challengeContainer.spinner");
    local_1fc = FUN_0039725c(uVar10,auStack_80);
    FUN_0030f7e0(auStack_80);
    if (*(int *)(*(int *)(*(int *)(param_1 + 0xc) + 0x68) + 0x98) != 0) {
      uVar10 = *(undefined4 *)(param_1 + 4);
      FUN_0030f7cc(auStack_a8,"bossChallengeContainer.spinner");
      local_1fc = FUN_0039725c(uVar10,auStack_a8);
      FUN_0030f7e0(auStack_a8);
    }
    local_1f8 = 0;
    do {
      iVar5 = local_1f8;
      if (3 < local_1f8) goto LAB_0006b894;
      iVar6 = *(int *)(*(int *)(param_1 + 0xc) + 0x68);
      iVar8 = *(int *)(*(int *)PTR_DAT_004d9198 + local_1f8 * 4);
      if (0 < *(int *)(iVar8 + 0x7c)) {
        bVar12 = iVar8 == iVar6;
        iVar11 = 0;
        do {
          if (iVar8 == iVar6) {
            if ((4 < *(uint *)(param_1 + 0x14)) ||
               ((1 << (*(uint *)(param_1 + 0x14) & 0xff) & 0x13U) == 0)) {
              piVar1 = (int *)FUN_0006ed58(iVar8,iVar11);
              uVar2 = 0;
              if (*(int *)(*piVar1 + 0x100) != 0) {
                uVar2 = *(uint *)(*(int *)(*piVar1 + 0x100) + 0x44);
              }
              uVar14 = FixedToFP(CONCAT44(uVar2 >> 3,uVar2 >> 3),0,1,0,0x20);
              uVar13 = FixedToFP(CONCAT44(uVar2,uVar2) & 0x700000007,0,1,0,0x20);
              uVar14 = FloatVectorMult(uVar14,0x3e0000003e000000,2,0x20);
              uVar13 = FloatVectorMult(uVar13,0x3e0000003e000000,2,0x20);
              local_b0 = (undefined4)uVar13;
              local_ac = (undefined4)uVar14;
              if (local_1fc != 0 && bVar12) {
                _sprintf(&DAT_005f9590,"adventureNode_%d",iVar11 + 1);
                FUN_0030f7cc(auStack_d8,&DAT_005f9590);
                iVar3 = FUN_0039725c(local_1fc,auStack_d8);
                FUN_0030f7e0(auStack_d8);
                if (iVar3 != 0) {
                  FUN_0006bc4c(*(undefined4 *)(iVar3 + 0x744),&local_b0);
                  iVar4 = FUN_0006ed58(iVar8,iVar11);
                  if ((*(int *)(iVar4 + 4) != 0) &&
                     (((*(int *)(param_1 + 0x14) != 2 && (*(int *)(param_2 + 0x180) != 1)) ||
                      (iVar11 != *(int *)(*(int *)(*(int *)(param_1 + 0xc) + 0x68) + 0x90))))) {
                    FUN_0030f7cc(auStack_100,"animate_trigger");
                    FUN_00398154(iVar3,auStack_100,1);
                    FUN_0030f7e0(auStack_100);
                    local_30[0] = 0;
                    FUN_0001da28(*(undefined4 *)(iVar3 + 0x264),local_30);
                  }
                }
              }
            }
          }
          else {
            piVar1 = (int *)FUN_0006ed58(iVar8,iVar11);
            uVar2 = 0;
            if (*(int *)(*piVar1 + 0x100) != 0) {
              uVar2 = *(uint *)(*(int *)(*piVar1 + 0x100) + 0x44);
            }
            uVar14 = FixedToFP(CONCAT44(uVar2 >> 3,uVar2 >> 3),0,1,0,0x20);
            uVar13 = FixedToFP(CONCAT44(uVar2,uVar2) & 0x700000007,0,1,0,0x20);
            uVar14 = FloatVectorMult(uVar14,0x3e0000003e000000,2,0x20);
            uVar13 = FloatVectorMult(uVar13,0x3e0000003e000000,2,0x20);
            local_b0 = (undefined4)uVar13;
            local_ac = (undefined4)uVar14;
          }
          DAT_005f9590 = '\0';
          iVar3 = FUN_0006ed58(iVar8,iVar11);
          if (*(int *)(iVar3 + 4) == 1) {
            _sprintf(&DAT_005f9590,"progressUIContainer.map.challenge_%d_%d.pass",local_1f8 + 1,
                     iVar11 + 1);
          }
          else {
            iVar3 = FUN_0006ed58(iVar8,iVar11);
            if (*(int *)(iVar3 + 4) == 2) {
              _sprintf(&DAT_005f9590,"progressUIContainer.map.challenge_%d_%d.fail",local_1f8 + 1,
                       iVar11 + 1);
            }
          }
          if (DAT_005f9590 != '\0') {
            if (*(int *)(param_1 + 0x14) == 2) {
              if (iVar8 == iVar6) {
LAB_0006b6de:
                if (iVar11 == *(int *)(*(int *)(*(int *)(param_1 + 0xc) + 0x68) + 0x90))
                goto LAB_0006b7b0;
              }
            }
            else if (*(int *)(param_2 + 0x180) == 1 && bVar12) goto LAB_0006b6de;
            uVar10 = *(undefined4 *)(param_1 + 4);
            FUN_0030f7cc(auStack_128,&DAT_005f9590);
            iVar3 = FUN_0039725c(uVar10,auStack_128);
            FUN_0030f7e0(auStack_128);
            if (iVar3 != 0) {
              local_30[0] = 1;
              FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),local_30);
            }
            if (local_1fc != 0 && bVar12) {
              iVar3 = FUN_0006ed58(iVar8,iVar11);
              if (*(int *)(iVar3 + 4) == 1) {
                pcVar7 = "adventureNodePass_%d";
LAB_0006b782:
                _sprintf(&DAT_005f9590,pcVar7,iVar11 + 1);
              }
              else {
                iVar3 = FUN_0006ed58(iVar8,iVar11);
                if (*(int *)(iVar3 + 4) == 2) {
                  pcVar7 = "adventureNodeFail_%d";
                  goto LAB_0006b782;
                }
              }
              FUN_0030f7cc(auStack_150,&DAT_005f9590);
              iVar3 = FUN_0039725c(local_1fc,auStack_150);
              FUN_0030f7e0(auStack_150);
              if (iVar3 != 0) {
                local_30[0] = 1;
                FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),local_30);
              }
            }
          }
LAB_0006b7b0:
          iVar11 = iVar11 + 1;
        } while (iVar11 < *(int *)(iVar8 + 0x7c));
        iVar6 = *(int *)(*(int *)(param_1 + 0xc) + 0x68);
      }
      local_1f8 = local_1f8 + 1;
    } while (iVar8 != iVar6);
    uVar10 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_178,"actContainer.actLabel");
    iVar6 = FUN_0039725c(uVar10,auStack_178);
    FUN_0030f7e0(auStack_178);
    if (iVar6 != 0) {
      if (iVar5 < 3) {
        *(int *)(iVar6 + 0x880) = local_1f8;
        FUN_003d0bf4(iVar6);
      }
      else {
        FUN_0030f7cc(auStack_1a0,"FN_PUSS_FINALE");
        FUN_00022950(*(undefined4 *)(iVar6 + 0x7dc),auStack_1a0);
        FUN_0030f7e0(auStack_1a0);
      }
    }
    _sprintf(&DAT_005f9590,"map.act%d",*(int *)(*(int *)(*(int *)(param_1 + 0xc) + 0x68) + 0xa4) + 1
            );
    FUN_0030f7cc(auStack_1c8,&DAT_005f9590);
    iVar5 = FUN_0039725c(uVar9,auStack_1c8);
    FUN_0030f7e0(auStack_1c8);
    if (iVar5 != 0) {
      FUN_0030f7cc(auStack_1f0,"animate_appear");
      FUN_00398154(iVar5,auStack_1f0,1);
      FUN_0030f7e0(auStack_1f0);
    }
  }
LAB_0006b894:
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_2c) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

