# 字符串定位报告（立即数扫描）

- 程序: FruitNinjaPIB.exe
- 已定义函数: 129503
- 命中函数: 1，裸引用点(未纳入函数): 0

## FUN_00b29ab0 — 00b29ab0
命中: originalmodeinfo.xml@01703e7c(imm), originalmodeinfo.xml@01703fac(imm), originalmode@01703e7c(imm), originalmode@01703f28(imm), originalmode@01703fac(imm)

```c

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __fastcall FUN_00b29ab0(char *param_1)

{
  char cVar1;
  int iVar2;
  undefined4 *puStack_7c;
  void *pvStack_10;
  undefined *puStack_c;
  undefined4 uStack_8;
  
  uStack_8 = 0xffffffff;
  puStack_c = &UNK_01612c8b;
  pvStack_10 = ExceptionList;
  ExceptionList = &pvStack_10;
  if (*param_1 != '\0') {
    thunk_FUN_00c93660(&UNK_016ec4b0,_DAT_018bcc60 ^ (uint)&stack0xfffffffc);
    thunk_FUN_00c93660(&UNK_01704050);
    thunk_FUN_00c93660(&UNK_016ec4b0);
    thunk_FUN_00a6fd50(&UNK_0170403c);
    thunk_FUN_00c93610(&UNK_016ec474);
    thunk_FUN_00c93660(&UNK_016ec434);
    thunk_FUN_00c93660(&UNK_01703fd0);
    thunk_FUN_00c94580(0xffff);
    thunk_FUN_00c93660(&UNK_016ec434);
    if (DAT_018c55d4 == '\0') {
      iVar2 = thunk_FUN_00c93390();
      if (iVar2 == 0) {
        DebugBreak();
      }
      else if (iVar2 == 2) {
        DAT_018c55d4 = '\x01';
      }
    }
  }
  iVar2 = thunk_FUN_00c8c9a0(0x48);
  uStack_8 = 0;
  if (iVar2 == 0) {
    puStack_7c = (undefined4 *)0x0;
  }
  else {
    puStack_7c = (undefined4 *)thunk_FUN_00c98ca0(&UNK_01703fac);
  }
  uStack_8 = 0xffffffff;
  if (puStack_7c != (undefined4 *)0x0) {
    cVar1 = thunk_FUN_00c98e40(0);
    if (cVar1 == '\0') {
      if ((puStack_7c != (undefined4 *)0x0) && (puStack_7c != (undefined4 *)0x0)) {
        (**(code **)*puStack_7c)(1);
      }
      thunk_FUN_00c93660(&UNK_016ec4b0);
      thunk_FUN_00c93660(&UNK_016ec4a8);
      thunk_FUN_00c93660(&UNK_016ec4b0);
      thunk_FUN_00a6fd50(&UNK_01703e7c);
      thunk_FUN_00c93610(&UNK_016ec474);
      thunk_FUN_00c93660(&UNK_016ec434);
      thunk_FUN_00c93660(&UNK_01703e10);
      thunk_FUN_00c94580(0xffff);
      thunk_FUN_00c93660(&UNK_016ec434);
      if (DAT_018c55d6 == '\0') {
        iVar2 = thunk_FUN_00c93390();
        if (iVar2 == 0) {
          DebugBreak();
        }
        else if (iVar2 == 2) {
          DAT_018c55d6 = '\x01';
        }
      }
    }
    else {
      iVar2 = thunk_FUN_00a6ef60(&UNK_01703f9c);
      if (iVar2 == 0) {
        thunk_FUN_00c93660(&UNK_016ec4b0);
        thunk_FUN_00c93660(&UNK_016ec78c);
        thunk_FUN_00c93660(&UNK_016ec4b0);
        thunk_FUN_00a6fd50(&UNK_01703f94);
        thunk_FUN_00c93610(&UNK_016ec474);
        thunk_FUN_00c93660(&UNK_016ec434);
        thunk_FUN_00c93660(&UNK_01703f28);
        thunk_FUN_00c94580(0xffff);
        thunk_FUN_00c93660(&UNK_016ec434);
        if (DAT_018c55d5 == '\0') {
          iVar2 = thunk_FUN_00c93390();
          if (iVar2 == 0) {
            DebugBreak();
          }
          else if (iVar2 == 2) {
            DAT_018c55d5 = '\x01';
          }
        }
      }
      thunk_FUN_00a6ef60(&UNK_01703f1c);
      thunk_FUN_00a71290(&UNK_01703f0c,param_1 + 4);
      thunk_FUN_00a71290(&UNK_01703ef8,param_1 + 8);
      thunk_FUN_00a71290(&UNK_01703ee0,param_1 + 0xc);
      thunk_FUN_00a71290(&UNK_01703ed0,param_1 + 0x10);
      thunk_FUN_00c973d0(&UNK_01703ec4,param_1 + 0x14);
      thunk_FUN_00a6ef60(&UNK_01703ebc);
      thunk_FUN_00a71290(&UNK_016f4970,param_1 + 0x18);
      thunk_FUN_00a71290(&UNK_01703eac,param_1 + 0x1c);
      *param_1 = '\x01';
    }
  }
  ExceptionList = pvStack_10;
  return;
}


```

