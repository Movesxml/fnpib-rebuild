# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_00058528 — 00058528

- 函数名: FUN_00058528
- 函数体: 93 字节
- 调用者数: 1 / 被调用者数: 2

```c

void FUN_00058528(int param_1,char *param_2)

{
  size_t sVar1;
  int iVar2;
  int iVar3;
  
  *(undefined4 *)(param_1 + 0x18) = 1;
  if (param_2 != (char *)0x0) {
    sVar1 = _strlen(param_2);
    iVar2 = FUN_002f69c4(param_2,sVar1);
    iVar3 = FUN_002f69c4("OVERRIDE_ANY",0xc);
    if (iVar2 != iVar3) {
      sVar1 = _strlen(param_2);
      iVar2 = FUN_002f69c4(param_2,sVar1);
      iVar3 = FUN_002f69c4("DONT_OVERRIDE",0xd);
      if (iVar2 != iVar3) {
        return;
      }
    }
    *(undefined4 *)(param_1 + 0x18) = 2;
  }
  return;
}


```

## FUN_000531b8 — 000531b8

- 函数名: FUN_000531b8
- 函数体: 179 字节
- 调用者数: 1 / 被调用者数: 4

```c

int FUN_000531b8(char *param_1)

{
  int iVar1;
  size_t sVar2;
  int iVar3;
  int iVar4;
  
  if (((DAT_005a792c & 1) == 0) && (iVar1 = ___cxa_guard_acquire(&DAT_005a792c), iVar1 != 0)) {
    DAT_005a795c = FUN_002f69c4("BOTTOM",6);
    DAT_005a7960 = FUN_002f69c4("TOP",3);
    DAT_005a7964 = FUN_002f69c4("LEFT",4);
    DAT_005a7968 = FUN_002f69c4("RIGHT",5);
    DAT_005a796c = FUN_002f69c4("LEFT_RIGHT",10);
    ___cxa_guard_release(&DAT_005a792c);
  }
  sVar2 = _strlen(param_1);
  iVar3 = FUN_002f69c4(param_1,sVar2);
  iVar1 = 0;
  do {
    iVar4 = iVar1;
    if (4 < iVar4) {
      return 0;
    }
    iVar1 = iVar4 + 1;
  } while (iVar3 != (&DAT_005a795c)[iVar4]);
  return iVar4;
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

