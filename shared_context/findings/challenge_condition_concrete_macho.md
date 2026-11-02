# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0005ec7c — 0005ec7c

- 函数名: FUN_0005ec7c
- 函数体: 119 字节
- 调用者数: 2 / 被调用者数: 1

```c

void FUN_0005ec7c(int param_1,int param_2)

{
  int *piVar1;
  int *piVar2;
  int *piVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  int iVar6;
  
  if (*(int *)(param_1 + 0x2c) != 0) {
    return;
  }
  FUN_0005ed18(param_1);
  piVar1 = (int *)(param_1 + 0x1c);
  piVar2 = (int *)*piVar1;
  piVar3 = piVar2;
  uVar5 = 0;
  if (piVar2 != piVar1) {
    do {
      if (((param_2 == 1) && (*(char *)(piVar3[2] + 0x54) != '\0')) &&
         (uVar5 = 2, *(int *)(piVar3[2] + 0x5c) == 2)) goto LAB_0005ecf0;
      piVar3 = (int *)*piVar3;
    } while (piVar3 != piVar1);
    uVar4 = 0;
    if (piVar2 == piVar1) {
      uVar5 = 0;
    }
    else {
      do {
        iVar6 = piVar2[2];
        if (*(int *)(iVar6 + 0x58) == 1) {
          uVar5 = 0;
          if ((param_2 != 1) || (uVar5 = 0, *(char *)(iVar6 + 0x54) == '\0')) break;
          uVar4 = 1;
          uVar5 = 0;
          if (*(int *)(iVar6 + 0x5c) != 1) break;
        }
        piVar2 = (int *)*piVar2;
        uVar5 = uVar4;
      } while (piVar2 != piVar1);
    }
  }
LAB_0005ecf0:
  *(undefined4 *)(param_1 + 0x2c) = uVar5;
  return;
}


```

## FUN_0005ed04 — 0005fc1c

- 函数名: FUN_0005fc1c
- 函数体: 347 字节
- 调用者数: 2 / 被调用者数: 8

```c

void FUN_0005fc1c(int param_1)

{
  longlong lVar1;
  float fVar2;
  undefined *puVar3;
  undefined *puVar4;
  int iVar5;
  uint uVar6;
  undefined4 uVar7;
  int iVar8;
  uint uVar9;
  undefined4 uVar10;
  int iVar11;
  undefined8 in_d0;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined8 uVar12;
  undefined8 uVar13;
  undefined8 uVar14;
  undefined **local_48;
  undefined *local_44;
  undefined1 local_28;
  int local_24;
  
  puVar3 = PTR____stack_chk_guard_004d9044;
  uVar7 = (undefined4)((ulonglong)in_d0 >> 0x20);
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  iVar5 = *(int *)(param_1 + 0x68);
  if (*(int *)(iVar5 + 0xa4) == 0) {
    FUN_0030a1d8();
    FUN_0030a7e4();
    local_28 = 1;
    local_48 = (undefined **)0x0;
    uVar7 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
    FUN_0000a298(&local_48);
    local_28 = 0;
    local_48 = &PTR_LAB_0052bf38;
    local_44 = PTR_FUN_004d9058;
    FUN_0002bb34(uVar7,"act-change",0x3f800000,0x3f800000,&local_48,0);
    FUN_0000a298(&local_48);
    *(undefined1 *)(param_1 + 0x8c) = 0;
    iVar5 = *(int *)(param_1 + 0x68);
    uVar7 = extraout_s1;
  }
  if (*(int *)(iVar5 + 0xac) != 0) {
    uVar7 = FUN_0002ede8();
    FUN_000300e0(uVar7,*(undefined4 *)(*(int *)(param_1 + 0x68) + 0xac));
    iVar5 = *(int *)(param_1 + 0x68);
    uVar7 = extraout_s1_00;
  }
  puVar4 = PTR_DAT_004d9050;
  fVar2 = DAT_0005fd78;
  iVar8 = *(int *)(iVar5 + 0x88);
  iVar11 = *(int *)(iVar5 + 0x8c);
  if (iVar8 != iVar11) {
    lVar1 = (ulonglong)*(uint *)PTR_DAT_004d9050 * (ulonglong)*(uint *)(PTR_DAT_004d9050 + 8);
    uVar9 = (uint)lVar1;
    uVar6 = *(int *)(PTR_DAT_004d9050 + 4) * *(uint *)(PTR_DAT_004d9050 + 8) +
            *(uint *)PTR_DAT_004d9050 * *(int *)(PTR_DAT_004d9050 + 0xc) +
            (int)((ulonglong)lVar1 >> 0x20) +
            *(int *)(PTR_DAT_004d9050 + 0x14) +
            (uint)CARRY4(uVar9,*(uint *)(PTR_DAT_004d9050 + 0x10));
    uVar10 = (undefined4)((ulonglong)uVar6 * 0x7ffff >> 0x20);
    *(uint *)PTR_DAT_004d9050 = uVar9 + *(uint *)(PTR_DAT_004d9050 + 0x10);
    *(uint *)(puVar4 + 4) = uVar6;
    iVar11 = iVar11 - iVar8;
    uVar12 = FixedToFP(CONCAT44(uVar10,uVar10),0,1,0,0x20);
    uVar14 = FixedToFP(CONCAT44(iVar11,iVar11),0,0,0,0x20);
    uVar13 = FixedToFP(CONCAT44(iVar8,iVar8),0,0,0,0x20);
    uVar12 = FloatVectorMult(uVar14,CONCAT44(uVar7,(float)uVar12 / fVar2),2,0x20);
    uVar12 = FloatVectorAdd(uVar13,uVar12,2);
    uVar12 = FPToFixed(uVar12,0,0,3,0x20);
    iVar8 = (int)uVar12;
  }
  *(int *)(iVar5 + 0x7c) = iVar8;
  *(undefined4 *)(iVar5 + 0x80) = 0;
  *(undefined4 *)(iVar5 + 0x84) = 0;
  FUN_0006ee88();
  if (*(int *)puVar3 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0005ed20 — 0005fc1c

- 函数名: FUN_0005fc1c
- 函数体: 347 字节
- 调用者数: 2 / 被调用者数: 8

```c

void FUN_0005fc1c(int param_1)

