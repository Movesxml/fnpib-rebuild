# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_00024284 — 00024284

- 函数名: FUN_00024284
- 函数体: 495 字节
- 调用者数: 1 / 被调用者数: 17

```c

void FUN_00024284(void)

{
  undefined *puVar1;
  void *pvVar2;
  undefined4 uVar3;
  int iVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 *puVar7;
  undefined4 uVar8;
  
  puVar1 = PTR_DAT_004d9048;
  _memset(PTR_DAT_004d9048 + 0x1cc,0,0x400);
  *(undefined4 *)(puVar1 + 0x10) = 0;
  puVar1[0x57] = 0;
  pvVar2 = operator_new(0x78c);
  FUN_0002b968();
  *(void **)(puVar1 + 0x1a4) = pvVar2;
  pvVar2 = operator_new(0x170);
  FUN_000721fc();
  *(void **)(puVar1 + 0x1a8) = pvVar2;
  *(undefined4 *)(puVar1 + 4) = 0;
  puVar1[0x1b1] = 0;
  pvVar2 = operator_new(0x314);
  FUN_00027c60();
  *(void **)(puVar1 + 0x5c) = pvVar2;
  FUN_0002914c(pvVar2);
  *(undefined4 *)(puVar1 + 0x10) = *(undefined4 *)(*(int *)(puVar1 + 0x5c) + 0x5c);
  FUN_0002504c();
  uVar5 = *(undefined4 *)(puVar1 + 0x5c);
  uVar3 = FUN_002f69c4("soundOff",8);
  iVar4 = FUN_00027508(uVar5,uVar3);
  puVar1[0x54] = iVar4 == 0;
  uVar5 = *(undefined4 *)(puVar1 + 0x5c);
  uVar3 = FUN_002f69c4("musicOff",8);
  iVar4 = FUN_00027508(uVar5,uVar3);
  puVar1[0x55] = iVar4 == 0;
  uVar5 = *(undefined4 *)(puVar1 + 0x5c);
  uVar3 = FUN_002f69c4("voOff",5);
  iVar4 = FUN_00027508(uVar5,uVar3);
  puVar1[0x56] = iVar4 == 0;
  uVar6 = *(undefined4 *)(puVar1 + 0x5c);
  uVar3 = FUN_002f69c4("soundOff",8);
  uVar8 = *(undefined4 *)(puVar1 + 0x5c);
  uVar5 = FUN_002f69c4("soundOff",8);
  iVar4 = FUN_00027508(uVar8,uVar5);
  FUN_00027588(uVar6,"soundOff",uVar3,-iVar4,0,1);
  uVar6 = *(undefined4 *)(puVar1 + 0x5c);
  uVar3 = FUN_002f69c4("musicOff",8);
  uVar8 = *(undefined4 *)(puVar1 + 0x5c);
  uVar5 = FUN_002f69c4("musicOff",8);
  iVar4 = FUN_00027508(uVar8,uVar5);
  FUN_00027588(uVar6,"musicOff",uVar3,-iVar4,0,1);
  uVar8 = *(undefined4 *)(puVar1 + 0x5c);
  uVar3 = FUN_002f69c4("voOff",5);
  uVar6 = *(undefined4 *)(puVar1 + 0x5c);
  uVar5 = FUN_002f69c4("voOff",5);
  iVar4 = FUN_00027508(uVar6,uVar5);
  FUN_00027588(uVar8,"voOff",uVar3,-iVar4,0,1);
  FUN_00015758();
  FUN_0000342c();
  FUN_000035e8();
  FUN_0002c450();
  FUN_0002c8f0();
  puVar7 = &DAT_00024474;
  if (puVar1[0xb] == '\x13') {
    puVar7 = &DAT_00024478;
  }
  uVar3 = FUN_0031fa44();
  FUN_0031ff48(uVar3,0x3f800000,*puVar7,2,0);
  return;
}


```

## FUN_00020c38 — 00020c38

- 函数名: FUN_00020c38
- 函数体: 339 字节
- 调用者数: 1 / 被调用者数: 9

```c

void FUN_00020c38(undefined4 *param_1)

{
  undefined *puVar1;
  undefined *puVar2;
  int iVar3;
  undefined4 uVar4;
  undefined **local_5c;
  undefined *local_58;
  undefined4 local_54 [8];
  undefined1 local_34;
  undefined4 local_30;
  undefined4 local_2c;
  undefined4 local_28;
  int local_24;
  
  puVar2 = PTR_DAT_004d9048;
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  if (PTR_DAT_004d9048[0x17] == '\0') {
    if (((DAT_005577f4 & 1) == 0) && (iVar3 = ___cxa_guard_acquire(&DAT_005577f4), iVar3 != 0)) {
      DAT_005577f0 = FUN_002f69c4("bomb",4);
      ___cxa_guard_release(&DAT_005577f4);
    }
    FUN_00027588(*(undefined4 *)(puVar2 + 0x5c),"bomb",DAT_005577f0,1,1,1);
    *(undefined4 *)(puVar2 + 0x24) = 0x404ccccd;
    local_30 = *param_1;
    local_2c = param_1[1];
    local_28 = param_1[2];
    FUN_0000577c(local_30,*(undefined4 *)(puVar2 + 0x58),&local_30,0x3fcccccd,0x40000000,0x41100000)
    ;
    DAT_00557804 = *param_1;
    DAT_00557808 = param_1[1];
    DAT_0055780c = param_1[2];
    uVar4 = *(undefined4 *)(puVar2 + 0x1a4);
    DAT_005577b0 = 0;
    local_5c = &PTR_LAB_0052bf38;
    local_58 = PTR_FUN_004d9058;
    local_34 = 1;
    local_54[0] = 0;
    FUN_0000a23c(&local_5c,local_54);
    FUN_0002bb34(uVar4,"Bomb-explode",0x3f800000,0x3f800000,local_54,0);
    FUN_0000a298(local_54);
  }
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_000088d4 — 000088d4

- 函数名: FUN_000088d4
- 函数体: 373 字节
- 调用者数: 0 / 被调用者数: 3

```c

