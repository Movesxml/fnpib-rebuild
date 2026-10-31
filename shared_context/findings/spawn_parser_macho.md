# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_000537ec — 000537ec

- 函数名: FUN_000537ec
- 函数体: 935 字节
- 调用者数: 1 / 被调用者数: 13

```c

undefined4 FUN_000537ec(int param_1,undefined4 *param_2)

{
  char cVar1;
  int iVar2;
  size_t sVar3;
  undefined4 uVar4;
  uint uVar5;
  ulong uVar6;
  void *pvVar7;
  byte *pbVar8;
  undefined1 uVar9;
  char *pcVar10;
  float fVar11;
  undefined8 uVar12;
  undefined4 local_2c;
  undefined4 local_28;
  undefined4 local_24;
  double local_20;
  
  if (((DAT_005a7938 & 1) == 0) && (iVar2 = ___cxa_guard_acquire(&DAT_005a7938), iVar2 != 0)) {
    DAT_005a7934 = FUN_002f69c4("Spawn",5);
    ___cxa_guard_release(&DAT_005a7938);
  }
  pcVar10 = (char *)(*(int *)(param_1 + 0x20) + 8);
  sVar3 = _strlen(pcVar10);
  iVar2 = FUN_002f69c4(pcVar10,sVar3);
  uVar4 = 0;
  if (iVar2 == DAT_005a7934) {
    uVar4 = FUN_0030c660(param_1,"type");
    uVar5 = FUN_000395ac(uVar4,param_2 + 1);
    param_2[4] = uVar5;
    if (0 < (int)uVar5) {
      uVar6 = (ulong)((ulonglong)uVar5 * 4);
      if ((int)((ulonglong)uVar5 * 4 >> 0x20) != 0) {
        uVar6 = 0xffffffff;
      }
      pvVar7 = operator_new__(uVar6);
      iVar2 = 0;
      *param_2 = pvVar7;
      do {
        *(undefined4 *)((int)pvVar7 + iVar2 * 4) = 0xffffffff;
        iVar2 = iVar2 + 1;
      } while (iVar2 < (int)uVar5);
    }
    iVar2 = FUN_0030c718(param_1,"min",&local_20);
    if (iVar2 == 0) {
      param_2[0x17] = (float)local_20;
    }
    iVar2 = FUN_0030c718(param_1,"max",&local_20);
    if (iVar2 == 0) {
      param_2[0x19] = (float)local_20;
    }
    iVar2 = FUN_0030c718(param_1,"mininc",&local_20);
    if (iVar2 == 0) {
      param_2[0x1a] = (float)local_20;
    }
    iVar2 = FUN_0030c718(param_1,"maxinc",&local_20);
    if (iVar2 == 0) {
      param_2[0x1a] = (float)local_20;
    }
    iVar2 = FUN_0030c718(param_1,"delay",&local_20);
    if (iVar2 == 0) {
      param_2[0x1b] = (float)local_20;
    }
    iVar2 = FUN_0030c718(param_1,"delayinc",&local_20);
    if (iVar2 == 0) {
      param_2[0x1c] = (float)local_20;
    }
    iVar2 = FUN_0030c718(param_1,"horizmin",&local_20);
    if (iVar2 == 0) {
      param_2[0x14] = (float)local_20;
    }
    iVar2 = FUN_0030c718(param_1,"horizmax",&local_20);
    if (iVar2 == 0) {
      param_2[0x15] = (float)local_20;
    }
    iVar2 = FUN_0030c718(param_1,"velscale",&local_20);
    if (iVar2 == 0) {
      fVar11 = (float)local_20;
      param_2[0x12] = fVar11;
    }
    else {
      fVar11 = (float)param_2[0x12];
    }
    param_2[0x13] = fVar11;
    iVar2 = FUN_0030c718(fVar11,param_1,"velXscale",&local_20);
    if (iVar2 == 0) {
      param_2[0x12] = (float)local_20;
    }
    iVar2 = FUN_0030c718(param_1,"velYscale",&local_20);
    if (iVar2 == 0) {
      param_2[0x13] = (float)local_20;
    }
    iVar2 = FUN_0030c718(param_1,"dt",&local_20);
    if (iVar2 == 0) {
      param_2[5] = (float)local_20;
    }
    iVar2 = FUN_0030c718(param_1,"velX",&local_20);
    if (iVar2 == 0) {
      param_2[0x10] = (float)local_20;
    }
    iVar2 = FUN_0030c718(param_1,"velY",&local_20);
    if (iVar2 == 0) {
      param_2[0x11] = (float)local_20;
    }
    FUN_0030c6c0(param_1,"posX",param_2 + 0xb);
    FUN_0030c6c0(param_1,"posY",param_2 + 0xc);
    FUN_0030c6c0(param_1,"sin",param_2 + 0xd);
    FUN_0030c6c0(param_1,"cos",param_2 + 0xe);
    FUN_0030c6c0(param_1,"radius",param_2 + 0xf);
    pcVar10 = (char *)FUN_0030c660(param_1,"gravity");
    cVar1 = '\0';
    if (pcVar10 != (char *)0x0) {
      cVar1 = *pcVar10;
    }
    if (pcVar10 != (char *)0x0 && cVar1 != '\0') {
      FUN_000394a0(&local_2c);
      param_2[8] = local_2c;
      param_2[9] = local_28;
      param_2[10] = local_24;
    }
    uVar4 = FUN_0030c660(param_1,"override");
    FUN_00058528(param_2,uVar4);
    uVar12 = FUN_0030c660(param_1,"placement");
    uVar5 = (uint)((ulonglong)uVar12 >> 0x20);
    pbVar8 = (byte *)uVar12;
    if (pbVar8 != (byte *)0x0) {
      uVar5 = (uint)*pbVar8;
    }
    if (pbVar8 == (byte *)0x0 || uVar5 == 0) {
      uVar4 = 0;
    }
    else {
      uVar4 = FUN_000531b8();
    }
    param_2[0x16] = uVar4;
    uVar9 = 0;
    param_2[0x21] = 0;
    FUN_0030c6c0(param_1,"replaceWithChallengeFruit",param_2 + 0x21);
    pcVar10 = (char *)FUN_0030c660(param_1,"mirror");
    if ((pcVar10 != (char *)0x0) && (iVar2 = _strcmp("true",pcVar10), iVar2 == 0)) {
      uVar9 = 1;
    }
    uVar4 = 1;
    *(undefined1 *)(param_2 + 0x23) = uVar9;
  }
  return uVar4;
}


```

## FUN_00056098 — 00056098

- 函数名: FUN_00056098
- 函数体: 2135 字节
- 调用者数: 1 / 被调用者数: 23

