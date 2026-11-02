# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

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

## FUN_0005ffa8 — 0005ffa8

- 函数名: FUN_0005ffa8
- 函数体: 349 字节
- 调用者数: 1 / 被调用者数: 10

```c

void FUN_0005ffa8(int param_1)

{
  bool bVar1;
  int iVar2;
  int iVar3;
  undefined4 uVar4;
  int *piVar5;
  code *pcVar6;
  undefined4 uVar7;
  undefined1 *puVar8;
  undefined1 auStack_c4 [40];
  undefined1 auStack_9c [40];
  undefined1 auStack_74 [40];
  undefined1 auStack_4c [40];
  undefined1 local_24 [4];
  int local_20;
  
  local_20 = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0x40) = 2;
  iVar2 = *(int *)(param_1 + 0x68);
  iVar3 = 0;
  if (iVar2 != 0) {
    iVar3 = *(int *)(iVar2 + 0x98);
  }
  if (iVar2 != 0 && iVar3 != 0) {
    uVar7 = *(undefined4 *)(PTR_DAT_004d9048 + 0x5c);
    uVar4 = FUN_002f69c4("consecutive_finales_total",0x19);
    FUN_00027588(uVar7,"consecutive_finales_total",uVar4,1,1,1);
  }
  if (*(int *)(PTR_DAT_004d9048 + 0x5c) != 0) {
    FUN_000277e4();
  }
  *(undefined4 *)(param_1 + 0x70) = 0;
  uVar4 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_4c,"Timer");
  piVar5 = (int *)FUN_0039725c(uVar4,auStack_4c);
  FUN_0030f7e0(auStack_4c);
  if (piVar5 != (int *)0x0) {
    bVar1 = false;
    if ((*(int *)(param_1 + 0x68) != 0) &&
       (bVar1 = false, *(int *)(*(int *)(param_1 + 0x68) + 0x98) != 0)) {
      bVar1 = true;
    }
    local_24[0] = 1;
    FUN_0001da28(piVar5[0x98],local_24);
    FUN_00396d98(piVar5,1);
    pcVar6 = *(code **)(*piVar5 + 0x40);
    if (bVar1) {
      puVar8 = auStack_74;
    }
    else {
      puVar8 = auStack_9c;
    }
    FUN_0030f7cc(puVar8,"animate_in");
    (*pcVar6)(piVar5,puVar8,1);
    FUN_0030f7e0(puVar8);
    FUN_00084394(piVar5);
  }
  if (*(int *)(param_1 + 0x9c) != 0) {
    local_24[0] = 1;
    FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 0x9c) + 0x260),local_24);
    piVar5 = *(int **)(param_1 + 0x9c);
    pcVar6 = *(code **)(*piVar5 + 0x40);
    FUN_0030f7cc(auStack_c4,"animate_in");
    (*pcVar6)(piVar5,auStack_c4,1);
    FUN_0030f7e0(auStack_c4);
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_20) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_000612d0 — 000612d0

- 函数名: FUN_000612d0
- 函数体: 275 字节
- 调用者数: 2 / 被调用者数: 10

```c

void FUN_000612d0(int param_1)

{
  bool bVar1;
  int iVar2;
  size_t sVar3;
  char *pcVar4;
  size_t sVar5;
  int *piVar6;
  int iVar7;
  allocator aaStack_24 [4];
  int local_20 [2];
  
  iVar2 = FUN_0005ef30(&DAT_005f94b4);
  if (iVar2 == 1) {
    sVar3 = _strlen((char *)(*(int *)(param_1 + 100) + 0x5a));
    pcVar4 = (char *)FUN_0000ac08(*(undefined4 *)(param_1 + 0x88));
    sVar5 = _strlen(pcVar4);
    std::string::string((string *)local_20,(char *)(*(int *)(param_1 + 100) + 0x5a),aaStack_24);
    iVar2 = std::string::find((char *)local_20,0x418781,0);
    if (iVar2 < 0) {
      iVar7 = *(int *)(param_1 + 100);
      iVar2 = FUN_0000ac08(*(undefined4 *)(param_1 + 0x88));
      _sprintf((char *)(param_1 + 0xa1),(char *)(iVar7 + 0x5a),iVar2 + 0xc0);
    }
    else {
      pcVar4 = operator_new__(sVar5 + sVar3);
      _strcpy(pcVar4,(char *)(*(int *)(param_1 + 100) + 0x5a));
      _strcpy(pcVar4 + iVar2 + 2,(char *)(*(int *)(param_1 + 100) + iVar2 + 0x5d));
      iVar2 = FUN_0000ac08(*(undefined4 *)(param_1 + 0x88));
      _sprintf((char *)(param_1 + 0xa1),pcVar4,iVar2 + 0x100);
      if (pcVar4 != (char *)0x0) {
        operator_delete(pcVar4);
      }
    }
    if ((allocator *)(local_20[0] + -0xc) != (allocator *)PTR__S_empty_rep_storage_004d9038) {
      piVar6 = (int *)(local_20[0] + -4);
      DataMemoryBarrier(0x1b);
      do {
        ExclusiveAccess(piVar6);
        iVar2 = *piVar6;
        bVar1 = (bool)hasExclusiveAccess(piVar6);
      } while (!bVar1);
      *piVar6 = iVar2 + -1;
      DataMemoryBarrier(0x1b);
      if (iVar2 < 1) {
        std::string::_Rep::_M_destroy((allocator *)(local_20[0] + -0xc));
      }
    }
  }
  else {
    _sprintf((char *)(param_1 + 0xa1),(char *)(*(int *)(param_1 + 100) + 0x5a));
  }
  return;
}


