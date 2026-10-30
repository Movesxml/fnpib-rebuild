"""诊断字符串引用机制: 字符串 VA 是否出现在文件中(哪个节), 判断直接引用还是指针表间接引用。"""
import re, struct, zipfile
from pathlib import Path

BS = chr(92)
APP = Path(__file__).resolve().parent.parent / 'ipa/extracted/FruitNinjaPiB-v1.0412/Payload/FruitNinjaPuss.app'
exe = zipfile.ZipFile(APP / 'assets.zip').read('FruitNinjaPIB.exe')

# PE 头解析
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
print(f"image_base={image_base:#x}  节数={nsec}")
for s in sections:
    print(f"  {s[0]:10} VA={s[1]:#08x} VSize={s[2]:#x} RawPtr={s[3]:#x} RawSize={s[4]:#x}")

def fileoff_to_va(fo):
    for name, va, vsz, rptr, rsz in sections:
        if rptr <= fo < rptr + max(rsz, vsz):
            return image_base + va + (fo - rptr), name
    return None, None

def va_to_fileoff(va_full):
    rel = va_full - image_base
    for name, va, vsz, rptr, rsz in sections:
        if va <= rel < va + max(vsz, rsz):
            return rptr + (rel - va), name
    return None, None

# 字符串出现处 → VA → 全文件搜 LE 引用
for kw in [b'fruit.cpp', b'slash.cpp', b'combochecker.cpp', b'entitymanager.cpp']:
    locs = [m.start() for m in re.finditer(re.escape(kw), exe)]
    print(f"\n=== {kw.decode()} 出现 {len(locs)} 次 ===")
    for lo in locs[:4]:
        va_full, sec = fileoff_to_va(lo)
        print(f"  fileoff={lo:#x} 所在节={sec} VA={va_full:#x}")
        needle = struct.pack('<I', va_full)
        refs = [m.start() for m in re.finditer(re.escape(needle), exe)]
        print(f"  文件中 VA(LE32) 被引用 {len(refs)} 次:", end=' ')
        for r in refs[:6]:
            _, rsec = fileoff_to_va(r)
            print(f"{rsec}@{r:#x}", end='  ')
        print()
