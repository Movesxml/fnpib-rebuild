# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

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

## FUN_0000b4b8 — 0000b4b8

- 函数名: FUN_0000b4b8
- 函数体: 2165 字节
- 调用者数: 0 / 被调用者数: 23

```c

/* WARNING: Heritage AFTER dead removal. Example location: s1 : 0x0000bcbe */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void FUN_0000b4b8(undefined4 param_1,uint param_2,undefined4 param_3,int param_4)

{
  longlong lVar1;
  float fVar2;
  undefined *puVar3;
  undefined *puVar4;
  byte bVar5;
  undefined1 uVar6;
  int iVar7;
  undefined *puVar8;
  void *pvVar9;
  undefined4 uVar10;
  uint uVar11;
  undefined *puVar12;
  undefined4 uVar13;
  int iVar14;
  undefined4 *puVar15;
  uint uVar16;
  uint uVar17;
  undefined4 uVar18;
  int iVar19;
  undefined *puVar20;
  int iVar21;
  int iVar22;
  uint uVar23;
  uint uVar24;
  undefined8 uVar25;
  undefined8 in_d1;
  longlong lVar26;
  undefined8 uVar27;
  undefined8 uVar28;
  undefined8 uVar29;
  undefined4 local_7c;
  undefined4 local_78;
  undefined4 local_74;
  undefined4 local_70;
  undefined4 local_6c;
  undefined4 local_68;
  undefined4 local_64;
  undefined4 local_60;
  uint local_5c;
  undefined4 ***local_58;
  undefined4 ***local_54;
  undefined4 local_50;
  undefined4 local_4c;
  undefined4 ***local_48;
  undefined4 ***local_44;
  undefined4 local_40;
  undefined4 local_3c;
  undefined4 ***local_38;
  undefined4 ***local_34;
  undefined4 local_30;
  undefined4 local_2c;
  
  puVar3 = PTR_DAT_004d9048;
  uVar6 = 0;
  if (*(char *)(param_2 + 0x1b8) == '\0') {
    iVar7 = FUN_0001d10c(PTR_DAT_004d9048);
    uVar6 = 0;
    if (iVar7 != 0) {
      iVar7 = FUN_0001d10c(puVar3);
      uVar6 = 0;
      if ((*(int *)(iVar7 + 0x68) != 0) && (uVar6 = 0, *(int *)(*(int *)(iVar7 + 0x68) + 0x98) != 0)
         ) {
        uVar6 = 1;
      }
    }
  }
  *(undefined1 *)(param_2 + 0xb0) = uVar6;
  *(undefined1 *)(param_2 + 0x1bb) = 0;
  if (*(int **)(param_2 + 0xb4) != (int *)0x0) {
    (**(code **)(**(int **)(param_2 + 0xb4) + 4))();
    *(undefined4 *)(param_2 + 0xb4) = 0;
  }
  *(undefined1 *)(param_2 + 0xcc) = 0;
  *(undefined1 *)(param_2 + 0xc3) = 0;
  *(undefined4 *)(param_2 + 0x48) = 0;
  *(undefined4 *)(param_2 + 0xf4) = DAT_0052bfe0;
  *(undefined4 *)(param_2 + 0xf8) = DAT_0052bfe4;
  *(undefined4 *)(param_2 + 0xfc) = DAT_0052bfe8;
  *(undefined4 *)(param_2 + 0x110) = 0x3f800000;
  *(undefined4 *)(param_2 + 0x114) = 0;
  *(undefined4 *)(param_2 + 0x118) = 0;
  *(undefined1 *)(param_2 + 0xc0) = 1;
  *(undefined4 *)(param_2 + 0x1c0) = 0;
  *(undefined4 *)(param_2 + 0xd4) = 0x3f800000;
  *(undefined1 *)(param_2 + 0x1b9) = 0;
  local_30 = 0;
  local_2c = 0;
  local_38 = &local_38;
  local_34 = &local_38;
  FUN_0001560c(param_2 + 0x1c4,&local_38);
  *(undefined4 *)(param_2 + 0x1cc) = local_30;
  *(undefined4 *)(param_2 + 0x1d0) = local_2c;
  FUN_000152b8(&local_38);
  local_40 = 0;
  local_3c = 0;
  local_48 = &local_48;
  local_44 = &local_48;
  FUN_000154c0(param_2 + 0x1d4,&local_48);
  *(undefined4 *)(param_2 + 0x1dc) = local_40;
  *(undefined4 *)(param_2 + 0x1e0) = local_3c;
  FUN_00015290(&local_48);
  local_50 = 0;
  local_4c = 0;
  local_58 = &local_58;
  local_54 = &local_58;
  FUN_000154c0(param_2 + 0x1e4,&local_58);
  *(undefined4 *)(param_2 + 0x1ec) = local_50;
  *(undefined4 *)(param_2 + 0x1f0) = local_4c;
  FUN_00015290(&local_58);
  *(undefined4 *)(param_2 + 200) = 0;
  *(undefined4 *)(param_2 + 0xac) = 0;
  *(undefined4 *)(param_2 + 0x100) = 0;
  *(undefined1 *)(param_2 + 0xb1) = 0;
  *(undefined4 *)(param_2 + 0x9c) = *(undefined4 *)(param_2 + 0x1c);
  *(undefined4 *)(param_2 + 0xa0) = *(undefined4 *)(param_2 + 0x20);
  *(undefined4 *)(param_2 + 0xa4) = *(undefined4 *)(param_2 + 0x24);
  *(undefined2 *)(param_2 + 8) = 0;
  *(undefined1 *)(param_2 + 500) = 0;
  *(undefined4 *)(param_2 + 0xbc) = 0;
  puVar3 = PTR_DAT_004d9048;
  if ((param_4 < 0) || (DAT_005d4cd0 <= param_4)) {
    iVar7 = FUN_0001d10c(PTR_DAT_004d9048);
    if (iVar7 == 0) {
      uVar6 = FUN_0000af04(1);
      *(undefined1 *)(param_2 + 0x3c) = uVar6;
    }
    else {
      do {
        bVar5 = FUN_0000af04(1);
        *(byte *)(param_2 + 0x3c) = bVar5;
        FUN_0001d10c(puVar3);
        uVar11 = FUN_000617a8();
      } while (bVar5 == uVar11);
    }
  }
  else {
    *(char *)(param_2 + 0x3c) = (char)param_4;
  }
  if (((DAT_00556cd4 & 1) == 0) && (iVar7 = ___cxa_guard_acquire(&DAT_00556cd4), iVar7 != 0)) {
    DAT_00556cd0 = FUN_0000aae0("strawberry",0);
    ___cxa_guard_release(&DAT_00556cd4);
  }
  iVar7 = FUN_0001cd6c();
  uVar11 = (uint)*(byte *)(param_2 + 0x3c);
  if ((iVar7 == 1) && (uVar11 == DAT_00556cd0)) {
    uVar11 = uVar11 - 1;
    *(char *)(param_2 + 0x3c) = (char)uVar11;
  }
  if (*(int *)((uVar11 & 0xff) * 0x338 + DAT_005d4cdc + 0x32c) != 0) {
    DAT_005d4ce4 = DAT_005d4ce4 + 1;
    uVar11 = (uint)*(byte *)(param_2 + 0x3c);
  }
  FUN_0000bd54(param_2,uVar11 & 0xff,param_1);
  puVar4 = PTR_DAT_004d90a4;
  puVar3 = PTR_DAT_004d9048;
  if (*(char *)(param_2 + 0xc1) != '\0') {
    puVar8 = PTR_DAT_004d90a4 + 4;
    puVar15 = (undefined4 *)(PTR_DAT_004d90a4 + 8);
    puVar12 = puVar8;
    while (puVar20 = (undefined *)*puVar15, puVar20 != (undefined *)0x0) {
      puVar15 = (undefined4 *)(puVar20 + 0xc);
      if (param_2 <= *(uint *)(puVar20 + 0x10)) {
        puVar15 = (undefined4 *)(puVar20 + 8);
        puVar12 = puVar20;
      }
    }
    if (((puVar12 == puVar8) || (param_2 < *(uint *)(puVar12 + 0x10))) || (puVar12 == puVar8)) {
      iVar7 = FUN_0001cd2c();
      if ((puVar3[0x17] == '\0') || (iVar7 != 1)) {
        pvVar9 = operator_new(0x110);
        FUN_00079d18(pvVar9,param_2);
        FUN_0003e9e8(*(undefined4 *)(puVar3 + 0x4c),pvVar9,0);
        local_5c = param_2;
        puVar15 = (undefined4 *)FUN_00014770(puVar4,&local_5c);
        *puVar15 = pvVar9;
      }
      else {
        *(undefined4 *)(param_2 + 0x104) = 0;
      }
    }
  }
  *(uint *)(param_2 + 0xc) = *(uint *)(param_2 + 0xc) & 0xffffffed | 2;
  *(undefined1 *)(param_2 + 0x1bc) = 0;
  *(undefined1 *)(param_2 + 0xc4) = 0;
  *(undefined4 *)(param_2 + 0x104) = 0xbf800000;
  *(undefined4 *)(param_2 + 0xd0) = 0;
  *(undefined4 *)(param_2 + 0x84) = 0;
  *(undefined4 *)(param_2 + 0x78) = DAT_0052bfe0;
  *(undefined4 *)(param_2 + 0x7c) = DAT_0052bfe4;
  *(undefined4 *)(param_2 + 0x80) = DAT_0052bfe8;
  iVar7 = FUN_00052f80();
  lVar26 = (ulonglong)*(uint *)(iVar7 + 8) * (ulonglong)*(uint *)(iVar7 + 0x10);
  uVar16 = (uint)lVar26;
  uVar11 = *(int *)(iVar7 + 0xc) * *(uint *)(iVar7 + 0x10) +
           *(uint *)(iVar7 + 8) * *(int *)(iVar7 + 0x14) + (int)((ulonglong)lVar26 >> 0x20) +
           *(int *)(iVar7 + 0x1c) + (uint)CARRY4(*(uint *)(iVar7 + 0x18),uVar16);
  *(uint *)(iVar7 + 8) = *(uint *)(iVar7 + 0x18) + uVar16;
  *(uint *)(iVar7 + 0xc) = uVar11;
  iVar7 = FUN_00052f80();
  uVar16 = *(uint *)(iVar7 + 8);
  lVar26 = (ulonglong)uVar16 * (ulonglong)*(uint *)(iVar7 + 0x10);
  uVar17 = (uint)lVar26;
  *(uint *)(iVar7 + 8) = uVar17 + *(uint *)(iVar7 + 0x18);
  uVar23 = *(int *)(iVar7 + 0xc) * *(uint *)(iVar7 + 0x10) +
           uVar16 * *(int *)(iVar7 + 0x14) + (int)((ulonglong)lVar26 >> 0x20) +
           *(int *)(iVar7 + 0x1c) + (uint)CARRY4(uVar17,*(uint *)(iVar7 + 0x18));
  *(uint *)(iVar7 + 0xc) = uVar23;
  iVar7 = FUN_00052f80();
  lVar26 = (ulonglong)*(uint *)(iVar7 + 8) * (ulonglong)*(uint *)(iVar7 + 0x10);
  uVar16 = (uint)lVar26;
  uVar17 = *(int *)(iVar7 + 0xc) * *(uint *)(iVar7 + 0x10) +
           *(uint *)(iVar7 + 8) * *(int *)(iVar7 + 0x14) + (int)((ulonglong)lVar26 >> 0x20) +
           *(int *)(iVar7 + 0x1c) + (uint)CARRY4(uVar16,*(uint *)(iVar7 + 0x18));
  *(uint *)(iVar7 + 8) = uVar16 + *(uint *)(iVar7 + 0x18);
  *(uint *)(iVar7 + 0xc) = uVar17;
  local_6c = 0;
  local_68 = 0;
  local_64 = 0;
  local_60 = 0x3f800000;
  FUN_0000bef8(&local_6c,0);
  puVar3 = PTR_DAT_004d9050;
  fVar2 = DAT_0000b9e8;
  uVar13 = (undefined4)((ulonglong)uVar11 * 0x7ffff >> 0x20);
  uVar18 = (undefined4)((ulonglong)uVar23 * 0x7ffff >> 0x20);
  uVar10 = (undefined4)((ulonglong)uVar17 * 0x7ffff >> 0x20);
  uVar25 = FixedToFP(CONCAT44(uVar13,uVar13),0,1,0,0x20);
  uVar27 = FixedToFP(CONCAT44(uVar18,uVar18),0,1,0,0x20);
  uVar28 = FixedToFP(CONCAT44(uVar10,uVar10),0,1,0,0x20);
  uVar29 = FloatVectorMult(CONCAT44((int)((ulonglong)in_d1 >> 0x20),(float)uVar25 / DAT_0000b9e8),
                           0x4130000041300000,2,0x20);
  uVar27 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar27 >> 0x20),(float)uVar27 / DAT_0000b9e8),
                           0x4130000041300000,2,0x20);
  uVar25 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar25 >> 0x20),(float)uVar28 / DAT_0000b9e8),
                           0x4130000041300000,2,0x20);
  if (*(char *)((uint)*(byte *)(param_2 + 0x3c) * 0x338 + DAT_005d4cdc + 0x330) == '\0') {
    uVar25 = FloatVectorAdd(uVar25,0xc0b00000c0b00000,2);
    uVar28 = FloatVectorAdd(uVar29,0xc0b00000c0b00000,2);
    uVar10 = (undefined4)uVar28;
    lVar26 = FloatVectorAdd(uVar27,0xc0b00000c0b00000,2);
  }
  else {
    lVar26 = (ulonglong)*(uint *)PTR_DAT_004d9050 * (ulonglong)*(uint *)(PTR_DAT_004d9050 + 8);
    uVar16 = (uint)lVar26;
    uVar17 = *(int *)(PTR_DAT_004d9050 + 4) * *(uint *)(PTR_DAT_004d9050 + 8) +
             *(uint *)PTR_DAT_004d9050 * *(int *)(PTR_DAT_004d9050 + 0xc) +
             (int)((ulonglong)lVar26 >> 0x20) +
             *(int *)(PTR_DAT_004d9050 + 0x14) +
             (uint)CARRY4(uVar16,*(uint *)(PTR_DAT_004d9050 + 0x10));
    uVar10 = (undefined4)((ulonglong)uVar17 * 0x7ffff >> 0x20);
    *(uint *)PTR_DAT_004d9050 = uVar16 + *(uint *)(PTR_DAT_004d9050 + 0x10);
    *(uint *)(puVar3 + 4) = uVar17;
    uVar25 = FixedToFP(CONCAT44(uVar10,uVar10),0,1,0,0x20);
    uVar10 = (undefined4)((ulonglong)uVar25 >> 0x20);
    uVar25 = FloatVectorMult(CONCAT44(uVar10,(float)uVar25 / fVar2),0x41e0000041e00000,2,0x20);
    uVar25 = FloatVectorAdd(uVar25,0x4140000041400000,2);
    uVar25 = FloatVectorMult(uVar25,CONCAT44(uVar10,DAT_0000b9ec),2,0x20);
    uVar25 = FPToFixed(uVar25,0,0,3,0x20);
    FUN_000147c8(&local_6c,0,0x3f800000,0,(uint)uVar25 & 0xffff,uVar11);
    uVar11 = *(uint *)(puVar3 + 8);
    uVar24 = *(uint *)(puVar3 + 0x10);
    lVar26 = (ulonglong)*(uint *)puVar3 * (ulonglong)uVar11;
    uVar16 = (uint)lVar26;
    uVar17 = uVar16 + uVar24;
    lVar1 = (ulonglong)uVar11 * (ulonglong)uVar17;
    uVar23 = (uint)lVar1;
    uVar16 = *(int *)(puVar3 + 4) * uVar11 +
             *(uint *)puVar3 * *(int *)(puVar3 + 0xc) + (int)((ulonglong)lVar26 >> 0x20) +
             *(int *)(puVar3 + 0x14) + (uint)CARRY4(uVar16,uVar24);
    uVar10 = (undefined4)((ulonglong)uVar16 * 0x7ffff >> 0x20);
    uVar11 = *(int *)(puVar3 + 0x14) +
             *(int *)(puVar3 + 0xc) * uVar17 + uVar11 * uVar16 + (int)((ulonglong)lVar1 >> 0x20) +
             (uint)CARRY4(uVar23,uVar24);
    uVar13 = (undefined4)((ulonglong)uVar11 * 0x7ffff >> 0x20);
    *(uint *)puVar3 = uVar23 + uVar24;
    *(uint *)(puVar3 + 4) = uVar11;
    uVar25 = FixedToFP(CONCAT44(uVar10,uVar10),0,1,0,0x20);
    uVar25 = CONCAT44((int)((ulonglong)uVar25 >> 0x20),(float)uVar25 / fVar2);
    uVar27 = FixedToFP(CONCAT44(uVar13,uVar13),0,1,0,0x20);
    uVar25 = FloatVectorAdd(uVar25,uVar25,2);
    uVar25 = FloatVectorAdd(uVar25,0x4040000040400000,2);
    uVar11 = (uint)((ulonglong)uVar27 >> 0x20);
    if ((float)uVar27 / fVar2 <= 0.5) {
      uVar25 = FloatVectorNeg(uVar25,2,2);
      uVar10 = 0x41200000;
      lVar26 = (ulonglong)uVar11 << 0x20;
    }
    else {
      lVar26 = (ulonglong)uVar11 << 0x20;
      uVar10 = 0x41200000;
    }
  }
  iVar7 = 0x134;
  iVar14 = 0x10;
  iVar19 = 0;
  iVar21 = 0;
  do {
    iVar22 = param_2 + iVar21;
    iVar21 = iVar21 + 0x24;
    *(undefined4 *)(iVar22 + 0x16c) = DAT_0052c000;
    *(undefined4 *)(iVar22 + 0x170) = DAT_0052c004;
    *(undefined4 *)(iVar22 + 0x174) = DAT_0052c008;
    *(undefined4 *)(iVar22 + 0x178) = DAT_0052bf00;
    *(undefined4 *)(iVar22 + 0x17c) = DAT_0052bf04;
    *(undefined4 *)(iVar22 + 0x180) = DAT_0052bf08;
    *(undefined4 *)(iVar22 + 0x184) = DAT_0052ce60;
    *(undefined4 *)(iVar22 + 0x188) = DAT_0052ce64;
    *(undefined4 *)(iVar22 + 0x18c) = DAT_0052ce68;
    iVar22 = param_2 + iVar19;
    iVar19 = iVar19 + 0xc;
    *(undefined4 *)(iVar22 + 0x154) = uVar10;
    *(int *)(iVar22 + 0x158) = (int)lVar26;
    *(int *)(iVar22 + 0x15c) = (int)uVar25;
    *(undefined4 *)(param_2 + iVar7) = local_6c;
    iVar22 = param_2 + iVar7;
    iVar7 = iVar7 + 0x10;
    *(undefined4 *)(iVar22 + 4) = local_68;
    *(undefined4 *)(iVar22 + 8) = local_64;
    *(undefined4 *)(iVar22 + 0xc) = local_60;
    *(undefined4 *)(param_2 + iVar14 * 4) = 0;
    iVar14 = iVar14 + 1;
  } while (iVar21 != 0x48);
  if ((*(char *)(param_2 + 0xc1) != '\0') || (*(char *)(param_2 + 0xc2) != '\0')) {
    iVar7 = FUN_00052f80();
    uVar11 = *(uint *)(iVar7 + 8);
    lVar26 = (ulonglong)uVar11 * (ulonglong)*(uint *)(iVar7 + 0x10);
    uVar16 = (uint)lVar26;
    *(uint *)(iVar7 + 8) = uVar16 + *(uint *)(iVar7 + 0x18);
    *(uint *)(iVar7 + 0xc) =
         *(int *)(iVar7 + 0xc) * *(uint *)(iVar7 + 0x10) +
         uVar11 * *(int *)(iVar7 + 0x14) + (int)((ulonglong)lVar26 >> 0x20) +
         *(int *)(iVar7 + 0x1c) + (uint)CARRY4(uVar16,*(uint *)(iVar7 + 0x18));
    iVar7 = FUN_00052f80();
    uVar11 = *(uint *)(iVar7 + 8);
    lVar26 = (ulonglong)uVar11 * (ulonglong)*(uint *)(iVar7 + 0x10);
    uVar16 = (uint)lVar26;
    *(uint *)(iVar7 + 8) = uVar16 + *(uint *)(iVar7 + 0x18);
    *(uint *)(iVar7 + 0xc) =
         *(int *)(iVar7 + 0xc) * *(uint *)(iVar7 + 0x10) +
         uVar11 * *(int *)(iVar7 + 0x14) + (int)((ulonglong)lVar26 >> 0x20) +
         *(int *)(iVar7 + 0x1c) + (uint)CARRY4(uVar16,*(uint *)(iVar7 + 0x18));
    iVar7 = FUN_00052f80();
    uVar11 = *(uint *)(iVar7 + 8);
    lVar26 = (ulonglong)uVar11 * (ulonglong)*(uint *)(iVar7 + 0x10);
    uVar16 = (uint)lVar26;
    *(uint *)(iVar7 + 8) = uVar16 + *(uint *)(iVar7 + 0x18);
    *(uint *)(iVar7 + 0xc) =
         *(int *)(iVar7 + 0xc) * *(uint *)(iVar7 + 0x10) +
         uVar11 * *(int *)(iVar7 + 0x14) + (int)((ulonglong)lVar26 >> 0x20) +
         *(int *)(iVar7 + 0x1c) + (uint)CARRY4(uVar16,*(uint *)(iVar7 + 0x18));
    local_7c = 0;
    local_78 = 0;
    local_74 = 0;
    local_70 = 0x3f800000;
    FUN_000147c8(&local_7c,0x3f800000,0,0,0x3ffc);
    puVar3 = PTR_DAT_004d9050;
    uVar10 = 0x3f000000;
    uVar16 = *(uint *)(PTR_DAT_004d9050 + 8);
    uVar23 = *(uint *)(PTR_DAT_004d9050 + 0x10);
    lVar26 = (ulonglong)*(uint *)PTR_DAT_004d9050 * (ulonglong)uVar16;
    uVar17 = (uint)lVar26;
    uVar11 = uVar17 + uVar23;
    lVar1 = (ulonglong)uVar16 * (ulonglong)uVar11;
    uVar24 = (uint)lVar1;
    uVar17 = *(int *)(PTR_DAT_004d9050 + 4) * uVar16 +
             *(uint *)PTR_DAT_004d9050 * *(int *)(PTR_DAT_004d9050 + 0xc) +
             (int)((ulonglong)lVar26 >> 0x20) +
             *(int *)(PTR_DAT_004d9050 + 0x14) + (uint)CARRY4(uVar17,uVar23);
    uVar13 = (undefined4)((ulonglong)uVar17 * 0x7ffff >> 0x20);
    uVar11 = *(int *)(PTR_DAT_004d9050 + 0x14) +
             *(int *)(PTR_DAT_004d9050 + 0xc) * uVar11 +
             uVar16 * uVar17 + (int)((ulonglong)lVar1 >> 0x20) + (uint)CARRY4(uVar24,uVar23);
    uVar18 = (undefined4)((ulonglong)uVar11 * 0x7ffff >> 0x20);
    *(uint *)PTR_DAT_004d9050 = uVar24 + uVar23;
    *(uint *)(puVar3 + 4) = uVar11;
    uVar25 = FixedToFP(CONCAT44(uVar13,uVar13),0,1,0,0x20);
    iVar7 = 0x134;
    iVar14 = 0;
    iVar19 = 0;
    lVar26 = FixedToFP(CONCAT44(uVar18,uVar18),0,1,0,0x20);
    uVar25 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar25 >> 0x20),(float)uVar25 / fVar2),
                             0x4040000040400000,2,0x20);
    uVar25 = FloatVectorAdd(uVar25,0,2);
    uVar25 = FloatVectorNeg(uVar25,2,2);
    do {
      iVar21 = param_2 + iVar19;
      iVar19 = iVar19 + 0x24;
      *(undefined4 *)(iVar21 + 0x16c) = DAT_0052c000;
      *(undefined4 *)(iVar21 + 0x170) = DAT_0052c004;
      *(undefined4 *)(iVar21 + 0x174) = DAT_0052c008;
      *(undefined4 *)(iVar21 + 0x178) = DAT_0052bf00;
      *(undefined4 *)(iVar21 + 0x17c) = DAT_0052bf04;
      *(undefined4 *)(iVar21 + 0x180) = DAT_0052bf08;
      *(undefined4 *)(iVar21 + 0x184) = DAT_0052ce60;
      *(undefined4 *)(iVar21 + 0x188) = DAT_0052ce64;
      *(undefined4 *)(iVar21 + 0x18c) = DAT_0052ce68;
      iVar21 = param_2 + iVar14;
      iVar14 = iVar14 + 0xc;
      *(int *)(iVar21 + 0x15c) = (int)uVar25;
      *(undefined4 *)(iVar21 + 0x154) = 0;
      *(undefined4 *)(iVar21 + 0x158) = 0x40c00000;
      *(undefined4 *)(param_2 + iVar7) = local_7c;
      iVar21 = param_2 + iVar7;
      iVar7 = iVar7 + 0x10;
      *(undefined4 *)(iVar21 + 4) = local_78;
      *(undefined4 *)(iVar21 + 8) = local_74;
      *(undefined4 *)(iVar21 + 0xc) = local_70;
    } while (iVar19 != 0x48);
  }
  *(undefined4 *)(param_2 + 100) = 0;
  *(undefined4 *)(param_2 + 0x68) = 0x4b;
  puVar3 = PTR_DAT_004d9048;
  *(undefined4 *)(param_2 + 0x6c) = 4;
  *(undefined1 *)(param_2 + 0x3f) = 1;
  *(undefined4 *)(param_2 + 0x70) = 0;
  iVar7 = FUN_0001d10c((int)uVar25,(int)((ulonglong)uVar25 >> 0x20),(int)lVar26,
                       (int)((ulonglong)lVar26 >> 0x20),uVar10,puVar3);
  if (iVar7 != 0) {
    FUN_0001d10c(puVar3);
    puVar4 = PTR_DAT_004d907c;
    iVar7 = FUN_00064000(PTR_DAT_004d907c,3);
    if (iVar7 == 0) {
      FUN_0001d10c(puVar3);
      iVar7 = FUN_00063fe0(puVar4,*(undefined4 *)PTR_DAT_004d9068);
      if (iVar7 != 1) goto LAB_0000bd04;
    }
    *(undefined1 *)(param_2 + 0x3f) = 0;
  }
LAB_0000bd04:
  *(undefined4 *)(param_2 + 0x1b4) = 0;
  *(undefined1 *)(param_2 + 0x1b8) = 0;
  *(undefined1 *)(param_2 + 0x1ba) = 1;
  uVar10 = FUN_00021a34();
  *(undefined4 *)(param_2 + 0xd8) = uVar10;
  *(undefined4 *)(param_2 + 0xdc) = 0;
  *(undefined4 *)(param_2 + 0xe0) = 0xc1400000;
  *(undefined4 *)(param_2 + 0xe4) = 0;
  return;
}


```

