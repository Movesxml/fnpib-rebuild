# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_000278ec — 000278ec

- 函数名: FUN_000278ec
- 函数体: 133 字节
- 调用者数: 2 / 被调用者数: 7

```c

void FUN_000278ec(int param_1)

{
  undefined *puVar1;
  int iVar2;
  undefined4 uVar3;
  size_t sVar4;
  int iVar5;
  int iVar6;
  char local_64 [64];
  int local_24;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  iVar6 = 0;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  do {
    iVar2 = FUN_0001ceb0();
    iVar5 = *(int *)(param_1 + iVar6 * 4 + 0x2dc);
    if ((iVar5 != iVar2) && (iVar5 != iVar2 + -1)) {
      uVar3 = FUN_000254b0(iVar6);
      _sprintf(local_64,"%s_days",uVar3);
      sVar4 = _strlen(local_64);
      uVar3 = FUN_002f69c4(local_64,sVar4);
      FUN_00027708(param_1,uVar3);
    }
    iVar6 = iVar6 + 1;
  } while (iVar6 != 2);
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00027f24 — 00027f24

- 函数名: FUN_00027f24
- 函数体: 675 字节
- 调用者数: 1 / 被调用者数: 12

```c

undefined4 FUN_00027f24(undefined4 param_1,int param_2)

{
  undefined4 ***pppuVar1;
  undefined1 uVar2;
  int iVar3;
  undefined4 uVar4;
  char *pcVar5;
  int iVar6;
  int iVar7;
  _List_node_base *p_Var8;
  int iVar9;
  undefined4 ***pppuVar10;
  undefined1 auStack_58 [4];
  float local_54;
  undefined4 **local_50;
  undefined4 **local_4c;
  float local_48;
  undefined1 auStack_44 [4];
  undefined4 local_40;
  undefined4 local_3c;
  undefined4 local_38;
  undefined4 local_34;
  undefined4 local_30;
  undefined4 local_2c;
  double local_28;
  
  FUN_0030c6c0(param_1,"waveCount",param_2 + 0x248);
  FUN_0030c6c0(param_1,"numberOfWavesSpawned",param_2 + 0x24c);
  FUN_0030c6c0(param_1,"numberOfWavesSinceReset",param_2 + 0x250);
  iVar3 = FUN_0030c718(param_1,"waveDelay",&local_28);
  if (iVar3 == 0) {
    *(float *)(param_2 + 0x254) = (float)local_28;
  }
  iVar3 = FUN_0030c718(param_1,"waveWait",&local_28);
  if (iVar3 == 0) {
    *(float *)(param_2 + 600) = (float)local_28;
  }
  FUN_0030c6c0(param_1,"blitzSpawnedThisGame",param_2 + 0x298);
  FUN_0030c6c0(param_1,"blitzForceSpawnedCounter",param_2 + 0x29c);
  iVar3 = FUN_0030c718(param_1,"blitzSpawnTime",&local_28);
  if (iVar3 == 0) {
    *(float *)(param_2 + 0x2a0) = (float)local_28;
  }
  uVar4 = FUN_0030c660(param_1,"beanStartPos");
  FUN_000394a0(&local_34,uVar4);
  *(undefined4 *)(param_2 + 0x11c) = local_34;
  *(undefined4 *)(param_2 + 0x120) = local_30;
  *(undefined4 *)(param_2 + 0x124) = local_2c;
  uVar4 = FUN_0030c660(param_1,"beanEndPos");
  FUN_000394a0(&local_40,uVar4);
  *(undefined4 *)(param_2 + 0x128) = local_40;
  *(undefined4 *)(param_2 + 300) = local_3c;
  *(undefined4 *)(param_2 + 0x130) = local_38;
  iVar3 = FUN_0030c718(param_1,"beanTime",&local_28);
  if (iVar3 == 0) {
    *(float *)(param_2 + 0x134) = (float)local_28;
  }
  pcVar5 = (char *)FUN_0030c660(param_1,"beanVisible");
  uVar2 = 1;
  if ((pcVar5 != (char *)0x0) && (uVar2 = 1, *pcVar5 != '\0')) {
    iVar3 = _strcmp(pcVar5,"false");
    uVar2 = 0;
    if (iVar3 != 0) {
      uVar2 = 1;
    }
  }
  iVar9 = param_2 + 0x260;
  *(undefined1 *)(param_2 + 0x138) = uVar2;
  FUN_00022bb4(iVar9);
  *(int *)(param_2 + 0x260) = iVar9;
  *(int *)(param_2 + 0x264) = iVar9;
  iVar3 = FUN_0030c328(param_1,"wave");
  if (iVar3 != 0) {
    do {
      local_50 = &local_50;
      local_4c = &local_50;
      iVar6 = FUN_0030c718(iVar3,"inc",&local_28);
      if (iVar6 == 0) {
        local_48 = (float)local_28;
      }
      FUN_0030c6c0(iVar3,"index",auStack_44);
      for (iVar6 = FUN_0030c328(iVar3,"spawner"); iVar6 != 0; iVar6 = FUN_0030c3a0(iVar6,"spawner"))
      {
        iVar7 = FUN_0030c718(iVar6,"delay",&local_28);
        if (iVar7 == 0) {
          local_54 = (float)local_28;
        }
        FUN_0030c6c0(iVar6,"toSpawn",auStack_58);
        FUN_00023104(&local_50,&local_50,auStack_58);
      }
      p_Var8 = (_List_node_base *)FUN_000230b0(iVar9,&local_50);
      std::_List_node_base::hook(p_Var8);
      pppuVar1 = (undefined4 ***)local_50;
      while (pppuVar1 != &local_50) {
        pppuVar10 = (undefined4 ***)*pppuVar1;
        operator_delete(pppuVar1);
        pppuVar1 = pppuVar10;
      }
      iVar3 = FUN_0030c3a0(iVar3,"wave");
    } while (iVar3 != 0);
  }
  return 1;
}


