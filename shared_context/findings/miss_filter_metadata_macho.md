# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0001267c — 0001267c

- 函数名: FUN_0001267c
- 函数体: 3235 字节
- 调用者数: 1 / 被调用者数: 29

```c

void FUN_0001267c(void)

{
  char cVar1;
  undefined4 *puVar2;
  int iVar3;
  undefined4 uVar4;
  int *piVar5;
  char *pcVar6;
  int iVar7;
  byte *pbVar8;
  undefined4 extraout_r0;
  undefined4 extraout_r0_00;
  ulong uVar9;
  char *pcVar10;
  size_t sVar11;
  int iVar12;
  undefined4 *puVar13;
  void *pvVar14;
  uint uVar15;
  undefined4 extraout_r1;
  undefined4 extraout_r1_00;
  uint uVar16;
  int iVar17;
  char *pcVar18;
  int *piVar19;
  bool bVar20;
  undefined8 uVar21;
  int local_b8;
  int local_b4 [7];
  undefined4 local_98;
  undefined4 local_94;
  int local_90 [4];
  undefined4 local_80;
  undefined4 local_7c;
  double local_78;
  double local_70;
  char acStack_64 [64];
  int local_24;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  if (DAT_005d4cdc == (char *)0x0) {
    DAT_00556d30 = operator_new(0x14);
    *DAT_00556d30 = 0;
    DAT_00556d30[1] = 0;
    DAT_00556d30[2] = 0;
    DAT_00556d30[3] = 0;
    DAT_00556d30[4] = 0;
    FUN_00014b04();
    puVar2 = operator_new(0x14);
    *puVar2 = "-";
    FUN_00014c70(puVar2,100);
    DAT_00556d34 = puVar2;
    iVar3 = FUN_000260f0();
    if (iVar3 == 1) {
      uVar4 = FUN_0036aa24();
      FUN_0036ab34(&local_7c,uVar4,"textures/effects/fruit_shadow.tex");
      FUN_00026e98(&DAT_00556ca0,local_7c);
      FUN_00026ed0(&local_7c);
      uVar4 = FUN_0036aa24();
      FUN_0036ab34(&local_80,uVar4,"textures/effects/menuFruitShadow.tex");
      FUN_00026e98(0x556ca4,local_80);
      FUN_00026ed0(&local_80);
    }
    piVar5 = operator_new(0x48);
    FUN_0030cda0(piVar5,"xml/fruitlist.xml");
    if (piVar5 != (int *)0x0) {
      iVar3 = FUN_0030ceac(piVar5,0);
      if (iVar3 == 1) {
        uVar4 = FUN_0030c328(piVar5,"fruitInfoFile");
        iVar3 = FUN_0030c328(uVar4,"critical");
        if (iVar3 != 0) {
          pcVar6 = (char *)FUN_0030c660(iVar3,"colour");
          cVar1 = '\0';
          if (pcVar6 != (char *)0x0) {
            cVar1 = *pcVar6;
          }
          if (pcVar6 != (char *)0x0 && cVar1 != '\0') {
            local_90[3] = DAT_004711ac;
            local_90[0] = DAT_004711a0;
            local_90[1] = DAT_004711a4;
            local_90[2] = DAT_004711a8;
            iVar17 = 0;
            do {
              iVar7 = _atoi(pcVar6);
              local_90[iVar17] = iVar7;
              pcVar10 = pcVar6;
              do {
                pcVar6 = pcVar10 + 1;
                cVar1 = *pcVar10;
                pcVar10 = pcVar6;
              } while (cVar1 != ',' && cVar1 != '\0');
            } while ((cVar1 != '\0') && (iVar17 = iVar17 + 1, iVar17 < 4));
            DAT_005d4cd4._2_1_ = (undefined1)local_90[0];
            DAT_005d4cd4._1_1_ = (undefined1)local_90[1];
            DAT_005d4cd4._0_1_ = (undefined1)local_90[2];
            DAT_005d4cd4._3_1_ = (undefined1)local_90[3];
          }
          FUN_0030c6c0(iVar3,"new_life_at",&DAT_0052bf78);
          FUN_0030c6c0(iVar3,"score",&DAT_0052bf64);
          FUN_0030c6c0(iVar3,"chance",&DAT_0052bf68);
          FUN_0030c6c0(iVar3,"chance_inc",&DAT_0052bf6c);
          FUN_0030c6c0(iVar3,"splats",&DAT_0052bf54);
          iVar17 = FUN_0030c718(iVar3,"scale",&local_70);
          if (iVar17 == 0) {
            DAT_0052bf58 = (float)local_70;
          }
          iVar17 = FUN_0030c718(iVar3,"spread",&local_70);
          if (iVar17 == 0) {
            DAT_0052bf5c = (float)local_70;
          }
          iVar3 = FUN_0030c718(iVar3,"disappear_speed",&local_78);
          if (iVar3 == 0) {
            DAT_0052bf60 = (float)local_78;
          }
        }
        iVar3 = FUN_0030c328(uVar4,"bomb");
        if (iVar3 != 0) {
          uVar21 = FUN_0030c660(iVar3,"size");
          uVar15 = (uint)((ulonglong)uVar21 >> 0x20);
          pbVar8 = (byte *)uVar21;
          if (pbVar8 != (byte *)0x0) {
            uVar15 = (uint)*pbVar8;
          }
          if (pbVar8 != (byte *)0x0 && uVar15 != 0) {
            _atof((char *)pbVar8);
            *(float *)(PTR_DAT_004d9048 + 0x94) = (float)(double)CONCAT44(extraout_r1,extraout_r0);
          }
          uVar21 = FUN_0030c660(iVar3,"collision");
          uVar15 = (uint)((ulonglong)uVar21 >> 0x20);
          pbVar8 = (byte *)uVar21;
          if (pbVar8 != (byte *)0x0) {
            uVar15 = (uint)*pbVar8;
          }
          if (pbVar8 != (byte *)0x0 && uVar15 != 0) {
            _atof((char *)pbVar8);
            *(float *)(PTR_DAT_004d9048 + 0x98) =
                 (float)(double)CONCAT44(extraout_r1_00,extraout_r0_00);
          }
        }
        iVar3 = FUN_0030c328(uVar4,"FruitInfo");
        DAT_005d4cd0 = 0;
        if (iVar3 != 0) {
          DAT_005d4cd0 = 0;
          do {
            DAT_005d4cd0 = DAT_005d4cd0 + 1;
            iVar3 = FUN_0030c3a0(iVar3,"FruitInfo");
          } while (iVar3 != 0);
        }
        uVar15 = DAT_005d4cd0;
        uVar16 = (uint)((ulonglong)DAT_005d4cd0 * 0x338);
        uVar9 = uVar16 + 8;
        if ((int)((ulonglong)DAT_005d4cd0 * 0x338 >> 0x20) != 0 || uVar9 < uVar16) {
          uVar9 = 0xffffffff;
        }
        puVar2 = operator_new__(uVar9);
        *puVar2 = 0x338;
        puVar2[1] = uVar15;
        if (uVar15 != 0) {
          iVar3 = uVar15 * 0x338;
          pcVar6 = (char *)(puVar2 + 2);
          do {
            FUN_00015404(pcVar6);
            iVar3 = iVar3 + -0x338;
            pcVar6 = pcVar6 + 0x338;
          } while (iVar3 != 0);
        }
        DAT_005d4cdc = (char *)(puVar2 + 2);
        uVar4 = FUN_0030c328(piVar5,"fruitInfoFile");
        iVar3 = FUN_0030c328(uVar4,"FruitInfo");
        pcVar6 = DAT_005d4cdc;
        FUN_00026e98(DAT_005d4cdc + 0x300,0);
        while (iVar3 != 0) {
          pcVar10 = (char *)FUN_0030c660(iVar3,"name");
          cVar1 = '\0';
          if (pcVar10 != (char *)0x0) {
            cVar1 = *pcVar10;
          }
          if (pcVar10 != (char *)0x0 && cVar1 != '\0') {
            _strcpy(pcVar6,pcVar10);
            sVar11 = _strlen(pcVar6);
            uVar4 = FUN_002f69c4(pcVar6,sVar11);
            *(undefined4 *)(pcVar6 + 0x250) = uVar4;
            if ((byte)(*pcVar6 + 0x9fU) < 0x1a) {
              *pcVar6 = *pcVar6 + -0x20;
            }
            sVar11 = _strlen(pcVar6);
            uVar4 = FUN_002f69c4(pcVar6,sVar11);
            *(undefined4 *)(pcVar6 + 0x254) = uVar4;
            if ((byte)(*pcVar6 + 0xbfU) < 0x1a) {
              *pcVar6 = *pcVar6 + ' ';
            }
            FUN_002f702c(acStack_64,0x40,"%s_trail",pcVar6);
            sVar11 = _strlen(acStack_64);
            uVar4 = FUN_002f69c4(acStack_64,sVar11);
            *(undefined4 *)(pcVar6 + 600) = uVar4;
            FUN_002f702c(acStack_64,0x40,"%s_sliced",pcVar6);
            sVar11 = _strlen(acStack_64);
            uVar4 = FUN_002f69c4(acStack_64,sVar11);
            *(undefined4 *)(pcVar6 + 0x25c) = uVar4;
            pcVar18 = pcVar6 + 0x140;
            FUN_002f702c(pcVar18,0x40,"%s_total",pcVar6);
            sVar11 = _strlen(pcVar18);
            uVar4 = FUN_002f69c4(pcVar18,sVar11);
            *(undefined4 *)(pcVar6 + 0x260) = uVar4;
            pcVar18 = pcVar6 + 0x180;
            FUN_002f702c(pcVar18,0x40,"%s_point_total",pcVar6);
            sVar11 = _strlen(pcVar18);
            uVar4 = FUN_002f69c4(pcVar18,sVar11);
            *(undefined4 *)(pcVar6 + 0x264) = uVar4;
            pcVar18 = pcVar6 + 0x1c0;
            FUN_002f702c(pcVar18,0x40,"%s_drops",pcVar6);
            sVar11 = _strlen(pcVar18);
            uVar4 = FUN_002f69c4(pcVar18,sVar11);
            *(undefined4 *)(pcVar6 + 0x268) = uVar4;
            FUN_002f702c(acStack_64,0x40,"hud/hud_%s.tex",pcVar10);
            FUN_0001cdb4(&local_94,acStack_64);
            FUN_00026e98(pcVar6 + 0x300,local_94);
            FUN_00026ed0(&local_94);
            FUN_002f702c(acStack_64,0x40,"results_screen/zen_%s.tex",pcVar10);
            FUN_0001cdb4(&local_98,acStack_64);
            FUN_00026e98(pcVar6 + 0x304,local_98);
            FUN_00026ed0(&local_98);
          }
          iVar17 = FUN_0030c328(iVar3,"titles");
          if (iVar17 != 0) {
            uVar21 = FUN_0030c660(iVar17,"plural");
            uVar15 = (uint)((ulonglong)uVar21 >> 0x20);
            pbVar8 = (byte *)uVar21;
            if (pbVar8 != (byte *)0x0) {
              uVar15 = (uint)*pbVar8;
            }
            if (pbVar8 != (byte *)0x0 && uVar15 != 0) {
              pcVar10 = (char *)FUN_00038844(pbVar8,0);
              _strcpy(pcVar6 + 0x100,pcVar10);
            }
            else {
              FUN_002f702c(pcVar6 + 0x100,0x40,"%ss",pcVar6);
            }
            uVar21 = FUN_0030c660(iVar17,"singular");
            uVar15 = (uint)((ulonglong)uVar21 >> 0x20);
            pbVar8 = (byte *)uVar21;
            if (pbVar8 != (byte *)0x0) {
              uVar15 = (uint)*pbVar8;
            }
            pcVar10 = pcVar6;
            if (pbVar8 != (byte *)0x0 && uVar15 != 0) {
              pcVar10 = (char *)FUN_00038844(pbVar8,0);
            }
            _strcpy(pcVar6 + 0xc0,pcVar10);
            pcVar10 = (char *)FUN_0030c660(iVar17,"pluralEnglish");
            cVar1 = '\0';
            if (pcVar10 != (char *)0x0) {
              cVar1 = *pcVar10;
            }
            if (pcVar10 != (char *)0x0 && cVar1 != '\0') {
              _strcpy(pcVar6 + 0x80,pcVar10);
            }
            else {
              FUN_002f702c(pcVar6 + 0x80,0x40,"%ss",pcVar6);
            }
            pcVar10 = (char *)FUN_0030c660(iVar17,"singularEnglish");
            cVar1 = '\0';
            if (pcVar10 != (char *)0x0) {
              cVar1 = *pcVar10;
            }
            if (pcVar10 == (char *)0x0 || cVar1 == '\0') {
              pcVar10 = pcVar6;
            }
            _strcpy(pcVar6 + 0x40,pcVar10);
          }
          pcVar10 = (char *)FUN_0030c660(iVar3,"factTexture");
          if ((pcVar10 != (char *)0x0) && (*pcVar10 != '\0')) {
            _strcpy(pcVar6 + 0x278,pcVar10);
          }
          pcVar10 = (char *)FUN_0030c660(iVar3,"modelName");
          cVar1 = '\0';
          if (pcVar10 != (char *)0x0) {
            cVar1 = *pcVar10;
          }
          if (pcVar10 == (char *)0x0 || cVar1 == '\0') {
            pcVar10 = pcVar6;
          }
          _strcpy(pcVar6 + 0x200,pcVar10);
          iVar17 = FUN_0030c328(iVar3,"colours");
          if (iVar17 != 0) {
            pcVar10 = (char *)FUN_0030c660(iVar17,"colour");
            cVar1 = '\0';
            if (pcVar10 != (char *)0x0) {
              cVar1 = *pcVar10;
            }
            if (pcVar10 != (char *)0x0 && cVar1 != '\0') {
              local_b4[3] = DAT_004711a0;
              local_b4[4] = DAT_004711a4;
              local_b4[5] = DAT_004711a8;
              local_b4[6] = DAT_004711ac;
              iVar7 = 0;
              do {
                iVar12 = _atoi(pcVar10);
                local_b4[iVar7 + 3] = iVar12;
                pcVar18 = pcVar10;
                do {
                  pcVar10 = pcVar18 + 1;
                  cVar1 = *pcVar18;
                  pcVar18 = pcVar10;
                } while (cVar1 != ',' && cVar1 != '\0');
              } while ((cVar1 != '\0') && (iVar7 = iVar7 + 1, iVar7 < 4));
              pcVar6[0x242] = (char)local_b4[3];
              pcVar6[0x241] = (char)local_b4[4];
              pcVar6[0x240] = (char)local_b4[5];
              pcVar6[0x243] = (char)local_b4[6];
              if ((local_b4[6] & 0xffU) == 0) {
                pcVar6[0x318] = '\0';
              }
            }
            pcVar10 = (char *)FUN_0030c660(iVar17,"factColour");
            cVar1 = '\0';
            if (pcVar10 != (char *)0x0) {
              cVar1 = *pcVar10;
            }
            if (pcVar10 != (char *)0x0 && cVar1 != '\0') {
              iVar17 = 0;
              local_b4[0] = DAT_004711b0;
              local_b4[1] = DAT_004711b4;
              local_b4[2] = DAT_004711b8;
              do {
                iVar7 = _atoi(pcVar10);
                local_b4[iVar17] = iVar7;
                pcVar18 = pcVar10;
                do {
                  pcVar10 = pcVar18 + 1;
                  cVar1 = *pcVar18;
                  pcVar18 = pcVar10;
                } while (cVar1 != ',' && cVar1 != '\0');
              } while ((cVar1 != '\0') && (iVar17 = iVar17 + 1, iVar17 < 3));
              pcVar6[0x2fa] = (char)local_b4[0];
              pcVar6[0x2f9] = (char)local_b4[1];
              pcVar6[0x2f8] = (char)local_b4[2];
              pcVar6[0x2fb] = -1;
            }
          }
          pcVar6[0x308] = '\0';
          pcVar6[0x309] = '\0';
          pcVar6[0x30a] = '\0';
          pcVar6[0x30b] = '\0';
          pcVar6[0x244] = '\0';
          pcVar6[0x245] = '\0';
          pcVar6[0x246] = -0x38;
          pcVar6[0x247] = 'A';
          pcVar6[0x248] = '\0';
          pcVar6[0x249] = '\0';
          pcVar6[0x24a] = -0x80;
          pcVar6[0x24b] = '?';
          pcVar6[0x24c] = '\0';
          pcVar6[0x24d] = '\0';
          pcVar6[0x24e] = '@';
          pcVar6[0x24f] = '?';
          iVar17 = FUN_0030c718(iVar3,"scale",&local_70);
          if (iVar17 == 0) {
            *(float *)(pcVar6 + 0x244) = (float)local_70;
          }
          iVar17 = FUN_0030c718(iVar3,"collision",&local_70);
          if (iVar17 == 0) {
            *(float *)(pcVar6 + 0x248) = (float)local_70;
          }
          iVar17 = FUN_0030c718(iVar3,"hitInfluence",&local_70);
          if (iVar17 == 0) {
            *(float *)(pcVar6 + 0x24c) = (float)local_70;
          }
          FUN_0030c6c0(iVar3,"chance",pcVar6 + 0x308);
          FUN_0030c6c0(iVar3,"score",pcVar6 + 0x314);
          if (*(int *)(pcVar6 + 0x314) == 0) {
            pcVar6[0x330] = '\x01';
          }
          FUN_0030c6c0(iVar3,"coins",pcVar6 + 0x324);
          *(undefined4 *)(pcVar6 + 0x328) = *(undefined4 *)(pcVar6 + 0x324);
          FUN_0030c6c0(iVar3,"coinsMin",pcVar6 + 0x324);
          FUN_0030c6c0(iVar3,"coinsMax",pcVar6 + 0x328);
          local_b8 = 0;
          FUN_0030c6c0(iVar3,"hasSplatSeeds",&local_b8);
          pcVar6[0x319] = local_b8 == 1;
          if (DAT_0052bf64 <= *(int *)(pcVar6 + 0x314)) {
            pcVar6[0x318] = '\0';
          }
          pcVar10 = (char *)FUN_0030c660(iVar3,"onside");
          cVar1 = '\0';
          if (pcVar10 != (char *)0x0) {
            cVar1 = *pcVar10;
          }
          if (pcVar10 != (char *)0x0 && cVar1 != '\0') {
LAB_00012fae:
            iVar17 = _strcmp("true",pcVar10);
            cVar1 = '\0';
            if (iVar17 == 0) {
              cVar1 = '\x01';
            }
          }
          else {
            pcVar10 = (char *)FUN_0030c660(iVar3,"onSide");
            cVar1 = '\0';
            if ((pcVar10 != (char *)0x0) && (cVar1 = '\0', *pcVar10 != '\0')) goto LAB_00012fae;
          }
          pcVar6[0x26c] = cVar1;
          pcVar10 = (char *)FUN_0030c660(iVar3,"onlySprinkle");
          cVar1 = '\0';
          if (pcVar10 != (char *)0x0) {
            cVar1 = *pcVar10;
          }
          if (pcVar10 != (char *)0x0 && cVar1 != '\0') {
LAB_0001300c:
            iVar17 = _strcmp("true",pcVar10);
            cVar1 = '\0';
            if (iVar17 == 0) {
              cVar1 = '\x01';
            }
          }
          else {
            pcVar10 = (char *)FUN_0030c660(iVar3,"onlySprinkle");
            cVar1 = '\0';
            if ((pcVar10 != (char *)0x0) && (cVar1 = '\0', *pcVar10 != '\0')) goto LAB_0001300c;
          }
          pcVar6[0x2fc] = cVar1;
          pcVar10 = (char *)FUN_0030c660(iVar3,"noCritical");
          cVar1 = '\0';
          if (pcVar10 != (char *)0x0) {
            cVar1 = *pcVar10;
          }
          if (pcVar10 != (char *)0x0 && cVar1 != '\0') {
            iVar17 = _strcmp("true",pcVar10);
            bVar20 = iVar17 != 0;
          }
          else {
            bVar20 = pcVar6[0x318] != '\0';
          }
          pcVar6[0x318] = bVar20;
          pcVar6[0x270] = '\0';
          pcVar6[0x271] = '\0';
          pcVar6[0x272] = '\0';
          pcVar6[0x273] = '\0';
          pcVar6[0x274] = '\0';
          pcVar6[0x275] = '\0';
          pcVar6[0x276] = '\0';
          pcVar6[0x277] = '\0';
          for (iVar17 = FUN_0030c328(iVar3,"fact"); iVar17 != 0;
              iVar17 = FUN_0030c3a0(iVar17,"fact")) {
            *(int *)(pcVar6 + 0x270) = *(int *)(pcVar6 + 0x270) + 1;
          }
          pcVar6[800] = '\0';
          pcVar6[0x321] = '\0';
          pcVar6[0x322] = '\0';
          pcVar6[0x323] = '\0';
          for (iVar17 = FUN_0030c328(iVar3,"impact_sound"); uVar15 = *(uint *)(pcVar6 + 800),
              iVar17 != 0; iVar17 = FUN_0030c3a0(iVar17,"impact_sound")) {
            *(uint *)(pcVar6 + 800) = uVar15 + 1;
          }
          if ((int)uVar15 < 1) {
            sVar11 = _strlen(pcVar6);
            pcVar6[800] = '\x01';
            pcVar6[0x321] = '\0';
            pcVar6[0x322] = '\0';
            pcVar6[0x323] = '\0';
            puVar13 = operator_new__(0x14);
            *puVar13 = 0xc;
            puVar13[1] = 1;
            puVar2 = puVar13 + 2;
            do {
              *puVar2 = 0;
              puVar2[1] = 10;
              puVar2[2] = 0;
              puVar2 = puVar2 + 3;
            } while (puVar2 != puVar13 + 5);
            *(undefined4 **)(pcVar6 + 0x31c) = puVar13 + 2;
            pvVar14 = operator_new__(sVar11 + 9);
            **(undefined4 **)(pcVar6 + 0x31c) = pvVar14;
            FUN_002f702c(**(undefined4 **)(pcVar6 + 0x31c),sVar11 + 9,"Impact-%c%s",*pcVar6 + -0x20,
                         pcVar6 + 1);
          }
          else {
            uVar16 = (uint)((ulonglong)uVar15 * 0xc);
            uVar9 = uVar16 + 8;
            if ((int)((ulonglong)uVar15 * 0xc >> 0x20) != 0 || uVar9 < uVar16) {
              uVar9 = 0xffffffff;
            }
            puVar2 = operator_new__(uVar9);
            *puVar2 = 0xc;
            puVar13 = puVar2 + 2;
            puVar2[1] = uVar15;
            puVar2 = puVar13;
            do {
              *puVar2 = 0;
              puVar2[1] = 10;
              puVar2[2] = 0;
              puVar2 = puVar2 + 3;
            } while (puVar2 != puVar13 + uVar15 * 3);
            *(undefined4 **)(pcVar6 + 0x31c) = puVar13;
            iVar17 = FUN_0030c328(iVar3,"impact_sound");
            if (iVar17 != 0) {
              iVar7 = 0;
              do {
                FUN_0030c6c0(iVar17,"chance",puVar13 + 1);
                iVar7 = iVar7 + puVar13[1];
                puVar13[2] = iVar7;
                pcVar10 = (char *)FUN_0030cd00(iVar17);
                sVar11 = _strlen(pcVar10);
                pcVar18 = operator_new__(sVar11 + 1);
                *puVar13 = pcVar18;
                _strcpy(pcVar18,pcVar10);
                iVar17 = FUN_0030c3a0(iVar17,"impact_sound");
                puVar13 = puVar13 + 3;
              } while (iVar17 != 0);
            }
          }
          iVar17 = FUN_0030c328(iVar3,"power");
          if (iVar17 != 0) {
            uVar15 = 0;
            iVar7 = 0xc;
            do {
              iVar12 = iVar7;
              iVar17 = FUN_0030c3a0(iVar17,"power");
              uVar15 = uVar15 + 1;
              iVar7 = iVar12 + 0xc;
            } while (iVar17 != 0);
            if (0 < (int)uVar15) {
              uVar9 = (ulong)((ulonglong)uVar15 * 0xc);
              pvVar14 = operator_new(8);
              *(void **)(pcVar6 + 0x32c) = pvVar14;
              *(uint *)((int)pvVar14 + 4) = uVar15;
              if ((int)((ulonglong)uVar15 * 0xc >> 0x20) != 0) {
                uVar9 = 0xffffffff;
              }
              pvVar14 = operator_new__(uVar9);
              puVar2 = (undefined4 *)((int)pvVar14 + 4);
              do {
                puVar2[-1] = 0;
                iVar12 = iVar12 + -0xc;
                *puVar2 = 100;
                puVar2[1] = 0;
                puVar2 = puVar2 + 3;
              } while (iVar12 != 0);
              **(undefined4 **)(pcVar6 + 0x32c) = pvVar14;
              iVar7 = **(int **)(pcVar6 + 0x32c);
              iVar17 = FUN_0030c328(iVar3,"power");
              if (iVar17 != 0) {
                piVar19 = (int *)(iVar7 + 4);
                iVar7 = 0;
                do {
                  pcVar10 = (char *)FUN_0030c660(iVar17,"name");
                  cVar1 = '\0';
                  if (pcVar10 != (char *)0x0) {
                    cVar1 = *pcVar10;
                  }
                  if (pcVar10 != (char *)0x0 && cVar1 != '\0') {
                    sVar11 = _strlen(pcVar10);
                    iVar12 = FUN_002f69c4(pcVar10,sVar11);
                    piVar19[-1] = iVar12;
                  }
                  FUN_0030c6c0(iVar17,"chance",piVar19);
                  iVar7 = iVar7 + *piVar19;
                  piVar19[1] = iVar7;
                  iVar17 = FUN_0030c3a0(iVar17,"power");
                  piVar19 = piVar19 + 3;
                } while (iVar17 != 0);
              }
            }
          }
          iVar3 = FUN_0030c3a0(iVar3,"FruitInfo");
          pcVar6 = pcVar6 + 0x338;
        }
      }
      (**(code **)(*piVar5 + 4))();
    }
    FUN_00013320();
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 == local_24) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail(*(int *)PTR____stack_chk_guard_004d9044);
}


```

