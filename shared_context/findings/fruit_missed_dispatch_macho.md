# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0000f2f8 — 0000f2f8

- 函数名: FUN_0000f2f8
- 函数体: 635 字节
- 调用者数: 7 / 被调用者数: 12

```c

void FUN_0000f2f8(int param_1,uint param_2)

{
  undefined *puVar1;
  undefined4 uVar2;
  uint uVar3;
  int *piVar4;
  int iVar5;
  undefined4 *puVar6;
  bool bVar7;
  
  iVar5 = 0x10;
  do {
    if (*(int *)(param_1 + iVar5 * 4) != 0) {
      uVar2 = FUN_00033ca0();
      FUN_00036f4c(uVar2,*(undefined4 *)(param_1 + iVar5 * 4));
      *(undefined4 *)(param_1 + iVar5 * 4) = 0;
    }
    iVar5 = iVar5 + 1;
  } while (iVar5 != 0x12);
  if ((((*(char *)(param_1 + 0x1b8) == '\0') && (*(char *)(param_1 + 0x1bc) == '\0')) &&
      (*(char *)(param_1 + 0xc4) == '\0')) &&
     (*(int *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x314) < 5)) {
    if (param_2 == 1) {
      if (((DAT_00556cec & 1) == 0) && (iVar5 = ___cxa_guard_acquire(&DAT_00556cec), iVar5 != 0)) {
        DAT_00556ce8 = FUN_002f69c4("dropped",7);
        ___cxa_guard_release(&DAT_00556cec);
      }
      puVar1 = PTR_DAT_004d9048;
      FUN_00027588(*(undefined4 *)(PTR_DAT_004d9048 + 0x5c),"dropped",DAT_00556ce8,1,0,0);
      iVar5 = (uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc;
      FUN_00027588(*(undefined4 *)(puVar1 + 0x5c),iVar5 + 0x1c0,*(undefined4 *)(iVar5 + 0x268),1,0,0
                  );
    }
    iVar5 = FUN_0001cd2c();
    if (iVar5 == 1) {
      uVar3 = *(uint *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x32c);
      bVar7 = uVar3 == 0;
      if (bVar7) {
        uVar3 = param_2 ^ 1;
      }
      if (((bVar7 && uVar3 == 0) && (iVar5 = FUN_0004eb70(), puVar1 = PTR_DAT_004d9048, iVar5 == 0))
         && ((*(char *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x330) == '\0' &&
             (iVar5 = FUN_0001ccec(PTR_DAT_004d9048), iVar5 != 0)))) {
        uVar2 = FUN_0001ccec(puVar1);
        FUN_000713f4(uVar2,param_1);
      }
    }
  }
  iVar5 = *(int *)(param_1 + 0x1b4);
  if ((iVar5 != 0) && (*(int *)(iVar5 + 0x134) == param_1)) {
    *(undefined4 *)(iVar5 + 0x134) = 0;
  }
  if ((((*(byte *)(param_1 + 0xc) & 0x10) == 0) &&
      (*(int *)((uint)*(byte *)(param_1 + 0x3c) * 0x338 + DAT_005d4cdc + 0x32c) != 0)) &&
     (DAT_005d4ce4 = DAT_005d4ce4 + -1, DAT_005d4ce4 < 1)) {
    DAT_005d4ce4 = 0;
  }
  if (*(short *)(param_1 + 8) != 0) {
    FUN_0000a5f8(0);
  }
  DAT_005d4d00 = DAT_005d4d00 + 1;
  for (puVar6 = DAT_005d4cf8; (undefined4 **)puVar6 != &DAT_005d4cf8; puVar6 = (undefined4 *)*puVar6
      ) {
    piVar4 = puVar6 + 2;
    if ((puVar6[0xb] == 0) || (((int)puVar6[0xb] < DAT_005d4d00 && (puVar6[0xc] == 1)))) {
      if (*(char *)(puVar6 + 10) != '\0') {
        piVar4 = (int *)*piVar4;
      }
      if (piVar4 != (int *)0x0) {
        (**(code **)(*piVar4 + 0xc))(piVar4,param_1);
      }
    }
  }
  FUN_00015068(&DAT_005d4cf8);
  *(int *)(param_1 + 0x1dc) = *(int *)(param_1 + 0x1dc) + 1;
  for (puVar6 = *(undefined4 **)(param_1 + 0x1d4); puVar6 != (undefined4 *)(param_1 + 0x1d4);
      puVar6 = (undefined4 *)*puVar6) {
    piVar4 = puVar6 + 2;
    if ((puVar6[0xb] == 0) || (((int)puVar6[0xb] < *(int *)(param_1 + 0x1dc) && (puVar6[0xc] == 1)))
       ) {
      if (*(char *)(puVar6 + 10) != '\0') {
        piVar4 = (int *)*piVar4;
      }
      if (piVar4 != (int *)0x0) {
        (**(code **)(*piVar4 + 0xc))(piVar4,param_1);
      }
    }
  }
  FUN_00015068((undefined4 *)(param_1 + 0x1d4));
  if (*(int **)(param_1 + 0xb4) != (int *)0x0) {
    (**(code **)(**(int **)(param_1 + 0xb4) + 4))();
    *(undefined4 *)(param_1 + 0xb4) = 0;
  }
  *(uint *)(param_1 + 0xc) = *(uint *)(param_1 + 0xc) | 0x10;
  return;
}


```

