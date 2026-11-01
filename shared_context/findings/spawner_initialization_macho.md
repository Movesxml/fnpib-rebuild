# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

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

