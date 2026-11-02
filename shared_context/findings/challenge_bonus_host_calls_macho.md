# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_00027588 — 00027588

- 函数名: FUN_00027588
- 函数体: 279 字节
- 调用者数: 41 / 被调用者数: 8

```c

void FUN_00027588(int param_1,char *param_2,uint param_3,int param_4,int param_5,int param_6)

{
  undefined *puVar1;
  undefined *puVar2;
  int iVar3;
  undefined4 uVar4;
  void *pvVar5;
  int iVar6;
  int *piVar7;
  int iVar8;
  char acStack_70 [64];
  uint local_30;
  int local_2c;
  uint local_28;
  int local_24;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  if (param_5 != 0) {
    param_1 = param_1 + 0x18;
  }
  iVar3 = param_1 + 4;
  piVar7 = (int *)(param_1 + 8);
  iVar6 = iVar3;
  while (iVar8 = *piVar7, iVar8 != 0) {
    piVar7 = (int *)(iVar8 + 0xc);
    if (param_3 <= *(uint *)(iVar8 + 0x10)) {
      piVar7 = (int *)(iVar8 + 8);
      iVar6 = iVar8;
    }
  }
  local_28 = param_3;
  if (iVar6 != iVar3) {
    if (param_3 < *(uint *)(iVar6 + 0x10)) {
      iVar6 = iVar3;
    }
    if (iVar6 != iVar3) {
      *(int *)(iVar6 + 0x58) = *(int *)(iVar6 + 0x58) + param_4;
      if (param_6 == 1) {
        uVar4 = FUN_0000342c();
        FUN_00003f2c(uVar4,*(undefined4 *)(iVar6 + 0x58),local_28);
      }
      puVar2 = PTR_DAT_004d9048;
      iVar3 = FUN_0001d10c(PTR_DAT_004d9048);
      if (iVar3 != 0) {
        FUN_0001d10c(puVar2);
        FUN_0005ee10(PTR_DAT_004d9024);
      }
      iVar6 = *(int *)(iVar6 + 0x58);
      goto LAB_0002768a;
    }
  }
  local_30 = param_3;
  _strcpy(acStack_70,param_2);
  local_2c = param_4;
  pvVar5 = (void *)FUN_0002b124(param_1,&local_28);
  _memcpy(pvVar5,acStack_70,0x48);
  if (param_6 == 1) {
    uVar4 = FUN_0000342c();
    FUN_00003f2c(uVar4,local_2c,local_28);
  }
  puVar2 = PTR_DAT_004d9048;
  iVar3 = FUN_0001d10c(PTR_DAT_004d9048);
  iVar6 = local_2c;
  if (iVar3 != 0) {
    FUN_0001d10c(puVar2);
    FUN_0005ee10(PTR_DAT_004d9024);
    iVar6 = local_2c;
  }
LAB_0002768a:
  if (*(int *)puVar1 == local_24) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail(iVar6);
}


```

## FUN_00020698 — 00020698

- 函数名: FUN_00020698
- 函数体: 595 字节
- 调用者数: 7 / 被调用者数: 12

