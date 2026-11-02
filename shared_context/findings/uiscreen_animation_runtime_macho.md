# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_003e4df8 — 003e4df8

- 函数名: FUN_003e4df8
- 函数体: 9 字节
- 调用者数: 5 / 被调用者数: 0

```c

bool FUN_003e4df8(int *param_1)

{
  return *param_1 != 0;
}


```

## FUN_003e4e04 — 003e4e04

- 函数名: FUN_003e4e04
- 函数体: 119 字节
- 调用者数: 1 / 被调用者数: 6

```c

void FUN_003e4e04(undefined4 *param_1,undefined4 param_2,int param_3)

{
  undefined4 uVar1;
  int *piVar2;
  int iVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  
  if (param_1[0x1f] == 0) {
    return;
  }
  *param_1 = 1;
  param_1[1] = 0;
  param_1[2] = 0;
  param_1[4] = param_1[3];
  param_1[0x1c] = param_2;
  uVar1 = FUN_0038f5bc(param_2);
  param_1[0x1d] = uVar1;
  param_1[0x1e] = param_2;
  piVar2 = (int *)FUN_003ecb20();
  if (((param_1[0x1f] != 0) && (param_3 == 0)) &&
     (iVar3 = (**(code **)(*piVar2 + 0x40))(piVar2), iVar3 == 1)) {
    uVar1 = (**(code **)(*piVar2 + 0x4c))(piVar2);
    FUN_003965bc(param_1[0x1f]);
    uVar4 = FUN_0030f8f0();
    uVar5 = FUN_0030f8f0(param_1 + 7);
    FUN_00394900(uVar1,uVar4,uVar5,param_1[2]);
  }
  FUN_003e4e88(param_1);
  return;
}


```

## FUN_003e4e7c — 003e4e7c

- 函数名: FUN_003e4e7c
- 函数体: 11 字节
- 调用者数: 1 / 被调用者数: 1

```c

void FUN_003e4e7c(undefined4 param_1,undefined4 param_2)

{
  FUN_003e4e04(param_1,param_2,0);
  return;
}


```

## FUN_003e4e88 — 003e4e88

- 函数名: FUN_003e4e88
- 函数体: 85 字节
- 调用者数: 4 / 被调用者数: 8

```c

void FUN_003e4e88(int param_1)

{
  FUN_003e5554(param_1,param_1 + 0x80);
  FUN_003e5750(param_1,param_1 + 0xa0);
  FUN_003e59b0(param_1,param_1 + 0xc0);
  FUN_003e5c20(param_1,param_1 + 0xe0);
  FUN_003e5e38(param_1,param_1 + 0x100);
  FUN_003e604c(param_1,param_1 + 0x120);
  FUN_003e62c0(param_1,param_1 + 0x140);
  FUN_003e64e8(param_1,param_1 + 0x160);
  return;
}


```

## FUN_003e4ee0 — 003e4ee0

- 函数名: FUN_003e4ee0
- 函数体: 113 字节
- 调用者数: 2 / 被调用者数: 6

```c

void FUN_003e4ee0(undefined4 *param_1)

{
  float fVar1;
  undefined4 uVar2;
  int *piVar3;
  int iVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  float fVar7;
  
  fVar1 = (float)FUN_0038f5bc(param_1[5]);
  fVar7 = 0.0;
  if (0.0 < fVar1) {
    fVar7 = fVar1;
  }
  param_1[1] = fVar7;
  uVar2 = FUN_0038f598(fVar7);
  param_1[2] = uVar2;
  *param_1 = 0;
  piVar3 = (int *)FUN_003ecb20();
  iVar4 = (**(code **)(*piVar3 + 0x40))(piVar3);
  if (iVar4 != 1) {
    return;
  }
  uVar2 = (**(code **)(*piVar3 + 0x4c))(piVar3);
  FUN_003965bc(param_1[0x1f]);
  uVar5 = FUN_0030f8f0();
  uVar6 = FUN_0030f8f0(param_1 + 7);
  FUN_00394994(uVar2,uVar5,uVar6);
  return;
}


```

## FUN_003e4f54 — 003e4f54

- 函数名: FUN_003e4f54
- 函数体: 11 字节
- 调用者数: 2 / 被调用者数: 1

```c

void FUN_003e4f54(int param_1)

{
  FUN_0038f5bc(*(undefined4 *)(param_1 + 0x14));
  return;
}


```

## FUN_003e4f60 — 003e4f60