```c

/* WARNING: Type propagation algorithm not settling */

void FUN_00056098(char *param_1,undefined4 param_2,int param_3)

{
  uint *puVar1;
  uint *puVar2;
  longlong lVar3;
  int *piVar4;
  float fVar5;
  undefined *puVar6;
  uint *puVar7;
  int iVar8;
  int *piVar9;
  undefined4 uVar10;
  int iVar11;
  uint uVar12;
  uint uVar13;
  _List_node_base *p_Var14;
  uint uVar15;
  uint uVar16;
  uint uVar17;
  uint uVar18;
  int *piVar19;
  uint uVar20;
  undefined4 uVar21;
  float *pfVar22;
  uint uVar23;
  int iVar24;
  int iVar25;
  undefined4 *puVar26;
  int iVar27;
  bool bVar28;
  uint extraout_s0;
  uint extraout_s0_00;
  uint extraout_s0_01;
  uint uVar29;
  uint extraout_s1;
  undefined8 uVar30;
  longlong lVar31;
  undefined4 extraout_s1_00;
  ulonglong uVar32;
  uint extraout_s1_01;
  uint extraout_s1_02;
  uint extraout_s1_03;
  undefined4 uVar33;
  undefined4 extraout_s1_04;
  undefined4 extraout_s1_05;
  undefined4 extraout_s1_06;
  undefined4 extraout_s1_07;
  uint extraout_s3;
  uint extraout_s3_00;
  uint extraout_s3_01;
  longlong lVar34;
  undefined4 extraout_s3_02;
  undefined4 extraout_s3_03;
  undefined4 extraout_s3_04;
  undefined4 extraout_s3_05;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  undefined4 extraout_s5_01;
  undefined4 extraout_s5_02;
  undefined4 extraout_s5_03;
  undefined4 extraout_s5_04;
  undefined4 extraout_s5_05;
  undefined4 extraout_s5_06;
  undefined8 uVar35;
  undefined8 uVar36;
  undefined8 uVar37;
  int local_f8;
  undefined *local_e0;
  int local_dc;
  undefined *local_d8;
  undefined4 uStack_d4;
  undefined1 local_c0;
  undefined *local_bc;
  int local_b8;
  undefined *local_b4;
  undefined4 uStack_b0;
  undefined1 local_9c;
  undefined *local_98;
  int local_94;
  undefined *local_90;
  undefined4 uStack_8c;
  undefined1 local_78;
  int local_74 [9];
  undefined1 local_50;
  undefined4 local_4c;
  undefined4 local_48;
  int local_44;
  
  local_44 = *(int *)PTR____stack_chk_guard_004d9044;
  param_1[0x17b] = '\0';
  if (*param_1 == '\0') {
    uVar35 = CONCAT44(param_2,param_2);
    FUN_000557ac(param_1,param_2);
    lVar31 = (ulonglong)extraout_s1 << 0x20;
    if (PTR_DAT_004d9048[0xab] != '\0') {
      uVar30 = FloatVectorAdd(CONCAT44(extraout_s1,*(undefined4 *)(param_1 + 0x40)),uVar35,2);
      *(int *)(param_1 + 0x40) = (int)uVar30;
      lVar31 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar30 >> 0x20),
                                       *(undefined4 *)(param_1 + 0x44)),uVar35,2);
      *(int *)(param_1 + 0x44) = (int)lVar31;
    }
    pfVar22 = (float *)(param_1 + param_3 * 4 + 0x170);
    uVar32 = CONCAT44((int)((ulonglong)lVar31 >> 0x20),*(float *)(param_1 + param_3 * 4 + 0x170));
    if (*(float *)(param_1 + param_3 * 4 + 0x170) <= 0.0) {
      *pfVar22 = 0.0;
      iVar8 = *(int *)(param_1 + param_3 * 4 + 0x168);
      if ((iVar8 == 0) || (*(int *)(iVar8 + 0xb8) < *(int *)(iVar8 + 0xbc))) {
        param_1[0x17b] = '\0';
      }
      else {
        uVar29 = *(uint *)(iVar8 + 0x4c);
        if (0 < (int)uVar29) {
          uVar15 = 0;
          uVar10 = extraout_s5;
          do {
            iVar25 = *(int *)(iVar8 + 0x48);
            iVar11 = iVar25 + uVar15 * 0x90;
            if (*(int *)(iVar11 + 0x18) < 2) {
              uVar30 = 0x3f8000003f800000;
              if (1.0 < *(float *)(param_1 + 0x78)) {
                uVar30 = CONCAT44(0x3f800000,*(float *)(param_1 + 0x78));
              }
              uVar16 = *(uint *)(iVar11 + 0x1c);
              uVar36 = FloatVectorMult(uVar30,uVar35,2,0x20);
              if (0x7fffffff < uVar16) {
                uVar16 = uVar15;
              }
              iVar11 = iVar25 + uVar16 * 0x90;
              uVar32 = FloatVectorSub(CONCAT44((int)(uVar32 >> 0x20),*(undefined4 *)(iVar11 + 0x80))
                                      ,uVar36,2,0x20);
              *(int *)(iVar11 + 0x80) = (int)uVar32;
              puVar1 = (uint *)(iVar11 + 0x74);
              uVar17 = *puVar1;
              if (0 < (int)uVar17) {
                puVar26 = (undefined4 *)(iVar11 + 0x80);
                piVar19 = (int *)(iVar25 + uVar16 * 0x90);
                piVar9 = piVar19 + 0x22;
                local_f8 = 0;
                while( true ) {
                  puVar2 = DAT_005a7930;
                  uVar21 = (undefined4)((ulonglong)uVar30 >> 0x20);
                  uVar12 = piVar19[4];
                  if ((int)uVar12 < 1) {
                    uVar36 = 0;
                    uVar12 = 0;
                    *puVar26 = 0;
                  }
                  else {
                    lVar31 = (ulonglong)*DAT_005a7930 * (ulonglong)DAT_005a7930[2];
                    uVar23 = (uint)lVar31;
                    uVar20 = DAT_005a7930[1] * DAT_005a7930[2] +
                             *DAT_005a7930 * DAT_005a7930[3] + (int)((ulonglong)lVar31 >> 0x20) +
                             DAT_005a7930[5] + (uint)CARRY4(uVar23,DAT_005a7930[4]);
                    *DAT_005a7930 = uVar23 + DAT_005a7930[4];
                    puVar2[1] = uVar20;
                    uVar12 = (uint)((ulonglong)uVar20 * (ulonglong)uVar12 >> 0x20);
                    local_74[0] = *(int *)(*piVar19 + uVar12 * 4);
                    iVar24 = *piVar9;
                    iVar27 = piVar19[0x21];
                    iVar11 = FUN_0001d10c(PTR_DAT_004d9048);
                    puVar2 = DAT_005a7930;
                    lVar34 = (ulonglong)extraout_s3 << 0x20;
                    lVar31 = (ulonglong)extraout_s1_01 << 0x20;
                    uVar10 = extraout_s5_00;
                    if ((iVar11 != 0) && (uVar20 = iVar27 - iVar24, 0 < (int)uVar20)) {
                      lVar3 = (ulonglong)*DAT_005a7930 * (ulonglong)DAT_005a7930[2];
                      uVar13 = (uint)lVar3;
                      uVar18 = *puVar1;
                      uVar23 = DAT_005a7930[1] * DAT_005a7930[2] +
                               *DAT_005a7930 * DAT_005a7930[3] + (int)((ulonglong)lVar3 >> 0x20) +
                               DAT_005a7930[5] + (uint)CARRY4(uVar13,DAT_005a7930[4]);
                      *DAT_005a7930 = uVar13 + DAT_005a7930[4];
                      puVar2[1] = uVar23;
                      if (uVar18 != 0 && uVar18 != 0xffffffff) {
                        uVar23 = (uint)((ulonglong)uVar23 * (ulonglong)uVar18 >> 0x20);
                      }
                      iVar11 = uVar23 - uVar20;
                      if ((int)uVar20 < (int)uVar23) {
                        iVar11 = uVar18 - uVar20;
                        uVar23 = uVar18;
                      }
                      if (uVar23 == uVar20 || iVar11 < 0 != SBORROW4(uVar23,uVar20)) {
                        FUN_0001d10c(PTR_DAT_004d9048);
                        local_74[0] = FUN_000617a8();
                        lVar34 = (ulonglong)extraout_s3_00 << 0x20;
                        lVar31 = (ulonglong)extraout_s1_02 << 0x20;
                        *piVar9 = *piVar9 + 1;
                        uVar10 = extraout_s5_01;
                      }
                    }
                    puVar7 = DAT_005a7930;
                    puVar2 = (uint *)(*(int *)(*(int *)(param_1 + param_3 * 4 + 0x168) + 0x48) +
                                      uVar16 * 0x90 + 0x10);
                    uVar20 = *puVar2;
                    if ((local_74[0] == -2) &&
                       (((int)uVar17 / 2 <= local_f8 && *(int *)(PTR_DAT_004d9048 + 0x10) != 1) &&
                        1 < (int)uVar20)) {
                      uVar13 = *DAT_005a7930;
                      uVar23 = DAT_005a7930[1];
                      while( true ) {
                        lVar3 = (ulonglong)uVar13 * (ulonglong)DAT_005a7930[2];
                        uVar12 = (uint)lVar3;
                        iVar11 = uVar13 * DAT_005a7930[3];
                        uVar13 = uVar12 + DAT_005a7930[4];
                        uVar23 = uVar23 * DAT_005a7930[2] + iVar11 + (int)((ulonglong)lVar3 >> 0x20)
                                 + DAT_005a7930[5] + (uint)CARRY4(uVar12,DAT_005a7930[4]);
                        uVar12 = uVar23;
                        if ((uVar20 != 0) && (uVar20 != 0xffffffff)) {
                          uVar12 = (uint)((ulonglong)uVar23 * (ulonglong)uVar20 >> 0x20);
                        }
                        local_74[0] = *(int *)(*(int *)(*(int *)(*(int *)(param_1 +
                                                                         param_3 * 4 + 0x168) + 0x48
                                                                ) + uVar16 * 0x90) + uVar12 * 4);
                        if (local_74[0] != -2) break;
                        uVar20 = *puVar2;
                      }
                      *DAT_005a7930 = uVar13;
                      puVar7[1] = uVar23;
                    }
                    iVar25 = iVar25 + uVar16 * 0x90;
                    if (local_74[0] == -1) {
                      bVar28 = *(int *)(PTR_DAT_004d9048 + 0x10) == 0;
                    }
                    else {
                      iVar11 = std::string::compare((char *)(piVar19[1] + uVar12 * 4));
                      lVar34 = (ulonglong)extraout_s3_01 << 0x20;
                      lVar31 = (ulonglong)extraout_s1_03 << 0x20;
                      bVar28 = iVar11 == 0 && *(int *)(PTR_DAT_004d9048 + 0x10) == 0;
                      uVar10 = extraout_s5_02;
                    }
                    if (bVar28) {
                      if (param_1[0x17a] == '\x01') {
                        if (param_1[0x179] == '\x01') {
                          param_1[0x17a] = '\x02';
                        }
                      }
                      else if (param_1[0x17a] == '\0') {
                        param_1[0x17a] = '\x01';
                        puVar2 = DAT_005a7930;
                        fVar5 = DAT_000568f0;
                        lVar34 = (ulonglong)*DAT_005a7930 * (ulonglong)DAT_005a7930[2];
                        uVar12 = (uint)lVar34;
                        uVar20 = DAT_005a7930[1] * DAT_005a7930[2] +
                                 *DAT_005a7930 * DAT_005a7930[3] + (int)((ulonglong)lVar34 >> 0x20)
                                 + DAT_005a7930[5] + (uint)CARRY4(uVar12,DAT_005a7930[4]);
                        *DAT_005a7930 = uVar12 + DAT_005a7930[4];
                        puVar2[1] = uVar20;
                        uVar21 = (undefined4)((ulonglong)uVar20 * 0x7ffff >> 0x20);
                        lVar34 = FixedToFP(CONCAT44(uVar21,uVar21),0,1,0,0x20);
                        uVar30 = FloatVectorMult(CONCAT44((int)((ulonglong)lVar31 >> 0x20),
                                                          (float)lVar34 / fVar5),0x4120000041200000,
                                                 2,0x20);
                        lVar31 = FloatVectorAdd(uVar30,0x4120000041200000,2);
                        *(int *)(param_1 + 0x17c) = (int)lVar31;
                      }
                    }
                    uVar21 = (undefined4)((ulonglong)lVar34 >> 0x20);
                    uVar33 = (undefined4)((ulonglong)lVar31 >> 0x20);
                    if (local_74[0] == -2) {
                      local_f8 = local_f8 + 1;
                      if (0.0 < *(float *)(param_1 + 0x68)) {
                        FUN_000568f4(param_1,1,iVar25);
                        uVar10 = extraout_s5_03;
                        uVar33 = extraout_s1_04;
                        uVar21 = extraout_s3_02;
                      }
                    }
                    else if (0.0 < *(float *)(param_1 + 0x6c)) {
                      iVar11 = FUN_000537b4(param_1,local_74);
                      iVar25 = FUN_00057000(param_1,1,local_74[0],iVar25,param_3);
                      uVar10 = extraout_s5_04;
                      uVar33 = extraout_s1_05;
                      uVar21 = extraout_s3_03;
                      if ((iVar25 != 0) && (iVar11 != 0)) {
                        local_78 = 1;
                        local_98 = (undefined *)0x0;
                        FUN_000150e8(&local_98);
                        piVar4 = local_74 + 1;
                        local_78 = 0;
                        local_98 = &DAT_0052c888;
                        local_90 = PTR_FUN_004d9164;
                        uStack_8c = 0;
                        local_50 = 1;
                        local_74[1] = 0;
                        local_94 = iVar11;
                        (*(code *)PTR_FUN_0052c890)(&local_98,piVar4);
                        local_4c = 0;
                        local_48 = 0;
                        p_Var14 = (_List_node_base *)FUN_000155b0(iVar25 + 0x1d4,piVar4);
                        std::_List_node_base::hook(p_Var14);
                        FUN_000150e8(piVar4);
                        if (*(int *)(iVar25 + 0x1dc) != 0) {
                          iVar24 = *(int *)(iVar25 + 0x1d8);
                          *(int *)(iVar24 + 0x2c) = *(int *)(iVar25 + 0x1dc);
                          *(undefined4 *)(iVar24 + 0x30) = 1;
                          *(int *)(iVar25 + 0x1e0) = *(int *)(iVar25 + 0x1e0) + 1;
                        }
                        FUN_000150e8(&local_98);
                        local_9c = 1;
                        local_bc = (undefined *)0x0;
                        FUN_000150e8(&local_bc);
                        local_9c = 0;
                        local_bc = &DAT_0052c888;
                        local_b4 = PTR_FUN_004d9168;
                        uStack_b0 = 0;
                        local_50 = 1;
                        local_74[1] = 0;
                        local_b8 = iVar11;
                        (*(code *)PTR_FUN_0052c890)(&local_bc,piVar4);
                        local_4c = 0;
                        local_48 = 0;
                        p_Var14 = (_List_node_base *)FUN_000155b0(iVar25 + 0x1e4,piVar4);
                        std::_List_node_base::hook(p_Var14);
                        FUN_000150e8(piVar4);
                        if (*(int *)(iVar25 + 0x1ec) != 0) {
                          iVar11 = *(int *)(iVar25 + 0x1e8);
                          *(int *)(iVar11 + 0x2c) = *(int *)(iVar25 + 0x1ec);
                          *(undefined4 *)(iVar11 + 0x30) = 1;
                          *(int *)(iVar25 + 0x1f0) = *(int *)(iVar25 + 0x1f0) + 1;
                        }
                        FUN_000150e8(&local_bc);
                        uVar12 = *(int *)(iVar8 + 0x4c) - 1;
                        bVar28 = uVar16 == uVar12;
                        if (bVar28) {
                          uVar12 = *puVar1;
                        }
                        uVar10 = extraout_s5_05;
                        uVar33 = extraout_s1_06;
                        uVar21 = extraout_s3_04;
                        if (bVar28 && uVar12 == 1) {
                          local_c0 = 1;
                          local_e0 = (undefined *)0x0;
                          FUN_000150e8(&local_e0);
                          local_c0 = 0;
                          local_e0 = &DAT_0052c868;
                          local_d8 = PTR_FUN_004d9170;
                          uStack_d4 = 0;
                          local_50 = 1;
                          local_74[1] = 0;
                          piVar4 = local_74 + 1;
                          local_dc = iVar25;
                          (*(code *)PTR_FUN_0052c870)(&local_e0,piVar4);
                          local_4c = 0;
                          local_48 = 0;
                          p_Var14 = (_List_node_base *)FUN_000155b0(iVar25 + 0x1e4,piVar4);
                          std::_List_node_base::hook(p_Var14);
                          FUN_000150e8(piVar4);
                          if (*(int *)(iVar25 + 0x1ec) != 0) {
                            iVar11 = *(int *)(iVar25 + 0x1e8);
                            *(int *)(iVar11 + 0x2c) = *(int *)(iVar25 + 0x1ec);
                            *(undefined4 *)(iVar11 + 0x30) = 1;
                            *(int *)(iVar25 + 0x1f0) = *(int *)(iVar25 + 0x1f0) + 1;
                          }
                          FUN_000150e8(&local_e0);
                          uVar10 = extraout_s5_06;
                          uVar33 = extraout_s1_07;
                          uVar21 = extraout_s3_05;
                        }
                      }
                    }
                    param_1[param_3 + 0x178] = '\x01';
                    uVar36 = CONCAT44(uVar33,*puVar26);
                    uVar12 = *puVar1 - 1;
                  }
                  *puVar1 = uVar12;
                  uVar37 = FloatVectorMult(CONCAT44(uVar10,piVar19[0x1c]),
                                           CONCAT44(uVar21,*(undefined4 *)(iVar8 + 0x74)),2,0x20);
                  uVar30 = CONCAT44(uVar21,piVar19[0x1b]);
                  uVar37 = FloatVectorAdd(uVar30,uVar37,2);
                  uVar37 = FloatVectorMax(0,uVar37,2,0x20);
                  uVar32 = FloatVectorAdd(uVar36,uVar37,2);
                  *puVar26 = (int)uVar32;
                  if ((int)uVar12 < 1) break;
                  iVar25 = *(int *)(iVar8 + 0x48);
                }
              }
            }
            uVar15 = uVar15 + 1;
          } while (uVar15 != uVar29);
        }
      }
    }
    else {
      uVar30 = FloatVectorSub(uVar32,uVar35,2,0x20);
      *pfVar22 = (float)uVar30;
      param_1[0x17b] = '\x01';
      iVar8 = FUN_0001d10c((float)uVar30,PTR_DAT_004d9048);
      uVar32 = (ulonglong)extraout_s0;
      if (iVar8 != 0) {
        FUN_0001d10c(PTR_DAT_004d9048);
        iVar8 = FUN_00064000(PTR_DAT_004d907c,3);
        uVar32 = (ulonglong)extraout_s0_00;
        if ((iVar8 == 1) && (uVar32 = (ulonglong)(uint)*pfVar22, *pfVar22 <= 0.0)) {
          FUN_00020698(1,0);
          iVar8 = FUN_0001d10c(PTR_DAT_004d9048);
          uVar32 = (ulonglong)extraout_s0_01;
          if (iVar8 != 0) {
            piVar9 = (int *)FUN_0001d10c(PTR_DAT_004d9048);
            uVar29 = (**(code **)(*piVar9 + 0x3c))();
            uVar32 = (ulonglong)uVar29;
          }
        }
      }
    }
    uVar29 = FUN_00057a40((int)uVar32,param_1,param_3);
    bVar28 = uVar29 == 0;
    if (bVar28) {
      uVar29 = (uint)(byte)param_1[0x17b];
    }
    if (bVar28 && uVar29 == 0) {
      if ((*(int *)(param_1 + param_3 * 4 + 0x168) != 0) &&
         (0.0 < *(float *)(param_1 + param_3 * 4 + 0x174))) {
        uVar35 = FloatVectorSub(CONCAT44(extraout_s1_00,*(float *)(param_1 + param_3 * 4 + 0x174)),
                                uVar35,2,0x20);
        *(float *)(param_1 + param_3 * 4 + 0x174) = (float)uVar35;
        if (0.0 < (float)uVar35) goto LAB_000568c2;
      }
      if (((DAT_005a7944 & 1) == 0) && (iVar8 = ___cxa_guard_acquire(&DAT_005a7944), iVar8 != 0)) {
        DAT_005a7940 = FUN_002f69c4("freeze",6);
        ___cxa_guard_release(&DAT_005a7944);
      }
      puVar6 = PTR_DAT_004d9048;
      iVar8 = FUN_0001cd6c();
      if ((iVar8 == 0) && (puVar6[0x17] != '\0')) {
        uVar10 = FUN_00031290();
        iVar8 = FUN_00031378(uVar10,DAT_005a7940);
        if (iVar8 == 0) goto LAB_000568c2;
      }
      iVar8 = *(int *)(param_1 + param_3 * 4 + 0x168);
      if (iVar8 != 0) {
        *(int *)(iVar8 + 0xb8) = *(int *)(iVar8 + 0xb8) + 1;
      }
      if (*(int **)PTR_DAT_004d9048 != (int *)0x0) {
        (**(code **)(**(int **)PTR_DAT_004d9048 + 0x38))();
      }
      iVar8 = FUN_0001d10c(PTR_DAT_004d9048);
      if (iVar8 == 0) {
        FUN_00054dd8(param_1,param_3);
      }
      else {
        iVar25 = *(int *)(param_1 + 0x208);
        iVar8 = FUN_0001d10c(PTR_DAT_004d9048);
        iVar11 = 0;
        if (*(int *)(iVar8 + 100) != 0) {
          iVar11 = *(int *)(*(int *)(iVar8 + 100) + 0xfc);
        }
        if (iVar25 < iVar11) {
          FUN_00054dd8(param_1,param_3);
        }
      }
      *(int *)(param_1 + 0x208) = *(int *)(param_1 + 0x208) + 1;
    }
  }
LAB_000568c2:
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_44) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00054dd8 — 00054dd8

- 函数名: FUN_00054dd8
- 函数体: 1071 字节
- 调用者数: 5 / 被调用者数: 13

```c

