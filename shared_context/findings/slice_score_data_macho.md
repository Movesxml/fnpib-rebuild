# 数据段常量读取

- 程序: FruitNinjaPuss

- `ptr:0x4d90b4:0:i32`: 读取失败 Unable to read bytes at ram:005d4cd0

- `ptr:0x4d90b4:0:u32`: 读取失败 Unable to read bytes at ram:005d4cd0

- `0x52c324` +64B: 7f 91 41 00 87 91 41 00 90 91 41 00 01 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

- `ptr[0x52c324]=0x0041917f + 0` +32B:
    43 4c 41 53 53 49 43 00 4e 45 57 5f 4d 4f 44 45 
    00 41 4c 4c 00 61 63 74 2d 63 68 61 6e 67 65 00

- `ptr[0x52c328]=0x00419187 + 0` +32B:
    4e 45 57 5f 4d 4f 44 45 00 41 4c 4c 00 61 63 74 
    2d 63 68 61 6e 67 65 00 62 65 61 6e 2d 63 6f 6c

- `ptr[0x52c32c]=0x00419190 + 0` +32B:
    41 4c 4c 00 61 63 74 2d 63 68 61 6e 67 65 00 62 
    65 61 6e 2d 63 6f 6c 6c 65 63 74 00 62 65 61 6e

- `ptrbytes:0x52c330:0:0x20`: 读取失败 Unable to read bytes at ram:00000001

- `ptrbytes:0x52c334:0:0x20`: 读取失败 Unable to read bytes at ram:00000001

- `ptrbytes:0x52c338:0:0x20`: 读取失败 Unable to read bytes at ram:00000000

- `ptrbytes:0x52c33c:0:0x20`: 读取失败 Unable to read bytes at ram:00000000

- `ptrbytes:0x52c340:0:0x20`: 读取失败 Unable to read bytes at ram:00000000

