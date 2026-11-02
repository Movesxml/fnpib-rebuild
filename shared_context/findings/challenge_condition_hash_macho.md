# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_002f69c4 — 002f69c4

- 函数名: FUN_002f69c4
- 函数体: 655 字节
- 调用者数: 188 / 被调用者数: 1

```c

void FUN_002f69c4(char *param_1,uint param_2)

{
  uint uVar1;
  char cVar2;
  uint uVar3;
  int iVar4;
  bool bVar5;
  undefined4 local_34;
  char local_30 [12];
  int local_24;
  
  local_24 = *(int *)PTR____stack_chk_guard_004d9044;
  if ((param_1 != (char *)0x0) && (uVar1 = param_2, *param_1 != '\0')) {
    for (; 0xb < uVar1; uVar1 = uVar1 - 0xc) {
      iVar4 = 0;
      do {
        cVar2 = param_1[iVar4];
        if ((byte)(cVar2 + 0xbfU) < 0x1a) {
          cVar2 = cVar2 + ' ';
        }
        bVar5 = iVar4 != 0xb;
        local_30[iVar4] = cVar2;
        iVar4 = iVar4 + 1;
      } while (bVar5);
      param_1 = param_1 + 0xc;
    }
    local_34 = param_2;
    if (uVar1 != 0) {
      uVar3 = 1;
      while( true ) {
        cVar2 = param_1[uVar3 - 1];
        if ((byte)(cVar2 + 0xbfU) < 0x1a) {
          cVar2 = cVar2 + ' ';
        }
        local_30[uVar3 - 1] = cVar2;
        if (uVar1 == uVar3) break;
        uVar3 = uVar3 + 1;
      }
      switch(uVar1) {
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        break;
      case 5:
        break;
      case 6:
        break;
      case 7:
        break;
      case 8:
        break;
      case 9:
        break;
      case 10:
        break;
      case 0xb:
      }
    }
  }
  if (*(int *)PTR____stack_chk_guard_004d9044 != local_24) {
                    /* WARNING: Subroutine does not return */
    ___stack_chk_fail(*(int *)PTR____stack_chk_guard_004d9044);
  }
  return;
}


```

## FUN_0005ef64 — 0005ef64

- 函数名: FUN_0005ef64
- 函数体: 63 字节
- 调用者数: 1 / 被调用者数: 3

```c

void FUN_0005ef64(int param_1)

{
  int iVar1;
  
  *(undefined4 *)(param_1 + 0x5c) = 0;
  if (*(int *)(param_1 + 0x4c) != *(int *)PTR_DAT_004d9184) {
    return;
  }
  FUN_0001d10c(PTR_DAT_004d9048);
  FUN_000617a8();
  iVar1 = FUN_0000ac08();
  *(undefined4 *)(param_1 + 0x50) = *(undefined4 *)(iVar1 + 0x250);
  return;
}


```

