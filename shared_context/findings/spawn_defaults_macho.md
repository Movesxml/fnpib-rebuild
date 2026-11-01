# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_00053388 — 00053388

- 函数名: FUN_00053388
- 函数体: 535 字节
- 调用者数: 1 / 被调用者数: 15

```c

void FUN_00053388(int *param_1,undefined4 param_2)

{
  undefined *puVar1;
  undefined1 uVar2;
  char *pcVar3;
  size_t sVar4;
  char *pcVar5;
  int iVar6;
  undefined4 uVar7;
  int iVar8;
  int *piVar9;
  int *unaff_r6;
  bool bVar10;
  allocator aaStack_38 [4];
  int local_34;
  undefined *local_30;
  int local_2c;
  int local_28;
  
  pcVar3 = (char *)FUN_0030c660(param_2,"name");
  bVar10 = pcVar3 == (char *)0x0;
  if (!bVar10) {
    unaff_r6 = param_1 + 5;
    bVar10 = unaff_r6 == (int *)0x0;
  }
  if (!bVar10) {
    if ((void *)*unaff_r6 != (void *)0x0) {
      operator_delete__((void *)*unaff_r6);
      *unaff_r6 = 0;
    }
    sVar4 = _strlen(pcVar3);
    pcVar5 = operator_new__(sVar4 + 1);
    *unaff_r6 = (int)pcVar5;
    _strcpy(pcVar5,pcVar3);
  }
  pcVar3 = (char *)param_1[5];
  sVar4 = _strlen(pcVar3);
  iVar6 = FUN_002f69c4(pcVar3,sVar4);
  param_1[6] = iVar6;
  FUN_0030c660(param_2,"mode");
  iVar6 = FUN_00039714();
  param_1[7] = iVar6;
  FUN_0030c6c0(param_2,"minWait",param_1 + 8);
  FUN_0030c6c0(param_2,"maxWait",param_1 + 9);
  FUN_0030c6c0(param_2,"dontSpawnBeforeWave",param_1 + 0xb);
  iVar6 = FUN_0030c660(param_2,"canSpawnWithPowers");
  if (iVar6 != 0) {
    uVar7 = FUN_0030c660(param_2,"canSpawnWithPowers");
    uVar2 = FUN_00039580("true",uVar7);
    *(undefined1 *)(param_1 + 10) = uVar2;
  }
  param_1[1] = 0;
  iVar6 = FUN_0030c328(param_2,"fruit");
  if (iVar6 != 0) {
    do {
      puVar1 = PTR__S_empty_rep_storage_004d9038;
      local_30 = PTR__S_empty_rep_storage_004d9038 + 0xc;
      local_2c = 100;
      pcVar3 = (char *)FUN_0030c660(iVar6,"type");
      std::string::string((string *)&local_34,pcVar3,aaStack_38);
      std::string::assign((string *)&local_30);
      if ((allocator *)(local_34 + -0xc) != (allocator *)puVar1) {
        piVar9 = (int *)(local_34 + -4);
        DataMemoryBarrier(0x1b);
        do {
          ExclusiveAccess(piVar9);
          iVar8 = *piVar9;
          bVar10 = (bool)hasExclusiveAccess(piVar9);
        } while (!bVar10);
        *piVar9 = iVar8 + -1;
        DataMemoryBarrier(0x1b);
        if (iVar8 < 1) {
          std::string::_Rep::_M_destroy((allocator *)(local_34 + -0xc));
        }
      }
      FUN_0030c6c0(iVar6,"chance",&local_2c);
      local_28 = param_1[1] + local_2c;
      param_1[1] = local_28;
      FUN_000584c8(param_1 + 2,&local_30);
      if ((allocator *)(local_30 + -0xc) != (allocator *)PTR__S_empty_rep_storage_004d9038) {
        piVar9 = (int *)(local_30 + -4);
        DataMemoryBarrier(0x1b);
        do {
          ExclusiveAccess(piVar9);
          iVar8 = *piVar9;
          bVar10 = (bool)hasExclusiveAccess(piVar9);
        } while (!bVar10);
        *piVar9 = iVar8 + -1;
        DataMemoryBarrier(0x1b);
        if (iVar8 < 1) {
          std::string::_Rep::_M_destroy((allocator *)(local_30 + -0xc));
        }
      }
      iVar6 = FUN_0030c3a0(iVar6,"fruit");
    } while (iVar6 != 0);
  }
  (**(code **)(*param_1 + 4))(param_1,param_2);
  return;
}


```

## FUN_0000f274 — 0000f274

- 函数名: FUN_0000f274
- 函数体: 129 字节
- 调用者数: 5 / 被调用者数: 2

```c

void FUN_0000f274(int param_1,float param_2)

{
  undefined *puVar1;
  undefined1 uVar2;
  int iVar3;
  
  uVar2 = 0;
  if ((int)((uint)(param_2 < 0.0) << 0x1f) < 0) {
    param_2 = 0.125;
  }
  *(undefined4 *)(param_1 + 0x11c) = *(undefined4 *)(param_1 + 0x10);
  *(undefined4 *)(param_1 + 0x120) = *(undefined4 *)(param_1 + 0x14);
  puVar1 = PTR_DAT_004d9048;
  *(undefined4 *)(param_1 + 0x124) = *(undefined4 *)(param_1 + 0x18);
  *(float *)(param_1 + 0xd0) = param_2;
  *(undefined4 *)(param_1 + 0x98) = 0;
  *(undefined4 *)(param_1 + 0xa8) = 0;
  *(undefined4 *)(param_1 + 200) = 0;
  *(undefined4 *)(param_1 + 0xac) = 0;
  iVar3 = FUN_0001d10c(puVar1);
  if (iVar3 != 0) {
    FUN_0001d10c(puVar1);
    uVar2 = FUN_00063fe0(PTR_DAT_004d907c,DAT_00556ca8._4_4_);
  }
  *(undefined1 *)(param_1 + 0xcc) = uVar2;
  return;
}


```

## FUN_00008a50 — 00008a50

- 函数名: FUN_00008a50
- 函数体: 27 字节
- 调用者数: 4 / 被调用者数: 0

```c

void FUN_00008a50(int param_1,float param_2)

{
  float fVar1;
  
  fVar1 = DAT_00008a6c;
  if (0.0 < param_2) {
    fVar1 = param_2;
  }
  *(float *)(param_1 + 0xc0) = fVar1;
  return;
}


```

## FUN_00025164 — 00025164

- 函数名: FUN_00025164
- 函数体: 63 字节
- 调用者数: 46 / 被调用者数: 1

```c

undefined4 FUN_00025164(void)

{
  int *piVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined8 uVar4;
  undefined8 uVar5;
  
  piVar1 = (int *)FUN_002eddd0();
  uVar2 = (**(code **)(*piVar1 + 0x9c))();
  piVar1 = (int *)FUN_002eddd0();
  uVar3 = (**(code **)(*piVar1 + 0xa0))();
  uVar4 = FixedToFP(CONCAT44(uVar2,uVar2),0,1,0,0x20);
  uVar5 = FixedToFP(CONCAT44(uVar3,uVar3),0,1,0,0x20);
  uVar4 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar4 >> 0x20),(float)uVar4 / (float)uVar5),
                          CONCAT44((int)((ulonglong)uVar5 >> 0x20),DAT_000251a4),2,0x20);
  return (int)uVar4;
}


```

## FUN_000251a8 — 000251a8

- 函数名: FUN_000251a8
- 函数体: 7 字节
- 调用者数: 48 / 被调用者数: 0

```c

undefined4 FUN_000251a8(void)

{
  return 0x43a00000;
}


```

