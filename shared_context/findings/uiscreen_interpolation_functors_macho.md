# 完整反编译导出（无截断）

- 程序: FruitNinjaPuss

## FUN_0038cd18 — 0038cd18

- 函数名: FUN_0038cd18
- 函数体: 479 字节
- 调用者数: 1 / 被调用者数: 2

```c

undefined4 * FUN_0038cd18(undefined4 *param_1)

{
  undefined4 *puVar1;
  
  FUN_0038d588();
  *param_1 = &DAT_00533354;
  *(undefined2 *)(param_1 + 2) = 100;
  puVar1 = operator_new__(100);
  param_1[1] = puVar1;
  *(undefined2 *)(puVar1 + 4) = 0;
  puVar1[3] = 0;
  puVar1[2] = 0;
  puVar1[1] = 0;
  *puVar1 = 0;
  *(undefined4 *)((int)puVar1 + 0x12) = 0x1010101;
  *(undefined1 *)((int)puVar1 + 0x16) = 2;
  *(undefined1 *)((int)puVar1 + 0x17) = 2;
  puVar1[6] = 0x3030303;
  puVar1[7] = 0x6050504;
  *(undefined1 *)(puVar1 + 8) = 6;
  *(undefined1 *)((int)puVar1 + 0x21) = 7;
  *(undefined1 *)((int)puVar1 + 0x22) = 7;
  *(undefined1 *)((int)puVar1 + 0x23) = 8;
  *(undefined1 *)(puVar1 + 9) = 8;
  *(undefined1 *)((int)puVar1 + 0x25) = 9;
  *(undefined1 *)((int)puVar1 + 0x26) = 10;
  *(undefined1 *)((int)puVar1 + 0x27) = 10;
  *(undefined1 *)(puVar1 + 10) = 0xb;
  *(undefined1 *)((int)puVar1 + 0x29) = 0xc;
  *(undefined1 *)((int)puVar1 + 0x2a) = 0xd;
  *(undefined1 *)((int)puVar1 + 0x2b) = 0xd;
  *(undefined1 *)(puVar1 + 0xb) = 0xe;
  *(undefined1 *)((int)puVar1 + 0x2d) = 0xf;
  *(undefined1 *)((int)puVar1 + 0x2e) = 0x10;
  *(undefined1 *)((int)puVar1 + 0x2f) = 0x11;
  *(undefined1 *)(puVar1 + 0xc) = 0x12;
  *(undefined1 *)((int)puVar1 + 0x31) = 0x13;
  *(undefined1 *)((int)puVar1 + 0x32) = 0x14;
  *(undefined1 *)((int)puVar1 + 0x33) = 0x15;
  *(undefined1 *)(puVar1 + 0xd) = 0x16;
  *(undefined1 *)((int)puVar1 + 0x35) = 0x18;
  *(undefined1 *)((int)puVar1 + 0x36) = 0x19;
  *(undefined1 *)((int)puVar1 + 0x37) = 0x1a;
  *(undefined1 *)(puVar1 + 0xe) = 0x1c;
  *(undefined1 *)((int)puVar1 + 0x39) = 0x1d;
  *(undefined1 *)((int)puVar1 + 0x3a) = 0x1e;
  *(undefined1 *)((int)puVar1 + 0x3b) = 0x20;
  *(undefined1 *)(puVar1 + 0xf) = 0x21;
  *(undefined1 *)((int)puVar1 + 0x3d) = 0x24;
  *(undefined1 *)((int)puVar1 + 0x3e) = 0x25;
  *(undefined1 *)((int)puVar1 + 0x3f) = 0x27;
  *(undefined1 *)(puVar1 + 0x10) = 0x29;
  *(undefined1 *)((int)puVar1 + 0x41) = 0x2b;
  *(undefined1 *)((int)puVar1 + 0x42) = 0x2d;
  *(undefined1 *)((int)puVar1 + 0x43) = 0x2e;
  *(undefined1 *)(puVar1 + 0x11) = 0x31;
  *(undefined1 *)((int)puVar1 + 0x45) = 0x33;
  *(undefined1 *)((int)puVar1 + 0x46) = 0x35;
  *(undefined1 *)((int)puVar1 + 0x47) = 0x38;
  *(undefined1 *)(puVar1 + 0x12) = 0x3b;
  *(undefined1 *)((int)puVar1 + 0x49) = 0x3d;
  *(undefined1 *)((int)puVar1 + 0x4a) = 0x40;
  *(undefined1 *)((int)puVar1 + 0x4b) = 0x43;
  *(undefined1 *)(puVar1 + 0x13) = 0x46;
  *(undefined1 *)((int)puVar1 + 0x4d) = 0x49;
  *(undefined1 *)((int)puVar1 + 0x4e) = 0x4c;
  *(undefined1 *)((int)puVar1 + 0x4f) = 0x50;
  *(undefined1 *)(puVar1 + 0x14) = 0x53;
  *(undefined1 *)((int)puVar1 + 0x51) = 0x57;
  *(undefined1 *)((int)puVar1 + 0x52) = 0x5b;
  *(undefined1 *)((int)puVar1 + 0x53) = 0x5f;
  *(undefined1 *)(puVar1 + 0x15) = 100;
  *(undefined1 *)((int)puVar1 + 0x55) = 0x69;
  *(undefined1 *)((int)puVar1 + 0x56) = 0x6d;
  *(undefined1 *)((int)puVar1 + 0x57) = 0x73;
  *(undefined1 *)(puVar1 + 0x16) = 0x79;
  *(undefined1 *)((int)puVar1 + 0x59) = 0x7e;
  *(undefined1 *)((int)puVar1 + 0x5a) = 0x85;
  *(undefined1 *)((int)puVar1 + 0x5b) = 0x8c;
  *(undefined1 *)(puVar1 + 0x17) = 0x93;
  *(undefined1 *)((int)puVar1 + 0x5d) = 0x9c;
  *(undefined1 *)((int)puVar1 + 0x5e) = 0xa6;
  *(undefined1 *)((int)puVar1 + 0x5f) = 0xb0;
  *(undefined1 *)(puVar1 + 0x18) = 0xbd;
  *(undefined1 *)((int)puVar1 + 0x61) = 0xcb;
  *(undefined1 *)((int)puVar1 + 0x62) = 0xdf;
  *(undefined1 *)((int)puVar1 + 99) = 0xff;
  return param_1;
}


```

