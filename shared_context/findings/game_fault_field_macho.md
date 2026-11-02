# 全局字段引用函数（完整反编译）

- 全局地址: 004d9048
- 字段偏移: 0xa4
- 直接引用函数数: 310

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

## FUN_0007b24c — 0007b24c

```c

void FUN_0007b24c(int param_1,undefined4 param_2,int param_3,int *param_4)

{
  undefined *puVar1;
  int iVar2;
  void *pvVar3;
  float fVar4;
  float fVar5;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  undefined4 uVar7;
  undefined8 uVar6;
  undefined1 local_88;
  undefined1 local_87;
  undefined1 local_86;
  undefined1 local_85;
  undefined1 local_84;
  undefined1 local_83;
  undefined1 local_82;
  undefined1 local_81;
  undefined1 local_80;
  undefined1 local_7f;
  undefined1 local_7e;
  undefined1 local_7d;
  undefined4 local_7c;
  undefined4 local_78;
  undefined4 local_74;
  undefined4 local_70;
  undefined1 local_6c;
  undefined1 local_6b;
  undefined1 local_6a;
  undefined1 local_69;
  undefined1 local_68;
  undefined1 local_67;
  undefined1 local_66;
  undefined1 local_65;
  undefined1 local_64 [4];
  undefined1 local_60 [4];
  undefined1 local_5c [4];
  undefined1 local_58 [4];
  undefined1 local_54;
  undefined1 local_53;
  undefined1 local_52;
  undefined1 local_51;
  undefined1 local_50;
  undefined1 local_4f;
  undefined1 local_4e;
  undefined1 local_4d;
  undefined1 local_4c;
  undefined1 local_4b;
  undefined1 local_4a;
  undefined1 local_49;
  undefined1 local_48;
  undefined1 local_47;
  undefined1 local_46;
  undefined1 local_45;
  undefined1 local_44;
  undefined1 local_43;
  undefined1 local_42;
  undefined1 local_41;
  undefined1 local_40;
  undefined1 local_3f;
  undefined1 local_3e;
  undefined1 local_3d;
  undefined1 local_3c;
  undefined1 local_3b;
  undefined1 local_3a;
  undefined1 local_39;
  undefined1 local_38;
  undefined1 local_37;
  undefined1 local_36;
  undefined1 local_35;
  undefined1 local_34;
  undefined1 local_33;
  undefined1 local_32;
  undefined1 local_31;
  undefined1 local_30;
  undefined1 local_2f;
  undefined1 local_2e;
  undefined1 local_2d;
  undefined1 local_2c;
  undefined1 local_2b;
  undefined1 local_2a;
  undefined1 local_29;
  undefined1 local_28;
  undefined1 local_27;
  undefined1 local_26;
  undefined1 local_25;
  int local_24;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  if (param_4 == (int *)0x0) {
    param_4 = (int *)(param_1 + 0x98);
  }
  iVar2 = FUN_000260f0();
  FUN_0007b158();
  pvVar3 = (void *)*param_4;
  uVar7 = extraout_s3;
  if (pvVar3 != (void *)0x0) {
    FUN_00322f74(pvVar3);
    operator_delete(pvVar3);
    *param_4 = 0;
    uVar7 = extraout_s3_00;
  }
  uVar6 = FixedToFP(CONCAT44(uVar7,*(undefined4 *)(param_1 + 0x90)),0,0,0,0x20);
  fVar5 = (float)uVar6 / DAT_0007b544;
  fVar4 = 0.0;
  if (0.0 < fVar5) {
    fVar4 = fVar5;
  }
  local_2d = 0xff;
  local_2e = 0xff;
  local_2f = 0xda;
  local_30 = 0x2e;
  local_29 = 0xff;
  local_2a = 0xff;
  local_2b = 0x77;
  local_2c = 0x36;
  local_25 = 0xff;
  local_26 = 0x89;
  local_39 = 0xff;
  local_3a = 0xaa;
  local_3b = 0x78;
  local_3c = 0;
  local_35 = 0xff;
  local_36 = 0xaa;
  local_37 = 0x23;
  local_38 = 0;
  local_31 = 0xff;
  local_32 = 0x37;
  local_33 = 0;
  local_34 = 0xaa;
  local_45 = 0xff;
  local_46 = 0xff;
  local_47 = 0xf4;
  local_48 = 0xc4;
  local_41 = 0xff;
  local_42 = 0xff;
  local_43 = 0xd5;
  local_44 = 0xc2;
  local_3d = 0xff;
  local_3e = 0xdc;
  local_51 = 0xff;
  local_52 = 0xd9;
  local_53 = 0xa6;
  local_54 = 0x2e;
  local_4d = 0xff;
  local_4e = 0xf0;
  local_4f = 0x56;
  local_3f = 0xc2;
  local_50 = 0x40;
  local_27 = 0x2e;
  local_28 = 0xff;
  local_40 = 0xff;
  local_49 = 0xff;
  local_4a = 0x6d;
  local_4b = 0x2e;
  local_4c = 0xef;
  FUN_000397bc(local_58,fVar4,&local_30,3);
  FUN_000397bc(local_5c,fVar4,&local_3c,3);
  FUN_000397bc(local_60,fVar4,&local_48,3);
  FUN_000397bc(local_64,fVar4,&local_54,3);
  pvVar3 = operator_new(0x40);
  local_68 = local_58[0];
  local_67 = local_58[1];
  local_66 = local_58[2];
  local_65 = local_58[3];
  uVar7 = 0;
  if (iVar2 != 0) {
    uVar7 = 0x40400000;
  }
  local_6c = local_5c[0];
  local_70 = 0xffffffff;
  local_74 = 0xffffffff;
  local_78 = 0xffffffff;
  local_7c = 0xffffffff;
  local_6b = local_5c[1];
  local_6a = local_5c[2];
  local_69 = local_5c[3];
  FUN_00322a40(pvVar3,*(undefined4 *)(PTR_DAT_004d9048 + 0x648),param_2,0x42480000,&local_68,0,0,
               uVar7,&local_6c,0,&local_70,0,&local_74,0,0,0,0,0,&local_78,&local_7c,0,0);
  *param_4 = (int)pvVar3;
  local_80 = local_60[0];
  local_7f = local_60[1];
  local_7e = local_60[2];
  local_7d = local_60[3];
  FUN_0031a1c0(*(undefined4 *)((int)pvVar3 + 0x20),&local_80,0x3f0ccccd);
  local_84 = local_64[0];
  local_83 = local_64[1];
  local_82 = local_64[2];
  local_81 = local_64[3];
  FUN_0031a1c0(*(undefined4 *)(*param_4 + 0x20),&local_84,0x3f000000);
  local_88 = local_58[0];
  local_87 = local_58[1];
  local_86 = local_58[2];
  local_85 = local_58[3];
  FUN_0031a1c0(*(undefined4 *)(*param_4 + 0x20),&local_88,0);
  if (param_3 == 1) {
    *(undefined4 *)(param_1 + 0xa4) = 0;
  }
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
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

## FUN_00018cb8 — 00018cb8

```c

