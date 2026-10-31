# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_00057af0 — 00057af0

- 函数名: FUN_00057af0
- 函数体: 147 字节
- 调用者数: 1 / 被调用者数: 0

```c

undefined8 FUN_00057af0(int param_1,undefined4 param_2)

{
  uint *puVar1;
  longlong lVar2;
  ulonglong uVar3;
  uint *puVar4;
  int iVar5;
  uint uVar6;
  uint uVar7;
  uint uVar8;
  uint *puVar9;
  uint *puVar10;
  uint *puVar11;
  undefined8 in_d0;
  undefined8 in_d1;
  undefined4 in_s5;
  undefined4 in_s7;
  undefined8 uVar13;
  undefined8 uVar14;
  undefined8 uVar15;
  uint *puVar12;
  
  puVar4 = DAT_005a7930;
  uVar14 = FloatVectorMult(CONCAT44(in_s5,*(undefined4 *)(param_1 + 0x60)),CONCAT44(param_2,param_2)
                           ,2,0x20);
  uVar13 = FloatVectorMult(CONCAT44(in_s7,*(undefined4 *)(param_1 + 0x68)),CONCAT44(param_2,param_2)
                           ,2,0x20);
  uVar15 = FloatVectorAdd(CONCAT44((int)((ulonglong)in_d1 >> 0x20),*(undefined4 *)(param_1 + 0x5c)),
                          uVar14,2);
  uVar14 = FloatVectorAdd(CONCAT44((int)((ulonglong)in_d0 >> 0x20),*(undefined4 *)(param_1 + 100)),
                          uVar13,2);
  uVar13 = FPToFixed(uVar15,0,0,3,0x20);
  uVar14 = FPToFixed(uVar14,0,0,3,0x20);
  iVar5 = (int)uVar13;
  uVar6 = (uint)uVar14;
  if (iVar5 < 0) {
    iVar5 = 0;
  }
  if ((int)uVar6 < 0) {
    uVar6 = 0;
  }
  uVar3 = (ulonglong)uVar6;
  if (0 < (int)(uVar6 - iVar5)) {
    puVar9 = DAT_005a7930 + 2;
    uVar7 = *DAT_005a7930;
    puVar10 = DAT_005a7930 + 1;
    puVar11 = DAT_005a7930 + 3;
    puVar12 = DAT_005a7930 + 4;
    puVar1 = DAT_005a7930 + 5;
    lVar2 = (ulonglong)uVar7 * (ulonglong)*puVar9;
    uVar8 = (uint)lVar2;
    *DAT_005a7930 = uVar8 + *puVar12;
    uVar7 = *puVar10 * *puVar9 + uVar7 * *puVar11 + (int)((ulonglong)lVar2 >> 0x20) +
            *puVar1 + (uint)CARRY4(uVar8,*puVar12);
    puVar4[1] = uVar7;
    uVar3 = (ulonglong)uVar7 * (ulonglong)(uVar6 - iVar5);
  }
  return CONCAT44((int)uVar3,iVar5 + (int)(uVar3 >> 0x20));
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

