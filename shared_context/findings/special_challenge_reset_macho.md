# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_00062cb4 — 00062cb4

- 函数名: FUN_00062cb4
- 函数体: 801 字节
- 调用者数: 0 / 被调用者数: 4

```c

void FUN_00062cb4(void)

{
  undefined *puVar1;
  
  puVar1 = PTR___mh_execute_header_004d9040;
  DAT_005a8068 = 0x3f800000;
  *(int *)PTR_DAT_004d901c = *(int *)PTR_DAT_004d901c + 1;
  DAT_005a806c = 0x3f800000;
  DAT_005a8070 = 0x3f800000;
  DAT_005a8074 = 0x3f800000;
  DAT_005a8078 = 0x3f800000;
  DAT_005a807c = 0xbf800000;
  DAT_005a8080 = 0x3f800000;
  DAT_005a8084 = 0xbf800000;
  DAT_005a8088 = 0x3f800000;
  DAT_005a808c = 0x3f800000;
  DAT_005a8090 = 0xbf800000;
  DAT_005a8094 = 0xbf800000;
  DAT_005a8098 = 0xbf800000;
  DAT_005a809c = 0x3f800000;
  DAT_005a80a0 = 0x3f800000;
  DAT_005a80a4 = 0xbf800000;
  DAT_005a80a8 = 0x3f800000;
  DAT_005a80ac = 0xbf800000;
  DAT_005a80b0 = 0xbf800000;
  DAT_005a80b4 = 0xbf800000;
  DAT_005a80b8 = 0x3f800000;
  DAT_005a80bc = 0xbf800000;
  DAT_005a80c0 = 0xbf800000;
  DAT_005a80c4 = 0xbf800000;
  ___cxa_atexit(&FUN_00062cb0_1,0,puVar1);
  DAT_005a8063 = 0xff;
  DAT_005a8062 = 0;
  DAT_005a8061 = 0;
  DAT_005a8060 = 0;
  FUN_002f69c4("PASSED",6);
  DAT_005a8064 = FUN_002f69c4("true",4);
  DAT_005f94a0 = 0;
  DAT_005f94a4 = 0;
  DAT_005f94a8 = 0;
  ___cxa_atexit(&FUN_00062fd8_1,&DAT_005f94a0,puVar1);
  FUN_0005ea94(&DAT_005f94b4);
  ___cxa_atexit(PTR_FUN_004d9190,&DAT_005f94b4,puVar1);
  FUN_00063cd0(&DAT_005f94e4);
  ___cxa_atexit(PTR_FUN_004d9188,&DAT_005f94e4,puVar1);
  DAT_005f94f8 = 0;
  DAT_005f94fc = 0;
  DAT_005f9500 = 0;
  ___cxa_atexit(&FUN_00062fec_1,&DAT_005f94f8,puVar1);
  DAT_005f9504 = 0;
  DAT_005f9508 = 0;
  DAT_005f950c = 0;
  if ((DAT_0052be60 & 1) == 0) {
    DAT_0052be20 = 0x3f800000;
    DAT_0052be30 = 0;
    DAT_0052be2c = 0;
    DAT_0052be28 = 0;
    DAT_0052be24 = 0;
    DAT_0052be34 = 0x3f800000;
    DAT_0052be44 = 0;
    DAT_0052be40 = 0;
    DAT_0052be3c = 0;
    DAT_0052be38 = 0;
    DAT_0052be48 = 0x3f800000;
    DAT_0052be58 = 0;
    DAT_0052be54 = 0;
    DAT_0052be50 = 0;
    DAT_0052be4c = 0;
    DAT_0052be5c = 0x3f800000;
    DAT_0052be60 = 1;
  }
  if ((DAT_0052bff0 & 1) == 0) {
    DAT_0052bf90 = Mortar::__INIT_TYPE_ID()::currID + 1;
    DAT_0052bff0 = 1;
    Mortar::__INIT_TYPE_ID()::currID = DAT_0052bf90;
  }
  if ((DAT_0052be70 & 1) == 0) {
    DAT_0052c6e0 = Mortar::__INIT_TYPE_ID()::currID + 1;
    DAT_0052be70 = 1;
    Mortar::__INIT_TYPE_ID()::currID = DAT_0052c6e0;
  }
  if ((DAT_0052be80 & 1) == 0) {
    DAT_0052bf80 = 0x3f800000;
    DAT_0052bf84 = 0x3f800000;
    DAT_0052bf88 = 0x3f800000;
    DAT_0052be80 = 1;
  }
  if ((DAT_0052be90 & 1) == 0) {
    DAT_0052bfe0 = 0;
    DAT_0052bfe4 = 0;
    DAT_0052bfe8 = 0;
    DAT_0052be90 = 1;
  }
  if ((DAT_0052bea0 & 1) == 0) {
    DAT_0052c000 = 0x3f800000;
    DAT_0052c004 = 0;
    DAT_0052c008 = 0;
    DAT_0052bea0 = 1;
  }
  if ((DAT_00531fe0 & 1) == 0) {
    DAT_0052c010 = 0;
    DAT_0052c014 = 0;
    DAT_00531fe0 = 1;
  }
  if ((DAT_0052bec0 & 1) == 0) {
    DAT_0052beb0 = 0;
    DAT_0052beb4 = 0;
    DAT_0052beb8 = 0;
    DAT_0052bebc = 0;
    DAT_0052bec0 = 1;
  }
  if ((DAT_0052c350 & 1) == 0) {
    Mortar::__INIT_TYPE_ID()::currID = Mortar::__INIT_TYPE_ID()::currID + 1;
    DAT_0052c350 = 1;
    DAT_00534760 = Mortar::__INIT_TYPE_ID()::currID;
  }
  if ((DAT_0052bf20 & 1) == 0) {
    DAT_0052bf1c = Mortar::__INIT_TYPE_ID()::currID + 1;
    DAT_0052bf20 = 1;
    Mortar::__INIT_TYPE_ID()::currID = DAT_0052bf1c;
  }
  return;
}


```

