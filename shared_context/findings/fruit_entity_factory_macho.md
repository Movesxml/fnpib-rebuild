# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0000698c — 0000698c

- 函数名: FUN_0000698c
- 函数体: 175 字节
- 调用者数: 15 / 被调用者数: 1

```c

int FUN_0000698c(int param_1,uint param_2)

{
  int iVar1;
  uint uVar2;
  char *pcVar3;
  uint uVar4;
  int local_18;
  
  uVar2 = *(uint *)(param_1 + 0x808);
  while (uVar4 = uVar2 - 1, -1 < (int)uVar4) {
    local_18 = *(int *)(param_1 + uVar2 * 4 + 4);
    uVar2 = uVar4;
    if (*(byte *)(local_18 + 0x35) == param_2) {
      iVar1 = *(int *)((int)&__mh_execute_header.ncmds + param_1) + param_2 * 8;
      FUN_00006cc0(iVar1,iVar1,&local_18);
      uVar2 = *(int *)(param_1 + 0x808) - 1;
      *(uint *)(param_1 + 0x808) = uVar2;
      for (; uVar4 < uVar2; uVar4 = uVar4 + 1) {
        iVar1 = param_1 + uVar4 * 4;
        *(undefined4 *)(iVar1 + 8) = *(undefined4 *)(iVar1 + 0xc);
        uVar2 = *(uint *)(param_1 + 0x808);
      }
      *(uint *)(local_18 + 0xc) = *(uint *)(local_18 + 0xc) & 0xfffffffe;
      return local_18;
    }
  }
  pcVar3 = segment_command_0000101c.segname + param_1;
  if (segment_command_0000101c.segname[param_1 + 0x20] != '\0') {
    pcVar3 = *(char **)pcVar3;
  }
  if (pcVar3 != (char *)0x0) {
    local_18 = (**(code **)(*(int *)pcVar3 + 0xc))(pcVar3,param_2);
    if (local_18 == 0) {
      return 0;
    }
    iVar1 = *(int *)((int)&__mh_execute_header.ncmds + param_1) + param_2 * 8;
    FUN_00006cc0(iVar1,iVar1,&local_18);
    *(undefined1 *)(local_18 + 0x34) = 0;
    *(char *)(local_18 + 0x35) = (char)param_2;
    return local_18;
  }
  return 0;
}


```

## FUN_000065c4 — 000065c4

- 函数名: FUN_000065c4
- 函数体: 107 字节
- 调用者数: 61 / 被调用者数: 4

```c

undefined * FUN_000065c4(void)

{
  int iVar1;
  
  if (((DAT_00556a00 & 1) == 0) && (iVar1 = ___cxa_guard_acquire(&DAT_00556a00), iVar1 != 0)) {
    FUN_000064a4(&DAT_00555990);
    ___cxa_atexit(&FUN_0000653c_1,&DAT_00555990,PTR___mh_execute_header_004d9040);
    ___cxa_guard_release(&DAT_00556a00);
  }
  return &DAT_00555990;
}


```

## FUN_0001b384 — 0001b384

- 函数名: FUN_0001b384
- 函数体: 651 字节
- 调用者数: 1 / 被调用者数: 7

(反编译超时或失败)