{
  longlong lVar1;
  float fVar2;
  undefined *puVar3;
  undefined *puVar4;
  int iVar5;
  uint uVar6;
  undefined4 uVar7;
  int iVar8;
  uint uVar9;
  undefined4 uVar10;
  int iVar11;
  undefined8 in_d0;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined8 uVar12;
  undefined8 uVar13;
  undefined8 uVar14;
  undefined **local_48;
  undefined *local_44;
  undefined1 local_28;
  int local_24;
  
  puVar3 = PTR____stack_chk_guard_004d9044;
  uVar7 = (undefined4)((ulonglong)in_d0 >> 0x20);
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  iVar5 = *(int *)(param_1 + 0x68);
  if (*(int *)(iVar5 + 0xa4) == 0) {
    FUN_0030a1d8();
    FUN_0030a7e4();
    local_28 = 1;
    local_48 = (undefined **)0x0;
    uVar7 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
    FUN_0000a298(&local_48);
    local_28 = 0;
    local_48 = &PTR_LAB_0052bf38;
    local_44 = PTR_FUN_004d9058;
    FUN_0002bb34(uVar7,"act-change",0x3f800000,0x3f800000,&local_48,0);
    FUN_0000a298(&local_48);
    *(undefined1 *)(param_1 + 0x8c) = 0;
    iVar5 = *(int *)(param_1 + 0x68);
    uVar7 = extraout_s1;
  }
  if (*(int *)(iVar5 + 0xac) != 0) {
    uVar7 = FUN_0002ede8();
    FUN_000300e0(uVar7,*(undefined4 *)(*(int *)(param_1 + 0x68) + 0xac));
    iVar5 = *(int *)(param_1 + 0x68);
    uVar7 = extraout_s1_00;
  }
  puVar4 = PTR_DAT_004d9050;
  fVar2 = DAT_0005fd78;
  iVar8 = *(int *)(iVar5 + 0x88);
  iVar11 = *(int *)(iVar5 + 0x8c);
  if (iVar8 != iVar11) {
    lVar1 = (ulonglong)*(uint *)PTR_DAT_004d9050 * (ulonglong)*(uint *)(PTR_DAT_004d9050 + 8);
    uVar9 = (uint)lVar1;
    uVar6 = *(int *)(PTR_DAT_004d9050 + 4) * *(uint *)(PTR_DAT_004d9050 + 8) +
            *(uint *)PTR_DAT_004d9050 * *(int *)(PTR_DAT_004d9050 + 0xc) +
            (int)((ulonglong)lVar1 >> 0x20) +
            *(int *)(PTR_DAT_004d9050 + 0x14) +
            (uint)CARRY4(uVar9,*(uint *)(PTR_DAT_004d9050 + 0x10));
    uVar10 = (undefined4)((ulonglong)uVar6 * 0x7ffff >> 0x20);
    *(uint *)PTR_DAT_004d9050 = uVar9 + *(uint *)(PTR_DAT_004d9050 + 0x10);
    *(uint *)(puVar4 + 4) = uVar6;
    iVar11 = iVar11 - iVar8;
    uVar12 = FixedToFP(CONCAT44(uVar10,uVar10),0,1,0,0x20);
    uVar14 = FixedToFP(CONCAT44(iVar11,iVar11),0,0,0,0x20);
    uVar13 = FixedToFP(CONCAT44(iVar8,iVar8),0,0,0,0x20);
    uVar12 = FloatVectorMult(uVar14,CONCAT44(uVar7,(float)uVar12 / fVar2),2,0x20);
    uVar12 = FloatVectorAdd(uVar13,uVar12,2);
    uVar12 = FPToFixed(uVar12,0,0,3,0x20);
    iVar8 = (int)uVar12;
  }
  *(int *)(iVar5 + 0x7c) = iVar8;
  *(undefined4 *)(iVar5 + 0x80) = 0;
  *(undefined4 *)(iVar5 + 0x84) = 0;
  FUN_0006ee88();
  if (*(int *)puVar3 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0005ed4c — 0005fc1c

- 函数名: FUN_0005fc1c
- 函数体: 347 字节
- 调用者数: 2 / 被调用者数: 8

```c

void FUN_0005fc1c(int param_1)

{
  longlong lVar1;
  float fVar2;
  undefined *puVar3;
  undefined *puVar4;
  int iVar5;
  uint uVar6;
  undefined4 uVar7;
  int iVar8;
  uint uVar9;
  undefined4 uVar10;
  int iVar11;
  undefined8 in_d0;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined8 uVar12;
  undefined8 uVar13;
  undefined8 uVar14;
  undefined **local_48;
  undefined *local_44;
  undefined1 local_28;
  int local_24;
  
  puVar3 = PTR____stack_chk_guard_004d9044;
  uVar7 = (undefined4)((ulonglong)in_d0 >> 0x20);
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  iVar5 = *(int *)(param_1 + 0x68);
  if (*(int *)(iVar5 + 0xa4) == 0) {
    FUN_0030a1d8();
    FUN_0030a7e4();
    local_28 = 1;
    local_48 = (undefined **)0x0;
    uVar7 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
    FUN_0000a298(&local_48);
    local_28 = 0;
    local_48 = &PTR_LAB_0052bf38;
    local_44 = PTR_FUN_004d9058;
    FUN_0002bb34(uVar7,"act-change",0x3f800000,0x3f800000,&local_48,0);
    FUN_0000a298(&local_48);
    *(undefined1 *)(param_1 + 0x8c) = 0;
    iVar5 = *(int *)(param_1 + 0x68);
    uVar7 = extraout_s1;
  }
  if (*(int *)(iVar5 + 0xac) != 0) {
    uVar7 = FUN_0002ede8();
    FUN_000300e0(uVar7,*(undefined4 *)(*(int *)(param_1 + 0x68) + 0xac));
    iVar5 = *(int *)(param_1 + 0x68);
    uVar7 = extraout_s1_00;
  }
  puVar4 = PTR_DAT_004d9050;
  fVar2 = DAT_0005fd78;
  iVar8 = *(int *)(iVar5 + 0x88);
  iVar11 = *(int *)(iVar5 + 0x8c);
  if (iVar8 != iVar11) {
    lVar1 = (ulonglong)*(uint *)PTR_DAT_004d9050 * (ulonglong)*(uint *)(PTR_DAT_004d9050 + 8);
    uVar9 = (uint)lVar1;
    uVar6 = *(int *)(PTR_DAT_004d9050 + 4) * *(uint *)(PTR_DAT_004d9050 + 8) +
            *(uint *)PTR_DAT_004d9050 * *(int *)(PTR_DAT_004d9050 + 0xc) +
            (int)((ulonglong)lVar1 >> 0x20) +
            *(int *)(PTR_DAT_004d9050 + 0x14) +
            (uint)CARRY4(uVar9,*(uint *)(PTR_DAT_004d9050 + 0x10));
    uVar10 = (undefined4)((ulonglong)uVar6 * 0x7ffff >> 0x20);
    *(uint *)PTR_DAT_004d9050 = uVar9 + *(uint *)(PTR_DAT_004d9050 + 0x10);
    *(uint *)(puVar4 + 4) = uVar6;
    iVar11 = iVar11 - iVar8;
    uVar12 = FixedToFP(CONCAT44(uVar10,uVar10),0,1,0,0x20);
    uVar14 = FixedToFP(CONCAT44(iVar11,iVar11),0,0,0,0x20);
    uVar13 = FixedToFP(CONCAT44(iVar8,iVar8),0,0,0,0x20);
    uVar12 = FloatVectorMult(uVar14,CONCAT44(uVar7,(float)uVar12 / fVar2),2,0x20);
    uVar12 = FloatVectorAdd(uVar13,uVar12,2);
    uVar12 = FPToFixed(uVar12,0,0,3,0x20);
    iVar8 = (int)uVar12;
  }
  *(int *)(iVar5 + 0x7c) = iVar8;
  *(undefined4 *)(iVar5 + 0x80) = 0;
  *(undefined4 *)(iVar5 + 0x84) = 0;
  FUN_0006ee88();
  if (*(int *)puVar3 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0005ed50 — 0005fc1c

- 函数名: FUN_0005fc1c
- 函数体: 347 字节
- 调用者数: 2 / 被调用者数: 8

```c

void FUN_0005fc1c(int param_1)

{
  longlong lVar1;
  float fVar2;
  undefined *puVar3;
  undefined *puVar4;
  int iVar5;
  uint uVar6;
  undefined4 uVar7;
  int iVar8;
  uint uVar9;
  undefined4 uVar10;
  int iVar11;
  undefined8 in_d0;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined8 uVar12;
  undefined8 uVar13;
  undefined8 uVar14;
  undefined **local_48;
  undefined *local_44;
  undefined1 local_28;
  int local_24;
  
  puVar3 = PTR____stack_chk_guard_004d9044;
  uVar7 = (undefined4)((ulonglong)in_d0 >> 0x20);
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  iVar5 = *(int *)(param_1 + 0x68);
  if (*(int *)(iVar5 + 0xa4) == 0) {
    FUN_0030a1d8();
    FUN_0030a7e4();
    local_28 = 1;
    local_48 = (undefined **)0x0;
    uVar7 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
    FUN_0000a298(&local_48);
    local_28 = 0;
    local_48 = &PTR_LAB_0052bf38;
    local_44 = PTR_FUN_004d9058;
    FUN_0002bb34(uVar7,"act-change",0x3f800000,0x3f800000,&local_48,0);
    FUN_0000a298(&local_48);
    *(undefined1 *)(param_1 + 0x8c) = 0;
    iVar5 = *(int *)(param_1 + 0x68);
    uVar7 = extraout_s1;
  }
  if (*(int *)(iVar5 + 0xac) != 0) {
    uVar7 = FUN_0002ede8();
    FUN_000300e0(uVar7,*(undefined4 *)(*(int *)(param_1 + 0x68) + 0xac));
    iVar5 = *(int *)(param_1 + 0x68);
    uVar7 = extraout_s1_00;
  }
  puVar4 = PTR_DAT_004d9050;
  fVar2 = DAT_0005fd78;
  iVar8 = *(int *)(iVar5 + 0x88);
  iVar11 = *(int *)(iVar5 + 0x8c);
  if (iVar8 != iVar11) {
    lVar1 = (ulonglong)*(uint *)PTR_DAT_004d9050 * (ulonglong)*(uint *)(PTR_DAT_004d9050 + 8);
    uVar9 = (uint)lVar1;
    uVar6 = *(int *)(PTR_DAT_004d9050 + 4) * *(uint *)(PTR_DAT_004d9050 + 8) +
            *(uint *)PTR_DAT_004d9050 * *(int *)(PTR_DAT_004d9050 + 0xc) +
            (int)((ulonglong)lVar1 >> 0x20) +
            *(int *)(PTR_DAT_004d9050 + 0x14) +
            (uint)CARRY4(uVar9,*(uint *)(PTR_DAT_004d9050 + 0x10));
    uVar10 = (undefined4)((ulonglong)uVar6 * 0x7ffff >> 0x20);
    *(uint *)PTR_DAT_004d9050 = uVar9 + *(uint *)(PTR_DAT_004d9050 + 0x10);
    *(uint *)(puVar4 + 4) = uVar6;
    iVar11 = iVar11 - iVar8;
    uVar12 = FixedToFP(CONCAT44(uVar10,uVar10),0,1,0,0x20);
    uVar14 = FixedToFP(CONCAT44(iVar11,iVar11),0,0,0,0x20);
    uVar13 = FixedToFP(CONCAT44(iVar8,iVar8),0,0,0,0x20);
    uVar12 = FloatVectorMult(uVar14,CONCAT44(uVar7,(float)uVar12 / fVar2),2,0x20);
    uVar12 = FloatVectorAdd(uVar13,uVar12,2);
    uVar12 = FPToFixed(uVar12,0,0,3,0x20);
    iVar8 = (int)uVar12;
  }
  *(int *)(iVar5 + 0x7c) = iVar8;
  *(undefined4 *)(iVar5 + 0x80) = 0;
  *(undefined4 *)(iVar5 + 0x84) = 0;
  FUN_0006ee88();
  if (*(int *)puVar3 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0005f5e4 — 0006059c

- 函数名: FUN_0006059c
- 函数体: 139 字节
- 调用者数: 3 / 被调用者数: 8

```c

void FUN_0006059c(int param_1)

{
  undefined4 *puVar1;
  undefined4 uVar2;
  undefined4 *puVar3;
  undefined1 local_1c [4];
  
  puVar1 = DAT_005f94f0;
  if ((undefined4 **)DAT_005f94f0 != &DAT_005f94f0) {
    do {
      puVar3 = (undefined4 *)*puVar1;
      operator_delete(puVar1);
      puVar1 = puVar3;
    } while ((undefined4 **)puVar3 != &DAT_005f94f0);
  }
  DAT_005f94f0 = &DAT_005f94f0;
  DAT_005f94f4 = &DAT_005f94f0;
  FUN_00020698(0,0);
  uVar2 = FUN_0002ede8();
  FUN_000300e0(uVar2,*(undefined4 *)(param_1 + 0x1a4));
  FUN_0001cda4(*(undefined4 *)(param_1 + 0x48),0);
  local_1c[0] = 0;
  FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 4) + 0x260),local_1c);
  FUN_000686b8(*(undefined4 *)(param_1 + 0x90));
  FUN_000209b8(0xffffffff,0xbf800000,0xffffffff);
  return;
}


```

## FUN_0005f5e8 — 0006059c

- 函数名: FUN_0006059c
- 函数体: 139 字节
- 调用者数: 3 / 被调用者数: 8

```c

void FUN_0006059c(int param_1)

{
  undefined4 *puVar1;
  undefined4 uVar2;
  undefined4 *puVar3;
  undefined1 local_1c [4];
  
  puVar1 = DAT_005f94f0;
  if ((undefined4 **)DAT_005f94f0 != &DAT_005f94f0) {
    do {
      puVar3 = (undefined4 *)*puVar1;
      operator_delete(puVar1);
      puVar1 = puVar3;
    } while ((undefined4 **)puVar3 != &DAT_005f94f0);
  }
  DAT_005f94f0 = &DAT_005f94f0;
  DAT_005f94f4 = &DAT_005f94f0;
  FUN_00020698(0,0);
  uVar2 = FUN_0002ede8();
  FUN_000300e0(uVar2,*(undefined4 *)(param_1 + 0x1a4));
  FUN_0001cda4(*(undefined4 *)(param_1 + 0x48),0);
  local_1c[0] = 0;
  FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 4) + 0x260),local_1c);
  FUN_000686b8(*(undefined4 *)(param_1 + 0x90));
  FUN_000209b8(0xffffffff,0xbf800000,0xffffffff);
  return;
}


```

## FUN_0005f5ec — 0005f5ec

- 函数名: FUN_0005f5ec
- 函数体: 9 字节
- 调用者数: 0 / 被调用者数: 1

```c

void FUN_0005f5ec(void *param_1)

{
  operator_delete(param_1);
  return;
}


```

## FUN_0005f5fc — 0006059c

- 函数名: FUN_0006059c
- 函数体: 139 字节
- 调用者数: 3 / 被调用者数: 8

```c

void FUN_0006059c(int param_1)

{
  undefined4 *puVar1;
  undefined4 uVar2;
  undefined4 *puVar3;
  undefined1 local_1c [4];
  
  puVar1 = DAT_005f94f0;
  if ((undefined4 **)DAT_005f94f0 != &DAT_005f94f0) {
    do {
      puVar3 = (undefined4 *)*puVar1;
      operator_delete(puVar1);
      puVar1 = puVar3;
    } while ((undefined4 **)puVar3 != &DAT_005f94f0);
  }
  DAT_005f94f0 = &DAT_005f94f0;
  DAT_005f94f4 = &DAT_005f94f0;
  FUN_00020698(0,0);
  uVar2 = FUN_0002ede8();
  FUN_000300e0(uVar2,*(undefined4 *)(param_1 + 0x1a4));
  FUN_0001cda4(*(undefined4 *)(param_1 + 0x48),0);
  local_1c[0] = 0;
  FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 4) + 0x260),local_1c);
  FUN_000686b8(*(undefined4 *)(param_1 + 0x90));
  FUN_000209b8(0xffffffff,0xbf800000,0xffffffff);
  return;
}


```

## FUN_0005f7f8 — 000607f8

- 函数名: FUN_000607f8
- 函数体: 49 字节
- 调用者数: 1 / 被调用者数: 0

```c

int FUN_000607f8(int param_1)

{
  int *piVar1;
  uint uVar2;
  
  uVar2 = 0;
  do {
    if ((uint)(DAT_005f94a4 - (int)DAT_005f94a0 >> 2) <= uVar2) {
      return *DAT_005f94a0;
    }
    piVar1 = DAT_005f94a0 + uVar2;
    uVar2 = uVar2 + 1;
  } while (*(int *)(*piVar1 + 0x40) != param_1);
  return *piVar1;
}


```

## FUN_0005f81c — 0005f81c

- 函数名: FUN_0005f81c
- 函数体: 11 字节
- 调用者数: 0 / 被调用者数: 0

```c

void FUN_0005f81c(int *param_1)

{
  (**(code **)(*param_1 + 0x48))();
  return;
}


```

## FUN_0005f828 — 0005f828

- 函数名: FUN_0005f828
- 函数体: 11 字节
- 调用者数: 0 / 被调用者数: 0

```c

void FUN_0005f828(int *param_1)

{
  (**(code **)(*param_1 + 0x48))();
  return;
}


```

## FUN_0005f834 — 0006082c

- 函数名: FUN_0006082c
- 函数体: 75 字节
- 调用者数: 2 / 被调用者数: 1

```c

void FUN_0006082c(void)

{
  void *pvVar1;
  int iVar2;
  int iVar3;
  uint uVar4;
  
  DAT_005f94ac = 0;
  iVar2 = DAT_005f94a4;
  if (DAT_005f94a4 != DAT_005f94a0) {
    uVar4 = 0;
    iVar2 = DAT_005f94a0;
    iVar3 = DAT_005f94a4;
    do {
      pvVar1 = *(void **)(iVar2 + uVar4 * 4);
      if (pvVar1 != (void *)0x0) {
        operator_delete(pvVar1);
        *(undefined4 *)(DAT_005f94a0 + uVar4 * 4) = 0;
        iVar2 = DAT_005f94a0;
        iVar3 = DAT_005f94a4;
      }
      uVar4 = uVar4 + 1;
    } while (uVar4 < (uint)(iVar3 - iVar2 >> 2));
  }
  DAT_005f94a4 = iVar2;
  return;
}


```

## FUN_0005f838 — 0006082c

- 函数名: FUN_0006082c
- 函数体: 75 字节
- 调用者数: 2 / 被调用者数: 1

```c

void FUN_0006082c(void)

{
  void *pvVar1;
  int iVar2;
  int iVar3;
  uint uVar4;
  
  DAT_005f94ac = 0;
  iVar2 = DAT_005f94a4;
  if (DAT_005f94a4 != DAT_005f94a0) {
    uVar4 = 0;
    iVar2 = DAT_005f94a0;
    iVar3 = DAT_005f94a4;
    do {
      pvVar1 = *(void **)(iVar2 + uVar4 * 4);
      if (pvVar1 != (void *)0x0) {
        operator_delete(pvVar1);
        *(undefined4 *)(DAT_005f94a0 + uVar4 * 4) = 0;
        iVar2 = DAT_005f94a0;
        iVar3 = DAT_005f94a4;
      }
      uVar4 = uVar4 + 1;
    } while (uVar4 < (uint)(iVar3 - iVar2 >> 2));
  }
  DAT_005f94a4 = iVar2;
  return;
}


```

## FUN_0005f83c — 0006082c

- 函数名: FUN_0006082c
- 函数体: 75 字节
- 调用者数: 2 / 被调用者数: 1

```c

void FUN_0006082c(void)

{
  void *pvVar1;
  int iVar2;
  int iVar3;
  uint uVar4;
  
  DAT_005f94ac = 0;
  iVar2 = DAT_005f94a4;
  if (DAT_005f94a4 != DAT_005f94a0) {
    uVar4 = 0;
    iVar2 = DAT_005f94a0;
    iVar3 = DAT_005f94a4;
    do {
      pvVar1 = *(void **)(iVar2 + uVar4 * 4);
      if (pvVar1 != (void *)0x0) {
        operator_delete(pvVar1);
        *(undefined4 *)(DAT_005f94a0 + uVar4 * 4) = 0;
        iVar2 = DAT_005f94a0;
        iVar3 = DAT_005f94a4;
      }
      uVar4 = uVar4 + 1;
    } while (uVar4 < (uint)(iVar3 - iVar2 >> 2));
  }
  DAT_005f94a4 = iVar2;
  return;
}


```

## FUN_0005f854 — 0006082c

- 函数名: FUN_0006082c
- 函数体: 75 字节
- 调用者数: 2 / 被调用者数: 1

```c

void FUN_0006082c(void)

{
  void *pvVar1;
  int iVar2;
  int iVar3;
  uint uVar4;
  
  DAT_005f94ac = 0;
  iVar2 = DAT_005f94a4;
  if (DAT_005f94a4 != DAT_005f94a0) {
    uVar4 = 0;
    iVar2 = DAT_005f94a0;
    iVar3 = DAT_005f94a4;
    do {
      pvVar1 = *(void **)(iVar2 + uVar4 * 4);
      if (pvVar1 != (void *)0x0) {
        operator_delete(pvVar1);
        *(undefined4 *)(DAT_005f94a0 + uVar4 * 4) = 0;
        iVar2 = DAT_005f94a0;
        iVar3 = DAT_005f94a4;
      }
      uVar4 = uVar4 + 1;
    } while (uVar4 < (uint)(iVar3 - iVar2 >> 2));
  }
  DAT_005f94a4 = iVar2;
  return;
}


```

## FUN_0005f858 — 0006082c

- 函数名: FUN_0006082c
- 函数体: 75 字节
- 调用者数: 2 / 被调用者数: 1

```c

void FUN_0006082c(void)

{
  void *pvVar1;
  int iVar2;
  int iVar3;
  uint uVar4;
  
  DAT_005f94ac = 0;
  iVar2 = DAT_005f94a4;
  if (DAT_005f94a4 != DAT_005f94a0) {
    uVar4 = 0;
    iVar2 = DAT_005f94a0;
    iVar3 = DAT_005f94a4;
    do {
      pvVar1 = *(void **)(iVar2 + uVar4 * 4);
      if (pvVar1 != (void *)0x0) {
        operator_delete(pvVar1);
        *(undefined4 *)(DAT_005f94a0 + uVar4 * 4) = 0;
        iVar2 = DAT_005f94a0;
        iVar3 = DAT_005f94a4;
      }
      uVar4 = uVar4 + 1;
    } while (uVar4 < (uint)(iVar3 - iVar2 >> 2));
  }
  DAT_005f94a4 = iVar2;
  return;
}


```

## FUN_0005f85c — 0005f85c

- 函数名: FUN_0005f85c
- 函数体: 9 字节
- 调用者数: 0 / 被调用者数: 1

```c

void FUN_0005f85c(void *param_1)

{
  operator_delete(param_1);
  return;
}


```

## FUN_0005f868 — 0005f868

- 函数名: FUN_0005f868
- 函数体: 11 字节
- 调用者数: 0 / 被调用者数: 0

```c

void FUN_0005f868(int *param_1)

{
  (**(code **)(*param_1 + 0x48))();
  return;
}


```

## FUN_0005f874 — 0005f874

- 函数名: FUN_0005f874
- 函数体: 11 字节
- 调用者数: 0 / 被调用者数: 0

```c

void FUN_0005f874(int *param_1)

{
  (**(code **)(*param_1 + 0x48))();
  return;
}


```

## FUN_0005f880 — 00060878

- 函数名: FUN_00060878
- 函数体: 831 字节
- 调用者数: 1 / 被调用者数: 21

```c

void FUN_00060878(void)

{
  int *piVar1;
  int iVar2;
  undefined4 uVar3;
  void *pvVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int *piVar9;
  int iVar10;
  int iVar11;
  undefined4 uVar12;
  undefined4 uVar13;
  undefined4 uVar14;
  undefined4 local_5c;
  undefined4 local_58;
  undefined4 uStack_54;
  float local_50;
  int local_4c;
  undefined4 local_48;
  void *local_44;
  double local_40;
  int *local_38;
  undefined4 uStack_34;
  
  FUN_00060bb8();
  piVar1 = operator_new(0x48);
  FUN_0030cda0(piVar1,"xml/challengeConditions.xml");
  if (piVar1 != (int *)0x0) {
    iVar2 = FUN_0030ceac(piVar1,0);
    if (iVar2 == 1) {
      uVar3 = FUN_0030c328(piVar1,"challengeConditions");
      FUN_0005eb6c(&DAT_005f94b4,uVar3);
    }
    else {
      (**(code **)(*piVar1 + 4))(piVar1);
    }
  }
  piVar1 = operator_new(0x48);
  FUN_0030cd24();
  if (piVar1 != (int *)0x0) {
    iVar2 = FUN_0030cebc(piVar1,"xml/challengeMods.xml",0);
    if (iVar2 == 1) {
      uVar3 = FUN_0030c328(piVar1,"challengeMods");
      FUN_00063da4(&DAT_005f94e4,uVar3);
    }
    else {
      (**(code **)(*piVar1 + 4))(piVar1);
    }
  }
  piVar1 = operator_new(0x48);
  FUN_0030cda0(piVar1,"xml/ch1challengeList.xml");
  if (piVar1 != (int *)0x0) {
    iVar2 = FUN_0030ceac(piVar1,0);
    if (iVar2 == 1) {
      uVar3 = FUN_0030c328(piVar1,"partyChallenges");
      iVar2 = FUN_0030c328(uVar3,"defaults");
      if (iVar2 != 0) {
        FUN_0030c6c0(iVar2,"chanceSelect",&DAT_0052cb54);
        iVar2 = FUN_0030c718(iVar2,"chanceRegrowth",&local_40);
        if (iVar2 == 0) {
          DAT_0052cb58 = (float)local_40;
        }
      }
      iVar2 = FUN_0030c328(uVar3,"challengeTier");
      if (iVar2 != 0) {
        uVar13 = 0;
        uVar14 = *(undefined4 *)((undefined1  [16])0x0 + (undefined1  [16])0xc);
        iVar10 = 0;
        do {
          pvVar4 = operator_new(0xb4);
          FUN_0006ea28(pvVar4,iVar2,iVar10);
          local_44 = pvVar4;
          FUN_00063000(&DAT_005f94f8,&local_44);
          iVar5 = FUN_0030c328(iVar2,"challengeGroup");
          if (iVar5 != 0) {
            iVar11 = 0;
            do {
              piVar1 = operator_new(0x48);
              piVar1[4] = 0;
              piVar1[5] = 0;
              piVar1[6] = 0;
              FUN_0003994c(piVar1 + 7,4);
              *piVar1 = 0;
              iVar6 = FUN_0006f178(piVar1,iVar5,iVar11);
              pvVar4 = local_44;
              if (iVar6 == 1) {
                local_38 = piVar1;
                FUN_0006335c((int)local_44 + 0x6c,&local_38);
                uVar12 = DAT_0052cb54;
                local_48 = 0;
                uStack_54 = DAT_0052cb54;
                local_50 = DAT_0052cb58;
                local_5c = DAT_0052cb54;
                local_58 = uVar13;
                local_4c = uVar14;
                FUN_0030c6c0(iVar5,"chanceSelect",&local_5c);
                local_58 = local_5c;
                iVar6 = FUN_0030c718(iVar5,"chanceRegrowth",&local_38);
                if (iVar6 == 0) {
                  local_50 = (float)(double)CONCAT44(uStack_34,local_38);
                }
                iVar7 = *(int *)(PTR_DAT_004d9048 + 0x5c) + 0x140;
                piVar9 = (int *)(*(int *)(PTR_DAT_004d9048 + 0x5c) + 0x144);
                iVar6 = iVar7;
                while (iVar8 = *piVar9, iVar8 != 0) {
                  piVar9 = (int *)(iVar8 + 0xc);
                  if ((uint)piVar1[2] <= *(uint *)(iVar8 + 0x10)) {
                    piVar9 = (int *)(iVar8 + 8);
                    iVar6 = iVar8;
                  }
                }
                local_48 = 0;
                if (iVar6 != iVar7) {
                  local_48 = 0;
                  if ((uint)piVar1[2] < *(uint *)(iVar6 + 0x10)) {
                    iVar6 = iVar7;
                  }
                  if (iVar6 != iVar7) {
                    uVar12 = *(undefined4 *)(iVar6 + 0x14);
                    local_48 = *(undefined4 *)(iVar6 + 0x18);
                  }
                }
                uStack_54 = uVar12;
                if (0 < *piVar1) {
                  uStack_54 = 0;
                  local_50 = 0.0;
                }
                local_4c = iVar11;
                FUN_00039bc0((int)pvVar4 + 0x40,&local_58);
                iVar11 = iVar11 + 1;
              }
              else if (piVar1 != (int *)0x0) {
                FUN_00063308(piVar1);
                operator_delete(piVar1);
              }
              iVar5 = FUN_0030c3a0(iVar5,"challengeGroup");
            } while (iVar5 != 0);
          }
          iVar2 = FUN_0030c3a0(iVar2,"challengeTier");
          iVar10 = iVar10 + 1;
        } while (iVar2 != 0);
      }
      uVar3 = FUN_0030c328(uVar3,"specialChallenges");
      FUN_00060d04(&DAT_005f9504,uVar3);
    }
    else {
      (**(code **)(*piVar1 + 4))(piVar1);
    }
  }
  DAT_005f94b0 = 1;
  return;
}


```

## FUN_0005f884 — 00060878

- 函数名: FUN_00060878
- 函数体: 831 字节
- 调用者数: 1 / 被调用者数: 21

```c

void FUN_00060878(void)

{
  int *piVar1;
  int iVar2;
  undefined4 uVar3;
  void *pvVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int *piVar9;
  int iVar10;
  int iVar11;
  undefined4 uVar12;
  undefined4 uVar13;
  undefined4 uVar14;
  undefined4 local_5c;
  undefined4 local_58;
  undefined4 uStack_54;
  float local_50;
  int local_4c;
  undefined4 local_48;
  void *local_44;
  double local_40;
  int *local_38;
  undefined4 uStack_34;
  
  FUN_00060bb8();
  piVar1 = operator_new(0x48);
  FUN_0030cda0(piVar1,"xml/challengeConditions.xml");
  if (piVar1 != (int *)0x0) {
    iVar2 = FUN_0030ceac(piVar1,0);
    if (iVar2 == 1) {
      uVar3 = FUN_0030c328(piVar1,"challengeConditions");
      FUN_0005eb6c(&DAT_005f94b4,uVar3);
    }
    else {
      (**(code **)(*piVar1 + 4))(piVar1);
    }
  }
  piVar1 = operator_new(0x48);
  FUN_0030cd24();
  if (piVar1 != (int *)0x0) {
    iVar2 = FUN_0030cebc(piVar1,"xml/challengeMods.xml",0);
    if (iVar2 == 1) {
      uVar3 = FUN_0030c328(piVar1,"challengeMods");
      FUN_00063da4(&DAT_005f94e4,uVar3);
    }
    else {
      (**(code **)(*piVar1 + 4))(piVar1);
    }
  }
  piVar1 = operator_new(0x48);
  FUN_0030cda0(piVar1,"xml/ch1challengeList.xml");
  if (piVar1 != (int *)0x0) {
    iVar2 = FUN_0030ceac(piVar1,0);
    if (iVar2 == 1) {
      uVar3 = FUN_0030c328(piVar1,"partyChallenges");
      iVar2 = FUN_0030c328(uVar3,"defaults");
      if (iVar2 != 0) {
        FUN_0030c6c0(iVar2,"chanceSelect",&DAT_0052cb54);
        iVar2 = FUN_0030c718(iVar2,"chanceRegrowth",&local_40);
        if (iVar2 == 0) {
          DAT_0052cb58 = (float)local_40;
        }
      }
      iVar2 = FUN_0030c328(uVar3,"challengeTier");
      if (iVar2 != 0) {
        uVar13 = 0;
        uVar14 = *(undefined4 *)((undefined1  [16])0x0 + (undefined1  [16])0xc);
        iVar10 = 0;
        do {
          pvVar4 = operator_new(0xb4);
          FUN_0006ea28(pvVar4,iVar2,iVar10);
          local_44 = pvVar4;
          FUN_00063000(&DAT_005f94f8,&local_44);
          iVar5 = FUN_0030c328(iVar2,"challengeGroup");
          if (iVar5 != 0) {
            iVar11 = 0;
            do {
              piVar1 = operator_new(0x48);
              piVar1[4] = 0;
              piVar1[5] = 0;
              piVar1[6] = 0;
              FUN_0003994c(piVar1 + 7,4);
              *piVar1 = 0;
              iVar6 = FUN_0006f178(piVar1,iVar5,iVar11);
              pvVar4 = local_44;
              if (iVar6 == 1) {
                local_38 = piVar1;
                FUN_0006335c((int)local_44 + 0x6c,&local_38);
                uVar12 = DAT_0052cb54;
                local_48 = 0;
                uStack_54 = DAT_0052cb54;
                local_50 = DAT_0052cb58;
                local_5c = DAT_0052cb54;
                local_58 = uVar13;
                local_4c = uVar14;
                FUN_0030c6c0(iVar5,"chanceSelect",&local_5c);
                local_58 = local_5c;
                iVar6 = FUN_0030c718(iVar5,"chanceRegrowth",&local_38);
                if (iVar6 == 0) {
                  local_50 = (float)(double)CONCAT44(uStack_34,local_38);
                }
                iVar7 = *(int *)(PTR_DAT_004d9048 + 0x5c) + 0x140;
                piVar9 = (int *)(*(int *)(PTR_DAT_004d9048 + 0x5c) + 0x144);
                iVar6 = iVar7;
                while (iVar8 = *piVar9, iVar8 != 0) {
                  piVar9 = (int *)(iVar8 + 0xc);
                  if ((uint)piVar1[2] <= *(uint *)(iVar8 + 0x10)) {
                    piVar9 = (int *)(iVar8 + 8);
                    iVar6 = iVar8;
                  }
                }
                local_48 = 0;
                if (iVar6 != iVar7) {
                  local_48 = 0;
                  if ((uint)piVar1[2] < *(uint *)(iVar6 + 0x10)) {
                    iVar6 = iVar7;
                  }
                  if (iVar6 != iVar7) {
                    uVar12 = *(undefined4 *)(iVar6 + 0x14);
                    local_48 = *(undefined4 *)(iVar6 + 0x18);
                  }
                }
                uStack_54 = uVar12;
                if (0 < *piVar1) {
                  uStack_54 = 0;
                  local_50 = 0.0;
                }
                local_4c = iVar11;
                FUN_00039bc0((int)pvVar4 + 0x40,&local_58);
                iVar11 = iVar11 + 1;
              }
              else if (piVar1 != (int *)0x0) {
                FUN_00063308(piVar1);
                operator_delete(piVar1);
              }
              iVar5 = FUN_0030c3a0(iVar5,"challengeGroup");
            } while (iVar5 != 0);
          }
          iVar2 = FUN_0030c3a0(iVar2,"challengeTier");
          iVar10 = iVar10 + 1;
        } while (iVar2 != 0);
      }
      uVar3 = FUN_0030c328(uVar3,"specialChallenges");
      FUN_00060d04(&DAT_005f9504,uVar3);
    }
    else {
      (**(code **)(*piVar1 + 4))(piVar1);
    }
  }
  DAT_005f94b0 = 1;
  return;
}


```

## FUN_0005f888 — 00060878

- 函数名: FUN_00060878
- 函数体: 831 字节
- 调用者数: 1 / 被调用者数: 21

```c

void FUN_00060878(void)

{
  int *piVar1;
  int iVar2;
  undefined4 uVar3;
  void *pvVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int *piVar9;
  int iVar10;
  int iVar11;
  undefined4 uVar12;
  undefined4 uVar13;
  undefined4 uVar14;
  undefined4 local_5c;
  undefined4 local_58;
  undefined4 uStack_54;
  float local_50;
  int local_4c;
  undefined4 local_48;
  void *local_44;
  double local_40;
  int *local_38;
  undefined4 uStack_34;
  
  FUN_00060bb8();
  piVar1 = operator_new(0x48);
  FUN_0030cda0(piVar1,"xml/challengeConditions.xml");
  if (piVar1 != (int *)0x0) {
    iVar2 = FUN_0030ceac(piVar1,0);
    if (iVar2 == 1) {
      uVar3 = FUN_0030c328(piVar1,"challengeConditions");
      FUN_0005eb6c(&DAT_005f94b4,uVar3);
    }
    else {
      (**(code **)(*piVar1 + 4))(piVar1);
    }
  }
  piVar1 = operator_new(0x48);
  FUN_0030cd24();
  if (piVar1 != (int *)0x0) {
    iVar2 = FUN_0030cebc(piVar1,"xml/challengeMods.xml",0);
    if (iVar2 == 1) {
      uVar3 = FUN_0030c328(piVar1,"challengeMods");
      FUN_00063da4(&DAT_005f94e4,uVar3);
    }
    else {
      (**(code **)(*piVar1 + 4))(piVar1);
    }
  }
  piVar1 = operator_new(0x48);
  FUN_0030cda0(piVar1,"xml/ch1challengeList.xml");
  if (piVar1 != (int *)0x0) {
    iVar2 = FUN_0030ceac(piVar1,0);
    if (iVar2 == 1) {
      uVar3 = FUN_0030c328(piVar1,"partyChallenges");
      iVar2 = FUN_0030c328(uVar3,"defaults");
      if (iVar2 != 0) {
        FUN_0030c6c0(iVar2,"chanceSelect",&DAT_0052cb54);
        iVar2 = FUN_0030c718(iVar2,"chanceRegrowth",&local_40);
        if (iVar2 == 0) {
          DAT_0052cb58 = (float)local_40;
        }
      }
      iVar2 = FUN_0030c328(uVar3,"challengeTier");
      if (iVar2 != 0) {
        uVar13 = 0;
        uVar14 = *(undefined4 *)((undefined1  [16])0x0 + (undefined1  [16])0xc);
        iVar10 = 0;
        do {
          pvVar4 = operator_new(0xb4);
          FUN_0006ea28(pvVar4,iVar2,iVar10);
          local_44 = pvVar4;
          FUN_00063000(&DAT_005f94f8,&local_44);
          iVar5 = FUN_0030c328(iVar2,"challengeGroup");
          if (iVar5 != 0) {
            iVar11 = 0;
            do {
              piVar1 = operator_new(0x48);
              piVar1[4] = 0;
              piVar1[5] = 0;
              piVar1[6] = 0;
              FUN_0003994c(piVar1 + 7,4);
              *piVar1 = 0;
              iVar6 = FUN_0006f178(piVar1,iVar5,iVar11);
              pvVar4 = local_44;
              if (iVar6 == 1) {
                local_38 = piVar1;
                FUN_0006335c((int)local_44 + 0x6c,&local_38);
                uVar12 = DAT_0052cb54;
                local_48 = 0;
                uStack_54 = DAT_0052cb54;
                local_50 = DAT_0052cb58;
                local_5c = DAT_0052cb54;
                local_58 = uVar13;
                local_4c = uVar14;
                FUN_0030c6c0(iVar5,"chanceSelect",&local_5c);
                local_58 = local_5c;
                iVar6 = FUN_0030c718(iVar5,"chanceRegrowth",&local_38);
                if (iVar6 == 0) {
                  local_50 = (float)(double)CONCAT44(uStack_34,local_38);
                }
                iVar7 = *(int *)(PTR_DAT_004d9048 + 0x5c) + 0x140;
                piVar9 = (int *)(*(int *)(PTR_DAT_004d9048 + 0x5c) + 0x144);
                iVar6 = iVar7;
                while (iVar8 = *piVar9, iVar8 != 0) {
                  piVar9 = (int *)(iVar8 + 0xc);
                  if ((uint)piVar1[2] <= *(uint *)(iVar8 + 0x10)) {
                    piVar9 = (int *)(iVar8 + 8);
                    iVar6 = iVar8;
                  }
                }
                local_48 = 0;
                if (iVar6 != iVar7) {
                  local_48 = 0;
                  if ((uint)piVar1[2] < *(uint *)(iVar6 + 0x10)) {
                    iVar6 = iVar7;
                  }
                  if (iVar6 != iVar7) {
                    uVar12 = *(undefined4 *)(iVar6 + 0x14);
                    local_48 = *(undefined4 *)(iVar6 + 0x18);
                  }
                }
                uStack_54 = uVar12;
                if (0 < *piVar1) {
                  uStack_54 = 0;
                  local_50 = 0.0;
                }
                local_4c = iVar11;
                FUN_00039bc0((int)pvVar4 + 0x40,&local_58);
                iVar11 = iVar11 + 1;
              }
              else if (piVar1 != (int *)0x0) {
                FUN_00063308(piVar1);
                operator_delete(piVar1);
              }
              iVar5 = FUN_0030c3a0(iVar5,"challengeGroup");
            } while (iVar5 != 0);
          }
          iVar2 = FUN_0030c3a0(iVar2,"challengeTier");
          iVar10 = iVar10 + 1;
        } while (iVar2 != 0);
      }
      uVar3 = FUN_0030c328(uVar3,"specialChallenges");
      FUN_00060d04(&DAT_005f9504,uVar3);
    }
    else {
      (**(code **)(*piVar1 + 4))(piVar1);
    }
  }
  DAT_005f94b0 = 1;
  return;
}


```

## FUN_0005fd7c — 0005fd7c

- 函数名: FUN_0005fd7c
- 函数体: 551 字节
- 调用者数: 0 / 被调用者数: 23

```c

void FUN_0005fd7c(int *param_1,undefined4 param_2)

{
  undefined *puVar1;
  int iVar2;
  undefined4 uVar3;
  int iVar4;
  char *pcVar5;
  undefined8 uVar6;
  undefined4 extraout_s5;
  undefined1 auStack_44 [40];
  int local_1c;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_1c = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_00074418(param_1);
  if (((char)param_1[0x23] == '\0') &&
     (iVar2 = FUN_0002bec8(*(undefined4 *)(PTR_DAT_004d9048 + 0x1a4),"act-change"), iVar2 == 0)) {
    iVar2 = *(int *)(param_1[0x1a] + 0xa4);
    if (iVar2 == 2) {
      uVar3 = FUN_0007505c();
      pcVar5 = "Music-act3";
LAB_0005fe08:
      FUN_00075184(uVar3,pcVar5);
    }
    else {
      if (iVar2 == 1) {
        uVar3 = FUN_0007505c();
        pcVar5 = "Music-act2";
        goto LAB_0005fe08;
      }
      if (iVar2 == 0) {
        uVar3 = FUN_0007505c();
        pcVar5 = "Music-act1";
        goto LAB_0005fe08;
      }
    }
    *(undefined1 *)(param_1 + 0x23) = 1;
  }
  FUN_000686e8(param_1[0x24],param_1);
  switch(param_1[0x10]) {
  case 1:
    iVar2 = param_1[0x25];
    if (iVar2 != 0) {
      FUN_0030f7cc(auStack_44,"play");
      iVar2 = FUN_0039834c(iVar2,auStack_44,1);
      FUN_0030f7e0(auStack_44);
      if (iVar2 != 0) goto switchD_0005fe24_caseD_0;
    }
    param_1[0x25] = 0;
    FUN_0005ffa8(param_1);
  case 0:
switchD_0005fe24_caseD_0:
    *(undefined1 *)(param_1 + 0x6a) = 0;
    break;
  case 2:
    uVar6 = FloatVectorSub(CONCAT44(extraout_s5,param_1[0x11]),CONCAT44(param_2,param_2),2,0x20);
    param_1[0x11] = (int)uVar6;
    FUN_0005ec34(param_2,&DAT_005f94b4,param_2);
    FUN_00066410(param_1 + 2,param_2);
    FUN_00063e68(&DAT_005f94e4,param_2);
    FUN_0005ecf4(&DAT_005f94b4,param_1[0x1d]);
    if ((char)param_1[0x1f] == '\0') {
LAB_0005fef8:
      iVar2 = (**(code **)(*param_1 + 0x34))(param_1);
      if (((iVar2 == 1) && ((float)param_1[0x11] <= 0.0)) ||
         (iVar2 = FUN_0005edbc(&DAT_005f94b4), iVar2 != 0)) goto LAB_0005ff22;
    }
    else {
      iVar4 = param_1[0x1a];
      iVar2 = 0;
      if (iVar4 != 0) {
        iVar2 = *(int *)(iVar4 + 0x98);
      }
      if ((iVar4 != 0 && iVar2 != 0) ||
         (iVar2 = FUN_00052f80(), *(uint *)(iVar2 + 0x208) < *(uint *)(param_1[0x19] + 0xfc)))
      goto LAB_0005fef8;
      uVar3 = FUN_000065c4();
      iVar2 = FUN_00006a84(uVar3,1);
      if (iVar2 != 0) goto LAB_0005fef8;
LAB_0005ff22:
      FUN_00060108(param_1);
      *(undefined1 *)(param_1 + 0x1f) = 0;
    }
    iVar4 = param_1[0x1a];
    iVar2 = 0;
    if (iVar4 != 0) {
      iVar2 = *(int *)(iVar4 + 0x98);
    }
    if ((iVar4 != 0 && iVar2 != 0) && ((char)param_1[0x6a] == '\0')) {
      uVar3 = FUN_0030a1d8();
      FUN_0030a780(uVar3,"Music/Music-bonus-lp");
      *(undefined1 *)(param_1 + 0x6a) = 1;
    }
    break;
  case 3:
    if (*(int *)(param_1[0x24] + 0xac) == 7) {
      iVar2 = *(int *)(param_1[0x24] + 0xb0);
      if (iVar2 == 0) {
        FUN_00060514(param_1);
      }
      else {
        if (iVar2 == 5) {
          FUN_0006059c(param_1);
        }
        else if (iVar2 == 2) {
          FUN_0005ffa8(param_1);
          break;
        }
        param_1[0x10] = 5;
      }
    }
  }
  if (*(int *)puVar1 == local_1c) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