## FUN_0038d164 — 0038d164

- 函数名: FUN_0038d164
- 函数体: 451 字节
- 调用者数: 1 / 被调用者数: 2

```c

undefined4 * FUN_0038d164(undefined4 *param_1)

{
  undefined1 *puVar1;
  
  FUN_0038d588();
  *param_1 = &DAT_0053336c;
  *(undefined2 *)(param_1 + 2) = 100;
  puVar1 = operator_new__(100);
  param_1[1] = puVar1;
  *puVar1 = 0;
  puVar1[1] = 0x22;
  puVar1[2] = 0x36;
  puVar1[3] = 0x45;
  puVar1[4] = 0x51;
  puVar1[5] = 0x5c;
  puVar1[6] = 0x65;
  puVar1[7] = 0x6d;
  puVar1[8] = 0x74;
  puVar1[9] = 0x7b;
  puVar1[10] = 0x82;
  puVar1[0xb] = 0x88;
  puVar1[0xc] = 0x8e;
  puVar1[0xd] = 0x93;
  puVar1[0xe] = 0x98;
  puVar1[0xf] = 0x9c;
  puVar1[0x10] = 0xa1;
  puVar1[0x11] = 0xa5;
  puVar1[0x12] = 0xa9;
  puVar1[0x13] = 0xac;
  puVar1[0x14] = 0xb0;
  puVar1[0x15] = 0xb3;
  puVar1[0x16] = 0xb7;
  puVar1[0x17] = 0xba;
  puVar1[0x18] = 0xbc;
  puVar1[0x19] = 0xbf;
  puVar1[0x1a] = 0xc2;
  puVar1[0x1b] = 0xc5;
  puVar1[0x1c] = 200;
  puVar1[0x1d] = 0xca;
  puVar1[0x1e] = 0xcc;
  puVar1[0x1f] = 0xcf;
  puVar1[0x20] = 0xd1;
  puVar1[0x21] = 0xd3;
  puVar1[0x22] = 0xd5;
  puVar1[0x23] = 0xd7;
  puVar1[0x24] = 0xd8;
  puVar1[0x25] = 0xdb;
  puVar1[0x26] = 0xdc;
  puVar1[0x27] = 0xde;
  puVar1[0x28] = 0xe0;
  puVar1[0x29] = 0xe1;
  puVar1[0x2a] = 0xe3;
  puVar1[0x2b] = 0xe4;
  puVar1[0x2c] = 0xe6;
  puVar1[0x2d] = 0xe7;
  puVar1[0x2e] = 0xe8;
  puVar1[0x2f] = 0xea;
  puVar1[0x30] = 0xeb;
  puVar1[0x31] = 0xec;
  puVar1[0x32] = 0xed;
  puVar1[0x33] = 0xee;
  puVar1[0x34] = 0xef;
  puVar1[0x35] = 0xf0;
  puVar1[0x36] = 0xf1;
  puVar1[0x37] = 0xf2;
  puVar1[0x38] = 0xf3;
  puVar1[0x39] = 0xf4;
  puVar1[0x3a] = 0xf4;
  puVar1[0x3b] = 0xf5;
  puVar1[0x3c] = 0xf5;
  puVar1[0x3d] = 0xf6;
  puVar1[0x3e] = 0xf7;
  puVar1[0x3f] = 0xf8;
  puVar1[0x40] = 0xf8;
  puVar1[0x41] = 0xf9;
  puVar1[0x42] = 0xf9;
  puVar1[0x43] = 0xf9;
  puVar1[0x44] = 0xfa;
  puVar1[0x45] = 0xfa;
  puVar1[0x46] = 0xfa;
  puVar1[0x47] = 0xfb;
  puVar1[0x48] = 0xfc;
  puVar1[0x49] = 0xfc;
  *(undefined4 *)(puVar1 + 0x4a) = 0xfdfdfdfd;
  puVar1[0x52] = 0xfe;
  *(undefined4 *)(puVar1 + 0x4e) = 0xfefefefe;
  puVar1[99] = 0xff;
  *(undefined4 *)(puVar1 + 0x5f) = 0xffffffff;
  *(undefined4 *)(puVar1 + 0x5b) = 0xffffffff;
  *(undefined4 *)(puVar1 + 0x57) = 0xffffffff;
  *(undefined4 *)(puVar1 + 0x53) = 0xffffffff;
  return param_1;
}


```