- 函数名: FUN_003e4f60
- 函数体: 509 字节
- 调用者数: 1 / 被调用者数: 8

```c

void FUN_003e4f60(int *param_1,float param_2,int param_3)

{
  int iVar1;
  uint uVar2;
  uint uVar3;
  int *piVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  uint uVar8;
  int iVar9;
  uint uVar10;
  float fVar11;
  undefined8 in_d1;
  undefined8 uVar12;
  float fVar13;
  undefined8 unaff_d9;
  
  if ((*param_1 != 0) || (param_3 != 0)) {
    if (param_3 == 1) {
      *param_1 = 0;
    }
    if ((float)param_1[0x1d] != 0.0) {
      uVar12 = FloatVectorSub(CONCAT44((int)((ulonglong)in_d1 >> 0x20),param_1[0x1d]),
                              CONCAT44(param_2,param_2),2,0x20);
      fVar11 = 0.0;
      if (0.0 < (float)uVar12) {
        fVar11 = (float)uVar12;
      }
      param_1[0x1d] = (int)fVar11;
      iVar1 = FUN_0038f598(fVar11);
      param_1[0x1e] = iVar1;
      if ((float)param_1[0x1d] != 0.0) {
        return;
      }
    }
    if (param_3 == 0) {
      fVar13 = (float)param_1[1];
      uVar12 = FloatVectorAdd(CONCAT44((int)((ulonglong)unaff_d9 >> 0x20),fVar13),
                              CONCAT44(param_2,param_2),2);
      fVar11 = 0.0;
      if (0.0 < (float)uVar12) {
        fVar11 = (float)uVar12;
      }
      uVar2 = FUN_0038f598(fVar11);
      uVar8 = param_1[2];
      if (((fVar13 == 0.0) || (uVar8 < uVar2)) && (iVar1 = param_1[0x60], param_1[0x61] != iVar1)) {
        iVar9 = 0;
        uVar10 = 0;
        do {
          uVar3 = FUN_003eaeec(iVar1 + iVar9);
          if ((fVar13 == 0.0 && uVar3 == 0) || ((uVar8 < uVar3 && (uVar3 <= uVar2)))) {
            uVar5 = FUN_003ecb20();
            FUN_003f06a8(uVar5,param_1[0x60] + iVar9 + 4);
          }
          iVar1 = param_1[0x60];
          iVar9 = iVar9 + 0x18;
          uVar10 = uVar10 + 1;
        } while (uVar10 < (uint)((param_1[0x61] - iVar1 >> 3) * -0x55555555));
      }
    }
    else if (param_3 == 1) {
      fVar11 = 0.0;
      if (0.0 < param_2) {
        fVar11 = param_2;
      }
      uVar2 = FUN_0038f598(fVar11);
    }
    else {
      uVar2 = 0;
      fVar11 = 0.0;
    }
    param_1[1] = (int)fVar11;
    param_1[2] = uVar2;
    if ((uint)param_1[5] <= uVar2) {
      iVar1 = param_1[4];
      if (iVar1 == 0) {
        *param_1 = 0;
      }
      else if ((uint)param_1[5] < uVar2) {
        if (0 < iVar1) {
          param_1[4] = iVar1 + -1;
        }
        param_1[1] = DAT_00604c08;
        param_1[2] = DAT_00604c0c;
      }
    }
    if (((param_3 == 0) && (piVar4 = (int *)FUN_003ecb20(), param_1[0x1f] != 0)) &&
       ((iVar1 = (**(code **)(*piVar4 + 0x40))(piVar4), iVar1 == 1 &&
        (iVar1 = (**(code **)(*piVar4 + 0x38))(piVar4,param_1[0x1f]), iVar1 == 1)))) {
      iVar1 = *param_1;
      uVar5 = (**(code **)(*piVar4 + 0x4c))(piVar4);
      FUN_003965bc(param_1[0x1f]);
      uVar6 = FUN_0030f8f0();
      uVar7 = FUN_0030f8f0(param_1 + 7);
      if (iVar1 == 0) {
        FUN_00394994(uVar5,uVar6,uVar7);
      }
      else {
        FUN_00394a20(uVar5,uVar6,uVar7,param_1[2]);
      }
    }
  }
  return;
}


```

## FUN_003e51d4 — 003e51d4

- 函数名: FUN_003e51d4
- 函数体: 241 字节
- 调用者数: 1 / 被调用者数: 13

