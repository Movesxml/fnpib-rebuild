# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0005eb6c — 0005eb6c

- 函数名: FUN_0005eb6c
- 函数体: 123 字节
- 调用者数: 1 / 被调用者数: 6

```c

void FUN_0005eb6c(int param_1,undefined4 param_2)

{
  int iVar1;
  int *piVar2;
  int *piVar3;
  int local_24;
  
  iVar1 = FUN_0030c328(param_2,"condition");
  if (iVar1 != 0) {
    do {
      FUN_0030c660(iVar1,"type");
      FUN_0005e8e8();
      piVar2 = (int *)FUN_0005e924();
      if (piVar2 != (int *)0x0) {
        (**(code **)(*piVar2 + 0xc))(piVar2,iVar1);
        local_24 = piVar2[0x11];
        piVar3 = (int *)FUN_0005f510(param_1 + 4,&local_24);
        *piVar3 = (int)piVar2;
      }
      iVar1 = FUN_0030c3a0(iVar1,"condition");
    } while (iVar1 != 0);
  }
  return;
}


```

