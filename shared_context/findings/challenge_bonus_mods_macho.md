# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0006644c — 0006644c

- 函数名: FUN_0006644c
- 函数体: 101 字节
- 调用者数: 1 / 被调用者数: 2

```c

void * FUN_0006644c(void *param_1,int param_2)

{
  int iVar1;
  int iVar2;
  double local_28;
  
  _memset_pattern16(param_1,&DAT_004712e0,0xc);
  if (param_2 != 0) {
    iVar2 = 0;
    do {
      iVar1 = FUN_0030c718(param_2,*(undefined4 *)((int)&DAT_0052cb74 + iVar2),&local_28);
      if (iVar1 == 0) {
        *(float *)((int)param_1 + iVar2) = (float)local_28;
      }
      iVar2 = iVar2 + 4;
    } while (iVar2 != 0xc);
  }
  return param_1;
}


```

## FUN_00065958 — 00065958

- 函数名: FUN_00065958
- 函数体: 13 字节
- 调用者数: 2 / 被调用者数: 1

```c

undefined4 FUN_00065958(undefined4 param_1)

{
  FUN_0006644c();
  return param_1;
}


```

