# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0000aae0 — 0000aae0

- 函数名: FUN_0000aae0
- 函数体: 175 字节
- 调用者数: 22 / 被调用者数: 3

```c

uint FUN_0000aae0(char *param_1,int param_2)

{
  int *piVar1;
  char cVar2;
  longlong lVar3;
  uint uVar4;
  size_t sVar5;
  int iVar6;
  uint uVar7;
  int *piVar8;
  uint uVar9;
  
  cVar2 = '\0';
  if (param_1 != (char *)0x0) {
    cVar2 = *param_1;
  }
  if (param_1 == (char *)0x0 || cVar2 == '\0') {
LAB_0000ab3c:
    uVar7 = 0xffffffff;
    if (param_2 == 1) {
      iVar6 = FUN_00052f80(0xffffffff);
      uVar4 = DAT_005d4cd0;
      uVar7 = *(uint *)(iVar6 + 8);
      lVar3 = (ulonglong)uVar7 * (ulonglong)*(uint *)(iVar6 + 0x10);
      uVar9 = (uint)lVar3;
      *(uint *)(iVar6 + 8) = uVar9 + *(uint *)(iVar6 + 0x18);
      uVar7 = *(int *)(iVar6 + 0xc) * *(uint *)(iVar6 + 0x10) +
              uVar7 * *(int *)(iVar6 + 0x14) + (int)((ulonglong)lVar3 >> 0x20) +
              *(int *)(iVar6 + 0x1c) + (uint)CARRY4(uVar9,*(uint *)(iVar6 + 0x18));
      *(uint *)(iVar6 + 0xc) = uVar7;
      if (uVar4 < 2) {
        return uVar7;
      }
      uVar7 = (uint)((ulonglong)uVar7 * (ulonglong)(uVar4 - 1) >> 0x20);
    }
  }
  else {
    sVar5 = _strlen(param_1);
    iVar6 = FUN_002f69c4(param_1,sVar5);
    piVar8 = (int *)(DAT_005d4cdc + 0x250);
    uVar4 = 0;
    do {
      uVar7 = uVar4;
      if ((int)DAT_005d4cd0 <= (int)uVar7) goto LAB_0000ab3c;
      if (*piVar8 == iVar6) {
        return uVar7;
      }
      piVar1 = piVar8 + 1;
      piVar8 = piVar8 + 0xce;
      uVar4 = uVar7 + 1;
    } while (*piVar1 != iVar6);
  }
  return uVar7;
}


```

## FUN_0000af04 — 0000af04

- 函数名: FUN_0000af04
- 函数体: 75 字节
- 调用者数: 3 / 被调用者数: 1

```c

void FUN_0000af04(undefined4 param_1)

{
  int iVar1;
  int iVar2;
  
  iVar1 = DAT_005d4cd0;
  iVar2 = 0;
  if (0 < DAT_005d4cd0) {
    iVar2 = 0;
    do {
      (&DAT_00556e8c)[iVar2] = iVar2;
      iVar2 = iVar2 + 1;
    } while (iVar2 < iVar1);
    iVar2 = iVar1;
    if (iVar1 < 2) {
      iVar2 = 1;
    }
  }
  FUN_0000ac24(param_1,&DAT_00556e8c,iVar2);
  return;
}


```

## FUN_00055670 — 00055670

- 函数名: FUN_00055670
- 函数体: 315 字节
- 调用者数: 2 / 被调用者数: 9

```c

void FUN_00055670(int *param_1)

{
  undefined *puVar1;
  undefined *puVar2;
  undefined4 uVar3;
  size_t sVar4;
  int iVar5;
  int iVar6;
  char *pcVar7;
  int iVar8;
  
  puVar2 = PTR_DAT_004d9048;
  puVar1 = PTR_DAT_004d9024;
  if (0 < param_1[4]) {
    iVar8 = 0;
    do {
      *(undefined4 *)(*param_1 + iVar8 * 4) = 0xffffffff;
      pcVar7 = *(char **)(param_1[1] + iVar8 * 4);
      sVar4 = _strlen(pcVar7);
      iVar5 = FUN_002f69c4(pcVar7,sVar4);
      if (((DAT_005a7950 & 1) == 0) && (iVar6 = ___cxa_guard_acquire(&DAT_005a7950), iVar6 != 0)) {
        DAT_005a7948 = FUN_002f69c4("bomb",4);
        DAT_005a794c = FUN_002f69c4("Bomb",4);
        ___cxa_guard_release(&DAT_005a7950);
      }
      if ((iVar5 == DAT_005a7948) || (iVar5 == DAT_005a794c)) {
        *(undefined4 *)(*param_1 + iVar8 * 4) = 0xfffffffe;
      }
      else {
        if (iVar5 == DAT_005a7924) {
          FUN_0001d10c(puVar2);
          iVar5 = FUN_0005ef30(puVar1);
          if (iVar5 == 1) {
            do {
              iVar5 = FUN_0000af04(0);
              *(int *)(*param_1 + iVar8 * 4) = iVar5;
              FUN_0001d10c(puVar2);
              iVar6 = FUN_000617a8();
            } while (iVar5 == iVar6);
            goto LAB_0005579a;
          }
          uVar3 = FUN_0000af04(0);
        }
        else if (iVar5 == DAT_005f949c) {
          FUN_0001d10c(puVar2);
          uVar3 = FUN_000617a8();
        }
        else {
          uVar3 = FUN_0000aae0(*(undefined4 *)(param_1[1] + iVar8 * 4),0);
        }
        *(undefined4 *)(*param_1 + iVar8 * 4) = uVar3;
      }
LAB_0005579a:
      iVar8 = iVar8 + 1;
    } while (iVar8 < param_1[4]);
  }
  return;
}


```

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

