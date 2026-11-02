# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_00065b78 — 00065b78

- 函数名: FUN_00065b78
- 函数体: 31 字节
- 调用者数: 1 / 被调用者数: 0

```c

void FUN_00065b78(int param_1,int param_2)

{
  if (*(int *)(param_1 + 0x24) != 0) {
    return;
  }
  if ((int)((uint)(*(float *)(param_2 + 0x100) < *(float *)(param_1 + 0x20)) << 0x1f) < 0) {
    *(float *)(param_1 + 0x20) = *(float *)(param_2 + 0x100);
  }
  return;
}


```

## FUN_00065f04 — 00065f04

- 函数名: FUN_00065f04
- 函数体: 61 字节
- 调用者数: 1 / 被调用者数: 1

```c

void FUN_00065f04(int param_1,int param_2)

{
  int iVar1;
  
  if (*(char *)(param_1 + 0x28) != '\0') {
    if (*(char *)(param_2 + 0x1b8) == '\0') {
      iVar1 = 0;
      if (param_2 != 0) {
        iVar1 = *(int *)(param_2 + 0x38);
      }
      if (param_2 != 0 && iVar1 != 0) {
        if (*(int *)(param_1 + 0x24) == 0) {
          if ((int)((uint)(*(float *)(param_2 + 0x100) < *(float *)(param_1 + 0x20)) << 0x1f) < 0) {
            *(float *)(param_1 + 0x20) = *(float *)(param_2 + 0x100);
          }
        }
        FUN_00065f44();
      }
    }
    return;
  }
  return;
}


```

## FUN_00065da8 — 00065da8

- 函数名: FUN_00065da8
- 函数体: 347 字节
- 调用者数: 1 / 被调用者数: 10

```c

void FUN_00065da8(int *param_1,int param_2)

{
  undefined *puVar1;
  undefined *puVar2;
  int iVar3;
  size_t sVar4;
  int iVar5;
  undefined4 uVar6;
  undefined **local_ac;
  undefined *local_a8;
  undefined1 local_8c;
  undefined **local_88;
  undefined *local_84;
  undefined1 local_68;
  char acStack_64 [64];
  int local_24;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  if ((((char)param_1[10] != '\0') && (2 < *(int *)(param_2 + 0x8c))) &&
     (iVar5 = *(int *)(*param_1 + 0x20), iVar5 != 0)) {
    FUN_00074428(iVar5);
    FUN_00074254(iVar5,param_2 + 0x104,0xffffffff);
    puVar2 = PTR_DAT_004d9048;
    local_68 = 1;
    local_88 = (undefined **)0x0;
    uVar6 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a8);
    FUN_0000a298(&local_88);
    local_68 = 0;
    local_88 = &PTR_LAB_0052bf38;
    local_84 = PTR_FUN_004d9154;
    FUN_0007250c(uVar6,0x3ecccccd,0x3f800000,&local_88);
    FUN_0000a298(&local_88);
    if (param_1[0xc] != 0) {
      FUN_0002bf3c(*(undefined4 *)(puVar2 + 0x1a4));
    }
    iVar3 = *(int *)(param_2 + 0x8c) + -2;
    iVar5 = 1;
    if ((1 < iVar3) && (iVar5 = iVar3, 4 < iVar3)) {
      iVar5 = 5;
    }
    FUN_002f702c(acStack_64,0x40,"combo-%i",iVar5);
    sVar4 = _strlen(acStack_64);
    iVar5 = FUN_002f69c4(acStack_64,sVar4);
    param_1[0xc] = iVar5;
    local_8c = 1;
    uVar6 = *(undefined4 *)(puVar2 + 0x1a4);
    local_ac = (undefined **)0x0;
    FUN_0000a298(&local_ac);
    local_8c = 0;
    local_ac = &PTR_LAB_0052bf38;
    local_a8 = PTR_FUN_004d9058;
    FUN_0002bc94(uVar6,acStack_64,0x3e800000,0x3f800000,&local_ac,0);
    FUN_0000a298(&local_ac);
  }
  if (*(int *)puVar1 == local_24) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

## FUN_00065b98 — 00065b98

- 函数名: FUN_00065b98
- 函数体: 519 字节
- 调用者数: 1 / 被调用者数: 15

```c

void FUN_00065b98(int *param_1,int param_2)

