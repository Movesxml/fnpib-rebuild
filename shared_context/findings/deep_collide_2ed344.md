# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0002ed344 — 002ee2a0

- 函数名: FUN_002ee2a0
- 函数体: 187 字节
- 调用者数: 0 / 被调用者数: 7

```c

void FUN_002ee2a0(int *param_1)

{
  int iVar1;
  int iVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  int iVar5;
  float *pfVar6;
  float *pfVar7;
  float fVar8;
  float fVar9;
  
  iVar1 = FUN_00324ed0();
  iVar2 = FUN_00324ef4();
  pfVar6 = (float *)&DAT_0052be20;
  param_1[4] = 0;
  param_1[5] = 0;
  iVar5 = -1;
  param_1[6] = iVar1;
  param_1[7] = iVar2;
  pfVar7 = (float *)(param_1 + 0x20);
  do {
    iVar5 = iVar5 + 1;
    if (0xf < iVar5) goto LAB_002ee2fe;
    fVar9 = *pfVar7;
    fVar8 = *pfVar6;
    pfVar6 = pfVar6 + 1;
    pfVar7 = pfVar7 + 1;
  } while (fVar9 == fVar8);
  param_1[4] = 0;
  param_1[5] = 0;
  param_1[6] = iVar2;
  param_1[7] = iVar1;
LAB_002ee2fe:
  FUN_002ede48(param_1);
  if ((char)param_1[0xc] == '\0') {
    *(undefined1 *)(param_1 + 0xc) = 1;
    _glDepthMask(1);
    _glDepthFunc(0x203);
    DAT_00531000 = 3;
    _glClear(0x4500);
    uVar3 = (**(code **)(*param_1 + 0x9c))(param_1);
    uVar4 = (**(code **)(*param_1 + 0xa0))(param_1);
    _glViewport(0,0,uVar3,uVar4);
  }
  return;
}


```

