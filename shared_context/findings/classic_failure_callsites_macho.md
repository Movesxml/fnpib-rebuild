# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0000c1c0 — 0000c1c0

- 函数名: FUN_0000c1c0
- 函数体: 8830 字节
- 调用者数: 0 / 被调用者数: 53

(反编译超时或失败)

## FUN_000208f0 — 000208f0

- 函数名: FUN_000208f0
- 函数体: 143 字节
- 调用者数: 1 / 被调用者数: 8

```c

void FUN_000208f0(void)

{
  undefined4 uVar1;
  int iVar2;
  undefined4 local_14;
  
  iVar2 = 0;
  do {
    FUN_00018d2c((&DAT_0055781c)[iVar2]);
    iVar2 = iVar2 + 1;
  } while (iVar2 != 0x10);
  local_14 = 0;
  uVar1 = FUN_000065c4();
  iVar2 = FUN_00006ad0(uVar1,2,&local_14);
  while (iVar2 != 0) {
    if (*(char *)(iVar2 + 0x98) == '\0') {
      FUN_00008450();
    }
    uVar1 = FUN_000065c4();
    iVar2 = FUN_00006af0(uVar1,2,&local_14);
  }
  uVar1 = FUN_000065c4();
  iVar2 = FUN_00006ad0(uVar1,1,&local_14);
  while (iVar2 != 0) {
    if (*(char *)(iVar2 + 0x1b8) == '\0') {
      FUN_0000f2f8(iVar2,0);
    }
    uVar1 = FUN_000065c4();
    iVar2 = FUN_00006af0(uVar1,1,&local_14);
  }
  iVar2 = FUN_0001cd70();
  if (iVar2 == 1) {
    FUN_0001bd80();
  }
  return;
}


```

## FUN_00043890 — 00043890

- 函数名: FUN_00043890
- 函数体: 69 字节
- 调用者数: 0 / 被调用者数: 2

```c

void FUN_00043890(int param_1)

{
  int iVar1;
  
  iVar1 = *(int *)(param_1 + 0x80);
  if (*(int *)(param_1 + 0x134) != 0) {
    iVar1 = *(int *)(param_1 + 0x134);
  }
  if (iVar1 != 0) {
    if (*(char *)(iVar1 + 0x35) == '\x02') {
      FUN_00008450();
    }
    else if (*(char *)(iVar1 + 0x35) == '\x01') {
      FUN_0000f2f8(iVar1,0);
    }
  }
  *(undefined4 *)(param_1 + 0x80) = 0;
  *(undefined4 *)(param_1 + 0x134) = 0;
  if (*(char *)(param_1 + 4) == '\0') {
    *(undefined1 *)(param_1 + 0x33) = 1;
  }
  return;
}


```

## FUN_000137e8 — 000137e8

- 函数名: FUN_000137e8
- 函数体: 69 字节
- 调用者数: 6 / 被调用者数: 4

```c

void FUN_000137e8(int param_1)

{
  undefined4 uVar1;
  int iVar2;
  undefined4 local_14;
  
  local_14 = 0;
  uVar1 = FUN_000065c4();
  iVar2 = FUN_00006ad0(uVar1,1,&local_14);
  while (iVar2 != 0) {
    if ((param_1 != 0) || (0.0 < *(float *)(iVar2 + 0xd0))) {
      FUN_0000f2f8(iVar2,0);
    }
    uVar1 = FUN_000065c4();
    iVar2 = FUN_00006af0(uVar1,1,&local_14);
  }
  return;
}


```

## FUN_0005e218 — 0005e218

- 函数名: FUN_0005e218
- 函数体: 41 字节
- 调用者数: 0 / 被调用者数: 1

```c

void FUN_0005e218(int *param_1,int param_2)

{
  int iVar1;
  
  if (param_2 != 0) {
    iVar1 = (**(code **)*param_1)(param_1);
    if (iVar1 != 0) {
      return;
    }
    FUN_0000f2f8(param_2,0);
    (**(code **)(*param_1 + 0xc))(param_1);
  }
  return;
}


```

## FUN_000503a4 — 000503a4

- 函数名: FUN_000503a4
- 函数体: 291 字节
- 调用者数: 5 / 被调用者数: 9