```c

void FUN_00020698(int param_1,int param_2)

{
  float fVar1;
  undefined *puVar2;
  undefined4 uVar3;
  int *piVar4;
  int iVar5;
  float fVar6;
  undefined8 uVar7;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined8 uVar8;
  undefined4 extraout_s3;
  undefined8 uVar9;
  undefined4 extraout_s5;
  undefined4 extraout_s7;
  undefined4 extraout_s9;
  undefined4 extraout_s11;
  undefined8 uVar10;
  undefined4 local_50;
  undefined4 local_4c;
  float local_48;
  undefined4 local_44;
  
  iVar5 = 0;
  do {
    FUN_00018d2c((&DAT_0055781c)[iVar5]);
    iVar5 = iVar5 + 1;
  } while (iVar5 != 0x10);
  iVar5 = FUN_0001cd2c();
  local_44 = 0;
  uVar3 = FUN_000065c4();
  piVar4 = (int *)FUN_00006ad0(uVar3,2,&local_44);
  if (piVar4 != (int *)0x0) {
    do {
      if ((param_2 != 0 || iVar5 != 0) || ((float)piVar4[0x30] <= 0.0)) {
        uVar3 = FUN_000251a8();
        uVar7 = FloatVectorMult(CONCAT44(uVar3,uVar3),0xbfc00000bfc00000,2,0x20);
        piVar4[5] = (int)uVar7;
        piVar4[8] = -0x40400000;
        FUN_00008a50((int)uVar7,piVar4,0);
        (**(code **)(*piVar4 + 0x10))(piVar4,0);
      }
      uVar3 = FUN_000065c4();
      piVar4 = (int *)FUN_00006af0(uVar3,2,&local_44);
    } while (piVar4 != (int *)0x0);
  }
  uVar3 = FUN_000065c4();
  FUN_00006ad0(uVar3,0,&local_44);
  uVar3 = FUN_000065c4();
  piVar4 = (int *)FUN_00006ad0(uVar3,1,&local_44);
  puVar2 = PTR_DAT_004d9048;
  fVar1 = DAT_000208ec;
  if (piVar4 != (int *)0x0) {
    do {
      if (((char)piVar4[0x6e] == '\0') &&
         ((param_2 != 0 || iVar5 != 0 || ((float)piVar4[0x34] <= 0.0)))) {
        FUN_0000f274(piVar4,0);
        if ((puVar2[0x18] == '\0') && (param_1 != 1)) {
          if ((char)piVar4[0x6f] == '\0') {
            uVar9 = FloatVectorSub(CONCAT44(extraout_s7,DAT_00557804),
                                   CONCAT44(extraout_s5,piVar4[4]),2,0x20);
            uVar8 = FloatVectorSub(CONCAT44(extraout_s9,DAT_00557808),
                                   CONCAT44(extraout_s3,piVar4[5]),2,0x20);
            uVar7 = FloatVectorSub(CONCAT44(extraout_s11,DAT_0055780c),
                                   CONCAT44(extraout_s1_00,piVar4[6]),2,0x20);
            uVar10 = FloatVectorMult(uVar9,uVar9,2,0x20);
            local_50 = (undefined4)uVar9;
            uVar9 = FloatVectorMult(uVar8,uVar8,2,0x20);
            local_4c = (undefined4)uVar8;
            uVar8 = FloatVectorMult(uVar7,uVar7,2,0x20);
            local_48 = (float)uVar7;
            uVar7 = FloatVectorAdd(uVar10,uVar9,2);
            uVar7 = FloatVectorAdd(uVar8,uVar7,2);
            fVar6 = (float)uVar7;
            if (fVar1 < fVar6) {
              FUN_00009b50();
              uVar7 = FloatVectorMult(CONCAT44(extraout_s1,local_50),0x41a0000041a00000,2,0x20);
              local_50 = (undefined4)uVar7;
              uVar7 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar7 >> 0x20),local_4c),
                                      0x41a0000041a00000,2,0x20);
              local_4c = (undefined4)uVar7;
              uVar7 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar7 >> 0x20),local_48),
                                      0x41a0000041a00000,2,0x20);
              fVar6 = (float)uVar7;
              local_48 = fVar6;
            }
            (**(code **)(*piVar4 + 0x24))(fVar6,piVar4,0,0,0,&local_50);
            FUN_0000e6a4(piVar4);
          }
        }
        else {
          *(undefined1 *)(piVar4 + 0x6f) = 1;
        }
        uVar3 = FUN_000251a8();
        uVar7 = FloatVectorMult(CONCAT44(uVar3,uVar3),0xbfc00000bfc00000,2,0x20);
        piVar4[5] = (int)uVar7;
        piVar4[8] = -0x40400000;
        uVar3 = FUN_000251a8((int)uVar7);
        uVar7 = FloatVectorMult(CONCAT44(uVar3,uVar3),0xbfc00000bfc00000,2,0x20);
        piVar4[0x48] = (int)uVar7;
        piVar4[0x4b] = -0x40400000;
        (**(code **)(*piVar4 + 0x10))((int)uVar7,piVar4,0);
      }
      uVar3 = FUN_000065c4();
      piVar4 = (int *)FUN_00006af0(uVar3,1,&local_44);
    } while (piVar4 != (int *)0x0);
  }
  iVar5 = FUN_0001cd70();
  if (iVar5 == 1) {
    FUN_0001bd80();
  }
  return;
}


```

## FUN_0006059c — 0006059c

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

## FUN_0006d53c — 0006d53c

- 函数名: FUN_0006d53c
- 函数体: 137 字节
- 调用者数: 1 / 被调用者数: 5

