# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_00060da0 — 00060da0

- 函数名: FUN_00060da0
- 函数体: 177 字节
- 调用者数: 1 / 被调用者数: 0

```c

undefined4 FUN_00060da0(void)

{
  uint uVar1;
  ulonglong uVar2;
  longlong lVar3;
  undefined *puVar4;
  int iVar5;
  undefined4 uVar6;
  uint uVar7;
  uint uVar8;
  uint uVar9;
  int iVar10;
  uint uVar11;
  int iVar12;
  int iVar13;
  uint uVar14;
  
  iVar5 = DAT_005f94a0;
  puVar4 = PTR_DAT_004d9050;
  uVar6 = 0;
  uVar1 = DAT_005f94a4 - DAT_005f94a0 >> 2;
  if (uVar1 != 0) {
    uVar9 = *(uint *)(PTR_DAT_004d9050 + 8);
    iVar13 = *(int *)(PTR_DAT_004d9050 + 0xc);
    uVar14 = *(uint *)(PTR_DAT_004d9050 + 0x10);
    iVar10 = *(int *)(PTR_DAT_004d9050 + 0x14);
    lVar3 = (ulonglong)*(uint *)PTR_DAT_004d9050 * (ulonglong)uVar9;
    uVar11 = (uint)lVar3;
    uVar7 = uVar11 + uVar14;
    uVar8 = *(int *)(PTR_DAT_004d9050 + 4) * uVar9 +
            *(uint *)PTR_DAT_004d9050 * iVar13 + (int)((ulonglong)lVar3 >> 0x20) + iVar10 +
            (uint)CARRY4(uVar11,uVar14);
    *(uint *)PTR_DAT_004d9050 = uVar7;
    *(uint *)(puVar4 + 4) = uVar8;
    uVar11 = uVar8;
    if (uVar1 != 0xffffffff) {
      uVar11 = (uint)((ulonglong)uVar8 * (ulonglong)uVar1 >> 0x20);
    }
    iVar12 = *(int *)(iVar5 + uVar11 * 4);
    if (*(char *)(iVar12 + 0x48) == '\0') {
      do {
        uVar2 = (ulonglong)uVar7;
        uVar11 = (uint)(uVar2 * uVar9);
        iVar12 = uVar7 * iVar13;
        uVar7 = uVar11 + uVar14;
        uVar8 = uVar8 * uVar9 + iVar12 + (int)(uVar2 * uVar9 >> 0x20) + iVar10 +
                (uint)CARRY4(uVar11,uVar14);
        uVar11 = uVar8;
        if ((uVar1 != 0) && (uVar1 != 0xffffffff)) {
          uVar11 = (uint)((ulonglong)uVar8 * (ulonglong)uVar1 >> 0x20);
        }
        iVar12 = *(int *)(iVar5 + uVar11 * 4);
      } while (*(char *)(iVar12 + 0x48) == '\0');
      *(uint *)puVar4 = uVar7;
      *(uint *)(puVar4 + 4) = uVar8;
    }
    uVar6 = *(undefined4 *)(iVar12 + 0x44);
  }
  return uVar6;
}


```