```c

void FUN_000503a4(int param_1)

{
  undefined4 uVar1;
  undefined *puVar2;
  _Rb_tree_node_base *p_Var3;
  void *pvVar4;
  undefined4 *puVar5;
  int iVar6;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined4 uVar7;
  uint extraout_s5;
  uint extraout_s5_00;
  uint uVar9;
  longlong extraout_d2;
  longlong extraout_d2_00;
  longlong lVar8;
  undefined *local_44;
  int iStack_40;
  undefined4 local_3c;
  undefined4 local_38;
  undefined1 local_24;
  int local_20;
  
  puVar2 = PTR____stack_chk_guard_004d9044;
  local_20 = *(int *)PTR____stack_chk_guard_004d9044;
  local_24 = 1;
  local_44 = (undefined *)0x0;
  FUN_0001a4b8(&local_44);
  local_24 = 0;
  local_44 = &DAT_0052c808;
  local_38 = 1;
  local_3c = 0x4c;
  iStack_40 = param_1;
  FUN_0002e75c(PTR_DAT_004d9134,&local_44);
  FUN_0001a4b8(&local_44);
  p_Var3 = (_Rb_tree_node_base *)FUN_00050c4c(&DAT_005f9470,param_1 + 0x80);
  if (p_Var3 != (_Rb_tree_node_base *)&DAT_005f9474) {
    pvVar4 = (void *)std::_Rb_tree_rebalance_for_erase(p_Var3,(_Rb_tree_node_base *)&DAT_005f9474);
    operator_delete(pvVar4);
    DAT_005f9484 = DAT_005f9484 + -1;
  }
  FUN_0005032c(param_1);
  uVar7 = extraout_s1;
  uVar9 = extraout_s5;
  if (*(int *)(param_1 + 0x7c) != 0) {
    FUN_0000f2f8(*(int *)(param_1 + 0x7c),0);
    *(undefined4 *)(param_1 + 0x7c) = 0;
    uVar7 = extraout_s1_00;
    uVar9 = extraout_s5_00;
  }
  lVar8 = (ulonglong)uVar9 << 0x20;
  pvVar4 = *(void **)(param_1 + 0x98);
  if (pvVar4 != (void *)0x0) {
    FUN_00322f74(pvVar4);
    operator_delete(pvVar4);
    *(undefined4 *)(param_1 + 0x98) = 0;
    uVar7 = extraout_s1_01;
    lVar8 = extraout_d2;
  }
  pvVar4 = *(void **)(param_1 + 0x9c);
  if (pvVar4 != (void *)0x0) {
    FUN_00322f74(pvVar4);
    operator_delete(pvVar4);
    *(undefined4 *)(param_1 + 0x9c) = 0;
    uVar7 = extraout_s1_02;
    lVar8 = extraout_d2_00;
  }
  uVar1 = DAT_000504c8;
  iVar6 = 0;
  puVar5 = (undefined4 *)(*(int *)(PTR_DAT_004d9048 + 0x4c) + 0x14);
  do {
    lVar8 = FloatVectorAdd(CONCAT44((int)((ulonglong)lVar8 >> 0x20),*(undefined4 *)(param_1 + 0xa0))
                           ,CONCAT44(uVar7,uVar1),2);
    if (-1 < (int)((uint)(*(float *)(param_1 + 0x88) < (float)lVar8) << 0x1f)) break;
    iVar6 = iVar6 + 1;
    *puVar5 = 0x3f800000;
    puVar5 = puVar5 + 1;
  } while (iVar6 < 3);
  if (*(int *)puVar2 != local_20) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0001cd2c — 0001cd2c

- 函数名: FUN_0001cd2c
- 函数体: 3 字节
- 调用者数: 5 / 被调用者数: 0

```c

undefined4 FUN_0001cd2c(void)

{
  return 1;
}


```

## FUN_0004eb70 — 0004eb70

- 函数名: FUN_0004eb70
- 函数体: 19 字节
- 调用者数: 3 / 被调用者数: 0

```c

bool FUN_0004eb70(void)

{
  return DAT_005f9484 != 0;
}


```

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

