"""纯文件级验证: 字符串 VA 是否作为 LE32 出现在 .text 原始字节中。"""
import re, struct, zipfile
from pathlib import Path

APP = Path(__file__).resolve().parent.parent / 'ipa/extracted/FruitNinjaPiB-v1.0412/Payload/FruitNinjaPuss.app'
exe = zipfile.ZipFile(APP / 'assets.zip').read('FruitNinjaPIB.exe')

peoff = struct.unpack_from('<I', exe, 0x3C)[0]
image_base = struct.unpack_from('<I', exe, peoff + 0x34)[0]
nsec = struct.unpack_from('<H', exe, peoff + 6)[0]
opt_size = struct.unpack_from('<H', exe, peoff + 20)[0]
sec_off = peoff + 24 + opt_size
sections = []
for i in range(nsec):
    off = sec_off + i * 40
    name = exe[off:off+8].rstrip(b'\0').decode('ascii', 'ignore')
    vsz, va, rsz, rptr = struct.unpack_from('<IIII', exe, off + 8)
    sections.append((name, va, vsz, rptr, rsz))
    print(f"{name:10} RVA={va:#x} VSize={vsz:#x} RawPtr={rptr:#x} RawSize={rsz:#x}")

# 文本节原始字节范围
text = next(s for s in sections if s[0] == '.text')
text_raw = exe[text[3]: text[3] + text[4]]

def fo2rva(fo):
    for name, va, vsz, rptr, rsz in sections:
        if rptr and rptr <= fo < rptr + rsz:
            return va + (fo - rptr)
    return None

for kw in [b'%s_combos', b'UNHANDLED FRUIT ACTION', b'blade-bean-1', b'HIGHSCORE']:
    print(f"\n=== {kw.decode()} ===")
    for m in list(re.finditer(re.escape(kw), exe))[:3]:
        fo = m.start()
        rva = fo2rva(fo)
        if rva is None:
            print(f"  fileoff={fo:#x} 不在任何节(raw)中")
            continue
        va = image_base + rva
        print(f"  fileoff={fo:#x} RVA={rva:#x} VA={va:#x}")
        # 在 .text 原始字节中搜 LE32(VA) 与 LE32(RVA)
        n_va = text_raw.count(struct.pack('<I', va))
        n_rva = text_raw.count(struct.pack('<I', rva))
        n_hi = text_raw.count(struct.pack('<I', va & 0xFFFF0000))
        print(f"  .text 中 LE32(VA)={n_va}  LE32(RVA)={n_rva}")
        # 也在 .rdata/.data 搜指针
        for name in ('.rdata', '.data'):
            s = next(x for x in sections if x[0] == name)
            raw = exe[s[3]: s[3] + s[4]]
            print(f"  {name} 中 LE32(VA)={raw.count(struct.pack('<I', va))}", end='')
        print()
print(f"\nimage_base={image_base:#x}")
