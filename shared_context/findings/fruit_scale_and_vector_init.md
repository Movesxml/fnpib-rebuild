# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0000bd54 — 0000bd54

- 函数名: FUN_0000bd54
- 函数体: 409 字节
- 调用者数: 2 / 被调用者数: 3

```c

undefined4 FUN_0000bd54(int param_1,uint param_2,undefined4 param_3)

{
  int iVar1;
  int *piVar2;
  int iVar3;
  bool bVar4;
  uint uVar5;
  undefined8 in_d0;
  undefined4 uVar7;
  undefined4 extraout_s1;
  ulonglong uVar6;
  uint extraout_s1_00;
  undefined8 in_d1;
  undefined4 uVar9;
  undefined4 extraout_s3;
  longlong lVar8;
  uint extraout_s3_00;
  undefined8 in_d2;
  undefined4 uVar10;
  undefined4 extraout_s5;
  undefined4 in_s7;
  undefined4 extraout_s7;
  undefined8 uVar11;
  undefined8 unaff_d9;
  undefined8 uVar12;
  undefined8 uVar13;
  undefined8 uVar14;
  undefined8 uVar15;
  undefined8 uVar16;
  undefined8 uVar17;
  
  uVar9 = (undefined4)((ulonglong)in_d1 >> 0x20);
  uVar10 = (undefined4)((ulonglong)in_d2 >> 0x20);
  uVar7 = (undefined4)((ulonglong)in_d0 >> 0x20);
  uVar11 = CONCAT44(param_3,param_3);
  *(char *)(param_1 + 0x3c) = (char)param_2;
  if ((int)param_2 < 0) {
    bVar4 = false;
    *(undefined1 *)(param_1 + 0xc1) = 0;
  }
  else {
    iVar3 = *(int *)(param_2 * 0x338 + DAT_005d4cdc + 0x250);
    iVar1 = FUN_002f69c4("super_pomegranate",0x11);
    *(bool *)(param_1 + 0xc1) = iVar3 == iVar1;
    iVar3 = *(int *)(param_2 * 0x338 + DAT_005d4cdc + 0x250);
    iVar1 = FUN_002f69c4("super_chest",0xb);
    param_2 = (uint)*(byte *)(param_1 + 0x3c);
    bVar4 = iVar3 == iVar1;
    in_s7 = extraout_s7;
    uVar7 = extraout_s1;
    uVar10 = extraout_s5;
    uVar9 = extraout_s3;
  }
  *(bool *)(param_1 + 0xc2) = bVar4;
  iVar1 = DAT_005d4cdc;
  uVar12 = CONCAT44((int)((ulonglong)unaff_d9 >> 0x20),DAT_0000bef4);
  iVar3 = (param_2 & 0xff) * 0x338 + DAT_005d4cdc;
  uVar14 = CONCAT44(uVar10,*(undefined4 *)(iVar3 + 0x244));
  uVar13 = FloatVectorMult(CONCAT44(uVar7,DAT_0052bf80),uVar14,2,0x20);
  uVar15 = FloatVectorMult(uVar14,CONCAT44(uVar9,DAT_0052bf84),2,0x20);
  uVar17 = CONCAT44(uVar7,DAT_0000bef0);
  uVar16 = FloatVectorMult(uVar14,CONCAT44(in_s7,DAT_0052bf88),2,0x20);
  uVar14 = FloatVectorMult(uVar13,uVar17,2,0x20);
  uVar13 = FloatVectorMult(uVar15,uVar17,2,0x20);
  uVar17 = FloatVectorMult(uVar16,uVar17,2,0x20);
  uVar14 = FloatVectorMult(uVar14,uVar11,2,0x20);
  uVar13 = FloatVectorMult(uVar13,uVar11,2,0x20);
  uVar17 = FloatVectorMult(uVar17,uVar11,2,0x20);
  *(int *)(param_1 + 0x28) = (int)uVar14;
  *(int *)(param_1 + 0x2c) = (int)uVar13;
  *(int *)(param_1 + 0x30) = (int)uVar17;
  *(int *)(param_1 + 0xe8) = (int)uVar14;
  *(int *)(param_1 + 0xec) = (int)uVar13;
  *(int *)(param_1 + 0xf0) = (int)uVar17;
  lVar8 = CONCAT44((int)((ulonglong)uVar14 >> 0x20),*(undefined4 *)(iVar3 + 0x244));
  uVar14 = FloatVectorMult(lVar8,uVar12,2,0x20);
  piVar2 = *(int **)(param_1 + 0x38);
  uVar6 = FloatVectorAdd(uVar14,CONCAT44((int)((ulonglong)uVar17 >> 0x20),
                                         *(undefined4 *)(iVar3 + 0x248)),2);
  if ((float)uVar6 <= 0.0) {
    if (piVar2 != (int *)0x0) {
      uVar5 = (**(code **)(*piVar2 + 4))(piVar2);
      uVar6 = (ulonglong)uVar5;
      *(undefined4 *)(param_1 + 0x38) = 0;
    }
  }
  else {
    if (piVar2 == (int *)0x0) {
      piVar2 = operator_new(0x20);
      FUN_002ed28c();
      lVar8 = (ulonglong)extraout_s3_00 << 0x20;
      uVar6 = (ulonglong)extraout_s1_00 << 0x20;
      *(int **)(param_1 + 0x38) = piVar2;
      iVar1 = DAT_005d4cdc;
    }
    iVar3 = *(int *)(param_1 + 0x14);
    piVar2[1] = *(int *)(param_1 + 0x10);
    piVar2[2] = iVar3;
    piVar2[3] = 0;
    iVar1 = (uint)*(byte *)(param_1 + 0x3c) * 0x338 + iVar1;
    uVar17 = FloatVectorMult(CONCAT44((int)((ulonglong)lVar8 >> 0x20),*(undefined4 *)(iVar1 + 0x244)
                                     ),uVar12,2,0x20);
    uVar17 = FloatVectorAdd(uVar17,CONCAT44((int)(uVar6 >> 0x20),*(undefined4 *)(iVar1 + 0x248)),2);
    uVar6 = FloatVectorMult(uVar17,uVar11,2,0x20);
    piVar2[5] = (int)uVar6;
  }
  return (int)uVar6;
}


```

