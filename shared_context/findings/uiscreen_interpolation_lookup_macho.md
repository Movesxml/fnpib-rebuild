# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0038d5d0 — 0038e588

- 函数名: FUN_0038e588
- 函数体: 245 字节
- 调用者数: 1 / 被调用者数: 9

```c

void FUN_0038e588(int param_1,undefined4 param_2)

{
  undefined *puVar1;
  undefined4 uVar2;
  int iVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  int iVar6;
  int *piVar7;
  undefined1 local_11c [8];
  undefined1 auStack_114 [40];
  undefined1 auStack_ec [40];
  undefined1 auStack_c4 [40];
  undefined1 auStack_9c [40];
  undefined1 auStack_74 [40];
  undefined1 auStack_4c [40];
  int local_24;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  uVar2 = FUN_0030fc50(param_2);
  iVar6 = *(int *)(param_1 + 8);
  iVar3 = ___umodsi3(uVar2,*(undefined4 *)(param_1 + 0xc));
  for (piVar7 = *(int **)(iVar6 + iVar3 * 4); piVar7 != (int *)0x0; piVar7 = (int *)piVar7[0x14]) {
    uVar4 = FUN_0030f8f0(piVar7);
    iVar6 = *piVar7;
    uVar5 = FUN_0030fc50(piVar7);
    iVar6 = FUN_0030fd20(param_2,uVar4,iVar6 + -1,uVar5);
    if (iVar6 != 0) goto LAB_0038e664;
  }
  FUN_0030f870(auStack_ec,param_2);
  FUN_0030f7cc(auStack_114,0);
  FUN_0030f870(auStack_c4,auStack_ec);
  FUN_0030f870(auStack_9c,auStack_114);
  FUN_0030f870(auStack_74,auStack_c4);
  FUN_0030f870(auStack_4c,auStack_9c);
  FUN_0038e978(local_11c,param_1,auStack_74,iVar3,uVar2);
  FUN_0030f7e0(auStack_4c);
  FUN_0030f7e0(auStack_74);
  FUN_0030f7e0(auStack_9c);
  FUN_0030f7e0(auStack_c4);
  FUN_0030f7e0(auStack_114);
  FUN_0030f7e0(auStack_ec);
LAB_0038e664:
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail(*(int *)puVar1);
  }
  return;
}


```

## FUN_0038d588 — 0038d588

- 函数名: FUN_0038d588
- 函数体: 29 字节
- 调用者数: 5 / 被调用者数: 0

```c

void FUN_0038d588(undefined4 *param_1)

{
  *param_1 = &DAT_0054219c;
  param_1[1] = 0;
  param_1[2] = 0xcdcd0000;
  return;
}


```

