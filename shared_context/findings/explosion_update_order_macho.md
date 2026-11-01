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

## FUN_0001b384 — 0001b384

- 函数名: FUN_0001b384
- 函数体: 651 字节
- 调用者数: 1 / 被调用者数: 7

(反编译超时或失败)

## FUN_00008e54 — 00008e54

- 函数名: FUN_00008e54
- 函数体: 1 字节
- 调用者数: 1 / 被调用者数: 0

```c

void FUN_00008e54(void)

{
  return;
}


```

## FUN_000161c4 — 000161c4

- 函数名: FUN_000161c4
- 函数体: 79 字节
- 调用者数: 1 / 被调用者数: 4

```c

void FUN_000161c4(undefined4 param_1)

{
  undefined4 uVar1;
  int iVar2;
  
  iVar2 = 0;
  do {
    FUN_0001a04c((int)&DAT_00557468 + iVar2,param_1);
    iVar2 = iVar2 + 0x10;
  } while (iVar2 != 0x80);
  if (DAT_005d4d5c == 1) {
    FUN_00015814(0,param_1);
  }
  uVar1 = FUN_0002ede8();
  FUN_000306cc(uVar1,DAT_005573b8);
  DAT_005573b8 = 0;
  return;
}


```