```c

void FUN_0006d53c(int param_1,undefined4 *param_2)

{
  undefined *puVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  int *piVar5;
  code *pcVar6;
  undefined1 auStack_4c [40];
  undefined1 local_24 [4];
  int local_20;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_20 = *(int *)PTR____stack_chk_guard_004d9044;
  local_24[0] = 1;
  FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 4) + 0x260),local_24);
  uVar2 = param_2[1];
  uVar3 = param_2[2];
  uVar4 = param_2[3];
  *(undefined4 *)(param_1 + 0xc) = *param_2;
  *(undefined4 *)(param_1 + 0x10) = uVar2;
  *(undefined4 *)(param_1 + 0x14) = uVar3;
  *(undefined4 *)(param_1 + 0x18) = uVar4;
  FUN_0006d5c8(param_1);
  piVar5 = *(int **)(param_1 + 4);
  pcVar6 = *(code **)(*piVar5 + 0x40);
  FUN_0030f7cc(auStack_4c,"animate_in");
  (*pcVar6)(piVar5,auStack_4c,1);
  FUN_0030f7e0(auStack_4c);
  *(undefined4 *)(param_1 + 0x1c) = 0;
  *(undefined4 *)(param_1 + 0x20) = 0;
  if (*(int *)puVar1 != local_20) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0006d5c8 — 0006d5c8

- 函数名: FUN_0006d5c8
- 函数体: 577 字节
- 调用者数: 2 / 被调用者数: 10

```c

void FUN_0006d5c8(int param_1)

{
  undefined *puVar1;
  int iVar2;
  int iVar3;
  int *piVar4;
  undefined4 uVar5;
  undefined1 auStack_1a4 [40];
  undefined1 local_17c [4];
  undefined1 auStack_178 [40];
  undefined1 auStack_150 [40];
  undefined1 auStack_128 [40];
  undefined1 auStack_100 [40];
  undefined1 auStack_d8 [40];
  undefined1 auStack_b0 [40];
  undefined1 local_88 [4];
  undefined1 auStack_84 [32];
  undefined1 auStack_64 [64];
  int local_24;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0x30) = 0;
  uVar5 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_b0,"scoreContainer");
  iVar2 = FUN_0039725c(uVar5,auStack_b0);
  FUN_0030f7e0(auStack_b0);
  local_88[0] = 1;
  FUN_0001da28(*(undefined4 *)(iVar2 + 0x260),local_88);
  uVar5 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_d8,"@finaleScore");
  iVar2 = FUN_0039725c(uVar5,auStack_d8);
  FUN_0030f7e0(auStack_d8);
  if (iVar2 != 0) {
    FUN_002f702c(auStack_64,0x40,"%i",*(undefined4 *)(param_1 + 0x10));
    FUN_0030f7cc(auStack_100,auStack_64);
    FUN_00022950(*(undefined4 *)(iVar2 + 0x7dc),auStack_100);
    FUN_0030f7e0(auStack_100);
  }
  *(int *)(param_1 + 0x24) = iVar2;
  iVar2 = 1;
  do {
    FUN_002f702c(auStack_84,0x20,"%s%i","@lifeScore",iVar2);
    uVar5 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_128,auStack_84);
    iVar3 = FUN_0039725c(uVar5,auStack_128);
    FUN_0030f7e0(auStack_128);
    if (iVar3 != 0) {
      if (iVar2 + -1 < *(int *)(param_1 + 0x14)) {
        local_88[0] = 1;
        FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),local_88);
        *(int *)(param_1 + 0x28) = iVar3;
      }
      else {
        local_88[0] = 0;
        FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),local_88);
      }
    }
    FUN_002f702c(auStack_84,0x20,"%s%i","@cross",iVar2);
    uVar5 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_150,auStack_84);
    iVar3 = FUN_0039725c(uVar5,auStack_150);
    FUN_0030f7e0(auStack_150);
    if (iVar3 != 0) {
      local_88[0] = iVar2 + -1 < *(int *)(param_1 + 0x14);
      FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),local_88);
    }
    iVar2 = iVar2 + 1;
  } while (iVar2 != 4);
  uVar5 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_178,"@scoreCounterTotal");
  piVar4 = (int *)FUN_0039725c(uVar5,auStack_178);
  FUN_0030f7e0(auStack_178);
  if (piVar4 != (int *)0x0) {
    (**(code **)(*piVar4 + 0xbc))
              (piVar4,(*(int *)(param_1 + 0xc) - *(int *)(param_1 + 0x10)) -
                      *(int *)(param_1 + 0x14) * *(int *)(param_1 + 0x18));
    FUN_0007daa8(piVar4);
    FUN_0007d9e8(piVar4);
    if (*(int *)(param_1 + 0x10) == 0) {
      local_17c[0] = 0;
      FUN_0030f7cc(auStack_1a4,"animate_trigger");
      FUN_0007d958(piVar4,0,auStack_1a4,local_17c);
      FUN_0030f7e0(auStack_1a4);
    }
  }
  puVar1 = PTR____stack_chk_guard_004d9044;
  *(int **)(param_1 + 0x2c) = piVar4;
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_000686e8 — 000686e8

- 函数名: FUN_000686e8
- 函数体: 89 字节
- 调用者数: 1 / 被调用者数: 1

(反编译超时或失败)

