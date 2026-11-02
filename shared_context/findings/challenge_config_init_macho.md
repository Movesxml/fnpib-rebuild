# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_00060878 — 00060878

- 函数名: FUN_00060878
- 函数体: 831 字节
- 调用者数: 1 / 被调用者数: 21

```c

void FUN_00060878(void)

{
  int *piVar1;
  int iVar2;
  undefined4 uVar3;
  void *pvVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int *piVar9;
  int iVar10;
  int iVar11;
  undefined4 uVar12;
  undefined4 uVar13;
  undefined4 uVar14;
  undefined4 local_5c;
  undefined4 local_58;
  undefined4 uStack_54;
  float local_50;
  int local_4c;
  undefined4 local_48;
  void *local_44;
  double local_40;
  int *local_38;
  undefined4 uStack_34;
  
  FUN_00060bb8();
  piVar1 = operator_new(0x48);
  FUN_0030cda0(piVar1,"xml/challengeConditions.xml");
  if (piVar1 != (int *)0x0) {
    iVar2 = FUN_0030ceac(piVar1,0);
    if (iVar2 == 1) {
      uVar3 = FUN_0030c328(piVar1,"challengeConditions");
      FUN_0005eb6c(&DAT_005f94b4,uVar3);
    }
    else {
      (**(code **)(*piVar1 + 4))(piVar1);
    }
  }
  piVar1 = operator_new(0x48);
  FUN_0030cd24();
  if (piVar1 != (int *)0x0) {
    iVar2 = FUN_0030cebc(piVar1,"xml/challengeMods.xml",0);
    if (iVar2 == 1) {
      uVar3 = FUN_0030c328(piVar1,"challengeMods");
      FUN_00063da4(&DAT_005f94e4,uVar3);
    }
    else {
      (**(code **)(*piVar1 + 4))(piVar1);
    }
  }
  piVar1 = operator_new(0x48);
  FUN_0030cda0(piVar1,"xml/ch1challengeList.xml");
  if (piVar1 != (int *)0x0) {
    iVar2 = FUN_0030ceac(piVar1,0);
    if (iVar2 == 1) {
      uVar3 = FUN_0030c328(piVar1,"partyChallenges");
      iVar2 = FUN_0030c328(uVar3,"defaults");
      if (iVar2 != 0) {
        FUN_0030c6c0(iVar2,"chanceSelect",&DAT_0052cb54);
        iVar2 = FUN_0030c718(iVar2,"chanceRegrowth",&local_40);
        if (iVar2 == 0) {
          DAT_0052cb58 = (float)local_40;
        }
      }
      iVar2 = FUN_0030c328(uVar3,"challengeTier");
      if (iVar2 != 0) {
        uVar13 = 0;
        uVar14 = *(undefined4 *)((undefined1  [16])0x0 + (undefined1  [16])0xc);
        iVar10 = 0;
        do {
          pvVar4 = operator_new(0xb4);
          FUN_0006ea28(pvVar4,iVar2,iVar10);
          local_44 = pvVar4;
          FUN_00063000(&DAT_005f94f8,&local_44);
          iVar5 = FUN_0030c328(iVar2,"challengeGroup");
          if (iVar5 != 0) {
            iVar11 = 0;
            do {
              piVar1 = operator_new(0x48);
              piVar1[4] = 0;
              piVar1[5] = 0;
              piVar1[6] = 0;
              FUN_0003994c(piVar1 + 7,4);
              *piVar1 = 0;
              iVar6 = FUN_0006f178(piVar1,iVar5,iVar11);
              pvVar4 = local_44;
              if (iVar6 == 1) {
                local_38 = piVar1;
                FUN_0006335c((int)local_44 + 0x6c,&local_38);
                uVar12 = DAT_0052cb54;
                local_48 = 0;
                uStack_54 = DAT_0052cb54;
                local_50 = DAT_0052cb58;
                local_5c = DAT_0052cb54;
                local_58 = uVar13;
                local_4c = uVar14;
                FUN_0030c6c0(iVar5,"chanceSelect",&local_5c);
                local_58 = local_5c;
                iVar6 = FUN_0030c718(iVar5,"chanceRegrowth",&local_38);
                if (iVar6 == 0) {
                  local_50 = (float)(double)CONCAT44(uStack_34,local_38);
                }
                iVar7 = *(int *)(PTR_DAT_004d9048 + 0x5c) + 0x140;
                piVar9 = (int *)(*(int *)(PTR_DAT_004d9048 + 0x5c) + 0x144);
                iVar6 = iVar7;
                while (iVar8 = *piVar9, iVar8 != 0) {
                  piVar9 = (int *)(iVar8 + 0xc);
                  if ((uint)piVar1[2] <= *(uint *)(iVar8 + 0x10)) {
                    piVar9 = (int *)(iVar8 + 8);
                    iVar6 = iVar8;
                  }
                }
                local_48 = 0;
                if (iVar6 != iVar7) {
                  local_48 = 0;
                  if ((uint)piVar1[2] < *(uint *)(iVar6 + 0x10)) {
                    iVar6 = iVar7;
                  }
                  if (iVar6 != iVar7) {
                    uVar12 = *(undefined4 *)(iVar6 + 0x14);
                    local_48 = *(undefined4 *)(iVar6 + 0x18);
                  }
                }
                uStack_54 = uVar12;
                if (0 < *piVar1) {
                  uStack_54 = 0;
                  local_50 = 0.0;
                }
                local_4c = iVar11;
                FUN_00039bc0((int)pvVar4 + 0x40,&local_58);
                iVar11 = iVar11 + 1;
              }
              else if (piVar1 != (int *)0x0) {
                FUN_00063308(piVar1);
                operator_delete(piVar1);
              }
              iVar5 = FUN_0030c3a0(iVar5,"challengeGroup");
            } while (iVar5 != 0);
          }
          iVar2 = FUN_0030c3a0(iVar2,"challengeTier");
          iVar10 = iVar10 + 1;
        } while (iVar2 != 0);
      }
      uVar3 = FUN_0030c328(uVar3,"specialChallenges");
      FUN_00060d04(&DAT_005f9504,uVar3);
    }
    else {
      (**(code **)(*piVar1 + 4))(piVar1);
    }
  }
  DAT_005f94b0 = 1;
  return;
}


```

