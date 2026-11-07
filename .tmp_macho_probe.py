
import struct
path = r"D:\fnpib_update\ipa\extracted\FruitNinjaPiB-v1.0412\Payload\FruitNinjaPuss.app\FruitNinjaPuss"
data = open(path,'rb').read()
pat = struct.pack('<I', 0x4d9048)
idxs=[]; i=data.find(pat)
while i!=-1 and len(idxs)<40:
    idxs.append(i); i=data.find(pat, i+1)
print("occurrences of dword 0x004d9048:", len(idxs))
for i in idxs[:20]:
    print("   fileoff=%08x va=%08x" % (i, i+0x1000))
pat2 = struct.pack('<I', 0x4d9050)
i=data.find(pat2); n=0
while i!=-1 and n<10:
    print("   [9050] fileoff=%08x va=%08x" % (i,i+0x1000)); n+=1; i=data.find(pat2,i+1)