undefined4 FUN_00018cb8(int param_1)

{
  undefined *puVar1;
  int iVar2;
  
  if ((*(char *)(param_1 + 0x50) == '\0') && (*(char *)(param_1 + 0xa4) == '\0')) {
    FUN_00018d2c(param_1);
    if (DAT_005d4d5c == 2) {
      FUN_00015814(param_1 + 0xa0,0x3f800000);
    }
    puVar1 = PTR_DAT_004d9048;
    iVar2 = FUN_0001d10c(PTR_DAT_004d9048);
    if (iVar2 != 0) {
      FUN_0001d10c(puVar1);
      iVar2 = FUN_00063f5c(PTR_DAT_004d907c);
      if (iVar2 != 1) {
        return 0;
      }
    }
  }
  FUN_00018e60(param_1);
  return 1;
}


```

## FUN_00078094 — 00078094

```c

void FUN_00078094(int param_1,undefined4 param_2,int param_3,int *param_4)

{
  undefined *puVar1;
  int iVar2;
  void *pvVar3;
  float fVar4;
  float fVar5;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  undefined4 uVar7;
  undefined8 uVar6;
  undefined1 local_88;
  undefined1 local_87;
  undefined1 local_86;
  undefined1 local_85;
  undefined1 local_84;
  undefined1 local_83;
  undefined1 local_82;
  undefined1 local_81;
  undefined1 local_80;
  undefined1 local_7f;
  undefined1 local_7e;
  undefined1 local_7d;
  undefined4 local_7c;
  undefined4 local_78;
  undefined4 local_74;
  undefined4 local_70;
  undefined1 local_6c;
  undefined1 local_6b;
  undefined1 local_6a;
  undefined1 local_69;
  undefined1 local_68;
  undefined1 local_67;
  undefined1 local_66;
  undefined1 local_65;
  undefined1 local_64 [4];
  undefined1 local_60 [4];
  undefined1 local_5c [4];
  undefined1 local_58 [4];
  undefined1 local_54;
  undefined1 local_53;
  undefined1 local_52;
  undefined1 local_51;
  undefined1 local_50;
  undefined1 local_4f;
  undefined1 local_4e;
  undefined1 local_4d;
  undefined1 local_4c;
  undefined1 local_4b;
  undefined1 local_4a;
  undefined1 local_49;
  undefined1 local_48;
  undefined1 local_47;
  undefined1 local_46;
  undefined1 local_45;
  undefined1 local_44;
  undefined1 local_43;
  undefined1 local_42;
  undefined1 local_41;
  undefined1 local_40;
  undefined1 local_3f;
  undefined1 local_3e;
  undefined1 local_3d;
  undefined1 local_3c;
  undefined1 local_3b;
  undefined1 local_3a;
  undefined1 local_39;
  undefined1 local_38;
  undefined1 local_37;
  undefined1 local_36;
  undefined1 local_35;
  undefined1 local_34;
  undefined1 local_33;
  undefined1 local_32;
  undefined1 local_31;
  undefined1 local_30;
  undefined1 local_2f;
  undefined1 local_2e;
  undefined1 local_2d;
  undefined1 local_2c;
  undefined1 local_2b;
  undefined1 local_2a;
  undefined1 local_29;
  undefined1 local_28;
  undefined1 local_27;
  undefined1 local_26;
  undefined1 local_25;
  int local_24;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  if (param_4 == (int *)0x0) {
    param_4 = (int *)(param_1 + 0x98);
  }
  iVar2 = FUN_000260f0();
  FUN_00077fa0();
  pvVar3 = (void *)*param_4;
  uVar7 = extraout_s3;
  if (pvVar3 != (void *)0x0) {
    FUN_00322f74(pvVar3);
    operator_delete(pvVar3);
    *param_4 = 0;
    uVar7 = extraout_s3_00;
  }
  uVar6 = FixedToFP(CONCAT44(uVar7,*(undefined4 *)(param_1 + 0x90)),0,0,0,0x20);
  fVar5 = (float)uVar6 / DAT_0007838c;
  fVar4 = 0.0;
  if (0.0 < fVar5) {
    fVar4 = fVar5;
  }
  local_2d = 0xff;
  local_2e = 0xff;
  local_2f = 0xda;
  local_30 = 0x2e;
  local_29 = 0xff;
  local_2a = 0xff;
  local_2b = 0x77;
  local_2c = 0x36;
  local_25 = 0xff;
  local_26 = 0x89;
  local_39 = 0xff;
  local_3a = 0xaa;
  local_3b = 0x78;
  local_3c = 0;
  local_35 = 0xff;
  local_36 = 0xaa;
  local_37 = 0x23;
  local_38 = 0;
  local_31 = 0xff;
  local_32 = 0x37;
  local_33 = 0;
  local_34 = 0xaa;
  local_45 = 0xff;
  local_46 = 0xff;
  local_47 = 0xf4;
  local_48 = 0xc4;
  local_41 = 0xff;
  local_42 = 0xff;
  local_43 = 0xd5;
  local_44 = 0xc2;
  local_3d = 0xff;
  local_3e = 0xdc;
  local_51 = 0xff;
  local_52 = 0xd9;
  local_53 = 0xa6;
  local_54 = 0x2e;
  local_4d = 0xff;
  local_4e = 0xf0;
  local_4f = 0x56;
  local_3f = 0xc2;
  local_50 = 0x40;
  local_27 = 0x2e;
  local_28 = 0xff;
  local_40 = 0xff;
  local_49 = 0xff;
  local_4a = 0x6d;
  local_4b = 0x2e;
  local_4c = 0xef;
  FUN_000397bc(local_58,fVar4,&local_30,3);
  FUN_000397bc(local_5c,fVar4,&local_3c,3);
  FUN_000397bc(local_60,fVar4,&local_48,3);
  FUN_000397bc(local_64,fVar4,&local_54,3);
  pvVar3 = operator_new(0x40);
  local_68 = local_58[0];
  local_67 = local_58[1];
  local_66 = local_58[2];
  local_65 = local_58[3];
  uVar7 = 0;
  if (iVar2 != 0) {
    uVar7 = 0x40400000;
  }
  local_6c = local_5c[0];
  local_70 = 0xffffffff;
  local_74 = 0xffffffff;
  local_78 = 0xffffffff;
  local_7c = 0xffffffff;
  local_6b = local_5c[1];
  local_6a = local_5c[2];
  local_69 = local_5c[3];
  FUN_00322a40(pvVar3,*(undefined4 *)(PTR_DAT_004d9048 + 0x648),param_2,0x42480000,&local_68,0,0,
               uVar7,&local_6c,0,&local_70,0,&local_74,0,0,0,0,0,&local_78,&local_7c,0,0);
  *param_4 = (int)pvVar3;
  local_80 = local_60[0];
  local_7f = local_60[1];
  local_7e = local_60[2];
  local_7d = local_60[3];
  FUN_0031a1c0(*(undefined4 *)((int)pvVar3 + 0x20),&local_80,0x3f0ccccd);
  local_84 = local_64[0];
  local_83 = local_64[1];
  local_82 = local_64[2];
  local_81 = local_64[3];
  FUN_0031a1c0(*(undefined4 *)(*param_4 + 0x20),&local_84,0x3f000000);
  local_88 = local_58[0];
  local_87 = local_58[1];
  local_86 = local_58[2];
  local_85 = local_58[3];
  FUN_0031a1c0(*(undefined4 *)(*param_4 + 0x20),&local_88,0);
  if (param_3 == 1) {
    *(undefined4 *)(param_1 + 0xa4) = 0;
  }
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0005fc1c — 0005fc1c

```c

void FUN_0005fc1c(int param_1)

{
  longlong lVar1;
  float fVar2;
  undefined *puVar3;
  undefined *puVar4;
  int iVar5;
  uint uVar6;
  undefined4 uVar7;
  int iVar8;
  uint uVar9;
  undefined4 uVar10;
  int iVar11;
  undefined8 in_d0;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined8 uVar12;
  undefined8 uVar13;
  undefined8 uVar14;
  undefined **local_48;
  undefined *local_44;
  undefined1 local_28;
  int local_24;
  
  puVar3 = PTR____stack_chk_guard_004d9044;
  uVar7 = (undefined4)((ulonglong)in_d0 >> 0x20);
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  iVar5 = *(int *)(param_1 + 0x68);
  if (*(int *)(iVar5 + 0xa4) == 0) {
    FUN_0030a1d8();
    FUN_0030a7e4();
    local_28 = 1;
    local_48 = (undefined **)0x0;
    uVar7 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a4);
    FUN_0000a298(&local_48);
    local_28 = 0;
    local_48 = &PTR_LAB_0052bf38;
    local_44 = PTR_FUN_004d9058;
    FUN_0002bb34(uVar7,"act-change",0x3f800000,0x3f800000,&local_48,0);
    FUN_0000a298(&local_48);
    *(undefined1 *)(param_1 + 0x8c) = 0;
    iVar5 = *(int *)(param_1 + 0x68);
    uVar7 = extraout_s1;
  }
  if (*(int *)(iVar5 + 0xac) != 0) {
    uVar7 = FUN_0002ede8();
    FUN_000300e0(uVar7,*(undefined4 *)(*(int *)(param_1 + 0x68) + 0xac));
    iVar5 = *(int *)(param_1 + 0x68);
    uVar7 = extraout_s1_00;
  }
  puVar4 = PTR_DAT_004d9050;
  fVar2 = DAT_0005fd78;
  iVar8 = *(int *)(iVar5 + 0x88);
  iVar11 = *(int *)(iVar5 + 0x8c);
  if (iVar8 != iVar11) {
    lVar1 = (ulonglong)*(uint *)PTR_DAT_004d9050 * (ulonglong)*(uint *)(PTR_DAT_004d9050 + 8);
    uVar9 = (uint)lVar1;
    uVar6 = *(int *)(PTR_DAT_004d9050 + 4) * *(uint *)(PTR_DAT_004d9050 + 8) +
            *(uint *)PTR_DAT_004d9050 * *(int *)(PTR_DAT_004d9050 + 0xc) +
            (int)((ulonglong)lVar1 >> 0x20) +
            *(int *)(PTR_DAT_004d9050 + 0x14) +
            (uint)CARRY4(uVar9,*(uint *)(PTR_DAT_004d9050 + 0x10));
    uVar10 = (undefined4)((ulonglong)uVar6 * 0x7ffff >> 0x20);
    *(uint *)PTR_DAT_004d9050 = uVar9 + *(uint *)(PTR_DAT_004d9050 + 0x10);
    *(uint *)(puVar4 + 4) = uVar6;
    iVar11 = iVar11 - iVar8;
    uVar12 = FixedToFP(CONCAT44(uVar10,uVar10),0,1,0,0x20);
    uVar14 = FixedToFP(CONCAT44(iVar11,iVar11),0,0,0,0x20);
    uVar13 = FixedToFP(CONCAT44(iVar8,iVar8),0,0,0,0x20);
    uVar12 = FloatVectorMult(uVar14,CONCAT44(uVar7,(float)uVar12 / fVar2),2,0x20);
    uVar12 = FloatVectorAdd(uVar13,uVar12,2);
    uVar12 = FPToFixed(uVar12,0,0,3,0x20);
    iVar8 = (int)uVar12;
  }
  *(int *)(iVar5 + 0x7c) = iVar8;
  *(undefined4 *)(iVar5 + 0x80) = 0;
  *(undefined4 *)(iVar5 + 0x84) = 0;
  FUN_0006ee88();
  if (*(int *)puVar3 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_0000701c — 0000701c

```c

void FUN_0000701c(int param_1,undefined4 param_2,undefined4 param_3,undefined4 *param_4)

{
  longlong lVar1;
  undefined *puVar2;
  undefined *puVar3;
  undefined4 uVar4;
  int iVar5;
  int iVar6;
  uint uVar7;
  uint uVar8;
  int iVar9;
  int iVar10;
  void *pvVar11;
  undefined4 uVar12;
  undefined8 in_d0;
  undefined4 extraout_s1;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  undefined4 extraout_s1_02;
  undefined8 uVar13;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  undefined4 extraout_s3_01;
  undefined4 uVar14;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  undefined4 extraout_s5_01;
  undefined4 uVar15;
  undefined4 extraout_s7;
  undefined4 extraout_s7_00;
  undefined4 extraout_s7_01;
  undefined8 uVar16;
  undefined8 uVar17;
  undefined8 uVar18;
  undefined8 uVar19;
  undefined8 uVar20;
  undefined4 local_2c;
  
  uVar4 = (undefined4)((ulonglong)in_d0 >> 0x20);
  pvVar11 = *(void **)(param_1 + 0x38);
  if (pvVar11 == (void *)0x0) {
    pvVar11 = operator_new(0x20);
    FUN_002ed28c();
    *(void **)(param_1 + 0x38) = pvVar11;
    uVar4 = extraout_s1;
  }
  *(undefined1 *)(param_1 + 0x7c) = 0;
  *(undefined1 *)(param_1 + 0xd4) = 0;
  uVar13 = 0x3f8000003f800000;
  *(undefined4 *)(param_1 + 0xb4) = DAT_0052bfe0;
  *(undefined4 *)(param_1 + 0xb8) = DAT_0052bfe4;
  *(undefined4 *)(param_1 + 0xbc) = DAT_0052bfe8;
  *(undefined1 *)(param_1 + 0x7d) = 1;
  *(undefined1 *)(param_1 + 0xc4) = 0;
  if (param_4 != (undefined4 *)0x0) {
    uVar13 = CONCAT44(0x3f800000,*param_4);
  }
  uVar12 = *(undefined4 *)(param_1 + 0x14);
  *(undefined4 *)((int)pvVar11 + 4) = *(undefined4 *)(param_1 + 0x10);
  puVar2 = PTR_DAT_004d9048;
  *(undefined4 *)((int)pvVar11 + 8) = uVar12;
  *(undefined4 *)((int)pvVar11 + 0xc) = 0;
  uVar16 = FloatVectorMult(CONCAT44(uVar4,*(undefined4 *)(puVar2 + 0x98)),0x3f0000003f000000,2,0x20)
  ;
  uVar16 = FloatVectorMult(uVar13,uVar16,2,0x20);
  uVar4 = (undefined4)uVar16;
  *(undefined4 *)((int)pvVar11 + 0x14) = uVar4;
  if (DAT_00556a88 == 0) {
    uVar4 = FUN_0036aa24();
    FUN_0036ab34(&local_2c,uVar4,"textures/effects/bomb_explode.tex");
    FUN_00026e98(&DAT_00556a88,local_2c);
    uVar4 = FUN_00026ed0(&local_2c);
  }
  *(undefined4 *)(param_1 + 100) = 0;
  *(uint *)(param_1 + 0xc) = *(uint *)(param_1 + 0xc) & 0xffffffed | 2;
  *(undefined1 *)(param_1 + 0x8c) = 0;
  *(undefined1 *)(param_1 + 0x90) = 1;
  *(undefined1 *)(param_1 + 0x7e) = 0;
  *(undefined4 *)(param_1 + 200) = 0x3f800000;
  *(undefined4 *)(param_1 + 0xcc) = 0;
  *(undefined4 *)(param_1 + 0xd0) = 0;
  iVar5 = FUN_0001d10c(uVar4,puVar2);
  if (iVar5 != 0) {
    FUN_0001d10c(puVar2);
    puVar3 = PTR_DAT_004d907c;
    iVar5 = FUN_00064000(PTR_DAT_004d907c,3);
    if (iVar5 == 0) {
      FUN_0001d10c(puVar2);
      iVar5 = FUN_00063fe0(puVar3,*(undefined4 *)PTR_DAT_004d9068);
      if (iVar5 != 1) goto LAB_0000716a;
    }
    *(undefined1 *)(param_1 + 0x90) = 0;
  }
LAB_0000716a:
  iVar5 = 0;
  *(undefined4 *)(param_1 + 0x3c) = 0x3f19999a;
  do {
    iVar6 = FUN_00052f80();
    lVar1 = (ulonglong)*(uint *)(iVar6 + 8) * (ulonglong)*(uint *)(iVar6 + 0x10);
    uVar8 = (uint)lVar1;
    uVar7 = *(int *)(iVar6 + 0xc) * *(uint *)(iVar6 + 0x10) +
            *(uint *)(iVar6 + 8) * *(int *)(iVar6 + 0x14) + (int)((ulonglong)lVar1 >> 0x20) +
            *(int *)(iVar6 + 0x1c) + (uint)CARRY4(uVar8,*(uint *)(iVar6 + 0x18));
    *(uint *)(iVar6 + 8) = uVar8 + *(uint *)(iVar6 + 0x18);
    *(uint *)(iVar6 + 0xc) = uVar7;
    iVar9 = param_1 + iVar5 * 2;
    *(short *)(iVar9 + 0x84) = (short)((ulonglong)uVar7 * 7 >> 0x20) + 1;
    iVar6 = FUN_00052f80();
    iVar5 = iVar5 + 1;
    lVar1 = (ulonglong)*(uint *)(iVar6 + 8) * (ulonglong)*(uint *)(iVar6 + 0x10);
    uVar8 = (uint)lVar1;
    uVar7 = *(int *)(iVar6 + 0xc) * *(uint *)(iVar6 + 0x10) +
            *(uint *)(iVar6 + 8) * *(int *)(iVar6 + 0x14) + (int)((ulonglong)lVar1 >> 0x20) +
            *(int *)(iVar6 + 0x1c) + (uint)CARRY4(uVar8,*(uint *)(iVar6 + 0x18));
    *(uint *)(iVar6 + 8) = uVar8 + *(uint *)(iVar6 + 0x18);
    *(uint *)(iVar6 + 0xc) = uVar7;
    *(short *)(iVar9 + 0x88) = (short)((ulonglong)uVar7 * 0x167 >> 0x20);
  } while (iVar5 != 2);
  iVar5 = FUN_0001d10c(puVar2);
  uVar4 = extraout_s7;
  uVar12 = extraout_s1_00;
  uVar15 = extraout_s5;
  uVar14 = extraout_s3;
  if (iVar5 != 0) {
    FUN_0001d10c(puVar2);
    iVar5 = FUN_00063fe0(PTR_DAT_004d907c,*(undefined4 *)PTR_DAT_004d9078);
    uVar4 = extraout_s7_00;
    uVar12 = extraout_s1_01;
    uVar15 = extraout_s5_00;
    uVar14 = extraout_s3_00;
    if (iVar5 == 1) {
      iVar5 = 0;
      do {
        iVar6 = FUN_00052f80();
        lVar1 = (ulonglong)*(uint *)(iVar6 + 8) * (ulonglong)*(uint *)(iVar6 + 0x10);
        uVar7 = (uint)lVar1;
        iVar10 = param_1 + iVar5 * 2;
        iVar9 = *(int *)(iVar6 + 0xc) * *(uint *)(iVar6 + 0x10) +
                *(uint *)(iVar6 + 8) * *(int *)(iVar6 + 0x14) + (int)((ulonglong)lVar1 >> 0x20) +
                *(int *)(iVar6 + 0x1c) + (uint)CARRY4(uVar7,*(uint *)(iVar6 + 0x18));
        *(uint *)(iVar6 + 8) = uVar7 + *(uint *)(iVar6 + 0x18);
        *(int *)(iVar6 + 0xc) = iVar9;
        *(short *)(iVar10 + 0x84) = 1 - (short)(iVar9 >> 0x1f);
        iVar6 = FUN_00052f80();
        iVar5 = iVar5 + 1;
        lVar1 = (ulonglong)*(uint *)(iVar6 + 8) * (ulonglong)*(uint *)(iVar6 + 0x10);
        uVar8 = (uint)lVar1;
        uVar7 = *(int *)(iVar6 + 0xc) * *(uint *)(iVar6 + 0x10) +
                *(uint *)(iVar6 + 8) * *(int *)(iVar6 + 0x14) + (int)((ulonglong)lVar1 >> 0x20) +
                *(int *)(iVar6 + 0x1c) + (uint)CARRY4(uVar8,*(uint *)(iVar6 + 0x18));
        *(uint *)(iVar6 + 8) = uVar8 + *(uint *)(iVar6 + 0x18);
        *(uint *)(iVar6 + 0xc) = uVar7;
        *(short *)(iVar10 + 0x88) = (short)((ulonglong)uVar7 * 0x77 >> 0x20);
        uVar4 = extraout_s7_01;
        uVar12 = extraout_s1_02;
        uVar15 = extraout_s5_01;
        uVar14 = extraout_s3_01;
      } while (iVar5 != 2);
    }
  }
  *(undefined1 *)(param_1 + 0x98) = 0;
  *(undefined4 *)(param_1 + 0x78) = 0;
  *(undefined4 *)(param_1 + 0x94) = 0;
  uVar18 = CONCAT44(uVar15,*(undefined4 *)(puVar2 + 0x94));
  uVar17 = FloatVectorMult(CONCAT44(uVar12,DAT_0052bf80),uVar18,2,0x20);
  uVar19 = FloatVectorMult(uVar18,CONCAT44(uVar14,DAT_0052bf84),2,0x20);
  uVar16 = CONCAT44(uVar12,DAT_00007340);
  uVar20 = FloatVectorMult(uVar18,CONCAT44(uVar4,DAT_0052bf88),2,0x20);
  uVar18 = FloatVectorMult(uVar17,uVar16,2,0x20);
  uVar17 = FloatVectorMult(uVar19,uVar16,2,0x20);
  uVar19 = FloatVectorMult(uVar20,uVar16,2,0x20);
  uVar16 = FloatVectorMult(uVar13,uVar18,2,0x20);
  uVar18 = FloatVectorMult(uVar13,uVar17,2,0x20);
  uVar13 = FloatVectorMult(uVar13,uVar19,2,0x20);
  *(int *)(param_1 + 0x28) = (int)uVar16;
  *(int *)(param_1 + 0x2c) = (int)uVar18;
  uVar4 = (undefined4)uVar13;
  *(undefined4 *)(param_1 + 0x30) = uVar4;
  *(undefined4 *)(param_1 + 0xc0) = 0;
  *(int *)(param_1 + 0xa8) = (int)uVar16;
  *(int *)(param_1 + 0xac) = (int)uVar18;
  *(undefined4 *)(param_1 + 0xb0) = uVar4;
  *(undefined4 *)(param_1 + 0x9c) = 0;
  *(undefined4 *)(param_1 + 0xa0) = 0xc1400000;
  *(undefined4 *)(param_1 + 0xa4) = 0;
  uVar4 = FUN_000219f4(uVar4);
  *(undefined4 *)(param_1 + 0x80) = uVar4;
  return;
}


```

## FUN_0004f158 — 0004f158

```c

void FUN_0004f158(int param_1,undefined4 param_2,int param_3,int *param_4)

{
  undefined *puVar1;
  int iVar2;
  void *pvVar3;
  float fVar4;
  float fVar5;
  undefined4 extraout_s3;
  undefined4 extraout_s3_00;
  undefined4 uVar7;
  undefined8 uVar6;
  undefined1 local_88;
  undefined1 local_87;
  undefined1 local_86;
  undefined1 local_85;
  undefined1 local_84;
  undefined1 local_83;
  undefined1 local_82;
  undefined1 local_81;
  undefined1 local_80;
  undefined1 local_7f;
  undefined1 local_7e;
  undefined1 local_7d;
  undefined4 local_7c;
  undefined4 local_78;
  undefined4 local_74;
  undefined4 local_70;
  undefined1 local_6c;
  undefined1 local_6b;
  undefined1 local_6a;
  undefined1 local_69;
  undefined1 local_68;
  undefined1 local_67;
  undefined1 local_66;
  undefined1 local_65;
  undefined1 local_64 [4];
  undefined1 local_60 [4];
  undefined1 local_5c [4];
  undefined1 local_58 [4];
  undefined1 local_54;
  undefined1 local_53;
  undefined1 local_52;
  undefined1 local_51;
  undefined1 local_50;
  undefined1 local_4f;
  undefined1 local_4e;
  undefined1 local_4d;
  undefined1 local_4c;
  undefined1 local_4b;
  undefined1 local_4a;
  undefined1 local_49;
  undefined1 local_48;
  undefined1 local_47;
  undefined1 local_46;
  undefined1 local_45;
  undefined1 local_44;
  undefined1 local_43;
  undefined1 local_42;
  undefined1 local_41;
  undefined1 local_40;
  undefined1 local_3f;
  undefined1 local_3e;
  undefined1 local_3d;
  undefined1 local_3c;
  undefined1 local_3b;
  undefined1 local_3a;
  undefined1 local_39;
  undefined1 local_38;
  undefined1 local_37;
  undefined1 local_36;
  undefined1 local_35;
  undefined1 local_34;
  undefined1 local_33;
  undefined1 local_32;
  undefined1 local_31;
  undefined1 local_30;
  undefined1 local_2f;
  undefined1 local_2e;
  undefined1 local_2d;
  undefined1 local_2c;
  undefined1 local_2b;
  undefined1 local_2a;
  undefined1 local_29;
  undefined1 local_28;
  undefined1 local_27;
  undefined1 local_26;
  undefined1 local_25;
  int local_24;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  if (param_4 == (int *)0x0) {
    param_4 = (int *)(param_1 + 0x98);
  }
  iVar2 = FUN_000260f0();
  FUN_0007b158();
  pvVar3 = (void *)*param_4;
  uVar7 = extraout_s3;
  if (pvVar3 != (void *)0x0) {
    FUN_00322f74(pvVar3);
    operator_delete(pvVar3);
    *param_4 = 0;
    uVar7 = extraout_s3_00;
  }
  uVar6 = FixedToFP(CONCAT44(uVar7,*(undefined4 *)(param_1 + 0x90)),0,0,0,0x20);
  fVar5 = (float)uVar6 / DAT_0004f450;
  fVar4 = 0.0;
  if (0.0 < fVar5) {
    fVar4 = fVar5;
  }
  local_2d = 0xff;
  local_2e = 0xff;
  local_2f = 0xda;
  local_30 = 0x2e;
  local_29 = 0xff;
  local_2a = 0xff;
  local_2b = 0x77;
  local_2c = 0x36;
  local_25 = 0xff;
  local_26 = 0x89;
  local_39 = 0xff;
  local_3a = 0xaa;
  local_3b = 0x78;
  local_3c = 0;
  local_35 = 0xff;
  local_36 = 0xaa;
  local_37 = 0x23;
  local_38 = 0;
  local_31 = 0xff;
  local_32 = 0x37;
  local_33 = 0;
  local_34 = 0xaa;
  local_45 = 0xff;
  local_46 = 0xff;
  local_47 = 0xf4;
  local_48 = 0xc4;
  local_41 = 0xff;
  local_42 = 0xff;
  local_43 = 0xd5;
  local_44 = 0xc2;
  local_3d = 0xff;
  local_3e = 0xdc;
  local_51 = 0xff;
  local_52 = 0xd9;
  local_53 = 0xa6;
  local_54 = 0x2e;
  local_4d = 0xff;
  local_4e = 0xf0;
  local_4f = 0x56;
  local_3f = 0xc2;
  local_50 = 0x40;
  local_27 = 0x2e;
  local_28 = 0xff;
  local_40 = 0xff;
  local_49 = 0xff;
  local_4a = 0x6d;
  local_4b = 0x2e;
  local_4c = 0xef;
  FUN_000397bc(local_58,fVar4,&local_30,3);
  FUN_000397bc(local_5c,fVar4,&local_3c,3);
  FUN_000397bc(local_60,fVar4,&local_48,3);
  FUN_000397bc(local_64,fVar4,&local_54,3);
  pvVar3 = operator_new(0x40);
  local_68 = local_58[0];
  local_67 = local_58[1];
  local_66 = local_58[2];
  local_65 = local_58[3];
  uVar7 = 0;
  if (iVar2 != 0) {
    uVar7 = 0x40400000;
  }
  local_6c = local_5c[0];
  local_70 = 0xffffffff;
  local_74 = 0xffffffff;
  local_78 = 0xffffffff;
  local_7c = 0xffffffff;
  local_6b = local_5c[1];
  local_6a = local_5c[2];
  local_69 = local_5c[3];
  FUN_00322a40(pvVar3,*(undefined4 *)(PTR_DAT_004d9048 + 0x648),param_2,0x42480000,&local_68,0,0,
               uVar7,&local_6c,0,&local_70,0,&local_74,0,0,0,0,0,&local_78,&local_7c,0,0);
  *param_4 = (int)pvVar3;
  local_80 = local_60[0];
  local_7f = local_60[1];
  local_7e = local_60[2];
  local_7d = local_60[3];
  FUN_0031a1c0(*(undefined4 *)((int)pvVar3 + 0x20),&local_80,0x3f0ccccd);
  local_84 = local_64[0];
  local_83 = local_64[1];
  local_82 = local_64[2];
  local_81 = local_64[3];
  FUN_0031a1c0(*(undefined4 *)(*param_4 + 0x20),&local_84,0x3f000000);
  local_88 = local_58[0];
  local_87 = local_58[1];
  local_86 = local_58[2];
  local_85 = local_58[3];
  FUN_0031a1c0(*(undefined4 *)(*param_4 + 0x20),&local_88,0);
  if (param_3 == 1) {
    *(undefined4 *)(param_1 + 0xa4) = 0;
  }
  if (*(int *)puVar1 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
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

## FUN_0005fd7c — 0005fd7c

```c

void FUN_0005fd7c(int *param_1,undefined4 param_2)

{
  undefined *puVar1;
  int iVar2;
  undefined4 uVar3;
  int iVar4;
  char *pcVar5;
  undefined8 uVar6;
  undefined4 extraout_s5;
  undefined1 auStack_44 [40];
  int local_1c;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_1c = *(int *)PTR____stack_chk_guard_004d9044;
  FUN_00074418(param_1);
  if (((char)param_1[0x23] == '\0') &&
     (iVar2 = FUN_0002bec8(*(undefined4 *)(PTR_DAT_004d9048 + 0x1a4),"act-change"), iVar2 == 0)) {
    iVar2 = *(int *)(param_1[0x1a] + 0xa4);
    if (iVar2 == 2) {
      uVar3 = FUN_0007505c();
      pcVar5 = "Music-act3";
LAB_0005fe08:
      FUN_00075184(uVar3,pcVar5);
    }
    else {
      if (iVar2 == 1) {
        uVar3 = FUN_0007505c();
        pcVar5 = "Music-act2";
        goto LAB_0005fe08;
      }
      if (iVar2 == 0) {
        uVar3 = FUN_0007505c();
        pcVar5 = "Music-act1";
        goto LAB_0005fe08;
      }
    }
    *(undefined1 *)(param_1 + 0x23) = 1;
  }
  FUN_000686e8(param_1[0x24],param_1);
  switch(param_1[0x10]) {
  case 1:
    iVar2 = param_1[0x25];
    if (iVar2 != 0) {
      FUN_0030f7cc(auStack_44,"play");
      iVar2 = FUN_0039834c(iVar2,auStack_44,1);
      FUN_0030f7e0(auStack_44);
      if (iVar2 != 0) goto switchD_0005fe24_caseD_0;
    }
    param_1[0x25] = 0;
    FUN_0005ffa8(param_1);
  case 0:
switchD_0005fe24_caseD_0:
    *(undefined1 *)(param_1 + 0x6a) = 0;
    break;
  case 2:
    uVar6 = FloatVectorSub(CONCAT44(extraout_s5,param_1[0x11]),CONCAT44(param_2,param_2),2,0x20);
    param_1[0x11] = (int)uVar6;
    FUN_0005ec34(param_2,&DAT_005f94b4,param_2);
    FUN_00066410(param_1 + 2,param_2);
    FUN_00063e68(&DAT_005f94e4,param_2);
    FUN_0005ecf4(&DAT_005f94b4,param_1[0x1d]);
    if ((char)param_1[0x1f] == '\0') {
LAB_0005fef8:
      iVar2 = (**(code **)(*param_1 + 0x34))(param_1);
      if (((iVar2 == 1) && ((float)param_1[0x11] <= 0.0)) ||
         (iVar2 = FUN_0005edbc(&DAT_005f94b4), iVar2 != 0)) goto LAB_0005ff22;
    }
    else {
      iVar4 = param_1[0x1a];
      iVar2 = 0;
      if (iVar4 != 0) {
        iVar2 = *(int *)(iVar4 + 0x98);
      }
      if ((iVar4 != 0 && iVar2 != 0) ||
         (iVar2 = FUN_00052f80(), *(uint *)(iVar2 + 0x208) < *(uint *)(param_1[0x19] + 0xfc)))
      goto LAB_0005fef8;
      uVar3 = FUN_000065c4();
      iVar2 = FUN_00006a84(uVar3,1);
      if (iVar2 != 0) goto LAB_0005fef8;
LAB_0005ff22:
      FUN_00060108(param_1);
      *(undefined1 *)(param_1 + 0x1f) = 0;
    }
    iVar4 = param_1[0x1a];
    iVar2 = 0;
    if (iVar4 != 0) {
      iVar2 = *(int *)(iVar4 + 0x98);
    }
    if ((iVar4 != 0 && iVar2 != 0) && ((char)param_1[0x6a] == '\0')) {
      uVar3 = FUN_0030a1d8();
      FUN_0030a780(uVar3,"Music/Music-bonus-lp");
      *(undefined1 *)(param_1 + 0x6a) = 1;
    }
    break;
  case 3:
    if (*(int *)(param_1[0x24] + 0xac) == 7) {
      iVar2 = *(int *)(param_1[0x24] + 0xb0);
      if (iVar2 == 0) {
        FUN_00060514(param_1);
      }
      else {
        if (iVar2 == 5) {
          FUN_0006059c(param_1);
        }
        else if (iVar2 == 2) {
          FUN_0005ffa8(param_1);
          break;
        }
        param_1[0x10] = 5;
      }
    }
  }
  if (*(int *)puVar1 == local_1c) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
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

## FUN_00077a90 — 00077a90

```c

void FUN_00077a90(int param_1,float param_2)

{
  undefined *puVar1;
  undefined *puVar2;
  int iVar3;
  undefined4 *puVar4;
  undefined4 uVar5;
  undefined8 in_d0;
  undefined4 extraout_s1;
  undefined8 uVar6;
  undefined4 extraout_s1_00;
  undefined4 extraout_s1_01;
  longlong lVar7;
  uint extraout_s1_02;
  undefined8 in_d1;
  undefined4 uVar8;
  undefined4 extraout_s3;
  undefined4 in_s5;
  undefined4 extraout_s5;
  undefined4 extraout_s5_00;
  undefined4 extraout_s5_01;
  undefined4 extraout_s5_02;
  undefined8 uVar9;
  undefined8 uVar10;
  undefined **local_4c;
  undefined *local_48;
  undefined1 local_2c;
  int local_28;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  uVar8 = (undefined4)((ulonglong)in_d1 >> 0x20);
  uVar5 = (undefined4)((ulonglong)in_d0 >> 0x20);
  local_28 = *(int *)PTR____stack_chk_guard_004d9044;
  if (*(int *)(param_1 + 0xe0) != 0) {
    puVar4 = &DAT_00077cb0;
    if (PTR_DAT_004d9048[10] != '\0') {
      puVar4 = &DAT_00077cb4;
    }
    FUN_00309b38(*(int *)(param_1 + 0xe0),*puVar4);
    in_s5 = extraout_s5;
    uVar5 = extraout_s1;
    uVar8 = extraout_s3;
  }
  puVar2 = PTR_DAT_004d9048;
  if (PTR_DAT_004d9048[10] == '\0') {
    uVar9 = CONCAT44(param_2,param_2);
    uVar6 = FloatVectorAdd(CONCAT44(uVar5,*(undefined4 *)(param_1 + 0x88)),uVar9,2);
    *(int *)(param_1 + 0x88) = (int)uVar6;
    uVar6 = CONCAT44((int)((ulonglong)uVar6 >> 0x20),*(float *)(param_1 + 0x84));
    if (0.0 < *(float *)(param_1 + 0x84)) {
      uVar10 = FloatVectorMult(uVar9,CONCAT44(uVar8,DAT_00077cb8),2,0x20);
      uVar6 = FloatVectorAdd(uVar6,uVar10,2);
      *(float *)(param_1 + 0x84) = (float)uVar6;
      if ((float)uVar6 <= 0.0) {
        *(undefined4 *)(param_1 + 0x84) = 0;
      }
    }
    uVar5 = (undefined4)((ulonglong)uVar6 >> 0x20);
    iVar3 = *(int *)(param_1 + 0x7c);
    if ((iVar3 != 0) && (0.0 < *(float *)(iVar3 + 0x104))) {
      *(undefined4 *)(iVar3 + 0x104) = 0x3f800000;
    }
    iVar3 = *(int *)(param_1 + 0x10c);
    if (iVar3 == 2) {
      if (1.5 < *(float *)(param_1 + 0x88)) {
        FUN_00078e78();
        in_s5 = extraout_s5_00;
        uVar5 = extraout_s1_00;
      }
    }
    else if (iVar3 == 1) {
      if (DAT_00077cbc < *(float *)(param_1 + 0x88)) {
        *(undefined4 *)(param_1 + 0x10c) = 2;
        *(undefined4 *)(param_1 + 0x88) = 0;
        *(undefined4 *)(param_1 + 0x8c) = 0;
      }
    }
    else if (iVar3 == 0) {
      FUN_00077cc8(param_1);
      in_s5 = extraout_s5_01;
      uVar5 = extraout_s1_01;
    }
    lVar7 = FloatVectorAdd(CONCAT44(uVar5,*(undefined4 *)(param_1 + 0xa0)),
                           CONCAT44(in_s5,DAT_00077cc0),2);
    if (((float)lVar7 <= *(float *)(param_1 + 0x88)) &&
       ((int)((uint)(*(float *)(param_1 + 0x8c) < (float)lVar7) << 0x1f) < 0)) {
      uVar5 = *(undefined4 *)(puVar2 + 0x1a4);
      local_2c = 1;
      local_4c = (undefined **)0x0;
      FUN_0000a298(&local_4c);
      local_2c = 0;
      local_4c = &PTR_LAB_0052bf38;
      local_48 = PTR_FUN_004d9058;
      FUN_0002bc94(uVar5,"pome-zoomout",0x3e000000,0x3f800000,&local_4c,0);
      FUN_0000a298(&local_4c);
      lVar7 = (ulonglong)extraout_s1_02 << 0x20;
      in_s5 = extraout_s5_02;
    }
    uVar6 = CONCAT44((int)((ulonglong)lVar7 >> 0x20),*(float *)(param_1 + 0xa4));
    if ((int)((uint)(*(float *)(param_1 + 0xa4) < 1.0) << 0x1f) < 0) {
      uVar9 = FloatVectorMult(uVar9,0x4040000040400000,2,0x20);
      uVar6 = FloatVectorAdd(uVar9,uVar6,2);
      *(float *)(param_1 + 0xa4) = (float)uVar6;
      if (1.0 <= (float)uVar6) {
        *(undefined4 *)(param_1 + 0xa4) = 0x3f800000;
      }
    }
    if ((int)((uint)(*(float *)(param_1 + 0xd8) < 1.0) << 0x1f) < 0) {
      uVar6 = FloatVectorAdd(CONCAT44((int)((ulonglong)uVar6 >> 0x20),*(float *)(param_1 + 0xd8)),
                             CONCAT44(in_s5,param_2 / DAT_00077cc4),2);
      *(float *)(param_1 + 0xd8) = (float)uVar6;
      if (1.0 < (float)uVar6) {
        *(undefined4 *)(param_1 + 0xd8) = 0x3f800000;
      }
    }
    *(undefined4 *)(param_1 + 0x8c) = *(undefined4 *)(param_1 + 0x88);
  }
  if (*(int *)puVar1 == local_28) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

命中函数数: 18