```

## FUN_000613e4 — 000613e4

- 函数名: FUN_000613e4
- 函数体: 681 字节
- 调用者数: 2 / 被调用者数: 12

```c

void FUN_000613e4(int param_1)

{
  bool bVar1;
  float fVar2;
  int iVar3;
  int *piVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  code *pcVar8;
  undefined4 uVar9;
  undefined4 extraout_s0;
  undefined4 uVar10;
  undefined4 extraout_s1;
  undefined4 uVar11;
  undefined8 uVar12;
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
  uint local_30;
  int local_2c;
  
  local_2c = *(int *)PTR____stack_chk_guard_004d9044;
  local_30 = CONCAT31(local_30._1_3_,1);
  FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 4) + 0x260),&local_30);
  *(undefined4 *)(param_1 + 0x94) = 0;
  *(undefined4 *)(param_1 + 0x98) = 0;
  *(undefined4 *)(param_1 + 0x9c) = 0;
  fVar2 = (float)FUN_0005ee84(&DAT_005f94b4);
  bVar1 = fVar2 == 0.0;
  if (bVar1) {
    fVar2 = *(float *)(param_1 + 100);
  }
  uVar10 = extraout_s0;
  if (bVar1) {
    uVar10 = *(undefined4 *)((int)fVar2 + 0x48);
  }
  uVar12 = FixedToFP(CONCAT44(extraout_s1,uVar10),0,0,0,0x20);
  uVar11 = (undefined4)uVar12;
  *(undefined4 *)(param_1 + 0x44) = uVar11;
  uVar9 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(uVar10,auStack_58,"Timer");
  iVar3 = FUN_0039725c(uVar9,auStack_58);
  FUN_0030f7e0(auStack_58);
  if (iVar3 != 0) {
    local_30 = local_30 & 0xffffff00;
    uVar10 = FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),&local_30);
    *(undefined4 *)(iVar3 + 0x754) = uVar11;
    FUN_0008411c(uVar10,iVar3,uVar11);
  }
  uVar10 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_80,"instructionsText");
  piVar4 = (int *)FUN_0039725c(uVar10,auStack_80);
  FUN_0030f7e0(auStack_80);
  uVar10 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_a8,"@bonusScoreCounter");
  iVar3 = FUN_0039725c(uVar10,auStack_a8);
  FUN_0030f7e0(auStack_a8);
  uVar10 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_d0,"@bonusCheer");
  iVar5 = FUN_0039725c(uVar10,auStack_d0);
  FUN_0030f7e0(auStack_d0);
  if (iVar5 != 0) {
    local_30 = local_30 & 0xffffff00;
    FUN_0001da28(*(undefined4 *)(iVar5 + 0x260),&local_30);
  }
  if (iVar3 != 0) {
    local_30 = local_30 & 0xffffff00;
    FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),&local_30);
  }
  iVar6 = *(int *)(param_1 + 0x68);
  iVar7 = 0;
  if (iVar6 != 0) {
    iVar7 = *(int *)(iVar6 + 0x98);
  }
  if (iVar6 != 0 && iVar7 != 0) {
    if (piVar4 != (int *)0x0) {
      local_30 = (uint)local_30._1_3_ << 8;
      FUN_0001da28(piVar4[0x98],&local_30);
    }
    if (iVar3 != 0) {
      FUN_0030f7cc(auStack_198,"text");
      iVar7 = FUN_0039725c(iVar3,auStack_198);
      FUN_0030f7e0(auStack_198);
      if (iVar7 != 0) {
        *(undefined4 *)(iVar7 + 0x884) = 0;
        FUN_003d0bf4(iVar7);
      }
      *(int *)(param_1 + 0x98) = iVar3;
    }
    uVar10 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_1c0,"bonusIntro");
    uVar10 = FUN_0039725c(uVar10,auStack_1c0);
    *(undefined4 *)(param_1 + 0x94) = uVar10;
    FUN_0030f7e0(auStack_1c0);
    *(int *)(param_1 + 0x9c) = iVar5;
  }
  else if (piVar4 != (int *)0x0) {
    local_30 = CONCAT31(local_30._1_3_,1);
    FUN_0001da28(piVar4[0x98],&local_30);
    FUN_0030f7cc(auStack_f8,param_1 + 0xa1);
    FUN_0030f7cc(auStack_120,"text");
    FUN_0030f870(auStack_148,auStack_f8);
    local_30 = 0;
    FUN_000632ac(piVar4 + 0x28,auStack_120,&local_30);
    FUN_00022950(*(undefined4 *)(piVar4[0x37] + local_30 * 4),auStack_148);
    FUN_0030f7e0(auStack_148);
    FUN_0030f7e0(auStack_120);
    pcVar8 = *(code **)(*piVar4 + 0x40);
    FUN_0030f7cc(auStack_170,"transition_up");
    (*pcVar8)(piVar4,auStack_170,1);
    FUN_0030f7e0(auStack_170);
    FUN_0030f7e0(auStack_f8);
  }
  FUN_00061690(param_1);
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_2c) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00061690 — 00061690