void FUN_00054dd8(int param_1,int param_2)

{
  int iVar1;
  int **ppiVar2;
  longlong lVar3;
  undefined *puVar4;
  undefined *puVar5;
  undefined *puVar6;
  uint *puVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  int *piVar10;
  int iVar11;
  int *piVar12;
  uint uVar13;
  int iVar14;
  int iVar15;
  uint uVar16;
  undefined4 *puVar17;
  int iVar18;
  uint *puVar19;
  uint *puVar20;
  uint *puVar21;
  undefined4 extraout_s0;
  undefined4 extraout_s0_00;
  undefined4 extraout_s0_01;
  undefined4 extraout_s0_02;
  undefined4 extraout_s1;
  longlong lVar24;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined4 extraout_s1_03;
  uint extraout_s1_04;
  float fVar25;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  undefined4 extraout_s3_01;
  undefined4 extraout_s3_02;
  undefined4 extraout_s3_03;
  undefined4 extraout_s3_04;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  undefined4 extraout_s5_01;
  undefined4 extraout_s5_02;
  undefined4 extraout_s5_03;
  undefined4 uVar26;
  undefined4 extraout_s5_04;
  undefined4 extraout_s7;
  undefined4 extraout_s7_00;
  undefined4 extraout_s7_01;
  undefined4 extraout_s7_02;
  undefined4 extraout_s7_03;
  undefined4 uVar27;
  undefined4 extraout_s7_04;
  undefined8 uVar28;
  undefined8 uVar29;
  int local_23c;
  int *local_238 [128];
  undefined4 *local_38;
  undefined4 *local_34;
  int local_2c;
  uint *puVar22;
  uint *puVar23;
  
  puVar5 = PTR_DAT_004d9048;
  puVar4 = PTR____stack_chk_guard_004d9044;
  local_2c = *(int *)PTR____stack_chk_guard_004d9044;
  uVar8 = FUN_0000342c();
  FUN_000276a0(*(undefined4 *)(puVar5 + 0x5c));
  uVar9 = FUN_0001cd94(0);
  FUN_00003e98(uVar8,uVar9);
  FUN_00003d14(uVar8,*(undefined4 *)(puVar5 + 0x194));
  if (*(int *)(puVar5 + 0x10) == 1) {
    iVar11 = param_1 + param_2 * 0x24 + *(int *)(param_1 + 0x164) * 0xc + 0x140;
  }
  else {
    iVar11 = param_1 + param_2 * 0x18 + *(int *)(puVar5 + 0x10) * 0xc + 0x98;
  }
  uVar8 = FUN_000587b8(&local_38,iVar11);
  lVar24 = CONCAT44(extraout_s1,uVar8);
  iVar15 = param_1 + param_2 * 4;
  uVar8 = 0;
  iVar11 = *(int *)(iVar15 + 0x16c);
  *(int *)(iVar15 + 0x16c) = iVar11 + 1;
  *(int *)(iVar15 + 0x218) = *(int *)(iVar15 + 0x218) + 1;
  if (0 < iVar11) {
    iVar11 = *(int *)(iVar15 + 0x168);
    uVar8 = 0;
    lVar24 = FloatVectorAdd(CONCAT44(extraout_s1,*(undefined4 *)(iVar11 + 0x74)),0x3f8000003f800000,
                            2);
    *(int *)(iVar11 + 0x74) = (int)lVar24;
    if (iVar11 != 0) {
      uVar8 = *(undefined4 *)(iVar11 + 0xc0);
    }
  }
  uVar9 = extraout_s3;
  uVar26 = extraout_s5;
  uVar27 = extraout_s7;
  if (*(int *)(param_1 + 0x20) == 0) {
    *(undefined4 *)(iVar15 + 0x168) = *local_38;
    piVar12 = (int *)(iVar15 + 0x168);
    if ((*(int *)(puVar5 + 0x10) == 1) && (*(int *)(param_1 + 0x228) != 0)) {
      *piVar12 = *(int *)(param_1 + 0x228);
    }
    else if (local_38 != local_34) {
      iVar11 = 0;
      local_23c = 0;
      puVar17 = local_38;
      do {
        piVar10 = (int *)*puVar17;
        lVar24 = CONCAT44((int)((ulonglong)lVar24 >> 0x20),piVar10[0x22]);
        if (0.0 < (float)piVar10[0x22]) {
          iVar14 = piVar10[0x1f];
          if (piVar10[0x20] < iVar14) {
            uVar29 = FixedToFP(CONCAT44(iVar14,iVar14),0,0,0,0x20);
            uVar29 = FloatVectorMult(lVar24,uVar29,2,0x20);
            lVar24 = FPToFixed(uVar29,0,0,3,0x20);
            iVar18 = piVar10[0x20] + (int)lVar24;
            piVar10[0x20] = iVar18;
            if (iVar14 < iVar18) {
              piVar10[0x20] = iVar14;
            }
          }
          else {
            piVar10[0x20] = iVar14;
          }
        }
        if ((*piVar10 <= *(int *)(iVar15 + 0x16c)) &&
           ((*(int *)(iVar15 + 0x16c) <= piVar10[1] || (piVar10[1] == -2)))) {
          iVar14 = FUN_00057cf0(uVar8,piVar10[0x30]);
          lVar24 = CONCAT44(extraout_s1_00,extraout_s0);
          uVar9 = extraout_s3_00;
          uVar26 = extraout_s5_00;
          uVar27 = extraout_s7_00;
          if (iVar14 == 0) {
            if (iVar11 == 0) {
              *piVar12 = (int)piVar10;
            }
            local_238[iVar11] = piVar10;
            iVar11 = iVar11 + 1;
            local_23c = local_23c + piVar10[0x20];
          }
        }
        puVar17 = puVar17 + 1;
      } while (local_34 != puVar17);
      if (0 < iVar11) {
        iVar14 = local_238[0][0x28];
        if ((0 < iVar14) && (*(int *)(iVar15 + 0x200) < *local_238[0])) {
          *(int *)(iVar15 + 0x200) = *local_238[0];
          if (0x20 < iVar14) {
            iVar14 = 0x20;
          }
          *(int *)(iVar15 + 0x204) = iVar14;
          puVar6 = PTR_DAT_004d90b4;
          if (0 < iVar14) {
            iVar14 = 0;
            param_1 = param_1 + param_2 * 0x80;
            do {
              uVar13 = FUN_0000aae0(*(undefined4 *)(local_238[0][0x25] + iVar14 * 4),0);
              lVar24 = CONCAT44(extraout_s1_01,extraout_s0_00);
              uVar9 = extraout_s3_01;
              uVar26 = extraout_s5_01;
              uVar27 = extraout_s7_01;
              if (0x7fffffff < uVar13) {
                uVar13 = FUN_0000af04(0);
                lVar24 = CONCAT44(extraout_s1_02,extraout_s0_01);
                uVar9 = extraout_s3_02;
                uVar26 = extraout_s5_02;
                uVar27 = extraout_s7_02;
                if (iVar14 < *(int *)puVar6 + -2) {
                  do {
                    iVar18 = 0;
                    do {
                      if (iVar14 <= iVar18) goto LAB_0005503a;
                      iVar1 = iVar18 * 4;
                      iVar18 = iVar18 + 1;
                    } while (uVar13 != *(uint *)(param_1 + 0x180 + iVar1));
                    uVar13 = FUN_0000af04(0);
                    lVar24 = CONCAT44(extraout_s1_03,extraout_s0_02);
                    uVar9 = extraout_s3_03;
                    uVar26 = extraout_s5_03;
                    uVar27 = extraout_s7_03;
                  } while( true );
                }
              }
LAB_0005503a:
              iVar18 = iVar14 * 4;
              iVar14 = iVar14 + 1;
              *(uint *)(param_1 + iVar18 + 0x180) = uVar13;
            } while (iVar14 < *(int *)(iVar15 + 0x204));
          }
        }
        puVar7 = DAT_005a7930;
        if (1 < iVar11) {
          puVar19 = DAT_005a7930 + 2;
          uVar13 = *DAT_005a7930;
          puVar20 = DAT_005a7930 + 1;
          puVar21 = DAT_005a7930 + 3;
          puVar22 = DAT_005a7930 + 4;
          puVar23 = DAT_005a7930 + 5;
          lVar3 = (ulonglong)uVar13 * (ulonglong)*puVar19;
          uVar16 = (uint)lVar3;
          *DAT_005a7930 = uVar16 + *puVar22;
          uVar13 = *puVar20 * *puVar19 + uVar13 * *puVar21 + (int)((ulonglong)lVar3 >> 0x20) +
                   *puVar23 + (uint)CARRY4(uVar16,*puVar22);
          puVar7[1] = uVar13;
          if (local_23c * 10 != 0) {
            uVar13 = (uint)((ulonglong)uVar13 * (ulonglong)(uint)(local_23c * 10) >> 0x20);
          }
          iVar14 = 0;
          iVar18 = 0;
          do {
            if (iVar11 <= iVar18) goto LAB_000550bc;
            ppiVar2 = local_238 + iVar18;
            iVar18 = iVar18 + 1;
            iVar14 = iVar14 + (*ppiVar2)[0x20] * 10;
          } while (iVar14 <= (int)uVar13);
          *piVar12 = (int)*ppiVar2;
        }
      }
    }
LAB_000550bc:
    puVar7 = DAT_005a7930;
    iVar11 = *piVar12;
    iVar14 = *(int *)(iVar11 + 0x8c);
    if (0 < iVar14) {
      iVar18 = *(int *)(iVar11 + 0x90);
      if (iVar14 != iVar18) {
        puVar20 = DAT_005a7930 + 2;
        uVar13 = *DAT_005a7930;
        puVar21 = DAT_005a7930 + 1;
        puVar22 = DAT_005a7930 + 3;
        puVar23 = DAT_005a7930 + 4;
        puVar19 = DAT_005a7930 + 5;
        lVar3 = (ulonglong)uVar13 * (ulonglong)*puVar20;
        uVar16 = (uint)lVar3;
        *DAT_005a7930 = uVar16 + *puVar23;
        uVar13 = *puVar21 * *puVar20 + uVar13 * *puVar22 + (int)((ulonglong)lVar3 >> 0x20) +
                 *puVar19 + (uint)CARRY4(uVar16,*puVar23);
        uVar16 = iVar18 - iVar14;
        puVar7[1] = uVar13;
        if (uVar16 != 0 && uVar16 != 0xffffffff) {
          uVar13 = (uint)((ulonglong)uVar13 * (ulonglong)uVar16 >> 0x20);
        }
        iVar14 = iVar14 + uVar13;
      }
      piVar10 = (int *)FUN_0002b240((int)lVar24,
                                    *(int *)(puVar5 + 0x5c) + *(int *)(puVar5 + 0x10) * 0x18 + 0x2a4
                                    ,iVar11 + 0xa8);
      lVar24 = (ulonglong)extraout_s1_04 << 0x20;
      *piVar10 = iVar14;
      iVar11 = *piVar12;
      *(undefined4 *)(iVar11 + 0x88) = 0;
      uVar9 = extraout_s3_04;
      uVar26 = extraout_s5_04;
      uVar27 = extraout_s7_04;
    }
    *(undefined4 *)(iVar11 + 0x80) = 0;
  }
  else {
    iVar11 = local_38[*(int *)(*(int *)(param_1 + 0x20) + 0x18)];
    *(int *)(iVar15 + 0x168) = iVar11;
  }
  uVar29 = CONCAT44((int)((ulonglong)lVar24 >> 0x20),*(float *)(iVar11 + 0x60));
  if (*(float *)(iVar11 + 0x60) <= 0.0) {
    *(undefined4 *)(iVar15 + 0x170) = 0;
  }
  else {
    uVar28 = FloatVectorMult(CONCAT44(uVar9,*(undefined4 *)(iVar11 + 100)),
                             CONCAT44(uVar26,*(undefined4 *)(iVar11 + 0x74)),2,0x20);
    uVar29 = FloatVectorAdd(uVar29,uVar28,2);
    uVar29 = FloatVectorMax(CONCAT44(uVar9,DAT_00055208),uVar29,2,0x20);
    *(int *)(iVar15 + 0x170) = (int)uVar29;
  }
  uVar8 = *(undefined4 *)(iVar11 + 0x68);
  *(undefined4 *)(iVar15 + 0x174) = uVar8;
  if (*(float *)(iVar11 + 0x70) != 0.0) {
    uVar28 = FloatVectorMult(CONCAT44(uVar26,*(float *)(iVar11 + 0x70)),
                             CONCAT44(uVar27,*(undefined4 *)(iVar15 + 0x54)),2,0x20);
    uVar29 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar29 >> 0x20),uVar8),uVar28,2);
    fVar25 = DAT_00055208;
    if (DAT_00055208 < (float)uVar29) {
      fVar25 = (float)uVar29;
    }
    *(float *)(iVar15 + 0x174) = fVar25;
  }
  FUN_00057d48(iVar11,*(undefined4 *)(iVar11 + 0x74));
  if (local_38 != (undefined4 *)0x0) {
    operator_delete(local_38);
  }
  if (*(int *)puVar4 != local_2c) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail(*(int *)puVar4);
  }
  return;
}