## FUN_00053388 — 00053388

- 函数名: FUN_00053388
- 函数体: 535 字节
- 调用者数: 1 / 被调用者数: 15

```c

void FUN_00053388(int *param_1,undefined4 param_2)

{
  undefined *puVar1;
  undefined1 uVar2;
  char *pcVar3;
  size_t sVar4;
  char *pcVar5;
  int iVar6;
  undefined4 uVar7;
  int iVar8;
  int *piVar9;
  int *unaff_r6;
  bool bVar10;
  allocator aaStack_38 [4];
  int local_34;
  undefined *local_30;
  int local_2c;
  int local_28;
  
  pcVar3 = (char *)FUN_0030c660(param_2,"name");
  bVar10 = pcVar3 == (char *)0x0;
  if (!bVar10) {
    unaff_r6 = param_1 + 5;
    bVar10 = unaff_r6 == (int *)0x0;
  }
  if (!bVar10) {
    if ((void *)*unaff_r6 != (void *)0x0) {
      operator_delete__((void *)*unaff_r6);
      *unaff_r6 = 0;
    }
    sVar4 = _strlen(pcVar3);
    pcVar5 = operator_new__(sVar4 + 1);
    *unaff_r6 = (int)pcVar5;
    _strcpy(pcVar5,pcVar3);
  }
  pcVar3 = (char *)param_1[5];
  sVar4 = _strlen(pcVar3);
  iVar6 = FUN_002f69c4(pcVar3,sVar4);
  param_1[6] = iVar6;
  FUN_0030c660(param_2,"mode");
  iVar6 = FUN_00039714();
  param_1[7] = iVar6;
  FUN_0030c6c0(param_2,"minWait",param_1 + 8);
  FUN_0030c6c0(param_2,"maxWait",param_1 + 9);
  FUN_0030c6c0(param_2,"dontSpawnBeforeWave",param_1 + 0xb);
  iVar6 = FUN_0030c660(param_2,"canSpawnWithPowers");
  if (iVar6 != 0) {
    uVar7 = FUN_0030c660(param_2,"canSpawnWithPowers");
    uVar2 = FUN_00039580("true",uVar7);
    *(undefined1 *)(param_1 + 10) = uVar2;
  }
  param_1[1] = 0;
  iVar6 = FUN_0030c328(param_2,"fruit");
  if (iVar6 != 0) {
    do {
      puVar1 = PTR__S_empty_rep_storage_004d9038;
      local_30 = PTR__S_empty_rep_storage_004d9038 + 0xc;
      local_2c = 100;
      pcVar3 = (char *)FUN_0030c660(iVar6,"type");
      std::string::string((string *)&local_34,pcVar3,aaStack_38);
      std::string::assign((string *)&local_30);
      if ((allocator *)(local_34 + -0xc) != (allocator *)puVar1) {
        piVar9 = (int *)(local_34 + -4);
        DataMemoryBarrier(0x1b);
        do {
          ExclusiveAccess(piVar9);
          iVar8 = *piVar9;
          bVar10 = (bool)hasExclusiveAccess(piVar9);
        } while (!bVar10);
        *piVar9 = iVar8 + -1;
        DataMemoryBarrier(0x1b);
        if (iVar8 < 1) {
          std::string::_Rep::_M_destroy((allocator *)(local_34 + -0xc));
        }
      }
      FUN_0030c6c0(iVar6,"chance",&local_2c);
      local_28 = param_1[1] + local_2c;
      param_1[1] = local_28;
      FUN_000584c8(param_1 + 2,&local_30);
      if ((allocator *)(local_30 + -0xc) != (allocator *)PTR__S_empty_rep_storage_004d9038) {
        piVar9 = (int *)(local_30 + -4);
        DataMemoryBarrier(0x1b);
        do {
          ExclusiveAccess(piVar9);
          iVar8 = *piVar9;
          bVar10 = (bool)hasExclusiveAccess(piVar9);
        } while (!bVar10);
        *piVar9 = iVar8 + -1;
        DataMemoryBarrier(0x1b);
        if (iVar8 < 1) {
          std::string::_Rep::_M_destroy((allocator *)(local_30 + -0xc));
        }
      }
      iVar6 = FUN_0030c3a0(iVar6,"fruit");
    } while (iVar6 != 0);
  }
  (**(code **)(*param_1 + 4))(param_1,param_2);
  return;
}


```

