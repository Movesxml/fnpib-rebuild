from pathlib import Path
import struct

path = Path("ipa/extracted/FruitNinjaPiB-v1.0412/Payload/FruitNinjaPuss.app/FruitNinjaPuss")
data = path.read_bytes()
segments = []
offset = 28
for _ in range(struct.unpack_from("<I", data, 16)[0]):
    command, size = struct.unpack_from("<II", data, offset)
    if command == 1:
        name = data[offset + 8:offset + 24].split(bytes([0]))[0].decode()
        vmaddr, vmsize, fileoff, filesize = struct.unpack_from("<IIII", data, offset + 24)
        segments.append((name, vmaddr, vmsize, fileoff, filesize))
    offset += size
print(segments)
for address in (0x418FB8, 0x41A87C, 0x41CB85, 0x41CB97, 0x41C413, 0x41CBA4, 0x41CBB2, 0x41CBC8):
    for name, vmaddr, vmsize, fileoff, filesize in segments:
        if vmaddr <= address < vmaddr + vmsize:
            location = fileoff + address - vmaddr
            value = data[location:data.index(bytes([0]), location)].decode("utf-8")
            print(hex(address), value)
            break