## FUN_0038cad0 — 0038cad0

- 函数名: FUN_0038cad0
- 函数体: 545 字节
- 调用者数: 1 / 被调用者数: 2

```c

undefined4 * FUN_0038cad0(undefined4 *param_1)

{
  undefined4 *puVar1;
  
  FUN_0038d588();
  *param_1 = &DAT_00533348;
  *(undefined2 *)(param_1 + 2) = 100;
  puVar1 = operator_new__(100);
  param_1[1] = puVar1;
  *puVar1 = 0x1000000;
  *(undefined1 *)(puVar1 + 1) = 2;
  *(undefined1 *)((int)puVar1 + 5) = 2;
  *(undefined1 *)((int)puVar1 + 6) = 3;
  *(undefined1 *)((int)puVar1 + 7) = 3;
  *(undefined1 *)(puVar1 + 2) = 4;
  *(undefined1 *)((int)puVar1 + 9) = 5;
  *(undefined1 *)((int)puVar1 + 10) = 6;
  *(undefined1 *)((int)puVar1 + 0xb) = 7;
  *(undefined1 *)(puVar1 + 3) = 7;
  *(undefined1 *)((int)puVar1 + 0xd) = 9;
  *(undefined1 *)((int)puVar1 + 0xe) = 10;
  *(undefined1 *)((int)puVar1 + 0xf) = 0xb;
  *(undefined1 *)(puVar1 + 4) = 0xc;
  *(undefined1 *)((int)puVar1 + 0x11) = 0xd;
  *(undefined1 *)((int)puVar1 + 0x12) = 0xf;
  *(undefined1 *)((int)puVar1 + 0x13) = 0x10;
  *(undefined1 *)(puVar1 + 5) = 0x12;
  *(undefined1 *)((int)puVar1 + 0x15) = 0x13;
  *(undefined1 *)((int)puVar1 + 0x16) = 0x15;
  *(undefined1 *)((int)puVar1 + 0x17) = 0x17;
  *(undefined1 *)(puVar1 + 6) = 0x19;
  *(undefined1 *)((int)puVar1 + 0x19) = 0x1b;
  *(undefined1 *)((int)puVar1 + 0x1a) = 0x1d;
  *(undefined1 *)((int)puVar1 + 0x1b) = 0x1f;
  *(undefined1 *)(puVar1 + 7) = 0x21;
  *(undefined1 *)((int)puVar1 + 0x1d) = 0x23;
  *(undefined1 *)((int)puVar1 + 0x1e) = 0x26;
  *(undefined1 *)((int)puVar1 + 0x1f) = 0x28;
  *(undefined1 *)(puVar1 + 8) = 0x2b;
  *(undefined1 *)((int)puVar1 + 0x21) = 0x2d;
  *(undefined1 *)((int)puVar1 + 0x22) = 0x31;
  *(undefined1 *)((int)puVar1 + 0x23) = 0x34;
  *(undefined1 *)(puVar1 + 9) = 0x37;
  *(undefined1 *)((int)puVar1 + 0x25) = 0x3b;
  *(undefined1 *)((int)puVar1 + 0x26) = 0x3f;
  *(undefined1 *)((int)puVar1 + 0x27) = 0x43;
  *(undefined1 *)(puVar1 + 10) = 0x47;
  *(undefined1 *)((int)puVar1 + 0x29) = 0x4b;
  *(undefined1 *)((int)puVar1 + 0x2a) = 0x50;
  *(undefined1 *)((int)puVar1 + 0x2b) = 0x55;
  *(undefined1 *)(puVar1 + 0xb) = 0x5a;
  *(undefined1 *)((int)puVar1 + 0x2d) = 0x61;
  *(undefined1 *)((int)puVar1 + 0x2e) = 0x67;
  *(undefined1 *)((int)puVar1 + 0x2f) = 0x6e;
  *(undefined1 *)(puVar1 + 0xc) = 0x76;
  *(undefined1 *)((int)puVar1 + 0x31) = 0x7e;
  *(undefined1 *)((int)puVar1 + 0x32) = 0x87;
  *(undefined1 *)((int)puVar1 + 0x33) = 0x8f;
  *(undefined1 *)(puVar1 + 0xd) = 0x96;
  *(undefined1 *)((int)puVar1 + 0x35) = 0x9c;
  *(undefined1 *)((int)puVar1 + 0x36) = 0xa2;
  *(undefined1 *)((int)puVar1 + 0x37) = 0xa8;
  *(undefined1 *)(puVar1 + 0xe) = 0xad;
  *(undefined1 *)((int)puVar1 + 0x39) = 0xb2;
  *(undefined1 *)((int)puVar1 + 0x3a) = 0xb7;
  *(undefined1 *)((int)puVar1 + 0x3b) = 0xbb;
  *(undefined1 *)(puVar1 + 0xf) = 0xbf;
  *(undefined1 *)((int)puVar1 + 0x3d) = 0xc3;
  *(undefined1 *)((int)puVar1 + 0x3e) = 199;
  *(undefined1 *)((int)puVar1 + 0x3f) = 0xca;
  *(undefined1 *)(puVar1 + 0x10) = 0xcd;
  *(undefined1 *)((int)puVar1 + 0x41) = 0xd0;
  *(undefined1 *)((int)puVar1 + 0x42) = 0xd3;
  *(undefined1 *)((int)puVar1 + 0x43) = 0xd6;
  *(undefined1 *)(puVar1 + 0x11) = 0xd9;
  *(undefined1 *)((int)puVar1 + 0x45) = 0xdb;
  *(undefined1 *)((int)puVar1 + 0x46) = 0xde;
  *(undefined1 *)((int)puVar1 + 0x47) = 0xe0;
  *(undefined1 *)(puVar1 + 0x12) = 0xe3;
  *(undefined1 *)((int)puVar1 + 0x49) = 0xe5;
  *(undefined1 *)((int)puVar1 + 0x4a) = 0xe7;
  *(undefined1 *)((int)puVar1 + 0x4b) = 0xe9;
  *(undefined1 *)(puVar1 + 0x13) = 0xea;
  *(undefined1 *)((int)puVar1 + 0x4d) = 0xeb;
  *(undefined1 *)((int)puVar1 + 0x4e) = 0xed;
  *(undefined1 *)((int)puVar1 + 0x4f) = 0xef;
  *(undefined1 *)(puVar1 + 0x14) = 0xf1;
  *(undefined1 *)((int)puVar1 + 0x51) = 0xf2;
  *(undefined1 *)((int)puVar1 + 0x52) = 0xf2;
  *(undefined1 *)((int)puVar1 + 0x53) = 0xf4;
  *(undefined1 *)(puVar1 + 0x15) = 0xf5;
  *(undefined1 *)((int)puVar1 + 0x55) = 0xf6;
  *(undefined1 *)((int)puVar1 + 0x56) = 0xf7;
  *(undefined1 *)((int)puVar1 + 0x57) = 0xf8;
  *(undefined1 *)(puVar1 + 0x16) = 0xf8;
  *(undefined1 *)((int)puVar1 + 0x59) = 0xfa;
  *(undefined1 *)((int)puVar1 + 0x5a) = 0xfb;
  *(undefined1 *)((int)puVar1 + 0x5b) = 0xfb;
  *(undefined1 *)(puVar1 + 0x17) = 0xfc;
  *(undefined1 *)((int)puVar1 + 0x5d) = 0xfc;
  *(undefined1 *)((int)puVar1 + 0x5e) = 0xfd;
  *(undefined1 *)((int)puVar1 + 0x5f) = 0xfd;
  *(undefined1 *)(puVar1 + 0x18) = 0xfe;
  *(undefined1 *)((int)puVar1 + 0x61) = 0xfe;
  *(undefined1 *)((int)puVar1 + 0x62) = 0xff;
  *(undefined1 *)((int)puVar1 + 99) = 0xff;
  return param_1;
}


```