- 函数名: FUN_00061690
- 函数体: 277 字节
- 调用者数: 2 / 被调用者数: 9

```c

void FUN_00061690(int param_1)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int *piVar4;
  undefined4 uVar5;
  code *pcVar6;
  undefined1 auStack_a4 [40];
  undefined1 auStack_7c [40];
  undefined1 auStack_54 [40];
  undefined4 local_2c;
  undefined1 local_28 [4];
  int local_24;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  local_2c = 0;
  iVar1 = FUN_00064038(&DAT_005f94e4,&local_2c,8);
  uVar5 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_54,"challengeMods");
  iVar2 = FUN_0039725c(uVar5,auStack_54);
  FUN_0030f7e0(auStack_54);
  local_28[0] = 1;
  FUN_0001da28(*(undefined4 *)(iVar2 + 0x260),local_28);
  if (iVar1 != 0) {
    do {
      iVar3 = FUN_00063fa0(&DAT_005f94e4,iVar1 + 0x1c);
      FUN_0030f7cc(auStack_7c,iVar1 + 0x1c);
      piVar4 = (int *)FUN_0039725c(iVar2,auStack_7c);
      FUN_0030f7e0(auStack_7c);
      if (piVar4 != (int *)0x0) {
        FUN_00396d98(piVar4,1);
        local_28[0] = (undefined1)iVar3;
        FUN_0001da28(piVar4[0x98],local_28);
        if (iVar3 == 1) {
          pcVar6 = *(code **)(*piVar4 + 0x40);
          FUN_0030f7cc(auStack_a4,"idle");
          (*pcVar6)(piVar4,auStack_a4,1);
          FUN_0030f7e0(auStack_a4);
        }
      }
      iVar1 = FUN_00064064(&DAT_005f94e4,&local_2c,8);
    } while (iVar1 != 0);
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00060e54 — 00060e54

- 函数名: FUN_00060e54
- 函数体: 51 字节
- 调用者数: 0 / 被调用者数: 2

```c

void FUN_00060e54(int param_1)

{
  if (*(char *)(param_1 + 0x7c) != '\0') {
    return;
  }
  FUN_0005edc4(&DAT_005f94b4);
  *(undefined1 *)(param_1 + 0x7c) = 1;
  FUN_00064090(&DAT_005f94e4);
  return;
}


```

## FUN_0006104c — 0006104c

- 函数名: FUN_0006104c
- 函数体: 65 字节
- 调用者数: 0 / 被调用者数: 1

```c

undefined4 FUN_0006104c(int param_1)

{
  undefined4 uVar1;
  float fVar2;
  
  uVar1 = 0;
  if (*(int *)(param_1 + 0x40) == 2) {
    fVar2 = (float)FUN_0005ee84(&DAT_005f94b4);
    uVar1 = 1;
    if (fVar2 == 0.0) {
      if (*(int *)(param_1 + 100) == 0) {
        return 0;
      }
      uVar1 = 0;
      if (*(int *)(*(int *)(param_1 + 100) + 0x48) != 0) {
        uVar1 = 1;
      }
    }
  }
  return uVar1;
}


```