## FUN_000708c4 — 000708c4

- 函数名: FUN_000708c4
- 函数体: 253 字节
- 调用者数: 2 / 被调用者数: 9

```c

void FUN_000708c4(int param_1)

{
  int iVar1;
  code *pcVar2;
  undefined4 uVar3;
  int *piVar4;
  undefined4 local_a4;
  undefined1 auStack_a0 [40];
  undefined1 auStack_78 [40];
  undefined1 auStack_50 [40];
  undefined1 local_28 [4];
  int local_24;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  piVar4 = *(int **)(param_1 + 4);
  pcVar2 = *(code **)(*piVar4 + 0x40);
  FUN_0030f7cc(auStack_50,"animate_out");
  (*pcVar2)(piVar4,auStack_50,1);
  FUN_0030f7e0(auStack_50);
  uVar3 = *(undefined4 *)(param_1 + 4);
  FUN_0030f7cc(auStack_78,"gameOverContainer");
  piVar4 = (int *)FUN_0039725c(uVar3,auStack_78);
  FUN_0030f7e0(auStack_78);
  if (piVar4 == (int *)0x0) {
    FUN_000209b8(0xffffffff,0xbf800000,0xffffffff);
  }
  else {
    local_28[0] = 1;
    FUN_0001da28(piVar4[0x98],local_28);
    pcVar2 = *(code **)(*piVar4 + 0x40);
    FUN_0030f7cc(auStack_a0,"game_over");
    (*pcVar2)(piVar4,auStack_a0,1);
    FUN_0030f7e0(auStack_a0);
    *(undefined4 *)(param_1 + 0x44) = 2;
    local_a4 = 0;
    uVar3 = FUN_000065c4();
    iVar1 = FUN_00006ad0(uVar3,2,&local_a4);
    while (iVar1 != 0) {
      *(undefined1 *)(iVar1 + 0x7d) = 0;
      uVar3 = FUN_000065c4();
      iVar1 = FUN_00006af0(uVar3,2,&local_a4);
    }
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail();
  }
  return;
}


```

## FUN_000708b8 — 000708b8

- 函数名: FUN_000708b8
- 函数体: 9 字节
- 调用者数: 1 / 被调用者数: 1

```c

void FUN_000708b8(void)

{
  FUN_000707cc();
  return;
}


```

## FUN_0001dd1c — 0001dd1c

- 函数名: FUN_0001dd1c
- 函数体: 53 字节
- 调用者数: 0 / 被调用者数: 1

```c

undefined4 FUN_0001dd1c(int param_1)

{
  undefined *puVar1;
  
  puVar1 = PTR_DAT_004d9048;
  PTR_DAT_004d9048[0xaa] = 1;
  puVar1[0xa8] = 1;
  FUN_00018cb8((&DAT_0055781c)[*(int *)(param_1 + 4)]);
  return 1;
}


```

## FUN_0001dca8 — 0001dca8

- 函数名: FUN_0001dca8
- 函数体: 113 字节
- 调用者数: 0 / 被调用者数: 2

```c

undefined4 FUN_0001dca8(int param_1)

{
  undefined *puVar1;
  uint uVar2;
  float *pfVar3;
  int iVar4;
  int *piVar5;
  
  uVar2 = *(int *)(param_1 + 8) - 0x89;
  if (uVar2 < 0x10) {
    FUN_00018cb8((&DAT_0055781c)[uVar2],param_1);
    puVar1 = PTR_DAT_004d9048;
    pfVar3 = (float *)(PTR_DAT_004d9048 + *(int *)(param_1 + 8) * 0xc + -0x598);
    if ((int)((uint)(*pfVar3 < 0.0) << 0x1f) < 0) {
      *pfVar3 = 2.0;
      iVar4 = FUN_0001d10c(puVar1);
      if (iVar4 != 0) {
        piVar5 = (int *)FUN_0001d10c(puVar1);
        (**(code **)(*piVar5 + 0x60))();
      }
    }
    else {
      *pfVar3 = 1.0;
    }
  }
  return 1;
}


```

## FUN_00021110 — 00021110

- 函数名: FUN_00021110
- 函数体: 647 字节
- 调用者数: 2 / 被调用者数: 23

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

## FUN_000213e4 — 000213e4

- 函数名: FUN_000213e4
- 函数体: 319 字节
- 调用者数: 1 / 被调用者数: 13

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

