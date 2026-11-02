# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_00003d6c — 00003d6c

- 函数名: FUN_00003d6c
- 函数体: 173 字节
- 调用者数: 8 / 被调用者数: 5

```c

undefined4 FUN_00003d6c(int param_1,int param_2,undefined4 *param_3)

{
  int iVar1;
  undefined4 uVar2;
  void *pvVar3;
  _Rb_tree_node_base *p_Var4;
  
  if (((param_2 != 0) && (iVar1 = FUN_0001cd10(0), iVar1 == 1)) &&
     (iVar1 = FUN_0002787c(*(undefined4 *)(PTR_DAT_004d9048 + 0x5c),param_2 + 0x40,
                           *(undefined4 *)(param_2 + 0x80)), iVar1 == 1)) {
    iVar1 = param_1 + *(int *)(param_2 + 0x98) * 0x18;
    p_Var4 = *(_Rb_tree_node_base **)(iVar1 + 0x24);
    while (p_Var4 != (_Rb_tree_node_base *)(iVar1 + 0x1c)) {
      if (*(int *)(p_Var4 + 0x14) == param_2) {
        uVar2 = std::_Rb_tree_increment((_Rb_tree_node_base *)*param_3);
        *param_3 = uVar2;
        param_1 = param_1 + *(int *)(param_2 + 0x98) * 0x18;
        pvVar3 = (void *)std::_Rb_tree_rebalance_for_erase
                                   (p_Var4,(_Rb_tree_node_base *)(param_1 + 0x1c));
        operator_delete(pvVar3);
        *(int *)(param_1 + 0x2c) = *(int *)(param_1 + 0x2c) + -1;
        return 1;
      }
      p_Var4 = (_Rb_tree_node_base *)std::_Rb_tree_increment(p_Var4);
      iVar1 = param_1 + *(int *)(param_2 + 0x98) * 0x18;
    }
  }
  return 0;
}


```

## FUN_00003e98 — 00003e98

- 函数名: FUN_00003e98
- 函数体: 145 字节
- 调用者数: 2 / 被调用者数: 5

```c

undefined4 FUN_00003e98(int param_1,int param_2)

{
  undefined *puVar1;
  int iVar2;
  undefined4 uVar3;
  uint uVar4;
  _Rb_tree_node_base *p_Var5;
  uint uVar6;
  _Rb_tree_node_base *local_24;
  
  puVar1 = PTR_DAT_004d9048;
  iVar2 = FUN_0001d10c(PTR_DAT_004d9048);
  if (iVar2 != 0) {
    FUN_0001d10c(puVar1);
    FUN_0005ee30(PTR_DAT_004d9024);
  }
  local_24 = *(_Rb_tree_node_base **)(param_1 + 0x3c);
  uVar3 = 0;
  do {
    if (local_24 == (_Rb_tree_node_base *)(param_1 + 0x34)) {
      return uVar3;
    }
    while (((p_Var5 = local_24, param_2 < *(int *)(*(int *)(local_24 + 0x14) + 0x8c) ||
            (uVar6 = *(uint *)(*(int *)(local_24 + 0x14) + 0x9c),
            uVar4 = FUN_000254c0(*(undefined4 *)(puVar1 + 0x10)), (uVar4 & uVar6) == 0)) ||
           (iVar2 = FUN_00003d6c(param_1,*(undefined4 *)(p_Var5 + 0x14),&local_24),
           p_Var5 = local_24, iVar2 == 0))) {
      local_24 = (_Rb_tree_node_base *)std::_Rb_tree_increment(p_Var5);
      if (local_24 == (_Rb_tree_node_base *)(param_1 + 0x34)) {
        return uVar3;
      }
    }
    uVar3 = 1;
  } while( true );
}


```

## FUN_00003f2c — 00003f2c

- 函数名: FUN_00003f2c
- 函数体: 133 字节
- 调用者数: 3 / 被调用者数: 2

