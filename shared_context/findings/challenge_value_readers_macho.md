# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0001cd94 — 0001cd94

- 函数名: FUN_0001cd94
- 函数体: 13 字节
- 调用者数: 12 / 被调用者数: 0

```c

undefined4 FUN_0001cd94(void)

{
  return DAT_005f8dd4;
}


```

## FUN_00027508 — 00027508

- 函数名: FUN_00027508
- 函数体: 125 字节
- 调用者数: 16 / 被调用者数: 0

```c

undefined4 FUN_00027508(int param_1,uint param_2)

{
  undefined4 uVar1;
  int *piVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  
  iVar4 = param_1 + 4;
  piVar2 = (int *)(param_1 + 8);
  iVar5 = iVar4;
  while (iVar3 = *piVar2, iVar3 != 0) {
    piVar2 = (int *)(iVar3 + 0xc);
    if (param_2 <= *(uint *)(iVar3 + 0x10)) {
      piVar2 = (int *)(iVar3 + 8);
      iVar5 = iVar3;
    }
  }
  if (iVar5 != iVar4) {
    if (param_2 < *(uint *)(iVar5 + 0x10)) {
      iVar5 = iVar4;
    }
    if (iVar5 != iVar4) {
      return *(undefined4 *)(iVar5 + 0x58);
    }
  }
  iVar4 = param_1 + 0x1c;
  piVar2 = (int *)(param_1 + 0x20);
  iVar5 = iVar4;
  while (iVar3 = *piVar2, iVar3 != 0) {
    piVar2 = (int *)(iVar3 + 0xc);
    if (param_2 <= *(uint *)(iVar3 + 0x10)) {
      piVar2 = (int *)(iVar3 + 8);
      iVar5 = iVar3;
    }
  }
  if (iVar5 != iVar4) {
    if (param_2 < *(uint *)(iVar5 + 0x10)) {
      iVar5 = iVar4;
    }
    uVar1 = 0;
    if (iVar5 != iVar4) {
      uVar1 = *(undefined4 *)(iVar5 + 0x58);
    }
    return uVar1;
  }
  return 0;
}


```

## FUN_00039c64 — 00039c64

- 函数名: FUN_00039c64
- 函数体: 15 字节
- 调用者数: 1 / 被调用者数: 1

```c

void FUN_00039c64(undefined4 *param_1,undefined4 param_2)

{
  undefined4 uVar1;
  
  uVar1 = FUN_00039bd4(param_2);
  *param_1 = uVar1;
  return;
}


```

## FUN_00039c74 — 00039c74

- 函数名: FUN_00039c74
- 函数体: 45 字节
- 调用者数: 1 / 被调用者数: 0

```c

bool FUN_00039c74(int *param_1,int param_2,int param_3)

{
  int iVar1;
  
  iVar1 = *param_1;
  if (iVar1 == 2) {
    return param_3 < param_2;
  }
  if (iVar1 == 1) {
    return param_2 != param_3;
  }
  if (iVar1 != 0) {
    return false;
  }
  return param_2 == param_3;
}


```

## FUN_00074770 — 未找到

(函数未找到)

## FUN_00074778 — 未找到

(函数未找到)

## FUN_0007477c — 未找到

(函数未找到)

## FUN_0008487c — 00085834

- 函数名: FUN_00085834
- 函数体: 327 字节
- 调用者数: 1 / 被调用者数: 2