```c

void FUN_003e51d4(int param_1,undefined4 param_2,int *param_3)

{
  undefined *puVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  int iVar4;
  undefined1 auStack_78 [40];
  undefined1 auStack_50 [12];
  undefined1 auStack_44 [4];
  undefined *local_40;
  undefined4 local_3c;
  undefined4 local_38;
  undefined4 local_34;
  undefined4 local_30;
  int local_2c;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_2c = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_003eaee4(auStack_44);
  local_40 = &DAT_00534688;
  local_30 = 0;
  local_34 = 0;
  local_38 = 0;
  local_3c = 0;
  FUN_003eaef0(auStack_44,param_2);
  local_30 = *(undefined4 *)(param_1 + 0x7c);
  iVar4 = *param_3;
  if (iVar4 != param_3[1]) {
    do {
      FUN_0030f870(auStack_78,iVar4);
      FUN_0039ce0c(auStack_50,iVar4 + 0x28);
      FUN_0039f1e8(&local_3c,auStack_78);
      FUN_0003cac4(auStack_50);
      FUN_0030f7e0(auStack_78);
      iVar4 = iVar4 + 0x34;
    } while (iVar4 != param_3[1]);
  }
  FUN_003e67b8(param_1 + 0x180,auStack_44);
  uVar2 = FUN_0038f598(param_2);
  uVar3 = FUN_0038f53c(uVar2,*(undefined4 *)(param_1 + 0x14));
  *(undefined4 *)(param_1 + 0x14) = uVar3;
  uVar2 = FUN_0038f520(uVar2,*(undefined4 *)(param_1 + 0x18));
  *(undefined4 *)(param_1 + 0x18) = uVar2;
  local_40 = &DAT_00534688;
  FUN_00080780(&local_3c);
  if (*(int *)puVar1 != local_2c) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_003e52c8 — 003e52c8

- 函数名: FUN_003e52c8
- 函数体: 337 字节
- 调用者数: 1 / 被调用者数: 8

```c

void FUN_003e52c8(undefined4 param_1,int *param_2,undefined4 param_3)

