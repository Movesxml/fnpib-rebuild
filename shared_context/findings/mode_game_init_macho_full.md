# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0006fa3c — 0006fa3c

- 函数名: FUN_0006fa3c
- 函数体: 339 字节
- 调用者数: 1 / 被调用者数: 6

```c

void FUN_0006fa3c(undefined1 *param_1)

{
  int *piVar1;
  int iVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  double local_20;
  
  piVar1 = operator_new(0x48);
  FUN_0030cda0(piVar1,"xml/originalModeInfo.xml");
  if (piVar1 != (int *)0x0) {
    iVar2 = FUN_0030ceac(piVar1,0);
    if (iVar2 == 1) {
      uVar3 = FUN_0030c328(piVar1,"originalMode");
      uVar4 = FUN_0030c328(uVar3,"magicBean");
      iVar2 = FUN_0030c718(uVar4,"baseInterval",&local_20);
      if (iVar2 == 0) {
        *(float *)(param_1 + 4) = (float)local_20;
      }
      iVar2 = FUN_0030c718(uVar4,"intervalGrowth",&local_20);
      if (iVar2 == 0) {
        *(float *)(param_1 + 8) = (float)local_20;
      }
      iVar2 = FUN_0030c718(uVar4,"intervalVariation",&local_20);
      if (iVar2 == 0) {
        *(float *)(param_1 + 0xc) = (float)local_20;
      }
      iVar2 = FUN_0030c718(uVar4,"initalSpawn",&local_20);
      if (iVar2 == 0) {
        *(float *)(param_1 + 0x10) = (float)local_20;
      }
      FUN_0030c6c0(uVar4,"beanScore",param_1 + 0x14);
      uVar3 = FUN_0030c328(uVar3,"timing");
      iVar2 = FUN_0030c718(uVar3,"dtStart",&local_20);
      if (iVar2 == 0) {
        *(float *)(param_1 + 0x18) = (float)local_20;
      }
      iVar2 = FUN_0030c718(uVar3,"dtIncrease",&local_20);
      if (iVar2 == 0) {
        *(float *)(param_1 + 0x1c) = (float)local_20;
      }
      *param_1 = 1;
    }
    else {
      (**(code **)(*piVar1 + 4))(piVar1);
    }
  }
  return;
}


```

