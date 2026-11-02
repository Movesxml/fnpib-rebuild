# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0005ed54 — 0005ed54

- 函数名: FUN_0005ed54
- 函数体: 101 字节
- 调用者数: 2 / 被调用者数: 2

```c

void FUN_0005ed54(int param_1,int *param_2)

{
  undefined4 *puVar1;
  int iVar2;
  int *piVar3;
  int *piVar4;
  int *local_24;
  
  *(undefined4 *)(param_1 + 0x2c) = 0;
  *(undefined4 *)(param_1 + 0x24) = 0;
  piVar4 = (int *)*param_2;
  if (piVar4 != param_2) {
    do {
      puVar1 = (undefined4 *)FUN_0005f510(param_1 + 4,piVar4 + 2);
      piVar3 = (int *)*puVar1;
      local_24 = piVar3;
      if (piVar3 != (int *)0x0) {
        (**(code **)(*piVar3 + 8))(piVar3);
        iVar2 = (**(code **)(*piVar3 + 0x2c))(piVar3);
        if (iVar2 == 5) {
          *(int *)(param_1 + 0x24) = piVar3[0x19];
        }
        FUN_0005f630(param_1 + 0x1c,param_1 + 0x1c,&local_24);
      }
      piVar4 = (int *)*piVar4;
    } while (piVar4 != param_2);
  }
  return;
}


```

## FUN_000663a0 — 000663a0

- 函数名: FUN_000663a0
- 函数体: 105 字节
- 调用者数: 2 / 被调用者数: 3

```c

undefined4 FUN_000663a0(int param_1,undefined4 param_2)

{
  int iVar1;
  undefined4 uVar2;
  undefined4 extraout_s0;
  undefined4 extraout_s1;
  undefined8 uVar3;
  
  iVar1 = FUN_0005edbc(param_2);
  if (iVar1 == 2) {
    *(undefined4 *)(param_1 + 4) = 0;
    *(undefined4 *)(param_1 + 8) = 0;
    *(undefined4 *)(param_1 + 0xc) = 0;
    return extraout_s0;
  }
  uVar2 = FUN_00065a70(param_1,param_2);
  *(undefined4 *)(param_1 + 4) = uVar2;
  uVar2 = FUN_00065ad4(param_1);
  *(undefined4 *)(param_1 + 8) = uVar2;
  uVar3 = FloatVectorMin(CONCAT44(extraout_s1,*(undefined4 *)(param_1 + 0x20)),0,2,0x20);
  uVar3 = FloatVectorSub(0,uVar3,2,0x20);
  uVar3 = FloatVectorMult(uVar3,0x3f0000003f000000,2,0x20);
  uVar3 = FloatVectorMult(uVar3,CONCAT44(extraout_s1,DAT_0006640c),2,0x20);
  *(int *)(param_1 + 0xc) = (int)uVar3;
  return (int)uVar3;
}


```

## FUN_00065968 — 00065968

- 函数名: FUN_00065968
- 函数体: 55 字节
- 调用者数: 1 / 被调用者数: 0

```c

int FUN_00065968(int param_1)

{
  int iVar1;
  int iVar2;
  undefined4 *puVar3;
  undefined8 in_d0;
  undefined4 in_s3;
  undefined8 uVar4;
  
  iVar1 = 0;
  if (*(char *)(param_1 + 0x28) == '\0') {
    return 0;
  }
  iVar2 = 4;
  do {
    puVar3 = (undefined4 *)(param_1 + iVar2);
    iVar2 = iVar2 + 4;
    uVar4 = FloatVectorMult(CONCAT44((int)((ulonglong)in_d0 >> 0x20),*puVar3),
                            CONCAT44(in_s3,puVar3[4]),2,0x20);
    uVar4 = FloatVectorAdd(uVar4,0x3f0000003f000000,2);
    in_d0 = FPToFixed(uVar4,0,1,3,0x20);
    iVar1 = iVar1 + (int)in_d0;
  } while (iVar2 != 0x10);
  return iVar1;
}


```

## FUN_000659a0 — 000659a0

- 函数名: FUN_000659a0
- 函数体: 47 字节
- 调用者数: 3 / 被调用者数: 0

```c

undefined4 FUN_000659a0(int param_1,int param_2)

{
  undefined8 in_d0;
  undefined4 in_s3;
  undefined8 uVar1;
  
  if (*(char *)(param_1 + 0x28) == '\0') {
    return 0;
  }
  param_1 = param_1 + param_2 * 4;
  uVar1 = FloatVectorMult(CONCAT44((int)((ulonglong)in_d0 >> 0x20),*(undefined4 *)(param_1 + 4)),
                          CONCAT44(in_s3,*(undefined4 *)(param_1 + 0x14)),2,0x20);
  uVar1 = FloatVectorAdd(uVar1,0x3f0000003f000000,2);
  uVar1 = FPToFixed(uVar1,0,1,3,0x20);
  return (int)uVar1;
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

## FUN_00074418 — 00074418

- 函数名: FUN_00074418
- 函数体: 11 字节
- 调用者数: 2 / 被调用者数: 0

```c

void FUN_00074418(int *param_1)

{
  (**(code **)(*param_1 + 0x18))();
  return;
}


```