## FUN_00009794 — 00009794

- 函数名: FUN_00009794
- 函数体: 827 字节
- 调用者数: 0 / 被调用者数: 2

```c

void FUN_00009794(void)

{
  undefined *puVar1;
  
  puVar1 = PTR___mh_execute_header_004d9040;
  DAT_00556aac = 0x3f800000;
  *(int *)PTR_DAT_004d901c = *(int *)PTR_DAT_004d901c + 1;
  DAT_00556ab0 = 0x3f800000;
  DAT_00556ab4 = 0x3f800000;
  DAT_00556ab8 = 0x3f800000;
  DAT_00556abc = 0x3f800000;
  DAT_00556ac0 = 0xbf800000;
  DAT_00556ac4 = 0x3f800000;
  DAT_00556ac8 = 0xbf800000;
  DAT_00556acc = 0x3f800000;
  DAT_00556ad0 = 0x3f800000;
  DAT_00556ad4 = 0xbf800000;
  DAT_00556ad8 = 0xbf800000;
  DAT_00556adc = 0xbf800000;
  DAT_00556ae0 = 0x3f800000;
  DAT_00556ae4 = 0x3f800000;
  DAT_00556ae8 = 0xbf800000;
  DAT_00556aec = 0x3f800000;
  DAT_00556af0 = 0xbf800000;
  DAT_00556af4 = 0xbf800000;
  DAT_00556af8 = 0xbf800000;
  DAT_00556afc = 0x3f800000;
  DAT_00556b00 = 0xbf800000;
  DAT_00556b04 = 0xbf800000;
  DAT_00556b08 = 0xbf800000;
  ___cxa_atexit(&FUN_0000974c_1,0,puVar1);
  DAT_00556a83 = 0xff;
  DAT_00556a82 = 0;
  DAT_00556a81 = 0;
  DAT_00556a80 = 0;
  FUN_002f69c4("PASSED",6);
  DAT_00556a94 = 0;
  DAT_00556a98 = 0;
  ___cxa_atexit(&LAB_00009750_1,0,puVar1);
  DAT_00556a84 = 0;
  ___cxa_atexit(&FUN_00009ad0_1,&DAT_00556a84,puVar1);
  DAT_00556a88 = 0;
  ___cxa_atexit(&FUN_000063f0_1,&DAT_00556a88,puVar1);
  DAT_00556a9c = 0;
  DAT_00556aa0 = 0;
  ___cxa_atexit(&LAB_00009770_1,0,puVar1);
  DAT_00556a8c = 0;
  ___cxa_atexit(&FUN_000063f0_1,&DAT_00556a8c,puVar1);
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
  if ((DAT_0052c510 & 1) == 0) {
    DAT_0052bf00 = 0;
    DAT_0052bf04 = 0x3f800000;
    DAT_0052bf08 = 0;
    DAT_0052c510 = 1;
  }
  if ((DAT_0052bf10 & 1) == 0) {
    DAT_0052ce60 = 0;
    DAT_0052ce64 = 0;
    DAT_0052ce68 = 0x3f800000;
    DAT_0052bf10 = 1;
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

## FUN_00053cb8 — 00053cb8

- 函数名: FUN_00053cb8
- 函数体: 2859 字节
- 调用者数: 1 / 被调用者数: 25

```c