## FUN_0038cf1c — 0038cf1c

- 函数名: FUN_0038cf1c
- 函数体: 547 字节
- 调用者数: 1 / 被调用者数: 2

```c

undefined4 * FUN_0038cf1c(undefined4 *param_1)

{
  undefined4 *puVar1;
  
  FUN_0038d588();
  *param_1 = &DAT_00533360;
  *(undefined2 *)(param_1 + 2) = 100;
  puVar1 = operator_new__(100);
  param_1[1] = puVar1;
  *(undefined1 *)(puVar1 + 1) = 0;
  *puVar1 = 0;
  *(undefined4 *)((int)puVar1 + 5) = 0x2020101;
  *(undefined1 *)((int)puVar1 + 9) = 3;
  *(undefined1 *)((int)puVar1 + 10) = 3;
  *(undefined1 *)((int)puVar1 + 0xb) = 5;
  *(undefined1 *)(puVar1 + 3) = 5;
  *(undefined1 *)((int)puVar1 + 0xd) = 6;
  *(undefined1 *)((int)puVar1 + 0xe) = 7;
  *(undefined1 *)((int)puVar1 + 0xf) = 7;
  *(undefined1 *)(puVar1 + 4) = 8;
  *(undefined1 *)((int)puVar1 + 0x11) = 9;
  *(undefined1 *)((int)puVar1 + 0x12) = 10;
  *(undefined1 *)((int)puVar1 + 0x13) = 10;
  *(undefined1 *)(puVar1 + 5) = 0xb;
  *(undefined1 *)((int)puVar1 + 0x15) = 0xc;
  *(undefined1 *)((int)puVar1 + 0x16) = 0xd;
  *(undefined1 *)((int)puVar1 + 0x17) = 0xd;
  *(undefined1 *)(puVar1 + 6) = 0xe;
  *(undefined1 *)((int)puVar1 + 0x19) = 0x10;
  *(undefined1 *)((int)puVar1 + 0x1a) = 0x11;
  *(undefined1 *)((int)puVar1 + 0x1b) = 0x13;
  *(undefined1 *)(puVar1 + 7) = 0x14;
  *(undefined1 *)((int)puVar1 + 0x1d) = 0x15;
  *(undefined1 *)((int)puVar1 + 0x1e) = 0x17;
  *(undefined1 *)((int)puVar1 + 0x1f) = 0x19;
  *(undefined1 *)(puVar1 + 8) = 0x1b;
  *(undefined1 *)((int)puVar1 + 0x21) = 0x1c;
  *(undefined1 *)((int)puVar1 + 0x22) = 0x1e;
  *(undefined1 *)((int)puVar1 + 0x23) = 0x21;
  *(undefined1 *)(puVar1 + 9) = 0x23;
  *(undefined1 *)((int)puVar1 + 0x25) = 0x25;
  *(undefined1 *)((int)puVar1 + 0x26) = 0x26;
  *(undefined1 *)((int)puVar1 + 0x27) = 0x29;
  *(undefined1 *)(puVar1 + 10) = 0x2b;
  *(undefined1 *)((int)puVar1 + 0x29) = 0x2c;
  *(undefined1 *)((int)puVar1 + 0x2a) = 0x2f;
  *(undefined1 *)((int)puVar1 + 0x2b) = 0x31;
  *(undefined1 *)(puVar1 + 0xb) = 0x34;
  *(undefined1 *)((int)puVar1 + 0x2d) = 0x37;
  *(undefined1 *)((int)puVar1 + 0x2e) = 0x3a;
  *(undefined1 *)((int)puVar1 + 0x2f) = 0x3d;
  *(undefined1 *)(puVar1 + 0xc) = 0x3f;
  *(undefined1 *)((int)puVar1 + 0x31) = 0x43;
  *(undefined1 *)((int)puVar1 + 0x32) = 0x47;
  *(undefined1 *)((int)puVar1 + 0x33) = 0x4b;
  *(undefined1 *)(puVar1 + 0xd) = 0x4e;
  *(undefined1 *)((int)puVar1 + 0x35) = 0x52;
  *(undefined1 *)((int)puVar1 + 0x36) = 0x56;
  *(undefined1 *)((int)puVar1 + 0x37) = 0x5a;
  *(undefined1 *)(puVar1 + 0xe) = 0x5d;
  *(undefined1 *)((int)puVar1 + 0x39) = 0x61;
  *(undefined1 *)((int)puVar1 + 0x3a) = 0x65;
  *(undefined1 *)((int)puVar1 + 0x3b) = 0x69;
  *(undefined1 *)(puVar1 + 0xf) = 0x6d;
  *(undefined1 *)((int)puVar1 + 0x3d) = 0x71;
  *(undefined1 *)((int)puVar1 + 0x3e) = 0x75;
  *(undefined1 *)((int)puVar1 + 0x3f) = 0x79;
  *(undefined1 *)(puVar1 + 0x10) = 0x7c;
  *(undefined1 *)((int)puVar1 + 0x41) = 0x80;
  *(undefined1 *)((int)puVar1 + 0x42) = 0x84;
  *(undefined1 *)((int)puVar1 + 0x43) = 0x87;
  *(undefined1 *)(puVar1 + 0x11) = 0x8c;
  *(undefined1 *)((int)puVar1 + 0x45) = 0x8f;
  *(undefined1 *)((int)puVar1 + 0x46) = 0x93;
  *(undefined1 *)((int)puVar1 + 0x47) = 0x97;
  *(undefined1 *)(puVar1 + 0x12) = 0x9b;
  *(undefined1 *)((int)puVar1 + 0x49) = 0x9e;
  *(undefined1 *)((int)puVar1 + 0x4a) = 0xa2;
  *(undefined1 *)((int)puVar1 + 0x4b) = 0xa6;
  *(undefined1 *)(puVar1 + 0x13) = 0xaa;
  *(undefined1 *)((int)puVar1 + 0x4d) = 0xae;
  *(undefined1 *)((int)puVar1 + 0x4e) = 0xb2;
  *(undefined1 *)((int)puVar1 + 0x4f) = 0xb5;
  *(undefined1 *)(puVar1 + 0x14) = 0xb9;
  *(undefined1 *)((int)puVar1 + 0x51) = 0xbd;
  *(undefined1 *)((int)puVar1 + 0x52) = 0xc1;
  *(undefined1 *)((int)puVar1 + 0x53) = 0xc5;
  *(undefined1 *)(puVar1 + 0x15) = 0xc9;
  *(undefined1 *)((int)puVar1 + 0x55) = 0xcd;
  *(undefined1 *)((int)puVar1 + 0x56) = 0xd0;
  *(undefined1 *)((int)puVar1 + 0x57) = 0xd4;
  *(undefined1 *)(puVar1 + 0x16) = 0xd8;
  *(undefined1 *)((int)puVar1 + 0x59) = 0xdc;
  *(undefined1 *)((int)puVar1 + 0x5a) = 0xdf;
  *(undefined1 *)((int)puVar1 + 0x5b) = 0xe3;
  *(undefined1 *)(puVar1 + 0x17) = 0xe7;
  *(undefined1 *)((int)puVar1 + 0x5d) = 0xeb;
  *(undefined1 *)((int)puVar1 + 0x5e) = 0xef;
  *(undefined1 *)((int)puVar1 + 0x5f) = 0xf2;
  *(undefined1 *)(puVar1 + 0x18) = 0xf6;
  *(undefined1 *)((int)puVar1 + 0x61) = 0xf9;
  *(undefined1 *)((int)puVar1 + 0x62) = 0xfc;
  *(undefined1 *)((int)puVar1 + 99) = 0xff;
  return param_1;
}


```

