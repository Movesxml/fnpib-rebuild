# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_003e9a58 — 003e9a58

- 函数名: FUN_003e9a58
- 函数体: 511 字节
- 调用者数: 1 / 被调用者数: 1

```c

undefined4 * FUN_003e9a58(undefined4 *param_1)

{
  undefined4 *puVar1;
  
  puVar1 = operator_new__(0x9c);
  *param_1 = puVar1;
  *puVar1 = &LAB_003e7dc0_1;
  puVar1[1] = &LAB_003e7dc4_1;
  puVar1[2] = &FUN_003e7e0c_1;
  puVar1[3] = &LAB_003e7e58_1;
  puVar1[4] = &FUN_003e7e5c_1;
  puVar1[5] = &FUN_003e7ed0_1;
  puVar1[6] = &FUN_003e7f3c_1;
  puVar1[7] = &FUN_003e7fa8_1;
  puVar1[8] = &FUN_003e8014_1;
  puVar1[9] = &FUN_003e8080_1;
  puVar1[10] = &LAB_003e80cc_1;
  puVar1[0xb] = &LAB_003e80e8_1;
  puVar1[0xc] = &LAB_003e8110_1;
  puVar1[0xd] = &LAB_003e8150_1;
  puVar1[0xe] = &LAB_003e8184_1;
  puVar1[0xf] = &LAB_003e819c_1;
  puVar1[0x10] = &LAB_003e81c0_1;
  puVar1[0x11] = &LAB_003e8210_1;
  puVar1[0x12] = &FUN_003e8224_1;
  puVar1[0x13] = &LAB_003e8268_1;
  puVar1[0x14] = &LAB_003e82ac_1;
  puVar1[0x15] = &LAB_003e82d8_1;
  puVar1[0x16] = &LAB_003e8310_1;
  puVar1[0x17] = &LAB_003e8350_1;
  puVar1[0x18] = &LAB_003e8394_1;
  puVar1[0x19] = &LAB_003e83b4_1;
  puVar1[0x1a] = &LAB_003e83e0_1;
  puVar1[0x1b] = &LAB_003e8430_1;
  puVar1[0x1c] = &LAB_003e8444_1;
  puVar1[0x1d] = &LAB_003e8458_1;
  puVar1[0x1e] = &LAB_003e84ac_1;
  puVar1[0x1f] = &LAB_003e8504_1;
  puVar1[0x20] = &LAB_003e856c_1;
  puVar1[0x21] = &LAB_003e8580_1;
  puVar1[0x22] = &LAB_003e85fc_1;
  puVar1[0x23] = &LAB_003e8650_1;
  puVar1[0x24] = &LAB_003e86ac_1;
  puVar1[0x25] = &LAB_003e86c0_1;
  puVar1[0x26] = &LAB_003e86d4_1;
  return param_1;
}


```

## FUN_003e9c58 — 003e9c58

- 函数名: FUN_003e9c58
- 函数体: 101 字节
- 调用者数: 0 / 被调用者数: 3

```c

void FUN_003e9c58(void)

{
  undefined *puVar1;
  
  *(int *)PTR_DAT_004d901c = *(int *)PTR_DAT_004d901c + 1;
  FUN_003e9a58(&DAT_005b0074);
  puVar1 = PTR___mh_execute_header_004d9040;
  ___cxa_atexit(&FUN_003e8db0_1,&DAT_005b0074,PTR___mh_execute_header_004d9040);
  FUN_003e8ef0(&DAT_005b00b4);
  ___cxa_atexit(&FUN_003e8dc8_1,&DAT_005b00b4,puVar1);
  return;
}


```

