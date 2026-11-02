# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0005e8e8 — 0005e8e8

- 函数名: FUN_0005e8e8
- 函数体: 59 字节
- 调用者数: 1 / 被调用者数: 2

```c

int FUN_0005e8e8(char *param_1)

{
  int iVar1;
  size_t sVar2;
  int iVar3;
  int iVar4;
  
  iVar4 = 0;
  if (param_1 != (char *)0x0) {
    sVar2 = _strlen(param_1);
    iVar3 = FUN_002f69c4(param_1,sVar2);
    iVar1 = 0;
    do {
      iVar4 = iVar1;
      if (5 < iVar4) {
        return 0;
      }
      iVar1 = iVar4 + 1;
    } while (iVar3 != (&DAT_005a7fe8)[iVar4]);
  }
  return iVar4;
}


```

## FUN_0005e924 — 0005e924

- 函数名: FUN_0005e924
- 函数体: 361 字节
- 调用者数: 1 / 被调用者数: 3

```c

undefined4 * FUN_0005e924(undefined4 param_1)

{
  undefined *puVar1;
  undefined4 *puVar2;
  
  puVar2 = (undefined4 *)0x0;
  switch(param_1) {
  case 0:
    goto switchD_0005e958_caseD_0;
  case 1:
    puVar2 = operator_new(0x60);
    _memset(puVar2,0,0x60);
    *puVar2 = &PTR_LAB_0005efb0_1_00538828;
    *(undefined1 *)(puVar2 + 1) = 0;
    puVar2[0x12] = 0;
    puVar2[0x14] = 0;
    *(undefined1 *)(puVar2 + 0x15) = 0;
    FUN_0005ef64(puVar2);
    puVar1 = (undefined *)0x52cae0;
    break;
  case 2:
    puVar2 = operator_new(100);
    _memset(puVar2,0,100);
    *puVar2 = &PTR_LAB_0005efb0_1_00538828;
    *(undefined1 *)(puVar2 + 1) = 0;
    puVar2[0x12] = 0;
    puVar2[0x14] = 0;
    *(undefined1 *)(puVar2 + 0x15) = 0;
    FUN_0005ef64(puVar2);
    puVar1 = (undefined *)0x52ca80;
    break;
  case 3:
    puVar2 = operator_new(0x60);
    _memset(puVar2,0,0x60);
    *puVar2 = &PTR_LAB_0005efb0_1_00538828;
    *(undefined1 *)(puVar2 + 1) = 0;
    puVar2[0x12] = 0;
    puVar2[0x14] = 0;
    *(undefined1 *)(puVar2 + 0x15) = 0;
    FUN_0005ef64(puVar2);
    puVar1 = &UNK_00538880;
    break;
  case 4:
    puVar2 = operator_new(0x68);
    _memset(puVar2,0,0x68);
    *puVar2 = &PTR_LAB_0005efb0_1_00538828;
    *(undefined1 *)(puVar2 + 1) = 0;
    puVar2[0x12] = 0;
    puVar2[0x14] = 0;
    *(undefined1 *)(puVar2 + 0x15) = 0;
    FUN_0005ef64(puVar2);
    puVar1 = &UNK_005388e0;
    break;
  case 5:
    puVar2 = operator_new(0x68);
    _memset(puVar2,0,0x68);
    *puVar2 = &PTR_LAB_0005efb0_1_00538828;
    *(undefined1 *)(puVar2 + 1) = 0;
    puVar2[0x12] = 0;
    puVar2[0x14] = 0;
    *(undefined1 *)(puVar2 + 0x15) = 0;
    FUN_0005ef64(puVar2);
    puVar1 = &UNK_00538940;
    break;
  default:
    puVar2 = operator_new(0x60);
    *puVar2 = &PTR_LAB_0005efb0_1_00538828;
    *(undefined1 *)(puVar2 + 1) = 0;
    puVar2[0x12] = 0;
    puVar2[0x14] = 0;
    *(undefined1 *)(puVar2 + 0x15) = 0;
    FUN_0005ef64(puVar2);
    goto switchD_0005e958_caseD_0;
  }
  *puVar2 = puVar1 + 8;
switchD_0005e958_caseD_0:
  return puVar2;
}


```

