# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_00016214 — 00016214

- 函数名: FUN_00016214
- 函数体: 3581 字节
- 调用者数: 0 / 被调用者数: 32

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

## FUN_000718b0 — 000718b0

- 函数名: FUN_000718b0
- 函数体: 547 字节
- 调用者数: 0 / 被调用者数: 18

```c

void FUN_000718b0(int param_1,int param_2)

{
  undefined *puVar1;
  undefined *puVar2;
  int iVar3;
  int iVar4;
  size_t sVar5;
  undefined4 uVar6;
  int iVar7;
  undefined **local_c0;
  undefined *local_bc;
  undefined1 local_a0;
  undefined **local_9c;
  undefined *local_98;
  undefined1 local_7c;
  undefined1 auStack_78 [40];
  undefined4 local_50;
  undefined4 local_4c;
  char acStack_44 [6];
  undefined1 auStack_3e [26];
  int local_24;
  
  puVar1 = PTR____stack_chk_guard_004d9044;
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  if ((2 < *(int *)(param_2 + 0x8c)) &&
     (iVar7 = *(int *)(*(int *)(param_1 + 0x54) + 0x18), iVar7 != 0)) {
    FUN_00074428(iVar7);
    if (((DAT_005a86dc & 1) == 0) && (iVar3 = ___cxa_guard_acquire(&DAT_005a86dc), iVar3 != 0)) {
      FUN_0030f7cc(&DAT_005a86e4,"comboValue");
      ___cxa_atexit(PTR_FUN_004d9034,&DAT_005a86e4,PTR___mh_execute_header_004d9040);
      ___cxa_guard_release(&DAT_005a86dc);
    }
    iVar3 = FUN_0039725c(iVar7,&DAT_005a86e4);
    if (iVar3 != 0) {
      local_4c = 0;
      local_50 = 0x2b;
      FUN_002f702c((uint)&local_50 | 1,8,"%i",*(undefined4 *)(param_2 + 0x8c));
      FUN_0030f7cc(auStack_78,&local_50);
      FUN_00022950(*(undefined4 *)(iVar3 + 0x7dc),auStack_78);
      FUN_0030f7e0(auStack_78);
    }
    iVar4 = *(int *)(param_2 + 0x8c) + -3;
    iVar3 = 0;
    if ((0 < iVar4) && (iVar3 = iVar4, 1 < iVar4)) {
      iVar3 = 2;
    }
    FUN_00074254(iVar7,param_2 + 0x104,iVar3);
    puVar2 = PTR_DAT_004d9048;
    local_7c = 1;
    local_9c = (undefined **)0x0;
    uVar6 = *(undefined4 *)(PTR_DAT_004d9048 + 0x1a8);
    FUN_0000a298(&local_9c);
    local_7c = 0;
    local_9c = &PTR_LAB_0052bf38;
    local_98 = PTR_FUN_004d9154;
    FUN_0007250c(uVar6,0x3ecccccd,0x3f800000,&local_9c);
    FUN_0000a298(&local_9c);
    if (*(int *)(param_1 + 0x4c) != 0) {
      FUN_0002bf3c(*(undefined4 *)(puVar2 + 0x1a4));
    }
    _memcpy(acStack_44,"combo-",0x20);
    iVar3 = *(int *)(param_2 + 0x8c) + -2;
    iVar7 = 1;
    if ((1 < iVar3) && (iVar7 = iVar3, 4 < iVar3)) {
      iVar7 = 5;
    }
    FUN_002f702c(auStack_3e,0x20,"%i",iVar7);
    sVar5 = _strlen(acStack_44);
    uVar6 = FUN_002f69c4(acStack_44,sVar5);
    *(undefined4 *)(param_1 + 0x4c) = uVar6;
    local_a0 = 1;
    uVar6 = *(undefined4 *)(puVar2 + 0x1a4);
    local_c0 = (undefined **)0x0;
    FUN_0000a298(&local_c0);
    local_a0 = 0;
    local_c0 = &PTR_LAB_0052bf38;
    local_bc = PTR_FUN_004d9058;
    FUN_0002bc94(uVar6,acStack_44,0x3e800000,0x3f800000);
    FUN_0000a298(&local_c0);
  }
  if (*(int *)puVar1 == local_24) {
    return;
  }
                    /* WARNING: Subroutine does not return */
  ___stack_chk_fail();
}


```

## FUN_0001cb08 — 0001cb08

- 函数名: FUN_0001cb08
- 函数体: 483 字节
- 调用者数: 6 / 被调用者数: 7