```

## FUN_00028350 — 00028350

- 函数名: FUN_00028350
- 函数体: 1999 字节
- 调用者数: 2 / 被调用者数: 31

```c

void FUN_00028350(int param_1,int param_2)

{
  int *piVar1;
  char cVar2;
  bool bVar3;
  undefined *puVar4;
  uint uVar5;
  int iVar6;
  undefined4 uVar7;
  int iVar8;
  undefined4 *puVar9;
  size_t sVar10;
  byte *pbVar11;
  undefined4 extraout_r0;
  char *pcVar12;
  _List_node_base *p_Var13;
  undefined4 extraout_r1;
  undefined1 uVar14;
  int iVar15;
  byte *pbVar16;
  undefined8 uVar17;
  undefined4 local_178;
  undefined4 local_174;
  undefined4 local_170;
  undefined4 local_16c;
  undefined4 local_168;
  undefined4 local_164;
  undefined4 local_160;
  undefined4 local_15c;
  undefined4 local_158;
  undefined4 local_154;
  undefined4 local_150;
  undefined4 local_14c;
  undefined4 local_148;
  undefined4 local_144;
  undefined4 local_140;
  undefined4 local_13c;
  undefined4 local_138;
  undefined4 local_134;
  undefined4 local_130;
  undefined4 local_12c;
  undefined4 local_128;
  undefined4 local_124;
  undefined4 local_120;
  undefined4 local_11c;
  undefined4 local_118;
  undefined4 local_114;
  undefined4 local_110;
  undefined1 local_10c;
  int local_108;
  undefined1 auStack_104 [4];
  undefined4 local_100;
  float local_fc;
  float local_f8;
  undefined4 *local_f4;
  double local_f0;
  char acStack_e4 [128];
  undefined1 auStack_64 [64];
  int local_24;
  
  puVar4 = PTR_DAT_004d9048;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  PTR_DAT_004d9048[0x1b1] = 0;
  *(undefined1 *)(*(int *)(puVar4 + 0x5c) + 0x31) = 0;
  if (*(int *)(param_1 + 0x14) == 1) {
    uVar5 = *(uint *)(param_1 + 0x20);
    pbVar16 = (byte *)(uVar5 + 8);
    if (pbVar16 != (byte *)0x0) {
      uVar5 = (uint)*pbVar16;
    }
    if (pbVar16 != (byte *)0x0 && uVar5 != 0) {
      iVar6 = _strcmp((char *)pbVar16,"save_file");
      if (iVar6 == 0) {
        FUN_0030c660(param_1,"version");
        uVar7 = FUN_000282c4();
        *(undefined4 *)(param_2 + 0x2d4) = uVar7;
        FUN_0030c6c0(param_1,"highscore",param_2 + 0x40);
        FUN_0030c6c0(param_1,"critical_chance",param_2 + 0x100);
        FUN_0030c6c0(param_1,"appLicensedState",PTR_DAT_004d9048 + 0x1ac);
        pcVar12 = (char *)FUN_0030c660(param_1,"rated");
        uVar14 = 0;
        if (((pcVar12 != (char *)0x0) && (uVar14 = 0, *pcVar12 != '\0')) &&
           (iVar6 = _strcmp(pcVar12,"true"), iVar6 == 0)) {
          uVar14 = 1;
        }
        *(undefined1 *)(param_2 + 0x32) = uVar14;
        pcVar12 = (char *)FUN_0030c660(param_1,"p2pCancelled");
        uVar14 = 0;
        if (((pcVar12 != (char *)0x0) && (uVar14 = 0, *pcVar12 != '\0')) &&
           (iVar6 = _strcmp(pcVar12,"true"), iVar6 == 0)) {
          uVar14 = 1;
        }
        *(undefined1 *)(param_2 + 0x3c) = uVar14;
        iVar15 = param_2 + 0x2dc;
        *(undefined4 *)(param_2 + 0x44) = *(undefined4 *)(param_2 + 0x40);
        iVar6 = 0;
        do {
          uVar7 = FUN_000254b0(iVar6);
          FUN_002f702c(auStack_64,0x40,"%shighscore",uVar7);
          FUN_0030c6c0(param_1,auStack_64,iVar15 + -0x298);
          uVar7 = FUN_000254b0(iVar6);
          FUN_002f702c(auStack_64,0x40,"%s_unposted",uVar7);
          FUN_0030c6c0(param_1,auStack_64,iVar15 + -0x290);
          uVar7 = FUN_000254b0(iVar6);
          FUN_002f702c(auStack_64,0x40,"%s_dolg",uVar7);
          FUN_0030c6c0(param_1,auStack_64,iVar15);
          iVar6 = iVar6 + 1;
          iVar15 = iVar15 + 4;
        } while (iVar6 != 2);
      }
      else {
        iVar6 = _strcmp((char *)pbVar16,"que");
        if (iVar6 == 0) {
          FUN_000281c8(param_1,param_2,1);
        }
        else {
          iVar6 = _strcmp((char *)pbVar16,"challengeData");
          if (iVar6 == 0) {
            FUN_00028b20(param_2 + 0x13c,param_1);
          }
          else {
            iVar6 = _strcmp((char *)pbVar16,"challengeDataPersistent");
            if (iVar6 == 0) {
              FUN_00028ffc(param_2 + 0x13c,param_1);
            }
            else {
              iVar6 = _strcmp((char *)pbVar16,"unlocked");
              if (iVar6 == 0) {
                FUN_000281c8(param_1,param_2,0);
              }
              else {
                iVar6 = _strcmp((char *)pbVar16,"gameStateData");
                if (iVar6 == 0) {
                  FUN_0030c6c0(param_1,"gameState",param_2 + 0x104);
                  FUN_0030c6c0(param_1,"modeState",param_2 + 0x108);
                  iVar6 = FUN_0030c718(param_1,"modeTime",&local_f0);
                  if (iVar6 == 0) {
                    *(float *)(param_2 + 0x10c) = (float)local_f0;
                  }
                  FUN_0030c6c0(param_1,"classicBeanCount",param_2 + 0x110);
                  FUN_0030c6c0(param_1,"classicRequiredWaves",param_2 + 0x114);
                  FUN_0030c6c0(param_1,"classicCurrentWave",param_2 + 0x118);
                }
                else {
                  iVar6 = _strcmp((char *)pbVar16,"total");
                  if (iVar6 == 0) {
                    pcVar12 = (char *)FUN_0030c660(param_1,"score");
                    iVar6 = 0;
                    if ((pcVar12 != (char *)0x0) && (iVar6 = 0, *pcVar12 != '\0')) {
                      iVar6 = _atoi(pcVar12);
                    }
                    pcVar12 = (char *)FUN_0030c660(param_1,"u");
                    bVar3 = false;
                    if (((pcVar12 != (char *)0x0) && (bVar3 = false, *pcVar12 != '\0')) &&
                       (iVar15 = _strcmp(pcVar12,"true"), iVar15 == 0)) {
                      bVar3 = true;
                    }
                    pcVar12 = (char *)FUN_0030c660(param_1,"type");
                    cVar2 = '\0';
                    if (pcVar12 != (char *)0x0) {
                      cVar2 = *pcVar12;
                    }
                    if ((pcVar12 != (char *)0x0 && cVar2 != '\0') && (0 < iVar6)) {
                      sVar10 = _strlen(pcVar12);
                      iVar15 = FUN_002f69c4(pcVar12,sVar10);
                      uVar7 = 1;
                      if (!bVar3) {
                        uVar5 = 0;
                        if ((DAT_00557a3c & 1) == 0) {
                          iVar8 = ___cxa_guard_acquire(&DAT_00557a3c);
                          uVar5 = 0;
                          if (iVar8 != 0) {
                            DAT_00557a40 = FUN_002f69c4("all",3);
                            DAT_00557a44 = FUN_002f69c4("games",5);
                            DAT_00557a48 = FUN_002f69c4("totalscore",10);
                            DAT_00557a4c = FUN_002f69c4("sessions",8);
                            DAT_00557a50 = FUN_002f69c4("bomb",4);
                            DAT_00557a54 = FUN_002f69c4("coming_soon",0xb);
                            DAT_00557a58 = FUN_002f69c4("unrated_games",0xd);
                            ___cxa_guard_release(&DAT_00557a3c);
                            uVar5 = 0;
                          }
                        }
                        do {
                          uVar7 = 0;
                          if (6 < uVar5) break;
                          piVar1 = &DAT_00557a40 + uVar5;
                          uVar7 = 1;
                          uVar5 = uVar5 + 1;
                        } while (*piVar1 != iVar15);
                      }
                      FUN_00027588(param_2,pcVar12,iVar15,iVar6,uVar7,0);
                    }
                  }
                  else {
                    iVar6 = _strcmp((char *)pbVar16,"ent");
                    if (iVar6 == 0) {
                      if ((1 < *(int *)(param_2 + 0x5c)) ||
                         (iVar15 = *(int *)(param_2 + 0x2d4), iVar6 = FUN_0002612c(),
                         iVar15 != iVar6)) goto LAB_00028ae0;
                      uVar7 = FUN_0030c660(param_1,"pos");
                      FUN_000394a0(&local_148,uVar7);
                      local_130 = local_148;
                      local_12c = local_144;
                      local_128 = local_140;
                      uVar7 = FUN_0030c660(param_1,"vel");
                      FUN_000394a0(&local_154,uVar7);
                      local_13c = local_154;
                      local_138 = local_150;
                      local_134 = local_14c;
                      uVar7 = FUN_0030c660(param_1,"grav");
                      FUN_000394a0(&local_160,uVar7);
                      local_118 = local_160;
                      local_114 = local_15c;
                      local_110 = local_158;
                      uVar7 = FUN_0030c660(param_1,"scale");
                      FUN_000394a0(&local_16c,uVar7);
                      local_124 = local_16c;
                      local_120 = local_168;
                      local_11c = local_164;
                      uVar17 = FUN_0030c660(param_1,"wait");
                      uVar5 = (uint)((ulonglong)uVar17 >> 0x20);
                      pbVar11 = (byte *)uVar17;
                      if (pbVar11 != (byte *)0x0) {
                        uVar5 = (uint)*pbVar11;
                      }
                      if (pbVar11 != (byte *)0x0 && uVar5 != 0) {
                        _atof((char *)pbVar11);
                        local_fc = (float)(double)CONCAT44(extraout_r1,extraout_r0);
                      }
                      pcVar12 = (char *)FUN_0030c660(param_1,"hit");
                      local_10c = 0;
                      if (((pcVar12 != (char *)0x0) && (local_10c = 0, *pcVar12 != '\0')) &&
                         (iVar6 = _strcmp(pcVar12,"true"), iVar6 == 0)) {
                        local_10c = 1;
                      }
                      FUN_0030c6c0(param_1,"hits",auStack_104);
                      local_170 = 0;
                      FUN_0030c6c0(param_1,"id",&local_170);
                      local_100 = local_170;
                      uVar17 = FUN_0030c660(param_1,"type");
                      uVar5 = (uint)((ulonglong)uVar17 >> 0x20);
                      pbVar11 = (byte *)uVar17;
                      if (pbVar11 != (byte *)0x0) {
                        uVar5 = (uint)*pbVar11;
                      }
                      if (pbVar11 != (byte *)0x0 && uVar5 != 0) {
                        local_108 = _atoi((char *)pbVar11);
                      }
                      local_f8 = -1.0;
                      iVar6 = FUN_0030c718(param_1,"sliceWait",&local_f0);
                      if (iVar6 == 0) {
                        local_f8 = (float)local_f0;
                      }
                      iVar6 = FUN_0030c328(param_1,"superFruitState");
                      if (iVar6 == 0) {
                        local_f4 = (undefined4 *)0x0;
                      }
                      else {
                        local_f4 = operator_new(0x10);
                        *local_f4 = 0;
                        local_f4[1] = 0;
                        local_f4[2] = 0;
                        local_f4[3] = 0;
                        FUN_00050528(local_f4,iVar6);
                      }
                      p_Var13 = (_List_node_base *)FUN_000233b4(param_2 + 0x34,&local_13c);
                      std::_List_node_base::hook(p_Var13);
                    }
                    else {
                      iVar6 = _strcmp((char *)pbVar16,"powers");
                      if (iVar6 == 0) {
                        if ((1 < *(int *)(param_2 + 0x5c)) ||
                           (iVar15 = *(int *)(param_2 + 0x2d4), iVar6 = FUN_0002612c(),
                           iVar15 != iVar6)) goto LAB_00028ae0;
                        uVar7 = FUN_00031290();
                        FUN_000323b4(uVar7,param_1,*(undefined4 *)(param_2 + 0x5c));
                      }
                      else {
                        iVar6 = _strcmp((char *)pbVar16,"wave_info");
                        if (iVar6 == 0) {
                          if ((*(int *)(param_2 + 0x5c) < 2) &&
                             (iVar15 = *(int *)(param_2 + 0x2d4), iVar6 = FUN_0002612c(),
                             iVar15 == iVar6)) {
                            FUN_00027f24(param_1,param_2);
                          }
                          goto LAB_00028ae0;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      iVar15 = param_2 + 0x28c;
      iVar6 = 0;
      do {
        if (1 < iVar6) goto LAB_0002877e;
        uVar7 = FUN_000254b0(iVar6);
        FUN_002f702c(acStack_e4,0x80,"wave_counts_%s",uVar7);
        iVar8 = _strcmp((char *)pbVar16,acStack_e4);
        iVar15 = iVar15 + 0x18;
        iVar6 = iVar6 + 1;
      } while (iVar8 != 0);
      iVar6 = FUN_0030c328(param_1,"game_count");
      if (iVar6 != 0) {
        do {
          local_174 = 0xffffffff;
          local_178 = 0xffffffff;
          FUN_0030c6c0(iVar6,"waveIdx",&local_174);
          FUN_0030c6c0(iVar6,"games",&local_178);
          uVar7 = local_178;
          puVar9 = (undefined4 *)FUN_0002b240(iVar15,&local_174);
          *puVar9 = uVar7;
          iVar6 = FUN_0030c3a0(iVar6,"game_count");
        } while (iVar6 != 0);
      }
    }
  }
  else {
LAB_0002877e:
    for (iVar6 = *(int *)(param_1 + 0x18); iVar6 != 0; iVar6 = *(int *)(iVar6 + 0x28)) {
      FUN_00028350(iVar6,param_2);
    }
  }
LAB_00028ae0:
  if (*(int *)PTR____stack_chk_guard_004d9044 == local_24) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

## FUN_0002504c — 0002504c

- 函数名: FUN_0002504c
- 函数体: 277 字节
- 调用者数: 1 / 被调用者数: 5

```c

void FUN_0002504c(void)

{
  undefined4 *puVar1;
  undefined *puVar2;
  undefined4 uVar3;
  void *pvVar4;
  undefined4 uVar5;
  
  puVar2 = PTR_DAT_004d9048;
  uVar5 = *(undefined4 *)(PTR_DAT_004d9048 + 0x5c);
  uVar3 = FUN_002f69c4("sessions",8);
  FUN_00027588(uVar5,"sessions",uVar3,1,1,1);
  *(undefined4 *)(puVar2 + 0x1ac) = 0;
  puVar2[9] = 2;
  uVar3 = FUN_00025164();
  *(undefined4 *)(puVar2 + 0xac) = uVar3;
  *(undefined4 *)(puVar2 + 0xb0) = 0x43a00000;
  *(undefined4 *)(puVar2 + 0xbc) = uVar3;
  *(undefined4 *)(puVar2 + 0xc0) = 0x43a00000;
  *(undefined4 *)(puVar2 + 0xb4) = uVar3;
  *(undefined4 *)(puVar2 + 0xb8) = 0x43a00000;
  puVar2[0x1bf] = 0;
  puVar2[0x1a] = 0;
  *(undefined4 *)(puVar2 + 0x94) = 0x42480000;
  *(undefined4 *)(puVar2 + 0x24) = 0;
  *(undefined4 *)(puVar2 + 0x3c) = 0;
  *(undefined4 *)(puVar2 + 0x40) = *(undefined4 *)(*(int *)(puVar2 + 0x5c) + 0x100);
  puVar2[0x19] = 0;
  puVar2[0x18] = 0;
  puVar2[0xab] = 0;
  *(undefined4 *)(puVar2 + 0x1c8) = 0;
  puVar2[0x1be] = 0;
  puVar2[0x1c4] = 0;
  puVar2[0x29] = 1;
  puVar2[0x2a] = 1;
  puVar2[0x17] = 1;
  *(undefined4 *)(puVar2 + 0x18c) = 0;
  *(undefined4 *)(puVar2 + 0x30) = 0;
  *(undefined4 *)(puVar2 + 0x34) = 0;
  *(undefined4 *)(puVar2 + 0x38) = 0;
  puVar2[0x1bc] = 0;
  puVar2[0x5d0] = 0;
  *(undefined4 *)(puVar2 + 0x5d4) = 0;
  puVar2[0x1bd] = 1;
  puVar2[0x15] = 0;
  puVar2[0x5d1] = 0;
  pvVar4 = operator_new(0x18);
  *(undefined4 *)((int)pvVar4 + 8) = 0;
  *(undefined4 *)((int)pvVar4 + 0xc) = 0;
  *(undefined4 *)((int)pvVar4 + 0x10) = 0;
  *(undefined4 *)((int)pvVar4 + 0x14) = 0;
  puVar1 = (undefined4 *)((int)pvVar4 + 4);
  *puVar1 = 0;
  *(undefined4 **)((int)pvVar4 + 0xc) = puVar1;
  *(undefined4 **)((int)pvVar4 + 0x10) = puVar1;
  *(void **)(puVar2 + 0x654) = pvVar4;
  FUN_00025a48(pvVar4,0);
  *(undefined4 *)((int)pvVar4 + 8) = 0;
  *(undefined4 **)((int)pvVar4 + 0xc) = puVar1;
  *(undefined4 **)((int)pvVar4 + 0x10) = puVar1;
  *(undefined4 *)((int)pvVar4 + 0x14) = 0;
  return;
}


```