```c

void FUN_00085834(int param_1,int param_2)

{
  int *piVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  float fVar5;
  undefined8 in_d0;
  undefined8 uVar6;
  float fVar7;
  ulonglong uVar8;
  undefined8 uVar9;
  undefined4 local_20;
  undefined4 local_1c;
  undefined4 local_18;
  int local_14;
  
  if (*(int *)(param_1 + 0x740) == *(int *)(param_1 + 0x73c)) {
    iVar2 = *(int *)(param_1 + 0x784);
    iVar4 = *(int *)(iVar2 + 0x38);
    iVar3 = iVar4;
    if (iVar4 == 0) {
      fVar7 = 0.0;
      if (*(float *)(iVar2 + 0x48) != -1.0) {
        fVar7 = *(float *)(iVar2 + 0x48);
      }
      *(float *)(param_1 + 0x74c) = fVar7;
    }
    else {
      do {
        piVar1 = (int *)(iVar3 + 4);
        iVar3 = *(int *)(*piVar1 + 0x38);
      } while (iVar3 != 0);
      fVar5 = *(float *)(*piVar1 + 0x48);
      fVar7 = 0.0;
      if (fVar5 != -1.0) {
        fVar7 = fVar5;
      }
      *(float *)(param_1 + 0x74c) = fVar7;
      while (iVar4 != 0) {
        iVar2 = *(int *)(iVar4 + 4);
        iVar4 = *(int *)(iVar2 + 0x38);
      }
    }
    fVar7 = 0.0;
    if (*(float *)(iVar2 + 0x48) != -1.0) {
      fVar7 = *(float *)(iVar2 + 0x48);
    }
    *(float *)(param_1 + 0x768) = fVar7;
  }
  for (iVar3 = *(int *)(param_1 + 0x780); *(int *)(iVar3 + 0x38) != 0;
      iVar3 = *(int *)(*(int *)(iVar3 + 0x38) + 4)) {
  }
  uVar6 = CONCAT44((int)((ulonglong)in_d0 >> 0x20),*(undefined4 *)(param_1 + 0x748));
  for (iVar2 = *(int *)(param_1 + 0x784); *(int *)(iVar2 + 0x38) != 0;
      iVar2 = *(int *)(*(int *)(iVar2 + 0x38) + 4)) {
  }
  uVar8 = 0;
  if (*(float *)(iVar2 + 0x48) != -1.0) {
    uVar8 = (ulonglong)(uint)*(float *)(iVar2 + 0x48);
  }
  uVar9 = FloatVectorAdd(uVar6,uVar8,2);
  if (*(char *)(iVar3 + 0x48) == '\0') {
    local_1c = 0;
    for (iVar3 = *(int *)(param_2 + 0x608); local_20 = (int)uVar9, *(int *)(iVar3 + 0x38) != 0;
        iVar3 = *(int *)(*(int *)(iVar3 + 0x38) + 4)) {
    }
  }
  else {
    local_20 = 0;
    for (iVar3 = *(int *)(param_2 + 0x60c); local_1c = (int)uVar9, *(int *)(iVar3 + 0x38) != 0;
        iVar3 = *(int *)(*(int *)(iVar3 + 0x38) + 4)) {
    }
  }
  local_18 = 0;
  uVar6 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar9 >> 0x20),*(undefined4 *)(iVar3 + 0x48)),
                         uVar6,2);
  *(undefined4 *)(param_1 + 0x748) = (int)uVar6;
  local_14 = param_2;
  FUN_0000606c((int)uVar6,*(undefined4 *)(param_2 + 0x5f8),&local_20);
  FUN_00086430(param_1 + 0x73c,&local_14);
  return;
}


```

## FUN_0007608c — 0007608c

- 函数名: FUN_0007608c
- 函数体: 333 字节
- 调用者数: 0 / 被调用者数: 8

```c

void FUN_0007608c(int param_1)

{
  undefined *puVar1;
  undefined *puVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  int iVar5;
  undefined **local_50;
  undefined *local_4c;
  undefined4 local_48 [8];
  undefined1 local_28;
  int local_24;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  uVar3 = FUN_00033ca0();
  uVar4 = FUN_002f69c4("balloonPop",10);
  iVar5 = FUN_00035a08(uVar3,uVar4,0,0);
  if (iVar5 != 0) {
    *(undefined4 *)(iVar5 + 8) = *(undefined4 *)(param_1 + 0x10);
    *(undefined4 *)(iVar5 + 0xc) = *(undefined4 *)(param_1 + 0x14);
    *(undefined4 *)(iVar5 + 0x10) = *(undefined4 *)(param_1 + 0x18);
  }
  puVar2 = PTR_DAT_004d9048;
  local_28 = 1;
  local_50 = &PTR_LAB_0052bf38;
  local_4c = PTR_FUN_004d9058;
  local_48[0] = 0;
  uVar3 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
  FUN_0000a23c(&local_50,local_48);
  FUN_0002bc94(uVar3,"balloon-pop-1",0x3f800000,0x3f800000,local_48,0);
  FUN_0000a298(local_48);
  uVar4 = *(undefined4 *)(puVar2 + 0x5c);
  uVar3 = FUN_002f69c4("balloons",8);
  FUN_00027588(uVar4,"balloons",uVar3,1,0,0);
  uVar4 = *(undefined4 *)(puVar2 + 0x5c);
  uVar3 = FUN_002f69c4("balloons_total",0xe);
  FUN_00027588(uVar4,"balloons_total",uVar3,1,1,0);
  uVar4 = *(undefined4 *)(puVar2 + 0x5c);
  uVar3 = FUN_002f69c4("balloonsSinceV3_total",0x15);
  FUN_00027588(uVar4,"balloonsSinceV3_total",uVar3,1,1,0);
  *(uint *)(param_1 + 0xc) = *(uint *)(param_1 + 0xc) | 0x10;
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail(*(int *)puVar1);
  }
  return;
}


```

## FUN_000761dc — 000761dc

- 函数名: FUN_000761dc
- 函数体: 357 字节
- 调用者数: 0 / 被调用者数: 1