```c

void FUN_0001cb08(int param_1,int param_2,int param_3)

{
  undefined4 uVar1;
  int *piVar2;
  undefined4 uVar3;
  int iVar4;
  undefined4 *puVar5;
  
  DAT_005576f0 = DAT_005576f0 + 1;
  for (puVar5 = DAT_005576e8; (undefined4 **)puVar5 != &DAT_005576e8; puVar5 = (undefined4 *)*puVar5
      ) {
    piVar2 = puVar5 + 2;
    if ((puVar5[0xb] == 0) || (((int)puVar5[0xb] < DAT_005576f0 && (puVar5[0xc] == 1)))) {
      if (*(char *)(puVar5 + 10) != '\0') {
        piVar2 = (int *)*piVar2;
      }
      if (piVar2 != (int *)0x0) {
        (**(code **)(*piVar2 + 0xc))(piVar2,param_1,param_2);
      }
    }
  }
  FUN_0001d888(&DAT_005576e8);
  if (DAT_005f8db8 == 4) {
    piVar2 = (int *)&DAT_00557718;
    if ((DAT_00557738 == '\0') || (iVar4 = 0, piVar2 = DAT_00557718, DAT_00557718 != (int *)0x0)) {
      iVar4 = (**(code **)(*piVar2 + 0xc))(piVar2,param_1);
    }
    DAT_005f8dd4 = DAT_005f8dd4 + iVar4;
  }
  else {
    piVar2 = (int *)&DAT_00557718;
    if ((DAT_00557738 == '\0') || (iVar4 = 0, piVar2 = DAT_00557718, DAT_00557718 != (int *)0x0)) {
      iVar4 = (**(code **)(*piVar2 + 0xc))(piVar2,param_1);
    }
    DAT_005f8dd4 = DAT_005f8dd4 + iVar4;
    if ((0x7fffffff < DAT_005f8dd4) && (DAT_005f8db8 != 5)) {
      DAT_005f8dd4 = 0;
    }
  }
  if (((DAT_00557714 & 1) == 0) && (iVar4 = ___cxa_guard_acquire(&DAT_00557714), iVar4 != 0)) {
    DAT_00557710 = FUN_002f69c4("all",3);
    ___cxa_guard_release(&DAT_00557714);
  }
  if (((0 < param_1) && (param_3 == 1)) && (param_2 < 2)) {
    DAT_005f8f3c = FUN_00027588(DAT_005f8e04,"all",DAT_00557710,param_1,1,0);
    uVar1 = DAT_005f8e04;
    if (DAT_005f9378 != '\0') {
      uVar3 = FUN_002f69c4("upside_down_points",0x12);
      FUN_00027588(uVar1,"upside_down_points",uVar3,param_1,0,1);
    }
    iVar4 = FUN_000276e8(DAT_005f8e04,"bean");
    uVar1 = DAT_005f8e04;
    if (iVar4 == 0) {
      uVar3 = FUN_002f69c4("score_without_beans",0x13);
      FUN_00027588(uVar1,"score_without_beans",uVar3,param_1,0,1);
    }
  }
  if ((((undefined4 *)DAT_005f8da8 != (undefined4 *)0x0) &&
      (iVar4 = (**(code **)*(undefined4 *)DAT_005f8da8)(), iVar4 == 0)) &&
     ((undefined4 *)DAT_005f8da8 != (undefined4 *)0x0)) {
    iVar4 = (**(code **)*(undefined4 *)DAT_005f8da8)();
    puVar5 = (undefined4 *)0x0;
    if (iVar4 == 0) {
      puVar5 = (undefined4 *)DAT_005f8da8;
    }
    FUN_00070ba4(puVar5);
  }
  return;
}


```

## FUN_00065ad4 — 00065ad4

- 函数名: FUN_00065ad4
- 函数体: 153 字节
- 调用者数: 1 / 被调用者数: 1

```c

undefined4 FUN_00065ad4(int param_1)

{
  undefined *puVar1;
  int iVar2;
  int iVar3;
  undefined4 uVar4;
  undefined4 extraout_s1;
  ulonglong uVar5;
  float fVar6;
  undefined4 extraout_s3;
  undefined8 uVar7;
  undefined8 uVar8;
  undefined8 uVar9;
  
  puVar1 = PTR_DAT_004d9048;
  iVar2 = FUN_000276e8(*(undefined4 *)(PTR_DAT_004d9048 + 0x5c),"slashes");
  iVar3 = FUN_000276e8(*(undefined4 *)(puVar1 + 0x5c),"slashesScoring");
  uVar7 = FixedToFP(CONCAT44(iVar2 - iVar3,iVar2 - iVar3),0,0,0,0x20);
  uVar4 = FUN_000276e8(*(undefined4 *)(puVar1 + 0x5c),"totalfruit");
  uVar8 = FloatVectorMult(uVar7,CONCAT44(extraout_s1,DAT_00065b70),2,0x20);
  uVar7 = FixedToFP(CONCAT44(uVar4,uVar4),0,0,0,0x20);
  uVar9 = FixedToFP(CONCAT44(extraout_s3,*(undefined4 *)(param_1 + 0x2c)),0,1,0,0x20);
  uVar8 = FloatVectorMult(uVar8,uVar7,2,0x20);
  uVar9 = FloatVectorAdd(uVar7,uVar9,2);
  uVar8 = FloatVectorAdd(uVar9,uVar8,2);
  fVar6 = (float)uVar8 / (float)uVar7;
  uVar5 = 0;
  if (-1 < (int)((uint)(fVar6 < 0.0) << 0x1f)) {
    uVar5 = (ulonglong)DAT_00065b74;
  }
  uVar7 = FloatVectorMult(CONCAT44((int)((ulonglong)uVar8 >> 0x20),fVar6),uVar5,2,0x20);
  return (int)uVar7;
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

## FUN_00020c38 — 00020c38

- 函数名: FUN_00020c38
- 函数体: 339 字节
- 调用者数: 1 / 被调用者数: 9

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

## FUN_00060108 — 00060108

- 函数名: FUN_00060108
- 函数体: 1035 字节
- 调用者数: 1 / 被调用者数: 22

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