void FUN_00053cb8(int param_1,undefined4 param_2,int param_3)

{
  undefined4 *puVar1;
  float *pfVar2;
  float *pfVar3;
  float *pfVar4;
  float *pfVar5;
  float *pfVar6;
  float *pfVar7;
  float *pfVar8;
  float *pfVar9;
  float *pfVar10;
  float *pfVar11;
  float *pfVar12;
  undefined1 *puVar13;
  byte *pbVar14;
  char cVar15;
  int *piVar16;
  undefined1 uVar17;
  byte bVar18;
  int *piVar19;
  int iVar20;
  int iVar21;
  int iVar22;
  int iVar23;
  int *piVar24;
  void *pvVar25;
  undefined4 *puVar26;
  int iVar27;
  size_t sVar28;
  ulong uVar29;
  undefined4 uVar30;
  int *piVar31;
  undefined4 *puVar32;
  uint uVar33;
  uint uVar34;
  undefined4 *puVar35;
  char *pcVar36;
  string *psVar37;
  string *this;
  undefined4 *puVar38;
  string *psVar39;
  bool bVar40;
  undefined4 extraout_s1;
  undefined4 extraout_s3;
  undefined8 uVar41;
  int local_50;
  int local_48;
  int *local_44;
  double local_40;
  double local_38;
  double local_30;
  
  piVar19 = operator_new(0x48);
  FUN_0030cda0(piVar19,param_2);
  if (piVar19 != (int *)0x0) {
    iVar20 = FUN_0030ceac(piVar19,0);
    if (iVar20 == 1) {
      FUN_0030c328(piVar19,"waveManagerFile");
      iVar20 = FUN_0030c300();
      iVar21 = param_1 + param_3 * 0x40;
      pfVar2 = (float *)(iVar21 + 0xe0);
      *pfVar2 = 0.0;
      piVar31 = (int *)(iVar21 + 0xe8);
      *piVar31 = 0;
      puVar32 = (undefined4 *)(iVar21 + 0xec);
      *puVar32 = 0xffffffff;
      puVar38 = (undefined4 *)(iVar21 + 0xb0);
      *puVar38 = 10;
      pfVar3 = (float *)(iVar21 + 0xb4);
      *pfVar3 = 0.25;
      pfVar4 = (float *)(iVar21 + 0xb8);
      *pfVar4 = 1.0;
      pfVar5 = (float *)(iVar21 + 0xbc);
      *pfVar5 = 1.0;
      pfVar6 = (float *)(iVar21 + 0xc0);
      *pfVar6 = 0.0;
      pfVar7 = (float *)(iVar21 + 0xc4);
      *pfVar7 = 0.0;
      pfVar8 = (float *)(iVar21 + 0xd0);
      *pfVar8 = 0.0;
      pfVar9 = (float *)(iVar21 + 0xd4);
      *pfVar9 = 0.0;
      pfVar10 = (float *)(iVar21 + 0xd8);
      *pfVar10 = 0.0;
      pfVar11 = (float *)(iVar21 + 200);
      *pfVar11 = 2.0;
      pfVar12 = (float *)(iVar21 + 0xcc);
      *pfVar12 = 0.0;
      puVar35 = (undefined4 *)(iVar21 + 0xe4);
      *puVar35 = 100;
      puVar13 = (undefined1 *)(iVar21 + 0xdc);
      *puVar13 = 1;
      pbVar14 = (byte *)(iVar21 + 0xdd);
      *pbVar14 = 1;
      if (iVar20 != 0) {
        iVar22 = param_1 + param_3 * 4;
        local_50 = 0;
        do {
          pcVar36 = (char *)(*(int *)(iVar20 + 0x20) + 8);
          iVar23 = _strcmp(pcVar36,"WaveInfo");
          if (iVar23 == 0) {
            piVar24 = operator_new(0xc4);
            FUN_00058ee4(piVar24,puVar38);
            piVar24[0x2a] = local_50;
            local_48 = -1;
            local_44 = piVar24;
            FUN_0030c6c0(iVar20,"waveNo",&local_48);
            if (-1 < local_48) {
              *local_44 = local_48;
            }
            FUN_0030c6c0(iVar20,"overideProbabiltyPool",local_44 + 0x2c);
            pcVar36 = (char *)FUN_0030c660(iVar20,"until");
            cVar15 = '\0';
            if (pcVar36 != (char *)0x0) {
              cVar15 = *pcVar36;
            }
            if (pcVar36 != (char *)0x0 && cVar15 != '\0') {
              iVar23 = _strcmp(pcVar36,"forever");
              if (iVar23 == 0) {
                local_44[1] = -2;
              }
              else {
                iVar23 = _atoi(pcVar36);
                if ((-1 < iVar23) && (*local_44 <= iVar23)) {
                  local_44[1] = iVar23;
                }
              }
            }
            local_48 = -1;
            FUN_0030c6c0(iVar20,"chance",&local_48);
            piVar24 = local_44;
            if (-1 < local_48) {
              local_44[0x1f] = local_48;
            }
            iVar23 = FUN_0030c718(iVar20,"criticalChance",&local_30);
            piVar16 = local_44;
            if (iVar23 == 0) {
              piVar24[0x29] = (int)(float)local_30;
            }
            iVar23 = FUN_0030c718(iVar20,"chanceRegrowth",&local_30);
            if (iVar23 == 0) {
              piVar16[0x21] = (int)(float)local_30;
            }
            FUN_0030c6c0(iVar20,"games",local_44 + 0x23);
            FUN_0030c6c0(iVar20,"gamesMin",local_44 + 0x23);
            FUN_0030c6c0(iVar20,"gamesMax",local_44 + 0x24);
            local_44[0x2f] = 0;
            FUN_0030c6c0(iVar20,"ignoreTimes",local_44 + 0x2f);
            uVar33 = local_44[0x24];
            uVar34 = local_44[0x23];
            if (0x7fffffff < (uint)local_44[0x23]) {
              local_44[0x23] = uVar33;
              uVar34 = uVar33;
            }
            if (0x7fffffff < uVar33) {
              local_44[0x24] = uVar34;
            }
            iVar23 = FUN_0030c660(iVar20,"excludeTag");
            if (iVar23 != 0) {
              pvVar25 = operator_new(8);
              FUN_00058108(pvVar25,iVar23);
              local_44[0x30] = (int)pvVar25;
            }
            iVar23 = FUN_0030c328(iVar20,"coin_chances");
            if (iVar23 != 0) {
              puVar26 = operator_new(8);
              *puVar26 = 0;
              puVar26[1] = 0;
              local_44[0x2b] = (int)puVar26;
              FUN_0005326c(local_44[0x2b],iVar23);
            }
            iVar23 = FUN_0030c328(iVar20,"Spawn");
            iVar27 = FUN_002f69c4("Spawn",5);
            for (; piVar24 = local_44, iVar23 != 0; iVar23 = FUN_0030c378(iVar23)) {
              pcVar36 = (char *)(*(int *)(iVar23 + 0x20) + 8);
              sVar28 = _strlen(pcVar36);
              uVar41 = FUN_002f69c4(pcVar36,sVar28);
              bVar40 = (int)uVar41 == iVar27;
              if (bVar40) {
                uVar41 = CONCAT44(local_44[0x13] + 1,local_44);
              }
              if (bVar40) {
                *(int *)((int)uVar41 + 0x4c) = (int)((ulonglong)uVar41 >> 0x20);
              }
            }
            uVar33 = local_44[0x13];
            uVar34 = (uint)((ulonglong)uVar33 * 0x90);
            uVar29 = uVar34 + 8;
            if ((int)((ulonglong)uVar33 * 0x90 >> 0x20) != 0 || uVar29 < uVar34) {
              uVar29 = 0xffffffff;
            }
            puVar26 = operator_new__(uVar29);
            *puVar26 = 0x90;
            puVar26[1] = uVar33;
            if (uVar33 != 0) {
              iVar23 = 0;
              do {
                iVar27 = iVar23 + 0x90;
                *(undefined4 *)((int)puVar26 + iVar23 + 0xc) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x10) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x14) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x1c) = 0x3f800000;
                *(undefined1 *)((int)puVar26 + iVar23 + 0x95) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x28) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x2c) = 0xbf800000;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x30) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x18) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x88) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 8) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x7c) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x78) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x74) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x70) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x6c) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x68) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 100) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x58) = 0xbf800000;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x5c) = 0x3f800000;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x60) = 0;
                *(undefined1 **)((int)puVar26 + iVar23 + 0x38) = &LAB_0001869e_1;
                *(undefined1 **)((int)puVar26 + iVar23 + 0x34) = &LAB_0001869e_1;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x4c) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x48) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x44) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x40) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x3c) = 0;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x50) = 0x3f800000;
                *(undefined4 *)((int)puVar26 + iVar23 + 0x54) = 0x3f800000;
                *(undefined1 *)((int)puVar26 + iVar23 + 0x94) = 0;
                iVar23 = iVar27;
                piVar24 = local_44;
              } while (uVar33 * 0x90 - iVar27 != 0);
            }
            piVar24[0x12] = (int)(puVar26 + 2);
            iVar23 = FUN_0030c328(iVar20,"Spawn");
            if (iVar23 != 0) {
              iVar27 = local_44[0x12];
              do {
                FUN_000537ec(iVar23,iVar27);
                iVar23 = FUN_0030c3a0(iVar23,"Spawn");
                puVar26 = (undefined4 *)(iVar27 + 0x5c);
                puVar1 = (undefined4 *)(iVar27 + 100);
                iVar27 = iVar27 + 0x90;
                uVar41 = FloatVectorAdd(CONCAT44(extraout_s1,*puVar26),CONCAT44(extraout_s3,*puVar1)
                                        ,2);
                uVar41 = FloatVectorMult(uVar41,0x3f0000003f000000,2,0x20);
                uVar41 = FloatVectorAdd(uVar41,0x3f0000003f000000,2);
                uVar41 = FPToFixed(uVar41,0,0,3,0x20);
                local_44[0x2d] = (int)uVar41 + local_44[0x2d];
              } while (iVar23 != 0);
            }
            iVar23 = FUN_0030c328(iVar20,"Wave_dt");
            piVar24 = local_44;
            if (iVar23 != 0) {
              iVar27 = FUN_0030c718(iVar23,"dt",&local_30);
              piVar16 = local_44;
              if (iVar27 == 0) {
                piVar24[0x14] = (int)(float)local_30;
              }
              iVar27 = FUN_0030c718(iVar23,"inc",&local_30);
              piVar24 = local_44;
              if (iVar27 == 0) {
                piVar16[0x15] = (int)(float)local_30;
              }
              iVar23 = FUN_0030c718(iVar23,"spinc",&local_40);
              if (iVar23 == 0) {
                piVar24[0x16] = (int)(float)local_40;
              }
            }
            iVar23 = FUN_0030c328(iVar20,"NextWaveDelay");
            piVar24 = local_44;
            if (iVar23 != 0) {
              iVar27 = FUN_0030c718(iVar23,"wait",&local_30);
              piVar16 = local_44;
              if (iVar27 == 0) {
                piVar24[0x1a] = (int)(float)local_30;
              }
              iVar27 = FUN_0030c718(iVar23,"waitSpinc",&local_30);
              piVar24 = local_44;
              if (iVar27 == 0) {
                piVar16[0x1c] = (int)(float)local_30;
              }
              iVar27 = FUN_0030c718(iVar23,"speedLoss",&local_30);
              piVar16 = local_44;
              if (iVar27 == 0) {
                piVar24[0x17] = (int)(float)local_30;
              }
              if (0.0 < (float)local_44[0x1a]) {
                local_44[0x18] = 0;
                local_44[0x19] = 0;
              }
              iVar27 = FUN_0030c718(iVar23,"delay",&local_30);
              piVar24 = local_44;
              if (iVar27 == 0) {
                piVar16[0x18] = (int)(float)local_30;
              }
              iVar27 = FUN_0030c718(iVar23,"inc",&local_30);
              if (iVar27 == 0) {
                piVar24[0x19] = (int)(float)local_30;
              }
              iVar27 = FUN_0030c660(iVar23,"waitForEntities");
              if (iVar27 != 0) {
                bVar18 = FUN_00039580(iVar27,"false");
                *(byte *)(local_44 + 0x1e) = bVar18 ^ 1;
              }
              iVar23 = FUN_0030c660(iVar23,"waitForProcessing");
              if (iVar23 != 0) {
                bVar18 = FUN_00039580(iVar23,"false");
                *(byte *)((int)local_44 + 0x79) = bVar18 ^ 1;
              }
            }
            iVar23 = FUN_0030c328(iVar20,"ChooseFrom");
            piVar24 = local_44;
            psVar39 = (string *)local_44[0x26];
            psVar37 = (string *)local_44[0x25];
            for (this = psVar37; psVar39 != this; this = this + 4) {
              std::string::~string(this);
            }
            piVar24[0x26] = (int)psVar37;
            local_50 = local_50 + 1;
            local_44[0x28] = 0;
            if (iVar23 != 0) {
              uVar30 = FUN_0030c660(iVar23,"types");
              FUN_000395ac(uVar30,local_44 + 0x25);
            }
            pcVar36 = (char *)FUN_0030c660(iVar20,"debugName");
            if (pcVar36 == (char *)0x0) {
              _sprintf((char *)(local_44 + 2),"waveNo. %i",local_44[0x2a]);
            }
            else {
              _strcpy((char *)(local_44 + 2),pcVar36);
            }
            if (param_3 == 1) {
              iVar23 = param_1 + *piVar31 * 0x24 + *(int *)(param_1 + 0x164) * 0xc + 0x140;
            }
            else {
              iVar23 = param_1 + *piVar31 * 0x18 + param_3 * 0xc + 0x98;
            }
            FUN_00058588(iVar23,&local_44);
          }
          else {
            iVar23 = _strcmp(pcVar36,"defaults");
            if (iVar23 == 0) {
              *pfVar2 = 0.0;
              *piVar31 = 0;
              *puVar32 = 0xffffffff;
              *puVar38 = 10;
              *pfVar3 = 0.25;
              *pfVar4 = 1.0;
              *pfVar5 = 1.0;
              *pfVar6 = 0.0;
              *pfVar7 = 0.0;
              *pfVar8 = 0.0;
              *pfVar9 = 0.0;
              *pfVar10 = 0.0;
              *pfVar11 = 2.0;
              *pfVar12 = 0.0;
              *puVar35 = 100;
              *puVar13 = 1;
              *pbVar14 = 1;
              FUN_0030c6c0(iVar20,"waveChance");
              iVar23 = FUN_0030c718(iVar20,"waveChanceRegrowth",&local_30);
              if (iVar23 == 0) {
                *pfVar3 = (float)local_30;
              }
              iVar23 = FUN_0030c718(iVar20,"criticalChance",&local_30);
              if (iVar23 == 0) {
                *pfVar4 = (float)local_30;
              }
              iVar23 = FUN_0030c718(iVar20,"dt",&local_30);
              if (iVar23 == 0) {
                *pfVar5 = (float)local_30;
              }
              iVar23 = FUN_0030c718(iVar20,"dtInc",&local_30);
              if (iVar23 == 0) {
                *pfVar6 = (float)local_30;
              }
              iVar23 = FUN_0030c718(iVar20,"dtSpInc",&local_30);
              if (iVar23 == 0) {
                *pfVar7 = (float)local_30;
              }
              iVar23 = FUN_0030c718(iVar20,"beforeDelay",&local_30);
              if (iVar23 == 0) {
                *pfVar11 = (float)local_30;
              }
              iVar23 = FUN_0030c718(iVar20,"beforeDelayInc",&local_30);
              if (iVar23 == 0) {
                *pfVar12 = (float)local_30;
              }
              iVar23 = FUN_0030c718(iVar20,"nextDelay",&local_30);
              if (iVar23 == 0) {
                *pfVar8 = (float)local_30;
              }
              iVar23 = FUN_0030c718(iVar20,"nextDelayInc",&local_30);
              if (iVar23 == 0) {
                *pfVar9 = (float)local_30;
              }
              iVar23 = FUN_0030c718(iVar20,"nextDelaySpInc",&local_30);
              if (iVar23 == 0) {
                *pfVar10 = (float)local_30;
              }
              iVar23 = FUN_0030c718(iVar20,"speedLoss",&local_30);
              if (iVar23 == 0) {
                *pfVar2 = (float)local_30;
              }
              FUN_0030c6c0(iVar20,"overideProbabiltyPool",puVar35);
              pcVar36 = (char *)FUN_0030c660(iVar20,"waitForEntities");
              uVar17 = 1;
              if ((pcVar36 != (char *)0x0) && (uVar17 = 1, *pcVar36 != '\0')) {
                iVar23 = _strcmp("false",pcVar36);
                uVar17 = 0;
                if (iVar23 != 0) {
                  uVar17 = 1;
                }
              }
              *puVar13 = uVar17;
              uVar30 = FUN_0030c660(iVar20,"waitForProcessing");
              bVar18 = FUN_00039580(uVar30,"false");
              *pbVar14 = bVar18 ^ 1;
              iVar23 = FUN_0030c660(iVar20,"players");
              if (iVar23 != 0) {
                pcVar36 = (char *)FUN_0030c660(iVar20,"players");
                iVar23 = _strcmp(pcVar36,"1,2");
                if (iVar23 == 0) {
                  *piVar31 = 1;
                  *puVar32 = 2;
                  *(undefined4 *)(iVar21 + 0xf0) = 0xffffffff;
                }
              }
              iVar23 = FUN_0030c718(iVar20,"globalDtInc",&local_30);
              if (iVar23 == 0) {
                *(float *)(iVar22 + 0x80) = (float)local_30;
              }
              iVar23 = FUN_0030c718(iVar20,"globalDtStart",&local_30);
              if (iVar23 == 0) {
                *(float *)(iVar22 + 0x88) = (float)local_30;
              }
              iVar23 = FUN_0030c718(iVar20,"globalDtMax",&local_38);
              if (iVar23 == 0) {
                *(float *)(iVar22 + 0x90) = (float)local_38;
              }
            }
            else {
              iVar23 = _strcmp(pcVar36,"coin_chances");
              if (iVar23 == 0) {
                FUN_0005326c(param_1 + param_3 * 8 + 0x130,iVar20);
              }
            }
          }
          iVar20 = FUN_0030c378(iVar20);
        } while (iVar20 != 0);
      }
    }
    if (param_3 == 1) {
      piVar31 = (int *)(param_1 + *(int *)(param_1 + 0x164) * 0xc + 0x140);
    }
    else {
      piVar31 = (int *)(param_1 + param_3 * 0xc + 0x98);
    }
    puVar32 = (undefined4 *)*piVar31;
    puVar38 = (undefined4 *)piVar31[1];
    if (puVar32 != puVar38) {
      do {
        piVar31 = (int *)*puVar32;
        if (piVar31[1] == -1) {
          piVar31[1] = -2;
          puVar35 = (undefined4 *)(param_1 + param_3 * 0xc + 0x98);
          if (param_3 == 1) {
            puVar35 = (undefined4 *)(param_1 + *(int *)(param_1 + 0x164) * 0xc + 0x140);
          }
          puVar26 = (undefined4 *)*puVar35;
          if (puVar26 != (undefined4 *)puVar35[1]) {
            iVar20 = 1000000;
            do {
              if ((*piVar31 < *(int *)*puVar26) && (iVar21 = *(int *)*puVar26 + -1, iVar21 < iVar20)
                 ) {
                iVar20 = iVar21;
              }
              puVar26 = puVar26 + 1;
            } while ((undefined4 *)puVar35[1] != puVar26);
            if (iVar20 < 1000000) {
              piVar31[1] = iVar20;
            }
          }
        }
        puVar32 = puVar32 + 1;
      } while (puVar32 != puVar38);
    }
    (**(code **)(*piVar19 + 4))();
  }
  return;
}


```