{
  bool bVar1;
  undefined *puVar2;
  int iVar3;
  undefined4 uVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  undefined1 auStack_74 [40];
  undefined1 auStack_4c [40];
  int local_24;
  
  puVar2 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  iVar3 = param_2[1];
  for (iVar8 = *param_2; iVar8 != iVar3; iVar8 = iVar8 + 0x18) {
    FUN_0030f7cc(auStack_74,"EventKeyframe, time: ");
    uVar4 = FUN_003eaeec(iVar8);
    FUN_0030f870(auStack_4c,auStack_74);
    FUN_0030f998(auStack_4c,uVar4);
    FUN_003853ac(param_3,auStack_4c);
    FUN_0030f7e0(auStack_4c);
    FUN_0030f7e0(auStack_74);
    if (*(int *)(iVar8 + 8) == *(int *)(iVar8 + 0xc)) {
      FUN_00385370(param_3," No Commands\n");
    }
    else {
      FUN_00385370(param_3,&DAT_0047093c);
      iVar5 = *(int *)(iVar8 + 0xc);
      for (iVar6 = *(int *)(iVar8 + 8); iVar6 != iVar5; iVar6 = iVar6 + 0x34) {
        FUN_00385370(param_3,&DAT_0046c498);
        FUN_003853ac(param_3,iVar6);
        FUN_00385370(param_3,&DAT_00470a4e);
        bVar1 = false;
        iVar7 = *(int *)(iVar6 + 0x2c);
        for (iVar9 = *(int *)(iVar6 + 0x28); iVar9 != iVar7; iVar9 = iVar9 + 0x28) {
          if (bVar1) {
            FUN_00385370(param_3,", ");
          }
          FUN_003853ac(param_3,iVar9);
          bVar1 = true;
        }
        FUN_00385370(param_3,&DAT_00470a50);
      }
      FUN_00385370(param_3,&DAT_00470a53);
    }
  }
  if (*(int *)puVar2 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_003e541c — 003e541c

- 函数名: FUN_003e541c
- 函数体: 267 字节
- 调用者数: 1 / 被调用者数: 15

```c

void FUN_003e541c(undefined4 param_1,int param_2)

{
  undefined4 uVar1;
  int iVar2;
  undefined1 auStack_28 [12];
  
  FUN_00385308(auStack_28,0x400);
  uVar1 = FUN_00385370(auStack_28,"UIAnimation(");
  uVar1 = FUN_003853ac(uVar1,param_2 + 0x1c);
  FUN_00385370(uVar1,&DAT_00470a50);
  uVar1 = FUN_00385370(auStack_28,"TrackCount : ");
  FUN_003853e8(uVar1,*(int *)(param_2 + 0x110) +
                     *(int *)(param_2 + 0xf0) +
                     *(int *)(param_2 + 0xd0) + *(int *)(param_2 + 0x90) + *(int *)(param_2 + 0xb0)
                     + *(int *)(param_2 + 0x130) + *(int *)(param_2 + 0x150) +
                     *(int *)(param_2 + 0x170));
  iVar2 = param_2 + 0x80;
  FUN_003e6804(iVar2,auStack_28);
  FUN_003e69b0(iVar2,auStack_28);
  FUN_003e6b68(iVar2,auStack_28);
  FUN_003e6d20(iVar2,auStack_28);
  FUN_003e6ed0(iVar2,auStack_28);
  FUN_003e7080(iVar2,auStack_28);
  FUN_003e723c(iVar2,auStack_28);
  FUN_003e73ec(iVar2,auStack_28);
  uVar1 = FUN_00385370(auStack_28,"EventsCount: ");
  uVar1 = FUN_003853e8(uVar1,(*(int *)(param_2 + 0x184) - *(int *)(param_2 + 0x180) >> 3) *
                             -0x55555555);
  FUN_003e52c8(uVar1,param_2 + 0x180,auStack_28);
  FUN_00385360(param_1,auStack_28);
  FUN_00385344(auStack_28);
  return;
}


```

## FUN_003e5528 — 003e5528

- 函数名: FUN_003e5528
- 函数体: 43 字节
- 调用者数: 2 / 被调用者数: 1

```c

void FUN_003e5528(int param_1,float param_2)

{
  undefined4 uVar1;
  float fVar2;
  
  fVar2 = 0.0;
  if (0.0 < param_2) {
    fVar2 = param_2;
  }
  *(float *)(param_1 + 4) = fVar2;
  uVar1 = FUN_0038f598(fVar2);
  *(undefined4 *)(param_1 + 8) = uVar1;
  return;
}


```

## FUN_003e5554 — 003e5554

- 函数名: FUN_003e5554
- 函数体: 507 字节
- 调用者数: 1 / 被调用者数: 5

```c

void FUN_003e5554(int param_1,int param_2)

{
  int iVar1;
  uint *puVar2;
  bool bVar3;
  int *piVar4;
  undefined1 uVar5;
  int iVar6;
  int iVar7;
  int *piVar8;
  undefined4 uVar9;
  uint uVar10;
  int *piVar11;
  int *piVar12;
  int iVar13;
  int *piVar14;
  int *piVar15;
  int iVar16;
  uint uVar17;
  undefined8 in_d0;
  undefined4 extraout_s1;
  undefined8 uVar18;
  undefined4 extraout_s1_00;
  undefined8 uVar19;
  float fVar20;
  undefined8 uVar21;
  undefined1 local_38 [4];
  int local_34;
  
  uVar9 = (undefined4)((ulonglong)in_d0 >> 0x20);
  if (*(float *)(param_1 + 0x74) == 0.0) {
    fVar20 = *(float *)(param_1 + 4);
    piVar8 = *(int **)(param_2 + 8);
    uVar17 = *(uint *)(param_1 + 8);
    iVar6 = *(int *)(param_1 + 0x7c);
    iVar13 = *piVar8;
    while (iVar13 == 0) {
      piVar8 = piVar8 + 1;
      iVar13 = *piVar8;
    }
    uVar21 = FixedToFP(CONCAT44(uVar17,uVar17),0,1,0,0x20);
    while (iVar13 != *(int *)(*(int *)(param_2 + 8) + *(int *)(param_2 + 0xc) * 4)) {
      iVar16 = *(int *)(iVar13 + 0x28);
      if (*(int *)(iVar13 + 0x2c) != iVar16) {
        uVar10 = 0xffffffff;
        iVar7 = 0;
        piVar11 = (int *)(iVar16 + -0xc);
        piVar4 = (int *)0x0;
        piVar15 = (int *)0x0;
        do {
          piVar12 = piVar4;
          uVar10 = uVar10 + 1;
          bVar3 = true;
          piVar14 = piVar12;
          if ((uint)((*(int *)(iVar13 + 0x2c) - iVar16 >> 2) * -0x55555555) <= uVar10) break;
          piVar14 = piVar11 + 3;
          puVar2 = (uint *)(piVar11 + 3);
          iVar1 = iVar7 * 0xc;
          bVar3 = false;
          iVar7 = iVar7 + 1;
          piVar11 = piVar14;
          piVar4 = (int *)(iVar16 + iVar1);
          piVar15 = piVar12;
        } while (*puVar2 <= uVar17);
        iVar16 = *(int *)(iVar13 + 0x34);
        if (iVar16 == 0) {
          iVar16 = FUN_0007fe38(iVar6 + 0x60,iVar13,&local_34);
          uVar9 = 0;
          if (iVar16 == 1) {
            uVar9 = *(undefined4 *)(*(int *)(iVar6 + 0x9c) + local_34 * 4);
          }
          *(undefined4 *)(iVar13 + 0x34) = uVar9;
          uVar9 = FUN_002f69c4("enabled",7);
          uVar5 = FUN_0030fd6c(iVar13,"enabled",7,uVar9);
          *(undefined1 *)(iVar13 + 0x38) = uVar5;
          for (iVar16 = *(int *)(iVar13 + 0x34); *(int *)(iVar16 + 0x38) != 0;
              iVar16 = *(int *)(*(int *)(iVar16 + 0x38) + 4)) {
          }
          *(undefined1 *)(iVar13 + 0x39) = *(undefined1 *)(iVar16 + 0x48);
          uVar9 = extraout_s1;
        }
        else if (fVar20 == 0.0) {
          for (; *(int *)(iVar16 + 0x38) != 0; iVar16 = *(int *)(*(int *)(iVar16 + 0x38) + 4)) {
          }
          *(undefined1 *)(iVar13 + 0x39) = *(undefined1 *)(iVar16 + 0x48);
        }
        if ((piVar15 != (int *)0x0) || (*(char *)(iVar13 + 0x38) == '\0')) {
          if (bVar3) {
LAB_003e56be:
            local_38[0] = (undefined1)piVar14[2];
          }
          else if (piVar15 == (int *)0x0) {
            if (*(int *)(param_1 + 0x6c) == 0) goto LAB_003e56be;
            uVar18 = FixedToFP(CONCAT44(uVar9,*piVar14),0,1,0,0x20);
            FUN_003e86e8(*(undefined4 *)(iVar13 + 0x3c),(float)uVar21 / (float)uVar18);
            local_38[0] = *(undefined1 *)(iVar13 + 0x39);
          }
          else {
            iVar16 = *piVar14 - *piVar15;
            iVar7 = uVar17 - *piVar15;
            uVar18 = FixedToFP(CONCAT44(iVar16,iVar16),0,1,0,0x20);
            uVar19 = FixedToFP(CONCAT44(iVar7,iVar7),0,1,0,0x20);
            FUN_003e86e8(piVar15[1],(float)uVar19 / (float)uVar18);
            local_38[0] = (undefined1)piVar15[2];
          }
          FUN_0001da28(*(undefined4 *)(iVar13 + 0x34),local_38);
          uVar9 = extraout_s1_00;
        }
      }
      iVar13 = *(int *)(iVar13 + 0x40);
      while (iVar13 == 0) {
        piVar8 = piVar8 + 1;
        iVar13 = *piVar8;
      }
    }
  }
  return;
}


```

## FUN_003e5750 — 003e5750

- 函数名: FUN_003e5750
- 函数体: 605 字节
- 调用者数: 1 / 被调用者数: 10

```c

void FUN_003e5750(int param_1,int param_2)

{
  uint *puVar1;
  bool bVar2;
  int *piVar3;
  undefined1 uVar4;
  int iVar5;
  int *piVar6;
  undefined4 uVar7;
  int *piVar8;
  uint uVar9;
  int iVar10;
  int *piVar11;
  int *piVar12;
  undefined1 *puVar13;
  int *piVar14;
  int iVar15;
  int iVar16;
  uint uVar17;
  undefined4 extraout_s1;
  undefined8 uVar18;
  undefined8 uVar19;
  float fVar20;
  undefined8 uVar21;
  undefined1 auStack_b0 [40];
  undefined1 auStack_88 [40];
  undefined1 auStack_60 [40];
  int local_38;
  int local_34;
  
  local_34 = *(int *)PTR____stack_chk_guard_004d9044;
  if (*(float *)(param_1 + 0x74) == 0.0) {
    fVar20 = *(float *)(param_1 + 4);
    piVar6 = *(int **)(param_2 + 8);
    uVar17 = *(uint *)(param_1 + 8);
    iVar5 = *(int *)(param_1 + 0x7c);
    iVar15 = *piVar6;
    while (iVar15 == 0) {
      piVar6 = piVar6 + 1;
      iVar15 = *piVar6;
    }
    uVar21 = FixedToFP(CONCAT44(uVar17,uVar17),0,1,0,0x20);
    while (iVar15 != *(int *)(*(int *)(param_2 + 8) + *(int *)(param_2 + 0xc) * 4)) {
      iVar16 = *(int *)(iVar15 + 0x28);
      if (*(int *)(iVar15 + 0x2c) != iVar16) {
        uVar9 = 0xffffffff;
        piVar11 = (int *)(iVar16 + -0x30);
        piVar3 = (int *)0x0;
        iVar10 = 0;
        piVar8 = (int *)0x0;
        do {
          piVar14 = piVar3;
          uVar9 = uVar9 + 1;
          bVar2 = true;
          piVar12 = piVar14;
          if ((uint)((*(int *)(iVar15 + 0x2c) - iVar16 >> 4) * -0x55555555) <= uVar9) break;
          piVar12 = piVar11 + 0xc;
          puVar1 = (uint *)(piVar11 + 0xc);
          bVar2 = false;
          piVar11 = piVar12;
          piVar3 = (int *)(iVar16 + iVar10 * 0x30);
          iVar10 = iVar10 + 1;
          piVar8 = piVar14;
        } while (*puVar1 <= uVar17);
        iVar16 = *(int *)(iVar15 + 0x34);
        if (iVar16 == 0) {
          iVar16 = FUN_000632ac(iVar5 + 0xa0,iVar15,&local_38);
          uVar7 = 0;
          if (iVar16 == 1) {
            uVar7 = *(undefined4 *)(*(int *)(iVar5 + 0xdc) + local_38 * 4);
          }
          *(undefined4 *)(iVar15 + 0x34) = uVar7;
          uVar7 = FUN_002f69c4("enabled",7);
          uVar4 = FUN_0030fd6c(iVar15,"enabled",7,uVar7);
          *(undefined1 *)(iVar15 + 0x38) = uVar4;
          for (iVar16 = *(int *)(iVar15 + 0x34); *(int *)(iVar16 + 0x38) != 0;
              iVar16 = *(int *)(*(int *)(iVar16 + 0x38) + 4)) {
          }
          FUN_0030f884(iVar15 + 0x3c,iVar16 + 0x48);
        }
        else if (fVar20 == 0.0) {
          for (; *(int *)(iVar16 + 0x38) != 0; iVar16 = *(int *)(*(int *)(iVar16 + 0x38) + 4)) {
          }
          FUN_0030f884(iVar15 + 0x3c,iVar16 + 0x48);
        }
        if ((piVar8 != (int *)0x0) || (*(char *)(iVar15 + 0x38) == '\0')) {
          FUN_0030f7cc(auStack_60,0);
          if (bVar2) {
LAB_003e58e4:
            FUN_0030f884(auStack_60,piVar12 + 2);
          }
          else {
            if (piVar8 == (int *)0x0) {
              if (*(int *)(param_1 + 0x6c) == 0) goto LAB_003e58e4;
              uVar18 = FixedToFP(CONCAT44(extraout_s1,*piVar12),0,1,0,0x20);
              FUN_003e86e8(*(undefined4 *)(iVar15 + 100),(float)uVar21 / (float)uVar18);
              piVar8 = (int *)(iVar15 + 0x3c);
              puVar13 = auStack_88;
            }
            else {
              iVar10 = *piVar12 - *piVar8;
              iVar16 = uVar17 - *piVar8;
              uVar18 = FixedToFP(CONCAT44(iVar10,iVar10),0,1,0,0x20);
              uVar19 = FixedToFP(CONCAT44(iVar16,iVar16),0,1,0,0x20);
              FUN_003e86e8(piVar8[1],(float)uVar19 / (float)uVar18);
              piVar8 = piVar8 + 2;
              puVar13 = auStack_b0;
            }
            FUN_0030f870(puVar13,piVar8);
            FUN_0030f884(auStack_60,puVar13);
            FUN_0030f7e0(puVar13);
          }
          FUN_00022950(*(undefined4 *)(iVar15 + 0x34),auStack_60);
          FUN_0030f7e0(auStack_60);
        }
      }
      iVar15 = *(int *)(iVar15 + 0x68);
      while (iVar15 == 0) {
        piVar6 = piVar6 + 1;
        iVar15 = *piVar6;
      }
    }
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_34) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_003e59b0 — 003e59b0

- 函数名: FUN_003e59b0
- 函数体: 623 字节
- 调用者数: 1 / 被调用者数: 5

```c

void FUN_003e59b0(int param_1,int param_2)

{
  int iVar1;
  uint *puVar2;
  bool bVar3;
  int *piVar4;
  undefined1 uVar5;
  int iVar6;
  undefined4 uVar7;
  int *piVar8;
  undefined4 uVar9;
  uint uVar10;
  int iVar11;
  int *piVar12;
  int *piVar13;
  int iVar14;
  int *piVar15;
  int *piVar16;
  int iVar17;
  uint uVar18;
  undefined4 extraout_s0;
  undefined8 in_d0;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined8 uVar19;
  undefined4 extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  undefined8 uVar20;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  undefined8 uVar21;
  undefined4 extraout_s7;
  undefined4 extraout_s7_00;
  undefined4 extraout_s9;
  undefined4 extraout_s9_00;
  undefined4 uVar22;
  undefined4 extraout_s11;
  undefined4 extraout_s11_00;
  undefined4 uVar23;
  float fVar24;
  undefined8 uVar25;
  undefined8 uVar26;
  undefined8 uVar27;
  undefined8 uVar28;
  undefined8 uVar29;
  int local_40;
  int local_3c;
  int local_38;
  int local_34;
  
  uVar19 = CONCAT44((int)((ulonglong)in_d0 >> 0x20),*(float *)(param_1 + 0x74));
  if (*(float *)(param_1 + 0x74) == 0.0) {
    fVar24 = *(float *)(param_1 + 4);
    piVar8 = *(int **)(param_2 + 8);
    uVar18 = *(uint *)(param_1 + 8);
    iVar6 = *(int *)(param_1 + 0x7c);
    iVar14 = *piVar8;
    while (iVar14 == 0) {
      piVar8 = piVar8 + 1;
      iVar14 = *piVar8;
    }
    uVar25 = FixedToFP(CONCAT44(uVar18,uVar18),0,1,0,0x20);
    while (iVar14 != *(int *)(*(int *)(param_2 + 8) + *(int *)(param_2 + 0xc) * 4)) {
      iVar17 = *(int *)(iVar14 + 0x28);
      if (*(int *)(iVar14 + 0x2c) != iVar17) {
        uVar10 = 0xffffffff;
        iVar11 = 0;
        piVar12 = (int *)(iVar17 + -0x14);
        piVar4 = (int *)0x0;
        piVar15 = (int *)0x0;
        do {
          piVar13 = piVar4;
          uVar10 = uVar10 + 1;
          bVar3 = true;
          piVar16 = piVar13;
          if ((uint)((*(int *)(iVar14 + 0x2c) - iVar17 >> 2) * -0x33333333) <= uVar10) break;
          piVar16 = piVar12 + 5;
          puVar2 = (uint *)(piVar12 + 5);
          iVar1 = iVar11 * 0x14;
          bVar3 = false;
          iVar11 = iVar11 + 1;
          piVar12 = piVar16;
          piVar4 = (int *)(iVar17 + iVar1);
          piVar15 = piVar13;
        } while (*puVar2 <= uVar18);
        iVar17 = *(int *)(iVar14 + 0x34);
        if (iVar17 == 0) {
          iVar17 = FUN_0007fc10(iVar6 + 0xe0,iVar14,&local_34);
          uVar9 = 0;
          if (iVar17 == 1) {
            uVar9 = *(undefined4 *)(*(int *)(iVar6 + 0x11c) + local_34 * 4);
          }
          *(undefined4 *)(iVar14 + 0x34) = uVar9;
          uVar9 = FUN_002f69c4("enabled",7);
          uVar5 = FUN_0030fd6c(iVar14,"enabled",7,uVar9);
          uVar19 = CONCAT44(extraout_s1,extraout_s0);
          *(undefined1 *)(iVar14 + 0x38) = uVar5;
          for (iVar17 = *(int *)(iVar14 + 0x34); *(int *)(iVar17 + 0x38) != 0;
              iVar17 = *(int *)(*(int *)(iVar17 + 0x38) + 4)) {
          }
          *(undefined4 *)(iVar14 + 0x3c) = *(undefined4 *)(iVar17 + 0x48);
          *(undefined4 *)(iVar14 + 0x40) = *(undefined4 *)(iVar17 + 0x4c);
          *(undefined4 *)(iVar14 + 0x44) = *(undefined4 *)(iVar17 + 0x50);
        }
        else if (fVar24 == 0.0) {
          for (; *(int *)(iVar17 + 0x38) != 0; iVar17 = *(int *)(*(int *)(iVar17 + 0x38) + 4)) {
          }
          *(undefined4 *)(iVar14 + 0x3c) = *(undefined4 *)(iVar17 + 0x48);
          *(undefined4 *)(iVar14 + 0x40) = *(undefined4 *)(iVar17 + 0x4c);
          *(undefined4 *)(iVar14 + 0x44) = *(undefined4 *)(iVar17 + 0x50);
        }
        if ((piVar15 != (int *)0x0) || (*(char *)(iVar14 + 0x38) == '\0')) {
          if (bVar3) {
LAB_003e5b2e:
            local_40 = piVar16[2];
            local_3c = piVar16[3];
            local_38 = piVar16[4];
          }
          else {
            if (piVar15 == (int *)0x0) {
              if (*(int *)(param_1 + 0x6c) == 0) goto LAB_003e5b2e;
              uVar19 = FixedToFP(CONCAT44((int)((ulonglong)uVar19 >> 0x20),*piVar16),0,1,0,0x20);
              uVar7 = FUN_003e86e8(*(undefined4 *)(iVar14 + 0x48),(float)uVar25 / (float)uVar19);
              uVar20 = CONCAT44(extraout_s3_00,*(undefined4 *)(iVar14 + 0x3c));
              uVar19 = CONCAT44(extraout_s1_01,*(undefined4 *)(iVar14 + 0x40));
              uVar21 = CONCAT44(extraout_s5_00,*(undefined4 *)(iVar14 + 0x44));
              uVar9 = extraout_s7_00;
              uVar22 = extraout_s9_00;
              uVar23 = extraout_s11_00;
            }
            else {
              iVar11 = *piVar16 - *piVar15;
              iVar17 = uVar18 - *piVar15;
              uVar19 = FixedToFP(CONCAT44(iVar11,iVar11),0,1,0,0x20);
              uVar20 = FixedToFP(CONCAT44(iVar17,iVar17),0,1,0,0x20);
              uVar7 = FUN_003e86e8(piVar15[1],(float)uVar20 / (float)uVar19);
              uVar20 = CONCAT44(extraout_s3,piVar15[2]);
              uVar19 = CONCAT44(extraout_s1_00,piVar15[3]);
              uVar21 = CONCAT44(extraout_s5,piVar15[4]);
              uVar9 = extraout_s7;
              uVar22 = extraout_s9;
              uVar23 = extraout_s11;
            }
            uVar26 = CONCAT44(uVar7,uVar7);
            uVar28 = FloatVectorSub(CONCAT44(uVar22,piVar16[2]),uVar20,2,0x20);
            uVar27 = FloatVectorSub(CONCAT44(uVar9,piVar16[3]),uVar19,2,0x20);
            uVar29 = FloatVectorSub(CONCAT44(uVar23,piVar16[4]),uVar21,2,0x20);
            uVar28 = FloatVectorMult(uVar26,uVar28,2,0x20);
            uVar29 = FloatVectorMult(uVar26,uVar29,2,0x20);
            uVar26 = FloatVectorMult(uVar26,uVar27,2,0x20);
            uVar20 = FloatVectorAdd(uVar20,uVar28,2);
            uVar21 = FloatVectorAdd(uVar21,uVar29,2);
            uVar19 = FloatVectorAdd(uVar19,uVar26,2);
            local_40 = (int)uVar20;
            local_3c = (int)uVar19;
            local_38 = (int)uVar21;
          }
          uVar9 = FUN_0000606c((int)uVar19,*(undefined4 *)(iVar14 + 0x34),&local_40);
          uVar19 = CONCAT44(extraout_s1_02,uVar9);
        }
      }
      iVar14 = *(int *)(iVar14 + 0x4c);
      while (iVar14 == 0) {
        piVar8 = piVar8 + 1;
        iVar14 = *piVar8;
      }
    }
  }
  return;
}


```

