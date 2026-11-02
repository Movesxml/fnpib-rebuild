# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0001e3d8 — 0001e3d8

- 函数名: FUN_0001e3d8
- 函数体: 1431 字节
- 调用者数: 0 / 被调用者数: 48

```c

void FUN_0001e3d8(void)

{
  undefined *puVar1;
  int iVar2;
  int *piVar3;
  undefined4 uVar4;
  int iVar5;
  int iVar6;
  void *pvVar7;
  undefined4 local_344;
  undefined1 auStack_340 [40];
  undefined1 auStack_318 [40];
  undefined1 auStack_2f0 [40];
  undefined1 auStack_2c8 [40];
  undefined1 auStack_2a0 [40];
  undefined1 auStack_278 [40];
  undefined1 auStack_250 [40];
  undefined1 auStack_228 [40];
  undefined1 auStack_200 [40];
  undefined1 auStack_1d8 [40];
  undefined1 auStack_1b0 [40];
  undefined1 auStack_188 [40];
  undefined1 auStack_160 [40];
  undefined1 auStack_138 [40];
  undefined1 auStack_110 [40];
  undefined1 auStack_e8 [40];
  undefined1 auStack_c0 [40];
  undefined1 auStack_98 [40];
  undefined *local_70;
  undefined *local_6c;
  undefined1 local_50;
  undefined *local_4c;
  undefined *local_48;
  undefined1 local_2c;
  undefined1 local_28 [4];
  int local_24;
  
  puVar1 = PTR_DAT_004d9048;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  if (DAT_005577a4 == '\0') {
    iVar2 = FUN_002eddd0();
    *(undefined1 *)(iVar2 + 4) = 0;
    pvVar7 = *(void **)(puVar1 + 0x4c);
    if (pvVar7 == (void *)0x0) {
      pvVar7 = operator_new(0x28);
      FUN_0003e6d8();
      *(void **)(PTR_DAT_004d9048 + 0x4c) = pvVar7;
    }
    FUN_0003e72c(pvVar7);
    puVar1 = PTR_DAT_004d9048;
    FUN_00043bd4(0xc,*(undefined4 *)(PTR_DAT_004d9048 + 0x4c));
    piVar3 = operator_new(0x108);
    FUN_00050d7c();
    *(int **)(puVar1 + 0x19c) = piVar3;
    (**(code **)(*piVar3 + 8))(piVar3);
    FUN_00050f38(*(undefined4 *)(puVar1 + 0x19c),0x42b5cccd);
    FUN_0003e9e8(*(undefined4 *)(puVar1 + 0x4c),*(undefined4 *)(puVar1 + 0x19c),0);
    *(undefined4 *)(puVar1 + 0x1a0) = 0;
    DAT_005577dc = *(undefined4 *)(puVar1 + 100);
    puVar1[10] = 0;
    DAT_005577a8 = 0;
    DAT_005577a4 = '\x01';
    uVar4 = FUN_0030a1d8();
    FUN_00309d20(uVar4,"Sound/FruitNinja",0x80000,0);
    FUN_00084960(0x20000);
    uVar4 = FUN_000065c4();
    FUN_00006630(uVar4,8,0x2000);
    iVar2 = FUN_000065c4();
    local_2c = 1;
    local_4c = (undefined *)0x0;
    FUN_00006d10(&local_4c);
    local_2c = 0;
    local_4c = &DAT_0052c148;
    local_48 = PTR_FUN_004d90c8;
    (*(code *)PTR_FUN_0052c150)(&local_4c,iVar2 + 0x1024);
    FUN_00006d10(&local_4c);
    iVar2 = FUN_000065c4();
    local_50 = 1;
    local_70 = (undefined *)0x0;
    FUN_00006ce0(&local_70);
    local_50 = 0;
    local_70 = &DAT_0052c128;
    local_6c = PTR_FUN_004d90cc;
    (*(code *)PTR_FUN_0052c130)(&local_70,iVar2 + 0x1048);
    FUN_00006ce0(&local_70);
    piVar3 = operator_new(0xa4);
    FUN_00051e60();
    *(int **)(puVar1 + 400) = piVar3;
    (**(code **)(*piVar3 + 8))(piVar3);
    FUN_0001dde4();
    iVar2 = FUN_003ecb20();
    FUN_0030f7cc(auStack_98,"Background");
    FUN_003ee5b4(iVar2,auStack_98);
    FUN_0030f7e0(auStack_98);
    FUN_0002ede8();
    FUN_0002fb64();
    FUN_0030f7cc(auStack_c0,"about");
    FUN_003ee5d8(iVar2,auStack_c0);
    FUN_0030f7e0(auStack_c0);
    FUN_0030f7cc(auStack_e8,"@creditsObject");
    iVar5 = FUN_003f06d0(iVar2,auStack_e8);
    if (iVar5 != 0) {
      iVar6 = *(int *)(iVar5 + 0x40);
      iVar5 = *(int *)(iVar6 + 0x28);
      if (iVar5 != *(int *)(PTR_DAT_004d9110 + 0x28) && iVar6 != 0) {
        do {
          iVar6 = *(int *)(iVar6 + 0x2c);
          if (iVar6 != 0) {
            iVar5 = *(int *)(iVar6 + 0x28);
          }
        } while (iVar6 != 0 && iVar5 != *(int *)(PTR_DAT_004d9110 + 0x28));
      }
    }
    FUN_0030f7e0(auStack_e8);
    iVar5 = FUN_0001cfb0(*(undefined4 *)(PTR_DAT_004d9048 + 0x654),"about",0);
    local_28[0] = 0;
    FUN_0001da28(*(undefined4 *)(iVar5 + 0x260),local_28);
    FUN_0030f7cc(auStack_110,"inGameClassic");
    FUN_003ee5d8(iVar2,auStack_110);
    FUN_0030f7e0(auStack_110);
    FUN_0030f7cc(auStack_138,"inGameChallengeHud");
    FUN_003ee5d8(iVar2,auStack_138);
    FUN_0030f7e0(auStack_138);
    FUN_0030f7cc(auStack_160,"mainscreen");
    FUN_003ee5d8(iVar2,auStack_160);
    FUN_0030f7e0(auStack_160);
    FUN_0030f7cc(auStack_188,"extras");
    FUN_003ee5d8(iVar2,auStack_188);
    FUN_0030f7e0(auStack_188);
    FUN_0030f7cc(auStack_1b0,"gamemode");
    FUN_003ee5d8(iVar2,auStack_1b0);
    FUN_0030f7e0(auStack_1b0);
    FUN_0030f7cc(auStack_1d8,"newsscreen");
    FUN_003ee5d8(iVar2,auStack_1d8);
    FUN_0030f7e0(auStack_1d8);
    FUN_0030f7cc(auStack_200,"shopScreen");
    FUN_003ee5d8(iVar2,auStack_200);
    FUN_0030f7e0(auStack_200);
    FUN_0030f7cc(auStack_228,"inGameChallengeBackground");
    FUN_003ee5d8(iVar2,auStack_228);
    FUN_0030f7e0(auStack_228);
    FUN_0030f7cc(auStack_250,"inGameChallengeScoreScreen");
    FUN_003ee5d8(iVar2,auStack_250);
    FUN_0030f7e0(auStack_250);
    FUN_0030f7cc(auStack_278,"inGameChallengeScoreScreenComplete");
    FUN_003ee5d8(iVar2,auStack_278);
    FUN_0030f7e0(auStack_278);
    FUN_0030f7cc(auStack_2a0,"inGameChallengeScoreScreenCompleteFailure");
    FUN_003ee5d8(iVar2,auStack_2a0);
    FUN_0030f7e0(auStack_2a0);
    FUN_0030f7cc(auStack_2c8,"inGameChallengeInstructionsScreen");
    FUN_003ee5d8(iVar2,auStack_2c8);
    FUN_0030f7e0(auStack_2c8);
    FUN_0030f7cc(auStack_2f0,"inGameChallengeMapScreen");
    FUN_003ee5d8(iVar2,auStack_2f0);
    FUN_0030f7e0(auStack_2f0);
    FUN_0030f7cc(auStack_318,"pause");
    FUN_003ee5d8(iVar2,auStack_318);
    FUN_0030f7e0(auStack_318);
    FUN_0030f7cc(auStack_340,"results");
    FUN_003ee5d8(iVar2,auStack_340);
    FUN_0030f7e0(auStack_340);
    FUN_00062a44();
    FUN_00071ad4();
    iVar5 = 0x1e;
    do {
      uVar4 = FUN_000065c4();
      iVar6 = FUN_0000698c(uVar4,1,1);
      *(uint *)(iVar6 + 0xc) = *(uint *)(iVar6 + 0xc) | 0x11;
      uVar4 = FUN_000065c4();
      iVar6 = FUN_0000698c(uVar4,2,1);
      *(uint *)(iVar6 + 0xc) = *(uint *)(iVar6 + 0xc) | 0x11;
      uVar4 = FUN_000065c4();
      iVar6 = FUN_0000698c(uVar4,5,1);
      iVar5 = iVar5 + -1;
      *(uint *)(iVar6 + 0xc) = *(uint *)(iVar6 + 0xc) | 0x11;
    } while (iVar5 != 0);
    uVar4 = FUN_0036aa24();
    FUN_0036ab34(&local_344,uVar4,"textures/effects/flash.tex");
    FUN_00026e98(&DAT_005577c8,local_344);
    FUN_00026ed0(&local_344);
    FUN_0001bbf0(0x100);
    piVar3 = operator_new(0xe4);
    FUN_0003fd5c();
    DAT_005577e0 = piVar3;
    (**(code **)(*piVar3 + 8))(piVar3);
    piVar3 = DAT_005577e0;
    puVar1 = PTR_DAT_004d9048;
    *(int **)(PTR_DAT_004d9048 + 0x18c) = DAT_005577e0;
    *(undefined1 *)((int)piVar3 + 0x32) = 1;
    puVar1[0x17] = 1;
    *(undefined4 *)(puVar1 + 0x20) = 0xbf800000;
    FUN_0003e9e8(*(undefined4 *)(puVar1 + 0x4c),piVar3,0);
    FUN_0003e9e8(*(undefined4 *)(puVar1 + 0x4c),*(undefined4 *)(puVar1 + 400),0);
    FUN_00052f80();
    FUN_00053b94();
    FUN_0001e970();
    FUN_00060878();
    FUN_0006fa28();
    if (puVar1[0x1b1] != '\0') {
      FUN_00052f80();
      FUN_00055228();
    }
    FUN_003ef458(iVar2,0x3a83126f);
    FUN_00008b64(0x20);
    puVar1 = PTR_DAT_004d9048;
    *(uint *)(iVar2 + 0xc0) = (byte)PTR_DAT_004d9048[0x54] ^ 1;
    FUN_0002bc8c(*(undefined4 *)(puVar1 + 0x1a4));
    *(undefined *)(*(int *)(puVar1 + 0x1a8) + 0xe) = puVar1[0x56];
  }
  piVar3 = (int *)FUN_002eddd0();
  (**(code **)(*piVar3 + 0x38))(piVar3,0);
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