```

## FUN_00057000 — 00057000

- 函数名: FUN_00057000
- 函数体: 2437 字节
- 调用者数: 6 / 被调用者数: 16

```c

int * FUN_00057000(int param_1,int param_2,int param_3,int param_4,int param_5)

{
  uint *puVar1;
  short sVar2;
  undefined *puVar3;
  undefined *puVar4;
  undefined *puVar5;
  undefined *puVar6;
  int iVar7;
  int *piVar8;
  int iVar9;
  undefined1 extraout_r1;
  undefined1 uVar10;
  undefined4 uVar11;
  int iVar12;
  uint uVar13;
  uint uVar14;
  undefined1 *puVar15;
  uint uVar16;
  int iVar17;
  uint uVar18;
  uint uVar19;
  undefined4 uVar20;
  undefined4 *puVar21;
  uint uVar22;
  uint uVar23;
  uint *puVar24;
  uint *puVar25;
  uint *puVar26;
  uint *puVar27;
  float fVar29;
  float fVar30;
  undefined8 in_d0;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined4 uVar31;
  undefined4 extraout_s1_02;
  undefined8 in_d1;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  undefined4 extraout_s3_01;
  undefined4 extraout_s3_02;
  undefined4 extraout_s3_03;
  uint extraout_s3_04;
  undefined4 extraout_s3_05;
  uint extraout_s3_06;
  uint extraout_s3_07;
  undefined4 uVar33;
  undefined4 extraout_s3_08;
  undefined4 extraout_s3_09;
  uint extraout_s3_10;
  longlong lVar32;
  float fVar34;
  undefined8 in_d2;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  undefined4 extraout_s5_01;
  undefined4 extraout_s5_02;
  ulonglong uVar35;
  undefined4 extraout_s5_03;
  undefined4 extraout_s5_04;
  undefined4 extraout_s5_05;
  undefined4 extraout_s5_06;
  undefined4 extraout_s5_07;
  undefined4 extraout_s5_08;
  undefined4 extraout_s5_09;
  float fVar36;
  undefined8 uVar37;
  undefined4 extraout_s7;
  undefined4 extraout_s7_00;
  undefined4 uVar38;
  undefined4 extraout_s7_01;
  undefined4 extraout_s7_02;
  undefined4 extraout_s7_03;
  undefined4 extraout_s9;
  undefined4 extraout_s9_00;
  undefined4 extraout_s9_01;
  undefined4 extraout_s9_02;
  undefined4 extraout_s9_03;
  undefined4 extraout_s9_04;
  undefined8 unaff_d8;
  undefined8 uVar39;
  undefined8 uVar40;
  undefined8 unaff_d10;
  undefined8 uVar41;
  undefined8 uVar42;
  undefined8 uVar43;
  undefined8 uVar44;
  undefined8 uVar45;
  undefined8 unaff_d14;
  undefined8 uVar46;
  undefined8 unaff_d15;
  undefined8 uVar47;
  undefined8 uVar48;
  undefined8 uVar49;
  undefined8 uVar50;
  undefined8 uVar51;
  undefined1 *local_84;
  undefined4 local_6c;
  undefined4 local_68;
  undefined4 local_64;
  uint *puVar28;
  
  puVar1 = DAT_005a7930;
  fVar30 = DAT_000573ec;
  if (param_2 < 1) {
    return (int *)0x0;
  }
  if (param_4 == 0) {
    uVar50 = 0x3f8000003f800000;
    uVar49 = 0xbf800000bf800000;
    uVar41 = 0;
LAB_0005705a:
    lVar32 = (ulonglong)*DAT_005a7930 * (ulonglong)DAT_005a7930[2];
    uVar13 = (uint)lVar32;
    uVar14 = DAT_005a7930[1] * DAT_005a7930[2] +
             *DAT_005a7930 * DAT_005a7930[3] + (int)((ulonglong)lVar32 >> 0x20) +
             DAT_005a7930[5] + (uint)CARRY4(uVar13,DAT_005a7930[4]);
    uVar11 = (undefined4)((ulonglong)uVar14 * 0x7ffff >> 0x20);
    *DAT_005a7930 = uVar13 + DAT_005a7930[4];
    puVar1[1] = uVar14;
    uVar37 = FixedToFP(CONCAT44(uVar11,uVar11),0,1,0,0x20);
    uVar48 = FloatVectorSub(uVar50,uVar49,2,0x20);
    uVar37 = FloatVectorMult(uVar48,CONCAT44((int)((ulonglong)in_d2 >> 0x20),(float)uVar37 / fVar30)
                             ,2,0x20);
    uVar49 = FloatVectorAdd(uVar49,uVar37,2);
    uVar50 = FloatVectorMult(uVar49,CONCAT44((int)((ulonglong)uVar50 >> 0x20),DAT_000573f0),2,0x20);
    uVar50 = FPToFixed(uVar50,0,1,3,0x20);
    local_84 = (undefined1 *)uVar50;
    if (param_4 != 0) goto LAB_000570c6;
    uVar11 = FUN_000251a8();
    uVar50 = FloatVectorMult(CONCAT44(uVar11,uVar11),0xbf000000bf000000,2,0x20);
    uVar50 = FPToFixed(uVar50,0,0,3,0x20);
    iVar17 = (int)uVar50;
    uVar11 = extraout_s9_02;
    uVar31 = extraout_s3_02;
    uVar33 = extraout_s5_02;
    uVar38 = extraout_s7_02;
  }
  else {
    local_84 = *(undefined1 **)(param_4 + 0x2c);
    uVar41 = CONCAT44((int)((ulonglong)unaff_d10 >> 0x20),*(undefined4 *)(param_4 + 0x80));
    if (local_84 == &LAB_0001869e_1) {
      uVar49 = CONCAT44((int)((ulonglong)in_d0 >> 0x20),*(undefined4 *)(param_4 + 0x50));
      uVar50 = CONCAT44((int)((ulonglong)in_d1 >> 0x20),*(undefined4 *)(param_4 + 0x54));
      goto LAB_0005705a;
    }
LAB_000570c6:
    puVar15 = *(undefined1 **)(param_4 + 0x30);
    uVar50 = FUN_000251a8();
    iVar12 = (int)((ulonglong)uVar50 >> 0x20);
    uVar50 = FloatVectorMult(CONCAT44((int)uVar50,(int)uVar50),0xbf000000bf000000,2,0x20);
    uVar50 = FPToFixed(uVar50,0,0,3,0x20);
    iVar17 = (int)uVar50;
    if (puVar15 != &LAB_0001869e_1) {
      iVar17 = iVar17 - *(int *)(param_4 + 0x30);
    }
    iVar7 = *(int *)(param_4 + 0x34);
    if (iVar7 != 0) {
      iVar12 = *(int *)(param_4 + 0x3c);
    }
    uVar11 = extraout_s9;
    uVar31 = extraout_s3;
    uVar33 = extraout_s5;
    uVar38 = extraout_s7;
    if (iVar7 != 0 && iVar12 != 0) {
      uVar49 = FUN_003010b8(iVar7 * 0xb6 & 0xffff);
      iVar12 = (int)((ulonglong)uVar49 >> 0x20);
      uVar50 = FixedToFP(CONCAT44(extraout_s1,*(undefined4 *)(param_4 + 0x3c)),0,0,0,0x20);
      uVar50 = FloatVectorMult(CONCAT44((int)uVar49,(int)uVar49),uVar50,2,0x20);
      uVar50 = FPToFixed(uVar50,0,0,3,0x20);
      iVar17 = iVar17 + (int)uVar50;
      uVar11 = extraout_s9_00;
      uVar31 = extraout_s3_00;
      uVar33 = extraout_s5_00;
      uVar38 = extraout_s7_00;
    }
    iVar7 = *(int *)(param_4 + 0x38);
    if (iVar7 != 0) {
      iVar12 = *(int *)(param_4 + 0x3c);
    }
    if (iVar7 != 0 && iVar12 != 0) {
      uVar11 = FUN_003010d0(iVar7 * 0xb6 & 0xffff);
      uVar50 = FixedToFP(CONCAT44(extraout_s1_00,*(undefined4 *)(param_4 + 0x3c)),0,0,0,0x20);
      uVar50 = FloatVectorMult(CONCAT44(uVar11,uVar11),uVar50,2,0x20);
      uVar50 = FPToFixed(uVar50,0,0,3,0x20);
      local_84 = local_84 + (int)uVar50;
      uVar11 = extraout_s9_01;
      uVar31 = extraout_s3_01;
      uVar33 = extraout_s5_01;
      uVar38 = extraout_s7_01;
    }
  }
  puVar1 = DAT_005a7930;
  fVar30 = DAT_000573ec;
  uVar14 = *DAT_005a7930;
  puVar25 = DAT_005a7930 + 1;
  uVar13 = DAT_005a7930[2];
  uVar16 = DAT_005a7930[3];
  uVar22 = DAT_005a7930[4];
  uVar23 = DAT_005a7930[5];
  lVar32 = (ulonglong)uVar14 * (ulonglong)uVar13;
  uVar18 = (uint)lVar32;
  uVar19 = uVar18 + uVar22;
  *DAT_005a7930 = uVar19;
  uVar14 = *puVar25 * uVar13 + uVar14 * uVar16 + (int)((ulonglong)lVar32 >> 0x20) +
           uVar23 + CARRY4(uVar18,uVar22);
  puVar1[1] = uVar14;
  uVar20 = (undefined4)((ulonglong)uVar14 * 0x7ffff >> 0x20);
  uVar50 = FixedToFP(CONCAT44(uVar20,uVar20),0,1,0,0x20);
  uVar49 = FloatVectorMult(CONCAT44(uVar33,(float)uVar50 / fVar30),0x3fc000003fc00000,2,0x20);
  uVar50 = 0x41a0000041a00000;
  uVar49 = FloatVectorAdd(uVar49,0x4118000041180000,2);
  if (param_4 != 0) {
    fVar29 = *(float *)(param_4 + 0x40);
    if (fVar29 != 0.0 || (fVar29 != 0.0 || *(float *)(param_4 + 0x44) != 0.0)) {
      uVar50 = FloatVectorMult(CONCAT44(0x41a00000,fVar29),
                               CONCAT44(uVar31,*(undefined4 *)(param_4 + 0x48)),2,0x20);
      uVar37 = FloatVectorMult(CONCAT44(uVar33,*(float *)(param_4 + 0x44)),
                               CONCAT44(uVar38,*(undefined4 *)(param_4 + 0x4c)),2,0x20);
      goto LAB_00057322;
    }
    puVar21 = &DAT_0005799c;
    if (1 < *(int *)(param_4 + 0x58)) {
      puVar21 = &DAT_000579a0;
    }
    uVar50 = CONCAT44(0x41a00000,*puVar21);
  }
  uVar18 = (uint)((ulonglong)uVar19 * (ulonglong)uVar13);
  uVar48 = FixedToFP(CONCAT44(local_84,local_84),0,0,0,0x20);
  fVar29 = (float)uVar48 / DAT_000573f0;
  uVar13 = uVar14 * uVar13 + uVar19 * uVar16 + (int)((ulonglong)uVar19 * (ulonglong)uVar13 >> 0x20)
           + uVar23 + CARRY4(uVar18,uVar22);
  uVar11 = (undefined4)((ulonglong)uVar13 * 0x7ffff >> 0x20);
  *puVar1 = uVar18 + uVar22;
  puVar1[1] = uVar13;
  puVar21 = &DAT_000579a4;
  uVar37 = FixedToFP(CONCAT44(uVar11,uVar11),0,1,0,0x20);
  uVar51 = FloatVectorMult(uVar50,0xbf000000bf000000,2,0x20);
  uVar37 = FloatVectorAdd(CONCAT44(uVar31,(float)uVar37 / fVar30),0xbf000000bf000000,2);
  uVar48 = FloatVectorMult(uVar51,CONCAT44((int)((ulonglong)uVar48 >> 0x20),fVar29),2,0x20);
  uVar35 = FPToFixed(uVar48,0,0,3,0x20);
  uVar48 = FloatVectorNeg(uVar37,2,2);
  uVar48 = FloatVectorSub(0x3f0000003f000000,uVar48,2,0x20);
  uVar48 = FloatVectorMult(uVar48,uVar48,2,0x20);
  uVar48 = FloatVectorMult(uVar48,0xc0000000c0000000,2,0x20);
  uVar51 = FloatVectorAdd(uVar48,0x3f0000003f000000,2);
  uVar48 = FixedToFP((uVar35 << 0x20) + (uVar35 & 0xffffffff),0,0,0,0x20);
  if ((int)((uint)((float)uVar37 < 0.0) << 0x1f) < 0) {
    puVar21 = &DAT_000579a8;
  }
  uVar37 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar37 >> 0x20),*puVar21),uVar51,2,0x20);
  uVar50 = FloatVectorMult(uVar50,uVar37,2,0x20);
  uVar50 = FloatVectorAdd(uVar48,uVar50,2);
  uVar50 = FPToFixed(uVar50,0,0,3,0x20);
  sVar2 = (short)uVar50 * 0xb6;
  uVar11 = FUN_003010b8(sVar2);
  unaff_d8 = 0x3f8000003f800000;
  uVar50 = FloatVectorMult(uVar49,CONCAT44(uVar11,uVar11),2,0x20);
  if (param_4 != 0) {
    unaff_d8 = CONCAT44(0x3f800000,*(undefined4 *)(param_4 + 0x48));
  }
  uVar11 = FUN_003010d0(sVar2);
  uVar37 = 0x3f8000003f800000;
  uVar48 = FloatVectorMult(uVar49,CONCAT44(uVar11,uVar11),2,0x20);
  if (param_4 != 0) {
    uVar37 = CONCAT44(0x3f800000,*(undefined4 *)(param_4 + 0x4c));
  }
  uVar50 = FloatVectorMult(uVar50,unaff_d8,2,0x20);
  uVar48 = FloatVectorMult(uVar48,CONCAT44(extraout_s3_03,DAT_000573f4),2,0x20);
  uVar37 = FloatVectorMult(uVar48,uVar37,2,0x20);
  uVar11 = extraout_s9_03;
