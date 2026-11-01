# 全局字段引用函数（完整反编译）

- 全局地址: 004d9048
- 字段偏移: 0x40
- 直接引用函数数: 310

## FUN_00003d6c — 00003d6c

```c

undefined4 FUN_00003d6c(int param_1,int param_2,undefined4 *param_3)

{
  int iVar1;
  undefined4 uVar2;
  void *pvVar3;
  _Rb_tree_node_base *p_Var4;
  
  if (((param_2 != 0) && (iVar1 = FUN_0001cd10(0), iVar1 == 1)) &&
     (iVar1 = FUN_0002787c(*(undefined4 *)(PTR_DAT_004d9048 + 0x5c),param_2 + 0x40,
                           *(undefined4 *)(param_2 + 0x80)), iVar1 == 1)) {
    iVar1 = param_1 + *(int *)(param_2 + 0x98) * 0x18;
    p_Var4 = *(_Rb_tree_node_base **)(iVar1 + 0x24);
    while (p_Var4 != (_Rb_tree_node_base *)(iVar1 + 0x1c)) {
      if (*(int *)(p_Var4 + 0x14) == param_2) {
        uVar2 = std::_Rb_tree_increment((_Rb_tree_node_base *)*param_3);
        *param_3 = uVar2;
        param_1 = param_1 + *(int *)(param_2 + 0x98) * 0x18;
        pvVar3 = (void *)std::_Rb_tree_rebalance_for_erase
                                   (p_Var4,(_Rb_tree_node_base *)(param_1 + 0x1c));
        operator_delete(pvVar3);
        *(int *)(param_1 + 0x2c) = *(int *)(param_1 + 0x2c) + -1;
        return 1;
      }
      p_Var4 = (_Rb_tree_node_base *)std::_Rb_tree_increment(p_Var4);
      iVar1 = param_1 + *(int *)(param_2 + 0x98) * 0x18;
    }
  }
  return 0;
}


```

## FUN_00023dac — 00023dac

```c

void FUN_00023dac(undefined4 param_1)

{
  undefined *puVar1;
  undefined *puVar2;
  undefined4 uVar3;
  int *piVar4;
  undefined4 uVar5;
  int *piVar6;
  undefined4 uVar7;
  int iVar8;
  void *pvVar9;
  char *pcVar10;
  undefined4 *puVar11;
  code *pcVar12;
  undefined1 *puVar13;
  undefined8 uVar14;
  undefined4 local_114;
  undefined4 local_110;
  undefined4 local_10c;
  undefined4 local_108;
  undefined1 local_104;
  undefined1 local_103;
  undefined1 local_102;
  undefined1 local_101;
  undefined **local_100;
  undefined1 *local_fc;
  undefined1 local_e0;
  undefined1 auStack_dc [40];
  undefined1 auStack_b4 [40];
  undefined1 auStack_8c [40];
  undefined1 auStack_64 [40];
  undefined1 auStack_3c [4];
  undefined4 local_38;
  undefined4 local_34;
  undefined4 *local_30;
  undefined4 *local_2c;
  undefined4 local_28;
  int local_24;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  (**(code **)(*(int *)PTR_DAT_004d911c + 8))();
  FUN_002ee82c(PTR_DAT_004d904c);
  piVar4 = operator_new(0x14);
  FUN_002f507c();
  (**(code **)(*piVar4 + 0x24))(piVar4,"",0);
  uVar5 = FUN_002f4d9c();
  FUN_002f4eac(uVar5,piVar4,0,0);
  piVar4 = (int *)FUN_002eddd0();
  pcVar12 = *(code **)(*piVar4 + 0x7c);
  piVar6 = (int *)FUN_002eddd0();
  uVar5 = (**(code **)(*piVar6 + 0xa0))();
  piVar6 = (int *)FUN_002eddd0();
  uVar7 = (**(code **)(*piVar6 + 0x9c))();
  (*pcVar12)(piVar4,0,uVar5,0,uVar7);
  FUN_00038880();
  FUN_00038884();
  local_30 = &local_38;
  local_28 = 0;
  local_34 = 0;
  local_38 = 0;
  local_2c = local_30;
  FUN_0030f7cc(auStack_64,"platform");
  uVar5 = FUN_00025890(auStack_3c,auStack_64);
  FUN_0030f7f4(uVar5,"ios");
  FUN_0030f7e0(auStack_64);
  FUN_0030f7cc(auStack_8c,"product");
  uVar5 = FUN_00025890(auStack_3c,auStack_8c);
  FUN_0030f7f4(uVar5,"SD");
  FUN_0030f7e0(auStack_8c);
  piVar4 = (int *)FUN_002eddd0();
  iVar8 = (**(code **)(*piVar4 + 0x90))();
  if (iVar8 == 4) {
    puVar13 = auStack_b4;
    FUN_0030f7cc(puVar13,"tablet");
    uVar5 = FUN_00025890(auStack_3c,puVar13);
    pcVar10 = "true";
  }
  else {
    puVar13 = auStack_dc;
    FUN_0030f7cc(puVar13,"tablet");
    uVar5 = FUN_00025890(auStack_3c,puVar13);
    pcVar10 = "false";
  }
  FUN_0030f7f4(uVar5,pcVar10);
  FUN_0030f7e0(puVar13);
  uVar5 = FUN_003527fc();
  uVar7 = FUN_0002611c();
  FUN_0035286c(uVar5,"Services",uVar7,auStack_3c);
  FUN_002dfcd4();
  FUN_0020a150();
  FUN_00286bf4();
  FUN_0027f38c();
  FUN_002066fc();
  pcVar10 = (char *)FUN_002fc550();
  iVar8 = _strcmp(pcVar10,"iPad");
  if (iVar8 != 0) {
    pcVar10 = (char *)FUN_002fc550();
    iVar8 = _strcmp(pcVar10,"iPod Touch 4G");
    if (iVar8 != 0) {
      FUN_00086a10();
    }
  }
  FUN_00352ac0(uVar5);
  piVar4 = (int *)FUN_0002592c(uVar5,0);
  pcVar12 = *(code **)(*piVar4 + 0x40);
  local_e0 = 1;
  local_100 = (undefined **)0x0;
  Mortar::
  StackAllocatedPointer<Mortar::Delegate2<void,char_const*,Mortar::User*>::BaseDelegate,32ul>::
  Delete();
  local_e0 = 0;
  local_100 = &PTR_LAB_0052c2e8;
  local_fc = &LAB_00024274_1;
  (*pcVar12)(piVar4,&local_100);
  Mortar::
  StackAllocatedPointer<Mortar::Delegate2<void,char_const*,Mortar::User*>::BaseDelegate,32ul>::
  Delete();
  iVar8 = FUN_003527fc();
  if ((*(int *)(iVar8 + 0x58) != 0) && (iVar8 = FUN_0035101c(), iVar8 == 1)) {
    uVar5 = FUN_00352c04();
    (**(code **)(*piVar4 + 0x44))(piVar4,uVar5);
    (**(code **)(*piVar4 + 0x48))(piVar4,uVar5);
  }
  FUN_003527fc();
  piVar4 = (int *)FUN_00025a04();
  if (piVar4 != (int *)0x0) {
    (**(code **)(*piVar4 + 0x48))();
  }
  piVar4 = (int *)FUN_002eddd0();
  (**(code **)(*piVar4 + 0xc))(piVar4,param_1,"Fruit Ninja PiB",0);
  piVar4 = (int *)FUN_002eddd0();
  local_104 = (undefined1)DAT_005578c4;
  local_103 = (undefined1)((uint)DAT_005578c4 >> 8);
  local_102 = (undefined1)((uint)DAT_005578c4 >> 0x10);
  local_101 = (undefined1)((uint)DAT_005578c4 >> 0x18);
  (**(code **)(*piVar4 + 0xb8))(piVar4,&local_104);
  iVar8 = FUN_002eddd0();
  local_110 = 0;
  local_10c = 0xc1200000;
  local_108 = 0xc0a00000;
  puVar11 = &local_110;
  if (*(char *)(iVar8 + 0x30) != '\0') {
    puVar11 = (undefined4 *)(iVar8 + 0x20);
  }
  *(undefined4 *)(iVar8 + 0x20) = *puVar11;
  *(undefined4 *)(iVar8 + 0x24) = puVar11[1];
  *(undefined4 *)(iVar8 + 0x28) = puVar11[2];
  uVar5 = FUN_0036aa24(*(undefined1 *)(iVar8 + 0x30));
  FUN_0036aa7c(uVar5,0x800);
  uVar5 = FUN_0036aa24();
  FUN_0036aa7c(uVar5,0xc800);
  FUN_00009ae0();
  FUN_00304658(&DAT_0052c308,0x26c00);
  FUN_00301c14(PTR_DAT_004d9120,0x7d000);
  if (((DAT_00537b20 & 1) == 0) && (iVar8 = ___cxa_guard_acquire(&DAT_00537b20), iVar8 != 0)) {
    FUN_002fa6fc(&DAT_00537af0);
    ___cxa_atexit(PTR_FUN_004d90c4,&DAT_00537af0,PTR___mh_execute_header_004d9040);
    ___cxa_guard_release(&DAT_00537b20);
  }
  FUN_002fa768(&DAT_00537af0,0xe);
  uVar5 = FUN_00033ca0();
  iVar8 = FUN_000260f0();
  pcVar10 = "particles/particles_slow.xml";
  if (iVar8 != 0) {
    pcVar10 = "particles/particles_fast.xml";
  }
  FUN_00035ac0(uVar5,"particles",pcVar10,0);
  FUN_00024284();
  pvVar9 = operator_new(0x19c);
  FUN_00005004();
  puVar2 = PTR_DAT_004d9048;
  *(void **)(PTR_DAT_004d9048 + 0x58) = pvVar9;
  uVar3 = DAT_0052bfe8;
  uVar7 = DAT_0052bfe4;
  uVar5 = DAT_0052bfe0;
  puVar2[0xa9] = 0;
  puVar2[0xa8] = 0;
  puVar2[0xaa] = 0;
  *(undefined4 *)(puVar2 + 0x9c) = uVar5;
  *(undefined4 *)(puVar2 + 0xa0) = uVar7;
  *(undefined4 *)(puVar2 + 0xa4) = uVar3;
  *(undefined4 *)(puVar2 + 0x19c) = 0;
  uVar14 = FUN_0037e070();
  *(undefined8 *)(puVar2 + 0x1b4) = uVar14;
  (**(code **)(**(int **)(puVar2 + 0x58) + 0x10))
            (*(int **)(puVar2 + 0x58),0x3f800000,0x461c4000,0x4187999a,0x4134cccd,0);
  _memset(puVar2 + 0x60,0,0x34);
  FUN_0001cdb4(&local_114,"titles_for_menus/back_icon.tex");
  FUN_00026e98(puVar2 + 0x198,local_114);
  FUN_00026ed0(&local_114);
  FUN_000414c0();
  FUN_0001267c();
  FUN_0001a774();
  FUN_000160f4();
  FUN_00006ddc();
  FUN_0004eb84();
  FUN_0002447c();
  FUN_00023b2c();
  FUN_00023d50();
  FUN_0000342c();
  FUN_00003c74();
  FUN_00025d78(auStack_3c,local_34);
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0003bdf0 — 0003bdf0

```c

void FUN_0003bdf0(int param_1)

{
  undefined *puVar1;
  int *piVar2;
  int iVar3;
  int iVar4;
  _List_node_base *p_Var5;
  char *pcVar6;
  int iVar7;
  undefined1 *puVar8;
  int iVar9;
  int iVar10;
  int iVar11;
  undefined4 *puVar12;
  int iVar13;
  int iVar14;
  undefined4 uVar15;
  undefined4 *puVar16;
  undefined1 *puVar17;
  code *pcVar18;
  undefined1 auStack_3a4 [40];
  undefined1 auStack_37c [40];
  undefined1 auStack_354 [40];
  undefined1 auStack_32c [40];
  undefined1 auStack_304 [40];
  undefined1 auStack_2dc [40];
  undefined1 auStack_2b4 [40];
  undefined1 auStack_28c [40];
  undefined1 auStack_264 [40];
  undefined1 auStack_23c [40];
  undefined1 auStack_214 [40];
  undefined1 auStack_1ec [40];
  undefined *local_1c4;
  int local_1c0;
  undefined1 *local_1bc;
  undefined4 local_1b8;
  undefined1 local_1a4;
  undefined1 auStack_1a0 [40];
  undefined1 auStack_178 [40];
  char local_150 [32];
  undefined1 local_130;
  undefined4 local_12c;
  undefined4 local_128;
  char acStack_124 [256];
  int local_24;
  
  puVar1 = PTR_DAT_004d9048;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0xb4) = 0;
  piVar2 = (int *)FUN_0001cfb0(*(undefined4 *)(puVar1 + 0x654),"about",1);
  *(int **)(param_1 + 0xac) = piVar2;
  pcVar18 = *(code **)(*piVar2 + 0x40);
  FUN_0030f7cc(auStack_178,"animate_in");
  (*pcVar18)(piVar2,auStack_178,1);
  FUN_0030f7e0(auStack_178);
  uVar15 = *(undefined4 *)(param_1 + 0xac);
  FUN_0030f7cc(auStack_1a0,"backgroundControl.back.fruit");
  iVar3 = FUN_0039725c(uVar15,auStack_1a0);
  if (iVar3 == 0) {
LAB_0003bf08:
    FUN_0030f7e0(auStack_1a0);
  }
  else {
    iVar9 = *(int *)(iVar3 + 0x40);
    iVar4 = *(int *)(PTR_DAT_004d90d8 + 0x28);
    if (*(int *)(iVar9 + 0x28) != iVar4) {
      iVar10 = 0;
      if (iVar9 != 0) {
        iVar10 = *(int *)(iVar9 + 0x2c);
      }
      if (iVar9 != 0 && iVar10 != 0) {
        do {
          iVar9 = *(int *)(iVar10 + 0x28);
          if (iVar9 != iVar4) {
            iVar10 = *(int *)(iVar10 + 0x2c);
          }
        } while (iVar9 != iVar4 && iVar10 != 0);
        if (iVar9 == iVar4) goto LAB_0003beb6;
      }
      goto LAB_0003bf08;
    }
LAB_0003beb6:
    FUN_0030f7e0(auStack_1a0);
    FUN_0003ca90(iVar3 + 0x75c,*(undefined4 *)(iVar3 + 0x75c));
    puVar16 = (undefined4 *)(iVar3 + 0x76c);
    if (*(int *)(iVar3 + 0x774) == 0) {
      FUN_0003ca68(puVar16);
      *puVar16 = puVar16;
      *(undefined4 **)(iVar3 + 0x770) = puVar16;
    }
    else {
      puVar12 = (undefined4 *)*puVar16;
      if (puVar12 != puVar16) {
        puVar12[0xb] = *(int *)(iVar3 + 0x774);
        puVar12[0xc] = 2;
        *(int *)(iVar3 + 0x778) = *(int *)(iVar3 + 0x778) + 1;
        for (puVar12 = (undefined4 *)*puVar12; puVar12 != puVar16; puVar12 = (undefined4 *)*puVar12)
        {
          puVar12[0xb] = *(undefined4 *)(iVar3 + 0x774);
          puVar12[0xc] = 2;
          *(int *)(iVar3 + 0x778) = *(int *)(iVar3 + 0x778) + 1;
        }
      }
    }
    local_1a4 = 1;
    local_1c4 = (undefined *)0x0;
    FUN_0003c910(&local_1c4);
    local_1a4 = 0;
    local_1c4 = &DAT_0052c4d8;
    local_1b8 = 0;
    local_1bc = &FUN_0003c374_1;
    local_130 = 1;
    local_150[0] = '\0';
    local_150[1] = '\0';
    local_150[2] = '\0';
    local_150[3] = '\0';
    local_1c0 = param_1;
    (*(code *)PTR_FUN_0052c4e0)(&local_1c4,local_150);
    local_12c = 0;
    local_128 = 0;
    p_Var5 = (_List_node_base *)FUN_0003c96c(puVar16,local_150);
    std::_List_node_base::hook(p_Var5);
    FUN_0003c910(local_150);
    if (*(int *)(iVar3 + 0x774) != 0) {
      iVar4 = *(int *)(iVar3 + 0x770);
      *(int *)(iVar4 + 0x2c) = *(int *)(iVar3 + 0x774);
      *(undefined4 *)(iVar4 + 0x30) = 1;
      *(int *)(iVar3 + 0x778) = *(int *)(iVar3 + 0x778) + 1;
    }
    FUN_0003c910(&local_1c4);
  }
  uVar15 = *(undefined4 *)(param_1 + 0xac);
  FUN_0030f7cc(auStack_1ec,"@creditsObject");
  iVar3 = FUN_0039725c(uVar15,auStack_1ec);
  if (iVar3 == 0) {
LAB_0003c25c:
    FUN_0030f7e0(auStack_1ec);
  }
  else {
    iVar9 = *(int *)(iVar3 + 0x40);
    iVar4 = *(int *)(PTR_DAT_004d9110 + 0x28);
    if (*(int *)(iVar9 + 0x28) != iVar4) {
      iVar10 = 0;
      if (iVar9 != 0) {
        iVar10 = *(int *)(iVar9 + 0x2c);
      }
      if (iVar9 != 0 && iVar10 != 0) {
        do {
          iVar9 = *(int *)(iVar10 + 0x28);
          if (iVar9 != iVar4) {
            iVar10 = *(int *)(iVar10 + 0x2c);
          }
        } while (iVar9 != iVar4 && iVar10 != 0);
        if (iVar9 == iVar4) goto LAB_0003c008;
      }
      goto LAB_0003c25c;
    }
LAB_0003c008:
    FUN_0030f7e0(auStack_1ec);
    FUN_003c564c(iVar3,&DAT_0052c010);
    pcVar6 = (char *)FUN_00038844("CREDITS_NUM",0);
    iVar4 = _atoi(pcVar6);
    FUN_003c1f0c(iVar3,iVar4);
    if (0 < iVar4) {
      iVar9 = 0;
      do {
        FUN_0030f7cc(auStack_214,"CREDIT_");
        if (iVar9 < 10) {
          _snprintf(local_150,0xc,"%d",iVar9);
          puVar8 = auStack_264;
          FUN_0030f7cc(puVar8,local_150);
          puVar17 = auStack_23c;
          pcVar6 = "00";
LAB_0003c0ca:
          FUN_0030f7cc(puVar17,pcVar6);
          FUN_0030f978(puVar17,puVar8);
          FUN_0030f978(auStack_214,puVar17);
          FUN_0030f7e0(puVar17);
          FUN_0030f7e0(puVar8);
        }
        else if (iVar9 < 100) {
          _snprintf(local_150,0xc,"%d",iVar9);
          puVar8 = auStack_2b4;
          FUN_0030f7cc(puVar8,local_150);
          puVar17 = auStack_28c;
          pcVar6 = "0";
          goto LAB_0003c0ca;
        }
        uVar15 = FUN_0030f8f0(auStack_214);
        uVar15 = FUN_00038844(uVar15,0);
        FUN_0030f7cc(auStack_2dc,uVar15);
        uVar15 = FUN_002f701c("<1>");
        iVar10 = FUN_0030fe10(auStack_2dc,"<1>",uVar15);
        uVar15 = FUN_003c1dc0(iVar3,iVar9);
        if (iVar10 == 1) {
          FUN_0030f7cc(auStack_304,"heading");
          iVar7 = FUN_0039725c(uVar15,auStack_304);
          iVar10 = 0;
          if (iVar7 != 0) {
            iVar13 = *(int *)(iVar7 + 0x40);
            iVar11 = *(int *)(PTR_DAT_004d9140 + 0x28);
            iVar10 = iVar7;
            if ((*(int *)(iVar13 + 0x28) != iVar11) && (iVar10 = 0, iVar13 != 0)) {
              iVar13 = *(int *)(iVar13 + 0x2c);
              iVar10 = 0;
              if (iVar13 != 0) {
                do {
                  iVar14 = *(int *)(iVar13 + 0x28);
                  if (iVar14 != iVar11) {
                    iVar13 = *(int *)(iVar13 + 0x2c);
                  }
                } while (iVar14 != iVar11 && iVar13 != 0);
                iVar10 = 0;
                if (iVar14 == iVar11) {
                  iVar10 = iVar7;
                }
              }
            }
          }
          FUN_0030f7e0(auStack_304);
          local_150[0] = 1;
          FUN_0001da28(*(undefined4 *)(iVar10 + 0x260),local_150);
          FUN_0030fec4(auStack_32c,auStack_2dc,3,0xffffffff);
          FUN_0030f884(auStack_2dc,auStack_32c);
          FUN_0030f7e0(auStack_32c);
          uVar15 = *(undefined4 *)(iVar10 + 0x7dc);
        }
        else {
          FUN_0030f7cc(auStack_354,"entry");
          iVar7 = FUN_0039725c(uVar15,auStack_354);
          iVar10 = 0;
          if (iVar7 != 0) {
            iVar13 = *(int *)(iVar7 + 0x40);
            iVar11 = *(int *)(PTR_DAT_004d9140 + 0x28);
            iVar10 = iVar7;
            if ((*(int *)(iVar13 + 0x28) != iVar11) && (iVar10 = 0, iVar13 != 0)) {
              iVar13 = *(int *)(iVar13 + 0x2c);
              iVar10 = 0;
              if (iVar13 != 0) {
                do {
                  iVar14 = *(int *)(iVar13 + 0x28);
                  if (iVar14 != iVar11) {
                    iVar13 = *(int *)(iVar13 + 0x2c);
                  }
                } while (iVar14 != iVar11 && iVar13 != 0);
                iVar10 = 0;
                if (iVar14 == iVar11) {
                  iVar10 = iVar7;
                }
              }
            }
          }
          FUN_0030f7e0(auStack_354);
          local_150[0] = 1;
          FUN_0001da28(*(undefined4 *)(iVar10 + 0x260),local_150);
          uVar15 = *(undefined4 *)(iVar10 + 0x7dc);
        }
        FUN_00022950(uVar15,auStack_2dc);
        FUN_0030f7e0(auStack_2dc);
        FUN_0030f7e0(auStack_214);
        iVar9 = iVar9 + 1;
      } while (iVar9 != iVar4);
    }
  }
  uVar15 = FUN_003ecb20();
  FUN_0030f7cc(auStack_37c,"about.backgroundControl.versionNumber");
  iVar3 = FUN_003f06d0(uVar15,auStack_37c);
  if (iVar3 == 0) {
LAB_0003c340:
    puVar8 = auStack_37c;
  }
  else {
    iVar9 = *(int *)(iVar3 + 0x40);
    iVar4 = *(int *)(PTR_DAT_004d9140 + 0x28);
    if (*(int *)(iVar9 + 0x28) != iVar4) {
      iVar10 = 0;
      if (iVar9 != 0) {
        iVar10 = *(int *)(iVar9 + 0x2c);
      }
      if (iVar9 != 0 && iVar10 != 0) {
        do {
          iVar9 = *(int *)(iVar10 + 0x28);
          if (iVar9 != iVar4) {
            iVar10 = *(int *)(iVar10 + 0x2c);
          }
        } while (iVar9 != iVar4 && iVar10 != 0);
        if (iVar9 == iVar4) goto LAB_0003c2b8;
      }
      goto LAB_0003c340;
    }
LAB_0003c2b8:
    FUN_0030f7e0(auStack_37c);
    piVar2 = operator_new(0x48);
    FUN_0030cda0(piVar2,"buildNumber.xml");
    if (piVar2 == (int *)0x0) goto LAB_0003c346;
    iVar4 = FUN_0030ceac(piVar2,0);
    if (iVar4 == 0) {
      (**(code **)(*piVar2 + 4))(piVar2);
      goto LAB_0003c346;
    }
    uVar15 = FUN_0030c328(piVar2,"VersionNumber");
    iVar4 = FUN_0030c660(uVar15,"version");
    if (iVar4 == 0) goto LAB_0003c346;
    local_150[0] = 1;
    FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),local_150);
    _sprintf(acStack_124,"version: %s",iVar4);
    puVar8 = auStack_3a4;
    FUN_0030f7cc(puVar8,acStack_124);
    FUN_00022950(*(undefined4 *)(iVar3 + 0x7dc),puVar8);
  }
  FUN_0030f7e0(puVar8);
LAB_0003c346:
  if (*(int *)PTR____stack_chk_guard_004d9044 == local_24) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

## FUN_0005bf9c — 0005bf9c

```c

void FUN_0005bf9c(int *param_1)

{
  longlong lVar1;
  undefined *puVar2;
  char cVar3;
  undefined4 uVar4;
  int *piVar5;
  int iVar6;
  uint uVar7;
  int iVar8;
  BaseAggregateType *pBVar9;
  undefined4 uVar10;
  undefined4 uVar11;
  undefined4 uVar12;
  uint uVar13;
  int iVar14;
  int iVar15;
  code *pcVar16;
  int iVar17;
  undefined1 *puVar18;
  char *pcVar19;
  undefined **local_418;
  undefined1 *local_414;
  undefined1 local_3f8;
  undefined **local_3f4;
  undefined1 *local_3f0;
  undefined1 local_3d4;
  undefined4 local_3d0 [8];
  undefined1 local_3b0;
  undefined4 local_3ac [8];
  undefined1 local_38c;
  undefined1 auStack_388 [40];
  undefined1 auStack_360 [40];
  undefined1 auStack_338 [40];
  undefined1 auStack_310 [40];
  undefined1 auStack_2e8 [40];
  undefined1 auStack_2c0 [40];
  undefined1 auStack_298 [40];
  undefined1 auStack_270 [40];
  undefined1 auStack_248 [40];
  undefined1 auStack_220 [40];
  undefined1 auStack_1f8 [40];
  undefined1 auStack_1d0 [40];
  undefined1 auStack_1a8 [40];
  undefined1 auStack_180 [40];
  undefined1 auStack_158 [40];
  undefined1 auStack_130 [40];
  undefined1 auStack_108 [40];
  undefined1 auStack_e0 [40];
  undefined1 auStack_b8 [40];
  undefined1 auStack_90 [40];
  undefined1 local_68 [4];
  char acStack_64 [64];
  int iStack_24;
  
  puVar2 = PTR_DAT_004d9048;
  iStack_24 = *(int *)PTR____stack_chk_guard_004d9044;
  PTR_DAT_004d9048[0x1b1] = 0;
  *(undefined4 *)(puVar2 + 0x20) = 0x3f800000;
  *(undefined1 *)(param_1 + 0x2e) = 0;
  *(undefined1 *)((int)param_1 + 0xb9) = 0;
  (**(code **)(*param_1 + 0x10))(param_1);
  iVar15 = param_1[0x2b];
  FUN_0030f7cc(auStack_90,"backgroundControl.score.score");
  iVar15 = FUN_0039725c(iVar15,auStack_90);
  FUN_0030f7e0(auStack_90);
  if (iVar15 != 0) {
    if (*(int *)(PTR_DAT_004d9048 + 0x10) == 1) {
      FUN_00083564(iVar15);
    }
    else {
      *(undefined4 *)(iVar15 + 0x884) = 0;
      FUN_003d0bf4(iVar15);
    }
    *(undefined1 *)(iVar15 + 0x888) = 0;
    *(undefined1 *)(iVar15 + 0x889) = 1;
    *(undefined4 *)(iVar15 + 0x880) = 0;
  }
  iVar14 = param_1[0x2b];
  FUN_0030f7cc(auStack_b8,"backgroundControl.score.bestScore");
  iVar14 = FUN_0039725c(iVar14,auStack_b8);
  FUN_0030f7e0(auStack_b8);
  if (iVar14 != 0) {
    uVar4 = FUN_0001ca48();
    *(undefined4 *)(iVar14 + 0x880) = uVar4;
    FUN_003d0bf4(iVar14);
  }
  iVar14 = param_1[0x2b];
  FUN_0030f7cc(auStack_e0,"backgroundControl.score.newBest");
  piVar5 = (int *)FUN_0039725c(iVar14,auStack_e0);
  FUN_0030f7e0(auStack_e0);
  if (piVar5 != (int *)0x0) {
    local_68[0] = 0;
    FUN_0001da28(piVar5[0x98],local_68);
    FUN_00396d98(piVar5,1);
    FUN_0030f7cc(auStack_108,"bestScore");
    iVar14 = FUN_0039725c(piVar5,auStack_108);
    FUN_0030f7e0(auStack_108);
    if (iVar14 != 0) {
      uVar4 = FUN_0001cd94(0);
      *(undefined4 *)(iVar14 + 0x880) = uVar4;
      FUN_003d0bf4(iVar14);
    }
  }
  iVar14 = FUN_0001ca48();
  iVar6 = FUN_0001cd94(0);
  if (iVar14 <= iVar6) {
    if (*(int *)(PTR_DAT_004d9048 + 0x10) == 1) {
      if (piVar5 != (int *)0x0) {
        local_68[0] = 1;
        FUN_0001da28(piVar5[0x98],local_68);
        pcVar16 = *(code **)(*piVar5 + 0x40);
        FUN_0030f7cc(auStack_130,"animate_in_delay");
        (*pcVar16)(piVar5,auStack_130,1);
        FUN_0030f7e0(auStack_130);
      }
    }
    else if (iVar15 != 0) {
      *(int **)(iVar15 + 0x880) = piVar5;
    }
  }
  iVar15 = param_1[0x2b];
  FUN_0030f7cc(auStack_158,"backgroundControl.fruitFact.poster.animation_wrapper.text2");
  iVar15 = FUN_0039725c(iVar15,auStack_158);
  FUN_0030f7e0(auStack_158);
  if (iVar15 != 0) {
    uVar7 = FUN_000276e8(*(undefined4 *)(PTR_DAT_004d9048 + 0x5c),"lastFruitFact");
    puVar2 = PTR_DAT_004d9050;
    if (uVar7 == 0) {
      lVar1 = (ulonglong)*(uint *)PTR_DAT_004d9050 * (ulonglong)*(uint *)(PTR_DAT_004d9050 + 8);
      uVar7 = (uint)lVar1;
      uVar13 = *(int *)(PTR_DAT_004d9050 + 4) * *(uint *)(PTR_DAT_004d9050 + 8) +
               *(uint *)PTR_DAT_004d9050 * *(int *)(PTR_DAT_004d9050 + 0xc) +
               (int)((ulonglong)lVar1 >> 0x20) +
               *(int *)(PTR_DAT_004d9050 + 0x14) +
               (uint)CARRY4(uVar7,*(uint *)(PTR_DAT_004d9050 + 0x10));
      *(uint *)PTR_DAT_004d9050 = uVar7 + *(uint *)(PTR_DAT_004d9050 + 0x10);
      *(uint *)(puVar2 + 4) = uVar13;
      uVar7 = (uint)((ulonglong)uVar13 * 0x47 >> 0x20);
    }
    iVar14 = (int)((longlong)(int)uVar7 * -0x193d4bb7 + ((ulonglong)uVar7 << 0x20) >> 0x20);
    iVar14 = uVar7 + ((iVar14 >> 6) - (iVar14 >> 0x1f)) * -0x47 + 1;
    FUN_000274bc(*(undefined4 *)(PTR_DAT_004d9048 + 0x5c),"lastFruitFact",iVar14,1,0);
    _sprintf(acStack_64,"FN_PUSS_FACT_%03d",iVar14);
    FUN_0030f7cc(auStack_180,acStack_64);
    FUN_00022950(*(undefined4 *)(iVar15 + 0x7dc),auStack_180);
    FUN_0030f7e0(auStack_180);
  }
  iVar15 = FUN_000276e8(*(undefined4 *)(PTR_DAT_004d9048 + 0x5c),"resultScreenOption");
  if (0 < iVar15) {
    iVar14 = param_1[0x2b];
    FUN_0030f7cc(auStack_1a8,"backgroundControl.fruitFact.leaderboardWrapper");
    iVar6 = FUN_0039725c(iVar14,auStack_1a8);
    FUN_0030f7e0(auStack_1a8);
    iVar14 = param_1[0x2b];
    FUN_0030f7cc(auStack_1d0,"backgroundControl.fruitFact.leaderboardOverallWrapper");
    iVar14 = FUN_0039725c(iVar14,auStack_1d0);
    FUN_0030f7e0(auStack_1d0);
    iVar17 = param_1[0x2b];
    FUN_0030f7cc(auStack_1f8,"backgroundControl.fruitFact.poster");
    iVar17 = FUN_0039725c(iVar17,auStack_1f8);
    FUN_0030f7e0(auStack_1f8);
    uVar4 = FUN_003527fc();
    piVar5 = (int *)FUN_0005a638(uVar4,0);
    if (piVar5 != (int *)0x0) {
      pcVar16 = *(code **)(*piVar5 + 0x40);
      uVar4 = FUN_00352c04();
      iVar8 = (*pcVar16)(piVar5,uVar4);
      if (iVar8 != 0) {
        if (iVar15 % 3 == 1) {
          local_68[0] = 0;
          FUN_0001da28(*(undefined4 *)(iVar17 + 0x260),local_68);
          local_68[0] = 1;
          FUN_0001da28(*(undefined4 *)(iVar6 + 0x260),local_68);
          pcVar19 = "leaderboardConnected";
          if (PTR_DAT_004d9048[0x15] != '\0') {
            pcVar19 = "leaderboard";
          }
          FUN_0030f7cc(auStack_310,pcVar19);
          iVar15 = FUN_0039725c(iVar6,auStack_310);
          FUN_0030f7e0(auStack_310);
          if (iVar15 != 0) {
            local_68[0] = 1;
            FUN_0001da28(*(undefined4 *)(iVar15 + 0x260),local_68);
          }
          puVar18 = auStack_338;
          pcVar19 = "leaderboardConnected";
          if (PTR_DAT_004d9048[0x15] == '\0') {
            pcVar19 = "leaderboard";
          }
          FUN_0030f7cc(puVar18,pcVar19);
          iVar14 = iVar6;
        }
        else {
          if (iVar15 % 3 != 2) goto LAB_0005c4fc;
          local_68[0] = 0;
          FUN_0001da28(*(undefined4 *)(iVar17 + 0x260),local_68);
          local_68[0] = 1;
          FUN_0001da28(*(undefined4 *)(iVar14 + 0x260),local_68);
          pcVar19 = "leaderboardConnected";
          if (PTR_DAT_004d9048[0x15] != '\0') {
            pcVar19 = "leaderboard";
          }
          FUN_0030f7cc(auStack_2c0,pcVar19);
          iVar15 = FUN_0039725c(iVar14,auStack_2c0);
          FUN_0030f7e0(auStack_2c0);
          if (iVar15 != 0) {
            local_68[0] = 1;
            FUN_0001da28(*(undefined4 *)(iVar15 + 0x260),local_68);
          }
          puVar18 = auStack_2e8;
          pcVar19 = "leaderboardConnected";
          if (PTR_DAT_004d9048[0x15] == '\0') {
            pcVar19 = "leaderboard";
          }
          FUN_0030f7cc(puVar18,pcVar19);
        }
        iVar15 = FUN_0039725c(iVar14,puVar18);
        FUN_0030f7e0(puVar18);
        if (iVar15 != 0) {
          local_68[0] = 0;
          FUN_0001da28(*(undefined4 *)(iVar15 + 0x260),local_68);
        }
        goto LAB_0005c4fc;
      }
    }
    FUN_0030f7cc(auStack_220,"leaderboardConnected");
    iVar15 = FUN_0039725c(iVar14,auStack_220);
    local_68[0] = 0;
    FUN_0001da28(*(undefined4 *)(iVar15 + 0x260),local_68);
    FUN_0030f7e0(auStack_220);
    FUN_0030f7cc(auStack_248,"leaderboard.lb.error");
    iVar15 = FUN_0039725c(iVar14,auStack_248);
    local_68[0] = 1;
    FUN_0001da28(*(undefined4 *)(iVar15 + 0x260),local_68);
    FUN_0030f7e0(auStack_248);
    FUN_0030f7cc(auStack_270,"leaderboardConnected");
    iVar15 = FUN_0039725c(iVar6,auStack_270);
    local_68[0] = 0;
    FUN_0001da28(*(undefined4 *)(iVar15 + 0x260),local_68);
    FUN_0030f7e0(auStack_270);
    FUN_0030f7cc(auStack_298,"leaderboard.lb.error");
    iVar15 = FUN_0039725c(iVar6,auStack_298);
    local_68[0] = 1;
    FUN_0001da28(*(undefined4 *)(iVar15 + 0x260),local_68);
    FUN_0030f7e0(auStack_298);
  }
LAB_0005c4fc:
  piVar5 = (int *)param_1[0x2b];
  pcVar16 = *(code **)(*piVar5 + 0x40);
  FUN_0030f7cc(auStack_360,"animate_in");
  (*pcVar16)(piVar5,auStack_360,1);
  FUN_0030f7e0(auStack_360);
  pcVar19 = PTR_DAT_004d9048 + 0x29;
  if (*(int *)(PTR_DAT_004d9048 + 0x10) == 0) {
    pcVar19 = PTR_DAT_004d9048 + 0x2a;
  }
  if (*pcVar19 == '\0') {
    FUN_003527fc();
    piVar5 = (int *)FUN_0001d64c();
    if (piVar5 == (int *)0x0) {
      cVar3 = -1;
      if ('\0' < *pcVar19) {
        cVar3 = *pcVar19 + -1;
      }
      *pcVar19 = cVar3;
    }
    else {
      if (PTR_DAT_004d9048[0x5d1] != '\0') {
        (**(code **)(*piVar5 + 0x44))(piVar5);
      }
      pcVar16 = *(code **)(*piVar5 + 0x40);
      FUN_0030f7cc(auStack_388,"FULLSCREEN_SPACE");
      (*pcVar16)(piVar5,auStack_388);
      FUN_0030f7e0(auStack_388);
      PTR_DAT_004d9048[0x5d1] = 1;
    }
  }
  iVar15 = FUN_0001cd94(0);
  iVar14 = FUN_00004664(0xffffffff);
  if (iVar14 != 0) {
    iVar6 = FUN_00026140();
    if ((iVar6 == 0) &&
       (piVar5 = (int *)(*(int *)(PTR_DAT_004d9048 + 0x5c) + *(int *)(PTR_DAT_004d9048 + 0x10) * 4 +
                        0x4c), *piVar5 < iVar15)) {
      *piVar5 = iVar15;
    }
    uVar4 = FUN_00305d78();
    iVar6 = iVar15 >> 0x1f;
    FUN_00305e10(uVar4,iVar14,iVar15,iVar6,0,0);
    FUN_003527fc();
    pBVar9 = Mortar::ServiceManager::GetServiceAggregate<Mortar::ILeaderboardService>();
    pcVar16 = *(code **)(*(int *)pBVar9 + 0x40);
    uVar4 = FUN_00352c04();
    local_38c = 1;
    local_3ac[0] = 0;
    Mortar::
    StackAllocatedPointer<Mortar::Delegate1<void,Mortar::LeaderboardErrorType>::BaseDelegate,32ul>::
    Delete();
    (*pcVar16)(pBVar9,uVar4,iVar14,iVar15,iVar6,local_3ac);
    Mortar::
    StackAllocatedPointer<Mortar::Delegate1<void,Mortar::LeaderboardErrorType>::BaseDelegate,32ul>::
    Delete();
    pcVar19 = "CLASSIC_SCORES_WEEKLY";
    if ((*(int *)(PTR_DAT_004d9048 + 0x10) != 0) &&
       (pcVar19 = "NEW_MODE_SCORES_WEEKLY", *(int *)(PTR_DAT_004d9048 + 0x10) != 1)) {
      pcVar19 = (char *)0x0;
    }
    pcVar16 = *(code **)(*(int *)pBVar9 + 0x40);
    uVar4 = FUN_00352c04();
    local_3b0 = 1;
    local_3d0[0] = 0;
    Mortar::
    StackAllocatedPointer<Mortar::Delegate1<void,Mortar::LeaderboardErrorType>::BaseDelegate,32ul>::
    Delete();
    (*pcVar16)(pBVar9,uVar4,pcVar19,iVar15,iVar6,local_3d0);
    Mortar::
    StackAllocatedPointer<Mortar::Delegate1<void,Mortar::LeaderboardErrorType>::BaseDelegate,32ul>::
    Delete();
  }
  uVar4 = FUN_0000342c();
  uVar10 = FUN_0001cd94(0);
  FUN_00003e98(uVar4,uVar10);
  if (*(int *)(PTR_DAT_004d9048 + 0x10) == 1) {
    pcVar19 = "banditoGamesFinished";
    uVar10 = *(undefined4 *)(PTR_DAT_004d9048 + 0x5c);
    uVar4 = FUN_002f69c4("banditoGamesFinished",0x14);
  }
  else {
    if (*(int *)(PTR_DAT_004d9048 + 0x10) != 0) goto LAB_0005c84a;
    pcVar19 = "desperadoGamesFinished";
    uVar10 = *(undefined4 *)(PTR_DAT_004d9048 + 0x5c);
    uVar4 = FUN_002f69c4("desperadoGamesFinished",0x16);
  }
  FUN_00027588(uVar10,pcVar19,uVar4,1,1,0);
  if (((*(int *)(PTR_DAT_004d9048 + 0x10) == 1) &&
      (*(char *)(*(int *)(PTR_DAT_004d9048 + 0x5c) + 0x32) == '\0')) &&
     (iVar15 = FUN_000276e8(*(int *)(PTR_DAT_004d9048 + 0x5c),"NEW_MODE_complete"), 0 < iVar15)) {
    FUN_0007505c();
    iVar15 = FUN_000751c4();
    iVar14 = FUN_002f69c4("Music-bonus-end",0xf);
    if (iVar15 == iVar14) {
      FUN_0030a1d8();
      FUN_0030a7e4();
    }
    piVar5 = (int *)FUN_00310a88();
    pcVar16 = *(code **)(*piVar5 + 0xc);
    uVar4 = FUN_00038844("CODE_GOS_LOVE_FRUIT_NINJA",0);
    uVar10 = FUN_00038844("CODE_GOS_PLEASE_RATE",0);
    uVar11 = FUN_00038844("CODE_GOS_NO_THANKS",0);
    local_3d4 = 1;
    local_3f4 = (undefined **)0x0;
    Mortar::StackAllocatedPointer<Mortar::Delegate1<void,int>::BaseDelegate,32ul>::Delete();
    local_3d4 = 0;
    local_3f4 = &PTR_LAB_0052c0e8;
    local_3f0 = &LAB_0005c8d8_1;
    uVar12 = FUN_00038844("CODE_GOS_RATE_NOW",0);
    local_3f8 = 1;
    local_418 = (undefined **)0x0;
    Mortar::StackAllocatedPointer<Mortar::Delegate1<void,int>::BaseDelegate,32ul>::Delete();
    local_3f8 = 0;
    local_418 = &PTR_LAB_0052c0e8;
    local_414 = &LAB_0005c8f0_1;
    (*pcVar16)(piVar5,uVar4,uVar10,uVar11,&local_3f4,uVar12,&local_418,1);
    Mortar::StackAllocatedPointer<Mortar::Delegate1<void,int>::BaseDelegate,32ul>::Delete();
    Mortar::StackAllocatedPointer<Mortar::Delegate1<void,int>::BaseDelegate,32ul>::Delete();
  }
LAB_0005c84a:
  FUN_0005c918(param_1);
  puVar2 = PTR_DAT_004d9048;
  iVar15 = FUN_000276e8(*(undefined4 *)(PTR_DAT_004d9048 + 0x5c),"bean");
  param_1[0x31] = iVar15;
  iVar15 = FUN_000276e8(*(undefined4 *)(puVar2 + 0x5c),"pinatas");
  param_1[0x32] = iVar15;
  param_1[0x33] = 0;
  iVar15 = FUN_0001d10c(puVar2);
  if (iVar15 != 0) {
    iVar15 = FUN_0001d10c(PTR_DAT_004d9048);
    iVar15 = FUN_00066b4c(iVar15 + 0x48);
    param_1[0x33] = iVar15;
  }
  puVar2 = PTR_DAT_004d9048;
  FUN_00027794(*(undefined4 *)(PTR_DAT_004d9048 + 0x5c));
  FUN_000277e4(*(undefined4 *)(puVar2 + 0x5c));
  FUN_00021524(0);
  FUN_00022070();
  if (*(int *)PTR____stack_chk_guard_004d9044 != iStack_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00083138 — 00083138

```c

void FUN_00083138(int param_1,undefined4 param_2)

{
  longlong lVar1;
  undefined *puVar2;
  int iVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  uint uVar7;
  uint uVar8;
  code *pcVar9;
  undefined4 *puVar10;
  int *piVar11;
  undefined4 uVar12;
  uint *puVar13;
  int *piVar14;
  int *piVar15;
  undefined4 extraout_s1;
  undefined8 uVar17;
  undefined8 uVar18;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined8 unaff_d8;
  undefined8 uVar19;
  undefined1 auStack_154 [40];
  undefined **local_12c;
  undefined *local_128;
  undefined1 local_10c;
  undefined **local_108;
  undefined *local_104;
  undefined1 local_e8;
  undefined **local_e4;
  undefined1 *local_e0;
  undefined1 local_c4;
  undefined **local_c0;
  undefined1 *local_bc;
  undefined1 local_a0;
  undefined **local_9c;
  undefined *local_98;
  undefined1 local_7c;
  undefined1 auStack_78 [40];
  undefined1 local_50 [4];
  char acStack_4c [24];
  int local_34;
  uint *puVar16;
  
  local_34 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_003d0f44(param_1);
  puVar10 = (undefined4 *)(param_1 + 0x884);
  uVar17 = FPToFixed(CONCAT44(extraout_s1,*puVar10),0,0,3,0x20);
  iVar3 = FUN_0001cd94(0);
  if (((int)uVar17 != iVar3) && (*(char *)(param_1 + 0x888) == '\0')) {
    uVar18 = CONCAT44((int)((ulonglong)unaff_d8 >> 0x20),*puVar10);
    uVar17 = FPToFixed(uVar18,0,0,3,0x20);
    iVar3 = FUN_0001cd94(0);
    iVar3 = (iVar3 - (int)uVar17) * 6;
    uVar19 = FixedToFP(CONCAT44(iVar3,iVar3),0,0,0,0x20);
    uVar19 = FloatVectorMult(uVar19,CONCAT44(param_2,param_2),2,0x20);
    uVar18 = FloatVectorAdd(uVar18,uVar19,2);
    uVar19 = FPToFixed(uVar18,0,0,3,0x20);
    *puVar10 = (int)uVar18;
    iVar3 = FUN_0001cd94((int)uVar18,0);
    uVar12 = extraout_s1_00;
    if ((int)uVar19 == iVar3) {
      if (*(int *)(param_1 + 0x880) != 0) {
        local_50[0] = 1;
        FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 0x880) + 0x260),local_50);
        piVar11 = *(int **)(param_1 + 0x880);
        pcVar9 = *(code **)(*piVar11 + 0x40);
        FUN_0030f7cc(auStack_78,"animate_in");
        (*pcVar9)(piVar11,auStack_78,1);
        FUN_0030f7e0(auStack_78);
        puVar2 = PTR_DAT_004d9048;
        uVar12 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a8);
        local_7c = 1;
        local_9c = (undefined **)0x0;
        FUN_0000a298(&local_9c);
        local_7c = 0;
        local_9c = &PTR_LAB_0052bf38;
        local_98 = PTR_FUN_004d9154;
        FUN_0007274c(uVar12,0x3fa00000,0x3f800000,&local_9c);
        FUN_0000a298(&local_9c);
        if ((*(char *)(*(int *)(puVar2 + 0x5c) + 0x32) == '\0') &&
           (iVar3 = FUN_000276e8(*(int *)(puVar2 + 0x5c),"desperadoGamesFinished"), 3 < iVar3)) {
          piVar11 = (int *)FUN_00310a88();
          pcVar9 = *(code **)(*piVar11 + 0xc);
          uVar12 = FUN_00038844("CODE_GOS_LOVE_FRUIT_NINJA",0);
          uVar4 = FUN_00038844("CODE_GOS_PLEASE_RATE",0);
          uVar5 = FUN_00038844("CODE_GOS_NO_THANKS",0);
          local_a0 = 1;
          local_c0 = (undefined **)0x0;
          Mortar::StackAllocatedPointer<Mortar::Delegate1<void,int>::BaseDelegate,32ul>::Delete();
          local_a0 = 0;
          local_c0 = &PTR_LAB_0052c0e8;
          local_bc = &LAB_00083524_1;
          uVar6 = FUN_00038844("CODE_GOS_RATE_NOW",0);
          local_c4 = 1;
          local_e4 = (undefined **)0x0;
          Mortar::StackAllocatedPointer<Mortar::Delegate1<void,int>::BaseDelegate,32ul>::Delete();
          local_c4 = 0;
          local_e4 = &PTR_LAB_0052c0e8;
          local_e0 = &LAB_0008353c_1;
          (*pcVar9)(piVar11,uVar12,uVar4,uVar5,&local_c0,uVar6,&local_e4,1);
          Mortar::StackAllocatedPointer<Mortar::Delegate1<void,int>::BaseDelegate,32ul>::Delete();
          Mortar::StackAllocatedPointer<Mortar::Delegate1<void,int>::BaseDelegate,32ul>::Delete();
        }
      }
      if ((*(char *)(param_1 + 0x889) != '\0') &&
         (iVar3 = *(int *)(PTR_DAT_004d9048 + 0x1a4), iVar3 != 0)) {
        local_e8 = 1;
        local_108 = (undefined **)0x0;
        FUN_0000a298(&local_108);
        local_e8 = 0;
        local_108 = &PTR_LAB_0052bf38;
        local_104 = PTR_FUN_004d9058;
        FUN_0002bc94(iVar3,"count-complete",0x3f800000,0x3f800000,&local_108,0);
        FUN_0000a298(&local_108);
      }
      FUN_003d0bf4(param_1);
      uVar12 = extraout_s1_01;
    }
    uVar18 = FPToFixed(CONCAT44(uVar12,*puVar10),0,0,3,0x20);
    if ((int)uVar18 != (int)uVar17) {
      if ((*(char *)(param_1 + 0x889) != '\0') &&
         (iVar3 = FUN_0001cd94(0), puVar2 = PTR_DAT_004d9050, (int)uVar18 != iVar3)) {
        puVar13 = (uint *)(PTR_DAT_004d9050 + 8);
        uVar7 = *(uint *)PTR_DAT_004d9050;
        piVar14 = (int *)(PTR_DAT_004d9050 + 4);
        piVar15 = (int *)(PTR_DAT_004d9050 + 0xc);
        puVar16 = (uint *)(PTR_DAT_004d9050 + 0x10);
        piVar11 = (int *)(PTR_DAT_004d9050 + 0x14);
        lVar1 = (ulonglong)uVar7 * (ulonglong)*puVar13;
        uVar8 = (uint)lVar1;
        *(uint *)PTR_DAT_004d9050 = uVar8 + *puVar16;
        iVar3 = *piVar14 * *puVar13 + uVar7 * *piVar15 + (int)((ulonglong)lVar1 >> 0x20) +
                *piVar11 + (uint)CARRY4(uVar8,*puVar16);
        *(int *)(puVar2 + 4) = iVar3;
        _sprintf(acStack_4c,"count-%d",1 - (iVar3 >> 0x1f));
        uVar12 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
        local_10c = 1;
        local_12c = (undefined **)0x0;
        FUN_0000a298(&local_12c);
        local_10c = 0;
        local_12c = &PTR_LAB_0052bf38;
        local_128 = PTR_FUN_004d9058;
        FUN_0002bc94(uVar12,acStack_4c,0x3f800000,0x3f800000,&local_12c,0);
        FUN_0000a298(&local_12c);
      }
      FUN_003d0bf4(param_1);
      iVar3 = FUN_00396994(param_1);
      if (iVar3 != 0) {
        piVar11 = (int *)FUN_00396994(param_1);
        pcVar9 = *(code **)(*piVar11 + 0x40);
        FUN_0030f7cc(auStack_154,"animate_pulse");
        (*pcVar9)(piVar11,auStack_154,1);
        FUN_0030f7e0(auStack_154);
      }
    }
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_34) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_000035e8 — 000035e8

```c

void FUN_000035e8(int param_1)

{
  char *pcVar1;
  char *pcVar2;
  char cVar3;
  bool bVar4;
  undefined *puVar5;
  undefined4 uVar6;
  int *piVar7;
  int iVar8;
  char *pcVar9;
  size_t sVar10;
  string *psVar11;
  char *pcVar12;
  int iVar13;
  char *pcVar14;
  char *pcVar15;
  undefined4 *puVar16;
  int iVar17;
  void *pvVar18;
  int iVar19;
  int *piVar20;
  int iVar21;
  undefined4 local_1bc;
  undefined4 local_1b8;
  int local_1b4;
  undefined4 local_1b0;
  undefined4 local_1ac;
  int local_1a8;
  allocator aaStack_1a4 [4];
  int local_1a0;
  undefined4 local_19c;
  undefined **local_198;
  undefined *local_194;
  undefined4 local_190 [8];
  undefined1 local_170;
  undefined4 local_16c;
  undefined4 local_168 [2];
  double local_160;
  char acStack_154 [256];
  undefined1 auStack_54 [17];
  char local_43;
  char local_42;
  undefined1 auStack_40 [22];
  char local_2a;
  char local_29;
  int local_24;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_00004f88(param_1,*(undefined4 *)(param_1 + 8));
  *(undefined4 *)(param_1 + 8) = 0;
  *(int *)(param_1 + 0xc) = param_1 + 4;
  *(int *)(param_1 + 0x10) = param_1 + 4;
  *(undefined4 *)(param_1 + 0x14) = 0;
  FUN_0001cdb4(local_168,"hud/hud_unlocked_dialog.tex");
  puVar5 = PTR_DAT_004d9030;
  FUN_00026e98(PTR_DAT_004d9030,local_168[0]);
  FUN_00026ed0(local_168);
  FUN_00026e98(PTR_DAT_004d9028,*(undefined4 *)puVar5);
  uVar6 = FUN_0036aa24();
  FUN_0036ab34(&local_16c,uVar6,"textures/hud/pointscircle.tex");
  FUN_00026e98(PTR_DAT_004d902c,local_16c);
  FUN_00026ed0(&local_16c);
  puVar5 = PTR_FUN_004d9020;
  uVar6 = FUN_00305d78();
  local_198 = &PTR_LAB_0052bee8;
  local_170 = 1;
  local_194 = puVar5;
  local_190[0] = 0;
  FUN_00004ef4(&local_198,local_190);
  FUN_00305c0c(uVar6,local_190);
  FUN_00004f58(local_190);
  piVar7 = operator_new(0x48);
  FUN_0030cda0(piVar7,"xml/achievementList.xml");
  if (piVar7 != (int *)0x0) {
    iVar8 = FUN_0030ceac(piVar7,0);
    if (iVar8 == 1) {
      uVar6 = FUN_0030c328(piVar7,"achievementManagerFile");
      iVar8 = FUN_0030c328(uVar6,"achievement");
      if (iVar8 != 0) {
        do {
          pcVar9 = (char *)FUN_0030c660(iVar8,"id");
          sVar10 = _strlen(pcVar9);
          local_19c = FUN_002f69c4(pcVar9,sVar10);
          if ((byte)(*pcVar9 - 0x30U) < 10) {
            psVar11 = (string *)FUN_00004990(param_1 + 0x144,&local_19c);
            pcVar12 = (char *)FUN_0030c660(iVar8,"social_id");
            std::string::string((string *)&local_1a0,pcVar12,aaStack_1a4);
            std::string::assign(psVar11);
            if ((allocator *)(local_1a0 + -0xc) != (allocator *)PTR__S_empty_rep_storage_004d9038) {
              piVar20 = (int *)(local_1a0 + -4);
              DataMemoryBarrier(0x1b);
              do {
                ExclusiveAccess(piVar20);
                iVar13 = *piVar20;
                bVar4 = (bool)hasExclusiveAccess(piVar20);
              } while (!bVar4);
              *piVar20 = iVar13 + -1;
              DataMemoryBarrier(0x1b);
              if (iVar13 < 1) {
                std::string::_Rep::_M_destroy((allocator *)(local_1a0 + -0xc));
              }
            }
          }
          iVar13 = FUN_00027800(*(undefined4 *)(PTR_DAT_004d9048 + 0x5c),local_19c);
          if (iVar13 == 1) goto LAB_00003c30;
          pcVar14 = operator_new(0xac);
          pcVar12 = pcVar14 + 0x84;
          pcVar12[0] = '\0';
          pcVar12[1] = '\0';
          pcVar12[2] = '\0';
          pcVar12[3] = '\0';
          FUN_00026e98(pcVar12,0);
          pcVar14[0xa8] = '\0';
          pcVar14[0xa9] = '\0';
          pcVar14[0xaa] = '\0';
          pcVar14[0xab] = '\0';
          pcVar1 = pcVar14 + 0x8c;
          pcVar1[0] = '\0';
          pcVar1[1] = '\0';
          pcVar1[2] = '\0';
          pcVar1[3] = '\0';
          pcVar14[0x90] = '\0';
          pcVar14[0x91] = '\0';
          pcVar14[0x92] = '\0';
          pcVar14[0x93] = '\0';
          pcVar2 = pcVar14 + 0x94;
          pcVar2[0] = '\0';
          pcVar2[1] = '\0';
          pcVar2[2] = '\0';
          pcVar2[3] = '\0';
          pcVar14[0x98] = '\f';
          pcVar14[0x99] = '\0';
          pcVar14[0x9a] = '\0';
          pcVar14[0x9b] = '\0';
          pcVar14[0xa0] = '\0';
          _strcpy(pcVar14 + 0x40,pcVar9);
          *(undefined4 *)(pcVar14 + 0x80) = local_19c;
          pcVar9 = (char *)FUN_0030c660(iVar8,"name");
          sVar10 = _strlen(pcVar9);
          pcVar15 = (char *)FUN_00038844(pcVar9,0);
          _strcpy(pcVar14,pcVar15);
          puVar16 = (undefined4 *)FUN_00004a70(param_1,&local_19c);
          *puVar16 = pcVar14;
          FUN_00004ac8(param_1 + 0x138,&local_19c);
          if (sVar10 < 0x13) {
            if (0xd < sVar10) goto LAB_000038fe;
LAB_00003932:
            uVar6 = 0;
LAB_00003934:
            *(undefined4 *)(pcVar14 + 0x88) = uVar6;
          }
          else {
            if (9 < (byte)(pcVar9[0x11] - 0x30U)) {
LAB_000038fe:
              if (9 < (byte)(pcVar9[0xc] - 0x30U)) goto LAB_00003932;
              _memcpy(auStack_54,"ACHIEVEMENT_DESC_XX",0x14);
              local_43 = pcVar9[0xc];
              local_42 = pcVar9[0xd];
              uVar6 = FUN_00038844(auStack_54,0);
              goto LAB_00003934;
            }
            _memcpy(auStack_40,"LITE_ACHIEVEMENT_DESC_XX",0x19);
            local_2a = pcVar9[0x11];
            local_29 = pcVar9[0x12];
            uVar6 = FUN_00038844(auStack_40,0);
            *(undefined4 *)(pcVar14 + 0x88) = uVar6;
          }
          FUN_0030c6c0(iVar8,"score",pcVar2);
          pcVar9 = (char *)FUN_0030c660(iVar8,"totalF");
          cVar3 = '\0';
          if (pcVar9 != (char *)0x0) {
            cVar3 = *pcVar9;
          }
          if (pcVar9 != (char *)0x0 && cVar3 != '\0') {
            iVar13 = FUN_0030c718(iVar8,"totalF",&local_160);
            if (iVar13 == 0) {
              *(float *)(pcVar14 + 0x90) = (float)local_160;
            }
          }
          else {
            FUN_0030c6c0(iVar8,"total",pcVar1);
          }
          local_1a8 = 0;
          FUN_0030c6c0(iVar8,"isGameOver",&local_1a8);
          pcVar14[0xa0] = local_1a8 == 1;
          uVar6 = FUN_0030c660(iVar8,"texture");
          _sprintf(acStack_154,"%s.tex",uVar6);
          FUN_0001cdb4(&local_1ac,acStack_154);
          FUN_00026e98(pcVar12,local_1ac);
          FUN_00026ed0(&local_1ac);
          FUN_0030c660(iVar8,"mode");
          uVar6 = FUN_00039714();
          *(undefined4 *)(pcVar14 + 0x9c) = uVar6;
          if (((DAT_005556bc & 1) == 0) &&
             (iVar13 = ___cxa_guard_acquire(&DAT_005556bc), iVar13 != 0)) {
            DAT_005556c4 = FUN_002f69c4("TOTAL",5);
            DAT_005556c8 = FUN_002f69c4("SCORE",5);
            DAT_005556cc = FUN_002f69c4("SCORE_UNSULLIED",0xf);
            DAT_005556d0 = FUN_002f69c4("END_SCORE",9);
            DAT_005556d4 = FUN_002f69c4("SPECIFIC",8);
            DAT_005556d8 = FUN_002f69c4("CONSECUTIVE",0xb);
            DAT_005556dc = FUN_002f69c4("CONSECUTIVE_ANY",0xf);
            DAT_005556e0 = FUN_002f69c4("COMBO",5);
            DAT_005556e4 = FUN_002f69c4("COMBO_STAR",10);
            DAT_005556e8 = FUN_002f69c4("SPECIFIC_ORDER",0xe);
            DAT_005556ec = FUN_002f69c4("BONUS_ACHIEVED",0xe);
            DAT_005556f0 = FUN_002f69c4("QUICKSHOT",9);
            ___cxa_guard_release(&DAT_005556bc);
          }
          pcVar14[0x98] = -1;
          pcVar14[0x99] = -1;
          pcVar14[0x9a] = -1;
          pcVar14[0x9b] = -1;
          pcVar9 = (char *)FUN_0030c660(iVar8,"type");
          sVar10 = _strlen(pcVar9);
          iVar17 = FUN_002f69c4(pcVar9,sVar10);
          iVar13 = 0;
          iVar21 = param_1;
          do {
            iVar19 = iVar13;
            if (0xb < iVar19) goto LAB_00003c30;
            iVar21 = iVar21 + 0x18;
            iVar13 = iVar19 + 1;
          } while (iVar17 != (&DAT_005556c4)[iVar19]);
          *(int *)(pcVar14 + 0x98) = iVar19;
          if (iVar19 == 10) {
            pcVar9 = (char *)FUN_0030c660(iVar8,"specific_type");
            if (pcVar9 == (char *)0x0) {
              pcVar9 = (char *)FUN_0030c660(iVar8,"name");
            }
            sVar10 = _strlen(pcVar9);
            local_1b0 = FUN_002f69c4(pcVar9,sVar10);
            iVar21 = param_1 + 0x108;
            puVar16 = &local_1b0;
LAB_00003c28:
            puVar16 = (undefined4 *)FUN_00004a70(iVar21,puVar16);
            *puVar16 = pcVar14;
          }
          else if (iVar19 == 9) {
            puVar16 = (undefined4 *)FUN_00004a70(param_1 + 0xf0,&local_19c);
            *puVar16 = pcVar14;
            pcVar9 = (char *)FUN_0030c660(iVar8,"specific_type");
LAB_00003b9e:
            pvVar18 = operator_new(0x1c0);
            FUN_0000438c(pvVar18,pcVar9);
            *(void **)(pcVar14 + 0xa8) = pvVar18;
          }
          else {
            if ((iVar19 - 4U < 2) || (iVar19 + 1 == 9)) {
              pcVar9 = (char *)FUN_0030c660(iVar8,"specific_type");
              sVar10 = _strlen(pcVar9);
              local_1bc = FUN_002f69c4(pcVar9,sVar10);
              puVar16 = &local_1bc;
              goto LAB_00003c28;
            }
            if (iVar19 - 1U < 2) {
              local_1b4 = DAT_005556c0;
              puVar16 = (undefined4 *)FUN_00004a70(iVar21,&local_1b4);
              *puVar16 = pcVar14;
              DAT_005556c0 = DAT_005556c0 + 1;
            }
            else {
              local_1b8 = *(undefined4 *)(pcVar14 + 0x8c);
              puVar16 = (undefined4 *)FUN_00004a70(iVar21,&local_1b8);
              *puVar16 = pcVar14;
              pcVar9 = (char *)FUN_0030c660(iVar8,"specific_type");
              cVar3 = '\0';
              if (pcVar9 != (char *)0x0) {
                cVar3 = *pcVar9;
              }
              if (pcVar9 != (char *)0x0 && cVar3 != '\0') goto LAB_00003b9e;
            }
          }
LAB_00003c30:
          iVar8 = FUN_0030c3a0(iVar8,"achievement");
        } while (iVar8 != 0);
      }
    }
    (**(code **)(*piVar7 + 4))();
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0005b664 — 0005b664

```c

void FUN_0005b664(int param_1)

{
  undefined *puVar1;
  undefined *puVar2;
  undefined4 uVar3;
  int *piVar4;
  undefined4 uVar5;
  code *pcVar6;
  undefined **local_a8;
  undefined4 local_a4;
  undefined1 *local_a0;
  undefined4 local_9c;
  undefined4 local_98 [8];
  undefined1 local_78;
  undefined1 auStack_74 [40];
  undefined1 auStack_4c [40];
  int local_24;
  
  puVar2 = PTR_DAT_004d9048;
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  if (DAT_0005b7dc < *(float *)(PTR_DAT_004d9048 + 0x20)) {
    uVar5 = *(undefined4 *)(PTR_DAT_004d9048 + 0x5c);
    uVar3 = FUN_002f69c4("twitterface_posts",0x11);
    FUN_00027588(uVar5,"twitterface_posts",uVar3,1,0,1);
    uVar5 = *(undefined4 *)(puVar2 + 0x5c);
    uVar3 = FUN_002f69c4("twitterface_posts_total",0x17);
    FUN_00027588(uVar5,"twitterface_posts_total",uVar3,1,1,1);
    if (*(char *)(param_1 + 0xb8) == '\0') {
      FUN_0030f7cc(auStack_4c,0);
      FUN_0030f7cc(auStack_74,0);
      FUN_0005ce80(param_1,auStack_4c,auStack_74);
      uVar3 = FUN_003527fc();
      piVar4 = (int *)FUN_0005d4fc(uVar3,"Provider_Facebook");
      if (piVar4 != (int *)0x0) {
        pcVar6 = *(code **)(*piVar4 + 0x40);
        uVar3 = FUN_0030f8f0(auStack_74);
        uVar5 = FUN_0030f8f0(auStack_4c);
        local_a8 = &PTR_LAB_0052c9e8;
        local_a4 = DAT_005a7ec8;
        local_78 = 1;
        local_9c = 0;
        local_98[0] = 0;
        local_a0 = &FUN_0005d098_1;
        FUN_0005dc08(&local_a8,local_98);
        (*pcVar6)(piVar4,"",uVar3,
                  "http://wac.76ff.edgecastcdn.net/0076FF/social/fruitninjapussinboots.png",
                  "Fruit Ninja: Puss In Boots",uVar5,"",local_98);
        Mortar::
        StackAllocatedPointer<Mortar::Delegate1<void,Mortar::SocialPostStatus>::BaseDelegate,32ul>::
        Delete();
      }
      *(undefined1 *)(param_1 + 0xb9) = 1;
      FUN_0030f7e0(auStack_74);
      FUN_0030f7e0(auStack_4c);
    }
  }
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0006a90c — 0006a90c

```c

void FUN_0006a90c(int param_1)

{
  int *piVar1;
  int iVar2;
  char *pcVar3;
  int iVar4;
  undefined ***pppuVar5;
  undefined4 uVar6;
  code *pcVar7;
  int iVar8;
  undefined1 auStack_188 [40];
  undefined1 auStack_160 [40];
  undefined1 auStack_138 [40];
  undefined1 auStack_110 [40];
  undefined1 auStack_e8 [40];
  undefined **local_c0;
  undefined *local_bc;
  undefined1 local_a0;
  undefined **local_9c;
  undefined *local_98;
  undefined1 local_7c;
  undefined1 auStack_78 [40];
  undefined1 auStack_50 [40];
  undefined1 local_28 [4];
  int local_24;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  iVar8 = *(int *)(*(int *)(param_1 + 0xc) + 0x68);
  _sprintf(&DAT_005f9590,"challengeContainer.spinner.adventureNode_%d",*(int *)(iVar8 + 0x90) + 1);
  uVar6 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_50,&DAT_005f9590);
  piVar1 = (int *)FUN_0039725c(uVar6,auStack_50);
  FUN_0030f7e0(auStack_50);
  if (piVar1 != (int *)0x0) {
    pcVar7 = *(code **)(*piVar1 + 0x40);
    FUN_0030f7cc(auStack_78,"animate_trigger");
    (*pcVar7)(piVar1,auStack_78,1);
    FUN_0030f7e0(auStack_78);
  }
  iVar4 = *(int *)(iVar8 + 0x90);
  iVar2 = FUN_0006ed58(iVar8,iVar4);
  if (*(int *)(iVar2 + 4) != 0) {
    iVar4 = iVar4 + 1;
    iVar2 = FUN_0006ed58(iVar8,*(undefined4 *)(iVar8 + 0x90));
    if (*(int *)(iVar2 + 4) == 1) {
      _sprintf(&DAT_005f9590,"challengeContainer.spinner.adventureNodePass_%d",iVar4);
      pppuVar5 = &local_9c;
      uVar6 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
      local_7c = 1;
      local_9c = (undefined **)0x0;
      FUN_0000a298(pppuVar5);
      local_7c = 0;
      local_9c = &PTR_LAB_0052bf38;
      local_98 = PTR_FUN_004d9058;
      pcVar3 = "challenge-tick";
    }
    else {
      _sprintf(&DAT_005f9590,"challengeContainer.spinner.adventureNodeFail_%d",iVar4);
      pppuVar5 = &local_c0;
      uVar6 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
      local_a0 = 1;
      local_c0 = (undefined **)0x0;
      FUN_0000a298(pppuVar5);
      local_a0 = 0;
      pcVar3 = "gank";
      local_c0 = &PTR_LAB_0052bf38;
      local_bc = PTR_FUN_004d9058;
    }
    FUN_0002bb34(uVar6,pcVar3,0x3f800000,0x3f800000,pppuVar5,0);
    FUN_0000a298(pppuVar5);
    uVar6 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_e8,&DAT_005f9590);
    piVar1 = (int *)FUN_0039725c(uVar6,auStack_e8);
    FUN_0030f7e0(auStack_e8);
    if (piVar1 != (int *)0x0) {
      local_28[0] = 1;
      FUN_0001da28(piVar1[0x98],local_28);
      pcVar7 = *(code **)(*piVar1 + 0x40);
      FUN_0030f7cc(auStack_110,"animate_trigger");
      (*pcVar7)(piVar1,auStack_110,1);
      FUN_0030f7e0(auStack_110);
    }
    iVar2 = FUN_0006ed58(iVar8,*(undefined4 *)(iVar8 + 0x90));
    if (*(int *)(iVar2 + 4) == 1) {
      pcVar3 = "progressUIContainer.map.challenge_%d_%d.pass";
    }
    else {
      pcVar3 = "progressUIContainer.map.challenge_%d_%d.fail";
    }
    _sprintf(&DAT_005f9590,pcVar3,*(int *)(iVar8 + 0xa4) + 1,iVar4);
    uVar6 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_138,&DAT_005f9590);
    piVar1 = (int *)FUN_0039725c(uVar6,auStack_138);
    FUN_0030f7e0(auStack_138);
    if (piVar1 != (int *)0x0) {
      local_28[0] = 1;
      FUN_0001da28(piVar1[0x98],local_28);
      pcVar7 = *(code **)(*piVar1 + 0x40);
      FUN_0030f7cc(auStack_160,"animate_trigger");
      (*pcVar7)(piVar1,auStack_160,1);
      FUN_0030f7e0(auStack_160);
    }
  }
  if (0 < *(int *)(iVar8 + 0x7c)) {
    iVar2 = 0;
    do {
      iVar4 = FUN_0006ed58(iVar8,iVar2);
      iVar2 = iVar2 + 1;
      if (*(int *)(iVar4 + 4) == 0) {
        _sprintf(&DAT_005f9590,"challengeContainer.spinner.adventureNode_%d",iVar2);
        uVar6 = *(undefined4 *)(param_1 + 4);
        FUN_0030f7cc(auStack_188,&DAT_005f9590);
        iVar4 = FUN_0039725c(uVar6,auStack_188);
        FUN_0030f7e0(auStack_188);
        if (iVar4 != 0) {
          local_28[0] = 1;
          FUN_0001da28(*(undefined4 *)(iVar4 + 0x264),local_28);
        }
      }
    } while (iVar2 < *(int *)(iVar8 + 0x7c));
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0001abcc — 0001abcc

```c

undefined4 FUN_0001abcc(int param_1,undefined4 param_2)

{
  byte bVar1;
  longlong lVar2;
  longlong lVar3;
  undefined *puVar4;
  undefined *puVar5;
  undefined4 uVar6;
  uint uVar7;
  undefined4 uVar8;
  int iVar9;
  uint uVar10;
  uint uVar11;
  int iVar12;
  uint uVar13;
  uint uVar14;
  int iVar15;
  uint uVar16;
  int iVar17;
  undefined4 extraout_s0;
  undefined8 in_d0;
  longlong lVar18;
  undefined4 extraout_s1;
  uint extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined4 extraout_s1_03;
  ulonglong uVar19;
  undefined4 extraout_s1_04;
  undefined4 extraout_s1_05;
  uint extraout_s1_06;
  float fVar20;
  float fVar21;
  undefined8 in_d1;
  undefined8 uVar22;
  undefined8 in_d2;
  undefined4 uVar23;
  undefined8 in_d3;
  undefined8 in_d4;
  undefined8 uVar24;
  undefined8 in_d5;
  undefined4 uVar25;
  undefined4 in_s13;
  undefined8 unaff_d8;
  undefined8 unaff_d9;
  undefined8 uVar26;
  undefined8 uVar27;
  undefined8 uVar28;
  undefined8 uVar29;
  byte local_34;
  byte local_33;
  byte local_32;
  byte local_31;
  
  puVar4 = PTR_DAT_004d9048;
  uVar8 = (undefined4)((ulonglong)in_d1 >> 0x20);
  uVar22 = CONCAT44(uVar8,*(undefined4 *)(param_1 + 0x5c));
  uVar23 = (undefined4)((ulonglong)in_d2 >> 0x20);
  uVar24 = CONCAT44(uVar23,*(undefined4 *)(param_1 + 0x60));
  uVar6 = (undefined4)((ulonglong)in_d0 >> 0x20);
  uVar27 = CONCAT44((int)((ulonglong)in_d3 >> 0x20),*(undefined4 *)(PTR_DAT_004d9048 + 0x44));
  uVar28 = FloatVectorMult(uVar22,uVar27,2,0x20);
  uVar25 = (undefined4)((ulonglong)in_d5 >> 0x20);
  uVar26 = FloatVectorMult(uVar27,uVar24,2,0x20);
  uVar29 = FloatVectorSub(uVar28,CONCAT44(in_s13,*(undefined4 *)(PTR_DAT_004d9048 + 0xc4)),2,0x20);
  uVar28 = FloatVectorAdd(uVar26,CONCAT44(uVar25,*(undefined4 *)(PTR_DAT_004d9048 + 200)),2);
  uVar26 = FloatVectorAdd(uVar29,CONCAT44((int)((ulonglong)in_d4 >> 0x20),
                                          *(undefined4 *)(param_1 + 0x38)),2);
  *(int *)(param_1 + 0x38) = (int)uVar26;
  uVar26 = FloatVectorAdd(uVar28,CONCAT44(uVar25,*(undefined4 *)(param_1 + 0x3c)),2);
  uVar27 = FloatVectorMult(uVar27,CONCAT44(uVar6,*(undefined4 *)(param_1 + 100)),2,0x20);
  *(int *)(param_1 + 0x3c) = (int)uVar26;
  lVar18 = FloatVectorAdd(uVar27,CONCAT44(uVar6,*(undefined4 *)(param_1 + 0x40)),2);
  *(float *)(param_1 + 0x40) = (float)lVar18;
  puVar5 = PTR_DAT_004d9050;
  fVar21 = DAT_0001b008;
  if (*(int *)(param_1 + 0x70) < 0) {
    if ((int)((uint)((float)lVar18 < DAT_0001b008) << 0x1f) < 0) {
      uVar7 = *(uint *)(PTR_DAT_004d9050 + 8);
      iVar12 = *(int *)(PTR_DAT_004d9050 + 0xc);
      uVar16 = *(uint *)(PTR_DAT_004d9050 + 0x10);
      iVar17 = *(int *)(PTR_DAT_004d9050 + 0x14);
      lVar2 = (ulonglong)*(uint *)PTR_DAT_004d9050 * (ulonglong)uVar7;
      uVar13 = (uint)lVar2;
      uVar11 = uVar13 + uVar16;
      lVar3 = (ulonglong)uVar11 * (ulonglong)uVar7;
      uVar10 = (uint)lVar3;
      uVar13 = *(int *)(PTR_DAT_004d9050 + 4) * uVar7 +
               *(uint *)PTR_DAT_004d9050 * iVar12 + (int)((ulonglong)lVar2 >> 0x20) +
               iVar17 + (uint)CARRY4(uVar13,uVar16);
      uVar14 = uVar10 + uVar16;
      *(uint *)PTR_DAT_004d9050 = uVar14;
      uVar10 = uVar13 * uVar7 + uVar11 * iVar12 + (int)((ulonglong)lVar3 >> 0x20) +
               iVar17 + (uint)CARRY4(uVar10,uVar16);
      *(uint *)(puVar5 + 4) = uVar10;
      if (uVar13 < 0x40000000) {
        iVar9 = 3;
        if (-1 < (int)uVar10) {
          iVar9 = 2;
        }
      }
      else {
        iVar9 = (int)((ulonglong)uVar10 * 6 >> 0x20);
        if (((ulonglong)uVar10 * 6 & 0x700000000) != 0) {
          iVar9 = 1;
        }
      }
      *(int *)(param_1 + 0x70) = iVar9;
      if (*(char *)(param_1 + 0x18) != '\0') {
        uVar11 = (uint)((ulonglong)uVar14 * (ulonglong)uVar7);
        uVar13 = uVar11 + uVar16;
        iVar15 = uVar10 * uVar7 +
                 uVar14 * iVar12 + (int)((ulonglong)uVar14 * (ulonglong)uVar7 >> 0x20) +
                 iVar17 + (uint)CARRY4(uVar11,uVar16);
        *(uint *)puVar5 = uVar13;
        *(int *)(puVar5 + 4) = iVar15;
        if (-1 < iVar15) {
          uVar10 = (uint)((ulonglong)uVar7 * (ulonglong)uVar13);
          iVar9 = 5;
          iVar12 = iVar12 * uVar13 +
                   uVar7 * iVar15 + (int)((ulonglong)uVar7 * (ulonglong)uVar13 >> 0x20) +
                   iVar17 + (uint)CARRY4(uVar10,uVar16);
          *(uint *)puVar5 = uVar10 + uVar16;
          *(int *)(puVar5 + 4) = iVar12;
          if (-1 < iVar12) {
            iVar9 = 4;
          }
          *(int *)(param_1 + 0x70) = iVar9;
        }
      }
      if (*(int *)(param_1 + 0x14) < *(int *)PTR_DAT_004d90b4) {
        iVar12 = FUN_0000ac08();
        lVar18 = (ulonglong)extraout_s1_00 << 0x20;
        if (*(char *)(iVar12 + 0x2fc) == '\0') {
          iVar9 = *(int *)(param_1 + 0x70);
        }
        else {
          lVar2 = (ulonglong)*(uint *)puVar5 * (ulonglong)*(uint *)(puVar5 + 8);
          uVar7 = (uint)lVar2;
          iVar9 = 3;
          iVar12 = *(int *)(puVar5 + 4) * *(uint *)(puVar5 + 8) +
                   *(uint *)puVar5 * *(int *)(puVar5 + 0xc) + (int)((ulonglong)lVar2 >> 0x20) +
                   *(int *)(puVar5 + 0x14) + (uint)CARRY4(uVar7,*(uint *)(puVar5 + 0x10));
          *(uint *)puVar5 = uVar7 + *(uint *)(puVar5 + 0x10);
          *(int *)(puVar5 + 4) = iVar12;
          if (-1 < iVar12) {
            iVar9 = 2;
          }
          *(int *)(param_1 + 0x70) = iVar9;
        }
      }
      if (iVar9 - 4U < 2) {
        uVar6 = FUN_0030113c(*(undefined4 *)(param_1 + 0x60),*(undefined4 *)(param_1 + 0x5c));
        fVar20 = DAT_0001b35c;
        fVar21 = DAT_0001b358;
        uVar24 = FixedToFP(CONCAT44(uVar6,uVar6),0,1,0,0x20);
        lVar18 = (ulonglong)*(uint *)puVar5 * (ulonglong)*(uint *)(puVar5 + 8);
        uVar13 = (uint)lVar18;
        uVar27 = CONCAT44((int)((ulonglong)unaff_d8 >> 0x20),DAT_0001b35c);
        uVar7 = *(int *)(puVar5 + 4) * *(uint *)(puVar5 + 8) +
                *(uint *)puVar5 * *(int *)(puVar5 + 0xc) + (int)((ulonglong)lVar18 >> 0x20) +
                *(int *)(puVar5 + 0x14) + (uint)CARRY4(uVar13,*(uint *)(puVar5 + 0x10));
        uVar6 = (undefined4)((ulonglong)uVar7 * 0x7ffff >> 0x20);
        *(uint *)puVar5 = uVar13 + *(uint *)(puVar5 + 0x10);
        *(uint *)(puVar5 + 4) = uVar7;
        uVar22 = FixedToFP(CONCAT44(uVar6,uVar6),0,1,0,0x20);
        uVar22 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar22 >> 0x20),(float)uVar22 / fVar21),
                                 CONCAT44((int)((ulonglong)uVar24 >> 0x20),DAT_0001b360),2,0x20);
        uVar22 = FloatVectorAdd(uVar22,0xc1b00000c1b00000,2);
        uVar22 = FloatVectorSub(uVar22,CONCAT44(extraout_s1_01,(float)uVar24 / fVar20),2,0x20);
        uVar24 = FloatVectorMult(uVar22,uVar27,2,0x20);
        *(int *)(param_1 + 0x10) = (int)uVar22;
        uVar24 = FPToFixed(uVar24,0,0,3,0x20);
        uVar6 = FUN_003010d0((int)uVar22,(uint)uVar24 & 0xffff);
        uVar22 = FloatVectorMult(CONCAT44(extraout_s1_02,*(undefined4 *)(param_1 + 0x10)),uVar27,2,
                                 0x20);
        uVar22 = FPToFixed(uVar22,0,0,3,0x20);
        uVar8 = FUN_003010b8((uint)uVar22 & 0xffff);
        *(undefined4 *)(param_1 + 0x24) = 0;
        uVar26 = CONCAT44((int)((ulonglong)unaff_d9 >> 0x20),DAT_0001b364);
        uVar22 = FloatVectorMult(CONCAT44(uVar6,uVar6),0x3f0000003f000000,2,0x20);
        uVar24 = FloatVectorMult(CONCAT44(uVar8,uVar8),0x3f0000003f000000,2,0x20);
        *(int *)(param_1 + 0x1c) = (int)uVar22;
        *(int *)(param_1 + 0x20) = (int)uVar24;
        uVar22 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar22 >> 0x20),
                                         *(undefined4 *)(param_1 + 0x10)),uVar26,2);
        uVar22 = FloatVectorMult(uVar22,uVar27,2,0x20);
        uVar22 = FPToFixed(uVar22,0,0,3,0x20);
        uVar6 = FUN_003010d0((uint)uVar22,(uint)uVar22 & 0xffff);
        uVar22 = FloatVectorAdd(CONCAT44(extraout_s1_03,*(undefined4 *)(param_1 + 0x10)),uVar26,2);
        uVar22 = FloatVectorMult(uVar22,uVar27,2,0x20);
        uVar22 = FPToFixed(uVar22,0,0,3,0x20);
        uVar8 = FUN_003010b8((uint)uVar22 & 0xffff);
        *(undefined4 *)(param_1 + 0x30) = 0;
        lVar18 = FloatVectorMult(CONCAT44(uVar6,uVar6),0x3e8000003e800000,2,0x20);
        uVar22 = FloatVectorMult(CONCAT44(uVar8,uVar8),0x3e8000003e800000,2,0x20);
        *(int *)(param_1 + 0x28) = (int)lVar18;
        *(int *)(param_1 + 0x2c) = (int)uVar22;
        iVar9 = *(int *)(param_1 + 0x70);
      }
      *(undefined4 *)(param_1 + 0x40) = 0xc2480000;
      uVar8 = (undefined4)((ulonglong)lVar18 >> 0x20);
      uVar6 = *(undefined4 *)(&DAT_004711bc + iVar9 * 4);
      *(undefined4 *)(param_1 + 0x5c) = DAT_0052bfe0;
      uVar24 = FloatVectorMult(CONCAT44(uVar8,uVar6),0x4020000040200000,2,0x20);
      *(undefined4 *)(param_1 + 0x60) = DAT_0052bfe4;
      *(undefined4 *)(param_1 + 100) = DAT_0052bfe8;
      uVar22 = FloatVectorMult(CONCAT44(uVar8,*(undefined4 *)(param_1 + 0x44)),uVar24,2,0x20);
      *(int *)(param_1 + 0x44) = (int)uVar22;
      uVar22 = FloatVectorMult(uVar24,CONCAT44((int)((ulonglong)uVar22 >> 0x20),
                                               *(undefined4 *)(param_1 + 0x48)),2,0x20);
      *(int *)(param_1 + 0x48) = (int)uVar22;
      uVar19 = FloatVectorMult(uVar24,CONCAT44((int)((ulonglong)uVar22 >> 0x20),
                                               *(undefined4 *)(param_1 + 0x4c)),2,0x20);
      *(int *)(param_1 + 0x4c) = (int)uVar19;
      if ((DAT_00557510 & 1) == 0) {
        iVar12 = ___cxa_guard_acquire(&DAT_00557510);
        uVar19 = CONCAT44(extraout_s1_04,extraout_s0);
        if (iVar12 != 0) {
          DAT_0055750c = FUN_0000aae0("coconut",0);
          uVar6 = ___cxa_guard_release(&DAT_00557510);
          uVar19 = CONCAT44(extraout_s1_05,uVar6);
        }
      }
      if (*(char *)(param_1 + 0x76) == '\0') {
        if (*(int *)(param_1 + 0x14) == DAT_0055750c) {
          uVar6 = 0;
        }
        else {
          fVar21 = *(float *)(param_1 + 0x44);
          uVar19 = (ulonglong)(uint)fVar21;
          if (fVar21 <= DAT_0001b368) {
            if (fVar21 <= 30.0) {
              uVar6 = 1;
            }
            else {
              uVar6 = 2;
            }
          }
          else {
            uVar6 = 3;
          }
        }
        FUN_0001a510((int)uVar19,uVar6);
        uVar19 = (ulonglong)extraout_s1_06 << 0x20;
      }
      uVar10 = *(uint *)(puVar5 + 8);
      iVar12 = *(int *)(puVar5 + 0xc);
      uVar16 = *(uint *)(puVar5 + 0x10);
      iVar17 = *(int *)(puVar5 + 0x14);
      lVar18 = (ulonglong)*(uint *)puVar5 * (ulonglong)uVar10;
      uVar7 = (uint)lVar18;
      uVar13 = uVar7 + uVar16;
      lVar2 = (ulonglong)uVar13 * (ulonglong)uVar10;
      uVar11 = (uint)lVar2;
      uVar7 = *(int *)(puVar5 + 4) * uVar10 +
              *(uint *)puVar5 * iVar12 + (int)((ulonglong)lVar18 >> 0x20) +
              iVar17 + (uint)CARRY4(uVar7,uVar16);
      uVar14 = uVar11 + uVar16;
      uVar6 = (undefined4)((ulonglong)uVar7 * 0x7ffff >> 0x20);
      uVar7 = uVar7 * uVar10 + uVar13 * iVar12 + (int)((ulonglong)lVar2 >> 0x20) +
              iVar17 + (uint)CARRY4(uVar11,uVar16);
      uVar8 = (undefined4)((ulonglong)uVar7 * 0x7ffff >> 0x20);
      uVar22 = FixedToFP(CONCAT44(uVar6,uVar6),0,1,0,0x20);
      lVar18 = (ulonglong)uVar14 * (ulonglong)uVar10;
      uVar13 = (uint)lVar18;
      uVar24 = FixedToFP(CONCAT44(uVar8,uVar8),0,1,0,0x20);
      uVar7 = uVar7 * uVar10 + uVar14 * iVar12 + (int)((ulonglong)lVar18 >> 0x20) +
              iVar17 + (uint)CARRY4(uVar13,uVar16);
      uVar22 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar22 >> 0x20),
                                        (float)uVar22 / DAT_0001b358),0x4020000040200000,2,0x20);
      uVar24 = FloatVectorMult(CONCAT44((int)(uVar19 >> 0x20),(float)uVar24 / DAT_0001b358),
                               0x3e8000003e800000,2,0x20);
      uVar22 = FloatVectorAdd(uVar22,0x4070000040700000,2);
      lVar18 = FloatVectorAdd(uVar24,0x3ec000003ec00000,2);
      *(int *)(param_1 + 0x68) = (int)uVar22;
      *(int *)(param_1 + 0x6c) = (int)lVar18;
      *(uint *)puVar5 = uVar13 + uVar16;
      *(uint *)(puVar5 + 4) = uVar7;
      if ((((ulonglong)uVar7 * 10 & 0xf00000000) == 0) &&
         (lVar18 = CONCAT44((int)((ulonglong)lVar18 >> 0x20),DAT_00557514),
         (int)((uint)(DAT_00557514 < -0.5) << 0x1f) < 0)) {
        DAT_00557514 = 0.25;
      }
    }
    uVar6 = (undefined4)((ulonglong)lVar18 >> 0x20);
    uVar22 = FloatVectorMult(CONCAT44(uVar6,*(undefined4 *)(puVar4 + 0x44)),0x4120000041200000,2,
                             0x20);
    if (*(char *)(param_1 + 0x74) == '\0') {
      uVar22 = FloatVectorSub(CONCAT44(uVar6,*(undefined4 *)(param_1 + 0x60)),uVar22,2,0x20);
      uVar6 = (undefined4)uVar22;
      *(undefined4 *)(param_1 + 0x60) = uVar6;
    }
    else {
      uVar22 = FloatVectorNeg(uVar22,2,2);
      uVar22 = FloatVectorAdd(uVar22,CONCAT44(uVar6,*(undefined4 *)(param_1 + 0x5c)),2);
      uVar6 = (undefined4)uVar22;
      *(undefined4 *)(param_1 + 0x5c) = uVar6;
    }
  }
  else {
    uVar27 = 0x3fa000003fa00000;
    uVar28 = CONCAT44((int)((ulonglong)lVar18 >> 0x20),*(float *)(param_1 + 0x68));
    uVar26 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar26 >> 0x20),DAT_00557518),
                             CONCAT44(param_2,param_2),2,0x20);
    if (*(float *)(param_1 + 0x68) <= 1.25) {
      uVar27 = FloatVectorMult(uVar26,CONCAT44(0x3fa00000,
                                               *(undefined4 *)
                                                (&DAT_004711d4 + *(int *)(param_1 + 0x70) * 4)),2,
                               0x20);
      if (*(char *)(param_1 + 0x74) == '\0') {
        uVar22 = FloatVectorSub(uVar24,uVar27,2,0x20);
        uVar22 = FloatVectorMax(CONCAT44(uVar8,DAT_0001b008),uVar22,2,0x20);
        *(int *)(param_1 + 0x60) = (int)uVar22;
        uVar24 = CONCAT44(uVar23,*(undefined4 *)(param_1 + 0x48));
        uVar29 = FloatVectorSub(uVar24,uVar27,2,0x20);
        uVar22 = FloatVectorMax(CONCAT44((int)((ulonglong)uVar22 >> 0x20),DAT_0001b010),uVar29,2,
                                0x20);
        *(int *)(param_1 + 0x48) = (int)uVar22;
      }
      else {
        uVar24 = FloatVectorNeg(uVar27,2,2);
        uVar22 = FloatVectorAdd(uVar24,uVar22,2);
        fVar20 = (float)uVar22;
        *(float *)(param_1 + 0x5c) = fVar20;
        if ((fVar21 < fVar20) && (fVar21 = DAT_0001b00c, fVar20 < DAT_0001b00c)) {
          fVar21 = fVar20;
        }
        *(float *)(param_1 + 0x5c) = fVar21;
        fVar21 = DAT_0001b010;
        uVar6 = (undefined4)((ulonglong)uVar22 >> 0x20);
        uVar22 = CONCAT44(uVar6,DAT_0001b010);
        uVar24 = FloatVectorAdd(uVar27,CONCAT44(uVar23,*(undefined4 *)(param_1 + 0x44)),2);
        fVar20 = (float)uVar24;
        *(float *)(param_1 + 0x44) = fVar20;
        if ((fVar21 < fVar20) && (uVar22 = CONCAT44(uVar6,DAT_0001b014), fVar20 < DAT_0001b014)) {
          uVar22 = CONCAT44(uVar6,fVar20);
        }
        *(int *)(param_1 + 0x44) = (int)uVar22;
      }
    }
    if (0.0 < *(float *)(param_1 + 4)) {
      uVar22 = FloatVectorSub(CONCAT44((int)((ulonglong)uVar24 >> 0x20),*(float *)(param_1 + 4)),
                              CONCAT44((int)((ulonglong)uVar27 >> 0x20),
                                       *(undefined4 *)(puVar4 + 0x44)),2,0x20);
      uVar22 = FloatVectorMax(uVar22,0,2,0x20);
      uVar24 = FloatVectorAdd(uVar22,uVar22,2);
      *(int *)(param_1 + 4) = (int)uVar22;
      uVar22 = 0;
      if (0.0 < (float)uVar24) {
        uVar22 = uVar24;
      }
      uVar22 = FloatVectorSub(0x3f8000003f800000,uVar22,2,0x20);
      if (*(uint *)PTR_DAT_004d90c0 == *(uint *)PTR_DAT_004d90bc) {
        uVar6 = ___modsi3(*(undefined4 *)(param_1 + 0x14),*(undefined4 *)PTR_DAT_004d90b4);
        FUN_0000abb0(&local_34,uVar6);
        uVar28 = CONCAT44(extraout_s1,*(undefined4 *)(param_1 + 0x68));
        uVar7 = (uint)local_32 << 0x10 | (uint)local_31 << 0x18 | (uint)local_33 << 8 |
                (uint)local_34;
      }
      else {
        uVar7 = (uint)(byte)PTR_DAT_004d90c0[2] << 0x10 | (uint)(byte)PTR_DAT_004d90c0[3] << 0x18 |
                (uint)(byte)PTR_DAT_004d90c0[1] << 8 | *(uint *)PTR_DAT_004d90c0 & 0xff;
      }
      puVar4 = PTR_DAT_004d90b0;
      bVar1 = PTR_DAT_004d90b0[2];
      iVar12 = ((uVar7 & 0xffffff) >> 0x10) - (uint)bVar1;
      uVar27 = FixedToFP(CONCAT44(iVar12,iVar12),0,0,0,0x20);
      uVar24 = FixedToFP((ulonglong)CONCAT14(bVar1,(uint)bVar1),0,0,0,0x20);
      uVar27 = FloatVectorMult(uVar22,uVar27,2,0x20);
      uVar24 = FloatVectorAdd(uVar24,uVar27,2);
      uVar24 = FPToFixed(uVar24,0,0,3,0x20);
      *(char *)(param_1 + 10) = (char)uVar24;
      bVar1 = puVar4[1];
      iVar12 = ((uVar7 & 0xffff) >> 8) - (uint)bVar1;
      uVar27 = FixedToFP(CONCAT44(iVar12,iVar12),0,0,0,0x20);
      uVar24 = FixedToFP((ulonglong)CONCAT14(bVar1,(uint)bVar1),0,0,0,0x20);
      uVar27 = FloatVectorMult(uVar22,uVar27,2,0x20);
      uVar24 = FloatVectorAdd(uVar24,uVar27,2);
      uVar24 = FPToFixed(uVar24,0,0,3,0x20);
      *(char *)(param_1 + 9) = (char)uVar24;
      bVar1 = *puVar4;
      iVar12 = (uVar7 & 0xff) - (uint)bVar1;
      uVar27 = FixedToFP(CONCAT44(iVar12,iVar12),0,0,0,0x20);
      uVar24 = FixedToFP((ulonglong)CONCAT14(bVar1,(uint)bVar1),0,0,0,0x20);
      uVar27 = FloatVectorMult(uVar22,uVar27,2,0x20);
      uVar24 = FloatVectorAdd(uVar24,uVar27,2);
      uVar24 = FPToFixed(uVar24,0,0,3,0x20);
      *(char *)(param_1 + 8) = (char)uVar24;
      bVar1 = puVar4[3];
      iVar12 = (uVar7 >> 0x18) - (uint)bVar1;
      uVar24 = FixedToFP((ulonglong)CONCAT14(bVar1,(uint)bVar1),0,0,0,0x20);
      uVar27 = FixedToFP(CONCAT44(iVar12,iVar12),0,0,0,0x20);
      uVar22 = FloatVectorMult(uVar22,uVar27,2,0x20);
      uVar22 = FloatVectorAdd(uVar24,uVar22,2);
      *(int *)(param_1 + 0xc) = (int)uVar22;
    }
    uVar6 = (undefined4)((ulonglong)uVar22 >> 0x20);
    uVar22 = FloatVectorMult(uVar26,CONCAT44(uVar6,*(undefined4 *)(param_1 + 0x6c)),2,0x20);
    uVar22 = FloatVectorSub(uVar28,uVar22,2,0x20);
    *(int *)(param_1 + 0x68) = (int)uVar22;
    *(undefined4 *)(param_1 + 0x68) = 0;
    *(undefined1 *)(param_1 + 0x75) = 0;
    fVar21 = *(float *)(param_1 + 0xc);
    uVar22 = FloatVectorMult(CONCAT44(uVar6,fVar21),0,2,0x20);
    if ((int)((uint)(fVar21 < (float)uVar22) << 0x1f) < 0) {
      uVar22 = CONCAT44((int)((ulonglong)uVar22 >> 0x20),fVar21);
    }
    uVar22 = FPToFixed(uVar22,0,0,3,0x20);
    uVar6 = (undefined4)uVar22;
    *(char *)(param_1 + 0xb) = (char)uVar22;
  }
  return uVar6;
}


```

## FUN_0001267c — 0001267c

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

## FUN_000619d0 — 000619d0

```c

void FUN_000619d0(int *param_1,int param_2)

{
  longlong lVar1;
  undefined *puVar2;
  int iVar3;
  undefined4 uVar4;
  undefined4 *puVar5;
  float fVar6;
  float fVar7;
  uint uVar8;
  uint uVar9;
  uint uVar10;
  int iVar11;
  undefined1 uVar12;
  int iVar13;
  int *piVar14;
  undefined1 *puVar15;
  int *piVar16;
  undefined4 *puVar17;
  code *pcVar18;
  float fVar19;
  undefined8 uVar20;
  undefined4 extraout_s1;
  undefined4 uVar21;
  undefined4 extraout_s1_00;
  undefined4 extraout_s3;
  undefined4 uVar23;
  undefined8 uVar22;
  undefined4 extraout_s3_00;
  undefined4 extraout_s5;
  undefined4 uVar25;
  undefined8 uVar24;
  undefined4 extraout_s5_00;
  undefined4 extraout_s7;
  undefined4 extraout_s7_00;
  undefined4 local_2f4;
  undefined **local_2f0;
  undefined *local_2ec;
  undefined4 local_2e8 [8];
  undefined1 local_2c8;
  undefined4 local_2c4;
  undefined4 local_2c0;
  undefined4 local_2bc;
  undefined4 local_2b8;
  undefined4 local_2b4;
  undefined1 auStack_2b0 [40];
  undefined1 auStack_288 [40];
  undefined1 auStack_260 [40];
  undefined1 auStack_238 [40];
  undefined1 auStack_210 [40];
  undefined1 auStack_1e8 [40];
  undefined1 auStack_1c0 [40];
  undefined1 auStack_198 [40];
  undefined1 auStack_170 [40];
  undefined1 auStack_148 [40];
  undefined1 auStack_120 [40];
  undefined1 auStack_f8 [40];
  undefined1 auStack_d0 [40];
  undefined1 auStack_a8 [40];
  undefined1 auStack_80 [40];
  undefined1 auStack_58 [40];
  undefined1 local_30 [4];
  int local_2c;
  
  local_2c = *(int *)PTR____stack_chk_guard_004d9044;
  (**(code **)(*param_1 + 0x20))(param_1);
  *(undefined1 *)(param_1 + 0x28) = 0;
  param_1[0x10] = *(int *)(param_2 + 0x178);
  iVar13 = -1;
  for (piVar16 = *(int **)(param_2 + 0x16c); piVar16 != (int *)(param_2 + 0x16c);
      piVar16 = (int *)*piVar16) {
    iVar3 = piVar16[0x22];
    if ((-1 < iVar3) && (iVar3 < DAT_005f94fc - DAT_005f94f8 >> 2)) {
      FUN_0006f040(*(undefined4 *)(DAT_005f94f8 + iVar3 * 4),piVar16 + 2,piVar16[0x23],piVar16[0x24]
                  );
      if (iVar13 <= piVar16[0x22]) {
        iVar13 = piVar16[0x22];
      }
    }
  }
  iVar3 = *(int *)(param_2 + 0x1a4);
  iVar11 = *(int *)(param_2 + 0x1ac);
  piVar16 = param_1 + 0x12;
  *piVar16 = *(int *)(param_2 + 0x1a8);
  param_1[0x13] = iVar11;
  param_1[0x17] = iVar3;
  param_1[0x22] = *(int *)(param_2 + 0x1a0);
  iVar13 = *(int *)(DAT_005f94f8 + iVar13 * 4);
  param_1[0x1a] = iVar13;
  uVar9 = *(uint *)(param_2 + 0x17c);
  uVar8 = 0;
  if ((uVar9 != 0) && (uVar8 = *(int *)(iVar13 + 0x7c) - 1, uVar9 < uVar8)) {
    uVar8 = uVar9;
  }
  *(uint *)(iVar13 + 0x90) = uVar8;
  iVar13 = FUN_0006ed60();
  puVar2 = PTR_DAT_004d9048;
  param_1[0x19] = iVar13;
  iVar13 = FUN_00052f80();
  *(undefined4 *)(iVar13 + 0x208) = *(undefined4 *)(*(int *)(puVar2 + 0x5c) + 0x118);
  puVar5 = DAT_005f94d0;
  if ((undefined4 **)DAT_005f94d0 != &DAT_005f94d0) {
    do {
      puVar17 = (undefined4 *)*puVar5;
      operator_delete(puVar5);
      puVar5 = puVar17;
    } while ((undefined4 **)puVar17 != &DAT_005f94d0);
  }
  DAT_005f94d0 = &DAT_005f94d0;
  DAT_005f94d4 = &DAT_005f94d0;
  if (param_1[0x19] != 0) {
    FUN_0005ed54(&DAT_005f94b4,param_1[0x19] + 0xdc);
  }
  if (param_1[0x10] != 1) {
    iVar13 = FUN_0006ed58(param_1[0x1a],*(undefined4 *)(param_1[0x1a] + 0x90));
    FUN_0005edc0(&DAT_005f94b4,*(undefined4 *)(iVar13 + 4));
  }
  piVar14 = param_1 + 2;
  FUN_00066428(piVar14,param_2);
  FUN_000663a0(piVar14,&DAT_005f94b4);
  iVar13 = param_1[1];
  FUN_0030f7cc(auStack_58,"bonusIntro");
  iVar13 = FUN_0039725c(iVar13,auStack_58);
  param_1[0x25] = iVar13;
  FUN_0030f7e0(auStack_58);
  iVar13 = param_1[1];
  FUN_0030f7cc(auStack_80,"@bonusCheer");
  iVar13 = FUN_0039725c(iVar13,auStack_80);
  param_1[0x27] = iVar13;
  FUN_0030f7e0(auStack_80);
  if (param_1[0x24] != 0) {
    FUN_00068a04(param_1[0x24],param_2);
  }
  iVar13 = param_1[0x10];
  if (iVar13 == 3) {
    if (param_1[1] != 0) {
      local_30[0] = 0;
      FUN_0001da28(*(undefined4 *)(param_1[1] + 0x260),local_30);
    }
    goto LAB_0006211e;
  }
  if (iVar13 != 2) {
    if (iVar13 == 1) {
      puVar5 = DAT_005f94d0;
      if ((undefined4 **)DAT_005f94d0 != &DAT_005f94d0) {
        do {
          puVar17 = (undefined4 *)*puVar5;
          operator_delete(puVar5);
          puVar5 = puVar17;
        } while ((undefined4 **)puVar17 != &DAT_005f94d0);
      }
      DAT_005f94d0 = &DAT_005f94d0;
      DAT_005f94d4 = &DAT_005f94d0;
      FUN_0005ed54(&DAT_005f94b4,param_1[0x19] + 0xdc);
      uVar12 = 1;
      if ((param_1[0x1a] != 0) && (uVar12 = 0, *(int *)(param_1[0x1a] + 0x98) == 0)) {
        uVar12 = 1;
      }
      iVar13 = param_1[2];
      iVar11 = param_1[0x19];
      *(undefined4 *)(iVar13 + 0x48) = 0;
      *(undefined1 *)(iVar13 + 0x18) = 0;
      FUN_000664b4();
      iVar13 = *(int *)(iVar11 + 0xf0);
      iVar3 = *(int *)(iVar11 + 0xf4);
      param_1[7] = *(int *)(iVar11 + 0xec);
      param_1[8] = iVar13;
      param_1[9] = iVar3;
      param_1[8] = 0x3f800000;
      param_1[10] = 0x40400000;
      param_1[0xb] = 0;
      *(undefined1 *)(param_1 + 0xc) = uVar12;
      param_1[0xd] = 0;
      param_1[0xf] = 0;
      FUN_0006f6d8(param_1[0x19],param_1);
      puVar5 = DAT_005f94f0;
      if ((undefined4 **)DAT_005f94f0 != &DAT_005f94f0) {
        do {
          puVar17 = (undefined4 *)*puVar5;
          operator_delete(puVar5);
          puVar5 = puVar17;
        } while ((undefined4 **)puVar17 != &DAT_005f94f0);
      }
      DAT_005f94f0 = &DAT_005f94f0;
      DAT_005f94f4 = &DAT_005f94f0;
      iVar13 = param_1[1];
      iVar3 = param_1[0x19];
      FUN_0030f7cc(auStack_a8,"challengeMods");
      uVar4 = FUN_0039725c(iVar13,auStack_a8);
      FUN_00063e98(&DAT_005f94e4,iVar3 + 0xe4,uVar4);
      FUN_0030f7e0(auStack_a8);
      FUN_00066b18(piVar16);
      *(undefined1 *)(param_1 + 0x1f) = 0;
      FUN_000612d0(param_1);
      FUN_000613e4(param_1);
      iVar13 = param_1[1];
      FUN_0030f7cc(auStack_d0,"instructionsText");
      iVar13 = FUN_0039725c(iVar13,auStack_d0);
      FUN_0030f7e0(auStack_d0);
      iVar3 = param_1[1];
      FUN_0030f7cc(auStack_f8,"@bonusScoreCounter");
      iVar3 = FUN_0039725c(iVar3,auStack_f8);
      FUN_0030f7e0(auStack_f8);
      if (*(int *)(param_1[0x1a] + 0x98) == 0) {
        if (iVar3 != 0) {
          local_30[0] = 0;
          FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),local_30);
        }
      }
      else {
        if (iVar13 != 0) {
          local_30[0] = 0;
          FUN_0001da28(*(undefined4 *)(iVar13 + 0x260),local_30);
        }
        if (iVar3 != 0) {
          local_30[0] = 0;
          FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),local_30);
          FUN_0030f7cc(auStack_120,"text");
          iVar13 = FUN_0039725c(iVar3,auStack_120);
          FUN_0030f7e0(auStack_120);
          if (iVar13 != 0) {
            *(undefined4 *)(iVar13 + 0x884) = 0;
            FUN_003d0bf4(iVar13);
          }
          param_1[0x26] = iVar3;
        }
      }
      FUN_00064110(&DAT_005f94e4);
      FUN_00060514(param_1);
    }
    goto LAB_0006211e;
  }
  puVar5 = DAT_005f94d0;
  if ((undefined4 **)DAT_005f94d0 != &DAT_005f94d0) {
    do {
      puVar17 = (undefined4 *)*puVar5;
      operator_delete(puVar5);
      puVar5 = puVar17;
    } while ((undefined4 **)puVar17 != &DAT_005f94d0);
  }
  DAT_005f94d0 = &DAT_005f94d0;
  DAT_005f94d4 = &DAT_005f94d0;
  FUN_0005ed54(&DAT_005f94b4,param_1[0x19] + 0xdc);
  uVar12 = 1;
  if ((param_1[0x1a] != 0) && (uVar12 = 0, *(int *)(param_1[0x1a] + 0x98) == 0)) {
    uVar12 = 1;
  }
  iVar13 = param_1[2];
  iVar11 = param_1[0x19];
  *(undefined4 *)(iVar13 + 0x48) = 0;
  *(undefined1 *)(iVar13 + 0x18) = 0;
  FUN_000664b4();
  iVar13 = *(int *)(iVar11 + 0xf0);
  iVar3 = *(int *)(iVar11 + 0xf4);
  param_1[7] = *(int *)(iVar11 + 0xec);
  param_1[8] = iVar13;
  param_1[9] = iVar3;
  param_1[8] = 0x3f800000;
  param_1[10] = 0x40400000;
  param_1[0xb] = 0;
  *(undefined1 *)(param_1 + 0xc) = uVar12;
  param_1[0xd] = 0;
  param_1[0xf] = 0;
  puVar5 = DAT_005f94f0;
  if ((undefined4 **)DAT_005f94f0 != &DAT_005f94f0) {
    do {
      puVar17 = (undefined4 *)*puVar5;
      operator_delete(puVar5);
      puVar5 = puVar17;
    } while ((undefined4 **)puVar17 != &DAT_005f94f0);
  }
  DAT_005f94f0 = &DAT_005f94f0;
  DAT_005f94f4 = &DAT_005f94f0;
  iVar13 = param_1[1];
  iVar3 = param_1[0x19];
  FUN_0030f7cc(auStack_148,"challengeMods");
  uVar4 = FUN_0039725c(iVar13,auStack_148);
  FUN_00063e98(&DAT_005f94e4,iVar3 + 0xe4,uVar4);
  FUN_0030f7e0(auStack_148);
  FUN_00066b18(piVar16);
  FUN_000612d0(param_1);
  FUN_000613e4(param_1);
  iVar13 = param_1[1];
  FUN_0030f7cc(auStack_170,"instructionsText");
  iVar13 = FUN_0039725c(iVar13,auStack_170);
  FUN_0030f7e0(auStack_170);
  iVar3 = param_1[1];
  FUN_0030f7cc(auStack_198,"@bonusScoreCounter");
  iVar3 = FUN_0039725c(iVar3,auStack_198);
  FUN_0030f7e0(auStack_198);
  if (*(int *)(param_1[0x1a] + 0x98) == 0) {
    if (iVar3 != 0) {
      local_30[0] = 0;
      FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),local_30);
    }
  }
  else {
    if (iVar13 != 0) {
      local_30[0] = 0;
      FUN_0001da28(*(undefined4 *)(iVar13 + 0x260),local_30);
    }
    if (iVar3 != 0) {
      local_30[0] = 0;
      FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),local_30);
      FUN_0030f7cc(auStack_1c0,"text");
      iVar11 = FUN_0039725c(iVar3,auStack_1c0);
      FUN_0030f7e0(auStack_1c0);
      if (iVar11 != 0) {
        *(undefined4 *)(iVar11 + 0x884) = 0;
        FUN_003d0bf4(iVar11);
      }
      param_1[0x26] = iVar3;
    }
  }
  FUN_00064110(&DAT_005f94e4);
  iVar3 = param_1[1];
  FUN_0030f7cc(auStack_1e8,"Timer");
  piVar16 = (int *)FUN_0039725c(iVar3,auStack_1e8);
  FUN_0030f7e0(auStack_1e8);
  if (piVar16 != (int *)0x0) {
    local_30[0] = 1;
    FUN_0001da28(piVar16[0x98],local_30);
    FUN_00396d98(piVar16,1);
    fVar6 = (float)FUN_0005ee84(&DAT_005f94b4);
    fVar7 = fVar6;
    if (fVar6 == 0.0) {
      fVar7 = (float)param_1[0x19];
    }
    fVar19 = fVar6;
    if (fVar6 == 0.0) {
      fVar19 = *(float *)((int)fVar7 + 0x48);
    }
    uVar20 = FixedToFP(CONCAT44(fVar19,fVar6),0,0,0,0x20);
    if ((float)uVar20 <= *(float *)(param_2 + 0x19c)) {
      puVar15 = auStack_210;
      pcVar18 = *(code **)(*piVar16 + 0x40);
      FUN_0030f7cc(puVar15,"animate_in");
      (*pcVar18)(piVar16,puVar15,1);
LAB_000620cc:
      FUN_0030f7e0(puVar15);
    }
    else {
      FUN_0030f7cc(auStack_238,"animate_in");
      FUN_00398154(piVar16,auStack_238,1);
      FUN_0030f7e0(auStack_238);
      if (iVar13 != 0) {
        FUN_00396d98(iVar13,1);
        FUN_0030f7cc(auStack_260,"animate_in");
        FUN_00398154(iVar13,auStack_260,1);
        FUN_0030f7e0(auStack_260);
      }
      iVar13 = param_1[1];
      FUN_0030f7cc(auStack_288,"challengeMods");
      iVar13 = FUN_0039725c(iVar13,auStack_288);
      FUN_0030f7e0(auStack_288);
      if (iVar13 != 0) {
        FUN_00396d98(iVar13,1);
        puVar15 = auStack_2b0;
        FUN_0030f7cc(puVar15,"animate_in");
        FUN_00398154(iVar13,puVar15,1);
        goto LAB_000620cc;
      }
    }
    FUN_00084394(piVar16);
  }
  param_1[0x11] = *(int *)(param_2 + 0x19c);
  (**(code **)(*param_1 + 0x18))(param_1,0);
LAB_0006211e:
  iVar13 = FUN_00063fe0(&DAT_005f94e4,*(undefined4 *)PTR_DAT_004d9094);
  if (iVar13 == 1) {
    iVar13 = FUN_00063e80(&DAT_005f94e4,*(undefined4 *)PTR_DAT_004d9094);
    *(undefined4 *)(iVar13 + 0x10) = *(undefined4 *)(param_2 + 0x204);
    *(undefined4 *)(iVar13 + 0x14) = *(undefined4 *)(param_2 + 0x208);
    *(undefined4 *)(iVar13 + 0x18) = *(undefined4 *)(param_2 + 0x20c);
    *(undefined4 *)(iVar13 + 4) = *(undefined4 *)(param_2 + 0x210);
    *(undefined4 *)(iVar13 + 8) = *(undefined4 *)(param_2 + 0x214);
    *(undefined4 *)(iVar13 + 0xc) = *(undefined4 *)(param_2 + 0x218);
    local_2b4 = 0;
    uVar4 = FUN_000065c4();
    iVar13 = FUN_00006ad0(uVar4,1,&local_2b4);
    if (iVar13 != 0) {
      uVar4 = extraout_s7;
      uVar25 = extraout_s5;
      uVar23 = extraout_s3;
      uVar21 = extraout_s1;
      do {
        uVar24 = FloatVectorMult(CONCAT44(uVar25,*(undefined4 *)(iVar13 + 0xe8)),
                                 CONCAT44(uVar4,DAT_000620f0),2,0x20);
        uVar22 = FloatVectorMult(CONCAT44(uVar23,*(undefined4 *)(iVar13 + 0xec)),
                                 CONCAT44(uVar4,DAT_000620f0),2,0x20);
        uVar20 = FloatVectorMult(CONCAT44(uVar21,*(undefined4 *)(iVar13 + 0xf0)),
                                 CONCAT44(uVar4,DAT_000620f0),2,0x20);
        *(int *)(iVar13 + 0x28) = (int)uVar24;
        *(int *)(iVar13 + 0x2c) = (int)uVar22;
        *(int *)(iVar13 + 0x30) = (int)uVar20;
        FUN_0000c0b4((int)uVar20,iVar13,0);
        uVar4 = FUN_000065c4();
        iVar13 = FUN_00006af0(uVar4,1,&local_2b4);
        uVar4 = extraout_s7_00;
        uVar25 = extraout_s5_00;
        uVar23 = extraout_s3_00;
        uVar21 = extraout_s1_00;
      } while (iVar13 != 0);
    }
    iVar13 = 0;
    do {
      local_2b8 = 0;
      uVar4 = FUN_000065c4();
      iVar3 = FUN_00006ad0(uVar4,1,&local_2b8);
      if (iVar3 != 0) {
        iVar11 = 0;
        fVar7 = DAT_000620f4;
        do {
          if ((((*(float *)(iVar3 + 0x28) != *(float *)(iVar3 + 0xe8)) ||
               (*(float *)(iVar3 + 0x2c) != *(float *)(iVar3 + 0xec))) ||
              (*(float *)(iVar3 + 0x30) != *(float *)(iVar3 + 0xf0))) &&
             ((fVar7 < *(float *)(iVar3 + 0xbc) && ((*(uint *)(iVar3 + 0xc) & 0x10) == 0)))) {
            iVar11 = iVar3;
            fVar7 = *(float *)(iVar3 + 0xbc);
          }
          uVar4 = FUN_000065c4();
          iVar3 = FUN_00006af0(uVar4,1,&local_2b8);
        } while (iVar3 != 0);
        if (iVar11 != 0) {
          *(undefined4 *)(iVar11 + 0x28) = *(undefined4 *)(iVar11 + 0xe8);
          *(undefined4 *)(iVar11 + 0x2c) = *(undefined4 *)(iVar11 + 0xec);
          *(undefined4 *)(iVar11 + 0x30) = *(undefined4 *)(iVar11 + 0xf0);
          FUN_0000c0b4(iVar11,1);
        }
      }
      iVar13 = iVar13 + 1;
    } while (iVar13 != 3);
  }
  iVar13 = FUN_00063fa0(&DAT_005f94e4,"FloatingFruit");
  if ((iVar13 != 0) || (iVar13 = FUN_00064000(&DAT_005f94e4,3), iVar13 == 1)) {
    local_2bc = 0;
    uVar4 = FUN_000065c4();
    iVar13 = FUN_00006ad0(uVar4,1,&local_2bc);
    if (iVar13 != 0) {
      do {
        *(undefined1 *)(iVar13 + 0x3f) = 0;
        uVar4 = FUN_000065c4();
        iVar13 = FUN_00006af0(uVar4,1,&local_2bc);
      } while (iVar13 != 0);
    }
    uVar4 = FUN_000065c4();
    iVar13 = FUN_00006ad0(uVar4,2,&local_2bc);
    if (iVar13 != 0) {
      do {
        *(undefined1 *)(iVar13 + 0x90) = 0;
        uVar4 = FUN_000065c4();
        iVar13 = FUN_00006af0(uVar4,2,&local_2bc);
      } while (iVar13 != 0);
    }
  }
  iVar13 = FUN_00063fe0(&DAT_005f94e4,*(undefined4 *)PTR_DAT_004d918c);
  if (iVar13 == 1) {
    local_2c0 = 0;
    uVar4 = FUN_000065c4();
    iVar13 = FUN_00006ad0(uVar4,1,&local_2c0);
    if (iVar13 != 0) {
      do {
        *(undefined1 *)(iVar13 + 0xcc) = 1;
        uVar4 = FUN_000065c4();
        iVar13 = FUN_00006af0(uVar4,1,&local_2c0);
      } while (iVar13 != 0);
    }
  }
  iVar13 = FUN_00064000(&DAT_005f94e4,5);
  if ((iVar13 != 0) || (iVar13 = FUN_00064000(&DAT_005f94e4,7), iVar13 == 1)) {
    local_2c4 = 0;
    uVar4 = FUN_000065c4();
    iVar13 = FUN_00006ad0(uVar4,1,&local_2c4);
    if (iVar13 != 0) {
      do {
        if (*(float *)(iVar13 + 0xd0) <= 0.0) {
          FUN_0000b378(iVar13,iVar13 + 0x10,1);
        }
        uVar4 = FUN_000065c4();
        iVar13 = FUN_00006af0(uVar4,1,&local_2c4);
      } while (iVar13 != 0);
    }
    uVar4 = FUN_000065c4();
    iVar13 = FUN_00006ad0(uVar4,2,&local_2c4);
    if (iVar13 != 0) {
      do {
        if (*(float *)(iVar13 + 0xc0) <= 0.0) {
          FUN_00006ee8(iVar13,iVar13 + 0x10,1);
        }
        uVar4 = FUN_000065c4();
        iVar13 = FUN_00006af0(uVar4,2,&local_2c4);
      } while (iVar13 != 0);
    }
  }
  iVar13 = FUN_00063fa0(&DAT_005f94e4,"FruitOrder");
  if (iVar13 == 1) {
    FUN_0001d10c(PTR_DAT_004d9048);
    iVar13 = FUN_0005edbc(&DAT_005f94b4);
    if (iVar13 == 0) {
      uVar4 = FUN_000065c4();
      iVar13 = FUN_00006a84(uVar4,1);
      if (iVar13 == 0) {
        uVar4 = FUN_000065c4();
        uVar8 = FUN_00006a84(uVar4,2);
        if (0 < (int)uVar8) {
          do {
            puVar2 = PTR_DAT_004d9050;
            lVar1 = (ulonglong)*(uint *)PTR_DAT_004d9050 *
                    (ulonglong)*(uint *)(PTR_DAT_004d9050 + 8);
            uVar10 = (uint)lVar1;
            iVar13 = *(int *)(PTR_DAT_004d9050 + 4) * *(uint *)(PTR_DAT_004d9050 + 8) +
                     *(uint *)PTR_DAT_004d9050 * *(int *)(PTR_DAT_004d9050 + 0xc) +
                     (int)((ulonglong)lVar1 >> 0x20);
            lVar1 = CONCAT44(PTR_DAT_004d9050,iVar13);
            uVar9 = iVar13 + *(int *)(PTR_DAT_004d9050 + 0x14) +
                             (uint)CARRY4(uVar10,*(uint *)(PTR_DAT_004d9050 + 0x10));
            *(uint *)PTR_DAT_004d9050 = uVar10 + *(uint *)(PTR_DAT_004d9050 + 0x10);
            *(uint *)(puVar2 + 4) = uVar9;
            if (uVar8 != 0 && uVar8 != 0xffffffff) {
              lVar1 = (ulonglong)uVar9 * (ulonglong)uVar8;
              uVar9 = (uint)((ulonglong)lVar1 >> 0x20);
            }
            uVar4 = FUN_000065c4((int)((ulonglong)lVar1 >> 0x20),(int)lVar1);
            iVar13 = FUN_00006aa4(uVar4,2,uVar9);
          } while (iVar13 == 0);
          uVar4 = FUN_00052f80();
          iVar3 = FUN_00057000(uVar4,1,param_1[0x22],0,0);
          *(undefined4 *)(iVar3 + 0xd0) = 0;
          *(undefined4 *)(iVar3 + 0x1c) = *(undefined4 *)(iVar13 + 0x1c);
          *(undefined4 *)(iVar3 + 0x20) = *(undefined4 *)(iVar13 + 0x20);
          *(undefined4 *)(iVar3 + 0x24) = *(undefined4 *)(iVar13 + 0x24);
          *(undefined4 *)(iVar3 + 0x10) = *(undefined4 *)(iVar13 + 0x10);
          local_2ec = PTR_FUN_004d9058;
          puVar2 = PTR_DAT_004d9048;
          *(undefined4 *)(iVar3 + 0x14) = *(undefined4 *)(iVar13 + 0x14);
          *(undefined4 *)(iVar3 + 0x18) = *(undefined4 *)(iVar13 + 0x18);
          uVar4 = *(undefined4 *)(puVar2 + 0x1a4);
          local_2c8 = 1;
          local_2f0 = &PTR_LAB_0052bf38;
          local_2e8[0] = 0;
          FUN_0000a23c(&local_2f0,local_2e8);
          FUN_0002bc94(uVar4,"fruit-spawn",0x3f800000,0x3f800000,local_2e8,0);
          FUN_0000a298(local_2e8);
          uVar4 = FUN_002f69c4("fruit_bomb_transform",0x14);
          FUN_00011cc4(iVar3,uVar4);
          FUN_00008450(iVar13);
        }
      }
    }
  }
  FUN_00066428(piVar14,param_2);
  FUN_00061690(param_1);
  puVar2 = PTR_DAT_004d9048;
  *(undefined1 *)(param_1 + 0x23) = 0;
  FUN_0002bf1c(*(undefined4 *)(puVar2 + 0x1a4),"act-change");
  if (*(int *)(param_1[0x1a] + 0xac) != 0) {
    uVar4 = FUN_0002ede8();
    FUN_000300e0(uVar4,*(undefined4 *)(param_1[0x1a] + 0xac));
  }
  local_2f4 = 0;
  uVar4 = FUN_000065c4();
  iVar13 = FUN_00006ad0(uVar4,1,&local_2f4);
  if (iVar13 != 0) {
    do {
      *(undefined1 *)(iVar13 + 0xc4) = 0;
      uVar4 = FUN_000065c4();
      iVar13 = FUN_00006af0(uVar4,1,&local_2f4);
    } while (iVar13 != 0);
  }
  uVar4 = FUN_000065c4();
  iVar13 = FUN_00006ad0(uVar4,2,&local_2f4);
  if (iVar13 != 0) {
    do {
      *(undefined1 *)(iVar13 + 0x8c) = 0;
      uVar4 = FUN_000065c4();
      iVar13 = FUN_00006af0(uVar4,2,&local_2f4);
    } while (iVar13 != 0);
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_2c) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00079d28 — 00079d28

```c

void FUN_00079d28(int *param_1,int param_2)

{
  longlong lVar1;
  longlong lVar2;
  float fVar3;
  undefined *puVar4;
  undefined *puVar5;
  undefined *puVar6;
  undefined *puVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  undefined1 *puVar10;
  void *pvVar11;
  int iVar12;
  uint uVar13;
  int iVar14;
  int iVar15;
  undefined4 *puVar16;
  uint uVar17;
  int iVar18;
  uint uVar19;
  undefined4 uVar20;
  uint uVar21;
  uint uVar22;
  undefined8 uVar23;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  ulonglong uVar24;
  undefined4 extraout_s1_02;
  undefined4 extraout_s1_03;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  undefined8 uVar25;
  int iVar26;
  undefined4 extraout_s5;
  undefined8 uVar27;
  undefined8 uVar28;
  undefined8 uVar29;
  undefined4 local_98;
  undefined4 local_94;
  undefined4 local_90;
  undefined4 local_8c;
  undefined4 local_88;
  undefined4 local_84;
  undefined4 local_80;
  undefined **local_7c;
  undefined *local_78;
  undefined1 local_5c;
  undefined **local_58;
  undefined *local_54;
  undefined1 local_38;
  int local_34;
  
  puVar4 = PTR____stack_chk_guard_004d9044;
  local_34 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_0004eba4(param_1);
  fVar3 = DAT_0007a0b0;
  *param_1 = (int)&PTR_FUN_0007a39c_1_00538e48;
  iVar26 = DAT_0052bfe0;
  param_1[0x33] = DAT_0052bfe0;
  iVar12 = DAT_0052bfe4;
  param_1[0x34] = DAT_0052bfe4;
  iVar14 = DAT_0052bfe8;
  puVar6 = PTR_DAT_004d9050;
  param_1[0x35] = DAT_0052bfe8;
  param_1[0x30] = iVar26;
  param_1[0x31] = iVar12;
  param_1[0x32] = iVar14;
  param_1[0x2d] = iVar26;
  param_1[0x2e] = iVar12;
  param_1[0x2f] = iVar14;
  param_1[0x36] = 0x3f800000;
  param_1[0x37] = 0;
  param_1[0x24] = 1;
  uVar13 = *(uint *)(puVar6 + 8);
  uVar22 = *(uint *)(puVar6 + 0x10);
  lVar1 = (ulonglong)*(uint *)puVar6 * (ulonglong)uVar13;
  uVar17 = (uint)lVar1;
  uVar19 = uVar17 + uVar22;
  uVar17 = *(int *)(puVar6 + 4) * uVar13 +
           *(uint *)puVar6 * *(int *)(puVar6 + 0xc) + (int)((ulonglong)lVar1 >> 0x20) +
           *(int *)(puVar6 + 0x14) + (uint)CARRY4(uVar17,uVar22);
  uVar20 = (undefined4)((ulonglong)uVar17 * 0x7ffff >> 0x20);
  lVar1 = (ulonglong)uVar19 * (ulonglong)uVar13;
  uVar21 = (uint)lVar1;
  uVar23 = FixedToFP(CONCAT44(uVar20,uVar20),0,1,0,0x20);
  uVar20 = (undefined4)((ulonglong)uVar23 >> 0x20);
  *(uint *)puVar6 = uVar21 + uVar22;
  *(uint *)(puVar6 + 4) =
       uVar17 * uVar13 + uVar19 * *(int *)(puVar6 + 0xc) + (int)((ulonglong)lVar1 >> 0x20) +
       *(int *)(puVar6 + 0x14) + (uint)CARRY4(uVar21,uVar22);
  uVar23 = FloatVectorMult(CONCAT44(uVar20,(float)uVar23 / fVar3),0x4120000041200000,2,0x20);
  uVar23 = FloatVectorAdd(uVar23,0x4170000041700000,2);
  uVar28 = FloatVectorNeg(uVar23,2,2);
  uVar23 = FloatVectorMult(uVar28,CONCAT44(uVar20,DAT_0007a0b4),2,0x20);
  uVar23 = FPToFixed(uVar23,0,0,3,0x20);
  uVar13 = (uint)uVar23 & 0xffff;
  uVar20 = FUN_003010b8((uint)uVar23,uVar13);
  uVar8 = FUN_003010d0(uVar13);
  uVar23 = CONCAT44(extraout_s1,DAT_0007a0b8);
  *(undefined4 *)(param_1[0x1f] + 0x104) = 0x3f800000;
  uVar23 = FloatVectorMult(CONCAT44(extraout_s3,*(undefined4 *)(*(int *)(param_2 + 0x38) + 0x14)),
                           uVar23,2,0x20);
  *(int *)(*(int *)(param_2 + 0x38) + 0x14) = (int)uVar23;
  param_1[0xd] = 0x80;
  *(undefined4 *)(param_2 + 0xd8) = 0x41200000;
  (**(code **)(*param_1 + 0x40))((int)uVar23,param_1,"SLICE!",0,0);
  uVar27 = FloatVectorMult(CONCAT44(extraout_s5,DAT_0052bf80),0x3f0000003f000000,2,0x20);
  uVar25 = FloatVectorMult(CONCAT44(extraout_s3_00,DAT_0052bf84),0x3f0000003f000000,2,0x20);
  uVar23 = FloatVectorMult(CONCAT44(extraout_s1_00,DAT_0052bf88),0x3f0000003f000000,2,0x20);
  param_1[8] = (int)uVar27;
  param_1[9] = (int)uVar25;
  param_1[10] = (int)uVar23;
  uVar23 = FloatVectorNeg(uVar28,2,2);
  iVar26 = *(int *)(param_2 + 0x14);
  param_1[2] = *(int *)(param_2 + 0x10);
  param_1[3] = iVar26;
  param_1[4] = 0;
  param_1[0xb] = (int)uVar23;
  param_1[0x29] = 0x3f800000;
  param_1[0x2a] = DAT_0052bfe0;
  param_1[0x2b] = DAT_0052bfe4;
  param_1[0x2c] = DAT_0052bfe8;
  uVar9 = FUN_000251a8((int)uVar23);
  uVar23 = CONCAT44(uVar9,uVar9);
  uVar28 = FloatVectorMult(CONCAT44(uVar20,uVar20),uVar23,2,0x20);
  uVar27 = FloatVectorMult(CONCAT44(uVar8,uVar8),uVar23,2,0x20);
  uVar25 = CONCAT44(uVar8,DAT_0007a0bc);
  uVar29 = FloatVectorMult(uVar28,uVar25,2,0x20);
  uVar23 = FloatVectorMult(uVar23,0,2,0x20);
  uVar28 = FloatVectorMult(uVar27,uVar25,2,0x20);
  uVar29 = FloatVectorMult(uVar29,0x3f2000003f200000,2,0x20);
  uVar27 = FloatVectorMult(uVar23,uVar25,2,0x20);
  uVar28 = FloatVectorMult(uVar28,0x3f2000003f200000,2,0x20);
  uVar23 = FloatVectorAdd(CONCAT44(extraout_s1_01,param_1[2]),uVar29,2);
  uVar27 = FloatVectorMult(uVar27,0x3f2000003f200000,2,0x20);
  param_1[2] = (int)uVar23;
  uVar23 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar23 >> 0x20),param_1[3]),uVar28,2);
  param_1[3] = (int)uVar23;
  uVar23 = FloatVectorAdd(uVar27,CONCAT44((int)((ulonglong)uVar23 >> 0x20),param_1[4]),2);
  param_1[4] = (int)uVar23;
  puVar10 = (undefined1 *)FUN_00052f80((int)uVar23);
  *puVar10 = 1;
  FUN_000137e8(0);
  FUN_000096c4();
  FUN_00009718();
  puVar5 = PTR_DAT_004d9048;
  local_38 = 1;
  local_58 = (undefined **)0x0;
  uVar20 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
  FUN_0000a298(&local_58);
  puVar7 = PTR_FUN_004d9058;
  local_38 = 0;
  local_58 = &PTR_LAB_0052bf38;
  local_54 = PTR_FUN_004d9058;
  FUN_0002bc94(uVar20,"pome-rampdown",0x3e000000,0x3f800000,&local_58,0);
  FUN_0000a298(&local_58);
  local_5c = 1;
  local_7c = (undefined **)0x0;
  uVar20 = *(undefined4 *)(puVar5 + 0x1a4);
  FUN_0000a298(&local_7c);
  local_5c = 0;
  local_7c = &PTR_LAB_0052bf38;
  local_78 = puVar7;
  iVar26 = FUN_0002bc94(uVar20,"pome-lp",0x3f800000,0,&local_7c,0);
  param_1[0x38] = iVar26;
  FUN_0000a298(&local_7c);
  param_1[0x28] = 0x47c35000;
  param_1[0x21] = 0;
  uVar20 = FUN_00025164();
  uVar23 = FloatVectorMult(CONCAT44(uVar20,uVar20),uVar25,2,0x20);
  uVar13 = *(uint *)puVar6;
  uVar24 = FPToFixed(uVar23,0,1,3,0x20);
  lVar1 = (ulonglong)uVar13 * (ulonglong)*(uint *)(puVar6 + 8);
  uVar17 = (uint)lVar1;
  iVar12 = (int)uVar24;
  iVar26 = uVar17 + *(uint *)(puVar6 + 0x10);
  *(int *)puVar6 = iVar26;
  uVar13 = *(int *)(puVar6 + 4) * *(uint *)(puVar6 + 8) +
           uVar13 * *(int *)(puVar6 + 0xc) + (int)((ulonglong)lVar1 >> 0x20) +
           *(int *)(puVar6 + 0x14) + (uint)CARRY4(uVar17,*(uint *)(puVar6 + 0x10));
  lVar1 = CONCAT44(uVar13,iVar26);
  *(uint *)(puVar6 + 4) = uVar13;
  if (iVar12 != 0 && iVar12 != -1) {
    lVar1 = (ulonglong)uVar13 * (uVar24 & 0xffffffff);
  }
  uVar8 = (undefined4)((ulonglong)lVar1 >> 0x20);
  uVar20 = FUN_00025164(iVar12,uVar8,(int)lVar1);
  uVar23 = FixedToFP(CONCAT44(uVar8,uVar8),0,1,0,0x20);
  uVar25 = FloatVectorMult(CONCAT44(uVar20,uVar20),CONCAT44(extraout_s1_02,DAT_0007a36c),2,0x20);
  uVar23 = FloatVectorAdd(uVar23,uVar25,2);
  uVar20 = FUN_00025164();
  uVar25 = FloatVectorNeg(CONCAT44(uVar20,uVar20),2,2);
  uVar25 = FloatVectorMult(uVar25,CONCAT44(extraout_s1_03,DAT_0007a370),2,0x20);
  uVar23 = FloatVectorAdd(uVar23,uVar25,2);
  pvVar11 = operator_new(0x2c);
  local_88 = (undefined4)uVar23;
  local_84 = DAT_005a8dc0;
  local_80 = 0;
  FUN_00072988(DAT_005a8dc0,pvVar11,&DAT_005a8dbc,&local_88,0x438c0000);
  FUN_0000b358(param_2,pvVar11);
  param_1[0x43] = 0;
  iVar26 = FUN_00052f80();
  uVar13 = *(uint *)(iVar26 + 8);
  lVar1 = (ulonglong)uVar13 * (ulonglong)*(uint *)(iVar26 + 0x10);
  uVar17 = (uint)lVar1;
  *(uint *)(iVar26 + 8) = uVar17 + *(uint *)(iVar26 + 0x18);
  *(uint *)(iVar26 + 0xc) =
       *(int *)(iVar26 + 0xc) * *(uint *)(iVar26 + 0x10) +
       uVar13 * *(int *)(iVar26 + 0x14) + (int)((ulonglong)lVar1 >> 0x20) +
       *(int *)(iVar26 + 0x1c) + (uint)CARRY4(uVar17,*(uint *)(iVar26 + 0x18));
  iVar26 = FUN_00052f80();
  uVar13 = *(uint *)(iVar26 + 8);
  lVar1 = (ulonglong)uVar13 * (ulonglong)*(uint *)(iVar26 + 0x10);
  uVar17 = (uint)lVar1;
  *(uint *)(iVar26 + 8) = uVar17 + *(uint *)(iVar26 + 0x18);
  *(uint *)(iVar26 + 0xc) =
       *(int *)(iVar26 + 0xc) * *(uint *)(iVar26 + 0x10) +
       uVar13 * *(int *)(iVar26 + 0x14) + (int)((ulonglong)lVar1 >> 0x20) +
       *(int *)(iVar26 + 0x1c) + (uint)CARRY4(uVar17,*(uint *)(iVar26 + 0x18));
  iVar26 = FUN_00052f80();
  uVar13 = *(uint *)(iVar26 + 8);
  lVar1 = (ulonglong)uVar13 * (ulonglong)*(uint *)(iVar26 + 0x10);
  uVar17 = (uint)lVar1;
  *(uint *)(iVar26 + 8) = uVar17 + *(uint *)(iVar26 + 0x18);
  *(uint *)(iVar26 + 0xc) =
       *(int *)(iVar26 + 0xc) * *(uint *)(iVar26 + 0x10) +
       uVar13 * *(int *)(iVar26 + 0x14) + (int)((ulonglong)lVar1 >> 0x20) +
       *(int *)(iVar26 + 0x1c) + (uint)CARRY4(uVar17,*(uint *)(iVar26 + 0x18));
  local_98 = 0;
  local_94 = 0;
  local_90 = 0;
  local_8c = 0x3f800000;
  FUN_000147c8(&local_98,0x3f800000,0,0,0x3ffc);
  uVar13 = *(uint *)(puVar6 + 8);
  uVar17 = *(uint *)(puVar6 + 0x10);
  lVar1 = (ulonglong)*(uint *)puVar6 * (ulonglong)uVar13;
  uVar19 = (uint)lVar1;
  uVar21 = uVar19 + uVar17;
  lVar2 = (ulonglong)uVar21 * (ulonglong)uVar13;
  uVar22 = (uint)lVar2;
  uVar19 = *(int *)(puVar6 + 4) * uVar13 +
           *(uint *)puVar6 * *(int *)(puVar6 + 0xc) + (int)((ulonglong)lVar1 >> 0x20) +
           *(int *)(puVar6 + 0x14) + (uint)CARRY4(uVar19,uVar17);
  uVar8 = (undefined4)((ulonglong)uVar19 * 0x7ffff >> 0x20);
  uVar13 = uVar19 * uVar13 + uVar21 * *(int *)(puVar6 + 0xc) + (int)((ulonglong)lVar2 >> 0x20) +
           *(int *)(puVar6 + 0x14) + (uint)CARRY4(uVar22,uVar17);
  uVar20 = (undefined4)((ulonglong)uVar13 * 0x7ffff >> 0x20);
  *(uint *)puVar6 = uVar22 + uVar17;
  *(uint *)(puVar6 + 4) = uVar13;
  uVar23 = FixedToFP(CONCAT44(uVar8,uVar8),0,1,0,0x20);
  iVar26 = 0x18c;
  iVar12 = 0x134;
  iVar14 = 0x15c;
  FixedToFP(CONCAT44(uVar20,uVar20),0,1,0,0x20);
  uVar23 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar23 >> 0x20),(float)uVar23 / fVar3),
                           0x4040000040400000,2,0x20);
  uVar23 = FloatVectorAdd(uVar23,0,2);
  uVar23 = FloatVectorNeg(uVar23,2,2);
  do {
    iVar18 = param_1[0x1f];
    iVar15 = iVar18 + iVar26;
    *(undefined4 *)(iVar15 + -0x20) = DAT_0052c000;
    *(undefined4 *)(iVar15 + -0x1c) = DAT_0052c004;
    *(undefined4 *)(iVar15 + -0x18) = DAT_0052c008;
    *(undefined4 *)(iVar15 + -0x14) = DAT_0052bf00;
    *(undefined4 *)(iVar15 + -0x10) = DAT_0052bf04;
    *(undefined4 *)(iVar15 + -0xc) = DAT_0052bf08;
    *(undefined4 *)(iVar15 + -8) = DAT_0052ce60;
    *(undefined4 *)(iVar15 + -4) = DAT_0052ce64;
    *(undefined4 *)(iVar18 + iVar26) = DAT_0052ce68;
    puVar16 = (undefined4 *)(iVar18 + iVar14);
    iVar26 = iVar26 + 0x24;
    *puVar16 = (int)uVar23;
    iVar14 = iVar14 + 0xc;
    puVar16[-2] = 0;
    puVar16[-1] = 0x40c00000;
    *(undefined4 *)(iVar18 + iVar12) = local_98;
    iVar18 = iVar18 + iVar12;
    iVar12 = iVar12 + 0x10;
    *(undefined4 *)(iVar18 + 4) = local_94;
    *(undefined4 *)(iVar18 + 8) = local_90;
    *(undefined4 *)(iVar18 + 0xc) = local_8c;
  } while (iVar26 != 0x1d4);
  DAT_0052cf00 = FUN_0000aae0("super_pomegranate",0);
  if (*(int *)puVar4 != local_34) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail(*(int *)puVar4);
  }
  return;
}


```

## FUN_00021df4 — 00021df4

```c

void FUN_00021df4(void)

{
  undefined *puVar1;
  undefined4 uVar2;
  int *piVar3;
  int iVar4;
  _List_node_base *p_Var5;
  int iVar6;
  undefined4 *puVar7;
  undefined4 *puVar8;
  code *pcVar9;
  undefined *local_c4;
  undefined1 *local_c0;
  undefined1 local_a4;
  undefined1 auStack_a0 [40];
  undefined1 auStack_78 [40];
  undefined4 local_50 [8];
  undefined1 local_30;
  undefined4 local_2c;
  undefined4 local_28;
  int local_24;
  
  puVar1 = PTR_DAT_004d9048;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(PTR_DAT_004d9048 + 0x38) = *(undefined4 *)(PTR_DAT_004d9048 + 0x30);
  FUN_00052f80();
  FUN_0005520c();
  uVar2 = FUN_00052f80();
  FUN_000547ec(uVar2,0);
  puVar1[0x17] = 1;
  piVar3 = (int *)(**(code **)(**(int **)puVar1 + 0x20))();
  puVar1[0x1b1] = 1;
  if (piVar3 != (int *)0x0) {
    pcVar9 = *(code **)(*piVar3 + 0x40);
    FUN_0030f7cc(auStack_78,"animate_in");
    (*pcVar9)(piVar3,auStack_78,1);
    FUN_0030f7e0(auStack_78);
    FUN_0030f7cc(auStack_a0,"pause");
    iVar4 = FUN_0039725c(piVar3,auStack_a0);
    FUN_0030f7e0(auStack_a0);
    if (iVar4 != 0) {
      puVar8 = (undefined4 *)(iVar4 + 0xb34);
      if (*(int *)(iVar4 + 0xb3c) == 0) {
        FUN_00022608(puVar8);
        *puVar8 = puVar8;
        *(undefined4 **)(iVar4 + 0xb38) = puVar8;
      }
      else {
        puVar7 = (undefined4 *)*puVar8;
        if (puVar7 != puVar8) {
          puVar7[0xb] = *(int *)(iVar4 + 0xb3c);
          puVar7[0xc] = 2;
          *(int *)(iVar4 + 0xb40) = *(int *)(iVar4 + 0xb40) + 1;
          for (puVar7 = (undefined4 *)*puVar7; puVar7 != puVar8; puVar7 = (undefined4 *)*puVar7) {
            puVar7[0xb] = *(undefined4 *)(iVar4 + 0xb3c);
            puVar7[0xc] = 2;
            *(int *)(iVar4 + 0xb40) = *(int *)(iVar4 + 0xb40) + 1;
          }
        }
      }
      local_a4 = 1;
      local_c4 = (undefined *)0x0;
      FUN_00022510(&local_c4);
      local_a4 = 0;
      local_c4 = &DAT_0052c108;
      local_c0 = &FUN_00021398_1;
      local_30 = 1;
      local_50[0] = 0;
      (*(code *)PTR_FUN_0052c110)(&local_c4,local_50);
      local_2c = 0;
      local_28 = 0;
      p_Var5 = (_List_node_base *)FUN_0002256c(puVar8,local_50);
      std::_List_node_base::hook(p_Var5);
      FUN_00022510(local_50);
      if (*(int *)(iVar4 + 0xb3c) != 0) {
        iVar6 = *(int *)(iVar4 + 0xb38);
        *(int *)(iVar6 + 0x2c) = *(int *)(iVar4 + 0xb3c);
        *(undefined4 *)(iVar6 + 0x30) = 1;
        *(int *)(iVar4 + 0xb40) = *(int *)(iVar4 + 0xb40) + 1;
      }
      FUN_00022510(&local_c4);
    }
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 == local_24) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

## FUN_00059000 — 00059000

```c

void FUN_00059000(int param_1)

{
  int *piVar1;
  int iVar2;
  _List_node_base *p_Var3;
  int iVar4;
  char *pcVar5;
  undefined4 *puVar6;
  undefined4 uVar7;
  undefined1 *puVar8;
  undefined4 *puVar9;
  code *pcVar10;
  undefined *local_370;
  int local_36c;
  undefined1 *local_368;
  undefined4 local_364;
  undefined1 local_350;
  undefined1 auStack_34c [40];
  undefined *local_324;
  int local_320;
  undefined1 *local_31c;
  undefined4 local_318;
  undefined1 local_304;
  undefined1 auStack_300 [40];
  undefined *local_2d8;
  int local_2d4;
  undefined1 *local_2d0;
  undefined4 local_2cc;
  undefined1 local_2b8;
  undefined1 auStack_2b4 [40];
  undefined *local_28c;
  int local_288;
  undefined1 *local_284;
  undefined4 local_280;
  undefined1 local_26c;
  undefined1 auStack_268 [40];
  undefined *local_240;
  int local_23c;
  undefined1 *local_238;
  undefined4 local_234;
  undefined1 local_220;
  undefined1 auStack_21c [40];
  undefined *local_1f4;
  int local_1f0;
  undefined1 *local_1ec;
  undefined4 local_1e8;
  undefined1 local_1d4;
  undefined1 auStack_1d0 [40];
  undefined *local_1a8;
  int local_1a4;
  undefined1 *local_1a0;
  undefined4 local_19c;
  undefined1 local_188;
  undefined1 auStack_184 [40];
  undefined *local_15c;
  int local_158;
  undefined1 *local_154;
  undefined4 local_150;
  undefined1 local_13c;
  undefined1 auStack_138 [40];
  undefined *local_110;
  int local_10c;
  undefined1 *local_108;
  undefined4 local_104;
  undefined1 local_f0;
  undefined1 auStack_ec [40];
  undefined *local_c4;
  int local_c0;
  undefined1 *local_bc;
  undefined4 local_b8;
  undefined1 local_a4;
  undefined1 auStack_a0 [40];
  undefined1 auStack_78 [40];
  uint local_50 [8];
  undefined1 local_30;
  undefined4 local_2c;
  undefined4 local_28;
  int local_24;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  piVar1 = (int *)FUN_0001cfb0(*(undefined4 *)(PTR_DAT_004d9048 + 0x654),"extras",1);
  *(int **)(param_1 + 0xac) = piVar1;
  pcVar10 = *(code **)(*piVar1 + 0x40);
  FUN_0030f7cc(auStack_78,"animate_in");
  (*pcVar10)(piVar1,auStack_78,1);
  FUN_0030f7e0(auStack_78);
  uVar7 = *(undefined4 *)(param_1 + 0xac);
  FUN_0030f7cc(auStack_a0,"backgroundControl.back.fruit");
  iVar2 = FUN_0039725c(uVar7,auStack_a0);
  FUN_0030f7e0(auStack_a0);
  if (iVar2 != 0) {
    FUN_0003ca90(iVar2 + 0x75c,*(undefined4 *)(iVar2 + 0x75c));
    puVar9 = (undefined4 *)(iVar2 + 0x76c);
    if (*(int *)(iVar2 + 0x774) == 0) {
      FUN_0003ca68(puVar9);
      *puVar9 = puVar9;
      *(undefined4 **)(iVar2 + 0x770) = puVar9;
    }
    else {
      puVar6 = (undefined4 *)*puVar9;
      if (puVar6 != puVar9) {
        puVar6[0xb] = *(int *)(iVar2 + 0x774);
        puVar6[0xc] = 2;
        *(int *)(iVar2 + 0x778) = *(int *)(iVar2 + 0x778) + 1;
        for (puVar6 = (undefined4 *)*puVar6; puVar6 != puVar9; puVar6 = (undefined4 *)*puVar6) {
          puVar6[0xb] = *(undefined4 *)(iVar2 + 0x774);
          puVar6[0xc] = 2;
          *(int *)(iVar2 + 0x778) = *(int *)(iVar2 + 0x778) + 1;
        }
      }
    }
    local_a4 = 1;
    local_c4 = (undefined *)0x0;
    FUN_0003c910(&local_c4);
    local_a4 = 0;
    local_c4 = &DAT_0052c978;
    local_b8 = 0;
    local_bc = &FUN_00059b90_1;
    local_30 = 1;
    local_50[0] = 0;
    local_c0 = param_1;
    (*(code *)PTR_FUN_0052c980)(&local_c4,local_50);
    local_2c = 0;
    local_28 = 0;
    p_Var3 = (_List_node_base *)FUN_0003c96c(puVar9,local_50);
    std::_List_node_base::hook(p_Var3);
    FUN_0003c910(local_50);
    if (*(int *)(iVar2 + 0x774) != 0) {
      iVar4 = *(int *)(iVar2 + 0x770);
      *(int *)(iVar4 + 0x2c) = *(int *)(iVar2 + 0x774);
      *(undefined4 *)(iVar4 + 0x30) = 1;
      *(int *)(iVar2 + 0x778) = *(int *)(iVar2 + 0x778) + 1;
    }
    FUN_0003c910(&local_c4);
  }
  uVar7 = *(undefined4 *)(param_1 + 0xac);
  FUN_0030f7cc(auStack_ec,"backgroundControl.about.fruit");
  iVar2 = FUN_0039725c(uVar7,auStack_ec);
  FUN_0030f7e0(auStack_ec);
  if (iVar2 != 0) {
    FUN_0003ca90(iVar2 + 0x75c,*(undefined4 *)(iVar2 + 0x75c));
    puVar9 = (undefined4 *)(iVar2 + 0x76c);
    if (*(int *)(iVar2 + 0x774) == 0) {
      FUN_0003ca68(puVar9);
      *puVar9 = puVar9;
      *(undefined4 **)(iVar2 + 0x770) = puVar9;
    }
    else {
      puVar6 = (undefined4 *)*puVar9;
      if (puVar6 != puVar9) {
        puVar6[0xb] = *(int *)(iVar2 + 0x774);
        puVar6[0xc] = 2;
        *(int *)(iVar2 + 0x778) = *(int *)(iVar2 + 0x778) + 1;
        for (puVar6 = (undefined4 *)*puVar6; puVar6 != puVar9; puVar6 = (undefined4 *)*puVar6) {
          puVar6[0xb] = *(undefined4 *)(iVar2 + 0x774);
          puVar6[0xc] = 2;
          *(int *)(iVar2 + 0x778) = *(int *)(iVar2 + 0x778) + 1;
        }
      }
    }
    local_f0 = 1;
    local_110 = (undefined *)0x0;
    FUN_0003c910(&local_110);
    local_f0 = 0;
    local_110 = &DAT_0052c978;
    local_104 = 0;
    local_108 = &FUN_00059c7c_1;
    local_30 = 1;
    local_50[0] = 0;
    local_10c = param_1;
    (*(code *)PTR_FUN_0052c980)(&local_110,local_50);
    local_2c = 0;
    local_28 = 0;
    p_Var3 = (_List_node_base *)FUN_0003c96c(puVar9,local_50);
    std::_List_node_base::hook(p_Var3);
    FUN_0003c910(local_50);
    if (*(int *)(iVar2 + 0x774) != 0) {
      iVar4 = *(int *)(iVar2 + 0x770);
      *(int *)(iVar4 + 0x2c) = *(int *)(iVar2 + 0x774);
      *(undefined4 *)(iVar4 + 0x30) = 1;
      *(int *)(iVar2 + 0x778) = *(int *)(iVar2 + 0x778) + 1;
    }
    FUN_0003c910(&local_110);
  }
  uVar7 = *(undefined4 *)(param_1 + 0xac);
  FUN_0030f7cc(auStack_138,"backgroundControl.moregames.fruit");
  iVar2 = FUN_0039725c(uVar7,auStack_138);
  FUN_0030f7e0(auStack_138);
  if (iVar2 != 0) {
    FUN_0003ca90(iVar2 + 0x75c,*(undefined4 *)(iVar2 + 0x75c));
    puVar9 = (undefined4 *)(iVar2 + 0x76c);
    if (*(int *)(iVar2 + 0x774) == 0) {
      FUN_0003ca68(puVar9);
      *puVar9 = puVar9;
      *(undefined4 **)(iVar2 + 0x770) = puVar9;
    }
    else {
      puVar6 = (undefined4 *)*puVar9;
      if (puVar6 != puVar9) {
        puVar6[0xb] = *(int *)(iVar2 + 0x774);
        puVar6[0xc] = 2;
        *(int *)(iVar2 + 0x778) = *(int *)(iVar2 + 0x778) + 1;
        for (puVar6 = (undefined4 *)*puVar6; puVar6 != puVar9; puVar6 = (undefined4 *)*puVar6) {
          puVar6[0xb] = *(undefined4 *)(iVar2 + 0x774);
          puVar6[0xc] = 2;
          *(int *)(iVar2 + 0x778) = *(int *)(iVar2 + 0x778) + 1;
        }
      }
    }
    local_13c = 1;
    local_15c = (undefined *)0x0;
    FUN_0003c910(&local_15c);
    local_13c = 0;
    local_15c = &DAT_0052c978;
    local_150 = 0;
    local_154 = &FUN_00059cfc_1;
    local_30 = 1;
    local_50[0] = 0;
    local_158 = param_1;
    (*(code *)PTR_FUN_0052c980)(&local_15c,local_50);
    local_2c = 0;
    local_28 = 0;
    p_Var3 = (_List_node_base *)FUN_0003c96c(puVar9,local_50);
    std::_List_node_base::hook(p_Var3);
    FUN_0003c910(local_50);
    if (*(int *)(iVar2 + 0x774) != 0) {
      iVar4 = *(int *)(iVar2 + 0x770);
      *(int *)(iVar4 + 0x2c) = *(int *)(iVar2 + 0x774);
      *(undefined4 *)(iVar4 + 0x30) = 1;
      *(int *)(iVar2 + 0x778) = *(int *)(iVar2 + 0x778) + 1;
    }
    FUN_0003c910(&local_15c);
  }
  uVar7 = *(undefined4 *)(param_1 + 0xac);
  FUN_0030f7cc(auStack_184,"backgroundControl.gamecenter.fruit");
  iVar2 = FUN_0039725c(uVar7,auStack_184);
  FUN_0030f7e0(auStack_184);
  if (iVar2 != 0) {
    FUN_0003ca90(iVar2 + 0x75c,*(undefined4 *)(iVar2 + 0x75c));
    puVar9 = (undefined4 *)(iVar2 + 0x76c);
    if (*(int *)(iVar2 + 0x774) == 0) {
      FUN_0003ca68(puVar9);
      *puVar9 = puVar9;
      *(undefined4 **)(iVar2 + 0x770) = puVar9;
    }
    else {
      puVar6 = (undefined4 *)*puVar9;
      if (puVar6 != puVar9) {
        puVar6[0xb] = *(int *)(iVar2 + 0x774);
        puVar6[0xc] = 2;
        *(int *)(iVar2 + 0x778) = *(int *)(iVar2 + 0x778) + 1;
        for (puVar6 = (undefined4 *)*puVar6; puVar6 != puVar9; puVar6 = (undefined4 *)*puVar6) {
          puVar6[0xb] = *(undefined4 *)(iVar2 + 0x774);
          puVar6[0xc] = 2;
          *(int *)(iVar2 + 0x778) = *(int *)(iVar2 + 0x778) + 1;
        }
      }
    }
    local_188 = 1;
    local_1a8 = (undefined *)0x0;
    FUN_0003c910(&local_1a8);
    local_188 = 0;
    local_1a8 = &DAT_0052c978;
    local_19c = 0;
    local_1a0 = &FUN_00059d54_1;
    local_30 = 1;
    local_50[0] = 0;
    local_1a4 = param_1;
    (*(code *)PTR_FUN_0052c980)(&local_1a8,local_50);
    local_2c = 0;
    local_28 = 0;
    p_Var3 = (_List_node_base *)FUN_0003c96c(puVar9,local_50);
    std::_List_node_base::hook(p_Var3);
    FUN_0003c910(local_50);
    if (*(int *)(iVar2 + 0x774) != 0) {
      iVar4 = *(int *)(iVar2 + 0x770);
      *(int *)(iVar4 + 0x2c) = *(int *)(iVar2 + 0x774);
      *(undefined4 *)(iVar4 + 0x30) = 1;
      *(int *)(iVar2 + 0x778) = *(int *)(iVar2 + 0x778) + 1;
    }
    FUN_0003c910(&local_1a8);
    local_50[0] = CONCAT31(local_50[0]._1_3_,1);
    FUN_0001da28(*(undefined4 *)(iVar2 + 0x260),local_50);
  }
  uVar7 = *(undefined4 *)(param_1 + 0xac);
  FUN_0030f7cc(auStack_1d0,"backgroundControl.animation_wrapper.audio.sound_toggle");
  iVar2 = FUN_0039725c(uVar7,auStack_1d0);
  FUN_0030f7e0(auStack_1d0);
  if (iVar2 != 0) {
    FUN_0003ca90(iVar2 + 0x740,*(undefined4 *)(iVar2 + 0x740));
    puVar9 = (undefined4 *)(iVar2 + 0x750);
    if (*(int *)(iVar2 + 0x758) == 0) {
      FUN_00048478(puVar9);
      *puVar9 = puVar9;
      *(undefined4 **)(iVar2 + 0x754) = puVar9;
    }
    else {
      puVar6 = (undefined4 *)*puVar9;
      if (puVar6 != puVar9) {
        puVar6[0xb] = *(int *)(iVar2 + 0x758);
        puVar6[0xc] = 2;
        *(int *)(iVar2 + 0x75c) = *(int *)(iVar2 + 0x75c) + 1;
        for (puVar6 = (undefined4 *)*puVar6; puVar6 != puVar9; puVar6 = (undefined4 *)*puVar6) {
          puVar6[0xb] = *(undefined4 *)(iVar2 + 0x758);
          puVar6[0xc] = 2;
          *(int *)(iVar2 + 0x75c) = *(int *)(iVar2 + 0x75c) + 1;
        }
      }
    }
    local_1d4 = 1;
    local_1f4 = (undefined *)0x0;
    FUN_00048328(&local_1f4);
    local_1d4 = 0;
    local_1f4 = &DAT_0052c958;
    local_1e8 = 0;
    local_1ec = &LAB_00059e08_1;
    local_30 = 1;
    local_50[0] = 0;
    local_1f0 = param_1;
    (*(code *)PTR_FUN_0052c960)(&local_1f4,local_50);
    local_2c = 0;
    local_28 = 0;
    p_Var3 = (_List_node_base *)FUN_00048384(puVar9,local_50);
    std::_List_node_base::hook(p_Var3);
    FUN_00048328(local_50);
    if (*(int *)(iVar2 + 0x758) != 0) {
      iVar4 = *(int *)(iVar2 + 0x754);
      *(int *)(iVar4 + 0x2c) = *(int *)(iVar2 + 0x758);
      *(undefined4 *)(iVar4 + 0x30) = 1;
      *(int *)(iVar2 + 0x75c) = *(int *)(iVar2 + 0x75c) + 1;
    }
    FUN_00048328(&local_1f4);
    local_50[0] = CONCAT31(local_50[0]._1_3_,PTR_DAT_004d9048[0x54]);
    FUN_0001da28(*(undefined4 *)(iVar2 + 0x7a8),local_50);
  }
  uVar7 = *(undefined4 *)(param_1 + 0xac);
  FUN_0030f7cc(auStack_21c,"backgroundControl.animation_wrapper.audio.music_toggle");
  iVar2 = FUN_0039725c(uVar7,auStack_21c);
  FUN_0030f7e0(auStack_21c);
  if (iVar2 != 0) {
    FUN_0003ca90(iVar2 + 0x740,*(undefined4 *)(iVar2 + 0x740));
    puVar9 = (undefined4 *)(iVar2 + 0x750);
    if (*(int *)(iVar2 + 0x758) == 0) {
      FUN_00048478(puVar9);
      *puVar9 = puVar9;
      *(undefined4 **)(iVar2 + 0x754) = puVar9;
    }
    else {
      puVar6 = (undefined4 *)*puVar9;
      if (puVar6 != puVar9) {
        puVar6[0xb] = *(int *)(iVar2 + 0x758);
        puVar6[0xc] = 2;
        *(int *)(iVar2 + 0x75c) = *(int *)(iVar2 + 0x75c) + 1;
        for (puVar6 = (undefined4 *)*puVar6; puVar6 != puVar9; puVar6 = (undefined4 *)*puVar6) {
          puVar6[0xb] = *(undefined4 *)(iVar2 + 0x758);
          puVar6[0xc] = 2;
          *(int *)(iVar2 + 0x75c) = *(int *)(iVar2 + 0x75c) + 1;
        }
      }
    }
    local_220 = 1;
    local_240 = (undefined *)0x0;
    FUN_00048328(&local_240);
    local_220 = 0;
    local_240 = &DAT_0052c958;
    local_234 = 0;
    local_238 = &LAB_00059e4c_1;
    local_30 = 1;
    local_50[0] = 0;
    local_23c = param_1;
    (*(code *)PTR_FUN_0052c960)(&local_240,local_50);
    local_2c = 0;
    local_28 = 0;
    p_Var3 = (_List_node_base *)FUN_00048384(puVar9,local_50);
    std::_List_node_base::hook(p_Var3);
    FUN_00048328(local_50);
    if (*(int *)(iVar2 + 0x758) != 0) {
      iVar4 = *(int *)(iVar2 + 0x754);
      *(int *)(iVar4 + 0x2c) = *(int *)(iVar2 + 0x758);
      *(undefined4 *)(iVar4 + 0x30) = 1;
      *(int *)(iVar2 + 0x75c) = *(int *)(iVar2 + 0x75c) + 1;
    }
    FUN_00048328(&local_240);
    local_50[0] = CONCAT31(local_50[0]._1_3_,PTR_DAT_004d9048[0x55]);
    FUN_0001da28(*(undefined4 *)(iVar2 + 0x7a8),local_50);
  }
  uVar7 = *(undefined4 *)(param_1 + 0xac);
  FUN_0030f7cc(auStack_268,"backgroundControl.animation_wrapper.audio.vo_toggle");
  iVar2 = FUN_0039725c(uVar7,auStack_268);
  FUN_0030f7e0(auStack_268);
  if (iVar2 != 0) {
    FUN_0003ca90(iVar2 + 0x740,*(undefined4 *)(iVar2 + 0x740));
    puVar9 = (undefined4 *)(iVar2 + 0x750);
    if (*(int *)(iVar2 + 0x758) == 0) {
      FUN_00048478(puVar9);
      *puVar9 = puVar9;
      *(undefined4 **)(iVar2 + 0x754) = puVar9;
    }
    else {
      puVar6 = (undefined4 *)*puVar9;
      if (puVar6 != puVar9) {
        puVar6[0xb] = *(int *)(iVar2 + 0x758);
        puVar6[0xc] = 2;
        *(int *)(iVar2 + 0x75c) = *(int *)(iVar2 + 0x75c) + 1;
        for (puVar6 = (undefined4 *)*puVar6; puVar6 != puVar9; puVar6 = (undefined4 *)*puVar6) {
          puVar6[0xb] = *(undefined4 *)(iVar2 + 0x758);
          puVar6[0xc] = 2;
          *(int *)(iVar2 + 0x75c) = *(int *)(iVar2 + 0x75c) + 1;
        }
      }
    }
    local_26c = 1;
    local_28c = (undefined *)0x0;
    FUN_00048328(&local_28c);
    local_26c = 0;
    local_28c = &DAT_0052c958;
    local_280 = 0;
    local_284 = &LAB_00059e60_1;
    local_30 = 1;
    local_50[0] = 0;
    local_288 = param_1;
    (*(code *)PTR_FUN_0052c960)(&local_28c,local_50);
    local_2c = 0;
    local_28 = 0;
    p_Var3 = (_List_node_base *)FUN_00048384(puVar9,local_50);
    std::_List_node_base::hook(p_Var3);
    FUN_00048328(local_50);
    if (*(int *)(iVar2 + 0x758) != 0) {
      iVar4 = *(int *)(iVar2 + 0x754);
      *(int *)(iVar4 + 0x2c) = *(int *)(iVar2 + 0x758);
      *(undefined4 *)(iVar4 + 0x30) = 1;
      *(int *)(iVar2 + 0x75c) = *(int *)(iVar2 + 0x75c) + 1;
    }
    FUN_00048328(&local_28c);
    local_50[0] = CONCAT31(local_50[0]._1_3_,PTR_DAT_004d9048[0x56]);
    FUN_0001da28(*(undefined4 *)(iVar2 + 0x7a8),local_50);
  }
  uVar7 = *(undefined4 *)(param_1 + 0xac);
  FUN_0030f7cc(auStack_2b4,"backgroundControl.animation_wrapper.follow.twitter");
  iVar2 = FUN_0039725c(uVar7,auStack_2b4);
  FUN_0030f7e0(auStack_2b4);
  if (iVar2 != 0) {
    puVar9 = (undefined4 *)(iVar2 + 0xb34);
    if (*(int *)(iVar2 + 0xb3c) == 0) {
      FUN_00022608(puVar9);
      *puVar9 = puVar9;
      *(undefined4 **)(iVar2 + 0xb38) = puVar9;
    }
    else {
      puVar6 = (undefined4 *)*puVar9;
      if (puVar6 != puVar9) {
        puVar6[0xb] = *(int *)(iVar2 + 0xb3c);
        puVar6[0xc] = 2;
        *(int *)(iVar2 + 0xb40) = *(int *)(iVar2 + 0xb40) + 1;
        for (puVar6 = (undefined4 *)*puVar6; puVar6 != puVar9; puVar6 = (undefined4 *)*puVar6) {
          puVar6[0xb] = *(undefined4 *)(iVar2 + 0xb3c);
          puVar6[0xc] = 2;
          *(int *)(iVar2 + 0xb40) = *(int *)(iVar2 + 0xb40) + 1;
        }
      }
    }
    local_2b8 = 1;
    local_2d8 = (undefined *)0x0;
    FUN_00022510(&local_2d8);
    local_2b8 = 0;
    local_2d8 = &DAT_0052c938;
    local_2cc = 0;
    local_2d0 = &LAB_00059e88_1;
    local_30 = 1;
    local_50[0] = 0;
    local_2d4 = param_1;
    (*(code *)PTR_FUN_0052c940)(&local_2d8,local_50);
    local_2c = 0;
    local_28 = 0;
    p_Var3 = (_List_node_base *)FUN_0002256c(puVar9,local_50);
    std::_List_node_base::hook(p_Var3);
    FUN_00022510(local_50);
    if (*(int *)(iVar2 + 0xb3c) != 0) {
      iVar4 = *(int *)(iVar2 + 0xb38);
      *(int *)(iVar4 + 0x2c) = *(int *)(iVar2 + 0xb3c);
      *(undefined4 *)(iVar4 + 0x30) = 1;
      *(int *)(iVar2 + 0xb40) = *(int *)(iVar2 + 0xb40) + 1;
    }
    FUN_00022510(&local_2d8);
  }
  uVar7 = *(undefined4 *)(param_1 + 0xac);
  FUN_0030f7cc(auStack_300,"backgroundControl.animation_wrapper.follow.facebook");
  iVar2 = FUN_0039725c(uVar7,auStack_300);
  FUN_0030f7e0(auStack_300);
  if (iVar2 != 0) {
    puVar9 = (undefined4 *)(iVar2 + 0xb34);
    if (*(int *)(iVar2 + 0xb3c) == 0) {
      FUN_00022608(puVar9);
      *puVar9 = puVar9;
      *(undefined4 **)(iVar2 + 0xb38) = puVar9;
    }
    else {
      puVar6 = (undefined4 *)*puVar9;
      if (puVar6 != puVar9) {
        puVar6[0xb] = *(int *)(iVar2 + 0xb3c);
        puVar6[0xc] = 2;
        *(int *)(iVar2 + 0xb40) = *(int *)(iVar2 + 0xb40) + 1;
        for (puVar6 = (undefined4 *)*puVar6; puVar6 != puVar9; puVar6 = (undefined4 *)*puVar6) {
          puVar6[0xb] = *(undefined4 *)(iVar2 + 0xb3c);
          puVar6[0xc] = 2;
          *(int *)(iVar2 + 0xb40) = *(int *)(iVar2 + 0xb40) + 1;
        }
      }
    }
    local_304 = 1;
    local_324 = (undefined *)0x0;
    FUN_00022510(&local_324);
    local_304 = 0;
    local_324 = &DAT_0052c938;
    local_318 = 0;
    local_31c = &LAB_00059eb4_1;
    local_30 = 1;
    local_50[0] = 0;
    local_320 = param_1;
    (*(code *)PTR_FUN_0052c940)(&local_324,local_50);
    local_2c = 0;
    local_28 = 0;
    p_Var3 = (_List_node_base *)FUN_0002256c(puVar9,local_50);
    std::_List_node_base::hook(p_Var3);
    FUN_00022510(local_50);
    if (*(int *)(iVar2 + 0xb3c) != 0) {
      iVar4 = *(int *)(iVar2 + 0xb38);
      *(int *)(iVar4 + 0x2c) = *(int *)(iVar2 + 0xb3c);
      *(undefined4 *)(iVar4 + 0x30) = 1;
      *(int *)(iVar2 + 0xb40) = *(int *)(iVar2 + 0xb40) + 1;
    }
    FUN_00022510(&local_324);
  }
  uVar7 = *(undefined4 *)(param_1 + 0xac);
  FUN_0030f7cc(auStack_34c,"backgroundControl.animation_wrapper.change_button");
  iVar2 = FUN_0039725c(uVar7,auStack_34c);
  FUN_0030f7e0(auStack_34c);
  if (iVar2 != 0) {
    FUN_0003ca90(iVar2 + 0x740,*(undefined4 *)(iVar2 + 0x740));
    puVar9 = (undefined4 *)(iVar2 + 0x750);
    if (*(int *)(iVar2 + 0x758) == 0) {
      FUN_00048478(puVar9);
      *puVar9 = puVar9;
      *(undefined4 **)(iVar2 + 0x754) = puVar9;
    }
    else {
      puVar6 = (undefined4 *)*puVar9;
      if (puVar6 != puVar9) {
        puVar6[0xb] = *(int *)(iVar2 + 0x758);
        puVar6[0xc] = 2;
        *(int *)(iVar2 + 0x75c) = *(int *)(iVar2 + 0x75c) + 1;
        for (puVar6 = (undefined4 *)*puVar6; puVar6 != puVar9; puVar6 = (undefined4 *)*puVar6) {
          puVar6[0xb] = *(undefined4 *)(iVar2 + 0x758);
          puVar6[0xc] = 2;
          *(int *)(iVar2 + 0x75c) = *(int *)(iVar2 + 0x75c) + 1;
        }
      }
    }
    local_350 = 1;
    local_370 = (undefined *)0x0;
    FUN_00048328(&local_370);
    local_350 = 0;
    local_370 = &DAT_0052c958;
    local_364 = 0;
    local_368 = &FUN_00059ee0_1;
    local_30 = 1;
    local_50[0] = 0;
    local_36c = param_1;
    (*(code *)PTR_FUN_0052c960)(&local_370,local_50);
    local_2c = 0;
    local_28 = 0;
    p_Var3 = (_List_node_base *)FUN_00048384(puVar9,local_50);
    std::_List_node_base::hook(p_Var3);
    FUN_00048328(local_50);
    if (*(int *)(iVar2 + 0x758) != 0) {
      iVar4 = *(int *)(iVar2 + 0x754);
      *(int *)(iVar4 + 0x2c) = *(int *)(iVar2 + 0x758);
      *(undefined4 *)(iVar4 + 0x30) = 1;
      *(int *)(iVar2 + 0x75c) = *(int *)(iVar2 + 0x75c) + 1;
    }
    FUN_00048328(&local_370);
    iVar4 = FUN_00021fac();
    local_50[0] = CONCAT31(local_50[0]._1_3_,iVar4 == 2);
    FUN_0001da28(*(undefined4 *)(iVar2 + 0x7a8),local_50);
    iVar2 = FUN_00021fac();
    uVar7 = *(undefined4 *)(param_1 + 0xac);
    if (iVar2 == 2) {
      puVar8 = &stack0x0000000c;
      pcVar5 = "backgroundControl.openfeint";
    }
    else {
      puVar8 = &stack0xffffffe4;
      pcVar5 = "backgroundControl.gamecenter";
    }
    puVar8 = puVar8 + -0x3a4;
    FUN_0030f7cc(puVar8,pcVar5);
    iVar2 = FUN_0039725c(uVar7,puVar8);
    FUN_0030f7e0(puVar8);
    if (iVar2 != 0) {
      local_50[0] = local_50[0] & 0xffffff00;
      FUN_0001da28(*(undefined4 *)(iVar2 + 0x260),local_50);
    }
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0007106c — 0007106c

```c

void FUN_0007106c(int *param_1,undefined4 param_2,undefined4 param_3)

{
  undefined *puVar1;
  int iVar2;
  void *pvVar3;
  undefined4 uVar4;
  int *piVar5;
  int iVar6;
  code *pcVar7;
  undefined8 uVar8;
  undefined4 extraout_s1;
  float fVar9;
  undefined1 auStack_2ac [40];
  undefined1 auStack_284 [40];
  undefined1 auStack_25c [40];
  undefined1 auStack_234 [40];
  undefined4 local_20c;
  undefined4 local_208;
  undefined4 local_204;
  undefined1 auStack_200 [40];
  undefined1 auStack_1d8 [40];
  undefined1 auStack_1b0 [40];
  undefined1 auStack_188 [40];
  undefined1 auStack_160 [40];
  undefined1 local_138 [4];
  char acStack_134 [128];
  char acStack_b4 [128];
  int local_34;
  
  local_34 = *(int *)PTR____stack_chk_guard_004d9044;
  (**(code **)(*param_1 + 0x20))(param_1);
  puVar1 = PTR_DAT_004d9048;
  iVar2 = *(int *)(PTR_DAT_004d9048 + 0x5c);
  param_1[5] = *(int *)(iVar2 + 0x58);
  param_1[2] = *(int *)(iVar2 + 0x110);
  param_1[0x14] = *(int *)(iVar2 + 0x114);
  iVar2 = FUN_00052f80();
  *(undefined4 *)(iVar2 + 0x208) = *(undefined4 *)(*(int *)(puVar1 + 0x5c) + 0x118);
  if (param_1[1] != 0) {
    iVar2 = 1;
    FUN_00396d98(param_1[1],1);
    do {
      _sprintf(acStack_b4,"misscounters.cross%d",iVar2);
      iVar6 = param_1[1];
      FUN_0030f7cc(auStack_160,acStack_b4);
      iVar6 = FUN_0039725c(iVar6,auStack_160);
      FUN_0030f7e0(auStack_160);
      if ((iVar6 != 0) && (iVar2 - 1U < (uint)param_1[5])) {
        local_138[0] = 0;
        FUN_0001da28(*(undefined4 *)(iVar6 + 0x260),local_138);
      }
      iVar2 = iVar2 + 1;
    } while (iVar2 != 4);
  }
  switch(param_2) {
  case 0:
    FUN_0006ffa4(param_1);
    break;
  case 1:
    FUN_000705fc(param_1);
    break;
  case 2:
    FUN_000708c4(param_1);
    break;
  case 3:
    iVar2 = param_1[1];
    FUN_0030f7cc(auStack_188,"gameOverContainer");
    piVar5 = (int *)FUN_0039725c(iVar2,auStack_188);
    FUN_0030f7e0(auStack_188);
    if (piVar5 != (int *)0x0) {
      local_138[0] = 1;
      FUN_0001da28(piVar5[0x98],local_138);
      pcVar7 = *(code **)(*piVar5 + 0x40);
      FUN_0030f7cc(auStack_1b0,"game_over_real");
      (*pcVar7)(piVar5,auStack_1b0,1);
      FUN_0030f7e0(auStack_1b0);
    }
  }
  iVar2 = *(int *)(PTR_DAT_004d9048 + 0x5c);
  if (0.0 <= *(float *)(iVar2 + 0x134)) {
    pvVar3 = operator_new(0x4c);
    FUN_00071c94(pvVar3,iVar2 + 0x11c,iVar2 + 0x128,*(undefined4 *)(iVar2 + 0x134),
                 *(undefined1 *)(iVar2 + 0x138));
    puVar1 = PTR_DAT_004d9048;
    param_1[0xf] = (int)pvVar3;
    if (*(char *)(*(int *)(puVar1 + 0x5c) + 0x138) != '\0') {
      _sprintf(acStack_134,"inGameClassic.misscounters.cross%d",param_1[5] + 1);
      uVar4 = FUN_003ecb20();
      FUN_0030f7cc(auStack_1d8,acStack_134);
      piVar5 = (int *)FUN_003f06d0(uVar4,auStack_1d8);
      FUN_0030f7e0(auStack_1d8);
      if (piVar5 != (int *)0x0) {
        local_138[0] = 1;
        FUN_0001da28(piVar5[0x98],local_138);
        pcVar7 = *(code **)(*piVar5 + 0x40);
        FUN_0030f7cc(auStack_200,"in");
        (*pcVar7)(piVar5,auStack_200,1);
        FUN_0030f7e0(auStack_200);
      }
    }
    piVar5 = (int *)FUN_00043d2c();
    puVar1 = PTR_DAT_004d9048;
    if (piVar5 != (int *)0x0) {
      iVar2 = *(int *)(PTR_DAT_004d9048 + 0x5c);
      local_20c = *(undefined4 *)(iVar2 + 0x11c);
      local_208 = *(undefined4 *)(iVar2 + 0x120);
      local_204 = *(undefined4 *)(iVar2 + 0x124);
      FUN_000445b0(local_20c,piVar5,&local_20c,0);
      (**(code **)(*piVar5 + 0x28))(piVar5,*(undefined4 *)(*(int *)(puVar1 + 0x5c) + 0x134));
    }
  }
  iVar2 = param_1[1];
  if (iVar2 != 0) {
    FUN_0030f7cc(auStack_234,"score.text");
    iVar2 = FUN_0039725c(iVar2,auStack_234);
    FUN_0030f7e0(auStack_234);
    FUN_00083564(iVar2);
    fVar9 = *(float *)(iVar2 + 0x884);
    uVar4 = FUN_0001ca48();
    iVar6 = param_1[1];
    uVar8 = FixedToFP(CONCAT44(uVar4,uVar4),0,0,0,0x20);
    if (fVar9 <= (float)uVar8) {
      FUN_0030f7cc(auStack_2ac,"score.bestScoreText");
      iVar2 = FUN_0039725c(iVar6,auStack_2ac);
      FUN_0030f7e0(auStack_2ac);
      if (iVar2 != 0) {
        uVar4 = FUN_0001ca48();
        *(undefined4 *)(iVar2 + 0x880) = uVar4;
        FUN_003d0bf4(iVar2);
      }
    }
    else {
      FUN_0030f7cc(auStack_25c,"score.bestScoreText");
      piVar5 = (int *)FUN_0039725c(iVar6,auStack_25c);
      FUN_0030f7e0(auStack_25c);
      if (piVar5 != (int *)0x0) {
        uVar8 = FPToFixed(CONCAT44(extraout_s1,*(float *)(iVar2 + 0x884)),0,0,3,0x20);
        piVar5[0x220] = (int)uVar8;
        FUN_003d0bf4((int)uVar8,piVar5);
        pcVar7 = *(code **)(*piVar5 + 0x40);
        FUN_0030f7cc(auStack_284,"beaten");
        (*pcVar7)(piVar5,auStack_284,1);
        FUN_0030f7e0(auStack_284);
      }
      *(undefined1 *)(param_1 + 4) = 1;
    }
    (**(code **)(*(int *)param_1[1] + 0x34))((int *)param_1[1],param_3);
    FUN_00397e7c(param_1[1],param_3,0);
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 == local_34) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

## FUN_000292e0 — 000292e0

```c

void FUN_000292e0(int param_1)

{
  char cVar1;
  void *pvVar2;
  undefined4 uVar3;
  void *pvVar4;
  void *pvVar5;
  char *pcVar6;
  void *pvVar7;
  void *pvVar8;
  float *pfVar9;
  char *pcVar10;
  char *pcVar11;
  char *pcVar12;
  int iVar13;
  _Rb_tree_node_base *p_Var14;
  int *piVar15;
  int *piVar16;
  int iVar17;
  bool bVar18;
  undefined4 extraout_s1;
  undefined4 extraout_s3;
  undefined8 uVar19;
  undefined4 local_1f0;
  undefined1 auStack_1ec [72];
  undefined1 auStack_1a4 [128];
  char local_124 [128];
  undefined1 auStack_a4 [64];
  char acStack_64 [64];
  int local_24;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_000278ec(param_1);
  FUN_0030cd24(auStack_1ec);
  pvVar2 = operator_new(0x50);
  FUN_0030c410(pvVar2,"save_file");
  uVar3 = FUN_0002611c();
  iVar13 = 0;
  FUN_0030c828(pvVar2,0,"version",uVar3);
  _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0x40));
  FUN_0030c81c(pvVar2,0,"highscore",acStack_64);
  do {
    uVar3 = FUN_000254b0(iVar13);
    FUN_002f702c(auStack_a4,0x40,"%shighscore",uVar3);
    iVar17 = param_1 + iVar13 * 4;
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(iVar17 + 0x44));
    FUN_0030c81c(pvVar2,0,auStack_a4,acStack_64);
    if (0 < *(int *)(iVar17 + 0x4c)) {
      uVar3 = FUN_000254b0(iVar13);
      FUN_002f702c(auStack_a4,0x40,"%s_unposted",uVar3);
      _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(iVar17 + 0x4c));
      FUN_0030c81c(pvVar2,0,auStack_a4,acStack_64);
    }
    uVar3 = FUN_000254b0(iVar13);
    FUN_002f702c(auStack_a4,0x40,"%s_dolg",uVar3);
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(iVar17 + 0x2dc));
    FUN_0030c81c(pvVar2,0,auStack_a4,acStack_64);
    iVar13 = iVar13 + 1;
  } while (iVar13 != 2);
  _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0x100));
  FUN_0030c81c(pvVar2,0,"critical_chance",acStack_64);
  pcVar6 = "false";
  if (*(char *)(param_1 + 0x32) != '\0') {
    pcVar6 = "true";
  }
  FUN_0030c828(pvVar2,0,"rated",pcVar6);
  pcVar6 = "false";
  if (*(char *)(param_1 + 0x3c) != '\0') {
    pcVar6 = "true";
  }
  FUN_0030c828(pvVar2,0,"p2pCancelled",pcVar6);
  _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(PTR_DAT_004d9048 + 0x1ac));
  FUN_0030c81c(pvVar2,0,"appLicensedState",acStack_64);
  FUN_0030c22c(auStack_1ec,pvVar2);
  p_Var14 = *(_Rb_tree_node_base **)(param_1 + 0xc);
  if (p_Var14 != (_Rb_tree_node_base *)(param_1 + 4)) {
    do {
      pvVar4 = operator_new(0x50);
      FUN_0030c410(pvVar4,"total");
      FUN_0030c81c(pvVar4,0,"type",p_Var14 + 0x14);
      _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(p_Var14 + 0x58));
      FUN_0030c81c(pvVar4,0,"score",acStack_64);
      FUN_0030c22c(pvVar2,pvVar4);
      p_Var14 = (_Rb_tree_node_base *)std::_Rb_tree_increment(p_Var14);
    } while (p_Var14 != (_Rb_tree_node_base *)(param_1 + 4));
  }
  p_Var14 = *(_Rb_tree_node_base **)(param_1 + 0x24);
  pvVar4 = operator_new(0x50);
  if (p_Var14 != (_Rb_tree_node_base *)(param_1 + 0x1c)) {
    do {
      FUN_0030c410(pvVar4,"total");
      FUN_0030c828(pvVar4,0,"u","true");
      FUN_0030c81c(pvVar4,0,"type",p_Var14 + 0x14);
      _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(p_Var14 + 0x58));
      FUN_0030c81c(pvVar4,0,"score",acStack_64);
      FUN_0030c22c(pvVar2,pvVar4);
      p_Var14 = (_Rb_tree_node_base *)std::_Rb_tree_increment(p_Var14);
      pvVar4 = operator_new(0x50);
    } while (p_Var14 != (_Rb_tree_node_base *)(param_1 + 0x1c));
  }
  FUN_0030c410(pvVar4,"que");
  for (p_Var14 = *(_Rb_tree_node_base **)(param_1 + 0x274);
      p_Var14 != (_Rb_tree_node_base *)(param_1 + 0x26c);
      p_Var14 = (_Rb_tree_node_base *)std::_Rb_tree_increment(p_Var14)) {
    pvVar5 = operator_new(0x50);
    FUN_0030c410(pvVar5,"ach");
    FUN_0030c81c(pvVar5,0,"name",p_Var14 + 0x14);
    FUN_0030c770(pvVar5,"time",SUB84((double)*(float *)(p_Var14 + 0x94),0),
                 (int)((ulonglong)(double)*(float *)(p_Var14 + 0x94) >> 0x20));
    FUN_0030c22c(pvVar4,pvVar5);
  }
  FUN_0030c22c(pvVar2,pvVar4);
  pvVar4 = operator_new(0x50);
  FUN_0030c410(pvVar4,"unlocked");
  for (p_Var14 = *(_Rb_tree_node_base **)(param_1 + 0x28c);
      p_Var14 != (_Rb_tree_node_base *)(param_1 + 0x284);
      p_Var14 = (_Rb_tree_node_base *)std::_Rb_tree_increment(p_Var14)) {
    pvVar5 = operator_new(0x50);
    FUN_0030c410(pvVar5,"ach");
    FUN_0030c81c(pvVar5,0,"name",p_Var14 + 0x14);
    FUN_0030c22c(pvVar4,pvVar5);
  }
  FUN_0030c22c(pvVar2,pvVar4);
  pvVar4 = operator_new(0x50);
  FUN_0030c410(pvVar4,"gameStateData");
  _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0x104));
  FUN_0030c81c(pvVar4,0,"gameState",acStack_64);
  _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0x108));
  FUN_0030c81c(pvVar4,0,"modeState",acStack_64);
  FUN_0030c770(pvVar4,"modeTime",SUB84((double)*(float *)(param_1 + 0x10c),0),
               (int)((ulonglong)(double)*(float *)(param_1 + 0x10c) >> 0x20));
  _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0x110));
  FUN_0030c81c(pvVar4,0,"classicBeanCount",acStack_64);
  _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0x118));
  FUN_0030c81c(pvVar4,0,"classicCurrentWave",acStack_64);
  _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0x114));
  FUN_0030c81c(pvVar4,0,"classicRequiredWaves",acStack_64);
  FUN_0030c22c(pvVar2,pvVar4);
  FUN_0002a6cc(param_1 + 0x13c,pvVar2);
  if ((*(char *)(param_1 + 0x31) != '\0') || (0.0 < *(float *)(param_1 + 0x238))) {
    pvVar4 = operator_new(0x50);
    FUN_0030c410(pvVar4,"state");
    pcVar6 = "false";
    if (*(char *)(param_1 + 0x60) != '\0') {
      pcVar6 = "true";
    }
    FUN_0030c828(pvVar4,0,"hasDropped",pcVar6);
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0x54));
    FUN_0030c81c(pvVar4,0,"score",acStack_64);
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0x58));
    FUN_0030c81c(pvVar4,0,"misses",acStack_64);
    FUN_0002a878(param_1 + 0x13c,pvVar2);
    uVar3 = FUN_000254b0(*(undefined4 *)(param_1 + 0x5c));
    FUN_0030c828(pvVar4,0,"mode",uVar3);
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0x68));
    FUN_0030c81c(pvVar4,0,"consecutiveCount",acStack_64);
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 100));
    FUN_0030c81c(pvVar4,0,"consecutiveType",acStack_64);
    FUN_0030c770(pvVar4,"timer",SUB84((double)*(float *)(param_1 + 0xfc),0),
                 (int)((ulonglong)(double)*(float *)(param_1 + 0xfc) >> 0x20));
    FUN_0030c770(pvVar4,"gameTime",SUB84((double)*(float *)(PTR_DAT_004d9048 + 0x5d4),0),
                 (int)((ulonglong)(double)*(float *)(PTR_DAT_004d9048 + 0x5d4) >> 0x20));
    pcVar6 = (char *)((ulonglong)(double)*(float *)(param_1 + 0x25c) >> 0x20);
    FUN_002f702c(local_124,0x80,"%f",SUB84((double)*(float *)(param_1 + 0x25c),0),pcVar6);
    FUN_0030c81c(pvVar4,0,"globalWaveDt",local_124);
    local_124[0] = '\0';
    if (0 < *(int *)(param_1 + 0x6c)) {
      iVar13 = 0;
      do {
        pcVar11 = *(char **)(param_1 + 0x70 + iVar13 * 4);
        pcVar10 = "%s,%i";
        pcVar12 = local_124;
        if (iVar13 == 0) {
          pcVar10 = "%i";
          pcVar12 = pcVar11;
          pcVar11 = pcVar6;
        }
        pcVar6 = pcVar11;
        FUN_002f702c(local_124,0x80,pcVar10,pcVar12,pcVar6);
        iVar13 = iVar13 + 1;
      } while (iVar13 < *(int *)(param_1 + 0x6c));
      if (local_124[0] != '\0') {
        FUN_0030c81c(pvVar4,0,"typesToPickFrom",local_124);
      }
    }
    if (0 < *(int *)(param_1 + 0x2e4)) {
      iVar13 = 0;
      do {
        pcVar11 = *(char **)(param_1 + 0x2e8 + iVar13 * 4);
        pcVar10 = "%s,%i";
        pcVar12 = local_124;
        if (iVar13 == 0) {
          pcVar10 = "%i";
          pcVar12 = pcVar11;
          pcVar11 = pcVar6;
        }
        pcVar6 = pcVar11;
        FUN_002f702c(local_124,0x80,pcVar10,pcVar12,pcVar6);
        iVar13 = iVar13 + 1;
      } while (iVar13 < *(int *)(param_1 + 0x2e4));
    }
    if (local_124[0] != '\0') {
      FUN_0030c81c(pvVar4,0,"best_combo",local_124);
    }
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0x21c));
    FUN_0030c81c(pvVar4,0,"go_state",acStack_64);
    FUN_0030c770(pvVar4,"go_time",SUB84((double)*(float *)(param_1 + 0x220),0),
                 (int)((ulonglong)(double)*(float *)(param_1 + 0x220) >> 0x20));
    FUN_0030c770(pvVar4,"go_bombHitTime",SUB84((double)*(float *)(param_1 + 0x238),0),
                 (int)((ulonglong)(double)*(float *)(param_1 + 0x238) >> 0x20));
    FUN_0030c770(pvVar4,"go_transition",SUB84((double)*(float *)(param_1 + 0x23c),0),
                 (int)((ulonglong)(double)*(float *)(param_1 + 0x23c) >> 0x20));
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0x224));
    FUN_0030c81c(pvVar4,0,"go_body",acStack_64);
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0x228));
    FUN_0030c81c(pvVar4,0,"go_head",acStack_64);
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0x22c));
    FUN_0030c81c(pvVar4,0,"go_fruit",acStack_64);
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0x230));
    FUN_0030c81c(pvVar4,0,"go_fact",acStack_64);
    pcVar6 = "false";
    if (*(char *)(param_1 + 0x234) != '\0') {
      pcVar6 = "true";
    }
    FUN_0030c828(pvVar4,0,"go_showHighScore",pcVar6);
    pcVar6 = "false";
    if (*(char *)(param_1 + 0x235) != '\0') {
      pcVar6 = "true";
    }
    FUN_0030c828(pvVar4,0,"go_setScore",pcVar6);
    if (0.0 < *(float *)(param_1 + 0xf4)) {
      FUN_0030c770(pvVar4,"speedLossTime",SUB84((double)*(float *)(param_1 + 0xf0),0),
                   (int)((ulonglong)(double)*(float *)(param_1 + 0xf0) >> 0x20));
      FUN_0030c770(pvVar4,"desiredSpeed",SUB84((double)*(float *)(param_1 + 0xf4),0),
                   (int)((ulonglong)(double)*(float *)(param_1 + 0xf4) >> 0x20));
      FUN_0030c770(pvVar4,"nextComboBonus",SUB84((double)*(float *)(param_1 + 0xf8),0),
                   (int)((ulonglong)(double)*(float *)(param_1 + 0xf8) >> 0x20));
    }
    FUN_0030c770(pvVar4,"shake_time",SUB84((double)*(float *)(param_1 + 0x240),0),
                 (int)((ulonglong)(double)*(float *)(param_1 + 0x240) >> 0x20));
    FUN_0030c770(pvVar4,"shake_max_time",SUB84((double)*(float *)(param_1 + 0x240),0),
                 (int)((ulonglong)(double)*(float *)(param_1 + 0x240) >> 0x20));
    pvVar5 = operator_new(0x50);
    FUN_0030c410(pvVar5,"wave_info");
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0x248));
    FUN_0030c81c(pvVar5,0,"waveCount",acStack_64);
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0x24c));
    FUN_0030c81c(pvVar5,0,"numberOfWavesSpawned",acStack_64);
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0x250));
    FUN_0030c81c(pvVar5,0,"numberOfWavesSinceReset",acStack_64);
    FUN_0030c770(pvVar5,"waveDelay",SUB84((double)*(float *)(param_1 + 0x254),0),
                 (int)((ulonglong)(double)*(float *)(param_1 + 0x254) >> 0x20));
    FUN_0030c770(pvVar5,"waveWait",SUB84((double)*(float *)(param_1 + 600),0),
                 (int)((ulonglong)(double)*(float *)(param_1 + 600) >> 0x20));
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0x298));
    FUN_0030c81c(pvVar5,0,"blitzSpawnedThisGame",acStack_64);
    _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(param_1 + 0x29c));
    FUN_0030c81c(pvVar5,0,"blitzForceSpawnedCounter",acStack_64);
    FUN_0030c770(pvVar5,"blitzSpawnTime",SUB84((double)*(float *)(param_1 + 0x2a0),0),
                 (int)((ulonglong)(double)*(float *)(param_1 + 0x2a0) >> 0x20));
    FUN_0030c770(pvVar5,"beanTime",SUB84((double)*(float *)(param_1 + 0x134),0),
                 (int)((ulonglong)(double)*(float *)(param_1 + 0x134) >> 0x20));
    if (0.0 <= *(float *)(param_1 + 0x134)) {
      FUN_002f702c(local_124,0x80,"%f,%f,%f",SUB84((double)*(float *)(param_1 + 0x11c),0),
                   (int)((ulonglong)(double)*(float *)(param_1 + 0x11c) >> 0x20),
                   (double)*(float *)(param_1 + 0x120),(double)*(float *)(param_1 + 0x124));
      FUN_0030c81c(pvVar5,0,"beanStartPos",local_124);
      FUN_002f702c(local_124,0x80,"%f,%f,%f",SUB84((double)*(float *)(param_1 + 0x128),0),
                   (int)((ulonglong)(double)*(float *)(param_1 + 0x128) >> 0x20),
                   (double)*(float *)(param_1 + 300),(double)*(float *)(param_1 + 0x130));
      FUN_0030c81c(pvVar5,0,"beanEndPos",local_124);
      pcVar6 = "false";
      if (*(char *)(param_1 + 0x138) != '\0') {
        pcVar6 = "true";
      }
      FUN_0030c828(pvVar5,0,"beanVisible",pcVar6);
    }
    piVar15 = *(int **)(param_1 + 0x260);
    if (piVar15 != (int *)(param_1 + 0x260)) {
      do {
        pvVar7 = operator_new(0x50);
        FUN_0030c410(pvVar7,"wave");
        uVar19 = FloatVectorAdd(CONCAT44(extraout_s3,piVar15[4]),CONCAT44(extraout_s1,DAT_00029f04),
                                2);
        uVar19 = FPToFixed(uVar19,0,0,3,0x20);
        _snprintf(acStack_64,0x40,"%d",(int)uVar19);
        FUN_0030c81c(pvVar7,0,"inc",acStack_64);
        _snprintf(acStack_64,0x40,"%d",piVar15[5]);
        FUN_0030c81c(pvVar7,0,"index",acStack_64);
        for (piVar16 = (int *)piVar15[2]; piVar16 != piVar15 + 2; piVar16 = (int *)*piVar16) {
          pvVar8 = operator_new(0x50);
          FUN_0030c410(pvVar8,"spawner");
          FUN_0030c770(pvVar8,"delay",SUB84((double)(float)piVar16[3],0),
                       (int)((ulonglong)(double)(float)piVar16[3] >> 0x20));
          _snprintf(acStack_64,0x40,"%d",piVar16[2]);
          FUN_0030c81c(pvVar8,0,"toSpawn",acStack_64);
          FUN_0030c22c(pvVar7,pvVar8);
        }
        FUN_0030c22c(pvVar5,pvVar7);
        piVar15 = (int *)*piVar15;
      } while (piVar15 != (int *)(param_1 + 0x260));
    }
    FUN_0030c22c(pvVar4,pvVar5);
    local_1f0 = 0;
    uVar3 = FUN_000065c4();
    iVar13 = FUN_00006ad0(uVar3,1,&local_1f0);
    if (iVar13 != 0) {
      do {
        cVar1 = *(char *)(iVar13 + 0x1bc);
        bVar18 = cVar1 == '\0';
        if (bVar18) {
          cVar1 = *(char *)(iVar13 + 0x1b8);
        }
        if (bVar18 && cVar1 == '\0') {
          pvVar5 = operator_new(0x50);
          FUN_0030c410(pvVar5,"ent");
          FUN_002f702c(local_124,0x80,"%f,%f,%f",SUB84((double)*(float *)(iVar13 + 0x10),0),
                       (int)((ulonglong)(double)*(float *)(iVar13 + 0x10) >> 0x20),
                       (double)*(float *)(iVar13 + 0x14),(double)*(float *)(iVar13 + 0x18));
          FUN_0030c81c(pvVar5,0,"pos",local_124);
          FUN_002f702c(local_124,0x80,"%f,%f,%f",SUB84((double)*(float *)(iVar13 + 0x1c),0),
                       (int)((ulonglong)(double)*(float *)(iVar13 + 0x1c) >> 0x20),
                       (double)*(float *)(iVar13 + 0x20),(double)*(float *)(iVar13 + 0x24));
          FUN_0030c81c(pvVar5,0,"vel",local_124);
          FUN_002f702c(local_124,0x80,"%f,%f,%f",SUB84((double)*(float *)(iVar13 + 0xdc),0),
                       (int)((ulonglong)(double)*(float *)(iVar13 + 0xdc) >> 0x20),
                       (double)*(float *)(iVar13 + 0xe0),(double)*(float *)(iVar13 + 0xe4));
          FUN_0030c81c(pvVar5,0,"grav",local_124);
          FUN_002f702c(local_124,0x80,"%f,%f,%f",SUB84((double)*(float *)(iVar13 + 0x28),0),
                       (int)((ulonglong)(double)*(float *)(iVar13 + 0x28) >> 0x20),
                       (double)*(float *)(iVar13 + 0x2c),(double)*(float *)(iVar13 + 0x30));
          FUN_0030c81c(pvVar5,0,"scale",local_124);
          _snprintf(acStack_64,0x40,"%d",(uint)*(byte *)(iVar13 + 0x3c));
          FUN_0030c81c(pvVar5,0,"type",acStack_64);
          FUN_002f702c(local_124,0x80,"%f",SUB84((double)*(float *)(iVar13 + 0xd0),0),
                       (int)((ulonglong)(double)*(float *)(iVar13 + 0xd0) >> 0x20));
          FUN_0030c81c(pvVar5,0,"wait",local_124);
          FUN_002f702c(local_124,0x80,"%f",SUB84((double)*(float *)(iVar13 + 0x104),0),
                       (int)((ulonglong)(double)*(float *)(iVar13 + 0x104) >> 0x20));
          FUN_0030c81c(pvVar5,0,"sliceWait",local_124);
          FUN_0030c7cc(pvVar5,0,"hits",*(undefined4 *)(iVar13 + 200));
          _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(iVar13 + 4));
          FUN_0030c81c(pvVar5,0,"id",acStack_64);
          iVar17 = FUN_0000ac08(*(undefined1 *)(iVar13 + 0x3c));
          if (*(char *)(iVar17 + 0x330) != '\0') {
            FUN_00050684(iVar13,pvVar5);
          }
          FUN_0030c22c(pvVar4,pvVar5);
        }
        uVar3 = FUN_000065c4();
        iVar13 = FUN_00006af0(uVar3,1,&local_1f0);
      } while (iVar13 != 0);
    }
    uVar3 = FUN_000065c4();
    iVar13 = FUN_00006ad0(uVar3,2,&local_1f0);
    if (iVar13 != 0) {
      do {
        if (*(char *)(iVar13 + 0x98) == '\0') {
          pvVar5 = operator_new(0x50);
          FUN_0030c410(pvVar5,"ent");
          FUN_002f702c(local_124,0x80,"%f,%f,%f",SUB84((double)*(float *)(iVar13 + 0x10),0),
                       (int)((ulonglong)(double)*(float *)(iVar13 + 0x10) >> 0x20),
                       (double)*(float *)(iVar13 + 0x14),(double)*(float *)(iVar13 + 0x18));
          FUN_0030c81c(pvVar5,0,"pos",local_124);
          FUN_002f702c(local_124,0x80,"%f,%f,%f",SUB84((double)*(float *)(iVar13 + 0x1c),0),
                       (int)((ulonglong)(double)*(float *)(iVar13 + 0x1c) >> 0x20),
                       (double)*(float *)(iVar13 + 0x20),(double)*(float *)(iVar13 + 0x24));
          FUN_0030c81c(pvVar5,0,"vel",local_124);
          FUN_002f702c(local_124,0x80,"%f,%f,%f",SUB84((double)*(float *)(iVar13 + 0x9c),0),
                       (int)((ulonglong)(double)*(float *)(iVar13 + 0x9c) >> 0x20),
                       (double)*(float *)(iVar13 + 0xa0),(double)*(float *)(iVar13 + 0xa4));
          FUN_0030c81c(pvVar5,0,"grav",local_124);
          FUN_002f702c(local_124,0x80,"%f,%f,%f",SUB84((double)*(float *)(iVar13 + 0x28),0),
                       (int)((ulonglong)(double)*(float *)(iVar13 + 0x28) >> 0x20),
                       (double)*(float *)(iVar13 + 0x2c),(double)*(float *)(iVar13 + 0x30));
          FUN_0030c81c(pvVar5,0,"scale",local_124);
          _snprintf(acStack_64,0x40,"%d",*(undefined4 *)PTR_DAT_004d90b4);
          FUN_0030c81c(pvVar5,0,"type",acStack_64);
          pcVar6 = "false";
          if (*(char *)(iVar13 + 0x7e) != '\0') {
            pcVar6 = "true";
          }
          FUN_0030c828(pvVar5,0,"hit",pcVar6);
          _snprintf(acStack_64,0x40,"%d",0);
          FUN_0030c81c(pvVar5,0,"hits",acStack_64);
          _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(iVar13 + 4));
          FUN_0030c81c(pvVar5,0,"id",acStack_64);
          pfVar9 = (float *)(iVar13 + 0x3c);
          if (*(char *)(iVar13 + 0x7e) == '\0') {
            pfVar9 = (float *)(iVar13 + 0xc0);
          }
          FUN_002f702c(local_124,0x80,"%f",SUB84((double)*pfVar9,0),
                       (int)((ulonglong)(double)*pfVar9 >> 0x20));
          FUN_0030c81c(pvVar5,0,"wait",local_124);
          FUN_0030c22c(pvVar4,pvVar5);
        }
        uVar3 = FUN_000065c4();
        iVar13 = FUN_00006af0(uVar3,2,&local_1f0);
      } while (iVar13 != 0);
    }
    uVar3 = FUN_000065c4();
    iVar13 = FUN_00006ad0(uVar3,5,&local_1f0);
    if (iVar13 != 0) {
      do {
        pvVar5 = operator_new(0x50);
        FUN_0030c410(pvVar5,"ent");
        FUN_002f702c(local_124,0x80,"%f,%f,%f",SUB84((double)*(float *)(iVar13 + 0x10),0),
                     (int)((ulonglong)(double)*(float *)(iVar13 + 0x10) >> 0x20),
                     (double)*(float *)(iVar13 + 0x14),(double)*(float *)(iVar13 + 0x18));
        FUN_0030c81c(pvVar5,0,"pos",local_124);
        FUN_002f702c(local_124,0x80,"%f",SUB84((double)*(float *)(iVar13 + 0x6c),0),
                     (int)((ulonglong)(double)*(float *)(iVar13 + 0x6c) >> 0x20));
        FUN_0030c81c(pvVar5,0,"wait",local_124);
        _snprintf(acStack_64,0x40,"%d",0xffffffff);
        FUN_0030c81c(pvVar5,0,"type",acStack_64);
        FUN_0030c22c(pvVar4,pvVar5);
        uVar3 = FUN_000065c4();
        iVar13 = FUN_00006af0(uVar3,5,&local_1f0);
      } while (iVar13 != 0);
    }
    FUN_0030c22c(pvVar2,pvVar4);
  }
  iVar13 = 0;
  do {
    uVar3 = FUN_000254b0(iVar13);
    FUN_002f702c(auStack_1a4,0x80,"wave_counts_%s",uVar3);
    pvVar4 = operator_new(0x50);
    FUN_0030c410(pvVar4,auStack_1a4);
    iVar17 = param_1 + iVar13 * 0x18;
    for (p_Var14 = *(_Rb_tree_node_base **)(iVar17 + 0x2b0);
        p_Var14 != (_Rb_tree_node_base *)(iVar17 + 0x2a8);
        p_Var14 = (_Rb_tree_node_base *)std::_Rb_tree_increment(p_Var14)) {
      pvVar5 = operator_new(0x50);
      FUN_0030c410(pvVar5,"game_count");
      _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(p_Var14 + 0x10));
      FUN_0030c81c(pvVar5,0,"waveIdx",acStack_64);
      _snprintf(acStack_64,0x40,"%d",*(undefined4 *)(p_Var14 + 0x14));
      FUN_0030c81c(pvVar5,0,"games",acStack_64);
      FUN_0030c22c(pvVar4,pvVar5);
    }
    FUN_0030c22c(pvVar2,pvVar4);
    iVar13 = iVar13 + 1;
  } while (iVar13 != 2);
  pvVar4 = operator_new(0x50);
  FUN_0030c410(pvVar4,"powers");
  uVar3 = FUN_00031290();
  FUN_000322e0(uVar3,pvVar4);
  FUN_0030c22c(pvVar2,pvVar4);
  if (DAT_00557a20 == '\0') {
    DAT_00557a20 = '\x01';
    FUN_00027474(&DAT_00557abc,"FruityPussSave.xml",0x200);
  }
  FUN_0030cf6c(auStack_1ec,&DAT_00557abc);
  FUN_0002b8e8(auStack_1ec);
  if (*(int *)PTR____stack_chk_guard_004d9044 == local_24) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail(*(int *)PTR____stack_chk_guard_004d9044);
}


```

## FUN_000713f4 — 000713f4

```c

void FUN_000713f4(int param_1,int param_2)

{
  undefined *puVar1;
  int *piVar2;
  int ****ppppiVar3;
  _List_node_base *p_Var4;
  int iVar5;
  int iVar6;
  int *piVar7;
  int iVar8;
  code *pcVar9;
  undefined4 uVar10;
  int *piVar11;
  int iVar12;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  float fVar13;
  undefined8 unaff_d8;
  float fVar14;
  undefined8 uVar15;
  undefined4 uVar16;
  undefined8 unaff_d12;
  undefined8 uVar17;
  undefined8 uVar18;
  undefined8 uVar19;
  undefined8 uVar20;
  undefined1 auStack_1e4 [40];
  float local_1bc;
  float local_1b8;
  undefined4 local_1b4;
  undefined1 auStack_1b0 [40];
  undefined **local_188;
  int local_184;
  undefined1 *local_180;
  undefined4 local_17c;
  int ***local_178 [8];
  char local_158;
  undefined1 auStack_154 [40];
  undefined **local_12c;
  undefined *local_128;
  undefined4 local_124 [8];
  undefined1 local_104;
  undefined4 local_100 [8];
  undefined1 local_e0;
  undefined4 local_dc;
  undefined4 local_d8;
  char acStack_d4 [128];
  int local_54;
  
  puVar1 = PTR_DAT_004d9048;
  local_54 = *(int *)PTR____stack_chk_guard_004d9044;
  if (PTR_DAT_004d9048[0x17] != '\0') goto LAB_00071806;
  *(int *)(param_1 + 0x14) = *(int *)(param_1 + 0x14) + 1;
  puVar1[0x19] = 1;
  if ((*(int *)(param_1 + 4) == 0) || (*(int *)(param_1 + 0x44) != 1)) goto LAB_00071806;
  uVar10 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
  local_12c = &PTR_LAB_0052bf38;
  local_128 = PTR_FUN_004d9058;
  local_104 = 1;
  local_124[0] = 0;
  FUN_0000a23c(&local_12c,local_124);
  FUN_0002bc94(uVar10,"gank",0x3f800000,0x3f800000,local_124,0);
  FUN_0000a298(local_124);
  _sprintf(acStack_d4,"misscounters.cross%d",*(undefined4 *)(param_1 + 0x14));
  uVar10 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_154,acStack_d4);
  piVar2 = (int *)FUN_0039725c(uVar10,auStack_154);
  FUN_0030f7e0(auStack_154);
  if (piVar2 != (int *)0x0) {
    piVar11 = piVar2 + 0xf3;
    if (piVar2[0xf5] == 0) {
      FUN_0003ca68(piVar11);
      *piVar11 = (int)piVar11;
      piVar2[0xf4] = (int)piVar11;
    }
    else {
      piVar7 = (int *)*piVar11;
      if (piVar7 != piVar11) {
        piVar7[0xb] = piVar2[0xf5];
        piVar7[0xc] = 2;
        piVar2[0xf6] = piVar2[0xf6] + 1;
        for (piVar7 = (int *)*piVar7; piVar7 != piVar11; piVar7 = (int *)*piVar7) {
          piVar7[0xb] = piVar2[0xf5];
          piVar7[0xc] = 2;
          piVar2[0xf6] = piVar2[0xf6] + 1;
        }
      }
    }
    local_188 = &PTR_LAB_0052cd28;
    local_17c = 0;
    local_180 = &FUN_00071838_1;
    local_158 = '\x01';
    local_178[0] = (int ***)0x0;
    local_184 = param_1;
    FUN_000720c8(&local_188,local_178);
    local_e0 = 1;
    local_100[0] = 0;
    if (local_158 == '\0') {
      ppppiVar3 = local_178;
LAB_00071592:
      (*(code *)(*ppppiVar3)[2])(ppppiVar3,local_100);
    }
    else {
      ppppiVar3 = (int ****)local_178[0];
      if ((int ****)local_178[0] != (int ****)0x0) goto LAB_00071592;
      local_e0 = 1;
      local_100[0] = 0;
    }
    local_dc = 0;
    local_d8 = 0;
    p_Var4 = (_List_node_base *)FUN_0003c96c(piVar11,local_100);
    std::_List_node_base::hook(p_Var4);
    FUN_0003c910(local_100);
    if (piVar2[0xf5] != 0) {
      iVar6 = piVar2[0xf4];
      *(int *)(iVar6 + 0x2c) = piVar2[0xf5];
      *(undefined4 *)(iVar6 + 0x30) = 1;
      piVar2[0xf6] = piVar2[0xf6] + 1;
    }
    FUN_0003c910(local_178);
    pcVar9 = *(code **)(*piVar2 + 0x40);
    FUN_0030f7cc(auStack_1b0,"out");
    (*pcVar9)(piVar2,auStack_1b0,1);
    FUN_0030f7e0(auStack_1b0);
  }
  iVar6 = 0;
  do {
    piVar2 = *(int **)(*(int *)(param_1 + 0x54) + iVar6 * 4 + 0x28);
    if (piVar2 == (int *)0x0) break;
    iVar5 = piVar2[0x98];
    if (piVar2[0x13] == 0) {
LAB_00071632:
      local_100[0] = CONCAT31(local_100[0]._1_3_,1);
      uVar10 = FUN_0001da28(iVar5,local_100);
      fVar14 = *(float *)(param_2 + 0x10);
      fVar13 = *(float *)(param_2 + 0x14);
      uVar18 = CONCAT44((int)((ulonglong)unaff_d8 >> 0x20),fVar13);
      local_1b4 = *(undefined4 *)(param_2 + 0x18);
      local_1bc = fVar14;
      local_1b8 = fVar13;
      uVar10 = FUN_00025164(uVar10);
      for (iVar6 = piVar2[0x182]; *(int *)(iVar6 + 0x38) != 0;
          iVar6 = *(int *)(*(int *)(iVar6 + 0x38) + 4)) {
      }
      uVar15 = FloatVectorMult(CONCAT44(uVar10,uVar10),0x3f0000003f000000,2,0x20);
      uVar16 = *(undefined4 *)(iVar6 + 0x48);
      uVar10 = FUN_00025164();
      uVar19 = FloatVectorMult(CONCAT44((int)((ulonglong)unaff_d12 >> 0x20),uVar16),
                               0x3f0000003f000000,2,0x20);
      iVar5 = piVar2[0x182];
      uVar17 = FloatVectorMult(CONCAT44(uVar10,uVar10),0x3f0000003f000000,2,0x20);
      iVar6 = *(int *)(iVar5 + 0x38);
      uVar19 = FloatVectorSub(uVar19,uVar15,2,0x20);
      uVar10 = (undefined4)((ulonglong)uVar19 >> 0x20);
      if (fVar14 <= (float)uVar19) {
        while (iVar6 != 0) {
          iVar5 = *(int *)(iVar6 + 4);
          iVar6 = *(int *)(iVar5 + 0x38);
        }
        uVar19 = CONCAT44(uVar10,*(undefined4 *)(iVar5 + 0x48));
        uVar20 = FloatVectorMult(uVar19,0x3f0000003f000000,2,0x20);
        uVar17 = FloatVectorSub(uVar20,uVar17,2,0x20);
        fVar14 = (float)uVar17;
      }
      else {
        while (iVar6 != 0) {
          iVar5 = *(int *)(iVar6 + 4);
          iVar6 = *(int *)(iVar5 + 0x38);
        }
        uVar19 = FloatVectorMult(CONCAT44(uVar10,*(undefined4 *)(iVar5 + 0x48)),0xbf000000bf000000,2
                                 ,0x20);
        uVar19 = FloatVectorAdd(uVar17,uVar19,2);
        if ((float)uVar19 <= fVar14) {
          uVar10 = FUN_00025164();
          for (iVar6 = piVar2[0x182]; *(int *)(iVar6 + 0x38) != 0;
              iVar6 = *(int *)(*(int *)(iVar6 + 0x38) + 4)) {
          }
          uVar17 = FloatVectorMult(CONCAT44(uVar10,uVar10),0x3f0000003f000000,2,0x20);
          uVar19 = CONCAT44(extraout_s1,*(undefined4 *)(iVar6 + 0x48));
          uVar20 = FloatVectorMult(uVar19,0xbf000000bf000000,2,0x20);
          uVar17 = FloatVectorAdd(uVar17,uVar20,2);
          fVar14 = (float)uVar17;
        }
      }
      local_1bc = fVar14;
      uVar10 = FUN_000251a8((int)uVar19);
      for (iVar6 = piVar2[0x183]; *(int *)(iVar6 + 0x38) != 0;
          iVar6 = *(int *)(*(int *)(iVar6 + 0x38) + 4)) {
      }
      uVar19 = FloatVectorMult(CONCAT44(uVar10,uVar10),0x3f0000003f000000,2,0x20);
      uVar16 = *(undefined4 *)(iVar6 + 0x48);
      uVar10 = FUN_000251a8();
      uVar17 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar15 >> 0x20),uVar16),0x3f0000003f000000,
                               2,0x20);
      iVar5 = piVar2[0x183];
      uVar15 = FloatVectorMult(CONCAT44(uVar10,uVar10),0x3f0000003f000000,2,0x20);
      iVar6 = *(int *)(iVar5 + 0x38);
      uVar19 = FloatVectorSub(uVar17,uVar19,2,0x20);
      uVar10 = (undefined4)((ulonglong)uVar19 >> 0x20);
      if (fVar13 <= (float)uVar19) {
        while (iVar6 != 0) {
          iVar5 = *(int *)(iVar6 + 4);
          iVar6 = *(int *)(iVar5 + 0x38);
        }
        uVar18 = FloatVectorMult(CONCAT44(uVar10,*(undefined4 *)(iVar5 + 0x48)),0x3f0000003f000000,2
                                 ,0x20);
        uVar18 = FloatVectorSub(uVar18,uVar15,2,0x20);
      }
      else {
        while (iVar6 != 0) {
          iVar5 = *(int *)(iVar6 + 4);
          iVar6 = *(int *)(iVar5 + 0x38);
        }
        uVar19 = FloatVectorMult(CONCAT44(uVar10,*(undefined4 *)(iVar5 + 0x48)),0xbf000000bf000000,2
                                 ,0x20);
        uVar19 = FloatVectorAdd(uVar15,uVar19,2);
        if ((float)uVar19 <= fVar13) {
          uVar10 = FUN_000251a8();
          for (iVar6 = piVar2[0x183]; *(int *)(iVar6 + 0x38) != 0;
              iVar6 = *(int *)(*(int *)(iVar6 + 0x38) + 4)) {
          }
          uVar18 = FloatVectorMult(CONCAT44(uVar10,uVar10),0x3f0000003f000000,2,0x20);
          uVar19 = FloatVectorMult(CONCAT44(extraout_s1_00,*(undefined4 *)(iVar6 + 0x48)),
                                   0xbf000000bf000000,2,0x20);
          uVar18 = FloatVectorAdd(uVar18,uVar19,2);
        }
      }
      uVar18 = FloatVectorNeg(uVar18,2,2);
      local_1b8 = (float)uVar18;
      FUN_0000606c(local_1b8,piVar2[0x17e],&local_1bc);
      pcVar9 = *(code **)(*piVar2 + 0x40);
      FUN_0030f7cc(auStack_1e4,"animate_trigger");
      (*pcVar9)(piVar2,auStack_1e4,1);
      FUN_0030f7e0(auStack_1e4);
      break;
    }
    iVar8 = *(int *)(iVar5 + 0x38);
    iVar12 = iVar5;
    while (iVar8 != 0) {
      iVar12 = *(int *)(iVar8 + 4);
      iVar8 = *(int *)(iVar12 + 0x38);
    }
    if (*(char *)(iVar12 + 0x48) == '\0') goto LAB_00071632;
    iVar6 = iVar6 + 1;
  } while (iVar6 < 3);
LAB_00071806:
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_54) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00021524 — 00021524

```c

void FUN_00021524(uint param_1)

{
  undefined *puVar1;
  ushort uVar2;
  uint uVar3;
  undefined4 uVar4;
  int iVar5;
  undefined1 auStack_334 [49];
  undefined1 local_303;
  undefined4 local_2e0;
  undefined4 local_2dc;
  int local_2d8;
  undefined1 local_2d4;
  undefined4 local_2d0;
  undefined4 local_2cc;
  undefined4 local_234;
  uint local_230;
  int local_22c;
  undefined4 local_228;
  undefined1 local_1c0;
  undefined4 local_118;
  undefined4 local_114;
  undefined4 local_110;
  undefined4 local_10c;
  undefined4 local_108;
  undefined4 local_104;
  undefined1 local_100;
  undefined1 local_ff;
  float local_fc;
  undefined4 local_f8;
  undefined4 local_f4;
  undefined4 local_f0;
  
  puVar1 = PTR_DAT_004d9048;
  uVar3 = FUN_0001cd68();
  iVar5 = *(int *)(puVar1 + 0x10);
  DAT_005f9414 = 1;
  FUN_0002ede8();
  FUN_00030720();
  FUN_00022c44(auStack_334,*(undefined4 *)(puVar1 + 0x5c));
  local_2d4 = puVar1[0x19];
  local_2e0 = FUN_0001cd94(0);
  local_2dc = FUN_0001cd74(0);
  local_234 = *(undefined4 *)(puVar1 + 0x40);
  local_2d0 = *(undefined4 *)PTR_DAT_004d90f8;
  local_2cc = *(undefined4 *)PTR_DAT_004d90fc;
  local_2d8 = *(int *)(puVar1 + 0x10);
  local_fc = 0.0;
  if ((0.0 < *(float *)(puVar1 + 0x24) & (DAT_005577b0 ^ 1)) != 0) {
    local_fc = *(float *)(puVar1 + 0x24);
  }
  if (puVar1[0x18] != '\0') {
    local_303 = 0;
  }
  local_118 = 0xffffffff;
  local_114 = 0xbf800000;
  local_104 = 0xffffffff;
  local_108 = 0xffffffff;
  local_10c = 0xffffffff;
  local_110 = 0xffffffff;
  local_100 = 0;
  local_ff = 0;
  local_f8 = 0;
  local_f0 = *(undefined4 *)(*(int *)(puVar1 + 0x58) + 0x174);
  local_f4 = *(undefined4 *)(*(int *)(puVar1 + 0x58) + 0x170);
  local_230 = 0;
  local_22c = -1;
  local_228 = 0;
  local_1c0 = 0;
  if ((((uint)(iVar5 != 5) | ~uVar3) & param_1) == 1) {
    local_230 = (uint)(byte)puVar1[0x1b1];
    if (local_2d8 == 1) {
      iVar5 = FUN_0001d10c(puVar1);
      if (iVar5 != 0) {
        uVar4 = FUN_0001d10c(puVar1);
        FUN_00061830(uVar4,auStack_334);
LAB_0002166e:
        if (local_22c == 4) goto LAB_00021672;
      }
    }
    else if ((local_2d8 == 0) && (iVar5 = FUN_0001ccec(puVar1), iVar5 != 0)) {
      uVar4 = FUN_0001ccec(puVar1);
      FUN_00070fe0(uVar4,auStack_334);
      if (local_22c != 2) goto LAB_0002166e;
LAB_00021672:
      local_230 = 2;
      local_118 = 0xffffffff;
      local_114 = 0xbf800000;
    }
    if (local_230 == 1) {
      uVar4 = FUN_00052f80();
      FUN_00057e38(uVar4,auStack_334);
      local_303 = puVar1[0x1b1];
      goto LAB_00021696;
    }
  }
  local_303 = 0;
LAB_00021696:
  uVar2 = *(ushort *)(puVar1 + 0x54) >> 8;
  if ((*(ushort *)(puVar1 + 0x54) & 0xff) == 0) {
    uVar4 = FUN_002f69c4("soundOff",8);
    FUN_00027588(auStack_334,"soundOff",uVar4,1,0,1);
    uVar2 = (ushort)(byte)puVar1[0x55];
  }
  if (uVar2 == 0) {
    uVar4 = FUN_002f69c4("musicOff",8);
    FUN_00027588(auStack_334,"musicOff",uVar4,1,0,1);
  }
  if (puVar1[0x56] == '\0') {
    uVar4 = FUN_002f69c4("voOff",5);
    FUN_00027588(auStack_334,"voOff",uVar4,1,0,1);
  }
  FUN_000292e0(auStack_334);
  DAT_005f9414 = 0;
  FUN_00022ac8(auStack_334);
  return;
}


```

## FUN_00060878 — 00060878

```c

void FUN_00060878(void)

{
  int *piVar1;
  int iVar2;
  undefined4 uVar3;
  void *pvVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int *piVar9;
  int iVar10;
  int iVar11;
  undefined4 uVar12;
  undefined4 uVar13;
  undefined4 uVar14;
  undefined4 local_5c;
  undefined4 local_58;
  undefined4 uStack_54;
  float local_50;
  int local_4c;
  undefined4 local_48;
  void *local_44;
  double local_40;
  int *local_38;
  undefined4 uStack_34;
  
  FUN_00060bb8();
  piVar1 = operator_new(0x48);
  FUN_0030cda0(piVar1,"xml/challengeConditions.xml");
  if (piVar1 != (int *)0x0) {
    iVar2 = FUN_0030ceac(piVar1,0);
    if (iVar2 == 1) {
      uVar3 = FUN_0030c328(piVar1,"challengeConditions");
      FUN_0005eb6c(&DAT_005f94b4,uVar3);
    }
    else {
      (**(code **)(*piVar1 + 4))(piVar1);
    }
  }
  piVar1 = operator_new(0x48);
  FUN_0030cd24();
  if (piVar1 != (int *)0x0) {
    iVar2 = FUN_0030cebc(piVar1,"xml/challengeMods.xml",0);
    if (iVar2 == 1) {
      uVar3 = FUN_0030c328(piVar1,"challengeMods");
      FUN_00063da4(&DAT_005f94e4,uVar3);
    }
    else {
      (**(code **)(*piVar1 + 4))(piVar1);
    }
  }
  piVar1 = operator_new(0x48);
  FUN_0030cda0(piVar1,"xml/ch1challengeList.xml");
  if (piVar1 != (int *)0x0) {
    iVar2 = FUN_0030ceac(piVar1,0);
    if (iVar2 == 1) {
      uVar3 = FUN_0030c328(piVar1,"partyChallenges");
      iVar2 = FUN_0030c328(uVar3,"defaults");
      if (iVar2 != 0) {
        FUN_0030c6c0(iVar2,"chanceSelect",&DAT_0052cb54);
        iVar2 = FUN_0030c718(iVar2,"chanceRegrowth",&local_40);
        if (iVar2 == 0) {
          DAT_0052cb58 = (float)local_40;
        }
      }
      iVar2 = FUN_0030c328(uVar3,"challengeTier");
      if (iVar2 != 0) {
        uVar13 = 0;
        uVar14 = *(undefined4 *)((undefined1  [16])0x0 + (undefined1  [16])0xc);
        iVar10 = 0;
        do {
          pvVar4 = operator_new(0xb4);
          FUN_0006ea28(pvVar4,iVar2,iVar10);
          local_44 = pvVar4;
          FUN_00063000(&DAT_005f94f8,&local_44);
          iVar5 = FUN_0030c328(iVar2,"challengeGroup");
          if (iVar5 != 0) {
            iVar11 = 0;
            do {
              piVar1 = operator_new(0x48);
              piVar1[4] = 0;
              piVar1[5] = 0;
              piVar1[6] = 0;
              FUN_0003994c(piVar1 + 7,4);
              *piVar1 = 0;
              iVar6 = FUN_0006f178(piVar1,iVar5,iVar11);
              pvVar4 = local_44;
              if (iVar6 == 1) {
                local_38 = piVar1;
                FUN_0006335c((int)local_44 + 0x6c,&local_38);
                uVar12 = DAT_0052cb54;
                local_48 = 0;
                uStack_54 = DAT_0052cb54;
                local_50 = DAT_0052cb58;
                local_5c = DAT_0052cb54;
                local_58 = uVar13;
                local_4c = uVar14;
                FUN_0030c6c0(iVar5,"chanceSelect",&local_5c);
                local_58 = local_5c;
                iVar6 = FUN_0030c718(iVar5,"chanceRegrowth",&local_38);
                if (iVar6 == 0) {
                  local_50 = (float)(double)CONCAT44(uStack_34,local_38);
                }
                iVar7 = *(int *)(PTR_DAT_004d9048 + 0x5c) + 0x140;
                piVar9 = (int *)(*(int *)(PTR_DAT_004d9048 + 0x5c) + 0x144);
                iVar6 = iVar7;
                while (iVar8 = *piVar9, iVar8 != 0) {
                  piVar9 = (int *)(iVar8 + 0xc);
                  if ((uint)piVar1[2] <= *(uint *)(iVar8 + 0x10)) {
                    piVar9 = (int *)(iVar8 + 8);
                    iVar6 = iVar8;
                  }
                }
                local_48 = 0;
                if (iVar6 != iVar7) {
                  local_48 = 0;
                  if ((uint)piVar1[2] < *(uint *)(iVar6 + 0x10)) {
                    iVar6 = iVar7;
                  }
                  if (iVar6 != iVar7) {
                    uVar12 = *(undefined4 *)(iVar6 + 0x14);
                    local_48 = *(undefined4 *)(iVar6 + 0x18);
                  }
                }
                uStack_54 = uVar12;
                if (0 < *piVar1) {
                  uStack_54 = 0;
                  local_50 = 0.0;
                }
                local_4c = iVar11;
                FUN_00039bc0((int)pvVar4 + 0x40,&local_58);
                iVar11 = iVar11 + 1;
              }
              else if (piVar1 != (int *)0x0) {
                FUN_00063308(piVar1);
                operator_delete(piVar1);
              }
              iVar5 = FUN_0030c3a0(iVar5,"challengeGroup");
            } while (iVar5 != 0);
          }
          iVar2 = FUN_0030c3a0(iVar2,"challengeTier");
          iVar10 = iVar10 + 1;
        } while (iVar2 != 0);
      }
      uVar3 = FUN_0030c328(uVar3,"specialChallenges");
      FUN_00060d04(&DAT_005f9504,uVar3);
    }
    else {
      (**(code **)(*piVar1 + 4))(piVar1);
    }
  }
  DAT_005f94b0 = 1;
  return;
}


```

## FUN_000408d4 — 000408d4

```c

void FUN_000408d4(int param_1,undefined4 param_2,undefined1 *param_3)

{
  int *piVar1;
  code *pcVar2;
  undefined4 uVar3;
  undefined1 auStack_74 [40];
  undefined1 auStack_4c [40];
  undefined1 local_24 [4];
  int local_20;
  
  local_20 = *(int *)PTR____stack_chk_guard_004d9044;
  if (*(int *)(param_1 + 0xd4) == 1) {
    piVar1 = operator_new(0xb4);
    FUN_00066db4();
    (**(code **)(*piVar1 + 8))(piVar1);
    FUN_0003e9e8(*(undefined4 *)(PTR_DAT_004d9048 + 0x4c),piVar1,0);
    local_24[0] = 0;
    FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 0xac) + 0x264),local_24);
    uVar3 = *(undefined4 *)(param_1 + 0xac);
    FUN_0030f7cc(auStack_4c,"news");
    piVar1 = (int *)FUN_0039725c(uVar3,auStack_4c);
    FUN_0030f7e0(auStack_4c);
    if (piVar1 != (int *)0x0) {
      pcVar2 = *(code **)(*piVar1 + 0x40);
      FUN_0030f7cc(auStack_74,"animate_out");
      (*pcVar2)(piVar1,auStack_74,1);
      FUN_0030f7e0(auStack_74);
    }
    *param_3 = 1;
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_20) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00068a04 — 00068a04

```c

void FUN_00068a04(int param_1,int param_2)

{
  undefined4 uVar1;
  int iVar2;
  undefined1 *puVar3;
  int unaff_r6;
  undefined1 auStack_b0 [80];
  undefined4 local_60;
  undefined4 local_5c;
  undefined4 local_58;
  undefined4 local_54;
  undefined1 local_28 [4];
  int local_24;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  uVar1 = FUN_0001d10c(PTR_DAT_004d9048);
  FUN_00067f58(param_1,uVar1);
  *(undefined4 *)(param_1 + 0xac) = *(undefined4 *)(param_2 + 0x180);
  FUN_00069dbc(param_1);
  FUN_0006c0e0(param_1 + 0x28);
  FUN_0006d51c(param_1 + 0x40);
  FUN_00076634(param_1 + 0x9c);
  switch(*(undefined4 *)(param_1 + 0xac)) {
  case 0:
    FUN_00069a3c(param_1);
    *(undefined4 *)(param_1 + 0xac) = 0;
    break;
  case 1:
    FUN_000680f0(param_1);
    break;
  case 2:
    *(undefined4 *)(param_1 + 0x10) = *(undefined4 *)(param_2 + 0x17c);
    FUN_000610cc(*(undefined4 *)(param_1 + 0xc),0,1);
    uVar1 = FUN_0006ed60(*(undefined4 *)(*(int *)(param_1 + 0xc) + 0x68));
    *(undefined4 *)(*(int *)(param_1 + 0xc) + 100) = uVar1;
    FUN_00061128(*(undefined4 *)(param_1 + 0xc),1);
    FUN_0006e220(param_1 + 0x88);
    *(undefined4 *)(param_1 + 0xac) = 2;
    break;
  case 3:
    local_54 = *(undefined4 *)(param_2 + 0x1e0);
    local_5c = *(undefined4 *)(param_2 + 0x1d8);
    local_60 = *(undefined4 *)(param_2 + 0x1d4);
    local_58 = *(undefined4 *)(param_2 + 0x1dc);
    FUN_00068560(param_1,&local_60);
    iVar2 = *(int *)PTR_DAT_004d9048;
    if (iVar2 != 0) {
      unaff_r6 = *(int *)(iVar2 + 4);
    }
    if (iVar2 == 0 || unaff_r6 == 0) break;
    FUN_00396d98(unaff_r6,1);
    puVar3 = &stack0x00000008;
    goto LAB_00068b30;
  case 4:
    FUN_00068618(param_1);
    iVar2 = *(int *)PTR_DAT_004d9048;
    if (iVar2 != 0) {
      unaff_r6 = *(int *)(iVar2 + 4);
    }
    if (iVar2 == 0 || unaff_r6 == 0) break;
    FUN_00396d98(unaff_r6,1);
    puVar3 = &stack0x00000040;
LAB_00068b30:
    puVar3 = puVar3 + -0x90;
    FUN_0030f7cc(puVar3,"animate_out_pause");
    FUN_00398154(unaff_r6,puVar3,1);
    FUN_0030f7e0(puVar3);
    break;
  case 5:
    if (*(int *)(param_1 + 0xa8) != 0) {
      local_28[0] = 0;
      FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 0xa8) + 0x260),local_28);
    }
    FUN_00068018(param_1);
    break;
  case 6:
    *(undefined4 *)(param_1 + 0x10) = *(undefined4 *)(param_2 + 0x17c);
    FUN_000610cc(*(undefined4 *)(param_1 + 0xc),0,1);
    uVar1 = FUN_0006ed60(*(undefined4 *)(*(int *)(param_1 + 0xc) + 0x68));
    *(undefined4 *)(*(int *)(param_1 + 0xc) + 100) = uVar1;
    FUN_00061128(*(undefined4 *)(param_1 + 0xc),1);
    FUN_0006e220(param_1 + 0x88);
    *(undefined4 *)(param_1 + 0xac) = 2;
    FUN_000688c8(param_1,1);
    break;
  case 7:
    FUN_00068950(param_1);
  }
  FUN_000681e8(param_1,1);
  FUN_0006b074(param_1,param_2);
  FUN_0006cd70(param_1 + 0x28,param_2);
  FUN_0006e63c(param_1 + 0x88,param_2);
  FUN_0006daf4(param_1 + 0x40,param_2);
  FUN_00074c34(param_1 + 0x74,param_2);
  uVar1 = *(undefined4 *)(param_2 + 0x184);
  *(undefined4 *)(param_1 + 0xb8) = uVar1;
  if (*(int *)(param_1 + 0xa8) != 0) {
    FUN_00397e70(*(int *)(param_1 + 0xa8),uVar1,0,1);
    uVar1 = *(undefined4 *)(param_1 + 0xa8);
    FUN_0030f7cc(auStack_b0,"@backgroundControl");
    iVar2 = FUN_0039725c(uVar1,auStack_b0);
    FUN_0030f7e0(auStack_b0);
    if (iVar2 != 0) {
      FUN_0007c97c(iVar2);
    }
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 == local_24) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

## FUN_00040aa0 — 00040aa0

```c

void FUN_00040aa0(int param_1,undefined4 param_2)

{
  undefined *puVar1;
  undefined *puVar2;
  uint uVar3;
  int iVar4;
  int iVar5;
  uint uVar6;
  int iVar7;
  int iVar8;
  undefined4 uVar9;
  int *piVar10;
  undefined1 *puVar11;
  uint *puVar12;
  code *pcVar13;
  float fVar14;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined4 uVar16;
  undefined8 uVar15;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  undefined4 extraout_s3_01;
  undefined8 uVar17;
  undefined1 auStack_cc [40];
  undefined1 auStack_a4 [40];
  undefined1 auStack_7c [40];
  undefined1 auStack_54 [40];
  undefined1 local_2c [4];
  int local_28;
  
  puVar11 = auStack_cc;
  local_28 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_0003f4e8(param_1);
  uVar9 = extraout_s3;
  uVar16 = extraout_s1;
  if (*(char *)(param_1 + 0xa8) != '\0') {
    *(undefined1 *)(param_1 + 0xa8) = 0;
    uVar3 = *(uint *)(param_1 + 0xd4);
    if (uVar3 < 0x11) {
      uVar6 = 1 << (uVar3 & 0xff);
      if ((uVar6 & 0x8018) == 0) {
        if ((uVar6 & 0x14000) == 0) goto LAB_00040b2e;
        FUN_00305d78();
        FUN_00305cdc();
        piVar10 = operator_new(0xdc);
        FUN_0003d750(piVar10,0);
      }
      else {
        piVar10 = (int *)0x0;
        *(undefined4 *)(param_1 + 0xe0) = 0;
        if (uVar3 == 0xf) {
          piVar10 = operator_new(0xb4);
          FUN_00058fd8();
        }
        else if (uVar3 == 4) {
          piVar10 = operator_new(0xc0);
          FUN_0004a88c();
        }
      }
      (**(code **)(*piVar10 + 8))(piVar10);
      FUN_0003e9e8(*(undefined4 *)(PTR_DAT_004d9048 + 0x4c),piVar10,0);
      uVar9 = extraout_s3_01;
      uVar16 = extraout_s1_01;
    }
    else {
LAB_00040b2e:
      FUN_0003fe58(param_1);
      uVar9 = extraout_s3_00;
      uVar16 = extraout_s1_00;
    }
  }
  puVar1 = PTR_DAT_004d9048;
  puVar12 = (uint *)(param_1 + 0xd4);
  uVar3 = *puVar12;
  if (0x15 < uVar3) {
    if (uVar3 == 0x17) {
      FUN_000524bc(*(undefined4 *)(PTR_DAT_004d9048 + 400),0);
      iVar4 = FUN_00020e70();
      if (iVar4 == 1) {
        (**(code **)(*(int *)PTR_DAT_004d911c + 0x14))();
      }
      goto switchD_00040b7a_caseD_2;
    }
    if (uVar3 != 0x16) goto switchD_00040b7a_caseD_2;
    if (*(int *)(PTR_DAT_004d911c + 0x4c) == 3) {
      uVar3 = *(uint *)(param_1 + 0xd8);
    }
    else {
      if (*(int *)(PTR_DAT_004d911c + 0x4c) != 2) goto switchD_00040b7a_caseD_2;
      uVar3 = 0x17;
    }
LAB_00040ca0:
    *puVar12 = uVar3;
    goto switchD_00040b7a_caseD_2;
  }
  if (uVar3 < 0x12) {
    if (uVar3 < 0xe) {
      switch(uVar3) {
      case 0:
        *(undefined4 *)(PTR_DAT_004d9048 + 0x10) = 0;
        puVar2 = PTR_DAT_004d9048;
        if ((0.0 < *(float *)(param_1 + 0xdc)) || (DAT_00040e9c < *(float *)(puVar1 + 0x24))) {
          uVar15 = FloatVectorSub(CONCAT44(uVar16,*(float *)(param_1 + 0xdc)),
                                  CONCAT44(param_2,param_2),2,0x20);
          *(int *)(param_1 + 0xdc) = (int)uVar15;
          uVar15 = CONCAT44((int)((ulonglong)uVar15 >> 0x20),*(undefined4 *)(puVar2 + 0x20));
          uVar17 = FloatVectorSub(0xbf800000bf800000,uVar15,2,0x20);
          uVar17 = FloatVectorMult(uVar17,0x3e0000003e000000,2,0x20);
          uVar15 = FloatVectorAdd(uVar15,uVar17,2);
          fVar14 = (float)uVar15;
          *(float *)(puVar2 + 0x20) = fVar14;
          if ((int)((uint)(fVar14 < 0.0) << 0x1f) < 0) {
            *(undefined4 *)(PTR_DAT_004d9048 + 0x20) = 0;
            goto switchD_00040b7a_caseD_2;
          }
LAB_00040dca:
          if (-1 < (int)((uint)(fVar14 < 0.0) << 0x1f)) goto switchD_00040b7a_caseD_2;
        }
        else {
          *(undefined4 *)(PTR_DAT_004d9048 + 0x10) = 0;
          fVar14 = DAT_00040ea0;
          uVar15 = FloatVectorAdd(CONCAT44(uVar16,*(undefined4 *)(param_1 + 0xe0)),
                                  CONCAT44(param_2,param_2),2);
          *(int *)(param_1 + 0xe0) = (int)uVar15;
          uVar15 = CONCAT44((int)((ulonglong)uVar15 >> 0x20),*(float *)(puVar2 + 0x20));
          if (-1 < (int)((uint)(*(float *)(puVar2 + 0x20) < fVar14) << 0x1f)) {
            uVar17 = FloatVectorSub(0xbf800000bf800000,uVar15,2,0x20);
            uVar17 = FloatVectorMult(uVar17,0x3e0000003e000000,2,0x20);
            uVar15 = FloatVectorAdd(uVar15,uVar17,2);
            fVar14 = (float)uVar15;
            *(float *)(PTR_DAT_004d9048 + 0x20) = fVar14;
            goto LAB_00040dca;
          }
          *(undefined4 *)(PTR_DAT_004d9048 + 0x20) = 0xbf800000;
        }
        puVar1 = PTR_DAT_004d9048;
        *puVar12 = 1;
        *(undefined4 *)(puVar1 + 0x20) = 0xbf800000;
        goto switchD_00040b7a_caseD_2;
      case 1:
        if (*(char *)(param_1 + 0xbe) != '\0') {
          if (*(char *)(param_1 + 0xbd) == '\0') {
            *(undefined1 *)(param_1 + 0xbd) = 1;
            uVar9 = FUN_003527fc();
            piVar10 = (int *)FUN_0002592c(uVar9,0);
            iVar4 = FUN_003527fc();
            if ((*(int *)(iVar4 + 0x58) != 0) && (iVar4 = FUN_0035101c(), iVar4 == 1)) {
              pcVar13 = *(code **)(*piVar10 + 0x48);
              uVar9 = FUN_00352c04();
              (*pcVar13)(piVar10,uVar9);
            }
            *(undefined4 *)(param_1 + 0xc0) = 0x42700000;
            *(undefined1 *)(param_1 + 0xbe) = 0;
          }
          else {
            uVar15 = FloatVectorAdd(CONCAT44(uVar9,*(undefined4 *)(param_1 + 0xc0)),
                                    CONCAT44(uVar16,DAT_00040e98),2);
            *(float *)(param_1 + 0xc0) = (float)uVar15;
            if ((int)((uint)((float)uVar15 < 0.0) << 0x1f) < 0) {
              *(undefined1 *)(param_1 + 0xbd) = 0;
            }
          }
        }
        uVar9 = *(undefined4 *)(param_1 + 0xac);
        FUN_0030f7cc(auStack_54,"news.new");
        iVar4 = FUN_0039725c(uVar9,auStack_54);
        FUN_0030f7e0(auStack_54);
        if (iVar4 != 0) {
          iVar5 = FUN_00067a40();
          if (iVar5 == 1) {
            iVar5 = *(int *)(iVar4 + 0x260);
            if (*(int *)(iVar4 + 0x4c) != 0) {
              iVar7 = *(int *)(iVar5 + 0x38);
              iVar8 = iVar5;
              while (iVar7 != 0) {
                iVar8 = *(int *)(iVar7 + 4);
                iVar7 = *(int *)(iVar8 + 0x38);
              }
              if (*(char *)(iVar8 + 0x48) != '\0') goto LAB_00040d86;
            }
            local_2c[0] = 1;
LAB_00040de8:
            FUN_0001da28(iVar5,local_2c);
          }
          else {
LAB_00040d86:
            iVar5 = FUN_00067a40();
            if ((iVar5 == 0) && (*(int *)(iVar4 + 0x4c) != 0)) {
              iVar5 = *(int *)(iVar4 + 0x260);
              iVar8 = *(int *)(iVar5 + 0x38);
              iVar4 = iVar5;
              while (iVar8 != 0) {
                iVar4 = *(int *)(iVar8 + 4);
                iVar8 = *(int *)(iVar4 + 0x38);
              }
              if (*(char *)(iVar4 + 0x48) != '\0') {
                local_2c[0] = 0;
                goto LAB_00040de8;
              }
            }
          }
        }
        if (*(int *)PTR_DAT_004d914c != 0) {
          uVar9 = FUN_003ecb20();
          FUN_0030f7cc(auStack_7c,"mainscreen.news");
          piVar10 = (int *)FUN_003f06d0(uVar9,auStack_7c);
          FUN_0030f7e0(auStack_7c);
          if (piVar10 != (int *)0x0) {
            iVar4 = piVar10[0x98];
            if (piVar10[0x13] != 0) {
              iVar8 = *(int *)(iVar4 + 0x38);
              iVar5 = iVar4;
              while (iVar8 != 0) {
                iVar5 = *(int *)(iVar8 + 4);
                iVar8 = *(int *)(iVar5 + 0x38);
              }
              if (*(char *)(iVar5 + 0x48) != '\0') goto switchD_00040b7a_caseD_2;
            }
            local_2c[0] = 1;
            FUN_0001da28(iVar4,local_2c);
            iVar4 = (**(code **)(**(int **)PTR_DAT_004d914c + 0x20))();
            pcVar13 = *(code **)(*piVar10 + 0x40);
            if (iVar4 == 1) {
              puVar11 = auStack_a4;
            }
            FUN_0030f7cc(puVar11,"animate_in");
            (*pcVar13)(piVar10,puVar11,1);
            FUN_0030f7e0(puVar11);
          }
        }
      default:
        goto switchD_00040b7a_caseD_2;
      case 4:
        goto switchD_00040b7a_caseD_4;
      case 8:
        FUN_0003fe58(param_1);
        uVar3 = 0;
        goto LAB_00040ca0;
      }
    }
    if (1 < uVar3 - 0xe) goto switchD_00040b7a_caseD_2;
  }
  else if (uVar3 != 0x12) goto switchD_00040b7a_caseD_2;
switchD_00040b7a_caseD_4:
  *(undefined1 *)(param_1 + 0xbe) = 0;
switchD_00040b7a_caseD_2:
  if (*(int *)PTR____stack_chk_guard_004d9044 == local_28) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

## FUN_00010bec — 00010bec

```c

void FUN_00010bec(int param_1,int param_2,undefined4 param_3,undefined4 param_4,undefined4 *param_5)

{
  char cVar1;
  byte bVar2;
  longlong lVar3;
  bool bVar4;
  undefined *puVar5;
  undefined *puVar6;
  undefined *puVar7;
  undefined2 uVar8;
  int iVar9;
  int iVar10;
  undefined4 uVar11;
  uint uVar12;
  int iVar13;
  float fVar14;
  float *pfVar15;
  undefined4 uVar16;
  int *piVar17;
  size_t sVar18;
  uint uVar19;
  undefined1 uVar20;
  uint uVar21;
  undefined4 uVar22;
  int iVar23;
  undefined4 *puVar24;
  uint *puVar25;
  int *piVar26;
  int *piVar27;
  undefined4 extraout_s0;
  undefined4 extraout_s0_00;
  undefined4 extraout_s1;
  undefined8 uVar29;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined4 extraout_s1_03;
  undefined4 extraout_s1_04;
  undefined4 extraout_s1_05;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  undefined4 extraout_s3_01;
  undefined4 extraout_s3_02;
  undefined4 extraout_s3_03;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  undefined4 extraout_s5_01;
  undefined4 extraout_s5_02;
  undefined4 extraout_s5_03;
  undefined4 extraout_s5_04;
  undefined8 uVar30;
  undefined8 uVar31;
  undefined4 local_180;
  undefined4 local_17c;
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
  undefined1 local_150;
  undefined1 local_14f;
  undefined1 local_14e;
  undefined1 local_14d;
  undefined4 local_14c;
  undefined4 local_148;
  undefined4 local_144;
  undefined1 local_140;
  undefined1 local_13f;
  undefined1 local_13e;
  undefined1 local_13d;
  undefined4 local_13c;
  undefined4 local_138;
  undefined4 local_134;
  undefined **local_130;
  undefined *local_12c;
  undefined4 local_128 [8];
  undefined1 local_108;
  undefined **local_104;
  undefined *local_100;
  undefined4 local_fc [8];
  undefined1 local_dc;
  undefined **local_d8;
  undefined *local_d4;
  undefined4 local_d0 [8];
  undefined1 local_b0;
  char acStack_ac [128];
  int local_2c;
  uint *puVar28;
  
  puVar6 = PTR_DAT_004d9048;
  puVar5 = PTR____stack_chk_guard_004d9044;
  local_2c = *(int *)PTR____stack_chk_guard_004d9044;
  uVar20 = 1;
  if ((*(char *)(param_1 + 0x1bc) != '\0') || (uVar20 = 1, -1.0 < *(float *)(param_1 + 0x104)))
  goto LAB_00011caa;
  if (0.0 < *(float *)(param_1 + 0xac)) {
    uVar20 = 0;
    *(undefined1 *)(param_1 + 0x1ba) = 0;
    goto LAB_00011caa;
  }
  iVar9 = FUN_0001d10c();
  if (((iVar9 != 0) &&
      (iVar10 = FUN_00063fe0(PTR_DAT_004d907c,*(undefined4 *)PTR_DAT_004d9090), iVar10 == 1)) &&
     (iVar10 = FUN_0005edbc(PTR_DAT_004d9024), iVar10 == 0)) {
    uVar11 = FUN_000065c4();
    uVar12 = FUN_00006a84(uVar11,2);
    puVar7 = PTR_DAT_004d9050;
    if (0 < (int)uVar12) {
      do {
        lVar3 = (ulonglong)*(uint *)puVar7 * (ulonglong)*(uint *)(puVar7 + 8);
        uVar19 = (uint)lVar3;
        iVar10 = *(int *)(puVar7 + 4) * *(uint *)(puVar7 + 8) +
                 *(uint *)puVar7 * *(int *)(puVar7 + 0xc) + (int)((ulonglong)lVar3 >> 0x20);
        lVar3 = CONCAT44(iVar10,uVar19);
        uVar21 = *(int *)(puVar7 + 0x14) + iVar10 + (uint)CARRY4(uVar19,*(uint *)(puVar7 + 0x10));
        *(uint *)puVar7 = uVar19 + *(uint *)(puVar7 + 0x10);
        *(uint *)(puVar7 + 4) = uVar21;
        if (uVar12 != 0 && uVar12 != 0xffffffff) {
          lVar3 = (ulonglong)uVar21 * (ulonglong)uVar12;
          uVar21 = (uint)((ulonglong)lVar3 >> 0x20);
        }
        uVar11 = FUN_000065c4((int)((ulonglong)lVar3 >> 0x20),(int)lVar3);
        iVar10 = FUN_00006aa4(uVar11,2,uVar21);
      } while (iVar10 == 0);
      uVar11 = FUN_00052f80();
      iVar13 = FUN_00057000(uVar11,1,*(undefined1 *)(param_1 + 0x3c),0,0);
      *(undefined4 *)(iVar13 + 0xd0) = 0;
      *(undefined4 *)(iVar13 + 0x1c) = *(undefined4 *)(iVar10 + 0x1c);
      *(undefined4 *)(iVar13 + 0x20) = *(undefined4 *)(iVar10 + 0x20);
      *(undefined4 *)(iVar13 + 0x24) = *(undefined4 *)(iVar10 + 0x24);
      *(undefined4 *)(iVar13 + 0x10) = *(undefined4 *)(iVar10 + 0x10);
      *(undefined4 *)(iVar13 + 0x14) = *(undefined4 *)(iVar10 + 0x14);
      *(undefined4 *)(iVar13 + 0x18) = *(undefined4 *)(iVar10 + 0x18);
      local_b0 = 1;
      local_d8 = &PTR_LAB_0052bf38;
      local_d4 = PTR_FUN_004d9058;
      local_d0[0] = 0;
      uVar11 = *(undefined4 *)(puVar6 + 0x1a4);
      FUN_0000a23c(&local_d8,local_d0);
      FUN_0002bc94(uVar11,"fruit-spawn",0x3f800000,0x3f800000,local_d0,0);
      FUN_0000a298(local_d0);
      uVar11 = FUN_002f69c4("fruit_bomb_transform",0x14);
      FUN_00011cc4(iVar13,uVar11);
      FUN_00008450(iVar10);
    }
  }
  bVar4 = false;
  if (((*(char *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x330) == '\0') &&
      (bVar4 = true, *(char *)(param_1 + 0xcc) != '\0')) &&
     (bVar4 = false, 3 < *(int *)(param_1 + 200))) {
    bVar4 = true;
  }
  *(undefined4 *)(param_1 + 0x70) = 0;
  iVar10 = FUN_0001cd94(*(undefined4 *)(param_1 + 0x84));
  if (bVar4) {
    uVar20 = 0;
    if (((iVar9 != 0) &&
        ((iVar13 = FUN_0005eef0(PTR_DAT_004d9024), iVar13 != 1 ||
         (uVar20 = 1, *(char *)(param_1 + 0xcc) != '\0')))) &&
       (uVar20 = 0, 3 < *(int *)(param_1 + 200))) {
      uVar20 = 1;
    }
    *(undefined1 *)(param_1 + 0x1bb) = uVar20;
    iVar13 = FUN_0001cd14();
    if ((((iVar10 < 2) || (iVar13 != 1)) ||
        (*(char *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x318) == '\0')) ||
       ((puVar6[0x17] != '\0' || (0.0 < *(float *)(puVar6 + 0x24))))) {
LAB_00011054:
      *(undefined1 *)(param_1 + 0x1ba) = 0;
    }
    else {
      iVar10 = *(int *)(puVar6 + 0x40) + -1;
      if (iVar10 < 2) {
        iVar10 = 2;
      }
      *(int *)(puVar6 + 0x40) = iVar10;
      if (param_2 == 0) {
        *(undefined1 *)(param_1 + 0x1ba) = 0;
      }
      else {
        uVar11 = FUN_00052f80();
        uVar20 = 0;
        fVar14 = (float)FUN_000580e4(uVar11,0);
        iVar10 = DAT_0052bf68;
        if (0.0 < fVar14) {
          iVar23 = *(int *)(puVar6 + 0x40);
          uVar11 = FUN_00052f80();
          fVar14 = (float)FUN_000580e4(uVar11,0);
          iVar13 = DAT_0052bf68;
          puVar7 = PTR_DAT_004d9050;
          if (iVar23 < iVar10) {
            iVar10 = iVar23;
          }
          uVar29 = FixedToFP(CONCAT44(iVar10,iVar10),0,0,0,0x20);
          if ((float)uVar29 / fVar14 <= 1.0) {
            puVar25 = (uint *)(PTR_DAT_004d9050 + 8);
            uVar12 = *(uint *)PTR_DAT_004d9050;
            piVar17 = (int *)(PTR_DAT_004d9050 + 4);
            piVar27 = (int *)(PTR_DAT_004d9050 + 0xc);
            puVar28 = (uint *)(PTR_DAT_004d9050 + 0x10);
            piVar26 = (int *)(PTR_DAT_004d9050 + 0x14);
            lVar3 = (ulonglong)uVar12 * (ulonglong)*puVar25;
            uVar21 = (uint)lVar3;
            *(uint *)PTR_DAT_004d9050 = uVar21 + *puVar28;
            uVar12 = *piVar17 * *puVar25 + uVar12 * *piVar27 + (int)((ulonglong)lVar3 >> 0x20) +
                     *piVar26 + (uint)CARRY4(uVar21,*puVar28);
            *(uint *)(puVar7 + 4) = uVar12;
            uVar21 = 1;
LAB_00010fd2:
            uVar12 = (uint)((ulonglong)uVar21 * (ulonglong)uVar12 >> 0x20);
          }
          else {
            iVar10 = *(int *)(puVar6 + 0x40);
            uVar11 = FUN_00052f80();
            fVar14 = (float)FUN_000580e4(uVar11,0);
            puVar7 = PTR_DAT_004d9050;
            if (iVar10 < iVar13) {
              iVar13 = iVar10;
            }
            uVar29 = FixedToFP(CONCAT44(iVar13,iVar13),0,0,0,0x20);
            uVar12 = *(uint *)PTR_DAT_004d9050;
            piVar26 = (int *)(PTR_DAT_004d9050 + 4);
            puVar28 = (uint *)(PTR_DAT_004d9050 + 8);
            piVar27 = (int *)(PTR_DAT_004d9050 + 0xc);
            puVar25 = (uint *)(PTR_DAT_004d9050 + 0x10);
            lVar3 = (ulonglong)uVar12 * (ulonglong)*puVar28;
            uVar21 = (uint)lVar3;
            piVar17 = (int *)(PTR_DAT_004d9050 + 0x14);
            *(uint *)PTR_DAT_004d9050 = uVar21 + *puVar25;
            uVar12 = *piVar26 * *puVar28 + uVar12 * *piVar27 + (int)((ulonglong)lVar3 >> 0x20) +
                     *piVar17 + (uint)CARRY4(uVar21,*puVar25);
            *(uint *)(puVar7 + 4) = uVar12;
            uVar29 = FPToFixed(CONCAT44((int)((ulonglong)uVar29 >> 0x20),(float)uVar29 / fVar14),0,1
                               ,3,0x20);
            uVar21 = (uint)uVar29;
            if ((uVar21 != 0) && (uVar21 != 0xffffffff)) goto LAB_00010fd2;
          }
          uVar20 = 0;
          if (uVar12 == 0) {
            uVar20 = 1;
          }
        }
        *(undefined1 *)(param_1 + 0x1ba) = uVar20;
      }
      if ((iVar9 != 0) && (iVar10 = FUN_00063fe0(PTR_DAT_004d907c,DAT_00556ca8._4_4_), iVar10 == 1))
      {
        *(undefined1 *)(param_1 + 0x1ba) = 0;
      }
      if (((DAT_00556cfc & 1) == 0) && (iVar10 = ___cxa_guard_acquire(&DAT_00556cfc), iVar10 != 0))
      {
        DAT_00556cf8 = FUN_0000aae0("bean",0);
        ___cxa_guard_release(&DAT_00556cfc);
      }
      if (*(byte *)(param_1 + 0x3c) == DAT_00556cf8) goto LAB_00011054;
      if (*(char *)(param_1 + 0x1ba) != '\0') {
        *(int *)(puVar6 + 0x40) = DAT_0052bf68 + DAT_0052bf6c;
        piVar17 = *(int **)puVar6;
        if (piVar17 != (int *)0x0) {
          (**(code **)(*piVar17 + 0x54))(piVar17,param_1);
        }
      }
    }
    if ((puVar6[0x18] == '\0') ||
       (iVar10 = FUN_0000fa78(param_1), uVar11 = extraout_s5_00, uVar22 = extraout_s1_00,
       uVar16 = extraout_s3_00, iVar10 == 0)) {
      if (*(char *)(param_1 + 0x1ba) == '\0') {
        uVar11 = FUN_0002ede8();
        iVar10 = FUN_000305c4(uVar11,0x3f800000,0x3f000000);
        puVar7 = PTR_FUN_004d9058;
        uVar11 = extraout_s5_02;
        uVar22 = extraout_s1_02;
        uVar16 = extraout_s3_02;
        if ((iVar10 == 0) &&
           (uVar12 = (uint)*(byte *)(param_1 + 0x3c),
           0 < *(int *)(uVar12 * 0x338 + DAT_005d4cdc + 800))) {
          iVar13 = 0;
          iVar10 = 0;
          do {
            uVar22 = *(undefined4 *)(puVar6 + 0x1a4);
            uVar11 = *(undefined4 *)(*(int *)(uVar12 * 0x338 + DAT_005d4cdc + 0x31c) + iVar10);
            local_130 = &PTR_LAB_0052bf38;
            local_108 = 1;
            local_128[0] = 0;
            local_12c = puVar7;
            FUN_0000a23c(&local_130,local_128);
            FUN_0002bc94(uVar22,uVar11,0x3f000000,0x3f800000,local_128,0);
            FUN_0000a298(local_128);
            uVar12 = (uint)*(byte *)(param_1 + 0x3c);
            iVar10 = iVar10 + 0xc;
            iVar13 = iVar13 + 1;
            uVar11 = extraout_s5_03;
            uVar22 = extraout_s1_03;
            uVar16 = extraout_s3_03;
          } while (iVar13 < *(int *)(uVar12 * 0x338 + DAT_005d4cdc + 800));
        }
      }
      else {
        local_104 = &PTR_LAB_0052bf38;
        local_100 = PTR_FUN_004d9058;
        local_dc = 1;
        local_fc[0] = 0;
        uVar11 = *(undefined4 *)(puVar6 + 0x1a4);
        FUN_0000a23c(&local_104,local_fc);
        FUN_0002bc94(uVar11,"Critical",0x3e800000,0x3f800000,local_fc,0);
        FUN_0000a298(local_fc);
        uVar11 = FUN_0002ede8();
        FUN_000305c4(uVar11,0x3f800000,0x3f000000);
        uVar11 = extraout_s5_01;
        uVar22 = extraout_s1_01;
        uVar16 = extraout_s3_01;
      }
    }
  }
  else {
    *(undefined1 *)(param_1 + 0x1ba) = 0;
    uVar11 = extraout_s5;
    uVar22 = extraout_s1;
    uVar16 = extraout_s3;
  }
  *(undefined4 *)(param_1 + 0x4c) = *(undefined4 *)(param_1 + 0x10);
  *(undefined4 *)(param_1 + 0x50) = *(undefined4 *)(param_1 + 0x14);
  *(undefined4 *)(param_1 + 0x54) = *(undefined4 *)(param_1 + 0x18);
  *(undefined4 *)(param_1 + 0x104) = 0x3cf5c28f;
  uVar31 = FloatVectorMult(CONCAT44(uVar22,*param_5),CONCAT44(uVar22,*param_5),2,0x20);
  uVar30 = FloatVectorMult(CONCAT44(uVar11,param_5[1]),CONCAT44(uVar11,param_5[1]),2,0x20);
  uVar29 = FloatVectorMult(CONCAT44(uVar16,param_5[2]),CONCAT44(uVar16,param_5[2]),2,0x20);
  uVar30 = FloatVectorAdd(uVar31,uVar30,2);
  uVar29 = FloatVectorAdd(uVar30,uVar29,2);
  uVar11 = FUN_00301044((int)uVar29);
  uVar29 = FloatVectorMult(CONCAT44(uVar11,uVar11),CONCAT44(extraout_s1_04,DAT_00011458),2,0x20);
  uVar30 = FloatVectorMin(0x4100000041000000,uVar29,2,0x20);
  uVar11 = (undefined4)((ulonglong)uVar29 >> 0x20);
  if (*(char *)(param_1 + 0x1ba) == '\0') {
    if (*(int *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x314) == 0x32) {
      cVar1 = puVar6[0x17];
    }
    else {
      if (*(char *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x330) == '\0')
      goto LAB_000112a6;
      cVar1 = puVar6[0x17];
    }
    if (cVar1 == '\0') {
      uVar30 = FloatVectorMin(0x4100000041000000,uVar29,2,0x20);
      uVar29 = FloatVectorMult(CONCAT44(uVar11,*(undefined4 *)(param_1 + 0x104)),0x3f0000003f000000,
                               2,0x20);
      *(int *)(param_1 + 0x104) = (int)uVar29;
      local_14c = *(undefined4 *)(param_1 + 0x10);
      local_148 = *(undefined4 *)(param_1 + 0x14);
      local_144 = *(undefined4 *)(param_1 + 0x18);
      local_14d = 0x80;
      local_14e = 0xff;
      local_14f = 0xff;
      local_150 = 0xff;
      FUN_00020ea8((int)uVar29,&local_14c,&local_150);
      if (*(int *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x314) == 0x32) {
        uVar11 = FUN_00043d2c();
        local_15c = *(undefined4 *)(param_1 + 0x10);
        local_158 = *(undefined4 *)(param_1 + 0x14);
        local_154 = *(undefined4 *)(param_1 + 0x18);
        FUN_000447b0(uVar11,&local_15c);
      }
    }
  }
  else {
    uVar30 = FloatVectorMin(0x4100000041000000,uVar29,2,0x20);
    uVar29 = FloatVectorMult(CONCAT44(uVar11,*(undefined4 *)(param_1 + 0x104)),0x4020000040200000,2,
                             0x20);
    *(int *)(param_1 + 0x104) = (int)uVar29;
    local_13c = *(undefined4 *)(param_1 + 0x10);
    local_138 = *(undefined4 *)(param_1 + 0x14);
    local_134 = *(undefined4 *)(param_1 + 0x18);
    local_140 = (undefined1)DAT_005d4cd4;
    local_13f = (undefined1)((uint)DAT_005d4cd4 >> 8);
    local_13e = (undefined1)((uint)DAT_005d4cd4 >> 0x10);
    local_13d = (undefined1)((uint)DAT_005d4cd4 >> 0x18);
    FUN_00020ea8((int)uVar29,&local_13c,&local_140);
  }
LAB_000112a6:
  uVar8 = FUN_0030113c(*param_5,param_5[1]);
  *(undefined2 *)(param_1 + 0x108) = uVar8;
  iVar10 = 0x10;
  *(int *)(param_1 + 0x10c) = (int)uVar30;
  *(undefined4 *)(param_1 + 0x110) = *param_5;
  *(undefined4 *)(param_1 + 0x114) = param_5[1];
  *(undefined4 *)(param_1 + 0x118) = param_5[2];
  uVar11 = extraout_s0;
  do {
    if (*(int *)(param_1 + iVar10 * 4) != 0) {
      uVar11 = FUN_00033ca0();
      uVar11 = FUN_00036f4c(uVar11,*(undefined4 *)(param_1 + iVar10 * 4));
      *(undefined4 *)(param_1 + iVar10 * 4) = 0;
    }
    iVar10 = iVar10 + 1;
  } while (iVar10 != 0x12);
  if (puVar6[0x18] != '\0') {
    iVar10 = FUN_0000fa78(param_1);
    uVar20 = 0;
    uVar11 = extraout_s0_00;
    if (iVar10 != 0) goto LAB_00011caa;
  }
  iVar10 = FUN_0001cd6c(uVar11,0);
  if ((iVar10 == 1) && (param_1 == param_2)) {
    *(undefined4 *)(param_1 + 0x70) = 2;
  }
  if (bVar4) {
    pfVar15 = (float *)FUN_00033ca0();
    if (*pfVar15 <= 0.0) {
      local_168 = *(undefined4 *)(param_1 + 0x10);
      local_164 = *(undefined4 *)(param_1 + 0x14);
      local_160 = *(undefined4 *)(param_1 + 0x18);
      uVar29 = FixedToFP((ulonglong)
                         CONCAT24(*(ushort *)(param_1 + 0x108),(uint)*(ushort *)(param_1 + 0x108)),0
                         ,1,0,0x20);
      uVar31 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar29 >> 0x20),(float)uVar29 / DAT_0001145c
                                      ),CONCAT44(extraout_s5_04,DAT_00011460),2);
      uVar29 = FloatVectorMult(uVar30,CONCAT44(extraout_s1_05,DAT_00011464),2,0x20);
      if (*(char *)(param_1 + 0x1ba) == '\0') {
        uVar11 = *(undefined4 *)(param_1 + 0x70);
      }
      else {
        uVar11 = 1;
      }
      FUN_00011d10(&local_168,(int)uVar31,(int)uVar29,uVar11,0,0x3f800000);
    }
    uVar11 = FUN_0002ede8();
    local_174 = *(undefined4 *)(param_1 + 0x10);
    local_170 = *(undefined4 *)(param_1 + 0x14);
    local_16c = *(undefined4 *)(param_1 + 0x18);
    FUN_000305f4(uVar11,&local_174);
    puVar24 = (undefined4 *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x250);
    if (((*(char *)(param_1 + 0x1ba) != '\0') && (puVar24 = &DAT_00556d00, (DAT_00556d04 & 1) == 0))
       && (iVar10 = ___cxa_guard_acquire(&DAT_00556d04), iVar10 != 0)) {
      DAT_00556d00 = FUN_002f69c4("crit_hit",8);
      puVar24 = &DAT_00556d00;
      ___cxa_guard_release(&DAT_00556d04);
    }
    uVar22 = *puVar24;
    uVar11 = FUN_00033ca0();
    iVar10 = FUN_000359cc(uVar11,uVar22);
    if (iVar10 == 1) {
      uVar11 = FUN_00033ca0();
      uVar11 = FUN_00035a08(uVar11,uVar22,param_1 + 0x40,1);
      *(undefined4 *)(param_1 + 0x40) = uVar11;
      uVar11 = FUN_00033ca0();
      iVar10 = FUN_00035a08(uVar11,uVar22,param_1 + 0x44,1);
      *(int *)(param_1 + 0x44) = iVar10;
      iVar13 = *(int *)(param_1 + 0x40);
      if (iVar13 != 0) {
        *(undefined4 *)(iVar13 + 8) = *(undefined4 *)(param_1 + 0x10);
        *(undefined4 *)(iVar13 + 0xc) = *(undefined4 *)(param_1 + 0x14);
        *(undefined4 *)(iVar13 + 0x10) = *(undefined4 *)(param_1 + 0x18);
        uVar12 = FUN_003010b8(-*(short *)(param_1 + 0x108));
        *(uint *)(*(int *)(param_1 + 0x40) + 0x34) = uVar12 ^ 0x80000000;
        uVar11 = FUN_003010d0(-*(short *)(param_1 + 0x108));
        *(undefined4 *)(*(int *)(param_1 + 0x40) + 0x30) = uVar11;
        iVar10 = *(int *)(param_1 + 0x44);
      }
      if (iVar10 != 0) {
        *(undefined4 *)(iVar10 + 8) = *(undefined4 *)(param_1 + 0x11c);
        *(undefined4 *)(iVar10 + 0xc) = *(undefined4 *)(param_1 + 0x120);
        *(undefined4 *)(iVar10 + 0x10) = *(undefined4 *)(param_1 + 0x124);
        uVar12 = FUN_003010b8(-*(short *)(param_1 + 0x108));
        *(uint *)(*(int *)(param_1 + 0x44) + 0x34) = uVar12 ^ 0x80000000;
        uVar11 = FUN_003010d0(-*(short *)(param_1 + 0x108));
        *(undefined4 *)(*(int *)(param_1 + 0x44) + 0x30) = uVar11;
      }
    }
    uVar22 = *(undefined4 *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x25c);
    uVar11 = FUN_00033ca0();
    iVar10 = FUN_000359cc(uVar11,uVar22);
    if (iVar10 == 1) {
      uVar11 = FUN_00033ca0();
      iVar10 = FUN_00035a08(uVar11,uVar22,0,
                            (int)((uint)(*(float *)(puVar6 + 0x20) < 1.0) << 0x1f) < 0);
      if (iVar10 != 0) {
        uVar12 = FUN_003010b8(-*(short *)(param_1 + 0x108));
        *(uint *)(iVar10 + 0x34) = uVar12 ^ 0x80000000;
        uVar11 = FUN_003010d0(-*(short *)(param_1 + 0x108));
        *(undefined4 *)(iVar10 + 0x30) = uVar11;
        *(undefined4 *)(iVar10 + 8) = *(undefined4 *)(param_1 + 0x10);
        *(undefined4 *)(iVar10 + 0xc) = *(undefined4 *)(param_1 + 0x14);
        *(undefined4 *)(iVar10 + 0x10) = *(undefined4 *)(param_1 + 0x18);
      }
    }
  }
  uVar20 = 0;
  if (puVar6[0x18] == '\0') {
    uVar11 = FUN_0000342c(0);
    FUN_000040b0(uVar11,*(undefined4 *)
                         ((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x250));
    if ((*(char *)(param_1 + 0xcc) == '\0') || (3 < *(int *)(param_1 + 200))) {
      if (((param_2 == 0) || (*(char *)(param_1 + 0xc4) != '\0')) ||
         ((puVar6[0x17] != '\0' &&
          (((*(int *)(puVar6 + 0x10) != 1 ||
            (-1 < (int)((uint)(*(float *)(puVar6 + 0x20) < DAT_00011468) << 0x1f))) ||
           (*(float *)(puVar6 + 0x20) <= DAT_0001146c)))))) {
        uVar20 = 0;
        if ((*(char *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x330) == '\0') ||
           (param_2 == 0)) goto LAB_00011caa;
        DAT_005d4cf0 = DAT_005d4cf0 + 1;
        for (puVar24 = DAT_005d4ce8; (undefined4 **)puVar24 != &DAT_005d4ce8;
            puVar24 = (undefined4 *)*puVar24) {
          piVar17 = puVar24 + 2;
          if ((puVar24[0xb] == 0) || (((int)puVar24[0xb] < DAT_005d4cf0 && (puVar24[0xc] == 1)))) {
            if (*(char *)(puVar24 + 10) != '\0') {
              piVar17 = (int *)*piVar17;
            }
            if (piVar17 != (int *)0x0) {
              (**(code **)(*piVar17 + 0xc))(piVar17,param_1,0,param_2);
            }
          }
        }
        FUN_00014d20(&DAT_005d4ce8);
        *(int *)(param_1 + 0x1cc) = *(int *)(param_1 + 0x1cc) + 1;
        for (puVar24 = *(undefined4 **)(param_1 + 0x1c4); puVar24 != (undefined4 *)(param_1 + 0x1c4)
            ; puVar24 = (undefined4 *)*puVar24) {
          piVar17 = puVar24 + 2;
          if ((puVar24[0xb] == 0) ||
             (((int)puVar24[0xb] < *(int *)(param_1 + 0x1cc) && (puVar24[0xc] == 1)))) {
            if (*(char *)(puVar24 + 10) != '\0') {
              piVar17 = (int *)*piVar17;
            }
            if (piVar17 != (int *)0x0) {
              (**(code **)(*piVar17 + 0xc))(piVar17,param_1,0,param_2);
            }
          }
        }
        FUN_00014d20((undefined4 *)(param_1 + 0x1c4));
      }
      else {
        uVar11 = *(undefined4 *)(param_1 + 0x84);
        if (*(int *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x32c) != 0) {
          uVar22 = FUN_00031290();
          uVar16 = FUN_00014934(*(undefined4 *)
                                 ((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x32c));
          local_180 = *(undefined4 *)(param_1 + 0x10);
          local_17c = *(undefined4 *)(param_1 + 0x14);
          local_178 = *(undefined4 *)(param_1 + 0x18);
          FUN_00031d68(uVar22,uVar16,&local_180,0);
        }
        if (*(char *)(param_1 + 0x1ba) == '\0') {
          uVar12 = (uint)*(byte *)(param_1 + 0x3c);
          iVar10 = *(int *)(uVar12 * 0x338 + DAT_005d4cdc + 0x314);
        }
        else {
          uVar12 = (uint)*(byte *)(param_1 + 0x3c);
          iVar10 = *(int *)(uVar12 * 0x338 + DAT_005d4cdc + 0x314) + DAT_0052bf64;
        }
        if ((DAT_0052bf7c == uVar12) &&
           (*(char *)(DAT_0052bf7c * 0x338 + DAT_005d4cdc + 0x330) == '\0')) {
          DAT_005d4ce0 = DAT_005d4ce0 + 1;
        }
        else {
          DAT_005d4ce0 = 1;
          DAT_0052bf7c = uVar12;
        }
        uVar22 = FUN_00052f80();
        FUN_00057bd0(uVar22,0x3d4ccccd,0);
        if (((DAT_00556d0c & 1) == 0) && (iVar13 = ___cxa_guard_acquire(&DAT_00556d0c), iVar13 != 0)
           ) {
          DAT_00556d08 = FUN_002f69c4("first_fruit",0xb);
          ___cxa_guard_release(&DAT_00556d0c);
        }
        if (((DAT_00556d14 & 1) == 0) && (iVar13 = ___cxa_guard_acquire(&DAT_00556d14), iVar13 != 0)
           ) {
          DAT_00556d10 = FUN_002f69c4("last_fruit",10);
          ___cxa_guard_release(&DAT_00556d14);
        }
        iVar13 = FUN_00027508(*(undefined4 *)(puVar6 + 0x5c),DAT_00556d08);
        if (iVar13 < 1) {
          FUN_00027588(*(undefined4 *)(puVar6 + 0x5c),"first_fruit",DAT_00556d08,
                       *(byte *)(param_1 + 0x3c) + 1,0,0);
        }
        uVar22 = DAT_00556d10;
        uVar16 = *(undefined4 *)(puVar6 + 0x5c);
        bVar2 = *(byte *)(param_1 + 0x3c);
        iVar13 = FUN_00027508(uVar16,DAT_00556d10);
        FUN_00027588(uVar16,"last_fruit",uVar22,(bVar2 + 1) - iVar13,0,0);
        bVar2 = *(byte *)(param_1 + 0x3c);
        uVar12 = FUN_0000aae0("starfruit",0);
        if (bVar2 != uVar12) {
          FUN_0001cb08(iVar10,uVar11,1,0);
        }
        DAT_005d4cf0 = DAT_005d4cf0 + 1;
        for (puVar24 = DAT_005d4ce8; (undefined4 **)puVar24 != &DAT_005d4ce8;
            puVar24 = (undefined4 *)*puVar24) {
          piVar17 = puVar24 + 2;
          if ((puVar24[0xb] == 0) || (((int)puVar24[0xb] < DAT_005d4cf0 && (puVar24[0xc] == 1)))) {
            if (*(char *)(puVar24 + 10) != '\0') {
              piVar17 = (int *)*piVar17;
            }
            if (piVar17 != (int *)0x0) {
              (**(code **)(*piVar17 + 0xc))(piVar17,param_1,iVar10,param_2);
            }
          }
        }
        FUN_00014d20(&DAT_005d4ce8);
        *(int *)(param_1 + 0x1cc) = *(int *)(param_1 + 0x1cc) + 1;
        for (puVar24 = *(undefined4 **)(param_1 + 0x1c4); puVar24 != (undefined4 *)(param_1 + 0x1c4)
            ; puVar24 = (undefined4 *)*puVar24) {
          piVar17 = puVar24 + 2;
          if ((puVar24[0xb] == 0) ||
             (((int)puVar24[0xb] < *(int *)(param_1 + 0x1cc) && (puVar24[0xc] == 1)))) {
            if (*(char *)(puVar24 + 10) != '\0') {
              piVar17 = (int *)*piVar17;
            }
            if (piVar17 != (int *)0x0) {
              (**(code **)(*piVar17 + 0xc))(piVar17,param_1,iVar10,param_2);
            }
          }
        }
        FUN_00014d20((undefined4 *)(param_1 + 0x1c4));
        if (((DAT_00556d1c & 1) == 0) && (iVar10 = ___cxa_guard_acquire(&DAT_00556d1c), iVar10 != 0)
           ) {
          DAT_00556d18 = FUN_002f69c4("crit",4);
          ___cxa_guard_release(&DAT_00556d1c);
        }
        if (((DAT_00556d24 & 1) == 0) && (iVar10 = ___cxa_guard_acquire(&DAT_00556d24), iVar10 != 0)
           ) {
          DAT_00556d20 = FUN_002f69c4("crits_total",0xb);
          ___cxa_guard_release(&DAT_00556d24);
        }
        uVar11 = FUN_0000342c();
        if (puVar6[0x19] == '\0') {
          uVar22 = FUN_0001cd94(0);
          FUN_00003e1c(uVar11,uVar22);
        }
        FUN_00003fb4(uVar11,DAT_005d4ce0,
                     *(undefined4 *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x250)
                    );
        iVar10 = (uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc;
        FUN_00027588(*(undefined4 *)(puVar6 + 0x5c),iVar10,*(undefined4 *)(iVar10 + 0x250),1,0,1);
        iVar10 = (uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc;
        FUN_00027588(*(undefined4 *)(puVar6 + 0x5c),iVar10 + 0x140,*(undefined4 *)(iVar10 + 0x260),1
                     ,1,1);
        if (((DAT_00556d2c & 1) == 0) && (iVar10 = ___cxa_guard_acquire(&DAT_00556d2c), iVar10 != 0)
           ) {
          DAT_00556d28 = FUN_002f69c4("tomato",6);
          ___cxa_guard_release(&DAT_00556d2c);
        }
        if (DAT_00556d28 == *(int *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x250)
           ) {
          uVar22 = *(undefined4 *)(puVar6 + 0x5c);
          uVar11 = FUN_002f69c4("tomato_total_since_103",0x16);
          FUN_00027588(uVar22,"tomato_total_since_103",uVar11,1,1,1);
        }
        uVar22 = *(undefined4 *)(puVar6 + 0x5c);
        uVar11 = FUN_002f69c4("totalfruit",10);
        FUN_00027588(uVar22,"totalfruit",uVar11,1,0,0);
        if (*(char *)(param_1 + 0x1ba) != '\0') {
          FUN_00027588(*(undefined4 *)(puVar6 + 0x5c),"crit",DAT_00556d18,1,0,0);
          FUN_00027588(*(undefined4 *)(puVar6 + 0x5c),"crits_total",DAT_00556d20,1,1,0);
          if (iVar9 != 0) {
            *(int *)(iVar9 + 0x70) = *(int *)(iVar9 + 0x70) + 1;
          }
          FUN_002f702c(acStack_ac,0x80,"%scrit",
                       (uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc);
          sVar18 = _strlen(acStack_ac);
          uVar11 = FUN_002f69c4(acStack_ac,sVar18);
          FUN_00027588(*(undefined4 *)(puVar6 + 0x5c),acStack_ac,uVar11,1,0,1);
        }
        piVar17 = *(int **)puVar6;
        uVar20 = 0;
        if (piVar17 == (int *)0x0) goto LAB_00011caa;
        (**(code **)(*piVar17 + 0x40))(piVar17,param_1);
      }
    }
    else {
      uVar20 = 0;
      if (iVar9 == 0) goto LAB_00011caa;
      FUN_00060fac(iVar9,param_1);
    }
    uVar20 = 0;
  }
LAB_00011caa:
  if (*(int *)puVar5 != local_2c) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail(uVar20);
  }
  return;
}


```

## FUN_00070e68 — 00070e68

```c

void FUN_00070e68(int param_1)

{
  undefined *puVar1;
  int *piVar2;
  int *piVar3;
  int *piVar4;
  code *pcVar5;
  undefined4 uVar6;
  undefined1 auStack_11c [40];
  undefined1 auStack_f4 [40];
  undefined **local_cc;
  undefined *local_c8;
  undefined1 local_ac;
  undefined1 local_a8 [4];
  char acStack_a4 [128];
  int local_24;
  
  puVar1 = PTR_DAT_004d9048;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  if (*(int *)(param_1 + 0x14) != 0) {
    *(int *)(param_1 + 0x14) = *(int *)(param_1 + 0x14) + -1;
    uVar6 = *(undefined4 *)(puVar1 + 0x1a4);
    local_ac = 1;
    local_cc = (undefined **)0x0;
    FUN_0000a298(&local_cc);
    local_ac = 0;
    local_cc = &PTR_LAB_0052bf38;
    local_c8 = PTR_FUN_004d9058;
    FUN_0002bc94(uVar6,"extra-life",0x3f800000,0x3f800000,&local_cc,0);
    FUN_0000a298(&local_cc);
    _sprintf(acStack_a4,"inGameClassic.misscounters.cross%d",*(int *)(param_1 + 0x14) + 1);
    uVar6 = FUN_003ecb20();
    FUN_0030f7cc(auStack_f4,acStack_a4);
    piVar2 = (int *)FUN_003f06d0(uVar6,auStack_f4);
    FUN_0030f7e0(auStack_f4);
    if (piVar2 != (int *)0x0) {
      local_a8[0] = 1;
      FUN_0001da28(piVar2[0x98],local_a8);
      piVar4 = piVar2 + 0xf3;
      if (piVar2[0xf5] == 0) {
        FUN_0003ca68(piVar4);
        *piVar4 = (int)piVar4;
        piVar2[0xf4] = (int)piVar4;
      }
      else {
        piVar3 = (int *)*piVar4;
        if (piVar3 != piVar4) {
          piVar3[0xb] = piVar2[0xf5];
          piVar3[0xc] = 2;
          piVar2[0xf6] = piVar2[0xf6] + 1;
          for (piVar3 = (int *)*piVar3; piVar3 != piVar4; piVar3 = (int *)*piVar3) {
            piVar3[0xb] = piVar2[0xf5];
            piVar3[0xc] = 2;
            piVar2[0xf6] = piVar2[0xf6] + 1;
          }
        }
      }
      pcVar5 = *(code **)(*piVar2 + 0x40);
      FUN_0030f7cc(auStack_11c,"in");
      (*pcVar5)(piVar2,auStack_11c,1);
      FUN_0030f7e0(auStack_11c);
    }
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 == local_24) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail(*(int *)PTR____stack_chk_guard_004d9044);
}


```

## FUN_00068018 — 00068018

```c

void FUN_00068018(int param_1)

{
  undefined *puVar1;
  int iVar2;
  int *piVar3;
  undefined4 uVar4;
  code *pcVar5;
  undefined1 auStack_74 [40];
  undefined1 auStack_4c [40];
  undefined1 local_24 [4];
  int local_20;
  
  local_20 = *(int *)PTR____stack_chk_guard_004d9044;
  local_24[0] = 0;
  FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 0xa8) + 0x260),local_24);
  *(undefined4 *)(param_1 + 0xb8) = 0;
  FUN_00069dbc(param_1);
  FUN_0006c0e0(param_1 + 0x28);
  FUN_0006d51c(param_1 + 0x40);
  FUN_0007497c(param_1 + 0x74);
  iVar2 = FUN_0001d10c(PTR_DAT_004d9048);
  uVar4 = *(undefined4 *)(iVar2 + 4);
  FUN_0030f7cc(auStack_4c,"pause");
  piVar3 = (int *)FUN_0039725c(uVar4,auStack_4c);
  FUN_0030f7e0(auStack_4c);
  if (piVar3 != (int *)0x0) {
    pcVar5 = *(code **)(*piVar3 + 0x40);
    FUN_0030f7cc(auStack_74,"animate_out_end");
    (*pcVar5)(piVar3,auStack_74,1);
    FUN_0030f7e0(auStack_74);
  }
  FUN_00076654(param_1 + 0x9c);
  puVar1 = PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0xac) = 5;
  if (*(int *)puVar1 != local_20) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00070050 — 00070050

```c

void FUN_00070050(int param_1,undefined4 param_2)

{
  undefined *puVar1;
  int *piVar2;
  int iVar3;
  void *pvVar4;
  undefined4 uVar5;
  code *pcVar6;
  undefined4 extraout_s1;
  undefined8 uVar7;
  undefined4 extraout_s1_00;
  float fVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  undefined1 auStack_1c8 [40];
  undefined1 auStack_1a0 [40];
  undefined1 auStack_178 [40];
  undefined1 auStack_150 [40];
  undefined1 auStack_128 [40];
  undefined1 auStack_100 [40];
  undefined1 auStack_d8 [40];
  undefined1 auStack_b0 [40];
  undefined1 auStack_88 [40];
  undefined1 auStack_60 [40];
  undefined1 local_38 [4];
  int local_34;
  
  local_34 = *(int *)PTR____stack_chk_guard_004d9044;
  if (*(int *)(param_1 + 4) == 0) goto switchD_000700de_default;
  FUN_00074418(param_1,param_2);
  uVar7 = FloatVectorAdd(CONCAT44(extraout_s1,*(undefined4 *)(param_1 + 0x48)),
                         CONCAT44(param_2,param_2),2);
  *(int *)(param_1 + 0x48) = (int)uVar7;
  if (*(int *)(param_1 + 0x3c) != 0) {
    FUN_000703b4();
    pvVar4 = *(void **)(param_1 + 0x3c);
    if ((0.5 <= *(float *)((int)pvVar4 + 0x24)) && (pvVar4 != (void *)0x0)) {
      FUN_00071d50(pvVar4);
      operator_delete(pvVar4);
      *(undefined4 *)(param_1 + 0x3c) = 0;
    }
  }
  FUN_0007048c(param_1);
  switch(*(undefined4 *)(param_1 + 0x44)) {
  case 0:
    uVar5 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_60,"gameStartContainer");
    iVar3 = FUN_0039725c(uVar5,auStack_60);
    FUN_0030f7e0(auStack_60);
    if (iVar3 != 0) {
      FUN_0030f7cc(auStack_88,"intro");
      iVar3 = FUN_0039834c(iVar3,auStack_88,1);
      FUN_0030f7e0(auStack_88);
      if (iVar3 == 0) {
        FUN_000705fc(param_1);
      }
    }
    break;
  case 1:
    iVar3 = *(int *)(param_1 + 4);
    if (iVar3 != 0) {
      FUN_0030f7cc(auStack_b0,"score.text");
      iVar3 = FUN_0039725c(iVar3,auStack_b0);
      FUN_0030f7e0(auStack_b0);
      fVar8 = *(float *)(iVar3 + 0x884);
      uVar5 = FUN_0001ca48();
      uVar7 = FixedToFP(CONCAT44(uVar5,uVar5),0,0,0,0x20);
      if ((float)uVar7 < fVar8) {
        uVar5 = *(undefined4 *)(param_1 + 4);
        FUN_0030f7cc(auStack_d8,"score.bestScoreText");
        piVar2 = (int *)FUN_0039725c(uVar5,auStack_d8);
        FUN_0030f7e0(auStack_d8);
        if (piVar2 != (int *)0x0) {
          uVar7 = FPToFixed(CONCAT44(extraout_s1_00,*(float *)(iVar3 + 0x884)),0,0,3,0x20);
          piVar2[0x220] = (int)uVar7;
          FUN_003d0bf4((int)uVar7,piVar2);
        }
        if (*(char *)(param_1 + 0x10) == '\0') {
          if (piVar2 != (int *)0x0) {
            pcVar6 = *(code **)(*piVar2 + 0x40);
            FUN_0030f7cc(auStack_100,"beaten");
            (*pcVar6)(piVar2,auStack_100,1);
            FUN_0030f7e0(auStack_100);
          }
          *(undefined1 *)(param_1 + 0x10) = 1;
        }
      }
    }
    if ((*(char *)(param_1 + 0x58) == '\0') && (DAT_000703b0 < *(float *)(PTR_DAT_004d9048 + 0x5d4))
       ) {
      uVar9 = *(undefined4 *)(PTR_DAT_004d9048 + 0x5c);
      uVar5 = FUN_002f69c4("survive_90secs",0xe);
      FUN_00027588(uVar9,"survive_90secs",uVar5,1,0,1);
      *(undefined1 *)(param_1 + 0x58) = 1;
    }
    if (2 < *(uint *)(param_1 + 0x14)) {
      FUN_000707cc(param_1);
    }
    break;
  case 2:
    uVar5 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_178,"gameOverContainer");
    piVar2 = (int *)FUN_0039725c(uVar5,auStack_178);
    FUN_0030f7e0(auStack_178);
    FUN_0030f7cc(auStack_1a0,"game_over");
    iVar3 = FUN_0039834c(piVar2,auStack_1a0,1);
    FUN_0030f7e0(auStack_1a0);
    if (iVar3 != 0) break;
    pcVar6 = *(code **)(*piVar2 + 0x40);
    FUN_0030f7cc(auStack_1c8,"game_over_real");
    (*pcVar6)(piVar2,auStack_1c8,1);
    FUN_0030f7e0(auStack_1c8);
    puVar1 = PTR_DAT_004d9048;
    uVar9 = *(undefined4 *)(PTR_DAT_004d9048 + 0xb0);
    uVar10 = *(undefined4 *)(PTR_DAT_004d9048 + 0xac);
    FUN_0001cfac(*(undefined4 *)(PTR_DAT_004d9048 + 0x654),"results",0,0);
    uVar5 = 3;
    *(undefined4 *)(puVar1 + 0xb4) = uVar10;
    *(undefined4 *)(puVar1 + 0xb8) = uVar9;
    *(undefined4 *)(puVar1 + 0xbc) = uVar10;
    *(undefined4 *)(puVar1 + 0xc0) = uVar9;
    goto LAB_00070388;
  case 3:
    uVar5 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_128,"gameOverContainer");
    uVar5 = FUN_0039725c(uVar5,auStack_128);
    FUN_0030f7e0(auStack_128);
    FUN_0030f7cc(auStack_150,"game_over_real");
    iVar3 = FUN_0039834c(uVar5,auStack_150,1);
    FUN_0030f7e0(auStack_150);
    if (iVar3 != 0) break;
    local_38[0] = 0;
    FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 4) + 0x260),local_38);
    FUN_000209b8(0xffffffff,0xbf800000,0xffffffff);
    uVar5 = 4;
LAB_00070388:
    *(undefined4 *)(param_1 + 0x44) = uVar5;
  }
switchD_000700de_default:
  if (*(int *)PTR____stack_chk_guard_004d9044 == local_34) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

## FUN_00060108 — 00060108

```c

void FUN_00060108(int param_1)

{
  undefined *puVar1;
  undefined *puVar2;
  int iVar3;
  undefined4 uVar4;
  int iVar5;
  uint uVar6;
  undefined4 uVar7;
  _Rb_tree_node_base *p_Var8;
  int iVar9;
  undefined4 uVar10;
  char *pcVar11;
  int *piVar12;
  code *pcVar13;
  undefined **local_78;
  undefined *local_74;
  undefined4 local_70 [8];
  undefined1 local_50;
  undefined1 auStack_4c [40];
  int local_24;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  piVar12 = *(int **)(param_1 + 4);
  pcVar13 = *(code **)(*piVar12 + 0x40);
  FUN_0030f7cc(auStack_4c,"animate_out");
  (*pcVar13)(piVar12,auStack_4c,1);
  FUN_0030f7e0(auStack_4c);
  FUN_0005edc8(&DAT_005f94b4);
  iVar3 = FUN_0005edbc(&DAT_005f94b4);
  if (iVar3 == 0) goto LAB_000604fe;
  iVar9 = *(int *)(param_1 + 0x68);
  iVar3 = FUN_0005edbc(&DAT_005f94b4);
  *(int *)(iVar9 + 0x80) = *(int *)(iVar9 + 0x80) + 1;
  if (iVar3 == 1) {
    *(int *)(iVar9 + 0x84) = *(int *)(iVar9 + 0x84) + 1;
  }
  iVar3 = *(int *)(param_1 + 0x68);
  uVar4 = FUN_0005edbc(&DAT_005f94b4);
  iVar9 = param_1 + 8;
  *(undefined4 *)(*(int *)(iVar3 + 0x78) + *(int *)(iVar3 + 0x90) * 8 + 4) = uVar4;
  FUN_000663a0(iVar9,&DAT_005f94b4);
  iVar3 = 0;
  if ((*(int *)(param_1 + 0x68) != 0) && (iVar3 = 0, *(int *)(*(int *)(param_1 + 0x68) + 0x98) != 0)
     ) {
    iVar3 = 1;
  }
  iVar5 = FUN_0005edbc(&DAT_005f94b4);
  if (iVar5 == 1 || iVar3 == 1) {
    if (iVar3 == 0) {
      uVar4 = FUN_00065968(iVar9);
      FUN_00066a8c(param_1 + 0x48,uVar4);
      uVar6 = FUN_000659a0(iVar9,1);
      if (99 < uVar6) {
        uVar7 = *(undefined4 *)(PTR_DAT_004d9048 + 0x5c);
        uVar4 = FUN_002f69c4("full_slice_bonus_total",0x16);
        FUN_00027588(uVar7,"full_slice_bonus_total",uVar4,1,1,1);
      }
      puVar2 = PTR_DAT_004d9048;
      iVar9 = FUN_000276e8(*(undefined4 *)(PTR_DAT_004d9048 + 0x5c),"slashes");
      iVar5 = FUN_000276e8(*(undefined4 *)(puVar2 + 0x5c),"slashesScoring");
      uVar4 = *(undefined4 *)(puVar2 + 0x5c);
      if (iVar9 == iVar5) {
        uVar7 = FUN_002f69c4("no_misses_consecutive_total",0x1b);
        FUN_00027588(uVar4,"no_misses_consecutive_total",uVar7,1,1,1);
      }
      else {
        FUN_000274bc(uVar4,"no_misses_consecutive_total",0,1,1);
      }
      uVar7 = *(undefined4 *)(puVar2 + 0x5c);
      pcVar11 = "bandito_round_score";
      uVar4 = FUN_002f69c4("bandito_round_score",0x13);
      uVar10 = *(undefined4 *)(param_1 + 0x5c);
LAB_00060430:
      FUN_00027588(uVar7,pcVar11,uVar4,uVar10,0,1);
    }
    else {
      if ((*(int *)(param_1 + 0x68) == 0) || (*(int *)(*(int *)(param_1 + 0x68) + 0x98) == 0)) {
        iVar5 = FUN_00065968(iVar9);
        iVar9 = FUN_00066afc(param_1 + 0x48);
        iVar9 = iVar9 + iVar5;
      }
      else {
        iVar9 = FUN_00066afc(param_1 + 0x48);
      }
      FUN_00066a8c(param_1 + 0x48,iVar9);
      puVar2 = PTR_DAT_004d9048;
      uVar10 = *(undefined4 *)(PTR_DAT_004d9048 + 0x5c);
      uVar4 = FUN_002f69c4("bonus_round_score",0x11);
      uVar7 = FUN_00066b48(param_1 + 0x48);
      FUN_00027588(uVar10,"bonus_round_score",uVar4,uVar7,0,1);
      if (*(int *)(param_1 + 0x4c) == 2) {
        uVar7 = *(undefined4 *)(puVar2 + 0x5c);
        pcVar11 = "bandito_1_heart_finish";
        uVar4 = FUN_002f69c4("bandito_1_heart_finish",0x16);
        uVar10 = 1;
        goto LAB_00060430;
      }
    }
    puVar2 = PTR_DAT_004d9048;
    if (*(char *)(*(int *)(param_1 + 100) + 0x59) != '\0') {
      uVar7 = *(undefined4 *)(PTR_DAT_004d9048 + 0x5c);
      uVar4 = FUN_002f69c4("challenge_hard_pass",0x13);
      FUN_00027588(uVar7,"challenge_hard_pass",uVar4,1,1,1);
      uVar7 = *(undefined4 *)(puVar2 + 0x5c);
      uVar4 = FUN_002f69c4("challenge_hard_pass_total",0x19);
      FUN_00027588(uVar7,"challenge_hard_pass_total",uVar4,1,1,1);
    }
  }
  else {
    FUN_00066b0c(param_1 + 0x48);
    puVar2 = PTR_DAT_004d9048;
    local_78 = &PTR_LAB_0052bf38;
    local_74 = PTR_FUN_004d9058;
    local_50 = 1;
    local_70[0] = 0;
    uVar4 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
    FUN_0000a23c(&local_78,local_70);
    FUN_0002bc94(uVar4,"gank",0x3f800000,0x3f800000,local_70,0);
    FUN_0000a298(local_70);
    FUN_000274bc(*(undefined4 *)(puVar2 + 0x5c),"consecutive_finales_total",0,1,1);
    FUN_000274bc(*(undefined4 *)(puVar2 + 0x5c),"no_misses_consecutive_total",0,1,1);
  }
  puVar2 = PTR_DAT_004d9048;
  iVar5 = *(int *)(PTR_DAT_004d9048 + 0x5c);
  iVar9 = FUN_0002b2a8(iVar5 + 0x154,*(int *)(param_1 + 100) + 0x40);
  *(int *)(iVar9 + 8) = *(int *)(iVar9 + 8) + 1;
  iVar9 = 0;
  for (p_Var8 = *(_Rb_tree_node_base **)(iVar5 + 0x160);
      p_Var8 != (_Rb_tree_node_base *)(iVar5 + 0x158);
      p_Var8 = (_Rb_tree_node_base *)std::_Rb_tree_increment(p_Var8)) {
    if (0 < *(int *)(p_Var8 + 0x1c)) {
      iVar9 = iVar9 + 1;
    }
  }
  FUN_000274bc(*(undefined4 *)(puVar2 + 0x5c),"different_challenges_played",iVar9,1,1);
  FUN_000606a4(param_1,iVar3);
LAB_000604fe:
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_000681e8 — 000681e8

```c

void FUN_000681e8(int param_1,int param_2)

{
  int iVar1;
  int iVar2;
  int *piVar3;
  _List_node_base *p_Var4;
  int *piVar5;
  int iVar6;
  char *pcVar7;
  undefined4 uVar8;
  undefined1 *puVar9;
  int *piVar10;
  code *pcVar11;
  int iVar12;
  undefined1 auStack_2b0 [40];
  undefined1 auStack_288 [40];
  undefined1 auStack_260 [40];
  undefined *local_238;
  int local_234;
  undefined1 *local_230;
  undefined4 uStack_22c;
  undefined1 local_218;
  undefined1 auStack_214 [40];
  undefined **local_1ec;
  undefined *local_1e8;
  undefined1 local_1cc;
  undefined1 auStack_1c8 [40];
  undefined1 auStack_1a0 [40];
  undefined1 auStack_178 [40];
  undefined4 local_150 [8];
  undefined1 local_130;
  undefined4 local_12c;
  undefined4 local_128;
  char acStack_124 [128];
  char acStack_a4 [128];
  int local_24;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  if (param_2 == 0) {
    iVar12 = 1;
    do {
      _sprintf(acStack_124,"@misscounters.cross%d",iVar12);
      uVar8 = *(undefined4 *)(param_1 + 0xa8);
      FUN_0030f7cc(auStack_1a0,acStack_124);
      piVar3 = (int *)FUN_0039725c(uVar8,auStack_1a0);
      FUN_0030f7e0(auStack_1a0);
      if (piVar3 != (int *)0x0) {
        iVar1 = FUN_0001d10c(PTR_DAT_004d9048);
        if (*(int *)(iVar1 + 0x4c) < iVar12) {
          piVar10 = piVar3 + 0xf3;
          if (piVar3[0xf5] == 0) {
            FUN_0003ca68(piVar10);
            *piVar10 = (int)piVar10;
            piVar3[0xf4] = (int)piVar10;
          }
          else {
            piVar5 = (int *)*piVar10;
            if (piVar5 != piVar10) {
              piVar5[0xb] = piVar3[0xf5];
              piVar5[0xc] = 2;
              piVar3[0xf6] = piVar3[0xf6] + 1;
              for (piVar5 = (int *)*piVar5; piVar5 != piVar10; piVar5 = (int *)*piVar5) {
                piVar5[0xb] = piVar3[0xf5];
                piVar5[0xc] = 2;
                piVar3[0xf6] = piVar3[0xf6] + 1;
              }
            }
          }
          iVar1 = piVar3[0x98];
          if (piVar3[0x13] == 0) {
LAB_00068500:
            local_150[0] = CONCAT31(local_150[0]._1_3_,1);
            FUN_0001da28(iVar1,local_150);
            puVar9 = auStack_260;
            pcVar11 = *(code **)(*piVar3 + 0x40);
            pcVar7 = "get_life";
          }
          else {
            iVar6 = *(int *)(iVar1 + 0x38);
            iVar2 = iVar1;
            while (iVar6 != 0) {
              iVar2 = *(int *)(iVar6 + 4);
              iVar6 = *(int *)(iVar2 + 0x38);
            }
            if (*(char *)(iVar2 + 0x48) == '\0') goto LAB_00068500;
            FUN_0030f7cc(auStack_288,"animate_idle");
            iVar1 = FUN_0039834c(piVar3,auStack_288,0);
            FUN_0030f7e0(auStack_288);
            if (iVar1 != 0) goto LAB_00068532;
            puVar9 = auStack_2b0;
            pcVar11 = *(code **)(*piVar3 + 0x40);
            pcVar7 = "animate_idle";
          }
          FUN_0030f7cc(puVar9,pcVar7);
          (*pcVar11)(piVar3,puVar9,1);
          FUN_0030f7e0(puVar9);
        }
        else if (piVar3[0x13] != 0) {
          for (iVar1 = piVar3[0x98]; *(int *)(iVar1 + 0x38) != 0;
              iVar1 = *(int *)(*(int *)(iVar1 + 0x38) + 4)) {
          }
          if (*(char *)(iVar1 + 0x48) != '\0') {
            FUN_0030f7cc(auStack_1c8,"animate_trigger");
            iVar1 = FUN_0039834c(piVar3,auStack_1c8,0);
            FUN_0030f7e0(auStack_1c8);
            if (iVar1 == 0) {
              iVar1 = *(int *)(PTR_DAT_004d9048 + 0x1a4);
              if (iVar1 != 0) {
                local_1cc = 1;
                local_1ec = (undefined **)0x0;
                FUN_0000a298(&local_1ec);
                local_1cc = 0;
                local_1ec = &PTR_LAB_0052bf38;
                local_1e8 = PTR_FUN_004d9058;
                FUN_0002bb34(iVar1,"gank",0x3f800000,0x3f800000,&local_1ec,0);
                FUN_0000a298(&local_1ec);
              }
              pcVar11 = *(code **)(*piVar3 + 0x40);
              FUN_0030f7cc(auStack_214,"animate_trigger");
              (*pcVar11)(piVar3,auStack_214,1);
              FUN_0030f7e0(auStack_214);
              local_218 = 1;
              local_238 = (undefined *)0x0;
              FUN_0003c910(&local_238);
              local_218 = 0;
              local_238 = &DAT_0052cbd8;
              local_230 = &FUN_00068c4c_1;
              uStack_22c = 0;
              local_130 = 1;
              local_150[0] = 0;
              local_234 = param_1;
              (*(code *)PTR_FUN_0052cbe0)(&local_238,local_150);
              local_12c = 0;
              local_128 = 0;
              p_Var4 = (_List_node_base *)FUN_0003c96c(piVar3 + 0xf3,local_150);
              std::_List_node_base::hook(p_Var4);
              FUN_0003c910(local_150);
              if (piVar3[0xf5] != 0) {
                iVar1 = piVar3[0xf4];
                *(int *)(iVar1 + 0x2c) = piVar3[0xf5];
                *(undefined4 *)(iVar1 + 0x30) = 1;
                piVar3[0xf6] = piVar3[0xf6] + 1;
              }
              FUN_0003c910(&local_238);
            }
          }
        }
      }
LAB_00068532:
      iVar12 = iVar12 + 1;
    } while (iVar12 != 4);
  }
  else {
    iVar12 = 1;
    do {
      _sprintf(acStack_a4,"@misscounters.cross%d",iVar12);
      uVar8 = *(undefined4 *)(param_1 + 0xa8);
      FUN_0030f7cc(auStack_178,acStack_a4);
      iVar1 = FUN_0039725c(uVar8,auStack_178);
      FUN_0030f7e0(auStack_178);
      if (iVar1 != 0) {
        iVar2 = FUN_0001d10c(PTR_DAT_004d9048);
        local_150[0] = CONCAT31(local_150[0]._1_3_,*(int *)(iVar2 + 0x4c) < iVar12);
        FUN_0001da28(*(undefined4 *)(iVar1 + 0x260),local_150);
      }
      iVar12 = iVar12 + 1;
    } while (iVar12 != 4);
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 == local_24) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

## FUN_00028350 — 00028350

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

## FUN_000783b8 — 000783b8

```c

/* WARNING: Heritage AFTER dead removal. Example location: s1 : 0x00078922 */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void FUN_000783b8(int param_1,int param_2)

{
  longlong lVar1;
  undefined *puVar2;
  undefined *puVar3;
  undefined *puVar4;
  int *piVar5;
  int iVar6;
  undefined1 *puVar7;
  undefined4 uVar8;
  int iVar9;
  undefined4 uVar10;
  uint uVar11;
  uint uVar12;
  uint uVar13;
  uint in_fpscr;
  byte bVar14;
  float fVar15;
  undefined8 in_d0;
  undefined8 uVar16;
  float fVar17;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  undefined8 uVar18;
  undefined4 extraout_s3_01;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  undefined4 extraout_s5_01;
  undefined4 extraout_s7;
  undefined4 extraout_s7_00;
  undefined4 extraout_s7_01;
  undefined4 extraout_s7_02;
  undefined4 extraout_s9;
  undefined4 extraout_s11;
  undefined4 extraout_s13;
  undefined8 uVar19;
  undefined8 uVar20;
  undefined8 uVar21;
  undefined8 uVar22;
  undefined4 local_90 [8];
  undefined1 local_70;
  undefined4 local_6c;
  undefined4 local_68;
  undefined4 local_64;
  undefined4 local_60;
  undefined4 local_5c;
  undefined4 local_58;
  char acStack_54 [32];
  int local_34;
  
  puVar2 = PTR____stack_chk_guard_004d9044;
  local_34 = *(int *)PTR____stack_chk_guard_004d9044;
  fVar15 = *(float *)(param_1 + 0x88);
  uVar12 = in_fpscr & 0xfffffff | (uint)(fVar15 < 0.0) << 0x1f | (uint)(fVar15 == 0.0) << 0x1e |
           (uint)(0.0 <= fVar15) << 0x1d;
  if ((int)uVar12 < 0) {
    *(undefined4 *)(param_1 + 0x88) = 0;
  }
  else {
    fVar15 = *(float *)(param_1 + 0x84);
    uVar13 = in_fpscr & 0xfffffff | (uint)(fVar15 < 1.5) << 0x1f | (uint)(fVar15 == 1.5) << 0x1e;
    uVar12 = uVar13 | (uint)NAN(fVar15) << 0x1c;
    bVar14 = (byte)(uVar13 >> 0x18);
    if (!(bool)(bVar14 >> 6 & 1) && bVar14 >> 7 == ((byte)(uVar12 >> 0x1c) & 1)) goto LAB_00078944;
  }
  puVar3 = PTR_DAT_004d9048;
  piVar5 = (int *)FUN_0001d10c();
  (**(code **)(*piVar5 + 0x40))(piVar5,*(undefined4 *)(param_1 + 0x7c));
  uVar16 = FloatVectorAdd(CONCAT44((int)((ulonglong)in_d0 >> 0x20),*(undefined4 *)(param_1 + 0x84)),
                          0x3f8000003f800000,2);
  *(undefined4 *)(param_1 + 0x84) = (int)uVar16;
  *(int *)(param_1 + 0x90) = *(int *)(param_1 + 0x90) + 1;
  puVar4 = PTR_DAT_004d9050;
  fVar15 = DAT_0007857c;
  if (*(int *)(param_1 + 0xdc) < 1) {
    lVar1 = (ulonglong)*(uint *)PTR_DAT_004d9050 * (ulonglong)*(uint *)(PTR_DAT_004d9050 + 8);
    uVar11 = (uint)lVar1;
    uVar13 = *(int *)(PTR_DAT_004d9050 + 4) * *(uint *)(PTR_DAT_004d9050 + 8) +
             *(uint *)PTR_DAT_004d9050 * *(int *)(PTR_DAT_004d9050 + 0xc) +
             (int)((ulonglong)lVar1 >> 0x20) +
             *(int *)(PTR_DAT_004d9050 + 0x14) +
             (uint)CARRY4(uVar11,*(uint *)(PTR_DAT_004d9050 + 0x10));
    lVar1 = (ulonglong)uVar13 * 0x7ffff;
    uVar8 = (undefined4)((ulonglong)lVar1 >> 0x20);
    *(uint *)PTR_DAT_004d9050 = uVar11 + *(uint *)(PTR_DAT_004d9050 + 0x10);
    *(uint *)(puVar4 + 4) = uVar13;
    uVar19 = CONCAT44(extraout_s5,*(undefined4 *)(param_1 + 0xd0));
    uVar18 = FixedToFP(CONCAT44(uVar8,uVar8),0,1,0,0x20);
    uVar21 = FloatVectorMult(CONCAT44(extraout_s7,(float)uVar18 / fVar15),0x4040000040400000,2,0x20)
    ;
    uVar18 = CONCAT44((int)((ulonglong)uVar18 >> 0x20),*(undefined4 *)(param_1 + 0xcc));
    uVar16 = CONCAT44((int)((ulonglong)uVar16 >> 0x20),*(undefined4 *)(param_1 + 0xd4));
    uVar20 = FloatVectorMult(uVar18,uVar18,2,0x20);
    uVar22 = FloatVectorMult(uVar16,uVar16,2,0x20);
    uVar18 = FPToFixed(uVar21,0,0,3,0x20);
    uVar16 = FloatVectorMult(uVar19,uVar19,2,0x20);
    uVar16 = FloatVectorAdd(uVar20,uVar16,2);
    uVar16 = FloatVectorAdd(uVar16,uVar22,2);
    iVar6 = (int)uVar18 + 7;
    fVar15 = (float)FUN_00301044((int)uVar16,(int)uVar18,uVar8,(int)lVar1);
    uVar18 = FixedToFP(CONCAT44(iVar6,iVar6),0,0,0,0x20);
    uVar13 = uVar12 & 0xfffffff;
    uVar12 = uVar13 | (uint)(fVar15 < 1.0) << 0x1f | (uint)(fVar15 == 1.0) << 0x1e |
             (uint)(1.0 <= fVar15) << 0x1d;
    if ((int)uVar12 < 0) {
      uVar13 = *(uint *)puVar4;
      lVar1 = (ulonglong)uVar13 * (ulonglong)*(uint *)(puVar4 + 8);
      uVar11 = (uint)lVar1;
      *(uint *)puVar4 = uVar11 + *(uint *)(puVar4 + 0x10);
      puVar7 = (undefined1 *)
               (*(int *)(puVar4 + 4) * *(uint *)(puVar4 + 8) +
                uVar13 * *(int *)(puVar4 + 0xc) + (int)((ulonglong)lVar1 >> 0x20) +
                *(int *)(puVar4 + 0x14) + (uint)CARRY4(uVar11,*(uint *)(puVar4 + 0x10)));
      *(undefined1 **)(puVar4 + 4) = puVar7;
    }
    else {
      uVar13 = uVar13 | (uint)(fVar15 < 22.0) << 0x1f | (uint)(fVar15 == 22.0) << 0x1e;
      uVar12 = uVar13 | (uint)NAN(fVar15) << 0x1c;
      bVar14 = (byte)(uVar13 >> 0x18);
      if ((bool)(bVar14 >> 6 & 1) || bVar14 >> 7 != ((byte)(uVar12 >> 0x1c) & 1)) {
        uVar19 = FloatVectorSub(CONCAT44(extraout_s7_00,*(undefined4 *)(param_1 + 0xd0)),
                                CONCAT44(extraout_s5_00,*(undefined4 *)(param_1 + 0xc4)),2,0x20);
        uVar16 = FloatVectorSub(CONCAT44(0x41b00000,*(undefined4 *)(param_1 + 0xcc)),
                                CONCAT44(fVar15,*(undefined4 *)(param_1 + 0xc0)),2,0x20);
        puVar7 = (undefined1 *)FUN_0030113c((int)uVar19,(int)uVar16);
      }
      else {
        iVar6 = FUN_0030113c(*(undefined4 *)(param_1 + 0xd0),*(undefined4 *)(param_1 + 0xcc));
        lVar1 = (ulonglong)*(uint *)puVar4 * (ulonglong)*(uint *)(puVar4 + 8);
        uVar11 = (uint)lVar1;
        uVar13 = *(int *)(puVar4 + 4) * *(uint *)(puVar4 + 8) +
                 *(uint *)puVar4 * *(int *)(puVar4 + 0xc) + (int)((ulonglong)lVar1 >> 0x20) +
                 *(int *)(puVar4 + 0x14) + (uint)CARRY4(uVar11,*(uint *)(puVar4 + 0x10));
        *(uint *)puVar4 = uVar11 + *(uint *)(puVar4 + 0x10);
        *(uint *)(puVar4 + 4) = uVar13;
        puVar7 = &LAB_00005ffa + iVar6 + (int)((ulonglong)uVar13 * 0x3ffc >> 0x20);
      }
    }
    uVar8 = FUN_003010d0((uint)puVar7 & 0xffff);
    uVar19 = FloatVectorMult(uVar18,CONCAT44(uVar8,uVar8),2,0x20);
    uVar8 = FUN_003010b8((uint)puVar7 & 0xffff);
    uVar16 = FloatVectorAdd(uVar19,CONCAT44((int)((ulonglong)uVar16 >> 0x20),
                                            *(undefined4 *)(param_1 + 0xcc)),2);
    uVar19 = FloatVectorMult(uVar18,CONCAT44(uVar8,uVar8),2,0x20);
    uVar18 = FloatVectorMult(uVar18,0,2,0x20);
    *(int *)(param_1 + 0xcc) = (int)uVar16;
    uVar16 = FloatVectorAdd(uVar19,CONCAT44((int)((ulonglong)uVar16 >> 0x20),
                                            *(undefined4 *)(param_1 + 0xd0)),2);
    *(int *)(param_1 + 0xd0) = (int)uVar16;
    uVar16 = FloatVectorAdd(uVar18,CONCAT44((int)((ulonglong)uVar16 >> 0x20),
                                            *(undefined4 *)(param_1 + 0xd4)),2);
    *(int *)(param_1 + 0xd4) = (int)uVar16;
    *(undefined4 *)(param_1 + 0xc0) = *(undefined4 *)(param_1 + 0xb4);
    *(undefined4 *)(param_1 + 0xc4) = *(undefined4 *)(param_1 + 0xb8);
    *(undefined4 *)(param_1 + 200) = *(undefined4 *)(param_1 + 0xbc);
    iVar6 = 0;
    *(undefined4 *)(param_1 + 0xd8) = 0;
  }
  else {
    iVar6 = *(int *)(param_1 + 0xdc) + -1;
  }
  bVar14 = (byte)(uVar12 >> 0x18);
  *(int *)(param_1 + 0xdc) = iVar6;
  uVar8 = FUN_00052f80((int)uVar16);
  FUN_00057bd0(uVar8,0x3dcccccd,0);
  FUN_00013c5c(*(undefined4 *)(param_1 + 0x7c));
  uVar16 = FloatVectorMult(CONCAT44(extraout_s3,*(undefined4 *)(param_1 + 0x2c)),
                           CONCAT44((int)((ulonglong)uVar16 >> 0x20),DAT_0007896c),2,0x20);
  uVar16 = FPToFixed(uVar16,0,0,3,0x20);
  FUN_00079860(&local_60,*(undefined4 *)(param_1 + 0x7c),(uint)uVar16 & 0xffff);
  puVar4 = PTR_DAT_004d9050;
  iVar6 = *(int *)(param_1 + 0x7c);
  uVar18 = CONCAT44(extraout_s5_01,*(undefined4 *)(iVar6 + 0x10c));
  uVar21 = FloatVectorMult(CONCAT44(extraout_s3_00,local_60),uVar18,2,0x20);
  uVar22 = FloatVectorMult(uVar18,CONCAT44(extraout_s7_01,local_58),2,0x20);
  uVar19 = FloatVectorMult(uVar18,CONCAT44((int)((ulonglong)uVar16 >> 0x20),local_5c),2,0x20);
  uVar18 = FloatVectorMult(uVar21,0x4040000040400000,2,0x20);
  uVar16 = FloatVectorMult(uVar22,0x4040000040400000,2,0x20);
  uVar19 = FloatVectorMult(uVar19,0x4040000040400000,2,0x20);
  *(int *)(param_1 + 0xa8) = (int)uVar18;
  *(int *)(param_1 + 0xac) = (int)uVar19;
  *(int *)(param_1 + 0xb0) = (int)uVar16;
  lVar1 = (ulonglong)*(uint *)puVar4 * (ulonglong)*(uint *)(puVar4 + 8);
  uVar12 = (uint)lVar1;
  local_68 = *(undefined4 *)(iVar6 + 0x14);
  local_6c = *(undefined4 *)(iVar6 + 0x10);
  iVar9 = *(int *)(param_2 + 0x38);
  uVar18 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar19 >> 0x20),*(undefined4 *)(iVar6 + 0xd8)),
                          0xc0a00000c0a00000,2);
  uVar21 = FloatVectorSub(CONCAT44(extraout_s11,*(undefined4 *)(iVar9 + 8)),
                          CONCAT44(extraout_s13,*(undefined4 *)(iVar9 + 0x18)),2,0x20);
  uVar13 = *(int *)(puVar4 + 4) * *(uint *)(puVar4 + 8) +
           *(uint *)puVar4 * *(int *)(puVar4 + 0xc) + (int)((ulonglong)lVar1 >> 0x20) +
           *(int *)(puVar4 + 0x14) + (uint)CARRY4(uVar12,*(uint *)(puVar4 + 0x10));
  uVar19 = FloatVectorSub(CONCAT44(extraout_s7_01,*(undefined4 *)(iVar9 + 4)),
                          CONCAT44(extraout_s9,*(undefined4 *)(iVar9 + 0x14)),2,0x20);
  *(uint *)puVar4 = uVar12 + *(uint *)(puVar4 + 0x10);
  *(uint *)(puVar4 + 4) = uVar13;
  local_64 = (undefined4)uVar18;
  uVar8 = FUN_0030113c(local_68,(int)uVar21,(int)uVar19);
  fVar15 = DAT_00078968;
  uVar10 = (undefined4)((ulonglong)uVar13 * 0x7ffff >> 0x20);
  uVar18 = FixedToFP(CONCAT44(uVar10,uVar10),0,1,0,0x20);
  uVar19 = FixedToFP(CONCAT44(uVar8,uVar8),0,1,0,0x20);
  uVar18 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar18 >> 0x20),(float)uVar18 / DAT_00078968),
                           CONCAT44(extraout_s7_02,DAT_00078974),2,0x20);
  uVar18 = FloatVectorAdd(uVar18,CONCAT44((int)((ulonglong)uVar19 >> 0x20),DAT_00078978),2);
  FUN_00011d10(&local_6c,(float)uVar19 / DAT_00078970,(int)uVar18,0);
  *(undefined4 *)(param_2 + 0x3c) = 0xffffffff;
  if (*(int *)(param_1 + 0x94) != 0) {
    *(undefined4 *)(*(int *)(param_1 + 0x94) + 0x7c) = 0;
    FUN_0004e950(*(undefined4 *)(param_1 + 0x94));
  }
  uVar8 = *(undefined4 *)
           ((uint)*(byte *)(*(int *)(param_1 + 0x7c) + 0x3c) * 0x338 + *(int *)PTR_DAT_004d91b8 +
           0x250);
  DAT_005a8d18 = DAT_005a8d18 + 1;
  if ((((*(ushort *)(param_1 + 0x90) & 0x111) != 0) && (iVar6 = FUN_000260f0(), iVar6 != 0)) ||
     (DAT_005a8d18 == 2)) {
    DAT_005a8d18 = 0;
    uVar10 = FUN_00033ca0();
    iVar6 = FUN_000359cc(uVar10,uVar8);
    if (iVar6 == 1) {
      uVar10 = FUN_00033ca0();
      fVar17 = *(float *)(puVar3 + 0x20);
      iVar6 = FUN_00035a08(uVar10,uVar8,0,
                           (char)(bVar14 & 0xf | (byte)(((uint)(fVar17 < 1.0) << 0x1f) >> 0x18) |
                                  (byte)(((uint)(fVar17 == 1.0) << 0x1e) >> 0x18) |
                                 (byte)(((uint)(1.0 <= fVar17) << 0x1d) >> 0x18)) < '\0');
      if (iVar6 != 0) {
        uVar12 = FUN_003010b8(-*(short *)(*(int *)(param_1 + 0x7c) + 0x108));
        *(uint *)(iVar6 + 0x34) = uVar12 ^ 0x80000000;
        uVar8 = FUN_003010d0(-*(short *)(*(int *)(param_1 + 0x7c) + 0x108));
        *(undefined4 *)(iVar6 + 0x30) = uVar8;
        iVar9 = *(int *)(param_2 + 0x38);
        *(undefined4 *)(iVar6 + 8) = *(undefined4 *)(iVar9 + 4);
        *(undefined4 *)(iVar6 + 0xc) = *(undefined4 *)(iVar9 + 8);
        *(undefined4 *)(iVar6 + 0x10) = *(undefined4 *)(iVar9 + 0xc);
        uVar16 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar16 >> 0x20),
                                          *(undefined4 *)(iVar6 + 0x28)),0x3f0000003f000000,2,0x20);
        *(int *)(iVar6 + 0x28) = (int)uVar16;
      }
    }
  }
  _sprintf(acStack_54,"%i HITS",(int)uVar16,*(undefined4 *)(param_1 + 0x90));
  lVar1 = (ulonglong)*(uint *)puVar4 * (ulonglong)*(uint *)(puVar4 + 8);
  uVar12 = (uint)lVar1;
  uVar13 = *(int *)(puVar4 + 4) * *(uint *)(puVar4 + 8) +
           *(uint *)puVar4 * *(int *)(puVar4 + 0xc) + (int)((ulonglong)lVar1 >> 0x20) +
           *(int *)(puVar4 + 0x14) + (uint)CARRY4(uVar12,*(uint *)(puVar4 + 0x10));
  uVar8 = (undefined4)((ulonglong)uVar13 * 0x7ffff >> 0x20);
  uVar16 = FixedToFP(CONCAT44(uVar8,uVar8),0,1,0,0x20);
  *(uint *)puVar4 = uVar12 + *(uint *)(puVar4 + 0x10);
  *(uint *)(puVar4 + 4) = uVar13;
  uVar16 = CONCAT44((int)((ulonglong)uVar16 >> 0x20),(float)uVar16 / fVar15);
  uVar16 = FloatVectorAdd(uVar16,uVar16,2);
  uVar16 = FloatVectorAdd(uVar16,0x3f8000003f800000,2);
  uVar16 = FPToFixed(uVar16,0,0,3,0x20);
  _sprintf(acStack_54,"pome-slice-%i",(int)uVar16);
  local_70 = 1;
  local_90[0] = 0;
  uVar8 = *(undefined4 *)(puVar3 + 0x1a4);
  FUN_0000a298(local_90);
  uVar16 = FixedToFP(CONCAT44(extraout_s3_01,*(undefined4 *)(param_1 + 0x90)),0,0,0,0x20);
  fVar17 = (float)uVar16 / 28.0;
  fVar15 = DAT_00078980;
  if (fVar17 <= DAT_00078980) {
    fVar15 = DAT_00078984;
  }
  FloatVectorAdd(CONCAT44(0x41e00000,fVar17),CONCAT44((int)((ulonglong)uVar16 >> 0x20),fVar15),2);
  FUN_0002bc94(DAT_0007897c,0x41e00000,fVar15,uVar8,acStack_54,0x3e000000,0x3f800000);
  FUN_0000a298(local_90);
  if (*(int *)(param_1 + 0x90) % 2 == 1) {
    FUN_0004ff50(param_1);
  }
LAB_00078944:
  if (*(int *)puVar2 != local_34) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0007048c — 0007048c

```c

void FUN_0007048c(int param_1)

{
  int *piVar1;
  byte bVar2;
  bool bVar3;
  undefined *puVar4;
  undefined4 uVar5;
  int iVar6;
  uint uVar7;
  undefined **local_4c;
  undefined *local_48;
  undefined1 local_2c;
  undefined4 local_28;
  int local_24;
  
  puVar4 = PTR____stack_chk_guard_004d9044;
  bVar3 = false;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  local_28 = 0;
  uVar5 = FUN_000065c4();
  iVar6 = FUN_00006ad0(uVar5,1,&local_28);
  if (iVar6 == 0) {
    iVar6 = *(int *)(param_1 + 0x40);
  }
  else {
    do {
      if ((*(float *)(iVar6 + 0xd0) <= 0.0) && (*(char *)(iVar6 + 0x1bc) == '\0')) {
        bVar2 = *(byte *)(iVar6 + 0x3c);
        uVar7 = FUN_0000aae0("bean",0);
        bVar3 = (bool)(bVar3 | bVar2 == uVar7);
      }
      uVar5 = FUN_000065c4();
      iVar6 = FUN_00006af0(uVar5,1,&local_28);
    } while (iVar6 != 0);
    piVar1 = (int *)(param_1 + 0x40);
    iVar6 = *piVar1;
    if (bVar3) {
      if (iVar6 != 0) {
        iVar6 = FUN_00309b54(iVar6);
        if (iVar6 == 0) {
          FUN_0002be70(*(undefined4 *)(PTR_DAT_004d9048 + 0x1a4),*piVar1,"bean-lp");
          *piVar1 = 0;
        }
        else if (*piVar1 != 0) goto LAB_000705e6;
      }
      local_2c = 1;
      local_4c = (undefined **)0x0;
      uVar5 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
      FUN_0000a298(&local_4c);
      local_2c = 0;
      local_4c = &PTR_LAB_0052bf38;
      local_48 = PTR_FUN_004d9058;
      iVar6 = FUN_0002bc94(uVar5,"bean-lp",0x3f800000,0x3f800000,&local_4c,0);
      *piVar1 = iVar6;
      FUN_0000a298(&local_4c);
      goto LAB_000705e6;
    }
  }
  if (iVar6 != 0) {
    FUN_0002be70(*(undefined4 *)(PTR_DAT_004d9048 + 0x1a4),iVar6,"bean-lp");
    *(undefined4 *)(param_1 + 0x40) = 0;
  }
LAB_000705e6:
  if (*(int *)puVar4 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00068560 — 00068560

```c

void FUN_00068560(int *param_1,undefined4 param_2)

{
  undefined *puVar1;
  undefined *puVar2;
  undefined4 uVar3;
  int iVar4;
  undefined4 uVar5;
  code *pcVar6;
  undefined1 auStack_48 [40];
  int local_20;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_20 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_0006c0e0(param_1 + 10);
  FUN_00069dbc(param_1);
  FUN_0006d53c(param_1 + 0x10,param_2);
  puVar2 = PTR_DAT_004d9048;
  uVar5 = *(undefined4 *)(PTR_DAT_004d9048 + 0x5c);
  uVar3 = FUN_002f69c4("NEW_MODE_complete",0x11);
  FUN_00027588(uVar5,"NEW_MODE_complete",uVar3,1,1,1);
  param_1[0x2b] = 3;
  iVar4 = *(int *)puVar2;
  if (iVar4 != 0) {
    param_1 = *(int **)(iVar4 + 4);
  }
  if (iVar4 != 0 && param_1 != (int *)0x0) {
    pcVar6 = *(code **)(*param_1 + 0x40);
    FUN_0030f7cc(auStack_48,"animate_out_pause");
    (*pcVar6)(param_1,auStack_48,1);
    FUN_0030f7e0(auStack_48);
  }
  if (*(int *)puVar1 != local_20) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00068618 — 00068618

```c

void FUN_00068618(int *param_1)

{
  undefined *puVar1;
  int iVar2;
  code *pcVar3;
  undefined1 auStack_44 [40];
  int local_1c;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_1c = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_0030a1d8();
  FUN_0030a7e4();
  FUN_0006c0e0(param_1 + 10);
  FUN_00069dbc(param_1);
  FUN_0006d51c(param_1 + 0x10);
  FUN_0007499c(param_1 + 0x1d);
  param_1[0x2b] = 4;
  iVar2 = *(int *)PTR_DAT_004d9048;
  if (iVar2 != 0) {
    param_1 = *(int **)(iVar2 + 4);
  }
  if (iVar2 != 0 && param_1 != (int *)0x0) {
    pcVar3 = *(code **)(*param_1 + 0x40);
    FUN_0030f7cc(auStack_44,"animate_out_pause");
    (*pcVar3)(param_1,auStack_44,1);
    FUN_0030f7e0(auStack_44);
  }
  if (*(int *)puVar1 != local_1c) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00047808 — 00047808

```c

void FUN_00047808(int param_1,undefined4 param_2,undefined1 *param_3)

{
  undefined *puVar1;
  undefined4 uVar2;
  int iVar3;
  _List_node_base *p_Var4;
  int iVar5;
  undefined4 *puVar6;
  undefined4 *puVar7;
  code *pcVar8;
  int *piVar9;
  undefined *local_c4;
  int local_c0;
  undefined1 *local_bc;
  undefined4 local_b8;
  undefined1 local_a4;
  undefined1 auStack_a0 [40];
  undefined1 auStack_78 [40];
  undefined4 local_50 [8];
  undefined1 local_30;
  undefined4 local_2c;
  undefined4 local_28;
  int local_24;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  if (*(int *)(param_1 + 0xb0) == 3) {
    uVar2 = FUN_0007505c();
    FUN_00075184(uVar2,"Music-menu");
    puVar1 = PTR_DAT_004d9048;
    FUN_000277e4(*(undefined4 *)(PTR_DAT_004d9048 + 0x5c));
    FUN_000277c8(*(undefined4 *)(puVar1 + 0x5c));
    *(undefined4 *)(param_1 + 0xb0) = 7;
    puVar1[0x17] = 1;
    puVar1[0x57] = 0;
    piVar9 = *(int **)(param_1 + 0xac);
    pcVar8 = *(code **)(*piVar9 + 0x40);
    FUN_0030f7cc(auStack_78,"animate_exit");
    (*pcVar8)(piVar9,auStack_78,1);
    FUN_0030f7e0(auStack_78);
    uVar2 = *(undefined4 *)(param_1 + 0xac);
    FUN_0030f7cc(auStack_a0,"whiteflash");
    iVar3 = FUN_0039725c(uVar2,auStack_a0);
    FUN_0030f7e0(auStack_a0);
    if (iVar3 != 0) {
      puVar7 = (undefined4 *)(iVar3 + 0x3cc);
      if (*(int *)(iVar3 + 0x3d4) == 0) {
        FUN_0003ca68(puVar7);
        *puVar7 = puVar7;
        *(undefined4 **)(iVar3 + 0x3d0) = puVar7;
      }
      else {
        puVar6 = (undefined4 *)*puVar7;
        if (puVar6 != puVar7) {
          puVar6[0xb] = *(int *)(iVar3 + 0x3d4);
          puVar6[0xc] = 2;
          *(int *)(iVar3 + 0x3d8) = *(int *)(iVar3 + 0x3d8) + 1;
          for (puVar6 = (undefined4 *)*puVar6; puVar6 != puVar7; puVar6 = (undefined4 *)*puVar6) {
            puVar6[0xb] = *(undefined4 *)(iVar3 + 0x3d4);
            puVar6[0xc] = 2;
            *(int *)(iVar3 + 0x3d8) = *(int *)(iVar3 + 0x3d8) + 1;
          }
        }
      }
      local_a4 = 1;
      local_c4 = (undefined *)0x0;
      FUN_0003c910(&local_c4);
      local_a4 = 0;
      local_c4 = &DAT_0052c688;
      local_b8 = 0;
      local_bc = &FUN_00047e90_1;
      local_30 = 1;
      local_50[0] = 0;
      local_c0 = param_1;
      (*(code *)PTR_FUN_0052c690)(&local_c4,local_50);
      local_2c = 0;
      local_28 = 0;
      p_Var4 = (_List_node_base *)FUN_0003c96c(puVar7,local_50);
      std::_List_node_base::hook(p_Var4);
      FUN_0003c910(local_50);
      if (*(int *)(iVar3 + 0x3d4) != 0) {
        iVar5 = *(int *)(iVar3 + 0x3d0);
        *(int *)(iVar5 + 0x2c) = *(int *)(iVar3 + 0x3d4);
        *(undefined4 *)(iVar5 + 0x30) = 1;
        *(int *)(iVar3 + 0x3d8) = *(int *)(iVar3 + 0x3d8) + 1;
      }
      FUN_0003c910(&local_c4);
    }
  }
  puVar1 = PTR____stack_chk_guard_004d9044;
  *param_3 = 1;
  if (*(int *)puVar1 == local_24) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

## FUN_000279f8 — 000279f8

```c

void FUN_000279f8(int param_1,undefined4 param_2,undefined4 param_3)

{
  _Rb_tree_node_base *p_Var1;
  float fVar2;
  undefined *puVar3;
  _Rb_tree_node_base *p_Var4;
  undefined4 uVar5;
  size_t sVar6;
  void *pvVar7;
  int iVar8;
  BaseAggregateType *pBVar9;
  code *pcVar10;
  undefined4 uVar11;
  _Rb_tree_node_base *p_Var12;
  int iVar13;
  int iVar14;
  _Rb_tree_node_base *p_Var15;
  float fVar16;
  undefined8 uVar17;
  undefined4 extraout_s1;
  float fVar18;
  undefined8 in_d1;
  undefined4 extraout_s3;
  undefined4 local_50 [8];
  undefined1 local_30;
  int local_2c;
  
  puVar3 = PTR____stack_chk_guard_004d9044;
  uVar5 = (undefined4)((ulonglong)in_d1 >> 0x20);
  p_Var12 = (_Rb_tree_node_base *)(param_1 + 0x26c);
  local_2c = *(int *)PTR____stack_chk_guard_004d9044;
  p_Var4 = *(_Rb_tree_node_base **)(param_1 + 0x274);
  p_Var15 = p_Var12;
  p_Var1 = p_Var4;
  fVar2 = DAT_00027c5c;
  fVar16 = DAT_00027c58;
  while (DAT_00027c5c = fVar2, p_Var4 != p_Var12) {
    if ((int)((uint)(*(float *)(p_Var4 + 0x94) < fVar16) << 0x1f) < 0) {
      p_Var15 = p_Var4;
      fVar16 = *(float *)(p_Var4 + 0x94);
    }
    p_Var4 = (_Rb_tree_node_base *)std::_Rb_tree_increment(p_Var4);
    p_Var1 = p_Var15;
    uVar5 = extraout_s3;
    fVar2 = DAT_00027c5c;
  }
  if (p_Var1 != p_Var12) {
    fVar18 = *(float *)(p_Var1 + 0x94);
    p_Var15 = p_Var1 + 0x10;
    uVar17 = FloatVectorSub(CONCAT44(uVar5,fVar18),CONCAT44(param_2,param_2),2,0x20);
    fVar16 = (float)uVar17;
    *(float *)(p_Var1 + 0x94) = fVar16;
    if ((fVar2 <= fVar18) && ((int)((uint)(fVar16 < fVar2) << 0x1f) < 0)) {
      if ((byte)((char)p_Var1[0x14] - 0x30U) < 10) {
        uVar5 = FUN_0000342c();
        FUN_00004694(uVar5,p_Var1 + 0x14);
        uVar11 = *(undefined4 *)(PTR_DAT_004d9048 + 0x5c);
        sVar6 = _strlen("total_achievements_unlocked");
        uVar5 = FUN_002f69c4("total_achievements_unlocked",sVar6);
        FUN_00027588(uVar11,"total_achievements_unlocked",uVar5,1,1,1);
      }
      else {
        uVar5 = FUN_0002ede8();
        FUN_00030094(uVar5,*(undefined4 *)p_Var15);
        uVar11 = *(undefined4 *)(PTR_DAT_004d9048 + 0x5c);
        FUN_0002ede8();
        uVar5 = FUN_00030070();
        FUN_000274bc(uVar11,"total_items_unlocked",uVar5,1,1);
      }
      uVar5 = FUN_0000342c();
      FUN_000041f4(uVar5,*(undefined4 *)p_Var15,param_3);
      fVar16 = *(float *)(p_Var1 + 0x94);
    }
    if (fVar16 <= 0.0) {
      pvVar7 = (void *)FUN_0002b1ac(param_1 + 0x280,p_Var15);
      _memcpy(pvVar7,p_Var1 + 0x14,0x84);
      pvVar7 = (void *)std::_Rb_tree_rebalance_for_erase(p_Var1,p_Var12);
      operator_delete(pvVar7);
      *(int *)(param_1 + 0x27c) = *(int *)(param_1 + 0x27c) + -1;
    }
  }
  iVar8 = FUN_00026140();
  if ((iVar8 == 1) && ((int)((uint)(DAT_00557a38 < 1.0) << 0x1f) < 0)) {
    uVar17 = FloatVectorAdd(CONCAT44(extraout_s1,DAT_00557a38),CONCAT44(param_2,param_2),2);
    DAT_00557a38 = (float)uVar17;
    if (1.0 <= DAT_00557a38) {
      FUN_003527fc();
      pBVar9 = Mortar::ServiceManager::GetServiceAggregate<Mortar::ILeaderboardService>();
      iVar8 = 0;
      iVar13 = param_1 + 0x4c;
      do {
        if (0 < *(int *)(iVar13 + iVar8 * 4)) {
          pcVar10 = *(code **)(*(int *)pBVar9 + 0x40);
          uVar5 = FUN_00352c04();
          uVar11 = FUN_00004640(iVar8,0xffffffff);
          iVar14 = *(int *)(iVar13 + iVar8 * 4);
          local_30 = 1;
          local_50[0] = 0;
          Mortar::
          StackAllocatedPointer<Mortar::Delegate1<void,Mortar::LeaderboardErrorType>::BaseDelegate,32ul>
          ::Delete();
          (*pcVar10)(pBVar9,uVar5,uVar11,iVar14,iVar14 >> 0x1f,local_50);
          Mortar::
          StackAllocatedPointer<Mortar::Delegate1<void,Mortar::LeaderboardErrorType>::BaseDelegate,32ul>
          ::Delete();
          *(undefined4 *)(iVar13 + iVar8 * 4) = 0;
        }
        iVar8 = iVar8 + 1;
      } while (iVar8 != 2);
      for (p_Var15 = *(_Rb_tree_node_base **)(param_1 + 0x28c);
          p_Var15 != (_Rb_tree_node_base *)(param_1 + 0x284);
          p_Var15 = (_Rb_tree_node_base *)std::_Rb_tree_increment(p_Var15)) {
        if ((byte)((char)p_Var15[0x14] - 0x30U) < 10) {
          uVar5 = FUN_0000342c();
          FUN_00004694(uVar5,p_Var15 + 0x14);
        }
      }
    }
  }
  if (*(int *)puVar3 != local_2c) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00047d58 — 00047d58

```c

void FUN_00047d58(int *param_1)

{
  undefined *puVar1;
  undefined *puVar2;
  int iVar3;
  code *pcVar4;
  int *unaff_r5;
  undefined1 auStack_4c [40];
  int local_24;
  
  puVar2 = PTR_DAT_004d9048;
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  iVar3 = *(int *)PTR_DAT_004d9048;
  if (iVar3 != 0) {
    unaff_r5 = *(int **)(iVar3 + 4);
  }
  if (iVar3 != 0 && unaff_r5 != (int *)0x0) {
    pcVar4 = *(code **)(*unaff_r5 + 0x40);
    FUN_0030f7cc(auStack_4c,"animate_out_pause");
    (*pcVar4)(unaff_r5,auStack_4c,1);
    FUN_0030f7e0(auStack_4c);
  }
  if (*(int *)(puVar2 + 0x1a4) != 0) {
    FUN_0002bdf4();
  }
  (**(code **)(*param_1 + 0x10))(param_1);
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0003fe58 — 0003fe58

```c

void FUN_0003fe58(int param_1)

{
  undefined1 uVar1;
  undefined4 uVar2;
  int iVar3;
  _List_node_base *p_Var4;
  int iVar5;
  int iVar6;
  int iVar7;
  undefined4 *puVar8;
  undefined4 *puVar9;
  int *piVar10;
  code *pcVar11;
  undefined1 auStack_2dc [40];
  undefined1 auStack_2b4 [40];
  undefined1 auStack_28c [40];
  undefined *local_264;
  int local_260;
  undefined1 *local_25c;
  undefined4 local_258;
  undefined1 local_244;
  undefined1 auStack_240 [40];
  undefined *local_218;
  int local_214;
  undefined1 *local_210;
  undefined4 local_20c;
  undefined1 local_1f8;
  undefined1 auStack_1f4 [40];
  undefined *local_1cc;
  int local_1c8;
  undefined1 *local_1c4;
  undefined4 local_1c0;
  undefined1 local_1ac;
  undefined1 auStack_1a8 [40];
  undefined *local_180;
  int local_17c;
  undefined1 *local_178;
  undefined4 local_174;
  undefined1 local_160;
  undefined1 auStack_15c [40];
  undefined *local_134;
  int local_130;
  undefined1 *local_12c;
  undefined4 local_128;
  undefined1 local_114;
  undefined1 auStack_110 [40];
  undefined *local_e8;
  int local_e4;
  undefined1 *local_e0;
  undefined4 local_dc;
  undefined1 local_c8;
  undefined1 auStack_c4 [40];
  undefined *local_9c;
  int local_98;
  undefined1 *local_94;
  undefined4 local_90;
  undefined1 local_7c;
  undefined1 auStack_78 [40];
  undefined4 local_50 [8];
  undefined1 local_30;
  undefined4 local_2c;
  undefined4 local_28;
  int local_24;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  uVar2 = FUN_0001cfb0(*(undefined4 *)(PTR_DAT_004d9048 + 0x654),"mainscreen",1);
  *(undefined4 *)(param_1 + 0xac) = uVar2;
  *(undefined1 *)(param_1 + 0xbe) = 0;
  FUN_0006783c();
  uVar2 = *(undefined4 *)(param_1 + 0xac);
  FUN_0030f7cc(auStack_78,"backgroundControl.quit");
  iVar3 = FUN_0039725c(uVar2,auStack_78);
  FUN_0030f7e0(auStack_78);
  if (iVar3 != 0) {
    puVar9 = (undefined4 *)(iVar3 + 0xb34);
    if (*(int *)(iVar3 + 0xb3c) == 0) {
      FUN_00022608(puVar9);
      *puVar9 = puVar9;
      *(undefined4 **)(iVar3 + 0xb38) = puVar9;
    }
    else {
      puVar8 = (undefined4 *)*puVar9;
      if (puVar8 != puVar9) {
        puVar8[0xb] = *(int *)(iVar3 + 0xb3c);
        puVar8[0xc] = 2;
        *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
        for (puVar8 = (undefined4 *)*puVar8; puVar8 != puVar9; puVar8 = (undefined4 *)*puVar8) {
          puVar8[0xb] = *(undefined4 *)(iVar3 + 0xb3c);
          puVar8[0xc] = 2;
          *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
        }
      }
    }
    local_7c = 1;
    local_9c = (undefined *)0x0;
    FUN_00022510(&local_9c);
    local_7c = 0;
    local_9c = &DAT_0052c628;
    local_90 = 0;
    local_94 = &FUN_000406c4_1;
    local_30 = 1;
    local_50[0] = 0;
    local_98 = param_1;
    (*(code *)PTR_FUN_0052c630)(&local_9c,local_50);
    local_2c = 0;
    local_28 = 0;
    p_Var4 = (_List_node_base *)FUN_0002256c(puVar9,local_50);
    std::_List_node_base::hook(p_Var4);
    FUN_00022510(local_50);
    if (*(int *)(iVar3 + 0xb3c) != 0) {
      iVar5 = *(int *)(iVar3 + 0xb38);
      *(int *)(iVar5 + 0x2c) = *(int *)(iVar3 + 0xb3c);
      *(undefined4 *)(iVar5 + 0x30) = 1;
      *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
    }
    FUN_00022510(&local_9c);
  }
  uVar2 = *(undefined4 *)(param_1 + 0xac);
  FUN_0030f7cc(auStack_c4,"backgroundControl.newgame.fruit");
  iVar3 = FUN_0039725c(uVar2,auStack_c4);
  FUN_0030f7e0(auStack_c4);
  if (iVar3 != 0) {
    FUN_0003ca90(iVar3 + 0x75c,*(undefined4 *)(iVar3 + 0x75c));
    puVar9 = (undefined4 *)(iVar3 + 0x76c);
    if (*(int *)(iVar3 + 0x774) == 0) {
      FUN_0003ca68(puVar9);
      *puVar9 = puVar9;
      *(undefined4 **)(iVar3 + 0x770) = puVar9;
    }
    else {
      puVar8 = (undefined4 *)*puVar9;
      if (puVar8 != puVar9) {
        puVar8[0xb] = *(int *)(iVar3 + 0x774);
        puVar8[0xc] = 2;
        *(int *)(iVar3 + 0x778) = *(int *)(iVar3 + 0x778) + 1;
        for (puVar8 = (undefined4 *)*puVar8; puVar8 != puVar9; puVar8 = (undefined4 *)*puVar8) {
          puVar8[0xb] = *(undefined4 *)(iVar3 + 0x774);
          puVar8[0xc] = 2;
          *(int *)(iVar3 + 0x778) = *(int *)(iVar3 + 0x778) + 1;
        }
      }
    }
    local_c8 = 1;
    local_e8 = (undefined *)0x0;
    FUN_0003c910(&local_e8);
    local_c8 = 0;
    local_e8 = &DAT_0052c608;
    local_dc = 0;
    local_e0 = &FUN_00040710_1;
    local_30 = 1;
    local_50[0] = 0;
    local_e4 = param_1;
    (*(code *)PTR_FUN_0052c610)(&local_e8,local_50);
    local_2c = 0;
    local_28 = 0;
    p_Var4 = (_List_node_base *)FUN_0003c96c(puVar9,local_50);
    std::_List_node_base::hook(p_Var4);
    FUN_0003c910(local_50);
    if (*(int *)(iVar3 + 0x774) != 0) {
      iVar5 = *(int *)(iVar3 + 0x770);
      *(int *)(iVar5 + 0x2c) = *(int *)(iVar3 + 0x774);
      *(undefined4 *)(iVar5 + 0x30) = 1;
      *(int *)(iVar3 + 0x778) = *(int *)(iVar3 + 0x778) + 1;
    }
    FUN_0003c910(&local_e8);
  }
  uVar2 = *(undefined4 *)(param_1 + 0xac);
  FUN_0030f7cc(auStack_110,"backgroundControl.moregames.fruit");
  iVar3 = FUN_0039725c(uVar2,auStack_110);
  FUN_0030f7e0(auStack_110);
  if (iVar3 != 0) {
    FUN_0003ca90(iVar3 + 0x75c,*(undefined4 *)(iVar3 + 0x75c));
    puVar9 = (undefined4 *)(iVar3 + 0x76c);
    if (*(int *)(iVar3 + 0x774) == 0) {
      FUN_0003ca68(puVar9);
      *puVar9 = puVar9;
      *(undefined4 **)(iVar3 + 0x770) = puVar9;
    }
    else {
      puVar8 = (undefined4 *)*puVar9;
      if (puVar8 != puVar9) {
        puVar8[0xb] = *(int *)(iVar3 + 0x774);
        puVar8[0xc] = 2;
        *(int *)(iVar3 + 0x778) = *(int *)(iVar3 + 0x778) + 1;
        for (puVar8 = (undefined4 *)*puVar8; puVar8 != puVar9; puVar8 = (undefined4 *)*puVar8) {
          puVar8[0xb] = *(undefined4 *)(iVar3 + 0x774);
          puVar8[0xc] = 2;
          *(int *)(iVar3 + 0x778) = *(int *)(iVar3 + 0x778) + 1;
        }
      }
    }
    local_114 = 1;
    local_134 = (undefined *)0x0;
    FUN_0003c910(&local_134);
    local_114 = 0;
    local_134 = &DAT_0052c608;
    local_128 = 0;
    local_12c = &FUN_0004079c_1;
    local_30 = 1;
    local_50[0] = 0;
    local_130 = param_1;
    (*(code *)PTR_FUN_0052c610)(&local_134,local_50);
    local_2c = 0;
    local_28 = 0;
    p_Var4 = (_List_node_base *)FUN_0003c96c(puVar9,local_50);
    std::_List_node_base::hook(p_Var4);
    FUN_0003c910(local_50);
    if (*(int *)(iVar3 + 0x774) != 0) {
      iVar5 = *(int *)(iVar3 + 0x770);
      *(int *)(iVar5 + 0x2c) = *(int *)(iVar3 + 0x774);
      *(undefined4 *)(iVar5 + 0x30) = 1;
      *(int *)(iVar3 + 0x778) = *(int *)(iVar3 + 0x778) + 1;
    }
    FUN_0003c910(&local_134);
  }
  uVar2 = *(undefined4 *)(param_1 + 0xac);
  FUN_0030f7cc(auStack_15c,"backgroundControl.extras.fruit");
  iVar3 = FUN_0039725c(uVar2,auStack_15c);
  FUN_0030f7e0(auStack_15c);
  if (iVar3 != 0) {
    FUN_0003ca90(iVar3 + 0x75c,*(undefined4 *)(iVar3 + 0x75c));
    puVar9 = (undefined4 *)(iVar3 + 0x76c);
    if (*(int *)(iVar3 + 0x774) == 0) {
      FUN_0003ca68(puVar9);
      *puVar9 = puVar9;
      *(undefined4 **)(iVar3 + 0x770) = puVar9;
    }
    else {
      puVar8 = (undefined4 *)*puVar9;
      if (puVar8 != puVar9) {
        puVar8[0xb] = *(int *)(iVar3 + 0x774);
        puVar8[0xc] = 2;
        *(int *)(iVar3 + 0x778) = *(int *)(iVar3 + 0x778) + 1;
        for (puVar8 = (undefined4 *)*puVar8; puVar8 != puVar9; puVar8 = (undefined4 *)*puVar8) {
          puVar8[0xb] = *(undefined4 *)(iVar3 + 0x774);
          puVar8[0xc] = 2;
          *(int *)(iVar3 + 0x778) = *(int *)(iVar3 + 0x778) + 1;
        }
      }
    }
    local_160 = 1;
    local_180 = (undefined *)0x0;
    FUN_0003c910(&local_180);
    local_160 = 0;
    local_180 = &DAT_0052c608;
    local_174 = 0;
    local_178 = &FUN_000407f0_1;
    local_30 = 1;
    local_50[0] = 0;
    local_17c = param_1;
    (*(code *)PTR_FUN_0052c610)(&local_180,local_50);
    local_2c = 0;
    local_28 = 0;
    p_Var4 = (_List_node_base *)FUN_0003c96c(puVar9,local_50);
    std::_List_node_base::hook(p_Var4);
    FUN_0003c910(local_50);
    if (*(int *)(iVar3 + 0x774) != 0) {
      iVar5 = *(int *)(iVar3 + 0x770);
      *(int *)(iVar5 + 0x2c) = *(int *)(iVar3 + 0x774);
      *(undefined4 *)(iVar5 + 0x30) = 1;
      *(int *)(iVar3 + 0x778) = *(int *)(iVar3 + 0x778) + 1;
    }
    FUN_0003c910(&local_180);
  }
  uVar2 = *(undefined4 *)(param_1 + 0xac);
  FUN_0030f7cc(auStack_1a8,"backgroundControl.privacy");
  iVar3 = FUN_0039725c(uVar2,auStack_1a8);
  if (iVar3 != 0) {
    iVar6 = *(int *)(iVar3 + 0x40);
    iVar5 = *(int *)(PTR_DAT_004d9150 + 0x28);
    if (*(int *)(iVar6 + 0x28) == iVar5) {
LAB_00040326:
      FUN_0030f7e0(auStack_1a8);
      puVar9 = (undefined4 *)(iVar3 + 0xb34);
      if (*(int *)(iVar3 + 0xb3c) == 0) {
        FUN_00022608(puVar9);
        *puVar9 = puVar9;
        *(undefined4 **)(iVar3 + 0xb38) = puVar9;
      }
      else {
        puVar8 = (undefined4 *)*puVar9;
        if (puVar8 != puVar9) {
          puVar8[0xb] = *(int *)(iVar3 + 0xb3c);
          puVar8[0xc] = 2;
          *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
          for (puVar8 = (undefined4 *)*puVar8; puVar8 != puVar9; puVar8 = (undefined4 *)*puVar8) {
            puVar8[0xb] = *(undefined4 *)(iVar3 + 0xb3c);
            puVar8[0xc] = 2;
            *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
          }
        }
      }
      local_1ac = 1;
      local_1cc = (undefined *)0x0;
      FUN_00022510(&local_1cc);
      local_1ac = 0;
      local_1cc = &DAT_0052c628;
      local_1c0 = 0;
      local_1c4 = &FUN_00040874_1;
      local_30 = 1;
      local_50[0] = 0;
      local_1c8 = param_1;
      (*(code *)PTR_FUN_0052c630)(&local_1cc,local_50);
      local_2c = 0;
      local_28 = 0;
      p_Var4 = (_List_node_base *)FUN_0002256c(puVar9,local_50);
      std::_List_node_base::hook(p_Var4);
      FUN_00022510(local_50);
      if (*(int *)(iVar3 + 0xb3c) != 0) {
        iVar5 = *(int *)(iVar3 + 0xb38);
        *(int *)(iVar5 + 0x2c) = *(int *)(iVar3 + 0xb3c);
        *(undefined4 *)(iVar5 + 0x30) = 1;
        *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
      }
      FUN_00022510(&local_1cc);
      goto LAB_000403fe;
    }
    iVar7 = 0;
    if (iVar6 != 0) {
      iVar7 = *(int *)(iVar6 + 0x2c);
    }
    if (iVar6 != 0 && iVar7 != 0) {
      do {
        iVar6 = *(int *)(iVar7 + 0x28);
        if (iVar6 != iVar5) {
          iVar7 = *(int *)(iVar7 + 0x2c);
        }
      } while (iVar6 != iVar5 && iVar7 != 0);
      if (iVar6 == iVar5) goto LAB_00040326;
    }
  }
  FUN_0030f7e0(auStack_1a8);
LAB_000403fe:
  uVar2 = *(undefined4 *)(param_1 + 0xac);
  FUN_0030f7cc(auStack_1f4,"backgroundControl.stash.fruit");
  iVar3 = FUN_0039725c(uVar2,auStack_1f4);
  FUN_0030f7e0(auStack_1f4);
  if (iVar3 != 0) {
    FUN_0003ca90(iVar3 + 0x75c,*(undefined4 *)(iVar3 + 0x75c));
    puVar9 = (undefined4 *)(iVar3 + 0x76c);
    if (*(int *)(iVar3 + 0x774) == 0) {
      FUN_0003ca68(puVar9);
      *puVar9 = puVar9;
      *(undefined4 **)(iVar3 + 0x770) = puVar9;
    }
    else {
      puVar8 = (undefined4 *)*puVar9;
      if (puVar8 != puVar9) {
        puVar8[0xb] = *(int *)(iVar3 + 0x774);
        puVar8[0xc] = 2;
        *(int *)(iVar3 + 0x778) = *(int *)(iVar3 + 0x778) + 1;
        for (puVar8 = (undefined4 *)*puVar8; puVar8 != puVar9; puVar8 = (undefined4 *)*puVar8) {
          puVar8[0xb] = *(undefined4 *)(iVar3 + 0x774);
          puVar8[0xc] = 2;
          *(int *)(iVar3 + 0x778) = *(int *)(iVar3 + 0x778) + 1;
        }
      }
    }
    local_1f8 = 1;
    local_218 = (undefined *)0x0;
    FUN_0003c910(&local_218);
    local_1f8 = 0;
    local_218 = &DAT_0052c608;
    local_20c = 0;
    local_210 = &FUN_00040890_1;
    local_30 = 1;
    local_50[0] = 0;
    local_214 = param_1;
    (*(code *)PTR_FUN_0052c610)(&local_218,local_50);
    local_2c = 0;
    local_28 = 0;
    p_Var4 = (_List_node_base *)FUN_0003c96c(puVar9,local_50);
    std::_List_node_base::hook(p_Var4);
    FUN_0003c910(local_50);
    if (*(int *)(iVar3 + 0x774) != 0) {
      iVar5 = *(int *)(iVar3 + 0x770);
      *(int *)(iVar5 + 0x2c) = *(int *)(iVar3 + 0x774);
      *(undefined4 *)(iVar5 + 0x30) = 1;
      *(int *)(iVar3 + 0x778) = *(int *)(iVar3 + 0x778) + 1;
    }
    FUN_0003c910(&local_218);
  }
  uVar2 = *(undefined4 *)(param_1 + 0xac);
  FUN_0030f7cc(auStack_240,"news.backing");
  iVar3 = FUN_0039725c(uVar2,auStack_240);
  FUN_0030f7e0(auStack_240);
  if (iVar3 != 0) {
    puVar9 = (undefined4 *)(iVar3 + 0xb34);
    if (*(int *)(iVar3 + 0xb3c) == 0) {
      FUN_00022608(puVar9);
      *puVar9 = puVar9;
      *(undefined4 **)(iVar3 + 0xb38) = puVar9;
    }
    else {
      puVar8 = (undefined4 *)*puVar9;
      if (puVar8 != puVar9) {
        puVar8[0xb] = *(int *)(iVar3 + 0xb3c);
        puVar8[0xc] = 2;
        *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
        for (puVar8 = (undefined4 *)*puVar8; puVar8 != puVar9; puVar8 = (undefined4 *)*puVar8) {
          puVar8[0xb] = *(undefined4 *)(iVar3 + 0xb3c);
          puVar8[0xc] = 2;
          *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
        }
      }
    }
    local_244 = 1;
    local_264 = (undefined *)0x0;
    FUN_00022510(&local_264);
    local_244 = 0;
    local_264 = &DAT_0052c628;
    local_258 = 0;
    local_25c = &FUN_000408d4_1;
    local_30 = 1;
    local_50[0] = 0;
    local_260 = param_1;
    (*(code *)PTR_FUN_0052c630)(&local_264,local_50);
    local_2c = 0;
    local_28 = 0;
    p_Var4 = (_List_node_base *)FUN_0002256c(puVar9,local_50);
    std::_List_node_base::hook(p_Var4);
    FUN_00022510(local_50);
    if (*(int *)(iVar3 + 0xb3c) != 0) {
      iVar5 = *(int *)(iVar3 + 0xb38);
      *(int *)(iVar5 + 0x2c) = *(int *)(iVar3 + 0xb3c);
      *(undefined4 *)(iVar5 + 0x30) = 1;
      *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
    }
    FUN_00022510(&local_264);
  }
  uVar2 = *(undefined4 *)(param_1 + 0xac);
  FUN_0030f7cc(auStack_28c,"news.new");
  iVar3 = FUN_0039725c(uVar2,auStack_28c);
  FUN_0030f7e0(auStack_28c);
  if (iVar3 != 0) {
    uVar1 = FUN_00067a40();
    local_50[0] = CONCAT31(local_50[0]._1_3_,uVar1);
    FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),local_50);
  }
  uVar2 = *(undefined4 *)(param_1 + 0xac);
  FUN_0030f7cc(auStack_2b4,"backgroundControl.new");
  iVar3 = FUN_0039725c(uVar2,auStack_2b4);
  FUN_0030f7e0(auStack_2b4);
  if (iVar3 != 0) {
    FUN_0002ede8();
    uVar1 = FUN_00030704();
    local_50[0] = CONCAT31(local_50[0]._1_3_,uVar1);
    FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),local_50);
  }
  piVar10 = *(int **)(param_1 + 0xac);
  pcVar11 = *(code **)(*piVar10 + 0x40);
  FUN_0030f7cc(auStack_2dc,"animate_in");
  (*pcVar11)(piVar10,auStack_2dc,1);
  FUN_0030f7e0(auStack_2dc);
  if (*(int *)PTR____stack_chk_guard_004d9044 == local_24) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

## FUN_00057000 — 00057000

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

## FUN_00047124 — 00047124

```c

void FUN_00047124(int param_1)

{
  undefined *puVar1;
  int *piVar2;
  int iVar3;
  _List_node_base *p_Var4;
  int iVar5;
  undefined4 *puVar6;
  undefined4 uVar7;
  undefined4 *puVar8;
  code *pcVar9;
  undefined *local_240;
  int local_23c;
  undefined1 *local_238;
  undefined4 local_234;
  undefined1 local_220;
  undefined1 auStack_21c [40];
  undefined *local_1f4;
  int local_1f0;
  undefined1 *local_1ec;
  undefined4 local_1e8;
  undefined1 local_1d4;
  undefined1 auStack_1d0 [40];
  undefined *local_1a8;
  int local_1a4;
  undefined1 *local_1a0;
  undefined4 local_19c;
  undefined1 local_188;
  undefined1 auStack_184 [40];
  undefined *local_15c;
  int local_158;
  undefined1 *local_154;
  undefined4 local_150;
  undefined1 local_13c;
  undefined1 auStack_138 [40];
  undefined *local_110;
  int local_10c;
  undefined1 *local_108;
  undefined4 local_104;
  undefined1 local_f0;
  undefined1 auStack_ec [40];
  undefined *local_c4;
  int local_c0;
  undefined1 *local_bc;
  undefined4 local_b8;
  undefined1 local_a4;
  undefined1 auStack_a0 [40];
  undefined1 auStack_78 [40];
  undefined4 local_50 [8];
  undefined1 local_30;
  undefined4 local_2c;
  undefined4 local_28;
  int local_24;
  
  puVar1 = PTR_DAT_004d9048;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0xb0) = 3;
  piVar2 = (int *)FUN_0001cfb0(*(undefined4 *)(puVar1 + 0x654),"pause",1);
  *(int **)(param_1 + 0xac) = piVar2;
  pcVar9 = *(code **)(*piVar2 + 0x40);
  FUN_0030f7cc(auStack_78,"animate_in");
  (*pcVar9)(piVar2,auStack_78,1);
  FUN_0030f7e0(auStack_78);
  uVar7 = *(undefined4 *)(param_1 + 0xac);
  FUN_0030f7cc(auStack_a0,"animation_wrapper.quit");
  iVar3 = FUN_0039725c(uVar7,auStack_a0);
  FUN_0030f7e0(auStack_a0);
  if (iVar3 != 0) {
    puVar8 = (undefined4 *)(iVar3 + 0xb34);
    if (*(int *)(iVar3 + 0xb3c) == 0) {
      FUN_00022608(puVar8);
      *puVar8 = puVar8;
      *(undefined4 **)(iVar3 + 0xb38) = puVar8;
    }
    else {
      puVar6 = (undefined4 *)*puVar8;
      if (puVar6 != puVar8) {
        puVar6[0xb] = *(int *)(iVar3 + 0xb3c);
        puVar6[0xc] = 2;
        *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
        for (puVar6 = (undefined4 *)*puVar6; puVar6 != puVar8; puVar6 = (undefined4 *)*puVar6) {
          puVar6[0xb] = *(undefined4 *)(iVar3 + 0xb3c);
          puVar6[0xc] = 2;
          *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
        }
      }
    }
    local_a4 = 1;
    local_c4 = (undefined *)0x0;
    FUN_00022510(&local_c4);
    local_a4 = 0;
    local_c4 = &DAT_0052c6c8;
    local_b8 = 0;
    local_bc = &FUN_00047808_1;
    local_30 = 1;
    local_50[0] = 0;
    local_c0 = param_1;
    (*(code *)PTR_FUN_0052c6d0)(&local_c4,local_50);
    local_2c = 0;
    local_28 = 0;
    p_Var4 = (_List_node_base *)FUN_0002256c(puVar8,local_50);
    std::_List_node_base::hook(p_Var4);
    FUN_00022510(local_50);
    if (*(int *)(iVar3 + 0xb3c) != 0) {
      iVar5 = *(int *)(iVar3 + 0xb38);
      *(int *)(iVar5 + 0x2c) = *(int *)(iVar3 + 0xb3c);
      *(undefined4 *)(iVar5 + 0x30) = 1;
      *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
    }
    FUN_00022510(&local_c4);
  }
  uVar7 = *(undefined4 *)(param_1 + 0xac);
  FUN_0030f7cc(auStack_ec,"animation_wrapper.continue");
  iVar3 = FUN_0039725c(uVar7,auStack_ec);
  FUN_0030f7e0(auStack_ec);
  if (iVar3 != 0) {
    puVar8 = (undefined4 *)(iVar3 + 0xb34);
    if (*(int *)(iVar3 + 0xb3c) == 0) {
      FUN_00022608(puVar8);
      *puVar8 = puVar8;
      *(undefined4 **)(iVar3 + 0xb38) = puVar8;
    }
    else {
      puVar6 = (undefined4 *)*puVar8;
      if (puVar6 != puVar8) {
        puVar6[0xb] = *(int *)(iVar3 + 0xb3c);
        puVar6[0xc] = 2;
        *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
        for (puVar6 = (undefined4 *)*puVar6; puVar6 != puVar8; puVar6 = (undefined4 *)*puVar6) {
          puVar6[0xb] = *(undefined4 *)(iVar3 + 0xb3c);
          puVar6[0xc] = 2;
          *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
        }
      }
    }
    local_f0 = 1;
    local_110 = (undefined *)0x0;
    FUN_00022510(&local_110);
    local_f0 = 0;
    local_110 = &DAT_0052c6c8;
    local_104 = 0;
    local_108 = &FUN_000479c0_1;
    local_30 = 1;
    local_50[0] = 0;
    local_10c = param_1;
    (*(code *)PTR_FUN_0052c6d0)(&local_110,local_50);
    local_2c = 0;
    local_28 = 0;
    p_Var4 = (_List_node_base *)FUN_0002256c(puVar8,local_50);
    std::_List_node_base::hook(p_Var4);
    FUN_00022510(local_50);
    if (*(int *)(iVar3 + 0xb3c) != 0) {
      iVar5 = *(int *)(iVar3 + 0xb38);
      *(int *)(iVar5 + 0x2c) = *(int *)(iVar3 + 0xb3c);
      *(undefined4 *)(iVar5 + 0x30) = 1;
      *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
    }
    FUN_00022510(&local_110);
  }
  uVar7 = *(undefined4 *)(param_1 + 0xac);
  FUN_0030f7cc(auStack_138,"animation_wrapper.retry");
  iVar3 = FUN_0039725c(uVar7,auStack_138);
  FUN_0030f7e0(auStack_138);
  if (iVar3 != 0) {
    puVar8 = (undefined4 *)(iVar3 + 0xb34);
    if (*(int *)(iVar3 + 0xb3c) == 0) {
      FUN_00022608(puVar8);
      *puVar8 = puVar8;
      *(undefined4 **)(iVar3 + 0xb38) = puVar8;
    }
    else {
      puVar6 = (undefined4 *)*puVar8;
      if (puVar6 != puVar8) {
        puVar6[0xb] = *(int *)(iVar3 + 0xb3c);
        puVar6[0xc] = 2;
        *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
        for (puVar6 = (undefined4 *)*puVar6; puVar6 != puVar8; puVar6 = (undefined4 *)*puVar6) {
          puVar6[0xb] = *(undefined4 *)(iVar3 + 0xb3c);
          puVar6[0xc] = 2;
          *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
        }
      }
    }
    local_13c = 1;
    local_15c = (undefined *)0x0;
    FUN_00022510(&local_15c);
    local_13c = 0;
    local_15c = &DAT_0052c6c8;
    local_150 = 0;
    local_154 = &FUN_00047b60_1;
    local_30 = 1;
    local_50[0] = 0;
    local_158 = param_1;
    (*(code *)PTR_FUN_0052c6d0)(&local_15c,local_50);
    local_2c = 0;
    local_28 = 0;
    p_Var4 = (_List_node_base *)FUN_0002256c(puVar8,local_50);
    std::_List_node_base::hook(p_Var4);
    FUN_00022510(local_50);
    if (*(int *)(iVar3 + 0xb3c) != 0) {
      iVar5 = *(int *)(iVar3 + 0xb38);
      *(int *)(iVar5 + 0x2c) = *(int *)(iVar3 + 0xb3c);
      *(undefined4 *)(iVar5 + 0x30) = 1;
      *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
    }
    FUN_00022510(&local_15c);
  }
  uVar7 = *(undefined4 *)(param_1 + 0xac);
  FUN_0030f7cc(auStack_184,"animation_wrapper.audio.sound_toggle");
  iVar3 = FUN_0039725c(uVar7,auStack_184);
  FUN_0030f7e0(auStack_184);
  if (iVar3 != 0) {
    FUN_0003ca90(iVar3 + 0x740,*(undefined4 *)(iVar3 + 0x740));
    puVar8 = (undefined4 *)(iVar3 + 0x750);
    if (*(int *)(iVar3 + 0x758) == 0) {
      FUN_00048478(puVar8);
      *puVar8 = puVar8;
      *(undefined4 **)(iVar3 + 0x754) = puVar8;
    }
    else {
      puVar6 = (undefined4 *)*puVar8;
      if (puVar6 != puVar8) {
        puVar6[0xb] = *(int *)(iVar3 + 0x758);
        puVar6[0xc] = 2;
        *(int *)(iVar3 + 0x75c) = *(int *)(iVar3 + 0x75c) + 1;
        for (puVar6 = (undefined4 *)*puVar6; puVar6 != puVar8; puVar6 = (undefined4 *)*puVar6) {
          puVar6[0xb] = *(undefined4 *)(iVar3 + 0x758);
          puVar6[0xc] = 2;
          *(int *)(iVar3 + 0x75c) = *(int *)(iVar3 + 0x75c) + 1;
        }
      }
    }
    local_188 = 1;
    local_1a8 = (undefined *)0x0;
    FUN_00048328(&local_1a8);
    local_188 = 0;
    local_1a8 = &DAT_0052c6a8;
    local_19c = 0;
    local_1a0 = &LAB_00047c7c_1;
    local_30 = 1;
    local_50[0] = 0;
    local_1a4 = param_1;
    (*(code *)PTR_FUN_0052c6b0)(&local_1a8,local_50);
    local_2c = 0;
    local_28 = 0;
    p_Var4 = (_List_node_base *)FUN_00048384(puVar8,local_50);
    std::_List_node_base::hook(p_Var4);
    FUN_00048328(local_50);
    if (*(int *)(iVar3 + 0x758) != 0) {
      iVar5 = *(int *)(iVar3 + 0x754);
      *(int *)(iVar5 + 0x2c) = *(int *)(iVar3 + 0x758);
      *(undefined4 *)(iVar5 + 0x30) = 1;
      *(int *)(iVar3 + 0x75c) = *(int *)(iVar3 + 0x75c) + 1;
    }
    FUN_00048328(&local_1a8);
    local_50[0] = CONCAT31(local_50[0]._1_3_,PTR_DAT_004d9048[0x54]);
    FUN_0001da28(*(undefined4 *)(iVar3 + 0x7a8),local_50);
  }
  uVar7 = *(undefined4 *)(param_1 + 0xac);
  FUN_0030f7cc(auStack_1d0,"animation_wrapper.audio.music_toggle");
  iVar3 = FUN_0039725c(uVar7,auStack_1d0);
  FUN_0030f7e0(auStack_1d0);
  if (iVar3 != 0) {
    FUN_0003ca90(iVar3 + 0x740,*(undefined4 *)(iVar3 + 0x740));
    puVar8 = (undefined4 *)(iVar3 + 0x750);
    if (*(int *)(iVar3 + 0x758) == 0) {
      FUN_00048478(puVar8);
      *puVar8 = puVar8;
      *(undefined4 **)(iVar3 + 0x754) = puVar8;
    }
    else {
      puVar6 = (undefined4 *)*puVar8;
      if (puVar6 != puVar8) {
        puVar6[0xb] = *(int *)(iVar3 + 0x758);
        puVar6[0xc] = 2;
        *(int *)(iVar3 + 0x75c) = *(int *)(iVar3 + 0x75c) + 1;
        for (puVar6 = (undefined4 *)*puVar6; puVar6 != puVar8; puVar6 = (undefined4 *)*puVar6) {
          puVar6[0xb] = *(undefined4 *)(iVar3 + 0x758);
          puVar6[0xc] = 2;
          *(int *)(iVar3 + 0x75c) = *(int *)(iVar3 + 0x75c) + 1;
        }
      }
    }
    local_1d4 = 1;
    local_1f4 = (undefined *)0x0;
    FUN_00048328(&local_1f4);
    local_1d4 = 0;
    local_1f4 = &DAT_0052c6a8;
    local_1e8 = 0;
    local_1ec = &LAB_00047cc0_1;
    local_30 = 1;
    local_50[0] = 0;
    local_1f0 = param_1;
    (*(code *)PTR_FUN_0052c6b0)(&local_1f4,local_50);
    local_2c = 0;
    local_28 = 0;
    p_Var4 = (_List_node_base *)FUN_00048384(puVar8,local_50);
    std::_List_node_base::hook(p_Var4);
    FUN_00048328(local_50);
    if (*(int *)(iVar3 + 0x758) != 0) {
      iVar5 = *(int *)(iVar3 + 0x754);
      *(int *)(iVar5 + 0x2c) = *(int *)(iVar3 + 0x758);
      *(undefined4 *)(iVar5 + 0x30) = 1;
      *(int *)(iVar3 + 0x75c) = *(int *)(iVar3 + 0x75c) + 1;
    }
    FUN_00048328(&local_1f4);
    local_50[0] = CONCAT31(local_50[0]._1_3_,PTR_DAT_004d9048[0x55]);
    FUN_0001da28(*(undefined4 *)(iVar3 + 0x7a8),local_50);
  }
  uVar7 = *(undefined4 *)(param_1 + 0xac);
  FUN_0030f7cc(auStack_21c,"animation_wrapper.audio.vo_toggle");
  iVar3 = FUN_0039725c(uVar7,auStack_21c);
  FUN_0030f7e0(auStack_21c);
  if (iVar3 != 0) {
    FUN_0003ca90(iVar3 + 0x740,*(undefined4 *)(iVar3 + 0x740));
    puVar8 = (undefined4 *)(iVar3 + 0x750);
    if (*(int *)(iVar3 + 0x758) == 0) {
      FUN_00048478(puVar8);
      *puVar8 = puVar8;
      *(undefined4 **)(iVar3 + 0x754) = puVar8;
    }
    else {
      puVar6 = (undefined4 *)*puVar8;
      if (puVar6 != puVar8) {
        puVar6[0xb] = *(int *)(iVar3 + 0x758);
        puVar6[0xc] = 2;
        *(int *)(iVar3 + 0x75c) = *(int *)(iVar3 + 0x75c) + 1;
        for (puVar6 = (undefined4 *)*puVar6; puVar6 != puVar8; puVar6 = (undefined4 *)*puVar6) {
          puVar6[0xb] = *(undefined4 *)(iVar3 + 0x758);
          puVar6[0xc] = 2;
          *(int *)(iVar3 + 0x75c) = *(int *)(iVar3 + 0x75c) + 1;
        }
      }
    }
    local_220 = 1;
    local_240 = (undefined *)0x0;
    FUN_00048328(&local_240);
    local_220 = 0;
    local_240 = &DAT_0052c6a8;
    local_234 = 0;
    local_238 = &LAB_00047cd4_1;
    local_30 = 1;
    local_50[0] = 0;
    local_23c = param_1;
    (*(code *)PTR_FUN_0052c6b0)(&local_240,local_50);
    local_2c = 0;
    local_28 = 0;
    p_Var4 = (_List_node_base *)FUN_00048384(puVar8,local_50);
    std::_List_node_base::hook(p_Var4);
    FUN_00048328(local_50);
    if (*(int *)(iVar3 + 0x758) != 0) {
      iVar5 = *(int *)(iVar3 + 0x754);
      *(int *)(iVar5 + 0x2c) = *(int *)(iVar3 + 0x758);
      *(undefined4 *)(iVar5 + 0x30) = 1;
      *(int *)(iVar3 + 0x75c) = *(int *)(iVar3 + 0x75c) + 1;
    }
    FUN_00048328(&local_240);
    local_50[0] = CONCAT31(local_50[0]._1_3_,PTR_DAT_004d9048[0x56]);
    FUN_0001da28(*(undefined4 *)(iVar3 + 0x7a8),local_50);
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 == local_24) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

## FUN_0006f178 — 0006f178

```c

bool FUN_0006f178(int *param_1,undefined4 param_2,int param_3)

{
  char *pcVar1;
  size_t sVar2;
  int iVar3;
  void *pvVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  undefined4 local_50;
  undefined4 local_4c;
  undefined4 uStack_48;
  float local_44;
  int local_40;
  undefined4 local_3c;
  void *local_38;
  undefined4 uStack_34;
  
  *(undefined1 *)(param_1 + 3) = 0;
  param_1[1] = param_3;
  pcVar1 = (char *)FUN_0030c660(param_2,"name");
  if (pcVar1 == (char *)0x0) {
    param_1[2] = 0;
  }
  else {
    sVar2 = _strlen(pcVar1);
    iVar3 = FUN_002f69c4(pcVar1,sVar2);
    param_1[2] = iVar3;
  }
  FUN_0030c6c0(param_2,"mustSelect",param_1);
  iVar3 = FUN_0030c328(param_2,"challenge");
  if (iVar3 != 0) {
    uVar8 = 0;
    uVar9 = *(undefined4 *)((undefined1  [16])0x0 + (undefined1  [16])0xc);
    iVar6 = 0;
    do {
      pvVar4 = operator_new(0x104);
      FUN_00062618();
      *(int *)((int)pvVar4 + 0x54) = param_1[1];
      FUN_00062698(pvVar4,iVar3);
      local_38 = pvVar4;
      FUN_0006f5b8(param_1 + 4,&local_38);
      *(bool *)((int)pvVar4 + 0x59) = 0 < *param_1;
      local_3c = 0;
      uStack_48 = 0x14;
      local_44 = 0.2;
      local_50 = 0x14;
      local_4c = uVar8;
      local_40 = uVar9;
      FUN_0030c6c0(iVar3,"chanceSelect",&local_50);
      local_4c = local_50;
      iVar5 = FUN_0030c718(iVar3,"chanceRegrowth",&local_38);
      if (iVar5 == 0) {
        local_44 = (float)(double)CONCAT44(uStack_34,local_38);
      }
      iVar7 = *(int *)(PTR_DAT_004d9048 + 0x5c);
      local_40 = iVar6;
      iVar5 = FUN_0006f558(iVar7 + 0x154,(int)pvVar4 + 0x40);
      if (iVar5 == iVar7 + 0x158) {
        uStack_48 = 0x14;
        local_3c = 0;
      }
      else {
        uStack_48 = *(undefined4 *)(iVar5 + 0x14);
        local_3c = *(undefined4 *)(iVar5 + 0x18);
      }
      FUN_00039bc0(param_1 + 7,&local_4c);
      iVar3 = FUN_0030c3a0(iVar3,"challenge");
      iVar6 = iVar6 + 1;
    } while (iVar3 != 0);
  }
  iVar3 = param_1[4];
  iVar6 = param_1[5];
  if (iVar6 != iVar3) {
    FUN_0006ebdc(param_1);
  }
  return iVar6 != iVar3;
}


```

## FUN_000773b4 — 000773b4

```c

void FUN_000773b4(int *param_1,int param_2)

{
  int *piVar1;
  longlong lVar2;
  longlong lVar3;
  float fVar4;
  undefined *puVar5;
  undefined *puVar6;
  undefined *puVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  undefined1 *puVar11;
  uint uVar12;
  uint uVar13;
  int iVar14;
  int iVar15;
  undefined4 *puVar16;
  uint uVar17;
  int iVar18;
  uint uVar19;
  uint *puVar20;
  uint uVar21;
  int *piVar22;
  int *piVar23;
  int iVar25;
  undefined4 extraout_s1;
  undefined8 uVar26;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  int iVar27;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  undefined8 uVar28;
  undefined4 extraout_s3_01;
  undefined4 extraout_s5;
  undefined8 uVar29;
  undefined4 extraout_s5_00;
  undefined8 uVar30;
  undefined4 local_8c;
  undefined4 local_88;
  undefined4 local_84;
  undefined4 local_80;
  undefined **local_7c;
  undefined *local_78;
  undefined1 local_5c;
  undefined **local_58;
  undefined *local_54;
  undefined1 local_38;
  int local_34;
  uint *puVar24;
  
  puVar5 = PTR____stack_chk_guard_004d9044;
  local_34 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_0004eba4(param_1);
  *param_1 = (int)&PTR_FUN_00077a6c_1_00538de8;
  param_1[0x44] = 0;
  iVar25 = DAT_0052bfe0;
  param_1[0x33] = DAT_0052bfe0;
  iVar27 = DAT_0052bfe4;
  param_1[0x34] = DAT_0052bfe4;
  iVar14 = DAT_0052bfe8;
  param_1[0x35] = DAT_0052bfe8;
  param_1[0x30] = iVar25;
  param_1[0x31] = iVar27;
  param_1[0x32] = iVar14;
  param_1[0x2d] = iVar25;
  param_1[0x2e] = iVar27;
  param_1[0x2f] = iVar14;
  param_1[0x36] = 0x3f800000;
  param_1[0x37] = 0;
  param_1[0x24] = 1;
  uVar8 = FUN_003010b8(iVar25,0);
  uVar9 = FUN_003010d0(0);
  uVar26 = CONCAT44(extraout_s1,DAT_000777fc);
  *(undefined4 *)(param_1[0x1f] + 0x104) = 0x3f800000;
  uVar26 = FloatVectorMult(CONCAT44(extraout_s3,*(undefined4 *)(*(int *)(param_2 + 0x38) + 0x14)),
                           uVar26,2,0x20);
  *(int *)(*(int *)(param_2 + 0x38) + 0x14) = (int)uVar26;
  param_1[0xd] = 0x80;
  *(undefined4 *)(param_2 + 0xd8) = 0x41200000;
  (**(code **)(*param_1 + 0x40))((int)uVar26,param_1,"SLICE!",0,0);
  uVar29 = FloatVectorMult(CONCAT44(extraout_s5,DAT_0052bf80),0x3f0000003f000000,2,0x20);
  uVar28 = FloatVectorMult(CONCAT44(extraout_s3_00,DAT_0052bf84),0x3f0000003f000000,2,0x20);
  uVar26 = FloatVectorMult(CONCAT44(extraout_s1_00,DAT_0052bf88),0x3f0000003f000000,2,0x20);
  param_1[8] = (int)uVar29;
  param_1[9] = (int)uVar28;
  param_1[10] = (int)uVar26;
  iVar25 = *(int *)(param_2 + 0x10);
  iVar27 = *(int *)(param_2 + 0x14);
  param_1[2] = iVar25;
  param_1[3] = iVar27;
  param_1[4] = 0;
  param_1[0xb] = -0x80000000;
  param_1[0x29] = 0x3f800000;
  param_1[0x2a] = DAT_0052bfe0;
  param_1[0x2b] = DAT_0052bfe4;
  param_1[0x2c] = DAT_0052bfe8;
  uVar10 = FUN_000251a8(iVar25);
  uVar28 = CONCAT44(uVar10,uVar10);
  uVar26 = CONCAT44(extraout_s1_01,DAT_000778b8);
  uVar30 = FloatVectorMult(CONCAT44(uVar8,uVar8),uVar28,2,0x20);
  uVar29 = FloatVectorMult(CONCAT44(uVar9,uVar9),uVar28,2,0x20);
  uVar30 = FloatVectorMult(uVar30,uVar26,2,0x20);
  uVar28 = FloatVectorMult(uVar28,0,2,0x20);
  uVar29 = FloatVectorMult(uVar29,uVar26,2,0x20);
  uVar30 = FloatVectorMult(uVar30,0x3f2000003f200000,2,0x20);
  uVar28 = FloatVectorMult(uVar28,uVar26,2,0x20);
  uVar29 = FloatVectorMult(uVar29,0x3f2000003f200000,2,0x20);
  uVar26 = FloatVectorAdd(CONCAT44(extraout_s3_01,param_1[2]),uVar30,2);
  uVar28 = FloatVectorMult(uVar28,0x3f2000003f200000,2,0x20);
  param_1[2] = (int)uVar26;
  uVar26 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar26 >> 0x20),param_1[3]),uVar29,2);
  param_1[3] = (int)uVar26;
  uVar26 = FloatVectorAdd(uVar28,CONCAT44((int)((ulonglong)uVar26 >> 0x20),param_1[4]),2);
  param_1[4] = (int)uVar26;
  puVar11 = (undefined1 *)FUN_00052f80((int)uVar26);
  *puVar11 = 1;
  FUN_000137e8(0);
  FUN_000096c4();
  FUN_00009718();
  puVar6 = PTR_DAT_004d9048;
  local_38 = 1;
  local_58 = (undefined **)0x0;
  uVar8 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
  FUN_0000a298(&local_58);
  puVar7 = PTR_FUN_004d9058;
  local_38 = 0;
  local_58 = &PTR_LAB_0052bf38;
  local_54 = PTR_FUN_004d9058;
  FUN_0002bc94(uVar8,"pome-rampdown",0x3e000000,0x3f800000,&local_58,0);
  FUN_0000a298(&local_58);
  local_5c = 1;
  local_7c = (undefined **)0x0;
  uVar8 = *(undefined4 *)(puVar6 + 0x1a4);
  FUN_0000a298(&local_7c);
  local_5c = 0;
  local_7c = &PTR_LAB_0052bf38;
  local_78 = puVar7;
  iVar25 = FUN_0002bc94(uVar8,"pome-lp",0x3f800000,0,&local_7c,0);
  param_1[0x38] = iVar25;
  FUN_0000a298(&local_7c);
  param_1[0x28] = 0x47c35000;
  param_1[0x21] = 0;
  FUN_00025164();
  puVar6 = PTR_DAT_004d9050;
  puVar20 = (uint *)(PTR_DAT_004d9050 + 8);
  uVar12 = *(uint *)PTR_DAT_004d9050;
  piVar22 = (int *)(PTR_DAT_004d9050 + 4);
  piVar23 = (int *)(PTR_DAT_004d9050 + 0xc);
  puVar24 = (uint *)(PTR_DAT_004d9050 + 0x10);
  piVar1 = (int *)(PTR_DAT_004d9050 + 0x14);
  lVar2 = (ulonglong)uVar12 * (ulonglong)*puVar20;
  uVar13 = (uint)lVar2;
  *(uint *)PTR_DAT_004d9050 = uVar13 + *puVar24;
  *(uint *)(puVar6 + 4) =
       *piVar22 * *puVar20 + uVar12 * *piVar23 + (int)((ulonglong)lVar2 >> 0x20) +
       *piVar1 + (uint)CARRY4(uVar13,*puVar24);
  FUN_00025164();
  FUN_00025164();
  iVar25 = FUN_00052f80();
  uVar12 = *(uint *)(iVar25 + 8);
  lVar2 = (ulonglong)uVar12 * (ulonglong)*(uint *)(iVar25 + 0x10);
  uVar13 = (uint)lVar2;
  *(uint *)(iVar25 + 8) = uVar13 + *(uint *)(iVar25 + 0x18);
  *(uint *)(iVar25 + 0xc) =
       *(int *)(iVar25 + 0xc) * *(uint *)(iVar25 + 0x10) +
       uVar12 * *(int *)(iVar25 + 0x14) + (int)((ulonglong)lVar2 >> 0x20) +
       *(int *)(iVar25 + 0x1c) + (uint)CARRY4(uVar13,*(uint *)(iVar25 + 0x18));
  iVar25 = FUN_00052f80();
  uVar12 = *(uint *)(iVar25 + 8);
  lVar2 = (ulonglong)uVar12 * (ulonglong)*(uint *)(iVar25 + 0x10);
  uVar13 = (uint)lVar2;
  *(uint *)(iVar25 + 8) = uVar13 + *(uint *)(iVar25 + 0x18);
  *(uint *)(iVar25 + 0xc) =
       *(int *)(iVar25 + 0xc) * *(uint *)(iVar25 + 0x10) +
       uVar12 * *(int *)(iVar25 + 0x14) + (int)((ulonglong)lVar2 >> 0x20) +
       *(int *)(iVar25 + 0x1c) + (uint)CARRY4(uVar13,*(uint *)(iVar25 + 0x18));
  iVar25 = FUN_00052f80();
  uVar12 = *(uint *)(iVar25 + 8);
  lVar2 = (ulonglong)uVar12 * (ulonglong)*(uint *)(iVar25 + 0x10);
  uVar13 = (uint)lVar2;
  *(uint *)(iVar25 + 8) = uVar13 + *(uint *)(iVar25 + 0x18);
  *(uint *)(iVar25 + 0xc) =
       *(int *)(iVar25 + 0xc) * *(uint *)(iVar25 + 0x10) +
       uVar12 * *(int *)(iVar25 + 0x14) + (int)((ulonglong)lVar2 >> 0x20) +
       *(int *)(iVar25 + 0x1c) + (uint)CARRY4(uVar13,*(uint *)(iVar25 + 0x18));
  local_8c = 0;
  local_88 = 0;
  local_84 = 0;
  local_80 = 0x3f800000;
  FUN_000147c8(&local_8c,0x3f800000,0,0,0x3ffc);
  fVar4 = DAT_000778bc;
  uVar13 = *(uint *)(puVar6 + 8);
  uVar12 = *(uint *)(puVar6 + 0x10);
  lVar2 = (ulonglong)*(uint *)puVar6 * (ulonglong)uVar13;
  uVar21 = (uint)lVar2;
  uVar17 = uVar21 + uVar12;
  lVar3 = (ulonglong)uVar17 * (ulonglong)uVar13;
  uVar19 = (uint)lVar3;
  uVar21 = *(int *)(puVar6 + 4) * uVar13 +
           *(uint *)puVar6 * *(int *)(puVar6 + 0xc) + (int)((ulonglong)lVar2 >> 0x20) +
           *(int *)(puVar6 + 0x14) + (uint)CARRY4(uVar21,uVar12);
  uVar9 = (undefined4)((ulonglong)uVar21 * 0x7ffff >> 0x20);
  uVar13 = *(int *)(puVar6 + 0x14) +
           uVar21 * uVar13 + uVar17 * *(int *)(puVar6 + 0xc) + (int)((ulonglong)lVar3 >> 0x20) +
           (uint)CARRY4(uVar12,uVar19);
  uVar8 = (undefined4)((ulonglong)uVar13 * 0x7ffff >> 0x20);
  *(uint *)puVar6 = uVar12 + uVar19;
  *(uint *)(puVar6 + 4) = uVar13;
  uVar26 = FixedToFP(CONCAT44(uVar9,uVar9),0,1,0,0x20);
  iVar25 = 0x18c;
  iVar27 = 0x134;
  iVar14 = 0x15c;
  FixedToFP(CONCAT44(uVar8,uVar8),0,1,0,0x20);
  uVar26 = FloatVectorMult(CONCAT44(extraout_s5_00,(float)uVar26 / fVar4),0x4040000040400000,2,0x20)
  ;
  uVar26 = FloatVectorAdd(uVar26,0,2);
  uVar26 = FloatVectorNeg(uVar26,2,2);
  do {
    iVar18 = param_1[0x1f];
    iVar15 = iVar18 + iVar25;
    *(undefined4 *)(iVar15 + -0x20) = DAT_0052c000;
    *(undefined4 *)(iVar15 + -0x1c) = DAT_0052c004;
    *(undefined4 *)(iVar15 + -0x18) = DAT_0052c008;
    *(undefined4 *)(iVar15 + -0x14) = DAT_0052bf00;
    *(undefined4 *)(iVar15 + -0x10) = DAT_0052bf04;
    *(undefined4 *)(iVar15 + -0xc) = DAT_0052bf08;
    *(undefined4 *)(iVar15 + -8) = DAT_0052ce60;
    *(undefined4 *)(iVar15 + -4) = DAT_0052ce64;
    *(undefined4 *)(iVar18 + iVar25) = DAT_0052ce68;
    puVar16 = (undefined4 *)(iVar18 + iVar14);
    iVar25 = iVar25 + 0x24;
    *puVar16 = (int)uVar26;
    iVar14 = iVar14 + 0xc;
    puVar16[-2] = 0;
    puVar16[-1] = 0x40c00000;
    *(undefined4 *)(iVar18 + iVar27) = local_8c;
    iVar18 = iVar18 + iVar27;
    iVar27 = iVar27 + 0x10;
    *(undefined4 *)(iVar18 + 4) = local_88;
    *(undefined4 *)(iVar18 + 8) = local_84;
    *(undefined4 *)(iVar18 + 0xc) = local_80;
  } while (iVar25 != 0x1d4);
  FUN_000778c0(param_1);
  if (*(int *)puVar5 != local_34) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail(*(int *)puVar5);
  }
  return;
}


```

## FUN_00037600 — 00037600

```c

void FUN_00037600(int *param_1)

{
  float fVar1;
  float fVar2;
  undefined *puVar3;
  undefined4 *puVar4;
  undefined4 uVar5;
  int iVar6;
  undefined4 uVar7;
  void *pvVar8;
  float fVar9;
  uint uVar10;
  undefined4 *puVar11;
  char *pcVar12;
  char *pcVar13;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  undefined4 extraout_s3_01;
  undefined4 extraout_s3_02;
  undefined4 extraout_s5;
  undefined8 uVar14;
  undefined4 extraout_s5_00;
  undefined4 extraout_s7;
  undefined4 extraout_s7_00;
  undefined4 extraout_s9;
  undefined4 extraout_s11;
  undefined8 uVar15;
  undefined8 uVar16;
  undefined8 uVar17;
  
  if (*param_1 != param_1[1]) {
    puVar4 = (undefined4 *)(*param_1 + 0x1c);
    do {
      uVar5 = FUN_00033ca0();
      iVar6 = FUN_000359cc(uVar5,puVar4[-7]);
      if (iVar6 == 1) {
        uVar5 = FUN_00033ca0();
        iVar6 = FUN_00035a08(uVar5,puVar4[-7],0,0);
        puVar4[-6] = iVar6;
        if (iVar6 != 0) {
          uVar5 = FUN_00025164();
          uVar7 = FUN_000251a8();
          uVar17 = FloatVectorMult(CONCAT44(extraout_s5,*puVar4),0,2,0x20);
          uVar15 = FloatVectorMult(CONCAT44(uVar5,uVar5),CONCAT44(extraout_s7,puVar4[-2]),2,0x20);
          uVar16 = FloatVectorMult(CONCAT44(uVar7,uVar7),CONCAT44(extraout_s3,puVar4[-1]),2,0x20);
          uVar17 = FloatVectorAdd(uVar17,CONCAT44(extraout_s1,puVar4[-3]),2);
          uVar14 = FloatVectorAdd(uVar15,CONCAT44(extraout_s5,puVar4[-5]),2);
          uVar15 = FloatVectorAdd(uVar16,CONCAT44(extraout_s3,puVar4[-4]),2);
          *(int *)(iVar6 + 8) = (int)uVar14;
          *(int *)(iVar6 + 0xc) = (int)uVar15;
          *(int *)(iVar6 + 0x10) = (int)uVar17;
          iVar6 = FUN_00033d28((int)uVar17,*(undefined4 *)(puVar4[-6] + 0x40));
          if (iVar6 == 1) {
            puVar4[-6] = 0;
          }
        }
      }
      puVar11 = puVar4 + 1;
      puVar4 = puVar4 + 8;
    } while (puVar11 != (undefined4 *)param_1[1]);
  }
  puVar3 = PTR_DAT_004d9048;
  fVar2 = DAT_000378bc;
  fVar1 = DAT_000378b8;
  if (param_1[3] != param_1[4]) {
    pcVar13 = (char *)(param_1[3] + 0x7c);
    do {
      if (*(int *)(pcVar13 + -0x6c) == 2) {
        pvVar8 = operator_new(0x98);
        FUN_00051688();
        *(int *)((int)pvVar8 + 0x94) = param_1[0x11];
      }
      else if (*(int *)(pcVar13 + -0x6c) == 1) {
        pvVar8 = operator_new(0x9c);
        FUN_00048a34();
        *(int *)((int)pvVar8 + 0x88) = param_1[0x11];
      }
      else {
        pvVar8 = operator_new(0x7c);
        FUN_0003ee58();
      }
      *(void **)(pcVar13 + -0x74) = pvVar8;
      if (*(int *)(pcVar13 + -0x7c) == 0) {
        FUN_00039920(pcVar13 + -0x7c);
      }
      FUN_00026e98((int)pvVar8 + 0x74,*(undefined4 *)(pcVar13 + -0x7c));
      iVar6 = *(int *)(pcVar13 + -0x74);
      uVar5 = FUN_00025164();
      uVar7 = FUN_000251a8();
      uVar15 = FloatVectorMult(CONCAT44(uVar5,uVar5),
                               CONCAT44(extraout_s9,*(undefined4 *)(pcVar13 + -0x5c)),2,0x20);
      uVar17 = FloatVectorMult(CONCAT44(uVar7,uVar7),
                               CONCAT44(extraout_s11,*(undefined4 *)(pcVar13 + -0x58)),2,0x20);
      uVar15 = FloatVectorAdd(uVar15,CONCAT44(extraout_s9,*(undefined4 *)(pcVar13 + -0x68)),2);
      uVar5 = *(undefined4 *)(pcVar13 + -0x2c);
      uVar17 = FloatVectorAdd(uVar17,CONCAT44(extraout_s9,*(undefined4 *)(pcVar13 + -100)),2);
      uVar15 = FloatVectorAdd(uVar15,CONCAT44(extraout_s5_00,*(undefined4 *)(pcVar13 + -0x34)),2);
      uVar14 = FloatVectorMult(CONCAT44(extraout_s7_00,*(undefined4 *)(pcVar13 + -0x54)),0,2,0x20);
      uVar17 = FloatVectorAdd(uVar17,CONCAT44(extraout_s3_00,*(undefined4 *)(pcVar13 + -0x30)),2);
      uVar14 = FloatVectorAdd(uVar14,CONCAT44(extraout_s7_00,*(undefined4 *)(pcVar13 + -0x60)),2);
      *(int *)(iVar6 + 8) = (int)uVar15;
      *(int *)(iVar6 + 0xc) = (int)uVar17;
      uVar17 = FloatVectorAdd(uVar14,CONCAT44(extraout_s1_00,uVar5),2);
      *(int *)(iVar6 + 0x10) = (int)uVar17;
      iVar6 = *(int *)(pcVar13 + -0x74);
      *(char *)(iVar6 + 0x5f) = pcVar13[-5];
      *(char *)(iVar6 + 0x5e) = pcVar13[-6];
      *(char *)(iVar6 + 0x5d) = pcVar13[-7];
      *(char *)(iVar6 + 0x5c) = pcVar13[-8];
      iVar6 = *(int *)(pcVar13 + -0x74);
      *(undefined4 *)(iVar6 + 0x34) = *(undefined4 *)(pcVar13 + -0x50);
      uVar10 = *(uint *)(pcVar13 + -4);
      if ((uVar10 & 1) == 0) {
        *(undefined4 *)(iVar6 + 0x20) = *(undefined4 *)(pcVar13 + -0x14);
        *(undefined4 *)(iVar6 + 0x24) = *(undefined4 *)(pcVar13 + -0x10);
        uVar5 = *(undefined4 *)(pcVar13 + -0xc);
      }
      else {
        *(undefined4 *)(iVar6 + 0x20) = DAT_0052bfe0;
        *(undefined4 *)(iVar6 + 0x24) = DAT_0052bfe4;
        uVar5 = DAT_0052bfe8;
      }
      *(undefined4 *)(iVar6 + 0x28) = uVar5;
      if (*pcVar13 != '\0') {
        fVar9 = (float)FUN_00025164();
        uVar17 = FloatVectorMult(CONCAT44(fVar9,fVar9 / fVar1),
                                 CONCAT44(extraout_s3_01,
                                          *(undefined4 *)(*(int *)(pcVar13 + -0x74) + 0x20)),2,0x20)
        ;
        *(int *)(*(int *)(pcVar13 + -0x74) + 0x20) = (int)uVar17;
        fVar9 = (float)FUN_000251a8((int)uVar17);
        iVar6 = *(int *)(pcVar13 + -0x74);
        uVar17 = FloatVectorMult(CONCAT44(fVar9,fVar9 / fVar2),
                                 CONCAT44(extraout_s3_02,*(undefined4 *)(iVar6 + 0x24)),2,0x20);
        *(int *)(iVar6 + 0x24) = (int)uVar17;
        uVar10 = *(uint *)(pcVar13 + -4);
      }
      if ((uVar10 & 2) != 0) {
        *(undefined1 *)(iVar6 + 0x5f) = 0;
      }
      if (*(int *)(puVar3 + 0x4c) == 0) {
        pcVar13[-0x70] = '\0';
      }
      else {
        FUN_0003e9e8(*(int *)(puVar3 + 0x4c),*(undefined4 *)(pcVar13 + -0x74),0);
      }
      pcVar12 = pcVar13 + 4;
      pcVar13 = pcVar13 + 0x80;
    } while (pcVar12 != (char *)param_1[4]);
  }
  return;
}


```

## FUN_000568f4 — 000568f4

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

## FUN_0006ebdc — 0006ebdc

```c

void FUN_0006ebdc(int param_1)

{
  undefined *puVar1;
  int iVar2;
  uint uVar3;
  int iVar4;
  
  uVar3 = 0;
  *(undefined1 *)(param_1 + 0xc) = 0;
  puVar1 = PTR_DAT_004d9048;
  iVar2 = *(int *)(param_1 + 0x10);
  if (*(int *)(param_1 + 0x14) != iVar2) {
    do {
      iVar4 = *(int *)(iVar2 + uVar3 * 4);
      iVar2 = FUN_0002b2a8(*(int *)(puVar1 + 0x5c) + 0x154,iVar4 + 0x40);
      if ((*(char *)(iVar4 + 0x58) != '\0') && (*(int *)(iVar2 + 8) == 0)) {
        *(undefined1 *)(param_1 + 0xc) = 1;
        return;
      }
      iVar2 = *(int *)(param_1 + 0x10);
      uVar3 = uVar3 + 1;
    } while (uVar3 < (uint)(*(int *)(param_1 + 0x14) - iVar2 >> 2));
  }
  return;
}


```

## FUN_0006ec3c — 0006ec3c

```c

undefined4 FUN_0006ec3c(int param_1)

{
  undefined *puVar1;
  int iVar2;
  undefined4 *puVar3;
  uint uVar4;
  uint uVar5;
  undefined4 uVar6;
  int iVar7;
  uint uVar8;
  int iVar9;
  
  puVar1 = PTR_DAT_004d9048;
  iVar2 = *(int *)(param_1 + 0x10);
  if (*(int *)(param_1 + 0x14) != iVar2) {
    uVar8 = 0;
    iVar9 = 4;
    do {
      iVar7 = *(int *)(iVar2 + uVar8 * 4);
      iVar2 = FUN_0002b2a8(*(int *)(puVar1 + 0x5c) + 0x154,iVar7 + 0x40);
      if ((*(char *)(iVar7 + 0x58) != '\0') && (*(int *)(iVar2 + 8) == 0)) {
        if ((int)uVar8 < 0) break;
        uVar4 = (*(int *)(param_1 + 0x20) - *(int *)(param_1 + 0x1c) >> 2) * -0x33333333;
        if ((uVar4 < uVar8 || uVar4 - uVar8 == 0) ||
           (*(int *)(*(int *)(param_1 + 0x1c) + iVar9 * 4) == 0)) {
          FUN_000399a0(param_1 + 0x1c);
          FUN_00039a28(param_1 + 0x1c,uVar8);
          goto LAB_0006ecd8;
        }
      }
      iVar2 = *(int *)(param_1 + 0x10);
      iVar9 = iVar9 + 5;
      uVar8 = uVar8 + 1;
    } while (uVar8 < (uint)(*(int *)(param_1 + 0x14) - iVar2 >> 2));
  }
  FUN_000399a0(param_1 + 0x1c);
  uVar8 = FUN_00039b24(param_1 + 0x1c);
LAB_0006ecd8:
  puVar1 = PTR_DAT_004d9048;
  iVar2 = *(int *)(param_1 + 0x10);
  if (*(int *)(param_1 + 0x14) != iVar2) {
    iVar9 = 0;
    uVar4 = 0;
    do {
      puVar3 = (undefined4 *)
               FUN_0002b2a8(*(int *)(puVar1 + 0x5c) + 0x154,*(int *)(iVar2 + uVar4 * 4) + 0x40);
      if (((int)uVar4 < 0) ||
         (uVar5 = (*(int *)(param_1 + 0x20) - *(int *)(param_1 + 0x1c) >> 2) * -0x33333333,
         uVar5 < uVar4 || uVar5 - uVar4 == 0)) {
        uVar6 = 0;
        *puVar3 = 0;
      }
      else {
        iVar2 = *(int *)(param_1 + 0x1c) + iVar9 * 4;
        *puVar3 = *(undefined4 *)(iVar2 + 4);
        uVar6 = *(undefined4 *)(iVar2 + 0x10);
      }
      puVar3[1] = uVar6;
      iVar9 = iVar9 + 5;
      iVar2 = *(int *)(param_1 + 0x10);
      uVar4 = uVar4 + 1;
    } while (uVar4 < (uint)(*(int *)(param_1 + 0x14) - iVar2 >> 2));
  }
  FUN_0006ebdc(param_1);
  return *(undefined4 *)(*(int *)(param_1 + 0x10) + uVar8 * 4);
}


```

## FUN_0006ed78 — 0006ed78

```c

void FUN_0006ed78(int param_1)

{
  undefined *puVar1;
  int iVar2;
  undefined4 *puVar3;
  uint uVar4;
  undefined4 uVar5;
  int iVar6;
  uint uVar7;
  uint uVar8;
  int iVar9;
  undefined4 local_24;
  
  iVar9 = param_1 + 0x40;
  FUN_000399a0(iVar9);
  iVar2 = *(int *)(param_1 + 0x6c);
  if (*(int *)(param_1 + 0x70) != iVar2) {
    uVar8 = 0;
    iVar6 = 4;
    do {
      if (*(char *)(*(int *)(iVar2 + uVar8 * 4) + 0xc) != '\0') {
        if ((int)uVar8 < 0) break;
        uVar7 = (*(int *)(param_1 + 0x44) - *(int *)(param_1 + 0x40) >> 2) * -0x33333333;
        if ((uVar7 < uVar8 || uVar7 - uVar8 == 0) ||
           (*(int *)(*(int *)(param_1 + 0x40) + iVar6 * 4) == 0)) {
          FUN_00039a28(iVar9,uVar8);
          goto LAB_0006ede2;
        }
      }
      uVar8 = uVar8 + 1;
      iVar6 = iVar6 + 5;
    } while (uVar8 < (uint)(*(int *)(param_1 + 0x70) - iVar2 >> 2));
  }
  uVar8 = FUN_00039b24(iVar9);
LAB_0006ede2:
  puVar1 = PTR_DAT_004d9048;
  iVar2 = *(int *)(param_1 + 0x70);
  if (iVar2 != *(int *)(param_1 + 0x6c)) {
    iVar9 = 0;
    uVar7 = 0;
    iVar2 = *(int *)(param_1 + 0x6c);
    do {
      local_24 = *(undefined4 *)(*(int *)(iVar2 + uVar7 * 4) + 8);
      puVar3 = (undefined4 *)FUN_0002b2a8(*(int *)(puVar1 + 0x5c) + 0x13c,&local_24);
      if (((int)uVar7 < 0) ||
         (uVar4 = (*(int *)(param_1 + 0x44) - *(int *)(param_1 + 0x40) >> 2) * -0x33333333,
         uVar4 < uVar7 || uVar4 - uVar7 == 0)) {
        uVar5 = 0;
        *puVar3 = 0;
      }
      else {
        iVar2 = *(int *)(param_1 + 0x40) + iVar9 * 4;
        *puVar3 = *(undefined4 *)(iVar2 + 4);
        uVar5 = *(undefined4 *)(iVar2 + 0x10);
      }
      puVar3[1] = uVar5;
      iVar9 = iVar9 + 5;
      iVar2 = *(int *)(param_1 + 0x6c);
      uVar7 = uVar7 + 1;
    } while (uVar7 < (uint)(*(int *)(param_1 + 0x70) - iVar2 >> 2));
  }
  FUN_0006ec3c(*(undefined4 *)(iVar2 + uVar8 * 4));
  return;
}


```

## FUN_00066ddc — 00066ddc

```c

void FUN_00066ddc(int param_1)

{
  undefined1 *puVar1;
  undefined4 uVar2;
  int iVar3;
  _List_node_base *p_Var4;
  int iVar5;
  undefined4 *puVar6;
  undefined4 *puVar7;
  int *piVar8;
  code *pcVar9;
  bool bVar10;
  undefined *local_220;
  int local_21c;
  undefined1 *local_218;
  undefined4 local_214;
  undefined1 local_200;
  undefined1 auStack_1fc [40];
  undefined1 auStack_1d4 [40];
  undefined1 auStack_1ac [40];
  undefined1 auStack_184 [40];
  undefined1 auStack_15c [40];
  undefined *local_134;
  int local_130;
  undefined1 *local_12c;
  undefined4 local_128;
  undefined1 local_114;
  undefined1 auStack_110 [40];
  undefined *local_e8;
  int local_e4;
  undefined1 *local_e0;
  undefined4 local_dc;
  undefined1 local_c8;
  undefined1 auStack_c4 [40];
  undefined *local_9c;
  int local_98;
  undefined1 *local_94;
  undefined4 local_90;
  undefined1 local_7c;
  undefined1 auStack_78 [40];
  int local_50 [8];
  undefined1 local_30;
  undefined4 local_2c;
  undefined4 local_28;
  int local_24;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_000673d0();
  if (DAT_005f9514 != (int *)0x0) {
    (**(code **)(*DAT_005f9514 + 0xc))();
    uVar2 = FUN_000674d4();
    FUN_0030f7f4(&DAT_005f9568,uVar2);
  }
  if (*(int *)(PTR_DAT_004d9048 + 4) == 1) {
    uVar2 = FUN_0001cfb0(*(undefined4 *)(PTR_DAT_004d9048 + 0x654),"newsscreenJetpack",1);
    *(undefined4 *)(param_1 + 0xac) = uVar2;
    FUN_0030f7cc(auStack_78,"@buy");
    iVar3 = FUN_0039725c(uVar2,auStack_78);
    FUN_0030f7e0(auStack_78);
    if (iVar3 == 0) goto LAB_00067298;
    local_50[0] = CONCAT31(local_50[0]._1_3_,1);
    FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),local_50);
    puVar7 = (undefined4 *)(iVar3 + 0xb34);
    if (*(int *)(iVar3 + 0xb3c) == 0) {
      FUN_00022608(puVar7);
      *puVar7 = puVar7;
      *(undefined4 **)(iVar3 + 0xb38) = puVar7;
    }
    else {
      puVar6 = (undefined4 *)*puVar7;
      if (puVar6 != puVar7) {
        puVar6[0xb] = *(int *)(iVar3 + 0xb3c);
        puVar6[0xc] = 2;
        *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
        for (puVar6 = (undefined4 *)*puVar6; puVar6 != puVar7; puVar6 = (undefined4 *)*puVar6) {
          puVar6[0xb] = *(undefined4 *)(iVar3 + 0xb3c);
          puVar6[0xc] = 2;
          *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
        }
      }
    }
    local_7c = 1;
    local_9c = (undefined *)0x0;
    FUN_00022510(&local_9c);
    local_7c = 0;
    local_9c = &DAT_0052cba8;
    local_90 = 0;
    local_94 = &FUN_000675dc_1;
    local_30 = 1;
    local_50[0] = 0;
    local_98 = param_1;
    (*(code *)PTR_FUN_0052cbb0)(&local_9c,local_50);
    local_2c = 0;
    local_28 = 0;
    p_Var4 = (_List_node_base *)FUN_0002256c(puVar7,local_50);
    std::_List_node_base::hook(p_Var4);
    FUN_00022510(local_50);
    if (*(int *)(iVar3 + 0xb3c) != 0) {
      iVar5 = *(int *)(iVar3 + 0xb38);
      *(int *)(iVar5 + 0x2c) = *(int *)(iVar3 + 0xb3c);
      *(undefined4 *)(iVar5 + 0x30) = 1;
      *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
    }
    puVar1 = &stack0x00000168;
  }
  else {
    if (*(int *)(PTR_DAT_004d9048 + 4) != 2) {
      uVar2 = FUN_0001cfb0(*(undefined4 *)(PTR_DAT_004d9048 + 0x654),"newsscreen",1);
      *(undefined4 *)(param_1 + 0xac) = uVar2;
      FUN_0030f7cc(auStack_110,"@website");
      iVar3 = FUN_0039725c(uVar2,auStack_110);
      FUN_0030f7e0(auStack_110);
      if (iVar3 != 0) {
        if (DAT_005f9540 == 1) {
          local_50[0] = (uint)local_50[0]._1_3_ << 8;
          FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),local_50);
        }
        else {
          local_50[0] = CONCAT31(local_50[0]._1_3_,1);
          FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),local_50);
          puVar7 = (undefined4 *)(iVar3 + 0xb34);
          if (*(int *)(iVar3 + 0xb3c) == 0) {
            FUN_00022608(puVar7);
            *puVar7 = puVar7;
            *(undefined4 **)(iVar3 + 0xb38) = puVar7;
          }
          else {
            puVar6 = (undefined4 *)*puVar7;
            if (puVar6 != puVar7) {
              puVar6[0xb] = *(int *)(iVar3 + 0xb3c);
              puVar6[0xc] = 2;
              *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
              for (puVar6 = (undefined4 *)*puVar6; puVar6 != puVar7; puVar6 = (undefined4 *)*puVar6)
              {
                puVar6[0xb] = *(undefined4 *)(iVar3 + 0xb3c);
                puVar6[0xc] = 2;
                *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
              }
            }
          }
          local_114 = 1;
          local_134 = (undefined *)0x0;
          FUN_00022510(&local_134);
          local_114 = 0;
          local_134 = &DAT_0052cba8;
          local_128 = 0;
          local_12c = &FUN_0006761c_1;
          local_30 = 1;
          local_50[0] = 0;
          local_130 = param_1;
          (*(code *)PTR_FUN_0052cbb0)(&local_134,local_50);
          local_2c = 0;
          local_28 = 0;
          p_Var4 = (_List_node_base *)FUN_0002256c(puVar7,local_50);
          std::_List_node_base::hook(p_Var4);
          FUN_00022510(local_50);
          if (*(int *)(iVar3 + 0xb3c) != 0) {
            iVar5 = *(int *)(iVar3 + 0xb38);
            *(int *)(iVar5 + 0x2c) = *(int *)(iVar3 + 0xb3c);
            *(undefined4 *)(iVar5 + 0x30) = 1;
            *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
          }
          FUN_00022510(&local_134);
        }
      }
      uVar2 = *(undefined4 *)(param_1 + 0xac);
      FUN_0030f7cc(auStack_15c,"@text2");
      iVar3 = FUN_0039725c(uVar2,auStack_15c);
      FUN_0030f7e0(auStack_15c);
      if (iVar3 != 0) {
        if (DAT_005f9568 == 1) {
          uVar2 = FUN_00038844("FN_PUSS_NEWS_FEED",0);
          FUN_0030f7cc(auStack_184,uVar2);
          FUN_00022950(*(undefined4 *)(iVar3 + 0x7dc),auStack_184);
          FUN_0030f7e0(auStack_184);
        }
        else {
          FUN_00022950(*(undefined4 *)(iVar3 + 0x7dc),&DAT_005f9568);
        }
      }
      uVar2 = *(undefined4 *)(param_1 + 0xac);
      FUN_0030f7cc(auStack_1ac,"@text3");
      iVar3 = FUN_0039725c(uVar2,auStack_1ac);
      FUN_0030f7e0(auStack_1ac);
      if (iVar3 != 0) {
        bVar10 = DAT_005f9540 != 1;
        if (bVar10) {
          FUN_00022950(*(undefined4 *)(iVar3 + 0x7dc),&DAT_005f9540);
        }
        local_50[0] = CONCAT31(local_50[0]._1_3_,bVar10);
        FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),local_50);
      }
      goto LAB_00067298;
    }
    uVar2 = FUN_0001cfb0(*(undefined4 *)(PTR_DAT_004d9048 + 0x654),"newsscreenFruitNinja",1);
    *(undefined4 *)(param_1 + 0xac) = uVar2;
    FUN_0030f7cc(auStack_c4,"@buy");
    iVar3 = FUN_0039725c(uVar2,auStack_c4);
    FUN_0030f7e0(auStack_c4);
    if (iVar3 == 0) goto LAB_00067298;
    local_50[0] = CONCAT31(local_50[0]._1_3_,1);
    FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),local_50);
    puVar7 = (undefined4 *)(iVar3 + 0xb34);
    if (*(int *)(iVar3 + 0xb3c) == 0) {
      FUN_00022608(puVar7);
      *puVar7 = puVar7;
      *(undefined4 **)(iVar3 + 0xb38) = puVar7;
    }
    else {
      puVar6 = (undefined4 *)*puVar7;
      if (puVar6 != puVar7) {
        puVar6[0xb] = *(int *)(iVar3 + 0xb3c);
        puVar6[0xc] = 2;
        *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
        for (puVar6 = (undefined4 *)*puVar6; puVar6 != puVar7; puVar6 = (undefined4 *)*puVar6) {
          puVar6[0xb] = *(undefined4 *)(iVar3 + 0xb3c);
          puVar6[0xc] = 2;
          *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
        }
      }
    }
    local_c8 = 1;
    local_e8 = (undefined *)0x0;
    FUN_00022510(&local_e8);
    local_c8 = 0;
    local_e8 = &DAT_0052cba8;
    local_dc = 0;
    local_e0 = &FUN_000675fc_1;
    local_30 = 1;
    local_50[0] = 0;
    local_e4 = param_1;
    (*(code *)PTR_FUN_0052cbb0)(&local_e8,local_50);
    local_2c = 0;
    local_28 = 0;
    p_Var4 = (_List_node_base *)FUN_0002256c(puVar7,local_50);
    std::_List_node_base::hook(p_Var4);
    FUN_00022510(local_50);
    if (*(int *)(iVar3 + 0xb3c) != 0) {
      iVar5 = *(int *)(iVar3 + 0xb38);
      *(int *)(iVar5 + 0x2c) = *(int *)(iVar3 + 0xb3c);
      *(undefined4 *)(iVar5 + 0x30) = 1;
      *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
    }
    puVar1 = &stack0x0000011c;
  }
  FUN_00022510(puVar1 + -0x204);
LAB_00067298:
  piVar8 = *(int **)(param_1 + 0xac);
  pcVar9 = *(code **)(*piVar8 + 0x40);
  FUN_0030f7cc(auStack_1d4,"animate_in");
  (*pcVar9)(piVar8,auStack_1d4,1);
  FUN_0030f7e0(auStack_1d4);
  uVar2 = *(undefined4 *)(param_1 + 0xac);
  FUN_0030f7cc(auStack_1fc,"back");
  iVar3 = FUN_0039725c(uVar2,auStack_1fc);
  FUN_0030f7e0(auStack_1fc);
  if (iVar3 != 0) {
    puVar7 = (undefined4 *)(iVar3 + 0xb34);
    if (*(int *)(iVar3 + 0xb3c) == 0) {
      FUN_00022608(puVar7);
      *puVar7 = puVar7;
      *(undefined4 **)(iVar3 + 0xb38) = puVar7;
    }
    else {
      puVar6 = (undefined4 *)*puVar7;
      if (puVar6 != puVar7) {
        puVar6[0xb] = *(int *)(iVar3 + 0xb3c);
        puVar6[0xc] = 2;
        *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
        for (puVar6 = (undefined4 *)*puVar6; puVar6 != puVar7; puVar6 = (undefined4 *)*puVar6) {
          puVar6[0xb] = *(undefined4 *)(iVar3 + 0xb3c);
          puVar6[0xc] = 2;
          *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
        }
      }
    }
    local_200 = 1;
    local_220 = (undefined *)0x0;
    FUN_00022510(&local_220);
    local_200 = 0;
    local_220 = &DAT_0052cba8;
    local_214 = 0;
    local_218 = &FUN_00067640_1;
    local_30 = 1;
    local_50[0] = 0;
    local_21c = param_1;
    (*(code *)PTR_FUN_0052cbb0)(&local_220,local_50);
    local_2c = 0;
    local_28 = 0;
    p_Var4 = (_List_node_base *)FUN_0002256c(puVar7,local_50);
    std::_List_node_base::hook(p_Var4);
    FUN_00022510(local_50);
    if (*(int *)(iVar3 + 0xb3c) != 0) {
      iVar5 = *(int *)(iVar3 + 0xb38);
      *(int *)(iVar5 + 0x2c) = *(int *)(iVar3 + 0xb3c);
      *(undefined4 *)(iVar5 + 0x30) = 1;
      *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
    }
    FUN_00022510(&local_220);
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 == local_24) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

## FUN_0006ee88 — 0006ee88

```c

void FUN_0006ee88(int param_1)

{
  undefined *puVar1;
  undefined4 **ppuVar2;
  ulong uVar3;
  undefined4 *puVar4;
  void *pvVar5;
  undefined4 uVar6;
  int iVar7;
  int iVar8;
  undefined4 ***pppuVar9;
  undefined4 *puVar10;
  uint uVar11;
  int iVar12;
  undefined4 ***pppuVar13;
  undefined4 local_30;
  undefined4 local_2c;
  undefined4 **local_28;
  undefined4 **local_24;
  
  if (*(void **)(param_1 + 0x78) != (void *)0x0) {
    operator_delete(*(void **)(param_1 + 0x78));
    *(undefined4 *)(param_1 + 0x78) = 0;
  }
  uVar11 = *(uint *)(param_1 + 0x7c);
  uVar3 = (ulong)((ulonglong)uVar11 * 8);
  if ((int)((ulonglong)uVar11 * 8 >> 0x20) != 0) {
    uVar3 = 0xffffffff;
  }
  puVar4 = operator_new__(uVar3);
  if (uVar11 != 0) {
    puVar10 = puVar4;
    do {
      *puVar10 = 0;
      puVar10[1] = 0;
      puVar10 = puVar10 + 2;
    } while (puVar10 != puVar4 + uVar11 * 2);
  }
  *(undefined4 **)(param_1 + 0x78) = puVar4;
  iVar7 = *(int *)(param_1 + 0x6c);
  iVar8 = *(int *)(param_1 + 0x70);
  local_28 = &local_28;
  local_24 = &local_28;
  if (iVar8 != iVar7) {
    uVar11 = 0;
    do {
      iVar12 = 0;
      if (0 < **(int **)(iVar7 + uVar11 * 4)) {
        do {
          local_2c = FUN_0006ec3c();
          FUN_0006f598(&local_28,&local_28,&local_2c);
          iVar7 = *(int *)(param_1 + 0x6c);
          iVar12 = iVar12 + 1;
        } while (iVar12 < **(int **)(iVar7 + uVar11 * 4));
        iVar8 = *(int *)(param_1 + 0x70);
      }
      uVar11 = uVar11 + 1;
    } while (uVar11 < (uint)(iVar8 - iVar7 >> 2));
  }
  FUN_0001d10c(PTR_DAT_004d9048);
  puVar1 = PTR_DAT_004d91a0;
  iVar7 = FUN_00062be4(PTR_DAT_004d91a0,*(undefined4 *)(param_1 + 0xa4));
  if (iVar7 == 1) {
    *(int *)(puVar1 + 8) = *(int *)(puVar1 + 8) + 1;
    local_30 = FUN_00062ca4(puVar1);
    FUN_0006f598(&local_28,&local_28,&local_30);
  }
  uVar11 = *(uint *)(param_1 + 0x7c);
  uVar3 = (ulong)((ulonglong)uVar11 * 4);
  if ((int)((ulonglong)uVar11 * 4 >> 0x20) != 0) {
    uVar3 = 0xffffffff;
  }
  pvVar5 = operator_new__(uVar3);
  if (0 < (int)uVar11) {
    iVar7 = 0;
    do {
      *(int *)((int)pvVar5 + iVar7 * 4) = iVar7;
      iVar7 = iVar7 + 1;
    } while (iVar7 < (int)uVar11);
  }
  FUN_00039a64(pvVar5,uVar11);
  if (0 < *(int *)(param_1 + 0x7c)) {
    iVar7 = 0;
    do {
      iVar8 = 0;
      iVar12 = *(int *)((int)pvVar5 + iVar7 * 4);
      pppuVar9 = (undefined4 ***)local_28;
      if ((undefined4 ***)local_28 == &local_28) {
LAB_0006efd8:
        uVar6 = FUN_0006ed78(param_1);
        *(undefined4 *)(*(int *)(param_1 + 0x78) + iVar12 * 8) = uVar6;
      }
      else {
        do {
          pppuVar9 = (undefined4 ***)*pppuVar9;
          iVar8 = iVar8 + -1;
        } while (pppuVar9 != &local_28);
        if (iVar8 == 0) goto LAB_0006efd8;
        *(undefined4 **)(*(int *)(param_1 + 0x78) + iVar12 * 8) = local_28[2];
        FUN_00039a28(param_1 + 0x40,
                     *(undefined4 *)(*(int *)(*(int *)(param_1 + 0x78) + iVar12 * 8) + 0x54));
        ppuVar2 = local_28;
        std::_List_node_base::unhook();
        operator_delete(ppuVar2);
      }
      iVar7 = iVar7 + 1;
    } while (iVar7 < *(int *)(param_1 + 0x7c));
  }
  pppuVar9 = (undefined4 ***)local_28;
  if (pvVar5 != (void *)0x0) {
    operator_delete__(pvVar5);
    pppuVar9 = (undefined4 ***)local_28;
  }
  while (pppuVar9 != &local_28) {
    pppuVar13 = (undefined4 ***)*pppuVar9;
    operator_delete(pppuVar9);
    pppuVar9 = pppuVar13;
  }
  return;
}


```

## FUN_00056098 — 00056098

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

## FUN_0006e254 — 0006e254

```c

void FUN_0006e254(int param_1)

{
  undefined *puVar1;
  int *piVar2;
  int iVar3;
  uint uVar4;
  int iVar5;
  int iVar6;
  undefined4 uVar7;
  code *pcVar8;
  undefined8 uVar9;
  undefined8 uVar10;
  undefined1 auStack_270 [40];
  undefined1 auStack_248 [40];
  undefined1 auStack_220 [40];
  undefined4 local_1f8;
  undefined4 local_1f4;
  undefined4 local_1f0;
  undefined4 local_1ec;
  undefined1 auStack_1e8 [40];
  undefined1 auStack_1c0 [40];
  undefined1 auStack_198 [40];
  undefined1 auStack_170 [40];
  undefined1 auStack_148 [40];
  undefined1 auStack_120 [40];
  undefined1 auStack_f8 [40];
  undefined1 auStack_d0 [40];
  int local_a8;
  char acStack_a4 [128];
  int local_24;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  local_a8 = CONCAT31(local_a8._1_3_,1);
  FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 4) + 0x260),&local_a8);
  uVar7 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_d0,"@instructions");
  piVar2 = (int *)FUN_0039725c(uVar7,auStack_d0);
  FUN_0030f7e0(auStack_d0);
  if (piVar2 != (int *)0x0) {
    local_a8 = CONCAT31(local_a8._1_3_,1);
    FUN_0001da28(piVar2[0x98],&local_a8);
    FUN_0030f7cc(auStack_f8,*(int *)(param_1 + 8) + 0xa1);
    FUN_0030f7cc(auStack_120,"text");
    FUN_0030f870(auStack_148,auStack_f8);
    local_a8 = 0;
    FUN_000632ac(piVar2 + 0x28,auStack_120,&local_a8);
    FUN_00022950(*(undefined4 *)(piVar2[0x37] + local_a8 * 4),auStack_148);
    FUN_0030f7e0(auStack_148);
    FUN_0030f7e0(auStack_120);
    pcVar8 = *(code **)(*piVar2 + 0x40);
    FUN_0030f7cc(auStack_170,"transition_up");
    (*pcVar8)(piVar2,auStack_170,1);
    FUN_0030f7e0(auStack_170);
    FUN_0030f7e0(auStack_f8);
  }
  uVar7 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_198,"instructionsContainerLeft");
  iVar3 = FUN_0039725c(uVar7,auStack_198);
  FUN_0030f7e0(auStack_198);
  if (iVar3 != 0) {
    local_a8._0_1_ = 1;
    FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),&local_a8);
    FUN_00396d98(iVar3,1);
    uVar7 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_1c0,"instructionsContainerRight");
    iVar3 = FUN_0039725c(uVar7,auStack_1c0);
    FUN_0030f7e0(auStack_1c0);
    local_a8 = CONCAT31(local_a8._1_3_,1);
    FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),&local_a8);
    FUN_00396d98(iVar3,1);
  }
  uVar7 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_1e8,"@icon");
  iVar3 = FUN_0039725c(uVar7,auStack_1e8);
  FUN_0030f7e0(auStack_1e8);
  if (iVar3 != 0) {
    local_1f0 = 0x3e000000;
    local_1ec = 0x3e000000;
    FUN_0006bc4c(*(undefined4 *)(iVar3 + 0x748),&local_1f0);
    iVar6 = *(int *)(*(int *)(*(int *)(param_1 + 8) + 100) + 0x100);
    uVar4 = 0;
    if (iVar6 != 0) {
      uVar4 = *(uint *)(iVar6 + 0x44);
    }
    uVar10 = FixedToFP(CONCAT44(uVar4 >> 3,uVar4 >> 3),0,1,0,0x20);
    uVar9 = FixedToFP(CONCAT44(uVar4,uVar4) & 0x700000007,0,1,0,0x20);
    uVar10 = FloatVectorMult(uVar10,0x3e0000003e000000,2,0x20);
    uVar9 = FloatVectorMult(uVar9,0x3e0000003e000000,2,0x20);
    local_1f8 = (undefined4)uVar9;
    local_1f4 = (undefined4)uVar10;
    FUN_0006bc4c(local_1f4,*(undefined4 *)(iVar3 + 0x744),&local_1f8);
  }
  iVar3 = 1;
  do {
    _sprintf(acStack_a4,"@misscounters.cross%d",iVar3);
    uVar7 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_220,acStack_a4);
    iVar6 = FUN_0039725c(uVar7,auStack_220);
    FUN_0030f7e0(auStack_220);
    if (iVar6 != 0) {
      iVar5 = FUN_0001d10c(PTR_DAT_004d9048);
      local_a8 = CONCAT31(local_a8._1_3_,*(int *)(iVar5 + 0x4c) < iVar3);
      FUN_0001da28(*(undefined4 *)(iVar6 + 0x260),&local_a8);
    }
    iVar3 = iVar3 + 1;
  } while (iVar3 != 4);
  uVar7 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_248,"@scoreCounterTotal");
  iVar3 = FUN_0039725c(uVar7,auStack_248);
  FUN_0030f7e0(auStack_248);
  if (iVar3 != 0) {
    local_a8 = CONCAT31(local_a8._1_3_,1);
    FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),&local_a8);
    FUN_0007daa8(iVar3);
  }
  piVar2 = *(int **)(param_1 + 4);
  pcVar8 = *(code **)(*piVar2 + 0x40);
  FUN_0030f7cc(auStack_270,"animate_in");
  (*pcVar8)(piVar2,auStack_270,1);
  FUN_0030f7e0(auStack_270);
  puVar1 = PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0xc) = 0;
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0001e3d8 — 0001e3d8

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

## FUN_00076654 — 00076654

```c

void FUN_00076654(int param_1)

{
  undefined *puVar1;
  int iVar2;
  _List_node_base *p_Var3;
  int iVar4;
  undefined4 *puVar5;
  undefined4 uVar6;
  int *piVar7;
  undefined4 *puVar8;
  code *pcVar9;
  undefined *local_1a8;
  int local_1a4;
  undefined1 *local_1a0;
  undefined4 local_19c;
  undefined1 local_188;
  undefined1 auStack_184 [40];
  undefined *local_15c;
  int local_158;
  undefined1 *local_154;
  undefined4 local_150;
  undefined1 local_13c;
  undefined1 auStack_138 [40];
  undefined *local_110;
  int local_10c;
  undefined1 *local_108;
  undefined4 local_104;
  undefined1 local_f0;
  undefined1 auStack_ec [40];
  undefined *local_c4;
  int local_c0;
  undefined1 *local_bc;
  undefined4 local_b8;
  undefined1 local_a4;
  undefined1 auStack_a0 [40];
  undefined1 auStack_78 [40];
  undefined4 local_50 [8];
  undefined1 local_30;
  undefined4 local_2c;
  undefined4 local_28;
  int local_24;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  local_50[0] = CONCAT31(local_50[0]._1_3_,1);
  FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 8) + 0x260),local_50);
  piVar7 = *(int **)(param_1 + 8);
  pcVar9 = *(code **)(*piVar7 + 0x40);
  FUN_0030f7cc(auStack_78,"animate_in");
  (*pcVar9)(piVar7,auStack_78,1);
  FUN_0030f7e0(auStack_78);
  uVar6 = *(undefined4 *)(param_1 + 8);
  FUN_0030f7cc(auStack_a0,"back");
  iVar2 = FUN_0039725c(uVar6,auStack_a0);
  FUN_0030f7e0(auStack_a0);
  if (iVar2 != 0) {
    puVar8 = (undefined4 *)(iVar2 + 0xb34);
    if (*(int *)(iVar2 + 0xb3c) == 0) {
      FUN_00022608(puVar8);
      *puVar8 = puVar8;
      *(undefined4 **)(iVar2 + 0xb38) = puVar8;
    }
    else {
      puVar5 = (undefined4 *)*puVar8;
      if (puVar5 != puVar8) {
        puVar5[0xb] = *(int *)(iVar2 + 0xb3c);
        puVar5[0xc] = 2;
        *(int *)(iVar2 + 0xb40) = *(int *)(iVar2 + 0xb40) + 1;
        for (puVar5 = (undefined4 *)*puVar5; puVar5 != puVar8; puVar5 = (undefined4 *)*puVar5) {
          puVar5[0xb] = *(undefined4 *)(iVar2 + 0xb3c);
          puVar5[0xc] = 2;
          *(int *)(iVar2 + 0xb40) = *(int *)(iVar2 + 0xb40) + 1;
        }
      }
    }
    local_a4 = 1;
    local_c4 = (undefined *)0x0;
    FUN_00022510(&local_c4);
    local_a4 = 0;
    local_c4 = &DAT_0052ce38;
    local_b8 = 0;
    local_bc = &FUN_00076ad4_1;
    local_30 = 1;
    local_50[0] = 0;
    local_c0 = param_1;
    (*(code *)PTR_FUN_0052ce40)(&local_c4,local_50);
    local_2c = 0;
    local_28 = 0;
    p_Var3 = (_List_node_base *)FUN_0002256c(puVar8,local_50);
    std::_List_node_base::hook(p_Var3);
    FUN_00022510(local_50);
    if (*(int *)(iVar2 + 0xb3c) != 0) {
      iVar4 = *(int *)(iVar2 + 0xb38);
      *(int *)(iVar4 + 0x2c) = *(int *)(iVar2 + 0xb3c);
      *(undefined4 *)(iVar4 + 0x30) = 1;
      *(int *)(iVar2 + 0xb40) = *(int *)(iVar2 + 0xb40) + 1;
    }
    FUN_00022510(&local_c4);
  }
  if (*(int *)(PTR_DAT_004d9048 + 4) == 2) {
    uVar6 = *(undefined4 *)(param_1 + 8);
    FUN_0030f7cc(auStack_138,"@buy");
    iVar2 = FUN_0039725c(uVar6,auStack_138);
    FUN_0030f7e0(auStack_138);
    if (iVar2 != 0) {
      puVar8 = (undefined4 *)(iVar2 + 0xb34);
      if (*(int *)(iVar2 + 0xb3c) == 0) {
        FUN_00022608(puVar8);
        *puVar8 = puVar8;
        *(undefined4 **)(iVar2 + 0xb38) = puVar8;
      }
      else {
        puVar5 = (undefined4 *)*puVar8;
        if (puVar5 != puVar8) {
          puVar5[0xb] = *(int *)(iVar2 + 0xb3c);
          puVar5[0xc] = 2;
          *(int *)(iVar2 + 0xb40) = *(int *)(iVar2 + 0xb40) + 1;
          for (puVar5 = (undefined4 *)*puVar5; puVar5 != puVar8; puVar5 = (undefined4 *)*puVar5) {
            puVar5[0xb] = *(undefined4 *)(iVar2 + 0xb3c);
            puVar5[0xc] = 2;
            *(int *)(iVar2 + 0xb40) = *(int *)(iVar2 + 0xb40) + 1;
          }
        }
      }
      local_13c = 1;
      local_15c = (undefined *)0x0;
      FUN_00022510(&local_15c);
      local_13c = 0;
      local_15c = &DAT_0052ce38;
      local_150 = 0;
      local_154 = &LAB_00076b5c_1;
      local_30 = 1;
      local_50[0] = 0;
      local_158 = param_1;
      (*(code *)PTR_FUN_0052ce40)(&local_15c,local_50);
      local_2c = 0;
      local_28 = 0;
      p_Var3 = (_List_node_base *)FUN_0002256c(puVar8,local_50);
      std::_List_node_base::hook(p_Var3);
      FUN_00022510(local_50);
      if (*(int *)(iVar2 + 0xb3c) != 0) {
        iVar4 = *(int *)(iVar2 + 0xb38);
        *(int *)(iVar4 + 0x2c) = *(int *)(iVar2 + 0xb3c);
        *(undefined4 *)(iVar4 + 0x30) = 1;
        *(int *)(iVar2 + 0xb40) = *(int *)(iVar2 + 0xb40) + 1;
      }
      FUN_00022510(&local_15c);
    }
  }
  else if (*(int *)(PTR_DAT_004d9048 + 4) == 1) {
    uVar6 = *(undefined4 *)(param_1 + 8);
    FUN_0030f7cc(auStack_ec,"@buy");
    iVar2 = FUN_0039725c(uVar6,auStack_ec);
    FUN_0030f7e0(auStack_ec);
    if (iVar2 != 0) {
      puVar8 = (undefined4 *)(iVar2 + 0xb34);
      if (*(int *)(iVar2 + 0xb3c) == 0) {
        FUN_00022608(puVar8);
        *puVar8 = puVar8;
        *(undefined4 **)(iVar2 + 0xb38) = puVar8;
      }
      else {
        puVar5 = (undefined4 *)*puVar8;
        if (puVar5 != puVar8) {
          puVar5[0xb] = *(int *)(iVar2 + 0xb3c);
          puVar5[0xc] = 2;
          *(int *)(iVar2 + 0xb40) = *(int *)(iVar2 + 0xb40) + 1;
          for (puVar5 = (undefined4 *)*puVar5; puVar5 != puVar8; puVar5 = (undefined4 *)*puVar5) {
            puVar5[0xb] = *(undefined4 *)(iVar2 + 0xb3c);
            puVar5[0xc] = 2;
            *(int *)(iVar2 + 0xb40) = *(int *)(iVar2 + 0xb40) + 1;
          }
        }
      }
      local_f0 = 1;
      local_110 = (undefined *)0x0;
      FUN_00022510(&local_110);
      local_f0 = 0;
      local_110 = &DAT_0052ce38;
      local_104 = 0;
      local_108 = &LAB_00076b40_1;
      local_30 = 1;
      local_50[0] = 0;
      local_10c = param_1;
      (*(code *)PTR_FUN_0052ce40)(&local_110,local_50);
      local_2c = 0;
      local_28 = 0;
      p_Var3 = (_List_node_base *)FUN_0002256c(puVar8,local_50);
      std::_List_node_base::hook(p_Var3);
      FUN_00022510(local_50);
      if (*(int *)(iVar2 + 0xb3c) != 0) {
        iVar4 = *(int *)(iVar2 + 0xb38);
        *(int *)(iVar4 + 0x2c) = *(int *)(iVar2 + 0xb3c);
        *(undefined4 *)(iVar4 + 0x30) = 1;
        *(int *)(iVar2 + 0xb40) = *(int *)(iVar2 + 0xb40) + 1;
      }
      FUN_00022510(&local_110);
    }
  }
  else {
    uVar6 = *(undefined4 *)(param_1 + 8);
    FUN_0030f7cc(auStack_184,"upsellMain.woodBoardOffset.woodBoard.BuyFullGame.fruit");
    iVar2 = FUN_0039725c(uVar6,auStack_184);
    FUN_0030f7e0(auStack_184);
    if (iVar2 != 0) {
      FUN_0003ca90(iVar2 + 0x75c,*(undefined4 *)(iVar2 + 0x75c));
      puVar8 = (undefined4 *)(iVar2 + 0x76c);
      if (*(int *)(iVar2 + 0x774) == 0) {
        FUN_0003ca68(puVar8);
        *puVar8 = puVar8;
        *(undefined4 **)(iVar2 + 0x770) = puVar8;
      }
      else {
        puVar5 = (undefined4 *)*puVar8;
        if (puVar5 != puVar8) {
          puVar5[0xb] = *(int *)(iVar2 + 0x774);
          puVar5[0xc] = 2;
          *(int *)(iVar2 + 0x778) = *(int *)(iVar2 + 0x778) + 1;
          for (puVar5 = (undefined4 *)*puVar5; puVar5 != puVar8; puVar5 = (undefined4 *)*puVar5) {
            puVar5[0xb] = *(undefined4 *)(iVar2 + 0x774);
            puVar5[0xc] = 2;
            *(int *)(iVar2 + 0x778) = *(int *)(iVar2 + 0x778) + 1;
          }
        }
      }
      local_188 = 1;
      local_1a8 = (undefined *)0x0;
      FUN_0003c910(&local_1a8);
      local_188 = 0;
      local_1a8 = &DAT_0052ce18;
      local_19c = 0;
      local_1a0 = &LAB_00076b78_1;
      local_30 = 1;
      local_50[0] = 0;
      local_1a4 = param_1;
      (*(code *)PTR_FUN_0052ce20)(&local_1a8,local_50);
      local_2c = 0;
      local_28 = 0;
      p_Var3 = (_List_node_base *)FUN_0003c96c(puVar8,local_50);
      std::_List_node_base::hook(p_Var3);
      FUN_0003c910(local_50);
      if (*(int *)(iVar2 + 0x774) != 0) {
        iVar4 = *(int *)(iVar2 + 0x770);
        *(int *)(iVar4 + 0x2c) = *(int *)(iVar2 + 0x774);
        *(undefined4 *)(iVar4 + 0x30) = 1;
        *(int *)(iVar2 + 0x778) = *(int *)(iVar2 + 0x778) + 1;
      }
      FUN_0003c910(&local_1a8);
    }
  }
  puVar1 = PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 4) = 0;
  if (*(int *)puVar1 == local_24) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

## FUN_00065b98 — 00065b98

```c

void FUN_00065b98(int *param_1,int param_2)

{
  int iVar1;
  undefined4 uVar2;
  int iVar3;
  int *piVar4;
  code *pcVar5;
  float fVar6;
  float fVar7;
  undefined **local_fc;
  undefined *local_f8;
  undefined1 local_dc;
  undefined1 auStack_d8 [40];
  undefined1 auStack_b0 [40];
  undefined1 auStack_88 [40];
  undefined1 auStack_60 [12];
  undefined1 auStack_54 [4];
  float local_50;
  float local_4c;
  float local_48;
  undefined1 local_44 [4];
  undefined1 auStack_40 [12];
  int local_34;
  
  local_34 = *(int *)PTR____stack_chk_guard_004d9044;
  iVar1 = *(int *)(param_2 + 0x8c);
  if (2 < iVar1) {
    param_1[0xb] = iVar1 + param_1[0xb];
    iVar1 = *(int *)(param_2 + 0x8c);
  }
  if ((0 < iVar1) && (param_1[9] == 0)) {
    param_1[9] = 1;
    uVar2 = FUN_0000342c();
    FUN_00004188(uVar2,param_1[8]);
    iVar1 = *(int *)(*param_1 + 0x1c);
    if ((iVar1 != 0) && ((float)param_1[8] <= 0.0)) {
      for (iVar3 = *(int *)(iVar1 + 0x608); *(int *)(iVar3 + 0x38) != 0;
          iVar3 = *(int *)(*(int *)(iVar3 + 0x38) + 4)) {
      }
      fVar6 = *(float *)(iVar3 + 0x48);
      for (iVar1 = *(int *)(iVar1 + 0x60c); *(int *)(iVar1 + 0x38) != 0;
          iVar1 = *(int *)(*(int *)(iVar1 + 0x38) + 4)) {
      }
      fVar7 = *(float *)(iVar1 + 0x48);
      uVar2 = FUN_003ecb20();
      FUN_003ed850(auStack_54,uVar2);
      local_4c = fVar6 / (DAT_00065da0 / local_50);
      local_48 = fVar7 / (DAT_00065da0 / local_50);
      FUN_00044590(auStack_60,param_2 + 0x104,&local_4c);
      FUN_0000606c(*(undefined4 *)(*(int *)(*param_1 + 0x1c) + 0x5f8),auStack_60);
      local_44[0] = 1;
      FUN_0001da28(*(undefined4 *)(*(int *)(*param_1 + 0x1c) + 0x260),local_44);
      uVar2 = *(undefined4 *)(*param_1 + 0x1c);
      FUN_0030f7cc(auStack_88,"value");
      iVar1 = FUN_0039725c(uVar2,auStack_88);
      FUN_0030f7e0(auStack_88);
      if (iVar1 != 0) {
        FUN_000659d0(param_1,2,auStack_40,10);
        FUN_0030f7cc(auStack_b0,auStack_40);
        FUN_00022950(*(undefined4 *)(iVar1 + 0x7dc),auStack_b0);
        FUN_0030f7e0(auStack_b0);
      }
      piVar4 = *(int **)(*param_1 + 0x1c);
      pcVar5 = *(code **)(*piVar4 + 0x40);
      FUN_0030f7cc(auStack_d8,"animate_trigger");
      (*pcVar5)(piVar4,auStack_d8,1);
      FUN_0030f7e0(auStack_d8);
      if ((int)((uint)((float)param_1[8] < DAT_00065da4) << 0x1f) < 0) {
        uVar2 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a8);
        local_dc = 1;
        local_fc = (undefined **)0x0;
        FUN_0000a298(&local_fc);
        local_dc = 0;
        local_fc = &PTR_LAB_0052bf38;
        local_f8 = PTR_FUN_004d9154;
        FUN_000724ac(uVar2,0x3ecccccd,0x3f800000,&local_fc);
        FUN_0000a298(&local_fc);
      }
    }
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_34) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00065f44 — 00065f44

```c

void FUN_00065f44(int *param_1,int param_2)

{
  undefined *puVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int *piVar5;
  undefined4 uVar6;
  uint uVar7;
  uint uVar8;
  code *pcVar9;
  int *piVar10;
  float fVar11;
  float fVar12;
  undefined1 auStack_1a8 [40];
  undefined1 auStack_180 [12];
  undefined1 auStack_174 [4];
  float local_170;
  float local_16c;
  float local_168;
  undefined1 auStack_164 [40];
  undefined1 auStack_13c [40];
  undefined **local_114;
  undefined *local_110;
  undefined1 local_f4;
  undefined **local_f0;
  undefined *local_ec;
  undefined1 local_d0;
  undefined **local_cc;
  undefined *local_c8;
  undefined1 local_ac;
  undefined **local_a8;
  undefined *local_a4;
  undefined1 local_88;
  undefined1 local_84 [4];
  undefined1 auStack_80 [12];
  undefined1 auStack_74 [64];
  int local_34;
  
  local_34 = *(int *)PTR____stack_chk_guard_004d9044;
  if (*(char *)(param_2 + 0x1b8) == '\0') {
    FUN_0001d10c(PTR_DAT_004d9048);
    iVar2 = FUN_0005eef0(PTR_DAT_004d9024);
    if (iVar2 < 0x15) {
      FUN_0001d10c(PTR_DAT_004d9048);
      iVar2 = FUN_00063fa0(PTR_DAT_004d907c,"NoFeedback");
      if (iVar2 == 0) {
        FUN_0001d10c(PTR_DAT_004d9048);
        iVar2 = FUN_0005eef0(PTR_DAT_004d9024);
        puVar1 = PTR_DAT_004d9048;
        if (iVar2 < 0) {
          iVar2 = *param_1;
          piVar5 = *(int **)(iVar2 + *(int *)(iVar2 + 0x48) * 4 + 0x3c);
          *(uint *)(iVar2 + 0x48) = (*(int *)(iVar2 + 0x48) + 1U) % 3;
          puVar1 = PTR_DAT_004d9048;
          piVar10 = (int *)0x0;
          if (piVar5 != (int *)0x0) {
            iVar4 = piVar5[0x10];
            iVar2 = *(int *)(PTR_DAT_004d9054 + 0x28);
            piVar10 = piVar5;
            if ((*(int *)(iVar4 + 0x28) != iVar2) && (piVar10 = (int *)0x0, iVar4 != 0)) {
              iVar4 = *(int *)(iVar4 + 0x2c);
              piVar10 = (int *)0x0;
              if (iVar4 != 0) {
                do {
                  iVar3 = *(int *)(iVar4 + 0x28);
                  if (iVar3 != iVar2) {
                    iVar4 = *(int *)(iVar4 + 0x2c);
                  }
                } while (iVar3 != iVar2 && iVar4 != 0);
                piVar10 = (int *)0x0;
                if (iVar3 == iVar2) {
                  piVar10 = piVar5;
                }
              }
            }
          }
          FUN_0002bf1c(*(undefined4 *)(PTR_DAT_004d9048 + 0x1a4),"bonus");
          uVar6 = *(undefined4 *)(puVar1 + 0x1a4);
          local_88 = 1;
          local_a8 = (undefined **)0x0;
          FUN_0000a298(&local_a8);
          local_88 = 0;
          local_a8 = &PTR_LAB_0052bf38;
          local_a4 = PTR_FUN_004d9058;
          FUN_0002bc94(uVar6,"bonus",0x3f800000,0x3f800000,&local_a8,0);
          FUN_0000a298(&local_a8);
        }
        else {
          uVar7 = 0;
          if (iVar2 == 0) {
            FUN_0002bf1c(*(undefined4 *)(PTR_DAT_004d9048 + 0x1a4),"challenge-pass");
            uVar6 = *(undefined4 *)(puVar1 + 0x1a4);
            local_ac = 1;
            local_cc = (undefined **)0x0;
            FUN_0000a298(&local_cc);
            local_ac = 0;
            local_cc = &PTR_LAB_0052bf38;
            local_c8 = PTR_FUN_004d9058;
            FUN_0002bc94(uVar6,"challenge-pass",0x3f800000,0x3f800000,&local_cc,0);
            FUN_0000a298(&local_cc);
            uVar6 = *(undefined4 *)(puVar1 + 0x1a8);
            piVar10 = *(int **)(*param_1 + 0x28);
            local_d0 = 1;
            local_f0 = (undefined **)0x0;
            FUN_0000a298(&local_f0);
            local_d0 = 0;
            local_f0 = &PTR_LAB_0052bf38;
            local_ec = PTR_FUN_004d9154;
            FUN_000724ac(uVar6,0x3ecccccd,0x3f800000,&local_f0);
            FUN_0000a298(&local_f0);
          }
          else {
            do {
              if (4 < uVar7) goto LAB_00066366;
              piVar10 = &DAT_004712cc + uVar7;
              uVar7 = uVar7 + 1;
            } while (*piVar10 != iVar2);
            uVar7 = 6 - uVar7;
            uVar8 = 1;
            if (((1 < uVar7) && (uVar8 = uVar7, (int)uVar7 < 1)) ||
               (piVar10 = *(int **)(*param_1 + 0x24), piVar10 == (int *)0x0)) goto LAB_00066366;
            iVar3 = uVar8 - 1;
            iVar4 = 1;
            if ((1 < iVar3) && (iVar4 = iVar3, 4 < iVar3)) {
              iVar4 = 5;
            }
            FUN_002f702c(auStack_74,0x40,"togo-%i",iVar4);
            uVar7 = 1;
            if ((1 < (int)uVar8) && (uVar7 = uVar8, 4 < (int)uVar8)) {
              uVar7 = 5;
            }
            FUN_002f702c(auStack_74,0x40,"togo-%i",uVar7);
            uVar6 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
            local_f4 = 1;
            local_114 = (undefined **)0x0;
            FUN_0000a298(&local_114);
            local_f4 = 0;
            local_114 = &PTR_LAB_0052bf38;
            local_110 = PTR_FUN_004d9058;
            FUN_0002bc94(uVar6,auStack_74,0x3e800000,0x3f800000,&local_114,0);
            FUN_0000a298(&local_114);
            FUN_0030f7cc(auStack_13c,"value");
            iVar4 = FUN_0039725c(piVar10,auStack_13c);
            FUN_0030f7e0(auStack_13c);
            if (iVar4 != 0) {
              FUN_002f702c(auStack_80,10,"%i",iVar2);
              FUN_0030f7cc(auStack_164,auStack_80);
              FUN_00022950(*(undefined4 *)(iVar4 + 0x7dc),auStack_164);
              FUN_0030f7e0(auStack_164);
            }
          }
        }
        if (piVar10 != (int *)0x0) {
          for (iVar2 = piVar10[0x182]; *(int *)(iVar2 + 0x38) != 0;
              iVar2 = *(int *)(*(int *)(iVar2 + 0x38) + 4)) {
          }
          fVar11 = *(float *)(iVar2 + 0x48);
          for (iVar2 = piVar10[0x183]; *(int *)(iVar2 + 0x38) != 0;
              iVar2 = *(int *)(*(int *)(iVar2 + 0x38) + 4)) {
          }
          fVar12 = *(float *)(iVar2 + 0x48);
          uVar6 = FUN_003ecb20();
          FUN_003ed850(auStack_174,uVar6);
          local_16c = fVar11 / (DAT_00066394 / local_170);
          local_168 = fVar12 / (DAT_00066394 / local_170);
          FUN_00044590(auStack_180,param_2 + 0x10,&local_16c);
          FUN_0000606c(piVar10[0x17e],auStack_180);
          local_84[0] = 1;
          FUN_0001da28(piVar10[0x98],local_84);
          FUN_00396d98(piVar10,1);
          pcVar9 = *(code **)(*piVar10 + 0x40);
          FUN_0030f7cc(auStack_1a8,"trigger");
          (*pcVar9)(piVar10,auStack_1a8,1);
          FUN_0030f7e0(auStack_1a8);
        }
      }
    }
  }
LAB_00066366:
  if (*(int *)PTR____stack_chk_guard_004d9044 == local_34) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

## FUN_0002504c — 0002504c

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

## FUN_0007d428 — 0007d428

```c

void FUN_0007d428(int *param_1,undefined4 param_2)

{
  char cVar1;
  undefined *puVar2;
  int iVar3;
  uint uVar4;
  int *piVar5;
  undefined1 *puVar6;
  undefined ***pppuVar7;
  int iVar8;
  uint uVar9;
  int iVar10;
  uint uVar11;
  float *pfVar12;
  undefined4 uVar13;
  code *pcVar14;
  uint *puVar15;
  bool bVar16;
  int *piVar17;
  int *piVar18;
  undefined4 extraout_s1;
  longlong lVar20;
  undefined4 extraout_s1_00;
  uint extraout_s1_01;
  uint extraout_s1_02;
  uint extraout_s1_03;
  undefined8 uVar21;
  undefined4 extraout_s3;
  undefined **local_1ec;
  undefined *local_1e8;
  undefined1 local_1cc;
  undefined1 auStack_1c8 [40];
  undefined **local_1a0;
  undefined *local_19c;
  undefined1 local_180;
  undefined **local_17c;
  undefined *local_178;
  undefined1 local_15c;
  undefined1 auStack_158 [40];
  undefined1 auStack_130 [40];
  undefined1 auStack_108 [40];
  undefined1 auStack_e0 [40];
  undefined1 auStack_b8 [40];
  undefined1 auStack_90 [40];
  undefined1 auStack_68 [40];
  undefined1 local_40 [4];
  char acStack_3c [24];
  int local_24;
  uint *puVar19;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_003d0f44(param_1);
  if (*(int *)(PTR_DAT_004d9048 + 0x10) != 1) goto LAB_0007d818;
  iVar3 = FUN_0001d10c(PTR_DAT_004d9048);
  cVar1 = '\0';
  if (iVar3 != 0) {
    cVar1 = (char)param_1[0x222];
  }
  if (iVar3 == 0 || cVar1 == '\0') goto LAB_0007d818;
  uVar4 = (**(code **)(*param_1 + 0xb4))(param_1);
  pfVar12 = (float *)(param_1 + 0x221);
  uVar21 = FPToFixed(CONCAT44(extraout_s1,*pfVar12),0,0,3,0x20);
  uVar9 = (uint)uVar21;
  if (uVar9 == uVar4) {
    if (*(char *)((int)param_1 + 0x889) != '\0') goto LAB_0007d818;
    FUN_0030f7cc(auStack_1c8,"animate_trigger");
    iVar3 = FUN_0039834c(param_1,auStack_1c8,0);
    FUN_0030f7e0(auStack_1c8);
    puVar2 = PTR_DAT_004d9048;
    if (iVar3 != 1) goto LAB_0007d818;
    pppuVar7 = &local_1ec;
    *(undefined1 *)((int)param_1 + 0x889) = 1;
    uVar13 = *(undefined4 *)(puVar2 + 0x1a4);
    local_1cc = 1;
    local_1ec = (undefined **)0x0;
    FUN_0000a298(pppuVar7);
    local_1cc = 0;
    local_1ec = &PTR_LAB_0052bf38;
    local_1e8 = PTR_FUN_004d9058;
    FUN_0002bb34(uVar13,"count-complete",0x3f800000,0x3f800000,pppuVar7,0);
  }
  else {
    iVar3 = (uVar4 - uVar9) * 6;
    uVar21 = FixedToFP(CONCAT44(iVar3,iVar3),0,0,0,0x20);
    uVar21 = FloatVectorMult(uVar21,CONCAT44(param_2,param_2),2,0x20);
    lVar20 = FloatVectorAdd(CONCAT44(extraout_s1,*pfVar12),uVar21,2);
    uVar21 = FPToFixed(lVar20,0,0,3,0x20);
    *pfVar12 = (float)lVar20;
    if ((uint)uVar21 != uVar9) {
      FUN_003d0bf4((float)lVar20,param_1);
      FUN_0030f7cc(auStack_68,"pulse");
      iVar3 = FUN_0039834c(param_1,auStack_68,1);
      FUN_0030f7e0(auStack_68);
      if (iVar3 == 0) {
        pcVar14 = *(code **)(*param_1 + 0x40);
        FUN_0030f7cc(auStack_90,"pulse");
        (*pcVar14)(param_1,auStack_90,1);
        FUN_0030f7e0(auStack_90);
      }
      FUN_0030f7cc(auStack_b8,":@limitText");
      piVar5 = (int *)FUN_0039725c(param_1,auStack_b8);
      FUN_0030f7e0(auStack_b8);
      lVar20 = CONCAT44(extraout_s1_00,*pfVar12);
      uVar21 = FixedToFP(CONCAT44(extraout_s3,param_1[0x220]),0,0,0,0x20);
      if (((float)uVar21 < *pfVar12) && (piVar5 != (int *)0x0)) {
        iVar3 = piVar5[0x98];
        if (piVar5[0x13] == 0) {
LAB_0007d648:
          local_40[0] = 1;
          FUN_0001da28(iVar3,local_40);
          puVar6 = auStack_e0;
          pcVar14 = *(code **)(*piVar5 + 0x40);
          FUN_0030f7cc(puVar6,"animate_in");
          (*pcVar14)(piVar5,puVar6,1);
        }
        else {
          iVar8 = *(int *)(iVar3 + 0x38);
          iVar10 = iVar3;
          while (iVar8 != 0) {
            iVar10 = *(int *)(iVar8 + 4);
            iVar8 = *(int *)(iVar10 + 0x38);
          }
          if (*(char *)(iVar10 + 0x48) == '\0') goto LAB_0007d648;
          FUN_0030f7cc(auStack_108,"animate_in");
          iVar3 = FUN_0039834c(param_1,auStack_108,1);
          if (iVar3 == 1) {
            puVar6 = auStack_108;
          }
          else {
            FUN_0030f7cc(auStack_130,"limitPulse");
            iVar3 = FUN_0039834c(param_1,auStack_130,1);
            FUN_0030f7e0(auStack_130);
            FUN_0030f7e0(auStack_108);
            lVar20 = (ulonglong)extraout_s1_01 << 0x20;
            if (iVar3 != 0) goto LAB_0007d6c6;
            puVar6 = auStack_158;
            pcVar14 = *(code **)(*param_1 + 0x40);
            FUN_0030f7cc(puVar6,"limitPulse");
            (*pcVar14)(param_1,puVar6,1);
          }
        }
        FUN_0030f7e0(puVar6);
        lVar20 = (ulonglong)extraout_s1_02 << 0x20;
      }
LAB_0007d6c6:
      puVar2 = PTR_DAT_004d9050;
      if (*(int *)(PTR_DAT_004d9048 + 0x1a4) != 0) {
        puVar15 = (uint *)(PTR_DAT_004d9050 + 8);
        uVar9 = *(uint *)PTR_DAT_004d9050;
        piVar17 = (int *)(PTR_DAT_004d9050 + 4);
        piVar18 = (int *)(PTR_DAT_004d9050 + 0xc);
        puVar19 = (uint *)(PTR_DAT_004d9050 + 0x10);
        piVar5 = (int *)(PTR_DAT_004d9050 + 0x14);
        lVar20 = (ulonglong)uVar9 * (ulonglong)*puVar15;
        uVar11 = (uint)lVar20;
        *(uint *)PTR_DAT_004d9050 = uVar11 + *puVar19;
        iVar3 = *piVar17 * *puVar15 + uVar9 * *piVar18 + (int)((ulonglong)lVar20 >> 0x20) +
                *piVar5 + (uint)CARRY4(uVar11,*puVar19);
        *(int *)(puVar2 + 4) = iVar3;
        _sprintf(acStack_3c,"count-%d",1 - (iVar3 >> 0x1f));
        uVar13 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
        local_15c = 1;
        local_17c = (undefined **)0x0;
        FUN_0000a298(&local_17c);
        local_15c = 0;
        local_17c = &PTR_LAB_0052bf38;
        local_178 = PTR_FUN_004d9058;
        FUN_0002bb34(uVar13,acStack_3c,0x3f800000,0x3f800000,&local_17c,0);
        FUN_0000a298(&local_17c);
        lVar20 = (ulonglong)extraout_s1_03 << 0x20;
      }
    }
    puVar2 = PTR_DAT_004d9048;
    uVar21 = FPToFixed(CONCAT44((int)((ulonglong)lVar20 >> 0x20),*pfVar12),0,0,3,0x20);
    uVar9 = (uint)uVar21;
    bVar16 = uVar9 != uVar4;
    if (!bVar16) {
      uVar9 = (uint)*(byte *)((int)param_1 + 0x889);
    }
    if (bVar16 || uVar9 != 0) goto LAB_0007d818;
    pppuVar7 = &local_1a0;
    *(undefined1 *)((int)param_1 + 0x889) = 1;
    uVar13 = *(undefined4 *)(puVar2 + 0x1a4);
    local_180 = 1;
    local_1a0 = (undefined **)0x0;
    FUN_0000a298(pppuVar7);
    local_180 = 0;
    local_1a0 = &PTR_LAB_0052bf38;
    local_19c = PTR_FUN_004d9058;
    FUN_0002bb34(uVar13,"count-complete",0x3f800000,0x3f800000,pppuVar7,0);
  }
  FUN_0000a298(pppuVar7);
  (**(code **)(*param_1 + 0xb8))(param_1);
LAB_0007d818:
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0003d7c4 — 0003d7c4

```c

void FUN_0003d7c4(int param_1)

{
  int *piVar1;
  int iVar2;
  _List_node_base *p_Var3;
  int iVar4;
  undefined4 *puVar5;
  undefined4 uVar6;
  undefined4 *puVar7;
  code *pcVar8;
  undefined *local_15c;
  int local_158;
  undefined1 *local_154;
  undefined4 local_150;
  undefined1 local_13c;
  undefined1 auStack_138 [40];
  undefined *local_110;
  int local_10c;
  undefined1 *local_108;
  undefined4 local_104;
  undefined1 local_f0;
  undefined1 auStack_ec [40];
  undefined *local_c4;
  int local_c0;
  undefined1 *local_bc;
  undefined4 local_b8;
  undefined1 local_a4;
  undefined1 auStack_a0 [40];
  undefined1 auStack_78 [40];
  undefined4 local_50 [8];
  undefined1 local_30;
  undefined4 local_2c;
  undefined4 local_28;
  int local_24;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  piVar1 = (int *)FUN_0001cfb0(*(undefined4 *)(PTR_DAT_004d9048 + 0x654),"gamemode",1);
  *(int **)(param_1 + 0xac) = piVar1;
  pcVar8 = *(code **)(*piVar1 + 0x40);
  FUN_0030f7cc(auStack_78,"animate_in");
  (*pcVar8)(piVar1,auStack_78,1);
  FUN_0030f7e0(auStack_78);
  uVar6 = *(undefined4 *)(param_1 + 0xac);
  FUN_0030f7cc(auStack_a0,"backgroundControl.backOffset.back.fruit");
  iVar2 = FUN_0039725c(uVar6,auStack_a0);
  FUN_0030f7e0(auStack_a0);
  if (iVar2 != 0) {
    FUN_0003ca90(iVar2 + 0x75c,*(undefined4 *)(iVar2 + 0x75c));
    puVar7 = (undefined4 *)(iVar2 + 0x76c);
    if (*(int *)(iVar2 + 0x774) == 0) {
      FUN_0003ca68(puVar7);
      *puVar7 = puVar7;
      *(undefined4 **)(iVar2 + 0x770) = puVar7;
    }
    else {
      puVar5 = (undefined4 *)*puVar7;
      if (puVar5 != puVar7) {
        puVar5[0xb] = *(int *)(iVar2 + 0x774);
        puVar5[0xc] = 2;
        *(int *)(iVar2 + 0x778) = *(int *)(iVar2 + 0x778) + 1;
        for (puVar5 = (undefined4 *)*puVar5; puVar5 != puVar7; puVar5 = (undefined4 *)*puVar5) {
          puVar5[0xb] = *(undefined4 *)(iVar2 + 0x774);
          puVar5[0xc] = 2;
          *(int *)(iVar2 + 0x778) = *(int *)(iVar2 + 0x778) + 1;
        }
      }
    }
    local_a4 = 1;
    local_c4 = (undefined *)0x0;
    FUN_0003c910(&local_c4);
    local_a4 = 0;
    local_c4 = &DAT_0052c5b8;
    local_b8 = 0;
    local_bc = &FUN_0003db74_1;
    local_30 = 1;
    local_50[0] = 0;
    local_c0 = param_1;
    (*(code *)PTR_FUN_0052c5c0)(&local_c4,local_50);
    local_2c = 0;
    local_28 = 0;
    p_Var3 = (_List_node_base *)FUN_0003c96c(puVar7,local_50);
    std::_List_node_base::hook(p_Var3);
    FUN_0003c910(local_50);
    if (*(int *)(iVar2 + 0x774) != 0) {
      iVar4 = *(int *)(iVar2 + 0x770);
      *(int *)(iVar4 + 0x2c) = *(int *)(iVar2 + 0x774);
      *(undefined4 *)(iVar4 + 0x30) = 1;
      *(int *)(iVar2 + 0x778) = *(int *)(iVar2 + 0x778) + 1;
    }
    FUN_0003c910(&local_c4);
  }
  uVar6 = *(undefined4 *)(param_1 + 0xac);
  FUN_0030f7cc(auStack_ec,"backgroundControl.desperado.fruit");
  iVar2 = FUN_0039725c(uVar6,auStack_ec);
  FUN_0030f7e0(auStack_ec);
  if (iVar2 != 0) {
    FUN_0003ca90(iVar2 + 0x75c,*(undefined4 *)(iVar2 + 0x75c));
    puVar7 = (undefined4 *)(iVar2 + 0x76c);
    if (*(int *)(iVar2 + 0x774) == 0) {
      FUN_0003ca68(puVar7);
      *puVar7 = puVar7;
      *(undefined4 **)(iVar2 + 0x770) = puVar7;
    }
    else {
      puVar5 = (undefined4 *)*puVar7;
      if (puVar5 != puVar7) {
        puVar5[0xb] = *(int *)(iVar2 + 0x774);
        puVar5[0xc] = 2;
        *(int *)(iVar2 + 0x778) = *(int *)(iVar2 + 0x778) + 1;
        for (puVar5 = (undefined4 *)*puVar5; puVar5 != puVar7; puVar5 = (undefined4 *)*puVar5) {
          puVar5[0xb] = *(undefined4 *)(iVar2 + 0x774);
          puVar5[0xc] = 2;
          *(int *)(iVar2 + 0x778) = *(int *)(iVar2 + 0x778) + 1;
        }
      }
    }
    local_f0 = 1;
    local_110 = (undefined *)0x0;
    FUN_0003c910(&local_110);
    local_f0 = 0;
    local_110 = &DAT_0052c5b8;
    local_104 = 0;
    local_108 = &FUN_0003dc58_1;
    local_30 = 1;
    local_50[0] = 0;
    local_10c = param_1;
    (*(code *)PTR_FUN_0052c5c0)(&local_110,local_50);
    local_2c = 0;
    local_28 = 0;
    p_Var3 = (_List_node_base *)FUN_0003c96c(puVar7,local_50);
    std::_List_node_base::hook(p_Var3);
    FUN_0003c910(local_50);
    if (*(int *)(iVar2 + 0x774) != 0) {
      iVar4 = *(int *)(iVar2 + 0x770);
      *(int *)(iVar4 + 0x2c) = *(int *)(iVar2 + 0x774);
      *(undefined4 *)(iVar4 + 0x30) = 1;
      *(int *)(iVar2 + 0x778) = *(int *)(iVar2 + 0x778) + 1;
    }
    FUN_0003c910(&local_110);
  }
  uVar6 = *(undefined4 *)(param_1 + 0xac);
  FUN_0030f7cc(auStack_138,"backgroundControl.bandito.fruit");
  iVar2 = FUN_0039725c(uVar6,auStack_138);
  FUN_0030f7e0(auStack_138);
  if (iVar2 != 0) {
    FUN_0003ca90(iVar2 + 0x75c,*(undefined4 *)(iVar2 + 0x75c));
    puVar7 = (undefined4 *)(iVar2 + 0x76c);
    if (*(int *)(iVar2 + 0x774) == 0) {
      FUN_0003ca68(puVar7);
      *puVar7 = puVar7;
      *(undefined4 **)(iVar2 + 0x770) = puVar7;
    }
    else {
      puVar5 = (undefined4 *)*puVar7;
      if (puVar5 != puVar7) {
        puVar5[0xb] = *(int *)(iVar2 + 0x774);
        puVar5[0xc] = 2;
        *(int *)(iVar2 + 0x778) = *(int *)(iVar2 + 0x778) + 1;
        for (puVar5 = (undefined4 *)*puVar5; puVar5 != puVar7; puVar5 = (undefined4 *)*puVar5) {
          puVar5[0xb] = *(undefined4 *)(iVar2 + 0x774);
          puVar5[0xc] = 2;
          *(int *)(iVar2 + 0x778) = *(int *)(iVar2 + 0x778) + 1;
        }
      }
    }
    local_13c = 1;
    local_15c = (undefined *)0x0;
    FUN_0003c910(&local_15c);
    local_13c = 0;
    local_15c = &DAT_0052c5b8;
    local_150 = 0;
    local_154 = &FUN_0003dce4_1;
    local_30 = 1;
    local_50[0] = 0;
    local_158 = param_1;
    (*(code *)PTR_FUN_0052c5c0)(&local_15c,local_50);
    local_2c = 0;
    local_28 = 0;
    p_Var3 = (_List_node_base *)FUN_0003c96c(puVar7,local_50);
    std::_List_node_base::hook(p_Var3);
    FUN_0003c910(local_50);
    if (*(int *)(iVar2 + 0x774) != 0) {
      iVar4 = *(int *)(iVar2 + 0x770);
      *(int *)(iVar4 + 0x2c) = *(int *)(iVar2 + 0x774);
      *(undefined4 *)(iVar4 + 0x30) = 1;
      *(int *)(iVar2 + 0x778) = *(int *)(iVar2 + 0x778) + 1;
    }
    FUN_0003c910(&local_15c);
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 == local_24) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

## FUN_0006cae0 — 0006cae0

```c

void FUN_0006cae0(int param_1,int param_2)

{
  undefined *puVar1;
  undefined *puVar2;
  int *piVar3;
  int iVar4;
  code *pcVar5;
  int iVar6;
  undefined4 uVar7;
  undefined **local_98;
  undefined *local_94;
  undefined1 local_78;
  undefined1 auStack_74 [40];
  undefined1 auStack_4c [40];
  int local_24;
  
  puVar2 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0x14) = 0;
  if (param_2 == 0) {
    FUN_00020698(1,1);
  }
  uVar7 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_4c,"resultsContainer");
  piVar3 = (int *)FUN_0039725c(uVar7,auStack_4c);
  iVar4 = FUN_0030f7e0(auStack_4c);
  if (piVar3 != (int *)0x0) {
    iVar4 = piVar3[0x13];
  }
  if (piVar3 != (int *)0x0 && iVar4 != 0) {
    for (iVar4 = piVar3[0x98]; *(int *)(iVar4 + 0x38) != 0;
        iVar4 = *(int *)(*(int *)(iVar4 + 0x38) + 4)) {
    }
    if (*(char *)(iVar4 + 0x48) != '\0') {
      pcVar5 = *(code **)(*piVar3 + 0x40);
      FUN_0030f7cc(auStack_74,"animate_trigger");
      (*pcVar5)(piVar3,auStack_74,1);
      FUN_0030f7e0(auStack_74);
    }
  }
  puVar1 = PTR_DAT_004d9024;
  iVar4 = FUN_0005edbc(PTR_DAT_004d9024);
  iVar6 = *(int *)(PTR_DAT_004d9048 + 0x1a4);
  if ((iVar6 != 0) && (iVar4 == 1 && param_2 == 0)) {
    local_78 = 1;
    local_98 = (undefined **)0x0;
    FUN_0000a298(&local_98);
    local_78 = 0;
    local_98 = &PTR_LAB_0052bf38;
    local_94 = PTR_FUN_004d9058;
    FUN_0002bb34(iVar6,"Combo",0x3f800000,0x3f800000,&local_98,0);
    FUN_0000a298(&local_98);
  }
  iVar4 = FUN_0005edbc(puVar1);
  uVar7 = 1;
  if (iVar4 != 1) {
    uVar7 = 2;
  }
  *(undefined4 *)(param_1 + 0x10) = uVar7;
  if (*(int *)puVar2 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00064bdc — 00064bdc

```c

void FUN_00064bdc(int param_1)

{
  undefined *puVar1;
  int iVar2;
  int *piVar3;
  undefined4 uVar4;
  char *pcVar5;
  code *pcVar6;
  undefined **local_78;
  undefined *local_74;
  undefined1 local_58;
  undefined1 auStack_54 [40];
  undefined4 *local_2c;
  int local_28;
  int local_24;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  if (*(int *)(param_1 + 100) != 0) {
    local_2c = &DAT_0052cb68;
    local_28 = *(int *)(*(int *)(param_1 + 100) + 0x10);
    if (local_28 != 0) {
      pcVar5 = (char *)(param_1 + 0x68);
      do {
        if (*pcVar5 == '\x01') {
          iVar2 = 0;
          if (local_28 != -4) {
            iVar2 = local_28;
          }
          FUN_00396d98(iVar2,1);
          piVar3 = (int *)0x0;
          iVar2 = local_28;
          if (local_28 != 0) {
            iVar2 = local_28 + 4;
          }
          if (iVar2 != 0) {
            piVar3 = (int *)(iVar2 + -4);
          }
          pcVar6 = *(code **)(*piVar3 + 0x40);
          FUN_0030f7cc(auStack_54,"closed");
          (*pcVar6)(piVar3,auStack_54,1);
          FUN_0030f7e0(auStack_54);
        }
        *pcVar5 = '\0';
        (*(code *)*local_2c)(&local_2c);
        pcVar5 = pcVar5 + 1;
      } while (local_28 != 0);
    }
    local_58 = 1;
    local_78 = (undefined **)0x0;
    uVar4 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
    FUN_0000a298(&local_78);
    local_58 = 0;
    local_78 = &PTR_LAB_0052bf38;
    local_74 = PTR_FUN_004d9058;
    FUN_0002bc94(uVar4,"hatch-close",0x3f800000,0x3f800000,&local_78,0);
    FUN_0000a298(&local_78);
  }
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00064cf8 — 00064cf8

```c

void FUN_00064cf8(int param_1,int param_2)

{
  bool bVar1;
  undefined *puVar2;
  int *piVar3;
  int *piVar4;
  int *piVar5;
  undefined4 uVar6;
  code *pcVar7;
  undefined1 *puVar8;
  undefined **local_94;
  undefined *local_90;
  undefined1 local_74;
  undefined1 auStack_70 [40];
  float local_48;
  float local_44;
  float local_40;
  float local_3c;
  undefined4 *local_38;
  int *local_34;
  float local_30;
  float local_2c;
  undefined4 local_28;
  int local_24;
  
  puVar2 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  if (*(int *)(param_1 + 100) != 0) {
    local_30 = DAT_0052bfe0;
    local_2c = DAT_0052bfe4;
    local_28 = DAT_0052bfe8;
    FUN_00039e1c(param_2 + 0x10,&local_30);
    local_38 = &DAT_0052cb68;
    local_34 = *(int **)(*(int *)(param_1 + 100) + 0x10);
    if (local_34 != (int *)0x0) {
      puVar8 = (undefined1 *)(param_1 + 0x68);
      bVar1 = false;
      do {
        piVar3 = local_34;
        piVar4 = local_34 + 1;
        piVar5 = (int *)0x0;
        if (piVar4 != (int *)0x0) {
          piVar5 = local_34;
        }
        (**(code **)(*piVar5 + 0x14))(&local_48);
        if ((((local_48 <= local_30) && (local_30 <= local_40)) && (local_44 <= local_2c)) &&
           (local_2c <= local_3c)) {
          if (piVar3 == (int *)0x0) {
            piVar4 = (int *)0x0;
          }
          piVar3 = (int *)0x0;
          if (piVar4 != (int *)0x0) {
            piVar3 = piVar4 + -1;
          }
          FUN_00396d98(piVar3,1);
          piVar3 = (int *)0x0;
          piVar4 = local_34;
          if (local_34 != (int *)0x0) {
            piVar4 = local_34 + 1;
          }
          if (piVar4 != (int *)0x0) {
            piVar3 = piVar4 + -1;
          }
          pcVar7 = *(code **)(*piVar3 + 0x40);
          FUN_0030f7cc(auStack_70,"open");
          bVar1 = true;
          (*pcVar7)(piVar3,auStack_70,1);
          FUN_0030f7e0(auStack_70);
          *puVar8 = 1;
        }
        (*(code *)*local_38)(&local_38);
        puVar8 = puVar8 + 1;
      } while (local_34 != (int *)0x0);
      if ((bVar1) && (DAT_005a81b0 == '\0')) {
        local_74 = 1;
        local_94 = (undefined **)0x0;
        uVar6 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
        FUN_0000a298(&local_94);
        local_74 = 0;
        local_94 = &PTR_LAB_0052bf38;
        local_90 = PTR_FUN_004d9058;
        FUN_0002bc94(uVar6,"hatch-open",0x3f800000,0x3f800000,&local_94,0);
        FUN_0000a298(&local_94);
        DAT_005a81b0 = '\x01';
      }
    }
  }
  if (*(int *)puVar2 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0005cd54 — 0005cd54

```c

void FUN_0005cd54(undefined4 param_1,undefined4 param_2)

{
  undefined4 uVar1;
  int *piVar2;
  int iVar3;
  code *pcVar4;
  undefined1 auStack_c0 [40];
  undefined1 auStack_98 [40];
  undefined1 auStack_70 [40];
  undefined1 auStack_48 [40];
  undefined1 local_20 [4];
  int local_1c;
  
  local_1c = *(int *)PTR____stack_chk_guard_004d9044;
  uVar1 = FUN_003527fc();
  piVar2 = (int *)FUN_0005a638(uVar1,0);
  if (piVar2 == (int *)0x0) {
LAB_0005cda4:
    FUN_0030f7cc(auStack_98,"leaderboard");
    iVar3 = FUN_0039725c(param_2,auStack_98);
    FUN_0030f7e0(auStack_98);
    if (iVar3 != 0) {
      local_20[0] = 1;
      FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),local_20);
    }
    FUN_0030f7cc(auStack_c0,"leaderboardConnected");
    iVar3 = FUN_0039725c(param_2,auStack_c0);
    FUN_0030f7e0(auStack_c0);
    if (iVar3 == 0) goto LAB_0005ce68;
    local_20[0] = 0;
  }
  else {
    pcVar4 = *(code **)(*piVar2 + 0x40);
    uVar1 = FUN_00352c04();
    iVar3 = (*pcVar4)(piVar2,uVar1);
    if (PTR_DAT_004d9048[0x15] != '\0' || iVar3 != 1) goto LAB_0005cda4;
    FUN_0030f7cc(auStack_48,"leaderboard");
    iVar3 = FUN_0039725c(param_2,auStack_48);
    FUN_0030f7e0(auStack_48);
    if (iVar3 != 0) {
      local_20[0] = 0;
      FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),local_20);
    }
    FUN_0030f7cc(auStack_70,"leaderboardConnected");
    iVar3 = FUN_0039725c(param_2,auStack_70);
    FUN_0030f7e0(auStack_70);
    if (iVar3 == 0) goto LAB_0005ce68;
    local_20[0] = 1;
  }
  FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),local_20);
LAB_0005ce68:
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_1c) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0007417c — 0007417c

```c

void FUN_0007417c(int param_1)

{
  undefined *puVar1;
  int *piVar2;
  int iVar3;
  undefined4 uVar4;
  code *pcVar5;
  undefined **local_90;
  undefined *local_8c;
  undefined1 local_70;
  undefined1 auStack_6c [40];
  undefined1 auStack_44 [40];
  int local_1c;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_1c = *(int *)PTR____stack_chk_guard_004d9044;
  iVar3 = *(int *)(param_1 + 4);
  if (iVar3 != 0) {
    FUN_0030f7cc(auStack_44,"pause");
    piVar2 = (int *)FUN_0039725c(iVar3,auStack_44);
    FUN_0030f7e0(auStack_44);
    if (piVar2 != (int *)0x0) {
      pcVar5 = *(code **)(*piVar2 + 0x40);
      FUN_0030f7cc(auStack_6c,"animate_out");
      (*pcVar5)(piVar2,auStack_6c,1);
      FUN_0030f7e0(auStack_6c);
    }
  }
  local_70 = 1;
  local_90 = (undefined **)0x0;
  uVar4 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a8);
  FUN_0000a298(&local_90);
  local_70 = 0;
  local_90 = &PTR_LAB_0052bf38;
  local_8c = PTR_FUN_004d9154;
  FUN_000725cc(uVar4,0x3f800000,0x3f800000,&local_90);
  FUN_0000a298(&local_90);
  if (*(int *)puVar1 != local_1c) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0006c2b4 — 0006c2b4

```c

void FUN_0006c2b4(int param_1)

{
  undefined *puVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  _List_node_base *p_Var6;
  char *pcVar7;
  undefined1 *puVar8;
  int *piVar9;
  undefined4 *puVar10;
  undefined4 uVar11;
  code *pcVar12;
  undefined4 *puVar13;
  undefined1 auStack_464 [40];
  undefined1 auStack_43c [40];
  undefined1 auStack_414 [40];
  undefined1 auStack_3ec [40];
  undefined1 auStack_3c4 [40];
  undefined4 local_39c;
  undefined4 local_398;
  undefined4 uStack_394;
  undefined4 uStack_390;
  undefined4 local_38c;
  undefined4 local_388;
  undefined4 local_384;
  undefined1 auStack_380 [40];
  undefined1 auStack_358 [40];
  undefined1 auStack_330 [40];
  undefined1 auStack_308 [40];
  undefined1 auStack_2e0 [40];
  undefined1 auStack_2b8 [40];
  undefined1 auStack_290 [40];
  undefined1 auStack_268 [40];
  undefined1 auStack_240 [40];
  undefined1 auStack_218 [40];
  undefined1 auStack_1f0 [40];
  undefined *local_1c8;
  int local_1c4;
  undefined *local_1c0;
  undefined4 local_1bc;
  undefined1 local_1a8;
  undefined1 auStack_1a4 [40];
  undefined1 auStack_17c [40];
  undefined1 auStack_154 [40];
  undefined1 auStack_12c [40];
  undefined1 auStack_104 [40];
  uint local_dc [8];
  undefined1 local_bc;
  undefined4 local_b8;
  undefined4 local_b4;
  undefined1 auStack_b0 [128];
  undefined1 auStack_30 [12];
  int iStack_24;
  
  iStack_24 = *(int *)PTR____stack_chk_guard_004d9044;
  uVar11 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_104,"resultsContainer.BonusList");
  iVar2 = FUN_0039725c(uVar11,auStack_104);
  FUN_0030f7e0(auStack_104);
  uVar11 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_12c,"resultsContainer.BonusListFail");
  iVar3 = FUN_0039725c(uVar11,auStack_12c);
  FUN_0030f7e0(auStack_12c);
  if (iVar2 == 0) goto LAB_0006c938;
  iVar4 = FUN_0005edbc(PTR_DAT_004d9024);
  if (iVar4 != 1) {
    local_dc[0] = (uint)local_dc[0]._1_3_ << 8;
    FUN_0001da28(*(undefined4 *)(iVar2 + 0x260),local_dc);
    local_dc[0] = CONCAT31(local_dc[0]._1_3_,1);
    FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),local_dc);
    uVar11 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_3ec,"resultsContainer.Fail");
    iVar2 = FUN_0039725c(uVar11,auStack_3ec);
    FUN_0030f7e0(auStack_3ec);
    if (iVar2 != 0) {
      local_dc[0] = CONCAT31(local_dc[0]._1_3_,1);
      FUN_0001da28(*(undefined4 *)(iVar2 + 0x260),local_dc);
    }
    uVar11 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_414,"resultsContainer.Success");
    iVar2 = FUN_0039725c(uVar11,auStack_414);
    FUN_0030f7e0(auStack_414);
    if (iVar2 != 0) {
      local_dc[0] = local_dc[0] & 0xffffff00;
      FUN_0001da28(*(undefined4 *)(iVar2 + 0x260),local_dc);
    }
    uVar11 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_43c,"resultsContainer.textTotal");
    iVar2 = FUN_0039725c(uVar11,auStack_43c);
    FUN_0030f7e0(auStack_43c);
    if (iVar2 != 0) {
      local_dc[0] = local_dc[0] & 0xffffff00;
      FUN_0001da28(*(undefined4 *)(iVar2 + 0x260),local_dc);
    }
    uVar11 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_464,"@totalScore");
    iVar2 = FUN_0039725c(uVar11,auStack_464);
    FUN_0030f7e0(auStack_464);
    if (iVar2 != 0) {
      local_dc[0] = local_dc[0] & 0xffffff00;
      FUN_0001da28(*(undefined4 *)(iVar2 + 0x260),local_dc);
    }
    goto LAB_0006c938;
  }
  local_dc[0]._0_1_ = 1;
  FUN_0001da28(*(undefined4 *)(iVar2 + 0x260),local_dc);
  iVar4 = 0;
  local_dc[0] = (uint)local_dc[0]._1_3_ << 8;
  FUN_0001da28(*(undefined4 *)(iVar3 + 0x260),local_dc);
  uVar11 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_154,"@totalScore");
  iVar3 = FUN_0039725c(uVar11,auStack_154);
  FUN_0030f7e0(auStack_154);
  do {
    uVar11 = FUN_000659a0(*(int *)(param_1 + 8) + 8,iVar4);
    FUN_0030f7cc(auStack_17c,(&DAT_00538c54)[iVar4]);
    iVar5 = FUN_0039725c(iVar2,auStack_17c);
    FUN_0030f7e0(auStack_17c);
    if (iVar5 != 0) {
      local_dc[0] = CONCAT31(local_dc[0]._1_3_,1);
      FUN_0001da28(*(undefined4 *)(iVar5 + 0x260),local_dc);
      *(undefined4 *)(iVar5 + 0x880) = uVar11;
      FUN_003d0bf4(iVar5);
      puVar13 = (undefined4 *)(iVar5 + 0x3cc);
      if (*(int *)(iVar5 + 0x3d4) == 0) {
        FUN_0003ca68(puVar13);
        *puVar13 = puVar13;
        *(undefined4 **)(iVar5 + 0x3d0) = puVar13;
      }
      else {
        puVar10 = (undefined4 *)*puVar13;
        if (puVar10 != puVar13) {
          puVar10[0xb] = *(int *)(iVar5 + 0x3d4);
          puVar10[0xc] = 2;
          *(int *)(iVar5 + 0x3d8) = *(int *)(iVar5 + 0x3d8) + 1;
          for (puVar10 = (undefined4 *)*puVar10; puVar10 != puVar13;
              puVar10 = (undefined4 *)*puVar10) {
            puVar10[0xb] = *(undefined4 *)(iVar5 + 0x3d4);
            puVar10[0xc] = 2;
            *(int *)(iVar5 + 0x3d8) = *(int *)(iVar5 + 0x3d8) + 1;
          }
        }
      }
    }
    iVar4 = iVar4 + 1;
  } while (iVar4 != 3);
  FUN_0030f7cc(auStack_1a4,"@divider");
  iVar2 = FUN_0039725c(iVar2,auStack_1a4);
  FUN_0030f7e0(auStack_1a4);
  if (iVar2 != 0 && iVar3 != 0) {
    local_1a8 = 1;
    local_1c8 = (undefined *)0x0;
    FUN_0003c910(&local_1c8);
    local_1a8 = 0;
    local_1c8 = &DAT_0052cc58;
    local_1bc = 0;
    local_1c0 = PTR_FUN_004d919c;
    local_bc = 1;
    local_dc[0] = 0;
    local_1c4 = iVar3;
    (*(code *)PTR_FUN_0052cc60)(&local_1c8,local_dc);
    local_b8 = 0;
    local_b4 = 0;
    p_Var6 = (_List_node_base *)FUN_0003c96c(iVar2 + 0x3cc,local_dc);
    std::_List_node_base::hook(p_Var6);
    FUN_0003c910(local_dc);
    if (*(int *)(iVar2 + 0x3d4) != 0) {
      iVar3 = *(int *)(iVar2 + 0x3d0);
      *(int *)(iVar3 + 0x2c) = *(int *)(iVar2 + 0x3d4);
      *(undefined4 *)(iVar3 + 0x30) = 1;
      *(int *)(iVar2 + 0x3d8) = *(int *)(iVar2 + 0x3d8) + 1;
    }
    FUN_0003c910(&local_1c8);
  }
  uVar11 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_1f0,"@reflexTime");
  iVar2 = FUN_0039725c(uVar11,auStack_1f0);
  FUN_0030f7e0(auStack_1f0);
  if (iVar2 != 0) {
    FUN_000659d0(*(int *)(param_1 + 8) + 8,2,auStack_30,10);
    FUN_0030f7cc(auStack_218,auStack_30);
    FUN_00022950(*(undefined4 *)(iVar2 + 0x7dc),auStack_218);
    FUN_0030f7e0(auStack_218);
  }
  uVar11 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_240,"@comboAmount");
  iVar2 = FUN_0039725c(uVar11,auStack_240);
  FUN_0030f7e0(auStack_240);
  if (iVar2 != 0) {
    iVar3 = FUN_000276e8(*(undefined4 *)(PTR_DAT_004d9048 + 0x5c),"combos");
    if (iVar3 == 1) {
      pcVar7 = "FN_PUSS_CHALLENGE_COMBO";
LAB_0006c6c2:
      puVar8 = (undefined1 *)FUN_00038844(pcVar7,0);
    }
    else {
      if (iVar3 == 0) {
        pcVar7 = "FN_PUSS_CHALLENGE_NO_COMBOS";
        goto LAB_0006c6c2;
      }
      uVar11 = FUN_00038844("FN_PUSS_CHALLENGE_COMBOS",0);
      puVar8 = auStack_b0;
      FUN_002f702c(puVar8,0x80,uVar11,iVar3);
    }
    FUN_0030f7cc(auStack_268,puVar8);
    FUN_00022950(*(undefined4 *)(iVar2 + 0x7dc),auStack_268);
    FUN_0030f7e0(auStack_268);
  }
  uVar11 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_290,"@missAmount");
  iVar2 = FUN_0039725c(uVar11,auStack_290);
  FUN_0030f7e0(auStack_290);
  puVar1 = PTR_DAT_004d9048;
  if (iVar2 != 0) {
    iVar3 = FUN_000276e8(*(undefined4 *)(PTR_DAT_004d9048 + 0x5c),"slashes");
    iVar4 = FUN_000276e8(*(undefined4 *)(puVar1 + 0x5c),"slashesScoring");
    if (iVar3 == iVar4) {
      pcVar7 = "FN_PUSS_CHALLENGE_NO_MISSES";
LAB_0006c77e:
      puVar8 = (undefined1 *)FUN_00038844(pcVar7,0);
    }
    else {
      if (iVar3 - iVar4 == 1) {
        pcVar7 = "FN_PUSS_CHALLENGE_MISS";
        goto LAB_0006c77e;
      }
      uVar11 = FUN_00038844("FN_PUSS_CHALLENGE_MISSES",0);
      puVar8 = auStack_b0;
      FUN_002f702c(puVar8,0x80,uVar11,iVar3 - iVar4);
    }
    FUN_0030f7cc(auStack_2b8,puVar8);
    FUN_00022950(*(undefined4 *)(iVar2 + 0x7dc),auStack_2b8);
    FUN_0030f7e0(auStack_2b8);
  }
  uVar11 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_2e0,"resultsContainer.Fail");
  iVar2 = FUN_0039725c(uVar11,auStack_2e0);
  FUN_0030f7e0(auStack_2e0);
  if (iVar2 != 0) {
    local_dc[0] = local_dc[0] & 0xffffff00;
    FUN_0001da28(*(undefined4 *)(iVar2 + 0x260),local_dc);
  }
  uVar11 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_308,"resultsContainer.Success");
  iVar2 = FUN_0039725c(uVar11,auStack_308);
  FUN_0030f7e0(auStack_308);
  if (iVar2 != 0) {
    local_dc[0] = CONCAT31(local_dc[0]._1_3_,1);
    FUN_0001da28(*(undefined4 *)(iVar2 + 0x260),local_dc);
  }
  uVar11 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_330,"resultsContainer.textTotal");
  iVar2 = FUN_0039725c(uVar11,auStack_330);
  FUN_0030f7e0(auStack_330);
  if (iVar2 != 0) {
    local_dc[0] = CONCAT31(local_dc[0]._1_3_,1);
    FUN_0001da28(*(undefined4 *)(iVar2 + 0x260),local_dc);
  }
  uVar11 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_358,"@totalScore");
  iVar2 = FUN_0039725c(uVar11,auStack_358);
  FUN_0030f7e0(auStack_358);
  if (iVar2 != 0) {
    local_dc[0] = CONCAT31(local_dc[0]._1_3_,1);
    FUN_0001da28(*(undefined4 *)(iVar2 + 0x260),local_dc);
  }
  uVar11 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_380,"@rank");
  piVar9 = (int *)FUN_0039725c(uVar11,auStack_380);
  FUN_0030f7e0(auStack_380);
  if (piVar9 != (int *)0x0) {
    local_dc[0] = CONCAT31(local_dc[0]._1_3_,1);
    FUN_0001da28(piVar9[0x98],local_dc);
    iVar2 = *(int *)(param_1 + 8);
    local_39c = *(undefined4 *)(iVar2 + 0x48);
    local_398 = *(undefined4 *)(iVar2 + 0x4c);
    uStack_394 = *(undefined4 *)(iVar2 + 0x50);
    uStack_390 = *(undefined4 *)(iVar2 + 0x54);
    local_38c = *(undefined4 *)(iVar2 + 0x58);
    local_388 = *(undefined4 *)(iVar2 + 0x5c);
    local_384 = *(undefined4 *)(iVar2 + 0x60);
    uVar11 = FUN_00066b50(&local_39c);
    FUN_002f702c(auStack_b0,0x80,"triggerRank%i",uVar11);
    pcVar12 = *(code **)(*piVar9 + 0x40);
    FUN_0030f7cc(auStack_3c4,auStack_b0);
    (*pcVar12)(piVar9,auStack_3c4,1);
    FUN_0030f7e0(auStack_3c4);
  }
LAB_0006c938:
  if (*(int *)PTR____stack_chk_guard_004d9044 != iStack_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0004c580 — 0004c580

```c

void FUN_0004c580(int *param_1)

{
  bool bVar1;
  int iVar2;
  int iVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  int *piVar6;
  int *piVar7;
  byte bVar8;
  code *pcVar9;
  bool bVar10;
  undefined8 uVar11;
  ulonglong uVar12;
  ulonglong uVar13;
  undefined8 in_d16;
  undefined8 uVar14;
  undefined8 uVar15;
  int *local_a8;
  undefined *local_a4;
  int *local_a0;
  undefined1 *local_9c;
  undefined4 uStack_98;
  undefined1 local_84;
  undefined1 auStack_80 [40];
  undefined1 local_58 [4];
  int local_54;
  
  local_54 = *(int *)PTR____stack_chk_guard_004d9044;
  (**(code **)(*param_1 + 0x10))(param_1);
  piVar7 = (int *)0x0;
  iVar2 = FUN_0001cfb0(*(undefined4 *)(PTR_DAT_004d9048 + 0x654),"shopScreen",0);
  param_1[0x2e] = iVar2;
  if (iVar2 != 0) {
    local_58[0] = 1;
    FUN_0001da28(*(undefined4 *)(iVar2 + 0x260),local_58);
    piVar6 = (int *)param_1[0x2e];
    pcVar9 = *(code **)(*piVar6 + 0x40);
    FUN_0030f7cc(auStack_80,"animate_in");
    (*pcVar9)(piVar6,auStack_80,1);
    FUN_0030f7e0(auStack_80);
  }
  param_1[0x28] = 0;
  param_1[0x29] = 0;
  param_1[0x2a] = 0;
  param_1[0x2b] = 0;
  param_1[0x23] = 0x80;
  piVar6 = operator_new(0x100);
  FUN_00049584();
  param_1[0x27] = (int)piVar6;
  (**(code **)(*piVar6 + 0x54))(piVar6,0x43910000);
  (**(code **)(*(int *)param_1[0x27] + 0x50))((int *)param_1[0x27],0x42a00000);
  (**(code **)(*(int *)param_1[0x27] + 0x58))((int *)param_1[0x27],0x42a00000);
  FUN_0003e9e8(*(undefined4 *)(PTR_DAT_004d9048 + 0x4c),param_1[0x27],0);
  iVar2 = FUN_0002ede8();
  local_a8 = *(int **)(iVar2 + 0xc);
  if (local_a8 == *(int **)(iVar2 + 0x10)) {
    uVar12 = 0;
  }
  else {
    iVar2 = *local_a8;
    if (iVar2 == 0) {
      uVar12 = 0;
      piVar7 = (int *)0x0;
    }
    else {
      local_a8 = local_a8 + 1;
      uVar13 = 0;
      uVar12 = 0;
      bVar8 = 1;
      bVar1 = true;
      do {
        piVar7 = operator_new(0x2a0);
        FUN_0004a9a4();
        FUN_0004aaf8(piVar7,iVar2,param_1);
        *(byte *)((int)piVar7 + 0x29f) = bVar8;
        FUN_0004a058(param_1[0x27],piVar7);
        local_84 = 1;
        local_a4 = (undefined *)0x0;
        FUN_0004a5c8(&local_a4);
        local_84 = 0;
        local_a4 = &DAT_0052c7a8;
        local_9c = &FUN_0004c4d0_1;
        uStack_98 = 0;
        local_a0 = param_1;
        (*(code *)PTR_FUN_0052c7b0)(&local_a4,piVar7 + 0xc);
        FUN_0004a5c8(&local_a4);
        iVar3 = FUN_0002ede8();
        bVar8 = bVar8 ^ 1;
        if (*(int *)(iVar3 + *(int *)(iVar2 + 0x10) * 4) == iVar2) {
          param_1[*(int *)(iVar2 + 0x10) + 0x29] = (int)piVar7;
        }
        else if (*(char *)(iVar2 + 0x41) == '\0' && (float)uVar12 == 0.0) {
          uVar12 = uVar13 & 0xffffffff;
        }
        if (bVar1) {
          FUN_0004afe8(param_1,piVar7);
          *(undefined1 *)(piVar7 + 0xa7) = 1;
        }
        iVar2 = (**(code **)(*piVar7 + 8))(piVar7);
        iVar3 = FUN_0002ede8();
        bVar10 = local_a8 != *(int **)(iVar3 + 0x10);
        if (bVar10) {
          in_d16 = CONCAT44(iVar2,iVar2);
          bVar1 = false;
        }
        uVar13 = FloatVectorAdd(uVar13,in_d16,2);
        if (bVar10) {
          iVar2 = *local_a8;
          local_a8 = local_a8 + 1;
        }
      } while (bVar10 && iVar2 != 0);
    }
  }
  uVar11 = FloatVectorNeg(uVar12,2,2);
  DAT_0052c720 = (int)uVar11;
  *(undefined1 *)((int)piVar7 + 0x29d) = 1;
  iVar2 = param_1[0x27];
  uVar4 = FUN_00025164((int)uVar11);
  uVar5 = FUN_00025164();
  uVar11 = FloatVectorMult(CONCAT44(uVar5,uVar5),0x3f1000003f100000,2,0x20);
  uVar5 = FUN_00025164();
  uVar14 = FloatVectorMult(CONCAT44(uVar4,uVar4),0xbf000000bf000000,2,0x20);
  uVar11 = FloatVectorMult(uVar11,0x3f0000003f000000,2,0x20);
  uVar15 = FloatVectorMult(CONCAT44(uVar5,uVar5),0x3f1000003f100000,2,0x20);
  uVar11 = FloatVectorAdd(uVar14,uVar11,2);
  uVar14 = FloatVectorMult(uVar15,0xbfc00000bfc00000,2,0x20);
  uVar11 = FloatVectorAdd(uVar11,uVar14,2);
  *(int *)(iVar2 + 8) = (int)uVar11;
  *(undefined4 *)(iVar2 + 0xc) = 0x42200000;
  *(undefined4 *)(iVar2 + 0x10) = 0;
  (**(code **)(*(int *)param_1[0x27] + 8))((int)uVar11);
  iVar2 = DAT_0052c720;
  piVar7 = (int *)param_1[0x27];
  piVar7[0x36] = DAT_0052c720;
  piVar7[0xd] = 0x80;
  (**(code **)(*piVar7 + 0x28))(iVar2,piVar7,0);
  FUN_00022064();
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_54) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_000547ec — 000547ec

```c

undefined4 FUN_000547ec(undefined1 *param_1,int param_2)

{
  longlong lVar1;
  undefined *puVar2;
  undefined *puVar3;
  uint *puVar4;
  int iVar5;
  undefined4 uVar6;
  float fVar7;
  undefined4 uVar8;
  uint uVar9;
  uint uVar10;
  void *pvVar11;
  undefined4 *puVar12;
  int iVar13;
  undefined4 uVar14;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined4 extraout_s1_03;
  undefined8 uVar15;
  undefined4 local_54;
  undefined4 local_50;
  undefined4 local_4c;
  undefined4 local_48;
  undefined4 local_44;
  float local_40;
  undefined4 local_3c;
  undefined4 local_38;
  undefined4 local_34;
  
  iVar5 = FUN_0001cd6c();
  puVar4 = DAT_005a7930;
  puVar2 = PTR_DAT_004d9050;
  if (iVar5 == 0) {
    lVar1 = (ulonglong)*(uint *)PTR_DAT_004d9050 * (ulonglong)*(uint *)(PTR_DAT_004d9050 + 8);
    uVar10 = (uint)lVar1;
    uVar9 = *(int *)(PTR_DAT_004d9050 + 4) * *(uint *)(PTR_DAT_004d9050 + 8) +
            *(uint *)PTR_DAT_004d9050 * *(int *)(PTR_DAT_004d9050 + 0xc) +
            (int)((ulonglong)lVar1 >> 0x20) +
            *(int *)(PTR_DAT_004d9050 + 0x14) +
            (uint)CARRY4(uVar10,*(uint *)(PTR_DAT_004d9050 + 0x10));
    *(uint *)PTR_DAT_004d9050 = uVar10 + *(uint *)(PTR_DAT_004d9050 + 0x10);
    *(uint *)(puVar2 + 4) = uVar9;
    *puVar4 = uVar9;
    puVar4[1] = 0;
    puVar4[2] = 0x6c078965;
    puVar4[3] = 0x5d588b65;
    puVar4[4] = 0x269ec3;
    puVar4[5] = 0;
  }
  FUN_00031290();
  FUN_00031d2c();
  param_1[0x35] = 1;
  param_1[0x36] = 0;
  param_1[0x37] = 0;
  *(undefined4 *)(param_1 + 0x38) = 0xffffffff;
  *(undefined4 *)(param_1 + 0x28) = 0;
  *(undefined4 *)(param_1 + 0x208) = 1;
  *(undefined4 *)(param_1 + 0x20c) = 0;
  *(undefined4 *)(param_1 + 0x210) = 0;
  pvVar11 = *(void **)(param_1 + 0x24);
  uVar14 = extraout_s1;
  if (pvVar11 != (void *)0x0) {
    FUN_00058fb0(pvVar11);
    operator_delete(pvVar11);
    *(undefined4 *)(param_1 + 0x24) = 0;
    uVar14 = extraout_s1_00;
  }
  puVar12 = *(undefined4 **)(param_1 + 0x20);
  if (puVar12 != (undefined4 *)0x0) {
    if ((void *)*puVar12 != (void *)0x0) {
      operator_delete((void *)*puVar12);
    }
    operator_delete(puVar12);
    *(undefined4 *)(param_1 + 0x20) = 0;
    uVar14 = extraout_s1_01;
  }
  *(undefined4 *)(param_1 + 0x214) = 0;
  puVar2 = PTR_DAT_004d9048;
  *(undefined4 *)(param_1 + 0x40) = 0;
  *(undefined4 *)(param_1 + 0x44) = 0;
  *(undefined4 *)(param_1 + 0x48) = 0;
  puVar2[0x17] = 0;
  param_1[0x179] = 0;
  param_1[0x17a] = 0;
  *param_1 = 0;
  puVar4 = DAT_005a7930;
  fVar7 = DAT_00054bd4;
  lVar1 = (ulonglong)*DAT_005a7930 * (ulonglong)DAT_005a7930[2];
  uVar10 = (uint)lVar1;
  uVar9 = DAT_005a7930[1] * DAT_005a7930[2] +
          *DAT_005a7930 * DAT_005a7930[3] + (int)((ulonglong)lVar1 >> 0x20) +
          DAT_005a7930[5] + (uint)CARRY4(uVar10,DAT_005a7930[4]);
  uVar8 = (undefined4)((ulonglong)uVar9 * 0x7ffff >> 0x20);
  *DAT_005a7930 = uVar10 + DAT_005a7930[4];
  puVar4[1] = uVar9;
  uVar15 = FixedToFP(CONCAT44(uVar8,uVar8),0,1,0,0x20);
  uVar15 = FloatVectorMult(CONCAT44(uVar14,(float)uVar15 / fVar7),0x4120000041200000,2,0x20);
  uVar15 = FloatVectorAdd(uVar15,0x4120000041200000,2);
  uVar14 = (undefined4)uVar15;
  *(undefined4 *)(param_1 + 0x17c) = uVar14;
  if (*(int *)(puVar2 + 0x10) != 1) {
    uVar14 = FUN_0001cda4(0,0xffffffff);
  }
  FUN_0000a6e4(uVar14,0xffffffff);
  puVar2[0x19] = 0;
  puVar3 = PTR_DAT_004d90f8;
  *(undefined4 *)PTR_DAT_004d90fc = 0;
  *(undefined4 *)puVar3 = 1;
  *(undefined4 *)(param_1 + 0x16c) = 0xffffffff;
  *(undefined4 *)(param_1 + 0x218) = 0;
  *(undefined4 *)(param_1 + 0x174) = 0;
  *(undefined4 *)(param_1 + 0x54) = 0;
  *(undefined4 *)(param_1 + 0x58) = 0;
  *(undefined4 *)(param_1 + 0x4c) = 0;
  *(undefined4 *)(param_1 + 0x60) = 0;
  *(undefined4 *)(param_1 + 0x5c) = 0;
  param_1[0x178] = 1;
  puVar2[0x5d0] = 1;
  *(undefined4 *)(puVar2 + 0x5d4) = 0;
  uVar6 = (**(code **)(**(int **)(puVar2 + 0x58) + 0x2c))();
  uVar8 = DAT_0052bfe4;
  uVar14 = DAT_0052bfe0;
  uVar15 = FloatVectorMult(CONCAT44(uVar6,uVar6),CONCAT44(extraout_s1_02,DAT_00054bd8),2,0x20);
  uVar15 = FPToFixed(uVar15,0,0,3,0x20);
  fVar7 = (float)FUN_003010ec((uint)uVar15 & 0xffff);
  uVar6 = FUN_000251a8();
  local_3c = DAT_0052bfe0;
  local_38 = DAT_0052bfe4;
  local_34 = DAT_0052bfe8;
  (**(code **)(**(int **)(puVar2 + 0x58) + 0x30))(DAT_0052bfe0,*(int **)(puVar2 + 0x58),&local_3c);
  uVar15 = FloatVectorMult(CONCAT44(uVar6,uVar6),0x3f0000003f000000,2,0x20);
  local_48 = uVar14;
  local_40 = (float)uVar15 / fVar7;
  local_44 = uVar8;
  (**(code **)(**(int **)(puVar2 + 0x58) + 0x38))(local_40,*(int **)(puVar2 + 0x58),&local_48);
  local_54 = 0;
  local_50 = 0x3f800000;
  local_4c = 0;
  (**(code **)(**(int **)(puVar2 + 0x58) + 0x40))(*(int **)(puVar2 + 0x58),&local_54);
  if (*(int *)(puVar2 + 0x4c) != 0) {
    FUN_0003e854();
  }
  FUN_000137e8(0);
  FUN_000096c4();
  if (param_2 == 1) {
    uVar14 = FUN_000065c4();
    iVar5 = FUN_00006aa4(uVar14,1,0);
    if (iVar5 != 0) {
      iVar13 = 1;
      do {
        *(undefined1 *)(iVar5 + 0xc4) = 1;
        uVar14 = FUN_000065c4();
        iVar5 = FUN_00006aa4(uVar14,1,iVar13);
        iVar13 = iVar13 + 1;
      } while (iVar5 != 0);
    }
    uVar14 = FUN_000065c4();
    iVar5 = FUN_00006aa4(uVar14,2,0);
    if (iVar5 != 0) {
      iVar13 = 1;
      do {
        *(undefined1 *)(iVar5 + 0x8c) = 1;
        uVar14 = FUN_000065c4();
        iVar5 = FUN_00006aa4(uVar14,2,iVar13);
        iVar13 = iVar13 + 1;
      } while (iVar5 != 0);
    }
  }
  FUN_00054bdc(param_1);
  *(undefined4 *)(param_1 + 0x2c) = 0;
  *(undefined4 *)(param_1 + 0x200) = 0;
  *(undefined4 *)(param_1 + 0x204) = 1;
  _memset(param_1 + 0x180,0xff,0x80);
  if (*(int *)(puVar2 + 0x10) == 1) {
    iVar5 = *(int *)(param_1 + 0x164) * 0xc + 0x140;
  }
  else {
    iVar5 = *(int *)(puVar2 + 0x10) * 0xc + 0x98;
  }
  if (*(int *)((int)(param_1 + iVar5) + 4) != *(int *)(param_1 + iVar5)) {
    iVar5 = FUN_0001cd6c();
    if (iVar5 == 0) {
      FUN_00054dd8(param_1,0);
    }
    FUN_0001cd70();
    uVar15 = FloatVectorAdd(CONCAT44(extraout_s1_03,*(undefined4 *)(param_1 + 0x170)),
                            0x3f8000003f800000,2);
    *(int *)(param_1 + 0x170) = (int)uVar15;
  }
  uVar9 = 0;
  puVar2[0x1bf] = 0;
  *(undefined4 *)(param_1 + 0x78) = 0x3f800000;
  uVar14 = *(undefined4 *)(param_1 + *(int *)(puVar2 + 0x10) * 4 + 0x88);
  *(undefined4 *)(param_1 + 0x74) = uVar14;
  *(undefined4 *)(param_1 + 0x7c) = 0x3f800000;
  iVar5 = *(int *)(param_1 + 0x21c);
  if (*(int *)(param_1 + 0x220) != iVar5) {
    do {
      uVar14 = (**(code **)(**(int **)(iVar5 + uVar9 * 4) + 0x10))();
      iVar5 = *(int *)(param_1 + 0x21c);
      uVar9 = uVar9 + 1;
    } while (uVar9 < (uint)(*(int *)(param_1 + 0x220) - iVar5 >> 2));
  }
  if (param_2 == 1) {
    *(undefined4 *)(param_1 + 0x74) = 0x3f800000;
    *(undefined4 *)(param_1 + 0x214) = 0;
    uVar14 = FUN_00031290();
    uVar14 = FUN_000322dc(uVar14,1);
  }
  return uVar14;
}


```

## FUN_0005f94c — 0005f94c

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

## FUN_000479c0 — 000479c0

```c

void FUN_000479c0(int param_1)

{
  undefined *puVar1;
  undefined *puVar2;
  undefined *puVar3;
  int iVar4;
  code *pcVar5;
  int *piVar6;
  undefined1 auStack_e8 [40];
  undefined1 auStack_c0 [40];
  undefined1 auStack_98 [40];
  undefined1 auStack_70 [40];
  undefined **local_48;
  undefined *local_44;
  undefined1 local_28;
  int local_24;
  
  puVar2 = PTR_DAT_004d9048;
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  if (*(int *)(param_1 + 0xb0) == 3) {
    *(undefined4 *)(param_1 + 0xb0) = 4;
    local_28 = 1;
    local_48 = (undefined **)0x0;
    piVar6 = *(int **)(puVar2 + 0x1a4);
    FUN_0000a298(&local_48);
    local_28 = 0;
    local_48 = &PTR_LAB_0052bf38;
    local_44 = PTR_FUN_004d9058;
    FUN_0002bc94(piVar6,"Unpause",0,0x3f800000,&local_48,0);
    FUN_0000a298(&local_48);
    if (*(int *)(puVar2 + 0x1a4) != 0) {
      FUN_0002baf0();
    }
    iVar4 = *(int *)puVar2;
    if (iVar4 != 0) {
      piVar6 = *(int **)(iVar4 + 4);
    }
    if (iVar4 != 0 && piVar6 != (int *)0x0) {
      pcVar5 = *(code **)(*piVar6 + 0x40);
      FUN_0030f7cc(auStack_70,"animate_in_pause");
      (*pcVar5)(piVar6,auStack_70,1);
      FUN_0030f7e0(auStack_70);
      FUN_0030f7cc(auStack_98,"backgroundControl");
      iVar4 = FUN_0039725c(piVar6,auStack_98);
      FUN_0030f7e0(auStack_98);
      if (iVar4 != 0) {
        FUN_0007c97c(iVar4);
      }
    }
    *(undefined4 *)(param_1 + 0xb0) = 4;
    puVar3 = PTR_DAT_004d9050;
    if (puVar2[0x57] != '\0') {
      *(undefined4 *)PTR_DAT_004d9050 = *(undefined4 *)(puVar2 + 0x1b4);
      *(undefined4 *)(puVar3 + 4) = 0;
      *(undefined4 *)(puVar3 + 8) = 0x6c078965;
      *(undefined4 *)(puVar3 + 0xc) = 0x5d588b65;
      *(undefined4 *)(puVar3 + 0x10) = 0x269ec3;
      *(undefined4 *)(puVar3 + 0x14) = 0;
    }
    puVar2[0x57] = 0;
  }
  FUN_0030f7cc(auStack_c0,"pause");
  FUN_0030f7cc(auStack_e8,"animate_out");
  FUN_0003f430(param_1,auStack_c0,auStack_e8,0,0);
  FUN_0030f7e0(auStack_e8);
  FUN_0030f7e0(auStack_c0);
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0004d1f0 — 0004d1f0

```c

void FUN_0004d1f0(int param_1)

{
  longlong lVar1;
  longlong lVar2;
  float fVar3;
  undefined *puVar4;
  undefined *puVar5;
  undefined *puVar6;
  undefined4 uVar7;
  uint uVar8;
  uint uVar9;
  undefined4 uVar10;
  int *piVar11;
  undefined4 uVar12;
  uint uVar13;
  uint uVar14;
  code *pcVar15;
  int iVar16;
  uint uVar17;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined8 uVar18;
  undefined8 uVar19;
  undefined8 uVar20;
  undefined1 auStack_70 [40];
  undefined **local_48;
  undefined *local_44;
  undefined1 local_28;
  int local_24;
  
  puVar4 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_00020ef8();
  puVar5 = PTR_DAT_004d9048;
  local_28 = 1;
  local_48 = (undefined **)0x0;
  uVar10 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
  FUN_0000a298(&local_48);
  local_28 = 0;
  local_48 = &PTR_LAB_0052bf38;
  local_44 = PTR_FUN_004d9058;
  FUN_0002bc94(uVar10,"menu-bomb",0x3f800000,0x3f800000,&local_48,0);
  FUN_0000a298(&local_48);
  *(undefined4 *)(param_1 + 0x7c) = 2;
  piVar11 = *(int **)(param_1 + 0xb8);
  uVar10 = extraout_s1;
  if (piVar11 != (int *)0x0) {
    pcVar15 = *(code **)(*piVar11 + 0x40);
    FUN_0030f7cc(auStack_70,"animate_out");
    (*pcVar15)(piVar11,auStack_70,1);
    FUN_0030f7e0(auStack_70);
    uVar10 = extraout_s1_00;
  }
  puVar6 = PTR_DAT_004d9050;
  fVar3 = DAT_0004d374;
  iVar16 = *(int *)(*(int *)(param_1 + 0x90) + 0x134);
  *(undefined1 *)(iVar16 + 0x90) = 1;
  uVar13 = *(uint *)(puVar6 + 8);
  uVar14 = *(uint *)(puVar6 + 0x10);
  lVar1 = (ulonglong)*(uint *)puVar6 * (ulonglong)uVar13;
  uVar8 = (uint)lVar1;
  uVar9 = uVar8 + uVar14;
  lVar2 = (ulonglong)uVar9 * (ulonglong)uVar13;
  uVar17 = (uint)lVar2;
  uVar8 = *(int *)(puVar6 + 4) * uVar13 +
          *(uint *)puVar6 * *(int *)(puVar6 + 0xc) + (int)((ulonglong)lVar1 >> 0x20) +
          *(int *)(puVar6 + 0x14) + (uint)CARRY4(uVar8,uVar14);
  uVar12 = (undefined4)((ulonglong)uVar8 * 0x7ffff >> 0x20);
  uVar8 = *(int *)(puVar6 + 0x14) +
          uVar8 * uVar13 + uVar9 * *(int *)(puVar6 + 0xc) + (int)((ulonglong)lVar2 >> 0x20) +
          (uint)CARRY4(uVar17,uVar14);
  uVar7 = (undefined4)((ulonglong)uVar8 * 0x7ffff >> 0x20);
  *(uint *)puVar6 = uVar17 + uVar14;
  *(uint *)(puVar6 + 4) = uVar8;
  uVar18 = FixedToFP(CONCAT44(uVar12,uVar12),0,1,0,0x20);
  uVar20 = FixedToFP(CONCAT44(uVar7,uVar7),0,1,0,0x20);
  *(undefined4 *)(iVar16 + 0x24) = 0;
  uVar18 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar18 >> 0x20),(float)uVar18 / fVar3),
                           0x40a0000040a00000,2,0x20);
  uVar19 = FloatVectorAdd(uVar18,0x40a0000040a00000,2);
  uVar18 = FloatVectorMult(CONCAT44(uVar10,(float)uVar20 / fVar3),0xc0a00000c0a00000,2,0x20);
  *(int *)(iVar16 + 0x1c) = (int)uVar19;
  *(int *)(iVar16 + 0x20) = (int)uVar18;
  FUN_000524bc((int)uVar18,*(undefined4 *)(puVar5 + 400),0);
  if (*(int *)puVar4 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0005cba4 — 0005cba4

```c

void FUN_0005cba4(int param_1)

{
  undefined *puVar1;
  undefined4 uVar2;
  int *piVar3;
  int iVar4;
  _List_node_base *p_Var5;
  int iVar6;
  undefined4 *puVar7;
  undefined4 *puVar8;
  code *pcVar9;
  undefined *local_c4;
  undefined *local_c0;
  undefined1 local_a4;
  undefined1 auStack_a0 [40];
  undefined1 auStack_78 [40];
  undefined4 local_50 [8];
  undefined1 local_30;
  undefined4 local_2c;
  undefined4 local_28;
  int local_24;
  
  puVar1 = PTR_DAT_004d9048;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(PTR_DAT_004d9048 + 0x38) = *(undefined4 *)(PTR_DAT_004d9048 + 0x30);
  uVar2 = FUN_00052f80();
  FUN_000547ec(uVar2,0);
  *(undefined4 *)(puVar1 + 0x20) = 0;
  puVar1[0x17] = 0;
  puVar1[0x1b1] = 1;
  FUN_00052f80();
  FUN_0005520c();
  FUN_0001d130(puVar1);
  FUN_0001d154(puVar1);
  piVar3 = (int *)(**(code **)(**(int **)puVar1 + 0x20))();
  if (piVar3 != (int *)0x0) {
    pcVar9 = *(code **)(*piVar3 + 0x40);
    FUN_0030f7cc(auStack_78,"animate_in");
    (*pcVar9)(piVar3,auStack_78,1);
    FUN_0030f7e0(auStack_78);
    FUN_0030f7cc(auStack_a0,"pause");
    iVar4 = FUN_0039725c(piVar3,auStack_a0);
    FUN_0030f7e0(auStack_a0);
    if (iVar4 != 0) {
      puVar8 = (undefined4 *)(iVar4 + 0xb34);
      if (*(int *)(iVar4 + 0xb3c) == 0) {
        FUN_00022608(puVar8);
        *puVar8 = puVar8;
        *(undefined4 **)(iVar4 + 0xb38) = puVar8;
      }
      else {
        puVar7 = (undefined4 *)*puVar8;
        if (puVar7 != puVar8) {
          puVar7[0xb] = *(int *)(iVar4 + 0xb3c);
          puVar7[0xc] = 2;
          *(int *)(iVar4 + 0xb40) = *(int *)(iVar4 + 0xb40) + 1;
          for (puVar7 = (undefined4 *)*puVar7; puVar7 != puVar8; puVar7 = (undefined4 *)*puVar7) {
            puVar7[0xb] = *(undefined4 *)(iVar4 + 0xb3c);
            puVar7[0xc] = 2;
            *(int *)(iVar4 + 0xb40) = *(int *)(iVar4 + 0xb40) + 1;
          }
        }
      }
      local_a4 = 1;
      local_c4 = (undefined *)0x0;
      FUN_00022510(&local_c4);
      local_a4 = 0;
      local_c4 = &DAT_0052c108;
      local_c0 = PTR_FUN_004d9180;
      local_30 = 1;
      local_50[0] = 0;
      (*(code *)PTR_FUN_0052c110)(&local_c4,local_50);
      local_2c = 0;
      local_28 = 0;
      p_Var5 = (_List_node_base *)FUN_0002256c(puVar8,local_50);
      std::_List_node_base::hook(p_Var5);
      FUN_00022510(local_50);
      if (*(int *)(iVar4 + 0xb3c) != 0) {
        iVar6 = *(int *)(iVar4 + 0xb38);
        *(int *)(iVar6 + 0x2c) = *(int *)(iVar4 + 0xb3c);
        *(undefined4 *)(iVar6 + 0x30) = 1;
        *(int *)(iVar4 + 0xb40) = *(int *)(iVar4 + 0xb40) + 1;
      }
      FUN_00022510(&local_c4);
    }
  }
  puVar1 = PTR____stack_chk_guard_004d9044;
  *(undefined1 *)(param_1 + 0x33) = 1;
  if (*(int *)puVar1 == local_24) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

## FUN_0005b7e0 — 0005b7e0

```c

void FUN_0005b7e0(int param_1)

{
  undefined *puVar1;
  undefined *puVar2;
  undefined4 uVar3;
  int *piVar4;
  undefined4 uVar5;
  code *pcVar6;
  undefined **local_a8;
  undefined4 local_a4;
  undefined1 *local_a0;
  undefined4 local_9c;
  undefined4 local_98 [8];
  undefined1 local_78;
  undefined1 auStack_74 [40];
  undefined1 auStack_4c [40];
  int local_24;
  
  puVar2 = PTR_DAT_004d9048;
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  if (DAT_0005b954 < *(float *)(PTR_DAT_004d9048 + 0x20)) {
    uVar5 = *(undefined4 *)(PTR_DAT_004d9048 + 0x5c);
    uVar3 = FUN_002f69c4("twitterface_posts",0x11);
    FUN_00027588(uVar5,"twitterface_posts",uVar3,1,0,1);
    uVar5 = *(undefined4 *)(puVar2 + 0x5c);
    uVar3 = FUN_002f69c4("twitterface_posts_total",0x17);
    FUN_00027588(uVar5,"twitterface_posts_total",uVar3,1,1,1);
    if (*(char *)(param_1 + 0xb8) == '\0') {
      FUN_0030f7cc(auStack_4c,0);
      FUN_0030f7cc(auStack_74,0);
      FUN_0005ce80(param_1,auStack_4c,auStack_74);
      FUN_0030fb10(auStack_4c," #FruitNinja");
      uVar3 = FUN_003527fc();
      piVar4 = (int *)FUN_0005d4fc(uVar3,"Provider_Twitter");
      if (piVar4 != (int *)0x0) {
        pcVar6 = *(code **)(*piVar4 + 0x40);
        uVar3 = FUN_0030f8f0(auStack_4c);
        uVar5 = FUN_0030f8f0(auStack_74);
        local_a8 = &PTR_LAB_0052c9e8;
        local_a4 = DAT_005a7ec8;
        local_78 = 1;
        local_9c = 0;
        local_98[0] = 0;
        local_a0 = &FUN_0005d098_1;
        FUN_0005dc08(&local_a8,local_98);
        (*pcVar6)(piVar4,uVar3,uVar5,"","","","",local_98);
        Mortar::
        StackAllocatedPointer<Mortar::Delegate1<void,Mortar::SocialPostStatus>::BaseDelegate,32ul>::
        Delete();
      }
      *(undefined1 *)(param_1 + 0xb9) = 1;
      FUN_0030f7e0(auStack_74);
      FUN_0030f7e0(auStack_4c);
    }
  }
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0003de18 — 0003de18

```c

void FUN_0003de18(int *param_1,float param_2)

{
  float fVar1;
  undefined *puVar2;
  int iVar3;
  int *piVar4;
  undefined4 uVar5;
  uint extraout_s0;
  uint extraout_s0_00;
  uint uVar6;
  uint extraout_s0_01;
  float extraout_s0_02;
  float fVar7;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined4 uVar10;
  undefined8 uVar8;
  undefined4 extraout_s1_01;
  ulonglong uVar9;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  longlong lVar11;
  uint extraout_s3_01;
  uint extraout_s3_02;
  uint uVar12;
  uint extraout_s3_03;
  uint extraout_s3_04;
  uint extraout_s5;
  uint extraout_s5_00;
  longlong lVar13;
  uint extraout_s5_01;
  uint extraout_s5_02;
  uint uVar14;
  uint extraout_s5_03;
  uint extraout_s5_04;
  undefined4 uVar15;
  undefined4 local_24;
  
  uVar5 = FUN_0003f4e8();
  lVar13 = (ulonglong)extraout_s5 << 0x20;
  uVar9 = CONCAT44(extraout_s1,uVar5);
  uVar5 = extraout_s3;
  if ((char)param_1[0x2a] != '\0') {
    *(undefined1 *)(param_1 + 0x2a) = 0;
    iVar3 = param_1[0x2d];
    if (iVar3 - 5U < 2) {
LAB_0003de72:
      PTR_DAT_004d9048[0x17] = 0;
      *(undefined1 *)((int)param_1 + 0x33) = 1;
    }
    else if (iVar3 == 0xe) {
      *(undefined4 *)(*(int *)(PTR_DAT_004d9048 + 0x18c) + 0xd4) = 8;
    }
    else {
      if (iVar3 == 3) goto LAB_0003de72;
      uVar5 = FUN_0003d7c4(param_1);
      lVar13 = (ulonglong)extraout_s5_00 << 0x20;
      uVar9 = CONCAT44(extraout_s1_00,uVar5);
      uVar5 = extraout_s3_00;
    }
  }
  puVar2 = PTR_DAT_004d9048;
  fVar1 = DAT_0003e010;
  fVar7 = DAT_0003e004;
  uVar15 = (undefined4)((ulonglong)lVar13 >> 0x20);
  piVar4 = param_1 + 0x2d;
  iVar3 = *piVar4;
  uVar10 = (undefined4)(uVar9 >> 0x20);
  if (iVar3 - 3U < 4) {
    uVar8 = FloatVectorMult(CONCAT44(uVar5,param_1[0x2c]),CONCAT44(uVar10,DAT_0003e000),2,0x20);
    param_1[0x2c] = (int)uVar8;
    param_1[0x31] = (int)uVar8;
    uVar8 = CONCAT44((int)((ulonglong)uVar8 >> 0x20),*(float *)(puVar2 + 0x20));
    if ((int)((uint)(*(float *)(puVar2 + 0x20) < fVar7) << 0x1f) < 0) {
      (**(code **)(*param_1 + 0x4c))(param_1);
      uVar8 = CONCAT44(extraout_s1_01,*(undefined4 *)(puVar2 + 0x20));
    }
    fVar7 = DAT_0003e008;
    lVar11 = FloatVectorMult(uVar8,0x3f4000003f400000,2,0x20);
    uVar9 = (ulonglong)(uint)DAT_0003e008;
    lVar13 = FloatVectorAbsolute(lVar11,4);
    *(int *)(puVar2 + 0x20) = (int)lVar11;
    if ((int)((uint)((float)lVar13 < fVar7) << 0x1f) < 0) {
      *(undefined4 *)(puVar2 + 0x20) = 0;
      puVar2[0x17] = 0;
      *(undefined4 *)(*(int *)(puVar2 + 0x18c) + 0xd4) = 0x12;
      FUN_00052f80();
      FUN_0005520c();
      iVar3 = FUN_0001cd70();
      lVar13 = (ulonglong)extraout_s5_01 << 0x20;
      lVar11 = (ulonglong)extraout_s3_01 << 0x20;
      uVar9 = (ulonglong)extraout_s0;
      if (iVar3 == 1) {
        local_24 = 0;
        uVar5 = FUN_000065c4();
        iVar3 = FUN_00006ad0(uVar5,4,&local_24);
        uVar6 = extraout_s0_00;
        uVar12 = extraout_s3_02;
        uVar14 = extraout_s5_02;
        while( true ) {
          lVar13 = (ulonglong)uVar14 << 0x20;
          lVar11 = (ulonglong)uVar12 << 0x20;
          uVar9 = (ulonglong)uVar6;
          if (iVar3 == 0) break;
          FUN_00015d04();
          uVar5 = FUN_000065c4();
          iVar3 = FUN_00006af0(uVar5,4,&local_24);
          uVar6 = extraout_s0_01;
          uVar12 = extraout_s3_03;
          uVar14 = extraout_s5_03;
        }
      }
    }
LAB_0003dfb8:
    uVar5 = (undefined4)((ulonglong)lVar11 >> 0x20);
    uVar15 = (undefined4)((ulonglong)lVar13 >> 0x20);
    iVar3 = *piVar4;
  }
  else {
    if (iVar3 == 1) {
      uVar8 = FloatVectorSub(0x3f8000003f800000,CONCAT44(uVar10,param_1[0x2c]),2,0x20);
      uVar8 = FloatVectorMult(uVar8,CONCAT44(uVar5,DAT_0003e00c),2,0x20);
      lVar11 = CONCAT44(uVar5,DAT_0003e010);
      uVar9 = FloatVectorAdd(CONCAT44(uVar10,param_1[0x2c]),uVar8,2);
      param_1[0x2c] = (int)(float)uVar9;
      if (fVar1 < (float)uVar9) {
        *piVar4 = 2;
        param_1[0x34] = 1;
      }
      goto LAB_0003dfb8;
    }
    if (iVar3 == 0) {
      uVar8 = FloatVectorSub(0x3f8000003f800000,CONCAT44(uVar10,param_1[0x2c]),2,0x20);
      uVar8 = FloatVectorMult(uVar8,CONCAT44(uVar5,DAT_0003e00c),2,0x20);
      uVar8 = FloatVectorAdd(CONCAT44(uVar10,param_1[0x2c]),uVar8,2);
      param_1[0x2c] = (int)uVar8;
      iVar3 = (**(code **)(*param_1 + 0x40))((int)uVar8,param_1);
      lVar13 = (ulonglong)extraout_s5_04 << 0x20;
      lVar11 = (ulonglong)extraout_s3_04 << 0x20;
      uVar9 = (ulonglong)(uint)extraout_s0_02;
      if (iVar3 == 1) {
        *piVar4 = 2;
        fVar7 = extraout_s0_02;
        goto LAB_0003dfe6;
      }
      goto LAB_0003dfb8;
    }
  }
  fVar7 = (float)uVar9;
  if (2 < iVar3) {
    uVar8 = FloatVectorAdd(CONCAT44(uVar15,param_1[0x35]),CONCAT44(uVar5,param_2 / DAT_0003e00c),2);
    fVar7 = 0.0;
    if ((int)((uint)((float)uVar8 < 0.0) << 0x1f) < 0) {
      fVar7 = (float)uVar8;
    }
    param_1[0x35] = (int)fVar7;
  }
LAB_0003dfe6:
  (**(code **)(*param_1 + 0x48))(fVar7,param_1,param_2);
  return;
}


```

## FUN_00069ef0 — 00069ef0

```c

void FUN_00069ef0(int param_1)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int *piVar5;
  int *piVar6;
  uint uVar7;
  undefined4 uVar8;
  undefined1 *puVar9;
  undefined4 uVar10;
  int iVar11;
  code *pcVar12;
  undefined4 uVar13;
  float fVar14;
  undefined8 in_d0;
  undefined8 uVar15;
  undefined8 in_d1;
  undefined8 uVar16;
  float fVar17;
  undefined8 unaff_d8;
  int local_550;
  undefined1 auStack_544 [40];
  undefined1 auStack_51c [40];
  undefined1 auStack_4f4 [40];
  undefined4 uStack_4cc;
  undefined4 local_4c8;
  undefined1 auStack_4c4 [40];
  undefined1 auStack_49c [40];
  undefined1 auStack_474 [40];
  undefined1 auStack_44c [40];
  undefined1 auStack_424 [40];
  undefined4 local_3fc;
  undefined4 local_3f8;
  undefined1 auStack_3f4 [40];
  undefined1 auStack_3cc [40];
  undefined1 auStack_3a4 [40];
  undefined4 local_37c;
  undefined4 local_378;
  undefined **local_374;
  undefined *local_370;
  undefined1 local_354;
  undefined1 auStack_350 [40];
  undefined1 auStack_328 [40];
  undefined1 auStack_300 [40];
  undefined1 auStack_2d8 [40];
  undefined1 auStack_2b0 [40];
  undefined1 auStack_288 [40];
  undefined1 auStack_260 [40];
  undefined1 auStack_238 [40];
  undefined1 auStack_210 [40];
  undefined1 auStack_1e8 [40];
  undefined1 auStack_1c0 [40];
  undefined1 auStack_198 [40];
  undefined1 auStack_170 [40];
  undefined1 auStack_148 [40];
  undefined1 auStack_120 [40];
  undefined **ppuStack_f8;
  undefined *puStack_f4;
  undefined1 uStack_d8;
  undefined1 auStack_d4 [40];
  undefined1 auStack_ac [40];
  undefined1 auStack_84 [40];
  undefined1 auStack_5c [40];
  undefined1 auStack_34 [12];
  
  uVar15 = CONCAT44((int)((ulonglong)in_d0 >> 0x20),DAT_0006a2b8);
  iVar1 = *(int *)PTR____stack_chk_guard_004d9044;
  uVar16 = FloatVectorAdd(CONCAT44((int)((ulonglong)in_d1 >> 0x20),*(undefined4 *)(param_1 + 0x1c)),
                          uVar15,2);
  *(int *)(param_1 + 0x1c) = (int)uVar16;
  fVar17 = *(float *)(param_1 + 0x20);
  uVar15 = FloatVectorAdd(CONCAT44((int)((ulonglong)unaff_d8 >> 0x20),fVar17),uVar15,2);
  *(int *)(param_1 + 0x20) = (int)uVar15;
  uVar8 = *(undefined4 *)(param_1 + 4);
  iVar2 = *(int *)(*(int *)(param_1 + 0xc) + 0x68);
  FUN_0030f7cc((int)uVar15,auStack_5c,"progressUIContainer");
  uVar8 = FUN_0039725c(uVar8,auStack_5c);
  FUN_0030f7e0(auStack_5c);
  FUN_0030f7cc(auStack_84,"map");
  iVar3 = FUN_0039725c(uVar8,auStack_84);
  FUN_0030f7e0(auStack_84);
  switch(*(undefined4 *)(param_1 + 0x14)) {
  case 0:
    uVar8 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_ac,"start_game");
    iVar2 = FUN_0039834c(uVar8,auStack_ac,1);
    FUN_0030f7e0(auStack_ac);
    if (iVar2 != 0) break;
    puVar9 = auStack_d4;
    *(undefined4 *)(param_1 + 0x20) = 0;
    *(undefined4 *)(param_1 + 0x14) = 2;
    piVar5 = *(int **)(param_1 + 4);
    pcVar12 = *(code **)(*piVar5 + 0x40);
    goto LAB_0006a1d4;
  case 1:
    fVar14 = *(float *)(param_1 + 0x20);
    if ((DAT_0006a2bc < fVar14) && ((int)((uint)(fVar17 < DAT_0006a2bc) << 0x1f) < 0)) {
      FUN_0006a90c(param_1);
      fVar14 = *(float *)(param_1 + 0x20);
    }
    if ((((1.5 < fVar14) && ((int)((uint)(fVar17 < 1.5) << 0x1f) < 0)) &&
        (iVar2 = FUN_0001d10c(PTR_DAT_004d9048), *(char *)(iVar2 + 0x8c) != '\0')) &&
       (iVar2 = FUN_0001d10c(PTR_DAT_004d9048), *(int *)(*(int *)(iVar2 + 0x68) + 0x98) == 0)) {
      FUN_0030a1d8();
      FUN_0030a7e4();
      uVar8 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
      uStack_d8 = 1;
      ppuStack_f8 = (undefined **)0x0;
      FUN_0000a298(&ppuStack_f8);
      uStack_d8 = 0;
      ppuStack_f8 = &PTR_LAB_0052bf38;
      puStack_f4 = PTR_FUN_004d9058;
      FUN_0002bb34(uVar8,"act-change",0x3f800000,0x3f800000,&ppuStack_f8,0);
      FUN_0000a298(&ppuStack_f8);
    }
    uVar8 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_120,"act_change");
    iVar2 = FUN_0039834c(uVar8,auStack_120,1);
    FUN_0030f7e0(auStack_120);
    if (iVar2 != 0) break;
    *(undefined4 *)(param_1 + 0x20) = 0;
    *(undefined4 *)(param_1 + 0x14) = 2;
    FUN_0006ac30(param_1);
    FUN_00069ddc(param_1);
    iVar2 = FUN_0001d10c(PTR_DAT_004d9048);
    *(undefined1 *)(iVar2 + 0x8c) = 0;
    uVar8 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_148,"challengeContainer");
    iVar2 = FUN_0039725c(uVar8,auStack_148);
    FUN_0030f7e0(auStack_148);
    if (iVar2 != 0) {
      auStack_34[0] = *(int *)(*(int *)(*(int *)(param_1 + 0xc) + 0x68) + 0x98) == 0;
      FUN_0001da28(*(undefined4 *)(iVar2 + 0x260),auStack_34);
    }
    uVar8 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_170,"bossChallengeContainer");
    iVar2 = FUN_0039725c(uVar8,auStack_170);
    FUN_0030f7e0(auStack_170);
    if (iVar2 != 0) {
      auStack_34[0] = *(int *)(*(int *)(*(int *)(param_1 + 0xc) + 0x68) + 0x98) != 0;
      FUN_0001da28(*(undefined4 *)(iVar2 + 0x260),auStack_34);
    }
    piVar5 = *(int **)(param_1 + 4);
    puVar9 = auStack_198;
    pcVar12 = *(code **)(*piVar5 + 0x40);
LAB_0006a1d4:
    FUN_0030f7cc(puVar9,"animate_in");
    (*pcVar12)(piVar5,puVar9,1);
    FUN_0030f7e0(puVar9);
    FUN_00022070();
    break;
  case 2:
    uVar8 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_1c0,"animate_in");
    iVar2 = FUN_0039834c(uVar8,auStack_1c0,1);
    if (iVar2 != 1) {
      uVar8 = *(undefined4 *)(param_1 + 4);
      FUN_0030f7cc(auStack_1e8,"start_game");
      iVar2 = FUN_0039834c(uVar8,auStack_1e8,1);
      if (iVar2 == 0) {
        uVar8 = *(undefined4 *)(param_1 + 4);
        FUN_0030f7cc(auStack_210,"act_change");
        iVar2 = FUN_0039834c(uVar8,auStack_210,1);
        FUN_0030f7e0(auStack_210);
        FUN_0030f7e0(auStack_1e8);
        FUN_0030f7e0(auStack_1c0);
        if (iVar2 == 0) {
          FUN_0006ad24(param_1);
        }
        break;
      }
      FUN_0030f7e0(auStack_1e8);
    }
    FUN_0030f7e0(auStack_1c0);
    break;
  case 3:
    FUN_0030f7cc(auStack_238,"pussMap");
    iVar3 = FUN_0039725c(iVar3,auStack_238);
    FUN_0030f7e0(auStack_238);
    if (iVar3 != 0) {
      _sprintf(&DAT_005f9590,"animate_trigger_%d",*(undefined4 *)(iVar2 + 0x84));
      FUN_0030f7cc(auStack_260,&DAT_005f9590);
      iVar2 = FUN_0039834c(iVar3,auStack_260,1);
      FUN_0030f7e0(auStack_260);
      if (iVar2 == 0) {
        FUN_0006ae4c(param_1);
      }
    }
    break;
  case 4:
    uVar8 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_288,"progressUIContainer");
    uVar8 = FUN_0039725c(uVar8,auStack_288);
    FUN_0030f7e0(auStack_288);
    uVar10 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_2b0,"challengeContainer.spinner");
    uVar10 = FUN_0039725c(uVar10,auStack_2b0);
    FUN_0030f7e0(auStack_2b0);
    if (iVar3 != 0) {
      _sprintf(&DAT_005f9590,"adventureNode_%d",1);
      FUN_0030f7cc(auStack_2d8,&DAT_005f9590);
      piVar5 = (int *)FUN_0039725c(uVar10,auStack_2d8);
      FUN_0030f7e0(auStack_2d8);
      if (piVar5 != (int *)0x0) {
        local_550 = 2;
        do {
          FUN_0030f7cc(auStack_300,"animate_reset_in");
          iVar3 = FUN_0039834c(piVar5,auStack_300,0);
          if (iVar3 == 1) {
LAB_0006a4d6:
            FUN_0030f7e0(auStack_300);
          }
          else {
            FUN_0030f7cc(auStack_328,"animate_delay");
            iVar3 = FUN_0039834c(piVar5,auStack_328,0);
            if (iVar3 != 0) {
              FUN_0030f7e0(auStack_328);
              goto LAB_0006a4d6;
            }
            FUN_0030f7cc(auStack_350,"animate_stop");
            iVar3 = FUN_0039834c(piVar5,auStack_350,0);
            FUN_0030f7e0(auStack_350);
            FUN_0030f7e0(auStack_328);
            FUN_0030f7e0(auStack_300);
            if (iVar3 == 0) {
              if ((*(int *)(param_1 + 8) == 0) &&
                 ((int)((uint)(*(float *)(param_1 + 0x1c) < DAT_0006a2c0) << 0x1f) < 0)) {
                uVar13 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
                local_354 = 1;
                local_374 = (undefined **)0x0;
                FUN_0000a298(&local_374);
                local_354 = 0;
                local_374 = &PTR_LAB_0052bf38;
                local_370 = PTR_FUN_004d9058;
                uVar13 = FUN_0002bb34(uVar13,"slot_spin_lp",0x3f800000,0x3f800000,&local_374,0);
                *(undefined4 *)(param_1 + 8) = uVar13;
                FUN_0000a298(&local_374);
              }
              uVar7 = FUN_00060da0();
              uVar15 = FixedToFP(CONCAT44(uVar7 >> 3,uVar7 >> 3),0,1,0,0x20);
              uVar16 = FixedToFP(CONCAT44(uVar7,uVar7) & 0x700000007,0,1,0,0x20);
              uVar15 = FloatVectorMult(uVar15,0x3e0000003e000000,2,0x20);
              uVar16 = FloatVectorMult(uVar16,0x3e0000003e000000,2,0x20);
              local_37c = (undefined4)uVar16;
              local_378 = (undefined4)uVar15;
              FUN_0006bc4c(local_378,piVar5[0x1d1],&local_37c);
              pcVar12 = *(code **)(*piVar5 + 0x40);
              FUN_0030f7cc(auStack_3a4,"animate_delay");
              (*pcVar12)(piVar5,auStack_3a4,1);
              FUN_0030f7e0(auStack_3a4);
            }
          }
          _sprintf(&DAT_005f9590,"adventureNode_%d",local_550);
          FUN_0030f7cc(auStack_2d8,&DAT_005f9590);
          piVar5 = (int *)FUN_0039725c(uVar10,auStack_2d8);
          FUN_0030f7e0(auStack_2d8);
          local_550 = local_550 + 1;
        } while (piVar5 != (int *)0x0);
      }
    }
    if (*(float *)(param_1 + 0x1c) <= DAT_0006a2c0) break;
    if (*(int *)(param_1 + 8) != 0) {
      FUN_00309aac(*(int *)(param_1 + 8),0x3dcccccd);
      FUN_0002be70(*(undefined4 *)(PTR_DAT_004d9048 + 0x1a4),*(undefined4 *)(param_1 + 8),
                   "slot_spin_lp");
      *(undefined4 *)(param_1 + 8) = 0;
    }
    if (0 < *(int *)(iVar2 + 0x7c)) {
      iVar3 = 0;
      do {
        iVar11 = iVar3 + 1;
        _sprintf(&DAT_005f9590,"adventureNode_%d",iVar11);
        FUN_0030f7cc(auStack_3cc,&DAT_005f9590);
        iVar4 = FUN_0039725c(uVar10,auStack_3cc);
        FUN_0030f7e0(auStack_3cc);
        _sprintf(&DAT_005f9590,"map.challenge_%d_%d.challenge",*(int *)(iVar2 + 0xa4) + 1,iVar11);
        FUN_0030f7cc(auStack_3f4,&DAT_005f9590);
        piVar5 = (int *)FUN_0039725c(uVar8,auStack_3f4);
        FUN_0030f7e0(auStack_3f4);
        if (iVar4 != 0) {
          piVar6 = (int *)FUN_0006ed58(iVar2,iVar3);
          uVar7 = 0;
          if (*(int *)(*piVar6 + 0x100) != 0) {
            uVar7 = *(uint *)(*(int *)(*piVar6 + 0x100) + 0x44);
          }
          uVar15 = FixedToFP(CONCAT44(uVar7 >> 3,uVar7 >> 3),0,1,0,0x20);
          uVar16 = FixedToFP(CONCAT44(uVar7,uVar7) & 0x700000007,0,1,0,0x20);
          uVar15 = FloatVectorMult(uVar15,0x3e0000003e000000,2,0x20);
          uVar16 = FloatVectorMult(uVar16,0x3e0000003e000000,2,0x20);
          local_3fc = (undefined4)uVar16;
          local_3f8 = (undefined4)uVar15;
          FUN_0006bc4c(local_3f8,*(undefined4 *)(iVar4 + 0x744),&local_3fc);
          auStack_34[0] = 1;
          FUN_0001da28(*(undefined4 *)(iVar4 + 0x264),auStack_34);
          if (piVar5 != (int *)0x0) {
            FUN_0006bc4c(piVar5[0x1d1],&local_3fc);
            pcVar12 = *(code **)(*piVar5 + 0x40);
            FUN_0030f7cc(auStack_424,"animate_appear");
            (*pcVar12)(piVar5,auStack_424,0);
            FUN_0030f7e0(auStack_424);
          }
        }
        iVar3 = iVar11;
      } while (iVar11 < *(int *)(iVar2 + 0x7c));
    }
    goto LAB_0006a82e;
  case 5:
    uVar8 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_44c,"progressUIContainer");
    uVar8 = FUN_0039725c(uVar8,auStack_44c);
    FUN_0030f7e0(auStack_44c);
    uVar10 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_474,"bossChallengeContainer.spinner");
    uVar10 = FUN_0039725c(uVar10,auStack_474);
    FUN_0030f7e0(auStack_474);
    if (*(float *)(param_1 + 0x1c) <= DAT_0006a908) break;
    if (*(int *)(param_1 + 8) != 0) {
      FUN_00309aac(*(int *)(param_1 + 8),0x3dcccccd);
      *(undefined4 *)(param_1 + 8) = 0;
    }
    if (0 < *(int *)(iVar2 + 0x7c)) {
      iVar3 = 0;
      do {
        iVar11 = iVar3 + 1;
        _sprintf(&DAT_005f9590,"adventureNode_%d",iVar11);
        FUN_0030f7cc(auStack_49c,&DAT_005f9590);
        iVar4 = FUN_0039725c(uVar10,auStack_49c);
        FUN_0030f7e0(auStack_49c);
        _sprintf(&DAT_005f9590,"map.challenge_%d_%d.challenge",*(int *)(iVar2 + 0xa4) + 1,iVar11);
        FUN_0030f7cc(auStack_4c4,&DAT_005f9590);
        piVar5 = (int *)FUN_0039725c(uVar8,auStack_4c4);
        FUN_0030f7e0(auStack_4c4);
        if (iVar4 != 0) {
          piVar6 = (int *)FUN_0006ed58(iVar2,iVar3);
          uVar7 = 0;
          if (*(int *)(*piVar6 + 0x100) != 0) {
            uVar7 = *(uint *)(*(int *)(*piVar6 + 0x100) + 0x44);
          }
          uVar15 = FixedToFP(CONCAT44(uVar7 >> 3,uVar7 >> 3),0,1,0,0x20);
          uVar16 = FixedToFP(CONCAT44(uVar7,uVar7) & 0x700000007,0,1,0,0x20);
          uVar15 = FloatVectorMult(uVar15,0x3e0000003e000000,2,0x20);
          uVar16 = FloatVectorMult(uVar16,0x3e0000003e000000,2,0x20);
          uStack_4cc = (undefined4)uVar16;
          local_4c8 = (undefined4)uVar15;
          FUN_0006bc4c(local_4c8,*(undefined4 *)(iVar4 + 0x744),&uStack_4cc);
          if (piVar5 != (int *)0x0) {
            FUN_0006bc4c(piVar5[0x1d1],&uStack_4cc);
            pcVar12 = *(code **)(*piVar5 + 0x40);
            FUN_0030f7cc(auStack_4f4,"animate_appear");
            (*pcVar12)(piVar5,auStack_4f4,0);
            FUN_0030f7e0(auStack_4f4);
          }
        }
        iVar3 = iVar11;
      } while (iVar11 < *(int *)(iVar2 + 0x7c));
    }
LAB_0006a82e:
    *(undefined4 *)(param_1 + 0x1c) = 0;
    *(undefined4 *)(param_1 + 0x20) = 0;
    *(undefined4 *)(param_1 + 0x14) = 7;
    break;
  case 8:
    uVar8 = *(undefined4 *)(param_1 + 4);
    FUN_0030f7cc(auStack_51c,"progressUIContainer");
    uVar8 = FUN_0039725c(uVar8,auStack_51c);
    FUN_0030f7e0(auStack_51c);
    FUN_0030f7cc(auStack_544,"animate_out");
    iVar3 = FUN_0039834c(uVar8,auStack_544,1);
    if (iVar3 == 1) {
      iVar2 = *(int *)(iVar2 + 0x98);
      FUN_0030f7e0(auStack_544);
      if (iVar2 == 0) break;
    }
    else {
      FUN_0030f7e0(auStack_544);
    }
    *(undefined4 *)(param_1 + 0x14) = 9;
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 != iVar1) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0005ffa8 — 0005ffa8

```c

void FUN_0005ffa8(int param_1)

{
  bool bVar1;
  int iVar2;
  int iVar3;
  undefined4 uVar4;
  int *piVar5;
  code *pcVar6;
  undefined4 uVar7;
  undefined1 *puVar8;
  undefined1 auStack_c4 [40];
  undefined1 auStack_9c [40];
  undefined1 auStack_74 [40];
  undefined1 auStack_4c [40];
  undefined1 local_24 [4];
  int local_20;
  
  local_20 = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0x40) = 2;
  iVar2 = *(int *)(param_1 + 0x68);
  iVar3 = 0;
  if (iVar2 != 0) {
    iVar3 = *(int *)(iVar2 + 0x98);
  }
  if (iVar2 != 0 && iVar3 != 0) {
    uVar7 = *(undefined4 *)(PTR_DAT_004d9048 + 0x5c);
    uVar4 = FUN_002f69c4("consecutive_finales_total",0x19);
    FUN_00027588(uVar7,"consecutive_finales_total",uVar4,1,1,1);
  }
  if (*(int *)(PTR_DAT_004d9048 + 0x5c) != 0) {
    FUN_000277e4();
  }
  *(undefined4 *)(param_1 + 0x70) = 0;
  uVar4 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_4c,"Timer");
  piVar5 = (int *)FUN_0039725c(uVar4,auStack_4c);
  FUN_0030f7e0(auStack_4c);
  if (piVar5 != (int *)0x0) {
    bVar1 = false;
    if ((*(int *)(param_1 + 0x68) != 0) &&
       (bVar1 = false, *(int *)(*(int *)(param_1 + 0x68) + 0x98) != 0)) {
      bVar1 = true;
    }
    local_24[0] = 1;
    FUN_0001da28(piVar5[0x98],local_24);
    FUN_00396d98(piVar5,1);
    pcVar6 = *(code **)(*piVar5 + 0x40);
    if (bVar1) {
      puVar8 = auStack_74;
    }
    else {
      puVar8 = auStack_9c;
    }
    FUN_0030f7cc(puVar8,"animate_in");
    (*pcVar6)(piVar5,puVar8,1);
    FUN_0030f7e0(puVar8);
    FUN_00084394(piVar5);
  }
  if (*(int *)(param_1 + 0x9c) != 0) {
    local_24[0] = 1;
    FUN_0001da28(*(undefined4 *)(*(int *)(param_1 + 0x9c) + 0x260),local_24);
    piVar5 = *(int **)(param_1 + 0x9c);
    pcVar6 = *(code **)(*piVar5 + 0x40);
    FUN_0030f7cc(auStack_c4,"animate_in");
    (*pcVar6)(piVar5,auStack_c4,1);
    FUN_0030f7e0(auStack_c4);
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_20) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00079120 — 00079120

```c

void FUN_00079120(int param_1)

{
  undefined *puVar1;
  undefined *puVar2;
  undefined4 uVar3;
  int iVar4;
  char *pcVar5;
  undefined4 uVar6;
  int iVar7;
  undefined8 uVar8;
  undefined8 unaff_d8;
  undefined8 uVar9;
  float fVar10;
  undefined8 unaff_d9;
  undefined4 uVar11;
  undefined **local_94;
  undefined *local_90;
  undefined4 local_8c [8];
  undefined1 local_6c;
  undefined4 local_68;
  undefined4 local_64;
  undefined4 local_60;
  undefined4 local_5c;
  undefined4 local_58;
  undefined4 local_54;
  undefined4 local_50;
  undefined4 local_4c;
  undefined4 local_48;
  int local_44;
  
  puVar2 = PTR_DAT_004d9048;
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_44 = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0x10c) = 1;
  uVar3 = FUN_0001d10c(puVar2);
  iVar4 = FUN_00062aec(uVar3,*(undefined4 *)(param_1 + 0x7c));
  iVar7 = *(int *)(param_1 + 0x110);
  if (iVar4 == 2) {
    local_48 = 0;
    FUN_00009e50(&local_48,DAT_005a8d28);
    FUN_00009e50(iVar7 + 0x40,local_48);
    FUN_0000a2c8(&local_48);
    uVar3 = FUN_00033ca0();
    uVar6 = 8;
    pcVar5 = "chestDud";
  }
  else {
    local_4c = 0;
    FUN_00009e50(&local_4c,DAT_005a8d24);
    FUN_00009e50(iVar7 + 0x40,local_4c);
    FUN_0000a2c8(&local_4c);
    uVar3 = FUN_00033ca0();
    uVar6 = 9;
    pcVar5 = "chestOpen";
  }
  uVar6 = FUN_002f69c4(pcVar5,uVar6);
  iVar4 = FUN_00035a08(uVar3,uVar6,0,0);
  if (iVar4 != 0) {
    iVar7 = *(int *)(param_1 + 0x110);
    *(undefined4 *)(iVar4 + 8) = *(undefined4 *)(iVar7 + 0x10);
    *(undefined4 *)(iVar4 + 0xc) = *(undefined4 *)(iVar7 + 0x14);
    *(undefined4 *)(iVar4 + 0x10) = *(undefined4 *)(iVar7 + 0x18);
  }
  uVar3 = DAT_0052bfe0;
  iVar4 = *(int *)(param_1 + 0x110);
  *(undefined4 *)(iVar4 + 0xa0) = DAT_0052bfe0;
  *(undefined4 *)(iVar4 + 0xa4) = DAT_0052bfe4;
  *(undefined4 *)(iVar4 + 0xa8) = DAT_0052bfe8;
  FUN_000449ac(uVar3);
  iVar4 = *(int *)(param_1 + 0x7c);
  uVar3 = *(undefined4 *)(iVar4 + 0x10);
  *(undefined4 *)(param_1 + 0xf4) = uVar3;
  *(undefined4 *)(param_1 + 0xf8) = *(undefined4 *)(iVar4 + 0x14);
  *(undefined4 *)(param_1 + 0xfc) = *(undefined4 *)(iVar4 + 0x18);
  FUN_00013f00(uVar3);
  if (*(int *)(param_1 + 0x94) != 0) {
    *(undefined4 *)(*(int *)(param_1 + 0x94) + 0x7c) = 0;
  }
  uVar11 = (undefined4)((ulonglong)unaff_d9 >> 0x20);
  fVar10 = *(float *)(*(int *)(param_1 + 0x7c) + 0x10);
  uVar3 = FUN_00025164();
  uVar6 = (undefined4)((ulonglong)unaff_d8 >> 0x20);
  uVar9 = CONCAT44(uVar6,DAT_0007942c);
  uVar8 = FloatVectorMult(CONCAT44(uVar3,uVar3),uVar9,2,0x20);
  if (fVar10 <= (float)uVar8) {
LAB_000792b6:
    uVar3 = FUN_00025164();
    uVar8 = FloatVectorMult(CONCAT44(uVar3,uVar3),uVar9,2,0x20);
    uVar3 = (undefined4)uVar8;
  }
  else {
    fVar10 = *(float *)(*(int *)(param_1 + 0x7c) + 0x10);
    uVar3 = FUN_00025164();
    uVar9 = CONCAT44(uVar6,DAT_00079430);
    uVar8 = FloatVectorMult(CONCAT44(uVar3,uVar3),uVar9,2,0x20);
    if ((float)uVar8 <= fVar10) goto LAB_000792b6;
    uVar3 = *(undefined4 *)(*(int *)(param_1 + 0x7c) + 0x10);
  }
  fVar10 = *(float *)(*(int *)(param_1 + 0x7c) + 0x14);
  uVar6 = FUN_000251a8();
  uVar9 = CONCAT44(uVar11,DAT_00079434);
  uVar8 = FloatVectorMult(CONCAT44(uVar6,uVar6),uVar9,2,0x20);
  if ((float)uVar8 < fVar10) {
    fVar10 = *(float *)(*(int *)(param_1 + 0x7c) + 0x14);
    uVar6 = FUN_000251a8();
    uVar9 = CONCAT44(uVar11,DAT_00079438);
    uVar8 = FloatVectorMult(CONCAT44(uVar6,uVar6),uVar9,2,0x20);
    if (fVar10 < (float)uVar8) {
      uVar6 = *(undefined4 *)(*(int *)(param_1 + 0x7c) + 0x14);
      goto LAB_00079316;
    }
  }
  uVar6 = FUN_000251a8();
  uVar8 = FloatVectorMult(CONCAT44(uVar6,uVar6),uVar9,2,0x20);
  uVar6 = (undefined4)uVar8;
LAB_00079316:
  *(undefined4 *)(param_1 + 0x108) = 0;
  *(undefined4 *)(param_1 + 0x100) = uVar3;
  *(undefined4 *)(param_1 + 0x104) = uVar6;
  FUN_0005032c(uVar6,param_1);
  if (*(int *)(param_1 + 0xe0) != 0) {
    FUN_0002be70(*(undefined4 *)(puVar2 + 0x1a4),*(int *)(param_1 + 0xe0),"pome-lp");
    *(undefined4 *)(param_1 + 0xe0) = 0;
  }
  local_58 = *(undefined4 *)(param_1 + 8);
  local_54 = *(undefined4 *)(param_1 + 0xc);
  local_50 = *(undefined4 *)(param_1 + 0x10);
  FUN_0000577c(local_58,*(undefined4 *)(puVar2 + 0x58),&local_58,0x3f800000,0x40000000,0x41100000);
  iVar4 = *(int *)(param_1 + 0x7c);
  local_64 = *(undefined4 *)(iVar4 + 0x10);
  local_60 = *(undefined4 *)(iVar4 + 0x14);
  local_5c = *(undefined4 *)(iVar4 + 0x18);
  local_68 = 0xffffffff;
  FUN_00020ea8(local_64,&local_64,&local_68);
  uVar3 = *(undefined4 *)(puVar2 + 0x1a4);
  local_94 = &PTR_LAB_0052bf38;
  local_90 = PTR_FUN_004d9058;
  local_6c = 1;
  local_8c[0] = 0;
  FUN_0000a23c(&local_94,local_8c);
  FUN_0002bc94(uVar3,"pome-burst",0x3e000000,0x40000000,local_8c,0);
  FUN_0000a298(local_8c);
  *(undefined4 *)(param_1 + 0x10c) = 1;
  *(undefined4 *)(param_1 + 0x88) = 0;
  *(undefined4 *)(param_1 + 0x8c) = 0;
  if (*(int *)puVar1 != local_44) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_000088d4 — 000088d4

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

## FUN_0003a9b4 — 0003a9b4

```c

float FUN_0003a9b4(int param_1,undefined4 param_2)

{
  int iVar1;
  undefined8 in_d0;
  undefined4 uVar2;
  undefined4 extraout_s1;
  undefined8 in_d1;
  undefined4 uVar4;
  undefined8 uVar3;
  undefined4 extraout_s3;
  undefined8 in_d2;
  undefined4 extraout_s5;
  undefined8 in_d3;
  undefined4 in_s9;
  undefined4 extraout_s9;
  undefined4 in_s11;
  undefined4 extraout_s11;
  undefined4 in_s13;
  undefined4 extraout_s13;
  float fVar5;
  undefined4 extraout_s15;
  undefined8 uVar6;
  undefined8 uVar7;
  undefined8 uVar8;
  undefined8 uVar9;
  undefined8 uVar10;
  undefined8 uVar11;
  undefined4 local_4c;
  undefined4 uStack_48;
  undefined4 local_44;
  undefined4 local_40;
  undefined4 local_3c;
  undefined4 local_38;
  undefined4 local_34;
  undefined4 local_30;
  undefined4 local_2c;
  undefined4 local_28;
  undefined4 local_24;
  undefined4 local_20;
  undefined4 local_1c;
  undefined4 uStack_18;
  undefined4 uStack_14;
  undefined4 uStack_10;
  
  uVar2 = (undefined4)((ulonglong)in_d0 >> 0x20);
  if (*(char *)(param_1 + 0xe0) == '\0') {
    uVar4 = (undefined4)((ulonglong)in_d1 >> 0x20);
    uVar6 = FloatVectorAdd(CONCAT44(uVar4,*(undefined4 *)(PTR_DAT_004d9048 + 0x44)),
                           CONCAT44(uVar2,*(undefined4 *)(param_1 + 0xc0)),2);
    *(int *)(param_1 + 0xc0) = (int)uVar6;
    iVar1 = *(int *)(param_1 + 0xbc);
    uVar3 = CONCAT44((int)((ulonglong)in_d3 >> 0x20),*(undefined4 *)(iVar1 + 0xd8));
    uVar8 = FloatVectorMult(CONCAT44(in_s11,DAT_0052ce60),uVar3,2,0x20);
    uVar7 = FloatVectorMult(uVar3,CONCAT44(in_s9,DAT_0052ce64),2,0x20);
    uVar10 = FloatVectorMult(uVar3,CONCAT44(in_s13,DAT_0052ce68),2,0x20);
    uVar3 = FloatVectorAdd(uVar8,CONCAT44(uVar4,*(undefined4 *)(iVar1 + 0x10)),2);
    uVar8 = FloatVectorAdd(uVar10,CONCAT44((int)((ulonglong)in_d2 >> 0x20),
                                           *(undefined4 *)(iVar1 + 0x18)),2);
    uVar6 = FloatVectorAdd(uVar7,CONCAT44((int)((ulonglong)uVar6 >> 0x20),
                                          *(undefined4 *)(iVar1 + 0x14)),2);
    *(int *)(param_1 + 0x10) = (int)uVar3;
    *(int *)(param_1 + 0x14) = (int)uVar6;
    *(int *)(param_1 + 0x18) = (int)uVar8;
    FUN_000148e0((int)uVar6,&local_4c,iVar1 + 0x134);
    *(undefined4 *)(param_1 + 0x50) = local_38;
    *(undefined4 *)(param_1 + 0x4c) = local_3c;
    *(undefined4 *)(param_1 + 0x48) = local_40;
    *(undefined4 *)(param_1 + 0x44) = local_44;
    *(undefined4 *)(param_1 + 0x40) = uStack_48;
    *(undefined4 *)(param_1 + 0x3c) = local_4c;
    *(undefined4 *)(param_1 + 0x68) = local_20;
    *(undefined4 *)(param_1 + 100) = local_24;
    *(undefined4 *)(param_1 + 0x60) = local_28;
    *(undefined4 *)(param_1 + 0x5c) = local_2c;
    *(undefined4 *)(param_1 + 0x58) = local_30;
    *(undefined4 *)(param_1 + 0x54) = local_34;
    *(undefined4 *)(param_1 + 0x6c) = local_1c;
    *(undefined4 *)(param_1 + 0x70) = uStack_18;
    *(undefined4 *)(param_1 + 0x74) = uStack_14;
    *(undefined4 *)(param_1 + 0x78) = uStack_10;
    uVar8 = CONCAT44(extraout_s3,*(undefined4 *)(param_1 + 200));
    fVar5 = *(float *)(param_1 + 0xc0) / DAT_0003ab34;
    uVar6 = 0;
    uVar3 = CONCAT44(extraout_s1,*(undefined4 *)(param_1 + 0xcc));
    uVar7 = CONCAT44(extraout_s5,*(undefined4 *)(param_1 + 0xd0));
    if (0.0 < fVar5) {
      uVar6 = CONCAT44(extraout_s15,fVar5);
    }
    uVar11 = FloatVectorSub(CONCAT44(extraout_s13,*(undefined4 *)(param_1 + 0xdc)),uVar7,2,0x20);
    uVar9 = FloatVectorSub(CONCAT44(extraout_s11,*(undefined4 *)(param_1 + 0xd4)),uVar8,2,0x20);
    uVar10 = FloatVectorSub(CONCAT44(extraout_s9,*(undefined4 *)(param_1 + 0xd8)),uVar3,2,0x20);
    uVar11 = FloatVectorMult(uVar11,uVar6,2,0x20);
    uVar9 = FloatVectorMult(uVar9,uVar6,2,0x20);
    uVar6 = FloatVectorMult(uVar10,uVar6,2,0x20);
    uVar7 = FloatVectorAdd(uVar7,uVar11,2);
    uVar8 = FloatVectorAdd(uVar8,uVar9,2);
    uVar6 = FloatVectorAdd(uVar3,uVar6,2);
    *(int *)(param_1 + 0x28) = (int)uVar8;
    fVar5 = (float)uVar6;
    *(float *)(param_1 + 0x2c) = fVar5;
    *(int *)(param_1 + 0x30) = (int)uVar7;
  }
  else {
    uVar6 = FloatVectorMult(CONCAT44(param_2,param_2),CONCAT44(uVar2,DAT_0003ab30),2,0x20);
    uVar6 = FloatVectorAdd(CONCAT44(uVar2,*(undefined4 *)(param_1 + 0xc4)),uVar6,2);
    fVar5 = (float)uVar6;
    *(float *)(param_1 + 0xc4) = fVar5;
    *(undefined4 *)(param_1 + 0xbc) = 0;
    if (fVar5 <= 0.0) {
      *(uint *)(param_1 + 0xc) = *(uint *)(param_1 + 0xc) | 0x10;
    }
  }
  return fVar5;
}


```

## FUN_00016214 — 00016214

```c

void FUN_00016214(int param_1,float param_2)

{
  bool bVar1;
  char cVar2;
  byte bVar3;
  longlong lVar4;
  float fVar5;
  undefined *puVar6;
  undefined *puVar7;
  undefined *puVar8;
  undefined *puVar9;
  float fVar10;
  int iVar11;
  undefined4 uVar12;
  int *piVar13;
  int iVar14;
  size_t sVar15;
  uint uVar16;
  int extraout_r1;
  int extraout_r1_00;
  int *extraout_r2;
  int *piVar17;
  int iVar18;
  uint uVar19;
  undefined4 uVar20;
  undefined4 *puVar21;
  float fVar22;
  float extraout_s0;
  float extraout_s0_00;
  undefined4 extraout_s0_01;
  undefined4 extraout_s0_02;
  ulonglong uVar23;
  ulonglong uVar24;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined4 extraout_s1_03;
  undefined4 extraout_s1_04;
  undefined4 extraout_s1_05;
  undefined4 extraout_s1_06;
  undefined4 uVar25;
  undefined4 extraout_s1_07;
  undefined4 extraout_s1_08;
  undefined4 extraout_s1_09;
  undefined4 extraout_s1_10;
  float extraout_s3;
  undefined4 extraout_s3_00;
  undefined4 extraout_s3_01;
  undefined4 extraout_s3_02;
  undefined4 extraout_s3_03;
  undefined4 extraout_s3_04;
  undefined4 extraout_s3_05;
  undefined4 uVar26;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  undefined4 extraout_s5_01;
  undefined4 extraout_s5_02;
  undefined4 extraout_s5_03;
  undefined4 extraout_s5_04;
  undefined4 extraout_s5_05;
  undefined4 extraout_s5_06;
  undefined4 uVar27;
  undefined4 extraout_s5_07;
  undefined4 extraout_s5_08;
  undefined4 extraout_s7;
  undefined4 extraout_s7_00;
  undefined4 extraout_s7_01;
  undefined4 extraout_s7_02;
  undefined4 extraout_s7_03;
  undefined4 extraout_s7_04;
  undefined4 extraout_s7_05;
  undefined4 extraout_s9;
  undefined4 extraout_s9_00;
  undefined4 extraout_s9_01;
  undefined4 uVar28;
  undefined4 extraout_s11;
  undefined4 extraout_s11_00;
  undefined4 extraout_s11_01;
  float fVar29;
  undefined8 uVar30;
  undefined8 unaff_d11;
  float fVar31;
  undefined8 uVar32;
  undefined8 uVar33;
  undefined8 uVar34;
  undefined8 uVar35;
  undefined8 uVar36;
  undefined4 local_fc;
  undefined4 local_f8;
  undefined4 local_f4;
  undefined4 local_f0;
  undefined4 local_ec;
  undefined4 local_e8;
  undefined4 local_e4;
  undefined4 local_e0;
  undefined4 local_dc;
  undefined4 local_d8;
  undefined4 local_d4;
  undefined4 local_d0;
  undefined4 local_cc;
  undefined4 local_c8;
  undefined4 local_c4;
  undefined4 local_c0;
  undefined4 local_bc;
  undefined4 local_b8;
  undefined4 local_b4;
  undefined4 local_b0;
  undefined4 local_ac;
  undefined4 local_a8;
  char acStack_a4 [64];
  int local_64;
  
  puVar7 = PTR_DAT_004d9048;
  puVar6 = PTR____stack_chk_guard_004d9044;
  local_64 = *(int *)PTR____stack_chk_guard_004d9044;
  fVar29 = *(float *)(PTR_DAT_004d9048 + 0x44);
  fVar10 = param_2;
  if (param_2 != 0.0) {
    fVar10 = fVar29;
  }
  uVar30 = CONCAT44(fVar10,param_2);
  FUN_0001702c(param_1);
  uVar23 = 0;
  if (param_2 != 0.0) {
    uVar23 = (ulonglong)(uint)fVar29;
  }
  uVar24 = uVar23;
  fVar10 = extraout_s3;
  if (*(char *)(param_1 + 0x50) != '\0') {
    uVar33 = CONCAT44(extraout_s5,*(undefined4 *)(param_1 + 0xc4));
    uVar35 = FloatVectorMult((ulonglong)*(uint *)(param_1 + 0xc0),
                             (ulonglong)*(uint *)(param_1 + 0xc0),2,0x20);
    uVar32 = CONCAT44(extraout_s3,*(undefined4 *)(param_1 + 200));
    uVar33 = FloatVectorMult(uVar33,uVar33,2,0x20);
    uVar32 = FloatVectorMult(uVar32,uVar32,2,0x20);
    uVar33 = FloatVectorAdd(uVar35,uVar33,2);
    uVar32 = FloatVectorAdd(uVar33,uVar32,2);
    fVar10 = (float)FUN_00301044((int)uVar32);
    uVar24 = 0x3f8000003f800000;
    if (fVar10 / 15.0 <= 1.0) {
      uVar32 = CONCAT44(0x3f800000,*(undefined4 *)(param_1 + 0xc0));
      uVar33 = CONCAT44(extraout_s5_00,*(undefined4 *)(param_1 + 0xc4));
      uVar35 = FloatVectorMult(uVar32,uVar32,2,0x20);
      uVar32 = CONCAT44(fVar10,*(undefined4 *)(param_1 + 200));
      uVar33 = FloatVectorMult(uVar33,uVar33,2,0x20);
      uVar32 = FloatVectorMult(uVar32,uVar32,2,0x20);
      uVar33 = FloatVectorAdd(uVar35,uVar33,2);
      uVar32 = FloatVectorAdd(uVar33,uVar32,2);
      fVar10 = (float)FUN_00301044((int)uVar32);
      uVar32 = FloatVectorMult(CONCAT44(0x41700000,fVar10 / 15.0),0x3f0000003f000000,2,0x20);
      uVar24 = FloatVectorAdd(uVar32,0x3f0000003f000000,2);
    }
    if (DAT_005573b8 < (float)uVar24) {
      DAT_005573b8 = (float)uVar24;
    }
  }
  fVar29 = DAT_00016614;
  uVar12 = (undefined4)(uVar24 >> 0x20);
  if (*(char *)(param_1 + 0xa5) != '\0') {
    uVar32 = FloatVectorAdd(uVar30,CONCAT44(fVar10,*(undefined4 *)(param_1 + 0x17c)),2);
    *(float *)(param_1 + 0x17c) = (float)uVar32;
    if ((float)uVar32 <= fVar29) goto LAB_00016390;
    DAT_005573b4 = (DAT_005573b4 + 1) % 8;
    FUN_00019f10(&DAT_00557468 + DAT_005573b4 * 4,param_1 + 0xb8,*(undefined4 *)(param_1 + 0xb4));
    *(undefined1 *)(param_1 + 0xa5) = 0;
    uVar12 = extraout_s1;
  }
  *(undefined4 *)(param_1 + 0x17c) = 0;
LAB_00016390:
  if (*(int *)(param_1 + 0xb4) < 4) {
    *(undefined4 *)(param_1 + 0xf4) = 0;
  }
  else if (((*(float *)(puVar7 + 0x24) <= 0.0) && ((DAT_005d4d74 & 0x40) == 0)) &&
          ((*(int **)puVar7 == (int *)0x0 ||
           (iVar11 = (**(code **)(**(int **)puVar7 + 0x28))(), uVar12 = extraout_s1_00, iVar11 == 1)
           ))) {
    local_a8 = 0;
    uVar12 = FUN_000065c4();
    piVar13 = (int *)FUN_00006ad0(uVar12,1,&local_a8);
    puVar9 = PTR_DAT_004d90b4;
    puVar8 = PTR_DAT_004d9050;
    fVar5 = DAT_00016620;
    fVar29 = DAT_0001661c;
    fVar10 = DAT_00016618;
    fVar31 = (float)((ulonglong)unaff_d11 >> 0x20);
    if (piVar13 != (int *)0x0) {
      do {
        cVar2 = DAT_00557390;
        if (DAT_00557390 == '\0') {
          cVar2 = *(char *)((int)piVar13 + 0x35);
        }
        fVar31 = fVar5;
        if ((DAT_00557390 != '\0' || cVar2 != '\x01') ||
           (fVar22 = (float)piVar13[0x2b], 0.0 < fVar22)) break;
        if (((char)piVar13[0x6f] == '\0') &&
           ((((fVar22 = (float)piVar13[0x41], fVar22 <= -1.0 &&
              (fVar22 = (float)piVar13[0x34], fVar22 <= 0.0)) && ((*(byte *)(piVar13 + 3) & 1) == 0)
             ) && ((char)piVar13[0x30] != '\0')))) {
          iVar11 = FUN_00017d74(param_1,piVar13);
          if (iVar11 == 1) {
            uVar12 = *(undefined4 *)(param_1 + 0xc0);
            local_b0 = *(undefined4 *)(param_1 + 0xc4);
            local_ac = *(undefined4 *)(param_1 + 200);
            if (DAT_005d4d80 != '\0') {
              *(undefined1 *)(param_1 + 0xa5) = 1;
            }
            if ((((char)piVar13[0x33] == '\0') || (3 < (uint)piVar13[0x32])) &&
               (*(char *)((int)piVar13 + 0xc1) == '\0')) {
              *(int *)(param_1 + 0x3c) = *(int *)(param_1 + 0x3c) + 2;
            }
            *(undefined4 *)(param_1 + 0x44) = 0;
            *(undefined4 *)(param_1 + 0x40) = 0;
            *(undefined4 *)(param_1 + 0xf8) = uVar12;
            *(undefined4 *)(param_1 + 0xfc) = local_b0;
            *(undefined4 *)(param_1 + 0x100) = local_ac;
            bVar3 = *(byte *)(piVar13 + 0xf);
            *(uint *)(param_1 + 0x110) = (uint)bVar3;
            *(int *)(param_1 + 0x104) = piVar13[4];
            *(int *)(param_1 + 0x108) = piVar13[5];
            *(int *)(param_1 + 0x10c) = piVar13[6];
            local_b4 = uVar12;
            if ((char)piVar13[0x6e] == '\0') {
              iVar11 = piVar13[0x21];
              piVar17 = extraout_r2;
              if (iVar11 != 2) {
                piVar17 = *(int **)(param_1 + 0x180);
              }
              if (iVar11 == 2 || piVar17 == piVar13) goto LAB_00016538;
              *(int **)(param_1 + 0x180) = piVar13;
              *(undefined4 *)(param_1 + 0x174) = 0;
              *(uint *)(param_1 + *(int *)(param_1 + 0x8c) * 4 + 0x60) = (uint)bVar3;
              *(uint *)(param_1 + 0x90) = (uint)(iVar11 != 0);
              if (*(char *)(param_1 + 0x51) == '\0') {
LAB_00016680:
                uVar20 = *(undefined4 *)(puVar7 + 0x5c);
                uVar12 = FUN_002f69c4(uVar12,"slashesScoring",0xe);
                FUN_00027588(uVar20,"slashesScoring",uVar12,1,0,0);
              }
              else if (*(int *)(param_1 + 0x8c) == 0) {
                iVar11 = *(int *)(puVar7 + 0x5c);
                if (iVar11 != 0) {
                  uVar12 = FUN_002f69c4(uVar12,"slashes",7);
                  uVar12 = FUN_00027588(iVar11,"slashes",uVar12,1,0,0);
                }
                goto LAB_00016680;
              }
              *(undefined1 *)(param_1 + 0x51) = 1;
              iVar11 = *(int *)(param_1 + 0x8c) + 1;
              *(int *)(param_1 + 0x8c) = iVar11;
              if (9 < iVar11) {
                *(undefined4 *)(param_1 + 0x174) = 0x3dc28f5c;
              }
              lVar4 = (ulonglong)*(uint *)puVar8 * (ulonglong)*(uint *)(puVar8 + 8);
              uVar16 = (uint)lVar4;
              uVar19 = *(int *)(puVar8 + 4) * *(uint *)(puVar8 + 8) +
                       *(uint *)puVar8 * *(int *)(puVar8 + 0xc) + (int)((ulonglong)lVar4 >> 0x20) +
                       *(int *)(puVar8 + 0x14) + (uint)CARRY4(uVar16,*(uint *)(puVar8 + 0x10));
              uVar12 = (undefined4)((ulonglong)uVar19 * 0x7ffff >> 0x20);
              *(uint *)puVar8 = uVar16 + *(uint *)(puVar8 + 0x10);
              *(uint *)(puVar8 + 4) = uVar19;
              uVar32 = FixedToFP(CONCAT44(uVar12,uVar12),0,1,0,0x20);
              uVar33 = FixedToFP(CONCAT44(iVar11,iVar11),0,0,0,0x20);
              uVar12 = (undefined4)((ulonglong)uVar32 >> 0x20);
              uVar32 = FloatVectorMult(CONCAT44(uVar12,(float)uVar32 / fVar10),0x3f0000003f000000,2,
                                       0x20);
              uVar32 = FloatVectorAdd(uVar32,0x3f4000003f400000,2);
              uVar32 = FloatVectorMult(uVar33,uVar32,2,0x20);
              uVar32 = FloatVectorSub(CONCAT44(uVar12,*(undefined4 *)(param_1 + 0x54)),uVar32,2,0x20
                                     );
              fVar22 = (float)uVar32;
              *(float *)(param_1 + 0x54) = fVar22;
              piVar17 = *(int **)puVar7;
              if (piVar17 != (int *)0x0) {
                fVar22 = (float)(**(code **)(*piVar17 + 0x48))(piVar17,param_1);
              }
            }
            else {
LAB_00016538:
              fVar22 = *(float *)(param_1 + 0x174);
              if ((int)((uint)(fVar22 < fVar29) << 0x1f) < 0) {
                *(undefined4 *)(param_1 + 0x174) = 0x3dc28f5c;
              }
            }
            fVar22 = (float)(**(code **)(*piVar13 + 0x24))(fVar22,piVar13,param_1,0,0,&local_b4);
            if (*(char *)((int)piVar13 + 0x1ba) != '\0') {
              *(int *)(param_1 + 0x110) = *(int *)(param_1 + 0x110) + *(int *)puVar9;
              lVar4 = (ulonglong)*(uint *)puVar8 * (ulonglong)*(uint *)(puVar8 + 8);
              uVar19 = (uint)lVar4;
              uVar16 = *(int *)(puVar8 + 4) * *(uint *)(puVar8 + 8) +
                       *(uint *)puVar8 * *(int *)(puVar8 + 0xc) + (int)((ulonglong)lVar4 >> 0x20) +
                       *(int *)(puVar8 + 0x14) + (uint)CARRY4(uVar19,*(uint *)(puVar8 + 0x10));
              uVar12 = (undefined4)((ulonglong)uVar16 * 0x7ffff >> 0x20);
              *(uint *)puVar8 = uVar19 + *(uint *)(puVar8 + 0x10);
              *(uint *)(puVar8 + 4) = uVar16;
              uVar32 = FixedToFP(CONCAT44(uVar12,uVar12),0,1,0,0x20);
              uVar12 = (undefined4)((ulonglong)uVar32 >> 0x20);
              uVar32 = FloatVectorMult(CONCAT44(uVar12,(float)uVar32 / fVar10),0x3f0000003f000000,2,
                                       0x20);
              uVar32 = FloatVectorAdd(uVar32,0x3f4000003f400000,2);
              uVar32 = FloatVectorMult(uVar32,0xc0400000c0400000,2,0x20);
              uVar32 = FloatVectorAdd(CONCAT44(uVar12,*(undefined4 *)(param_1 + 0x54)),uVar32,2);
              fVar22 = (float)uVar32;
              *(float *)(param_1 + 0x54) = fVar22;
            }
            if ((char)piVar13[0x6e] == '\0') {
              if (DAT_005d4d6c != 0) {
                uVar12 = FUN_00033ca0();
                iVar11 = FUN_00035a08(uVar12,DAT_005d4d6c,0,1);
                fVar22 = extraout_s0_00;
                if (iVar11 != 0) {
                  *(undefined4 *)(iVar11 + 8) = *(undefined4 *)(param_1 + 0x10);
                  *(undefined4 *)(iVar11 + 0xc) = *(undefined4 *)(param_1 + 0x14);
                  *(undefined4 *)(iVar11 + 0x10) = *(undefined4 *)(param_1 + 0x18);
                }
              }
            }
            else {
              DAT_00557390 = '\x01';
            }
          }
          else {
            if ((DAT_005d4d74 & 2) == 0) {
              fVar22 = extraout_s0;
              if ((DAT_005d4d74 & 1) == 0) goto LAB_00016912;
              uVar35 = FloatVectorSub(CONCAT44(extraout_s9,piVar13[4]),
                                      CONCAT44(extraout_s5_01,*(undefined4 *)(param_1 + 0x10)),2,
                                      0x20);
              uVar33 = FloatVectorSub(CONCAT44(extraout_s7,piVar13[5]),
                                      CONCAT44(extraout_s3_00,*(undefined4 *)(param_1 + 0x14)),2,
                                      0x20);
              uVar32 = FloatVectorSub(CONCAT44(extraout_s11,piVar13[6]),
                                      CONCAT44(extraout_s1_01,*(undefined4 *)(param_1 + 0x18)),2,
                                      0x20);
              local_cc = (undefined4)uVar35;
              local_c8 = (undefined4)uVar33;
              local_c4 = (undefined4)uVar32;
              uVar12 = FUN_00009b50(local_c4,&local_cc);
              uVar32 = FloatVectorMult(CONCAT44(uVar12,uVar12),0x3f0000003f000000,2,0x20);
              fVar22 = fVar5;
              if ((int)((uint)((float)uVar32 < fVar5) << 0x1f) < 0) {
                fVar22 = (float)uVar32;
              }
              uVar32 = CONCAT44(extraout_s3_01,fVar22);
              uVar33 = FloatVectorMult(CONCAT44(extraout_s7_00,local_cc),uVar32,2,0x20);
              uVar35 = FloatVectorMult(CONCAT44(extraout_s5_02,local_c8),uVar32,2,0x20);
              uVar34 = FloatVectorMult(uVar30,uVar33,2,0x20);
              uVar33 = FloatVectorMult(uVar32,CONCAT44(extraout_s1_02,local_c4),2,0x20);
              uVar35 = FloatVectorMult(uVar30,uVar35,2,0x20);
              uVar32 = FloatVectorAdd(CONCAT44(extraout_s5_02,piVar13[7]),uVar34,2);
              uVar33 = FloatVectorMult(uVar30,uVar33,2,0x20);
              piVar13[7] = (int)uVar32;
              uVar32 = FloatVectorAdd(uVar35,CONCAT44((int)((ulonglong)uVar32 >> 0x20),piVar13[8]),2
                                     );
              piVar13[8] = (int)uVar32;
              uVar32 = FloatVectorAdd(uVar33,CONCAT44((int)((ulonglong)uVar32 >> 0x20),piVar13[9]),2
                                     );
              iVar11 = (int)uVar32;
            }
            else {
              uVar35 = FloatVectorSub(CONCAT44(extraout_s9,piVar13[4]),
                                      CONCAT44(extraout_s5_01,*(undefined4 *)(param_1 + 0x10)),2,
                                      0x20);
              uVar33 = FloatVectorSub(CONCAT44(extraout_s7,piVar13[5]),
                                      CONCAT44(extraout_s3_00,*(undefined4 *)(param_1 + 0x14)),2,
                                      0x20);
              uVar32 = FloatVectorSub(CONCAT44(extraout_s11,piVar13[6]),
                                      CONCAT44(extraout_s1_01,*(undefined4 *)(param_1 + 0x18)),2,
                                      0x20);
              local_c0 = (undefined4)uVar35;
              local_bc = (undefined4)uVar33;
              local_b8 = (undefined4)uVar32;
              uVar12 = FUN_00009b50(local_b8,&local_c0);
              uVar32 = FloatVectorMult(CONCAT44(uVar12,uVar12),0x3f0000003f000000,2,0x20);
              fVar22 = fVar5;
              if ((int)((uint)((float)uVar32 < fVar5) << 0x1f) < 0) {
                fVar22 = (float)uVar32;
              }
              uVar32 = CONCAT44(extraout_s3_02,fVar22);
              uVar33 = FloatVectorMult(CONCAT44(extraout_s7_01,local_c0),uVar32,2,0x20);
              uVar35 = FloatVectorMult(CONCAT44(extraout_s5_03,local_bc),uVar32,2,0x20);
              uVar34 = FloatVectorMult(uVar30,uVar33,2,0x20);
              uVar33 = FloatVectorMult(uVar32,CONCAT44(extraout_s1_03,local_b8),2,0x20);
              uVar35 = FloatVectorMult(uVar30,uVar35,2,0x20);
              uVar32 = FloatVectorSub(CONCAT44(extraout_s5_03,piVar13[7]),uVar34,2,0x20);
              uVar33 = FloatVectorMult(uVar30,uVar33,2,0x20);
              piVar13[7] = (int)uVar32;
              uVar32 = FloatVectorSub(CONCAT44((int)((ulonglong)uVar32 >> 0x20),piVar13[8]),uVar35,2
                                      ,0x20);
              piVar13[8] = (int)uVar32;
              uVar32 = FloatVectorSub(CONCAT44((int)((ulonglong)uVar32 >> 0x20),piVar13[9]),uVar33,2
                                      ,0x20);
              iVar11 = (int)uVar32;
            }
            piVar13[9] = iVar11;
            fVar22 = (float)FUN_00009b50(iVar11,piVar13 + 7);
            uVar32 = 0x4100000041000000;
            if ((int)((uint)(fVar22 < 8.0) << 0x1f) < 0) {
              uVar32 = CONCAT44(0x41000000,fVar22);
            }
            uVar33 = FloatVectorMult(CONCAT44(fVar22,piVar13[7]),uVar32,2,0x20);
            piVar13[7] = (int)uVar33;
            uVar33 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar33 >> 0x20),piVar13[8]),uVar32,2,
                                     0x20);
            piVar13[8] = (int)uVar33;
            uVar32 = FloatVectorMult(uVar32,CONCAT44((int)((ulonglong)uVar33 >> 0x20),piVar13[9]),2,
                                     0x20);
            fVar22 = (float)uVar32;
            piVar13[9] = (int)fVar22;
          }
        }
LAB_00016912:
        uVar12 = FUN_000065c4(fVar22);
        piVar13 = (int *)FUN_00006af0(uVar12,1,&local_a8);
      } while (piVar13 != (int *)0x0);
    }
    uVar12 = FUN_000065c4();
    piVar13 = (int *)FUN_00006ad0(uVar12,2,&local_a8);
    fVar10 = DAT_00016620;
    if (piVar13 != (int *)0x0) {
      uVar32 = CONCAT44(fVar31,DAT_00016620);
      do {
        if (DAT_00557390 != '\0') break;
        local_d8 = *(undefined4 *)(param_1 + 0xc0);
        local_d4 = *(undefined4 *)(param_1 + 0xc4);
        local_d0 = *(undefined4 *)(param_1 + 200);
        uVar24 = (ulonglong)(uint)piVar13[0x30];
        if ((((float)piVar13[0x30] <= 0.0) && ((*(byte *)(piVar13 + 3) & 1) == 0)) &&
           (*(char *)((int)piVar13 + 0x7d) != '\0')) {
          iVar11 = FUN_00017d74(param_1,piVar13);
          if (iVar11 == 1) {
            if ((DAT_005d4d74 & 0x10) == 0) {
              local_d4 = *(undefined4 *)(param_1 + 0xc4);
              local_d0 = *(undefined4 *)(param_1 + 200);
              local_d8 = *(undefined4 *)(param_1 + 0xc0);
              uVar16 = (**(code **)(*piVar13 + 0x24))(extraout_s0_01,piVar13,param_1,0,0,&local_d8);
              uVar24 = (ulonglong)uVar16;
              DAT_00557390 = '\x01';
              if ((*(char *)((int)piVar13 + 0x7e) != '\0') && ((char)piVar13[0x26] == '\0')) {
                *(undefined1 *)(param_1 + 0xa4) = 1;
              }
              goto LAB_00016c2c;
            }
            uVar33 = FloatVectorMult(uVar30,CONCAT44(extraout_s5_04,*(undefined4 *)(param_1 + 0xc0))
                                     ,2,0x20);
            uVar35 = FloatVectorMult(uVar30,CONCAT44(extraout_s3_03,*(undefined4 *)(param_1 + 0xc4))
                                     ,2,0x20);
            uVar33 = FloatVectorMult(uVar33,0x4120000041200000,2,0x20);
            uVar34 = FloatVectorMult(uVar35,0x4120000041200000,2,0x20);
            uVar33 = FloatVectorAdd(uVar33,CONCAT44(extraout_s5_04,piVar13[7]),2);
            uVar35 = FloatVectorMult(uVar30,CONCAT44(extraout_s1_04,*(undefined4 *)(param_1 + 200)),
                                     2,0x20);
            piVar13[7] = (int)uVar33;
            uVar35 = FloatVectorMult(uVar35,0x4120000041200000,2,0x20);
            uVar33 = FloatVectorAdd(uVar34,CONCAT44(extraout_s1_04,piVar13[8]),2);
            piVar13[8] = (int)uVar33;
            uVar24 = FloatVectorAdd(uVar35,CONCAT44((int)((ulonglong)uVar33 >> 0x20),piVar13[9]),2);
          }
          else {
            iVar11 = FUN_00017fdc(param_1,piVar13);
            uVar24 = CONCAT44(extraout_s1_05,extraout_s0_02);
            uVar12 = extraout_s7_02;
            uVar20 = extraout_s11_00;
            uVar28 = extraout_s9_00;
            uVar27 = extraout_s5_05;
            uVar26 = extraout_s3_04;
            if ((iVar11 == 1) && (iVar11 = *(int *)(puVar7 + 0x5c), iVar11 != 0)) {
              uVar12 = FUN_002f69c4("near_miss",9);
              uVar12 = FUN_00027588(iVar11,"near_miss",uVar12,1,0,0);
              uVar24 = CONCAT44(extraout_s1_06,uVar12);
              uVar12 = extraout_s7_03;
              uVar20 = extraout_s11_01;
              uVar28 = extraout_s9_01;
              uVar27 = extraout_s5_06;
              uVar26 = extraout_s3_05;
            }
            uVar25 = (undefined4)(uVar24 >> 0x20);
            if ((DAT_005d4d74 & 4) == 0) {
              if ((DAT_005d4d74 & 8) == 0) goto LAB_00016c2c;
              uVar34 = FloatVectorSub(CONCAT44(uVar28,piVar13[4]),
                                      CONCAT44(uVar27,*(undefined4 *)(param_1 + 0x10)),2,0x20);
              uVar35 = FloatVectorSub(CONCAT44(uVar12,piVar13[5]),
                                      CONCAT44(uVar26,*(undefined4 *)(param_1 + 0x14)),2,0x20);
              uVar33 = FloatVectorSub(CONCAT44(uVar20,piVar13[6]),
                                      CONCAT44(uVar25,*(undefined4 *)(param_1 + 0x18)),2,0x20);
              local_f0 = (undefined4)uVar34;
              local_ec = (undefined4)uVar35;
              local_e8 = (undefined4)uVar33;
              uVar12 = FUN_00009b50(local_e8,&local_f0);
              uVar35 = FloatVectorMult(CONCAT44(uVar12,uVar12),0x3f0000003f000000,2,0x20);
              uVar33 = uVar32;
              if ((int)((uint)((float)uVar35 < fVar10) << 0x1f) < 0) {
                uVar33 = CONCAT44(fVar31,(float)uVar35);
              }
              uVar35 = FloatVectorMult(CONCAT44(extraout_s7_04,local_f0),uVar33,2,0x20);
              uVar34 = FloatVectorMult(CONCAT44(extraout_s5_07,local_ec),uVar33,2,0x20);
              uVar36 = FloatVectorMult(uVar30,uVar35,2,0x20);
              uVar35 = FloatVectorMult(uVar33,CONCAT44(extraout_s1_07,local_e8),2,0x20);
              uVar34 = FloatVectorMult(uVar30,uVar34,2,0x20);
              uVar33 = FloatVectorSub(CONCAT44(extraout_s5_07,piVar13[7]),uVar36,2,0x20);
              uVar35 = FloatVectorMult(uVar30,uVar35,2,0x20);
              piVar13[7] = (int)uVar33;
              uVar33 = FloatVectorSub(CONCAT44((int)((ulonglong)uVar33 >> 0x20),piVar13[8]),uVar34,2
                                      ,0x20);
              piVar13[8] = (int)uVar33;
              uVar33 = FloatVectorSub(CONCAT44((int)((ulonglong)uVar33 >> 0x20),piVar13[9]),uVar35,2
                                      ,0x20);
              iVar11 = (int)uVar33;
            }
            else {
              uVar34 = FloatVectorSub(CONCAT44(uVar28,piVar13[4]),
                                      CONCAT44(uVar27,*(undefined4 *)(param_1 + 0x10)),2,0x20);
              uVar35 = FloatVectorSub(CONCAT44(uVar12,piVar13[5]),
                                      CONCAT44(uVar26,*(undefined4 *)(param_1 + 0x14)),2,0x20);
              uVar33 = FloatVectorSub(CONCAT44(uVar20,piVar13[6]),
                                      CONCAT44(uVar25,*(undefined4 *)(param_1 + 0x18)),2,0x20);
              local_e4 = (undefined4)uVar34;
              local_e0 = (undefined4)uVar35;
              local_dc = (undefined4)uVar33;
              uVar12 = FUN_00009b50(local_dc,&local_e4);
              uVar35 = FloatVectorMult(CONCAT44(uVar12,uVar12),0x3f0000003f000000,2,0x20);
              uVar33 = uVar32;
              if ((int)((uint)((float)uVar35 < fVar10) << 0x1f) < 0) {
                uVar33 = CONCAT44(fVar31,(float)uVar35);
              }
              uVar35 = FloatVectorMult(CONCAT44(extraout_s7_05,local_e4),uVar33,2,0x20);
              uVar34 = FloatVectorMult(CONCAT44(extraout_s5_08,local_e0),uVar33,2,0x20);
              uVar36 = FloatVectorMult(uVar30,uVar35,2,0x20);
              uVar35 = FloatVectorMult(uVar33,CONCAT44(extraout_s1_08,local_dc),2,0x20);
              uVar34 = FloatVectorMult(uVar30,uVar34,2,0x20);
              uVar33 = FloatVectorAdd(CONCAT44(extraout_s5_08,piVar13[7]),uVar36,2);
              uVar35 = FloatVectorMult(uVar30,uVar35,2,0x20);
              piVar13[7] = (int)uVar33;
              uVar33 = FloatVectorAdd(uVar34,CONCAT44((int)((ulonglong)uVar33 >> 0x20),piVar13[8]),2
                                     );
              piVar13[8] = (int)uVar33;
              uVar33 = FloatVectorAdd(uVar35,CONCAT44((int)((ulonglong)uVar33 >> 0x20),piVar13[9]),2
                                     );
              iVar11 = (int)uVar33;
            }
            piVar13[9] = iVar11;
            fVar29 = (float)FUN_00009b50(iVar11,piVar13 + 7);
            uVar33 = 0x4100000041000000;
            if ((int)((uint)(fVar29 < 8.0) << 0x1f) < 0) {
              uVar33 = CONCAT44(0x41000000,fVar29);
            }
            uVar35 = FloatVectorMult(CONCAT44(fVar29,piVar13[7]),uVar33,2,0x20);
            piVar13[7] = (int)uVar35;
            uVar35 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar35 >> 0x20),piVar13[8]),uVar33,2,
                                     0x20);
            piVar13[8] = (int)uVar35;
            uVar24 = FloatVectorMult(uVar33,CONCAT44((int)((ulonglong)uVar35 >> 0x20),piVar13[9]),2,
                                     0x20);
          }
          piVar13[9] = (int)uVar24;
        }
LAB_00016c2c:
        uVar12 = FUN_000065c4((int)uVar24);
        piVar13 = (int *)FUN_00006af0(uVar12,2,&local_a8);
      } while (piVar13 != (int *)0x0);
    }
    uVar12 = FUN_000065c4();
    piVar13 = (int *)FUN_00006ad0(uVar12,0,&local_a8);
    uVar12 = extraout_s1_09;
    while (piVar13 != (int *)0x0) {
      local_fc = *(undefined4 *)(param_1 + 0xc0);
      local_f8 = *(undefined4 *)(param_1 + 0xc4);
      local_f4 = *(undefined4 *)(param_1 + 200);
      if ((((char)piVar13[0x17] != '\0') && ((*(byte *)(piVar13 + 3) & 0x11) == 0)) &&
         (iVar11 = FUN_00017d74(param_1,piVar13), iVar11 == 1)) {
        local_fc = *(undefined4 *)(param_1 + 0xc0);
        local_f8 = *(undefined4 *)(param_1 + 0xc4);
        local_f4 = *(undefined4 *)(param_1 + 200);
        (**(code **)(*piVar13 + 0x24))(piVar13,param_1,0,0,&local_fc);
        if (*(char *)(param_1 + 0x51) == '\0') {
          uVar20 = *(undefined4 *)(puVar7 + 0x5c);
          uVar12 = FUN_002f69c4("slashesScoring",0xe);
          FUN_00027588(uVar20,"slashesScoring",uVar12,1,0,0);
        }
        *(undefined1 *)(param_1 + 0x51) = 1;
      }
      uVar12 = FUN_000065c4();
      piVar13 = (int *)FUN_00006af0(uVar12,0,&local_a8);
      uVar12 = extraout_s1_10;
    }
  }
  if ((int)((uint)(*(float *)(param_1 + 0x174) < DAT_00017024) << 0x1f) < 0) {
    uVar30 = FloatVectorAdd(uVar23,CONCAT44(uVar12,*(float *)(param_1 + 0x174)),2);
    bVar1 = DAT_00017028 <= (float)uVar30;
    *(float *)(param_1 + 0x174) = (float)uVar30;
    if (bVar1) {
      *(undefined4 *)(param_1 + 0x174) = 0x3dcccccd;
      DAT_005d4d90 = DAT_005d4d90 + 1;
      for (puVar21 = DAT_005d4d88; (undefined4 **)puVar21 != &DAT_005d4d88;
          puVar21 = (undefined4 *)*puVar21) {
        piVar13 = puVar21 + 2;
        if ((puVar21[0xb] == 0) || (((int)puVar21[0xb] < DAT_005d4d90 && (puVar21[0xc] == 1)))) {
          if (*(char *)(puVar21 + 10) != '\0') {
            piVar13 = (int *)*piVar13;
          }
          if (piVar13 != (int *)0x0) {
            (**(code **)(*piVar13 + 0xc))(piVar13,param_1);
          }
        }
      }
      FUN_0001a438(&DAT_005d4d88);
      piVar13 = *(int **)puVar7;
      iVar11 = extraout_r1;
      if (piVar13 != (int *)0x0) {
        (**(code **)(*piVar13 + 0x50))(piVar13,param_1);
        iVar11 = extraout_r1_00;
      }
      iVar14 = *(int *)(param_1 + 0x8c);
      piVar13 = (int *)(param_1 + 0x60);
      if (1 < iVar14) {
        iVar11 = *piVar13;
      }
      iVar18 = iVar14 + -2;
      if (iVar14 >= 2) {
        iVar18 = iVar11;
      }
      if (iVar18 < 0 == (iVar14 < 2 && SBORROW4(iVar14,2))) {
        iVar14 = *(int *)(puVar7 + 0x40) - iVar14;
        if (iVar14 < 2) {
          iVar14 = 2;
        }
        *(int *)(puVar7 + 0x40) = iVar14;
        iVar14 = *(int *)(param_1 + 0x8c);
        iVar11 = iVar14;
        if (2 < iVar14) {
          iVar11 = *(int *)(param_1 + 100);
        }
        iVar18 = iVar14 + -3;
        if (iVar14 >= 3) {
          iVar18 = iVar11;
        }
        if (iVar18 < 0 == (iVar14 < 3 && SBORROW4(iVar14,3))) {
          iVar11 = FUN_0001cd6c();
          if (iVar11 != 1 || *(int *)(param_1 + 0x90) != 2) {
            FUN_0001cb08(*(undefined4 *)(param_1 + 0x8c),*(int *)(param_1 + 0x90),1,0);
          }
          uVar12 = FUN_0002c450();
          FUN_0002ca24(uVar12,*(undefined4 *)(param_1 + 0x8c));
          uVar12 = FUN_000254b0(*(undefined4 *)(puVar7 + 0x10));
          _sprintf(acStack_a4,"%s_combos",uVar12);
          uVar20 = *(undefined4 *)(puVar7 + 0x5c);
          sVar15 = _strlen(acStack_a4);
          uVar12 = FUN_002f69c4(acStack_a4,sVar15);
          FUN_00027588(uVar20,acStack_a4,uVar12,1,1,1);
          uVar20 = *(undefined4 *)(puVar7 + 0x5c);
          uVar12 = FUN_002f69c4("combos",6);
          FUN_00027588(uVar20,"combos",uVar12,1,0,1);
        }
        uVar12 = FUN_0000342c();
        FUN_000042b4(uVar12,*(undefined4 *)(param_1 + 0x8c),piVar13);
        iVar11 = *(int *)(param_1 + 0x8c);
        if (2 < iVar11) {
          if (((DAT_005573c0 & 1) == 0) &&
             (iVar11 = ___cxa_guard_acquire(&DAT_005573c0), iVar11 != 0)) {
            DAT_005573bc = FUN_0000aae0("strawberry",0);
            ___cxa_guard_release(&DAT_005573c0);
          }
          iVar11 = *(int *)(param_1 + 0x8c);
          iVar14 = 0;
          do {
            if (iVar11 <= iVar14) goto LAB_00016f3c;
            piVar17 = piVar13 + iVar14;
            iVar14 = iVar14 + 1;
          } while (*piVar17 != DAT_005573bc);
          if (((DAT_005573c8 & 1) == 0) &&
             (iVar11 = ___cxa_guard_acquire(&DAT_005573c8), iVar11 != 0)) {
            DAT_005573c4 = FUN_002f69c4("strawberry_combo_total",0x16);
            ___cxa_guard_release(&DAT_005573c8);
          }
          FUN_00027588(*(undefined4 *)(puVar7 + 0x5c),"strawberry_combo_total",DAT_005573c4,1,1,0);
          iVar11 = *(int *)(param_1 + 0x8c);
        }
LAB_00016f3c:
        iVar14 = *(int *)(puVar7 + 0x5c);
        if (*(int *)(iVar14 + 0x2e4) < iVar11) {
          iVar18 = 0;
          do {
            *(int *)(iVar14 + 0x2e8 + iVar18 * 4) = piVar13[iVar18];
            iVar18 = iVar18 + 1;
          } while (iVar18 != 0xb);
          *(int *)(iVar14 + 0x2e4) = iVar11;
          DAT_0052bfdc = FUN_0002e030(piVar13,iVar11,0);
        }
        else if (iVar11 == *(int *)(iVar14 + 0x2e4)) {
          if (DAT_0052bfdc == -1) {
            DAT_0052bfdc = FUN_0002e030(iVar14 + 0x2e8,iVar11,0);
            iVar11 = *(int *)(param_1 + 0x8c);
          }
          iVar11 = FUN_0002e030(piVar13,iVar11,0);
          if (DAT_0052bfdc < iVar11) {
            iVar14 = 0;
            iVar11 = *(int *)(puVar7 + 0x5c);
            do {
              *(int *)(iVar11 + 0x2e8 + iVar14 * 4) = piVar13[iVar14];
              iVar14 = iVar14 + 1;
            } while (iVar14 != 0xb);
            *(undefined4 *)(iVar11 + 0x2e4) = *(undefined4 *)(param_1 + 0x8c);
          }
        }
      }
      *(undefined4 *)(param_1 + 0x8c) = 0;
      *(undefined4 *)(param_1 + 0x90) = 0;
      *(undefined4 *)(param_1 + 0x180) = 0;
      *(undefined4 *)(param_1 + 0x178) = 0;
      _memset(piVar13,0xff,0x2c);
    }
  }
  else {
    *(undefined4 *)(param_1 + 0x180) = 0;
    *(undefined4 *)(param_1 + 0x8c) = 0;
    *(undefined4 *)(param_1 + 0x90) = 0;
    _memset((void *)(param_1 + 0x60),0xff,0x2c);
    *(undefined4 *)(param_1 + 0x178) = 0;
  }
  FUN_00018288(param_1);
  FUN_0001836c(param_1,param_2);
  FUN_00018628(param_1,param_2);
  if (*(int *)puVar6 != local_64) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0001836c — 0001836c

```c

void FUN_0001836c(int param_1,undefined4 param_2)

{
  longlong lVar1;
  longlong lVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  undefined *puVar6;
  undefined *puVar7;
  undefined *puVar8;
  int iVar9;
  uint uVar10;
  undefined4 uVar11;
  undefined4 uVar12;
  undefined4 uVar13;
  uint uVar14;
  uint uVar15;
  uint uVar16;
  uint uVar17;
  undefined8 in_d0;
  undefined8 uVar18;
  undefined4 extraout_s1;
  undefined4 uVar19;
  undefined4 extraout_s3;
  longlong in_d2;
  undefined4 extraout_s5;
  uint extraout_s5_00;
  undefined4 uVar20;
  undefined4 in_s7;
  undefined4 extraout_s7;
  undefined8 unaff_d11;
  undefined8 uVar21;
  undefined8 unaff_d12;
  undefined8 uVar22;
  undefined8 unaff_d13;
  undefined8 uVar23;
  undefined8 in_d16;
  undefined8 uVar24;
  undefined8 uVar25;
  undefined8 uVar26;
  undefined4 local_84;
  undefined4 local_80;
  undefined4 local_7c;
  undefined4 local_78;
  undefined4 local_74;
  undefined4 local_70;
  undefined1 auStack_6c [12];
  
  uVar20 = 0xbf800000;
  if (-1.0 < *(float *)(param_1 + 0x40)) {
    in_d16 = CONCAT44(param_2,param_2);
  }
  uVar18 = FloatVectorSub(CONCAT44((int)((ulonglong)in_d0 >> 0x20),*(float *)(param_1 + 0x40)),
                          in_d16,2,0x20);
  *(int *)(param_1 + 0x40) = (int)uVar18;
  puVar8 = PTR_DAT_004d90b4;
  puVar7 = PTR_DAT_004d9050;
  puVar6 = PTR_DAT_004d9048;
  fVar5 = DAT_00018624;
  fVar4 = DAT_00018618;
  fVar3 = DAT_00018614;
  iVar9 = *(int *)(param_1 + 0x3c);
  if (-1 < iVar9) {
    uVar21 = CONCAT44((int)((ulonglong)unaff_d11 >> 0x20),DAT_0001861c);
    uVar22 = CONCAT44((int)((ulonglong)unaff_d12 >> 0x20),DAT_00018620);
    uVar23 = CONCAT44((int)((ulonglong)unaff_d13 >> 0x20),DAT_00018624);
    while ((float)uVar18 <= 0.0) {
      uVar11 = (undefined4)((ulonglong)in_d2 >> 0x20);
      uVar25 = CONCAT44(uVar11,*(undefined4 *)(param_1 + 0xc0));
      uVar24 = CONCAT44(uVar20,*(undefined4 *)(param_1 + 0xc4));
      uVar26 = FloatVectorMult(uVar25,uVar25,2,0x20);
      uVar20 = *(undefined4 *)(param_1 + 200);
      uVar25 = FloatVectorMult(uVar24,uVar24,2,0x20);
      uVar24 = FloatVectorMult(CONCAT44(in_s7,uVar20),CONCAT44(in_s7,uVar20),2,0x20);
      uVar25 = FloatVectorAdd(uVar26,uVar25,2);
      uVar24 = FloatVectorAdd(uVar25,uVar24,2);
      if (1.0 < (float)uVar24) {
        if ((int)((uint)((float)uVar24 < fVar3) << 0x1f) < 0) {
          *(undefined4 *)(param_1 + 0xf8) = *(undefined4 *)(param_1 + 0xc0);
          *(undefined4 *)(param_1 + 0xfc) = *(undefined4 *)(param_1 + 0xc4);
          *(undefined4 *)(param_1 + 0x100) = uVar20;
        }
      }
      *(int *)(param_1 + 0x3c) = iVar9 + -1;
      uVar10 = *(uint *)(puVar7 + 8);
      uVar17 = *(uint *)(puVar7 + 0x10);
      lVar1 = (ulonglong)*(uint *)puVar7 * (ulonglong)uVar10;
      uVar14 = (uint)lVar1;
      uVar16 = uVar14 + uVar17;
      uVar14 = *(int *)(puVar7 + 4) * uVar10 +
               *(uint *)puVar7 * *(int *)(puVar7 + 0xc) + (int)((ulonglong)lVar1 >> 0x20) +
               *(int *)(puVar7 + 0x14) + (uint)CARRY4(uVar14,uVar17);
      uVar20 = (undefined4)((ulonglong)uVar14 * 0x7ffff >> 0x20);
      uVar24 = FixedToFP(CONCAT44(uVar20,uVar20),0,1,0,0x20);
      uVar26 = FloatVectorMult(CONCAT44(uVar11,(float)uVar24 / fVar4),uVar22,2,0x20);
      uVar25 = CONCAT44((int)((ulonglong)uVar24 >> 0x20),*(undefined4 *)(param_1 + 0x44));
      *(uint *)puVar7 = uVar16;
      *(uint *)(puVar7 + 4) = uVar14;
      uVar24 = FloatVectorAdd(uVar25,uVar26,2);
      uVar26 = FloatVectorAdd(uVar24,uVar21,2);
      uVar24 = uVar23;
      if ((int)((uint)((float)uVar26 < fVar5) << 0x1f) < 0) {
        uVar15 = (uint)((ulonglong)uVar10 * (ulonglong)uVar16);
        uVar10 = *(int *)(puVar7 + 0xc) * uVar16 +
                 uVar10 * uVar14 + (int)((ulonglong)uVar10 * (ulonglong)uVar16 >> 0x20) +
                 *(int *)(puVar7 + 0x14) + (uint)CARRY4(uVar15,uVar17);
        uVar20 = (undefined4)((ulonglong)uVar10 * 0x7ffff >> 0x20);
        *(uint *)puVar7 = uVar15 + uVar17;
        *(uint *)(puVar7 + 4) = uVar10;
        uVar24 = FixedToFP(CONCAT44(uVar20,uVar20),0,1,0,0x20);
        uVar24 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar24 >> 0x20),(float)uVar24 / fVar4),
                                 uVar22,2,0x20);
        uVar24 = FloatVectorAdd(uVar25,uVar24,2);
        uVar24 = FloatVectorAdd(uVar24,uVar21,2);
      }
      uVar18 = FloatVectorAdd(uVar24,uVar18,2);
      *(int *)(param_1 + 0x40) = (int)uVar18;
      *(int *)(param_1 + 0x44) = (int)uVar24;
      uVar11 = FUN_0001bcc0((int)uVar18);
      uVar20 = 0;
      if (*(int *)(param_1 + 0x110) < *(int *)puVar8) {
        iVar9 = FUN_0000ac08();
        uVar20 = 0;
        if (*(char *)(iVar9 + 0x330) != '\0') {
          uVar20 = 1;
        }
      }
      local_78 = *(undefined4 *)(param_1 + 0x10);
      local_74 = *(undefined4 *)(param_1 + 0x14);
      local_70 = *(undefined4 *)(param_1 + 0x18);
      FUN_000050f8(local_78,auStack_6c,*(undefined4 *)(puVar6 + 0x58),&local_78,1,1);
      uVar10 = *(uint *)(puVar7 + 8);
      uVar14 = *(uint *)(puVar7 + 0x10);
      lVar1 = (ulonglong)*(uint *)puVar7 * (ulonglong)uVar10;
      uVar16 = (uint)lVar1;
      uVar17 = uVar16 + uVar14;
      lVar2 = (ulonglong)uVar10 * (ulonglong)uVar17;
      uVar15 = (uint)lVar2;
      uVar16 = *(int *)(puVar7 + 4) * uVar10 +
               *(uint *)puVar7 * *(int *)(puVar7 + 0xc) + (int)((ulonglong)lVar1 >> 0x20) +
               *(int *)(puVar7 + 0x14) + (uint)CARRY4(uVar16,uVar14);
      uVar10 = *(int *)(puVar7 + 0xc) * uVar17 + uVar10 * uVar16 + (int)((ulonglong)lVar2 >> 0x20) +
               *(int *)(puVar7 + 0x14) + (uint)CARRY4(uVar15,uVar14);
      uVar12 = (undefined4)((ulonglong)uVar10 * 0x7ffff >> 0x20);
      uVar13 = (undefined4)((ulonglong)uVar16 * 0x7ffff >> 0x20);
      uVar24 = FixedToFP(CONCAT44(uVar12,uVar12),0,1,0,0x20);
      uVar18 = FixedToFP(CONCAT44(uVar13,uVar13),0,1,0,0x20);
      uVar13 = (undefined4)((ulonglong)uVar18 >> 0x20);
      uVar18 = FloatVectorMult(CONCAT44(uVar13,(float)uVar18 / fVar4),0x3f4000003f400000,2,0x20);
      uVar19 = *(undefined4 *)(param_1 + 0xf8);
      uVar25 = FloatVectorMult(CONCAT44(extraout_s5,(float)uVar24 / fVar4),0x3f4000003f400000,2,0x20
                              );
      uVar12 = *(undefined4 *)(param_1 + 0xfc);
      *(uint *)puVar7 = uVar15 + uVar14;
      *(uint *)(puVar7 + 4) = uVar10;
      uVar18 = FloatVectorAdd(uVar18,0x3f4000003f400000,2);
      uVar25 = FloatVectorAdd(uVar25,0x3f4000003f400000,2);
      uVar24 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar24 >> 0x20),uVar19),uVar18,2,0x20);
      uVar18 = FloatVectorMult(CONCAT44(uVar13,uVar12),uVar25,2,0x20);
      local_84 = (undefined4)uVar24;
      local_80 = (undefined4)uVar18;
      local_7c = 0;
      FUN_0001a7cc(local_80,uVar11,auStack_6c,&local_84,1,uVar20,*(undefined4 *)(param_1 + 0x110));
      in_d2 = (ulonglong)extraout_s5_00 << 0x20;
      iVar9 = *(int *)(param_1 + 0x3c);
      if (iVar9 < 0) {
        return;
      }
      in_s7 = extraout_s7;
      uVar20 = extraout_s3;
      uVar18 = CONCAT44(extraout_s1,*(undefined4 *)(param_1 + 0x40));
    }
  }
  return;
}


```

## FUN_0003c4e4 — 0003c4e4

```c

void FUN_0003c4e4(int param_1)

{
  undefined *puVar1;
  int iVar2;
  int *piVar3;
  int iVar4;
  code *pcVar5;
  undefined1 auStack_168 [40];
  undefined1 auStack_140 [40];
  undefined1 auStack_118 [40];
  undefined1 auStack_f0 [40];
  undefined1 auStack_c8 [40];
  char acStack_a0 [128];
  int local_20;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_20 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_0003f4e8(param_1);
  if (*(char *)(param_1 + 0xa8) == '\0') {
    iVar4 = *(int *)(param_1 + 0xac);
    if (iVar4 != 0) {
      FUN_0030f7cc(auStack_c8,"@about");
      iVar4 = FUN_0039725c(iVar4,auStack_c8);
      FUN_0030f7e0(auStack_c8);
      if (iVar4 != 0) {
        FUN_0030f7cc(auStack_f0,"");
        iVar2 = FUN_0039834c(iVar4,auStack_f0,1);
        FUN_0030f7e0(auStack_f0);
        if (iVar2 == 0) {
          *(int *)(param_1 + 0xb4) = *(int *)(param_1 + 0xb4) + 1;
          _sprintf(acStack_a0,"fact_%d");
          FUN_0030f7cc(auStack_118,acStack_a0);
          piVar3 = (int *)FUN_0039725c(iVar4,auStack_118);
          FUN_0030f7e0(auStack_118);
          if (piVar3 == (int *)0x0) {
            *(undefined4 *)(param_1 + 0xb4) = 1;
            _sprintf(acStack_a0,"fact_%d",0);
            FUN_0030f7cc(auStack_140,acStack_a0);
            piVar3 = (int *)FUN_0039725c(iVar4,auStack_140);
            FUN_0030f7e0(auStack_140);
            if (piVar3 == (int *)0x0) goto LAB_0003c640;
          }
          pcVar5 = *(code **)(*piVar3 + 0x40);
          FUN_0030f7cc(auStack_168,"animated");
          (*pcVar5)(piVar3,auStack_168,1);
          FUN_0030f7e0(auStack_168);
        }
      }
    }
  }
  else {
    *(undefined1 *)(param_1 + 0xa8) = 0;
    if (*(int *)(param_1 + 0xb0) == 1) {
      *(undefined1 *)(param_1 + 0x33) = 1;
    }
    else {
      piVar3 = operator_new(0xb4);
      FUN_00058fd8();
      (**(code **)(*piVar3 + 8))(piVar3);
      FUN_0003e9e8(*(undefined4 *)(PTR_DAT_004d9048 + 0x4c),piVar3,0);
    }
  }
LAB_0003c640:
  if (*(int *)puVar1 != local_20) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00070bc8 — 00070bc8

```c

void FUN_00070bc8(int param_1,int param_2)

{
  undefined *puVar1;
  undefined *puVar2;
  int iVar3;
  uint uVar4;
  uint uVar5;
  undefined4 *puVar6;
  void *pvVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  undefined **local_7c;
  undefined *local_78;
  undefined4 local_74 [8];
  undefined1 local_54;
  undefined **local_50;
  undefined *local_4c;
  undefined4 local_48 [8];
  undefined1 local_28;
  int local_24;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  if (((DAT_005a86d8 & 1) == 0) && (iVar3 = ___cxa_guard_acquire(&DAT_005a86d8), iVar3 != 0)) {
    DAT_005a86d4 = FUN_002f69c4("bean",4);
    ___cxa_guard_release(&DAT_005a86d8);
  }
  if ((param_2 != 0) && (iVar3 = FUN_0000bd38(param_2), *(int *)(iVar3 + 0x250) == DAT_005a86d4)) {
    if (*(int *)(param_1 + 0x40) != 0) {
      FUN_0002be70(*(undefined4 *)(PTR_DAT_004d9048 + 0x1a4),*(int *)(param_1 + 0x40),"bean-lp");
      *(undefined4 *)(param_1 + 0x40) = 0;
    }
    puVar2 = PTR_DAT_004d9048;
    local_50 = &PTR_LAB_0052bf38;
    local_4c = PTR_FUN_004d9058;
    local_28 = 1;
    local_48[0] = 0;
    uVar8 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
    FUN_0000a23c(&local_50,local_48);
    FUN_0002bc94(uVar8,"bean-collect",0x3f800000,0x3f800000,local_48,0);
    FUN_0000a298(local_48);
    local_7c = &PTR_LAB_0052bf38;
    local_54 = 1;
    local_78 = PTR_FUN_004d9154;
    local_74[0] = 0;
    uVar8 = *(undefined4 *)(puVar2 + 0x1a8);
    FUN_0000a23c(&local_7c,local_74);
    FUN_0007268c(uVar8,0x3f000000,0x3f800000,local_74);
    FUN_0000a298(local_74);
    iVar3 = FUN_000276e8(*(undefined4 *)(puVar2 + 0x5c),"bean");
    if (iVar3 == 1) {
      uVar9 = *(undefined4 *)(puVar2 + 0x5c);
      uVar8 = FUN_002f69c4("bean_game_consecutive_total",0x1b);
      FUN_00027588(uVar9,"bean_game_consecutive_total",uVar8,1,1,1);
    }
    pvVar7 = *(void **)(param_1 + 0x3c);
    if (pvVar7 != (void *)0x0) {
      FUN_00071d50(pvVar7);
      operator_delete(pvVar7);
      *(undefined4 *)(param_1 + 0x3c) = 0;
    }
    uVar4 = *(uint *)(param_1 + 0x14);
    uVar5 = 0;
    if ((uVar4 != 0) && (uVar5 = uVar4, 1 < uVar4)) {
      uVar5 = 2;
    }
    iVar3 = FUN_00070e68(param_1);
    if (iVar3 == 1) {
      puVar6 = operator_new(0x4c);
      puVar6[0xf] = 0;
      puVar6[0x10] = 0x3f800000;
      puVar2 = PTR_FUN_004d9158;
      puVar6[0x11] = uVar5;
      puVar6[9] = 0;
      puVar6[0xb] = puVar2;
      puVar6[0xd] = 0;
      puVar6[0xe] = 0x3f000000;
      puVar6[0xc] = 0x3e4ccccd;
      uVar8 = *(undefined4 *)(param_2 + 0x10);
      iVar3 = param_1 + uVar5 * 0xc;
      puVar6[6] = uVar8;
      uVar9 = *(undefined4 *)(param_2 + 0x14);
      puVar6[7] = uVar9;
      uVar10 = *(undefined4 *)(param_2 + 0x18);
      puVar6[8] = uVar10;
      *puVar6 = uVar8;
      puVar6[1] = uVar9;
      puVar6[2] = uVar10;
      puVar6[3] = *(undefined4 *)(iVar3 + 0x18);
      puVar6[4] = *(undefined4 *)(iVar3 + 0x1c);
      puVar6[5] = *(undefined4 *)(iVar3 + 0x20);
      puVar6[10] = 0;
      *(undefined4 **)(param_1 + 0x3c) = puVar6;
      puVar6 = (undefined4 *)(*(int *)(param_1 + 0x54) + 0x1c);
    }
    else {
      uVar9 = *(undefined4 *)(puVar2 + 0x5c);
      uVar8 = FUN_002f69c4("magic_bean_points",0x11);
      FUN_00027588(uVar9,"magic_bean_points",uVar8,DAT_005f9624,0,1);
      uVar8 = FUN_0001cb08(DAT_005f9624,0,1,0);
      puVar6 = (undefined4 *)(*(int *)(param_1 + 0x54) + 0x20);
    }
    FUN_00074254(uVar8,*puVar6,param_2 + 0x10,0xffffffff);
  }
  if (*(int *)puVar1 == local_24) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

## FUN_00034af8 — 00034af8

```c

void FUN_00034af8(float *param_1,undefined4 param_2,int param_3,float param_4)

{
  float *pfVar1;
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
  float *pfVar13;
  float *pfVar14;
  float *pfVar15;
  char cVar16;
  short sVar17;
  short sVar20;
  undefined *puVar21;
  float *pfVar22;
  undefined4 uVar23;
  float fVar24;
  int *piVar25;
  float fVar26;
  int iVar27;
  uint uVar28;
  int iVar29;
  uint uVar30;
  int iVar31;
  float fVar32;
  int iVar33;
  float fVar34;
  undefined4 *puVar35;
  uint uVar36;
  int iVar37;
  uint uVar38;
  int iVar39;
  float *pfVar40;
  uint extraout_s1;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  longlong lVar41;
  uint extraout_s1_02;
  undefined4 extraout_s1_03;
  uint extraout_s1_04;
  uint extraout_s3;
  undefined4 extraout_s3_00;
  undefined4 extraout_s3_01;
  uint extraout_s3_02;
  uint extraout_s3_03;
  undefined4 uVar43;
  longlong lVar42;
  uint extraout_s3_04;
  uint extraout_s5;
  uint extraout_s5_00;
  uint extraout_s5_01;
  uint extraout_s5_02;
  uint extraout_s5_03;
  undefined4 uVar45;
  longlong lVar44;
  undefined4 uVar46;
  undefined4 extraout_s5_04;
  uint extraout_s5_05;
  uint extraout_s7;
  uint extraout_s7_00;
  uint extraout_s7_01;
  uint extraout_s7_02;
  uint extraout_s7_03;
  ulonglong uVar47;
  longlong lVar48;
  uint extraout_s7_04;
  uint extraout_s7_05;
  undefined8 extraout_d4;
  ulonglong uVar49;
  undefined8 extraout_d4_00;
  undefined8 extraout_d4_01;
  undefined8 extraout_d4_02;
  undefined8 extraout_d5;
  undefined8 uVar50;
  ulonglong uVar51;
  undefined8 extraout_d5_00;
  undefined8 extraout_d5_01;
  undefined8 extraout_d5_02;
  undefined8 extraout_d6;
  undefined8 extraout_d6_00;
  undefined8 extraout_d6_01;
  undefined8 extraout_d6_02;
  undefined8 unaff_d10;
  undefined8 uVar52;
  undefined8 unaff_d11;
  undefined8 uVar53;
  undefined8 unaff_d13;
  undefined8 uVar54;
  undefined8 uVar55;
  undefined8 uVar56;
  undefined8 uVar57;
  undefined8 uVar58;
  undefined8 uVar59;
  undefined8 uVar60;
  undefined8 uVar61;
  undefined8 uVar62;
  undefined8 uVar63;
  undefined8 uVar64;
  undefined8 uVar65;
  undefined8 uVar66;
  undefined4 local_118;
  undefined4 local_114;
  undefined4 local_110;
  undefined4 local_10c;
  undefined1 local_108;
  undefined1 local_107;
  undefined1 local_106;
  undefined1 local_105;
  float local_104;
  float local_100;
  float local_fc;
  float local_f8;
  float local_f4;
  float local_f0;
  float local_ec;
  float local_e8;
  float local_e4;
  float local_e0;
  float local_dc;
  float fStack_d8;
  float local_d4;
  float fStack_d0;
  float local_cc;
  float local_c8;
  float local_c4;
  ushort local_c0;
  float local_bc;
  float local_b8;
  ushort local_b4;
  float local_b0;
  float local_ac;
  ushort local_a8;
  float local_a4;
  float local_a0;
  float local_9c;
  float local_98;
  float local_94;
  float local_90;
  float local_8c;
  ushort local_88;
  short local_86;
  short local_84;
  float local_80;
  float local_7c;
  float local_78;
  float local_74;
  float local_70;
  float local_6c;
  undefined1 local_68;
  char local_67;
  float local_64;
  short sVar18;
  short sVar19;
  
  puVar21 = PTR_DAT_004d904c;
  PTR_DAT_004d904c[0x18d4] = 0;
  uVar46 = DAT_0052be24;
  uVar23 = DAT_0052be20;
  *(undefined4 *)(puVar21 + 0x10a8) = DAT_0052be34;
  *(undefined4 *)(puVar21 + 0x10a4) = DAT_0052be30;
  uVar43 = DAT_0052be28;
  *(undefined4 *)(puVar21 + 0x10a0) = DAT_0052be2c;
  *(undefined4 *)(puVar21 + 0x109c) = uVar43;
  *(undefined4 *)(puVar21 + 0x1098) = uVar46;
  *(undefined4 *)(puVar21 + 0x1094) = uVar23;
  *(undefined4 *)(puVar21 + 0x10c0) = DAT_0052be4c;
  uVar23 = DAT_0052be44;
  *(undefined4 *)(puVar21 + 0x10bc) = DAT_0052be48;
  *(undefined4 *)(puVar21 + 0x10b8) = uVar23;
  uVar23 = DAT_0052be3c;
  *(undefined4 *)(puVar21 + 0x10b4) = DAT_0052be40;
  *(undefined4 *)(puVar21 + 0x10b0) = uVar23;
  *(undefined4 *)(puVar21 + 0x10ac) = DAT_0052be38;
  uVar43 = DAT_0052be58;
  uVar46 = DAT_0052be54;
  uVar23 = DAT_0052be50;
  *(undefined4 *)(puVar21 + 0x10d0) = DAT_0052be5c;
  *(undefined4 *)(puVar21 + 0x10cc) = uVar43;
  *(undefined4 *)(puVar21 + 0x10c8) = uVar46;
  *(undefined4 *)(puVar21 + 0x10c4) = uVar23;
  uVar43 = DAT_0052be30;
  uVar46 = DAT_0052be24;
  uVar23 = DAT_0052be20;
  *(undefined4 *)(puVar21 + 0x18a8) = DAT_0052be34;
  *(undefined4 *)(puVar21 + 0x18a4) = uVar43;
  uVar43 = DAT_0052be28;
  *(undefined4 *)(puVar21 + 0x18a0) = DAT_0052be2c;
  *(undefined4 *)(puVar21 + 0x189c) = uVar43;
  *(undefined4 *)(puVar21 + 0x1898) = uVar46;
  *(undefined4 *)(puVar21 + 0x1894) = uVar23;
  *(undefined4 *)(puVar21 + 0x18c0) = DAT_0052be4c;
  *(undefined4 *)(puVar21 + 0x18bc) = DAT_0052be48;
  uVar23 = DAT_0052be40;
  *(undefined4 *)(puVar21 + 0x18b8) = DAT_0052be44;
  *(undefined4 *)(puVar21 + 0x18b4) = uVar23;
  uVar23 = DAT_0052be38;
  *(undefined4 *)(puVar21 + 0x18b0) = DAT_0052be3c;
  *(undefined4 *)(puVar21 + 0x18ac) = uVar23;
  uVar43 = DAT_0052be58;
  uVar46 = DAT_0052be54;
  uVar23 = DAT_0052be50;
  *(undefined4 *)(puVar21 + 0x18d0) = DAT_0052be5c;
  *(undefined4 *)(puVar21 + 0x18cc) = uVar43;
  *(undefined4 *)(puVar21 + 0x18c8) = uVar46;
  *(undefined4 *)(puVar21 + 0x18c4) = uVar23;
  *(int *)(puVar21 + 0x18d8) = *(int *)(puVar21 + 0x18d8) + 1;
  FUN_002eec0c(puVar21,1);
  lVar48 = (ulonglong)extraout_s7 << 0x20;
  lVar44 = (ulonglong)extraout_s5 << 0x20;
  lVar42 = (ulonglong)extraout_s3 << 0x20;
  lVar41 = (ulonglong)extraout_s1 << 0x20;
  param_1[7] = 0.0;
  puVar21 = PTR_DAT_004d9048;
  if (0 < (int)param_1[9]) {
    uVar54 = CONCAT44(param_2,param_2);
    uVar52 = CONCAT44((int)((ulonglong)unaff_d10 >> 0x20),DAT_00034f7c);
    uVar53 = CONCAT44((int)((ulonglong)unaff_d11 >> 0x20),DAT_00034f80);
    iVar31 = 0;
    iVar33 = 0;
    iVar39 = 0;
    uVar56 = extraout_d4;
    uVar50 = extraout_d5;
    uVar55 = extraout_d6;
    do {
      pfVar22 = (float *)(iVar31 * 0xb8 + (int)param_1[10]);
      iVar29 = iVar33;
      iVar27 = iVar39;
      if (((float)(uint)*(ushort *)(pfVar22 + 1) != 0.0) && (pfVar22[0x2d] == param_4)) {
        fVar34 = 0.0;
        fVar26 = (float)(uint)*(ushort *)(pfVar22 + 1);
        do {
          pfVar40 = (float *)((int)fVar26 * 0xa4 + (int)param_1[5]);
          local_104 = *pfVar40;
          pfVar1 = pfVar40 + 1;
          local_100 = *pfVar1;
          pfVar2 = pfVar40 + 2;
          local_fc = *pfVar2;
          pfVar3 = pfVar40 + 3;
          local_f8 = *pfVar3;
          pfVar4 = pfVar40 + 4;
          local_f4 = *pfVar4;
          pfVar5 = pfVar40 + 5;
          local_f0 = *pfVar5;
          local_ec = pfVar40[6];
          local_e8 = pfVar40[7];
          local_e4 = pfVar40[8];
          local_e0 = pfVar40[9];
          local_dc = pfVar40[10];
          fStack_d8 = pfVar40[0xb];
          fStack_d0 = pfVar40[0xd];
          local_d4 = pfVar40[0xc];
          local_cc = pfVar40[0xe];
          uVar50 = CONCAT44((int)((ulonglong)uVar50 >> 0x20),local_cc);
          uVar46 = (undefined4)((ulonglong)uVar55 >> 0x20);
          local_c8 = pfVar40[0xf];
          uVar55 = CONCAT44(uVar46,local_c8);
          pfVar6 = pfVar40 + 0x10;
          local_c4 = *pfVar6;
          pfVar7 = pfVar40 + 0x11;
          local_c0 = *(ushort *)pfVar7;
          local_bc = pfVar40[0x12];
          lVar41 = CONCAT44((int)((ulonglong)lVar41 >> 0x20),local_bc);
          local_b8 = pfVar40[0x13];
          lVar44 = CONCAT44((int)((ulonglong)lVar44 >> 0x20),local_b8);
          pfVar8 = pfVar40 + 0x14;
          local_b4 = *(ushort *)pfVar8;
          local_b0 = pfVar40[0x15];
          local_ac = pfVar40[0x16];
          pfVar9 = pfVar40 + 0x17;
          local_a8 = *(ushort *)pfVar9;
          local_a4 = pfVar40[0x18];
          local_a0 = pfVar40[0x19];
          local_9c = pfVar40[0x1a];
          local_98 = pfVar40[0x1b];
          uVar23 = (undefined4)((ulonglong)lVar42 >> 0x20);
          local_94 = pfVar40[0x1c];
          lVar42 = CONCAT44(uVar23,local_94);
          local_90 = pfVar40[0x1d];
          lVar48 = CONCAT44((int)((ulonglong)lVar48 >> 0x20),local_90);
          local_8c = pfVar40[0x1e];
          uVar56 = CONCAT44((int)((ulonglong)uVar56 >> 0x20),local_8c);
          local_88 = *(ushort *)(pfVar40 + 0x1f);
          local_86 = *(short *)((int)pfVar40 + 0x7e);
          local_84 = *(short *)(pfVar40 + 0x20);
          pfVar10 = pfVar40 + 0x21;
          local_80 = *pfVar10;
          pfVar11 = pfVar40 + 0x22;
          local_7c = *pfVar11;
          pfVar12 = pfVar40 + 0x23;
          local_78 = *pfVar12;
          pfVar13 = pfVar40 + 0x24;
          local_74 = *pfVar13;
          pfVar14 = pfVar40 + 0x25;
          local_70 = *pfVar14;
          pfVar15 = pfVar40 + 0x26;
          local_6c = *pfVar15;
          local_68 = *(undefined1 *)(pfVar40 + 0x27);
          local_67 = *(char *)((int)pfVar40 + 0x9d);
          local_64 = pfVar40[0x28];
          if (local_cc <= local_c8) {
            if (((uint)fVar34 & 0xffff) == 0) {
              *(short *)(iVar31 * 0xb8 + (int)param_1[10] + 4) = SUB42(*pfVar6,0);
            }
            else {
              *(float *)(((uint)fVar34 & 0xffff) * 0xa4 + (int)param_1[5] + 0x40) = *pfVar6;
            }
            *pfVar6 = (float)(uint)*(ushort *)(param_1 + 6);
            *(short *)(param_1 + 6) = SUB42(fVar26,0);
            fVar24 = (float)((uint)local_c4 & 0xffff);
          }
          else {
            uVar36 = (uint)local_e0 >> 0x18;
            uVar50 = FloatVectorSub(CONCAT44(uVar46,*pfVar22),uVar50,2,0x20);
            uVar46 = (undefined4)((ulonglong)unaff_d13 >> 0x20);
            fVar34 = (float)uVar50 / *pfVar22;
            uVar57 = CONCAT44(uVar46,fVar34);
            sVar20 = SUB42(fStack_d8,0);
            sVar17 = (short)((uint)fStack_d8 >> 0x10);
            sVar18 = (short)((uint)local_dc >> 0x10);
            sVar19 = SUB42(local_dc,0);
            if ((int)((uint)(fVar34 < 0.5) << 0x1f) < 0) {
              uVar59 = FixedToFP(CONCAT44((int)sVar18,(int)sVar18),0,0,0,0x20);
              uVar61 = FixedToFP(CONCAT44((int)sVar19,(int)sVar19),0,0,0,0x20);
              uVar63 = FixedToFP(CONCAT44((int)sVar20,(int)sVar20),0,0,0,0x20);
              uVar65 = FixedToFP(CONCAT44((int)sVar17,(int)sVar17),0,0,0,0x20);
              uVar66 = FixedToFP(CONCAT44((int)local_86,(int)local_86),0,0,0,0x20);
              uVar55 = FloatVectorAdd(uVar57,uVar57,2);
              uVar58 = FixedToFP(CONCAT44((uint)local_e0 >> 8,(uint)local_e0 >> 8) & 0xff000000ff,0,
                                 0,0,0x20);
              uVar60 = FloatVectorMult(uVar55,uVar59,2,0x20);
              uVar62 = FloatVectorMult(uVar55,uVar61,2,0x20);
              uVar64 = FloatVectorMult(uVar55,uVar63,2,0x20);
              uVar65 = FloatVectorMult(uVar55,uVar65,2,0x20);
              uVar55 = FloatVectorMult(uVar55,uVar66,2,0x20);
              uVar66 = FixedToFP((ulonglong)CONCAT24(local_88,(uint)local_88),0,1,0,0x20);
              uVar59 = FixedToFP(CONCAT44((uint)local_e0 >> 0x10,(uint)local_e0 >> 0x10) &
                                 0xff000000ff,0,0,0,0x20);
              uVar63 = FixedToFP(CONCAT44(local_e0,local_e0) & 0xff000000ff,0,0,0,0x20);
              uVar61 = FloatVectorAdd(uVar58,uVar60,2);
              uVar55 = FloatVectorAdd(uVar66,uVar55,2);
              uVar58 = FixedToFP(CONCAT44(uVar36,uVar36),0,0,0,0x20);
              uVar60 = FloatVectorAdd(uVar59,uVar64,2);
              uVar59 = FloatVectorAdd(uVar63,uVar62,2);
              uVar58 = FloatVectorAdd(uVar58,uVar65,2);
            }
            else {
              uVar55 = FloatVectorAdd(uVar57,0xbf000000bf000000,2);
              iVar37 = (int)(short)((uint)fStack_d0 >> 0x10);
              iVar27 = (int)(short)((uint)local_d4 >> 0x10);
              uVar59 = FixedToFP(CONCAT44((int)SUB42(local_d4,0),(int)SUB42(local_d4,0)),0,0,0,0x20)
              ;
              iVar29 = (int)sVar19 + ((uint)local_e0 & 0xff);
              uVar55 = FloatVectorAdd(uVar55,uVar55,2);
              uVar58 = FixedToFP(CONCAT44((int)SUB42(fStack_d0,0),(int)SUB42(fStack_d0,0)),0,0,0,
                                 0x20);
              uVar63 = FixedToFP(CONCAT44(iVar37,iVar37),0,0,0,0x20);
              uVar60 = FixedToFP(CONCAT44(iVar27,iVar27),0,0,0,0x20);
              uVar65 = FixedToFP(CONCAT44((int)local_84,(int)local_84),0,0,0,0x20);
              uVar62 = FixedToFP(CONCAT44((int)local_86,(int)local_86),0,0,0,0x20);
              uVar59 = FloatVectorMult(uVar55,uVar59,2,0x20);
              iVar27 = (int)sVar18 + ((uint)local_e0 >> 8 & 0xff);
              uVar64 = FixedToFP((ulonglong)CONCAT24(local_88,(uint)local_88),0,1,0,0x20);
              uVar61 = FloatVectorMult(uVar55,uVar60,2,0x20);
              uVar60 = FloatVectorMult(uVar55,uVar58,2,0x20);
              uVar63 = FloatVectorMult(uVar55,uVar63,2,0x20);
              uVar55 = FloatVectorMult(uVar55,uVar65,2,0x20);
              iVar37 = (int)sVar20 + ((uint)local_e0 >> 0x10 & 0xff);
              uVar58 = FloatVectorAdd(uVar64,uVar62,2);
              uVar64 = FixedToFP(CONCAT44(iVar27,iVar27),0,0,0,0x20);
              uVar62 = FixedToFP(CONCAT44(iVar29,iVar29),0,0,0,0x20);
              uVar55 = FloatVectorAdd(uVar58,uVar55,2);
              uVar65 = FixedToFP(CONCAT44(iVar37,iVar37),0,0,0,0x20);
              uVar58 = FixedToFP(CONCAT44((int)sVar17 + uVar36,(int)sVar17 + uVar36),0,0,0,0x20);
              uVar59 = FloatVectorAdd(uVar62,uVar59,2);
              uVar60 = FloatVectorAdd(uVar65,uVar60,2);
              uVar58 = FloatVectorAdd(uVar58,uVar63,2);
              uVar61 = FloatVectorAdd(uVar64,uVar61,2);
            }
            uVar60 = FPToFixed(uVar60,0,0,3,0x20);
            uVar59 = FPToFixed(uVar59,0,0,3,0x20);
            uVar63 = FPToFixed(uVar58,0,0,3,0x20);
            uVar58 = FPToFixed(uVar61,0,0,3,0x20);
            uVar61 = FloatVectorMult(uVar55,CONCAT44((int)((ulonglong)uVar59 >> 0x20),
                                                     *(undefined4 *)
                                                      (iVar31 * 0xb8 + (int)param_1[10] + 0xb0)),2,
                                     0x20);
            if (param_3 == 1) {
              cVar16 = '\0';
              if (local_64 != 0.0) {
                cVar16 = *(char *)((int)local_64 + 0x4c);
              }
              if (local_64 != 0.0 && cVar16 != '\0') goto LAB_000350bc;
            }
            else {
LAB_000350bc:
              uVar36 = 0;
              uVar56 = FloatVectorMult(uVar56,0x3f0000003f000000,2,0x20);
              uVar62 = FloatVectorMult(uVar50,uVar56,2,0x20);
              uVar56 = FloatVectorSub(lVar44,lVar41,2,0x20);
              uVar62 = FloatVectorAdd(lVar48,uVar62,2);
              uVar56 = FloatVectorMult(uVar57,uVar56,2,0x20);
              uVar62 = FloatVectorMult(uVar50,uVar62,2,0x20);
              uVar50 = FloatVectorAdd(lVar41,uVar56,2);
              uVar56 = FloatVectorAdd(lVar42,uVar62,2);
              if ((float)uVar56 != 0.0) {
                uVar56 = FloatVectorMult(uVar56,CONCAT44(uVar23,DAT_00034f84),2,0x20);
                uVar56 = FPToFixed(uVar56,0,0,3,0x20);
                uVar23 = FUN_003010b8((int)uVar56);
                lVar48 = (ulonglong)extraout_s7_00 << 0x20;
                lVar44 = (ulonglong)extraout_s5_00 << 0x20;
                lVar42 = CONCAT44(extraout_s3_00,local_98);
                uVar56 = FloatVectorSub(lVar42,CONCAT44(extraout_s1_00,local_9c),2,0x20);
                uVar56 = FloatVectorMult(uVar57,uVar56,2,0x20);
                uVar56 = FloatVectorAdd(CONCAT44(extraout_s1_00,local_9c),uVar56,2);
                uVar56 = FloatVectorMult(CONCAT44(uVar23,uVar23),uVar56,2,0x20);
                uVar56 = FloatVectorMult(uVar56,uVar52,2,0x20);
                uVar56 = FPToFixed(uVar56,0,0,3,0x20);
                uVar36 = (uint)uVar56;
              }
              uVar23 = (undefined4)((ulonglong)lVar42 >> 0x20);
              if (((float)uVar50 != 0.0) || ((uVar36 & 0xffff) != 0)) {
                uVar56 = FloatVectorMult(uVar50,uVar53,2,0x20);
                uVar56 = FloatVectorMult(uVar56,uVar54,2,0x20);
                uVar56 = FloatVectorMult(uVar56,uVar52,2,0x20);
                uVar56 = FPToFixed(uVar56,0,0,3,0x20);
                uVar28 = (int)uVar56 + (uint)*(ushort *)pfVar7;
                *(ushort *)pfVar7 = (ushort)uVar28;
                if ((uVar28 & 0xffff) == 0) {
                  *pfVar14 = -1.0;
                  *pfVar15 = 1.0;
                  *pfVar10 = 1.0;
                  *pfVar11 = 0.0;
                  *pfVar12 = 0.0;
                  *pfVar13 = 1.0;
                }
                else {
                  uVar28 = uVar28 + (uVar36 & 0xffff);
                  uVar38 = (uVar28 & 0xffff) + 0xdff2;
                  uVar30 = uVar28 + 0x4000 & 0xffff;
                  uVar36 = uVar38 >> 4;
                  fVar34 = (float)FUN_003010b8(uVar30);
                  fVar24 = (float)FUN_003010d0(uVar30);
                  *pfVar10 = fVar34;
                  *pfVar11 = fVar24;
                  fVar34 = (float)FUN_003010b8(uVar28 & 0xffff);
                  fVar24 = (float)FUN_003010d0(uVar28 & 0xffff);
                  *pfVar12 = fVar34;
                  *pfVar13 = fVar24;
                  iVar29 = uVar38 + ((uVar36 / 0xfff) * 0x1000 - uVar36 / 0xfff) * -0x10;
                  uVar23 = FUN_003010b8(iVar29);
                  uVar50 = CONCAT44((int)((ulonglong)uVar50 >> 0x20),DAT_00034f88);
                  uVar56 = FloatVectorMult(CONCAT44(uVar23,uVar23),uVar50,2,0x20);
                  *pfVar14 = (float)uVar56;
                  uVar23 = FUN_003010d0((float)uVar56,iVar29);
                  lVar48 = (ulonglong)extraout_s7_01 << 0x20;
                  lVar44 = (ulonglong)extraout_s5_01 << 0x20;
                  uVar56 = FloatVectorMult(CONCAT44(uVar23,uVar23),uVar50,2,0x20);
                  *pfVar15 = (float)uVar56;
                  uVar23 = extraout_s3_01;
                }
              }
              uVar56 = CONCAT44((int)((ulonglong)uVar56 >> 0x20),local_b0);
              lVar41 = CONCAT44(uVar23,local_ac);
              uVar50 = FloatVectorSub(lVar41,uVar56,2,0x20);
              uVar36 = (uint)*(ushort *)pfVar8;
              uVar50 = FloatVectorMult(uVar57,uVar50,2,0x20);
              uVar56 = FloatVectorAdd(uVar56,uVar50,2);
              if ((float)uVar56 != 0.0) {
                uVar50 = FloatVectorMult(uVar56,uVar52,2,0x20);
                uVar56 = FixedToFP((ulonglong)CONCAT24(*(ushort *)pfVar8,uVar36),0,0,0,0x20);
                uVar50 = FloatVectorMult(uVar50,uVar53,2,0x20);
                uVar50 = FloatVectorMult(uVar50,uVar54,2,0x20);
                uVar56 = FloatVectorAdd(uVar50,uVar56,2);
                uVar56 = FPToFixed(uVar56,0,0,3,0x20);
                uVar36 = (uint)uVar56;
                *(ushort *)pfVar8 = (ushort)uVar56;
              }
              uVar23 = (undefined4)((ulonglong)uVar56 >> 0x20);
              if (uVar36 != 0) {
                uVar23 = FUN_003010d0();
                lVar48 = (ulonglong)extraout_s7_02 << 0x20;
                lVar44 = (ulonglong)extraout_s5_02 << 0x20;
                lVar41 = (ulonglong)extraout_s3_02 << 0x20;
                uVar61 = FloatVectorMult(uVar61,CONCAT44(uVar23,uVar23),2,0x20);
                uVar23 = extraout_s1_01;
              }
              lVar42 = CONCAT44((int)((ulonglong)lVar41 >> 0x20),local_a0);
              uVar56 = FloatVectorSub(lVar42,CONCAT44(uVar23,local_a4),2,0x20);
              uVar36 = (uint)*(ushort *)pfVar9;
              uVar56 = FloatVectorMult(uVar57,uVar56,2,0x20);
              lVar41 = FloatVectorAdd(CONCAT44(uVar23,local_a4),uVar56,2);
              if ((float)lVar41 != 0.0) {
                uVar50 = FloatVectorMult(lVar41,uVar52,2,0x20);
                uVar56 = FixedToFP((ulonglong)CONCAT24(*(ushort *)pfVar9,uVar36),0,0,0,0x20);
                uVar50 = FloatVectorMult(uVar50,uVar53,2,0x20);
                uVar50 = FloatVectorMult(uVar50,uVar54,2,0x20);
                uVar56 = FloatVectorAdd(uVar50,uVar56,2);
                lVar41 = FPToFixed(uVar56,0,0,3,0x20);
                uVar36 = (uint)lVar41;
                *(ushort *)pfVar9 = (ushort)lVar41;
              }
              if (uVar36 != 0) {
                uVar23 = FUN_003010d0();
                lVar48 = (ulonglong)extraout_s7_03 << 0x20;
                lVar44 = (ulonglong)extraout_s5_03 << 0x20;
                lVar42 = (ulonglong)extraout_s3_03 << 0x20;
                lVar41 = (ulonglong)extraout_s1_02 << 0x20;
                uVar55 = FloatVectorMult(uVar55,CONCAT44(uVar23,uVar23),2,0x20);
              }
            }
            uVar51 = 0;
            local_105 = (undefined1)uVar63;
            uVar49 = 0;
            local_106 = (undefined1)uVar60;
            local_107 = (undefined1)uVar58;
            local_108 = (undefined1)uVar59;
            fVar24 = param_1[10];
            iVar29 = iVar31 * 0xb8 + (int)fVar24;
            uVar45 = (undefined4)((ulonglong)lVar44 >> 0x20);
            uVar53 = FloatVectorMult(uVar55,CONCAT44(uVar45,*pfVar13),2,0x20);
            uVar23 = (undefined4)((ulonglong)lVar41 >> 0x20);
            uVar43 = (undefined4)((ulonglong)lVar42 >> 0x20);
            uVar56 = FloatVectorMult(uVar55,CONCAT44(uVar23,*pfVar12),2,0x20);
            fVar32 = (float)(uint)*(byte *)(iVar29 + 0x39);
            uVar50 = FloatVectorMult(uVar61,CONCAT44((int)((ulonglong)lVar48 >> 0x20),*pfVar10),2,
                                     0x20);
            uVar47 = 0;
            uVar52 = FloatVectorMult(uVar61,CONCAT44(uVar43,*pfVar11),2,0x20);
            fVar34 = fVar32;
            if (fVar32 == 1.4013e-45) {
              fVar34 = local_64;
            }
            if (fVar32 == 1.4013e-45) {
              uVar47 = (ulonglong)*(uint *)((int)fVar34 + 8);
              uVar49 = (ulonglong)*(uint *)((int)fVar34 + 0xc);
              uVar51 = (ulonglong)*(uint *)((int)fVar34 + 0x10);
            }
            fVar34 = *(float *)(iVar29 + 100);
            uVar59 = FloatVectorAdd(CONCAT44(uVar45,local_fc),uVar51,2);
            uVar58 = FloatVectorAdd(CONCAT44(uVar43,local_100),uVar49,2);
            uVar55 = FloatVectorAdd(CONCAT44(uVar23,local_104),uVar47,2);
            if (0.0 < fVar34) {
              uVar23 = FUN_00025164();
              uVar55 = FloatVectorAdd(uVar55,CONCAT44(uVar23,uVar23),2);
              uVar55 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar55 >> 0x20),
                                               (float)uVar55 / fVar34),0x3f0000003f000000,2);
              uVar55 = FPToFixed(uVar55,0,0,3,0x20);
              uVar55 = FixedToFP(uVar55,0,0,0,0x20);
              uVar23 = FUN_00025164();
              uVar55 = FloatVectorMult(CONCAT44(uVar46,fVar34),uVar55,2,0x20);
              fVar24 = param_1[10];
              uVar55 = FloatVectorSub(uVar55,CONCAT44(uVar23,uVar23),2,0x20);
            }
            fVar34 = *(float *)(iVar31 * 0xb8 + (int)fVar24 + 0x68);
            unaff_d13 = CONCAT44(uVar46,fVar34);
            if (0.0 < fVar34) {
              uVar23 = FUN_000251a8();
              uVar58 = FloatVectorAdd(uVar58,CONCAT44(uVar23,uVar23),2);
              uVar58 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar58 >> 0x20),
                                               (float)uVar58 / fVar34),0x3f0000003f000000,2);
              uVar58 = FPToFixed(uVar58,0,0,3,0x20);
              uVar58 = FixedToFP(uVar58,0,0,0,0x20);
              uVar23 = FUN_000251a8();
              uVar58 = FloatVectorMult(unaff_d13,uVar58,2,0x20);
              uVar58 = FloatVectorSub(uVar58,CONCAT44(uVar23,uVar23),2,0x20);
            }
            uVar60 = FloatVectorSub(uVar50,uVar56,2,0x20);
            uVar62 = FloatVectorSub(uVar52,uVar53,2,0x20);
            uVar61 = FloatVectorAdd(uVar60,uVar55,2);
            uVar63 = FloatVectorAdd(uVar50,uVar56,2);
            uVar60 = FloatVectorAdd(uVar62,uVar58,2);
            uVar64 = FloatVectorNeg(uVar52,2,2);
            uVar63 = FloatVectorAdd(uVar63,uVar55,2);
            uVar62 = FloatVectorAdd(uVar52,uVar53,2);
            uVar64 = FloatVectorSub(uVar64,uVar53,2,0x20);
            (&DAT_00558550)[iVar39 * 0xc] = (int)uVar63;
            uVar63 = FloatVectorAdd(uVar62,uVar58,2);
            uVar62 = FloatVectorSub(uVar56,uVar50,2,0x20);
            (&DAT_00558554)[iVar39 * 0xc] = (int)uVar63;
            uVar63 = FloatVectorAdd(uVar62,uVar55,2);
            uVar62 = FloatVectorSub(uVar53,uVar52,2,0x20);
            (&DAT_00558578)[iVar39 * 0xc] = 0x3f800000;
            (&DAT_0055857c)[iVar39 * 0xc] = 0;
            (&DAT_00558580)[iVar39 * 0xc] = (int)uVar63;
            uVar63 = FloatVectorAdd(uVar62,uVar58,2);
            uVar50 = FloatVectorNeg(uVar50,2,2);
            uVar56 = FloatVectorSub(uVar50,uVar56,2,0x20);
            (&DAT_00558584)[iVar39 * 0xc] = (int)uVar63;
            (&DAT_005585a8)[iVar39 * 0xc] = 0;
            (&DAT_005585ac)[iVar39 * 0xc] = 0;
            (&DAT_005585b0)[iVar39 * 0xc] = (int)uVar61;
            (&DAT_005585b4)[iVar39 * 0xc] = (int)uVar60;
            lVar41 = FloatVectorAdd(uVar64,uVar58,2);
            (&DAT_005585d8)[iVar39 * 0xc] = 0x3f800000;
            uVar56 = FloatVectorAdd(uVar56,uVar55,2);
            (&DAT_005585dc)[iVar39 * 0xc] = 0x3f800000;
            (&DAT_005585f4)[iVar39 * 0xc] = (&DAT_005585c4)[iVar39 * 0xc];
            (&DAT_005585f0)[iVar39 * 0xc] = (&DAT_005585c0)[iVar39 * 0xc];
            (&DAT_005585ec)[iVar39 * 0xc] = (&DAT_005585bc)[iVar39 * 0xc];
            (&DAT_005585e8)[iVar39 * 0xc] = (&DAT_005585b8)[iVar39 * 0xc];
            (&DAT_005585e4)[iVar39 * 0xc] = (&DAT_005585b4)[iVar39 * 0xc];
            (&DAT_005585e0)[iVar39 * 0xc] = (&DAT_005585b0)[iVar39 * 0xc];
            (&DAT_0055860c)[iVar39 * 0xc] = (&DAT_005585dc)[iVar39 * 0xc];
            (&DAT_00558608)[iVar39 * 0xc] = (&DAT_005585d8)[iVar39 * 0xc];
            (&DAT_00558604)[iVar39 * 0xc] = (&DAT_005585d4)[iVar39 * 0xc];
            (&DAT_00558600)[iVar39 * 0xc] = (&DAT_005585d0)[iVar39 * 0xc];
            (&DAT_005585fc)[iVar39 * 0xc] = (&DAT_005585cc)[iVar39 * 0xc];
            (&DAT_005585f8)[iVar39 * 0xc] = (&DAT_005585c8)[iVar39 * 0xc];
            (&DAT_00558624)[iVar39 * 0xc] = (&DAT_00558594)[iVar39 * 0xc];
            (&DAT_00558620)[iVar39 * 0xc] = (&DAT_00558590)[iVar39 * 0xc];
            (&DAT_0055861c)[iVar39 * 0xc] = (&DAT_0055858c)[iVar39 * 0xc];
            (&DAT_00558618)[iVar39 * 0xc] = (&DAT_00558588)[iVar39 * 0xc];
            (&DAT_00558614)[iVar39 * 0xc] = (&DAT_00558584)[iVar39 * 0xc];
            (&DAT_00558610)[iVar39 * 0xc] = (&DAT_00558580)[iVar39 * 0xc];
            (&DAT_0055863c)[iVar39 * 0xc] = (&DAT_005585ac)[iVar39 * 0xc];
            (&DAT_00558638)[iVar39 * 0xc] = (&DAT_005585a8)[iVar39 * 0xc];
            (&DAT_00558634)[iVar39 * 0xc] = (&DAT_005585a4)[iVar39 * 0xc];
            iVar29 = iVar39 + 6;
            (&DAT_00558630)[iVar39 * 0xc] = (&DAT_005585a0)[iVar39 * 0xc];
            (&DAT_0055862c)[iVar39 * 0xc] = (&DAT_0055859c)[iVar39 * 0xc];
            (&DAT_00558628)[iVar39 * 0xc] = (&DAT_00558598)[iVar39 * 0xc];
            (&DAT_00558640)[iVar39 * 0xc] = (int)uVar56;
            (&DAT_00558644)[iVar39 * 0xc] = (int)lVar41;
            (&DAT_00558668)[iVar39 * 0xc] = 0;
            (&DAT_0055866c)[iVar39 * 0xc] = 0x3f800000;
            puVar35 = &DAT_00558574 + iVar39 * 0xc;
            do {
              puVar35[-7] = (int)uVar59;
              uVar36 = FUN_0031048c((int)lVar41,&local_108);
              iVar39 = iVar39 + 1;
              uVar30 = (uVar36 & 0xffff) >> 8;
              uVar28 = (uVar36 & 0xffffff) >> 0x10;
              lVar41 = FixedToFP(CONCAT44(uVar36 >> 0x18,uVar36 >> 0x18),0,1,0,0x20);
              lVar42 = FixedToFP(CONCAT44(uVar36,uVar36) & 0xff000000ff,0,1,0,0x20);
              lVar48 = FixedToFP(CONCAT44(uVar28,uVar28),0,1,0,0x20);
              lVar44 = FixedToFP(CONCAT44(uVar30,uVar30),0,1,0,0x20);
              puVar35[-3] = (int)lVar48;
              puVar35[-2] = (int)lVar44;
              puVar35[-1] = (int)lVar42;
              *puVar35 = (int)lVar41;
              fVar34 = DAT_000359c8;
              puVar35 = puVar35 + 0xc;
            } while (iVar39 < iVar29);
            uVar55 = extraout_d6_00;
            if (param_3 == 1) {
              uVar56 = extraout_d4_00;
              uVar50 = extraout_d5_00;
              if ((local_64 != 0.0) && (*(char *)((int)local_64 + 0x4c) != '\0')) {
                uVar56 = CONCAT44((int)((ulonglong)lVar41 >> 0x20),
                                  *(undefined4 *)((int)local_64 + 0x2c));
                goto LAB_000355ee;
              }
            }
            else {
              uVar56 = 0x3f8000003f800000;
              if (local_64 != 0.0) {
                uVar56 = CONCAT44(0x3f800000,*(undefined4 *)((int)local_64 + 0x2c));
              }
LAB_000355ee:
              uVar23 = (undefined4)((ulonglong)lVar42 >> 0x20);
              uVar58 = FloatVectorMult(uVar56,uVar54,2,0x20);
              uVar56 = FloatVectorSub(CONCAT44(uVar23,local_cc),uVar58,2,0x20);
              uVar50 = CONCAT44(uVar23,DAT_000359c8);
              pfVar40[0xe] = (float)uVar56;
              if ((float)uVar58 <= fVar34) {
                fVar34 = param_1[10];
                uVar59 = extraout_d4_00;
              }
              else {
                fVar34 = param_1[10];
                iVar39 = iVar31 * 0xb8 + (int)fVar34;
                uVar46 = (undefined4)((ulonglong)lVar44 >> 0x20);
                uVar58 = FloatVectorMult(uVar58,0x3f0000003f000000,2,0x20);
                uVar56 = CONCAT44((int)((ulonglong)uVar56 >> 0x20),*(undefined4 *)(iVar39 + 8));
                uVar43 = (undefined4)((ulonglong)lVar48 >> 0x20);
                uVar59 = FloatVectorMult(uVar58,CONCAT44(uVar46,local_ec),2,0x20);
                uVar50 = FloatVectorSub(CONCAT44(uVar43,*(undefined4 *)(iVar39 + 0x14)),uVar56,2,
                                        0x20);
                uVar60 = FloatVectorMult(uVar57,uVar50,2,0x20);
                uVar50 = FloatVectorAdd(CONCAT44(uVar23,local_f8),uVar59,2);
                uVar56 = FloatVectorAdd(uVar56,uVar60,2);
                uVar56 = FloatVectorMult(uVar50,uVar56,2,0x20);
                *pfVar3 = (float)uVar56;
                uVar50 = CONCAT44(uVar23,*(undefined4 *)(iVar39 + 0xc));
                uVar23 = (undefined4)((ulonglong)extraout_d4_00 >> 0x20);
                uVar60 = FloatVectorSub(CONCAT44(uVar43,*(undefined4 *)(iVar39 + 0x18)),uVar50,2,
                                        0x20);
                uVar59 = FloatVectorMult(uVar58,CONCAT44(uVar23,local_e8),2,0x20);
                uVar60 = FloatVectorMult(uVar57,uVar60,2,0x20);
                uVar59 = FloatVectorAdd(CONCAT44(uVar46,local_f4),uVar59,2);
                uVar50 = FloatVectorAdd(uVar50,uVar60,2);
                uVar50 = FloatVectorMult(uVar59,uVar50,2,0x20);
                *pfVar4 = (float)uVar50;
                uVar60 = CONCAT44(uVar46,*(undefined4 *)(iVar39 + 0x10));
                uVar59 = CONCAT44(uVar23,local_e4);
                uVar61 = FloatVectorSub(CONCAT44(uVar43,*(undefined4 *)(iVar39 + 0x1c)),uVar60,2,
                                        0x20);
                lVar48 = CONCAT44(uVar43,local_f0);
                uVar62 = FloatVectorMult(uVar58,uVar59,2,0x20);
                uVar63 = FloatVectorMult(uVar57,uVar61,2,0x20);
                uVar61 = FloatVectorAdd(lVar48,uVar62,2);
                uVar60 = FloatVectorAdd(uVar60,uVar63,2);
                lVar44 = FloatVectorMult(uVar61,uVar60,2,0x20);
                uVar60 = FloatVectorMult(uVar58,uVar56,2,0x20);
                *pfVar5 = (float)lVar44;
                uVar56 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar56 >> 0x20),local_104),uVar60,
                                        2);
                uVar60 = FloatVectorMult(uVar58,uVar50,2,0x20);
                *pfVar40 = (float)uVar56;
                uVar56 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar56 >> 0x20),local_100),uVar60,
                                        2);
                uVar60 = FloatVectorMult(uVar58,lVar44,2,0x20);
                *pfVar1 = (float)uVar56;
                uVar56 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar56 >> 0x20),local_fc),uVar60,2
                                       );
                *pfVar2 = (float)uVar56;
              }
              iVar39 = iVar31 * 0xb8 + (int)fVar34;
              uVar46 = (undefined4)((ulonglong)lVar44 >> 0x20);
              uVar23 = (undefined4)((ulonglong)uVar50 >> 0x20);
              uVar50 = FloatVectorMult(uVar58,CONCAT44(uVar46,local_ec),2,0x20);
              uVar56 = CONCAT44((int)((ulonglong)uVar56 >> 0x20),*(undefined4 *)(iVar39 + 8));
              uVar50 = FloatVectorAdd(CONCAT44(uVar23,local_f8),uVar50,2);
              uVar43 = (undefined4)((ulonglong)lVar48 >> 0x20);
              uVar60 = FloatVectorSub(CONCAT44(uVar43,*(undefined4 *)(iVar39 + 0x14)),uVar56,2,0x20)
              ;
              uVar60 = FloatVectorMult(uVar57,uVar60,2,0x20);
              uVar56 = FloatVectorAdd(uVar56,uVar60,2);
              uVar60 = FloatVectorMult(uVar50,uVar56,2,0x20);
              *pfVar3 = (float)uVar60;
              uVar56 = CONCAT44(uVar23,*(undefined4 *)(iVar39 + 0xc));
              uVar23 = (undefined4)((ulonglong)uVar59 >> 0x20);
              uVar59 = FloatVectorSub(CONCAT44(uVar43,*(undefined4 *)(iVar39 + 0x18)),uVar56,2,0x20)
              ;
              uVar50 = FloatVectorMult(uVar58,CONCAT44(uVar23,local_e8),2,0x20);
              uVar59 = FloatVectorMult(uVar57,uVar59,2,0x20);
              uVar50 = FloatVectorAdd(CONCAT44(uVar46,local_f4),uVar50,2);
              uVar56 = FloatVectorAdd(uVar56,uVar59,2);
              uVar59 = FloatVectorMult(uVar50,uVar56,2,0x20);
              *pfVar4 = (float)uVar59;
              uVar61 = CONCAT44(uVar46,*(undefined4 *)(iVar39 + 0x10));
              uVar56 = CONCAT44(uVar23,*(undefined4 *)(iVar39 + 0x1c));
              uVar46 = (undefined4)((ulonglong)extraout_d5_00 >> 0x20);
              uVar50 = CONCAT44(uVar46,local_e4);
              uVar62 = FloatVectorSub(uVar56,uVar61,2,0x20);
              uVar63 = FloatVectorMult(uVar58,uVar50,2,0x20);
              uVar62 = FloatVectorMult(uVar57,uVar62,2,0x20);
              uVar57 = FloatVectorAdd(CONCAT44(uVar43,local_f0),uVar63,2);
              uVar61 = FloatVectorAdd(uVar61,uVar62,2);
              uVar57 = FloatVectorMult(uVar57,uVar61,2,0x20);
              *pfVar5 = (float)uVar57;
              lVar41 = CONCAT44(uVar43,*param_1);
              if ((0.0 < *param_1) && (*(char *)(iVar39 + 0x39) != '\x01')) {
                lVar41 = CONCAT44(uVar43,local_104);
                uVar56 = CONCAT44(uVar23,param_1[2]);
                if (local_104 == param_1[2]) {
                  uVar50 = CONCAT44(uVar46,local_100);
                  uVar23 = (undefined4)((ulonglong)extraout_d6_00 >> 0x20);
                  uVar55 = CONCAT44(uVar23,param_1[3]);
                  if (local_100 == param_1[3]) {
                    uVar50 = CONCAT44(uVar46,local_fc);
                    uVar55 = CONCAT44(uVar23,param_1[4]);
                    if (local_fc == param_1[4]) goto LAB_00035896;
                  }
                }
                if (local_67 == '\0') {
                  uVar55 = FloatVectorSub(lVar41,uVar56,2,0x20);
                  uVar50 = FloatVectorSub(CONCAT44((int)((ulonglong)uVar59 >> 0x20),local_100),
                                          CONCAT44((int)((ulonglong)uVar50 >> 0x20),param_1[3]),2,
                                          0x20);
                  uVar56 = FloatVectorSub(CONCAT44((int)((ulonglong)uVar60 >> 0x20),local_fc),
                                          CONCAT44((int)((ulonglong)uVar57 >> 0x20),param_1[4]),2,
                                          0x20);
                  local_114 = (undefined4)uVar55;
                  local_110 = (undefined4)uVar50;
                  local_10c = (undefined4)uVar56;
                  fVar34 = (float)FUN_00009b50(local_10c,&local_114);
                  lVar41 = (ulonglong)extraout_s7_04 << 0x20;
                  uVar50 = extraout_d5_01;
                  uVar55 = extraout_d6_01;
                  if ((int)((uint)(fVar34 < *param_1) << 0x1f) < 0) {
                    uVar57 = FloatVectorSub(CONCAT44(extraout_s1_03,*param_1),
                                            CONCAT44(fVar34,fVar34),2,0x20);
                    uVar56 = CONCAT44((int)((ulonglong)extraout_d4_01 >> 0x20),local_114);
                    lVar41 = CONCAT44(extraout_s7_04,local_110);
                    uVar61 = FloatVectorMult(uVar57,uVar56,2,0x20);
                    uVar60 = FloatVectorMult(uVar57,lVar41,2,0x20);
                    uVar59 = FloatVectorMult(uVar57,CONCAT44(extraout_s5_04,local_10c),2,0x20);
                    uVar57 = CONCAT44(extraout_s5_04,param_1[1]);
                    uVar61 = FloatVectorMult(uVar58,uVar61,2,0x20);
                    uVar60 = FloatVectorMult(uVar58,uVar60,2,0x20);
                    uVar59 = FloatVectorMult(uVar58,uVar59,2,0x20);
                    uVar61 = FloatVectorMult(uVar61,0x4120000041200000,2,0x20);
                    uVar60 = FloatVectorMult(uVar60,0x4120000041200000,2,0x20);
                    uVar59 = FloatVectorMult(uVar59,0x4120000041200000,2,0x20);
                    uVar63 = FloatVectorMult(uVar61,uVar57,2,0x20);
                    uVar61 = FloatVectorMult(uVar57,uVar60,2,0x20);
                    uVar57 = FloatVectorMult(uVar57,uVar59,2,0x20);
                    uVar60 = FloatVectorAdd(uVar63,CONCAT44(extraout_s1_03,*pfVar3),2);
                    *pfVar3 = (float)uVar60;
                    uVar59 = FloatVectorAdd(uVar61,CONCAT44(fVar34,*pfVar4),2);
                    *pfVar4 = (float)uVar59;
                    uVar57 = FloatVectorAdd(uVar57,CONCAT44(extraout_s5_04,*pfVar5),2);
                    *pfVar5 = (float)uVar57;
                  }
                  else {
                    uVar57 = CONCAT44(extraout_s5_04,*pfVar5);
                    uVar59 = CONCAT44(fVar34,*pfVar4);
                    uVar60 = CONCAT44(extraout_s1_03,*pfVar3);
                    uVar56 = extraout_d4_01;
                  }
                }
              }
LAB_00035896:
              uVar60 = FloatVectorMult(uVar58,uVar60,2,0x20);
              lVar48 = CONCAT44((int)((ulonglong)lVar41 >> 0x20),local_104);
              lVar41 = FloatVectorAdd(lVar48,uVar60,2);
              uVar60 = FloatVectorMult(uVar58,uVar59,2,0x20);
              *pfVar40 = (float)lVar41;
              lVar42 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar59 >> 0x20),local_100),uVar60,2)
              ;
              uVar58 = FloatVectorMult(uVar58,uVar57,2,0x20);
              *pfVar1 = (float)lVar42;
              lVar44 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar57 >> 0x20),local_fc),uVar58,2);
              *pfVar2 = (float)lVar44;
              if (*(char *)(iVar31 * 0xb8 + (int)param_1[10] + 0x39) != '\x01') {
                lVar44 = CONCAT44((int)((ulonglong)lVar44 >> 0x20),*(undefined4 *)(puVar21 + 0xc4));
                uVar57 = FloatVectorSub(lVar41,lVar44,2,0x20);
                *pfVar40 = (float)uVar57;
                lVar41 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar57 >> 0x20),
                                                 *(undefined4 *)(puVar21 + 200)),lVar42,2);
                *pfVar1 = (float)lVar41;
              }
            }
            uVar52 = CONCAT44((int)((ulonglong)uVar52 >> 0x20),DAT_000359c0);
            uVar53 = CONCAT44((int)((ulonglong)uVar53 >> 0x20),DAT_000359c4);
            fVar24 = local_c4;
            fVar34 = fVar26;
            iVar39 = iVar29;
          }
          fVar26 = fVar24;
        } while (fVar24 != 0.0);
        iVar29 = iVar39 + 1;
        iVar27 = iVar29;
        if (iVar39 != iVar33) {
          param_1[7] = (float)((iVar29 - iVar33) / 6 + (int)param_1[7]);
          (**(code **)(**(int **)(iVar31 * 0xb8 + (int)param_1[10] + 0xac) + 8))();
          local_118 = 0;
          FUN_0033aaf4(&DAT_00558550 + iVar33 * 0xc,iVar39 - iVar33,0,0,&local_118);
          FUN_00026ed0(&local_118);
          piVar25 = *(int **)(iVar31 * 0xb8 + (int)param_1[10] + 0xac);
          (**(code **)(*piVar25 + 0xc))(piVar25,1);
          lVar48 = (ulonglong)extraout_s7_05 << 0x20;
          lVar44 = (ulonglong)extraout_s5_05 << 0x20;
          lVar42 = (ulonglong)extraout_s3_04 << 0x20;
          lVar41 = (ulonglong)extraout_s1_04 << 0x20;
          uVar56 = extraout_d4_02;
          uVar50 = extraout_d5_02;
          uVar55 = extraout_d6_02;
        }
      }
      iVar31 = iVar31 + 1;
      iVar33 = iVar29;
      iVar39 = iVar27;
    } while (iVar31 < (int)param_1[9]);
  }
  return;
}


```

## FUN_0000fc6c — 0000fc6c

```c

/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Removing unreachable block (ram,0x007cb56c) */
/* WARNING: Removing unreachable block (ram,0x0000ff18) */
/* WARNING: Removing unreachable block (ram,0x0000ff04) */
/* WARNING: Removing unreachable block (ram,0x0020b52c) */
/* WARNING: Removing unreachable block (ram,0x0020b53a) */
/* WARNING: Removing unreachable block (ram,0x0020b530) */
/* WARNING: Removing unreachable block (ram,0x0020b538) */

uint FUN_0000fc6c(int param_1,undefined4 param_2)

{
  undefined *puVar1;
  uint uVar2;
  int iVar3;
  undefined4 uVar4;
  int *piVar5;
  undefined4 *puVar6;
  int *unaff_r5;
  undefined4 unaff_r6;
  IFriendsService **unaff_r8;
  uint *unaff_r10;
  int *unaff_r11;
  undefined8 in_d0;
  undefined8 uVar7;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined8 in_d1;
  undefined8 uVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  float fVar11;
  float fVar12;
  undefined8 unaff_d9;
  undefined4 uVar13;
  undefined8 uVar14;
  undefined4 in_stack_00000008;
  uint in_stack_0000000c;
  
  uVar7 = CONCAT44((int)((ulonglong)in_d0 >> 0x20),DAT_0000ff34);
  uVar8 = FloatVectorMult(CONCAT44((int)((ulonglong)in_d1 >> 0x20),*(undefined4 *)(param_1 + 0x78)),
                          uVar7,2,0x20);
  *(int *)(param_1 + 0x78) = (int)uVar8;
  uVar8 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar8 >> 0x20),*(undefined4 *)(param_1 + 0x7c)),
                          uVar7,2,0x20);
  *(int *)(param_1 + 0x7c) = (int)uVar8;
  uVar7 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar8 >> 0x20),*(undefined4 *)(param_1 + 0x80)),
                          uVar7,2,0x20);
  *(int *)(param_1 + 0x80) = (int)uVar7;
  uVar2 = (uint)*(byte *)(param_1 + 0x1bc);
  if ((uVar2 == 0) && (*(float *)(param_1 + 0xd0) <= 0.0)) {
    uVar7 = CONCAT44(param_2,param_2);
    uVar2 = FUN_0001d10c(PTR_DAT_004d9048);
    puVar1 = PTR_DAT_004d907c;
    if (*(float *)(param_1 + 0xdc) == 0.0) {
      if (uVar2 != 0) {
        iVar3 = FUN_00063fe0(PTR_DAT_004d907c,*(undefined4 *)PTR_DAT_004d9064);
        if (iVar3 == 1) {
          uVar9 = *(undefined4 *)(param_1 + 0x10);
          uVar13 = (undefined4)((ulonglong)unaff_d9 >> 0x20);
          uVar10 = *(undefined4 *)(*(int *)(param_1 + 0x38) + 0x14);
          uVar4 = FUN_00025164();
          uVar8 = FloatVectorMult(CONCAT44(uVar4,uVar4),0xbf000000bf000000,2,0x20);
          uVar7 = FloatVectorSub(CONCAT44(param_2,uVar9),CONCAT44(uVar13,uVar10),2,0x20);
          uVar8 = FloatVectorAdd(uVar8,0xc1b00000c1b00000,2);
          if ((int)((uint)((float)uVar7 < (float)uVar8) << 0x1f) < 0) {
            uVar7 = FloatVectorNeg(CONCAT44((int)((ulonglong)uVar7 >> 0x20),
                                            *(undefined4 *)(param_1 + 0x1c)),2,2);
            *(int *)(param_1 + 0x1c) = (int)uVar7;
          }
          uVar4 = *(undefined4 *)(param_1 + 0x10);
          uVar9 = *(undefined4 *)(*(int *)(param_1 + 0x38) + 0x14);
          uVar2 = FUN_00025164((int)uVar7);
          uVar8 = FloatVectorMult(CONCAT44(uVar2,uVar2),0x3f0000003f000000,2,0x20);
          uVar7 = FloatVectorAdd(CONCAT44(param_2,uVar4),CONCAT44(uVar13,uVar9),2);
          uVar8 = FloatVectorAdd(uVar8,0x41b0000041b00000,2);
          if ((float)uVar7 <= (float)uVar8) {
            return uVar2;
          }
          uVar7 = FloatVectorNeg(CONCAT44((int)((ulonglong)uVar7 >> 0x20),
                                          *(undefined4 *)(param_1 + 0x1c)),2,2);
          uVar7 = FloatVectorNeg(uVar7,2,2);
          *(int *)(param_1 + 0x1c) = (int)uVar7;
          return uVar2;
        }
        uVar2 = FUN_00063fe0(puVar1,*(undefined4 *)PTR_DAT_004d909c);
        if (uVar2 != 0) {
          return uVar2;
        }
        uVar2 = FUN_00063fe0(puVar1,*(undefined4 *)PTR_DAT_004d905c);
        if (uVar2 != 0) {
          return uVar2;
        }
        uVar2 = FUN_00063fe0(puVar1,*(undefined4 *)PTR_DAT_004d906c);
        unaff_r5 = (int *)puVar1;
        if (uVar2 != 0) {
          return uVar2;
        }
      }
      fVar11 = *(float *)(param_1 + 0x10);
      uVar4 = FUN_00025164();
      uVar8 = FloatVectorMult(CONCAT44(uVar4,uVar4),CONCAT44(extraout_s1_01,DAT_0000ff38),2,0x20);
      if ((int)((uint)(fVar11 < (float)uVar8) << 0x1f) < 0) {
        uVar7 = FloatVectorMult(uVar7,0x4180000041800000,2,0x20);
        uVar7 = FloatVectorAdd(uVar7,CONCAT44((int)((ulonglong)uVar8 >> 0x20),
                                              *(undefined4 *)(param_1 + 0x1c)),2);
        *(int *)(param_1 + 0x1c) = (int)uVar7;
        uVar8 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar7 >> 0x20),
                                        *(undefined4 *)(param_1 + 0x78)),0x41a0000041a00000,2);
        *(int *)(param_1 + 0x78) = (int)uVar8;
      }
      fVar12 = *(float *)(param_1 + 0x10);
      uVar8 = FUN_00025164((int)uVar8);
      uVar2 = (uint)uVar8;
      uVar7 = FloatVectorMult(CONCAT44(uVar2,uVar2),CONCAT44(extraout_s1_02,DAT_0000ff3c),2,0x20);
      fVar11 = (float)uVar7;
      if ((fVar12 != fVar11 && fVar11 <= fVar12) && (fVar12 == fVar11)) {
        FUN_0030fb10(uVar2,(int)((ulonglong)uVar8 >> 0x20));
        Mortar::IFriendsServiceAggregate::GetServiceName();
        FUN_0030f978(unaff_r6,PTR_s_serviceName_004d9764);
        piVar5 = (int *)(**(code **)(*unaff_r5 + 0x18))(unaff_r5);
        if (*piVar5 != 1) {
          FUN_0030fb10(&stack0xffffffe0,"/");
          uVar4 = (**(code **)(*unaff_r5 + 0x18))(unaff_r5);
          FUN_0030f978(&stack0xffffffe0,uVar4);
        }
        iVar3 = std::
                _Rb_tree<Mortar::AsciiString,std::pair<Mortar::AsciiString_const,Mortar::IService*>,std::_Select1st<std::pair<Mortar::AsciiString_const,Mortar::IService*>>,std::less<Mortar::AsciiString>,std::allocator<std::pair<Mortar::AsciiString_const,Mortar::IService*>>>
                ::find((AsciiString *)(*unaff_r11 + 0x40));
        if (iVar3 == *unaff_r11 + 0x44) {
          std::vector<Mortar::IFriendsService*,std::allocator<Mortar::IFriendsService*>>::push_back
                    (unaff_r8);
          puVar6 = (undefined4 *)
                   std::
                   map<Mortar::AsciiString,Mortar::IService*,std::less<Mortar::AsciiString>,std::allocator<std::pair<Mortar::AsciiString_const,Mortar::IService*>>>
                   ::operator[]((AsciiString *)(*unaff_r11 + 0x40));
          *puVar6 = in_stack_00000008;
        }
        FUN_0030f7e0(&stack0xffffffe0);
        if (*unaff_r10 == in_stack_0000000c) {
          return *unaff_r10;
        }
                    /* WARNING: Subroutine does not return */
        ___stack_chk_fail();
      }
    }
    else if (*(float *)(param_1 + 0xe0) == 0.0) {
      fVar11 = *(float *)(param_1 + 0x14);
      uVar4 = FUN_000251a8();
      uVar8 = FloatVectorMult(CONCAT44(uVar4,uVar4),CONCAT44(extraout_s1,DAT_0000ff38),2,0x20);
      if ((int)((uint)(fVar11 < (float)uVar8) << 0x1f) < 0) {
        uVar14 = FloatVectorMult(uVar7,0x4180000041800000,2,0x20);
        uVar8 = FloatVectorAdd(uVar14,CONCAT44((int)((ulonglong)uVar8 >> 0x20),
                                               *(undefined4 *)(param_1 + 0x20)),2);
        *(int *)(param_1 + 0x20) = (int)uVar8;
        uVar8 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar8 >> 0x20),
                                        *(undefined4 *)(param_1 + 0x7c)),0x41a0000041a00000,2);
        *(int *)(param_1 + 0x7c) = (int)uVar8;
      }
      fVar11 = *(float *)(param_1 + 0x14);
      uVar2 = FUN_000251a8((int)uVar8);
      uVar8 = FloatVectorMult(CONCAT44(uVar2,uVar2),CONCAT44(extraout_s1_00,DAT_0000ff3c),2,0x20);
      if ((float)uVar8 < fVar11) {
        uVar7 = FloatVectorMult(uVar7,0xc1800000c1800000,2,0x20);
        uVar7 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar8 >> 0x20),
                                        *(undefined4 *)(param_1 + 0x20)),uVar7,2);
        *(int *)(param_1 + 0x20) = (int)uVar7;
        uVar7 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar7 >> 0x20),
                                        *(undefined4 *)(param_1 + 0x7c)),0xc1a00000c1a00000,2);
        *(int *)(param_1 + 0x7c) = (int)uVar7;
      }
    }
  }
  return uVar2;
}


```

## FUN_0007a3c0 — 0007a3c0

```c

void FUN_0007a3c0(int *param_1,float param_2)

{
  undefined *puVar1;
  undefined *puVar2;
  undefined *puVar3;
  int iVar4;
  undefined1 *puVar5;
  undefined4 uVar6;
  undefined4 *puVar7;
  undefined4 extraout_r1;
  undefined4 extraout_r1_00;
  uint uVar8;
  int iVar9;
  uint uVar10;
  int iVar11;
  int iVar12;
  int iVar13;
  undefined4 uVar14;
  uint uVar15;
  uint uVar16;
  uint uVar17;
  float fVar18;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined8 uVar19;
  undefined4 extraout_s1_02;
  undefined4 extraout_s1_03;
  undefined8 uVar20;
  uint extraout_s1_04;
  uint extraout_s1_05;
  undefined4 extraout_s1_06;
  uint extraout_s1_07;
  undefined4 extraout_s1_08;
  undefined4 extraout_s1_09;
  float fVar21;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  undefined4 extraout_s3_01;
  undefined4 extraout_s3_02;
  undefined4 extraout_s3_03;
  uint extraout_s3_04;
  undefined4 extraout_s3_05;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  undefined4 uVar24;
  undefined4 extraout_s5_01;
  longlong lVar22;
  uint extraout_s5_02;
  undefined4 extraout_s5_03;
  longlong lVar23;
  uint extraout_s5_04;
  undefined4 extraout_s5_05;
  undefined4 extraout_s7;
  undefined4 extraout_s7_00;
  undefined4 extraout_s7_01;
  undefined4 extraout_s7_02;
  undefined4 extraout_s7_03;
  undefined4 extraout_s7_04;
  undefined4 extraout_s7_05;
  undefined4 extraout_s7_06;
  undefined4 extraout_s7_07;
  undefined4 extraout_s7_08;
  undefined4 extraout_s7_09;
  undefined4 extraout_s7_10;
  undefined4 extraout_s7_11;
  undefined4 extraout_s7_12;
  undefined8 extraout_d4;
  undefined8 extraout_d4_00;
  undefined8 extraout_d4_01;
  undefined8 extraout_d4_02;
  undefined8 extraout_d4_03;
  undefined8 extraout_d4_04;
  undefined8 extraout_d4_05;
  undefined8 extraout_d4_06;
  undefined8 extraout_d4_07;
  undefined8 extraout_d4_08;
  undefined8 extraout_d4_09;
  undefined8 extraout_d4_10;
  undefined8 extraout_d4_11;
  undefined8 extraout_d5;
  undefined8 extraout_d5_00;
  undefined8 extraout_d5_01;
  undefined8 extraout_d5_02;
  undefined8 extraout_d5_03;
  undefined8 extraout_d5_04;
  undefined8 extraout_d5_05;
  undefined8 extraout_d5_06;
  undefined8 extraout_d5_07;
  undefined8 extraout_d5_08;
  undefined8 extraout_d5_09;
  undefined8 extraout_d5_10;
  undefined8 extraout_d5_11;
  undefined8 uVar25;
  undefined8 uVar26;
  undefined8 unaff_d9;
  undefined8 uVar27;
  undefined8 unaff_d10;
  undefined8 unaff_d11;
  undefined8 uVar28;
  undefined8 unaff_d12;
  undefined8 uVar29;
  undefined8 unaff_d13;
  undefined8 unaff_d14;
  undefined4 uVar30;
  undefined8 uVar31;
  undefined8 uVar32;
  undefined4 local_d8;
  undefined4 local_d4;
  undefined4 local_d0;
  undefined4 local_cc;
  int local_c8;
  int local_c4;
  int local_c0;
  int local_bc;
  int local_b8;
  int local_b4;
  undefined **local_b0;
  undefined *local_ac;
  undefined4 local_a8 [8];
  undefined1 local_88;
  char acStack_84 [32];
  int local_64;
  
  puVar2 = PTR_DAT_004d9048;
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_64 = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_0001d10c(PTR_DAT_004d9048);
  iVar4 = FUN_0005edbc(PTR_DAT_004d9024);
  uVar6 = extraout_s7;
  uVar20 = extraout_d4;
  uVar25 = extraout_d5;
  uVar14 = extraout_s1;
  uVar30 = extraout_s3;
  uVar24 = extraout_s5;
  if (iVar4 != 0) {
    iVar4 = FUN_00052f80();
    *(undefined4 *)(iVar4 + 0x7c) = 0x3f800000;
    puVar5 = (undefined1 *)FUN_00052f80();
    *puVar5 = 0;
    if (*(int *)(puVar2 + 0x10) != 1) {
      uVar6 = FUN_00052f80();
      FUN_00054dd8(uVar6,0);
    }
    puVar7 = (undefined4 *)FUN_00033ca0();
    *puVar7 = 0;
    iVar4 = FUN_00033ca0();
    *(undefined4 *)(iVar4 + 4) = 0x3f800000;
    FUN_00013f00();
    *(undefined4 *)(*(int *)(puVar2 + 0x4c) + 0x24) = 0x3f800000;
    *(undefined1 *)((int)param_1 + 0x33) = 1;
    uVar6 = extraout_s7_00;
    uVar20 = extraout_d4_00;
    uVar25 = extraout_d5_00;
    uVar14 = extraout_s1_00;
    uVar30 = extraout_s3_00;
    uVar24 = extraout_s5_00;
  }
  if (param_1[0x38] != 0) {
    puVar7 = &DAT_0007ad94;
    if (puVar2[10] != '\0') {
      puVar7 = &DAT_0007ad98;
    }
    FUN_00309b38(param_1[0x38],*puVar7);
    uVar6 = extraout_s7_01;
    uVar20 = extraout_d4_01;
    uVar25 = extraout_d5_01;
    uVar14 = extraout_s1_01;
    uVar30 = extraout_s3_01;
    uVar24 = extraout_s5_01;
  }
  if (puVar2[10] != '\0') goto LAB_0007ad6a;
  uVar26 = CONCAT44(param_2,param_2);
  uVar19 = FloatVectorAdd(CONCAT44(uVar14,param_1[0x22]),uVar26,2);
  fVar18 = (float)uVar19;
  param_1[0x22] = (int)fVar18;
  uVar19 = CONCAT44(uVar30,param_1[0x21]);
  if (0.0 < (float)param_1[0x21]) {
    uVar31 = FloatVectorMult(uVar26,CONCAT44(uVar24,DAT_0007a818),2,0x20);
    uVar19 = FloatVectorAdd(uVar19,uVar31,2);
    param_1[0x21] = (int)(float)uVar19;
    if ((float)uVar19 <= 0.0) {
      param_1[0x21] = 0;
    }
  }
  iVar4 = param_1[0x1f];
  if (iVar4 != 0) {
    if (0.0 < *(float *)(iVar4 + 0x104)) {
      *(undefined4 *)(iVar4 + 0x104) = 0x3f800000;
      fVar18 = (float)param_1[0x22];
    }
  }
  uVar27 = CONCAT44((int)((ulonglong)unaff_d9 >> 0x20),DAT_0007a81c);
  uVar19 = CONCAT44((int)((ulonglong)uVar19 >> 0x20),param_1[0x28]);
  uVar31 = FloatVectorAdd(uVar19,uVar27,2);
  if ((int)((uint)(fVar18 < (float)uVar31) << 0x1f) < 0) {
    FUN_000449ac();
    fVar18 = (float)param_1[0x22];
    uVar19 = CONCAT44(extraout_s3_02,param_1[0x28]);
    uVar6 = extraout_s7_02;
    uVar20 = extraout_d4_02;
    uVar25 = extraout_d5_02;
  }
  uVar32 = FloatVectorAdd(uVar19,uVar27,2);
  uVar28 = CONCAT44((int)((ulonglong)unaff_d11 >> 0x20),DAT_0007a820);
  uVar31 = CONCAT44((int)((ulonglong)unaff_d10 >> 0x20),DAT_0007a824);
  uVar29 = CONCAT44((int)((ulonglong)unaff_d12 >> 0x20),DAT_0007a828);
  uVar32 = FloatVectorAdd(uVar32,uVar28,2);
  uVar32 = FloatVectorAdd(uVar32,uVar31,2);
  uVar32 = FloatVectorAdd(uVar32,uVar29,2);
  uVar32 = FloatVectorAdd(uVar32,0x3e8000003e800000,2);
  lVar22 = FloatVectorAdd(uVar32,0x3f0000003f000000,2);
  if ((int)((uint)(fVar18 < (float)lVar22) << 0x1f) < 0) {
    FUN_00009718();
    lVar22 = (ulonglong)extraout_s5_02 << 0x20;
    fVar18 = (float)param_1[0x22];
    uVar19 = CONCAT44(extraout_s3_03,param_1[0x28]);
    uVar6 = extraout_s7_03;
    uVar20 = extraout_d4_03;
    uVar25 = extraout_d5_03;
  }
  lVar22 = FloatVectorAdd(uVar19,CONCAT44((int)((ulonglong)lVar22 >> 0x20),DAT_0007a82c),2);
  if (((float)lVar22 <= fVar18) && ((int)((uint)((float)param_1[0x23] < (float)lVar22) << 0x1f) < 0)
     ) {
    local_b0 = &PTR_LAB_0052bf38;
    local_ac = PTR_FUN_004d9058;
    local_88 = 1;
    local_a8[0] = 0;
    uVar6 = *(undefined4 *)(puVar2 + 0x1a4);
    FUN_0000a23c(&local_b0,local_a8);
    FUN_0002bc94(uVar6,"pome-zoomout",0x3e000000,0x3f800000,local_a8,0);
    FUN_0000a298(local_a8);
    lVar22 = (ulonglong)extraout_s3_04 << 0x20;
    uVar6 = extraout_s7_04;
    uVar20 = extraout_d4_04;
    uVar25 = extraout_d5_04;
  }
  uVar14 = 0x41f00000;
  uVar19 = FixedToFP(CONCAT44((int)((ulonglong)lVar22 >> 0x20),param_1[0x24]),0,0,0,0x20);
  if (30.0 <= (float)uVar19) {
    fVar18 = (float)param_1[0x22];
    uVar19 = CONCAT44((int)((ulonglong)uVar19 >> 0x20),fVar18);
    if (fVar18 < (float)param_1[0x28]) {
      param_1[0x28] = (int)fVar18;
    }
    fVar21 = (float)param_1[0x23];
    if ((int)((uint)(fVar21 < fVar18) << 0x1f) < 0) {
      iVar4 = param_1[0x1f];
      param_1[0x3d] = *(int *)(iVar4 + 0x10);
      param_1[0x3e] = *(int *)(iVar4 + 0x14);
      param_1[0x3f] = *(int *)(iVar4 + 0x18);
      FUN_0004f480(param_1);
      FUN_00013f00();
      if (param_1[0x25] != 0) {
        *(undefined4 *)(param_1[0x25] + 0x7c) = 0;
      }
      uVar30 = (undefined4)((ulonglong)unaff_d14 >> 0x20);
      fVar18 = *(float *)(param_1[0x1f] + 0x10);
      uVar6 = FUN_00025164();
      uVar14 = (undefined4)((ulonglong)unaff_d13 >> 0x20);
      uVar25 = CONCAT44(uVar14,DAT_0007a840);
      uVar20 = FloatVectorMult(CONCAT44(uVar6,uVar6),uVar25,2,0x20);
      if (fVar18 <= (float)uVar20) {
LAB_0007a6e0:
        uVar6 = FUN_00025164();
        uVar20 = FloatVectorMult(CONCAT44(uVar6,uVar6),uVar25,2,0x20);
        iVar4 = (int)uVar20;
      }
      else {
        fVar18 = *(float *)(param_1[0x1f] + 0x10);
        uVar6 = FUN_00025164();
        uVar25 = CONCAT44(uVar14,DAT_0007a844);
        uVar20 = FloatVectorMult(CONCAT44(uVar6,uVar6),uVar25,2,0x20);
        if ((float)uVar20 <= fVar18) goto LAB_0007a6e0;
        iVar4 = *(int *)(param_1[0x1f] + 0x10);
      }
      fVar18 = *(float *)(param_1[0x1f] + 0x14);
      uVar6 = FUN_000251a8();
      uVar25 = CONCAT44(uVar30,DAT_0007a848);
      uVar20 = FloatVectorMult(CONCAT44(uVar6,uVar6),uVar25,2,0x20);
      if (fVar18 <= (float)uVar20) {
LAB_0007a73a:
        uVar6 = FUN_000251a8();
        uVar19 = FloatVectorMult(CONCAT44(uVar6,uVar6),uVar25,2,0x20);
        uVar6 = extraout_s7_07;
        uVar20 = extraout_d4_07;
        uVar25 = extraout_d5_07;
      }
      else {
        fVar18 = *(float *)(param_1[0x1f] + 0x14);
        uVar6 = FUN_000251a8();
        uVar25 = CONCAT44(uVar30,DAT_0007a84c);
        uVar20 = FloatVectorMult(CONCAT44(uVar6,uVar6),uVar25,2,0x20);
        if ((float)uVar20 <= fVar18) goto LAB_0007a73a;
        uVar19 = CONCAT44((int)((ulonglong)uVar20 >> 0x20),*(undefined4 *)(param_1[0x1f] + 0x14));
        uVar6 = extraout_s7_06;
        uVar20 = extraout_d4_06;
        uVar25 = extraout_d5_06;
      }
      param_1[0x42] = 0;
      param_1[0x40] = iVar4;
      param_1[0x41] = (int)uVar19;
      fVar21 = (float)param_1[0x23];
      uVar19 = CONCAT44((int)((ulonglong)uVar19 >> 0x20),param_1[0x28]);
    }
    lVar22 = FloatVectorAdd(uVar19,uVar27,2);
    if ((int)((uint)(fVar21 < (float)lVar22) << 0x1f) < 0) {
      iVar4 = param_1[0x1f];
      param_1[0x3d] = *(int *)(iVar4 + 0x10);
      param_1[0x3e] = *(int *)(iVar4 + 0x14);
      param_1[0x3f] = *(int *)(iVar4 + 0x18);
      if ((float)lVar22 <= (float)param_1[0x22]) {
        FUN_0005032c(param_1);
        if (param_1[0x24] < 2) {
          iVar4 = FUN_00052f80();
          *(undefined4 *)(iVar4 + 0x7c) = 0x3f800000;
          puVar5 = (undefined1 *)FUN_00052f80();
          *puVar5 = 0;
          uVar6 = FUN_00052f80();
          FUN_00054dd8(uVar6,0);
          puVar7 = (undefined4 *)FUN_00033ca0();
          *puVar7 = 0;
          iVar4 = FUN_00033ca0();
          lVar22 = (ulonglong)extraout_s1_05 << 0x20;
          *(undefined4 *)(iVar4 + 4) = 0x3f800000;
          *(undefined4 *)(*(int *)(puVar2 + 0x4c) + 0x24) = 0x3f800000;
          *(undefined1 *)((int)param_1 + 0x33) = 1;
          uVar6 = extraout_s7_09;
          uVar20 = extraout_d4_09;
          uVar25 = extraout_d5_09;
        }
        else {
          local_bc = param_1[2];
          local_b8 = param_1[3];
          local_b4 = param_1[4];
          FUN_0000577c(local_bc,*(undefined4 *)(puVar2 + 0x58),&local_bc,0x3f800000,0x40000000,
                       0x41100000);
          (**(code **)(*param_1 + 0x44))(param_1);
          FUN_0007adac(param_1);
          _sprintf(acStack_84,"+%i",param_1[0x43] * 100 + 100);
          (**(code **)(*param_1 + 0x40))(param_1,acStack_84,0,param_1 + 0x27);
          lVar22 = (ulonglong)extraout_s1_04 << 0x20;
          uVar6 = extraout_s7_08;
          uVar20 = extraout_d4_08;
          uVar25 = extraout_d5_08;
        }
      }
    }
    lVar22 = CONCAT44((int)((ulonglong)lVar22 >> 0x20),param_1[0x28]);
    lVar23 = FloatVectorAdd(lVar22,uVar27,2);
    if ((float)lVar23 <= (float)param_1[0x22]) {
      param_1[0xd] = 1;
      if ((char)param_1[0x39] != '\0') {
        FUN_0004f748(param_1,param_2);
        lVar22 = CONCAT44(extraout_s1_06,param_1[0x23]);
        uVar20 = FloatVectorAdd(CONCAT44(extraout_s3_05,param_1[0x28]),uVar27,2);
        uVar20 = FloatVectorAdd(uVar20,uVar28,2);
        uVar20 = FloatVectorAdd(uVar20,CONCAT44(extraout_s3_05,DAT_0007a84c),2);
        if (((int)((uint)((float)param_1[0x23] < (float)uVar20) << 0x1f) < 0) &&
           (lVar22 = CONCAT44(extraout_s1_06,param_1[0x22]), (float)uVar20 <= (float)param_1[0x22]))
        {
          local_c8 = param_1[2];
          local_c4 = param_1[3];
          local_c0 = param_1[4];
          FUN_0000577c(*(undefined4 *)(puVar2 + 0x58),&local_c8,0x3fcccccd,0x40000000,0x41100000);
          lVar22 = (ulonglong)extraout_s1_07 << 0x20;
        }
      }
      iVar4 = *(int *)(puVar2 + 0x4c);
      uVar20 = FloatVectorMult(uVar26,CONCAT44((int)((ulonglong)lVar22 >> 0x20),DAT_0007a830),2,0x20
                              );
      uVar25 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar20 >> 0x20),
                                       *(undefined4 *)(iVar4 + 0x24)),0xbf800000bf800000,2);
      uVar6 = _pow(0,0x3fe80000,SUB84((double)(float)uVar20,0),
                   (int)((ulonglong)(double)(float)uVar20 >> 0x20));
      lVar23 = (ulonglong)extraout_s5_04 << 0x20;
      *(float *)(iVar4 + 0x24) =
           (float)((double)CONCAT44(extraout_r1_00,uVar6) * (double)(float)uVar25 + 1.0);
      lVar22 = CONCAT44(extraout_s1_08,param_1[0x28]);
      uVar6 = extraout_s7_10;
      uVar20 = extraout_d4_10;
      uVar25 = extraout_d5_10;
    }
    uVar19 = FloatVectorAdd(lVar22,uVar27,2);
    uVar14 = (undefined4)((ulonglong)lVar23 >> 0x20);
    uVar19 = FloatVectorAdd(uVar19,uVar27,2);
    if (((int)((uint)((float)param_1[0x23] < (float)uVar19) << 0x1f) < 0) &&
       ((float)uVar19 <= (float)param_1[0x22])) {
      *(undefined1 *)(param_1 + 0x39) = 0;
      param_1[0x22] = 0;
      param_1[0xd] = 0x80;
      iVar4 = param_1[0x1f];
      uVar20 = CONCAT44((int)((ulonglong)lVar22 >> 0x20),DAT_0007a850);
      uVar25 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar19 >> 0x20),
                                        *(undefined4 *)(iVar4 + 0x28)),uVar20,2,0x20);
      *(int *)(iVar4 + 0x28) = (int)uVar25;
      uVar25 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar25 >> 0x20),
                                        *(undefined4 *)(iVar4 + 0x2c)),uVar20,2,0x20);
      *(int *)(iVar4 + 0x2c) = (int)uVar25;
      uVar25 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar25 >> 0x20),
                                        *(undefined4 *)(iVar4 + 0x30)),uVar20,2,0x20);
      *(int *)(iVar4 + 0x30) = (int)uVar25;
      uVar20 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar25 >> 0x20),
                                        *(undefined4 *)(*(int *)(iVar4 + 0x38) + 0x14)),uVar20,2,
                               0x20);
      *(int *)(*(int *)(iVar4 + 0x38) + 0x14) = (int)uVar20;
      param_1[0x24] = 0;
      param_1[0x28] = 0x47c35000;
      param_1[0x43] = param_1[0x43] + 1;
      iVar4 = FUN_00052f80((int)uVar20);
      uVar8 = *(uint *)(iVar4 + 8);
      lVar22 = (ulonglong)uVar8 * (ulonglong)*(uint *)(iVar4 + 0x10);
      uVar10 = (uint)lVar22;
      *(uint *)(iVar4 + 8) = uVar10 + *(uint *)(iVar4 + 0x18);
      *(uint *)(iVar4 + 0xc) =
           *(int *)(iVar4 + 0xc) * *(uint *)(iVar4 + 0x10) +
           uVar8 * *(int *)(iVar4 + 0x14) + (int)((ulonglong)lVar22 >> 0x20) +
           *(int *)(iVar4 + 0x1c) + (uint)CARRY4(uVar10,*(uint *)(iVar4 + 0x18));
      iVar4 = FUN_00052f80();
      uVar8 = *(uint *)(iVar4 + 8);
      lVar22 = (ulonglong)uVar8 * (ulonglong)*(uint *)(iVar4 + 0x10);
      uVar10 = (uint)lVar22;
      *(uint *)(iVar4 + 8) = uVar10 + *(uint *)(iVar4 + 0x18);
      *(uint *)(iVar4 + 0xc) =
           *(int *)(iVar4 + 0xc) * *(uint *)(iVar4 + 0x10) +
           uVar8 * *(int *)(iVar4 + 0x14) + (int)((ulonglong)lVar22 >> 0x20) +
           *(int *)(iVar4 + 0x1c) + (uint)CARRY4(uVar10,*(uint *)(iVar4 + 0x18));
      iVar4 = FUN_00052f80();
      uVar8 = *(uint *)(iVar4 + 8);
      lVar22 = (ulonglong)uVar8 * (ulonglong)*(uint *)(iVar4 + 0x10);
      uVar10 = (uint)lVar22;
      *(uint *)(iVar4 + 8) = uVar10 + *(uint *)(iVar4 + 0x18);
      *(uint *)(iVar4 + 0xc) =
           *(int *)(iVar4 + 0xc) * *(uint *)(iVar4 + 0x10) +
           uVar8 * *(int *)(iVar4 + 0x14) + (int)((ulonglong)lVar22 >> 0x20) +
           *(int *)(iVar4 + 0x1c) + (uint)CARRY4(uVar10,*(uint *)(iVar4 + 0x18));
      local_d8 = 0;
      local_d4 = 0;
      local_d0 = 0;
      local_cc = 0x3f800000;
      FUN_000147c8(&local_d8,0x3f800000,0,0,0x3ffc);
      puVar3 = PTR_DAT_004d9050;
      fVar18 = DAT_0007ad9c;
      uVar8 = *(uint *)(PTR_DAT_004d9050 + 8);
      uVar17 = *(uint *)(PTR_DAT_004d9050 + 0x10);
      lVar22 = (ulonglong)*(uint *)PTR_DAT_004d9050 * (ulonglong)uVar8;
      uVar16 = (uint)lVar22;
      uVar10 = uVar16 + uVar17;
      lVar23 = (ulonglong)uVar8 * (ulonglong)uVar10;
      uVar15 = (uint)lVar23;
      uVar16 = *(int *)(PTR_DAT_004d9050 + 4) * uVar8 +
               *(uint *)PTR_DAT_004d9050 * *(int *)(PTR_DAT_004d9050 + 0xc) +
               (int)((ulonglong)lVar22 >> 0x20) + *(int *)(PTR_DAT_004d9050 + 0x14) +
               (uint)CARRY4(uVar16,uVar17);
      uVar14 = (undefined4)((ulonglong)uVar16 * 0x7ffff >> 0x20);
      uVar8 = *(int *)(PTR_DAT_004d9050 + 0x14) +
              *(int *)(PTR_DAT_004d9050 + 0xc) * uVar10 +
              uVar8 * uVar16 + (int)((ulonglong)lVar23 >> 0x20) + (uint)CARRY4(uVar15,uVar17);
      uVar6 = (undefined4)((ulonglong)uVar8 * 0x7ffff >> 0x20);
      *(uint *)PTR_DAT_004d9050 = uVar15 + uVar17;
      *(uint *)(puVar3 + 4) = uVar8;
      uVar20 = FixedToFP(CONCAT44(uVar14,uVar14),0,1,0,0x20);
      iVar4 = 0x18c;
      iVar11 = 0x15c;
      iVar9 = 0x134;
      FixedToFP(CONCAT44(uVar6,uVar6),0,1,0,0x20);
      uVar20 = FloatVectorMult(CONCAT44(extraout_s7_11,(float)uVar20 / fVar18),0x4040000040400000,2,
                               0x20);
      uVar20 = FloatVectorAdd(uVar20,0,2);
      uVar20 = FloatVectorNeg(uVar20,2,2);
      do {
        iVar13 = param_1[0x1f];
        iVar12 = iVar13 + iVar4;
        *(undefined4 *)(iVar12 + -0x20) = DAT_0052c000;
        *(undefined4 *)(iVar12 + -0x1c) = DAT_0052c004;
        *(undefined4 *)(iVar12 + -0x18) = DAT_0052c008;
        *(undefined4 *)(iVar12 + -0x14) = DAT_0052bf00;
        *(undefined4 *)(iVar12 + -0x10) = DAT_0052bf04;
        *(undefined4 *)(iVar12 + -0xc) = DAT_0052bf08;
        *(undefined4 *)(iVar12 + -8) = DAT_0052ce60;
        *(undefined4 *)(iVar12 + -4) = DAT_0052ce64;
        *(undefined4 *)(iVar13 + iVar4) = DAT_0052ce68;
        puVar7 = (undefined4 *)(iVar13 + iVar11);
        iVar4 = iVar4 + 0x24;
        *puVar7 = (int)uVar20;
        iVar11 = iVar11 + 0xc;
        puVar7[-2] = 0;
        puVar7[-1] = 0x40c00000;
        *(undefined4 *)(iVar13 + iVar9) = local_d8;
        iVar13 = iVar13 + iVar9;
        iVar9 = iVar9 + 0x10;
        *(undefined4 *)(iVar13 + 4) = local_d4;
        *(undefined4 *)(iVar13 + 8) = local_d0;
        *(undefined4 *)(iVar13 + 0xc) = local_cc;
      } while (iVar4 != 0x1d4);
      if (*(int *)(puVar2 + 0x10) == 0) {
        uVar14 = *(undefined4 *)(puVar2 + 0x5c);
        uVar6 = FUN_002f69c4("super_fruit_gp_classic",0x16);
        FUN_00027588(uVar14,"super_fruit_gp_classic",uVar6,param_1[0x24],0,1);
      }
      FUN_000274bc(*(undefined4 *)(puVar2 + 0x5c),"super_fruit_hits",param_1[0x24],0,0);
      lVar22 = CONCAT44(extraout_s1_09,param_1[0x28]);
      uVar6 = extraout_s7_12;
      uVar20 = extraout_d4_11;
      uVar25 = extraout_d5_11;
      uVar14 = extraout_s5_05;
    }
    uVar19 = FloatVectorAdd(lVar22,uVar27,2);
    uVar19 = FloatVectorAdd(uVar19,uVar28,2);
    uVar19 = FloatVectorAdd(uVar19,uVar31,2);
    uVar19 = FloatVectorAdd(uVar19,uVar29,2);
    uVar19 = FloatVectorAdd(uVar19,0x3e8000003e800000,2);
    uVar19 = FloatVectorAdd(uVar19,uVar31,2);
    if ((((float)uVar19 < (float)param_1[0x22]) && (param_1[0xd] = 0x80, param_1[0x1f] != 0)) &&
       ((float)param_1[0x23] <= (float)uVar19)) {
      *(undefined1 *)(param_1 + 0x39) = 0;
      param_1[0x22] = 0;
    }
  }
  else {
    if ((*(int *)(param_1[0x1f] + 0xb4) != 0) &&
       (iVar4 = FUN_00072b64(), uVar14 = extraout_s1_02,
       (int)((uint)(*(float *)(iVar4 + 8) < 0.0) << 0x1f) < 0)) {
      FUN_00073558(*(undefined4 *)(param_1[0x1f] + 0xb4),1);
      uVar14 = extraout_s1_03;
    }
    uVar20 = FloatVectorMult(uVar26,CONCAT44(uVar14,DAT_0007a830),2,0x20);
    uVar6 = _pow(0,0x3fe80000,SUB84((double)(float)uVar20,0),
                 (int)((ulonglong)(double)(float)uVar20 >> 0x20));
    *(float *)(*(int *)(puVar2 + 0x4c) + 0x24) =
         (float)((double)*(float *)(*(int *)(puVar2 + 0x4c) + 0x24) *
                 (double)CONCAT44(extraout_r1,uVar6) + DAT_0007a838);
    uVar6 = extraout_s7_05;
    uVar20 = extraout_d4_05;
    uVar25 = extraout_d5_05;
    uVar14 = extraout_s5_03;
  }
  uVar30 = DAT_0007ada4;
  uVar19 = CONCAT44(uVar14,DAT_0007ada0);
  puVar7 = (undefined4 *)(*(int *)(puVar2 + 0x4c) + 0x14);
  iVar4 = 0;
  do {
    uVar25 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar25 >> 0x20),param_1[0x28]),uVar27,2);
    if (-1 < (int)((uint)((float)param_1[0x22] < (float)uVar25) << 0x1f)) break;
    uVar20 = FixedToFP(CONCAT44((int)((ulonglong)uVar20 >> 0x20),param_1[0x24]),0,0,0,0x20);
    uVar20 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar20 >> 0x20),(float)uVar20 / -30.0),
                            0x3f8000003f800000,2);
    uVar25 = uVar19;
    if (0.0 < (float)uVar20) {
      uVar25 = FloatVectorMult(uVar20,CONCAT44(uVar6,uVar30),2,0x20);
      uVar25 = FloatVectorAdd(uVar25,uVar19,2);
    }
    iVar4 = iVar4 + 1;
    uVar20 = FloatVectorMult(uVar25,CONCAT44((int)((ulonglong)uVar20 >> 0x20),*puVar7),2,0x20);
    *puVar7 = (int)uVar20;
    puVar7 = puVar7 + 1;
  } while (iVar4 < 3);
  uVar20 = CONCAT44(0xc1f00000,param_1[0x29]);
  if ((int)((uint)((float)param_1[0x29] < 1.0) << 0x1f) < 0) {
    uVar25 = FloatVectorMult(uVar26,0x4040000040400000,2,0x20);
    uVar20 = FloatVectorAdd(uVar25,uVar20,2);
    param_1[0x29] = (int)(float)uVar20;
    if (1.0 <= (float)uVar20) {
      param_1[0x29] = 0x3f800000;
    }
  }
  if ((int)((uint)((float)param_1[0x36] < 1.0) << 0x1f) < 0) {
    uVar20 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar20 >> 0x20),param_1[0x36]),
                            CONCAT44(uVar14,param_2 / DAT_0007ada8),2);
    param_1[0x36] = (int)(float)uVar20;
    if (1.0 < (float)uVar20) {
      param_1[0x36] = 0x3f800000;
    }
  }
  param_1[0x23] = param_1[0x22];
LAB_0007ad6a:
  if (*(int *)puVar1 != local_64) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

命中函数数: 83
