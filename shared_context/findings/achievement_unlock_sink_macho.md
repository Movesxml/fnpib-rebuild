# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0002787c — 0002787c

- 函数名: FUN_0002787c
- 函数体: 111 字节
- 调用者数: 1 / 被调用者数: 5

```c

void FUN_0002787c(int param_1,char *param_2,undefined4 param_3)

{
  undefined *puVar1;
  int iVar2;
  undefined4 uVar3;
  void *pvVar4;
  char acStack_a0 [128];
  undefined4 local_20;
  undefined4 local_1c;
  int local_18;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_18 = *(int *)PTR____stack_chk_guard_004d9044;
  local_1c = param_3;
  iVar2 = FUN_00027800(param_1,param_3);
  uVar3 = 0;
  if (iVar2 == 0) {
    _strcpy(acStack_a0,param_2);
    local_20 = 0x4039999a;
    if (*(int *)(param_1 + 0x27c) != 0) {
      local_20 = 0x40400000;
    }
    pvVar4 = (void *)FUN_0002b1ac(param_1 + 0x268,&local_1c);
    _memcpy(pvVar4,acStack_a0,0x84);
    uVar3 = 1;
  }
  if (*(int *)puVar1 != local_18) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail(uVar3);
  }
  return;
}


```

## FUN_0001cd10 — 0001cd10

- 函数名: FUN_0001cd10
- 函数体: 3 字节
- 调用者数: 1 / 被调用者数: 0

```c

undefined4 FUN_0001cd10(void)

{
  return 1;
}


```

## FUN_000274bc — 000274bc

- 函数名: FUN_000274bc
- 函数体: 75 字节
- 调用者数: 14 / 被调用者数: 4

```c

int FUN_000274bc(undefined4 param_1,char *param_2,int param_3,undefined4 param_4,undefined4 param_5)

{
  size_t sVar1;
  undefined4 uVar2;
  int iVar3;
  
  sVar1 = _strlen(param_2);
  uVar2 = FUN_002f69c4(param_2,sVar1);
  iVar3 = FUN_00027508(param_1,uVar2);
  FUN_00027588(param_1,param_2,uVar2,param_3 - iVar3,param_4,param_5);
  return iVar3;
}


```

## FUN_000276e8 — 000276e8

- 函数名: FUN_000276e8
- 函数体: 31 字节
- 调用者数: 11 / 被调用者数: 3

```c

void FUN_000276e8(undefined4 param_1,char *param_2)

{
  size_t sVar1;
  undefined4 uVar2;
  
  sVar1 = _strlen(param_2);
  uVar2 = FUN_002f69c4(param_2,sVar1);
  FUN_00027508(param_1,uVar2);
  return;
}


```