LAB_00057322:
  puVar1 = DAT_005a7930;
  puVar3 = PTR_DAT_004d9048;
  uVar48 = 0x3f8000003f800000;
  if (param_4 != 0) {
    uVar48 = CONCAT44(0x3f800000,*(undefined4 *)(param_4 + 0x14));
  }
  if (param_3 == -1) {
    param_3 = -1;
    iVar12 = param_1 + param_5 * 4;
    uVar13 = *(uint *)(iVar12 + 0x204);
    if (0 < (int)uVar13) {
      if (*(int *)(PTR_DAT_004d9048 + 0x10) == 1) {
        while( true ) {
          puVar25 = DAT_005a7930;
          puVar24 = DAT_005a7930 + 3;
          uVar14 = *DAT_005a7930;
          puVar26 = DAT_005a7930 + 1;
          puVar1 = DAT_005a7930 + 2;
          puVar27 = DAT_005a7930 + 4;
          puVar28 = DAT_005a7930 + 5;
          lVar32 = (ulonglong)uVar14 * (ulonglong)*puVar1;
          uVar16 = (uint)lVar32;
          *DAT_005a7930 = uVar16 + *puVar27;
          uVar14 = *puVar26 * *puVar1 + uVar14 * *puVar24 + (int)((ulonglong)lVar32 >> 0x20) +
                   *puVar28 + (uint)CARRY4(uVar16,*puVar27);
          puVar25[1] = uVar14;
          if (uVar13 != 0 && uVar13 != 0xffffffff) {
            uVar14 = (uint)((ulonglong)uVar14 * (ulonglong)uVar13 >> 0x20);
          }
          param_3 = *(int *)(param_1 + param_5 * 0x80 + uVar14 * 4 + 0x180);
          FUN_0001d10c(puVar3);
          iVar7 = FUN_000617a8();
          uVar11 = extraout_s9_04;
          if (param_3 != iVar7) break;
          uVar13 = *(uint *)(iVar12 + 0x204);
        }
      }
      else {
        lVar32 = (ulonglong)*DAT_005a7930 * (ulonglong)DAT_005a7930[2];
        uVar14 = (uint)lVar32;
        uVar16 = DAT_005a7930[1] * DAT_005a7930[2] +
                 *DAT_005a7930 * DAT_005a7930[3] + (int)((ulonglong)lVar32 >> 0x20) +
                 DAT_005a7930[5] + (uint)CARRY4(uVar14,DAT_005a7930[4]);
        *DAT_005a7930 = uVar14 + DAT_005a7930[4];
        puVar1[1] = uVar16;
        param_3 = *(int *)(param_1 + param_5 * 0x80 +
                           (int)((ulonglong)uVar16 * (ulonglong)uVar13 >> 0x20) * 4 + 0x180);
      }
    }
  }
  puVar1 = DAT_005a7930;
  uVar42 = CONCAT44((int)((ulonglong)uVar41 >> 0x20),DAT_0052bf00);
  uVar47 = CONCAT44((int)((ulonglong)unaff_d15 >> 0x20),DAT_0052bf04);
  uVar46 = CONCAT44((int)((ulonglong)unaff_d14 >> 0x20),DAT_0052bf08);
  uVar44 = FloatVectorNeg(uVar47,2,2);
  uVar43 = FloatVectorNeg(uVar46,2,2);
  uVar45 = FloatVectorNeg(uVar42,2,2);
  uVar51 = CONCAT44(uVar11,DAT_0052bf80);
  uVar39 = CONCAT44((int)((ulonglong)unaff_d8 >> 0x20),DAT_0052bf84);
  uVar40 = uVar50;
  if (param_4 == 0) {
    iVar12 = 0;
  }
  else {
    iVar9 = 3;
    iVar7 = 2;
    iVar12 = *(int *)(param_4 + 0x58);
    switch(*(int *)(param_4 + 0x58)) {
    case 1:
      uVar39 = FloatVectorNeg(uVar39,2,2);
      uVar51 = FloatVectorNeg(uVar51,2,2);
      uVar37 = FloatVectorMult(uVar37,0x3f0000003f000000,2,0x20);
      iVar12 = 1;
      uVar45 = uVar42;
      uVar43 = uVar46;
      uVar44 = uVar47;
      break;
    case 4:
      puVar25 = DAT_005a7930 + 2;
      uVar13 = *DAT_005a7930;
      puVar24 = DAT_005a7930 + 1;
      puVar26 = DAT_005a7930 + 3;
      puVar27 = DAT_005a7930 + 4;
      puVar28 = DAT_005a7930 + 5;
      lVar32 = (ulonglong)uVar13 * (ulonglong)*puVar25;
      uVar14 = (uint)lVar32;
      *DAT_005a7930 = uVar14 + *puVar27;
      uVar13 = *puVar24 * *puVar25 + uVar13 * *puVar26 + (int)((ulonglong)lVar32 >> 0x20) +
               *puVar28 + (uint)CARRY4(uVar14,*puVar27);
      puVar1[1] = uVar13;
      iVar9 = 2;
      if ((int)uVar13 < 0) {
        iVar9 = 3;
      }
    case 3:
      uVar51 = 0x3f8000003f800000;
      uVar45 = CONCAT44((int)((ulonglong)uVar45 >> 0x20),DAT_0052c000);
      uVar44 = CONCAT44((int)((ulonglong)uVar44 >> 0x20),DAT_0052c004);
      uVar43 = CONCAT44((int)((ulonglong)uVar43 >> 0x20),DAT_0052c008);
      iVar7 = iVar9;
      uVar39 = uVar51;
    case 2:
      uVar42 = FixedToFP(CONCAT44(local_84,local_84),0,0,0,0x20);
      uVar11 = FUN_00025164();
      uVar40 = FixedToFP(CONCAT44(-iVar17,-iVar17),0,0,0,0x20);
      fVar30 = (float)FUN_000251a8();
      uVar46 = FloatVectorMult(uVar40,CONCAT44(uVar11,uVar11),2,0x20);
      uVar11 = FUN_000251a8();
      uVar40 = FloatVectorMult(uVar42,CONCAT44(uVar11,uVar11),2,0x20);
      fVar29 = (float)FUN_00025164();
      uVar40 = FPToFixed(CONCAT44(fVar29,(float)uVar40 / fVar29),0,0,3,0x20);
      uVar42 = FPToFixed(CONCAT44(extraout_s3_09,(float)uVar46 / fVar30),0,0,3,0x20);
      iVar17 = (int)uVar40;
      uVar11 = (undefined4)((ulonglong)uVar40 >> 0x20);
      local_84 = (undefined1 *)uVar42;
      uVar49 = FloatVectorMult(uVar49,CONCAT44(uVar11,*(undefined4 *)(param_4 + 0x24)),2,0x20);
      uVar49 = FloatVectorMult(uVar49,CONCAT44(uVar11,DAT_000579ac),2,0x20);
      uVar40 = FloatVectorMult(uVar37,0xbf400000bf400000,2,0x20);
      uVar37 = FloatVectorAdd(uVar50,uVar49,2);
      iVar12 = iVar7;
      if (iVar7 == 2) {
        uVar51 = 0xbf800000bf800000;
        uVar39 = 0x3f8000003f800000;
        uVar45 = FloatVectorNeg(CONCAT44((int)((ulonglong)uVar42 >> 0x20),DAT_0052c000),2,2);
        uVar44 = FloatVectorNeg(CONCAT44(extraout_s5_07,DAT_0052c004),2,2);
        uVar43 = FloatVectorNeg(CONCAT44(extraout_s7_03,DAT_0052c008),2,2);
        iVar12 = 2;
      }
    }
  }
  uVar50 = FPToFixed(uVar39,0,0,3,0x20);
  uVar37 = FloatVectorMult(uVar39,uVar37,2,0x20);
  uVar39 = FloatVectorMult(uVar51,uVar40,2,0x20);
  uVar49 = FPToFixed(uVar51,0,0,3,0x20);
  iVar17 = iVar17 * (int)uVar50;
  iVar7 = (int)local_84 * (int)uVar49;
  uVar11 = FUN_000065c4();
  piVar8 = (int *)FUN_0000698c(uVar11,1,1);
  uVar50 = FixedToFP(CONCAT44(iVar7,iVar7),0,0,0,0x20);
  uVar49 = FixedToFP(CONCAT44(iVar17,iVar17),0,0,0,0x20);
  local_6c = DAT_0052bf80;
  local_68 = DAT_0052bf84;
  local_64 = DAT_0052bf88;
  piVar8[4] = (int)uVar50;
  piVar8[5] = (int)uVar49;
  piVar8[6] = 0;
  piVar8[9] = 0;
  piVar8[7] = (int)uVar39;
  piVar8[8] = (int)uVar37;
  (**(code **)(*piVar8 + 8))((int)uVar50,piVar8,0,param_3,&local_6c);
  puVar3 = PTR_DAT_004d9048;
  iVar17 = FUN_0001d10c(PTR_DAT_004d9048);
  puVar4 = PTR_DAT_004d9094;
  puVar5 = PTR_DAT_004d907c;
  lVar32 = (ulonglong)extraout_s3_04 << 0x20;
  uVar11 = extraout_s5_03;
  if (iVar17 != 0) {
    iVar17 = FUN_00063fe0(PTR_DAT_004d907c,*(undefined4 *)PTR_DAT_004d9094);
    puVar21 = (undefined4 *)PTR_DAT_004d905c;
    if (iVar17 == 1) {
      iVar17 = FUN_00063e80(puVar5,*(undefined4 *)puVar4);
      fVar30 = *(float *)(iVar17 + 0x10);
      fVar29 = *(float *)(iVar17 + 0x14);
      lVar32 = CONCAT44(extraout_s3_05,fVar29);
      fVar34 = *(float *)(iVar17 + 0x18);
      *(int *)(iVar17 + 0x10) = piVar8[4];
      *(int *)(iVar17 + 0x14) = piVar8[5];
      *(int *)(iVar17 + 0x18) = piVar8[6];
      *(int *)(iVar17 + 0xc) = *(int *)(iVar17 + 0xc) + 1;
      if (((fVar30 == -1.0) && (fVar29 == -1.0)) && (fVar34 == -1.0)) {
        *(undefined4 *)(iVar17 + 8) = 0x16c0;
        uVar11 = extraout_s5_04;
      }
      else {
        uVar50 = FloatVectorSub(CONCAT44(extraout_s5_04,piVar8[4]),CONCAT44(extraout_s1_01,fVar30),2
                                ,0x20);
        uVar49 = FloatVectorSub(CONCAT44(0xbf800000,piVar8[5]),lVar32,2,0x20);
        uVar11 = FUN_0030113c((int)uVar49,(int)uVar50);
        lVar32 = (ulonglong)extraout_s3_06 << 0x20;
        *(undefined4 *)(iVar17 + 4) = uVar11;
        uVar11 = extraout_s5_05;
      }
    }
    else {
      iVar17 = FUN_00063fe0(puVar5,*(undefined4 *)PTR_DAT_004d905c);
      puVar4 = PTR_DAT_004d906c;
      if ((iVar17 == 1) ||
         (iVar17 = FUN_00063fe0(puVar5,*(undefined4 *)PTR_DAT_004d906c), puVar6 = PTR_DAT_004d90a0,
         puVar21 = (undefined4 *)puVar4, iVar17 == 1)) {
        iVar17 = FUN_00063e80(puVar5,*puVar21);
        lVar32 = (ulonglong)extraout_s3_07 << 0x20;
        *(undefined4 *)(iVar17 + 0x10) = *(undefined4 *)(piVar8[0xe] + 0x14);
        uVar11 = extraout_s5_06;
      }
      else {
        iVar17 = FUN_00063fe0(puVar5,*(undefined4 *)PTR_DAT_004d90a0);
        lVar32 = (ulonglong)extraout_s3_10 << 0x20;
        uVar11 = extraout_s5_08;
        if (iVar17 == 1) {
          iVar17 = FUN_00063e80(puVar5,*(undefined4 *)puVar6);
          uVar10 = extraout_r1;
          if (*(float *)(iVar17 + 0x10) == -1.0) {
            uVar10 = 1;
          }
          *(undefined1 *)((int)piVar8 + 0xc3) = uVar10;
          uVar50 = FloatVectorMult(0x4040000040400000,CONCAT44(0xbf800000,piVar8[10]),2,0x20);
          piVar8[10] = (int)uVar50;
          uVar50 = FloatVectorMult(0x4040000040400000,
                                   CONCAT44((int)((ulonglong)uVar50 >> 0x20),piVar8[0xb]),2,0x20);
          piVar8[0xb] = (int)uVar50;
          uVar50 = FloatVectorMult(0x4040000040400000,
                                   CONCAT44((int)((ulonglong)uVar50 >> 0x20),piVar8[0xc]),2,0x20);
          piVar8[0xc] = (int)uVar50;
          iVar7 = piVar8[0xe];
          if (iVar7 != 0) {
            uVar50 = CONCAT44((int)((ulonglong)uVar50 >> 0x20),*(undefined4 *)(iVar7 + 0x14));
          }
          lVar32 = FloatVectorMult(0x4040000040400000,uVar50,2,0x20);
          *(int *)(iVar7 + 0x14) = (int)lVar32;
          *(undefined4 *)(iVar17 + 0x10) = 0x40400000;
          uVar11 = extraout_s5_09;
        }
      }
    }
  }
  piVar8[0x35] = (int)uVar48;
  if (param_4 != 0) {
    fVar36 = (float)piVar8[0x38];
    uVar33 = (undefined4)((ulonglong)lVar32 >> 0x20);
    fVar34 = *(float *)(param_4 + 0x28);
    fVar30 = -(fVar36 * *(float *)(param_4 + 0x20));
    uVar48 = CONCAT44((int)((ulonglong)uVar48 >> 0x20),fVar30);
    fVar29 = -(fVar36 * *(float *)(param_4 + 0x24));
    lVar32 = CONCAT44(uVar33,fVar29);
    piVar8[0x37] = (int)fVar30;
    piVar8[0x38] = (int)fVar29;
    piVar8[0x39] = (int)-(fVar36 * fVar34);
    uVar31 = DAT_000579b0;
    if ((iVar12 == 3) || (uVar31 = DAT_000579b4, iVar12 == 2)) {
      lVar32 = CONCAT44(uVar33,uVar31);
      uVar48 = FloatVectorAdd(uVar48,lVar32,2);
      piVar8[0x37] = (int)uVar48;
    }
  }
  uVar49 = CONCAT44((int)((ulonglong)lVar32 >> 0x20),DAT_000579b8);
  uVar31 = (undefined4)((ulonglong)uVar48 >> 0x20);
  uVar50 = CONCAT44(uVar31,DAT_000579bc);
  uVar37 = FloatVectorMult(uVar45,uVar49,2,0x20);
  uVar48 = FloatVectorMult(uVar44,uVar49,2,0x20);
  uVar51 = FloatVectorMult(uVar37,uVar50,2,0x20);
  uVar37 = FloatVectorMult(uVar43,uVar49,2,0x20);
  uVar48 = FloatVectorMult(uVar48,uVar50,2,0x20);
  uVar49 = FloatVectorAdd(uVar51,CONCAT44(uVar11,piVar8[4]),2);
  uVar37 = FloatVectorMult(uVar37,uVar50,2,0x20);
  piVar8[4] = (int)uVar49;
  uVar50 = FloatVectorAdd(uVar48,CONCAT44((int)((ulonglong)uVar49 >> 0x20),piVar8[5]),2);
  piVar8[5] = (int)uVar50;
  uVar50 = FloatVectorAdd(uVar37,CONCAT44(uVar31,piVar8[6]),2);
  piVar8[6] = (int)uVar50;
  iVar17 = FUN_0001d10c((int)uVar50,puVar3);
  if (iVar17 != 0) {
    FUN_0001d10c(puVar3);
    puVar4 = PTR_DAT_004d9094;
    puVar5 = PTR_DAT_004d907c;
    iVar17 = FUN_00063fe0(PTR_DAT_004d907c,*(undefined4 *)PTR_DAT_004d9094);
    if (iVar17 == 1) {
      FUN_0001d10c(puVar3);
      iVar17 = FUN_00063e80(puVar5,*(undefined4 *)puVar4);
      if (2 < *(int *)(iVar17 + 0xc)) {
        uVar50 = CONCAT44(extraout_s1_02,DAT_000579c0);
        uVar49 = FloatVectorMult(CONCAT44(extraout_s3_08,piVar8[10]),uVar50,2,0x20);
        piVar8[10] = (int)uVar49;
        uVar49 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar49 >> 0x20),piVar8[0xb]),uVar50,2,
                                 0x20);
        piVar8[0xb] = (int)uVar49;
        uVar50 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar49 >> 0x20),piVar8[0xc]),uVar50,2,
                                 0x20);
        piVar8[0xc] = (int)uVar50;
        FUN_0000c0b4((int)uVar50,piVar8,0);
      }
    }
  }
  if (-10.0 < (float)uVar41) {
    uVar50 = FloatVectorMax(0,uVar41,2,0x20);
    uVar50 = FloatVectorAdd(uVar50,CONCAT44(0xc1200000,DAT_000579c4),2);
    FUN_0000f274(piVar8,(int)uVar50);
  }
  iVar17 = FUN_0001cd6c();
  if (iVar17 == 1) {
    FUN_0000a654(piVar8,0,0);
    FUN_0000c080(piVar8,param_5);
  }
  return piVar8;
}