## FUN_0005f94c — 0005f94c

- 函数名: FUN_0005f94c
- 函数体: 471 字节
- 调用者数: 1 / 被调用者数: 15

```c

void FUN_0005f94c(int param_1)

{
  uint *puVar1;
  longlong lVar2;
  float fVar3;
  undefined *puVar4;
  void *pvVar5;
  int iVar6;
  undefined4 *puVar7;
  uint uVar8;
  undefined4 uVar9;
  int iVar10;
  int iVar11;
  uint uVar12;
  int *piVar13;
  int *piVar14;
  uint *puVar15;
  undefined4 extraout_s1;
  undefined8 uVar17;
  undefined8 uVar18;
  undefined8 uVar19;
  undefined1 auStack_50 [40];
  undefined1 local_28 [4];
  int local_24;
  int *piVar16;
  
  puVar4 = PTR_DAT_004d9048;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_000274bc(*(undefined4 *)(PTR_DAT_004d9048 + 0x5c),"challenge_hard_pass",0,1,1);
  *(undefined1 *)(param_1 + 0xa0) = 1;
  *(undefined4 *)(param_1 + 0x40) = 0;
  *(undefined1 *)(param_1 + 0x8c) = 1;
  *(undefined4 *)(param_1 + 0x74) = 0;
  pvVar5 = operator_new(0xbc);
  FUN_00067e50();
  *(void **)(param_1 + 0x90) = pvVar5;
  iVar6 = FUN_0001cfb0(*(undefined4 *)(puVar4 + 0x654),"inGameChallengeHud",1);
  *(int *)(param_1 + 4) = iVar6;
  local_28[0] = 1;
  FUN_0001da28(*(undefined4 *)(iVar6 + 0x260),local_28);
  puVar7 = operator_new(0x4c);
  *puVar7 = &DAT_0052cb3c;
  puVar7[1] = 0;
  puVar7[2] = 0;
  puVar7[3] = 0;
  puVar7[4] = 0;
  puVar7[5] = 0;
  _memset(puVar7 + 7,0,0x2c);
  *(undefined4 **)(param_1 + 0x78) = puVar7;
  uVar9 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_50,"@popups");
  uVar9 = FUN_0039725c(uVar9,auStack_50);
  FUN_00066540(puVar7,uVar9);
  FUN_0030f7e0(auStack_50);
  FUN_00066398(param_1 + 8,*(undefined4 *)(param_1 + 0x78));
  FUN_00066a7c(param_1 + 0x48);
  DAT_005f950c = 0;
  iVar6 = *DAT_005f94f8;
  *(int *)(param_1 + 0x68) = iVar6;
  puVar4 = PTR_DAT_004d9050;
  fVar3 = DAT_0005fb24;
  iVar10 = *(int *)(iVar6 + 0x88);
  iVar11 = *(int *)(iVar6 + 0x8c);
  if (iVar10 != iVar11) {
    piVar13 = (int *)(PTR_DAT_004d9050 + 0xc);
    uVar8 = *(uint *)PTR_DAT_004d9050;
    piVar14 = (int *)(PTR_DAT_004d9050 + 4);
    puVar1 = (uint *)(PTR_DAT_004d9050 + 8);
    puVar15 = (uint *)(PTR_DAT_004d9050 + 0x10);
    piVar16 = (int *)(PTR_DAT_004d9050 + 0x14);
    lVar2 = (ulonglong)uVar8 * (ulonglong)*puVar1;
    uVar12 = (uint)lVar2;
    *(uint *)PTR_DAT_004d9050 = uVar12 + *puVar15;
    uVar8 = *piVar14 * *puVar1 + uVar8 * *piVar13 + (int)((ulonglong)lVar2 >> 0x20) +
            *piVar16 + (uint)CARRY4(uVar12,*puVar15);
    *(uint *)(puVar4 + 4) = uVar8;
    uVar9 = (undefined4)((ulonglong)uVar8 * 0x7ffff >> 0x20);
    iVar11 = iVar11 - iVar10;
    uVar17 = FixedToFP(CONCAT44(uVar9,uVar9),0,1,0,0x20);
    uVar19 = FixedToFP(CONCAT44(iVar11,iVar11),0,0,0,0x20);
    uVar18 = FixedToFP(CONCAT44(iVar10,iVar10),0,0,0,0x20);
    uVar17 = FloatVectorMult(uVar19,CONCAT44(extraout_s1,(float)uVar17 / fVar3),2,0x20);
    uVar17 = FloatVectorAdd(uVar18,uVar17,2);
    uVar17 = FPToFixed(uVar17,0,0,3,0x20);
    iVar10 = (int)uVar17;
  }
  *(int *)(iVar6 + 0x7c) = iVar10;
  *(undefined4 *)(iVar6 + 0x80) = 0;
  *(undefined4 *)(iVar6 + 0x84) = 0;
  FUN_0006ee88();
  FUN_00067f1c(*(undefined4 *)(param_1 + 0x90),param_1);
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