```c

void FUN_000761dc(int param_1)

{
  char cVar1;
  undefined8 in_d0;
  undefined4 uVar2;
  undefined8 in_d1;
  undefined8 uVar3;
  undefined8 uVar4;
  undefined8 in_d2;
  undefined4 uVar5;
  undefined8 in_d3;
  undefined8 uVar6;
  undefined4 in_s9;
  undefined4 in_s11;
  undefined4 in_s13;
  undefined8 uVar7;
  undefined8 uVar8;
  undefined8 uVar9;
  undefined4 local_50;
  undefined4 local_4c;
  undefined4 local_48;
  undefined4 local_44;
  undefined4 local_40;
  undefined4 local_3c;
  undefined4 local_38;
  undefined4 local_34;
  undefined4 local_30;
  undefined4 local_2c;
  undefined4 local_28;
  undefined4 local_24;
  undefined4 local_20;
  undefined4 local_1c;
  undefined4 local_18;
  undefined4 local_14;
  
  cVar1 = '\0';
  if (DAT_005f9668 != 0) {
    cVar1 = *(char *)(param_1 + 0x5c);
  }
  if (DAT_005f9668 != 0 && cVar1 != '\0') {
    local_44 = DAT_0052be2c;
    local_24 = DAT_0052be4c;
    local_34 = DAT_0052be3c;
    local_14 = DAT_0052be5c;
    uVar7 = FloatVectorMult(CONCAT44((int)((ulonglong)in_d1 >> 0x20),*(undefined4 *)(param_1 + 0x28)
                                    ),CONCAT44(in_s13,*(undefined4 *)(param_1 + 0x68)),2,0x20);
    uVar5 = (undefined4)((ulonglong)in_d2 >> 0x20);
    uVar8 = FloatVectorMult(CONCAT44((int)((ulonglong)in_d3 >> 0x20),*(undefined4 *)(param_1 + 0x2c)
                                    ),CONCAT44(in_s9,*(undefined4 *)(param_1 + 0x6c)),2,0x20);
    uVar3 = FloatVectorMult(uVar7,CONCAT44(in_s11,DAT_0052be20),2,0x20);
    uVar9 = FloatVectorMult(CONCAT44((int)((ulonglong)in_d0 >> 0x20),*(undefined4 *)(param_1 + 0x30)
                                    ),CONCAT44(uVar5,*(undefined4 *)(param_1 + 0x70)),2,0x20);
    local_50 = (undefined4)uVar3;
    uVar3 = FloatVectorMult(uVar7,CONCAT44((int)((ulonglong)uVar3 >> 0x20),DAT_0052be30),2,0x20);
    local_40 = (undefined4)uVar3;
    uVar4 = FloatVectorMult(uVar7,CONCAT44((int)((ulonglong)uVar3 >> 0x20),DAT_0052be40),2,0x20);
    local_30 = (undefined4)uVar4;
    uVar3 = FloatVectorMult(uVar8,CONCAT44(in_s11,DAT_0052be24),2,0x20);
    local_4c = (undefined4)uVar3;
    uVar3 = FloatVectorMult(uVar8,CONCAT44((int)((ulonglong)uVar3 >> 0x20),DAT_0052be34),2,0x20);
    local_3c = (undefined4)uVar3;
    uVar6 = FloatVectorMult(uVar8,CONCAT44((int)((ulonglong)uVar3 >> 0x20),DAT_0052be44),2,0x20);
    local_2c = (undefined4)uVar6;
    uVar3 = FloatVectorMult(uVar9,CONCAT44(in_s9,DAT_0052be28),2,0x20);
    local_48 = (undefined4)uVar3;
    uVar3 = FloatVectorMult(uVar9,CONCAT44((int)((ulonglong)uVar3 >> 0x20),DAT_0052be38),2,0x20);
    local_38 = (undefined4)uVar3;
    uVar3 = FloatVectorMult(uVar9,CONCAT44((int)((ulonglong)uVar3 >> 0x20),DAT_0052be48),2,0x20);
    local_28 = (undefined4)uVar3;
    uVar2 = (undefined4)((ulonglong)uVar3 >> 0x20);
    uVar9 = FloatVectorMult(uVar9,CONCAT44(uVar2,DAT_0052be58),2,0x20);
    uVar7 = FloatVectorMult(uVar7,CONCAT44((int)((ulonglong)uVar4 >> 0x20),DAT_0052be50),2,0x20);
    uVar3 = FloatVectorMult(uVar8,CONCAT44((int)((ulonglong)uVar6 >> 0x20),DAT_0052be54),2,0x20);
    uVar4 = FloatVectorAdd(CONCAT44(in_s9,*(undefined4 *)(param_1 + 0x14)),0,2);
    uVar6 = FloatVectorAdd(CONCAT44(in_s11,*(undefined4 *)(param_1 + 0x10)),0,2);
    uVar8 = FloatVectorAdd(CONCAT44(uVar5,*(undefined4 *)(param_1 + 0x58)),
                           CONCAT44(uVar2,*(undefined4 *)(param_1 + 0x18)),2);
    uVar4 = FloatVectorAdd(uVar4,uVar3,2);
    uVar6 = FloatVectorAdd(uVar6,uVar7,2);
    uVar3 = FloatVectorAdd(uVar8,uVar9,2);
    local_20 = (undefined4)uVar6;
    local_1c = (undefined4)uVar4;
    local_18 = (undefined4)uVar3;
    FUN_00304d40(local_18,DAT_005f9668,&local_50);
  }
  return;
}


```