```

## FUN_000568f4 — 000568f4

- 函数名: FUN_000568f4
- 函数体: 1749 字节
- 调用者数: 3 / 被调用者数: 10

```c

int * FUN_000568f4(int param_1,int param_2,int param_3)

{
  short sVar1;
  undefined *puVar2;
  undefined *puVar3;
  undefined *puVar4;
  uint *puVar5;
  undefined4 *puVar6;
  int iVar7;
  undefined4 *puVar8;
  int *piVar9;
  undefined4 uVar10;
  int iVar11;
  uint uVar12;
  undefined4 uVar13;
  undefined4 *puVar14;
  int iVar15;
  uint uVar16;
  undefined1 *puVar17;
  undefined1 *puVar18;
  uint uVar19;
  uint uVar20;
  uint uVar21;
  undefined4 *puVar22;
  uint uVar23;
  uint *puVar24;
  uint uVar25;
  uint *puVar26;
  uint *puVar27;
  float fVar30;
  undefined8 in_d0;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  uint extraout_s1_01;
  uint extraout_s1_02;
  longlong lVar31;
  float fVar32;
  undefined4 uVar33;
  undefined8 in_d1;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  uint extraout_s3_01;
  uint extraout_s3_02;
  undefined4 extraout_s3_03;
  longlong lVar34;
  float fVar35;
  undefined8 in_d2;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  undefined4 extraout_s5_01;
  undefined4 extraout_s5_02;
  uint extraout_s5_03;
  undefined4 extraout_s5_04;
  undefined4 extraout_s5_05;
  undefined4 extraout_s5_06;
  undefined4 extraout_s5_07;
  float fVar36;
  undefined8 uVar37;
  undefined4 extraout_s7;
  undefined4 extraout_s7_00;
  undefined4 extraout_s7_01;
  undefined4 extraout_s7_02;
  undefined4 extraout_s7_03;
  undefined4 extraout_s7_04;
  undefined4 extraout_s9;
  undefined4 extraout_s11;
  undefined8 uVar38;
  undefined8 unaff_d8;
  undefined8 uVar39;
  undefined8 uVar40;
  undefined8 unaff_d10;
  undefined8 uVar41;
  undefined8 uVar42;
  undefined8 uVar43;
  undefined8 uVar44;
  undefined8 unaff_d12;
  undefined8 uVar45;
  undefined8 uVar46;
  undefined8 uVar47;
  undefined8 uVar48;
  undefined4 *local_70;
  undefined4 local_6c;
  undefined4 local_68;
  undefined4 local_64;
  uint *puVar28;
  uint *puVar29;
  
  puVar5 = DAT_005a7930;
  fVar30 = DAT_00056c68;
  if (param_2 < 1) {
    return (int *)0x0;
  }
  if (param_3 == 0) {
    uVar47 = 0x3f8000003f800000;
    uVar46 = 0xbf800000bf800000;
    uVar41 = 0;
LAB_0005694c:
    lVar31 = (ulonglong)*DAT_005a7930 * (ulonglong)DAT_005a7930[2];
    uVar12 = (uint)lVar31;
    uVar16 = DAT_005a7930[1] * DAT_005a7930[2] +
             *DAT_005a7930 * DAT_005a7930[3] + (int)((ulonglong)lVar31 >> 0x20) +
             DAT_005a7930[5] + (uint)CARRY4(uVar12,DAT_005a7930[4]);
    uVar10 = (undefined4)((ulonglong)uVar16 * 0x7ffff >> 0x20);
    *DAT_005a7930 = uVar12 + DAT_005a7930[4];
    puVar5[1] = uVar16;
    uVar37 = FixedToFP(CONCAT44(uVar10,uVar10),0,1,0,0x20);
    uVar45 = FloatVectorSub(uVar47,uVar46,2,0x20);
    uVar37 = FloatVectorMult(uVar45,CONCAT44((int)((ulonglong)in_d2 >> 0x20),(float)uVar37 / fVar30)
                             ,2,0x20);
    uVar46 = FloatVectorAdd(uVar46,uVar37,2);
    uVar47 = FloatVectorMult(uVar46,CONCAT44((int)((ulonglong)uVar47 >> 0x20),DAT_00056c6c),2,0x20);
    uVar47 = FPToFixed(uVar47,0,1,3,0x20);
    puVar18 = (undefined1 *)uVar47;
    if (param_3 != 0) goto LAB_000569b8;
    uVar10 = FUN_000251a8();
    uVar47 = FloatVectorMult(CONCAT44(uVar10,uVar10),0xbf000000bf000000,2,0x20);
    uVar47 = FPToFixed(uVar47,0,0,3,0x20);
    local_70 = (undefined4 *)uVar47;
    uVar10 = extraout_s7_02;
    uVar33 = extraout_s5_02;
  }
  else {
    puVar18 = *(undefined1 **)(param_3 + 0x2c);
    uVar41 = CONCAT44((int)((ulonglong)unaff_d10 >> 0x20),*(undefined4 *)(param_3 + 0x80));
    if (puVar18 == &LAB_0001869e_1) {
      uVar46 = CONCAT44((int)((ulonglong)in_d0 >> 0x20),*(undefined4 *)(param_3 + 0x50));
      uVar47 = CONCAT44((int)((ulonglong)in_d1 >> 0x20),*(undefined4 *)(param_3 + 0x54));
      goto LAB_0005694c;
    }
LAB_000569b8:
    puVar17 = *(undefined1 **)(param_3 + 0x30);
    uVar47 = FUN_000251a8();
    iVar11 = (int)((ulonglong)uVar47 >> 0x20);
    uVar47 = FloatVectorMult(CONCAT44((int)uVar47,(int)uVar47),0xbf000000bf000000,2,0x20);
    uVar47 = FPToFixed(uVar47,0,0,3,0x20);
    local_70 = (undefined4 *)uVar47;
    if (puVar17 != &LAB_0001869e_1) {
      local_70 = (undefined4 *)((int)local_70 - *(int *)(param_3 + 0x30));
    }
    iVar7 = *(int *)(param_3 + 0x34);
    if (iVar7 != 0) {
      iVar11 = *(int *)(param_3 + 0x3c);
    }
    uVar10 = extraout_s7;
    uVar33 = extraout_s5;
    if (iVar7 != 0 && iVar11 != 0) {
      uVar46 = FUN_003010b8(iVar7 * 0xb6 & 0xffff);
      iVar11 = (int)((ulonglong)uVar46 >> 0x20);
      uVar47 = FixedToFP(CONCAT44(extraout_s1,*(undefined4 *)(param_3 + 0x3c)),0,0,0,0x20);
      uVar47 = FloatVectorMult(CONCAT44((int)uVar46,(int)uVar46),uVar47,2,0x20);
      uVar47 = FPToFixed(uVar47,0,0,3,0x20);
      local_70 = (undefined4 *)((int)local_70 + (int)uVar47);
      uVar10 = extraout_s7_00;
      uVar33 = extraout_s5_00;
    }
    iVar7 = *(int *)(param_3 + 0x38);
    if (iVar7 != 0) {
      iVar11 = *(int *)(param_3 + 0x3c);
    }
    if (iVar7 != 0 && iVar11 != 0) {
      uVar10 = FUN_003010d0(iVar7 * 0xb6 & 0xffff);
      uVar47 = FixedToFP(CONCAT44(extraout_s1_00,*(undefined4 *)(param_3 + 0x3c)),0,0,0,0x20);
      uVar47 = FloatVectorMult(CONCAT44(uVar10,uVar10),uVar47,2,0x20);
      uVar47 = FPToFixed(uVar47,0,0,3,0x20);
      puVar18 = puVar18 + (int)uVar47;
      uVar10 = extraout_s7_01;
      uVar33 = extraout_s5_01;
    }
  }
  puVar5 = DAT_005a7930;
  fVar30 = DAT_00056c68;
  uVar21 = DAT_005a7930[2];
  uVar25 = DAT_005a7930[3];
  uVar20 = DAT_005a7930[4];
  lVar31 = (ulonglong)*DAT_005a7930 * (ulonglong)uVar21;
  uVar12 = (uint)lVar31;
  uVar23 = DAT_005a7930[5];
  uVar16 = uVar12 + uVar20;
  uVar12 = DAT_005a7930[1] * uVar21 + *DAT_005a7930 * uVar25 + (int)((ulonglong)lVar31 >> 0x20) +
           uVar23 + CARRY4(uVar12,uVar20);
  iVar11 = (int)((ulonglong)uVar12 * 0x7ffff);
  uVar13 = (undefined4)((ulonglong)uVar12 * 0x7ffff >> 0x20);
  *DAT_005a7930 = uVar16;
  puVar5[1] = uVar12;
  uVar47 = FixedToFP(CONCAT44(uVar13,uVar13),0,1,0,0x20);
  uVar13 = (undefined4)((ulonglong)uVar47 >> 0x20);
  uVar46 = CONCAT44(uVar13,(float)uVar47 / fVar30);
  uVar37 = FloatVectorMult(uVar46,0x3fc000003fc00000,2,0x20);
  uVar47 = 0x4120000041200000;
  uVar37 = FloatVectorAdd(uVar37,0x4118000041180000,2);
  if (param_3 != 0) {
    fVar30 = *(float *)(param_3 + 0x40);
    uVar46 = CONCAT44(uVar13,*(float *)(param_3 + 0x44));
    if (fVar30 != 0.0 || (fVar30 != 0.0 || *(float *)(param_3 + 0x44) != 0.0)) {
      lVar31 = CONCAT44(uVar33,*(undefined4 *)(param_3 + 0x48));
      uVar45 = FloatVectorMult(CONCAT44(0x41200000,fVar30),lVar31,2,0x20);
      uVar47 = FloatVectorMult(uVar46,CONCAT44(uVar10,*(undefined4 *)(param_3 + 0x4c)),2,0x20);
      goto LAB_00056bd4;
    }
    puVar14 = &DAT_00056fe0;
    if (1 < *(int *)(param_3 + 0x58)) {
      puVar14 = &DAT_00056fe4;
    }
    uVar47 = CONCAT44(0x41200000,*puVar14);
  }
  uVar45 = FixedToFP(CONCAT44(puVar18,puVar18),0,0,0,0x20);
  uVar19 = (uint)((ulonglong)uVar16 * (ulonglong)uVar21);
  fVar30 = (float)uVar45 / DAT_00056c70;
  *puVar5 = uVar19 + uVar20;
  uVar16 = uVar12 * uVar21 + uVar16 * uVar25 + (int)((ulonglong)uVar16 * (ulonglong)uVar21 >> 0x20)
           + uVar23 + CARRY4(uVar19,uVar20);
  puVar5[1] = uVar16;
  uVar46 = FloatVectorMult(uVar47,CONCAT44((int)((ulonglong)uVar46 >> 0x20),fVar30),2,0x20);
  uVar46 = FPToFixed(uVar46,0,0,3,0x20);
  uVar46 = FixedToFP(uVar46,0,0,0,0x20);
  uVar45 = FloatVectorSub(uVar46,uVar47,2,0x20);
  uVar46 = FloatVectorAdd(uVar47,uVar46,2);
  uVar47 = FPToFixed(uVar45,0,0,3,0x20);
  uVar46 = FPToFixed(uVar46,0,0,3,0x20);
  uVar12 = (int)uVar46 - (int)uVar47;
  if (uVar12 != 0 && uVar12 != 0xffffffff) {
    uVar16 = (uint)((ulonglong)uVar12 * (ulonglong)uVar16 >> 0x20);
  }
  sVar1 = ((short)uVar16 + (short)uVar47) * 0xb6;
  uVar10 = FUN_003010b8(sVar1);
  unaff_d8 = 0x3f8000003f800000;
  if (param_3 != 0) {
    unaff_d8 = CONCAT44(0x3f800000,*(undefined4 *)(param_3 + 0x48));
  }
  uVar45 = FloatVectorMult(uVar37,CONCAT44(uVar10,uVar10),2,0x20);
  uVar38 = FUN_003010d0(sVar1);
  iVar11 = (int)((ulonglong)uVar38 >> 0x20);
  lVar31 = (ulonglong)extraout_s5_03 << 0x20;
  uVar46 = CONCAT44(extraout_s3,DAT_00056c74);
  uVar47 = 0x3f8000003f800000;
  uVar38 = FloatVectorMult(uVar37,CONCAT44((int)uVar38,(int)uVar38),2,0x20);
  if (param_3 != 0) {
    uVar47 = CONCAT44(0x3f800000,*(undefined4 *)(param_3 + 0x4c));
  }
  uVar45 = FloatVectorMult(uVar45,unaff_d8,2,0x20);
  uVar38 = FloatVectorMult(uVar38,uVar46,2,0x20);
  uVar47 = FloatVectorMult(uVar38,uVar47,2,0x20);
LAB_00056bd4:
  puVar5 = DAT_005a7930;
  iVar7 = 0x3f800000;
  if (param_3 != 0) {
    iVar7 = *(int *)(param_3 + 0x14);
  }
  uVar44 = CONCAT44((int)((ulonglong)uVar46 >> 0x20),DAT_0052bf04);
  uVar48 = CONCAT44((int)((ulonglong)lVar31 >> 0x20),DAT_0052bf08);
  uVar42 = FloatVectorNeg(uVar44,2,2);
  uVar39 = FloatVectorNeg(uVar48,2,2);
  uVar43 = FloatVectorNeg(CONCAT44(0x3f800000,DAT_0052bf00),2,2);
  uVar46 = CONCAT44((int)((ulonglong)unaff_d12 >> 0x20),DAT_0052bf80);
  uVar38 = CONCAT44((int)((ulonglong)unaff_d8 >> 0x20),DAT_0052bf84);
  puVar14 = &DAT_0052bf80;
  uVar40 = uVar45;
  if (param_3 == 0) {
    puVar22 = (undefined4 *)0x0;
  }
  else {
    puVar22 = *(undefined4 **)(param_3 + 0x58);
    iVar11 = (int)puVar22 + -1;
    puVar8 = (undefined4 *)0x3;
    puVar6 = (undefined4 *)0x2;
    switch(puVar22) {
    case (undefined4 *)0x1:
      puVar22 = (undefined4 *)0x1;
      uVar38 = FloatVectorNeg(uVar38,2,2);
      uVar46 = FloatVectorNeg(uVar46,2,2);
      uVar47 = FloatVectorMult(uVar47,0x3f0000003f000000,2,0x20);
      puVar14 = puVar8;
      uVar39 = uVar48;
      uVar42 = uVar44;
      uVar43 = CONCAT44(0x3f800000,DAT_0052bf00);
      break;
    case (undefined4 *)0x4:
      puVar24 = DAT_005a7930 + 2;
      uVar12 = *DAT_005a7930;
      puVar26 = DAT_005a7930 + 1;
      puVar27 = DAT_005a7930 + 3;
      puVar28 = DAT_005a7930 + 4;
      puVar29 = DAT_005a7930 + 5;
      lVar31 = (ulonglong)uVar12 * (ulonglong)*puVar24;
      uVar16 = (uint)lVar31;
      *DAT_005a7930 = uVar16 + *puVar28;
      uVar12 = *puVar26 * *puVar24 + uVar12 * *puVar27 + (int)((ulonglong)lVar31 >> 0x20) +
               *puVar29 + (uint)CARRY4(uVar16,*puVar28);
      puVar5[1] = uVar12;
      puVar8 = (undefined4 *)0x2;
      if ((int)uVar12 < 0) {
        puVar8 = (undefined4 *)0x3;
      }
    case (undefined4 *)0x3:
      uVar38 = 0x3f8000003f800000;
      uVar43 = CONCAT44((int)((ulonglong)uVar43 >> 0x20),DAT_0052c000);
      uVar42 = CONCAT44((int)((ulonglong)uVar42 >> 0x20),DAT_0052c004);
      uVar39 = CONCAT44((int)((ulonglong)uVar39 >> 0x20),DAT_0052c008);
      puVar6 = puVar8;
      uVar46 = uVar38;
    case (undefined4 *)0x2:
      puVar22 = puVar6;
      uVar40 = FixedToFP(CONCAT44(puVar18,puVar18),0,0,0,0x20);
      uVar10 = FUN_00025164();
      uVar44 = FixedToFP(CONCAT44(-(int)local_70,-(int)local_70),0,0,0,0x20);
      fVar30 = (float)FUN_000251a8();
      uVar44 = FloatVectorMult(uVar44,CONCAT44(uVar10,uVar10),2,0x20);
      uVar10 = FUN_000251a8();
      uVar40 = FloatVectorMult(uVar40,CONCAT44(uVar10,uVar10),2,0x20);
      uVar48 = FUN_00025164();
      iVar11 = (int)((ulonglong)uVar48 >> 0x20);
      uVar44 = FPToFixed(CONCAT44(extraout_s3_00,(float)uVar44 / fVar30),0,0,3,0x20);
      uVar40 = FPToFixed(CONCAT44((float)uVar48,(float)uVar40 / (float)uVar48),0,0,3,0x20);
      puVar18 = (undefined1 *)uVar44;
      local_70 = (undefined4 *)uVar40;
      uVar10 = (undefined4)((ulonglong)uVar40 >> 0x20);
      uVar37 = FloatVectorMult(uVar37,CONCAT44(uVar10,*(undefined4 *)(param_3 + 0x24)),2,0x20);
      uVar37 = FloatVectorMult(uVar37,CONCAT44(uVar10,DAT_00056fe8),2,0x20);
      uVar40 = FloatVectorMult(uVar47,0xbf400000bf400000,2,0x20);
      uVar47 = FloatVectorAdd(uVar45,uVar37,2);
      puVar14 = local_70;
      if (puVar22 == (undefined4 *)0x2) {
        uVar46 = 0xbf800000bf800000;
        uVar38 = 0x3f8000003f800000;
        puVar22 = (undefined4 *)0x2;
        uVar43 = FloatVectorNeg(CONCAT44((int)((ulonglong)uVar44 >> 0x20),DAT_0052c000),2,2);
        uVar42 = FloatVectorNeg(CONCAT44(extraout_s5_04,DAT_0052c004),2,2);
        uVar39 = FloatVectorNeg(CONCAT44(extraout_s7_03,DAT_0052c008),2,2);
        puVar14 = &DAT_0052c000;
      }
    }
  }
  uVar10 = FUN_000065c4(puVar14,iVar11);
  piVar9 = (int *)FUN_0000698c(uVar10,2,1);
  uVar37 = FPToFixed(uVar46,0,0,3,0x20);
  uVar45 = FloatVectorMult(uVar46,uVar40,2,0x20);
  uVar46 = FPToFixed(uVar38,0,0,3,0x20);
  uVar47 = FloatVectorMult(uVar38,uVar47,2,0x20);
  iVar11 = (int)puVar18 * (int)uVar37;
  uVar37 = CONCAT44(extraout_s9,*(undefined4 *)(param_1 + 100));
  iVar15 = (int)local_70 * (int)uVar46;
  uVar38 = FloatVectorMult(CONCAT44(extraout_s11,DAT_0052bf80),uVar37,2,0x20);
  uVar46 = FloatVectorMult(uVar37,CONCAT44(extraout_s5_05,DAT_0052bf88),2,0x20);
  uVar37 = FloatVectorMult(uVar37,CONCAT44(extraout_s7_04,DAT_0052bf84),2,0x20);
  local_6c = (undefined4)uVar38;
  local_68 = (undefined4)uVar37;
  uVar37 = FixedToFP(CONCAT44(iVar15,iVar15),0,0,0,0x20);
  local_64 = (undefined4)uVar46;
  uVar46 = FixedToFP(CONCAT44(iVar11,iVar11),0,0,0,0x20);
  piVar9[4] = (int)uVar46;
  piVar9[5] = (int)uVar37;
  piVar9[6] = 0x42000000;
  piVar9[9] = 0;
  piVar9[7] = (int)uVar45;
  piVar9[8] = (int)uVar47;
  (**(code **)(*piVar9 + 8))((int)uVar47,piVar9,0,0,&local_6c);
  piVar9[0x32] = iVar7;
  puVar2 = PTR_DAT_004d9048;
  iVar11 = FUN_0001d10c(iVar7,PTR_DAT_004d9048);
  lVar34 = (ulonglong)extraout_s3_01 << 0x20;
  lVar31 = (ulonglong)extraout_s1_01 << 0x20;
  uVar10 = extraout_s5_06;
  if (iVar11 != 0) {
    FUN_0001d10c(puVar2);
    puVar4 = PTR_DAT_004d907c;
    puVar3 = PTR_DAT_004d9078;
    iVar11 = FUN_00063fe0(PTR_DAT_004d907c,*(undefined4 *)PTR_DAT_004d9078);
    lVar34 = (ulonglong)extraout_s3_02 << 0x20;
    lVar31 = (ulonglong)extraout_s1_02 << 0x20;
    uVar10 = extraout_s5_07;
    if (iVar11 == 1) {
      FUN_0001d10c(puVar2);
      iVar11 = FUN_00063e80(puVar4,*(undefined4 *)puVar3);
      uVar10 = 0xbf800000;
      lVar31 = 0x4040000040400000;
      if (*(float *)(iVar11 + 0x10) != -1.0) {
        lVar31 = CONCAT44(0x40400000,*(float *)(iVar11 + 0x10));
      }
      uVar47 = FloatVectorMult(CONCAT44(extraout_s3_03,piVar9[10]),lVar31,2,0x20);
      piVar9[10] = (int)uVar47;
      uVar47 = FloatVectorMult(lVar31,CONCAT44((int)((ulonglong)uVar47 >> 0x20),piVar9[0xb]),2,0x20)
      ;
      piVar9[0xb] = (int)uVar47;
      uVar47 = FloatVectorMult(lVar31,CONCAT44((int)((ulonglong)uVar47 >> 0x20),piVar9[0xc]),2,0x20)
      ;
      piVar9[0xc] = (int)uVar47;
      iVar7 = piVar9[0xe];
      if (iVar7 != 0) {
        uVar47 = CONCAT44((int)((ulonglong)uVar47 >> 0x20),DAT_00056fec);
      }
      uVar46 = FloatVectorMult(lVar31,uVar47,2,0x20);
      lVar34 = FloatVectorMult(uVar46,CONCAT44((int)((ulonglong)uVar47 >> 0x20),
                                               *(undefined4 *)(iVar7 + 0x14)),2,0x20);
      if (iVar7 != 0) {
        *(int *)(iVar7 + 0x14) = (int)lVar34;
      }
      *(int *)(iVar11 + 0x10) = (int)lVar31;
      *(undefined1 *)(piVar9 + 0x35) = 1;
    }
  }
  if (param_3 != 0) {
    fVar36 = (float)piVar9[0x28];
    uVar13 = (undefined4)((ulonglong)lVar34 >> 0x20);
    fVar35 = *(float *)(param_3 + 0x28);
    fVar30 = -(fVar36 * *(float *)(param_3 + 0x20));
    lVar31 = CONCAT44((int)((ulonglong)lVar31 >> 0x20),fVar30);
    fVar32 = -(fVar36 * *(float *)(param_3 + 0x24));
    lVar34 = CONCAT44(uVar13,fVar32);
    piVar9[0x27] = (int)fVar30;
    piVar9[0x28] = (int)fVar32;
    piVar9[0x29] = (int)-(fVar36 * fVar35);
    uVar33 = DAT_00056ff0;
    if ((puVar22 == (undefined4 *)0x3) || (uVar33 = DAT_00056ff4, puVar22 == (undefined4 *)0x2)) {
      lVar34 = CONCAT44(uVar13,uVar33);
      lVar31 = FloatVectorAdd(lVar31,lVar34,2);
      piVar9[0x27] = (int)lVar31;
    }
  }
  uVar46 = CONCAT44(uVar10,piVar9[0xb]);
  uVar47 = CONCAT44((int)((ulonglong)lVar31 >> 0x20),DAT_00056ff8);
  uVar37 = FloatVectorMult(uVar43,uVar46,2,0x20);
  uVar45 = FloatVectorMult(uVar42,uVar46,2,0x20);
  uVar38 = FloatVectorMult(uVar37,uVar47,2,0x20);
  uVar45 = FloatVectorMult(uVar45,uVar47,2,0x20);
  uVar37 = FloatVectorMult(uVar39,uVar46,2,0x20);
  uVar46 = FloatVectorAdd(CONCAT44((int)((ulonglong)lVar34 >> 0x20),piVar9[4]),uVar38,2);
  uVar37 = FloatVectorMult(uVar37,uVar47,2,0x20);
  piVar9[4] = (int)uVar46;
  uVar47 = FloatVectorAdd(uVar45,CONCAT44((int)((ulonglong)uVar46 >> 0x20),piVar9[5]),2);
  piVar9[5] = (int)uVar47;
  uVar47 = FloatVectorAdd(uVar37,CONCAT44((int)((ulonglong)uVar47 >> 0x20),piVar9[6]),2);
  piVar9[6] = (int)uVar47;
  if (-10.0 < (float)uVar41) {
    uVar47 = FloatVectorMax(0,uVar41,2,0x20);
    uVar47 = FloatVectorAdd(uVar47,CONCAT44(0xc1200000,DAT_00056ffc),2);
    FUN_00008a50(piVar9,(int)uVar47);
  }
  return piVar9;
}


```