## FUN_0038d34c — 0038d34c

- 函数名: FUN_0038d34c
- 函数体: 551 字节
- 调用者数: 1 / 被调用者数: 2

```c

undefined4 * FUN_0038d34c(undefined4 *param_1)

{
  undefined4 *puVar1;
  
  FUN_0038d588();
  *param_1 = &DAT_00533378;
  *(undefined2 *)(param_1 + 2) = 100;
  puVar1 = operator_new__(100);
  param_1[1] = puVar1;
  *puVar1 = 0xc080400;
  *(undefined1 *)(puVar1 + 1) = 0x10;
  *(undefined1 *)((int)puVar1 + 5) = 0x14;
  *(undefined1 *)((int)puVar1 + 6) = 0x18;
  *(undefined1 *)((int)puVar1 + 7) = 0x1b;
  *(undefined1 *)(puVar1 + 2) = 0x1f;
  *(undefined1 *)((int)puVar1 + 9) = 0x23;
  *(undefined1 *)((int)puVar1 + 10) = 0x27;
  *(undefined1 *)((int)puVar1 + 0xb) = 0x2b;
  *(undefined1 *)(puVar1 + 3) = 0x2f;
  *(undefined1 *)((int)puVar1 + 0xd) = 0x32;
  *(undefined1 *)((int)puVar1 + 0xe) = 0x36;
  *(undefined1 *)((int)puVar1 + 0xf) = 0x3a;
  *(undefined1 *)(puVar1 + 4) = 0x3e;
  *(undefined1 *)((int)puVar1 + 0x11) = 0x42;
  *(undefined1 *)((int)puVar1 + 0x12) = 0x45;
  *(undefined1 *)((int)puVar1 + 0x13) = 0x49;
  *(undefined1 *)(puVar1 + 5) = 0x4d;
  *(undefined1 *)((int)puVar1 + 0x15) = 0x51;
  *(undefined1 *)((int)puVar1 + 0x16) = 0x55;
  *(undefined1 *)((int)puVar1 + 0x17) = 0x59;
  *(undefined1 *)(puVar1 + 6) = 0x5d;
  *(undefined1 *)((int)puVar1 + 0x19) = 0x61;
  *(undefined1 *)((int)puVar1 + 0x1a) = 0x65;
  *(undefined1 *)((int)puVar1 + 0x1b) = 0x69;
  *(undefined1 *)(puVar1 + 7) = 0x6c;
  *(undefined1 *)((int)puVar1 + 0x1d) = 0x70;
  *(undefined1 *)((int)puVar1 + 0x1e) = 0x74;
  *(undefined1 *)((int)puVar1 + 0x1f) = 0x78;
  *(undefined1 *)(puVar1 + 8) = 0x7b;
  *(undefined1 *)((int)puVar1 + 0x21) = 0x7f;
  *(undefined1 *)((int)puVar1 + 0x22) = 0x83;
  *(undefined1 *)((int)puVar1 + 0x23) = 0x87;
  *(undefined1 *)(puVar1 + 9) = 0x8b;
  *(undefined1 *)((int)puVar1 + 0x25) = 0x8f;
  *(undefined1 *)((int)puVar1 + 0x26) = 0x92;
  *(undefined1 *)((int)puVar1 + 0x27) = 0x96;
  *(undefined1 *)(puVar1 + 10) = 0x9a;
  *(undefined1 *)((int)puVar1 + 0x29) = 0x9e;
  *(undefined1 *)((int)puVar1 + 0x2a) = 0xa2;
  *(undefined1 *)((int)puVar1 + 0x2b) = 0xa6;
  *(undefined1 *)(puVar1 + 0xb) = 0xa9;
  *(undefined1 *)((int)puVar1 + 0x2d) = 0xad;
  *(undefined1 *)((int)puVar1 + 0x2e) = 0xb1;
  *(undefined1 *)((int)puVar1 + 0x2f) = 0xb5;
  *(undefined1 *)(puVar1 + 0xc) = 0xb9;
  *(undefined1 *)((int)puVar1 + 0x31) = 0xbd;
  *(undefined1 *)((int)puVar1 + 0x32) = 0xc0;
  *(undefined1 *)((int)puVar1 + 0x33) = 0xc2;
  *(undefined1 *)(puVar1 + 0xd) = 0xc6;
  *(undefined1 *)((int)puVar1 + 0x35) = 200;
  *(undefined1 *)((int)puVar1 + 0x36) = 0xcb;
  *(undefined1 *)((int)puVar1 + 0x37) = 0xcd;
  *(undefined1 *)(puVar1 + 0xe) = 0xd0;
  *(undefined1 *)((int)puVar1 + 0x39) = 0xd2;
  *(undefined1 *)((int)puVar1 + 0x3a) = 0xd4;
  *(undefined1 *)((int)puVar1 + 0x3b) = 0xd6;
  *(undefined1 *)(puVar1 + 0xf) = 0xd8;
  *(undefined1 *)((int)puVar1 + 0x3d) = 0xdb;
  *(undefined1 *)((int)puVar1 + 0x3e) = 0xdd;
  *(undefined1 *)((int)puVar1 + 0x3f) = 0xde;
  *(undefined1 *)(puVar1 + 0x10) = 0xe0;
  *(undefined1 *)((int)puVar1 + 0x41) = 0xe1;
  *(undefined1 *)((int)puVar1 + 0x42) = 0xe4;
  *(undefined1 *)((int)puVar1 + 0x43) = 0xe5;
  *(undefined1 *)(puVar1 + 0x11) = 0xe7;
  *(undefined1 *)((int)puVar1 + 0x45) = 0xe8;
  *(undefined1 *)((int)puVar1 + 0x46) = 0xe9;
  *(undefined1 *)((int)puVar1 + 0x47) = 0xeb;
  *(undefined1 *)(puVar1 + 0x12) = 0xec;
  *(undefined1 *)((int)puVar1 + 0x49) = 0xed;
  *(undefined1 *)((int)puVar1 + 0x4a) = 0xee;
  *(undefined1 *)((int)puVar1 + 0x4b) = 0xf0;
  *(undefined1 *)(puVar1 + 0x13) = 0xf1;
  *(undefined1 *)((int)puVar1 + 0x4d) = 0xf2;
  *(undefined1 *)((int)puVar1 + 0x4e) = 0xf3;
  *(undefined1 *)((int)puVar1 + 0x4f) = 0xf4;
  *(undefined1 *)(puVar1 + 0x14) = 0xf5;
  *(undefined1 *)((int)puVar1 + 0x51) = 0xf6;
  *(undefined1 *)((int)puVar1 + 0x52) = 0xf6;
  *(undefined1 *)((int)puVar1 + 0x53) = 0xf7;
  *(undefined1 *)(puVar1 + 0x15) = 0xf8;
  *(undefined1 *)((int)puVar1 + 0x55) = 0xf9;
  *(undefined1 *)((int)puVar1 + 0x56) = 0xf9;
  *(undefined1 *)((int)puVar1 + 0x57) = 0xfa;
  *(undefined1 *)(puVar1 + 0x16) = 0xfa;
  *(undefined1 *)((int)puVar1 + 0x59) = 0xfb;
  *(undefined1 *)((int)puVar1 + 0x5a) = 0xfb;
  *(undefined1 *)((int)puVar1 + 0x5b) = 0xfc;
  *(undefined1 *)(puVar1 + 0x17) = 0xfc;
  *(undefined1 *)((int)puVar1 + 0x5d) = 0xfd;
  *(undefined1 *)((int)puVar1 + 0x5e) = 0xfd;
  *(undefined1 *)((int)puVar1 + 0x5f) = 0xfd;
  *(undefined1 *)(puVar1 + 0x18) = 0xfe;
  *(undefined1 *)((int)puVar1 + 0x61) = 0xfe;
  *(undefined1 *)((int)puVar1 + 0x62) = 0xff;
  *(undefined1 *)((int)puVar1 + 99) = 0xff;
  return param_1;
}


```

