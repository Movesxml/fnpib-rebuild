# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0002c8f0 — 0002c8f0

- 函数名: FUN_0002c8f0
- 函数体: 307 字节
- 调用者数: 1 / 被调用者数: 11

```c

void FUN_0002c8f0(int param_1)

{
  int *piVar1;
  int iVar2;
  undefined4 uVar3;
  undefined4 local_4c;
  undefined1 auStack_48 [4];
  undefined4 local_44;
  undefined4 local_40;
  undefined4 *local_3c;
  undefined4 *local_38;
  undefined4 local_34;
  undefined4 local_30;
  undefined4 local_2c;
  undefined4 local_28;
  undefined1 local_24;
  
  piVar1 = operator_new(0x48);
  FUN_0030cda0(piVar1,"xml/bonusAwards.xml");
  if (piVar1 != (int *)0x0) {
    iVar2 = FUN_0030ceac(piVar1,0);
    if (iVar2 == 1) {
      uVar3 = FUN_0030c328(piVar1,"bonusAwardsFile");
      iVar2 = FUN_0030c328(uVar3,"bonusType");
      if (iVar2 != 0) {
        do {
          local_44 = 0;
          local_40 = 0;
          local_34 = 0;
          local_24 = 0;
          local_30 = 0;
          local_2c = 0;
          local_28 = 0;
          local_3c = &local_44;
          local_38 = &local_44;
          FUN_0002c7a4(auStack_48,iVar2);
          FUN_0002ce54(param_1,auStack_48);
          FUN_0002dfdc(&local_30);
          FUN_0002d890(auStack_48,local_40);
          iVar2 = FUN_0030c3a0(iVar2,"bonusType");
        } while (iVar2 != 0);
      }
      local_4c = 0;
      iVar2 = FUN_0030c328(uVar3,"combo");
      if (iVar2 != 0) {
        do {
          FUN_0030c6c0(iVar2,"bonus",&local_4c);
          FUN_0002ce7c(param_1 + 0x14,&local_4c);
          iVar2 = FUN_0030c3a0(iVar2,"combo");
        } while (iVar2 != 0);
      }
    }
    (**(code **)(*piVar1 + 4))(piVar1);
  }
  return;
}


```

