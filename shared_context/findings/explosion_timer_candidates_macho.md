# 全局字段引用函数（完整反编译）

- 全局地址: 004d9048
- 字段偏移: 0x24
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

## FUN_0000b378 — 0000b378

```c

void FUN_0000b378(int param_1,undefined4 param_2,int param_3)

{
  undefined *puVar1;
  undefined *puVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  int iVar5;
  undefined4 uVar6;
  int iVar7;
  void *pvVar8;
  undefined4 extraout_s1;
  undefined8 uVar9;
  undefined4 extraout_s3;
  undefined8 uVar10;
  undefined4 extraout_s5;
  undefined8 uVar11;
  undefined1 auStack_38 [12];
  undefined4 local_2c;
  undefined4 local_28;
  undefined4 local_24;
  
  if (*(char *)(param_1 + 0xc1) == '\0') {
    *(undefined1 *)(param_1 + 0xb8) = 0;
    if (*(int **)(param_1 + 0xb4) != (int *)0x0) {
      (**(code **)(**(int **)(param_1 + 0xb4) + 4))();
      *(undefined4 *)(param_1 + 0xb4) = 0;
    }
    puVar1 = PTR_DAT_004d9048;
    iVar5 = FUN_0001d10c(PTR_DAT_004d9048);
    if (iVar5 != 0) {
      FUN_0001d10c(puVar1);
      puVar2 = PTR_DAT_004d907c;
      iVar5 = FUN_00064020(PTR_DAT_004d907c,5);
      if (iVar5 != 0) {
        uVar6 = FUN_000065c4();
        iVar7 = FUN_0000698c(uVar6,0,1);
        uVar11 = FloatVectorAdd(CONCAT44(extraout_s5,*(undefined4 *)(param_1 + 0x10)),0,2);
        uVar10 = FloatVectorAdd(CONCAT44(extraout_s3,*(undefined4 *)(param_1 + 0x14)),0,2);
        uVar9 = FloatVectorAdd(CONCAT44(extraout_s1,*(undefined4 *)(param_1 + 0x18)),0,2);
        local_2c = (undefined4)uVar11;
        local_28 = (undefined4)uVar10;
        local_24 = (undefined4)uVar9;
        FUN_00075be4(*(undefined4 *)(iVar5 + 0x70),iVar7,&local_2c,param_1 + 0x1c,
                     *(undefined4 *)(iVar5 + 0x6c),*(undefined4 *)(iVar5 + 0x70),param_1);
        *(undefined1 *)(param_1 + 0xb8) = 1;
        if (param_3 == 1) {
          *(undefined1 *)(iVar7 + 0x5c) = 1;
        }
      }
      FUN_0001d10c(puVar1);
      iVar5 = FUN_00064020(puVar2,7);
      if (iVar5 != 0) {
        pvVar8 = operator_new(0x2c);
        FUN_0006523c(auStack_38,iVar5,param_2);
        uVar6 = FUN_000651c4(iVar5);
        FUN_00072988(pvVar8,param_2,auStack_38,uVar6);
        *(void **)(param_1 + 0xb4) = pvVar8;
        uVar4 = DAT_0052bf08;
        uVar3 = DAT_0052bf04;
        uVar6 = DAT_0052bf00;
        *(undefined4 *)((int)pvVar8 + 0x1c) = *(undefined4 *)(iVar5 + 0x78);
        *(undefined4 *)((int)pvVar8 + 0x20) = uVar6;
        *(undefined4 *)((int)pvVar8 + 0x24) = uVar3;
        *(undefined4 *)((int)pvVar8 + 0x28) = uVar4;
      }
    }
  }
  return;
}


```

## FUN_0000b4b8 — 0000b4b8

```c

/* WARNING: Heritage AFTER dead removal. Example location: s1 : 0x0000bcbe */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void FUN_0000b4b8(undefined4 param_1,uint param_2,undefined4 param_3,int param_4)

{
  longlong lVar1;
  float fVar2;
  undefined *puVar3;
  undefined *puVar4;
  byte bVar5;
  undefined1 uVar6;
  int iVar7;
  undefined *puVar8;
  void *pvVar9;
  undefined4 uVar10;
  uint uVar11;
  undefined *puVar12;
  undefined4 uVar13;
  int iVar14;
  undefined4 *puVar15;
  uint uVar16;
  uint uVar17;
  undefined4 uVar18;
  int iVar19;
  undefined *puVar20;
  int iVar21;
  int iVar22;
  uint uVar23;
  uint uVar24;
  undefined8 uVar25;
  undefined8 in_d1;
  longlong lVar26;
  undefined8 uVar27;
  undefined8 uVar28;
  undefined8 uVar29;
  undefined4 local_7c;
  undefined4 local_78;
  undefined4 local_74;
  undefined4 local_70;
  undefined4 local_6c;
  undefined4 local_68;
  undefined4 local_64;
  undefined4 local_60;
  uint local_5c;
  undefined4 ***local_58;
  undefined4 ***local_54;
  undefined4 local_50;
  undefined4 local_4c;
  undefined4 ***local_48;
  undefined4 ***local_44;
  undefined4 local_40;
  undefined4 local_3c;
  undefined4 ***local_38;
  undefined4 ***local_34;
  undefined4 local_30;
  undefined4 local_2c;
  
  puVar3 = PTR_DAT_004d9048;
  uVar6 = 0;
  if (*(char *)(param_2 + 0x1b8) == '\0') {
    iVar7 = FUN_0001d10c(PTR_DAT_004d9048);
    uVar6 = 0;
    if (iVar7 != 0) {
      iVar7 = FUN_0001d10c(puVar3);
      uVar6 = 0;
      if ((*(int *)(iVar7 + 0x68) != 0) && (uVar6 = 0, *(int *)(*(int *)(iVar7 + 0x68) + 0x98) != 0)
         ) {
        uVar6 = 1;
      }
    }
  }
  *(undefined1 *)(param_2 + 0xb0) = uVar6;
  *(undefined1 *)(param_2 + 0x1bb) = 0;
  if (*(int **)(param_2 + 0xb4) != (int *)0x0) {
    (**(code **)(**(int **)(param_2 + 0xb4) + 4))();
    *(undefined4 *)(param_2 + 0xb4) = 0;
  }
  *(undefined1 *)(param_2 + 0xcc) = 0;
  *(undefined1 *)(param_2 + 0xc3) = 0;
  *(undefined4 *)(param_2 + 0x48) = 0;
  *(undefined4 *)(param_2 + 0xf4) = DAT_0052bfe0;
  *(undefined4 *)(param_2 + 0xf8) = DAT_0052bfe4;
  *(undefined4 *)(param_2 + 0xfc) = DAT_0052bfe8;
  *(undefined4 *)(param_2 + 0x110) = 0x3f800000;
  *(undefined4 *)(param_2 + 0x114) = 0;
  *(undefined4 *)(param_2 + 0x118) = 0;
  *(undefined1 *)(param_2 + 0xc0) = 1;
  *(undefined4 *)(param_2 + 0x1c0) = 0;
  *(undefined4 *)(param_2 + 0xd4) = 0x3f800000;
  *(undefined1 *)(param_2 + 0x1b9) = 0;
  local_30 = 0;
  local_2c = 0;
  local_38 = &local_38;
  local_34 = &local_38;
  FUN_0001560c(param_2 + 0x1c4,&local_38);
  *(undefined4 *)(param_2 + 0x1cc) = local_30;
  *(undefined4 *)(param_2 + 0x1d0) = local_2c;
  FUN_000152b8(&local_38);
  local_40 = 0;
  local_3c = 0;
  local_48 = &local_48;
  local_44 = &local_48;
  FUN_000154c0(param_2 + 0x1d4,&local_48);
  *(undefined4 *)(param_2 + 0x1dc) = local_40;
  *(undefined4 *)(param_2 + 0x1e0) = local_3c;
  FUN_00015290(&local_48);
  local_50 = 0;
  local_4c = 0;
  local_58 = &local_58;
  local_54 = &local_58;
  FUN_000154c0(param_2 + 0x1e4,&local_58);
  *(undefined4 *)(param_2 + 0x1ec) = local_50;
  *(undefined4 *)(param_2 + 0x1f0) = local_4c;
  FUN_00015290(&local_58);
  *(undefined4 *)(param_2 + 200) = 0;
  *(undefined4 *)(param_2 + 0xac) = 0;
  *(undefined4 *)(param_2 + 0x100) = 0;
  *(undefined1 *)(param_2 + 0xb1) = 0;
  *(undefined4 *)(param_2 + 0x9c) = *(undefined4 *)(param_2 + 0x1c);
  *(undefined4 *)(param_2 + 0xa0) = *(undefined4 *)(param_2 + 0x20);
  *(undefined4 *)(param_2 + 0xa4) = *(undefined4 *)(param_2 + 0x24);
  *(undefined2 *)(param_2 + 8) = 0;
  *(undefined1 *)(param_2 + 500) = 0;
  *(undefined4 *)(param_2 + 0xbc) = 0;
  puVar3 = PTR_DAT_004d9048;
  if ((param_4 < 0) || (DAT_005d4cd0 <= param_4)) {
    iVar7 = FUN_0001d10c(PTR_DAT_004d9048);
    if (iVar7 == 0) {
      uVar6 = FUN_0000af04(1);
      *(undefined1 *)(param_2 + 0x3c) = uVar6;
    }
    else {
      do {
        bVar5 = FUN_0000af04(1);
        *(byte *)(param_2 + 0x3c) = bVar5;
        FUN_0001d10c(puVar3);
        uVar11 = FUN_000617a8();
      } while (bVar5 == uVar11);
    }
  }
  else {
    *(char *)(param_2 + 0x3c) = (char)param_4;
  }
  if (((DAT_00556cd4 & 1) == 0) && (iVar7 = ___cxa_guard_acquire(&DAT_00556cd4), iVar7 != 0)) {
    DAT_00556cd0 = FUN_0000aae0("strawberry",0);
    ___cxa_guard_release(&DAT_00556cd4);
  }
  iVar7 = FUN_0001cd6c();
  uVar11 = (uint)*(byte *)(param_2 + 0x3c);
  if ((iVar7 == 1) && (uVar11 == DAT_00556cd0)) {
    uVar11 = uVar11 - 1;
    *(char *)(param_2 + 0x3c) = (char)uVar11;
  }
  if (*(int *)((uVar11 & 0xff) * 0x338 + DAT_005d4cdc + 0x32c) != 0) {
    DAT_005d4ce4 = DAT_005d4ce4 + 1;
    uVar11 = (uint)*(byte *)(param_2 + 0x3c);
  }
  FUN_0000bd54(param_2,uVar11 & 0xff,param_1);
  puVar4 = PTR_DAT_004d90a4;
  puVar3 = PTR_DAT_004d9048;
  if (*(char *)(param_2 + 0xc1) != '\0') {
    puVar8 = PTR_DAT_004d90a4 + 4;
    puVar15 = (undefined4 *)(PTR_DAT_004d90a4 + 8);
    puVar12 = puVar8;
    while (puVar20 = (undefined *)*puVar15, puVar20 != (undefined *)0x0) {
      puVar15 = (undefined4 *)(puVar20 + 0xc);
      if (param_2 <= *(uint *)(puVar20 + 0x10)) {
        puVar15 = (undefined4 *)(puVar20 + 8);
        puVar12 = puVar20;
      }
    }
    if (((puVar12 == puVar8) || (param_2 < *(uint *)(puVar12 + 0x10))) || (puVar12 == puVar8)) {
      iVar7 = FUN_0001cd2c();
      if ((puVar3[0x17] == '\0') || (iVar7 != 1)) {
        pvVar9 = operator_new(0x110);
        FUN_00079d18(pvVar9,param_2);
        FUN_0003e9e8(*(undefined4 *)(puVar3 + 0x4c),pvVar9,0);
        local_5c = param_2;
        puVar15 = (undefined4 *)FUN_00014770(puVar4,&local_5c);
        *puVar15 = pvVar9;
      }
      else {
        *(undefined4 *)(param_2 + 0x104) = 0;
      }
    }
  }
  *(uint *)(param_2 + 0xc) = *(uint *)(param_2 + 0xc) & 0xffffffed | 2;
  *(undefined1 *)(param_2 + 0x1bc) = 0;
  *(undefined1 *)(param_2 + 0xc4) = 0;
  *(undefined4 *)(param_2 + 0x104) = 0xbf800000;
  *(undefined4 *)(param_2 + 0xd0) = 0;
  *(undefined4 *)(param_2 + 0x84) = 0;
  *(undefined4 *)(param_2 + 0x78) = DAT_0052bfe0;
  *(undefined4 *)(param_2 + 0x7c) = DAT_0052bfe4;
  *(undefined4 *)(param_2 + 0x80) = DAT_0052bfe8;
  iVar7 = FUN_00052f80();
  lVar26 = (ulonglong)*(uint *)(iVar7 + 8) * (ulonglong)*(uint *)(iVar7 + 0x10);
  uVar16 = (uint)lVar26;
  uVar11 = *(int *)(iVar7 + 0xc) * *(uint *)(iVar7 + 0x10) +
           *(uint *)(iVar7 + 8) * *(int *)(iVar7 + 0x14) + (int)((ulonglong)lVar26 >> 0x20) +
           *(int *)(iVar7 + 0x1c) + (uint)CARRY4(*(uint *)(iVar7 + 0x18),uVar16);
  *(uint *)(iVar7 + 8) = *(uint *)(iVar7 + 0x18) + uVar16;
  *(uint *)(iVar7 + 0xc) = uVar11;
  iVar7 = FUN_00052f80();
  uVar16 = *(uint *)(iVar7 + 8);
  lVar26 = (ulonglong)uVar16 * (ulonglong)*(uint *)(iVar7 + 0x10);
  uVar17 = (uint)lVar26;
  *(uint *)(iVar7 + 8) = uVar17 + *(uint *)(iVar7 + 0x18);
  uVar23 = *(int *)(iVar7 + 0xc) * *(uint *)(iVar7 + 0x10) +
           uVar16 * *(int *)(iVar7 + 0x14) + (int)((ulonglong)lVar26 >> 0x20) +
           *(int *)(iVar7 + 0x1c) + (uint)CARRY4(uVar17,*(uint *)(iVar7 + 0x18));
  *(uint *)(iVar7 + 0xc) = uVar23;
  iVar7 = FUN_00052f80();
  lVar26 = (ulonglong)*(uint *)(iVar7 + 8) * (ulonglong)*(uint *)(iVar7 + 0x10);
  uVar16 = (uint)lVar26;
  uVar17 = *(int *)(iVar7 + 0xc) * *(uint *)(iVar7 + 0x10) +
           *(uint *)(iVar7 + 8) * *(int *)(iVar7 + 0x14) + (int)((ulonglong)lVar26 >> 0x20) +
           *(int *)(iVar7 + 0x1c) + (uint)CARRY4(uVar16,*(uint *)(iVar7 + 0x18));
  *(uint *)(iVar7 + 8) = uVar16 + *(uint *)(iVar7 + 0x18);
  *(uint *)(iVar7 + 0xc) = uVar17;
  local_6c = 0;
  local_68 = 0;
  local_64 = 0;
  local_60 = 0x3f800000;
  FUN_0000bef8(&local_6c,0);
  puVar3 = PTR_DAT_004d9050;
  fVar2 = DAT_0000b9e8;
  uVar13 = (undefined4)((ulonglong)uVar11 * 0x7ffff >> 0x20);
  uVar18 = (undefined4)((ulonglong)uVar23 * 0x7ffff >> 0x20);
  uVar10 = (undefined4)((ulonglong)uVar17 * 0x7ffff >> 0x20);
  uVar25 = FixedToFP(CONCAT44(uVar13,uVar13),0,1,0,0x20);
  uVar27 = FixedToFP(CONCAT44(uVar18,uVar18),0,1,0,0x20);
  uVar28 = FixedToFP(CONCAT44(uVar10,uVar10),0,1,0,0x20);
  uVar29 = FloatVectorMult(CONCAT44((int)((ulonglong)in_d1 >> 0x20),(float)uVar25 / DAT_0000b9e8),
                           0x4130000041300000,2,0x20);
  uVar27 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar27 >> 0x20),(float)uVar27 / DAT_0000b9e8),
                           0x4130000041300000,2,0x20);
  uVar25 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar25 >> 0x20),(float)uVar28 / DAT_0000b9e8),
                           0x4130000041300000,2,0x20);
  if (*(char *)((uint)*(byte *)(param_2 + 0x3c) * 0x338 + DAT_005d4cdc + 0x330) == '\0') {
    uVar25 = FloatVectorAdd(uVar25,0xc0b00000c0b00000,2);
    uVar28 = FloatVectorAdd(uVar29,0xc0b00000c0b00000,2);
    uVar10 = (undefined4)uVar28;
    lVar26 = FloatVectorAdd(uVar27,0xc0b00000c0b00000,2);
  }
  else {
    lVar26 = (ulonglong)*(uint *)PTR_DAT_004d9050 * (ulonglong)*(uint *)(PTR_DAT_004d9050 + 8);
    uVar16 = (uint)lVar26;
    uVar17 = *(int *)(PTR_DAT_004d9050 + 4) * *(uint *)(PTR_DAT_004d9050 + 8) +
             *(uint *)PTR_DAT_004d9050 * *(int *)(PTR_DAT_004d9050 + 0xc) +
             (int)((ulonglong)lVar26 >> 0x20) +
             *(int *)(PTR_DAT_004d9050 + 0x14) +
             (uint)CARRY4(uVar16,*(uint *)(PTR_DAT_004d9050 + 0x10));
    uVar10 = (undefined4)((ulonglong)uVar17 * 0x7ffff >> 0x20);
    *(uint *)PTR_DAT_004d9050 = uVar16 + *(uint *)(PTR_DAT_004d9050 + 0x10);
    *(uint *)(puVar3 + 4) = uVar17;
    uVar25 = FixedToFP(CONCAT44(uVar10,uVar10),0,1,0,0x20);
    uVar10 = (undefined4)((ulonglong)uVar25 >> 0x20);
    uVar25 = FloatVectorMult(CONCAT44(uVar10,(float)uVar25 / fVar2),0x41e0000041e00000,2,0x20);
    uVar25 = FloatVectorAdd(uVar25,0x4140000041400000,2);
    uVar25 = FloatVectorMult(uVar25,CONCAT44(uVar10,DAT_0000b9ec),2,0x20);
    uVar25 = FPToFixed(uVar25,0,0,3,0x20);
    FUN_000147c8(&local_6c,0,0x3f800000,0,(uint)uVar25 & 0xffff,uVar11);
    uVar11 = *(uint *)(puVar3 + 8);
    uVar24 = *(uint *)(puVar3 + 0x10);
    lVar26 = (ulonglong)*(uint *)puVar3 * (ulonglong)uVar11;
    uVar16 = (uint)lVar26;
    uVar17 = uVar16 + uVar24;
    lVar1 = (ulonglong)uVar11 * (ulonglong)uVar17;
    uVar23 = (uint)lVar1;
    uVar16 = *(int *)(puVar3 + 4) * uVar11 +
             *(uint *)puVar3 * *(int *)(puVar3 + 0xc) + (int)((ulonglong)lVar26 >> 0x20) +
             *(int *)(puVar3 + 0x14) + (uint)CARRY4(uVar16,uVar24);
    uVar10 = (undefined4)((ulonglong)uVar16 * 0x7ffff >> 0x20);
    uVar11 = *(int *)(puVar3 + 0x14) +
             *(int *)(puVar3 + 0xc) * uVar17 + uVar11 * uVar16 + (int)((ulonglong)lVar1 >> 0x20) +
             (uint)CARRY4(uVar23,uVar24);
    uVar13 = (undefined4)((ulonglong)uVar11 * 0x7ffff >> 0x20);
    *(uint *)puVar3 = uVar23 + uVar24;
    *(uint *)(puVar3 + 4) = uVar11;
    uVar25 = FixedToFP(CONCAT44(uVar10,uVar10),0,1,0,0x20);
    uVar25 = CONCAT44((int)((ulonglong)uVar25 >> 0x20),(float)uVar25 / fVar2);
    uVar27 = FixedToFP(CONCAT44(uVar13,uVar13),0,1,0,0x20);
    uVar25 = FloatVectorAdd(uVar25,uVar25,2);
    uVar25 = FloatVectorAdd(uVar25,0x4040000040400000,2);
    uVar11 = (uint)((ulonglong)uVar27 >> 0x20);
    if ((float)uVar27 / fVar2 <= 0.5) {
      uVar25 = FloatVectorNeg(uVar25,2,2);
      uVar10 = 0x41200000;
      lVar26 = (ulonglong)uVar11 << 0x20;
    }
    else {
      lVar26 = (ulonglong)uVar11 << 0x20;
      uVar10 = 0x41200000;
    }
  }
  iVar7 = 0x134;
  iVar14 = 0x10;
  iVar19 = 0;
  iVar21 = 0;
  do {
    iVar22 = param_2 + iVar21;
    iVar21 = iVar21 + 0x24;
    *(undefined4 *)(iVar22 + 0x16c) = DAT_0052c000;
    *(undefined4 *)(iVar22 + 0x170) = DAT_0052c004;
    *(undefined4 *)(iVar22 + 0x174) = DAT_0052c008;
    *(undefined4 *)(iVar22 + 0x178) = DAT_0052bf00;
    *(undefined4 *)(iVar22 + 0x17c) = DAT_0052bf04;
    *(undefined4 *)(iVar22 + 0x180) = DAT_0052bf08;
    *(undefined4 *)(iVar22 + 0x184) = DAT_0052ce60;
    *(undefined4 *)(iVar22 + 0x188) = DAT_0052ce64;
    *(undefined4 *)(iVar22 + 0x18c) = DAT_0052ce68;
    iVar22 = param_2 + iVar19;
    iVar19 = iVar19 + 0xc;
    *(undefined4 *)(iVar22 + 0x154) = uVar10;
    *(int *)(iVar22 + 0x158) = (int)lVar26;
    *(int *)(iVar22 + 0x15c) = (int)uVar25;
    *(undefined4 *)(param_2 + iVar7) = local_6c;
    iVar22 = param_2 + iVar7;
    iVar7 = iVar7 + 0x10;
    *(undefined4 *)(iVar22 + 4) = local_68;
    *(undefined4 *)(iVar22 + 8) = local_64;
    *(undefined4 *)(iVar22 + 0xc) = local_60;
    *(undefined4 *)(param_2 + iVar14 * 4) = 0;
    iVar14 = iVar14 + 1;
  } while (iVar21 != 0x48);
  if ((*(char *)(param_2 + 0xc1) != '\0') || (*(char *)(param_2 + 0xc2) != '\0')) {
    iVar7 = FUN_00052f80();
    uVar11 = *(uint *)(iVar7 + 8);
    lVar26 = (ulonglong)uVar11 * (ulonglong)*(uint *)(iVar7 + 0x10);
    uVar16 = (uint)lVar26;
    *(uint *)(iVar7 + 8) = uVar16 + *(uint *)(iVar7 + 0x18);
    *(uint *)(iVar7 + 0xc) =
         *(int *)(iVar7 + 0xc) * *(uint *)(iVar7 + 0x10) +
         uVar11 * *(int *)(iVar7 + 0x14) + (int)((ulonglong)lVar26 >> 0x20) +
         *(int *)(iVar7 + 0x1c) + (uint)CARRY4(uVar16,*(uint *)(iVar7 + 0x18));
    iVar7 = FUN_00052f80();
    uVar11 = *(uint *)(iVar7 + 8);
    lVar26 = (ulonglong)uVar11 * (ulonglong)*(uint *)(iVar7 + 0x10);
    uVar16 = (uint)lVar26;
    *(uint *)(iVar7 + 8) = uVar16 + *(uint *)(iVar7 + 0x18);
    *(uint *)(iVar7 + 0xc) =
         *(int *)(iVar7 + 0xc) * *(uint *)(iVar7 + 0x10) +
         uVar11 * *(int *)(iVar7 + 0x14) + (int)((ulonglong)lVar26 >> 0x20) +
         *(int *)(iVar7 + 0x1c) + (uint)CARRY4(uVar16,*(uint *)(iVar7 + 0x18));
    iVar7 = FUN_00052f80();
    uVar11 = *(uint *)(iVar7 + 8);
    lVar26 = (ulonglong)uVar11 * (ulonglong)*(uint *)(iVar7 + 0x10);
    uVar16 = (uint)lVar26;
    *(uint *)(iVar7 + 8) = uVar16 + *(uint *)(iVar7 + 0x18);
    *(uint *)(iVar7 + 0xc) =
         *(int *)(iVar7 + 0xc) * *(uint *)(iVar7 + 0x10) +
         uVar11 * *(int *)(iVar7 + 0x14) + (int)((ulonglong)lVar26 >> 0x20) +
         *(int *)(iVar7 + 0x1c) + (uint)CARRY4(uVar16,*(uint *)(iVar7 + 0x18));
    local_7c = 0;
    local_78 = 0;
    local_74 = 0;
    local_70 = 0x3f800000;
    FUN_000147c8(&local_7c,0x3f800000,0,0,0x3ffc);
    puVar3 = PTR_DAT_004d9050;
    uVar10 = 0x3f000000;
    uVar16 = *(uint *)(PTR_DAT_004d9050 + 8);
    uVar23 = *(uint *)(PTR_DAT_004d9050 + 0x10);
    lVar26 = (ulonglong)*(uint *)PTR_DAT_004d9050 * (ulonglong)uVar16;
    uVar17 = (uint)lVar26;
    uVar11 = uVar17 + uVar23;
    lVar1 = (ulonglong)uVar16 * (ulonglong)uVar11;
    uVar24 = (uint)lVar1;
    uVar17 = *(int *)(PTR_DAT_004d9050 + 4) * uVar16 +
             *(uint *)PTR_DAT_004d9050 * *(int *)(PTR_DAT_004d9050 + 0xc) +
             (int)((ulonglong)lVar26 >> 0x20) +
             *(int *)(PTR_DAT_004d9050 + 0x14) + (uint)CARRY4(uVar17,uVar23);
    uVar13 = (undefined4)((ulonglong)uVar17 * 0x7ffff >> 0x20);
    uVar11 = *(int *)(PTR_DAT_004d9050 + 0x14) +
             *(int *)(PTR_DAT_004d9050 + 0xc) * uVar11 +
             uVar16 * uVar17 + (int)((ulonglong)lVar1 >> 0x20) + (uint)CARRY4(uVar24,uVar23);
    uVar18 = (undefined4)((ulonglong)uVar11 * 0x7ffff >> 0x20);
    *(uint *)PTR_DAT_004d9050 = uVar24 + uVar23;
    *(uint *)(puVar3 + 4) = uVar11;
    uVar25 = FixedToFP(CONCAT44(uVar13,uVar13),0,1,0,0x20);
    iVar7 = 0x134;
    iVar14 = 0;
    iVar19 = 0;
    lVar26 = FixedToFP(CONCAT44(uVar18,uVar18),0,1,0,0x20);
    uVar25 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar25 >> 0x20),(float)uVar25 / fVar2),
                             0x4040000040400000,2,0x20);
    uVar25 = FloatVectorAdd(uVar25,0,2);
    uVar25 = FloatVectorNeg(uVar25,2,2);
    do {
      iVar21 = param_2 + iVar19;
      iVar19 = iVar19 + 0x24;
      *(undefined4 *)(iVar21 + 0x16c) = DAT_0052c000;
      *(undefined4 *)(iVar21 + 0x170) = DAT_0052c004;
      *(undefined4 *)(iVar21 + 0x174) = DAT_0052c008;
      *(undefined4 *)(iVar21 + 0x178) = DAT_0052bf00;
      *(undefined4 *)(iVar21 + 0x17c) = DAT_0052bf04;
      *(undefined4 *)(iVar21 + 0x180) = DAT_0052bf08;
      *(undefined4 *)(iVar21 + 0x184) = DAT_0052ce60;
      *(undefined4 *)(iVar21 + 0x188) = DAT_0052ce64;
      *(undefined4 *)(iVar21 + 0x18c) = DAT_0052ce68;
      iVar21 = param_2 + iVar14;
      iVar14 = iVar14 + 0xc;
      *(int *)(iVar21 + 0x15c) = (int)uVar25;
      *(undefined4 *)(iVar21 + 0x154) = 0;
      *(undefined4 *)(iVar21 + 0x158) = 0x40c00000;
      *(undefined4 *)(param_2 + iVar7) = local_7c;
      iVar21 = param_2 + iVar7;
      iVar7 = iVar7 + 0x10;
      *(undefined4 *)(iVar21 + 4) = local_78;
      *(undefined4 *)(iVar21 + 8) = local_74;
      *(undefined4 *)(iVar21 + 0xc) = local_70;
    } while (iVar19 != 0x48);
  }
  *(undefined4 *)(param_2 + 100) = 0;
  *(undefined4 *)(param_2 + 0x68) = 0x4b;
  puVar3 = PTR_DAT_004d9048;
  *(undefined4 *)(param_2 + 0x6c) = 4;
  *(undefined1 *)(param_2 + 0x3f) = 1;
  *(undefined4 *)(param_2 + 0x70) = 0;
  iVar7 = FUN_0001d10c((int)uVar25,(int)((ulonglong)uVar25 >> 0x20),(int)lVar26,
                       (int)((ulonglong)lVar26 >> 0x20),uVar10,puVar3);
  if (iVar7 != 0) {
    FUN_0001d10c(puVar3);
    puVar4 = PTR_DAT_004d907c;
    iVar7 = FUN_00064000(PTR_DAT_004d907c,3);
    if (iVar7 == 0) {
      FUN_0001d10c(puVar3);
      iVar7 = FUN_00063fe0(puVar4,*(undefined4 *)PTR_DAT_004d9068);
      if (iVar7 != 1) goto LAB_0000bd04;
    }
    *(undefined1 *)(param_2 + 0x3f) = 0;
  }
LAB_0000bd04:
  *(undefined4 *)(param_2 + 0x1b4) = 0;
  *(undefined1 *)(param_2 + 0x1b8) = 0;
  *(undefined1 *)(param_2 + 0x1ba) = 1;
  uVar10 = FUN_00021a34();
  *(undefined4 *)(param_2 + 0xd8) = uVar10;
  *(undefined4 *)(param_2 + 0xdc) = 0;
  *(undefined4 *)(param_2 + 0xe0) = 0xc1400000;
  *(undefined4 *)(param_2 + 0xe4) = 0;
  return;
}


```

## FUN_0004aaf8 — 0004aaf8

```c

void FUN_0004aaf8(int param_1,int param_2,undefined4 param_3)

{
  undefined *puVar1;
  void *pvVar2;
  undefined4 uVar3;
  int iVar4;
  size_t sVar5;
  int iVar6;
  char *pcVar7;
  undefined4 uVar8;
  undefined8 uVar9;
  undefined4 local_c8;
  undefined1 auStack_c4 [100];
  undefined1 auStack_60 [64];
  int local_20;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_20 = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0x27c) = 0;
  pvVar2 = operator_new__(0x20);
  *(void **)(param_1 + 0x54) = pvVar2;
  *(int *)(param_1 + 0x278) = param_2;
  *(undefined4 *)(param_1 + 0x24) = 0x42a00000;
  uVar3 = FUN_00025164();
  uVar9 = FloatVectorMult(CONCAT44(uVar3,uVar3),0x3f1000003f100000,2,0x20);
  *(int *)(param_1 + 0x28) = (int)uVar9;
  *(undefined4 *)(param_1 + 0x58) = param_3;
  *(undefined4 *)(param_1 + 0x18) = 0x42700000;
  *(undefined4 *)(param_1 + 0x1c) = 0x41500000;
  *(undefined4 *)(param_1 + 0x20) = 0;
  if (*(int *)(param_2 + 0x30) != 0) {
    FUN_002f702c((int)uVar9,auStack_60,0x40,"shop_n_dojo/%s.tex");
    FUN_0001cdb4(&local_c8,auStack_60);
    FUN_00026e98(param_1 + 0x274,local_c8);
    FUN_00026ed0(&local_c8);
  }
  iVar4 = *(int *)(param_1 + 0x278);
  if (*(int *)(iVar4 + 0xc) < 1) {
    pcVar7 = *(char **)(iVar4 + 0x18);
  }
  else {
    pcVar7 = *(char **)(iVar4 + 0x28);
    if (pcVar7 == (char *)0x0) {
      pcVar7 = *(char **)(iVar4 + 0x1c);
    }
    else {
      uVar8 = *(undefined4 *)(PTR_DAT_004d9048 + 0x5c);
      sVar5 = _strlen(pcVar7);
      uVar3 = FUN_002f69c4(pcVar7,sVar5);
      iVar4 = FUN_00027508(uVar8,uVar3);
      iVar6 = *(int *)(param_1 + 0x278);
      if ((0 < *(int *)(iVar6 + 0x2c)) && (iVar4 = *(int *)(iVar6 + 0x2c) - iVar4, iVar4 < 0)) {
        iVar4 = 0;
      }
      pcVar7 = *(char **)(iVar6 + 0x20);
      if ((pcVar7 == (char *)0x0) || (iVar4 != 1)) {
        _memcpy(auStack_c4,*(void **)(iVar6 + 0x1c),100);
        FUN_002f702c(param_1 + 0x5c,0x200,auStack_c4,iVar4);
        goto LAB_0004ac12;
      }
    }
  }
  _strcpy((char *)(param_1 + 0x5c),pcVar7);
LAB_0004ac12:
  DAT_005a7528 = FUN_00038844("CODE_SHOP_BLADE",0);
  DAT_005a752c = FUN_00038844("CODE_SHOP_BACKGROUND",0);
  DAT_005a7530 = 0;
  iVar4 = FUN_0002ede8();
  iVar6 = *(int *)(param_1 + 0x278);
  if ((iVar6 != 0) && (*(int *)(iVar4 + *(int *)(iVar6 + 0x10) * 4) == iVar6)) {
    *(undefined4 *)(param_1 + 0x260) = 0x3f800000;
  }
  if (*(char *)(iVar6 + 0x41) == '\0') {
    *(undefined4 *)(param_1 + 0x25c) = 0x3f800000;
  }
  if (*(int *)puVar1 != local_20) {
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

## FUN_000318dc — 000318dc

```c

void FUN_000318dc(int param_1)

{
  undefined *puVar1;
  undefined4 uVar2;
  undefined8 in_d0;
  undefined4 uVar3;
  undefined4 in_s3;
  undefined4 extraout_s3;
  undefined8 in_d2;
  undefined8 uVar4;
  undefined4 uVar5;
  undefined8 unaff_d11;
  undefined4 uVar6;
  undefined8 unaff_d14;
  undefined8 uVar7;
  undefined8 uVar8;
  undefined8 uVar9;
  undefined8 uVar10;
  undefined1 local_64;
  undefined1 local_63;
  undefined1 local_62;
  undefined1 local_61;
  
  if ((0.0 < *(float *)(param_1 + 0xa8)) && (*(int *)(param_1 + 0xac) != 0)) {
    uVar2 = (undefined4)((ulonglong)in_d2 >> 0x20);
    uVar7 = FixedToFP(CONCAT44(uVar2,*(undefined4 *)(*(int *)(param_1 + 0xac) + 0x2c)),0,1,0,0x20);
    uVar7 = FloatVectorMult(uVar7,0,2,0x20);
    uVar8 = FloatVectorMult(CONCAT44((int)((ulonglong)in_d0 >> 0x20),*(float *)(param_1 + 0xa8)),
                            CONCAT44(uVar2,*(undefined4 *)(*(int *)(PTR_DAT_004d9048 + 0x4c) + 0x24)
                                    ),2,0x20);
    uVar6 = *(undefined4 *)(*(int *)(param_1 + 0xac) + 0x2c);
    uVar7 = FloatVectorAdd(CONCAT44(in_s3,*(undefined4 *)(param_1 + 200)),uVar7,2);
    uVar8 = FloatVectorSub(0x3f8000003f800000,uVar8,2,0x20);
    uVar5 = *(undefined4 *)(*(int *)(param_1 + 0xac) + 0x30);
    uVar4 = FloatVectorAdd(uVar7,0,2);
    uVar7 = FloatVectorMult(uVar8,uVar8,2,0x20);
    uVar2 = FUN_000251a8();
    puVar1 = PTR_DAT_004d904c;
    uVar7 = FloatVectorAdd(uVar7,0xbf000000bf000000,2);
    uVar3 = *(undefined4 *)(*(int *)(param_1 + 0xac) + 0x30);
    uVar9 = FloatVectorMult(CONCAT44(uVar2,uVar2),0x3f0000003f000000,2,0x20);
    *(undefined4 *)(PTR_DAT_004d904c + 0x18d0) = 0x3f800000;
    uVar10 = FixedToFP(CONCAT44(extraout_s3,uVar3),0,1,0,0x20);
    *(undefined4 *)(puVar1 + 0x18cc) = 0;
    uVar8 = FixedToFP(CONCAT44((int)((ulonglong)unaff_d11 >> 0x20),uVar5),0,1,0,0x20);
    *(undefined4 *)(puVar1 + 0x18c0) = 0;
    uVar10 = FloatVectorMult(uVar7,uVar10,2,0x20);
    *(undefined4 *)(puVar1 + 0x18bc) = 0;
    uVar7 = FixedToFP(CONCAT44((int)((ulonglong)unaff_d14 >> 0x20),uVar6),0,1,0,0x20);
    *(undefined4 *)(puVar1 + 0x18b8) = 0;
    uVar10 = FloatVectorAdd(uVar9,uVar10,2);
    *(undefined4 *)(puVar1 + 0x18b4) = 0;
    *(undefined4 *)(puVar1 + 0x18b0) = 0;
    uVar10 = FloatVectorAdd(uVar10,0x3f8000003f800000,2);
    *(undefined4 *)(puVar1 + 0x18ac) = 0;
    *(undefined4 *)(puVar1 + 0x18a4) = 0;
    *(undefined4 *)(puVar1 + 0x18a0) = 0;
    *(undefined4 *)(puVar1 + 0x189c) = 0;
    *(undefined4 *)(puVar1 + 0x1898) = 0;
    *(int *)(puVar1 + 0x18c4) = (int)uVar4;
    *(int *)(puVar1 + 0x18a8) = (int)uVar8;
    *(int *)(puVar1 + 0x1894) = (int)uVar7;
    uVar7 = FloatVectorAdd(uVar10,0,2);
    *(int *)(puVar1 + 0x18c8) = (int)uVar7;
    *(int *)(puVar1 + 0x18d8) = *(int *)(puVar1 + 0x18d8) + 1;
    FUN_002eec0c((int)uVar7,puVar1,1);
    (**(code **)(**(int **)(param_1 + 0xac) + 8))();
    uVar2 = *(undefined4 *)PTR_DAT_004d9080;
    local_64 = (undefined1)uVar2;
    local_63 = (undefined1)((uint)uVar2 >> 8);
    local_62 = (undefined1)((uint)uVar2 >> 0x10);
    local_61 = (undefined1)((uint)uVar2 >> 0x18);
    FUN_0033a538(&local_64,0,0x3f800000,0,0x3f800000,0);
    (**(code **)(**(int **)(param_1 + 0xac) + 0xc))(*(int **)(param_1 + 0xac),1);
  }
  return;
}


```

## FUN_000218d8 — 000218d8

```c

void FUN_000218d8(void)

{
  undefined *puVar1;
  int *piVar2;
  uint uVar3;
  undefined4 uVar4;
  int iVar5;
  undefined4 uVar6;
  undefined4 local_24;
  
  puVar1 = PTR_DAT_004d9048;
  if (PTR_DAT_004d9048[10] == '\0') {
    if ((*(float *)(PTR_DAT_004d9048 + 0x24) <= 0.0) && (PTR_DAT_004d9048[0x17] == '\0')) {
      PTR_DAT_004d9048[10] = 1;
      DAT_005577a8 = 0;
      piVar2 = operator_new(0xb4);
      FUN_00047100();
      (**(code **)(*piVar2 + 8))(piVar2);
      FUN_0003e9e8(*(undefined4 *)(puVar1 + 0x4c),piVar2,0);
      if (*(int **)puVar1 != (int *)0x0) {
        (**(code **)(**(int **)puVar1 + 0x58))();
      }
      uVar3 = FUN_0000aae0("bean",0);
      local_24 = 0;
      uVar4 = FUN_000065c4();
      iVar5 = FUN_00006ad0(uVar4,1,&local_24);
      if (iVar5 != 0) {
        do {
          if (*(byte *)(iVar5 + 0x3c) == uVar3) {
            uVar6 = *(undefined4 *)(puVar1 + 0x5c);
            uVar4 = FUN_002f69c4("pause_with_bean",0xf);
            FUN_00027588(uVar6,"pause_with_bean",uVar4,1,0,1);
          }
          uVar4 = FUN_000065c4();
          iVar5 = FUN_00006af0(uVar4,1,&local_24);
        } while (iVar5 != 0);
      }
    }
  }
  return;
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

## FUN_000690f0 — 000690f0

```c

void FUN_000690f0(int param_1,undefined4 param_2)

{
  undefined *puVar1;
  undefined4 uVar2;
  int iVar3;
  _List_node_base *p_Var4;
  int iVar5;
  int iVar6;
  undefined4 *puVar7;
  undefined4 *puVar8;
  int iVar9;
  undefined *local_29c;
  int local_298;
  undefined1 *local_294;
  undefined4 local_290;
  undefined1 local_27c;
  undefined4 local_278;
  undefined4 local_274;
  undefined1 auStack_270 [40];
  undefined1 auStack_248 [40];
  undefined4 local_220;
  undefined4 local_21c;
  undefined1 auStack_218 [40];
  undefined1 auStack_1f0 [40];
  undefined *local_1c8;
  int local_1c4;
  undefined1 *local_1c0;
  undefined4 local_1bc;
  undefined1 local_1a8;
  undefined4 local_1a4;
  undefined4 local_1a0;
  undefined1 auStack_19c [40];
  undefined *local_174;
  int local_170;
  undefined1 *local_16c;
  undefined4 local_168;
  undefined1 local_154;
  undefined4 local_150;
  undefined4 local_14c;
  undefined1 auStack_148 [40];
  undefined *local_120;
  int local_11c;
  undefined1 *local_118;
  undefined4 local_114;
  undefined1 local_100;
  undefined4 local_fc;
  undefined4 local_f8;
  undefined1 auStack_f4 [40];
  undefined *local_cc;
  int local_c8;
  undefined1 *local_c4;
  undefined4 local_c0;
  undefined1 local_ac;
  undefined4 local_a8;
  undefined4 local_a4;
  undefined1 auStack_a0 [40];
  undefined1 auStack_78 [40];
  uint local_50 [8];
  undefined1 local_30;
  undefined4 local_2c;
  undefined4 local_28;
  int local_24;
  
  puVar1 = PTR_DAT_004d9048;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_1 + 0x20) = 0;
  uVar2 = FUN_0001cfb0(*(undefined4 *)(puVar1 + 0x654),"inGameChallengeMapScreen",0);
  *(undefined4 *)(param_1 + 4) = uVar2;
  *(undefined1 *)(param_1 + 0x24) = 1;
  *(undefined4 *)(param_1 + 0xc) = param_2;
  *(undefined4 *)(param_1 + 0x10) = 0xffffffff;
  FUN_0030f7cc(auStack_78,"challengeContainer.spinner");
  uVar2 = FUN_0039725c(uVar2,auStack_78);
  FUN_0030f7e0(auStack_78);
  FUN_0030f7cc(auStack_a0,"adventureNode_1");
  iVar3 = FUN_0039725c(uVar2,auStack_a0);
  FUN_0030f7e0(auStack_a0);
  if (iVar3 != 0) {
    local_a8 = 0x3e000000;
    local_a4 = 0x3e000000;
    FUN_0006bc4c(*(undefined4 *)(iVar3 + 0x748),&local_a8);
    puVar8 = (undefined4 *)(iVar3 + 0xb34);
    if (*(int *)(iVar3 + 0xb3c) == 0) {
      FUN_00022608(puVar8);
      *puVar8 = puVar8;
      *(undefined4 **)(iVar3 + 0xb38) = puVar8;
    }
    else {
      puVar7 = (undefined4 *)*puVar8;
      if (puVar7 != puVar8) {
        puVar7[0xb] = *(int *)(iVar3 + 0xb3c);
        puVar7[0xc] = 2;
        *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
        for (puVar7 = (undefined4 *)*puVar7; puVar7 != puVar8; puVar7 = (undefined4 *)*puVar7) {
          puVar7[0xb] = *(undefined4 *)(iVar3 + 0xb3c);
          puVar7[0xc] = 2;
          *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
        }
      }
    }
    local_ac = 1;
    local_cc = (undefined *)0x0;
    FUN_00022510(&local_cc);
    local_ac = 0;
    local_cc = &DAT_0052cc18;
    local_c0 = 0;
    local_c4 = &FUN_00069778_1;
    local_30 = 1;
    local_50[0] = 0;
    local_c8 = param_1;
    (*(code *)PTR_FUN_0052cc20)(&local_cc,local_50);
    local_2c = 0;
    local_28 = 0;
    p_Var4 = (_List_node_base *)FUN_0002256c(puVar8,local_50);
    std::_List_node_base::hook(p_Var4);
    FUN_00022510(local_50);
    if (*(int *)(iVar3 + 0xb3c) != 0) {
      iVar6 = *(int *)(iVar3 + 0xb38);
      *(int *)(iVar6 + 0x2c) = *(int *)(iVar3 + 0xb3c);
      *(undefined4 *)(iVar6 + 0x30) = 1;
      *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
    }
    FUN_00022510(&local_cc);
    local_50[0] = local_50[0] & 0xffffff00;
    FUN_0001da28(*(undefined4 *)(iVar3 + 0x264),local_50);
  }
  FUN_0030f7cc(auStack_f4,"adventureNode_2");
  iVar3 = FUN_0039725c(uVar2,auStack_f4);
  FUN_0030f7e0(auStack_f4);
  if (iVar3 != 0) {
    local_fc = 0x3e000000;
    local_f8 = 0x3e000000;
    FUN_0006bc4c(*(undefined4 *)(iVar3 + 0x748),&local_fc);
    puVar8 = (undefined4 *)(iVar3 + 0xb34);
    if (*(int *)(iVar3 + 0xb3c) == 0) {
      FUN_00022608(puVar8);
      *puVar8 = puVar8;
      *(undefined4 **)(iVar3 + 0xb38) = puVar8;
    }
    else {
      puVar7 = (undefined4 *)*puVar8;
      if (puVar7 != puVar8) {
        puVar7[0xb] = *(int *)(iVar3 + 0xb3c);
        puVar7[0xc] = 2;
        *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
        for (puVar7 = (undefined4 *)*puVar7; puVar7 != puVar8; puVar7 = (undefined4 *)*puVar7) {
          puVar7[0xb] = *(undefined4 *)(iVar3 + 0xb3c);
          puVar7[0xc] = 2;
          *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
        }
      }
    }
    local_100 = 1;
    local_120 = (undefined *)0x0;
    FUN_00022510(&local_120);
    local_100 = 0;
    local_120 = &DAT_0052cc18;
    local_114 = 0;
    local_118 = &FUN_0006981c_1;
    local_30 = 1;
    local_50[0] = 0;
    local_11c = param_1;
    (*(code *)PTR_FUN_0052cc20)(&local_120,local_50);
    local_2c = 0;
    local_28 = 0;
    p_Var4 = (_List_node_base *)FUN_0002256c(puVar8,local_50);
    std::_List_node_base::hook(p_Var4);
    FUN_00022510(local_50);
    if (*(int *)(iVar3 + 0xb3c) != 0) {
      iVar6 = *(int *)(iVar3 + 0xb38);
      *(int *)(iVar6 + 0x2c) = *(int *)(iVar3 + 0xb3c);
      *(undefined4 *)(iVar6 + 0x30) = 1;
      *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
    }
    FUN_00022510(&local_120);
    local_50[0] = local_50[0] & 0xffffff00;
    FUN_0001da28(*(undefined4 *)(iVar3 + 0x264),local_50);
  }
  FUN_0030f7cc(auStack_148,"adventureNode_3");
  iVar3 = FUN_0039725c(uVar2,auStack_148);
  FUN_0030f7e0(auStack_148);
  if (iVar3 != 0) {
    local_150 = 0x3e000000;
    local_14c = 0x3e000000;
    FUN_0006bc4c(*(undefined4 *)(iVar3 + 0x748),&local_150);
    puVar8 = (undefined4 *)(iVar3 + 0xb34);
    if (*(int *)(iVar3 + 0xb3c) == 0) {
      FUN_00022608(puVar8);
      *puVar8 = puVar8;
      *(undefined4 **)(iVar3 + 0xb38) = puVar8;
    }
    else {
      puVar7 = (undefined4 *)*puVar8;
      if (puVar7 != puVar8) {
        puVar7[0xb] = *(int *)(iVar3 + 0xb3c);
        puVar7[0xc] = 2;
        *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
        for (puVar7 = (undefined4 *)*puVar7; puVar7 != puVar8; puVar7 = (undefined4 *)*puVar7) {
          puVar7[0xb] = *(undefined4 *)(iVar3 + 0xb3c);
          puVar7[0xc] = 2;
          *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
        }
      }
    }
    local_154 = 1;
    local_174 = (undefined *)0x0;
    FUN_00022510(&local_174);
    local_154 = 0;
    local_174 = &DAT_0052cc18;
    local_168 = 0;
    local_16c = &FUN_000698c0_1;
    local_30 = 1;
    local_50[0] = 0;
    local_170 = param_1;
    (*(code *)PTR_FUN_0052cc20)(&local_174,local_50);
    local_2c = 0;
    local_28 = 0;
    p_Var4 = (_List_node_base *)FUN_0002256c(puVar8,local_50);
    std::_List_node_base::hook(p_Var4);
    FUN_00022510(local_50);
    if (*(int *)(iVar3 + 0xb3c) != 0) {
      iVar6 = *(int *)(iVar3 + 0xb38);
      *(int *)(iVar6 + 0x2c) = *(int *)(iVar3 + 0xb3c);
      *(undefined4 *)(iVar6 + 0x30) = 1;
      *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
    }
    FUN_00022510(&local_174);
    local_50[0] = local_50[0] & 0xffffff00;
    FUN_0001da28(*(undefined4 *)(iVar3 + 0x264),local_50);
  }
  FUN_0030f7cc(auStack_19c,"adventureNode_4");
  iVar3 = FUN_0039725c(uVar2,auStack_19c);
  FUN_0030f7e0(auStack_19c);
  if (iVar3 != 0) {
    local_1a4 = 0x3e000000;
    local_1a0 = 0x3e000000;
    FUN_0006bc4c(*(undefined4 *)(iVar3 + 0x748),&local_1a4);
    puVar8 = (undefined4 *)(iVar3 + 0xb34);
    if (*(int *)(iVar3 + 0xb3c) == 0) {
      FUN_00022608(puVar8);
      *puVar8 = puVar8;
      *(undefined4 **)(iVar3 + 0xb38) = puVar8;
    }
    else {
      puVar7 = (undefined4 *)*puVar8;
      if (puVar7 != puVar8) {
        puVar7[0xb] = *(int *)(iVar3 + 0xb3c);
        puVar7[0xc] = 2;
        *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
        for (puVar7 = (undefined4 *)*puVar7; puVar7 != puVar8; puVar7 = (undefined4 *)*puVar7) {
          puVar7[0xb] = *(undefined4 *)(iVar3 + 0xb3c);
          puVar7[0xc] = 2;
          *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
        }
      }
    }
    local_1a8 = 1;
    local_1c8 = (undefined *)0x0;
    FUN_00022510(&local_1c8);
    local_1a8 = 0;
    local_1c8 = &DAT_0052cc18;
    local_1bc = 0;
    local_1c0 = &FUN_00069964_1;
    local_30 = 1;
    local_50[0] = 0;
    local_1c4 = param_1;
    (*(code *)PTR_FUN_0052cc20)(&local_1c8,local_50);
    local_2c = 0;
    local_28 = 0;
    p_Var4 = (_List_node_base *)FUN_0002256c(puVar8,local_50);
    std::_List_node_base::hook(p_Var4);
    FUN_00022510(local_50);
    if (*(int *)(iVar3 + 0xb3c) != 0) {
      iVar6 = *(int *)(iVar3 + 0xb38);
      *(int *)(iVar6 + 0x2c) = *(int *)(iVar3 + 0xb3c);
      *(undefined4 *)(iVar6 + 0x30) = 1;
      *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
    }
    FUN_00022510(&local_1c8);
    local_50[0] = local_50[0] & 0xffffff00;
    FUN_0001da28(*(undefined4 *)(iVar3 + 0x264),local_50);
  }
  uVar2 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_1f0,"@map");
  iVar3 = FUN_0039725c(uVar2,auStack_1f0);
  FUN_0030f7e0(auStack_1f0);
  if (iVar3 != 0) {
    iVar6 = 1;
    do {
      iVar9 = 1;
      do {
        _sprintf(&DAT_005f9590,"challenge_%d_%d.challenge",iVar6,iVar9);
        FUN_0030f7cc(auStack_218,&DAT_005f9590);
        iVar5 = FUN_0039725c(iVar3,auStack_218);
        FUN_0030f7e0(auStack_218);
        if (iVar5 != 0) {
          local_220 = 0x3e000000;
          local_21c = 0x3e000000;
          FUN_0006bc4c(*(undefined4 *)(iVar5 + 0x748),&local_220);
        }
        iVar9 = iVar9 + 1;
      } while (iVar9 != 5);
      iVar6 = iVar6 + 1;
    } while (iVar6 != 5);
  }
  uVar2 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_248,"bossChallengeContainer.spinner");
  iVar3 = FUN_0039725c(uVar2,auStack_248);
  FUN_0030f7e0(auStack_248);
  if (iVar3 != 0) {
    FUN_0030f7cc(auStack_270,"adventureNode_1");
    iVar3 = FUN_0039725c(iVar3,auStack_270);
    FUN_0030f7e0(auStack_270);
    if (iVar3 != 0) {
      local_278 = 0x3e000000;
      local_274 = 0x3e000000;
      FUN_0006bc4c(*(undefined4 *)(iVar3 + 0x748),&local_278);
      puVar8 = (undefined4 *)(iVar3 + 0xb34);
      if (*(int *)(iVar3 + 0xb3c) == 0) {
        FUN_00022608(puVar8);
        *puVar8 = puVar8;
        *(undefined4 **)(iVar3 + 0xb38) = puVar8;
      }
      else {
        puVar7 = (undefined4 *)*puVar8;
        if (puVar7 != puVar8) {
          puVar7[0xb] = *(int *)(iVar3 + 0xb3c);
          puVar7[0xc] = 2;
          *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
          for (puVar7 = (undefined4 *)*puVar7; puVar7 != puVar8; puVar7 = (undefined4 *)*puVar7) {
            puVar7[0xb] = *(undefined4 *)(iVar3 + 0xb3c);
            puVar7[0xc] = 2;
            *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
          }
        }
      }
      local_27c = 1;
      local_29c = (undefined *)0x0;
      FUN_00022510(&local_29c);
      local_27c = 0;
      local_29c = &DAT_0052cc18;
      local_290 = 0;
      local_294 = &FUN_00069778_1;
      local_30 = 1;
      local_50[0] = 0;
      local_298 = param_1;
      (*(code *)PTR_FUN_0052cc20)(&local_29c,local_50);
      local_2c = 0;
      local_28 = 0;
      p_Var4 = (_List_node_base *)FUN_0002256c(puVar8,local_50);
      std::_List_node_base::hook(p_Var4);
      FUN_00022510(local_50);
      if (*(int *)(iVar3 + 0xb3c) != 0) {
        iVar6 = *(int *)(iVar3 + 0xb38);
        *(int *)(iVar6 + 0x2c) = *(int *)(iVar3 + 0xb3c);
        *(undefined4 *)(iVar6 + 0x30) = 1;
        *(int *)(iVar3 + 0xb40) = *(int *)(iVar3 + 0xb40) + 1;
      }
      FUN_00022510(&local_29c);
    }
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 == local_24) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

## FUN_00021110 — 00021110

```c

void FUN_00021110(int param_1)

{
  undefined *puVar1;
  byte bVar2;
  int iVar3;
  undefined4 uVar4;
  int iVar5;
  _List_node_base *p_Var6;
  undefined *puVar7;
  int *piVar8;
  int iVar9;
  undefined4 *puVar10;
  undefined4 *puVar11;
  undefined1 auStack_c4 [40];
  undefined *local_9c;
  undefined1 *local_98;
  undefined1 local_7c;
  undefined1 auStack_78 [40];
  undefined4 local_50 [8];
  undefined1 local_30;
  undefined4 local_2c;
  undefined4 local_28;
  int local_24;
  
  puVar7 = PTR_DAT_004d9048;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  if ((PTR_DAT_004d9048[10] != '\0') || (PTR_DAT_004d9048[0x1b1] == '\0')) goto LAB_00021378;
  *(undefined4 *)(PTR_DAT_004d9048 + 0x20) = 0;
  FUN_00040ebc(DAT_005577e0);
  FUN_0003ea08(*(undefined4 *)(puVar7 + 0x4c));
  FUN_0004f14c();
  puVar7 = PTR_DAT_004d9048;
  if (param_1 == 1) {
    FUN_0001d130(PTR_DAT_004d9048);
    FUN_0001d154(puVar7);
    puVar1 = PTR_DAT_004d9048;
    iVar3 = *(int *)(puVar7 + 0x10);
    if (iVar3 == 0) {
      uVar4 = FUN_0001ccec(PTR_DAT_004d9048);
      FUN_0007106c(uVar4,*(undefined4 *)(*(int *)(puVar1 + 0x5c) + 0x108),
                   *(undefined4 *)(*(int *)(puVar1 + 0x5c) + 0x10c));
      iVar3 = FUN_0001ccec(puVar1);
    }
    else {
      if (iVar3 != 1) {
        PTR_DAT_004d9048[0x17] = 0;
        goto LAB_00021308;
      }
      uVar4 = FUN_0001d10c(PTR_DAT_004d9048);
      FUN_000619d0(uVar4,*(undefined4 *)(puVar1 + 0x5c));
      iVar3 = FUN_0001d10c(puVar1);
    }
    iVar3 = *(int *)(iVar3 + 4);
    PTR_DAT_004d9048[0x17] = 0;
    if (iVar3 != 0) {
      FUN_0030f7cc(auStack_78,"@pause");
      iVar5 = FUN_0039725c(iVar3,auStack_78);
      FUN_0030f7e0(auStack_78);
      if (iVar5 != 0) {
        puVar11 = (undefined4 *)(iVar5 + 0xb34);
        if (*(int *)(iVar5 + 0xb3c) == 0) {
          FUN_00022608(puVar11);
          *puVar11 = puVar11;
          *(undefined4 **)(iVar5 + 0xb38) = puVar11;
        }
        else {
          puVar10 = (undefined4 *)*puVar11;
          if (puVar10 != puVar11) {
            puVar10[0xb] = *(int *)(iVar5 + 0xb3c);
            puVar10[0xc] = 2;
            *(int *)(iVar5 + 0xb40) = *(int *)(iVar5 + 0xb40) + 1;
            for (puVar10 = (undefined4 *)*puVar10; puVar10 != puVar11;
                puVar10 = (undefined4 *)*puVar10) {
              puVar10[0xb] = *(undefined4 *)(iVar5 + 0xb3c);
              puVar10[0xc] = 2;
              *(int *)(iVar5 + 0xb40) = *(int *)(iVar5 + 0xb40) + 1;
            }
          }
        }
        local_7c = 1;
        local_9c = (undefined *)0x0;
        FUN_00022510(&local_9c);
        local_7c = 0;
        local_9c = &DAT_0052c108;
        local_98 = &FUN_00021398_1;
        local_30 = 1;
        local_50[0] = 0;
        (*(code *)PTR_FUN_0052c110)(&local_9c,local_50);
        local_2c = 0;
        local_28 = 0;
        p_Var6 = (_List_node_base *)FUN_0002256c(puVar11,local_50);
        std::_List_node_base::hook(p_Var6);
        FUN_00022510(local_50);
        if (*(int *)(iVar5 + 0xb3c) != 0) {
          iVar9 = *(int *)(iVar5 + 0xb38);
          *(int *)(iVar9 + 0x2c) = *(int *)(iVar5 + 0xb3c);
          *(undefined4 *)(iVar9 + 0x30) = 1;
          *(int *)(iVar5 + 0xb40) = *(int *)(iVar5 + 0xb40) + 1;
        }
        FUN_00022510(&local_9c);
      }
      FUN_0030f7cc(auStack_c4,"@backgroundControl");
      iVar3 = FUN_0039725c(iVar3,auStack_c4);
      FUN_0030f7e0(auStack_c4);
      if (iVar3 != 0) {
        FUN_0007c97c(iVar3);
      }
    }
  }
LAB_00021308:
  if (*(int *)(PTR_DAT_004d9048 + 0x10) == 1) {
    if ((PTR_DAT_004d9048[0x17] != '\0') ||
       (iVar3 = (**(code **)(**(int **)PTR_DAT_004d9048 + 0x2c))(), iVar3 != 1)) goto LAB_00021378;
  }
  else if (*(int *)(PTR_DAT_004d9048 + 0x10) == 0) {
    puVar7 = PTR_DAT_004d9048;
    if (*(float *)(PTR_DAT_004d9048 + 0x24) == 0.0) {
      puVar7 = (undefined *)(uint)(byte)PTR_DAT_004d9048[0x17];
    }
    if ((*(float *)(PTR_DAT_004d9048 + 0x24) != 0.0 || ((uint)puVar7 & 0xff) != 0) ||
       (iVar3 = (**(code **)(**(int **)PTR_DAT_004d9048 + 0x2c))(), iVar3 == 0)) goto LAB_00021378;
  }
  piVar8 = operator_new(0xb4);
  FUN_00047100();
  (**(code **)(*piVar8 + 8))(piVar8);
  puVar7 = PTR_DAT_004d9048;
  FUN_0003e9e8(*(undefined4 *)(PTR_DAT_004d9048 + 0x4c),piVar8,0);
  bVar2 = FUN_0001cd6c();
  puVar7[10] = bVar2 ^ 1;
LAB_00021378:
  if (*(int *)PTR____stack_chk_guard_004d9044 == local_24) {
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

## FUN_00021398 — 00021398

```c

void FUN_00021398(undefined4 param_1,undefined1 *param_2)

{
  undefined1 uVar1;
  
  if (DAT_005f9408 == '\0') {
    if (*(float *)(PTR_DAT_004d9048 + 0x24) <= 0.0) {
      if (PTR_DAT_004d9048[0x17] == '\0' && PTR_DAT_004d9048[10] == '\0') {
        FUN_000218d8();
        goto LAB_000213dc;
      }
    }
    uVar1 = 0;
  }
  else {
LAB_000213dc:
    uVar1 = 1;
  }
  *param_2 = uVar1;
  return;
}


```

## FUN_000213e4 — 000213e4

```c

void FUN_000213e4(int param_1,float param_2,undefined4 param_3,undefined4 param_4)

{
  undefined *puVar1;
  undefined *puVar2;
  int iVar3;
  undefined4 uVar4;
  float fVar5;
  undefined1 auStack_5c [40];
  int local_34;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_34 = *(int *)PTR____stack_chk_guard_004d9044;
  iVar3 = FUN_0001cd48();
  puVar2 = PTR_DAT_004d9048;
  if (iVar3 == 1) {
    *(undefined4 *)(*(int *)(PTR_DAT_004d9048 + 0x5c) + 0xfc) = 0;
    if (*(int *)(puVar2 + 0x19c) != 0) {
      *(undefined4 *)(*(int *)(puVar2 + 0x19c) + 0x7c) = 0;
    }
  }
  fVar5 = (float)FUN_00040ebc(DAT_005577e0);
  puVar2 = PTR_DAT_004d9048;
  *(undefined4 *)(PTR_DAT_004d9048 + 0x20) = param_3;
  *(undefined4 *)(puVar2 + 0x24) = param_4;
  puVar2[0x17] = 0;
  if ((param_1 < 0) || (fVar5 = param_2, param_2 <= -1.0)) {
    FUN_0001d130(fVar5,puVar2);
    FUN_0001d154(puVar2);
    if (*(int *)(puVar2 + 0x10) == 0) {
      uVar4 = FUN_0001ccec(puVar2);
      FUN_0007106c(uVar4,*(undefined4 *)(*(int *)(puVar2 + 0x5c) + 0x108),
                   *(undefined4 *)(*(int *)(puVar2 + 0x5c) + 0x10c));
      iVar3 = FUN_0001ccec(puVar2);
      iVar3 = *(int *)(iVar3 + 4);
      if (iVar3 != 0) {
        FUN_0030f7cc(auStack_5c,"@backgroundControl");
        iVar3 = FUN_0039725c(iVar3,auStack_5c);
        FUN_0030f7e0(auStack_5c);
        if (iVar3 != 0) {
          FUN_0007c97c(iVar3);
        }
      }
    }
  }
  else {
    FUN_000209b8(param_1);
  }
  DAT_005577b0 = 0;
  FUN_0003ea08(*(undefined4 *)(puVar2 + 0x4c));
  if (*(int *)puVar1 != local_34) {
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

## FUN_00038844 — 00038844

```c

undefined4 FUN_00038844(undefined4 param_1,int param_2)

{
  undefined *puVar1;
  int iVar2;
  undefined4 *puVar3;
  
  puVar1 = PTR_DAT_004d9048;
  iVar2 = FUN_0030b7f0(PTR_DAT_004d9048 + param_2 * 0x6c + 0x5d8,param_1);
  if ((iVar2 != 0) &&
     (puVar3 = (undefined4 *)
               (*(int *)(puVar1 + param_2 * 0x6c + 0x630) + *(int *)(iVar2 + 0x24) * 0xc),
     puVar3 != (undefined4 *)0x0)) {
    param_1 = *puVar3;
  }
  return param_1;
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

## FUN_00018bf4 — 00018bf4

```c

bool FUN_00018bf4(int param_1,int param_2)

{
  int *piVar1;
  undefined4 uVar2;
  float fVar3;
  undefined4 extraout_s1;
  undefined8 uVar4;
  undefined1 auStack_28 [16];
  
  fVar3 = *(float *)(PTR_DAT_004d9048 + 0x24);
  if (fVar3 <= 0.0) {
    piVar1 = (int *)FUN_002eddd0(0);
    (**(code **)(*piVar1 + 0x84))(auStack_28);
    uVar4 = FloatVectorAdd(CONCAT44(extraout_s1,*(undefined4 *)(param_2 + 8)),0xbf000000bf000000,2);
    uVar2 = FUN_00025164();
    uVar4 = FloatVectorMult(uVar4,CONCAT44(uVar2,uVar2),2,0x20);
    *(int *)(param_1 + 0x10) = (int)uVar4;
  }
  return fVar3 <= 0.0;
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

## FUN_00020e70 — 00020e70

```c

bool FUN_00020e70(void)

{
  if (-1 < (int)((uint)(*(float *)(PTR_DAT_004d9048 + 0x24) < DAT_00020ea4) << 0x1f)) {
    return false;
  }
  return (int)((uint)(*(float *)(PTR_DAT_004d9048 + 0x24) < 1.0) << 0x1f) < 0;
}


```

## FUN_00018e60 — 00018e60

```c

void FUN_00018e60(int param_1)

{
  undefined *puVar1;
  byte bVar2;
  short sVar3;
  uint uVar4;
  undefined4 uVar5;
  int iVar6;
  int iVar7;
  float fVar8;
  undefined4 uVar9;
  undefined4 *puVar10;
  float fVar11;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined4 extraout_s1_03;
  ulonglong uVar12;
  undefined4 uVar14;
  uint extraout_s1_04;
  longlong lVar13;
  uint extraout_s1_05;
  uint extraout_s1_06;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  undefined4 extraout_s3_01;
  undefined4 extraout_s3_02;
  undefined4 extraout_s3_03;
  undefined4 uVar16;
  undefined8 uVar15;
  undefined4 uVar17;
  undefined4 extraout_s3_04;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  undefined4 extraout_s5_01;
  undefined4 extraout_s5_02;
  undefined4 extraout_s5_03;
  undefined8 uVar18;
  undefined4 extraout_s5_04;
  undefined4 extraout_s5_05;
  undefined4 extraout_s5_06;
  undefined4 extraout_s7;
  undefined4 extraout_s7_00;
  undefined4 extraout_s7_01;
  undefined4 extraout_s7_02;
  undefined4 extraout_s7_03;
  undefined8 uVar19;
  undefined4 extraout_s9;
  undefined4 extraout_s9_00;
  undefined4 extraout_s9_01;
  undefined4 extraout_s9_02;
  undefined4 extraout_s9_03;
  undefined4 extraout_s11;
  undefined4 extraout_s11_00;
  undefined4 extraout_s11_01;
  undefined4 extraout_s11_02;
  undefined4 extraout_s11_03;
  undefined4 uVar20;
  undefined4 extraout_s11_04;
  undefined8 unaff_d9;
  undefined8 unaff_d10;
  undefined8 unaff_d11;
  undefined8 unaff_d12;
  undefined8 uVar21;
  undefined8 uVar22;
  undefined8 uVar23;
  undefined8 uVar24;
  undefined8 uVar25;
  undefined8 uVar26;
  undefined8 uVar27;
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
  undefined4 local_a4;
  undefined4 local_a0;
  undefined4 local_9c;
  undefined4 local_98;
  undefined4 local_94;
  undefined4 local_90;
  undefined4 local_8c;
  undefined4 local_88;
  undefined4 local_84;
  undefined4 local_80;
  undefined4 local_7c;
  undefined4 local_78;
  undefined4 local_74;
  undefined4 local_70;
  undefined4 local_6c;
  undefined4 local_68;
  undefined4 local_64;
  
  puVar1 = PTR_DAT_004d9048;
  if (*(int **)PTR_DAT_004d9048 != (int *)0x0) {
    uVar4 = (**(code **)(**(int **)PTR_DAT_004d9048 + 0x28))();
    if (puVar1[10] == '\0') {
      uVar4 = uVar4 ^ 1;
    }
    if (puVar1[10] != '\0' || uVar4 != 0) {
      return;
    }
  }
  uVar5 = FUN_00052f80();
  iVar6 = FUN_0005809c(uVar5,0);
  if (iVar6 == 1) {
    iVar6 = *(int *)(param_1 + 0x94);
    if (*(int *)(param_1 + 0x94) == 0) {
      if (((DAT_005573d4 & 1) == 0) && (iVar6 = ___cxa_guard_acquire(&DAT_005573d4), iVar6 != 0)) {
        DAT_005573d0 = FUN_002f69c4("crit_hit_stars",0xe);
        ___cxa_guard_release(&DAT_005573d4);
      }
      uVar5 = FUN_00033ca0();
      iVar7 = FUN_00035a08(uVar5,DAT_005573d0,0,1);
      *(int *)(param_1 + 0x94) = iVar7;
      iVar6 = 0;
      if (iVar7 != 0) {
        *(undefined1 *)(iVar7 + 0x4c) = 1;
        iVar6 = iVar7;
      }
    }
    local_78 = *(undefined4 *)(param_1 + 0x10);
    local_74 = *(undefined4 *)(param_1 + 0x14);
    local_70 = *(undefined4 *)(param_1 + 0x18);
    FUN_000050f8(local_78,&local_6c,*(undefined4 *)(puVar1 + 0x58),&local_78,1,0);
    *(undefined4 *)(iVar6 + 8) = local_6c;
    *(undefined4 *)(iVar6 + 0xc) = local_68;
    *(undefined4 *)(iVar6 + 0x10) = local_64;
    uVar5 = extraout_s9_00;
    uVar20 = extraout_s11_00;
    uVar17 = extraout_s1_00;
    uVar14 = extraout_s5_00;
    uVar9 = extraout_s7_00;
    uVar16 = extraout_s3_00;
  }
  else {
    uVar5 = extraout_s9;
    uVar20 = extraout_s11;
    uVar17 = extraout_s1;
    uVar14 = extraout_s5;
    uVar9 = extraout_s7;
    uVar16 = extraout_s3;
    if (DAT_005d4d64 == '\0') {
      if (*(int *)(param_1 + 0x94) != 0) {
        uVar5 = FUN_00033ca0();
        FUN_00036f4c(uVar5,*(undefined4 *)(param_1 + 0x94));
        *(undefined4 *)(param_1 + 0x94) = 0;
        uVar5 = extraout_s9_02;
        uVar20 = extraout_s11_02;
        uVar17 = extraout_s1_02;
        uVar14 = extraout_s5_02;
        uVar9 = extraout_s7_02;
        uVar16 = extraout_s3_02;
      }
    }
    else if (*(int *)(param_1 + 0x94) == 0) {
      uVar5 = FUN_00033ca0();
      iVar6 = FUN_00035a08(uVar5,DAT_005d4d68,0,1);
      *(int *)(param_1 + 0x94) = iVar6;
      uVar5 = extraout_s9_01;
      uVar20 = extraout_s11_01;
      uVar17 = extraout_s1_01;
      uVar14 = extraout_s5_01;
      uVar9 = extraout_s7_01;
      uVar16 = extraout_s3_01;
      if (iVar6 != 0) {
        *(undefined1 *)(iVar6 + 0x4c) = 1;
      }
    }
  }
  if (0.0 < *(float *)(puVar1 + 0x24)) {
    return;
  }
  if (DAT_00557398 != '\x01') {
    return;
  }
  iVar6 = *(int *)(param_1 + 0x94);
  if (iVar6 != 0) {
    fVar11 = 1.0;
    *(undefined1 *)(iVar6 + 0x4d) = 1;
    if (puVar1[10] == '\0') {
      iVar7 = FUN_00052f80();
      iVar6 = *(int *)(param_1 + 0x94);
      fVar11 = 1.0 / *(float *)(iVar7 + 0x7c);
    }
    *(float *)(iVar6 + 0x2c) = fVar11;
    local_90 = *(undefined4 *)(param_1 + 0x10);
    local_8c = *(undefined4 *)(param_1 + 0x14);
    local_88 = *(undefined4 *)(param_1 + 0x18);
    FUN_000050f8(local_90,&local_84,*(undefined4 *)(puVar1 + 0x58),&local_90,1,0);
    *(undefined4 *)(iVar6 + 8) = local_84;
    *(undefined4 *)(iVar6 + 0xc) = local_80;
    *(undefined4 *)(iVar6 + 0x10) = local_7c;
    uVar5 = extraout_s9_03;
    uVar20 = extraout_s11_03;
    uVar17 = extraout_s1_03;
    uVar14 = extraout_s5_03;
    uVar9 = extraout_s7_03;
    uVar16 = extraout_s3_03;
  }
  puVar10 = (undefined4 *)(param_1 + 0x10);
  fVar11 = *(float *)(param_1 + 0xcc);
  uVar12 = CONCAT44(uVar17,*puVar10);
  uVar18 = FloatVectorSub(CONCAT44(uVar9,*(undefined4 *)(param_1 + 0x14)),
                          CONCAT44(uVar14,*(undefined4 *)(param_1 + 0xd0)),2,0x20);
  uVar19 = FloatVectorSub(uVar12,CONCAT44((int)((ulonglong)unaff_d12 >> 0x20),fVar11),2,0x20);
  uVar15 = FloatVectorSub(CONCAT44(uVar5,*(undefined4 *)(param_1 + 0x18)),
                          CONCAT44(uVar16,*(undefined4 *)(param_1 + 0xd4)),2,0x20);
  uVar21 = FloatVectorMult(uVar18,uVar18,2,0x20);
  uVar27 = FloatVectorMult(uVar19,uVar19,2,0x20);
  local_9c = (undefined4)uVar19;
  local_98 = (undefined4)uVar18;
  local_94 = (undefined4)uVar15;
  bVar2 = *(byte *)(param_1 + 0x50);
  uVar18 = FloatVectorAdd(uVar27,uVar21,2);
  if (bVar2 == 0) {
    uVar17 = (undefined4)((ulonglong)uVar15 >> 0x20);
    if (DAT_00019384 <= (float)uVar18) goto LAB_000190c8;
    iVar6 = 0;
    uVar14 = uVar17;
    if (DAT_00019380 < fVar11) goto LAB_000190be;
LAB_000190de:
    while( true ) {
      iVar7 = param_1 + iVar6;
      iVar6 = iVar6 + 0xc;
      *(int *)(iVar7 + 0xcc) = (int)uVar12;
      *(undefined4 *)(iVar7 + 0xd0) = *(undefined4 *)(param_1 + 0x14);
      *(undefined4 *)(iVar7 + 0xd4) = *(undefined4 *)(param_1 + 0x18);
      uVar14 = (undefined4)(uVar12 >> 0x20);
      if (iVar6 == 0x24) break;
      uVar12 = CONCAT44(uVar14,*puVar10);
    }
    uVar21 = FloatVectorSub(CONCAT44(uVar5,DAT_0052bfe0),
                            CONCAT44((int)((ulonglong)uVar18 >> 0x20),
                                     *(undefined4 *)(param_1 + 0xcc)),2,0x20);
    uVar18 = FloatVectorSub(CONCAT44((int)((ulonglong)uVar19 >> 0x20),DAT_0052bfe4),
                            CONCAT44(uVar17,*(undefined4 *)(param_1 + 0xd0)),2,0x20);
    uVar15 = FloatVectorSub(CONCAT44(uVar20,DAT_0052bfe8),
                            CONCAT44(uVar14,*(undefined4 *)(param_1 + 0xd4)),2,0x20);
    local_9c = (undefined4)uVar21;
    local_98 = (undefined4)uVar18;
    local_94 = (undefined4)uVar15;
    uVar4 = FUN_00009b50(local_94,&local_9c);
    uVar12 = (ulonglong)uVar4;
    *(undefined1 *)(param_1 + 0x51) = 0;
    iVar6 = *(int *)(puVar1 + 0x5c);
    if (iVar6 != 0) {
      uVar5 = FUN_002f69c4("slashes",7);
      uVar4 = FUN_00027588(iVar6,"slashes",uVar5,1,0,0);
      uVar12 = (ulonglong)uVar4;
    }
  }
  else {
    uVar17 = 0x41c80000;
    if ((float)uVar18 < 25.0) {
      uVar17 = 0x41c80000;
      uVar14 = 0x41c80000;
      if (DAT_00019380 < fVar11) {
LAB_000190be:
        uVar17 = uVar14;
        if (0 < *(int *)(param_1 + 0xb4)) goto LAB_00019360;
      }
    }
LAB_000190c8:
    iVar6 = 0;
    if (fVar11 <= DAT_00019380) goto LAB_000190de;
  }
  uVar17 = local_94;
  uVar20 = local_98;
  uVar5 = local_9c;
  *(int *)(param_1 + 0x48) = *(int *)(param_1 + 0xb4) + -2;
  local_a8 = local_9c;
  local_a4 = local_98;
  local_a0 = local_94;
  fVar8 = (float)FUN_00009b50((int)uVar12,&local_a8);
  uVar9 = FUN_0001938c(param_1);
  uVar19 = CONCAT44((int)((ulonglong)unaff_d11 >> 0x20),*(undefined4 *)(param_1 + 0xcc));
  uVar18 = CONCAT44((int)((ulonglong)unaff_d10 >> 0x20),*(undefined4 *)(param_1 + 0xd0));
  uVar15 = CONCAT44((int)((ulonglong)unaff_d9 >> 0x20),*(undefined4 *)(param_1 + 0xd4));
  uVar4 = extraout_s1_04;
  uVar14 = extraout_s5_04;
  if ((DAT_00019388 < fVar8) && (DAT_00019380 < fVar11)) {
    uVar22 = FloatVectorSub(0x3f8000003f800000,CONCAT44(uVar9,uVar9),2,0x20);
    lVar13 = CONCAT44(extraout_s1_04,local_a8);
    uVar21 = CONCAT44(extraout_s11_04,DAT_00019388);
    uVar27 = CONCAT44(extraout_s11_04,DAT_00019388);
    uVar23 = FloatVectorMult(CONCAT44(extraout_s5_04,local_a0),
                             CONCAT44(extraout_s11_04,DAT_00019388),2,0x20);
    uVar24 = FloatVectorMult(CONCAT44(extraout_s3_04,local_a4),
                             CONCAT44(extraout_s11_04,DAT_00019388),2,0x20);
    uVar25 = FloatVectorMult(lVar13,CONCAT44(extraout_s11_04,DAT_00019388),2,0x20);
    do {
      uVar26 = FloatVectorMult(uVar22,CONCAT44((int)((ulonglong)lVar13 >> 0x20),
                                               (float)uVar21 / fVar8),2,0x20);
      local_c0 = uVar5;
      local_bc = uVar20;
      local_b8 = uVar17;
      uVar26 = FloatVectorAdd(CONCAT44(uVar9,uVar9),uVar26,2);
      uVar15 = FloatVectorAdd(uVar15,uVar23,2);
      uVar19 = FloatVectorAdd(uVar19,uVar25,2);
      uVar18 = FloatVectorAdd(uVar18,uVar24,2);
      local_b4 = (undefined4)uVar19;
      local_b0 = (undefined4)uVar18;
      local_ac = (undefined4)uVar15;
      FUN_0001943c((int)uVar26,param_1,&local_b4,&local_c0,(int)uVar26);
      lVar13 = (ulonglong)extraout_s1_05 << 0x20;
      uVar21 = FloatVectorAdd(uVar21,uVar27,2);
      uVar4 = extraout_s1_05;
      uVar14 = extraout_s5_05;
    } while ((int)((uint)((float)uVar21 < fVar8) << 0x1f) < 0);
  }
  if ((*(int *)(param_1 + 0x94) != 0) && (DAT_005d4d64 == '\x02')) {
    sVar3 = FUN_0030113c(uVar5,uVar20);
    uVar4 = FUN_003010b8(-sVar3);
    *(uint *)(*(int *)(param_1 + 0x94) + 0x34) = uVar4 ^ 0x80000000;
    uVar5 = FUN_003010d0(-sVar3);
    *(undefined4 *)(*(int *)(param_1 + 0x94) + 0x30) = uVar5;
    uVar4 = extraout_s1_06;
    uVar14 = extraout_s5_06;
  }
  local_cc = *puVar10;
  uVar19 = FloatVectorSub(CONCAT44(uVar4,local_cc),uVar19,2,0x20);
  local_c8 = *(undefined4 *)(param_1 + 0x14);
  uVar18 = FloatVectorSub(CONCAT44(uVar14,local_c8),uVar18,2,0x20);
  local_c4 = *(undefined4 *)(param_1 + 0x18);
  local_d8 = (undefined4)uVar19;
  uVar15 = FloatVectorSub(CONCAT44(uVar14,local_c4),uVar15,2,0x20);
  local_d4 = (undefined4)uVar18;
  local_d0 = (undefined4)uVar15;
  FUN_0001943c(local_d8,param_1,&local_cc,&local_d8,0x3f800000);
  iVar6 = 0;
  do {
    iVar7 = param_1 + iVar6;
    iVar6 = iVar6 + -0xc;
    *(undefined4 *)(iVar7 + 0xe4) = *(undefined4 *)(iVar7 + 0xd8);
    *(undefined4 *)(iVar7 + 0xe8) = *(undefined4 *)(iVar7 + 0xdc);
    *(undefined4 *)(iVar7 + 0xec) = *(undefined4 *)(iVar7 + 0xe0);
  } while (iVar6 != -0x18);
  *(undefined4 *)(param_1 + 0xcc) = *(undefined4 *)(param_1 + 0x10);
  *(undefined4 *)(param_1 + 0xd0) = *(undefined4 *)(param_1 + 0x14);
  *(undefined4 *)(param_1 + 0xd4) = *(undefined4 *)(param_1 + 0x18);
  *(int *)(param_1 + 0x4c) = *(int *)(param_1 + 0xb4) + -2;
  bVar2 = *(byte *)(param_1 + 0x50);
LAB_00019360:
  *(byte *)(param_1 + 0x50) = bVar2 | 1;
  return;
}


```

## FUN_00050f50 — 00050f50

```c

undefined4 FUN_00050f50(int param_1,uint param_2)

{
  char cVar1;
  undefined *puVar2;
  undefined *puVar3;
  undefined *puVar4;
  byte bVar5;
  int iVar6;
  undefined4 uVar7;
  char *pcVar8;
  undefined4 extraout_s0;
  undefined4 extraout_s0_00;
  float fVar9;
  undefined4 extraout_s1;
  longlong lVar10;
  undefined4 extraout_s1_00;
  undefined8 uVar11;
  uint extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined4 extraout_s1_03;
  undefined4 extraout_s1_04;
  undefined4 extraout_s1_05;
  undefined4 extraout_s1_06;
  uint extraout_s3;
  uint extraout_s3_00;
  undefined4 extraout_s3_01;
  undefined4 extraout_s3_02;
  ulonglong uVar12;
  undefined4 extraout_s3_03;
  undefined4 uVar13;
  undefined8 unaff_d8;
  longlong lVar14;
  undefined8 unaff_d9;
  undefined4 uVar15;
  undefined8 uVar16;
  undefined8 uVar17;
  undefined **local_58;
  undefined *local_54;
  undefined1 local_38;
  int local_34;
  
  puVar2 = PTR____stack_chk_guard_004d9044;
  uVar15 = (undefined4)((ulonglong)unaff_d9 >> 0x20);
  local_34 = *(int *)PTR____stack_chk_guard_004d9044;
  iVar6 = FUN_0001cd48();
  uVar7 = extraout_s0;
  if (iVar6 != 1) goto LAB_000513ac;
  uVar7 = FUN_00025164();
  uVar13 = *(undefined4 *)(param_1 + 0x20);
  iVar6 = FUN_0001cd48();
  lVar14 = (ulonglong)extraout_s3 << 0x20;
  if (iVar6 != 1) {
    *(undefined4 *)(param_1 + 0x34) = 0;
    *(undefined4 *)(*(int *)(PTR_DAT_004d9048 + 0x5c) + 0xfc) = 0xbf800000;
    uVar7 = extraout_s0_00;
    goto LAB_000513ac;
  }
  uVar11 = CONCAT44(extraout_s1,DAT_00051358);
  uVar16 = FloatVectorSub(CONCAT44((int)((ulonglong)unaff_d8 >> 0x20),uVar13),CONCAT44(uVar7,uVar7),
                          2,0x20);
  *(undefined4 *)(param_1 + 0x34) = 1;
  puVar3 = PTR_DAT_004d9048;
  uVar16 = FloatVectorMult(uVar16,0x3f0000003f000000,2,0x20);
  lVar10 = FloatVectorAdd(uVar16,uVar11,2);
  *(int *)(param_1 + 8) = (int)lVar10;
  if ((puVar3[10] == '\0' && puVar3[0x17] == '\0') &&
     ((puVar3[0xab] == '\0' || (puVar3[0x1bf] != '\0')))) {
    lVar14 = CONCAT44(param_2,param_2);
    if (*(float *)(param_1 + 0xc0) <= 0.0) {
      lVar10 = FloatVectorAdd(CONCAT44((int)((ulonglong)lVar10 >> 0x20),
                                       *(undefined4 *)(param_1 + 0x7c)),lVar14,2);
      uVar11 = FPToFixed(lVar10,0,0,3,0x20);
      *(int *)(param_1 + 0x7c) = (int)lVar10;
      iVar6 = (int)uVar11 % 6;
      uVar11 = FixedToFP(CONCAT44(iVar6,iVar6),0,0,0,0x20);
      lVar14 = FloatVectorAdd(uVar11,0x3f0000003f000000,2);
      *(int *)(param_1 + 0xc4) = (int)lVar14;
    }
    else {
      cVar1 = *(char *)(param_1 + 0x5c);
      iVar6 = FUN_0001cd30();
      if (iVar6 == 1) {
        iVar6 = FUN_00031290();
        if (0.0 < *(float *)(iVar6 + 0x68)) {
          uVar11 = FPToFixed(CONCAT44(extraout_s1_00,*(float *)(iVar6 + 0x68)),0,0,3,0x20);
          *(undefined4 *)(param_1 + 0x5c) = 0xffff6464;
          FUN_002f702c(param_1 + 200,0x40,"+%i",(int)uVar11 + 1);
          lVar14 = (ulonglong)extraout_s3_00 << 0x20;
          lVar10 = (ulonglong)extraout_s1_01 << 0x20;
          goto LAB_000512c4;
        }
      }
      uVar15 = 0;
      *(undefined1 *)(param_1 + 200) = 0;
      iVar6 = FUN_0004eb70();
      if (iVar6 != 0) {
        lVar14 = (ulonglong)param_2 << 0x20;
      }
      iVar6 = FUN_0001cd30();
      if (iVar6 == 1) {
        iVar6 = FUN_00031290();
        uVar11 = FloatVectorMult(lVar14,CONCAT44(extraout_s3_01,*(undefined4 *)(iVar6 + 0x6c)),2,
                                 0x20);
        uVar11 = FloatVectorSub(CONCAT44(extraout_s1_03,*(undefined4 *)(param_1 + 0x7c)),uVar11,2,
                                0x20);
      }
      else {
        uVar11 = FloatVectorSub(CONCAT44(extraout_s1_02,*(undefined4 *)(param_1 + 0x7c)),lVar14,2,
                                0x20);
      }
      uVar7 = 0x3f000000;
      fVar9 = (float)uVar11;
      *(float *)(param_1 + 0x7c) = fVar9;
      if ((int)((uint)(fVar9 < 0.5) << 0x1f) < 0) {
        if (*(int *)(puVar3 + 0x10) != 1) {
          FUN_000209b8(0xffffffff,0xbf800000,0xffffffff);
          uVar7 = extraout_s3_02;
        }
        puVar4 = PTR_DAT_004d90f8;
        uVar11 = 0;
        *(undefined4 *)PTR_DAT_004d90fc = 0;
        *(undefined4 *)puVar4 = 0xffffffff;
        *(undefined4 *)(param_1 + 0x7c) = 0;
        *(undefined4 *)(param_1 + 0x5c) = 0xffff6464;
      }
      else {
        if ((int)((uint)(fVar9 < 3.0) << 0x1f) < 0) {
          uVar16 = 0x4100000041000000;
LAB_0005117c:
          uVar16 = FloatVectorMult(uVar11,uVar16,2,0x20);
LAB_00051180:
          uVar12 = FPToFixed(uVar16,0,0,3,0x20);
          uVar7 = *(undefined4 *)PTR_DAT_004d9080;
          if ((uVar12 & 1) != 0) {
            uVar7 = 0xffff6464;
          }
          *(char *)(param_1 + 0x5f) = (char)((uint)uVar7 >> 0x18);
          *(char *)(param_1 + 0x5e) = (char)((uint)uVar7 >> 0x10);
          *(char *)(param_1 + 0x5d) = (char)((uint)uVar7 >> 8);
          *(char *)(param_1 + 0x5c) = (char)uVar7;
        }
        else {
          uVar12 = 0x40c0000040c00000;
          if ((int)((uint)(fVar9 < 6.0) << 0x1f) < 0) {
            if (*(int *)(puVar3 + 0x10) != 1) {
              uVar16 = 0x4080000040800000;
              goto LAB_0005117c;
            }
          }
          else {
            uVar12 = 0x4130000041300000;
            if (((int)((uint)(fVar9 < 11.0) << 0x1f) < 0) && (*(int *)(puVar3 + 0x10) != 1)) {
              uVar16 = FloatVectorAdd(uVar11,uVar11,2);
              goto LAB_00051180;
            }
          }
        }
        bVar5 = DAT_0052c840;
        uVar7 = (undefined4)(uVar12 >> 0x20);
        if (((0.0 < fVar9) && (uVar7 = 0x41300000, (int)((uint)(fVar9 < 11.0) << 0x1f) < 0)) &&
           (cVar1 != *(char *)(param_1 + 0x5c))) {
          uVar7 = *(undefined4 *)(puVar3 + 0x1a4);
          DAT_0052c840 = DAT_0052c840 ^ 1;
          local_38 = 1;
          local_58 = (undefined **)0x0;
          FUN_0000a298(&local_58);
          local_38 = 0;
          local_58 = &PTR_LAB_0052bf38;
          local_54 = PTR_FUN_004d9058;
          pcVar8 = "Time-tock";
          if (bVar5 != 1) {
            pcVar8 = "Time-tick";
          }
          FUN_0002bc94(uVar7,pcVar8,0x3f800000,0x3f800000,&local_58,0);
          FUN_0000a298(&local_58);
          uVar11 = CONCAT44(extraout_s1_04,*(undefined4 *)(param_1 + 0x7c));
          uVar7 = extraout_s3_03;
        }
      }
      lVar14 = CONCAT44(uVar7,*(undefined4 *)(param_1 + 0xc0));
      uVar11 = FloatVectorSub(lVar14,uVar11,2,0x20);
      uVar11 = FPToFixed(uVar11,0,0,3,0x20);
      iVar6 = (int)uVar11 % 6;
      uVar11 = FixedToFP(CONCAT44(iVar6,iVar6),0,0,0,0x20);
      lVar10 = FloatVectorAdd(uVar11,0x3f0000003f000000,2);
      *(int *)(param_1 + 0xc4) = (int)lVar10;
    }
  }
LAB_000512c4:
  fVar9 = DAT_000513d0;
  *(undefined4 *)(*(int *)(puVar3 + 0x5c) + 0xfc) = *(undefined4 *)(param_1 + 0x7c);
  uVar11 = FPToFixed(CONCAT44((int)((ulonglong)lVar14 >> 0x20),*(float *)(param_1 + 0x7c) / fVar9),0
                     ,0,3,0x20);
  if ((int)uVar11 < 1) {
    lVar14 = FPToFixed(CONCAT44((int)((ulonglong)lVar10 >> 0x20),*(float *)(param_1 + 0x7c)),0,0,3,
                       0x20);
    iVar6 = (int)((ulonglong)((longlong)(int)lVar14 * -0x77777777 + (lVar14 << 0x20)) >> 0x20);
    FUN_002f702c((undefined1 *)(param_1 + 0x80),0x40,"%i",
                 (int)lVar14 + ((iVar6 >> 5) - (iVar6 >> 0x1f)) * -0x3c);
  }
  else {
    *(undefined1 *)(param_1 + 0x80) = 0;
  }
  iVar6 = FUN_0001cd70();
  uVar11 = CONCAT44(extraout_s1_05,*(undefined4 *)(puVar3 + 0x20));
  uVar16 = FloatVectorAbsolute(uVar11,4);
  if (iVar6 == 1) {
    uVar17 = 0x3f8000003f800000;
    uVar11 = FloatVectorMult(uVar16,CONCAT44(extraout_s1_05,DAT_000513d4),2,0x20);
    uVar11 = FloatVectorAdd(uVar11,CONCAT44(extraout_s1_05,*(undefined4 *)(param_1 + 8)),2);
    *(int *)(param_1 + 8) = (int)uVar11;
  }
  else {
    uVar17 = FloatVectorSub(0x3f8000003f800000,uVar16,2,0x20);
  }
  uVar13 = *(undefined4 *)(*(int *)(puVar3 + 0x4c) + 0x24);
  uVar7 = FUN_000251a8((int)uVar11);
  uVar11 = CONCAT44(extraout_s1_06,*(undefined4 *)(param_1 + 0x24));
  uVar11 = FloatVectorAdd(uVar11,uVar11,2);
  uVar16 = FloatVectorMult(uVar17,CONCAT44(uVar15,uVar13),2,0x20);
  uVar17 = FloatVectorAdd(CONCAT44(uVar7,uVar7),uVar11,2);
  uVar11 = FloatVectorMult(uVar16,uVar11,2,0x20);
  uVar16 = FloatVectorMult(uVar17,0x3f0000003f000000,2,0x20);
  uVar16 = FloatVectorAdd(uVar16,0xc0a00000c0a00000,2);
  uVar11 = FloatVectorSub(uVar16,uVar11,2,0x20);
  uVar11 = FloatVectorAdd(uVar11,0xc0400000c0400000,2);
  uVar7 = (undefined4)uVar11;
  *(undefined4 *)(param_1 + 0xc) = uVar7;
LAB_000513ac:
  if (*(int *)puVar2 != local_34) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return uVar7;
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

## FUN_00020698 — 00020698

```c

void FUN_00020698(int param_1,int param_2)

{
  float fVar1;
  undefined *puVar2;
  undefined4 uVar3;
  int *piVar4;
  int iVar5;
  float fVar6;
  undefined8 uVar7;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined8 uVar8;
  undefined4 extraout_s3;
  undefined8 uVar9;
  undefined4 extraout_s5;
  undefined4 extraout_s7;
  undefined4 extraout_s9;
  undefined4 extraout_s11;
  undefined8 uVar10;
  undefined4 local_50;
  undefined4 local_4c;
  float local_48;
  undefined4 local_44;
  
  iVar5 = 0;
  do {
    FUN_00018d2c((&DAT_0055781c)[iVar5]);
    iVar5 = iVar5 + 1;
  } while (iVar5 != 0x10);
  iVar5 = FUN_0001cd2c();
  local_44 = 0;
  uVar3 = FUN_000065c4();
  piVar4 = (int *)FUN_00006ad0(uVar3,2,&local_44);
  if (piVar4 != (int *)0x0) {
    do {
      if ((param_2 != 0 || iVar5 != 0) || ((float)piVar4[0x30] <= 0.0)) {
        uVar3 = FUN_000251a8();
        uVar7 = FloatVectorMult(CONCAT44(uVar3,uVar3),0xbfc00000bfc00000,2,0x20);
        piVar4[5] = (int)uVar7;
        piVar4[8] = -0x40400000;
        FUN_00008a50((int)uVar7,piVar4,0);
        (**(code **)(*piVar4 + 0x10))(piVar4,0);
      }
      uVar3 = FUN_000065c4();
      piVar4 = (int *)FUN_00006af0(uVar3,2,&local_44);
    } while (piVar4 != (int *)0x0);
  }
  uVar3 = FUN_000065c4();
  FUN_00006ad0(uVar3,0,&local_44);
  uVar3 = FUN_000065c4();
  piVar4 = (int *)FUN_00006ad0(uVar3,1,&local_44);
  puVar2 = PTR_DAT_004d9048;
  fVar1 = DAT_000208ec;
  if (piVar4 != (int *)0x0) {
    do {
      if (((char)piVar4[0x6e] == '\0') &&
         ((param_2 != 0 || iVar5 != 0 || ((float)piVar4[0x34] <= 0.0)))) {
        FUN_0000f274(piVar4,0);
        if ((puVar2[0x18] == '\0') && (param_1 != 1)) {
          if ((char)piVar4[0x6f] == '\0') {
            uVar9 = FloatVectorSub(CONCAT44(extraout_s7,DAT_00557804),
                                   CONCAT44(extraout_s5,piVar4[4]),2,0x20);
            uVar8 = FloatVectorSub(CONCAT44(extraout_s9,DAT_00557808),
                                   CONCAT44(extraout_s3,piVar4[5]),2,0x20);
            uVar7 = FloatVectorSub(CONCAT44(extraout_s11,DAT_0055780c),
                                   CONCAT44(extraout_s1_00,piVar4[6]),2,0x20);
            uVar10 = FloatVectorMult(uVar9,uVar9,2,0x20);
            local_50 = (undefined4)uVar9;
            uVar9 = FloatVectorMult(uVar8,uVar8,2,0x20);
            local_4c = (undefined4)uVar8;
            uVar8 = FloatVectorMult(uVar7,uVar7,2,0x20);
            local_48 = (float)uVar7;
            uVar7 = FloatVectorAdd(uVar10,uVar9,2);
            uVar7 = FloatVectorAdd(uVar8,uVar7,2);
            fVar6 = (float)uVar7;
            if (fVar1 < fVar6) {
              FUN_00009b50();
              uVar7 = FloatVectorMult(CONCAT44(extraout_s1,local_50),0x41a0000041a00000,2,0x20);
              local_50 = (undefined4)uVar7;
              uVar7 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar7 >> 0x20),local_4c),
                                      0x41a0000041a00000,2,0x20);
              local_4c = (undefined4)uVar7;
              uVar7 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar7 >> 0x20),local_48),
                                      0x41a0000041a00000,2,0x20);
              fVar6 = (float)uVar7;
              local_48 = fVar6;
            }
            (**(code **)(*piVar4 + 0x24))(fVar6,piVar4,0,0,0,&local_50);
            FUN_0000e6a4(piVar4);
          }
        }
        else {
          *(undefined1 *)(piVar4 + 0x6f) = 1;
        }
        uVar3 = FUN_000251a8();
        uVar7 = FloatVectorMult(CONCAT44(uVar3,uVar3),0xbfc00000bfc00000,2,0x20);
        piVar4[5] = (int)uVar7;
        piVar4[8] = -0x40400000;
        uVar3 = FUN_000251a8((int)uVar7);
        uVar7 = FloatVectorMult(CONCAT44(uVar3,uVar3),0xbfc00000bfc00000,2,0x20);
        piVar4[0x48] = (int)uVar7;
        piVar4[0x4b] = -0x40400000;
        (**(code **)(*piVar4 + 0x10))((int)uVar7,piVar4,0);
      }
      uVar3 = FUN_000065c4();
      piVar4 = (int *)FUN_00006af0(uVar3,1,&local_44);
    } while (piVar4 != (int *)0x0);
  }
  iVar5 = FUN_0001cd70();
  if (iVar5 == 1) {
    FUN_0001bd80();
  }
  return;
}


```

## FUN_0001878c — 0001878c

```c

void FUN_0001878c(int param_1)

{
  longlong lVar1;
  undefined *puVar2;
  undefined *puVar3;
  undefined4 uVar4;
  int iVar5;
  uint uVar6;
  uint uVar7;
  uint *puVar8;
  int *piVar9;
  int *piVar10;
  undefined4 extraout_s1;
  undefined4 extraout_s3;
  undefined4 uVar13;
  undefined8 unaff_d8;
  undefined8 uVar14;
  undefined4 local_90 [8];
  undefined1 local_70;
  undefined1 auStack_6c [64];
  int local_2c;
  uint *puVar11;
  int *piVar12;
  
  puVar2 = PTR____stack_chk_guard_004d9044;
  local_2c = *(int *)PTR____stack_chk_guard_004d9044;
  uVar4 = FUN_0002ede8();
  iVar5 = FUN_00030594(uVar4,0x3f800000,0x3f800000);
  puVar3 = PTR_DAT_004d9050;
  if (iVar5 == 0) {
    lVar1 = (ulonglong)*(uint *)PTR_DAT_004d9050 * (ulonglong)*(uint *)(PTR_DAT_004d9050 + 8);
    uVar6 = (uint)lVar1;
    uVar7 = *(int *)(PTR_DAT_004d9050 + 4) * *(uint *)(PTR_DAT_004d9050 + 8) +
            *(uint *)PTR_DAT_004d9050 * *(int *)(PTR_DAT_004d9050 + 0xc) +
            (int)((ulonglong)lVar1 >> 0x20) +
            *(int *)(PTR_DAT_004d9050 + 0x14) +
            (uint)CARRY4(uVar6,*(uint *)(PTR_DAT_004d9050 + 0x10));
    *(uint *)PTR_DAT_004d9050 = uVar6 + *(uint *)(PTR_DAT_004d9050 + 0x10);
    *(uint *)(puVar3 + 4) = uVar7;
    FUN_002f702c(auStack_6c,0x40,"Sword-swipe-%d",(int)((ulonglong)uVar7 * 6 >> 0x20) + 1);
    uVar4 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
    uVar13 = *(undefined4 *)(*(int *)(PTR_DAT_004d9048 + 0x4c) + 0x24);
    local_70 = 1;
    local_90[0] = 0;
    FUN_0000a298(local_90);
    uVar14 = FloatVectorMult(CONCAT44((int)((ulonglong)unaff_d8 >> 0x20),uVar13),
                             CONCAT44(extraout_s3,DAT_000188c8),2,0x20);
    uVar14 = FloatVectorAdd(uVar14,CONCAT44(extraout_s1,DAT_000188cc),2);
    FUN_0002bb34(uVar4,auStack_6c,0x3f800000,(int)uVar14,local_90,0);
    FUN_0000a298(local_90);
  }
  puVar3 = PTR_DAT_004d9050;
  puVar8 = (uint *)(PTR_DAT_004d9050 + 8);
  uVar6 = *(uint *)PTR_DAT_004d9050;
  piVar9 = (int *)(PTR_DAT_004d9050 + 4);
  piVar10 = (int *)(PTR_DAT_004d9050 + 0xc);
  puVar11 = (uint *)(PTR_DAT_004d9050 + 0x10);
  piVar12 = (int *)(PTR_DAT_004d9050 + 0x14);
  lVar1 = (ulonglong)uVar6 * (ulonglong)*puVar8;
  uVar7 = (uint)lVar1;
  *(uint *)PTR_DAT_004d9050 = uVar7 + *puVar11;
  *(uint *)(puVar3 + 4) =
       *piVar9 * *puVar8 + uVar6 * *piVar10 + (int)((ulonglong)lVar1 >> 0x20) +
       *piVar12 + (uint)CARRY4(uVar7,*puVar11);
  uVar4 = FUN_000065c4();
  FUN_00006a84(uVar4,1);
  uVar4 = FUN_000065c4();
  FUN_00006a84(uVar4,2);
  *(undefined4 *)(param_1 + 0x54) = 0x40c00000;
  if (*(int *)puVar2 != local_2c) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0001f8a0 — 0001f8a0

```c

void FUN_0001f8a0(float param_1)

{
  undefined *puVar1;
  float fVar2;
  
  puVar1 = PTR_DAT_004d9048;
  fVar2 = *(float *)(PTR_DAT_004d9048 + 0x24);
  if ((1.5 < param_1) && (fVar2 <= 1.5)) {
    FUN_00020698(0,0);
    fVar2 = *(float *)(puVar1 + 0x24);
  }
  if (fVar2 <= 0.0) {
    return;
  }
  if ((int)((uint)(fVar2 < DAT_0001f900) << 0x1f) < 0) {
    FUN_00020980();
  }
  return;
}


```

## FUN_000378c0 — 000378c0

```c

void FUN_000378c0(int *param_1,float param_2,undefined4 param_3,undefined4 param_4)

{
  byte bVar1;
  undefined *puVar2;
  undefined *puVar3;
  undefined *puVar4;
  bool bVar5;
  int iVar6;
  uint *puVar7;
  undefined4 uVar8;
  undefined4 *puVar9;
  uint uVar10;
  undefined4 *puVar11;
  int iVar12;
  char *pcVar13;
  int iVar14;
  char *pcVar15;
  longlong in_d0;
  undefined8 uVar16;
  ulonglong uVar17;
  undefined4 extraout_s1;
  uint extraout_s1_00;
  uint extraout_s1_01;
  float fVar18;
  longlong in_d1;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  undefined4 extraout_s3_01;
  undefined4 extraout_s3_02;
  undefined4 extraout_s3_03;
  uint extraout_s3_04;
  uint extraout_s3_05;
  longlong in_d2;
  undefined8 uVar19;
  undefined4 extraout_s5;
  uint extraout_s5_00;
  longlong lVar20;
  longlong lVar21;
  longlong in_d3;
  undefined4 extraout_s7;
  uint extraout_s7_00;
  undefined8 in_d4;
  undefined4 extraout_s9;
  undefined8 extraout_d4;
  float fVar22;
  undefined8 unaff_d8;
  undefined8 unaff_d9;
  undefined8 uVar23;
  undefined8 uVar24;
  undefined8 uVar25;
  undefined4 uVar26;
  undefined8 unaff_d14;
  undefined8 unaff_d15;
  undefined8 uVar27;
  undefined8 uVar28;
  undefined8 uVar29;
  undefined8 uVar30;
  undefined8 uVar31;
  undefined8 uVar32;
  undefined **local_ac;
  undefined *local_a8;
  undefined1 local_8c;
  undefined **local_88;
  undefined *local_84;
  undefined1 local_68;
  int local_64;
  
  puVar2 = PTR____stack_chk_guard_004d9044;
  local_64 = *(int *)PTR____stack_chk_guard_004d9044;
  uVar24 = CONCAT44((int)((ulonglong)unaff_d8 >> 0x20),param_1[0x12]);
  if ((float)param_1[0x12] <= 0.0) {
    uVar24 = CONCAT44(param_3,param_3);
    uVar23 = CONCAT44(param_4,param_4);
  }
  else {
    in_d0 = FloatVectorSub(uVar24,CONCAT44(param_2,param_2),2,0x20);
    param_1[0x12] = (int)in_d0;
    uVar23 = CONCAT44((int)((ulonglong)unaff_d9 >> 0x20),param_1[0x13]);
  }
  puVar3 = PTR_DAT_004d9048;
  fVar22 = (float)uVar24;
  if (param_1[3] != param_1[4]) {
    pcVar13 = (char *)(param_1[3] + 0x7c);
    uVar25 = FloatVectorMult(CONCAT44(param_2,param_2),
                             CONCAT44((int)((ulonglong)in_d0 >> 0x20),DAT_00037ce8),2,0x20);
    do {
      uVar8 = (undefined4)((ulonglong)in_d1 >> 0x20);
      iVar6 = *(int *)(puVar3 + 0x4c);
      uVar26 = *(undefined4 *)(pcVar13 + -0x1c);
      unaff_d15 = CONCAT44((int)((ulonglong)unaff_d15 >> 0x20),*(undefined4 *)(pcVar13 + -0x18));
      if ((iVar6 != 0) && (pcVar13[-0x70] == '\0')) {
        pcVar13[-0x70] = '\x01';
        FUN_0003e9e8(iVar6,*(undefined4 *)(pcVar13 + -0x74),0);
        uVar8 = extraout_s3;
      }
      uVar16 = FloatVectorMult(uVar23,unaff_d15,2,0x20);
      fVar18 = *(float *)(pcVar13 + -0x38);
      uVar19 = FloatVectorMult(uVar23,CONCAT44((int)((ulonglong)unaff_d14 >> 0x20),uVar26),2,0x20);
      if (fVar18 <= 0.0) {
        uVar17 = 0;
        if ((float)uVar16 <= fVar22) {
          puVar7 = &DAT_00037ef4;
          if (fVar22 <= (float)uVar19) {
            puVar7 = &DAT_00037ef8;
          }
          uVar17 = (ulonglong)*puVar7;
        }
LAB_000379de:
        bVar5 = true;
        *(int *)(pcVar13 + -0x3c) = (int)uVar17;
      }
      else if (fVar22 <= (float)uVar19) {
        uVar19 = FloatVectorAdd(uVar16,CONCAT44(uVar8,fVar18),2);
        if ((float)uVar19 < fVar22) {
          uVar16 = FloatVectorAdd(CONCAT44(uVar8,*(undefined4 *)(pcVar13 + -0x3c)),
                                  CONCAT44((int)((ulonglong)uVar16 >> 0x20),param_2 / fVar18),2);
          uVar17 = FloatVectorMin(0x3f8000003f800000,uVar16,2,0x20);
          goto LAB_000379de;
        }
        uVar16 = FloatVectorSub(uVar24,uVar16,2,0x20);
        fVar18 = (float)uVar16 / fVar18;
        uVar17 = 0;
        if (0.0 < fVar18) {
          uVar17 = CONCAT44(uVar8,fVar18);
        }
        *(int *)(pcVar13 + -0x3c) = (int)uVar17;
        bVar5 = false;
      }
      else {
        uVar17 = 0;
        pcVar13[-0xffffffff0000003c] = '\0';
        pcVar13[-0xffffffff0000003b] = '\0';
        pcVar13[-0xffffffff0000003a] = '\0';
        pcVar13[-0xffffffff00000039] = '\0';
        bVar5 = true;
      }
      iVar6 = -0x28;
      unaff_d14 = FloatVectorSub(0x3f8000003f800000,uVar17,2,0x20);
      iVar14 = *(int *)(pcVar13 + -0x74);
      if (bVar5) {
        iVar6 = -0x34;
      }
      pcVar15 = pcVar13 + iVar6;
      uVar8 = FUN_00025164();
      uVar26 = FUN_000251a8();
      uVar27 = FloatVectorMult(unaff_d14,unaff_d14,2,0x20);
      uVar30 = FloatVectorMult(CONCAT44(extraout_s7,*(undefined4 *)(pcVar13 + -0x54)),0,2,0x20);
      uVar28 = FloatVectorMult(uVar27,CONCAT44(extraout_s5,*(undefined4 *)(pcVar15 + 4)),2,0x20);
      uVar16 = FloatVectorMult(uVar27,CONCAT44(extraout_s3_00,*(undefined4 *)(pcVar15 + 8)),2,0x20);
      uVar29 = FloatVectorMult(CONCAT44(uVar26,uVar26),
                               CONCAT44(extraout_s9,*(undefined4 *)(pcVar13 + -0x58)),2,0x20);
      uVar32 = FloatVectorMult(CONCAT44(uVar8,uVar8),
                               CONCAT44(extraout_s5,*(undefined4 *)(pcVar13 + -0x5c)),2,0x20);
      uVar19 = FloatVectorMult(uVar27,CONCAT44(extraout_s1,*(undefined4 *)pcVar15),2,0x20);
      uVar31 = FloatVectorAdd(uVar30,CONCAT44(extraout_s3_00,*(undefined4 *)(pcVar13 + -0x60)),2);
      uVar30 = FloatVectorAdd(uVar32,CONCAT44(extraout_s1,*(undefined4 *)(pcVar13 + -0x68)),2);
      uVar29 = FloatVectorAdd(uVar29,CONCAT44(extraout_s3_00,*(undefined4 *)(pcVar13 + -100)),2);
      uVar16 = FloatVectorAdd(uVar31,uVar16,2);
      uVar19 = FloatVectorAdd(uVar30,uVar19,2);
      uVar28 = FloatVectorAdd(uVar29,uVar28,2);
      *(int *)(iVar14 + 8) = (int)uVar19;
      *(int *)(iVar14 + 0xc) = (int)uVar28;
      *(int *)(iVar14 + 0x10) = (int)uVar16;
      uVar10 = *(uint *)(pcVar13 + -4);
      iVar6 = *(int *)(pcVar13 + -0x74);
      if ((uVar10 & 1) == 0) {
        *(undefined4 *)(iVar6 + 0x20) = *(undefined4 *)(pcVar13 + -0x14);
        *(undefined4 *)(iVar6 + 0x24) = *(undefined4 *)(pcVar13 + -0x10);
        *(undefined4 *)(iVar6 + 0x28) = *(undefined4 *)(pcVar13 + -0xc);
      }
      else {
        uVar27 = FloatVectorSub(0x3f8000003f800000,uVar27,2,0x20);
        uVar19 = FloatVectorMult(uVar27,CONCAT44((int)((ulonglong)uVar19 >> 0x20),
                                                 *(undefined4 *)(pcVar13 + -0x14)),2,0x20);
        uVar28 = FloatVectorMult(uVar27,CONCAT44((int)((ulonglong)uVar28 >> 0x20),
                                                 *(undefined4 *)(pcVar13 + -0xc)),2,0x20);
        uVar16 = FloatVectorMult(uVar27,CONCAT44((int)((ulonglong)uVar16 >> 0x20),
                                                 *(undefined4 *)(pcVar13 + -0x10)),2,0x20);
        *(int *)(iVar6 + 0x20) = (int)uVar19;
        *(int *)(iVar6 + 0x24) = (int)uVar16;
        *(int *)(iVar6 + 0x28) = (int)uVar28;
      }
      if (*pcVar13 != '\0') {
        fVar18 = (float)FUN_00025164((int)uVar16);
        uVar16 = FloatVectorMult(CONCAT44(fVar18,fVar18 / DAT_00037cec),
                                 CONCAT44(extraout_s3_01,
                                          *(undefined4 *)(*(int *)(pcVar13 + -0x74) + 0x20)),2,0x20)
        ;
        *(int *)(*(int *)(pcVar13 + -0x74) + 0x20) = (int)uVar16;
        fVar18 = (float)FUN_000251a8((int)uVar16);
        iVar6 = *(int *)(pcVar13 + -0x74);
        uVar16 = FloatVectorMult(CONCAT44(fVar18,fVar18 / DAT_00037cf0),
                                 CONCAT44(extraout_s3_02,*(undefined4 *)(iVar6 + 0x24)),2,0x20);
        *(int *)(iVar6 + 0x24) = (int)uVar16;
        uVar10 = *(uint *)(pcVar13 + -4);
      }
      bVar1 = pcVar13[-5];
      if ((uVar10 & 2) == 0) {
        *(byte *)(iVar6 + 0x5f) = bVar1;
      }
      else {
        uVar19 = FixedToFP((ulonglong)CONCAT14(bVar1,(uint)bVar1),0,0,0,0x20);
        uVar16 = FloatVectorMult(uVar19,CONCAT44((int)((ulonglong)uVar16 >> 0x20),
                                                 *(undefined4 *)(pcVar13 + -0x3c)),2,0x20);
        uVar16 = FPToFixed(uVar16,0,0,3,0x20);
        *(char *)(iVar6 + 0x5f) = (char)uVar16;
      }
      iVar6 = *(int *)(puVar3 + 0x4c);
      if (iVar6 != 0) {
        bVar1 = *(byte *)(*(int *)(pcVar13 + -0x74) + 0x5f);
        uVar19 = FixedToFP((ulonglong)CONCAT14(bVar1,(uint)bVar1),0,0,0,0x20);
        uVar16 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar16 >> 0x20),
                                          *(undefined4 *)(iVar6 + 0x24)),uVar19,2,0x20);
        uVar16 = FPToFixed(uVar16,0,0,3,0x20);
        *(char *)(*(int *)(pcVar13 + -0x74) + 0x5f) = (char)uVar16;
      }
      uVar16 = FloatVectorMult(uVar25,CONCAT44((int)((ulonglong)uVar16 >> 0x20),
                                               *(undefined4 *)(pcVar13 + -0x48)),2,0x20);
      uVar19 = FixedToFP((ulonglong)
                         CONCAT24(*(ushort *)(pcVar13 + -0x4c),(uint)*(ushort *)(pcVar13 + -0x4c)),0
                         ,0,0,0x20);
      uVar16 = FloatVectorAdd(uVar19,uVar16,2);
      uVar16 = FPToFixed(uVar16,0,0,3,0x20);
      *(short *)(pcVar13 + -0x4c) = (short)uVar16;
      fVar18 = (float)FUN_003010b8();
      in_d3 = (ulonglong)extraout_s7_00 << 0x20;
      in_d2 = (ulonglong)extraout_s5_00 << 0x20;
      iVar6 = -0x40;
      iVar14 = *(int *)(pcVar13 + -0x74);
      pcVar15 = pcVar13 + 4;
      if (0.0 < fVar18) {
        iVar6 = -0x44;
      }
      in_d1 = CONCAT44(extraout_s3_03,*(undefined4 *)(pcVar13 + iVar6));
      uVar16 = FloatVectorMult(CONCAT44(fVar18,fVar18),in_d1,2,0x20);
      uVar19 = FloatVectorAdd(uVar16,0x3f8000003f800000,2);
      uVar16 = FloatVectorMult(CONCAT44(fVar18,*(undefined4 *)(iVar14 + 0x20)),uVar19,2,0x20);
      *(int *)(iVar14 + 0x20) = (int)uVar16;
      uVar16 = FloatVectorMult(uVar19,CONCAT44((int)((ulonglong)uVar16 >> 0x20),
                                               *(undefined4 *)(iVar14 + 0x24)),2,0x20);
      *(int *)(iVar14 + 0x24) = (int)uVar16;
      in_d0 = FloatVectorMult(uVar19,CONCAT44((int)((ulonglong)uVar16 >> 0x20),
                                              *(undefined4 *)(iVar14 + 0x28)),2,0x20);
      *(int *)(iVar14 + 0x28) = (int)in_d0;
      pcVar13 = pcVar13 + 0x80;
      in_d4 = extraout_d4;
    } while (pcVar15 != (char *)param_1[4]);
  }
  puVar9 = (undefined4 *)param_1[6];
  puVar11 = (undefined4 *)param_1[7];
  if (puVar9 != puVar11) {
    in_d0 = 0;
    in_d1 = 0x3f8000003f800000;
    iVar6 = *(int *)(PTR_DAT_004d9048 + 0x4c);
    do {
      uVar8 = (undefined4)((ulonglong)in_d2 >> 0x20);
      fVar18 = (float)puVar9[1];
      in_d3 = CONCAT44((int)((ulonglong)in_d3 >> 0x20),puVar9[3]);
      if (fVar18 <= 0.0) {
        *puVar9 = 0x3f800000;
        in_d2 = in_d1;
      }
      else {
        in_d4 = FloatVectorMult(uVar23,CONCAT44((int)((ulonglong)in_d4 >> 0x20),puVar9[2]),2,0x20);
        in_d2 = in_d0;
        if (fVar22 <= (float)in_d4) {
          uVar16 = FloatVectorMult(uVar23,in_d3,2,0x20);
          uVar25 = FloatVectorAdd(uVar16,CONCAT44(uVar8,fVar18),2);
          if (fVar22 <= (float)uVar25) {
            uVar25 = FloatVectorSub(uVar24,uVar16,2,0x20);
            fVar18 = (float)uVar25 / fVar18;
            in_d3 = CONCAT44((int)((ulonglong)uVar25 >> 0x20),fVar18);
            if (0.0 < fVar18) {
              in_d2 = in_d3;
            }
          }
          else {
            in_d3 = CONCAT44((int)((ulonglong)uVar25 >> 0x20),*puVar9);
            uVar25 = FloatVectorAdd(in_d3,CONCAT44(uVar8,param_2 / fVar18),2);
            in_d2 = FloatVectorMin(0x3f8000003f800000,uVar25,2,0x20);
          }
          *puVar9 = (int)in_d2;
        }
        else {
          *puVar9 = 0;
        }
      }
      if (iVar6 != 0) {
        iVar14 = 0;
        while( true ) {
          uVar25 = FloatVectorAdd(CONCAT44((int)((ulonglong)in_d3 >> 0x20),
                                           *(undefined4 *)((int)puVar9 + iVar14 + 0x10)),
                                  0xbf800000bf800000,2);
          uVar25 = FloatVectorMult(in_d2,uVar25,2,0x20);
          lVar20 = FloatVectorAdd(uVar25,0x3f8000003f800000,2);
          lVar21 = in_d0;
          if (0.0 < (float)lVar20) {
            lVar21 = lVar20;
          }
          iVar12 = iVar6 + iVar14;
          uVar25 = FloatVectorMult(lVar21,CONCAT44((int)((ulonglong)lVar20 >> 0x20),
                                                   *(undefined4 *)(iVar12 + 0x14)),2,0x20);
          *(int *)(iVar12 + 0x14) = (int)uVar25;
          uVar8 = (undefined4)((ulonglong)uVar25 >> 0x20);
          uVar25 = FloatVectorAdd(CONCAT44(uVar8,*(undefined4 *)((int)puVar9 + iVar14 + 0x1c)),
                                  0xbf800000bf800000,2);
          uVar25 = FloatVectorMult(uVar25,CONCAT44(uVar8,*puVar9),2,0x20);
          lVar21 = FloatVectorAdd(uVar25,0x3f8000003f800000,2);
          in_d3 = in_d0;
          if (0.0 < (float)lVar21) {
            in_d3 = lVar21;
          }
          iVar14 = iVar14 + 4;
          in_d2 = FloatVectorMult(in_d3,CONCAT44((int)((ulonglong)lVar21 >> 0x20),
                                                 *(undefined4 *)(iVar12 + 8)),2,0x20);
          *(int *)(iVar12 + 8) = (int)in_d2;
          if (iVar14 == 0xc) break;
          in_d2 = CONCAT44((int)((ulonglong)in_d2 >> 0x20),*puVar9);
        }
      }
      puVar9 = puVar9 + 10;
    } while (puVar9 != puVar11);
  }
  fVar18 = DAT_00037efc;
  iVar6 = *param_1;
  iVar14 = param_1[1];
  if (iVar6 != iVar14) {
    in_d0 = CONCAT44((int)((ulonglong)in_d0 >> 0x20),DAT_00037efc);
    do {
      if ((*(int *)(iVar6 + 4) != 0) && ((int)((uint)(fVar22 < fVar18) << 0x1f) < 0)) {
        *(undefined4 *)(*(int *)(iVar6 + 4) + 0x20) = 0;
      }
      iVar6 = iVar6 + 0x20;
    } while (iVar14 != iVar6);
  }
  puVar4 = PTR_FUN_004d9058;
  puVar3 = PTR_DAT_004d9048;
  iVar14 = param_1[10];
  iVar6 = param_1[9];
  if (iVar6 != iVar14) {
    do {
      in_d0 = CONCAT44((int)((ulonglong)in_d0 >> 0x20),*(undefined4 *)(iVar6 + 0x24));
      in_d1 = FloatVectorMult(uVar23,CONCAT44((int)((ulonglong)in_d1 >> 0x20),
                                              *(undefined4 *)(iVar6 + 0x20)),2,0x20);
      if (fVar22 <= (float)in_d1) {
        uVar24 = FloatVectorMult(uVar23,in_d0,2,0x20);
        if ((float)uVar24 < 0.0) {
          local_8c = 1;
          uVar8 = *(undefined4 *)(puVar3 + 0x1a4);
          local_ac = (undefined **)0x0;
          FUN_0000a298(&local_ac);
          local_8c = 0;
          local_ac = &PTR_LAB_0052bf38;
          local_a8 = puVar4;
          FUN_0002bc94(uVar8,iVar6,0x3f800000,0x3f800000,&local_ac,0);
          FUN_0000a298(&local_ac);
LAB_00037e36:
          iVar6 = FUN_0003828c(param_1 + 9,iVar6);
          in_d1 = (ulonglong)extraout_s3_04 << 0x20;
          in_d0 = (ulonglong)extraout_s1_00 << 0x20;
        }
        else {
          *(undefined4 *)(iVar6 + 0x20) = 0x42c80000;
          if (*(int *)(iVar6 + 0x28) == 0) {
            local_68 = 1;
            local_88 = (undefined **)0x0;
            uVar8 = *(undefined4 *)(puVar3 + 0x1a4);
            FUN_0000a298(&local_88);
            local_68 = 0;
            local_88 = &PTR_LAB_0052bf38;
            local_84 = puVar4;
            uVar8 = FUN_0002bc94(uVar8,iVar6,0x3f28f5c3,0x3f800000,&local_88,0);
            *(undefined4 *)(iVar6 + 0x28) = uVar8;
            FUN_0000a298(&local_88);
            in_d1 = (ulonglong)extraout_s3_05 << 0x20;
            in_d0 = (ulonglong)extraout_s1_01 << 0x20;
          }
          if ((int)((uint)(fVar22 < (float)uVar24) << 0x1f) < 0) goto LAB_00037e36;
        }
        iVar14 = param_1[10];
      }
    } while (iVar6 != iVar14);
  }
  if (*(int *)puVar2 != local_64) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0001f9dc — 0001f9dc

```c

void FUN_0001f9dc(void)

{
  undefined4 uVar1;
  int iVar2;
  undefined8 in_d0;
  undefined4 extraout_s1;
  undefined4 uVar4;
  undefined8 uVar3;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined8 in_d1;
  undefined8 uVar5;
  undefined4 extraout_s3;
  undefined8 uVar6;
  undefined4 extraout_s3_00;
  undefined4 extraout_s3_01;
  undefined4 extraout_s3_02;
  undefined4 extraout_s5;
  undefined4 uVar8;
  undefined8 uVar7;
  undefined4 extraout_s5_00;
  undefined4 extraout_s5_01;
  undefined4 extraout_s5_02;
  undefined8 unaff_d8;
  undefined8 uVar9;
  undefined8 unaff_d9;
  undefined8 uVar10;
  undefined8 unaff_d10;
  undefined8 uVar11;
  undefined8 unaff_d11;
  undefined8 uVar12;
  undefined8 uVar13;
  undefined8 uVar14;
  undefined4 local_34;
  
  local_34 = 0;
  uVar9 = CONCAT44((int)((ulonglong)unaff_d8 >> 0x20),DAT_0052bfe0);
  uVar10 = CONCAT44((int)((ulonglong)unaff_d9 >> 0x20),DAT_0052bfe4);
  uVar5 = FloatVectorSub(CONCAT44((int)((ulonglong)in_d0 >> 0x20),DAT_0001fb14),
                         CONCAT44((int)((ulonglong)in_d1 >> 0x20),
                                  *(undefined4 *)(PTR_DAT_004d9048 + 0x1c)),2,0x20);
  uVar11 = CONCAT44((int)((ulonglong)unaff_d10 >> 0x20),DAT_0052bfe8);
  uVar5 = CONCAT44((int)((ulonglong)unaff_d11 >> 0x20),(float)uVar5 / DAT_0001fb14);
  uVar1 = FUN_000065c4();
  iVar2 = FUN_00006ad0(uVar1,2,&local_34);
  uVar5 = FloatVectorMult(uVar5,uVar5,2,0x20);
  if (iVar2 != 0) {
    uVar1 = extraout_s3;
    uVar4 = extraout_s1;
    uVar8 = extraout_s5;
    do {
      uVar6 = CONCAT44(uVar1,*(undefined4 *)(iVar2 + 0xa8));
      uVar3 = CONCAT44(uVar4,*(undefined4 *)(iVar2 + 0xac));
      uVar7 = CONCAT44(uVar8,*(undefined4 *)(iVar2 + 0xb0));
      uVar14 = FloatVectorSub(uVar6,uVar9,2,0x20);
      uVar12 = FloatVectorSub(uVar3,uVar10,2,0x20);
      uVar13 = FloatVectorSub(uVar7,uVar11,2,0x20);
      uVar14 = FloatVectorMult(uVar5,uVar14,2,0x20);
      uVar12 = FloatVectorMult(uVar5,uVar12,2,0x20);
      uVar13 = FloatVectorMult(uVar5,uVar13,2,0x20);
      uVar6 = FloatVectorSub(uVar6,uVar14,2,0x20);
      uVar3 = FloatVectorSub(uVar3,uVar12,2,0x20);
      uVar7 = FloatVectorSub(uVar7,uVar13,2,0x20);
      *(int *)(iVar2 + 0x28) = (int)uVar6;
      *(int *)(iVar2 + 0x2c) = (int)uVar3;
      *(int *)(iVar2 + 0x30) = (int)uVar7;
      *(undefined4 *)(iVar2 + 0x1c) = 0;
      *(undefined4 *)(iVar2 + 0x20) = 0;
      *(undefined4 *)(iVar2 + 0x24) = 0;
      uVar1 = FUN_000065c4((int)uVar3);
      iVar2 = FUN_00006af0(uVar1,2,&local_34);
      uVar1 = extraout_s3_00;
      uVar4 = extraout_s1_00;
      uVar8 = extraout_s5_00;
    } while (iVar2 != 0);
  }
  uVar1 = FUN_000065c4();
  iVar2 = FUN_00006ad0(uVar1,1,&local_34);
  if (iVar2 != 0) {
    uVar1 = extraout_s3_01;
    uVar4 = extraout_s1_01;
    uVar8 = extraout_s5_01;
    do {
      uVar6 = CONCAT44(uVar1,*(undefined4 *)(iVar2 + 0xe8));
      uVar3 = CONCAT44(uVar4,*(undefined4 *)(iVar2 + 0xec));
      uVar7 = CONCAT44(uVar8,*(undefined4 *)(iVar2 + 0xf0));
      uVar14 = FloatVectorSub(uVar6,uVar9,2,0x20);
      uVar12 = FloatVectorSub(uVar3,uVar10,2,0x20);
      uVar13 = FloatVectorSub(uVar7,uVar11,2,0x20);
      uVar14 = FloatVectorMult(uVar5,uVar14,2,0x20);
      uVar12 = FloatVectorMult(uVar5,uVar12,2,0x20);
      uVar13 = FloatVectorMult(uVar5,uVar13,2,0x20);
      uVar6 = FloatVectorSub(uVar6,uVar14,2,0x20);
      uVar3 = FloatVectorSub(uVar3,uVar12,2,0x20);
      uVar7 = FloatVectorSub(uVar7,uVar13,2,0x20);
      *(int *)(iVar2 + 0x28) = (int)uVar6;
      *(int *)(iVar2 + 0x2c) = (int)uVar3;
      *(int *)(iVar2 + 0x30) = (int)uVar7;
      *(undefined4 *)(iVar2 + 0x1c) = 0;
      *(undefined4 *)(iVar2 + 0x20) = 0;
      *(undefined4 *)(iVar2 + 0x24) = 0;
      *(undefined4 *)(iVar2 + 0x128) = 0;
      *(undefined4 *)(iVar2 + 300) = 0;
      *(undefined4 *)(iVar2 + 0x130) = 0;
      uVar1 = FUN_000065c4((int)uVar3);
      iVar2 = FUN_00006af0(uVar1,1,&local_34);
      uVar1 = extraout_s3_02;
      uVar4 = extraout_s1_02;
      uVar8 = extraout_s5_02;
    } while (iVar2 != 0);
  }
  return;
}


```

## FUN_00057e38 — 00057e38

```c

void FUN_00057e38(int param_1,int param_2)

{
  undefined4 ****ppppuVar1;
  undefined *puVar2;
  undefined4 uVar3;
  int iVar4;
  _List_node_base *p_Var5;
  int *piVar6;
  int iVar7;
  int iVar8;
  undefined4 ****ppppuVar9;
  int iVar10;
  int iVar11;
  int iVar12;
  undefined4 local_12c;
  undefined4 local_128;
  undefined4 ***local_124;
  undefined4 ***local_120;
  undefined4 local_11c;
  int local_118;
  int local_114 [30];
  int local_9c [30];
  int local_24;
  
  puVar2 = PTR____stack_chk_guard_004d9044;
  iVar10 = param_2 + 0x260;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  *(undefined4 *)(param_2 + 0xf0) = 0;
  *(undefined4 *)(param_2 + 0xf8) = 0;
  *(undefined4 *)(param_2 + 0xf4) = 0;
  *(uint *)(param_2 + 0x298) = (uint)*(byte *)(param_1 + 0x179);
  *(uint *)(param_2 + 0x29c) = (uint)*(byte *)(param_1 + 0x17a);
  *(undefined4 *)(param_2 + 0x2a0) = *(undefined4 *)(param_1 + 0x17c);
  *(undefined4 *)(param_2 + 0x2a0) = *(undefined4 *)(param_1 + 0x17c);
  *(undefined4 *)(param_2 + 0x250) = *(undefined4 *)(param_1 + 0x208);
  FUN_00022bb4(iVar10);
  *(int *)(param_2 + 0x260) = iVar10;
  *(int *)(param_2 + 0x264) = iVar10;
  if (*(int *)(PTR_DAT_004d9048 + 0x10) == 1) {
    piVar6 = (int *)(param_1 + *(int *)(param_1 + 0x164) * 0xc + 0x140);
  }
  else {
    piVar6 = (int *)(param_1 + *(int *)(PTR_DAT_004d9048 + 0x10) * 0xc + 0x98);
  }
  if ((PTR_DAT_004d9048[0x17] == '\0') || (uVar3 = 0, 0x7fffffff < *(uint *)(param_1 + 0x16c))) {
    iVar11 = *piVar6;
    uVar3 = 0;
    iVar7 = piVar6[1];
    if (iVar7 != iVar11) {
      *(undefined4 *)(param_2 + 0x25c) = *(undefined4 *)(param_1 + 0x74);
      iVar8 = 0;
      iVar12 = *(int *)(param_1 + 0x16c);
      iVar4 = 0;
      do {
        piVar6 = *(int **)(iVar11 + iVar8 * 4);
        if ((*piVar6 <= iVar12) && ((iVar12 <= piVar6[1] || (piVar6[1] == -2)))) {
          local_9c[iVar4] = (int)piVar6;
          local_114[iVar4] = iVar8;
          iVar4 = iVar4 + 1;
        }
        iVar7 = iVar7 + -4;
        iVar8 = iVar8 + 1;
      } while (iVar11 != iVar7);
      if (0 < iVar4) {
        iVar7 = 0;
        do {
          iVar11 = local_9c[iVar7];
          local_120 = (undefined4 ***)0x0;
          local_124 = (undefined4 ***)0x0;
          uVar3 = *(undefined4 *)(iVar11 + 0x74);
          local_118 = local_114[iVar7];
          local_124 = &local_124;
          local_120 = &local_124;
          local_11c = uVar3;
          if ((iVar11 == *(int *)(param_1 + 0x168)) && (0 < *(int *)(iVar11 + 0x4c))) {
            iVar8 = 0;
            iVar12 = 0x74;
            do {
              local_12c = *(undefined4 *)(*(int *)(iVar11 + 0x48) + iVar12);
              local_128 = *(undefined4 *)(*(int *)(iVar11 + 0x48) + iVar12 + 0xc);
              uVar3 = FUN_00023104(&local_124,&local_124,&local_12c);
              iVar12 = iVar12 + 0x90;
              iVar8 = iVar8 + 1;
            } while (iVar8 < *(int *)(iVar11 + 0x4c));
          }
          p_Var5 = (_List_node_base *)FUN_000230b0(uVar3,iVar10,&local_124);
          std::_List_node_base::hook(p_Var5);
          ppppuVar1 = (undefined4 ****)local_124;
          while (ppppuVar1 != &local_124) {
            ppppuVar9 = (undefined4 ****)*ppppuVar1;
            operator_delete(ppppuVar1);
            ppppuVar1 = ppppuVar9;
          }
          iVar7 = iVar7 + 1;
        } while (iVar7 != iVar4);
      }
      iVar10 = 0;
      *(undefined4 *)(param_2 + 0x248) = *(undefined4 *)(param_1 + 0x16c);
      *(undefined4 *)(param_2 + 0x24c) = *(undefined4 *)(param_1 + 0x218);
      *(undefined4 *)(param_2 + 0x254) = *(undefined4 *)(param_1 + 0x170);
      *(undefined4 *)(param_2 + 600) = *(undefined4 *)(param_1 + 0x174);
      *(undefined4 *)(param_2 + 0xf0) = *(undefined4 *)(param_1 + 0x4c);
      *(undefined4 *)(param_2 + 0xf8) = *(undefined4 *)(param_1 + 0x60);
      *(undefined4 *)(param_2 + 0xf4) = *(undefined4 *)(param_1 + 0x58);
      *(undefined4 *)(param_2 + 0x6c) = *(undefined4 *)(param_1 + 0x204);
      do {
        *(undefined4 *)(param_2 + 0x70 + iVar10 * 4) = *(undefined4 *)(param_1 + 0x180 + iVar10 * 4)
        ;
        iVar10 = iVar10 + 1;
        uVar3 = 1;
      } while (iVar10 != 0x20);
    }
  }
  if (*(int *)puVar2 == local_24) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail(uVar3);
}


```

## FUN_0001f018 — 0001f018

```c

void FUN_0001f018(undefined4 param_1,int param_2)

{
  bool bVar1;
  char cVar2;
  char cVar3;
  undefined *puVar4;
  undefined *puVar5;
  char *pcVar6;
  int *piVar7;
  float fVar8;
  undefined4 uVar9;
  undefined ***pppuVar10;
  int iVar11;
  undefined4 *puVar12;
  float *pfVar13;
  undefined4 uVar14;
  float extraout_s0;
  undefined4 extraout_s0_00;
  undefined4 extraout_s0_01;
  undefined4 extraout_s0_02;
  longlong in_d0;
  uint extraout_s1;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined4 extraout_s1_03;
  undefined4 extraout_s3;
  uint extraout_s3_00;
  uint extraout_s3_01;
  uint uVar16;
  longlong lVar15;
  undefined4 extraout_s3_02;
  undefined4 extraout_s3_03;
  undefined8 uVar17;
  undefined4 extraout_s5;
  undefined4 extraout_s7;
  undefined8 uVar18;
  undefined8 uVar19;
  float fVar20;
  undefined8 unaff_d10;
  undefined8 uVar21;
  undefined **local_8c;
  undefined *local_88;
  undefined1 local_6c;
  undefined **local_68;
  undefined *local_64;
  undefined1 local_48;
  int local_44;
  
  puVar4 = PTR____stack_chk_guard_004d9044;
  uVar19 = CONCAT44(param_1,param_1);
  local_44 = *(int *)PTR____stack_chk_guard_004d9044;
  if (DAT_005577d8 != 0) {
    FUN_0003e9e8(*(undefined4 *)(PTR_DAT_004d9048 + 0x4c),DAT_005577d8,0);
    in_d0 = (ulonglong)extraout_s1 << 0x20;
    DAT_005577d8 = 0;
  }
  if (DAT_005f9408 != '\0') {
    in_d0 = FloatVectorSub(CONCAT44((int)((ulonglong)in_d0 >> 0x20),DAT_005f940c),uVar19,2,0x20);
    DAT_005f940c = (float)in_d0;
    DAT_005f9408 = 0.0 < DAT_005f940c;
  }
  fVar20 = DAT_005577e4;
  if (0.0 < DAT_005577e4) {
    uVar17 = FloatVectorSub(CONCAT44((int)((ulonglong)in_d0 >> 0x20),DAT_005577e4),uVar19,2,0x20);
    fVar20 = (float)uVar17;
    if (fVar20 <= DAT_0001f464) {
      bVar1 = DAT_0001f464 < DAT_005577e4;
      DAT_005577e4 = fVar20;
      if (bVar1) {
        switch(DAT_0052c274) {
        case 10:
          pcVar6 = 
          "http://phobos.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=395627741&mt=8";
          break;
        case 0xb:
          pcVar6 = 
          "http://phobos.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=370070561&mt=8";
          break;
        case 0xc:
          iVar11 = FUN_003297f0("twitter://user?screen_name=halfbrick");
          if (iVar11 != 0) goto LAB_0001f152;
          pcVar6 = "http://www.twitter.com/halfbrick";
          break;
        case 0xd:
          iVar11 = FUN_003297f0("fb://profile/61597338747");
          if (iVar11 != 0) goto LAB_0001f152;
          pcVar6 = "http://www.facebook.com/halfbrick";
          break;
        default:
          pcVar6 = 
          "http://phobos.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=362949845&mt=8";
        }
        FUN_003297f0(pcVar6);
      }
LAB_0001f152:
      uVar19 = 0;
      *(undefined4 *)(PTR_DAT_004d9048 + 0x44) = 0;
      fVar20 = DAT_005577e4;
    }
  }
  DAT_005577e4 = fVar20;
  puVar5 = PTR_DAT_004d9048;
  iVar11 = 0xd4;
  PTR_DAT_004d9048[0xa9] = 0;
  puVar5[0xa8] = 0;
  do {
    pfVar13 = (float *)(puVar5 + iVar11);
    if (*pfVar13 == 0.0) {
      *pfVar13 = -1.0;
    }
    else {
      *pfVar13 = 0.0;
    }
    iVar11 = iVar11 + 0xc;
  } while (iVar11 != 0x194);
  if (((DAT_00537b20 & 1) == 0) && (iVar11 = ___cxa_guard_acquire(&DAT_00537b20), iVar11 != 0)) {
    FUN_002fa6fc(&DAT_00537af0);
    ___cxa_atexit(PTR_FUN_004d90c4,&DAT_00537af0,PTR___mh_execute_header_004d9040);
    ___cxa_guard_release(&DAT_00537b20);
  }
  uVar9 = (undefined4)uVar19;
  FUN_002fb388(&DAT_00537af0,uVar9);
  uVar14 = *(undefined4 *)(puVar5 + 0xb4);
  uVar18 = FloatVectorSub(CONCAT44(extraout_s1_00,uVar14),
                          CONCAT44(extraout_s7,*(undefined4 *)(puVar5 + 0xac)),2,0x20);
  uVar17 = FloatVectorSub(CONCAT44(extraout_s3,*(undefined4 *)(puVar5 + 0xb8)),
                          CONCAT44(extraout_s5,*(undefined4 *)(puVar5 + 0xb0)),2,0x20);
  *(int *)(puVar5 + 0xc4) = (int)uVar18;
  *(int *)(puVar5 + 200) = (int)uVar17;
  *(undefined4 *)(puVar5 + 0xac) = uVar14;
  *(undefined4 *)(puVar5 + 0xb0) = *(undefined4 *)(puVar5 + 0xb8);
  iVar11 = FUN_00025db0(uVar14);
  uVar14 = extraout_s1_01;
  uVar16 = extraout_s3_00;
  if (iVar11 == 1) {
    uVar14 = FUN_0030a1d8();
    FUN_0030a7f4(uVar14,uVar9);
    FUN_0002ba24(*(undefined4 *)(puVar5 + 0x1a4));
    if (*(int *)(puVar5 + 0x1a8) != 0) {
      FUN_00072338(*(int *)(puVar5 + 0x1a8),uVar9);
    }
    uVar14 = FUN_0007505c();
    FUN_00075098(uVar14,uVar9);
    uVar14 = FUN_0002ede8();
    FUN_000306e8(uVar14,uVar9);
    if (((puVar5[0x55] != '\0') && ((int)((uint)(*(float *)(puVar5 + 0x20) < 0.0) << 0x1f) < 0)) &&
       (((DAT_005577ac ^ 1) & 1) != 0)) {
      FUN_0004f14c();
      uVar14 = FUN_0007505c();
      FUN_00075184(uVar14,"Music-menu");
      DAT_005577ac = 1;
    }
    FUN_0001cf1c(uVar9);
    uVar14 = extraout_s1_02;
    uVar16 = extraout_s3_01;
  }
  lVar15 = (ulonglong)uVar16 << 0x20;
  if (param_2 == 1) {
    uVar17 = 0x3f8000003f800000;
    *(undefined1 *)(*(int *)(puVar5 + 0x5c) + 0x31) = 0;
    uVar18 = FloatVectorSub(CONCAT44(uVar14,*(undefined4 *)(puVar5 + 0x3c)),uVar19,2,0x20);
    *(int *)(puVar5 + 0x3c) = (int)uVar18;
    uVar18 = CONCAT44((int)((ulonglong)uVar18 >> 0x20),DAT_005577e8);
    if (0.0 < DAT_005577e8) {
      uVar17 = FloatVectorMult(uVar19,CONCAT44(uVar16,DAT_0052c27c),2,0x20);
      lVar15 = CONCAT44(uVar16,DAT_0052c278);
      uVar18 = FloatVectorSub(uVar18,uVar17,2,0x20);
      uVar17 = FloatVectorAdd(lVar15,0xbf800000bf800000,2);
      DAT_005577e8 = (float)uVar18;
      uVar17 = FloatVectorMult(uVar17,uVar18,2,0x20);
      uVar17 = FloatVectorAdd(uVar17,0x3f8000003f800000,2);
    }
    puVar12 = &DAT_0001f88c;
    if (puVar5[0x1b] != '\0') {
      puVar12 = &DAT_0001f890;
    }
    uVar21 = FloatVectorMult(uVar19,CONCAT44((int)((ulonglong)uVar18 >> 0x20),*puVar12),2,0x20);
    uVar18 = 0x3f8000003f800000;
    uVar21 = FloatVectorSub(CONCAT44((int)((ulonglong)lVar15 >> 0x20),DAT_0052c280),uVar21,2,0x20);
    if (1.0 < (float)uVar21) {
      uVar18 = CONCAT44(0x3f800000,(float)uVar21);
    }
    uVar21 = FloatVectorMult(uVar17,uVar18,2,0x20);
    DAT_0052c280 = (undefined4)uVar18;
    uVar17 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar18 >> 0x20),
                                      *(undefined4 *)(puVar5 + 0x44)),uVar21,2,0x20);
    *(int *)(puVar5 + 0x44) = (int)uVar17;
    puVar5[0x1b] = 0;
    FUN_000161c4((int)uVar17,uVar9);
    FUN_0001b384(uVar9);
    uVar19 = FloatVectorMult(uVar19,uVar21,2,0x20);
    fVar20 = *(float *)(puVar5 + 0x24);
    uVar14 = (undefined4)uVar19;
    if (fVar20 <= 0.0) {
      *(undefined1 *)(*(int *)(puVar5 + 0x5c) + 0x31) = 1;
      uVar9 = FUN_00052f80();
      FUN_000559e4(uVar9,uVar14);
      uVar9 = FUN_00052f80();
      uVar9 = FUN_000558f0(uVar9,0);
      unaff_d10 = FloatVectorMult(uVar19,CONCAT44(uVar9,uVar9),2,0x20);
      uVar17 = uVar19;
    }
    else {
      uVar17 = FloatVectorSub(CONCAT44((int)((ulonglong)unaff_d10 >> 0x20),fVar20),uVar19,2,0x20);
      if (DAT_005577b0 == '\0') {
        puVar5[0x1b] = 1;
      }
      *(int *)(puVar5 + 0x24) = (int)uVar17;
      if (*(int *)(puVar5 + 0x10) == 1) {
        uVar17 = FloatVectorSub(uVar17,uVar19,2,0x20);
        *(int *)(puVar5 + 0x24) = (int)uVar17;
      }
      fVar8 = (float)uVar17;
      if (fVar8 <= DAT_0001f468) {
        FUN_0001f8a0(fVar20);
        uVar17 = FloatVectorAdd(uVar19,uVar19,2);
        fVar8 = *(float *)(puVar5 + 0x24);
      }
      else {
        uVar17 = FloatVectorNeg(uVar19,2,2);
      }
      if ((fVar8 <= 1.5) && (1.5 < fVar20)) {
        cVar2 = puVar5[0x17];
        cVar3 = cVar2;
        if (cVar2 == '\0') {
          cVar3 = DAT_005577b0;
        }
        if ((cVar2 == '\0' && cVar3 == '\0') && (iVar11 = FUN_0001ccec(puVar5), iVar11 != 0)) {
          FUN_0001ccec(puVar5);
          FUN_000708b8();
        }
      }
      unaff_d10 = 0;
      *(undefined4 *)(puVar5 + 0x24) = 0;
    }
    piVar7 = *(int **)puVar5;
    if (piVar7 != (int *)0x0) {
      (**(code **)(*piVar7 + 0x14))(piVar7,uVar14);
    }
    if ((float)unaff_d10 == 0.0 && (int)((uint)(*(float *)(puVar5 + 0x20) < 0.0) << 0x1f) < 0) {
      unaff_d10 = CONCAT44((int)((ulonglong)unaff_d10 >> 0x20),uVar14);
    }
    FUN_00008e54((int)unaff_d10);
    uVar14 = FUN_000065c4();
    FUN_00006788(uVar14,(int)unaff_d10,0,0);
    iVar11 = FUN_0001cd68();
    if (iVar11 == 1) {
      FUN_0000fc14();
    }
  }
  else {
    iVar11 = 0;
    puVar5[0x1b] = 0;
    if (puVar5[10] != '\0') {
      *(undefined1 *)(*(int *)(puVar5 + 0x5c) + 0x31) = 1;
    }
    FUN_000161c4(0);
    do {
      piVar7 = (int *)(&DAT_0055781c)[iVar11];
      if (piVar7 != (int *)0x0) {
        (**(code **)(*piVar7 + 0x10))(piVar7,uVar9);
        (**(code **)(*(int *)(&DAT_0055781c)[iVar11] + 0x18))((int *)(&DAT_0055781c)[iVar11],uVar9);
      }
      iVar11 = iVar11 + 1;
    } while (iVar11 != 0x10);
    uVar14 = FUN_00052f80();
    FUN_000559e4(uVar14,0);
    uVar17 = uVar19;
  }
  DAT_0052c284 = 1.0;
  uVar14 = FUN_00052f80();
  fVar8 = (float)FUN_000558f0(uVar14,0);
  fVar20 = extraout_s0;
  if (puVar5[10] == '\0') {
    fVar20 = fVar8;
    if (fVar8 == 0.0) {
      fVar20 = 1.0;
    }
    uVar18 = FloatVectorMax(0x3f8000003f800000,CONCAT44(fVar8,1.0 / fVar20),2,0x20);
    fVar20 = (float)uVar18;
    DAT_0052c284 = fVar20;
  }
  uVar14 = FUN_00033ca0(fVar20);
  fVar8 = (float)uVar19;
  FUN_000349b8(uVar14,fVar8 / DAT_0052c284,puVar5[10] != '\0');
  uVar14 = (**(code **)(**(int **)(puVar5 + 0x58) + 0x1c))(*(int **)(puVar5 + 0x58),(int)uVar17);
  fVar20 = DAT_0001f894;
  if (puVar5[0x1b] == '\0') {
    uVar14 = *(undefined4 *)(puVar5 + 0x4c);
LAB_0001f5f8:
    uVar14 = FUN_0003e870(uVar14,fVar8);
  }
  else {
    if (fVar8 == 0.0) {
      uVar14 = *(undefined4 *)(puVar5 + 0x4c);
      fVar8 = 0.0;
      goto LAB_0001f5f8;
    }
    if (!NAN(fVar8)) {
      unaff_d10 = CONCAT44((int)((ulonglong)unaff_d10 >> 0x20),DAT_0001f898);
      uVar17 = uVar19;
      do {
        fVar8 = fVar20;
        if (fVar20 < (float)uVar17) {
          fVar8 = (float)uVar17;
        }
        uVar14 = FUN_0003e870(*(undefined4 *)(puVar5 + 0x4c),fVar8);
        uVar17 = FloatVectorAdd(uVar17,unaff_d10,2);
      } while (0.0 < (float)uVar17);
    }
  }
  if (puVar5[0x1b] != '\0') {
    uVar18 = CONCAT44((int)((ulonglong)unaff_d10 >> 0x20),DAT_0052c280);
    uVar17 = 0x3f8000003f800000;
    iVar11 = FUN_0001f904();
    if (iVar11 != 0) {
      uVar17 = 0x3f80000000000000;
    }
    uVar17 = FloatVectorMult(uVar18,uVar17,2,0x20);
    uVar17 = FloatVectorMin(0x40a0000040a00000,uVar17,2,0x20);
    uVar14 = (undefined4)uVar17;
    DAT_0052c280 = uVar14;
  }
  FUN_003527fc(uVar14);
  uVar14 = FUN_00352918();
  if (((puVar5[0x17] != '\0') ||
      (fVar20 = (float)FUN_00009560(), uVar14 = extraout_s0_00, fVar20 <= 0.0)) ||
     (puVar5[10] != '\0')) {
LAB_0001f674:
    if (DAT_005577ec == 0) goto LAB_0001f680;
    uVar14 = 0;
  }
  else {
    iVar11 = FUN_0001d10c(puVar5);
    if (iVar11 != 0) {
      FUN_0001d10c(puVar5);
      iVar11 = FUN_000617e8();
      uVar14 = extraout_s0_01;
      if (iVar11 != 0) goto LAB_0001f674;
    }
    if (DAT_005577ec == 0) {
      pppuVar10 = &local_68;
      local_48 = 1;
      local_68 = (undefined **)0x0;
      uVar14 = *(undefined4 *)(puVar5 + 0x1a4);
      FUN_0000a298(pppuVar10);
      local_48 = 0;
      local_68 = &PTR_LAB_0052bf38;
      local_64 = PTR_FUN_004d9058;
      DAT_005577ec = FUN_0002bc94(uVar14,"Bomb-Fuse",0,0,pppuVar10,0);
LAB_0001f842:
      uVar14 = FUN_0000a298(pppuVar10);
      uVar9 = extraout_s3_03;
    }
    else {
      iVar11 = FUN_00309b54();
      uVar14 = extraout_s0_02;
      uVar9 = extraout_s3_02;
      if (iVar11 == 0) {
        FUN_0002be70(*(undefined4 *)(puVar5 + 0x1a4),DAT_005577ec,"Bomb-Fuse");
        pppuVar10 = &local_8c;
        local_6c = 1;
        local_8c = (undefined **)0x0;
        uVar14 = *(undefined4 *)(puVar5 + 0x1a4);
        FUN_0000a298(pppuVar10);
        local_6c = 0;
        local_8c = &PTR_LAB_0052bf38;
        local_88 = PTR_FUN_004d9058;
        DAT_005577ec = FUN_0002bc94(uVar14,"Bomb-Fuse",0,0,pppuVar10,0);
        goto LAB_0001f842;
      }
    }
    if (DAT_005577ec == 0) goto LAB_0001f680;
    uVar17 = 0;
    if (0.0 < fVar20 / DAT_0001f89c) {
      uVar17 = CONCAT44(uVar9,fVar20 / DAT_0001f89c);
    }
    uVar17 = FloatVectorMult(uVar17,CONCAT44(uVar9,**(undefined4 **)(puVar5 + 0x1a4)),2,0x20);
    uVar14 = (undefined4)uVar17;
  }
  uVar14 = FUN_00309b38(DAT_005577ec,uVar14);
LAB_0001f680:
  if (puVar5[0x18] != '\0') {
    if (*(float *)(puVar5 + 0x1c) <= 0.0) {
      uVar14 = FUN_0001f964();
      *(undefined4 *)(puVar5 + 0x1c) = 0;
    }
    else {
      FUN_0001f9dc();
      uVar17 = FloatVectorSub(CONCAT44(extraout_s1_03,*(undefined4 *)(puVar5 + 0x1c)),uVar19,2,0x20)
      ;
      uVar14 = (undefined4)uVar17;
      *(undefined4 *)(puVar5 + 0x1c) = uVar14;
    }
  }
  uVar14 = FUN_003ecb20(uVar14);
  FUN_003f09d0(uVar14,0xffffffff);
  if (puVar5[10] != '\0') {
    uVar14 = FUN_003ecb20();
    FUN_003f09d0(uVar14,2);
  }
  uVar14 = FUN_003ecb20();
  iVar11 = FUN_0001d10c(puVar5);
  uVar17 = 0x3f8000003f800000;
  if ((iVar11 != 0) && (puVar5[0x17] == '\0')) {
    piVar7 = (int *)FUN_0001d10c(puVar5);
    uVar9 = (**(code **)(*piVar7 + 0x30))();
    uVar17 = CONCAT44(uVar9,uVar9);
  }
  uVar19 = FloatVectorMult(uVar19,uVar17,2,0x20);
  FUN_003ef458(uVar14,(int)uVar19);
  if (*(int *)puVar4 == local_44) {
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

## FUN_000073d0 — 000073d0

```c

void FUN_000073d0(int param_1,undefined4 param_2)

{
  undefined *puVar1;
  undefined *puVar2;
  undefined *puVar3;
  undefined *puVar4;
  undefined *puVar5;
  int *piVar6;
  undefined4 uVar7;
  int *piVar8;
  int iVar9;
  int iVar10;
  undefined4 extraout_r1;
  int iVar11;
  undefined4 extraout_r1_00;
  undefined4 *puVar12;
  uint uVar13;
  int iVar14;
  bool bVar15;
  bool bVar16;
  undefined4 extraout_s0;
  float fVar17;
  undefined4 extraout_s0_00;
  uint extraout_s0_01;
  uint extraout_s0_02;
  float fVar18;
  uint uVar19;
  uint extraout_s0_03;
  uint extraout_s0_04;
  uint extraout_s0_05;
  undefined4 extraout_s0_06;
  undefined8 in_d0;
  undefined8 uVar20;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined4 extraout_s1_03;
  undefined4 extraout_s1_04;
  ulonglong uVar21;
  uint extraout_s1_05;
  undefined4 extraout_s1_06;
  undefined4 extraout_s1_07;
  undefined4 extraout_s1_08;
  undefined4 extraout_s1_09;
  undefined4 extraout_s1_10;
  undefined4 extraout_s1_11;
  undefined4 extraout_s1_12;
  uint extraout_s1_13;
  undefined4 extraout_s1_14;
  undefined4 extraout_s1_15;
  uint extraout_s1_16;
  uint extraout_s1_17;
  undefined4 extraout_s1_18;
  uint extraout_s3;
  ulonglong uVar22;
  undefined4 extraout_s3_00;
  uint extraout_s3_01;
  uint extraout_s3_02;
  undefined4 extraout_s3_03;
  undefined4 extraout_s3_04;
  longlong lVar23;
  uint extraout_s3_05;
  undefined4 extraout_s3_06;
  undefined4 extraout_s3_07;
  undefined4 extraout_s3_08;
  undefined4 extraout_s3_09;
  float fVar24;
  undefined8 in_d2;
  uint extraout_s5;
  uint extraout_s5_00;
  uint extraout_s5_01;
  undefined4 extraout_s5_02;
  undefined8 uVar25;
  longlong lVar26;
  uint extraout_s5_03;
  undefined4 extraout_s5_04;
  undefined4 extraout_s5_05;
  undefined4 extraout_s5_06;
  undefined4 extraout_s5_07;
  undefined4 extraout_s5_08;
  float fVar27;
  undefined4 extraout_s7;
  undefined4 extraout_s7_00;
  undefined4 extraout_s7_01;
  undefined4 extraout_s7_02;
  undefined4 extraout_s7_03;
  undefined4 extraout_s9;
  undefined4 extraout_s9_00;
  undefined4 extraout_s9_01;
  undefined4 extraout_s9_02;
  undefined4 extraout_s9_03;
  undefined4 extraout_s11;
  undefined4 extraout_s11_00;
  undefined4 extraout_s13;
  undefined4 extraout_s15;
  undefined8 uVar28;
  float fVar29;
  undefined8 unaff_d9;
  undefined4 uVar30;
  undefined8 unaff_d10;
  undefined4 uVar31;
  undefined8 unaff_d11;
  undefined4 uVar32;
  undefined8 unaff_d12;
  undefined8 uVar33;
  undefined8 uVar34;
  double dVar35;
  double dVar36;
  undefined8 uVar37;
  undefined8 uVar38;
  undefined8 uVar39;
  undefined8 uVar40;
  undefined8 uVar41;
  undefined8 uVar42;
  undefined8 uVar43;
  undefined1 auStack_154 [20];
  undefined4 local_140;
  undefined1 auStack_134 [20];
  undefined4 local_120;
  undefined1 auStack_114 [12];
  undefined1 auStack_108 [20];
  undefined4 local_f4;
  undefined1 auStack_e8 [20];
  undefined4 local_d4;
  undefined1 auStack_c8 [12];
  undefined4 local_bc;
  undefined1 auStack_b8 [12];
  undefined4 local_ac;
  undefined4 local_a8;
  undefined4 local_a4;
  undefined **local_a0;
  undefined *local_9c;
  undefined4 local_98 [8];
  undefined1 local_78;
  undefined1 auStack_74 [4];
  float local_70;
  undefined1 auStack_6c [4];
  float local_68;
  int local_64;
  
  puVar2 = PTR_DAT_004d9048;
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_64 = *(int *)PTR____stack_chk_guard_004d9044;
  uVar28 = FloatVectorMult(CONCAT44((int)((ulonglong)in_d2 >> 0x20),*(undefined4 *)(param_1 + 200)),
                           CONCAT44(param_2,param_2),2,0x20);
  uVar20 = FloatVectorAdd(uVar28,CONCAT44((int)((ulonglong)in_d0 >> 0x20),
                                          *(undefined4 *)(param_1 + 0xd0)),2);
  fVar18 = (float)uVar28;
  uVar7 = (undefined4)((ulonglong)unaff_d9 >> 0x20);
  uVar25 = CONCAT44(uVar7,fVar18 / DAT_00007764);
  *(int *)(param_1 + 0xd0) = (int)uVar20;
  piVar6 = (int *)FUN_0001d10c(puVar2);
  uVar20 = CONCAT44(extraout_s1,extraout_s0);
  if (*(char *)(param_1 + 0x7e) == '\0') {
    uVar21 = CONCAT44(extraout_s1,*(float *)(param_1 + 0xc0));
    uVar30 = extraout_s9;
    uVar19 = extraout_s3;
    uVar13 = extraout_s5;
    uVar31 = extraout_s7;
    if (0.0 < *(float *)(param_1 + 0xc0)) {
      if ((*(int *)(puVar2 + 0x10) != 1) &&
         ((0.0 < *(float *)(puVar2 + 0x24) || (puVar2[0x17] != '\0')))) {
        *(undefined4 *)(param_1 + 0xc0) = 0;
        uVar19 = FUN_000251a8();
        *(uint *)(param_1 + 0x14) = uVar19 ^ 0x80000000;
        *(undefined4 *)(param_1 + 0x1c) = 0;
        *(undefined4 *)(param_1 + 0x20) = 0xbf800000;
        *(undefined4 *)(param_1 + 0x24) = 0;
        uVar21 = CONCAT44(extraout_s1_01,*(undefined4 *)(param_1 + 0xc0));
      }
      fVar24 = DAT_00007768;
      uVar22 = uVar21;
      if (puVar2[10] == '\0') {
        uVar22 = CONCAT44((int)(uVar21 >> 0x20),*(undefined4 *)(puVar2 + 0x44));
      }
      uVar20 = FloatVectorSub(uVar21,uVar22,2,0x20);
      fVar17 = (float)uVar20;
      *(float *)(param_1 + 0xc0) = fVar17;
      if ((((fVar17 <= fVar24) && (fVar24 < (float)uVar21)) && (puVar2[0x17] == '\0')) &&
         (((DAT_00556a74 ^ 1) & 1) != 0)) {
        if ((piVar6 == (int *)0x0) || (iVar9 = FUN_00064000(PTR_DAT_004d907c,3), iVar9 == 0)) {
          local_a0 = &PTR_LAB_0052bf38;
          local_9c = PTR_FUN_004d9058;
          local_78 = 1;
          local_98[0] = 0;
          uVar30 = *(undefined4 *)(puVar2 + 0x1a4);
          FUN_0000a23c(&local_a0,local_98);
          FUN_0002bc94(uVar30,"Throw-bomb",0x3f800000,0x3f800000,local_98,0);
          FUN_0000a298(local_98);
        }
        DAT_00556a74 = 1;
        fVar17 = *(float *)(param_1 + 0xc0);
      }
      if (0.0 < fVar17) goto LAB_00007ff2;
      uVar20 = FUN_00052f80();
      uVar30 = (undefined4)((ulonglong)uVar20 >> 0x20);
      fVar24 = *(float *)((int)uVar20 + 0x68);
      unaff_d10 = CONCAT44((int)((ulonglong)unaff_d10 >> 0x20),fVar24);
      uVar20 = FPToFixed(unaff_d10,0,0,3,0x20);
      uVar33 = FixedToFP(uVar20,0,0,0,0x20);
      iVar9 = (int)uVar20;
      uVar20 = FloatVectorAdd(uVar33,CONCAT44(extraout_s1_02,DAT_0000776c),2);
      if ((float)uVar20 < fVar24) {
        iVar11 = FUN_00052f80();
        uVar20 = FloatVectorSub(unaff_d10,uVar33,2,0x20);
        lVar23 = (ulonglong)*(uint *)(iVar11 + 8) * (ulonglong)*(uint *)(iVar11 + 0x10);
        uVar13 = (uint)lVar23;
        uVar20 = FloatVectorMult(uVar20,CONCAT44(extraout_s1_03,DAT_00007770),2,0x20);
        uVar19 = *(int *)(iVar11 + 0xc) * *(uint *)(iVar11 + 0x10) +
                 *(uint *)(iVar11 + 8) * *(int *)(iVar11 + 0x14) + (int)((ulonglong)lVar23 >> 0x20)
                 + *(int *)(iVar11 + 0x1c) + (uint)CARRY4(uVar13,*(uint *)(iVar11 + 0x18));
        uVar30 = (undefined4)((ulonglong)uVar19 * 100 >> 0x20);
        *(uint *)(iVar11 + 8) = uVar13 + *(uint *)(iVar11 + 0x18);
        *(uint *)(iVar11 + 0xc) = uVar19;
        uVar33 = FixedToFP(CONCAT44(uVar30,uVar30),0,1,0,0x20);
        if ((float)uVar33 < (float)uVar20) {
          iVar9 = iVar9 + 1;
        }
      }
      if (iVar9 < 1) {
        *(undefined4 *)(param_1 + 0xc0) = 0;
        uVar20 = FUN_000251a8();
        uVar30 = (undefined4)((ulonglong)uVar20 >> 0x20);
        *(uint *)(param_1 + 0x14) = (uint)uVar20 ^ 0x80000000;
        *(undefined4 *)(param_1 + 0x1c) = 0;
        *(undefined4 *)(param_1 + 0x20) = 0xbf800000;
        *(undefined4 *)(param_1 + 0x24) = 0;
      }
      else if (1 < iVar9) {
        uVar30 = FUN_00052f80();
        FUN_000568f4(uVar30,iVar9 + -1,0,0);
        uVar30 = extraout_r1;
      }
      if (piVar6 != (int *)0x0) {
        (**(code **)(*piVar6 + 0x44))(piVar6,param_1);
        uVar30 = extraout_r1_00;
      }
      FUN_00006ee8(param_1,uVar30,0);
      uVar21 = (ulonglong)extraout_s1_05 << 0x20;
      uVar30 = extraout_s9_00;
      uVar19 = extraout_s3_01;
      uVar13 = extraout_s5_00;
      uVar31 = extraout_s7_00;
    }
    puVar5 = PTR_DAT_004d907c;
    if (piVar6 == (int *)0x0) {
LAB_00007a24:
      lVar26 = (ulonglong)uVar13 << 0x20;
      lVar23 = (ulonglong)uVar19 << 0x20;
      if (*(char *)(param_1 + 0x90) != '\0') {
        uVar7 = (undefined4)(uVar21 >> 0x20);
        fVar17 = *(float *)(param_1 + 0x9c);
        uVar21 = CONCAT44(uVar7,fVar17);
        fVar24 = *(float *)(param_1 + 0xa0);
        lVar26 = CONCAT44(uVar13,fVar24);
        uVar20 = FloatVectorMult(uVar28,uVar21,2,0x20);
        puVar12 = (undefined4 *)(param_1 + 0x9c);
        lVar23 = FloatVectorAdd(uVar20,CONCAT44(uVar19,*(undefined4 *)(param_1 + 0x1c)),2);
        uVar20 = FloatVectorMult(uVar28,lVar26,2,0x20);
        fVar29 = (float)lVar23;
        *(float *)(param_1 + 0x1c) = fVar29;
        uVar20 = FloatVectorAdd(uVar20,CONCAT44(uVar31,*(undefined4 *)(param_1 + 0x20)),2);
        uVar28 = FloatVectorMult(uVar28,CONCAT44(uVar30,*(undefined4 *)(param_1 + 0xa4)),2,0x20);
        fVar27 = (float)uVar20;
        *(float *)(param_1 + 0x20) = fVar27;
        uVar20 = FloatVectorAdd(uVar28,CONCAT44(uVar30,*(undefined4 *)(param_1 + 0x24)),2);
        *(int *)(param_1 + 0x24) = (int)uVar20;
        if (0.0 <= fVar24 || (0.0 <= fVar24 || 0.0 <= fVar27)) {
          bVar16 = fVar24 < 0.0;
          bVar15 = fVar24 == 0.0;
          if (!bVar15 && !bVar16) {
            bVar16 = fVar27 < 0.0;
            bVar15 = fVar27 == 0.0;
            fVar24 = fVar27;
          }
          if ((bVar15 || bVar16 != NAN(fVar24)) &&
             (0.0 <= fVar17 || (0.0 <= fVar17 || 0.0 <= fVar29))) {
            bVar16 = fVar17 < 0.0;
            bVar15 = fVar17 == 0.0;
            if (!bVar15 && !bVar16) {
              bVar16 = fVar29 < 0.0;
              bVar15 = fVar29 == 0.0;
              fVar17 = fVar29;
            }
            if (bVar15 || bVar16 != NAN(fVar17)) goto LAB_00007b20;
          }
        }
        uVar20 = FloatVectorMult(uVar25,CONCAT44(uVar7,DAT_00007768),2,0x20);
        uVar20 = FloatVectorAdd(uVar20,uVar20,2);
        uVar7 = FUN_00009b50(puVar12);
        lVar26 = (ulonglong)extraout_s5_03 << 0x20;
        lVar23 = (ulonglong)extraout_s3_05 << 0x20;
        uVar28 = FloatVectorAdd(uVar20,CONCAT44(uVar7,uVar7),2);
        uVar20 = FloatVectorMult(CONCAT44(extraout_s1_09,*puVar12),uVar28,2,0x20);
        *puVar12 = (int)uVar20;
        uVar20 = FloatVectorMult(uVar28,CONCAT44((int)((ulonglong)uVar20 >> 0x20),
                                                 *(undefined4 *)(param_1 + 0xa0)),2,0x20);
        *(int *)(param_1 + 0xa0) = (int)uVar20;
        uVar21 = FloatVectorMult(uVar28,CONCAT44((int)((ulonglong)uVar20 >> 0x20),
                                                 *(undefined4 *)(param_1 + 0xa4)),2,0x20);
        *(int *)(param_1 + 0xa4) = (int)uVar21;
      }
LAB_00007b20:
      uVar7 = (undefined4)(uVar21 >> 0x20);
      uVar20 = FloatVectorMult(uVar25,CONCAT44(uVar7,*(undefined4 *)(param_1 + 0x1c)),2,0x20);
      uVar30 = (undefined4)((ulonglong)lVar23 >> 0x20);
      uVar20 = FloatVectorAdd(uVar20,CONCAT44((int)((ulonglong)lVar26 >> 0x20),
                                              *(undefined4 *)(param_1 + 0x10)),2);
      uVar28 = FloatVectorMult(uVar25,CONCAT44(uVar30,*(undefined4 *)(param_1 + 0x20)),2,0x20);
      *(int *)(param_1 + 0x10) = (int)uVar20;
      uVar20 = FloatVectorAdd(uVar28,CONCAT44(uVar30,*(undefined4 *)(param_1 + 0x14)),2);
      uVar28 = FloatVectorMult(uVar25,CONCAT44(uVar7,*(undefined4 *)(param_1 + 0x24)),2,0x20);
      *(int *)(param_1 + 0x14) = (int)uVar20;
      uVar21 = FloatVectorAdd(uVar28,CONCAT44(uVar7,*(undefined4 *)(param_1 + 0x18)),2);
      *(int *)(param_1 + 0x18) = (int)uVar21;
    }
    else {
      iVar9 = FUN_00064020(PTR_DAT_004d907c,4);
      uVar19 = FUN_00063fe0(puVar5,*(undefined4 *)PTR_DAT_004d9074);
      uVar21 = CONCAT44(extraout_s1_06,extraout_s0_00);
      bVar16 = uVar19 != 0;
      if (!bVar16) {
        uVar19 = (uint)*(byte *)(param_1 + 0x7c);
      }
      if ((bVar16 || uVar19 != 0) || (*(int *)(param_1 + 0xd8) != 0)) {
        if (*(int *)(param_1 + 0xd8) == 0) {
          if (*(char *)(param_1 + 0x7c) == '\0') {
            uVar25 = CONCAT44(extraout_s5_01,*(undefined4 *)(param_1 + 0xa0));
            uVar40 = FloatVectorMult(uVar28,uVar28,2,0x20);
            uVar21 = CONCAT44(extraout_s1_06,*(undefined4 *)(param_1 + 0x20));
            uVar33 = CONCAT44(extraout_s7_01,*(undefined4 *)(param_1 + 0x9c));
            uVar37 = FloatVectorMult(uVar25,0x3f0000003f000000,2,0x20);
            uVar20 = CONCAT44(extraout_s3_02,*(undefined4 *)(param_1 + 0x1c));
            uVar41 = FloatVectorMult(uVar28,uVar21,2,0x20);
            uVar43 = FloatVectorMult(uVar28,uVar20,2,0x20);
            uVar39 = CONCAT44(extraout_s11,*(undefined4 *)(param_1 + 0xa4));
            uVar34 = CONCAT44(extraout_s9_01,*(undefined4 *)(param_1 + 0x24));
            uVar37 = FloatVectorMult(uVar40,uVar37,2,0x20);
            uVar41 = FloatVectorAdd(uVar37,uVar41,2);
            uVar42 = FloatVectorMult(uVar33,0x3f0000003f000000,2,0x20);
            uVar37 = FloatVectorMult(uVar39,0x3f0000003f000000,2,0x20);
            uVar38 = FloatVectorMult(uVar41,CONCAT44(extraout_s15,DAT_00008280),2,0x20);
            uVar42 = FloatVectorMult(uVar40,uVar42,2,0x20);
            uVar37 = FloatVectorMult(uVar40,uVar37,2,0x20);
            uVar41 = FloatVectorMult(uVar28,uVar34,2,0x20);
            uVar40 = FloatVectorAdd(uVar42,uVar43,2);
            uVar37 = FloatVectorAdd(uVar37,uVar41,2);
            uVar40 = FloatVectorMult(uVar40,CONCAT44(extraout_s15,DAT_00008280),2,0x20);
            uVar41 = FloatVectorMult(uVar37,CONCAT44(extraout_s15,DAT_00008280),2,0x20);
            uVar37 = FloatVectorAdd(uVar40,CONCAT44(extraout_s13,*(undefined4 *)(param_1 + 0x10)),2)
            ;
            *(int *)(param_1 + 0x10) = (int)uVar37;
            uVar37 = FloatVectorAdd(uVar38,CONCAT44((int)((ulonglong)uVar37 >> 0x20),
                                                    *(undefined4 *)(param_1 + 0x14)),2);
            *(int *)(param_1 + 0x14) = (int)uVar37;
            uVar37 = FloatVectorAdd(uVar41,CONCAT44((int)((ulonglong)uVar37 >> 0x20),
                                                    *(undefined4 *)(param_1 + 0x18)),2);
            *(int *)(param_1 + 0x18) = (int)uVar37;
            if (*(char *)(param_1 + 0x90) != '\0') {
              uVar33 = FloatVectorMult(uVar28,uVar33,2,0x20);
              uVar25 = FloatVectorMult(uVar28,uVar25,2,0x20);
              uVar28 = FloatVectorMult(uVar28,uVar39,2,0x20);
              uVar20 = FloatVectorAdd(uVar33,uVar20,2);
              uVar21 = FloatVectorAdd(uVar25,uVar21,2);
              uVar28 = FloatVectorAdd(uVar28,uVar34,2);
              *(int *)(param_1 + 0x1c) = (int)uVar20;
              *(int *)(param_1 + 0x20) = (int)uVar21;
              *(int *)(param_1 + 0x24) = (int)uVar28;
            }
          }
          else {
            *(undefined4 *)(param_1 + 0x1c) = DAT_0052bfe0;
            *(undefined4 *)(param_1 + 0x20) = DAT_0052bfe4;
            *(undefined4 *)(param_1 + 0x24) = DAT_0052bfe8;
          }
        }
        else {
          FUN_00072e58(*(int *)(param_1 + 0xd8),fVar18);
          iVar9 = FUN_00072b64(*(undefined4 *)(param_1 + 0xd8));
          uVar25 = FloatVectorSub(CONCAT44(extraout_s9_02,*(undefined4 *)(iVar9 + 4)),
                                  CONCAT44(extraout_s5_02,*(undefined4 *)(param_1 + 0x10)),2,0x20);
          uVar28 = FloatVectorSub(CONCAT44(extraout_s7_02,*(undefined4 *)(iVar9 + 8)),
                                  CONCAT44(extraout_s3_03,*(undefined4 *)(param_1 + 0x14)),2,0x20);
          uVar20 = FloatVectorSub(CONCAT44(extraout_s11_00,*(undefined4 *)(iVar9 + 0xc)),
                                  CONCAT44(extraout_s1_07,*(undefined4 *)(param_1 + 0x18)),2,0x20);
          *(int *)(param_1 + 0x1c) = (int)uVar25;
          *(int *)(param_1 + 0x20) = (int)uVar28;
          *(int *)(param_1 + 0x24) = (int)uVar20;
          iVar9 = FUN_00072b64((int)uVar20,*(undefined4 *)(param_1 + 0xd8));
          uVar21 = (ulonglong)extraout_s0_01;
          *(undefined4 *)(param_1 + 0x10) = *(undefined4 *)(iVar9 + 4);
          *(undefined4 *)(param_1 + 0x14) = *(undefined4 *)(iVar9 + 8);
          *(undefined4 *)(param_1 + 0x18) = *(undefined4 *)(iVar9 + 0xc);
        }
      }
      else {
        uVar30 = extraout_s9_01;
        uVar19 = extraout_s3_02;
        uVar13 = extraout_s5_01;
        uVar31 = extraout_s7_01;
        if (iVar9 == 0) goto LAB_00007a24;
        fVar17 = *(float *)(iVar9 + 0x68);
        fVar29 = *(float *)(iVar9 + 0x6c);
        uVar33 = FloatVectorSub(CONCAT44(extraout_s1_06,*(undefined4 *)(param_1 + 0x10)),
                                CONCAT44((int)((ulonglong)unaff_d10 >> 0x20),fVar17),2,0x20);
        uVar20 = CONCAT44(extraout_s3_02,*(undefined4 *)(param_1 + 0x18));
        uVar25 = FloatVectorSub(CONCAT44(extraout_s5_01,*(undefined4 *)(param_1 + 0x14)),
                                CONCAT44(uVar7,fVar29),2,0x20);
        uVar34 = FloatVectorSub(uVar20,uVar20,2,0x20);
        uVar39 = FloatVectorMult(uVar33,uVar33,2,0x20);
        uVar20 = FloatVectorMult(uVar25,uVar25,2,0x20);
        uVar34 = FloatVectorMult(uVar34,uVar34,2,0x20);
        uVar20 = FloatVectorAdd(uVar39,uVar20,2);
        uVar20 = FloatVectorAdd(uVar20,uVar34,2);
        fVar24 = (float)FUN_00301044((int)uVar20);
        dVar35 = (double)_atan2(SUB84((double)(float)uVar25,0),
                                (int)((ulonglong)(double)(float)uVar25 >> 0x20),
                                SUB84((double)(float)uVar33,0),
                                (int)((ulonglong)(double)(float)uVar33 >> 0x20));
        uVar20 = FloatVectorMult(uVar28,CONCAT44(extraout_s3_04,*(undefined4 *)(param_1 + 0x1c)),2,
                                 0x20);
        uVar20 = FloatVectorAdd(CONCAT44(extraout_s1_08,(float)dVar35),uVar20,2);
        uVar7 = (undefined4)((ulonglong)(double)(float)uVar20 >> 0x20);
        uVar30 = SUB84((double)(float)uVar20,0);
        dVar35 = (double)_cos(uVar30,uVar7);
        dVar36 = (double)_sin(uVar30,uVar7);
        fVar17 = (float)((double)fVar17 + (double)fVar24 * dVar35);
        uVar21 = (ulonglong)(uint)fVar17;
        *(float *)(param_1 + 0x10) = fVar17;
        *(float *)(param_1 + 0x14) = (float)((double)fVar29 + (double)fVar24 * dVar36);
      }
    }
    if (0.0 < fVar18) {
      iVar9 = 0;
      do {
        iVar11 = param_1 + iVar9 * 2;
        iVar9 = iVar9 + 1;
        *(short *)(iVar11 + 0x88) = *(short *)(iVar11 + 0x84) + *(short *)(iVar11 + 0x88);
      } while (iVar9 != 2);
    }
  }
  else {
    if (*(char *)(param_1 + 0x98) == '\0') {
      uVar21 = FloatVectorSub(CONCAT44(extraout_s1,*(undefined4 *)(param_1 + 0x3c)),
                              CONCAT44(extraout_s3,*(undefined4 *)(puVar2 + 0x44)),2,0x20);
      *(float *)(param_1 + 0x3c) = (float)uVar21;
      if ((int)((uint)((float)uVar21 < 0.0) << 0x1f) < 0) {
        uVar7 = FUN_000065c4();
        piVar8 = (int *)FUN_0000698c(uVar7,5,1);
        piVar8[4] = *(int *)(param_1 + 0x10);
        piVar8[5] = *(int *)(param_1 + 0x14);
        piVar8[6] = *(int *)(param_1 + 0x18);
        uVar19 = (**(code **)(*piVar8 + 8))(piVar8,0,0,0);
        uVar21 = (ulonglong)uVar19;
        *(undefined4 *)(param_1 + 0x3c) = 0x3d4ccccd;
      }
    }
    else {
      if (*(char *)(param_1 + 0x90) != '\0') {
        fVar17 = *(float *)(param_1 + 0x9c);
        uVar20 = CONCAT44(extraout_s1,fVar17);
        fVar24 = *(float *)(param_1 + 0xa0);
        uVar33 = FloatVectorMult(uVar28,uVar20,2,0x20);
        puVar12 = (undefined4 *)(param_1 + 0x9c);
        uVar33 = FloatVectorAdd(uVar33,CONCAT44(extraout_s3,*(undefined4 *)(param_1 + 0x1c)),2);
        uVar34 = FloatVectorMult(uVar28,CONCAT44(extraout_s5,fVar24),2,0x20);
        fVar29 = (float)uVar33;
        *(float *)(param_1 + 0x1c) = fVar29;
        uVar33 = FloatVectorAdd(uVar34,CONCAT44(extraout_s7,*(undefined4 *)(param_1 + 0x20)),2);
        uVar28 = FloatVectorMult(uVar28,CONCAT44(extraout_s9,*(undefined4 *)(param_1 + 0xa4)),2,0x20
                                );
        fVar27 = (float)uVar33;
        *(float *)(param_1 + 0x20) = fVar27;
        uVar28 = FloatVectorAdd(uVar28,CONCAT44(extraout_s9,*(undefined4 *)(param_1 + 0x24)),2);
        *(int *)(param_1 + 0x24) = (int)uVar28;
        if (0.0 <= fVar24 || (0.0 <= fVar24 || 0.0 <= fVar27)) {
          bVar16 = fVar24 < 0.0;
          bVar15 = fVar24 == 0.0;
          if (!bVar15 && !bVar16) {
            bVar16 = fVar27 < 0.0;
            bVar15 = fVar27 == 0.0;
            fVar24 = fVar27;
          }
          if ((bVar15 || bVar16 != NAN(fVar24)) &&
             (0.0 <= fVar17 || (0.0 <= fVar17 || 0.0 <= fVar29))) {
            bVar16 = fVar17 < 0.0;
            bVar15 = fVar17 == 0.0;
            if (!bVar15 && !bVar16) {
              bVar16 = fVar29 < 0.0;
              bVar15 = fVar29 == 0.0;
              fVar17 = fVar29;
            }
            if (bVar15 || bVar16 != NAN(fVar17)) goto LAB_00007784;
          }
        }
        uVar20 = FloatVectorMult(uVar25,CONCAT44(extraout_s1,DAT_00007768),2,0x20);
        unaff_d10 = FloatVectorAdd(uVar20,uVar20,2);
        uVar7 = FUN_00009b50(puVar12);
        uVar28 = FloatVectorAdd(unaff_d10,CONCAT44(uVar7,uVar7),2);
        uVar20 = FloatVectorMult(CONCAT44(extraout_s1_00,*puVar12),uVar28,2,0x20);
        *puVar12 = (int)uVar20;
        uVar20 = FloatVectorMult(uVar28,CONCAT44((int)((ulonglong)uVar20 >> 0x20),
                                                 *(undefined4 *)(param_1 + 0xa0)),2,0x20);
        *(int *)(param_1 + 0xa0) = (int)uVar20;
        uVar20 = FloatVectorMult(uVar28,CONCAT44((int)((ulonglong)uVar20 >> 0x20),
                                                 *(undefined4 *)(param_1 + 0xa4)),2,0x20);
        *(int *)(param_1 + 0xa4) = (int)uVar20;
      }
LAB_00007784:
      uVar30 = *(undefined4 *)(param_1 + 0x24);
      uVar31 = *(undefined4 *)(param_1 + 0x20);
      uVar32 = *(undefined4 *)(param_1 + 0x1c);
      fVar24 = *(float *)(puVar2 + 0xc4);
      uVar7 = FUN_003ecb20((int)uVar20);
      FUN_003ed850(auStack_6c,uVar7);
      fVar17 = *(float *)(puVar2 + 200);
      uVar7 = FUN_003ecb20();
      FUN_003ed850(auStack_74,uVar7);
      uVar20 = FloatVectorMult(uVar25,CONCAT44((int)((ulonglong)unaff_d12 >> 0x20),uVar32),2,0x20);
      uVar20 = FloatVectorSub(uVar20,CONCAT44(extraout_s3_00,fVar24 / (DAT_00007774 / local_68)),2,
                              0x20);
      uVar28 = FloatVectorMult(uVar25,CONCAT44((int)((ulonglong)unaff_d11 >> 0x20),uVar31),2,0x20);
      uVar20 = FloatVectorAdd(uVar20,CONCAT44(extraout_s3_00,*(undefined4 *)(param_1 + 0x10)),2);
      uVar28 = FloatVectorAdd(uVar28,CONCAT44(extraout_s1_04,fVar17 / (DAT_00007774 / local_70)),2);
      *(int *)(param_1 + 0x10) = (int)uVar20;
      uVar20 = FloatVectorAdd(uVar28,CONCAT44((int)((ulonglong)uVar20 >> 0x20),
                                              *(undefined4 *)(param_1 + 0x14)),2);
      uVar28 = FloatVectorMult(uVar25,CONCAT44((int)((ulonglong)unaff_d10 >> 0x20),uVar30),2,0x20);
      *(int *)(param_1 + 0x14) = (int)uVar20;
      uVar21 = FloatVectorAdd(uVar28,CONCAT44((int)((ulonglong)uVar20 >> 0x20),
                                              *(undefined4 *)(param_1 + 0x18)),2);
      *(int *)(param_1 + 0x18) = (int)uVar21;
      if (0.0 < fVar18) {
        iVar9 = 0;
        do {
          iVar11 = param_1 + iVar9 * 2;
          iVar9 = iVar9 + 1;
          uVar28 = FixedToFP((ulonglong)
                             CONCAT24(*(ushort *)(iVar11 + 0x84),(uint)*(ushort *)(iVar11 + 0x84)),0
                             ,0,0,0x20);
          uVar20 = FixedToFP((ulonglong)
                             CONCAT24(*(ushort *)(iVar11 + 0x88),(uint)*(ushort *)(iVar11 + 0x88)),0
                             ,0,0,0x20);
          uVar28 = FloatVectorMult(uVar25,uVar28,2,0x20);
          uVar20 = FloatVectorAdd(uVar20,uVar28,2);
          uVar21 = FPToFixed(uVar20,0,0,3,0x20);
          *(short *)(iVar11 + 0x88) = (short)uVar21;
        } while (iVar9 != 2);
      }
    }
    iVar9 = *(int *)(param_1 + 0x38);
    *(undefined4 *)(iVar9 + 0x14) = 0x3c23d70a;
    *(undefined4 *)(iVar9 + 4) = 0x447a0000;
    *(undefined4 *)(iVar9 + 8) = 0x447a0000;
    *(undefined4 *)(iVar9 + 0xc) = 0;
  }
  puVar5 = PTR_DAT_004d907c;
  if (piVar6 != (int *)0x0) {
    iVar9 = FUN_00064020(PTR_DAT_004d907c,2);
    iVar11 = FUN_00063fe0(puVar5,*(undefined4 *)PTR_DAT_004d9060);
    puVar3 = PTR_DAT_004d905c;
    uVar21 = (ulonglong)extraout_s0_02;
    if (iVar11 == 1) {
      if (*(char *)(param_1 + 0x98) == '\0') {
        iVar11 = FUN_00063fe0(puVar5,*(undefined4 *)PTR_DAT_004d9078);
        fVar18 = *(float *)(param_1 + 0x20);
        uVar21 = CONCAT44(extraout_s1_10,fVar18);
        iVar9 = (uint)(fVar18 < 0.0) << 0x1f;
        if (iVar11 == 1) {
          if (iVar9 < 0) {
            uVar20 = FloatVectorMult(CONCAT44(extraout_s9_03,
                                              *(undefined4 *)(*(int *)(param_1 + 0x38) + 0x14)),
                                     CONCAT44(extraout_s7_03,DAT_00007fa0),2,0x20);
            uVar20 = FloatVectorAdd(CONCAT44(extraout_s5_04,*(undefined4 *)(param_1 + 0x14)),uVar20,
                                    2);
            if ((int)((uint)((float)uVar20 < DAT_00007fa4) << 0x1f) < 0) {
              uVar28 = FloatVectorNeg(uVar21,2,2);
              uVar20 = 0x3f8000003f800000;
              fVar24 = (float)uVar28;
              *(float *)(param_1 + 0x20) = fVar24;
              if (-1 < (int)((uint)(fVar18 < -0.0) << 0x1f)) {
                puVar12 = &DAT_00008288;
                if (-0.0 < fVar18) {
                  puVar12 = &DAT_0000828c;
                }
                uVar20 = CONCAT44(0x80000000,*puVar12);
              }
              fVar17 = fVar24;
              if (-0.0 < fVar18) {
                fVar17 = fVar18;
              }
              if (-1 < (int)((uint)(fVar17 < 9.5) << 0x1f)) {
                fVar24 = 9.5;
              }
              if (fVar18 <= -0.0 || -1 < (int)((uint)(fVar17 < 9.5) << 0x1f)) {
                uVar21 = CONCAT44(extraout_s1_10,fVar24);
              }
              uVar20 = FloatVectorMult(uVar20,uVar21,2,0x20);
              *(int *)(param_1 + 0x20) = (int)uVar20;
              FUN_00063b4c((int)uVar20,1,*(undefined1 *)(param_1 + 0xd4));
              local_ac = 0;
              local_a8 = 0;
              local_a4 = 0;
              uVar19 = FUN_0000577c(*(undefined4 *)(puVar2 + 0x58),&local_ac,0x3f400000,0x3ccccccd,
                                    0x40c00000);
              uVar21 = (ulonglong)uVar19;
            }
          }
        }
        else if (iVar9 < 0) {
          uVar20 = FloatVectorMult(CONCAT44(extraout_s7_03,
                                            *(undefined4 *)(*(int *)(param_1 + 0x38) + 0x14)),
                                   0xc0000000c0000000,2,0x20);
          uVar20 = FloatVectorAdd(CONCAT44(extraout_s5_04,*(undefined4 *)(param_1 + 0x14)),uVar20,2)
          ;
          if ((int)((uint)((float)uVar20 < DAT_00007fa4) << 0x1f) < 0) {
            uVar28 = FloatVectorNeg(uVar21,2,2);
            uVar20 = 0x3f8000003f800000;
            fVar24 = (float)uVar28;
            *(float *)(param_1 + 0x20) = fVar24;
            if (-1 < (int)((uint)(fVar18 < -0.0) << 0x1f)) {
              puVar12 = &DAT_00008288;
              if (-0.0 < fVar18) {
                puVar12 = &DAT_0000828c;
              }
              uVar20 = CONCAT44(0x80000000,*puVar12);
            }
            fVar17 = fVar24;
            if (-0.0 < fVar18) {
              fVar17 = fVar18;
            }
            if (-1 < (int)((uint)(fVar17 < 9.5) << 0x1f)) {
              fVar24 = 9.5;
            }
            if (-1 < (int)((uint)(fVar17 < 9.5) << 0x1f) || fVar18 <= -0.0) {
              uVar21 = CONCAT44(extraout_s1_10,fVar24);
            }
            uVar20 = FloatVectorMult(uVar20,uVar21,2,0x20);
            *(int *)(param_1 + 0x20) = (int)uVar20;
            uVar19 = FUN_00063b4c((int)uVar20,1,*(undefined1 *)(param_1 + 0xd4));
            uVar21 = (ulonglong)uVar19;
          }
        }
      }
    }
    else if (iVar9 == 0) {
      iVar9 = FUN_00063fe0(puVar5,*(undefined4 *)PTR_DAT_004d905c);
      if (iVar9 == 0) {
        iVar9 = FUN_00063fe0(puVar5,*(undefined4 *)PTR_DAT_004d906c);
        uVar21 = (ulonglong)extraout_s0_03;
        if (iVar9 != 1) goto LAB_00007f18;
      }
      puVar4 = PTR_DAT_004d906c;
      iVar9 = FUN_00063fe0(puVar5,*(undefined4 *)PTR_DAT_004d906c);
      iVar11 = 0;
      if (iVar9 == 1) {
        iVar11 = FUN_00063e80(puVar5,*(undefined4 *)puVar4);
      }
      iVar9 = FUN_00063fe0(puVar5,*(undefined4 *)puVar3);
      uVar19 = extraout_s0_04;
      if (iVar9 == 1) {
        iVar11 = FUN_00063e80(puVar5,*(undefined4 *)puVar3);
        uVar19 = extraout_s0_05;
      }
      uVar21 = (ulonglong)uVar19;
      if (((*(char *)(param_1 + 0x98) == '\0') && (*(char *)(param_1 + 0x90) != '\0')) &&
         (uVar21 = (ulonglong)(uint)*(float *)(param_1 + 0x20),
         (int)((uint)(*(float *)(param_1 + 0x20) < 0.0) << 0x1f) < 0)) {
        iVar14 = 0;
        local_bc = 0;
        uVar7 = FUN_000065c4();
        iVar9 = FUN_00006ad0(uVar7,1,&local_bc);
        if (iVar9 != 0) {
          iVar14 = 0;
          do {
            if (((*(char *)(iVar9 + 0x1bc) == '\0') &&
                (*(float *)(iVar9 + 0x10) == *(float *)(param_1 + 0x10))) &&
               ((iVar14 = iVar14 + 1, *(uint *)(param_1 + 4) < *(uint *)(iVar9 + 4) &&
                (*(float *)(iVar9 + 0x20) == 0.0)))) {
              FUN_002ed2c0(auStack_e8,*(int *)(param_1 + 0x38) + 4,*(undefined4 *)(iVar11 + 0x10));
              FUN_002ed2c0(auStack_108,*(int *)(iVar9 + 0x38) + 4,*(undefined4 *)(iVar11 + 0x10));
              uVar20 = FloatVectorMult(CONCAT44(extraout_s1_11,local_d4),0x3f4000003f400000,2,0x20);
              local_d4 = (undefined4)uVar20;
              uVar20 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar20 >> 0x20),local_f4),
                                       0x3f4000003f400000,2,0x20);
              local_f4 = (undefined4)uVar20;
              iVar10 = FUN_002ed344(local_f4,auStack_e8,auStack_108,auStack_c8);
              if (iVar10 == 1) {
                uVar20 = FloatVectorMult(CONCAT44(extraout_s1_12,*(undefined4 *)(iVar11 + 0x10)),
                                         0x3f4000003f400000,2,0x20);
                uVar20 = FloatVectorAdd(uVar20,uVar20,2);
                uVar20 = FloatVectorAdd(CONCAT44(extraout_s1_12,
                                                 *(undefined4 *)(*(int *)(iVar9 + 0x38) + 8)),uVar20
                                        ,2);
                *(int *)(param_1 + 0x14) = (int)uVar20;
                *(undefined4 *)(param_1 + 0x20) = 0;
                iVar9 = *(int *)(param_1 + 0x38);
                uVar7 = *(undefined4 *)(param_1 + 0x10);
                *(undefined4 *)(iVar9 + 4) = uVar7;
                *(undefined4 *)(iVar9 + 8) = *(undefined4 *)(param_1 + 0x14);
                *(undefined4 *)(iVar9 + 0xc) = *(undefined4 *)(param_1 + 0x18);
                FUN_002ed304(uVar7,auStack_108);
                FUN_002ed304(auStack_e8);
                break;
              }
              FUN_002ed304(auStack_108);
              FUN_002ed304(auStack_e8);
            }
            uVar7 = FUN_000065c4();
            iVar9 = FUN_00006af0(uVar7,1,&local_bc);
          } while (iVar9 != 0);
        }
        uVar7 = FUN_000065c4();
        iVar9 = FUN_00006ad0(uVar7,2,&local_bc);
        uVar21 = (ulonglong)extraout_s1_13 << 0x20;
        uVar7 = extraout_s3_06;
        uVar30 = extraout_s5_05;
        if (iVar9 != 0) {
          do {
            if (((iVar9 != param_1) && (*(float *)(iVar9 + 0x10) == *(float *)(param_1 + 0x10))) &&
               ((*(uint *)(param_1 + 4) < *(uint *)(iVar9 + 4) && (*(float *)(iVar9 + 0x20) == 0.0))
               )) {
              FUN_002ed2c0(auStack_134,*(int *)(param_1 + 0x38) + 4,*(undefined4 *)(iVar11 + 0x10));
              FUN_002ed2c0(auStack_154,*(int *)(iVar9 + 0x38) + 4,*(undefined4 *)(iVar11 + 0x10));
              uVar20 = FloatVectorMult(CONCAT44(extraout_s1_14,local_120),0x3f4000003f400000,2,0x20)
              ;
              local_120 = (undefined4)uVar20;
              uVar20 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar20 >> 0x20),local_140),
                                       0x3f4000003f400000,2,0x20);
              local_140 = (undefined4)uVar20;
              iVar10 = FUN_002ed344(local_140,auStack_134,auStack_154,auStack_114);
              if (iVar10 == 1) {
                uVar20 = FloatVectorMult(CONCAT44(extraout_s1_15,*(undefined4 *)(iVar11 + 0x10)),
                                         0x3f4000003f400000,2,0x20);
                uVar20 = FloatVectorAdd(uVar20,uVar20,2);
                uVar20 = FloatVectorAdd(CONCAT44(extraout_s1_15,
                                                 *(undefined4 *)(*(int *)(iVar9 + 0x38) + 8)),uVar20
                                        ,2);
                *(int *)(param_1 + 0x14) = (int)uVar20;
                *(undefined4 *)(param_1 + 0x20) = 0;
                iVar9 = *(int *)(param_1 + 0x38);
                uVar7 = *(undefined4 *)(param_1 + 0x10);
                *(undefined4 *)(iVar9 + 4) = uVar7;
                *(undefined4 *)(iVar9 + 8) = *(undefined4 *)(param_1 + 0x14);
                *(undefined4 *)(iVar9 + 0xc) = *(undefined4 *)(param_1 + 0x18);
                FUN_002ed304(uVar7,auStack_154);
                FUN_002ed304(auStack_134);
                uVar21 = (ulonglong)extraout_s1_17 << 0x20;
                uVar7 = extraout_s3_08;
                uVar30 = extraout_s5_07;
                break;
              }
              FUN_002ed304(auStack_154);
              FUN_002ed304(auStack_134);
            }
            uVar7 = FUN_000065c4();
            iVar9 = FUN_00006af0(uVar7,2,&local_bc);
            uVar21 = (ulonglong)extraout_s1_16 << 0x20;
            uVar7 = extraout_s3_07;
            uVar30 = extraout_s5_06;
          } while (iVar9 != 0);
        }
        if (iVar14 < 1) {
          iVar9 = FUN_00063fe0(puVar5,*(undefined4 *)puVar3);
          uVar21 = CONCAT44(extraout_s1_18,extraout_s0_06);
          uVar7 = extraout_s3_09;
          uVar30 = extraout_s5_08;
          if (iVar9 != 1) goto LAB_00007f18;
        }
        uVar31 = (undefined4)(uVar21 >> 0x20);
        uVar21 = CONCAT44(uVar31,*(float *)(param_1 + 0x20));
        if ((int)((uint)(*(float *)(param_1 + 0x20) < 0.0) << 0x1f) < 0) {
          uVar20 = CONCAT44(uVar7,*(undefined4 *)(iVar11 + 0x10));
          uVar21 = CONCAT44(uVar31,DAT_00008284);
          uVar28 = FloatVectorAdd(CONCAT44(uVar30,*(undefined4 *)(param_1 + 0x14)),uVar20,2);
          if ((int)((uint)((float)uVar28 < DAT_00008284) << 0x1f) < 0) {
            uVar20 = FloatVectorSub(uVar21,uVar20,2,0x20);
            *(int *)(param_1 + 0x14) = (int)uVar20;
            *(undefined4 *)(param_1 + 0x20) = 0;
            iVar9 = *(int *)(param_1 + 0x38);
            uVar21 = (ulonglong)*(uint *)(param_1 + 0x10);
            *(uint *)(iVar9 + 4) = *(uint *)(param_1 + 0x10);
            *(undefined4 *)(iVar9 + 8) = *(undefined4 *)(param_1 + 0x14);
            *(undefined4 *)(iVar9 + 0xc) = *(undefined4 *)(param_1 + 0x18);
          }
        }
      }
    }
    else if (*(char *)(param_1 + 0x98) == '\0') {
      uVar19 = FUN_0006446c(iVar9,param_1,auStack_b8);
      uVar21 = (ulonglong)uVar19;
    }
  }
LAB_00007f18:
  iVar9 = *(int *)(param_1 + 0x38);
  if (iVar9 != 0) {
    *(undefined4 *)(iVar9 + 4) = *(undefined4 *)(param_1 + 0x10);
    *(undefined4 *)(iVar9 + 8) = *(undefined4 *)(param_1 + 0x14);
    *(undefined4 *)(iVar9 + 0xc) = 0;
  }
  iVar9 = FUN_00008290((int)uVar21,param_1);
  if (iVar9 == 1) {
    FUN_00008450(param_1);
  }
  else if ((*(int *)(param_1 + 0x78) == 0) && (*(char *)(param_1 + 0xc4) == '\0')) {
    if ((piVar6 == (int *)0x0) ||
       (iVar9 = FUN_00063fe0(PTR_DAT_004d907c,*(undefined4 *)PTR_DAT_004d9078), iVar9 != 1)) {
      uVar30 = FUN_00033ca0();
      bVar16 = false;
      uVar7 = (&DAT_00556aa4)[*(int *)(param_1 + 100)];
      if (*(float *)(puVar2 + 0x20) == 0.0) {
        bVar16 = true;
      }
    }
    else {
      uVar30 = FUN_00033ca0();
      uVar7 = FUN_002f69c4("bigbomb_smoke",0xd);
      bVar16 = *(float *)(puVar2 + 0x20) == 0.0;
    }
    iVar9 = FUN_00035a08(uVar30,uVar7,0,bVar16);
    *(int *)(param_1 + 0x78) = iVar9;
    if (iVar9 != 0) {
      *(undefined4 *)(iVar9 + 8) = *(undefined4 *)(param_1 + 0x10);
      *(undefined4 *)(iVar9 + 0xc) = *(undefined4 *)(param_1 + 0x14);
      *(undefined4 *)(iVar9 + 0x10) = *(undefined4 *)(param_1 + 0x18);
    }
  }
  *(undefined1 *)(param_1 + 0x7c) = 0;
LAB_00007ff2:
  if (*(int *)puVar1 != local_64) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
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

## FUN_00006ee8 — 00006ee8

```c

undefined4 FUN_00006ee8(int param_1,undefined4 param_2,int param_3)

{
  undefined *puVar1;
  undefined *puVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  int iVar6;
  undefined4 uVar7;
  int iVar8;
  void *pvVar9;
  undefined4 extraout_s0;
  undefined4 extraout_s0_00;
  undefined4 extraout_s1;
  undefined8 uVar10;
  undefined4 extraout_s3;
  undefined8 uVar11;
  undefined4 extraout_s5;
  undefined8 uVar12;
  undefined1 auStack_38 [12];
  undefined4 local_2c;
  undefined4 local_28;
  undefined4 local_24;
  
  if (*(int **)(param_1 + 0xd8) != (int *)0x0) {
    (**(code **)(**(int **)(param_1 + 0xd8) + 4))();
    *(undefined4 *)(param_1 + 0xd8) = 0;
  }
  puVar1 = PTR_DAT_004d9048;
  iVar6 = FUN_0001d10c(PTR_DAT_004d9048);
  uVar7 = extraout_s0;
  if (iVar6 != 0) {
    FUN_0001d10c(puVar1);
    puVar2 = PTR_DAT_004d907c;
    iVar6 = FUN_00064020(PTR_DAT_004d907c,5);
    if (iVar6 != 0) {
      uVar7 = FUN_000065c4();
      iVar8 = FUN_0000698c(uVar7,0,1);
      uVar12 = FloatVectorAdd(CONCAT44(extraout_s5,*(undefined4 *)(param_1 + 0x10)),0,2);
      uVar11 = FloatVectorAdd(CONCAT44(extraout_s3,*(undefined4 *)(param_1 + 0x14)),0,2);
      uVar10 = FloatVectorAdd(CONCAT44(extraout_s1,*(undefined4 *)(param_1 + 0x18)),0,2);
      local_2c = (undefined4)uVar12;
      local_28 = (undefined4)uVar11;
      local_24 = (undefined4)uVar10;
      FUN_00075be4(*(undefined4 *)(iVar6 + 0x70),iVar8,&local_2c,param_1 + 0x1c,
                   *(undefined4 *)(iVar6 + 0x6c),*(undefined4 *)(iVar6 + 0x70),param_1);
      *(undefined1 *)(param_1 + 0x7c) = 1;
      if (param_3 == 1) {
        *(undefined1 *)(iVar8 + 0x5c) = 1;
      }
    }
    FUN_0001d10c(puVar1);
    iVar6 = FUN_00064020(puVar2,7);
    uVar7 = extraout_s0_00;
    if (iVar6 != 0) {
      pvVar9 = operator_new(0x2c);
      FUN_0006523c(auStack_38,iVar6,param_1 + 0x10);
      uVar7 = FUN_000651c4(iVar6);
      FUN_00072988(pvVar9,param_1 + 0x10,auStack_38,uVar7);
      *(void **)(param_1 + 0xd8) = pvVar9;
      uVar5 = DAT_0052bf08;
      uVar4 = DAT_0052bf04;
      uVar3 = DAT_0052bf00;
      uVar7 = *(undefined4 *)(iVar6 + 0x78);
      *(undefined4 *)((int)pvVar9 + 0x1c) = uVar7;
      *(undefined4 *)((int)pvVar9 + 0x20) = uVar3;
      *(undefined4 *)((int)pvVar9 + 0x24) = uVar4;
      *(undefined4 *)((int)pvVar9 + 0x28) = uVar5;
    }
  }
  return uVar7;
}


```

## FUN_0005e5f8 — 0005e5f8

```c

void FUN_0005e5f8(int param_1)

{
  longlong lVar1;
  float fVar2;
  undefined *puVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  int iVar6;
  uint uVar7;
  int iVar8;
  uint uVar9;
  undefined4 uVar10;
  undefined8 in_d0;
  undefined8 uVar11;
  undefined8 uVar12;
  undefined8 uVar13;
  
  puVar3 = PTR_DAT_004d9050;
  fVar2 = DAT_0005e6a4;
  uVar5 = *(undefined4 *)(param_1 + 0x14);
  iVar6 = *(int *)(param_1 + 0x20);
  iVar8 = *(int *)(param_1 + 0x24);
  uVar4 = *(undefined4 *)(PTR_DAT_004d9048 + 0x5c);
  if (iVar6 != iVar8) {
    lVar1 = (ulonglong)*(uint *)PTR_DAT_004d9050 * (ulonglong)*(uint *)(PTR_DAT_004d9050 + 8);
    uVar9 = (uint)lVar1;
    uVar7 = *(int *)(PTR_DAT_004d9050 + 4) * *(uint *)(PTR_DAT_004d9050 + 8) +
            *(uint *)PTR_DAT_004d9050 * *(int *)(PTR_DAT_004d9050 + 0xc) +
            (int)((ulonglong)lVar1 >> 0x20) +
            *(int *)(PTR_DAT_004d9050 + 0x14) +
            (uint)CARRY4(uVar9,*(uint *)(PTR_DAT_004d9050 + 0x10));
    uVar10 = (undefined4)((ulonglong)uVar7 * 0x7ffff >> 0x20);
    *(uint *)PTR_DAT_004d9050 = uVar9 + *(uint *)(PTR_DAT_004d9050 + 0x10);
    *(uint *)(puVar3 + 4) = uVar7;
    iVar8 = iVar8 - iVar6;
    uVar13 = FixedToFP(CONCAT44(iVar8,iVar8),0,0,0,0x20);
    uVar11 = FixedToFP(CONCAT44(uVar10,uVar10),0,1,0,0x20);
    uVar12 = FixedToFP(CONCAT44(iVar6,iVar6),0,0,0,0x20);
    uVar11 = FloatVectorMult(uVar13,CONCAT44((int)((ulonglong)in_d0 >> 0x20),(float)uVar11 / fVar2),
                             2,0x20);
    uVar11 = FloatVectorAdd(uVar12,uVar11,2);
    uVar11 = FPToFixed(uVar11,0,0,3,0x20);
    iVar6 = (int)uVar11;
  }
  FUN_000274bc(uVar4,uVar5,iVar6,0,0);
  return;
}


```

## FUN_0000e6a4 — 0000e6a4

```c

void FUN_0000e6a4(int param_1)

{
  int iVar1;
  ulonglong uVar2;
  longlong lVar3;
  undefined2 uVar4;
  float fVar5;
  undefined *puVar6;
  undefined *puVar7;
  undefined *puVar8;
  undefined4 uVar9;
  uint uVar10;
  uint uVar11;
  int iVar12;
  undefined *puVar13;
  uint uVar14;
  uint uVar15;
  undefined4 uVar16;
  uint uVar17;
  ushort uVar18;
  uint uVar19;
  uint uVar20;
  int iVar21;
  int iVar22;
  undefined8 in_d0;
  undefined8 uVar23;
  undefined4 extraout_s1;
  longlong lVar24;
  uint extraout_s1_00;
  uint extraout_s1_01;
  uint extraout_s1_02;
  undefined4 extraout_s1_03;
  undefined4 extraout_s1_04;
  undefined4 extraout_s1_05;
  uint extraout_s1_06;
  uint extraout_s1_07;
  uint extraout_s1_08;
  uint extraout_s1_09;
  float fVar25;
  undefined8 in_d1;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  undefined4 extraout_s3_01;
  undefined4 extraout_s3_02;
  undefined4 extraout_s3_03;
  undefined4 extraout_s3_04;
  undefined4 extraout_s3_05;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  undefined4 extraout_s5_01;
  undefined4 extraout_s5_02;
  undefined4 extraout_s7;
  undefined4 extraout_s7_00;
  undefined8 unaff_d8;
  undefined8 uVar26;
  undefined8 unaff_d9;
  undefined8 uVar27;
  undefined8 unaff_d10;
  undefined8 uVar28;
  undefined4 uVar29;
  undefined8 unaff_d11;
  undefined8 uVar30;
  undefined4 uVar31;
  undefined8 unaff_d12;
  undefined4 uVar32;
  undefined8 uVar33;
  undefined8 uVar34;
  undefined8 uVar35;
  undefined8 uVar36;
  undefined **local_198;
  undefined *local_194;
  undefined4 local_190 [8];
  undefined1 local_170;
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
  undefined4 local_114;
  undefined4 local_110;
  undefined4 local_104;
  undefined4 local_100;
  undefined4 local_f4;
  undefined4 local_f0;
  undefined1 auStack_e4 [128];
  int local_64;
  
  puVar13 = PTR_DAT_004d9048;
  puVar7 = PTR____stack_chk_guard_004d9044;
  uVar27 = CONCAT44((int)((ulonglong)unaff_d9 >> 0x20),DAT_0000e9b0);
  local_64 = *(int *)PTR____stack_chk_guard_004d9044;
  uVar23 = FloatVectorSub(CONCAT44((int)((ulonglong)in_d1 >> 0x20),
                                   *(undefined4 *)(PTR_DAT_004d9048 + 0x5d4)),
                          CONCAT44((int)((ulonglong)in_d0 >> 0x20),*(undefined4 *)(param_1 + 0x74)),
                          2,0x20);
  if ((int)((uint)((float)uVar23 < DAT_0000e9b0) << 0x1f) < 0) {
    uVar16 = *(undefined4 *)(PTR_DAT_004d9048 + 0x5c);
    uVar9 = FUN_002f69c4("quick_slice",0xb);
    FUN_00027588(uVar16,"quick_slice",uVar9,1,0,0);
  }
  uVar26 = CONCAT44((int)((ulonglong)unaff_d8 >> 0x20),*(undefined4 *)(param_1 + 0x14));
  uVar29 = *(undefined4 *)(param_1 + 0x10);
  uVar32 = (undefined4)((ulonglong)unaff_d12 >> 0x20);
  uVar31 = *(undefined4 *)(param_1 + 0x1c);
  uVar16 = *(undefined4 *)(param_1 + 0x20);
  uVar9 = FUN_00025164();
  uVar28 = FloatVectorMult(CONCAT44((int)((ulonglong)unaff_d10 >> 0x20),uVar16),0x4120000041200000,2
                           ,0x20);
  uVar33 = FloatVectorMult(CONCAT44(uVar32,uVar31),0x4120000041200000,2,0x20);
  uVar23 = FloatVectorMult(CONCAT44(uVar9,uVar9),0xbf000000bf000000,2,0x20);
  uVar33 = FloatVectorAdd(uVar33,CONCAT44((int)((ulonglong)unaff_d11 >> 0x20),uVar29),2);
  if (-1 < (int)((uint)((float)uVar33 < (float)uVar23) << 0x1f)) {
    uVar9 = FUN_00025164();
    uVar23 = FloatVectorMult(CONCAT44(uVar9,uVar9),0x3f0000003f000000,2,0x20);
    if ((float)uVar33 <= (float)uVar23) {
      uVar26 = FloatVectorAdd(uVar28,uVar26,2);
      uVar9 = FUN_000251a8();
      uVar23 = FloatVectorMult(CONCAT44(uVar9,uVar9),0xbf000000bf000000,2,0x20);
      if (-1 < (int)((uint)((float)uVar26 < (float)uVar23) << 0x1f)) {
        uVar9 = FUN_000251a8();
        uVar23 = FloatVectorMult(CONCAT44(uVar9,uVar9),0x3f0000003f000000,2,0x20);
        if ((float)uVar26 <= (float)uVar23) goto LAB_0000e7d6;
      }
    }
  }
  uVar16 = *(undefined4 *)(puVar13 + 0x5c);
  uVar9 = FUN_002f69c4("just_in_time",0xc);
  FUN_00027588(uVar16,"just_in_time",uVar9,1,0,0);
LAB_0000e7d6:
  *(undefined4 *)(param_1 + 0x8c) = *(undefined4 *)(param_1 + 0x1c);
  *(undefined4 *)(param_1 + 0x90) = *(undefined4 *)(param_1 + 0x20);
  puVar8 = PTR_DAT_004d9050;
  *(undefined4 *)(param_1 + 0x94) = *(undefined4 *)(param_1 + 0x24);
  *(undefined4 *)(param_1 + 0x104) = 0;
  *(undefined4 *)(param_1 + 0x88) = 0;
  uVar10 = *(uint *)(puVar8 + 8);
  iVar21 = *(int *)(puVar8 + 0xc);
  uVar19 = *(uint *)(puVar8 + 0x10);
  lVar24 = (ulonglong)*(uint *)puVar8 * (ulonglong)uVar10;
  uVar14 = (uint)lVar24;
  iVar12 = *(int *)(puVar8 + 0x14);
  uVar17 = uVar14 + uVar19;
  uVar14 = *(int *)(puVar8 + 4) * uVar10 +
           *(uint *)puVar8 * iVar21 + (int)((ulonglong)lVar24 >> 0x20) +
           iVar12 + (uint)CARRY4(uVar14,uVar19);
  if (&UNK_00002aa8 < (undefined *)((ulonglong)uVar14 * 0x5550 >> 0x20)) {
    uVar2 = (ulonglong)uVar17;
    uVar11 = (uint)(uVar10 * uVar2);
    iVar22 = iVar21 * uVar17;
    uVar17 = uVar11 + uVar19;
    uVar14 = iVar22 + uVar10 * uVar14 + (int)(uVar10 * uVar2 >> 0x20) + iVar12 +
             (uint)CARRY4(uVar11,uVar19);
  }
  uVar11 = (uint)((ulonglong)uVar17 * (ulonglong)uVar10);
  uVar15 = uVar11 + uVar19;
  uVar11 = uVar14 * uVar10 + uVar17 * iVar21 + (int)((ulonglong)uVar17 * (ulonglong)uVar10 >> 0x20)
           + iVar12 + (uint)CARRY4(uVar11,uVar19);
  *(uint *)puVar8 = uVar17;
  *(uint *)(puVar8 + 4) = uVar14;
  if (&UNK_00002aa8 < (undefined *)((ulonglong)uVar11 * 0x5550 >> 0x20)) {
    uVar2 = (ulonglong)uVar15;
    uVar14 = (uint)(uVar10 * uVar2);
    iVar21 = iVar21 * uVar15;
    uVar15 = uVar14 + uVar19;
    uVar11 = iVar21 + uVar10 * uVar11 + (int)(uVar10 * uVar2 >> 0x20) +
             iVar12 + (uint)CARRY4(uVar14,uVar19);
  }
  *(uint *)puVar8 = uVar15;
  *(uint *)(puVar8 + 4) = uVar11;
  FUN_000148e0(&local_124,param_1 + 0x134);
  uVar33 = FloatVectorMult(CONCAT44(extraout_s3,local_124),0,2,0x20);
  uVar23 = FloatVectorMult(CONCAT44(extraout_s5,local_114),0,2,0x20);
  uVar28 = FloatVectorMult(CONCAT44(extraout_s7,local_110),0,2,0x20);
  uVar35 = FloatVectorMult(CONCAT44(extraout_s1,local_120),0,2,0x20);
  uVar23 = FloatVectorAdd(uVar33,uVar23,2);
  uVar33 = FloatVectorAdd(uVar35,uVar28,2);
  uVar28 = FloatVectorAdd(CONCAT44(extraout_s1,local_104),uVar23,2);
  lVar24 = CONCAT44(extraout_s1,local_f0);
  uVar33 = FloatVectorAdd(CONCAT44(extraout_s3,local_100),uVar33,2);
  uVar23 = CONCAT44(extraout_s3,local_f4);
  if (puVar13[0x17] != '\0') {
    *(undefined1 *)(param_1 + 0x1ba) = 0;
  }
  iVar21 = 1;
  if (*(char *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x330) == '\0') {
    lVar24 = FloatVectorAdd(lVar24,uVar33,2);
    iVar21 = 0;
    uVar23 = FloatVectorAdd(uVar23,uVar28,2);
    uVar28 = FloatVectorNeg(lVar24,2,2);
    uVar33 = FloatVectorNeg(uVar23,2,2);
    uVar28 = FloatVectorAdd(uVar28,uVar33,2);
    if (0.0 < (float)uVar28) {
      iVar21 = FUN_0030113c((int)lVar24,(int)uVar23);
      uVar18 = *(short *)(param_1 + 0x108) + 0x8008;
      uVar28 = FixedToFP(CONCAT44(iVar21 + 0xc004,iVar21 + 0xc004) & 0xffff0000ffff,0,1,0,0x20);
      uVar33 = FixedToFP((ulonglong)CONCAT24(uVar18,(uint)uVar18),0,1,0,0x20);
      uVar9 = (undefined4)((ulonglong)uVar28 >> 0x20);
      fVar25 = (float)uVar33 / DAT_0000e9b4;
      uVar23 = CONCAT44(uVar9,fVar25);
      uVar33 = CONCAT44((int)((ulonglong)uVar33 >> 0x20),DAT_0000e9bc);
      uVar28 = FloatVectorSub(uVar33,CONCAT44(extraout_s7_00,(float)uVar28 / DAT_0000e9b4),2,0x20);
      lVar24 = FloatVectorSub(uVar28,uVar23,2,0x20);
      uVar35 = FloatVectorAbsolute(lVar24,4);
      if (DAT_0000e9b8 < (float)uVar35) {
        if ((float)uVar28 <= fVar25) {
          uVar28 = FloatVectorAdd(uVar28,uVar33,2);
          lVar24 = FloatVectorSub(uVar28,uVar23,2,0x20);
        }
        else {
          uVar23 = CONCAT44(uVar9,DAT_0000e9c0);
          lVar24 = FloatVectorAdd(lVar24,uVar23,2);
        }
      }
      iVar21 = 0;
      if ((int)((uint)((float)lVar24 < 0.0) << 0x1f) < 0) {
        iVar21 = 1;
      }
    }
  }
  uVar10 = *(uint *)puVar8;
  lVar3 = (ulonglong)uVar10 * (ulonglong)*(uint *)(puVar8 + 8);
  uVar14 = (uint)lVar3;
  uVar26 = CONCAT44((int)((ulonglong)uVar26 >> 0x20),*(undefined4 *)(param_1 + 0x10c));
  *(uint *)puVar8 = uVar14 + *(uint *)(puVar8 + 0x10);
  uVar10 = *(int *)(puVar8 + 4) * *(uint *)(puVar8 + 8) +
           uVar10 * *(int *)(puVar8 + 0xc) + (int)((ulonglong)lVar3 >> 0x20) +
           *(int *)(puVar8 + 0x14) + (uint)CARRY4(uVar14,*(uint *)(puVar8 + 0x10));
  *(uint *)(puVar8 + 4) = uVar10;
  fVar25 = DAT_0000e9b4;
  if ((*(char *)(param_1 + 0x1ba) == '\0') || (1 < *(int *)(param_1 + 0x84))) {
    uVar10 = uVar10 >> 0x1f | 2;
    if (*(char *)(param_1 + 0x1b8) == '\0') {
      iVar12 = FUN_0001d10c(puVar13);
      lVar24 = (ulonglong)extraout_s1_06 << 0x20;
      if (iVar12 != 0) {
        FUN_0001d10c(puVar13);
        puVar6 = PTR_DAT_004d9024;
        iVar12 = FUN_0005eef0(PTR_DAT_004d9024);
        lVar24 = (ulonglong)extraout_s1_07 << 0x20;
        if (iVar12 < 0x15) {
          FUN_0001d10c(puVar13);
          iVar12 = FUN_0005eef0(puVar6);
          fVar25 = DAT_0000f264;
          lVar24 = (ulonglong)extraout_s1_08 << 0x20;
          if (iVar12 == 0) {
            local_148 = *(undefined4 *)(param_1 + 0x10);
            local_144 = *(undefined4 *)(param_1 + 0x14);
            local_140 = *(undefined4 *)(param_1 + 0x18);
            uVar23 = FixedToFP((ulonglong)
                               CONCAT24(*(ushort *)(param_1 + 0x108),
                                        (uint)*(ushort *)(param_1 + 0x108)),0,1,0,0x20);
            uVar28 = FloatVectorMult(uVar26,CONCAT44(extraout_s3_04,DAT_0000f268),2,0x20);
            uVar28 = FloatVectorMult(uVar28,uVar27,2,0x20);
            uVar23 = FloatVectorSub(CONCAT44(extraout_s3_04,DAT_0000f26c),
                                    CONCAT44((int)((ulonglong)uVar23 >> 0x20),
                                             (float)uVar23 / DAT_0000f264),2,0x20);
            FUN_00011d10(&local_148,(int)uVar23,(int)uVar28,1,0,0x3f800000);
            local_154 = *(undefined4 *)(param_1 + 0x10);
            local_150 = *(undefined4 *)(param_1 + 0x14);
            local_14c = *(undefined4 *)(param_1 + 0x18);
            uVar23 = FixedToFP((ulonglong)
                               CONCAT24(*(ushort *)(param_1 + 0x108),
                                        (uint)*(ushort *)(param_1 + 0x108)),0,1,0,0x20);
            uVar23 = FloatVectorSub(CONCAT44(extraout_s3_05,DAT_0000f270),
                                    CONCAT44((int)((ulonglong)uVar23 >> 0x20),(float)uVar23 / fVar25
                                            ),2,0x20);
            FUN_00011d10(&local_154,(int)uVar23,(int)uVar28,1,0,0x3f800000);
            lVar24 = (ulonglong)extraout_s1_09 << 0x20;
            uVar26 = FloatVectorMult(uVar26,0x3fc000003fc00000,2,0x20);
            uVar10 = DAT_0052bf54;
          }
        }
      }
    }
  }
  else {
    local_130 = *(undefined4 *)(param_1 + 0x10);
    local_12c = *(undefined4 *)(param_1 + 0x14);
    local_128 = *(undefined4 *)(param_1 + 0x18);
    uVar9 = (undefined4)((ulonglong)uVar23 >> 0x20);
    uVar23 = FixedToFP((ulonglong)
                       CONCAT24(*(ushort *)(param_1 + 0x108),(uint)*(ushort *)(param_1 + 0x108)),0,1
                       ,0,0x20);
    uVar28 = FloatVectorMult(uVar26,CONCAT44(uVar9,DAT_0000e9c4),2,0x20);
    uVar28 = FloatVectorMult(uVar28,uVar27,2,0x20);
    uVar23 = FloatVectorSub(CONCAT44(uVar9,DAT_0000e9c8),
                            CONCAT44((int)((ulonglong)uVar23 >> 0x20),(float)uVar23 / DAT_0000e9b4),
                            2,0x20);
    FUN_00011d10(&local_130,(int)uVar23,(int)uVar28,1,0,0x3f800000);
    local_13c = *(undefined4 *)(param_1 + 0x10);
    local_138 = *(undefined4 *)(param_1 + 0x14);
    local_134 = *(undefined4 *)(param_1 + 0x18);
    uVar23 = FixedToFP((ulonglong)
                       CONCAT24(*(ushort *)(param_1 + 0x108),(uint)*(ushort *)(param_1 + 0x108)),0,1
                       ,0,0x20);
    uVar23 = FloatVectorSub(CONCAT44(extraout_s3_00,DAT_0000e9cc),
                            CONCAT44((int)((ulonglong)uVar23 >> 0x20),(float)uVar23 / fVar25),2,0x20
                           );
    FUN_00011d10(&local_13c,(int)uVar23,(int)uVar28,1,0,0x3f800000);
    lVar24 = (ulonglong)extraout_s1_00 << 0x20;
    uVar26 = FloatVectorMult(uVar26,0x3fc000003fc00000,2,0x20);
    uVar10 = DAT_0052bf54;
  }
  if ((*(int *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x314) == 0x32) ||
     (*(char *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x330) != '\0')) {
    uVar26 = FloatVectorMult(uVar26,0x3fc000003fc00000,2,0x20);
    uVar10 = DAT_0052bf54;
  }
  if (puVar13[0x18] != '\0') {
    iVar12 = FUN_0000fa78(param_1);
    lVar24 = (ulonglong)extraout_s1_01 << 0x20;
    if ((iVar12 == 1) && (1 < *(int *)(param_1 + 0x84))) {
      uVar10 = 0;
    }
  }
  fVar5 = DAT_0000e9d8;
  fVar25 = DAT_0000e9d0;
  if (0 < (int)uVar10) {
    uVar27 = FixedToFP(CONCAT44(uVar10,uVar10),0,0,0,0x20);
    uVar23 = CONCAT44(uVar32,DAT_0000e9d4);
    uVar28 = CONCAT44(DAT_0000e9d0,DAT_0000e9d8);
    uVar14 = 0;
    do {
      uVar17 = *(uint *)(puVar8 + 8);
      uVar19 = *(uint *)(puVar8 + 0x10);
      lVar24 = (ulonglong)*(uint *)puVar8 * (ulonglong)uVar17;
      uVar11 = (uint)lVar24;
      uVar15 = uVar11 + uVar19;
      lVar3 = (ulonglong)uVar15 * (ulonglong)uVar17;
      uVar20 = (uint)lVar3;
      uVar11 = *(int *)(puVar8 + 4) * uVar17 +
               *(uint *)puVar8 * *(int *)(puVar8 + 0xc) + (int)((ulonglong)lVar24 >> 0x20) +
               *(int *)(puVar8 + 0x14) + (uint)CARRY4(uVar11,uVar19);
      uVar17 = uVar11 * uVar17 + uVar15 * *(int *)(puVar8 + 0xc) + (int)((ulonglong)lVar3 >> 0x20) +
               *(int *)(puVar8 + 0x14) + (uint)CARRY4(uVar20,uVar19);
      uVar9 = (undefined4)((ulonglong)uVar17 * 0x7ffff >> 0x20);
      *(uint *)puVar8 = uVar20 + uVar19;
      *(uint *)(puVar8 + 4) = uVar17;
      uVar33 = FixedToFP(CONCAT44(uVar9,uVar9),0,1,0,0x20);
      uVar35 = FixedToFP(CONCAT44(uVar14,uVar14),0,0,0,0x20);
      uVar35 = FloatVectorMult(uVar35,uVar23,2,0x20);
      uVar35 = FloatVectorAdd(uVar35,0x40a0000040a00000,2);
      uVar33 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar33 >> 0x20),(float)uVar33 / fVar25),
                               0x3f0000003f000000,2,0x20);
      uVar33 = FloatVectorAdd(uVar33,0x3f8000003f800000,2);
      iVar12 = FUN_0001bcc0();
      uVar33 = FloatVectorMult(uVar26,uVar33,2,0x20);
      uVar17 = (uint)*(byte *)(param_1 + 0x3c);
      uVar33 = FloatVectorMult(uVar35,uVar33,2,0x20);
      if (*(char *)(param_1 + 0x1ba) != '\0') {
        uVar17 = uVar17 + DAT_005d4cd0;
      }
      local_160 = *(undefined4 *)(param_1 + 0x10);
      local_15c = *(undefined4 *)(param_1 + 0x14);
      local_158 = *(undefined4 *)(param_1 + 0x18);
      uVar4 = (undefined2)((ulonglong)uVar11 * 0xfff0 >> 0x20);
      uVar9 = FUN_003010b8(uVar4);
      uVar16 = FUN_003010d0(uVar4);
      uVar35 = FloatVectorMult(uVar33,CONCAT44(uVar9,uVar9),2,0x20);
      uVar33 = FloatVectorMult(uVar33,CONCAT44(uVar16,uVar16),2,0x20);
      local_16c = (undefined4)uVar35;
      local_168 = (undefined4)uVar33;
      local_164 = 0;
      FUN_0001a7cc(local_16c,iVar12,&local_160,&local_16c,0,
                   *(undefined1 *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x330),
                   uVar17);
      uVar33 = FixedToFP(CONCAT44(uVar14 - 2,uVar14 - 2),0,0,0,0x20);
      uVar35 = FloatVectorSub(0x3f8000003f800000,
                              CONCAT44((int)((ulonglong)uVar33 >> 0x20),
                                       (float)uVar33 / (float)uVar27),2,0x20);
      uVar33 = uVar28;
      if (fVar5 < (float)uVar35) {
        uVar33 = uVar35;
      }
      lVar24 = FloatVectorMult(uVar33,CONCAT44((int)((ulonglong)uVar35 >> 0x20),
                                               *(undefined4 *)(iVar12 + 100)),2,0x20);
      *(int *)(iVar12 + 100) = (int)lVar24;
      if (2 < (int)uVar14) {
        uVar9 = (undefined4)((ulonglong)uVar33 >> 0x20);
        uVar33 = FloatVectorMult(CONCAT44(uVar9,DAT_0052bf5c),
                                 CONCAT44((int)((ulonglong)lVar24 >> 0x20),
                                          *(undefined4 *)(iVar12 + 0x5c)),2,0x20);
        *(int *)(iVar12 + 0x5c) = (int)uVar33;
        uVar33 = FloatVectorMult(CONCAT44(uVar9,DAT_0052bf5c),
                                 CONCAT44((int)((ulonglong)uVar33 >> 0x20),
                                          *(undefined4 *)(iVar12 + 0x60)),2,0x20);
        *(int *)(iVar12 + 0x60) = (int)uVar33;
        uVar33 = CONCAT44((int)((ulonglong)uVar33 >> 0x20),DAT_0052bf58);
        uVar35 = FloatVectorMult(uVar33,CONCAT44(uVar9,*(undefined4 *)(iVar12 + 0x44)),2,0x20);
        *(int *)(iVar12 + 0x44) = (int)uVar35;
        uVar35 = FloatVectorMult(uVar33,CONCAT44((int)((ulonglong)uVar35 >> 0x20),
                                                 *(undefined4 *)(iVar12 + 0x48)),2,0x20);
        *(int *)(iVar12 + 0x48) = (int)uVar35;
        lVar24 = FloatVectorMult(uVar33,CONCAT44((int)((ulonglong)uVar35 >> 0x20),
                                                 *(undefined4 *)(iVar12 + 0x4c)),2,0x20);
        *(int *)(iVar12 + 0x4c) = (int)lVar24;
      }
      uVar14 = uVar14 + 1;
    } while (uVar10 != uVar14);
    if (0 < (int)uVar10) {
      lVar3 = (ulonglong)*(uint *)puVar8 * (ulonglong)*(uint *)(puVar8 + 8);
      uVar14 = (uint)lVar3;
      uVar10 = *(int *)(puVar8 + 4) * *(uint *)(puVar8 + 8) +
               *(uint *)puVar8 * *(int *)(puVar8 + 0xc) + (int)((ulonglong)lVar3 >> 0x20) +
               *(int *)(puVar8 + 0x14) + (uint)CARRY4(uVar14,*(uint *)(puVar8 + 0x10));
      *(uint *)puVar8 = uVar14 + *(uint *)(puVar8 + 0x10);
      *(uint *)(puVar8 + 4) = uVar10;
      FUN_002f702c((int)lVar24,auStack_e4,0x80,"Clean-Slice-%d",
                   (int)((ulonglong)uVar10 * 3 >> 0x20) + 1);
      local_198 = &PTR_LAB_0052bf38;
      local_194 = PTR_FUN_004d9058;
      local_170 = 1;
      local_190[0] = 0;
      uVar9 = *(undefined4 *)(puVar13 + 0x1a4);
      FUN_0000a23c(&local_198,local_190);
      FUN_0002bc94(uVar9,auStack_e4,0x3f800000,0x3f800000,local_190,0);
      FUN_0000a298(local_190);
      lVar24 = (ulonglong)extraout_s1_02 << 0x20;
    }
  }
  uVar10 = *(uint *)(puVar8 + 8);
  iVar22 = *(int *)(puVar8 + 0xc);
  lVar3 = (ulonglong)*(uint *)puVar8 * (ulonglong)uVar10;
  uVar14 = (uint)lVar3;
  uVar19 = *(uint *)(puVar8 + 0x10);
  iVar12 = *(int *)(puVar8 + 0x14);
  uVar28 = CONCAT44((int)((ulonglong)lVar24 >> 0x20),DAT_0000f164);
  uVar17 = uVar14 + uVar19;
  uVar14 = *(int *)(puVar8 + 4) * uVar10 +
           *(uint *)puVar8 * iVar22 + (int)((ulonglong)lVar3 >> 0x20) +
           iVar12 + (uint)CARRY4(uVar14,uVar19);
  puVar13 = &UNK_00002aa9;
  uVar27 = CONCAT44((int)((ulonglong)uVar27 >> 0x20),
                    *(undefined4 *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x24c))
  ;
  *(uint *)puVar8 = uVar17;
  *(uint *)(puVar8 + 4) = uVar14;
  uVar23 = uVar28;
  if (&UNK_00002aa9 <= (undefined *)((ulonglong)uVar14 * 0x5550 >> 0x20)) {
    uVar2 = (ulonglong)uVar17;
    uVar11 = (uint)(uVar10 * uVar2);
    iVar1 = iVar22 * uVar17;
    uVar17 = uVar11 + uVar19;
    uVar14 = iVar1 + uVar10 * uVar14 + (int)(uVar10 * uVar2 >> 0x20) +
             iVar12 + (uint)CARRY4(uVar11,uVar19);
    *(uint *)puVar8 = uVar17;
    *(uint *)(puVar8 + 4) = uVar14;
    uVar9 = (undefined4)((ulonglong)uVar14 * 0x5550 >> 0x20);
    uVar23 = FixedToFP(CONCAT44(uVar9,uVar9),0,1,0,0x20);
  }
  uVar11 = (uint)((ulonglong)uVar17 * (ulonglong)uVar10);
  uVar33 = FloatVectorSub(0x3f8000003f800000,uVar27,2,0x20);
  uVar23 = FloatVectorMult(uVar33,uVar23,2,0x20);
  uVar15 = uVar11 + uVar19;
  uVar23 = FloatVectorMult(uVar23,0x4080000040800000,2,0x20);
  uVar14 = uVar14 * uVar10 + uVar17 * iVar22 + (int)((ulonglong)uVar17 * (ulonglong)uVar10 >> 0x20)
           + iVar12 + (uint)CARRY4(uVar11,uVar19);
  uVar23 = FPToFixed(uVar23,0,0,3,0x20);
  lVar24 = (ulonglong)uVar14 * 0x5550;
  *(uint *)puVar8 = uVar15;
  *(uint *)(puVar8 + 4) = uVar14;
  if (&UNK_00002aa8 < (undefined *)((ulonglong)lVar24 >> 0x20)) {
    uVar17 = (uint)((ulonglong)uVar10 * (ulonglong)uVar15);
    uVar10 = iVar22 * uVar15 +
             uVar10 * uVar14 + (int)((ulonglong)uVar10 * (ulonglong)uVar15 >> 0x20) +
             iVar12 + (uint)CARRY4(uVar17,uVar19);
    puVar13 = (undefined *)((ulonglong)uVar10 * 0x5550);
    uVar9 = (undefined4)((ulonglong)uVar10 * 0x5550 >> 0x20);
    lVar24 = CONCAT44(uVar10,uVar9);
    *(uint *)puVar8 = uVar17 + uVar19;
    *(uint *)(puVar8 + 4) = uVar10;
    uVar28 = FixedToFP(CONCAT44(uVar9,uVar9),0,1,0,0x20);
  }
  uVar28 = FloatVectorMult(uVar33,uVar28,2,0x20);
  uVar18 = *(ushort *)(param_1 + 0x108);
  uVar28 = FloatVectorMult(uVar28,0x4080000040800000,2,0x20);
  uVar28 = FPToFixed(uVar28,0,0,3,0x20);
  if (iVar21 == 1) {
    uVar10 = uVar18 + 0x7ff8;
    *(short *)(param_1 + 0x108) = (short)uVar10;
    iVar12 = (uVar10 & 0xffff) - (int)uVar28;
    uVar18 = (ushort)iVar12;
    uVar14 = iVar12 + 0x7ff8U & 0xffff;
    uVar9 = FUN_003010b8(uVar14,0x7ff8,uVar10 & 0xffff,puVar13);
    uVar16 = FUN_003010d0(uVar14);
    uVar35 = CONCAT44(uVar16,uVar16);
    uVar28 = CONCAT44(uVar9,uVar9);
    uVar10 = (int)uVar23 + (uVar10 & 0xffff);
    uVar9 = extraout_s1_03;
    uVar16 = extraout_s3_01;
    uVar29 = extraout_s5_00;
  }
  else {
    uVar10 = (int)uVar28 + (uint)uVar18;
    uVar9 = FUN_003010b8(uVar10 & 0xffff,(int)((ulonglong)lVar24 >> 0x20),(int)lVar24,puVar13);
    uVar16 = FUN_003010d0(uVar10 & 0xffff);
    uVar35 = CONCAT44(uVar16,uVar16);
    uVar28 = CONCAT44(uVar9,uVar9);
    uVar18 = uVar18 - (short)uVar23;
    uVar9 = extraout_s1_04;
    uVar16 = extraout_s3_02;
    uVar29 = extraout_s5_01;
  }
  uVar35 = FloatVectorMult(uVar26,uVar35,2,0x20);
  uVar23 = FloatVectorMult(uVar26,uVar28,2,0x20);
  uVar28 = FloatVectorMult(uVar33,CONCAT44(uVar16,*(undefined4 *)(param_1 + 0x1c)),2,0x20);
  uVar30 = FloatVectorMult(uVar27,0,2,0x20);
  uVar35 = FloatVectorMult(uVar27,uVar35,2,0x20);
  uVar23 = FloatVectorMult(uVar27,uVar23,2,0x20);
  uVar36 = FloatVectorMult(uVar33,CONCAT44(uVar29,*(undefined4 *)(param_1 + 0x24)),2,0x20);
  uVar34 = FloatVectorMult(uVar33,CONCAT44(uVar9,*(undefined4 *)(param_1 + 0x20)),2,0x20);
  uVar28 = FloatVectorAdd(uVar23,uVar28,2);
  uVar23 = FloatVectorAdd(uVar30,uVar36,2);
  uVar35 = FloatVectorAdd(uVar35,uVar34,2);
  *(int *)(param_1 + 0x128) = (int)uVar28;
  *(int *)(param_1 + 300) = (int)uVar35;
  *(int *)(param_1 + 0x130) = (int)uVar23;
  if (iVar21 == 1) {
    uVar10 = uVar10 + 0x7ff8 & 0xffff;
  }
  else {
    uVar10 = (uint)uVar18;
  }
  uVar9 = FUN_003010b8((int)uVar23,uVar10);
  uVar16 = FUN_003010d0(uVar10);
  uVar23 = FloatVectorMult(uVar26,CONCAT44(uVar9,uVar9),2,0x20);
  uVar28 = FloatVectorMult(uVar26,CONCAT44(uVar16,uVar16),2,0x20);
  uVar36 = FloatVectorMult(uVar33,CONCAT44(extraout_s5_02,*(undefined4 *)(param_1 + 0x20)),2,0x20);
  uVar34 = FloatVectorMult(uVar33,CONCAT44(extraout_s1_05,*(undefined4 *)(param_1 + 0x1c)),2,0x20);
  uVar23 = FloatVectorMult(uVar27,uVar23,2,0x20);
  uVar35 = FloatVectorMult(uVar27,uVar28,2,0x20);
  uVar28 = FloatVectorMult(uVar33,CONCAT44(extraout_s3_03,*(undefined4 *)(param_1 + 0x24)),2,0x20);
  uVar27 = FloatVectorAdd(uVar23,uVar34,2);
  uVar23 = FloatVectorAdd(uVar35,uVar36,2);
  uVar28 = FloatVectorAdd(uVar30,uVar28,2);
  *(int *)(param_1 + 0x1c) = (int)uVar27;
  uVar9 = (undefined4)uVar23;
  *(undefined4 *)(param_1 + 0x20) = uVar9;
  *(int *)(param_1 + 0x24) = (int)uVar28;
  if (((*(char *)(param_1 + 0x1ba) == '\0') &&
      (*(int *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x314) != 0x32)) &&
     (*(char *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x330) == '\0')) {
    if (*(char *)(param_1 + 0x1b8) == '\0') {
      uVar9 = FUN_00021a78(param_1 + 0xd8);
    }
  }
  else {
    uVar9 = FUN_003010b8(*(short *)(param_1 + 0x108) + 0x3ffc);
    uVar16 = FUN_003010d0(*(short *)(param_1 + 0x108) + 0x3ffc);
    *(undefined4 *)(param_1 + 0x130) = 0;
    uVar23 = FloatVectorMult(uVar26,CONCAT44(uVar9,uVar9),2,0x20);
    uVar27 = FloatVectorMult(uVar26,CONCAT44(uVar16,uVar16),2,0x20);
    uVar23 = FPToFixed(uVar23,0,0,3,0x20);
    uVar27 = FPToFixed(uVar27,0,0,3,0x20);
    uVar23 = FixedToFP(uVar23,0,0,0,0x20);
    uVar27 = FixedToFP(uVar27,0,0,0,0x20);
    uVar23 = FloatVectorMult(uVar23,0x3fe000003fe00000,2,0x20);
    uVar27 = FloatVectorMult(uVar27,0x3fe000003fe00000,2,0x20);
    *(int *)(param_1 + 0x128) = (int)uVar23;
    *(int *)(param_1 + 300) = (int)uVar27;
    uVar9 = FUN_003010b8((int)uVar23,*(short *)(param_1 + 0x108) + -0x3ffc);
    uVar23 = FloatVectorMult(uVar26,CONCAT44(uVar9,uVar9),2,0x20);
    uVar9 = FUN_003010d0(*(short *)(param_1 + 0x108) + -0x3ffc);
    *(undefined4 *)(param_1 + 0x24) = 0;
    uVar27 = FPToFixed(uVar23,0,0,3,0x20);
    uVar23 = FloatVectorMult(uVar26,CONCAT44(uVar9,uVar9),2,0x20);
    uVar26 = FixedToFP(uVar27,0,0,0,0x20);
    uVar27 = FPToFixed(uVar23,0,0,3,0x20);
    uVar23 = FloatVectorMult(uVar26,0x3fe000003fe00000,2,0x20);
    uVar27 = FixedToFP(uVar27,0,0,0,0x20);
    uVar27 = FloatVectorMult(uVar27,0x3fe000003fe00000,2,0x20);
    uVar9 = (undefined4)uVar23;
    *(undefined4 *)(param_1 + 0x1c) = uVar9;
    *(int *)(param_1 + 0x20) = (int)uVar27;
  }
  *(undefined1 *)(param_1 + 0x1bc) = 1;
  if (*(int **)(param_1 + 0xb4) != (int *)0x0) {
    uVar9 = (**(code **)(**(int **)(param_1 + 0xb4) + 4))();
    *(undefined4 *)(param_1 + 0xb4) = 0;
  }
  FUN_00011f30(uVar9,param_1,
               *(undefined1 *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x330),
               iVar21);
  if (*(int *)puVar7 == local_64) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

## FUN_000559e4 — 000559e4

```c

void FUN_000559e4(int param_1,undefined4 param_2)

{
  undefined *puVar1;
  undefined *puVar2;
  undefined *puVar3;
  undefined *puVar4;
  undefined *puVar5;
  byte bVar6;
  int iVar7;
  undefined4 uVar8;
  uint uVar9;
  int *piVar10;
  int iVar11;
  int iVar12;
  undefined4 uVar13;
  float *pfVar14;
  int iVar15;
  uint uVar16;
  int iVar17;
  bool bVar18;
  bool bVar19;
  float fVar20;
  float fVar21;
  undefined4 extraout_s1;
  longlong lVar22;
  undefined4 extraout_s1_00;
  uint extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined4 extraout_s1_03;
  undefined4 extraout_s1_04;
  undefined4 extraout_s1_05;
  undefined4 extraout_s1_06;
  undefined4 extraout_s1_07;
  float fVar23;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  undefined4 extraout_s5_01;
  undefined8 uVar24;
  undefined8 unaff_d9;
  undefined8 unaff_d10;
  undefined8 unaff_d11;
  undefined8 uVar25;
  undefined8 uVar26;
  undefined8 uVar27;
  undefined8 uVar28;
  undefined8 uVar29;
  undefined8 uVar30;
  undefined8 uVar31;
  undefined8 uVar32;
  undefined8 uVar33;
  int local_110;
  undefined4 local_10c;
  undefined4 local_108;
  undefined4 local_104;
  undefined4 local_100;
  undefined4 local_fc;
  undefined4 local_f8;
  undefined4 local_ec;
  undefined4 local_e8;
  undefined4 local_e4;
  undefined4 local_e0;
  undefined1 *local_dc;
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
  undefined4 local_a4;
  undefined4 local_a0;
  undefined4 local_9c;
  undefined4 local_98;
  undefined4 local_8c;
  undefined1 local_80;
  undefined1 local_7f;
  undefined4 local_7c;
  undefined8 local_78;
  undefined8 uStack_70;
  undefined4 local_68;
  int local_64;
  
  puVar2 = PTR_DAT_004d9048;
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_64 = *(int *)PTR____stack_chk_guard_004d9044;
  if ((*(int **)PTR_DAT_004d9048 != (int *)0x0) &&
     (iVar7 = (**(code **)(**(int **)PTR_DAT_004d9048 + 0x24))(), iVar7 == 0)) {
    *(undefined4 *)(param_1 + 0x78) = 0x3f800000;
    *(undefined4 *)(param_1 + 100) = 0x3f800000;
    *(undefined4 *)(param_1 + 0x68) = 0x3f800000;
    *(undefined4 *)(param_1 + 0x6c) = 0x3f800000;
    *(undefined4 *)(param_1 + 0x70) = 0x3f800000;
    bVar6 = FUN_0001cd6c();
    uVar8 = param_2;
    if ((bVar6 & puVar2[0x1bf] == '\0') != 0) {
      uVar8 = 0;
    }
    uVar24 = FloatVectorMult(CONCAT44(extraout_s5,*(undefined4 *)(param_1 + 0x7c)),
                             CONCAT44(uVar8,param_2),2,0x20);
    fVar21 = (float)uVar24;
    if (((int)((uint)(*(float *)(puVar2 + 0x20) < 1.0) << 0x1f) < 0) &&
       (iVar7 = FUN_0001cd30(), iVar7 == 1)) {
      uVar8 = FUN_00031290();
      FUN_00032064(uVar8,fVar21);
      FUN_00031290();
      iVar7 = FUN_00031290();
      uVar8 = *(undefined4 *)(iVar7 + 100);
    }
    else {
      FUN_00031290();
      FUN_0003200c();
      uVar8 = 0x3f800000;
    }
    *(undefined4 *)(param_1 + 0x78) = uVar8;
    if ((puVar2[0x17] == '\0') || (*(int *)(param_1 + 0x16c) < 1)) {
      uVar9 = FUN_0001cd6c();
      bVar19 = uVar9 == 1;
      if (bVar19) {
        uVar9 = (uint)(byte)puVar2[0x1bf];
      }
      if (!bVar19 || (uVar9 & 0xff) != 0) {
        iVar7 = param_1 + *(int *)(puVar2 + 0x10) * 4;
        uVar28 = FloatVectorMult(uVar24,CONCAT44(extraout_s5_00,*(undefined4 *)(iVar7 + 0x80)),2,
                                 0x20);
        uVar28 = FloatVectorAdd(CONCAT44(extraout_s3,*(undefined4 *)(param_1 + 0x74)),uVar28,2);
        fVar23 = (float)uVar28;
        fVar20 = *(float *)(iVar7 + 0x88);
        if ((*(float *)(iVar7 + 0x88) < fVar23) &&
           (fVar20 = *(float *)(iVar7 + 0x90), fVar23 < *(float *)(iVar7 + 0x90))) {
          fVar20 = fVar23;
        }
        pfVar14 = (float *)(puVar2 + 0x5d4);
        *(float *)(param_1 + 0x74) = fVar20;
        lVar22 = FloatVectorAdd(uVar24,CONCAT44(extraout_s1,*pfVar14),2);
        *pfVar14 = (float)lVar22;
        if ((10.5 < (float)lVar22) &&
           (uVar28 = FloatVectorSub(lVar22,uVar24,2,0x20), (float)uVar28 <= 10.5)) {
          uVar13 = *(undefined4 *)(puVar2 + 0x5c);
          uVar8 = FUN_002f69c4("retries_in_a_row",0x10);
          FUN_00027708(uVar13,uVar8);
          lVar22 = CONCAT44(extraout_s1_00,*pfVar14);
        }
        if (puVar2[0x5d0] != '\0') {
          fVar20 = (float)lVar22;
          bVar19 = fVar20 < 5.0;
          bVar18 = fVar20 == 5.0;
          if (!bVar18 && !bVar19) {
            bVar19 = fVar21 < 0.0;
            bVar18 = fVar21 == 0.0;
            fVar20 = fVar21;
          }
          if (!bVar18 && bVar19 == NAN(fVar20)) {
            iVar7 = FUN_0001cf84();
            lVar22 = (ulonglong)extraout_s1_01 << 0x20;
            if (iVar7 == 0) {
              puVar2[0x5d0] = 0;
            }
          }
        }
        fVar21 = DAT_00055bd8;
        uVar24 = FloatVectorAdd(uVar24,CONCAT44((int)((ulonglong)lVar22 >> 0x20),
                                                *(undefined4 *)(param_1 + 0x214)),2);
        if (DAT_00055bd8 < (float)uVar24) {
          unaff_d10 = CONCAT44((int)((ulonglong)unaff_d10 >> 0x20),DAT_00055bdc);
          do {
            if (*(int *)(puVar2 + 0x10) == 1) {
              piVar10 = (int *)(param_1 + *(int *)(param_1 + 0x164) * 0xc + 0x140);
            }
            else {
              piVar10 = (int *)(param_1 + *(int *)(puVar2 + 0x10) * 0xc + 0x98);
            }
            if (piVar10[1] != *piVar10) {
              FUN_00056098(param_1,0x3c888889,0);
            }
            uVar24 = FloatVectorAdd(uVar24,unaff_d10,2);
          } while (fVar21 < (float)uVar24);
        }
        *(int *)(param_1 + 0x214) = (int)uVar24;
        iVar7 = FUN_0001d10c(puVar2);
        if (iVar7 != 0) {
          FUN_0001d10c(puVar2);
          puVar5 = PTR_DAT_004d907c;
          puVar3 = PTR_DAT_004d905c;
          iVar7 = FUN_00063fe0(PTR_DAT_004d907c,*(undefined4 *)PTR_DAT_004d905c);
          if (iVar7 == 0) {
            FUN_0001d10c(puVar2);
            iVar7 = FUN_00063fe0(puVar5,*(undefined4 *)PTR_DAT_004d906c);
            if (iVar7 != 1) goto LAB_0005605e;
          }
          FUN_0001d10c(puVar2);
          iVar7 = FUN_0005edbc(PTR_DAT_004d9024);
          if (iVar7 == 0) {
            FUN_0001d10c(puVar2);
            puVar4 = PTR_DAT_004d906c;
            iVar7 = FUN_00063fe0(puVar5,*(undefined4 *)PTR_DAT_004d906c);
            iVar15 = 0;
            if (iVar7 == 1) {
              FUN_0001d10c(puVar2);
              iVar15 = FUN_00063e80(puVar5,*(undefined4 *)puVar4);
            }
            FUN_0001d10c(puVar2);
            iVar7 = FUN_00063fe0(puVar5,*(undefined4 *)puVar3);
            if (iVar7 == 1) {
              FUN_0001d10c(puVar2);
              iVar15 = FUN_00063e80(puVar5,*(undefined4 *)puVar3);
            }
            fVar21 = *(float *)(iVar15 + 0x10);
            if (fVar21 == -1.0) {
              FUN_0001d10c(puVar2);
              FUN_000617a8();
              iVar7 = FUN_0000ac08();
              uVar24 = FloatVectorMult(CONCAT44(extraout_s3_00,*(undefined4 *)(iVar7 + 0x244)),
                                       CONCAT44(extraout_s5_01,DAT_00056088),2,0x20);
              uVar24 = FloatVectorAdd(uVar24,CONCAT44(extraout_s1_02,*(undefined4 *)(iVar7 + 0x248))
                                      ,2);
              fVar21 = (float)uVar24;
              *(float *)(iVar15 + 0x10) = fVar21;
            }
            local_7c = 0;
            local_78 = 0;
            uStack_70 = 0;
            local_68 = 0;
            uVar8 = FUN_000065c4(fVar21);
            iVar7 = FUN_00006ad0(uVar8,1,&local_7c);
            fVar21 = DAT_0005608c;
            if (iVar7 != 0) {
              uVar8 = extraout_s1_03;
              do {
                if (*(char *)(iVar7 + 0x1bc) == '\0') {
                  uVar24 = FPToFixed(CONCAT44(uVar8,*(float *)(iVar7 + 0x10) / fVar21),0,0,3,0x20);
                  iVar11 = (int)uVar24 + 2;
                  iVar7 = 0;
                  if ((0 < iVar11) && (iVar7 = iVar11, 3 < iVar11)) {
                    iVar7 = 4;
                  }
                  *(int *)((int)&local_78 + iVar7 * 4) = *(int *)((int)&local_78 + iVar7 * 4) + 1;
                }
                uVar8 = FUN_000065c4();
                iVar7 = FUN_00006af0(uVar8,1,&local_7c);
                uVar8 = extraout_s1_04;
              } while (iVar7 != 0);
            }
            uVar8 = FUN_000065c4();
            iVar7 = FUN_00006ad0(uVar8,2,&local_7c);
            fVar21 = DAT_0005608c;
            if (iVar7 != 0) {
              uVar8 = extraout_s1_05;
              do {
                uVar24 = FPToFixed(CONCAT44(uVar8,*(float *)(iVar7 + 0x10) / fVar21),0,0,3,0x20);
                iVar11 = (int)uVar24 + 2;
                iVar7 = 0;
                if ((0 < iVar11) && (iVar7 = iVar11, 3 < iVar11)) {
                  iVar7 = 4;
                }
                *(int *)((int)&local_78 + iVar7 * 4) = *(int *)((int)&local_78 + iVar7 * 4) + 1;
                uVar8 = FUN_000065c4();
                iVar7 = FUN_00006af0(uVar8,2,&local_7c);
                uVar8 = extraout_s1_06;
              } while (iVar7 != 0);
            }
            FUN_0001d10c(puVar2);
            iVar7 = FUN_00063fe0(puVar5,*(undefined4 *)puVar3);
            iVar11 = 4;
            if (iVar7 != 0) {
              iVar11 = 5;
            }
            if (iVar7 == 1) {
              piVar10 = (int *)FUN_0001d10c(puVar2);
              iVar7 = (**(code **)(*piVar10 + 0x28))();
              if (iVar7 != 0) goto LAB_0005605e;
            }
            puVar3 = PTR_DAT_004d9050;
            uVar24 = CONCAT44((int)((ulonglong)unaff_d9 >> 0x20),DAT_0005608c);
            uVar28 = CONCAT44((int)((ulonglong)unaff_d10 >> 0x20),DAT_00056090);
            uVar25 = CONCAT44((int)((ulonglong)unaff_d11 >> 0x20),DAT_00056094);
            iVar7 = 0;
            do {
              if (*(int *)((int)&local_78 + iVar7 * 4) == 0) {
                iVar17 = 0;
                local_110 = 0;
                uVar29 = FixedToFP(CONCAT44(iVar7,iVar7),0,0,0,0x20);
                uVar29 = FloatVectorMult(uVar29,uVar24,2,0x20);
                uVar26 = FloatVectorAdd(uVar29,uVar28,2);
                uVar29 = FPToFixed(uVar26,0,0,3,0x20);
                uVar27 = FloatVectorNeg(uVar26,2,2);
                uVar30 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar29 >> 0x20),
                                                  *(undefined4 *)(iVar15 + 0x10)),0x4020000040200000
                                         ,2,0x20);
                uVar30 = FloatVectorAdd(uVar30,uVar25,2);
                do {
                  local_108 = 0;
                  local_104 = 0;
                  local_100 = 0;
                  local_f8 = 0x3f800000;
                  local_7f = 0;
                  local_bc = 0xbf800000;
                  local_b8 = 0x3f800000;
                  local_ec = 0;
                  local_e8 = 0xbf800000;
                  local_e4 = 0;
                  local_fc = 0;
                  local_8c = 0;
                  local_10c = 0;
                  local_b4 = 0;
                  local_b0 = 0;
                  local_ac = 0;
                  local_a8 = 0;
                  local_a4 = 0;
                  local_a0 = 0;
                  local_9c = 0;
                  local_98 = 0;
                  local_dc = &LAB_0001869e_1;
                  local_d8 = 0;
                  local_d4 = 0;
                  local_d0 = 0;
                  local_cc = 0;
                  local_c8 = 0;
                  local_c4 = 0x3f800000;
                  local_c0 = 0x3f800000;
                  local_80 = 0;
                  local_e0 = (int)uVar29;
                  uVar8 = FUN_000251a8();
                  uVar31 = CONCAT44(extraout_s1_07,*(undefined4 *)(iVar15 + 0x10));
                  uVar32 = FloatVectorMult(CONCAT44(uVar8,uVar8),0x3f0000003f000000,2,0x20);
                  uVar33 = FloatVectorAdd(uVar31,uVar31,2);
                  uVar31 = FixedToFP(CONCAT44(iVar17,iVar17),0,0,0,0x20);
                  uVar32 = FloatVectorAdd(uVar30,uVar32,2);
                  uVar31 = FloatVectorMult(uVar31,uVar33,2,0x20);
                  uVar31 = FloatVectorSub(uVar31,uVar32,2,0x20);
                  uVar31 = FPToFixed(uVar31,0,0,3,0x20);
                  local_dc = (undefined1 *)uVar31;
                  local_a0 = 0;
                  local_8c = 0;
                  local_cc = 0;
                  local_c8 = 0;
                  local_c4 = 0;
                  local_c0 = 0;
                  local_b0 = 0x3f800000;
                  local_a8 = 0x3f800000;
                  lVar22 = (ulonglong)*(uint *)puVar3 * (ulonglong)*(uint *)(puVar3 + 8);
                  uVar16 = (uint)lVar22;
                  uVar9 = *(int *)(puVar3 + 4) * *(uint *)(puVar3 + 8) +
                          *(uint *)puVar3 * *(int *)(puVar3 + 0xc) +
                          (int)((ulonglong)lVar22 >> 0x20) +
                          *(int *)(puVar3 + 0x14) + (uint)CARRY4(uVar16,*(uint *)(puVar3 + 0x10));
                  *(uint *)puVar3 = uVar16 + *(uint *)(puVar3 + 0x10);
                  *(uint *)(puVar3 + 4) = uVar9;
                  uVar8 = (undefined4)((ulonglong)uVar26 >> 0x20);
                  if (((uVar9 < 0x80000000) || (iVar11 + -1 == iVar17)) || (2 < local_110)) {
                    FUN_00052f80(local_dc);
                    FUN_0001d10c(puVar2);
                    uVar13 = FUN_000617a8();
                    iVar12 = FUN_00057000(&DAT_005a7b80,1,uVar13,&local_10c,0);
                    *(undefined4 *)(iVar12 + 0x1c) = 0;
                    *(undefined4 *)(iVar12 + 0x20) = 0;
                    *(undefined4 *)(iVar12 + 0x24) = 0;
                    FUN_0000f274(iVar12,0);
                    uVar31 = uVar26;
                    if ((int)((uint)((float)uVar26 < 0.0) << 0x1f) < 0) {
                      uVar31 = CONCAT44(uVar8,(int)uVar27);
                    }
                    uVar31 = FPToFixed(uVar31,0,1,3,0x20);
                    *(int *)(iVar12 + 4) = (int)uVar31 + iVar17;
                  }
                  else {
                    FUN_00052f80(local_dc);
                    iVar12 = FUN_000568f4(&DAT_005a7b80,1,&local_10c);
                    *(undefined4 *)(iVar12 + 0x1c) = 0;
                    *(undefined4 *)(iVar12 + 0x20) = 0;
                    *(undefined4 *)(iVar12 + 0x24) = 0;
                    FUN_00008a50(iVar12,0);
                    uVar31 = uVar26;
                    if ((int)((uint)((float)uVar26 < 0.0) << 0x1f) < 0) {
                      uVar31 = CONCAT44(uVar8,(int)uVar27);
                    }
                    uVar31 = FPToFixed(uVar31,0,1,3,0x20);
                    *(int *)(iVar12 + 4) = (int)uVar31 + iVar17;
                    local_110 = local_110 + 1;
                  }
                  FUN_0001549c(&local_10c);
                  iVar17 = iVar17 + 1;
                } while (iVar17 < iVar11);
              }
              iVar7 = iVar7 + 1;
            } while (iVar7 != 5);
          }
        }
      }
    }
    else {
      FUN_000557ac(uVar8,param_1,fVar21);
    }
  }
LAB_0005605e:
  if (*(int *)puVar1 != local_64) {
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

## FUN_00055228 — 00055228

```c

void FUN_00055228(int param_1)

{
  undefined4 *puVar1;
  char cVar2;
  bool bVar3;
  undefined4 *puVar4;
  undefined *puVar5;
  undefined *puVar6;
  int iVar7;
  undefined4 uVar8;
  int *piVar9;
  void *pvVar10;
  int iVar11;
  uint uVar12;
  int iVar13;
  int *piVar14;
  int *piVar15;
  undefined4 *puVar16;
  bool bVar17;
  float fVar18;
  int iVar19;
  undefined4 local_2c;
  undefined4 local_28;
  undefined4 local_24;
  
  puVar5 = PTR_DAT_004d9048;
  bVar3 = false;
  FUN_0001cda4(*(undefined4 *)(*(int *)(PTR_DAT_004d9048 + 0x5c) + 0x54),0);
  puVar6 = PTR_DAT_004d90fc;
  iVar7 = *(int *)(puVar5 + 0x5c);
  *(undefined4 *)PTR_DAT_004d90f8 = *(undefined4 *)(iVar7 + 100);
  *(undefined4 *)puVar6 = *(undefined4 *)(iVar7 + 0x68);
  puVar5[0x19] = *(undefined1 *)(iVar7 + 0x60);
  *(undefined4 *)(param_1 + 0x200) = 0;
  *(undefined4 *)(param_1 + 0x204) = 1;
  _memset((void *)(param_1 + 0x180),0xff,0x80);
  puVar6 = PTR_DAT_004d90b4;
  piVar9 = (int *)(*(int *)(puVar5 + 0x5c) + 0x34);
  piVar15 = (int *)*piVar9;
  if (piVar15 != piVar9) {
    iVar7 = 0;
    piVar14 = piVar15;
    do {
      piVar14 = (int *)*piVar14;
      iVar7 = iVar7 + -1;
    } while (piVar14 != piVar9);
    bVar3 = false;
    if ((iVar7 != 0) && (bVar3 = true, piVar15 != (int *)(*(int *)(puVar5 + 0x5c) + 0x34))) {
      do {
        uVar8 = FUN_000065c4();
        uVar12 = 2;
        if (piVar15[0xf] < *(int *)puVar6) {
          uVar12 = piVar15[0xf] >> 0x1f & 4U | 1;
        }
        piVar9 = (int *)FUN_0000698c(uVar8,uVar12,1);
        local_2c = DAT_0052bf80;
        local_28 = DAT_0052bf84;
        local_24 = DAT_0052bf88;
        piVar9[4] = piVar15[5];
        piVar9[5] = piVar15[6];
        piVar9[6] = piVar15[7];
        piVar9[7] = piVar15[2];
        piVar9[8] = piVar15[3];
        piVar9[9] = piVar15[4];
        piVar9[1] = piVar15[0x11];
        (**(code **)(*piVar9 + 8))(piVar9,0,piVar15[0xf],&local_2c);
        if (*(char *)((int)piVar9 + 0x35) == '\x01') {
          piVar9[10] = piVar15[8];
          piVar9[0xb] = piVar15[9];
          piVar9[0xc] = piVar15[10];
          piVar9[0x32] = piVar15[0x10];
          piVar9[0x37] = piVar15[0xb];
          piVar9[0x38] = piVar15[0xc];
          piVar9[0x39] = piVar15[0xd];
          if (piVar15[0x14] != 0) {
            pvVar10 = operator_new(0x10c);
            FUN_000506f8(pvVar10,piVar9,piVar15[0x14]);
            FUN_0003e9e8(*(undefined4 *)(puVar5 + 0x4c),pvVar10,0);
            if ((void *)piVar15[0x14] != (void *)0x0) {
              operator_delete((void *)piVar15[0x14]);
              piVar15[0x14] = 0;
            }
          }
        }
        else if (*(char *)((int)piVar9 + 0x35) == '\x02') {
          piVar9[10] = piVar15[8];
          piVar9[0xb] = piVar15[9];
          piVar9[0xc] = piVar15[10];
          piVar9[0x27] = piVar15[0xb];
          piVar9[0x28] = piVar15[0xc];
          piVar9[0x29] = piVar15[0xd];
        }
        fVar18 = (float)piVar15[0x12];
        if (0.0 < fVar18) {
          cVar2 = *(char *)((int)piVar9 + 0x35);
          if (cVar2 == '\x05') {
            (**(code **)(*piVar9 + 0x10))(piVar9,fVar18);
          }
          else if (cVar2 == '\x02') {
            if ((char)piVar15[0xe] == '\0') {
              FUN_00008a50(piVar9,fVar18);
            }
            else {
              *(undefined1 *)((int)piVar9 + 0x7e) = 1;
              piVar9[0xf] = (int)fVar18;
            }
          }
          else if (cVar2 == '\x01') {
            FUN_0000f274(piVar9,fVar18);
          }
        }
        bVar3 = true;
        piVar15 = (int *)*piVar15;
      } while (piVar15 != (int *)(*(int *)(puVar5 + 0x5c) + 0x34));
    }
  }
  uVar8 = FUN_000065c4();
  FUN_00006788(uVar8,0,0,0);
  iVar7 = *(int *)(puVar5 + 0x5c);
  if (*(int *)(puVar5 + 0x10) == 0) {
    fVar18 = *(float *)(iVar7 + 0x238);
    bVar17 = fVar18 < 0.0;
    if (fVar18 <= 0.0) {
      bVar17 = *(int *)(iVar7 + 0x21c) < 0;
    }
    if (bVar17 == ((fVar18 != 0.0 && fVar18 >= 0.0) && NAN(fVar18))) {
      FUN_000213e4(*(int *)(iVar7 + 0x21c),*(undefined4 *)(iVar7 + 0x220),
                   *(undefined4 *)(iVar7 + 0x23c),fVar18,0xffffffff);
      iVar7 = *(int *)(puVar5 + 0x5c);
      goto LAB_00055632;
    }
  }
  if (!bVar3) {
    piVar9 = *(int **)(iVar7 + 0x260);
    if (piVar9 == (int *)(iVar7 + 0x260)) goto LAB_00055632;
    iVar11 = 0;
    do {
      piVar9 = (int *)*piVar9;
      iVar11 = iVar11 + -1;
    } while (piVar9 != (int *)(iVar7 + 0x260));
    if (iVar11 == 0) goto LAB_00055632;
  }
  iVar11 = 3;
  if (*(int *)(puVar5 + 0x10) == 1) {
    iVar11 = 4;
  }
  if (*(int *)(iVar7 + 0x58) < iVar11) {
    FUN_00021110(1);
    iVar7 = *(int *)(puVar5 + 0x5c);
    iVar11 = 0;
    *(undefined4 *)(param_1 + 0x204) = *(undefined4 *)(iVar7 + 0x6c);
    do {
      iVar13 = iVar11 * 4;
      iVar19 = iVar11 * 4;
      iVar11 = iVar11 + 1;
      *(undefined4 *)(param_1 + iVar19 + 0x180) = *(undefined4 *)(iVar7 + 0x70 + iVar13);
    } while (iVar11 != 0x20);
    *(undefined1 *)(param_1 + 0x178) = 1;
    *(undefined4 *)(param_1 + 0x16c) = *(undefined4 *)(iVar7 + 0x248);
    *(undefined4 *)(param_1 + 0x218) = *(undefined4 *)(iVar7 + 0x24c);
    *(undefined4 *)(param_1 + 0x170) = *(undefined4 *)(iVar7 + 0x254);
    *(undefined4 *)(param_1 + 0x174) = *(undefined4 *)(iVar7 + 600);
    *(undefined4 *)(param_1 + 0x74) = *(undefined4 *)(iVar7 + 0x25c);
    *(char *)(param_1 + 0x179) = (char)*(undefined4 *)(iVar7 + 0x298);
    *(char *)(param_1 + 0x17a) = (char)*(undefined4 *)(*(int *)(puVar5 + 0x5c) + 0x29c);
    iVar7 = *(int *)(puVar5 + 0x5c);
    uVar8 = *(undefined4 *)(iVar7 + 0x2a0);
    *(undefined4 *)(param_1 + 0x17c) = uVar8;
    *(undefined4 *)(param_1 + 0x208) = *(undefined4 *)(iVar7 + 0x250);
    *(undefined4 *)(param_1 + 0x4c) = *(undefined4 *)(iVar7 + 0xf0);
    *(undefined4 *)(param_1 + 0x60) = *(undefined4 *)(iVar7 + 0xf8);
    uVar8 = FUN_002f69c4(uVar8,"blitz_bonus",0xb);
    uVar8 = FUN_00027508(iVar7,uVar8);
    *(undefined4 *)(param_1 + 0x5c) = uVar8;
    uVar8 = *(undefined4 *)(*(int *)(puVar5 + 0x5c) + 0xf4);
    *(undefined4 *)(param_1 + 0x58) = uVar8;
    *(undefined4 *)(param_1 + 0x54) = uVar8;
    *(undefined1 *)(param_1 + 0x37) = 0;
    *(undefined1 *)(param_1 + 0x36) = 0;
    *(undefined1 *)(param_1 + 0x35) = 1;
    FUN_00054bdc(uVar8,param_1);
    iVar7 = *(int *)(puVar5 + 0x5c);
    piVar9 = *(int **)(iVar7 + 0x260);
    if (piVar9 != (int *)(iVar7 + 0x260)) {
      do {
        piVar15 = piVar9 + 2;
        if (*(int *)(puVar5 + 0x10) == 1) {
          piVar14 = (int *)(param_1 + *(int *)(param_1 + 0x164) * 0xc + 0x140);
        }
        else {
          piVar14 = (int *)(param_1 + *(int *)(puVar5 + 0x10) * 0xc + 0x98);
        }
        iVar19 = piVar9[4];
        iVar11 = *(int *)(*piVar14 + piVar9[5] * 4);
        iVar13 = 0;
        *(int *)(iVar11 + 0x74) = iVar19;
        piVar14 = (int *)piVar9[2];
        if (piVar14 != piVar15) {
          do {
            piVar14 = (int *)*piVar14;
            iVar13 = iVar13 + -1;
          } while (piVar14 != piVar15);
          if (iVar13 != 0) {
            *(int *)(param_1 + 0x168) = iVar11;
            piVar14 = (int *)*piVar15;
            if (piVar14 != piVar15) {
              iVar7 = *(int *)(iVar11 + 0x48);
              iVar11 = 0;
              do {
                iVar7 = iVar7 + iVar11;
                iVar13 = piVar14[2];
                *(int *)(iVar7 + 0x74) = iVar13;
                *(int *)(iVar7 + 0x78) = iVar13;
                *(undefined4 *)(iVar7 + 0x7c) = 0;
                *(int *)(iVar7 + 0x80) = piVar14[3];
                iVar19 = FUN_00055670(iVar19);
                iVar7 = *(int *)(*(int *)(param_1 + 0x168) + 0x48);
                iVar13 = iVar7 + iVar11;
                iVar11 = iVar11 + 0x90;
                *(undefined4 *)(iVar13 + 0x1c) = 0xffffffff;
                piVar14 = (int *)*piVar14;
              } while (piVar14 != piVar15);
            }
            iVar7 = *(int *)(puVar5 + 0x5c);
          }
        }
        piVar9 = (int *)*piVar9;
      } while (piVar9 != (int *)(iVar7 + 0x260));
    }
  }
LAB_00055632:
  iVar11 = *(int *)(puVar5 + 0x58);
  *(undefined4 *)(iVar11 + 0x174) = *(undefined4 *)(iVar7 + 0x244);
  *(undefined4 *)(iVar11 + 0x170) = *(undefined4 *)(iVar7 + 0x240);
  puVar1 = (undefined4 *)(iVar7 + 0x34);
  puVar4 = (void *)*puVar1;
  while (puVar4 != puVar1) {
    puVar16 = (undefined4 *)*puVar4;
    operator_delete(puVar4);
    puVar4 = puVar16;
  }
  *(undefined4 **)(iVar7 + 0x34) = puVar1;
  *(undefined4 **)(iVar7 + 0x38) = puVar1;
  return;
}


```

## FUN_0006446c — 0006446c

```c

undefined4 FUN_0006446c(int param_1,int param_2,undefined8 *param_3)

{
  int *piVar1;
  char cVar2;
  undefined *puVar3;
  undefined *puVar4;
  int iVar5;
  float fVar6;
  float fVar7;
  undefined4 uVar8;
  int *piVar9;
  int *piVar10;
  bool bVar11;
  undefined4 extraout_s0;
  uint uVar12;
  undefined4 uVar13;
  float extraout_s0_00;
  undefined4 extraout_s1;
  undefined8 uVar14;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined4 extraout_s1_03;
  undefined4 extraout_s1_04;
  undefined4 extraout_s1_05;
  ulonglong uVar15;
  undefined4 extraout_s1_06;
  undefined4 extraout_s1_07;
  undefined4 extraout_s1_08;
  undefined4 extraout_s1_09;
  undefined4 extraout_s1_10;
  undefined4 extraout_s1_11;
  undefined4 extraout_s1_12;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  undefined4 extraout_s3_01;
  undefined4 extraout_s3_02;
  undefined4 extraout_s3_03;
  undefined4 extraout_s3_04;
  undefined4 extraout_s3_05;
  undefined4 extraout_s3_06;
  undefined4 extraout_s3_07;
  undefined4 extraout_s3_08;
  undefined4 extraout_s3_09;
  undefined4 extraout_s3_10;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  undefined4 extraout_s5_01;
  undefined4 extraout_s5_02;
  undefined4 extraout_s5_03;
  undefined4 extraout_s5_04;
  undefined4 extraout_s5_05;
  undefined4 extraout_s5_06;
  undefined4 extraout_s5_07;
  undefined4 extraout_s5_08;
  undefined4 extraout_s5_09;
  undefined4 extraout_s7;
  undefined4 extraout_s7_00;
  undefined4 extraout_s7_01;
  undefined4 extraout_s9;
  undefined4 extraout_s9_00;
  undefined4 extraout_s9_01;
  undefined4 extraout_s11;
  undefined4 extraout_s11_00;
  undefined4 extraout_s13;
  undefined8 unaff_d9;
  undefined8 unaff_d10;
  undefined8 unaff_d11;
  undefined4 uVar16;
  undefined8 unaff_d12;
  undefined4 uVar17;
  undefined8 unaff_d13;
  undefined8 unaff_d14;
  undefined8 uVar18;
  undefined8 uVar19;
  undefined8 uVar20;
  undefined8 uVar21;
  undefined8 uVar22;
  undefined4 local_12c;
  undefined4 local_128;
  undefined4 local_124;
  undefined4 local_120;
  undefined4 uStack_11c;
  undefined4 local_118;
  undefined4 local_114;
  undefined4 local_110;
  undefined4 local_10c;
  undefined1 auStack_108 [4];
  float local_104;
  undefined4 local_100;
  undefined4 local_fc;
  undefined4 local_f4;
  undefined4 local_e8;
  undefined4 local_e4;
  undefined4 local_e0;
  undefined4 local_dc;
  undefined4 uStack_d8;
  undefined4 local_d4;
  undefined4 local_d0;
  undefined4 local_cc;
  undefined4 local_c8;
  undefined1 auStack_c4 [4];
  undefined4 local_c0;
  undefined4 local_bc;
  undefined4 local_b8;
  undefined4 local_b0;
  undefined4 local_a4;
  undefined4 local_a0;
  undefined4 local_9c;
  undefined4 local_98;
  undefined4 local_94;
  undefined4 local_90;
  undefined4 local_8c;
  undefined4 local_88;
  undefined4 local_84;
  undefined1 auStack_80 [4];
  undefined4 local_7c;
  undefined4 local_78;
  undefined4 local_74;
  undefined4 local_6c;
  
  puVar4 = PTR_DAT_004d9048;
  puVar3 = PTR_DAT_004d9024;
  if (*(char *)(param_2 + 0x35) == '\x01') {
    cVar2 = *(char *)(param_2 + 0xc3);
  }
  else {
    bVar11 = false;
    if (*(char *)(param_2 + 0x35) != '\x02') goto LAB_000644b2;
    cVar2 = *(char *)(param_2 + 0xd4);
  }
  bVar11 = cVar2 != '\0';
LAB_000644b2:
  piVar1 = (int *)(param_1 + 0x68);
  piVar10 = (int *)*piVar1;
  if (piVar10 != piVar1) {
    do {
      piVar9 = (int *)piVar10[2];
      iVar5 = piVar9[3];
      uVar8 = (undefined4)((ulonglong)unaff_d9 >> 0x20);
      if (iVar5 == 2) {
        FUN_002ed2c0(auStack_108,*(int *)(param_2 + 0x38) + 4,
                     *(undefined4 *)(*(int *)(param_2 + 0x38) + 0x14));
        uVar14 = CONCAT44(uVar8,local_f4);
        unaff_d9 = FloatVectorAdd(uVar14,uVar14,2);
        local_f4 = (undefined4)unaff_d9;
        iVar5 = *piVar9;
        uVar15 = CONCAT44(extraout_s1_05,local_104);
        uVar14 = CONCAT44(extraout_s3_03,*(undefined4 *)(iVar5 + 4));
        uVar18 = CONCAT44(extraout_s5_03,*(undefined4 *)(iVar5 + 0x14));
        uVar21 = FloatVectorSub(uVar14,uVar18,2,0x20);
        uVar21 = FloatVectorAdd(uVar21,unaff_d9,2);
        if ((int)((uint)(local_104 < (float)uVar21) << 0x1f) < 0) {
          *(float *)(param_2 + 0x10) = (float)uVar21;
        }
        else {
          uVar14 = FloatVectorAdd(uVar14,uVar18,2);
          uVar14 = FloatVectorSub(uVar14,unaff_d9,2,0x20);
          if ((float)uVar14 < local_104) {
            *(float *)(param_2 + 0x10) = (float)uVar14;
          }
        }
        uVar8 = (undefined4)((ulonglong)uVar14 >> 0x20);
        uVar14 = CONCAT44(uVar8,local_100);
        uVar18 = FloatVectorAdd(uVar14,unaff_d9,2);
        if ((float)uVar18 <= *(float *)(iVar5 + 8)) {
          unaff_d10 = FloatVectorSub(CONCAT44(extraout_s5_03,*(float *)(iVar5 + 8)),uVar14,2,0x20);
          unaff_d11 = FloatVectorSub(CONCAT44(extraout_s9,*(undefined4 *)(iVar5 + 4)),uVar15,2,0x20)
          ;
          unaff_d14 = CONCAT44((int)((ulonglong)unaff_d14 >> 0x20),*(undefined4 *)(iVar5 + 0x14));
          unaff_d12 = FloatVectorSub(CONCAT44((int)((ulonglong)uVar18 >> 0x20),
                                              *(undefined4 *)(iVar5 + 0xc)),CONCAT44(uVar8,local_fc)
                                     ,2,0x20);
          uVar14 = FloatVectorMult(unaff_d10,unaff_d10,2,0x20);
          uVar21 = FloatVectorMult(unaff_d11,unaff_d11,2,0x20);
          uVar18 = FloatVectorMult(unaff_d12,unaff_d12,2,0x20);
          uVar14 = FloatVectorAdd(uVar21,uVar14,2);
          unaff_d13 = FloatVectorAdd(uVar14,uVar18,2);
          fVar6 = (float)FUN_00301044((float)unaff_d13);
          uVar14 = FloatVectorSub(unaff_d14,unaff_d9,2,0x20);
          uVar15 = FloatVectorMult(uVar14,uVar14,2,0x20);
          uVar14 = FloatVectorSub(CONCAT44(fVar6,fVar6),uVar14,2,0x20);
          if (0.0 < fVar6) {
            unaff_d12 = CONCAT44((int)((ulonglong)unaff_d12 >> 0x20),(float)unaff_d12 / fVar6);
            unaff_d10 = CONCAT44((int)((ulonglong)unaff_d10 >> 0x20),(float)unaff_d10 / fVar6);
            unaff_d11 = CONCAT44((int)((ulonglong)unaff_d11 >> 0x20),(float)unaff_d11 / fVar6);
          }
          uVar18 = FloatVectorMult(uVar14,unaff_d11,2,0x20);
          uVar21 = FloatVectorMult(uVar14,unaff_d12,2,0x20);
          uVar14 = FloatVectorMult(uVar14,unaff_d10,2,0x20);
          *(int *)param_3 = (int)uVar18;
          *(int *)((int)param_3 + 4) = (int)uVar14;
          *(int *)(param_3 + 1) = (int)uVar21;
          if ((float)uVar15 < (float)unaff_d13) {
            uVar14 = FloatVectorAdd(uVar18,CONCAT44((int)(uVar15 >> 0x20),
                                                    *(undefined4 *)(param_2 + 0x10)),2);
            *(int *)(param_2 + 0x10) = (int)uVar14;
            uVar8 = (undefined4)((ulonglong)uVar18 >> 0x20);
            uVar14 = FloatVectorAdd(CONCAT44(uVar8,*(undefined4 *)((int)param_3 + 4)),
                                    CONCAT44((int)((ulonglong)uVar14 >> 0x20),
                                             *(undefined4 *)(param_2 + 0x14)),2);
            *(int *)(param_2 + 0x14) = (int)uVar14;
            uVar14 = FloatVectorAdd(CONCAT44(uVar8,*(undefined4 *)(param_3 + 1)),
                                    CONCAT44((int)((ulonglong)uVar14 >> 0x20),
                                             *(undefined4 *)(param_2 + 0x18)),2);
            *(int *)(param_2 + 0x18) = (int)uVar14;
            local_114 = *(undefined4 *)(param_2 + 0x1c);
            local_110 = *(undefined4 *)(param_2 + 0x20);
            local_10c = *(undefined4 *)(param_2 + 0x24);
            FUN_00009b50((int)uVar14,&local_114);
            local_120 = *(undefined4 *)param_3;
            uStack_11c = *(undefined4 *)((int)param_3 + 4);
            local_118 = *(undefined4 *)(param_3 + 1);
            FUN_00009b50(&local_120);
            *param_3 = CONCAT44(uStack_11c,local_120);
            *(undefined4 *)(param_3 + 1) = local_118;
            uVar14 = CONCAT44(extraout_s1_06,*(undefined4 *)(param_2 + 0x1c));
            uVar18 = CONCAT44(extraout_s5_04,*(undefined4 *)(param_2 + 0x20));
            uVar21 = FloatVectorMult(uVar14,uVar14,2,0x20);
            uVar14 = CONCAT44(extraout_s3_04,*(undefined4 *)(param_2 + 0x24));
            uVar18 = FloatVectorMult(uVar18,uVar18,2,0x20);
            uVar14 = FloatVectorMult(uVar14,uVar14,2,0x20);
            uVar18 = FloatVectorAdd(uVar21,uVar18,2);
            uVar14 = FloatVectorAdd(uVar18,uVar14,2);
            uVar8 = FUN_00301044((int)uVar14,(int)uVar14);
            uVar21 = CONCAT44(uVar8,uVar8);
            uVar14 = CONCAT44(extraout_s3_05,*(undefined4 *)((int)param_3 + 4));
            uVar20 = FloatVectorMult(CONCAT44(extraout_s7,local_114),
                                     CONCAT44(extraout_s5_05,*(undefined4 *)param_3),2,0x20);
            uVar18 = FloatVectorMult(CONCAT44(extraout_s11,local_110),uVar14,2,0x20);
            uVar19 = FloatVectorMult(CONCAT44(extraout_s9_00,local_10c),
                                     CONCAT44(extraout_s1_07,*(undefined4 *)(param_3 + 1)),2,0x20);
            uVar22 = FloatVectorAdd(uVar20,uVar18,2);
            uVar20 = FloatVectorMult(uVar21,CONCAT44(extraout_s5_05,*(undefined4 *)param_3),2,0x20);
            uVar18 = CONCAT44(extraout_s5_05,DAT_0052cb6c);
            uVar19 = FloatVectorAdd(uVar22,uVar19,2);
            uVar22 = FloatVectorMult(uVar21,uVar14,2,0x20);
            uVar20 = FloatVectorMult(uVar20,uVar18,2,0x20);
            uVar14 = FloatVectorMult(uVar21,CONCAT44(extraout_s1_07,*(undefined4 *)(param_3 + 1)),2,
                                     0x20);
            uVar21 = FloatVectorAbsolute(uVar19,4);
            uVar19 = FloatVectorMult(uVar22,uVar18,2,0x20);
            uVar14 = FloatVectorMult(uVar18,uVar14,2,0x20);
            uVar18 = FloatVectorMult(uVar20,uVar21,2,0x20);
            uVar19 = FloatVectorMult(uVar21,uVar19,2,0x20);
            uVar20 = FloatVectorAdd(uVar18,uVar18,2);
            uVar18 = FloatVectorMult(uVar21,uVar14,2,0x20);
            uVar21 = FloatVectorAdd(uVar19,uVar19,2);
            uVar14 = FloatVectorAdd(CONCAT44(extraout_s1_07,*(undefined4 *)(param_2 + 0x1c)),uVar20,
                                    2);
            uVar18 = FloatVectorAdd(uVar18,uVar18,2);
            local_12c = (undefined4)uVar14;
            *(undefined4 *)(param_2 + 0x1c) = local_12c;
            uVar14 = FloatVectorAdd(uVar21,CONCAT44(extraout_s3_05,*(undefined4 *)(param_2 + 0x20)),
                                    2);
            local_128 = (undefined4)uVar14;
            *(undefined4 *)(param_2 + 0x20) = local_128;
            uVar14 = FloatVectorAdd(uVar18,CONCAT44(extraout_s5_05,*(undefined4 *)(param_2 + 0x24)),
                                    2);
            local_124 = (undefined4)uVar14;
            *(undefined4 *)(param_2 + 0x24) = local_124;
            FUN_00009b50(local_12c,&local_12c);
            uVar21 = CONCAT44(extraout_s7_00,DAT_0052cb70);
            uVar18 = FloatVectorMult(CONCAT44(extraout_s5_06,local_12c),uVar21,2,0x20);
            uVar14 = FloatVectorMult(CONCAT44(extraout_s3_06,local_128),uVar21,2,0x20);
            uVar15 = FloatVectorMult(CONCAT44(extraout_s1_08,local_124),uVar21,2,0x20);
            *(int *)(param_2 + 0x1c) = (int)uVar18;
            *(int *)(param_2 + 0x20) = (int)uVar14;
            *(int *)(param_2 + 0x24) = (int)uVar15;
            if (piVar9[4] != 0) {
              FUN_0001d10c(puVar4);
              uVar12 = FUN_0005ee7c(puVar3);
              uVar15 = (ulonglong)uVar12;
            }
          }
        }
        FUN_002ed304((int)uVar15,auStack_108);
      }
      else {
        unaff_d9 = CONCAT44(uVar8,piVar9[1]);
        uVar16 = (undefined4)((ulonglong)unaff_d11 >> 0x20);
        uVar17 = (undefined4)((ulonglong)unaff_d12 >> 0x20);
        uVar8 = (undefined4)((ulonglong)unaff_d10 >> 0x20);
        if (iVar5 == 1) {
          FUN_002ed28c(auStack_c4);
          iVar5 = *(int *)(param_2 + 0x38);
          local_c0 = *(undefined4 *)(iVar5 + 4);
          local_bc = *(undefined4 *)(iVar5 + 8);
          local_b8 = *(undefined4 *)(iVar5 + 0xc);
          uVar14 = CONCAT44(extraout_s1,*(undefined4 *)(iVar5 + 0x14));
          uVar14 = FloatVectorAdd(uVar14,uVar14,2);
          local_b0 = (undefined4)uVar14;
          iVar5 = (**(code **)(*(int *)*piVar9 + 0xc))(local_b0,(int *)*piVar9,auStack_c4,param_3);
          uVar13 = extraout_s0;
          if (iVar5 == 1) {
            FUN_00063b4c(*(char *)(param_2 + 0x35) == '\x02',bVar11);
            uVar14 = FloatVectorAdd(CONCAT44(extraout_s3,*(undefined4 *)param_3),
                                    CONCAT44(extraout_s1_00,*(undefined4 *)(param_2 + 0x10)),2);
            *(int *)(param_2 + 0x10) = (int)uVar14;
            uVar14 = FloatVectorAdd(CONCAT44(extraout_s3,*(undefined4 *)((int)param_3 + 4)),
                                    CONCAT44((int)((ulonglong)uVar14 >> 0x20),
                                             *(undefined4 *)(param_2 + 0x14)),2);
            *(int *)(param_2 + 0x14) = (int)uVar14;
            uVar14 = FloatVectorAdd(CONCAT44(extraout_s3,*(undefined4 *)(param_3 + 1)),
                                    CONCAT44((int)((ulonglong)uVar14 >> 0x20),
                                             *(undefined4 *)(param_2 + 0x18)),2);
            *(int *)(param_2 + 0x18) = (int)uVar14;
            local_d0 = *(undefined4 *)(param_2 + 0x1c);
            local_cc = *(undefined4 *)(param_2 + 0x20);
            local_c8 = *(undefined4 *)(param_2 + 0x24);
            FUN_00009b50((int)uVar14,&local_d0);
            local_dc = *(undefined4 *)param_3;
            unaff_d11 = CONCAT44(uVar16,local_d0);
            uStack_d8 = *(undefined4 *)((int)param_3 + 4);
            local_d4 = *(undefined4 *)(param_3 + 1);
            unaff_d12 = CONCAT44(uVar17,local_cc);
            uVar21 = CONCAT44(uVar8,local_c8);
            FUN_00009b50(local_dc,&local_dc);
            *param_3 = CONCAT44(uStack_d8,local_dc);
            *(undefined4 *)(param_3 + 1) = local_d4;
            uVar14 = CONCAT44(extraout_s1_01,*(undefined4 *)(param_2 + 0x1c));
            uVar18 = CONCAT44(extraout_s5,*(undefined4 *)(param_2 + 0x20));
            uVar19 = FloatVectorMult(uVar14,uVar14,2,0x20);
            uVar14 = CONCAT44(extraout_s3_00,*(undefined4 *)(param_2 + 0x24));
            uVar18 = FloatVectorMult(uVar18,uVar18,2,0x20);
            uVar14 = FloatVectorMult(uVar14,uVar14,2,0x20);
            uVar18 = FloatVectorAdd(uVar19,uVar18,2);
            uVar14 = FloatVectorAdd(uVar18,uVar14,2);
            fVar6 = (float)FUN_00301044((int)uVar14,(int)uVar14);
            uVar14 = CONCAT44(extraout_s3_01,*(undefined4 *)((int)param_3 + 4));
            uVar20 = FloatVectorMult(unaff_d11,CONCAT44(extraout_s5_00,*(undefined4 *)param_3),2,
                                     0x20);
            uVar19 = FloatVectorMult(unaff_d12,uVar14,2,0x20);
            uVar18 = FloatVectorMult(uVar21,CONCAT44(extraout_s1_02,*(undefined4 *)(param_3 + 1)),2,
                                     0x20);
            unaff_d10 = CONCAT44(fVar6,fVar6);
            uVar22 = FloatVectorMult(unaff_d10,uVar14,2,0x20);
            uVar14 = FloatVectorAdd(uVar20,uVar19,2);
            uVar21 = FloatVectorMult(unaff_d10,CONCAT44(extraout_s1_02,*(undefined4 *)(param_3 + 1))
                                     ,2,0x20);
            uVar14 = FloatVectorAdd(uVar14,uVar18,2);
            uVar18 = FloatVectorMult(unaff_d10,CONCAT44(extraout_s5_00,*(undefined4 *)param_3),2,
                                     0x20);
            uVar14 = FloatVectorAbsolute(uVar14,4);
            uVar19 = FloatVectorMult(uVar18,uVar14,2,0x20);
            uVar18 = FloatVectorMult(uVar22,uVar14,2,0x20);
            uVar14 = FloatVectorMult(uVar14,uVar21,2,0x20);
            uVar19 = FloatVectorAdd(uVar19,uVar19,2);
            uVar18 = FloatVectorAdd(uVar18,uVar18,2);
            uVar21 = FloatVectorAdd(uVar14,uVar14,2);
            uVar14 = FloatVectorAdd(CONCAT44(extraout_s1_02,*(undefined4 *)(param_2 + 0x1c)),uVar19,
                                    2);
            *(int *)(param_2 + 0x1c) = (int)uVar14;
            uVar18 = FloatVectorAdd(uVar18,CONCAT44(extraout_s3_01,*(undefined4 *)(param_2 + 0x20)),
                                    2);
            uVar19 = FloatVectorMult(uVar14,uVar14,2,0x20);
            *(int *)(param_2 + 0x20) = (int)uVar18;
            uVar18 = FloatVectorMult(uVar18,uVar18,2,0x20);
            uVar14 = FloatVectorAdd(uVar21,CONCAT44((int)((ulonglong)uVar14 >> 0x20),
                                                    *(undefined4 *)(param_2 + 0x24)),2);
            uVar18 = FloatVectorAdd(uVar19,uVar18,2);
            uVar21 = FloatVectorMult(uVar14,uVar14,2,0x20);
            *(int *)(param_2 + 0x24) = (int)uVar14;
            uVar18 = FloatVectorAdd(uVar21,uVar18,2);
            fVar7 = (float)FUN_00301044((int)uVar14,(int)uVar18);
            uVar14 = CONCAT44(extraout_s1_03,*(undefined4 *)(param_2 + 0x1c));
            if (fVar7 <= fVar6) {
              uVar18 = CONCAT44(fVar7,*(undefined4 *)(param_2 + 0x20));
              uVar21 = CONCAT44(extraout_s5_01,*(undefined4 *)(param_2 + 0x24));
            }
            else {
              local_e4 = *(undefined4 *)(param_2 + 0x20);
              local_e0 = *(undefined4 *)(param_2 + 0x24);
              local_e8 = *(undefined4 *)(param_2 + 0x1c);
              FUN_00009b50(&local_e8);
              uVar14 = FloatVectorMult(unaff_d10,CONCAT44(extraout_s1_04,local_e8),2,0x20);
              uVar18 = FloatVectorMult(unaff_d10,CONCAT44(extraout_s3_02,local_e4),2,0x20);
              uVar21 = FloatVectorMult(unaff_d10,CONCAT44(extraout_s5_02,local_e0),2,0x20);
              *(int *)(param_2 + 0x1c) = (int)uVar14;
              *(int *)(param_2 + 0x20) = (int)uVar18;
              *(int *)(param_2 + 0x24) = (int)uVar21;
            }
            uVar14 = FloatVectorMult(unaff_d9,uVar14,2,0x20);
            uVar21 = FloatVectorMult(unaff_d9,uVar21,2,0x20);
            uVar18 = FloatVectorMult(unaff_d9,uVar18,2,0x20);
            uVar13 = (undefined4)uVar14;
            *(undefined4 *)(param_2 + 0x1c) = uVar13;
            *(int *)(param_2 + 0x20) = (int)uVar18;
            *(int *)(param_2 + 0x24) = (int)uVar21;
            if (piVar9[4] != 0) {
              FUN_0001d10c(puVar4);
              uVar13 = FUN_0005ee7c(puVar3);
            }
          }
          FUN_002ed304(uVar13,auStack_c4);
        }
        else if (iVar5 == 0) {
          iVar5 = piVar9[5];
          unaff_d10 = CONCAT44(uVar8,piVar9[2]);
          if (iVar5 == 0) {
LAB_000649d8:
            FUN_002ed28c(auStack_80);
            iVar5 = *(int *)(param_2 + 0x38);
            local_7c = *(undefined4 *)(iVar5 + 4);
            local_78 = *(undefined4 *)(iVar5 + 8);
            local_74 = *(undefined4 *)(iVar5 + 0xc);
            uVar14 = CONCAT44(extraout_s1_09,*(undefined4 *)(iVar5 + 0x14));
            uVar14 = FloatVectorAdd(uVar14,uVar14,2);
            local_6c = (undefined4)uVar14;
            iVar5 = (**(code **)(*(int *)*piVar9 + 0xc))
                              (local_6c,(int *)*piVar9,auStack_80,&local_8c);
            fVar6 = extraout_s0_00;
            if (iVar5 == 1) {
              FUN_00063b4c(*(char *)(param_2 + 0x35) == '\x02',bVar11);
              uVar18 = FloatVectorNeg(CONCAT44(extraout_s11_00,local_8c),2,2);
              uVar21 = FloatVectorNeg(CONCAT44(extraout_s9_01,local_88),2,2);
              uVar14 = FloatVectorNeg(CONCAT44(extraout_s3_07,local_84),2,2);
              local_98 = (undefined4)uVar18;
              local_94 = (undefined4)uVar21;
              local_90 = (undefined4)uVar14;
              uVar14 = FloatVectorSub(CONCAT44(extraout_s13,*(undefined4 *)(param_2 + 0x10)),
                                      CONCAT44(extraout_s11_00,local_8c),2,0x20);
              *(int *)(param_2 + 0x10) = (int)uVar14;
              uVar14 = FloatVectorSub(CONCAT44((int)((ulonglong)uVar14 >> 0x20),
                                               *(undefined4 *)(param_2 + 0x14)),
                                      CONCAT44(extraout_s9_01,local_88),2,0x20);
              *(int *)(param_2 + 0x14) = (int)uVar14;
              uVar14 = FloatVectorSub(CONCAT44((int)((ulonglong)uVar14 >> 0x20),
                                               *(undefined4 *)(param_2 + 0x18)),
                                      CONCAT44(extraout_s3_07,local_84),2,0x20);
              *(int *)(param_2 + 0x18) = (int)uVar14;
              local_8c = local_98;
              local_88 = local_94;
              local_84 = local_90;
              FUN_00009b50(local_90,&local_98);
              uVar14 = CONCAT44(extraout_s1_10,*(undefined4 *)(param_2 + 0x1c));
              uVar18 = CONCAT44(extraout_s5_07,*(undefined4 *)(param_2 + 0x20));
              uVar21 = FloatVectorMult(uVar14,uVar14,2,0x20);
              uVar14 = CONCAT44(extraout_s3_08,*(undefined4 *)(param_2 + 0x24));
              uVar18 = FloatVectorMult(uVar18,uVar18,2,0x20);
              unaff_d11 = CONCAT44(uVar16,local_98);
              uVar14 = FloatVectorMult(uVar14,uVar14,2,0x20);
              unaff_d12 = CONCAT44(uVar17,local_94);
              unaff_d13 = CONCAT44((int)((ulonglong)unaff_d13 >> 0x20),local_90);
              uVar18 = FloatVectorAdd(uVar21,uVar18,2);
              uVar14 = FloatVectorAdd(uVar18,uVar14,2);
              uVar8 = FUN_00301044((int)uVar14);
              uVar18 = CONCAT44(uVar8,uVar8);
              uVar14 = FloatVectorMult(unaff_d12,uVar18,2,0x20);
              uVar21 = FloatVectorMult(unaff_d11,uVar18,2,0x20);
              uVar19 = FloatVectorMult(unaff_d13,uVar18,2,0x20);
              uVar20 = FloatVectorMult(CONCAT44(extraout_s5_08,*(undefined4 *)(param_2 + 0x24)),
                                       0x3f0000003f000000,2,0x20);
              uVar22 = FloatVectorMult(CONCAT44(extraout_s3_09,*(undefined4 *)(param_2 + 0x1c)),
                                       0x3f0000003f000000,2,0x20);
              uVar14 = FloatVectorMult(unaff_d9,uVar14,2,0x20);
              uVar18 = FloatVectorMult(unaff_d9,uVar21,2,0x20);
              uVar21 = FloatVectorMult(unaff_d9,uVar19,2,0x20);
              uVar19 = FloatVectorMult(CONCAT44(extraout_s1_11,*(undefined4 *)(param_2 + 0x20)),
                                       0x3f0000003f000000,2,0x20);
              uVar18 = FloatVectorAdd(uVar18,uVar22,2);
              uVar21 = FloatVectorAdd(uVar21,uVar20,2);
              uVar14 = FloatVectorAdd(uVar14,uVar19,2);
              *(int *)(param_2 + 0x1c) = (int)uVar18;
              *(int *)(param_2 + 0x20) = (int)uVar14;
              *(int *)(param_2 + 0x24) = (int)uVar21;
              uVar19 = CONCAT44(extraout_s7_01,piVar9[1]);
              uVar18 = FloatVectorMult(uVar19,uVar18,2,0x20);
              uVar14 = FloatVectorMult(uVar19,uVar14,2,0x20);
              uVar21 = FloatVectorMult(uVar19,uVar21,2,0x20);
              uVar20 = FloatVectorMult(uVar18,uVar18,2,0x20);
              *(int *)(param_2 + 0x1c) = (int)uVar18;
              uVar18 = FloatVectorMult(uVar14,uVar14,2,0x20);
              *(int *)(param_2 + 0x20) = (int)uVar14;
              uVar19 = FloatVectorMult(uVar21,uVar21,2,0x20);
              *(int *)(param_2 + 0x24) = (int)uVar21;
              uVar18 = FloatVectorAdd(uVar20,uVar18,2);
              uVar18 = FloatVectorAdd(uVar19,uVar18,2);
              fVar7 = (float)FUN_00301044((int)uVar14,(int)uVar18);
              fVar6 = (float)piVar9[2];
              if (fVar6 < fVar7) {
                local_a4 = *(undefined4 *)(param_2 + 0x1c);
                local_a0 = *(undefined4 *)(param_2 + 0x20);
                local_9c = *(undefined4 *)(param_2 + 0x24);
                FUN_00009b50(&local_a4);
                uVar18 = FloatVectorMult(unaff_d10,CONCAT44(extraout_s3_10,local_a4),2,0x20);
                uVar21 = FloatVectorMult(unaff_d10,CONCAT44(extraout_s5_09,local_a0),2,0x20);
                uVar14 = FloatVectorMult(unaff_d10,CONCAT44(extraout_s1_12,local_9c),2,0x20);
                *(int *)(param_2 + 0x1c) = (int)uVar18;
                *(int *)(param_2 + 0x20) = (int)uVar21;
                fVar6 = (float)uVar14;
                *(float *)(param_2 + 0x24) = fVar6;
              }
              if (piVar9[4] != 0) {
                FUN_0001d10c(puVar4);
                fVar6 = (float)FUN_0005ee7c(puVar3);
              }
            }
            FUN_002ed304(fVar6,auStack_80);
          }
          else if (iVar5 == 1) {
            if (*(float *)(param_2 + 0x1c) <= 0.0) goto LAB_000649d8;
          }
          else if ((iVar5 == 2) && (0.0 <= *(float *)(param_2 + 0x1c))) goto LAB_000649d8;
        }
      }
      piVar10 = (int *)*piVar10;
    } while (piVar10 != piVar1);
  }
  return 0;
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

## FUN_0004d430 — 0004d430

```c

void FUN_0004d430(int param_1)

{
  undefined *puVar1;
  undefined *puVar2;
  int iVar3;
  int iVar4;
  undefined4 uVar5;
  char *pcVar6;
  undefined ***pppuVar7;
  undefined4 uVar8;
  undefined **local_90;
  undefined *local_8c;
  undefined1 local_70;
  undefined **local_6c;
  undefined *local_68;
  undefined1 local_4c;
  undefined **local_48;
  undefined *local_44;
  undefined1 local_28;
  int local_24;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  if (*(int *)(param_1 + 0x98) != 0) {
    if (DAT_005a74a8 == '\0') {
      *(undefined4 *)(param_1 + 0x94) = 0x3e800000;
      iVar4 = *(int *)(param_1 + 0xa0);
      iVar3 = 0;
      if (iVar4 != 0) {
        iVar3 = *(int *)(iVar4 + 0x278);
      }
      if (iVar4 != 0 && iVar3 != 0) {
        uVar5 = FUN_0002ede8();
        FUN_0002ff98(uVar5,*(undefined4 *)(*(int *)(*(int *)(param_1 + 0xa0) + 0x278) + 0x10));
        puVar2 = PTR_DAT_004d9048;
        local_28 = 1;
        local_48 = (undefined **)0x0;
        uVar5 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a8);
        FUN_0000a298(&local_48);
        local_28 = 0;
        local_48 = &PTR_LAB_0052bf38;
        local_44 = PTR_FUN_004d9154;
        FUN_000727e0(uVar5,0x3f000000,0x3f800000,&local_48);
        FUN_0000a298(&local_48);
        uVar8 = *(undefined4 *)(puVar2 + 0x5c);
        uVar5 = FUN_002f69c4("equipped_total",0xe);
        FUN_00027588(uVar8,"equipped_total",uVar5,1,1,1);
        iVar3 = *(int *)(*(int *)(*(int *)(param_1 + 0xa0) + 0x278) + 0x10);
        if (iVar3 == 1) {
          pppuVar7 = &local_90;
          local_70 = 1;
          local_90 = (undefined **)0x0;
          uVar5 = *(undefined4 *)(puVar2 + 0x1a4);
          FUN_0000a298(pppuVar7);
          pcVar6 = "equip-new-wallpaper";
          local_70 = 0;
          local_90 = &PTR_LAB_0052bf38;
          local_8c = PTR_FUN_004d9058;
        }
        else {
          if (iVar3 != 0) goto LAB_0004d610;
          pppuVar7 = &local_6c;
          local_4c = 1;
          local_6c = (undefined **)0x0;
          uVar5 = *(undefined4 *)(puVar2 + 0x1a4);
          FUN_0000a298(pppuVar7);
          local_4c = 0;
          pcVar6 = "equip-new-sword";
          local_6c = &PTR_LAB_0052bf38;
          local_68 = PTR_FUN_004d9058;
        }
        FUN_0002bc94(uVar5,pcVar6,0x3f800000,0x3f800000,pppuVar7,0);
        FUN_0000a298(pppuVar7);
      }
    }
    else {
      iVar3 = *(int *)(*(int *)(param_1 + 0x98) + 0x134);
      if (iVar3 != 0) {
        *(undefined4 *)(iVar3 + 0x11c) = *(undefined4 *)(iVar3 + 0x10);
        *(undefined4 *)(iVar3 + 0x120) = *(undefined4 *)(iVar3 + 0x14);
        *(undefined4 *)(iVar3 + 0x124) = *(undefined4 *)(iVar3 + 0x18);
        *(undefined4 *)(iVar3 + 0x1c) = DAT_0052bfe0;
        *(undefined4 *)(iVar3 + 0x20) = DAT_0052bfe4;
        *(undefined4 *)(iVar3 + 0x24) = DAT_0052bfe8;
        *(undefined4 *)(iVar3 + 0x128) = DAT_0052bfe0;
        *(undefined4 *)(iVar3 + 300) = DAT_0052bfe4;
        *(undefined4 *)(iVar3 + 0x130) = DAT_0052bfe8;
        *(undefined4 *)(iVar3 + 0xdc) = DAT_0052bfe0;
        *(undefined4 *)(iVar3 + 0xe0) = DAT_0052bfe4;
        *(undefined4 *)(iVar3 + 0xe4) = DAT_0052bfe8;
      }
    }
  }
LAB_0004d610:
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_00018c58 — 00018c58

```c

bool FUN_00018c58(int param_1,int param_2)

{
  int *piVar1;
  float fVar2;
  float fVar3;
  undefined4 extraout_s1;
  undefined8 uVar4;
  undefined1 auStack_28 [16];
  
  fVar3 = *(float *)(PTR_DAT_004d9048 + 0x24);
  if (fVar3 <= 0.0) {
    piVar1 = (int *)FUN_002eddd0(0);
    (**(code **)(*piVar1 + 0x84))(auStack_28);
    uVar4 = FloatVectorAdd(CONCAT44(extraout_s1,*(undefined4 *)(param_2 + 8)),0xbf000000bf000000,2);
    fVar2 = (float)FUN_000251a8();
    *(float *)(param_1 + 0x14) = -((float)uVar4 * fVar2);
  }
  return fVar3 <= 0.0;
}


```

## FUN_0004b9bc — 0004b9bc

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_0004b9bc(int param_1)

{
  int iVar1;
  int iVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  void *pvVar5;
  char cVar6;
  bool bVar7;
  undefined8 in_d0;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined4 in_s3;
  undefined8 uVar8;
  undefined1 local_48;
  undefined1 local_47;
  undefined1 local_46;
  undefined1 local_45;
  undefined4 local_44;
  undefined4 local_40;
  undefined4 local_3c;
  undefined1 local_38;
  undefined1 local_37;
  undefined1 local_36;
  undefined1 local_35;
  undefined4 local_34;
  undefined4 local_30;
  undefined4 local_2c;
  undefined4 local_28;
  undefined4 local_24;
  
  uVar8 = FloatVectorMult(CONCAT44(in_s3,*(undefined4 *)(param_1 + 0x27c)),
                          CONCAT44((int)((ulonglong)in_d0 >> 0x20),DAT_0004bc50),2,0x20);
  uVar8 = FPToFixed(uVar8,0,0,3,0x20);
  iVar2 = (int)uVar8;
  iVar1 = 0;
  if ((0 < iVar2) && (iVar1 = iVar2, 0xfe < iVar2)) {
    iVar1 = 0xff;
  }
  bVar7 = *(int *)(param_1 + 0x58) == 0;
  iVar2 = 0;
  if (!bVar7) {
    iVar2 = *(int *)(param_1 + 0x278);
  }
  if (bVar7 || iVar2 == 0) {
    return;
  }
  if (iVar1 < 1) {
    return;
  }
  cVar6 = '\0';
  if (0 < *(int *)(iVar2 + 0xc)) {
    cVar6 = '\0';
    switch(*(undefined4 *)(iVar2 + 0x24)) {
    case 0:
    case 3:
      goto switchD_0004ba18_caseD_0;
    case 1:
      FUN_0001cf84();
      break;
    case 2:
      FUN_00027974(*(undefined4 *)(PTR_DAT_004d9048 + 0x5c),1);
    }
    cVar6 = '\x01';
  }
switchD_0004ba18_caseD_0:
  if (*(char *)(param_1 + 0x29e) != cVar6) {
    pvVar5 = *(void **)(param_1 + 0x294);
    if (pvVar5 != (void *)0x0) {
      FUN_0032096c(pvVar5);
      operator_delete(pvVar5);
      *(undefined4 *)(param_1 + 0x294) = 0;
    }
    pvVar5 = *(void **)(param_1 + 0x298);
    if (pvVar5 != (void *)0x0) {
      FUN_0032096c(pvVar5);
      operator_delete(pvVar5);
      *(undefined4 *)(param_1 + 0x298) = 0;
    }
    *(char *)(param_1 + 0x29e) = cVar6;
  }
  if ((*(int *)(param_1 + 0x294) == 0) && (param_1 + 0x5c != 0)) {
    pvVar5 = operator_new(0xf4);
    uVar3 = 0x52;
    if (cVar6 != '\0') {
      uVar3 = 0x3e;
    }
    FUN_00320590(pvVar5,*(undefined4 *)(*(int *)(param_1 + 0x58) + 0x84),0x41600000,0x9c,uVar3,0xf,7
                 ,4);
    *(void **)(param_1 + 0x294) = pvVar5;
    FUN_003213c4(pvVar5,param_1 + 0x5c);
    FUN_00320a14(*(undefined4 *)(param_1 + 0x294));
    FUN_00322624(*(undefined4 *)(param_1 + 0x294));
  }
  iVar2 = *(int *)(param_1 + 0x298);
  if (iVar2 != 0) {
    local_34 = FUN_0004bc54();
    local_30 = 0xc1a00000;
    local_2c = 0;
    FUN_0032229c(iVar2,&local_34,0);
    local_38 = (undefined1)_DAT_005a74e8;
    local_37 = (undefined1)((uint)_DAT_005a74e8 >> 8);
    local_36 = (undefined1)((uint)_DAT_005a74e8 >> 0x10);
    local_35 = (undefined1)((uint)_DAT_005a74e8 >> 0x18);
    FUN_0032153c(*(undefined4 *)(param_1 + 0x298),&local_38,1);
    local_28 = 0x3f800000;
    local_24 = 0x3f800000;
    FUN_00321b8c(*(undefined4 *)(param_1 + 0x298),&local_28,0,1);
  }
  uVar3 = _DAT_005a74e8;
  if (*(int *)(param_1 + 0x294) != 0) {
    if (((DAT_005a74fc & 1) == 0) && (iVar2 = ___cxa_guard_acquire(&DAT_005a74fc), iVar2 != 0)) {
      uVar4 = FUN_000251a8();
      uVar8 = FloatVectorMult(CONCAT44(uVar4,uVar4),0x3f0000003f000000,2,0x20);
      uVar8 = FloatVectorAdd(uVar8,0xc1700000c1700000,2);
      uVar8 = FloatVectorAdd(uVar8,0xc0800000c0800000,2);
      uVar8 = FPToFixed(uVar8,0,0,3,0x20);
      DAT_005a74f8 = (undefined4)uVar8;
      ___cxa_guard_release(DAT_005a74f8,&DAT_005a74fc);
    }
    uVar4 = *(undefined4 *)(param_1 + 0x294);
    local_44 = FUN_0004bc54();
    uVar8 = FixedToFP(CONCAT44(extraout_s1,DAT_005a74f8),0,0,0,0x20);
    local_40 = (undefined4)uVar8;
    local_3c = 0;
    FUN_0032229c(local_40,uVar4,&local_44,0);
    local_45 = (undefined1)iVar1;
    if (*(int *)(*(int *)(param_1 + 0x278) + 0xc) < 1) {
      local_46 = 100;
      local_47 = 0x32;
      local_48 = 0;
    }
    else {
      local_47 = (undefined1)((uint)uVar3 >> 8);
      local_48 = (undefined1)uVar3;
      local_46 = (undefined1)((uint)uVar3 >> 0x10);
    }
    FUN_0032153c(*(undefined4 *)(param_1 + 0x294),&local_48,1);
    uVar8 = FixedToFP(CONCAT44(iVar1,iVar1),0,0,0,0x20);
    uVar8 = FloatVectorMult(uVar8,CONCAT44(extraout_s1_00,DAT_005a74f4),2,0x20);
    uVar8 = FPToFixed(uVar8,0,0,3,0x20);
    FUN_003215c4(*(undefined4 *)(param_1 + 0x294),(int)uVar8);
    local_28 = 0x3f800000;
    local_24 = 0x3f800000;
    FUN_00321b8c(*(undefined4 *)(param_1 + 0x294),&local_28,0,1);
  }
  return;
}


```

## FUN_000497c8 — 000497c8

```c

void FUN_000497c8(int param_1,undefined4 param_2)

{
  bool bVar1;
  undefined *puVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined4 *puVar5;
  undefined4 *puVar6;
  undefined4 *puVar7;
  int iVar8;
  int *piVar9;
  int iVar10;
  undefined4 *puVar11;
  int *piVar12;
  float fVar13;
  undefined8 in_d0;
  undefined8 uVar14;
  uint extraout_s1;
  undefined4 extraout_s1_00;
  uint extraout_s1_01;
  uint extraout_s1_02;
  longlong lVar15;
  undefined4 extraout_s1_03;
  uint extraout_s1_04;
  uint extraout_s1_05;
  uint extraout_s1_06;
  uint extraout_s1_07;
  undefined4 extraout_s1_08;
  undefined4 extraout_s1_09;
  undefined4 extraout_s1_10;
  float fVar16;
  undefined8 in_d1;
  uint extraout_s3;
  uint extraout_s3_00;
  uint extraout_s3_01;
  uint extraout_s3_02;
  longlong lVar17;
  ulonglong uVar18;
  uint extraout_s3_03;
  uint extraout_s3_04;
  uint extraout_s3_05;
  uint uVar20;
  uint extraout_s3_06;
  uint extraout_s3_07;
  undefined4 extraout_s3_08;
  ulonglong uVar19;
  uint extraout_s3_09;
  uint extraout_s3_10;
  undefined8 in_d2;
  uint uVar24;
  undefined8 uVar21;
  uint extraout_s5;
  uint extraout_s5_00;
  uint extraout_s5_01;
  uint extraout_s5_02;
  longlong lVar22;
  uint extraout_s5_03;
  uint extraout_s5_04;
  uint extraout_s5_05;
  uint extraout_s5_06;
  undefined4 extraout_s5_07;
  undefined8 uVar23;
  undefined4 extraout_s5_08;
  undefined4 extraout_s5_09;
  undefined8 in_d3;
  uint uVar27;
  undefined8 uVar25;
  uint extraout_s7;
  uint extraout_s7_00;
  uint extraout_s7_01;
  uint extraout_s7_02;
  longlong lVar26;
  uint extraout_s7_03;
  uint extraout_s7_04;
  uint extraout_s7_05;
  uint extraout_s7_06;
  undefined8 uVar28;
  undefined4 extraout_s9;
  undefined4 extraout_s9_00;
  undefined8 extraout_d4;
  undefined8 extraout_d4_00;
  undefined8 extraout_d4_01;
  undefined8 extraout_d4_02;
  undefined4 extraout_s9_01;
  undefined4 extraout_s9_02;
  undefined4 uVar29;
  undefined4 in_s11;
  undefined4 extraout_s11;
  undefined4 extraout_s11_00;
  undefined4 extraout_s11_01;
  undefined4 extraout_s11_02;
  undefined4 extraout_s11_03;
  undefined4 extraout_s11_04;
  undefined4 extraout_s11_05;
  undefined4 extraout_s11_06;
  undefined8 uVar30;
  ulonglong uVar31;
  ulonglong uVar32;
  ulonglong uVar33;
  undefined8 uVar34;
  undefined8 uVar35;
  int *local_70;
  undefined4 local_6c;
  undefined4 local_68;
  undefined4 local_64;
  
  uVar3 = (undefined4)((ulonglong)in_d0 >> 0x20);
  uVar20 = (uint)((ulonglong)in_d1 >> 0x20);
  uVar27 = (uint)((ulonglong)in_d3 >> 0x20);
  uVar24 = (uint)((ulonglong)in_d2 >> 0x20);
  *(undefined1 *)(param_1 + 0xc9) = 0;
  iVar8 = *(int *)(param_1 + 0x74);
  if (iVar8 == -1) {
    uVar14 = CONCAT44(uVar3,*(undefined4 *)(param_1 + 8));
    iVar10 = -1;
    uVar21 = FloatVectorAdd(uVar14,CONCAT44(uVar24,*(undefined4 *)(param_1 + 0xec)),2);
    uVar28 = FloatVectorAdd(uVar14,CONCAT44(uVar27,*(undefined4 *)(param_1 + 0xe0)),2);
    uVar25 = FloatVectorAdd(uVar14,CONCAT44(in_s11,*(undefined4 *)(param_1 + 0xe8)),2);
    uVar14 = FloatVectorAdd(uVar14,CONCAT44(uVar20,*(undefined4 *)(param_1 + 0xe4)),2);
    uVar3 = FUN_00021d28((int)uVar28,(int)uVar25,(int)uVar21,(int)uVar14,0xffffffff);
    *(undefined4 *)(param_1 + 0x74) = uVar3;
    iVar8 = FUN_00021ce0();
    lVar15 = (ulonglong)extraout_s1 << 0x20;
    if (iVar8 == 2) {
      uVar3 = FUN_00049ff4(param_1,*(undefined4 *)(param_1 + 0x74));
      *(undefined4 *)(param_1 + 0xcc) = uVar3;
      *(uint *)PTR_DAT_004d9130 = *(uint *)PTR_DAT_004d9130 | 0x40;
      *(undefined4 *)(param_1 + 0xc0) = 0xffffffff;
      puVar2 = PTR_DAT_004d9048;
      iVar8 = *(int *)(param_1 + 0x74);
      lVar15 = CONCAT44(extraout_s1_00,*(undefined4 *)(PTR_DAT_004d9048 + iVar8 * 0xc + 0xcc));
      *(undefined4 *)(param_1 + 0x78) = *(undefined4 *)(PTR_DAT_004d9048 + iVar8 * 0xc + 0xcc);
      *(undefined4 *)(param_1 + 0x7c) = *(undefined4 *)(puVar2 + iVar8 * 0xc + 0xd0);
      *(undefined4 *)(param_1 + 0x80) = *(undefined4 *)(puVar2 + iVar8 * 0xc + 0xd4);
      *(undefined4 *)(param_1 + 0x84) = *(undefined4 *)(param_1 + 0xd4);
      *(undefined4 *)(param_1 + 0x88) = *(undefined4 *)(param_1 + 0xd8);
      *(undefined4 *)(param_1 + 0x8c) = *(undefined4 *)(param_1 + 0xdc);
      uVar4 = extraout_s11_00;
      in_s11 = extraout_s11_00;
      uVar24 = extraout_s5_00;
      uVar27 = extraout_s7_00;
      uVar20 = extraout_s3_00;
      uVar29 = extraout_s9_00;
      uVar3 = extraout_s1_00;
      if (iVar8 != -1) goto LAB_000498de;
    }
    else {
      *(undefined4 *)(param_1 + 0x74) = 0xffffffff;
      iVar10 = *(int *)(param_1 + 0xc0);
      uVar4 = extraout_s11;
      uVar29 = extraout_s9;
      uVar27 = extraout_s7;
      uVar20 = extraout_s3;
      uVar24 = extraout_s5;
    }
  }
  else {
    iVar10 = *(int *)(param_1 + 0xc0);
LAB_000498de:
    local_70 = (int *)(param_1 + 0xc0);
    uVar25 = CONCAT44(uVar27,*(undefined4 *)(param_1 + 8));
    uVar28 = FloatVectorAdd(uVar25,CONCAT44(uVar24,*(undefined4 *)(param_1 + 0xf0)),2);
    uVar14 = FloatVectorAdd(uVar25,CONCAT44(uVar3,*(undefined4 *)(param_1 + 0xf4)),2);
    uVar21 = FloatVectorAdd(uVar25,CONCAT44(uVar20,*(undefined4 *)(param_1 + 0xfc)),2);
    uVar25 = FloatVectorAdd(uVar25,CONCAT44(in_s11,*(undefined4 *)(param_1 + 0xf8)),2);
    iVar8 = FUN_00021d28((int)uVar28,(int)uVar25,(int)uVar21,(int)uVar14,iVar8);
    uVar29 = (undefined4)((ulonglong)extraout_d4 >> 0x20);
    lVar15 = (ulonglong)extraout_s1_01 << 0x20;
    uVar4 = extraout_s11_01;
    uVar27 = extraout_s7_01;
    uVar20 = extraout_s3_01;
    uVar24 = extraout_s5_01;
    if (iVar8 != *(int *)(param_1 + 0x74)) {
      uVar14 = extraout_d4;
      uVar24 = extraout_s7_01;
      uVar27 = extraout_s3_01;
      uVar20 = extraout_s5_01;
      if (*(int **)(param_1 + 0xcc) != (int *)0x0) {
        (**(code **)(**(int **)(param_1 + 0xcc) + 0x3c))();
        lVar15 = (ulonglong)extraout_s1_02 << 0x20;
        uVar14 = extraout_d4_00;
        uVar4 = extraout_s11_02;
        uVar24 = extraout_s7_02;
        uVar27 = extraout_s3_02;
        uVar20 = extraout_s5_02;
      }
      lVar22 = (ulonglong)uVar20 << 0x20;
      lVar17 = (ulonglong)uVar27 << 0x20;
      lVar26 = (ulonglong)uVar24 << 0x20;
      uVar3 = (undefined4)((ulonglong)lVar15 >> 0x20);
      if (*(char *)(param_1 + 200) == '\0') {
        if (*(int *)(param_1 + 0xcc) == 0) {
          lVar15 = CONCAT44(uVar3,*(undefined4 *)(param_1 + 0xd8));
          *(undefined4 *)(param_1 + 0xc0) = 0xffffffff;
          if (*(undefined4 **)(param_1 + 0xb0) != *(undefined4 **)(param_1 + 0xb4)) {
            uVar21 = FloatVectorNeg(lVar15,2,2);
            iVar8 = 0;
            puVar7 = *(undefined4 **)(param_1 + 0xb0);
            fVar13 = DAT_00049bb8;
            do {
              uVar3 = (undefined4)((ulonglong)lVar22 >> 0x20);
              uVar25 = FloatVectorAdd(uVar21,CONCAT44(uVar3,*(undefined4 *)(param_1 + 0xc)),2);
              uVar14 = FloatVectorMult(CONCAT44((int)((ulonglong)lVar15 >> 0x20),
                                                *(float *)(param_1 + 0xa0)),0xbf000000bf000000,2,
                                       0x20);
              uVar14 = FloatVectorAdd(uVar25,uVar14,2);
              uVar14 = FloatVectorSub(uVar14,CONCAT44((int)((ulonglong)lVar17 >> 0x20),
                                                      *(undefined4 *)(param_1 + 0x7c)),2,0x20);
              uVar14 = FloatVectorNeg(uVar14,2,2);
              fVar16 = (float)uVar14;
              if ((int)((uint)(fVar16 < fVar13) << 0x1f) < 0) {
                uVar14 = FloatVectorAdd(uVar21,CONCAT44((int)((ulonglong)lVar26 >> 0x20),
                                                        *(undefined4 *)(param_1 + 0xa8)),2);
                uVar14 = FloatVectorAdd(uVar14,CONCAT44(uVar3,*(undefined4 *)(param_1 + 0xd8)),2);
                fVar13 = fVar16;
                if ((float)uVar14 < *(float *)(param_1 + 0xa0)) {
                  *local_70 = -1;
                }
                else {
                  *local_70 = iVar8;
                }
              }
              puVar11 = puVar7 + 1;
              uVar3 = (**(code **)(*(int *)*puVar7 + 8))();
              lVar26 = (ulonglong)extraout_s7_04 << 0x20;
              lVar22 = (ulonglong)extraout_s5_04 << 0x20;
              lVar17 = (ulonglong)extraout_s3_04 << 0x20;
              lVar15 = (ulonglong)extraout_s1_04 << 0x20;
              uVar21 = FloatVectorSub(uVar21,CONCAT44(uVar3,uVar3),2,0x20);
              iVar8 = iVar8 + 1;
              puVar7 = puVar11;
              uVar14 = extraout_d4_02;
              uVar4 = extraout_s11_04;
            } while (puVar11 != *(undefined4 **)(param_1 + 0xb4));
          }
          *(undefined4 *)(param_1 + 0x90) = DAT_0052bfe0;
          *(undefined4 *)(param_1 + 0x94) = DAT_0052bfe4;
          *(undefined4 *)(param_1 + 0x98) = DAT_0052bfe8;
        }
      }
      else {
        uVar25 = 0;
        uVar21 = CONCAT44(uVar3,*(undefined4 *)(param_1 + 0x94));
        lVar22 = CONCAT44(uVar20,DAT_00049bac);
        while (lVar26 = FloatVectorNeg(uVar21,2,2), DAT_00049ba8 < (float)lVar26) {
          uVar21 = FloatVectorMult(uVar21,lVar22,2,0x20);
          uVar25 = FloatVectorAdd(uVar25,uVar21,2);
        }
        lVar17 = CONCAT44(uVar27,DAT_00049bb0);
        lVar15 = FloatVectorNeg(uVar25,2,2);
        if (DAT_00049bb0 < (float)lVar15) {
          lVar15 = CONCAT44((int)((ulonglong)lVar15 >> 0x20),*(undefined4 *)(param_1 + 0xd8));
          lVar22 = FloatVectorAdd(uVar25,lVar15,2);
          if ((float)lVar22 <= DAT_00049bb0) {
            lVar26 = CONCAT44((int)((ulonglong)lVar26 >> 0x20),*(undefined4 *)(param_1 + 0x9c));
            uVar14 = CONCAT44((int)((ulonglong)uVar14 >> 0x20),*(undefined4 *)(param_1 + 0xa8));
            uVar21 = FloatVectorSub(lVar26,uVar14,2,0x20);
            lVar17 = FloatVectorAdd(uVar21,lVar17,2);
            if ((float)lVar17 <= (float)lVar22) {
              uVar32 = 0;
              if (*(undefined4 **)(param_1 + 0xb0) != *(undefined4 **)(param_1 + 0xb4)) {
                uVar14 = CONCAT44((int)((ulonglong)lVar17 >> 0x20),*(undefined4 *)(param_1 + 0xc));
                uVar21 = FloatVectorSub(uVar14,lVar15,2,0x20);
                uVar19 = 0;
                uVar31 = 0;
                uVar21 = FloatVectorSub(uVar21,uVar25,2,0x20);
                fVar13 = DAT_00049bb4;
                puVar7 = *(undefined4 **)(param_1 + 0xb0);
                while( true ) {
                  uVar18 = FloatVectorSub(uVar21,uVar14,2,0x20);
                  uVar14 = FloatVectorNeg(uVar18,2,2);
                  uVar33 = uVar18;
                  uVar32 = uVar31;
                  if (-1 < (int)((uint)((float)uVar14 < fVar13) << 0x1f)) {
                    uVar32 = CONCAT44((int)(uVar31 >> 0x20),(int)uVar19);
                    uVar33 = (ulonglong)(uint)fVar13;
                  }
                  bVar1 = (float)uVar14 < fVar13;
                  fVar13 = (float)uVar33;
                  if ((int)((uint)bVar1 << 0x1f) < 0) {
                    uVar14 = FloatVectorNeg(uVar18,2,2);
                    fVar13 = (float)uVar14;
                    uVar32 = uVar31;
                  }
                  uVar3 = (**(code **)(*(int *)*puVar7 + 8))();
                  uVar4 = (**(code **)(*(int *)*puVar7 + 8))();
                  lVar26 = (ulonglong)extraout_s7_03 << 0x20;
                  lVar22 = (ulonglong)extraout_s5_03 << 0x20;
                  lVar17 = (ulonglong)extraout_s3_03 << 0x20;
                  if (puVar7 + 1 == *(undefined4 **)(param_1 + 0xb4)) break;
                  uVar14 = CONCAT44(extraout_s3_03,*(undefined4 *)(param_1 + 0xc));
                  uVar31 = FloatVectorSub(uVar31,CONCAT44(uVar3,uVar3),2,0x20);
                  uVar21 = FloatVectorSub(uVar21,CONCAT44(uVar4,uVar4),2,0x20);
                  uVar19 = uVar32 & 0xffffffff;
                  puVar7 = puVar7 + 1;
                }
                lVar15 = CONCAT44(extraout_s1_03,*(undefined4 *)(param_1 + 0xd8));
                uVar14 = extraout_d4_01;
                uVar4 = extraout_s11_03;
              }
              uVar21 = FloatVectorSub(uVar32,lVar15,2,0x20);
              lVar15 = FloatVectorNeg(CONCAT44((int)((ulonglong)uVar21 >> 0x20),
                                               (float)uVar21 / (float)uVar25),2,2);
              *(int *)(param_1 + 0xc4) = (int)lVar15;
            }
          }
        }
      }
      uVar24 = (uint)((ulonglong)lVar22 >> 0x20);
      uVar20 = (uint)((ulonglong)lVar17 >> 0x20);
      uVar27 = (uint)((ulonglong)lVar26 >> 0x20);
      uVar29 = (undefined4)((ulonglong)uVar14 >> 0x20);
      *(undefined1 *)(param_1 + 200) = 0;
      *(undefined4 *)(param_1 + 0x74) = 0xffffffff;
      puVar2 = PTR_DAT_004d9130;
      *(undefined4 *)(param_1 + 0xcc) = 0;
      *(uint *)puVar2 = *(uint *)puVar2 & 0xffffffbf;
      iVar8 = *(int *)(param_1 + 0x74);
    }
    if (iVar8 != -1) {
      *(undefined4 *)(param_1 + 0xc4) = 0x3f800000;
      puVar2 = PTR_DAT_004d9048;
      lVar22 = CONCAT44(uVar24,*(undefined4 *)(param_1 + 0x7c));
      lVar17 = CONCAT44(uVar20,*(undefined4 *)(param_1 + 0x88));
      lVar26 = CONCAT44(uVar27,*(undefined4 *)(PTR_DAT_004d9048 + iVar8 * 0xc + 0xd0));
      uVar14 = FloatVectorSub(lVar26,lVar22,2,0x20);
      uVar14 = FloatVectorSub(lVar17,uVar14,2,0x20);
      uVar14 = FloatVectorSub(CONCAT44((int)((ulonglong)lVar15 >> 0x20),
                                       *(undefined4 *)(param_1 + 0xd8)),uVar14,2,0x20);
      lVar15 = FloatVectorMult(uVar14,0xbf000000bf000000,2,0x20);
      *(int *)(param_1 + 0x94) = (int)lVar15;
      if (*(int **)(param_1 + 0xcc) != (int *)0x0) {
        iVar8 = (**(code **)(**(int **)(param_1 + 0xcc) + 0x38))((int)lVar15);
        lVar26 = (ulonglong)extraout_s7_05 << 0x20;
        lVar22 = (ulonglong)extraout_s5_05 << 0x20;
        lVar17 = (ulonglong)extraout_s3_05 << 0x20;
        lVar15 = (ulonglong)extraout_s1_05 << 0x20;
        uVar4 = extraout_s11_05;
        uVar29 = extraout_s9_01;
        if (iVar8 == 0) {
          *(undefined4 *)(param_1 + 0xcc) = 0;
        }
      }
      uVar24 = (uint)((ulonglong)lVar22 >> 0x20);
      uVar27 = (uint)((ulonglong)lVar26 >> 0x20);
      uVar20 = (uint)((ulonglong)lVar17 >> 0x20);
      uVar14 = FloatVectorSub(CONCAT44(uVar20,*(undefined4 *)
                                               (puVar2 + *(int *)(param_1 + 0x74) * 0xc + 0xd0)),
                              CONCAT44((int)((ulonglong)lVar15 >> 0x20),
                                       *(undefined4 *)(param_1 + 0x7c)),2,0x20);
      lVar15 = FloatVectorNeg(uVar14,2,2);
      if (DAT_00049fe4 < (float)lVar15) {
        uVar20 = 0x40a00000;
        if ((5.0 < (float)lVar15) && (*(int **)(param_1 + 0xcc) != (int *)0x0)) {
          (**(code **)(**(int **)(param_1 + 0xcc) + 0x34))();
          lVar15 = (ulonglong)extraout_s1_06 << 0x20;
          *(undefined4 *)(param_1 + 0xcc) = 0;
          uVar4 = extraout_s11_06;
          uVar29 = extraout_s9_02;
          uVar27 = extraout_s7_06;
          uVar24 = extraout_s5_06;
          uVar20 = extraout_s3_06;
        }
        *(undefined1 *)(param_1 + 200) = 1;
      }
    }
  }
  local_70 = (int *)(param_1 + 0xc0);
  puVar7 = (undefined4 *)(param_1 + 0xd8);
  uVar25 = CONCAT44(uVar27,DAT_00049fec);
  uVar14 = FloatVectorMult(CONCAT44((int)((ulonglong)lVar15 >> 0x20),*(undefined4 *)(param_1 + 0x90)
                                   ),uVar25,2,0x20);
  *(int *)(param_1 + 0x90) = (int)uVar14;
  uVar21 = FloatVectorMult(CONCAT44(uVar20,*(undefined4 *)(param_1 + 0x94)),uVar25,2,0x20);
  *(int *)(param_1 + 0x94) = (int)uVar21;
  uVar25 = FloatVectorMult(CONCAT44(uVar24,*(undefined4 *)(param_1 + 0x98)),uVar25,2,0x20);
  *(int *)(param_1 + 0x98) = (int)uVar25;
  uVar28 = CONCAT44(uVar27,*(undefined4 *)(param_1 + 0xc4));
  uVar14 = FloatVectorMult(uVar14,uVar28,2,0x20);
  uVar14 = FloatVectorAdd(uVar14,CONCAT44(uVar29,*(undefined4 *)(param_1 + 0xd4)),2);
  uVar34 = FloatVectorMult(uVar28,uVar21,2,0x20);
  *(int *)(param_1 + 0xd4) = (int)uVar14;
  uVar21 = FloatVectorAdd(uVar34,CONCAT44((int)((ulonglong)uVar21 >> 0x20),*puVar7),2);
  uVar28 = FloatVectorMult(uVar25,uVar28,2,0x20);
  *puVar7 = (int)uVar21;
  uVar3 = (undefined4)((ulonglong)uVar25 >> 0x20);
  uVar25 = FloatVectorAdd(uVar28,CONCAT44(uVar3,*(undefined4 *)(param_1 + 0xdc)),2);
  *(int *)(param_1 + 0xdc) = (int)uVar25;
  uVar28 = FloatVectorSub(CONCAT44(uVar3,*(undefined4 *)(param_1 + 8)),uVar14,2,0x20);
  *(undefined4 *)(param_1 + 0xbc) = 0;
  uVar34 = FloatVectorSub(CONCAT44(uVar29,*(undefined4 *)(param_1 + 0xc)),uVar21,2,0x20);
  uVar21 = FloatVectorSub(CONCAT44(uVar4,*(undefined4 *)(param_1 + 0x10)),uVar25,2,0x20);
  uVar3 = FUN_000251a8((int)uVar14);
  uVar4 = FUN_000251a8();
  lVar15 = (ulonglong)extraout_s1_07 << 0x20;
  if (*(char *)(param_1 + 0xd0) == '\0') {
    uVar14 = FloatVectorMult(CONCAT44(uVar4,uVar4),0xbf000000bf000000,2,0x20);
    fVar13 = (float)uVar14;
    uVar14 = FloatVectorMult(CONCAT44(uVar3,uVar3),0x3f0000003f000000,2,0x20);
  }
  else {
    uVar14 = CONCAT44(uVar3,*(undefined4 *)(param_1 + 0xc));
    lVar15 = CONCAT44(extraout_s1_07,*(undefined4 *)(param_1 + 0xa0));
    uVar25 = FloatVectorSub(uVar14,lVar15,2,0x20);
    fVar13 = (float)uVar25;
  }
  uVar3 = (undefined4)((ulonglong)lVar15 >> 0x20);
  puVar11 = *(undefined4 **)(param_1 + 0xb0);
  if (puVar11 == *(undefined4 **)(param_1 + 0xb4)) {
    piVar12 = (int *)0x0;
    uVar25 = 0;
    uVar24 = extraout_s3_07;
    uVar4 = extraout_s5_07;
  }
  else {
    uVar25 = 0;
    piVar12 = (int *)0x0;
    uVar32 = (ulonglong)DAT_00049fe8;
    iVar8 = 0;
    do {
      piVar9 = (int *)*puVar11;
      uVar3 = (**(code **)(*piVar9 + 8))(piVar9);
      uVar35 = FloatVectorMult(CONCAT44(uVar3,uVar3),0x3f0000003f000000,2,0x20);
      if (*local_70 < 0) {
        uVar30 = CONCAT44(extraout_s1_08,*(undefined4 *)(param_1 + 0xc));
        uVar19 = FloatVectorSub(uVar34,uVar30,2,0x20);
        uVar23 = FloatVectorNeg(uVar19,2,2);
        if ((int)((uint)((float)uVar23 < (float)uVar32) << 0x1f) < 0) {
          FloatVectorNeg(uVar19,2,2);
          *(int *)(param_1 + 0xbc) = iVar8;
          uVar25 = FloatVectorSub(uVar30,CONCAT44((int)(uVar19 >> 0x20),*puVar7),2,0x20);
          uVar25 = FloatVectorSub(uVar34,uVar25,2,0x20);
          uVar32 = uVar19;
        }
      }
      else if (iVar8 == *local_70) {
        uVar25 = CONCAT44(extraout_s1_08,*(undefined4 *)(param_1 + 0xc));
        uVar30 = FloatVectorSub(uVar34,uVar25,2,0x20);
        uVar32 = FloatVectorNeg(uVar30,2,2);
        *(int *)(param_1 + 0xbc) = iVar8;
        uVar25 = FloatVectorSub(uVar25,CONCAT44(extraout_s3_08,*puVar7),2,0x20);
        uVar25 = FloatVectorSub(uVar34,uVar25,2,0x20);
        piVar12 = piVar9;
      }
      uVar30 = FloatVectorSub(uVar34,uVar35,2,0x20);
      uVar34 = FloatVectorSub(uVar30,uVar35,2,0x20);
      if (((float)uVar14 < (float)uVar34) ||
         (uVar35 = FloatVectorAdd(uVar35,uVar30,2),
         (int)((uint)((float)uVar35 < fVar13) << 0x1f) < 0)) {
        uVar3 = 0;
      }
      else {
        uVar3 = 1;
      }
      uVar3 = (**(code **)(*piVar9 + 0x24))(piVar9,uVar3);
      local_6c = (undefined4)uVar28;
      local_68 = (undefined4)uVar30;
      local_64 = (undefined4)uVar21;
      (**(code **)(*piVar9 + 0x18))(uVar3,piVar9,&local_6c);
      puVar11 = puVar11 + 1;
      iVar8 = iVar8 + 1;
      uVar3 = extraout_s1_09;
      uVar24 = extraout_s3_09;
      uVar4 = extraout_s5_08;
    } while (puVar11 != *(undefined4 **)(param_1 + 0xb4));
  }
  lVar15 = (ulonglong)uVar24 << 0x20;
  uVar14 = CONCAT44(uVar3,*puVar7);
  uVar21 = FloatVectorSub(uVar25,uVar14,2,0x20);
  if (*(char *)(param_1 + 200) == '\0') {
    uVar4 = 0;
    lVar15 = FloatVectorNeg(uVar21,2,2);
    if ((int)((uint)((float)lVar15 < 0.0) << 0x1f) < 0) {
      uVar4 = 0x3f000000;
      lVar15 = FloatVectorNeg(CONCAT44((int)((ulonglong)lVar15 >> 0x20),
                                       *(undefined4 *)(param_1 + 0x94)),2,2);
      if ((((int)((uint)((float)lVar15 < 0.5) << 0x1f) < 0) &&
          (*(undefined1 *)(param_1 + 0xc9) = 1, iVar10 == -1)) && (piVar12 != (int *)0x0)) {
        piVar9 = piVar12 + 0xc;
        if ((char)piVar12[0x14] != '\0') {
          piVar9 = (int *)*piVar9;
        }
        if (piVar9 != (int *)0x0) {
          (**(code **)(*piVar9 + 0xc))(piVar9,piVar12);
          lVar15 = (ulonglong)extraout_s3_10 << 0x20;
          uVar14 = CONCAT44(extraout_s1_10,*puVar7);
          uVar4 = extraout_s5_09;
        }
      }
    }
  }
  uVar3 = (undefined4)((ulonglong)lVar15 >> 0x20);
  uVar25 = CONCAT44(uVar3,DAT_00049fec);
  if (((float)uVar14 <= 0.0) || (-1 < *local_70)) {
    uVar28 = FloatVectorSub(CONCAT44(uVar3,*(undefined4 *)(param_1 + 0xa0)),
                            CONCAT44(uVar4,*(undefined4 *)(param_1 + 0xa8)),2,0x20);
    if ((-1 < (int)((uint)((float)uVar14 < (float)uVar28) << 0x1f)) || (-1 < *local_70)) {
      if (*(int *)(param_1 + 0x74) == -1) {
        FloatVectorNeg(CONCAT44((int)((ulonglong)uVar28 >> 0x20),*(undefined4 *)(param_1 + 0x94)),2,
                       2);
        uVar21 = FloatVectorMult(uVar21,CONCAT44(uVar4,DAT_00049ff0),2,0x20);
        uVar14 = FloatVectorAdd(uVar21,uVar14,2);
        *puVar7 = (int)uVar14;
      }
      goto LAB_00049f80;
    }
    uVar21 = FloatVectorSub(uVar28,uVar14,2,0x20);
    uVar21 = FloatVectorMult(uVar21,0x3e8000003e800000,2,0x20);
    uVar14 = FloatVectorAdd(uVar14,uVar21,2);
  }
  else {
    uVar14 = FloatVectorMult(uVar14,0x3f4000003f400000,2,0x20);
  }
  *puVar7 = (int)uVar14;
  uVar14 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar14 >> 0x20),*(undefined4 *)(param_1 + 0x90)
                                   ),uVar25,2,0x20);
  *(int *)(param_1 + 0x90) = (int)uVar14;
  uVar14 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar14 >> 0x20),*(undefined4 *)(param_1 + 0x94)
                                   ),uVar25,2,0x20);
  *(int *)(param_1 + 0x94) = (int)uVar14;
  uVar14 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar14 >> 0x20),*(undefined4 *)(param_1 + 0x98)
                                   ),uVar25,2,0x20);
  *(int *)(param_1 + 0x98) = (int)uVar14;
LAB_00049f80:
  puVar7 = *(undefined4 **)(param_1 + 0xb0);
  if (puVar7 != *(undefined4 **)(param_1 + 0xb4)) {
    do {
      puVar11 = puVar7 + 1;
      while( true ) {
        iVar8 = (**(code **)(*(int *)*puVar7 + 0x28))((int *)*puVar7,param_2);
        puVar6 = *(undefined4 **)(param_1 + 0xb4);
        if (iVar8 != 0) break;
        puVar5 = puVar11;
        if (puVar11 != puVar6) {
          _memmove(puVar7,puVar11,(int)puVar6 - (int)puVar11);
          puVar5 = *(undefined4 **)(param_1 + 0xb4);
        }
        *(undefined4 **)(param_1 + 0xb4) = puVar5 + -1;
        if (puVar7 == puVar5 + -1) {
          return;
        }
      }
      puVar7 = puVar11;
    } while (puVar11 != puVar6);
  }
  return;
}


```

## FUN_00041e50 — 00041e50

```c

undefined4 FUN_00041e50(int *param_1,float param_2)

{
  char cVar1;
  undefined *puVar2;
  int iVar3;
  int *piVar4;
  uint uVar5;
  undefined4 uVar6;
  float fVar7;
  float fVar8;
  float fVar9;
  float fVar10;
  undefined8 in_d0;
  undefined4 uVar13;
  undefined8 uVar11;
  uint extraout_s1;
  longlong lVar12;
  uint extraout_s1_00;
  uint extraout_s1_01;
  undefined4 extraout_s1_02;
  uint extraout_s1_03;
  uint extraout_s1_04;
  undefined4 extraout_s1_05;
  undefined4 extraout_s1_06;
  uint extraout_s1_07;
  uint extraout_s1_08;
  uint extraout_s1_09;
  uint extraout_s1_10;
  uint extraout_s1_11;
  undefined8 in_d1;
  uint extraout_s3;
  uint extraout_s3_00;
  uint extraout_s3_01;
  longlong lVar14;
  uint extraout_s3_02;
  uint extraout_s3_03;
  uint extraout_s3_04;
  undefined4 extraout_s3_05;
  uint extraout_s3_06;
  uint extraout_s3_07;
  uint extraout_s3_08;
  uint extraout_s3_09;
  uint extraout_s3_10;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  undefined4 extraout_s5_01;
  undefined4 extraout_s5_02;
  undefined4 extraout_s7;
  undefined4 extraout_s7_00;
  undefined4 extraout_s7_01;
  undefined4 extraout_s7_02;
  undefined4 extraout_s9;
  undefined4 extraout_s11;
  undefined8 uVar15;
  undefined8 unaff_d9;
  undefined8 unaff_d10;
  int iVar16;
  undefined8 unaff_d11;
  float fVar17;
  undefined8 unaff_d12;
  undefined8 uVar18;
  undefined8 uVar19;
  undefined8 uVar20;
  undefined8 uVar21;
  undefined8 uVar22;
  undefined8 uVar23;
  undefined8 uVar24;
  undefined4 local_70;
  undefined4 local_6c;
  undefined4 local_64;
  undefined4 local_60;
  undefined4 local_5c;
  undefined4 local_58;
  undefined4 local_54;
  undefined4 local_50;
  undefined4 local_4c;
  undefined4 local_48;
  undefined4 local_44;
  
  uVar6 = (undefined4)((ulonglong)in_d1 >> 0x20);
  uVar15 = CONCAT44(param_2,param_2);
  uVar13 = (undefined4)((ulonglong)in_d0 >> 0x20);
  if (0.0 < (float)param_1[0x48]) {
    uVar11 = FloatVectorSub(CONCAT44(uVar13,param_1[0x48]),uVar15,2,0x20);
    param_1[0x48] = (int)uVar11;
    iVar3 = param_1[0x4d];
    if (iVar3 != 0) {
      *(uint *)(iVar3 + 0xc) = *(uint *)(iVar3 + 0xc) | 1;
    }
    goto LAB_000424ca;
  }
  iVar3 = param_1[0x4d];
  if (iVar3 != 0) {
    *(uint *)(iVar3 + 0xc) = *(uint *)(iVar3 + 0xc) & 0xfffffffe;
  }
  uVar11 = CONCAT44(uVar13,param_1[0x3e]);
  if (0.0 <= (float)param_1[0x3e]) {
    uVar6 = 0x41000000;
    uVar19 = FloatVectorMult(uVar15,0x4100000041000000,2,0x20);
    uVar11 = FloatVectorAdd(uVar19,uVar11,2);
    param_1[0x3e] = (int)(float)uVar11;
    if (8.0 <= (float)uVar11) {
      iVar3 = 0;
    }
    uVar11 = 0;
    param_1[0x3e] = iVar3;
  }
  if (0.0 <= (float)param_1[0x3f]) {
    uVar19 = FloatVectorAdd(uVar15,uVar15,2);
    uVar19 = FloatVectorAdd(uVar19,CONCAT44(uVar6,param_1[0x3f]),2);
    param_1[0x3f] = (int)uVar19;
    if (1.0 <= (float)uVar11) {
      param_1[0x3f] = 0;
    }
  }
  FUN_00042518((float)uVar11,param_1,param_2);
  lVar14 = (ulonglong)extraout_s3 << 0x20;
  lVar12 = (ulonglong)extraout_s1 << 0x20;
  if (-1 < param_1[0x21]) {
    if (0.0 < param_2) {
      lVar14 = CONCAT44(extraout_s3,param_1[0x3d]);
      uVar11 = FloatVectorMult(lVar14,uVar15,2,0x20);
      uVar11 = FloatVectorAdd(CONCAT44(extraout_s1,param_1[0xb]),uVar11,2);
      param_1[0xb] = (int)(float)uVar11;
      if ((int)((uint)((float)uVar11 < 0.0) << 0x1f) < 0) {
        lVar14 = CONCAT44(extraout_s3,DAT_000422c4);
      }
      lVar12 = FloatVectorAdd(uVar11,lVar14,2);
      param_1[0xb] = (int)lVar12;
    }
    iVar3 = param_1[0x20];
    uVar6 = (undefined4)((ulonglong)lVar12 >> 0x20);
    uVar13 = (undefined4)((ulonglong)lVar14 >> 0x20);
    if (iVar3 == 0) {
      iVar3 = param_1[0x4d];
      if (iVar3 != 0) {
        if ((*(float *)(iVar3 + 0x1c) == 0.0) && (*(float *)(iVar3 + 0x20) == 0.0)) {
          if (*(char *)(iVar3 + 0x35) == '\x01') {
            *(undefined1 *)(iVar3 + 500) = 1;
          }
          fVar7 = (float)param_1[8] / (float)param_1[0x4a];
          uVar19 = FloatVectorMult(CONCAT44(extraout_s7,fVar7),CONCAT44(uVar13,param_1[0x41]),2,0x20
                                  );
          uVar11 = FloatVectorMult(CONCAT44(extraout_s7,fVar7),CONCAT44(uVar6,param_1[0x42]),2,0x20)
          ;
          uVar22 = FloatVectorMult(CONCAT44(extraout_s7,fVar7),CONCAT44(extraout_s5,param_1[0x40]),2
                                   ,0x20);
          *(int *)(iVar3 + 0x28) = (int)uVar22;
          *(int *)(iVar3 + 0x2c) = (int)uVar19;
          *(int *)(iVar3 + 0x30) = (int)uVar11;
          uVar6 = (undefined4)((ulonglong)uVar11 >> 0x20);
        }
        else {
          *(int *)(iVar3 + 0x28) = param_1[0x40];
          *(int *)(iVar3 + 0x2c) = param_1[0x41];
          *(int *)(iVar3 + 0x30) = param_1[0x42];
        }
      }
      uVar11 = FloatVectorMult(uVar15,CONCAT44(uVar6,DAT_0004250c),2,0x20);
      uVar11 = FPToFixed(uVar11,0,0,3,0x20);
      uVar5 = param_1[0x34] - (int)uVar11;
      param_1[0x34] = uVar5;
      if ((int)uVar5 < 1) {
        uVar5 = 0;
        param_1[0x34] = 0;
        *(undefined1 *)((int)param_1 + 0x33) = 1;
      }
      param_1[4] = -0x3f600000;
    }
    else {
      uVar11 = CONCAT44(uVar6,param_1[0x40]);
      if ((float)param_1[0x40] == 0.0) {
        param_1[0x40] = *(int *)(iVar3 + 0x28);
        param_1[0x41] = *(int *)(iVar3 + 0x2c);
        param_1[0x42] = *(int *)(iVar3 + 0x30);
        *(undefined4 *)(iVar3 + 0x28) = DAT_0052bfe0;
        *(undefined4 *)(iVar3 + 0x2c) = DAT_0052bfe4;
        *(undefined4 *)(iVar3 + 0x30) = DAT_0052bfe8;
      }
      else {
        fVar7 = (float)param_1[8] / (float)param_1[0x4a];
        uVar11 = FloatVectorMult(uVar11,CONCAT44(extraout_s7,fVar7),2,0x20);
        uVar19 = FloatVectorMult(CONCAT44(extraout_s7,fVar7),CONCAT44(uVar13,param_1[0x42]),2,0x20);
        uVar22 = FloatVectorMult(CONCAT44(extraout_s7,fVar7),CONCAT44(extraout_s5,param_1[0x41]),2,
                                 0x20);
        *(int *)(iVar3 + 0x28) = (int)uVar11;
        *(int *)(iVar3 + 0x2c) = (int)uVar22;
        *(int *)(iVar3 + 0x30) = (int)uVar19;
      }
      (**(code **)(*param_1 + 0x3c))((int)uVar11,&local_4c,param_1);
      lVar14 = (ulonglong)extraout_s3_00 << 0x20;
      lVar12 = (ulonglong)extraout_s1_00 << 0x20;
      *(undefined4 *)(iVar3 + 0x10) = local_4c;
      *(undefined4 *)(iVar3 + 0x14) = local_48;
      puVar2 = PTR_DAT_004d90b4;
      *(undefined4 *)(iVar3 + 0x18) = local_44;
      if (param_1[0x21] < *(int *)puVar2) {
        iVar3 = param_1[0x20];
        (**(code **)(*param_1 + 0x3c))(&local_58,param_1);
        lVar14 = (ulonglong)extraout_s3_01 << 0x20;
        lVar12 = (ulonglong)extraout_s1_01 << 0x20;
        *(undefined4 *)(iVar3 + 0x11c) = local_58;
        *(undefined4 *)(iVar3 + 0x120) = local_54;
        *(undefined4 *)(iVar3 + 0x124) = local_50;
        iVar3 = param_1[0x20];
        if (*(char *)(iVar3 + 0x1bc) != '\0') {
          uVar19 = FloatVectorSub(CONCAT44(extraout_s7_00,*(undefined4 *)(iVar3 + 0x20)),
                                  CONCAT44(extraout_s11,*(undefined4 *)(iVar3 + 300)),2,0x20);
          uVar22 = FloatVectorSub(CONCAT44(extraout_s1_01,*(undefined4 *)(iVar3 + 0x1c)),
                                  CONCAT44(extraout_s3_01,*(undefined4 *)(iVar3 + 0x128)),2,0x20);
          lVar12 = CONCAT44(extraout_s1_01,DAT_000422c8);
          uVar11 = FloatVectorSub(CONCAT44(extraout_s5_00,*(undefined4 *)(iVar3 + 0x24)),
                                  CONCAT44(extraout_s9,*(undefined4 *)(iVar3 + 0x130)),2,0x20);
          uVar19 = FloatVectorMult(uVar19,uVar19,2,0x20);
          uVar22 = FloatVectorMult(uVar22,uVar22,2,0x20);
          uVar11 = FloatVectorMult(uVar11,uVar11,2,0x20);
          uVar19 = FloatVectorAdd(uVar22,uVar19,2);
          lVar14 = FloatVectorAdd(uVar19,uVar11,2);
          if (DAT_000422c8 < (float)lVar14) {
            piVar4 = param_1 + 0x22;
            if ((char)param_1[0x2a] != '\0') {
              piVar4 = (int *)*piVar4;
            }
            if (piVar4 != (int *)0x0) {
              (**(code **)(*piVar4 + 0xc))();
            }
            puVar2 = PTR_DAT_004d9048;
            FUN_000524bc(*(undefined4 *)(PTR_DAT_004d9048 + 400),0);
            lVar14 = (ulonglong)extraout_s3_02 << 0x20;
            iVar3 = param_1[0x20];
            lVar12 = CONCAT44(extraout_s1_02,param_1[0x40]);
            *(int *)(iVar3 + 0x28) = param_1[0x40];
            *(int *)(iVar3 + 0x2c) = param_1[0x41];
            *(int *)(iVar3 + 0x30) = param_1[0x42];
            iVar3 = param_1[0x4d];
            if ((((iVar3 != 0) && (*(char *)(iVar3 + 0x35) == '\x01')) &&
                (lVar12 = CONCAT44(extraout_s1_02,*(float *)(iVar3 + 0x1c)),
                *(float *)(iVar3 + 0x1c) == 0.0)) &&
               (lVar12 = CONCAT44(extraout_s1_02,*(float *)(iVar3 + 0x20)),
               *(float *)(iVar3 + 0x20) == 0.0)) {
              *(undefined1 *)(iVar3 + 500) = 1;
            }
            if (*(char *)((int)param_1 + 0x127) != '\0') {
              FUN_00020ef8();
              lVar14 = (ulonglong)extraout_s3_03 << 0x20;
              lVar12 = (ulonglong)extraout_s1_03 << 0x20;
              if (*(int *)(puVar2 + 0x18c) != 0) {
                FUN_00040eb4();
                lVar14 = (ulonglong)extraout_s3_04 << 0x20;
                lVar12 = (ulonglong)extraout_s1_04 << 0x20;
              }
            }
          }
          param_1[0x20] = 0;
        }
      }
      else {
        param_1[4] = -0x3f600000;
        iVar3 = param_1[0x20];
        *(undefined4 *)(iVar3 + 0x18) = 0;
        if (*(char *)(iVar3 + 0x8c) != '\0') {
          *(int *)(iVar3 + 0x28) = param_1[0x40];
          *(int *)(iVar3 + 0x2c) = param_1[0x41];
          *(int *)(iVar3 + 0x30) = param_1[0x42];
          param_1[0x20] = 0;
        }
      }
      iVar3 = param_1[0x34];
      if (0x3ffb < iVar3) {
        param_1[8] = param_1[0x4a];
        param_1[9] = param_1[0x4b];
        param_1[10] = param_1[0x4c];
        goto LAB_00042278;
      }
      uVar19 = FixedToFP(CONCAT44(iVar3,iVar3),0,0,0,0x20);
      uVar11 = FloatVectorMult(uVar15,CONCAT44((int)((ulonglong)lVar12 >> 0x20),DAT_0004250c),2,0x20
                              );
      uVar11 = FloatVectorAdd(uVar11,uVar19,2);
      uVar11 = FPToFixed(uVar11,0,0,3,0x20);
      uVar5 = (uint)uVar11;
      param_1[0x34] = uVar5;
    }
    uVar6 = FUN_003010b8(uVar5 & 0xffff);
    unaff_d10 = CONCAT44(uVar6,uVar6);
    iVar16 = param_1[0x4b];
    iVar3 = param_1[0x4c];
    unaff_d12 = FloatVectorMult(unaff_d10,CONCAT44(extraout_s1_05,param_1[0x4a]),2,0x20);
    fVar7 = (float)FUN_003010b8(0x3ffc);
    uVar11 = FloatVectorMult(unaff_d10,CONCAT44((int)((ulonglong)unaff_d11 >> 0x20),iVar16),2,0x20);
    lVar14 = FloatVectorMult(unaff_d10,CONCAT44((int)((ulonglong)unaff_d9 >> 0x20),iVar3),2,0x20);
    fVar8 = (float)lVar14 / fVar7;
    lVar12 = CONCAT44(fVar7,fVar8);
    param_1[8] = (int)((float)unaff_d12 / fVar7);
    param_1[9] = (int)((float)uVar11 / fVar7);
    param_1[10] = (int)fVar8;
  }
LAB_00042278:
  puVar2 = PTR_DAT_004d9048;
  if (*(char *)((int)param_1 + 0x139) == '\0') {
LAB_0004246c:
    if (0x7fffffff < (uint)param_1[0x21]) {
      param_1[8] = param_1[0x4a];
      param_1[9] = param_1[0x4b];
      param_1[10] = param_1[0x4c];
    }
  }
  else {
    cVar1 = '\0';
    if (PTR_DAT_004d9048[0x644] != '\0') {
      cVar1 = *(char *)((int)param_1 + 0x13a);
    }
    if (PTR_DAT_004d9048[0x644] != '\0' && cVar1 != '\0') {
      piVar4 = (int *)param_1[0x20];
      if (piVar4 == (int *)0x0) {
        FUN_00041e08(param_1);
      }
      else {
        local_64 = 0x3f800000;
        local_60 = 0;
        local_5c = 0;
        (**(code **)(*piVar4 + 0x24))(piVar4,0,0,0,&local_64);
      }
    }
    uVar18 = CONCAT44((int)((ulonglong)unaff_d12 >> 0x20),param_1[0x54]);
    uVar19 = CONCAT44((int)((ulonglong)unaff_d10 >> 0x20),param_1[0x55]);
    (**(code **)(*param_1 + 0x3c))(&local_70,param_1);
    uVar22 = FloatVectorMult(CONCAT44(extraout_s7_01,param_1[0x4b]),0x3f0000003f000000,2,0x20);
    uVar11 = FloatVectorMult(CONCAT44(extraout_s3_05,param_1[0x4a]),0x3f0000003f000000,2,0x20);
    uVar24 = FloatVectorAdd(CONCAT44(extraout_s5_01,local_6c),uVar22,2);
    uVar23 = FloatVectorAdd(CONCAT44(extraout_s1_06,local_70),uVar11,2);
    uVar21 = FloatVectorSub(CONCAT44(extraout_s5_01,local_6c),uVar22,2,0x20);
    uVar20 = FloatVectorSub(CONCAT44(extraout_s1_06,local_70),uVar11,2,0x20);
    uVar11 = FloatVectorAdd(uVar19,uVar24,2);
    uVar22 = FloatVectorAdd(uVar18,uVar23,2);
    uVar19 = FloatVectorSub(uVar21,uVar19,2,0x20);
    uVar18 = FloatVectorSub(uVar20,uVar18,2,0x20);
    fVar10 = (float)uVar22;
    fVar7 = (float)uVar11;
    fVar17 = (float)uVar18;
    fVar8 = (float)uVar19;
    if (param_1[0x36] == -1) {
      iVar3 = FUN_00021d28(fVar17,fVar10,fVar8,fVar7,0xffffffff);
      lVar14 = (ulonglong)extraout_s3_06 << 0x20;
      lVar12 = (ulonglong)extraout_s1_07 << 0x20;
      param_1[0x36] = iVar3;
      if (iVar3 != -1) {
        iVar3 = FUN_00021ce0();
        lVar14 = (ulonglong)extraout_s3_07 << 0x20;
        lVar12 = (ulonglong)extraout_s1_08 << 0x20;
        if (iVar3 == 2) {
          if (*(char *)((int)param_1 + 0x125) == '\0') {
            if ((uint)param_1[0x21] < 0x80000000) goto LAB_00042488;
            piVar4 = param_1 + 0x22;
            if ((char)param_1[0x2a] != '\0') {
              piVar4 = (int *)*piVar4;
            }
            if (piVar4 != (int *)0x0) {
              (**(code **)(*piVar4 + 0xc))();
              lVar14 = (ulonglong)extraout_s3_08 << 0x20;
              lVar12 = (ulonglong)extraout_s1_09 << 0x20;
            }
          }
        }
        else {
          param_1[0x36] = -1;
        }
      }
      goto LAB_0004246c;
    }
    iVar3 = FUN_00021ce0();
    lVar14 = (ulonglong)extraout_s3_09 << 0x20;
    lVar12 = (ulonglong)extraout_s1_10 << 0x20;
    if (iVar3 == 0) {
      param_1[0x36] = -1;
      fVar9 = (float)param_1[0x37];
      lVar12 = CONCAT44(extraout_s1_10,fVar9);
      if ((fVar17 <= fVar9) && (fVar9 <= fVar10)) {
        fVar10 = (float)param_1[0x38];
        lVar12 = CONCAT44(extraout_s1_10,fVar10);
        if ((fVar8 <= fVar10) && (fVar10 <= fVar7)) {
          FUN_00041e08(param_1);
          lVar14 = (ulonglong)extraout_s3_10 << 0x20;
          lVar12 = (ulonglong)extraout_s1_11 << 0x20;
        }
      }
    }
    else {
      iVar3 = param_1[0x36];
      if (iVar3 != -1) {
        param_1[0x37] = *(int *)(puVar2 + iVar3 * 0xc + 0xcc);
        param_1[0x38] = *(int *)(puVar2 + iVar3 * 0xc + 0xd0);
        param_1[0x39] = *(int *)(puVar2 + iVar3 * 0xc + 0xd4);
      }
      if ((0x7fffffff < (uint)param_1[0x21]) && (*(char *)((int)param_1 + 0x126) != '\0')) {
        fVar9 = (float)param_1[0x37];
        lVar12 = CONCAT44(extraout_s1_10,fVar9);
        if ((fVar17 <= fVar9) && (fVar9 <= fVar10)) {
          fVar10 = (float)param_1[0x38];
          lVar12 = CONCAT44(extraout_s1_10,fVar10);
          if ((fVar8 <= fVar10) && (fVar10 <= fVar7)) {
            uVar11 = FloatVectorMult(CONCAT44(extraout_s5_02,param_1[0x4a]),
                                     CONCAT44(extraout_s7_02,DAT_00042514),2,0x20);
            lVar14 = FloatVectorMult(CONCAT44(extraout_s3_09,param_1[0x4b]),
                                     CONCAT44(extraout_s7_02,DAT_00042514),2,0x20);
            lVar12 = FloatVectorMult(CONCAT44(extraout_s1_10,param_1[0x4c]),
                                     CONCAT44(extraout_s7_02,DAT_00042514),2,0x20);
            param_1[8] = (int)uVar11;
            param_1[9] = (int)lVar14;
            param_1[10] = (int)lVar12;
            goto LAB_00042488;
          }
        }
        param_1[8] = param_1[0x4a];
        param_1[9] = param_1[0x4b];
        param_1[10] = param_1[0x4c];
        if (*(char *)((int)param_1 + 0x125) == '\0') {
          param_1[0x36] = -1;
        }
      }
    }
  }
LAB_00042488:
  uVar11 = FloatVectorMult(CONCAT44((int)((ulonglong)lVar14 >> 0x20),param_1[8]),0x3f9000003f900000,
                           2,0x20);
  uVar11 = FloatVectorMult(uVar11,CONCAT44((int)((ulonglong)lVar12 >> 0x20),param_1[0x4f]),2,0x20);
  param_1[0x3b] = (int)uVar11;
  uVar11 = CONCAT44((int)((ulonglong)uVar11 >> 0x20),param_1[0x57]);
  if (0.0 < (float)param_1[0x57]) {
    uVar11 = FloatVectorSub(uVar11,uVar15,2,0x20);
    param_1[0x57] = (int)(float)uVar11;
    if ((int)((uint)((float)uVar11 < 0.0) << 0x1f) < 0) {
      param_1[0x57] = 0;
    }
  }
LAB_000424ca:
  return (int)uVar11;
}


```

## FUN_0001702c — 0001702c

```c

void FUN_0001702c(int param_1,float param_2)

{
  byte bVar1;
  undefined *puVar2;
  undefined *puVar3;
  undefined4 uVar4;
  int iVar5;
  uint uVar6;
  uint uVar7;
  byte *pbVar8;
  byte *pbVar9;
  int iVar10;
  float fVar11;
  float fVar12;
  uint uVar13;
  float *pfVar14;
  int iVar15;
  int iVar16;
  uint uVar17;
  int iVar18;
  int iVar19;
  undefined4 *puVar20;
  undefined4 *puVar21;
  int iVar22;
  int iVar23;
  int iVar24;
  char cVar25;
  bool bVar26;
  undefined8 in_d0;
  undefined4 extraout_s1;
  longlong lVar27;
  uint extraout_s1_00;
  uint extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined4 extraout_s1_03;
  undefined8 in_d1;
  undefined8 uVar28;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  longlong lVar29;
  uint extraout_s3_01;
  uint extraout_s3_02;
  undefined4 extraout_s3_03;
  undefined4 uVar30;
  undefined8 uVar31;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  undefined4 extraout_s5_01;
  undefined4 extraout_s5_02;
  undefined8 uVar32;
  undefined8 uVar33;
  undefined8 uVar34;
  undefined4 extraout_s7;
  undefined4 in_s9;
  undefined4 extraout_s9;
  undefined4 extraout_s9_00;
  undefined4 extraout_s9_01;
  undefined4 extraout_s9_02;
  float fVar35;
  undefined8 in_d5;
  undefined8 extraout_d5;
  undefined8 extraout_d5_00;
  undefined8 extraout_d5_01;
  undefined4 extraout_s11;
  undefined8 uVar36;
  longlong lVar37;
  longlong lVar38;
  float fVar39;
  undefined8 unaff_d11;
  float fVar40;
  undefined8 unaff_d12;
  undefined8 uVar41;
  undefined8 uVar42;
  int local_25c;
  int local_244;
  undefined4 local_240;
  undefined4 local_23c;
  undefined4 local_238;
  undefined4 local_234;
  undefined4 local_230;
  undefined4 local_22c;
  float local_228 [100];
  undefined4 local_98;
  undefined4 local_94;
  undefined4 local_90;
  undefined4 local_8c;
  undefined4 local_88;
  undefined4 local_84;
  undefined4 local_80;
  undefined4 local_7c;
  undefined4 local_78;
  undefined4 local_74;
  undefined4 local_70;
  undefined4 local_6c;
  undefined1 local_68;
  undefined1 local_67;
  undefined1 local_66;
  undefined1 local_65;
  int local_64;
  
  puVar3 = PTR_DAT_004d9048;
  puVar2 = PTR____stack_chk_guard_004d9044;
  uVar36 = CONCAT44(param_2,param_2);
  local_64 = *(int *)PTR____stack_chk_guard_004d9044;
  if ((param_2 == 0.0) &&
     (in_d0 = CONCAT44((int)((ulonglong)in_d0 >> 0x20),*(float *)(PTR_DAT_004d9048 + 0x24)),
     0.0 < *(float *)(PTR_DAT_004d9048 + 0x24))) {
    if (*(char *)(param_1 + 0xa4) != '\0') {
      uVar4 = *(undefined4 *)PTR_DAT_004d90b8;
      local_68 = (undefined1)uVar4;
      local_67 = (undefined1)((uint)uVar4 >> 8);
      local_66 = (undefined1)((uint)uVar4 >> 0x10);
      local_65 = (undefined1)((uint)uVar4 >> 0x18);
      iVar5 = *(int *)(param_1 + 0xb4);
      local_244 = 0;
      do {
        if (-1 < iVar5) {
          iVar19 = 0;
          iVar18 = 0x18;
          do {
            puVar21 = (undefined4 *)(*(int *)(param_1 + local_244 * 4 + 0xb8) + iVar18);
            uVar6 = FUN_0031048c(&local_68);
            uVar13 = (uVar6 & 0xffff) >> 8;
            uVar7 = (uVar6 & 0xffffff) >> 0x10;
            uVar36 = FixedToFP(CONCAT44(uVar6 >> 0x18,uVar6 >> 0x18),0,1,0,0x20);
            uVar28 = FixedToFP(CONCAT44(uVar6,uVar6) & 0xff000000ff,0,1,0,0x20);
            iVar18 = iVar18 + 0x30;
            iVar19 = iVar19 + 1;
            uVar32 = FixedToFP(CONCAT44(uVar7,uVar7),0,1,0,0x20);
            uVar31 = FixedToFP(CONCAT44(uVar13,uVar13),0,1,0,0x20);
            *puVar21 = (int)uVar32;
            puVar21[1] = (int)uVar31;
            puVar21[2] = (int)uVar28;
            puVar21[3] = (int)uVar36;
            iVar5 = *(int *)(param_1 + 0xb4);
          } while (iVar19 <= iVar5);
        }
        local_244 = local_244 + 1;
      } while (local_244 != 2);
    }
    *(undefined4 *)(param_1 + 0xf0) = 0xbf800000;
    goto LAB_00017c5a;
  }
  *(undefined2 *)(param_1 + 0x36) = *(undefined2 *)(param_1 + 0x52);
  iVar5 = *(int *)(param_1 + 0xb4);
  if ((iVar5 < 4) || (*(char *)(param_1 + 0x50) == '\0')) {
LAB_0001716a:
    *(undefined4 *)(param_1 + 0xf0) = 0xbf800000;
    *(undefined4 *)(param_1 + 0x4c) = 0xffffffff;
    *(undefined4 *)(param_1 + 0x48) = 0xffffffff;
  }
  else {
    iVar18 = *(int *)(param_1 + 0x48);
    bVar26 = iVar18 != -1;
    if (bVar26) {
      iVar18 = *(int *)(param_1 + 0x4c);
    }
    if (!bVar26 || iVar18 == -1) goto LAB_0001716a;
    local_80 = *(undefined4 *)(param_1 + 0xd8);
    local_7c = *(undefined4 *)(param_1 + 0xdc);
    local_78 = *(undefined4 *)(param_1 + 0xe0);
    FUN_000050f8(&local_74,*(undefined4 *)(puVar3 + 0x58),&local_80,1,0);
    local_98 = *(undefined4 *)(param_1 + 0xcc);
    local_94 = *(undefined4 *)(param_1 + 0xd0);
    local_90 = *(undefined4 *)(param_1 + 0xd4);
    FUN_000050f8(local_98,&local_8c,*(undefined4 *)(puVar3 + 0x58),&local_98,1,0);
    uVar31 = FloatVectorAdd(CONCAT44(extraout_s7,local_74),CONCAT44(extraout_s3_03,local_8c),2);
    in_d5 = CONCAT44(extraout_s11,local_6c);
    uVar28 = FloatVectorAdd(CONCAT44(extraout_s5_02,local_70),CONCAT44(extraout_s1_03,local_88),2);
    uVar32 = FloatVectorAdd(in_d5,CONCAT44(extraout_s9_02,local_84),2);
    in_d1 = FloatVectorMult(uVar31,0x3f0000003f000000,2,0x20);
    uVar31 = FloatVectorMult(uVar28,0x3f0000003f000000,2,0x20);
    uVar28 = FloatVectorMult(uVar32,0x3f0000003f000000,2,0x20);
    local_74 = (int)in_d1;
    local_70 = (undefined4)uVar31;
    local_6c = (int)uVar28;
    iVar5 = *(int *)(param_1 + 0x38);
    *(int *)(iVar5 + 4) = (int)in_d1;
    *(undefined4 *)(iVar5 + 8) = local_70;
    *(int *)(iVar5 + 0xc) = (int)uVar28;
    *(undefined4 *)(iVar5 + 0x14) = local_8c;
    *(undefined4 *)(iVar5 + 0x18) = local_88;
    *(undefined4 *)(iVar5 + 0x1c) = local_84;
    uVar32 = FloatVectorSub(in_d1,CONCAT44((int)((ulonglong)uVar28 >> 0x20),local_8c),2,0x20);
    uVar28 = FloatVectorSub(CONCAT44(extraout_s7,local_70),
                            CONCAT44((int)((ulonglong)uVar31 >> 0x20),local_88),2,0x20);
    uVar31 = FloatVectorMult(uVar32,uVar32,2,0x20);
    uVar28 = FloatVectorMult(uVar28,uVar28,2,0x20);
    in_d0 = FloatVectorAdd(uVar31,uVar28,2);
    *(int *)(param_1 + 0xf0) = (int)in_d0;
    iVar5 = *(int *)(param_1 + 0xb4);
    in_s9 = extraout_s9_02;
  }
  uVar4 = (undefined4)((ulonglong)in_d1 >> 0x20);
  if (iVar5 < 4) {
    *(undefined4 *)(param_1 + 0xc0) = DAT_0052bfe0;
    *(undefined4 *)(param_1 + 0xc4) = DAT_0052bfe4;
    *(undefined4 *)(param_1 + 200) = DAT_0052bfe8;
  }
  puVar3 = PTR_DAT_004d90b0;
  if (DAT_005d4d5c == 0) {
    DAT_005d4d18 = 0;
  }
  local_228[0] = 0.0;
  if (*(char *)(param_1 + 0x50) == '\0') {
    iVar18 = 0;
    local_25c = 0;
    if (0 < iVar5) goto LAB_000171da;
  }
  else {
    if (iVar5 < 3) goto LAB_00017c5a;
LAB_000171da:
    uVar28 = FloatVectorAdd(uVar36,uVar36,2);
    iVar19 = param_1 + 0xb8;
    pbVar8 = (byte *)(param_1 + 0x9c);
    pbVar9 = (byte *)(param_1 + 0xa0);
    iVar18 = 0;
    uVar6 = 0;
    local_25c = 0;
    do {
      pfVar14 = (float *)(*(int *)(param_1 + 0xb8) + uVar6 * 0x30);
      puVar21 = (undefined4 *)(*(int *)(param_1 + 0xb8) + (uVar6 | 1) * 0x30);
      fVar39 = *pfVar14;
      unaff_d11 = CONCAT44((int)((ulonglong)unaff_d11 >> 0x20),fVar39);
      fVar40 = pfVar14[1];
      unaff_d12 = CONCAT44((int)((ulonglong)unaff_d12 >> 0x20),fVar40);
      uVar32 = FloatVectorSub(unaff_d11,CONCAT44((int)((ulonglong)in_d1 >> 0x20),*puVar21),2,0x20);
      uVar31 = FloatVectorSub(unaff_d12,CONCAT44((int)((ulonglong)in_d0 >> 0x20),puVar21[1]),2,0x20)
      ;
      local_234 = (undefined4)uVar32;
      local_230 = (undefined4)uVar31;
      local_22c = 0;
      uVar4 = FUN_00009b50(local_230,&local_234);
      uVar31 = uVar28;
      if ((int)uVar6 < *(int *)(param_1 + 0xac) * 2) {
        uVar31 = CONCAT44((int)((ulonglong)uVar28 >> 0x20),param_2);
      }
      uVar32 = FloatVectorMult(uVar31,CONCAT44(extraout_s9,DAT_0001762c),2,0x20);
      in_d0 = CONCAT44(param_2,DAT_005d4d78);
      in_d1 = CONCAT44(extraout_s3,DAT_0052bfcc);
      uVar31 = FloatVectorSub(in_d1,in_d0,2,0x20);
      uVar32 = FloatVectorMult(uVar32,uVar31,2,0x20);
      uVar30 = (undefined4)((ulonglong)uVar32 >> 0x20);
      uVar31 = FloatVectorMult(in_d0,0x4110000041100000,2,0x20);
      uVar32 = FloatVectorAdd(CONCAT44(uVar4,uVar4),CONCAT44(uVar30,(float)uVar32 / DAT_0052bfc8),2)
      ;
      fVar35 = (float)uVar32;
      if (((DAT_005d4d78 < DAT_0052bfcc) &&
          (uVar33 = FloatVectorMult(uVar31,CONCAT44(uVar30,*(undefined4 *)(param_1 + 0xf4)),2,0x20),
          fVar35 <= (float)uVar33)) ||
         (((int)((uint)(DAT_0052bfcc < DAT_005d4d78) << 0x1f) < 0 && ((float)uVar31 <= fVar35)))) {
        local_25c = local_25c + 2;
        in_s9 = extraout_s9;
        in_d5 = extraout_d5;
      }
      else if ((*(int *)(param_1 + 0xb4) < 3) || (*(int *)(param_1 + 0xb4) <= (int)(uVar6 + 3))) {
        fVar11 = (float)FUN_003010d0(*(undefined2 *)(param_1 + 0x36));
        uVar33 = FloatVectorMult(uVar32,CONCAT44(fVar11,fVar11),2,0x20);
        fVar12 = (float)FUN_003010b8(*(undefined2 *)(param_1 + 0x36));
        iVar24 = 0;
        iVar5 = 0;
        uVar31 = FloatVectorMult(uVar32,CONCAT44(fVar12,fVar12),2,0x20);
        if ((int)((uint)((float)uVar33 < 0.0) << 0x1f) < 0) {
          iVar5 = -1;
        }
        iVar22 = 0;
        if ((int)((uint)(fVar39 < 0.0) << 0x1f) < 0) {
          iVar22 = -1;
        }
        iVar10 = uVar6 - local_25c;
        iVar23 = iVar10 + 1;
        do {
          iVar15 = *(int *)(iVar19 + iVar24 * 4);
          *(undefined4 *)(iVar15 + iVar23 * 0x30 + 0x28) = 0x3f7ae148;
          *(undefined4 *)(iVar15 + iVar10 * 0x30 + 0x28) = 0x3f7ae148;
          if (DAT_0052bfd8 == '\0') {
LAB_00017730:
            puVar21 = &DAT_00017d68;
            if (iVar24 != 0) {
              puVar21 = &DAT_00017d6c;
            }
            *(undefined4 *)(iVar15 + iVar23 * 0x30 + 0x2c) = *puVar21;
          }
          else {
            iVar15 = FUN_0001cd70();
            if (iVar15 == 1) {
              iVar15 = iVar22;
              if (0.0 < fVar39) {
                iVar15 = 1;
              }
              iVar16 = iVar5;
              if (0.0 < (float)uVar33) {
                iVar16 = 1;
              }
              if (iVar16 == iVar15) goto LAB_000176f6;
            }
            else {
LAB_000176f6:
              iVar15 = FUN_0001cd70();
              if (((float)uVar31 <= 0.0) || (iVar15 == 1)) {
                iVar15 = *(int *)(iVar19 + iVar24 * 4);
                goto LAB_00017730;
              }
            }
            puVar21 = &DAT_00017d60;
            iVar15 = *(int *)(iVar19 + iVar24 * 4);
            if (iVar24 != 0) {
              puVar21 = &DAT_00017d64;
            }
            *(undefined4 *)(iVar15 + iVar23 * 0x30 + 0x2c) = *puVar21;
          }
          uVar41 = uVar33;
          uVar32 = uVar31;
          if (iVar24 == 0) {
            uVar32 = CONCAT44((int)((ulonglong)uVar31 >> 0x20),-(fVar35 * fVar12));
            uVar41 = CONCAT44((int)((ulonglong)uVar33 >> 0x20),-(fVar35 * fVar11));
          }
          uVar32 = FloatVectorAdd(unaff_d12,uVar32,2);
          uVar41 = FloatVectorAdd(unaff_d11,uVar41,2);
          puVar21 = (undefined4 *)(iVar15 + iVar23 * 0x30);
          pfVar14 = (float *)(iVar15 + iVar10 * 0x30);
          *pfVar14 = fVar39;
          pfVar14[1] = fVar40;
          *puVar21 = (int)uVar41;
          puVar21[1] = (int)uVar32;
          iVar15 = *(int *)(param_1 + 0xb8) + iVar10 * 0x30;
          uVar7 = FUN_0031048c((int)uVar32,pbVar8);
          uVar17 = (uVar7 & 0xffff) >> 8;
          uVar13 = (uVar7 & 0xffffff) >> 0x10;
          uVar32 = FixedToFP(CONCAT44(uVar7 >> 0x18,uVar7 >> 0x18),0,1,0,0x20);
          uVar41 = FixedToFP(CONCAT44(uVar7,uVar7) & 0xff000000ff,0,1,0,0x20);
          uVar34 = FixedToFP(CONCAT44(uVar13,uVar13),0,1,0,0x20);
          uVar42 = FixedToFP(CONCAT44(uVar17,uVar17),0,1,0,0x20);
          *(int *)(iVar15 + 0x18) = (int)uVar34;
          *(int *)(iVar15 + 0x1c) = (int)uVar42;
          *(int *)(iVar15 + 0x20) = (int)uVar41;
          *(int *)(iVar15 + 0x24) = (int)uVar32;
          iVar15 = *(int *)(param_1 + 0xb8) + iVar23 * 0x30;
          uVar7 = FUN_0031048c((int)uVar32,pbVar8);
          uVar17 = (uVar7 & 0xffff) >> 8;
          uVar13 = (uVar7 & 0xffffff) >> 0x10;
          uVar32 = FixedToFP(CONCAT44(uVar7 >> 0x18,uVar7 >> 0x18),0,1,0,0x20);
          uVar41 = FixedToFP(CONCAT44(uVar7,uVar7) & 0xff000000ff,0,1,0,0x20);
          uVar34 = FixedToFP(CONCAT44(uVar13,uVar13),0,1,0,0x20);
          uVar42 = FixedToFP(CONCAT44(uVar17,uVar17),0,1,0,0x20);
          *(int *)(iVar15 + 0x18) = (int)uVar34;
          *(int *)(iVar15 + 0x1c) = (int)uVar42;
          *(int *)(iVar15 + 0x20) = (int)uVar41;
          *(int *)(iVar15 + 0x24) = (int)uVar32;
          iVar15 = *(int *)(param_1 + 0xbc) + iVar10 * 0x30;
          uVar7 = FUN_0031048c((int)uVar32,pbVar8);
          uVar17 = (uVar7 & 0xffff) >> 8;
          uVar13 = (uVar7 & 0xffffff) >> 0x10;
          uVar32 = FixedToFP(CONCAT44(uVar7 >> 0x18,uVar7 >> 0x18),0,1,0,0x20);
          uVar41 = FixedToFP(CONCAT44(uVar7,uVar7) & 0xff000000ff,0,1,0,0x20);
          uVar34 = FixedToFP(CONCAT44(uVar13,uVar13),0,1,0,0x20);
          uVar42 = FixedToFP(CONCAT44(uVar17,uVar17),0,1,0,0x20);
          *(int *)(iVar15 + 0x18) = (int)uVar34;
          *(int *)(iVar15 + 0x1c) = (int)uVar42;
          *(int *)(iVar15 + 0x20) = (int)uVar41;
          *(int *)(iVar15 + 0x24) = (int)uVar32;
          iVar15 = *(int *)(param_1 + 0xbc) + iVar23 * 0x30;
          uVar7 = FUN_0031048c((int)uVar32,pbVar8);
          iVar24 = iVar24 + 1;
          uVar17 = (uVar7 & 0xffff) >> 8;
          uVar13 = (uVar7 & 0xffffff) >> 0x10;
          in_d0 = FixedToFP(CONCAT44(uVar7 >> 0x18,uVar7 >> 0x18),0,1,0,0x20);
          in_d1 = FixedToFP(CONCAT44(uVar7,uVar7) & 0xff000000ff,0,1,0,0x20);
          uVar41 = FixedToFP(CONCAT44(uVar13,uVar13),0,1,0,0x20);
          uVar32 = FixedToFP(CONCAT44(uVar17,uVar17),0,1,0,0x20);
          *(int *)(iVar15 + 0x18) = (int)uVar41;
          *(int *)(iVar15 + 0x1c) = (int)uVar32;
          *(int *)(iVar15 + 0x20) = (int)in_d1;
          *(int *)(iVar15 + 0x24) = (int)in_d0;
          in_s9 = extraout_s9_00;
          in_d5 = extraout_d5_00;
        } while (iVar24 != 2);
      }
      else {
        iVar5 = *(int *)(param_1 + 0xb8) + uVar6 * 0x30;
        uVar33 = FloatVectorSub(CONCAT44(extraout_s3,*(undefined4 *)(iVar5 + 0x60)),unaff_d11,2,0x20
                               );
        uVar31 = FloatVectorSub(CONCAT44(param_2,*(undefined4 *)(iVar5 + 100)),unaff_d12,2,0x20);
        local_240 = (undefined4)uVar33;
        local_23c = (undefined4)uVar31;
        local_238 = 0;
        uVar4 = FUN_00009b50(local_23c,&local_240);
        uVar33 = CONCAT44(extraout_s5,local_238);
        iVar5 = iVar18 + 1;
        uVar31 = CONCAT44(extraout_s1,local_23c);
        uVar41 = FloatVectorMult(uVar33,0,2,0x20);
        uVar42 = FloatVectorSub(uVar41,CONCAT44(extraout_s3_00,local_240),2,0x20);
        uVar41 = FloatVectorSub(uVar31,uVar41,2,0x20);
        lVar37 = FloatVectorMult(uVar32,uVar42,2,0x20);
        if (0 < iVar5) {
          uVar31 = FloatVectorAdd(CONCAT44(uVar4,uVar4),CONCAT44(extraout_s1,local_228[iVar18]),2);
          local_228[iVar5] = (float)uVar31;
        }
        lVar38 = FloatVectorMult(uVar32,uVar41,2,0x20);
        iVar18 = 1;
        fVar35 = (float)lVar37;
        bVar1 = (byte)(((uint)(fVar35 == 0.0) << 0x1e) >> 0x18);
        cVar25 = -((char)((byte)(((uint)(fVar35 < 0.0) << 0x1f) >> 0x18) | bVar1) >> 7);
        if (((bool)(bVar1 >> 6) || (bool)cVar25 != NAN(fVar35)) && (iVar18 = 0, cVar25 != '\0')) {
          iVar18 = -1;
        }
        iVar24 = 0;
        if (*(char *)(param_1 + 0xa6) != iVar18) {
          *(float *)(param_1 + 0xa8) = param_2;
          uVar31 = uVar36;
        }
        uVar41 = FixedToFP(CONCAT44(iVar18,iVar18),0,0,0,0x20);
        uVar32 = FixedToFP(CONCAT44(uVar6,uVar6),0,0,0,0x20);
        iVar22 = 0;
        if ((int)((uint)(fVar39 < 0.0) << 0x1f) < 0) {
          iVar24 = -1;
        }
        iVar10 = uVar6 - local_25c;
        iVar23 = iVar10 + 1;
        do {
          uVar4 = (undefined4)((ulonglong)uVar33 >> 0x20);
          if (DAT_0052bfd8 == '\0') {
LAB_0001741e:
            lVar27 = lVar37;
            lVar29 = lVar38;
            if (iVar22 == 0) {
              lVar27 = FloatVectorNeg(lVar37,2,2);
              lVar29 = FloatVectorNeg(lVar38,2,2);
            }
          }
          else {
            if (*(float *)(param_1 + 0xa8) <= 0.0) goto LAB_0001741e;
            uVar31 = FloatVectorMult(uVar41,CONCAT44((int)((ulonglong)uVar31 >> 0x20),
                                                     *(float *)(param_1 + 0xa8) / DAT_00017630),2,
                                     0x20);
            uVar33 = FloatVectorMult(lVar38,uVar31,2,0x20);
            uVar31 = FloatVectorMult(lVar37,uVar31,2,0x20);
            lVar37 = FloatVectorNeg(uVar31,2,2);
            lVar38 = FloatVectorNeg(uVar33,2,2);
            lVar27 = lVar37;
            lVar29 = lVar38;
          }
          uVar31 = FloatVectorAdd(unaff_d12,lVar27,2);
          uVar42 = FloatVectorAdd(unaff_d11,lVar29,2);
          bVar26 = DAT_0052bfd8 == '\0';
          iVar15 = *(int *)(iVar19 + iVar22 * 4);
          pfVar14 = (float *)(iVar15 + iVar10 * 0x30);
          *pfVar14 = fVar39;
          pfVar14[1] = fVar40;
          if (bVar26) {
LAB_000174ce:
            uVar7 = (uint)((ulonglong)lVar29 >> 0x20);
            puVar21 = &DAT_00017d68;
            if (iVar22 != 0) {
              puVar21 = &DAT_00017d6c;
            }
            uVar13 = (uint)((ulonglong)lVar27 >> 0x20);
            *(undefined4 *)(iVar15 + iVar23 * 0x30 + 0x2c) = *puVar21;
          }
          else {
            iVar15 = FUN_0001cd70((int)lVar27);
            if (iVar15 == 1) {
              fVar35 = (float)lVar38;
              bVar1 = (byte)(((uint)(fVar35 == 0.0) << 0x1e) >> 0x18);
              iVar15 = 1;
              cVar25 = -((char)((byte)(((uint)(fVar35 < 0.0) << 0x1f) >> 0x18) | bVar1) >> 7);
              if (((bool)(bVar1 >> 6) || (bool)cVar25 != NAN(fVar35)) &&
                 (iVar15 = 0, cVar25 != '\0')) {
                iVar15 = -1;
              }
              iVar16 = iVar24;
              if (0.0 < fVar39) {
                iVar16 = 1;
              }
              uVar4 = extraout_s5_00;
              uVar7 = extraout_s3_01;
              uVar13 = extraout_s1_00;
              if (iVar15 == iVar16) goto LAB_0001748e;
            }
            else {
LAB_0001748e:
              iVar15 = FUN_0001cd70();
              lVar29 = (ulonglong)extraout_s3_02 << 0x20;
              lVar27 = (ulonglong)extraout_s1_01 << 0x20;
              uVar4 = extraout_s5_01;
              if (((float)lVar37 <= 0.0) ||
                 (uVar7 = extraout_s3_02, uVar13 = extraout_s1_01, iVar15 == 1)) {
                iVar15 = *(int *)(iVar19 + iVar22 * 4);
                goto LAB_000174ce;
              }
            }
            iVar15 = *(int *)(iVar19 + iVar22 * 4);
            puVar21 = &DAT_00017d60;
            if (iVar22 != 0) {
              puVar21 = &DAT_00017d64;
            }
            *(undefined4 *)(iVar15 + iVar23 * 0x30 + 0x2c) = *puVar21;
          }
          uVar33 = CONCAT44(uVar4,DAT_00017634);
          iVar22 = iVar22 + 1;
          puVar21 = (undefined4 *)(iVar15 + iVar23 * 0x30);
          *puVar21 = (int)uVar42;
          puVar21[1] = (int)uVar31;
          uVar31 = FixedToFP(CONCAT44(uVar13,*(undefined4 *)(param_1 + 0xb4)),0,0,0,0x20);
          uVar42 = FloatVectorMult(CONCAT44(uVar7,(float)uVar32 / (float)uVar31),uVar33,2,0x20);
          puVar21[10] = (int)uVar42;
          *(int *)(iVar15 + iVar10 * 0x30 + 0x28) = (int)uVar42;
        } while (iVar22 != 2);
        if (0.0 < *(float *)(param_1 + 0xa8)) {
          uVar32 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar42 >> 0x20),
                                           *(float *)(param_1 + 0xa8)),uVar36,2);
          bVar26 = DAT_00017630 <= (float)uVar32;
          *(float *)(param_1 + 0xa8) = (float)uVar32;
          if (bVar26) {
            *(undefined4 *)(param_1 + 0xa8) = 0;
          }
        }
        *(char *)(param_1 + 0xa6) = (char)iVar18;
        if (DAT_005d4d5c == 0) {
          FUN_00015814(pbVar9,-2.0 / (float)uVar31);
          if (*(float *)(param_1 + 0x98) <= 0.0) {
            *(undefined1 *)(param_1 + 0x9f) = *(undefined1 *)(param_1 + 0xa3);
            *(undefined1 *)(param_1 + 0x9e) = *(undefined1 *)(param_1 + 0xa2);
            *(undefined1 *)(param_1 + 0x9d) = *(undefined1 *)(param_1 + 0xa1);
            *pbVar8 = *pbVar9;
          }
          else {
            uVar32 = FloatVectorSub(0x3f8000003f800000,
                                    CONCAT44(extraout_s1_02,*(float *)(param_1 + 0x98)),2,0x20);
            bVar1 = puVar3[2];
            iVar18 = (uint)*(byte *)(param_1 + 0xa2) - (uint)bVar1;
            uVar33 = FixedToFP(CONCAT44(iVar18,iVar18),0,0,0,0x20);
            uVar31 = FixedToFP((ulonglong)CONCAT14(bVar1,(uint)bVar1),0,0,0,0x20);
            uVar33 = FloatVectorMult(uVar32,uVar33,2,0x20);
            uVar31 = FloatVectorAdd(uVar31,uVar33,2);
            uVar31 = FPToFixed(uVar31,0,0,3,0x20);
            *(char *)(param_1 + 0x9e) = (char)uVar31;
            bVar1 = puVar3[1];
            iVar18 = (uint)*(byte *)(param_1 + 0xa1) - (uint)bVar1;
            uVar31 = FixedToFP((ulonglong)CONCAT14(bVar1,(uint)bVar1),0,0,0,0x20);
            uVar33 = FixedToFP(CONCAT44(iVar18,iVar18),0,0,0,0x20);
            uVar33 = FloatVectorMult(uVar32,uVar33,2,0x20);
            uVar31 = FloatVectorAdd(uVar31,uVar33,2);
            uVar31 = FPToFixed(uVar31,0,0,3,0x20);
            *(char *)(param_1 + 0x9d) = (char)uVar31;
            bVar1 = *puVar3;
            iVar18 = (uint)*pbVar9 - (uint)bVar1;
            uVar33 = FixedToFP((ulonglong)CONCAT14(bVar1,(uint)bVar1),0,0,0,0x20);
            uVar31 = FixedToFP(CONCAT44(iVar18,iVar18),0,0,0,0x20);
            uVar31 = FloatVectorMult(uVar32,uVar31,2,0x20);
            uVar31 = FloatVectorAdd(uVar33,uVar31,2);
            uVar31 = FPToFixed(uVar31,0,0,3,0x20);
            *(char *)(param_1 + 0x9c) = (char)uVar31;
            *(undefined1 *)(param_1 + 0x9f) = 0xff;
          }
        }
        iVar18 = *(int *)(param_1 + 0xb8) + iVar10 * 0x30;
        uVar7 = FUN_0031048c(pbVar8);
        uVar17 = (uVar7 & 0xffff) >> 8;
        uVar13 = (uVar7 & 0xffffff) >> 0x10;
        uVar31 = FixedToFP(CONCAT44(uVar7 >> 0x18,uVar7 >> 0x18),0,1,0,0x20);
        uVar32 = FixedToFP(CONCAT44(uVar7,uVar7) & 0xff000000ff,0,1,0,0x20);
        uVar41 = FixedToFP(CONCAT44(uVar13,uVar13),0,1,0,0x20);
        uVar33 = FixedToFP(CONCAT44(uVar17,uVar17),0,1,0,0x20);
        *(int *)(iVar18 + 0x18) = (int)uVar41;
        *(int *)(iVar18 + 0x1c) = (int)uVar33;
        *(int *)(iVar18 + 0x20) = (int)uVar32;
        *(int *)(iVar18 + 0x24) = (int)uVar31;
        iVar18 = *(int *)(param_1 + 0xb8) + iVar23 * 0x30;
        uVar7 = FUN_0031048c((int)uVar31,pbVar8);
        uVar17 = (uVar7 & 0xffff) >> 8;
        uVar13 = (uVar7 & 0xffffff) >> 0x10;
        uVar31 = FixedToFP(CONCAT44(uVar7 >> 0x18,uVar7 >> 0x18),0,1,0,0x20);
        uVar32 = FixedToFP(CONCAT44(uVar7,uVar7) & 0xff000000ff,0,1,0,0x20);
        uVar41 = FixedToFP(CONCAT44(uVar13,uVar13),0,1,0,0x20);
        uVar33 = FixedToFP(CONCAT44(uVar17,uVar17),0,1,0,0x20);
        *(int *)(iVar18 + 0x18) = (int)uVar41;
        *(int *)(iVar18 + 0x1c) = (int)uVar33;
        *(int *)(iVar18 + 0x20) = (int)uVar32;
        *(int *)(iVar18 + 0x24) = (int)uVar31;
        iVar18 = *(int *)(param_1 + 0xbc) + iVar10 * 0x30;
        uVar7 = FUN_0031048c((int)uVar31,pbVar8);
        uVar17 = (uVar7 & 0xffff) >> 8;
        uVar13 = (uVar7 & 0xffffff) >> 0x10;
        uVar31 = FixedToFP(CONCAT44(uVar7 >> 0x18,uVar7 >> 0x18),0,1,0,0x20);
        uVar32 = FixedToFP(CONCAT44(uVar7,uVar7) & 0xff000000ff,0,1,0,0x20);
        uVar41 = FixedToFP(CONCAT44(uVar13,uVar13),0,1,0,0x20);
        uVar33 = FixedToFP(CONCAT44(uVar17,uVar17),0,1,0,0x20);
        *(int *)(iVar18 + 0x18) = (int)uVar41;
        *(int *)(iVar18 + 0x1c) = (int)uVar33;
        *(int *)(iVar18 + 0x20) = (int)uVar32;
        *(int *)(iVar18 + 0x24) = (int)uVar31;
        iVar18 = *(int *)(param_1 + 0xbc) + iVar23 * 0x30;
        uVar7 = FUN_0031048c((int)uVar31,pbVar8);
        uVar17 = (uVar7 & 0xffff) >> 8;
        uVar13 = (uVar7 & 0xffffff) >> 0x10;
        in_d0 = FixedToFP(CONCAT44(uVar7 >> 0x18,uVar7 >> 0x18),0,1,0,0x20);
        in_d1 = FixedToFP(CONCAT44(uVar7,uVar7) & 0xff000000ff,0,1,0,0x20);
        uVar32 = FixedToFP(CONCAT44(uVar13,uVar13),0,1,0,0x20);
        uVar31 = FixedToFP(CONCAT44(uVar17,uVar17),0,1,0,0x20);
        *(int *)(iVar18 + 0x18) = (int)uVar32;
        *(int *)(iVar18 + 0x1c) = (int)uVar31;
        *(int *)(iVar18 + 0x20) = (int)in_d1;
        *(int *)(iVar18 + 0x24) = (int)in_d0;
        iVar18 = iVar5;
        in_s9 = extraout_s9_01;
        in_d5 = extraout_d5_01;
      }
      uVar4 = (undefined4)((ulonglong)in_d1 >> 0x20);
      iVar5 = *(int *)(param_1 + 0xb4);
      uVar6 = uVar6 + 2;
    } while ((int)uVar6 < iVar5);
  }
  uVar36 = 0x3f8000003f800000;
  if (0.0 < DAT_005d4d7c) {
    uVar36 = CONCAT44(0x3f800000,local_228[iVar18] / DAT_005d4d7c);
  }
  uVar28 = CONCAT44(uVar4,DAT_00017d70);
  iVar19 = 0;
  do {
    if (0 < iVar5) {
      fVar39 = local_228[iVar18];
      iVar24 = 0;
      pfVar14 = (float *)(*(int *)(param_1 + iVar19 * 4 + 0xb8) + 0x58);
      do {
        iVar22 = iVar18;
        if (iVar24 / 2 < iVar18) {
          iVar22 = iVar24 / 2;
        }
        uVar31 = FloatVectorMult(CONCAT44((int)((ulonglong)in_d5 >> 0x20),local_228[iVar22]),uVar28,
                                 2,0x20);
        uVar31 = FloatVectorSub(0x3f8000003f800000,
                                CONCAT44((int)((ulonglong)uVar31 >> 0x20),(float)uVar31 / fVar39),2,
                                0x20);
        uVar31 = FloatVectorMult(uVar36,uVar31,2,0x20);
        in_d5 = FloatVectorSub(uVar28,uVar31,2,0x20);
        fVar35 = (float)in_d5;
        fVar40 = 0.0;
        if ((0.0 < fVar35) && (fVar40 = 1.0, fVar35 < 1.0)) {
          fVar40 = fVar35;
        }
        pfVar14[-0xc] = fVar40;
        iVar24 = iVar24 + 2;
        *pfVar14 = fVar40;
        pfVar14 = pfVar14 + 0x18;
      } while (iVar24 < iVar5);
    }
    iVar19 = iVar19 + 1;
  } while (iVar19 != 2);
  iVar5 = iVar5 - local_25c;
  *(int *)(param_1 + 0xb4) = iVar5;
  if (2 < iVar5) {
    iVar24 = iVar5 + -1;
    DAT_005573cc = DAT_005573cc + 1;
    iVar19 = *(int *)(param_1 + 0xb8);
    puVar21 = (undefined4 *)(iVar19 + iVar24 * 0x30);
    puVar20 = (undefined4 *)(iVar19 + iVar5 * 0x30);
    uVar32 = FloatVectorSub(CONCAT44((int)((ulonglong)in_d5 >> 0x20),puVar20[-0x16]),
                            CONCAT44(in_s9,puVar21[2]),2,0x20);
    uVar36 = CONCAT44((int)((ulonglong)uVar36 >> 0x20),puVar20[-0x17]);
    uVar28 = FloatVectorSub(CONCAT44(uVar4,puVar20[-0x18]),CONCAT44(0x3f800000,*puVar21),2,0x20);
    uVar31 = FloatVectorSub(uVar36,(ulonglong)(uint)puVar21[1],2,0x20);
    uVar32 = FloatVectorMult(uVar32,0,2,0x20);
    uVar31 = FloatVectorSub(uVar31,uVar32,2,0x20);
    uVar28 = FloatVectorSub(uVar32,uVar28,2,0x20);
    uVar32 = FloatVectorMult(uVar31,0x4020000040200000,2,0x20);
    uVar31 = FloatVectorMult(uVar28,0x4020000040200000,2,0x20);
    uVar28 = FloatVectorMult(CONCAT44(0x3f800000,DAT_0052bfd0),uVar32,2,0x20);
    uVar31 = FloatVectorMult(CONCAT44(0x3f800000,DAT_0052bfd0),uVar31,2,0x20);
    uVar30 = 0x3f000000;
    uVar28 = FloatVectorSub(CONCAT44(uVar4,puVar20[-0x18]),uVar28,2,0x20);
    uVar36 = FloatVectorSub(uVar36,uVar31,2,0x20);
    *puVar20 = (int)uVar28;
    puVar20[1] = (int)uVar36;
    iVar18 = param_1;
    if (DAT_0052bfd4 != '\0') {
      iVar18 = iVar19 + iVar24 * 0x30;
    }
    if (DAT_0052bfd4 != '\0') {
      uVar30 = *(undefined4 *)(iVar18 + 0x2c);
    }
    bVar26 = DAT_0052bfd4 != '\0';
    iVar22 = 0;
    puVar20[0xb] = uVar30;
    uVar4 = 0x3f000000;
    iVar10 = *(int *)(param_1 + 0xbc);
    puVar21 = (undefined4 *)(iVar10 + iVar5 * 0x30);
    *puVar21 = (int)uVar28;
    puVar21[1] = (int)uVar36;
    iVar18 = 0;
    if (bVar26) {
      iVar18 = iVar10 + iVar24 * 0x30;
    }
    if (bVar26) {
      uVar4 = *(undefined4 *)(iVar18 + 0x2c);
    }
    puVar21[0xb] = uVar4;
    while( true ) {
      iVar19 = iVar19 + iVar5 * 0x30;
      uVar6 = FUN_0031048c((int)uVar36,param_1 + 0x9c);
      uVar13 = (uVar6 & 0xffff) >> 8;
      uVar7 = (uVar6 & 0xffffff) >> 0x10;
      uVar36 = FixedToFP(CONCAT44(uVar6 >> 0x18,uVar6 >> 0x18),0,1,0,0x20);
      iVar18 = param_1 + iVar22 * 4;
      uVar28 = FixedToFP(CONCAT44(uVar6,uVar6) & 0xff000000ff,0,1,0,0x20);
      uVar32 = FixedToFP(CONCAT44(uVar7,uVar7),0,1,0,0x20);
      uVar31 = FixedToFP(CONCAT44(uVar13,uVar13),0,1,0,0x20);
      *(int *)(iVar19 + 0x18) = (int)uVar32;
      *(int *)(iVar19 + 0x1c) = (int)uVar31;
      *(int *)(iVar19 + 0x20) = (int)uVar28;
      *(int *)(iVar19 + 0x24) = (int)uVar36;
      iVar5 = *(int *)(param_1 + 0xb4);
      *(undefined4 *)(*(int *)(iVar18 + 0xb8) + iVar5 * 0x30 + 0x28) = 0x3f800000;
      if (iVar22 == 1) break;
      iVar22 = iVar22 + 1;
      iVar19 = *(int *)(iVar18 + 0xbc);
    }
  }
LAB_00017c5a:
  if (*(int *)puVar2 == local_64) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

## FUN_0001b614 — 0001b614

```c

void FUN_0001b614(int param_1)

{
  int iVar1;
  char cVar2;
  int iVar3;
  uint uVar4;
  uint uVar5;
  uint uVar6;
  int iVar7;
  int iVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  undefined4 uVar11;
  undefined4 uVar12;
  undefined8 in_d0;
  undefined8 uVar13;
  undefined4 uVar14;
  undefined8 in_d1;
  undefined4 uVar15;
  undefined8 uVar16;
  undefined4 uVar17;
  undefined8 in_d3;
  undefined8 in_d4;
  undefined4 uVar18;
  undefined8 in_d5;
  undefined4 uVar19;
  undefined4 in_s13;
  undefined4 in_s15;
  undefined8 unaff_d8;
  undefined8 uVar20;
  undefined8 uVar21;
  undefined8 uVar22;
  undefined1 local_2c;
  undefined1 local_2b;
  undefined1 local_2a;
  undefined1 local_29;
  
  iVar3 = DAT_005f8d98;
  iVar1 = *(int *)(param_1 + 0x70) * 0x10;
  uVar15 = (undefined4)((ulonglong)in_d1 >> 0x20);
  uVar13 = FloatVectorMult(CONCAT44((int)((ulonglong)in_d0 >> 0x20),
                                    *(undefined4 *)(&DAT_004711ec + iVar1)),0x3f0000003f000000,2,
                           0x20);
  uVar16 = FloatVectorMult(CONCAT44(uVar15,*(undefined4 *)(&DAT_004711f0 + iVar1)),
                           0x3f0000003f000000,2,0x20);
  uVar5 = DAT_005f8d98 * 6 | 1;
  uVar16 = FloatVectorAdd(uVar16,0x3f0000003f000000,2);
  uVar13 = FloatVectorAdd(uVar13,0x3f0000003f000000,2);
  uVar19 = (undefined4)((ulonglong)in_d5 >> 0x20);
  uVar20 = FloatVectorAdd(CONCAT44((int)((ulonglong)in_d3 >> 0x20),*(undefined4 *)(param_1 + 0x1c)),
                          CONCAT44(uVar19,*(undefined4 *)(param_1 + 0x28)),2);
  uVar17 = *(undefined4 *)(&DAT_004711f8 + iVar1);
  cVar2 = *(char *)(param_1 + 0x34);
  uVar20 = FloatVectorMult(uVar20,CONCAT44(uVar15,*(undefined4 *)(param_1 + 0x44)),2,0x20);
  uVar14 = *(undefined4 *)(&DAT_004711f4 + iVar1);
  iVar1 = DAT_005f8d98 * 0x120;
  iVar7 = uVar5 * 0x30;
  uVar20 = FloatVectorAdd(CONCAT44((int)((ulonglong)in_d4 >> 0x20),*(undefined4 *)(param_1 + 0x38)),
                          uVar20,2);
  *(int *)(&DAT_005d4d98 + iVar1) = (int)uVar20;
  uVar9 = (undefined4)((ulonglong)unaff_d8 >> 0x20);
  uVar21 = FloatVectorAdd(CONCAT44(in_s15,*(undefined4 *)(param_1 + 0x20)),
                          CONCAT44(uVar9,*(undefined4 *)(param_1 + 0x2c)),2);
  uVar18 = uVar17;
  if (cVar2 == '\0') {
    uVar18 = uVar14;
  }
  uVar21 = FloatVectorMult(uVar21,CONCAT44(in_s13,*(undefined4 *)(param_1 + 0x48)),2,0x20);
  uVar21 = FloatVectorAdd(CONCAT44(uVar19,*(undefined4 *)(param_1 + 0x3c)),uVar21,2);
  *(int *)(&DAT_005d4d9c + iVar1) = (int)uVar21;
  *(int *)(&DAT_005d4dc0 + iVar1) = (int)uVar16;
  *(undefined4 *)(&DAT_005d4dc4 + iVar1) = uVar18;
  uVar22 = FloatVectorSub(CONCAT44(uVar9,*(undefined4 *)(param_1 + 0x28)),
                          CONCAT44(in_s15,*(undefined4 *)(param_1 + 0x1c)),2,0x20);
  uVar22 = FloatVectorMult(uVar22,CONCAT44(in_s13,*(undefined4 *)(param_1 + 0x44)),2,0x20);
  uVar21 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar21 >> 0x20),*(undefined4 *)(param_1 + 0x38))
                          ,uVar22,2);
  *(int *)(&DAT_005d4d98 + iVar7) = (int)uVar21;
  uVar22 = FloatVectorSub(CONCAT44(uVar9,*(undefined4 *)(param_1 + 0x2c)),
                          CONCAT44(in_s15,*(undefined4 *)(param_1 + 0x20)),2,0x20);
  uVar22 = FloatVectorMult(uVar22,CONCAT44(in_s13,*(undefined4 *)(param_1 + 0x48)),2,0x20);
  uVar21 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar21 >> 0x20),*(undefined4 *)(param_1 + 0x3c))
                          ,uVar22,2);
  *(int *)(&DAT_005d4d9c + iVar7) = (int)uVar21;
  *(int *)(&DAT_005d4dc0 + iVar7) = (int)uVar13;
  *(undefined4 *)(&DAT_005d4dc4 + iVar7) = uVar18;
  uVar19 = (undefined4)((ulonglong)uVar21 >> 0x20);
  uVar21 = FloatVectorSub(CONCAT44(in_s13,*(undefined4 *)(param_1 + 0x1c)),
                          CONCAT44(in_s15,*(undefined4 *)(param_1 + 0x28)),2,0x20);
  uVar21 = FloatVectorMult(uVar21,CONCAT44(uVar19,*(undefined4 *)(param_1 + 0x44)),2,0x20);
  uVar20 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar20 >> 0x20),*(undefined4 *)(param_1 + 0x38))
                          ,uVar21,2);
  *(int *)(&DAT_005d4df8 + iVar1) = (int)uVar20;
  uVar21 = FloatVectorSub(CONCAT44(in_s13,*(undefined4 *)(param_1 + 0x20)),
                          CONCAT44(in_s15,*(undefined4 *)(param_1 + 0x2c)),2,0x20);
  uVar18 = (undefined4)((ulonglong)uVar20 >> 0x20);
  if (cVar2 == '\0') {
    uVar14 = uVar17;
  }
  uVar20 = FloatVectorMult(uVar21,CONCAT44(uVar19,*(undefined4 *)(param_1 + 0x48)),2,0x20);
  uVar20 = FloatVectorAdd(CONCAT44(uVar18,*(undefined4 *)(param_1 + 0x3c)),uVar20,2);
  *(int *)(&DAT_005d4dfc + iVar1) = (int)uVar20;
  *(int *)(&DAT_005d4e20 + iVar1) = (int)uVar16;
  *(undefined4 *)(&DAT_005d4e24 + iVar1) = uVar14;
  *(undefined4 *)(&DAT_005d4e34 + iVar1) = *(undefined4 *)(&DAT_005d4e04 + iVar1);
  *(undefined4 *)(&DAT_005d4e38 + iVar1) = *(undefined4 *)(&DAT_005d4e08 + iVar1);
  *(undefined4 *)(&DAT_005d4e3c + iVar1) = *(undefined4 *)(&DAT_005d4e0c + iVar1);
  *(undefined4 *)(&DAT_005d4e30 + iVar1) = *(undefined4 *)(&DAT_005d4e00 + iVar1);
  *(undefined4 *)(&DAT_005d4e2c + iVar1) = *(undefined4 *)(&DAT_005d4dfc + iVar1);
  *(undefined4 *)(&DAT_005d4e28 + iVar1) = *(undefined4 *)(&DAT_005d4df8 + iVar1);
  *(undefined4 *)(&DAT_005d4e4c + iVar1) = *(undefined4 *)(&DAT_005d4e1c + iVar1);
  *(undefined4 *)(&DAT_005d4e50 + iVar1) = *(undefined4 *)(&DAT_005d4e20 + iVar1);
  *(undefined4 *)(&DAT_005d4e54 + iVar1) = *(undefined4 *)(&DAT_005d4e24 + iVar1);
  *(undefined4 *)(&DAT_005d4e48 + iVar1) = *(undefined4 *)(&DAT_005d4e18 + iVar1);
  *(undefined4 *)(&DAT_005d4e44 + iVar1) = *(undefined4 *)(&DAT_005d4e14 + iVar1);
  *(undefined4 *)(&DAT_005d4e40 + iVar1) = *(undefined4 *)(&DAT_005d4e10 + iVar1);
  uVar12 = *(undefined4 *)(&DAT_005d4d98 + uVar5 * 0x30);
  uVar11 = *(undefined4 *)(&DAT_005d4d9c + iVar7);
  uVar10 = *(undefined4 *)(&DAT_005d4da0 + iVar7);
  uVar9 = *(undefined4 *)(&DAT_005d4da4 + iVar7);
  uVar17 = *(undefined4 *)(&DAT_005d4da8 + iVar7);
  *(undefined4 *)(&DAT_005d4e6c + iVar1) = *(undefined4 *)(&DAT_005d4dac + iVar7);
  *(undefined4 *)(&DAT_005d4e68 + iVar1) = uVar17;
  *(undefined4 *)(&DAT_005d4e64 + iVar1) = uVar9;
  *(undefined4 *)(&DAT_005d4e60 + iVar1) = uVar10;
  *(undefined4 *)(&DAT_005d4e5c + iVar1) = uVar11;
  *(undefined4 *)(&DAT_005d4e58 + iVar1) = uVar12;
  uVar12 = *(undefined4 *)(&DAT_005d4db0 + iVar7);
  uVar9 = *(undefined4 *)(&DAT_005d4db4 + iVar7);
  uVar11 = *(undefined4 *)(&DAT_005d4db8 + iVar7);
  uVar10 = *(undefined4 *)(&DAT_005d4dbc + iVar7);
  uVar17 = *(undefined4 *)(&DAT_005d4dc0 + iVar7);
  *(undefined4 *)(&DAT_005d4e84 + iVar1) = *(undefined4 *)(&DAT_005d4dc4 + iVar7);
  iVar8 = 0;
  *(undefined4 *)(&DAT_005d4e80 + iVar1) = uVar17;
  *(undefined4 *)(&DAT_005d4e7c + iVar1) = uVar10;
  *(undefined4 *)(&DAT_005d4e78 + iVar1) = uVar11;
  *(undefined4 *)(&DAT_005d4e74 + iVar1) = uVar9;
  *(undefined4 *)(&DAT_005d4e70 + iVar1) = uVar12;
  uVar21 = FloatVectorNeg(CONCAT44(uVar19,*(undefined4 *)(param_1 + 0x1c)),2,2);
  uVar17 = (undefined4)((ulonglong)uVar20 >> 0x20);
  uVar20 = FloatVectorSub(uVar21,CONCAT44(uVar18,*(undefined4 *)(param_1 + 0x28)),2,0x20);
  uVar20 = FloatVectorMult(uVar20,CONCAT44(uVar17,*(undefined4 *)(param_1 + 0x44)),2,0x20);
  uVar16 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar16 >> 0x20),*(undefined4 *)(param_1 + 0x38))
                          ,uVar20,2);
  *(int *)(&DAT_005d4e88 + iVar1) = (int)uVar16;
  uVar20 = FloatVectorNeg(CONCAT44(uVar19,*(undefined4 *)(param_1 + 0x20)),2,2);
  uVar20 = FloatVectorSub(uVar20,CONCAT44(uVar18,*(undefined4 *)(param_1 + 0x2c)),2,0x20);
  uVar20 = FloatVectorMult(uVar20,CONCAT44(uVar17,*(undefined4 *)(param_1 + 0x48)),2,0x20);
  iVar7 = *(int *)(PTR_DAT_004d9048 + 0x4c);
  uVar16 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar16 >> 0x20),*(undefined4 *)(param_1 + 0x3c))
                          ,uVar20,2);
  *(int *)(&DAT_005d4e8c + iVar1) = (int)uVar16;
  *(int *)(&DAT_005d4eb0 + iVar1) = (int)uVar13;
  *(undefined4 *)(&DAT_005d4eb4 + iVar1) = uVar14;
  uVar20 = FixedToFP((ulonglong)CONCAT14(*(byte *)(param_1 + 8),(uint)*(byte *)(param_1 + 8)),0,0,0,
                     0x20);
  uVar21 = FixedToFP((ulonglong)CONCAT14(*(byte *)(param_1 + 9),(uint)*(byte *)(param_1 + 9)),0,0,0,
                     0x20);
  local_29 = *(undefined1 *)(param_1 + 0xb);
  uVar16 = FloatVectorMult(uVar20,CONCAT44((int)((ulonglong)uVar16 >> 0x20),
                                           *(undefined4 *)(iVar7 + 0x1c)),2,0x20);
  uVar20 = FixedToFP((ulonglong)CONCAT14(*(byte *)(param_1 + 10),(uint)*(byte *)(param_1 + 10)),0,0,
                     0,0x20);
  uVar21 = FloatVectorMult(uVar21,CONCAT44(uVar15,*(undefined4 *)(iVar7 + 0x18)),2,0x20);
  uVar16 = FPToFixed(uVar16,0,0,3,0x20);
  uVar20 = FloatVectorMult(uVar20,CONCAT44((int)((ulonglong)uVar13 >> 0x20),
                                           *(undefined4 *)(iVar7 + 0x14)),2,0x20);
  uVar13 = FPToFixed(uVar21,0,0,3,0x20);
  uVar20 = FPToFixed(uVar20,0,0,3,0x20);
  local_2c = (undefined1)uVar16;
  local_2b = (undefined1)uVar13;
  local_2a = (undefined1)uVar20;
  do {
    iVar1 = iVar8 + iVar3 * 0x120;
    *(undefined4 *)(&DAT_005d4d98 + iVar8 + iVar3 * 0x120 + 8) = 0;
    *(undefined4 *)(&DAT_005d4d98 + iVar8 + iVar3 * 0x120 + 0xc) = 0;
    *(undefined4 *)(&DAT_005d4d98 + iVar8 + iVar3 * 0x120 + 0x10) = 0;
    *(undefined4 *)(&DAT_005d4d98 + iVar8 + iVar3 * 0x120 + 0x14) = 0x3f800000;
    uVar5 = FUN_0031048c((int)uVar13,&local_2c);
    uVar6 = (uVar5 & 0xffffff) >> 0x10;
    uVar16 = FixedToFP(CONCAT44(uVar5,uVar5) & 0xff000000ff,0,1,0,0x20);
    uVar4 = (uVar5 & 0xffff) >> 8;
    uVar13 = FixedToFP(CONCAT44(uVar5 >> 0x18,uVar5 >> 0x18),0,1,0,0x20);
    uVar20 = FixedToFP(CONCAT44(uVar4,uVar4),0,1,0,0x20);
    *(int *)(&DAT_005d4d98 + iVar8 + iVar3 * 0x120 + 0x20) = (int)uVar16;
    uVar16 = FixedToFP(CONCAT44(uVar6,uVar6),0,1,0,0x20);
    *(int *)(&DAT_005d4d98 + iVar8 + iVar3 * 0x120 + 0x1c) = (int)uVar20;
    iVar7 = iVar8 + iVar3 * 0x120;
    iVar8 = iVar8 + 0x30;
    *(int *)(&DAT_005d4d98 + iVar7 + 0x18) = (int)uVar16;
    *(int *)(&DAT_005d4d98 + iVar1 + 0x24) = (int)uVar13;
  } while (iVar8 != 0x120);
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

## FUN_00044a00 — 00044a00

```c

undefined4 FUN_00044a00(int param_1)

{
  int *piVar1;
  int *piVar2;
  char cVar3;
  short sVar4;
  uint5 uVar5;
  undefined3 uVar6;
  undefined *puVar7;
  undefined4 uVar8;
  float fVar9;
  undefined4 uVar10;
  undefined4 uVar11;
  uint uVar12;
  undefined4 *puVar13;
  undefined4 *puVar14;
  uint uVar15;
  int iVar16;
  uint uVar17;
  byte bVar18;
  uint uVar19;
  uint uVar20;
  bool bVar21;
  float fVar22;
  uint extraout_s0;
  undefined4 extraout_s0_00;
  undefined4 uVar23;
  undefined8 in_d0;
  undefined8 uVar24;
  ulonglong uVar25;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  uint extraout_s1_01;
  undefined8 uVar26;
  undefined4 extraout_s1_02;
  undefined4 extraout_s1_03;
  undefined4 extraout_s1_04;
  undefined8 in_d1;
  undefined4 extraout_s3;
  ulonglong uVar27;
  uint extraout_s3_00;
  longlong lVar28;
  uint extraout_s3_01;
  undefined8 uVar29;
  undefined4 extraout_s3_02;
  longlong lVar30;
  uint extraout_s3_03;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  longlong lVar31;
  uint extraout_s5_01;
  undefined8 uVar32;
  undefined4 extraout_s5_02;
  uint extraout_s5_03;
  undefined4 extraout_s7;
  undefined4 extraout_s7_00;
  undefined8 uVar33;
  undefined8 unaff_d8;
  undefined8 uVar34;
  undefined8 unaff_d9;
  undefined8 uVar35;
  undefined8 unaff_d10;
  undefined8 uVar36;
  undefined8 unaff_d11;
  undefined4 uVar37;
  undefined8 unaff_d12;
  undefined8 unaff_d13;
  undefined8 uVar38;
  undefined4 local_c8;
  undefined4 local_c4;
  undefined4 local_c0;
  undefined1 auStack_bc [12];
  undefined4 local_b0;
  undefined4 local_ac;
  undefined4 local_a8;
  undefined4 local_a4;
  undefined4 local_a0;
  undefined4 local_9c;
  undefined4 local_98;
  undefined4 local_94;
  undefined4 local_90;
  undefined4 local_8c;
  undefined4 local_88;
  undefined4 local_84;
  undefined4 local_80;
  undefined4 local_7c;
  undefined4 local_78;
  undefined4 local_74;
  undefined4 local_70;
  undefined4 local_6c;
  undefined4 local_68;
  undefined4 local_64;
  undefined4 local_60;
  undefined4 local_5c;
  undefined4 local_58;
  undefined4 local_54;
  
  puVar7 = PTR_DAT_004d9050;
  uVar23 = (undefined4)((ulonglong)unaff_d12 >> 0x20);
  sVar4 = *(short *)(param_1 + 0x7e);
  if (sVar4 < 1) {
    uVar35 = CONCAT44((int)((ulonglong)unaff_d9 >> 0x20),DAT_0052bfe0);
    uVar36 = CONCAT44((int)((ulonglong)unaff_d10 >> 0x20),DAT_0052bfe4);
    uVar34 = CONCAT44((int)((ulonglong)unaff_d8 >> 0x20),DAT_0052bfe8);
  }
  else {
    uVar34 = 0;
    uVar17 = *(uint *)(PTR_DAT_004d9050 + 8);
    piVar1 = (int *)(PTR_DAT_004d9050 + 0xc);
    uVar15 = *(uint *)(PTR_DAT_004d9050 + 0x10);
    lVar30 = (ulonglong)*(uint *)PTR_DAT_004d9050 * (ulonglong)uVar17;
    uVar20 = (uint)lVar30;
    piVar2 = (int *)(PTR_DAT_004d9050 + 0x14);
    uVar12 = uVar20 + uVar15;
    lVar28 = (ulonglong)uVar12 * (ulonglong)uVar17;
    uVar19 = (uint)lVar28;
    uVar20 = *(int *)(PTR_DAT_004d9050 + 4) * uVar17 +
             *(uint *)PTR_DAT_004d9050 * *piVar1 + (int)((ulonglong)lVar30 >> 0x20) +
             *piVar2 + (uint)CARRY4(uVar20,uVar15);
    *(uint *)PTR_DAT_004d9050 = uVar19 + uVar15;
    iVar16 = (uVar20 >> 0x1d) - 4;
    uVar12 = *piVar2 + uVar20 * uVar17 + uVar12 * *piVar1 + (int)((ulonglong)lVar28 >> 0x20) +
             (uint)CARRY4(uVar19,uVar15);
    uVar35 = FixedToFP(CONCAT44(iVar16,iVar16),0,0,0,0x20);
    *(uint *)(puVar7 + 4) = uVar12;
    iVar16 = (uVar12 >> 0x1d) - 4;
    uVar36 = FixedToFP(CONCAT44(iVar16,iVar16),0,0,0,0x20);
    *(short *)(param_1 + 0x7e) = sVar4 + -1;
  }
  uVar10 = (undefined4)((ulonglong)in_d0 >> 0x20);
  fVar22 = *(float *)(param_1 + 0x80);
  uVar25 = CONCAT44(uVar10,fVar22);
  if (fVar22 <= 0.0) {
    uVar23 = *(undefined4 *)(PTR_DAT_004d9048 + 0x20);
    iVar16 = FUN_0001cd2c();
    uVar25 = (ulonglong)extraout_s0;
    if (iVar16 != 1) goto LAB_00044fa4;
    uVar38 = FloatVectorAbsolute(CONCAT44((int)((ulonglong)unaff_d11 >> 0x20),uVar23),4);
    uVar23 = 0x3f800000;
    iVar16 = FUN_0001cd68();
    uVar27 = (ulonglong)extraout_s3_00 << 0x20;
    uVar25 = CONCAT44(extraout_s1,extraout_s0_00);
    if ((-1 < (int)((uint)((float)uVar38 < 1.0) << 0x1f)) || (iVar16 != 0)) goto LAB_00044fa4;
    uVar24 = FloatVectorMult(uVar38,CONCAT44(extraout_s1,*(undefined4 *)(param_1 + 0xc)),2,0x20);
    uVar25 = 0x3f8000003f800000;
    uVar24 = FloatVectorMult(uVar24,0xc0400000c0400000,2,0x20);
    uVar36 = FloatVectorAdd(uVar36,uVar24,2);
    uVar10 = extraout_s7_00;
    uVar11 = extraout_s5_00;
  }
  else {
    if (DAT_00044c44 < fVar22) goto LAB_00044fa4;
    uVar38 = FloatVectorMult(CONCAT44(uVar10,fVar22 / DAT_00044c44),
                             CONCAT44((int)((ulonglong)in_d1 >> 0x20),DAT_00044c48),2,0x20);
    uVar38 = FloatVectorMult(uVar38,0x40c0000040c00000,2,0x20);
    uVar38 = FloatVectorMult(uVar38,CONCAT44(uVar10,DAT_00044c4c),2,0x20);
    uVar24 = FPToFixed(uVar38,0,0,3,0x20);
    fVar22 = (float)FUN_003010b8((int)uVar24);
    fVar9 = ABS(fVar22);
    uVar25 = CONCAT44(fVar22,fVar22) & 0x7fffffff7fffffff;
    fVar22 = (float)uVar38;
    uVar27 = CONCAT44(extraout_s3,DAT_00044c50);
    uVar10 = extraout_s7;
    uVar11 = extraout_s5;
    if ((DAT_00044c50 < fVar22) &&
       (uVar27 = CONCAT44(extraout_s3,DAT_00044c54),
       (int)((uint)(fVar22 < DAT_00044c54) << 0x1f) < 0)) {
      if (((int)((uint)(fVar22 < DAT_00044c58) << 0x1f) < 0) ||
         (uVar27 = CONCAT44(extraout_s3,DAT_00044c5c), DAT_00044c5c < fVar22)) {
        fVar22 = DAT_00044c60;
        if (DAT_00044c60 < fVar9) {
          fVar22 = fVar9;
        }
        uVar25 = CONCAT44(extraout_s3,fVar22);
        uVar27 = uVar25;
      }
      else {
        uVar25 = CONCAT44(fVar9,DAT_00044c60);
      }
    }
  }
  lVar31 = CONCAT44(uVar11,*(undefined4 *)(param_1 + 0x24));
  uVar33 = FloatVectorMult(uVar25,CONCAT44(uVar10,*(undefined4 *)(param_1 + 0x20)),2,0x20);
  lVar28 = FloatVectorMult(uVar25,CONCAT44((int)(uVar27 >> 0x20),*(undefined4 *)(param_1 + 0x28)),2,
                           0x20);
  uVar24 = FloatVectorMult(uVar25,lVar31,2,0x20);
  local_98 = (undefined4)uVar33;
  local_84 = (undefined4)uVar24;
  local_70 = (undefined4)lVar28;
  local_5c = 0x3f800000;
  local_88 = 0;
  local_8c = 0;
  local_90 = 0;
  local_94 = 0;
  local_74 = 0;
  local_78 = 0;
  local_7c = 0;
  local_80 = 0;
  local_60 = 0;
  local_64 = 0;
  local_68 = 0;
  local_6c = 0;
  lVar30 = CONCAT44((int)((ulonglong)uVar24 >> 0x20),*(float *)(param_1 + 0x2c));
  if (*(float *)(param_1 + 0x2c) == 0.0) {
    uVar33 = 0;
    uVar38 = 0;
    uVar24 = 0;
  }
  else {
    uVar37 = (undefined4)((ulonglong)uVar38 >> 0x20);
    uVar24 = CONCAT44(uVar37,DAT_00044fbc);
    uVar38 = FloatVectorMult(lVar30,uVar24,2,0x20);
    uVar38 = FPToFixed(uVar38,0,0,3,0x20);
    uVar10 = FUN_003010b8((uint)uVar38 & 0xffff);
    uVar38 = FloatVectorMult(CONCAT44(extraout_s1_00,*(undefined4 *)(param_1 + 0x2c)),uVar24,2,0x20)
    ;
    uVar38 = FPToFixed(uVar38,0,0,3,0x20);
    uVar11 = FUN_003010d0((uint)uVar38 & 0xffff);
    FUN_00027228(&local_98,uVar10,uVar11);
    lVar31 = (ulonglong)extraout_s5_01 << 0x20;
    lVar28 = (ulonglong)extraout_s3_01 << 0x20;
    lVar30 = (ulonglong)extraout_s1_01 << 0x20;
    uVar24 = CONCAT44(uVar23,local_68);
    uVar38 = CONCAT44(uVar37,local_64);
    uVar33 = CONCAT44((int)((ulonglong)unaff_d13 >> 0x20),local_60);
  }
  uVar32 = FloatVectorAdd(uVar35,CONCAT44((int)((ulonglong)lVar31 >> 0x20),
                                          *(undefined4 *)(param_1 + 8)),2);
  uVar29 = FloatVectorAdd(uVar36,CONCAT44((int)((ulonglong)lVar28 >> 0x20),
                                          *(undefined4 *)(param_1 + 0xc)),2);
  uVar26 = FloatVectorAdd(uVar34,CONCAT44((int)((ulonglong)lVar30 >> 0x20),
                                          *(undefined4 *)(param_1 + 0x10)),2);
  local_b0 = (undefined4)uVar32;
  local_ac = (undefined4)uVar29;
  local_a8 = (undefined4)uVar26;
  FUN_000254d4(local_a8,&local_a4,&local_b0,param_1 + 0x14,0);
  lVar28 = FloatVectorAdd(CONCAT44(extraout_s5_02,local_a4),uVar24,2);
  lVar30 = FloatVectorAdd(CONCAT44(extraout_s3_02,local_a0),uVar38,2);
  uVar25 = FloatVectorAdd(CONCAT44(extraout_s1_02,local_9c),uVar33,2);
  local_68 = (undefined4)lVar28;
  local_64 = (undefined4)lVar30;
  local_60 = (undefined4)uVar25;
  if (*(int *)(param_1 + 0x74) != 0) {
    (**(code **)(**(int **)(param_1 + 0x74) + 8))();
    puVar7 = PTR_DAT_004d904c;
    bVar18 = *(byte *)(param_1 + 0x5f);
    uVar6 = *(undefined3 *)(param_1 + 0x5c);
    if ((int)((uint)(*(float *)(*(int *)(PTR_DAT_004d9048 + 0x4c) + 0x20) < 1.0) << 0x1f) < 0) {
      uVar5 = CONCAT14(bVar18,(uint)bVar18);
      bVar18 = 0;
      uVar38 = FixedToFP((ulonglong)uVar5,0,0,0,0x20);
      uVar38 = FloatVectorMult(uVar38,CONCAT44(extraout_s1_03,
                                               *(float *)(*(int *)(PTR_DAT_004d9048 + 0x4c) + 0x20))
                               ,2,0x20);
      uVar38 = FPToFixed(uVar38,0,0,3,0x20);
      if ((0 < (int)uVar38) && (bVar18 = 0xff, (int)uVar38 < 0xff)) {
        bVar18 = (byte)uVar38;
      }
    }
    PTR_DAT_004d904c[0x18d4] = 0;
    uVar8 = DAT_0052be30;
    uVar37 = DAT_0052be2c;
    uVar11 = DAT_0052be28;
    uVar10 = DAT_0052be24;
    uVar23 = DAT_0052be20;
    *(undefined4 *)(puVar7 + 0x10a8) = DAT_0052be34;
    *(undefined4 *)(puVar7 + 0x10a4) = uVar8;
    *(undefined4 *)(puVar7 + 0x10a0) = uVar37;
    *(undefined4 *)(puVar7 + 0x109c) = uVar11;
    *(undefined4 *)(puVar7 + 0x1098) = uVar10;
    *(undefined4 *)(puVar7 + 0x1094) = uVar23;
    uVar8 = DAT_0052be48;
    uVar37 = DAT_0052be44;
    uVar11 = DAT_0052be40;
    uVar10 = DAT_0052be3c;
    uVar23 = DAT_0052be38;
    *(undefined4 *)(puVar7 + 0x10c0) = DAT_0052be4c;
    *(undefined4 *)(puVar7 + 0x10bc) = uVar8;
    *(undefined4 *)(puVar7 + 0x10b8) = uVar37;
    *(undefined4 *)(puVar7 + 0x10b4) = uVar11;
    *(undefined4 *)(puVar7 + 0x10b0) = uVar10;
    *(undefined4 *)(puVar7 + 0x10ac) = uVar23;
    uVar11 = DAT_0052be58;
    uVar10 = DAT_0052be54;
    uVar23 = DAT_0052be50;
    *(undefined4 *)(puVar7 + 0x10d0) = DAT_0052be5c;
    *(undefined4 *)(puVar7 + 0x10cc) = uVar11;
    *(undefined4 *)(puVar7 + 0x10c8) = uVar10;
    *(undefined4 *)(puVar7 + 0x10c4) = uVar23;
    *(undefined4 *)(puVar7 + 0x18a8) = local_84;
    *(undefined4 *)(puVar7 + 0x18a4) = local_88;
    *(undefined4 *)(puVar7 + 0x18a0) = local_8c;
    *(undefined4 *)(puVar7 + 0x189c) = local_90;
    *(undefined4 *)(puVar7 + 0x1898) = local_94;
    *(undefined4 *)(puVar7 + 0x1894) = local_98;
    *(undefined4 *)(puVar7 + 0x18c0) = local_6c;
    *(undefined4 *)(puVar7 + 0x18bc) = local_70;
    *(undefined4 *)(puVar7 + 0x18b8) = local_74;
    *(undefined4 *)(puVar7 + 0x18b4) = local_78;
    *(undefined4 *)(puVar7 + 0x18b0) = local_7c;
    *(undefined4 *)(puVar7 + 0x18ac) = local_80;
    *(undefined4 *)(puVar7 + 0x18d0) = local_5c;
    *(undefined4 *)(puVar7 + 0x18cc) = local_60;
    *(undefined4 *)(puVar7 + 0x18c8) = local_64;
    *(undefined4 *)(puVar7 + 0x18c4) = local_68;
    *(int *)(puVar7 + 0x18d8) = *(int *)(puVar7 + 0x18d8) + 2;
    FUN_002eec0c(puVar7,1);
    cVar3 = *(char *)(param_1 + 0x84);
    if (*(int *)(PTR_DAT_004d9048 + 0x10) == 1) {
      if (cVar3 != '\0') {
LAB_00044ecc:
        uVar10 = 0;
        uVar23 = 0x3f800000;
        goto LAB_00044ef0;
      }
      if (*(char *)(param_1 + 0x85) != '\0') goto LAB_00044ed6;
    }
    else {
      if (cVar3 != '\0') goto LAB_00044ecc;
LAB_00044ed6:
      puVar13 = &DAT_00044fc0;
      bVar21 = *(char *)(param_1 + 0x7d) != '\0';
      if (bVar21) {
        puVar13 = &DAT_00044fc4;
      }
      puVar14 = &DAT_00044fc8;
      uVar23 = *puVar13;
      if (bVar21) {
        puVar14 = &DAT_00044fcc;
      }
      uVar10 = *puVar14;
LAB_00044ef0:
      puVar13 = &DAT_00044fd0;
      puVar14 = &DAT_00044fd8;
      local_58 = CONCAT13(bVar18,uVar6);
      if (cVar3 != '\0') {
        puVar13 = &DAT_00044fd4;
        puVar14 = &DAT_00044fdc;
      }
      FUN_0033a538(*puVar13,&local_58,uVar10,uVar23,*puVar14,*puVar13,0);
    }
    uVar23 = (**(code **)(**(int **)(param_1 + 0x74) + 0xc))(*(int **)(param_1 + 0x74),1);
    lVar28 = (ulonglong)extraout_s5_03 << 0x20;
    lVar30 = (ulonglong)extraout_s3_03 << 0x20;
    uVar25 = CONCAT44(extraout_s1_04,uVar23);
  }
  uVar23 = DAT_005a70e0;
  if (*(char *)(param_1 + 0x8c) != '\0') {
    uVar38 = FloatVectorAdd(uVar35,CONCAT44((int)((ulonglong)lVar28 >> 0x20),
                                            *(undefined4 *)(param_1 + 8)),2);
    uVar34 = FloatVectorAdd(uVar34,CONCAT44((int)(uVar25 >> 0x20),*(undefined4 *)(param_1 + 0x10)),2
                           );
    uVar35 = FloatVectorAdd(uVar36,CONCAT44((int)((ulonglong)lVar30 >> 0x20),
                                            *(undefined4 *)(param_1 + 0xc)),2);
    local_c8 = (undefined4)uVar38;
    local_c4 = (undefined4)uVar35;
    local_c0 = (undefined4)uVar34;
    FUN_000254d4(local_c0,auStack_bc,&local_c8,param_1 + 0x14,0);
    local_58 = 0x3f800000;
    local_54 = 0x3f800000;
    uVar12 = FUN_003234c4(uVar23,auStack_bc,&local_58,0,1);
    uVar25 = (ulonglong)uVar12;
  }
LAB_00044fa4:
  return (int)uVar25;
}


```

## FUN_00020c38 — 00020c38

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

## FUN_00020d8c — 00020d8c

```c

void FUN_00020d8c(undefined4 *param_1)

{
  undefined *puVar1;
  undefined *puVar2;
  undefined4 uVar3;
  undefined **local_48;
  undefined *local_44;
  undefined1 local_28;
  int local_24;
  
  puVar2 = PTR_DAT_004d9048;
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  if ((DAT_005577e0 == 0) || (*(int *)(DAT_005577e0 + 0xd4) != 1)) {
    local_28 = 1;
    local_48 = (undefined **)0x0;
    uVar3 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
    FUN_0000a298(&local_48);
    local_28 = 0;
    local_48 = &PTR_LAB_0052bf38;
    local_44 = PTR_FUN_004d9058;
    FUN_0002bb34(uVar3,"menu-bomb",0x3f800000,0x3f800000,&local_48,0);
    FUN_0000a298(&local_48);
    *(undefined4 *)(puVar2 + 0x24) = 0x40000000;
    DAT_00557804 = *param_1;
    DAT_00557808 = param_1[1];
    DAT_0055780c = param_1[2];
    DAT_005577b0 = 1;
  }
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
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

## FUN_000502b4 — 000502b4

```c

void FUN_000502b4(int param_1)

{
  undefined *puVar1;
  undefined1 *puVar2;
  int iVar3;
  undefined4 *puVar4;
  undefined4 uVar5;
  undefined4 local_1c;
  
  puVar2 = (undefined1 *)FUN_00052f80();
  *puVar2 = 0;
  puVar1 = PTR_DAT_004d9048;
  iVar3 = FUN_00052f80();
  *(undefined4 *)(iVar3 + 0x7c) = 0x3f800000;
  puVar4 = (undefined4 *)FUN_00033ca0();
  *puVar4 = 0;
  iVar3 = FUN_00033ca0();
  *(undefined4 *)(iVar3 + 4) = 0x3f800000;
  *(undefined4 *)(*(int *)(puVar1 + 0x4c) + 0x24) = 0x3f800000;
  FUN_00013f00();
  local_1c = 0;
  uVar5 = FUN_000065c4();
  iVar3 = FUN_00006ad0(uVar5,7,&local_1c);
  while (iVar3 != 0) {
    *(uint *)(iVar3 + 0xc) = *(uint *)(iVar3 + 0xc) | 0x10;
    uVar5 = FUN_000065c4();
    iVar3 = FUN_00006af0(uVar5,7,&local_1c);
  }
  *(undefined1 *)(param_1 + 0x33) = 1;
  return;
}


```

## FUN_000203e8 — 000203e8

```c

/* WARNING: Heritage AFTER dead removal. Example location: s1 : 0x0002046a */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void FUN_000203e8(void)

{
  undefined *puVar1;
  undefined *puVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  uint uVar6;
  undefined4 in_fpscr;
  float fVar7;
  int iVar8;
  undefined8 in_d0;
  undefined8 uVar9;
  undefined4 uVar10;
  ulonglong uVar11;
  undefined4 extraout_s3;
  undefined8 uVar12;
  undefined4 extraout_s3_00;
  undefined8 in_d2;
  undefined4 extraout_s5;
  undefined8 uVar13;
  undefined4 extraout_s7;
  undefined4 uVar14;
  undefined1 local_2c;
  undefined1 local_2b;
  undefined1 local_2a;
  undefined1 local_29;
  
  puVar1 = PTR_DAT_004d9048;
  fVar7 = *(float *)(PTR_DAT_004d9048 + 0x24);
  if ((char)((byte)((uint)in_fpscr >> 0x18) & 0xf | (byte)(((uint)(fVar7 < 0.0) << 0x1f) >> 0x18) |
             (byte)(((uint)(fVar7 == 0.0) << 0x1e) >> 0x18) |
            (byte)(((uint)(0.0 <= fVar7) << 0x1d) >> 0x18)) < '\0') {
    uVar11 = (ulonglong)(uint)DAT_00020688;
    uVar9 = FloatVectorAdd(CONCAT44((int)((ulonglong)in_d0 >> 0x20),fVar7),
                           CONCAT44((int)((ulonglong)in_d2 >> 0x20),DAT_0002068c),2);
    uVar9 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar9 >> 0x20),(float)uVar9 / DAT_00020688),
                           0x3f8000003f800000,2);
    fVar7 = (float)uVar9;
    uVar14 = 0;
    if (0.0 < fVar7) {
      uVar11 = 0x3f8000003f800000;
      if (fVar7 < 1.0) {
        uVar11 = CONCAT44(0x3f800000,DAT_00020690);
      }
      FloatVectorMult(uVar9,uVar11,2,0x20);
      uVar14 = DAT_00020690;
    }
    uVar10 = (undefined4)((ulonglong)uVar9 >> 0x20);
    (**(code **)(*DAT_005577c8 + 8))(fVar7,uVar10,(int)uVar11);
    puVar2 = PTR_DAT_004d904c;
    PTR_DAT_004d904c[0x18d4] = 0;
    uVar4 = DAT_0052be24;
    uVar3 = DAT_0052be20;
    *(undefined4 *)(puVar2 + 0x10a8) = DAT_0052be34;
    *(undefined4 *)(puVar2 + 0x10a4) = DAT_0052be30;
    uVar5 = DAT_0052be28;
    *(undefined4 *)(puVar2 + 0x10a0) = DAT_0052be2c;
    *(undefined4 *)(puVar2 + 0x109c) = uVar5;
    *(undefined4 *)(puVar2 + 0x1098) = uVar4;
    *(undefined4 *)(puVar2 + 0x1094) = uVar3;
    *(undefined4 *)(puVar2 + 0x10c0) = DAT_0052be4c;
    *(undefined4 *)(puVar2 + 0x10bc) = DAT_0052be48;
    uVar3 = DAT_0052be40;
    *(undefined4 *)(puVar2 + 0x10b8) = DAT_0052be44;
    *(undefined4 *)(puVar2 + 0x10b4) = uVar3;
    uVar3 = DAT_0052be38;
    *(undefined4 *)(puVar2 + 0x10b0) = DAT_0052be3c;
    *(undefined4 *)(puVar2 + 0x10ac) = uVar3;
    uVar5 = DAT_0052be58;
    uVar3 = DAT_0052be54;
    uVar4 = DAT_0052be50;
    *(undefined4 *)(puVar2 + 0x10d0) = DAT_0052be5c;
    *(undefined4 *)(puVar2 + 0x10cc) = uVar5;
    *(undefined4 *)(puVar2 + 0x10c8) = uVar3;
    uVar3 = DAT_0052be34;
    *(undefined4 *)(puVar2 + 0x10c4) = uVar4;
    *(undefined4 *)(puVar2 + 0x18a8) = uVar3;
    uVar3 = DAT_0052be2c;
    *(undefined4 *)(puVar2 + 0x18a4) = DAT_0052be30;
    *(undefined4 *)(puVar2 + 0x18a0) = uVar3;
    uVar3 = DAT_0052be24;
    *(undefined4 *)(puVar2 + 0x189c) = DAT_0052be28;
    *(undefined4 *)(puVar2 + 0x1898) = uVar3;
    uVar3 = DAT_0052be4c;
    *(undefined4 *)(puVar2 + 0x1894) = DAT_0052be20;
    *(undefined4 *)(puVar2 + 0x18c0) = uVar3;
    *(undefined4 *)(puVar2 + 0x18bc) = DAT_0052be48;
    uVar3 = DAT_0052be40;
    *(undefined4 *)(puVar2 + 0x18b8) = DAT_0052be44;
    *(undefined4 *)(puVar2 + 0x18b4) = uVar3;
    uVar3 = DAT_0052be38;
    *(undefined4 *)(puVar2 + 0x18b0) = DAT_0052be3c;
    *(undefined4 *)(puVar2 + 0x18ac) = uVar3;
    uVar5 = DAT_0052be58;
    uVar4 = DAT_0052be54;
    uVar3 = DAT_0052be50;
    *(undefined4 *)(puVar2 + 0x18d0) = DAT_0052be5c;
    *(undefined4 *)(puVar2 + 0x18cc) = uVar5;
    *(undefined4 *)(puVar2 + 0x18c8) = uVar4;
    *(undefined4 *)(puVar2 + 0x18c4) = uVar3;
    *(int *)(puVar2 + 0x18d8) = *(int *)(puVar2 + 0x18d8) + 1;
    FUN_00006400(puVar2 + 0x1894,uVar14,uVar14,0x3f800000);
    uVar12 = CONCAT44(extraout_s3,DAT_00557808);
    uVar13 = FloatVectorAdd(CONCAT44(extraout_s5,DAT_00557804),
                            CONCAT44(extraout_s7,*(undefined4 *)(puVar2 + 0x18c4)),2);
    uVar9 = CONCAT44(uVar10,DAT_0055780c);
    *(int *)(puVar2 + 0x18c4) = (int)uVar13;
    uVar12 = FloatVectorAdd(uVar12,CONCAT44((int)((ulonglong)uVar13 >> 0x20),
                                            *(undefined4 *)(puVar2 + 0x18c8)),2);
    *(int *)(puVar2 + 0x18c8) = (int)uVar12;
    uVar9 = FloatVectorAdd(uVar9,CONCAT44((int)((ulonglong)uVar12 >> 0x20),
                                          *(undefined4 *)(puVar2 + 0x18cc)),2);
    *(int *)(puVar2 + 0x18cc) = (int)uVar9;
    *(int *)(puVar2 + 0x18d8) = *(int *)(puVar2 + 0x18d8) + 2;
    FUN_002eec0c((int)uVar9,puVar2,1);
    uVar6 = 0xffffff;
    uVar9 = FloatVectorMult(CONCAT44(extraout_s3_00,*(undefined4 *)(puVar1 + 0x24)),
                            CONCAT44((int)((ulonglong)uVar9 >> 0x20),DAT_00020694),2,0x20);
    uVar9 = FPToFixed(uVar9,0,0,3,0x20);
    iVar8 = (int)uVar9;
    if (0 < iVar8) {
      uVar6 = iVar8 << 0x18 | 0xffffff;
      if (0xfe < iVar8) {
        uVar6 = 0xffffffff;
      }
    }
    local_2c = (undefined1)uVar6;
    local_2b = (undefined1)(uVar6 >> 8);
    local_2a = (undefined1)(uVar6 >> 0x10);
    local_29 = (undefined1)(uVar6 >> 0x18);
    FUN_0033a500(&local_2c,0);
    (**(code **)(*DAT_005577c8 + 0xc))(DAT_005577c8,1);
  }
  return;
}


```

## FUN_0005e5c8 — 0005e5c8

```c

void FUN_0005e5c8(int param_1)

{
  FUN_00027588(*(undefined4 *)(PTR_DAT_004d9048 + 0x5c),*(undefined4 *)(param_1 + 0x14),
               *(undefined4 *)(param_1 + 0x18),*(int *)(param_1 + 0x24) << 1,0,0);
  return;
}


```

## FUN_00060fcc — 00060fcc

```c

void FUN_00060fcc(int param_1,undefined4 param_2)

{
  if (0.0 < *(float *)(PTR_DAT_004d9048 + 0x24)) {
    return;
  }
  FUN_00065f04(param_1 + 8,param_2);
  FUN_000640d0(&DAT_005f94e4,param_2);
  return;
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

## FUN_0001fb18 — 0001fb18

```c

void FUN_0001fb18(float param_1,int param_2)

{
  undefined *puVar1;
  undefined *puVar2;
  undefined *puVar3;
  undefined *puVar4;
  int *piVar5;
  int iVar6;
  undefined4 uVar7;
  undefined4 *puVar8;
  code *pcVar9;
  undefined4 local_34;
  undefined4 local_30;
  undefined4 local_2c;
  
  if (param_2 == 1) {
    piVar5 = (int *)FUN_002eddd0();
    iVar6 = (**(code **)(*piVar5 + 200))();
    if (iVar6 == 1) {
      piVar5 = (int *)FUN_002eddd0();
      (**(code **)(*piVar5 + 0x30))(piVar5,0);
      piVar5 = (int *)FUN_002eddd0();
      (**(code **)(*piVar5 + 0x2c))(piVar5,0);
      piVar5 = (int *)FUN_002eddd0();
      puVar3 = PTR_DAT_004d90bc;
      pcVar9 = *(code **)(*piVar5 + 0xbc);
      uVar7 = FUN_0031048c(PTR_DAT_004d90bc);
      (*pcVar9)(piVar5,uVar7);
      puVar1 = PTR_DAT_004d9048;
      iVar6 = FUN_002eddd0();
      local_34 = *(undefined4 *)(puVar1 + 0x9c);
      local_30 = *(undefined4 *)(puVar1 + 0xa0);
      local_2c = 0x42c80000;
      puVar8 = &local_34;
      if (*(char *)(iVar6 + 0x30) != '\0') {
        puVar8 = (undefined4 *)(iVar6 + 0x20);
      }
      *(undefined4 *)(iVar6 + 0x20) = *puVar8;
      *(undefined4 *)(iVar6 + 0x24) = puVar8[1];
      *(undefined4 *)(iVar6 + 0x28) = puVar8[2];
      FUN_000057f4(local_34,*(undefined4 *)(puVar1 + 0x58),4,1);
      uVar7 = FUN_003ecb20();
      puVar4 = PTR_DAT_004d9108;
      FUN_003efa0c(uVar7,0,PTR_DAT_004d9108,1,0);
      FUN_000057f4(*(undefined4 *)(puVar1 + 0x58),4,1);
      iVar6 = FUN_00025dc0();
      if (iVar6 != 1) {
        return;
      }
      piVar5 = (int *)FUN_002eddd0();
      (**(code **)(*piVar5 + 0x30))(piVar5,1);
      piVar5 = (int *)FUN_002eddd0();
      (**(code **)(*piVar5 + 0x2c))(piVar5,1);
      FUN_0001b970();
      iVar6 = FUN_0004eb70();
      if (iVar6 == 0) {
        FUN_000102c4();
      }
      piVar5 = (int *)FUN_002eddd0();
      iVar6 = 0;
      (**(code **)(*piVar5 + 0x30))(piVar5,0);
      piVar5 = (int *)FUN_002eddd0();
      (**(code **)(*piVar5 + 0x2c))(piVar5,0);
      uVar7 = FUN_003ecb20();
      FUN_003efa0c(uVar7,99,puVar4,1,0);
      piVar5 = (int *)FUN_002eddd0();
      (**(code **)(*piVar5 + 0x2c))(piVar5,1);
      piVar5 = (int *)FUN_002eddd0();
      (**(code **)(*piVar5 + 0x30))(piVar5,1);
      FUN_000057f4(*(undefined4 *)(puVar1 + 0x58),0,1);
      piVar5 = (int *)FUN_002eddd0();
      puVar2 = PTR_DAT_004d9080;
      pcVar9 = *(code **)(*piVar5 + 0xbc);
      uVar7 = FUN_0031048c();
      (*pcVar9)(piVar5,uVar7);
      piVar5 = (int *)FUN_002eddd0();
      (**(code **)(*piVar5 + 0x58))(piVar5,2);
      piVar5 = (int *)FUN_002eddd0();
      (**(code **)(*piVar5 + 0xf4))(piVar5,0,1);
      piVar5 = (int *)FUN_002eddd0();
      (**(code **)(*piVar5 + 0xf8))(piVar5,0,1);
      FUN_000065c4();
      FUN_000068b4();
      piVar5 = (int *)FUN_002eddd0();
      pcVar9 = *(code **)(*piVar5 + 0xbc);
      uVar7 = FUN_0031048c(puVar3);
      (*pcVar9)(piVar5,uVar7);
      FUN_000057f4(*(undefined4 *)(puVar1 + 0x58),1,1);
      piVar5 = (int *)FUN_002eddd0();
      (**(code **)(*piVar5 + 0x30))(piVar5,0);
      piVar5 = (int *)FUN_002eddd0();
      (**(code **)(*piVar5 + 0x2c))(piVar5,0);
      FUN_0003e910(*(undefined4 *)(puVar1 + 0x4c),param_1);
      FUN_0003e940(*(undefined4 *)(puVar1 + 0x4c),0x40);
      uVar7 = FUN_003ecb20();
      FUN_003efa0c(uVar7,100,puVar4,1,0);
      FUN_000057f4(*(undefined4 *)(puVar1 + 0x58),0,1);
      piVar5 = (int *)FUN_002eddd0();
      (**(code **)(*piVar5 + 0x2c))(piVar5,1);
      piVar5 = (int *)FUN_002eddd0();
      (**(code **)(*piVar5 + 0x30))(piVar5,0);
      FUN_000188e4();
      FUN_00009310();
      FUN_00008e58();
      FUN_0003e940(*(undefined4 *)(puVar1 + 0x4c),0x80);
      piVar5 = (int *)FUN_002eddd0();
      pcVar9 = *(code **)(*piVar5 + 0xbc);
      uVar7 = FUN_0031048c(puVar2);
      (*pcVar9)(piVar5,uVar7);
      FUN_0003ae10();
      FUN_00013f24(param_1,1);
      piVar5 = (int *)FUN_002eddd0();
      pcVar9 = *(code **)(*piVar5 + 0xbc);
      uVar7 = FUN_0031048c(puVar3);
      (*pcVar9)(piVar5,uVar7);
      uVar7 = FUN_00033ca0();
      FUN_00034af8(uVar7,param_1 / DAT_0052c284,puVar1[10] != '\0',0xffffffff);
      piVar5 = (int *)FUN_002eddd0();
      (**(code **)(*piVar5 + 0x2c))(piVar5,0);
      if (*(float *)(puVar1 + 0x24) <= 0.0) {
        FUN_000057f4(*(undefined4 *)(puVar1 + 0x58),4,1);
        iVar6 = 0;
      }
      do {
        (**(code **)(*(int *)(&DAT_0055781c)[iVar6] + 0x34))();
        iVar6 = iVar6 + 1;
      } while (iVar6 != 0x10);
      FUN_000057f4(*(undefined4 *)(puVar1 + 0x58),0,1);
      uVar7 = FUN_00033ca0();
      FUN_00034af8(uVar7,param_1 / DAT_0052c284,puVar1[10] != '\0',0);
      piVar5 = (int *)FUN_002eddd0();
      pcVar9 = *(code **)(*piVar5 + 0xbc);
      uVar7 = FUN_0031048c(puVar2);
      (*pcVar9)(piVar5,uVar7);
      FUN_00013f24(param_1,0);
      piVar5 = (int *)FUN_002eddd0();
      pcVar9 = *(code **)(*piVar5 + 0xbc);
      uVar7 = FUN_0031048c(puVar3);
      (*pcVar9)(piVar5,uVar7);
      FUN_0003e940(*(undefined4 *)(puVar1 + 0x4c),1);
      FUN_000057f4(*(undefined4 *)(puVar1 + 0x58),0,1);
      uVar7 = FUN_00033ca0();
      FUN_00034af8(uVar7,param_1 / DAT_0052c284,puVar1[10] != '\0',1);
      FUN_000057f4(*(undefined4 *)(puVar1 + 0x58),4,1);
      uVar7 = FUN_00052f80();
      FUN_00058038(uVar7,0);
      FUN_0003e940(*(undefined4 *)(puVar1 + 0x4c),8);
      if (*(int *)(puVar1 + 0x18c) != 0) {
        FUN_00040eb0();
      }
      iVar6 = FUN_000260f0();
      if ((iVar6 == 1) && (0.0 < *(float *)(puVar1 + 0x3c))) {
        FUN_000200d4();
      }
      piVar5 = (int *)FUN_002eddd0();
      (**(code **)(*piVar5 + 0x30))(piVar5,0);
      piVar5 = (int *)FUN_002eddd0();
      (**(code **)(*piVar5 + 0x2c))(piVar5,0);
      uVar7 = FUN_003ecb20();
      FUN_003efa0c(uVar7,1,puVar4,1,0);
      uVar7 = FUN_003ecb20();
      FUN_003efa0c(uVar7,2,puVar4,1,0);
      uVar7 = FUN_003ecb20();
      FUN_003efa0c(uVar7,3,puVar4,1,0);
      FUN_000057f4(*(undefined4 *)(puVar1 + 0x58),1,1);
      uVar7 = FUN_00033ca0();
      FUN_00034af8(uVar7,param_1 / DAT_0052c284,puVar1[10] != '\0',2);
      if (0.0 < *(float *)(puVar1 + 0x24)) {
        piVar5 = (int *)FUN_002eddd0();
        (**(code **)(*piVar5 + 0x2c))(piVar5,1);
        piVar5 = (int *)FUN_002eddd0();
        (**(code **)(*piVar5 + 0x30))(piVar5,0);
        FUN_000203e8();
      }
      FUN_0003e940(*(undefined4 *)(puVar1 + 0x4c),0x200);
      piVar5 = (int *)FUN_002eddd0();
      (**(code **)(*piVar5 + 0x30))(piVar5,0);
      piVar5 = (int *)FUN_002eddd0();
      (**(code **)(*piVar5 + 0x2c))(piVar5,0);
      uVar7 = FUN_003ecb20();
      FUN_003efa0c(uVar7,0x539,puVar4,1,0);
      uVar7 = FUN_003ecb20();
      FUN_003efa0c(uVar7,0x539,puVar4,1,0);
      piVar5 = (int *)FUN_002eddd0();
      (**(code **)(*piVar5 + 0x2c))(piVar5,1);
      piVar5 = (int *)FUN_002eddd0();
      (**(code **)(*piVar5 + 0x30))(piVar5,0);
      FUN_00305d78();
      iVar6 = FUN_00305c60();
      if (((iVar6 == 1) && (*(int *)(puVar1 + 0x18c) != 0)) &&
         (*(int *)(*(int *)(puVar1 + 0x18c) + 0xd4) == 0xb)) {
        FUN_00305d78();
        FUN_00305c68();
      }
    }
  }
  puVar1 = PTR_DAT_004d9048;
  if ((DAT_005577a8 == '\x01') && (PTR_DAT_004d9048[10] != '\0')) {
    DAT_005577a8 = '\0';
    if (((DAT_00537b20 & 1) == 0) && (iVar6 = ___cxa_guard_acquire(&DAT_00537b20), iVar6 != 0)) {
      FUN_002fa6fc(&DAT_00537af0);
      ___cxa_atexit(PTR_FUN_004d90c4,&DAT_00537af0,PTR___mh_execute_header_004d9040);
      ___cxa_guard_release(&DAT_00537b20);
    }
    uVar7 = FUN_002f69c4("Input/PauseMenu.txt",0x13);
    FUN_002fb448(&DAT_00537af0,uVar7);
    puVar1[10] = puVar1[10] == '\0';
  }
  return;
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

命中函数数: 66