```c

undefined4 FUN_00003f2c(int param_1,int param_2,uint param_3)

{
  int iVar1;
  uint uVar2;
  int *piVar3;
  int iVar4;
  undefined4 uVar5;
  int iVar6;
  uint uVar7;
  int local_1c;
  
  iVar1 = param_1 + 0x7c;
  piVar3 = (int *)(param_1 + 0x80);
  iVar4 = iVar1;
  while (iVar6 = *piVar3, iVar6 != 0) {
    piVar3 = (int *)(iVar6 + 0xc);
    if (param_3 <= *(uint *)(iVar6 + 0x10)) {
      piVar3 = (int *)(iVar6 + 8);
      iVar4 = iVar6;
    }
  }
  if (iVar4 == iVar1) {
    uVar5 = 0;
  }
  else {
    uVar5 = 0;
    if (param_3 < *(uint *)(iVar4 + 0x10)) {
      iVar4 = iVar1;
    }
    if (iVar4 != iVar1) {
      uVar5 = 0;
      if (*(int *)(*(int *)(iVar4 + 0x14) + 0x8c) <= param_2) {
        uVar7 = *(uint *)(*(int *)(iVar4 + 0x14) + 0x9c);
        local_1c = iVar4;
        uVar2 = FUN_000254c0(*(undefined4 *)(PTR_DAT_004d9048 + 0x10));
        uVar5 = 0;
        if ((uVar2 & uVar7) != 0) {
          uVar5 = *(undefined4 *)(iVar4 + 0x14);
          FUN_00003d6c(param_1,uVar5,&local_1c);
        }
      }
    }
  }
  return uVar5;
}


```

## FUN_0002ede8 — 0002ede8

- 函数名: FUN_0002ede8
- 函数体: 169 字节
- 调用者数: 22 / 被调用者数: 3

```c

undefined4 * FUN_0002ede8(void)

{
  undefined4 *puVar1;
  int iVar2;
  int iVar3;
  
  if (((DAT_00558074 & 1) == 0) && (iVar2 = ___cxa_guard_acquire(&DAT_00558074), iVar2 != 0)) {
    DAT_005580f4 = 0;
    DAT_005580f8 = 0;
    DAT_005580fc = 0;
    DAT_00558108 = 0;
    DAT_00558114 = 0;
    DAT_00558104 = 0;
    DAT_0055810c = &DAT_00558104;
    DAT_00558110 = &DAT_00558104;
    iVar2 = 0;
    do {
      iVar3 = iVar2 + 0x18;
      *(undefined4 *)((int)&DAT_00558120 + iVar2) = 0;
      *(undefined4 *)((int)&DAT_00558124 + iVar2) = 0;
      *(undefined4 *)((int)&DAT_00558128 + iVar2) = 0;
      *(undefined4 *)((int)&DAT_0055812c + iVar2) = 0;
      puVar1 = (undefined4 *)((int)&DAT_0055811c + iVar2);
      *puVar1 = 0;
      *(undefined4 **)((int)&DAT_00558124 + iVar2) = puVar1;
      *(undefined4 **)((int)&DAT_00558128 + iVar2) = puVar1;
      iVar2 = iVar3;
    } while (iVar3 != 0x48);
    DAT_005580ec = 0;
    DAT_005580f0 = 0;
    DAT_005580e8 = 0;
    ___cxa_atexit(&FUN_0002eda4_1,&DAT_005580e8,PTR___mh_execute_header_004d9040);
    ___cxa_guard_release(&DAT_00558074);
  }
  return &DAT_005580e8;
}


```

## FUN_000686b8 — 000686b8

- 函数名: FUN_000686b8
- 函数体: 45 字节
- 调用者数: 1 / 被调用者数: 3

```c

void FUN_000686b8(int param_1)

{
  undefined1 local_10 [4];
  
  local_10[0] = 0;
  FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 0xa8) + 0x260),local_10);
  FUN_0006c0e0(param_1 + 0x28);
  FUN_00069dbc(param_1);
  return;
}


```

