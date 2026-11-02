# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_00028b20 — 00028b20

- 函数名: FUN_00028b20
- 函数体: 1241 字节
- 调用者数: 1 / 被调用者数: 9

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
  FUN_0030c6c0(param_2,"snakeNum1",param_1 + 0xd4);
  FUN_0030c6c0(param_2,"snakeNum2",param_1 + 0xd8);
  FUN_0030c6c0(param_2,"snakeNum3",param_1 + 0xdc);
  iVar2 = FUN_0030c328(param_2,"challenge");
  if (iVar2 != 0) {
    do {
      local_c8[0] = '\0';
      pcVar4 = (char *)FUN_0030c660(iVar2,"name");
      cVar1 = '\0';
      if (pcVar4 != (char *)0x0) {
        cVar1 = *pcVar4;
      }
      if (pcVar4 != (char *)0x0 && cVar1 != '\0') {
        _strncpy(local_c8,pcVar4,0x80);
        local_49 = 0;
      }
      FUN_0030c6c0(iVar2,"index",auStack_48);
      FUN_0030c6c0(iVar2,"challengeIndex",auStack_44);
      FUN_0030c6c0(iVar2,"result",auStack_40);
      FUN_00023288(param_1 + 0x30,param_1 + 0x30,local_c8);
      iVar2 = FUN_0030c3a0(iVar2,"challenge");
    } while (iVar2 != 0);
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00028ffc — 00028ffc

- 函数名: FUN_00028ffc
- 函数体: 333 字节
- 调用者数: 1 / 被调用者数: 4

```c

void FUN_00028ffc(int param_1,undefined4 param_2)

{
  int iVar1;
  undefined4 *puVar2;
  undefined4 local_48;
  undefined4 local_44;
  undefined4 local_40;
  undefined4 local_3c;
  undefined4 local_38;
  undefined4 local_34;
  undefined4 local_30;
  undefined4 local_2c;
  undefined4 local_28;
  undefined4 local_24;
  
  iVar1 = FUN_0030c328(param_2,"grp");
  if (iVar1 != 0) {
    do {
      local_2c = 0;
      local_28 = 0;
      local_24 = 0;
      FUN_0030c6c0(iVar1,"name",&local_30);
      FUN_0030c6c0(iVar1,"chance",&local_2c);
      FUN_0030c6c0(iVar1,"death",&local_28);
      local_34 = local_30;
      puVar2 = (undefined4 *)FUN_0002b2a8(param_1,&local_34);
      *puVar2 = local_2c;
      puVar2[1] = local_28;
      puVar2[2] = local_24;
      iVar1 = FUN_0030c3a0(iVar1,"grp");
    } while (iVar1 != 0);
  }
  iVar1 = FUN_0030c328(param_2,"chl");
  if (iVar1 != 0) {
    do {
      local_40 = 0;
      local_3c = 0;
      local_38 = 0;
      FUN_0030c6c0(iVar1,"name",&local_44);
      FUN_0030c6c0(iVar1,"chance",&local_40);
      FUN_0030c6c0(iVar1,"death",&local_3c);
      FUN_0030c6c0(iVar1,"plays",&local_38);
      local_48 = local_44;
      puVar2 = (undefined4 *)FUN_0002b2a8(param_1 + 0x18,&local_48);
      *puVar2 = local_40;
      puVar2[1] = local_3c;
      puVar2[2] = local_38;
      iVar1 = FUN_0030c3a0(iVar1,"chl");
    } while (iVar1 != 0);
  }
  return;
}


```

## FUN_0002a6cc — 0002a6cc

- 函数名: FUN_0002a6cc
- 函数体: 427 字节
- 调用者数: 1 / 被调用者数: 8

```c

void FUN_0002a6cc(int param_1,undefined4 param_2)

{
  void *pvVar1;
  void *pvVar2;
  _Rb_tree_node_base *p_Var3;
  char acStack_64 [64];
  int local_24;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  pvVar1 = operator_new(0x50);
  FUN_0030c410(pvVar1,"challengeDataPersistent");
  p_Var3 = *(_Rb_tree_node_base **)(param_1 + 0xc);
  if (p_Var3 != (_Rb_tree_node_base *)(param_1 + 4)) {
    do {
      pvVar2 = operator_new(0x50);
      FUN_0030c410(pvVar2,"grp");
      FUN_0030c7cc(pvVar2,0,"name",*(undefined4 *)(p_Var3 + 0x10));
      _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(p_Var3 + 0x14));
      FUN_0030c81c(pvVar2,0,"chance",acStack_64);
      _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(p_Var3 + 0x18));
      FUN_0030c81c(pvVar2,0,"death",acStack_64);
      FUN_0030c22c(pvVar1,pvVar2);
      p_Var3 = (_Rb_tree_node_base *)std::_Rb_tree_increment(p_Var3);
    } while (p_Var3 != (_Rb_tree_node_base *)(param_1 + 4));
  }
  p_Var3 = *(_Rb_tree_node_base **)(param_1 + 0x24);
  if (p_Var3 != (_Rb_tree_node_base *)(param_1 + 0x1c)) {
    do {
      pvVar2 = operator_new(0x50);
      FUN_0030c410(pvVar2,"chl");
      FUN_0030c7cc(pvVar2,0,"name",*(undefined4 *)(p_Var3 + 0x10));
      _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(p_Var3 + 0x14));
      FUN_0030c81c(pvVar2,0,"chance",acStack_64);
      _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(p_Var3 + 0x18));
      FUN_0030c81c(pvVar2,0,"death",acStack_64);
      _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(p_Var3 + 0x1c));
      FUN_0030c81c(pvVar2,0,"plays",acStack_64);
      FUN_0030c22c(pvVar1,pvVar2);
      p_Var3 = (_Rb_tree_node_base *)std::_Rb_tree_increment(p_Var3);
    } while (p_Var3 != (_Rb_tree_node_base *)(param_1 + 0x1c));
  }
  FUN_0030c22c(param_2,pvVar1);
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0002a878 — 0002a878

- 函数名: FUN_0002a878
- 函数体: 1551 字节
- 调用者数: 1 / 被调用者数: 8

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
    FUN_0030c81c(pvVar2,0,"finaleScreenSpareLives",acStack_64);
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0xa4));
    FUN_0030c81c(pvVar2,0,"finaleScreenBonusPerLife",acStack_64);
    FUN_0030c770(pvVar2,"finaleScreenDisplayScore",SUB84((double)*(float *)(param_1 + 0xa8),0),
                 (int)((ulonglong)(double)*(float *)(param_1 + 0xa8) >> 0x20));
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0xac));
    FUN_0030c81c(pvVar2,0,"finaleFailScreenState",acStack_64);
    FUN_0030c770(pvVar2,"finaleFailScreenTime",SUB84((double)*(float *)(param_1 + 0xb0),0),
                 (int)((ulonglong)(double)*(float *)(param_1 + 0xb0) >> 0x20));
    FUN_0030c770(pvVar2,"finaleFailScreenDisplayScore",SUB84((double)*(float *)(param_1 + 0xb4),0),
                 (int)((ulonglong)(double)*(float *)(param_1 + 0xb4) >> 0x20));
    FUN_0030c770(pvVar2,"megaBomb",SUB84((double)*(float *)(param_1 + 0xb8),0),
                 (int)((ulonglong)(double)*(float *)(param_1 + 0xb8) >> 0x20));
    FUN_0030c770(pvVar2,"megaFruit",SUB84((double)*(float *)(param_1 + 0xbc),0),
                 (int)((ulonglong)(double)*(float *)(param_1 + 0xbc) >> 0x20));
    FUN_0030c770(pvVar2,"Stack1",SUB84((double)*(float *)(param_1 + 0xc0),0),
                 (int)((ulonglong)(double)*(float *)(param_1 + 0xc0) >> 0x20));
    FUN_0030c770(pvVar2,"Stack2",SUB84((double)*(float *)(param_1 + 0xc4),0),
                 (int)((ulonglong)(double)*(float *)(param_1 + 0xc4) >> 0x20));
    FUN_002f702c(auStack_e4,0x80,"%f,%f,%f",SUB84((double)*(float *)(param_1 + 200),0),
                 (int)((ulonglong)(double)*(float *)(param_1 + 200) >> 0x20),
                 (double)*(float *)(param_1 + 0xcc),(double)*(float *)(param_1 + 0xd0));
    FUN_0030c81c(pvVar2,0,"snakeVec",auStack_e4);
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0xd4));
    FUN_0030c81c(pvVar2,0,"snakeNum1",acStack_64);
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0xd8));
    FUN_0030c81c(pvVar2,0,"snakeNum2",acStack_64);
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0xdc));
    FUN_0030c81c(pvVar2,0,"snakeNum3",acStack_64);
    piVar1 = (int *)(param_1 + 0x30);
    piVar4 = (int *)*piVar1;
    if (piVar4 != piVar1) {
      do {
        pvVar3 = operator_new(0x50);
        FUN_0030c410(pvVar3,"challenge");
        FUN_0030c81c(pvVar3,0,"name",piVar4 + 2);
        _snprintf(acStack_64,0x40,"%d",piVar4[0x22]);
        FUN_0030c81c(pvVar3,0,"index",acStack_64);
        _snprintf(acStack_64,0x40,"%d",piVar4[0x23]);
        FUN_0030c81c(pvVar3,0,"challengeIndex",acStack_64);
        _snprintf(acStack_64,0x40,"%d",piVar4[0x24]);
        FUN_0030c81c(pvVar3,0,"result",acStack_64);
        FUN_0030c22c(pvVar2,pvVar3);
        piVar4 = (int *)*piVar4;
      } while (piVar4 != piVar1);
    }
    FUN_0030c22c(param_2,pvVar2);
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00027c70 — 00027c70

- 函数名: FUN_00027c70
- 函数体: 691 字节
- 调用者数: 1 / 被调用者数: 6

```c

int FUN_00027c70(int param_1)

{
  undefined4 *puVar1;
  undefined4 *puVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  undefined4 *puVar9;
  int iVar10;
  
  *(undefined4 *)(param_1 + 8) = 0;
  *(undefined4 *)(param_1 + 0xc) = 0;
  *(undefined4 *)(param_1 + 0x10) = 0;
  *(undefined4 *)(param_1 + 0x14) = 0;
  puVar1 = (undefined4 *)(param_1 + 4);
  *puVar1 = 0;
  *(undefined4 **)(param_1 + 0xc) = puVar1;
  *(undefined4 **)(param_1 + 0x10) = puVar1;
  *(undefined4 *)(param_1 + 0x20) = 0;
  *(undefined4 *)(param_1 + 0x24) = 0;
  *(undefined4 *)(param_1 + 0x28) = 0;
  *(undefined4 *)(param_1 + 0x2c) = 0;
  puVar2 = (undefined4 *)(param_1 + 0x1c);
  *puVar2 = 0;
  *(undefined4 *)(param_1 + 0x38) = 0;
  *(undefined4 **)(param_1 + 0x24) = puVar2;
  *(undefined4 **)(param_1 + 0x28) = puVar2;
  puVar2 = (undefined4 *)(param_1 + 0x34);
  *puVar2 = 0;
  *puVar2 = puVar2;
  *(undefined4 **)(param_1 + 0x38) = puVar2;
  *(undefined4 *)(param_1 + 0x140) = 0;
  *(undefined4 *)(param_1 + 0x144) = 0;
  *(undefined4 *)(param_1 + 0x148) = 0;
  *(undefined4 *)(param_1 + 0x14c) = 0;
  *(undefined4 *)(param_1 + 0x150) = 0;
  *(int *)(param_1 + 0x148) = param_1 + 0x140;
  *(int *)(param_1 + 0x14c) = param_1 + 0x140;
  *(undefined4 *)(param_1 + 0x158) = 0;
  *(undefined4 *)(param_1 + 0x15c) = 0;
  *(undefined4 *)(param_1 + 0x160) = 0;
  *(undefined4 *)(param_1 + 0x164) = 0;
  *(undefined4 *)(param_1 + 0x168) = 0;
  *(int *)(param_1 + 0x160) = param_1 + 0x158;
  *(int *)(param_1 + 0x164) = param_1 + 0x158;
  *(undefined4 *)(param_1 + 0x16c) = 0;
  *(undefined4 *)(param_1 + 0x170) = 0;
  *(int *)(param_1 + 0x16c) = param_1 + 0x16c;
  *(int *)(param_1 + 0x170) = param_1 + 0x16c;
  iVar4 = param_1 + 0x260;
  *(undefined1 *)(param_1 + 0x174) = 0;
  *(undefined4 *)(param_1 + 0x260) = 0;
  *(undefined4 *)(param_1 + 0x264) = 0;
  *(int *)(param_1 + 0x260) = iVar4;
  *(int *)(param_1 + 0x264) = iVar4;
  iVar5 = param_1 + 0x26c;
  *(undefined4 *)(param_1 + 0x26c) = 0;
  *(undefined4 *)(param_1 + 0x270) = 0;
  *(undefined4 *)(param_1 + 0x274) = 0;
  *(undefined4 *)(param_1 + 0x278) = 0;
  *(undefined4 *)(param_1 + 0x27c) = 0;
  *(int *)(param_1 + 0x274) = iVar5;
  *(int *)(param_1 + 0x278) = iVar5;
  iVar6 = param_1 + 0x284;
  *(undefined4 *)(param_1 + 0x284) = 0;
  *(undefined4 *)(param_1 + 0x288) = 0;
  *(undefined4 *)(param_1 + 0x28c) = 0;
  *(undefined4 *)(param_1 + 0x290) = 0;
  *(undefined4 *)(param_1 + 0x294) = 0;
  *(int *)(param_1 + 0x28c) = iVar6;
  *(int *)(param_1 + 0x290) = iVar6;
  iVar7 = 0;
  do {
    iVar8 = param_1 + iVar7;
    iVar7 = iVar7 + 0x18;
    *(undefined4 *)(iVar8 + 0x2a8) = 0;
    *(undefined4 *)(iVar8 + 0x2ac) = 0;
    *(undefined4 *)(iVar8 + 0x2b0) = 0;
    *(undefined4 *)(iVar8 + 0x2b4) = 0;
    *(undefined4 *)(iVar8 + 0x2b8) = 0;
    *(int *)(iVar8 + 0x2b0) = iVar8 + 0x2a8;
    *(int *)(iVar8 + 0x2b4) = iVar8 + 0x2a8;
  } while (iVar7 != 0x30);
  *(undefined4 *)(param_1 + 0x54) = 0;
  *(undefined4 *)(param_1 + 0x58) = 0;
  *(undefined1 *)(param_1 + 0x32) = 0;
  *(undefined4 *)(param_1 + 0x220) = 0xbf800000;
  *(undefined4 *)(param_1 + 0x23c) = 0xbf800000;
  *(undefined4 *)(param_1 + 0x21c) = 0xffffffff;
  *(undefined4 *)(param_1 + 0x238) = 0;
  *(undefined4 *)(param_1 + 0x230) = 0xffffffff;
  *(undefined4 *)(param_1 + 0x22c) = 0xffffffff;
  *(undefined4 *)(param_1 + 0x228) = 0xffffffff;
  *(undefined4 *)(param_1 + 0x224) = 0xffffffff;
  *(undefined1 *)(param_1 + 0x234) = 0;
  *(undefined1 *)(param_1 + 0x235) = 0;
  *(undefined4 *)(param_1 + 0x100) = 0x46;
  *(undefined4 *)(param_1 + 0x244) = 0x3f800000;
  *(undefined4 *)(param_1 + 0x240) = 0;
  *(undefined4 *)(param_1 + 0x40) = 0;
  *(undefined4 *)(param_1 + 0x68) = 0;
  *(undefined4 *)(param_1 + 100) = 0xffffffff;
  *(undefined4 *)(param_1 + 0x5c) = 0;
  *(undefined4 *)(param_1 + 0xfc) = 0xbf800000;
  *(undefined4 *)(param_1 + 0x298) = 0;
  *(undefined4 *)(param_1 + 0x29c) = 0;
  *(undefined4 *)(param_1 + 0x2a0) = 0;
  *(undefined4 *)(param_1 + 0x6c) = 0;
  _memset((void *)(param_1 + 0x70),0xff,0x80);
  iVar8 = 0;
  iVar7 = 0;
  do {
    iVar3 = param_1 + iVar7 * 4;
    iVar10 = param_1 + iVar8;
    *(undefined4 *)(iVar3 + 0x4c) = 0;
    *(undefined4 *)(iVar3 + 0x44) = 0;
    *(undefined4 *)(iVar3 + 0x2dc) = 0;
    FUN_00022c1c(iVar10 + 0x2a4,*(undefined4 *)(iVar10 + 0x2ac));
    iVar8 = iVar8 + 0x18;
    iVar7 = iVar7 + 1;
    *(undefined4 *)(iVar10 + 0x2ac) = 0;
    *(int *)(iVar10 + 0x2b0) = iVar10 + 0x2a8;
    *(int *)(iVar10 + 0x2b4) = iVar10 + 0x2a8;
    *(undefined4 *)(iVar10 + 0x2b8) = 0;
  } while (iVar8 != 0x30);
  *(undefined4 *)(param_1 + 0x25c) = 0x3f800000;
  *(undefined4 *)(param_1 + 0x248) = 0;
  *(undefined4 *)(param_1 + 0x254) = 0;
  *(undefined4 *)(param_1 + 600) = 0;
  FUN_00022bb4(iVar4);
  *(int *)iVar4 = iVar4;
  *(int *)(param_1 + 0x264) = iVar4;
  FUN_00022bf4(param_1 + 0x268,*(undefined4 *)(param_1 + 0x270));
  *(undefined4 *)(param_1 + 0x270) = 0;
  *(int *)(param_1 + 0x274) = iVar5;
  *(int *)(param_1 + 0x278) = iVar5;
  *(undefined4 *)(param_1 + 0x27c) = 0;
  FUN_00022bf4(param_1 + 0x280,*(undefined4 *)(param_1 + 0x288));
  *(int *)(param_1 + 0x28c) = iVar6;
  *(undefined4 *)(param_1 + 0x288) = 0;
  *(int *)(param_1 + 0x290) = iVar6;
  *(undefined4 *)(param_1 + 0x294) = 0;
  *(undefined4 *)(param_1 + 0x2d4) = 0;
  *(undefined1 *)(param_1 + 0x3c) = 0;
  *(undefined1 *)(param_1 + 0x30) = 0;
  *(undefined1 *)(param_1 + 0x31) = 0;
  *(undefined1 *)(param_1 + 0x60) = 0;
  FUN_00022b64(param_1,*(undefined4 *)(param_1 + 8));
  *(undefined4 *)(param_1 + 8) = 0;
  *(undefined4 **)(param_1 + 0xc) = puVar1;
  *(undefined4 **)(param_1 + 0x10) = puVar1;
  *(undefined4 *)(param_1 + 0x14) = 0;
  puVar1 = (undefined4 *)*puVar2;
  while (puVar1 != puVar2) {
    puVar9 = (undefined4 *)*puVar1;
    operator_delete(puVar1);
    puVar1 = puVar9;
  }
  *(undefined4 *)(param_1 + 0x2e4) = 0;
  *(undefined4 **)(param_1 + 0x34) = puVar2;
  *(undefined4 **)(param_1 + 0x38) = puVar2;
  _memset((void *)(param_1 + 0x2e8),0xff,0x2c);
  *(undefined4 *)(param_1 + 0xf0) = 0;
  *(undefined4 *)(param_1 + 0xf4) = 0;
  *(undefined4 *)(param_1 + 0xf8) = 0;
  *(undefined1 *)(param_1 + 0x2d8) = 0;
  return param_1;
}


```

## FUN_0002504c — 0002504c

- 函数名: FUN_0002504c
- 函数体: 277 字节
- 调用者数: 1 / 被调用者数: 5

```c

void FUN_0002504c(void)

{
  undefined4 *puVar1;
  undefined *puVar2;
  undefined4 uVar3;
  void *pvVar4;
  undefined4 uVar5;
  
  puVar2 = PTR_DAT_004d9048;
  uVar5 = *(undefined4 *)(PTR_DAT_004d9048 + 0x5c);
  uVar3 = FUN_002f69c4("sessions",8);
  FUN_00027588(uVar5,"sessions",uVar3,1,1,1);
  *(undefined4 *)(puVar2 + 0x1ac) = 0;
  puVar2[9] = 2;
  uVar3 = FUN_00025164();
  *(undefined4 *)(puVar2 + 0xac) = uVar3;
  *(undefined4 *)(puVar2 + 0xb0) = 0x43a00000;
  *(undefined4 *)(puVar2 + 0xbc) = uVar3;
  *(undefined4 *)(puVar2 + 0xc0) = 0x43a00000;
  *(undefined4 *)(puVar2 + 0xb4) = uVar3;
  *(undefined4 *)(puVar2 + 0xb8) = 0x43a00000;
  puVar2[0x1bf] = 0;
  puVar2[0x1a] = 0;
  *(undefined4 *)(puVar2 + 0x94) = 0x42480000;
  *(undefined4 *)(puVar2 + 0x24) = 0;
  *(undefined4 *)(puVar2 + 0x3c) = 0;
  *(undefined4 *)(puVar2 + 0x40) = *(undefined4 *)(*(int *)(puVar2 + 0x5c) + 0x100);
  puVar2[0x19] = 0;
  puVar2[0x18] = 0;
  puVar2[0xab] = 0;
  *(undefined4 *)(puVar2 + 0x1c8) = 0;
  puVar2[0x1be] = 0;
  puVar2[0x1c4] = 0;
  puVar2[0x29] = 1;
  puVar2[0x2a] = 1;
  puVar2[0x17] = 1;
  *(undefined4 *)(puVar2 + 0x18c) = 0;
  *(undefined4 *)(puVar2 + 0x30) = 0;
  *(undefined4 *)(puVar2 + 0x34) = 0;
  *(undefined4 *)(puVar2 + 0x38) = 0;
  puVar2[0x1bc] = 0;
  puVar2[0x5d0] = 0;
  *(undefined4 *)(puVar2 + 0x5d4) = 0;
  puVar2[0x1bd] = 1;
  puVar2[0x15] = 0;
  puVar2[0x5d1] = 0;
  pvVar4 = operator_new(0x18);
  *(undefined4 *)((int)pvVar4 + 8) = 0;
  *(undefined4 *)((int)pvVar4 + 0xc) = 0;
  *(undefined4 *)((int)pvVar4 + 0x10) = 0;
  *(undefined4 *)((int)pvVar4 + 0x14) = 0;
  puVar1 = (undefined4 *)((int)pvVar4 + 4);
  *puVar1 = 0;
  *(undefined4 **)((int)pvVar4 + 0xc) = puVar1;
  *(undefined4 **)((int)pvVar4 + 0x10) = puVar1;
  *(void **)(puVar2 + 0x654) = pvVar4;
  FUN_00025a48(pvVar4,0);
  *(undefined4 *)((int)pvVar4 + 8) = 0;
  *(undefined4 **)((int)pvVar4 + 0xc) = puVar1;
  *(undefined4 **)((int)pvVar4 + 0x10) = puVar1;
  *(undefined4 *)((int)pvVar4 + 0x14) = 0;
  return;
}


```