{
  int iVar1;
  undefined4 uVar2;
  int iVar3;
  int *piVar4;
  code *pcVar5;
  float fVar6;
  float fVar7;
  undefined **local_fc;
  undefined *local_f8;
  undefined1 local_dc;
  undefined1 auStack_d8 [40];
  undefined1 auStack_b0 [40];
  undefined1 auStack_88 [40];
  undefined1 auStack_60 [12];
  undefined1 auStack_54 [4];
  float local_50;
  float local_4c;
  float local_48;
  undefined1 local_44 [4];
  undefined1 auStack_40 [12];
  int local_34;
  
  local_34 = *(int *)PTR____stack_chk_guard_004d9044;
  iVar1 = *(int *)(param_2 + 0x8c);
  if (2 < iVar1) {
    param_1[0xb] = iVar1 + param_1[0xb];
    iVar1 = *(int *)(param_2 + 0x8c);
  }
  if ((0 < iVar1) && (param_1[9] == 0)) {
    param_1[9] = 1;
    uVar2 = FUN_0000342c();
    FUN_00004188(uVar2,param_1[8]);
    iVar1 = *(int *)(*param_1 + 0x1c);
    if ((iVar1 != 0) && ((float)param_1[8] <= 0.0)) {
      for (iVar3 = *(int *)(iVar1 + 0x608); *(int *)(iVar3 + 0x38) != 0;
          iVar3 = *(int *)(*(int *)(iVar3 + 0x38) + 4)) {
      }
      fVar6 = *(float *)(iVar3 + 0x48);
      for (iVar1 = *(int *)(iVar1 + 0x60c); *(int *)(iVar1 + 0x38) != 0;
          iVar1 = *(int *)(*(int *)(iVar1 + 0x38) + 4)) {
      }
      fVar7 = *(float *)(iVar1 + 0x48);
      uVar2 = FUN_003ecb20();
      FUN_003ed850(auStack_54,uVar2);
      local_4c = fVar6 / (DAT_00065da0 / local_50);
      local_48 = fVar7 / (DAT_00065da0 / local_50);
      FUN_00044590(auStack_60,param_2 + 0x104,&local_4c);
      FUN_0000606c(*(undefined4 *)(*(int *)(*param_1 + 0x1c) + 0x5f8),auStack_60);
      local_44[0] = 1;
      FUN_0001da28(*(undefined4 *)(*(int *)(*param_1 + 0x1c) + 0x260),local_44);
      uVar2 = *(undefined4 *)(*param_1 + 0x1c);
      FUN_0030f7cc(auStack_88,"value");
      iVar1 = FUN_0039725c(uVar2,auStack_88);
      FUN_0030f7e0(auStack_88);
      if (iVar1 != 0) {
        FUN_000659d0(param_1,2,auStack_40,10);
        FUN_0030f7cc(auStack_b0,auStack_40);
        FUN_00022950(*(undefined4 *)(iVar1 + 0x7dc),auStack_b0);
        FUN_0030f7e0(auStack_b0);
      }
      piVar4 = *(int **)(*param_1 + 0x1c);
      pcVar5 = *(code **)(*piVar4 + 0x40);
      FUN_0030f7cc(auStack_d8,"animate_trigger");
      (*pcVar5)(piVar4,auStack_d8,1);
      FUN_0030f7e0(auStack_d8);
      if ((int)((uint)((float)param_1[8] < DAT_00065da4) << 0x1f) < 0) {
        uVar2 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a8);
        local_dc = 1;
        local_fc = (undefined **)0x0;
        FUN_0000a298(&local_fc);
        local_dc = 0;
        local_fc = &PTR_LAB_0052bf38;
        local_f8 = PTR_FUN_004d9154;
        FUN_000724ac(uVar2,0x3ecccccd,0x3f800000,&local_fc);
        FUN_0000a298(&local_fc);
      }
    }
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_34) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00066428 — 00066428

- 函数名: FUN_00066428
- 函数体: 25 字节
- 调用者数: 1 / 被调用者数: 0

```c

void FUN_00066428(int param_1,int param_2)

{
  *(undefined4 *)(param_1 + 0x20) = *(undefined4 *)(param_2 + 400);
  *(undefined4 *)(param_1 + 0x24) = *(undefined4 *)(param_2 + 0x194);
  *(undefined4 *)(param_1 + 0x2c) = *(undefined4 *)(param_2 + 0x198);
  *(undefined1 *)(param_1 + 0x28) = 1;
  return;
}


```

## FUN_00066a8c — 00066a8c

- 函数名: FUN_00066a8c
- 函数体: 101 字节
- 调用者数: 1 / 被调用者数: 3

```c

void FUN_00066a8c(int *param_1,int param_2)

{
  undefined *puVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  
  param_1[2] = param_1[2] + 1;
  param_1[3] = param_1[3] + 1;
  puVar1 = PTR_DAT_004d9048;
  *param_1 = *param_1 + param_2;
  param_1[5] = param_2;
  FUN_000274bc(*(undefined4 *)(puVar1 + 0x5c),"challenge_score",param_2,0,1);
  uVar3 = *(undefined4 *)(puVar1 + 0x5c);
  uVar2 = FUN_002f69c4("challenge_complete",0x12);
  FUN_00027588(uVar3,"challenge_complete",uVar2,1,1,1);
  return;
}


```

## FUN_00066af4 — 00066af4

- 函数名: FUN_00066af4
- 函数体: 7 字节
- 调用者数: 1 / 被调用者数: 0

```c

int FUN_00066af4(int param_1)

{
  return 3 - *(int *)(param_1 + 4);
}


```

## FUN_00066afc — 00066afc

- 函数名: FUN_00066afc
- 函数体: 15 字节
- 调用者数: 1 / 被调用者数: 0

```c

int FUN_00066afc(int param_1)

{
  return (3 - *(int *)(param_1 + 4)) * 100 + *(int *)(param_1 + 0x18);
}


```

## FUN_00066b0c — 00066b0c

- 函数名: FUN_00066b0c
- 函数体: 11 字节
- 调用者数: 1 / 被调用者数: 0

```c

void FUN_00066b0c(int param_1)

{
  *(int *)(param_1 + 4) = *(int *)(param_1 + 4) + 1;
  *(undefined4 *)(param_1 + 0xc) = 0;
  return;
}


```

## FUN_00066b18 — 00066b18

- 函数名: FUN_00066b18
- 函数体: 7 字节
- 调用者数: 2 / 被调用者数: 0

```c

void FUN_00066b18(int param_1)

{
  *(undefined4 *)(param_1 + 0x10) = 0;
  *(undefined4 *)(param_1 + 0x18) = 0;
  return;
}


```

## FUN_00066b20 — 00066b20

- 函数名: FUN_00066b20
- 函数体: 13 字节
- 调用者数: 1 / 被调用者数: 0

```c

void FUN_00066b20(int param_1,int param_2)

{
  *(int *)(param_1 + 0x10) = *(int *)(param_1 + 0x10) + param_2;
  *(int *)(param_1 + 0x18) = param_2 + *(int *)(param_1 + 0x18);
  return;
}


```