undefined4 FUN_000088d4(int param_1,int param_2)

{
  longlong lVar1;
  longlong lVar2;
  float fVar3;
  undefined *puVar4;
  undefined *puVar5;
  uint uVar6;
  int *piVar7;
  uint uVar8;
  uint uVar9;
  uint uVar10;
  undefined4 uVar11;
  uint uVar12;
  undefined8 in_d0;
  undefined8 uVar13;
  undefined8 uVar14;
  undefined8 uVar15;
  undefined4 local_38;
  undefined4 local_34;
  undefined4 local_30;
  undefined4 local_2c;
  undefined4 local_28;
  undefined4 local_24;
  
  puVar5 = PTR_DAT_004d9050;
  puVar4 = PTR_DAT_004d9048;
  fVar3 = DAT_00008a4c;
  if ((*(char *)(param_1 + 0x8c) == '\0') && (*(char *)(param_1 + 0xc4) == '\0')) {
    if (*(char *)(param_1 + 0x98) == '\0') {
      if (param_2 != 0) {
        if (*(int *)(PTR_DAT_004d9048 + 0x10) == 1) {
          *(undefined1 *)(param_1 + 0x98) = 1;
          FUN_00020d8c(param_1 + 0x10);
          local_2c = *(undefined4 *)(param_1 + 0x10);
          local_28 = *(undefined4 *)(param_1 + 0x14);
          local_24 = *(undefined4 *)(param_1 + 0x18);
          FUN_0000577c(local_2c,*(undefined4 *)(puVar4 + 0x58),&local_2c,0x40000000,0x40400000,
                       0x41100000);
        }
        else {
          if (PTR_DAT_004d9048[0x17] != '\0') {
            return 0;
          }
          FUN_00020c38(param_1 + 0x10);
        }
        piVar7 = *(int **)puVar4;
        if (piVar7 != (int *)0x0) {
          local_38 = *(undefined4 *)(param_1 + 0x10);
          local_34 = *(undefined4 *)(param_1 + 0x14);
          local_30 = *(undefined4 *)(param_1 + 0x18);
          (**(code **)(*piVar7 + 0x4c))(local_38,piVar7,&local_38);
        }
      }
    }
    else {
      *(undefined1 *)(param_1 + 0x8c) = 1;
      uVar8 = *(uint *)(puVar5 + 8);
      uVar9 = *(uint *)(puVar5 + 0x10);
      lVar1 = (ulonglong)*(uint *)puVar5 * (ulonglong)uVar8;
      uVar10 = (uint)lVar1;
      uVar6 = uVar10 + uVar9;
      lVar2 = (ulonglong)uVar8 * (ulonglong)uVar6;
      uVar12 = (uint)lVar2;
      uVar10 = *(int *)(puVar5 + 4) * uVar8 +
               *(uint *)puVar5 * *(int *)(puVar5 + 0xc) + (int)((ulonglong)lVar1 >> 0x20) +
               *(int *)(puVar5 + 0x14) + (uint)CARRY4(uVar10,uVar9);
      uVar11 = (undefined4)((ulonglong)uVar10 * 0x7ffff >> 0x20);
      uVar13 = FixedToFP(CONCAT44(uVar11,uVar11),0,1,0,0x20);
      uVar6 = *(int *)(puVar5 + 0xc) * uVar6 + uVar8 * uVar10 + (int)((ulonglong)lVar2 >> 0x20) +
              *(int *)(puVar5 + 0x14) + (uint)CARRY4(uVar12,uVar9);
      uVar11 = (undefined4)((ulonglong)uVar6 * 0x7ffff >> 0x20);
      *(uint *)puVar5 = uVar12 + uVar9;
      *(uint *)(puVar5 + 4) = uVar6;
      uVar15 = FixedToFP(CONCAT44(uVar11,uVar11),0,1,0,0x20);
      *(undefined4 *)(param_1 + 0x24) = 0;
      uVar13 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar13 >> 0x20),(float)uVar13 / fVar3),
                               0x4120000041200000,2,0x20);
      uVar14 = FloatVectorAdd(uVar13,0xc0a00000c0a00000,2);
      uVar13 = FloatVectorMult(CONCAT44((int)((ulonglong)in_d0 >> 0x20),(float)uVar15 / fVar3),
                               0x40a0000040a00000,2,0x20);
      *(int *)(param_1 + 0x1c) = (int)uVar14;
      *(int *)(param_1 + 0x20) = (int)uVar13;
      *(undefined1 *)(param_1 + 0x90) = 1;
      piVar7 = (int *)(param_1 + 0x40);
      if (*(char *)(param_1 + 0x60) != '\0') {
        piVar7 = (int *)*piVar7;
      }
      if (piVar7 != (int *)0x0) {
        (**(code **)(*piVar7 + 0xc))();
      }
    }
    *(undefined1 *)(param_1 + 0x7e) = 1;
  }
  return 0;
}


```

