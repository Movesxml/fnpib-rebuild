# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_00060bb8 — 00060bb8

- 函数名: FUN_00060bb8
- 函数体: 331 字节
- 调用者数: 1 / 被调用者数: 13

```c

void FUN_00060bb8(void)

{
  int *piVar1;
  int iVar2;
  undefined4 uVar3;
  int iVar4;
  char *pcVar5;
  size_t sVar6;
  char *pcVar7;
  char cVar8;
  char *local_24;
  
  FUN_0006082c();
  piVar1 = operator_new(0x48);
  FUN_0030cda0(piVar1,"xml/challengeTypes.xml");
  if (piVar1 != (int *)0x0) {
    iVar2 = FUN_0030ceac(piVar1,0);
    if (iVar2 == 1) {
      uVar3 = FUN_0030c328(piVar1,"challengeTypes");
      for (iVar2 = FUN_0030c328(uVar3,"type"); iVar2 != 0; iVar2 = FUN_0030c3a0(iVar2,"type")) {
        iVar4 = FUN_0030c660(iVar2,"name");
        if (iVar4 != 0) {
          pcVar5 = operator_new(0x4c);
          cVar8 = '\x01';
          pcVar5[0x40] = '\0';
          pcVar5[0x41] = '\0';
          pcVar5[0x42] = '\0';
          pcVar5[0x43] = '\0';
          pcVar7 = pcVar5 + 0x44;
          pcVar7[0] = '\0';
          pcVar7[1] = '\0';
          pcVar7[2] = '\0';
          pcVar7[3] = '\0';
          pcVar5[0x48] = '\x01';
          local_24 = pcVar5;
          uVar3 = FUN_0030c660(iVar2,"name");
          FUN_002f702c(pcVar5,0x40,uVar3);
          sVar6 = _strlen(pcVar5);
          uVar3 = FUN_002f69c4(pcVar5,sVar6);
          *(undefined4 *)(pcVar5 + 0x40) = uVar3;
          pcVar7[0] = '\0';
          pcVar7[1] = '\0';
          pcVar7[2] = '\0';
          pcVar7[3] = '\0';
          FUN_0030c6c0(iVar2,"iconIndex",pcVar7);
          pcVar7 = (char *)FUN_0030c660(iVar2,"dontShowInRandom");
          if (pcVar7 != (char *)0x0) {
            iVar4 = _strcmp(pcVar7,"true");
            cVar8 = '\0';
            if (iVar4 != 0) {
              cVar8 = '\x01';
            }
          }
          pcVar5[0x48] = cVar8;
          FUN_00063028(&DAT_005f94a0,&local_24);
          if (DAT_005f94ac < *(int *)(local_24 + 0x44)) {
            DAT_005f94ac = *(int *)(local_24 + 0x44);
          }
        }
      }
    }
    else {
      (**(code **)(*piVar1 + 4))(piVar1);
    }
  }
  return;
}


```

## FUN_00060d04 — 00060d04

- 函数名: FUN_00060d04
- 函数体: 101 字节
- 调用者数: 1 / 被调用者数: 5

```c

void FUN_00060d04(undefined4 *param_1,int param_2)

{
  undefined4 *puVar1;
  undefined4 uVar2;
  
  if (param_2 != 0) {
    param_1[1] = 0;
    FUN_0030c6c0(param_2,"numPerGame",param_1 + 1);
    puVar1 = operator_new(0x48);
    puVar1[4] = 0;
    puVar1[5] = 0;
    puVar1[6] = 0;
    FUN_0003994c(puVar1 + 7,4);
    *puVar1 = 0;
    *param_1 = puVar1;
    uVar2 = FUN_0030c328(param_2,"challengeGroup");
    FUN_0006f178(puVar1,uVar2,0xffffffff);
  }
  return;
}


```

## FUN_000607f8 — 000607f8

- 函数名: FUN_000607f8
- 函数体: 49 字节
- 调用者数: 1 / 被调用者数: 0

```c

int FUN_000607f8(int param_1)

{
  int *piVar1;
  uint uVar2;
  
  uVar2 = 0;
  do {
    if ((uint)(DAT_005f94a4 - (int)DAT_005f94a0 >> 2) <= uVar2) {
      return *DAT_005f94a0;
    }
    piVar1 = DAT_005f94a0 + uVar2;
    uVar2 = uVar2 + 1;
  } while (*(int *)(*piVar1 + 0x40) != param_1);
  return *piVar1;
}


```

## FUN_0006bc4c — 0006bc4c

- 函数名: FUN_0006bc4c
- 函数体: 97 字节
- 调用者数: 14 / 被调用者数: 2

```c

void FUN_0006bc4c(int param_1,float *param_2)

{
  undefined4 *puVar1;
  undefined4 *puVar2;
  
  for (; *(int *)(param_1 + 0x38) != 0; param_1 = *(int *)(*(int *)(param_1 + 0x38) + 4)) {
  }
  if ((*(float *)(param_1 + 0x48) != *param_2) || (*(float *)(param_1 + 0x4c) != param_2[1])) {
    *(float *)(param_1 + 0x48) = *param_2;
    *(float *)(param_1 + 0x4c) = param_2[1];
    FUN_0006bcb0(param_1);
  }
  puVar1 = *(undefined4 **)(param_1 + 0x3c);
  if (*(undefined4 **)(param_1 + 0x3c) != *(undefined4 **)(param_1 + 0x40)) {
    do {
      puVar2 = puVar1 + 1;
      FUN_0006bcf0(*puVar1);
      puVar1 = puVar2;
    } while (puVar2 != *(undefined4 **)(param_1 + 0x40));
    return;
  }
  return;
}


```

