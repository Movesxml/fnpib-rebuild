"""IPA 体检：解压、Info.plist、Mach-O 架构/最低系统版本/FairPlay 加密检测。

python -m harness.ipa_tools inspect ipa/xxx.ipa
报告写入 shared_context/findings/ipa_inventory.md（两个模型都能读到）。
"""
from __future__ import annotations

import argparse
import plistlib
import shutil
import struct
import sys
import zipfile
from pathlib import Path

from .config import WORKSPACE
from .context import save_finding

CPU = {7: "x86", 12: "ARM", 18: "PowerPC",
       0x01000007: "x86_64", 0x0100000C: "ARM64"}
PLATFORM = {1: "macOS", 2: "iOS", 3: "tvOS", 4: "watchOS", 5: "bridgeOS",
            6: "macCatalyst", 7: "iOS Simulator", 8: "tvOS Simulator",
            9: "watchOS Simulator", 10: "DriverKit"}
FILETYPE = {1: "MH_OBJECT", 2: "MH_EXECUTE", 6: "MH_DYLIB", 8: "MH_BUNDLE"}


def _ver(v: int) -> str:
    x, y, z = (v >> 16) & 0xFFFF, (v >> 8) & 0xFF, v & 0xFF
    return f"{x}.{y}" + (f".{z}" if z else "")


def parse_macho(data: bytes, base: int = 0) -> dict:
    magic = struct.unpack_from("<I", data, base)[0]
    if magic == 0xFEEDFACE:
        is64 = False
    elif magic == 0xFEEDFACF:
        is64 = True
    else:
        raise ValueError(f"非 Mach-O（magic={magic:#010x}）")
    fmt = "<IiiIIII" + ("I" if is64 else "")
    (_, cputype, _sub, filetype, ncmds, _sz, _flags, *_r) = struct.unpack_from(fmt, data, base)
    off = base + struct.calcsize(fmt)
    info = {
        "bits": 64 if is64 else 32,
        "cpu": CPU.get(cputype, f"未知({cputype:#x})"),
        "filetype": FILETYPE.get(filetype, f"type={filetype}"),
        "min_os": None, "sdk": None, "platform": None,
        "encrypted": None, "uuid": None,
    }
    for _ in range(ncmds):
        cmd, cmdsize = struct.unpack_from("<II", data, off)
        if cmd == 0x25:  # LC_VERSION_MIN_IPHONEOS
            ver, sdk = struct.unpack_from("<II", data, off + 8)
            info.update(min_os=_ver(ver), platform="iOS", sdk=_ver(sdk))
        elif cmd == 0x32:  # LC_BUILD_VERSION
            platform, minos, sdk = struct.unpack_from("<III", data, off + 8)
            info.update(platform=PLATFORM.get(platform, f"平台{platform}"),
                        min_os=_ver(minos), sdk=_ver(sdk))
        elif cmd in (0x21, 0x2C):  # LC_ENCRYPTION_INFO / LC_ENCRYPTION_INFO_64
            _off, _sz, cryptid = struct.unpack_from("<III", data, off + 8)
            info["encrypted"] = bool(cryptid)
        elif cmd == 0x1B:  # LC_UUID
            raw = struct.unpack_from("<16s", data, off + 8)[0]
            info["uuid"] = f"{raw[0:4].hex()}-{raw[4:6].hex()}-{raw[6:8].hex()}-{raw[8:10].hex()}-{raw[10:16].hex()}"
        if cmdsize < 8:
            break
        off += cmdsize
    return info


def parse_any(data: bytes) -> list:
    magic_be = struct.unpack_from(">I", data, 0)[0]
    if magic_be in (0xCAFEBABE, 0xCAFEBABF):  # Fat 多架构（大端头）
        is64 = magic_be == 0xCAFEBABF
        nfat = struct.unpack_from(">I", data, 4)[0]
        fmt = ">IIIII" + ("I" if is64 else "")
        size = struct.calcsize(fmt)
        slices = []
        for i in range(nfat):
            cputype, _sub, off, asize, _align, *_ = struct.unpack_from(fmt, data, 8 + i * size)
            try:
                info = parse_macho(data, off)
                info["cpu"] = CPU.get(cputype, f"未知({cputype:#x})")  # 以 fat 头为准
                info["slice_size"] = asize
            except ValueError as e:
                info = {"cpu": CPU.get(cputype, f"未知({cputype:#x})"), "error": str(e)}
            slices.append(info)
        return slices
    try:
        return [parse_macho(data, 0)]
    except ValueError as e:
        return [{"error": str(e)}]


def inspect_ipa(ipa: Path) -> str:
    out_dir = WORKSPACE / "ipa" / "extracted" / ipa.stem
    if out_dir.exists():
        shutil.rmtree(out_dir)
    out_dir.mkdir(parents=True)
    with zipfile.ZipFile(ipa) as z:
        z.extractall(out_dir)

    apps = list(out_dir.glob("Payload/*.app"))
    lines = [f"# IPA 体检报告: {ipa.name}", ""]
    if not apps:
        lines.append("未找到 Payload/*.app，可能不是标准 IPA 结构。")
        save_finding("ipa_inventory", "\n".join(lines))
        return "\n".join(lines)

    app = apps[0]
    lines.append(f"- 解压目录: `{app.relative_to(WORKSPACE)}`")
    plist_path = app / "Info.plist"
    info: dict = {}
    if plist_path.exists():
        try:
            info = plistlib.loads(plist_path.read_bytes())
        except Exception as e:
            lines.append(f"- ⚠️ Info.plist 解析失败（二进制 plist 可能是压缩格式）: {e}")
    exe_name = info.get("CFBundleExecutable")
    lines += [
        f"- 应用名: {info.get('CFBundleDisplayName') or info.get('CFBundleName', '?')}",
        f"- Bundle ID: {info.get('CFBundleIdentifier', '?')}",
        f"- 版本: {info.get('CFBundleShortVersionString', '?')} ({info.get('CFBundleVersion', '?')})",
        f"- 可执行文件: {exe_name or '?'}",
    ]
    if info.get("DTPlatformVersion"):
        lines.append(f"- 构建平台: {info.get('DTPlatformName', '?')} {info.get('DTPlatformVersion')} / SDK {info.get('DTSDKName', '?')}")
    if info.get("UIDeviceFamily"):
        fam = {1: "iPhone", 2: "iPad"}.get
        lines.append(f"- 设备家族: {[fam(x, x) for x in info['UIDeviceFamily']]}")
    if info.get("UIRequiredDeviceCapabilities"):
        lines.append(f"- 能力要求: {info['UIRequiredDeviceCapabilities']}")

    frameworks = sorted(p.name for p in (app / "Frameworks").glob("*")) if (app / "Frameworks").exists() else []
    if frameworks:
        lines.append(f"- 内嵌 Frameworks/Dylib: {frameworks}")
    engine_hint = detect_engine(app, frameworks, exe_name)
    if engine_hint:
        lines.append(f"- 引擎线索: {engine_hint}")

    exe = app / exe_name if exe_name else None
    if exe and exe.exists():
        data = exe.read_bytes()
        lines.append(f"- 可执行文件大小: {len(data) / 1024 / 1024:.1f} MB")
        for s in parse_any(data):
            if "error" in s:
                lines.append(f"\n## 切片 {s['cpu']} — ⚠️ {s['error']}")
                continue
            lines.append(f"\n## 架构切片: {s['cpu']} ({s['bits']} 位)")
            lines.append(f"- 类型: {s['filetype']}")
            lines.append(f"- 最低系统: {s['platform'] or '?'} {s['min_os'] or '?'}"
                         + (f"（SDK {s['sdk']}）" if s['sdk'] else ""))
            enc = s['encrypted']
            lines.append(f"- FairPlay 加密: {'⚠️ 已加密（反编译前必须解密）' if enc else '✅ 未加密'}"
                         if enc is not None else "- FairPlay 加密: ?")
            if s.get("uuid"):
                lines.append(f"- UUID: {s['uuid']}")
        any64 = any(s.get("bits") == 64 for s in parse_any(data))
        if not any64:
            lines.append("\n> ⚠️ **未检测到 64 位切片**：iOS 27 只支持 arm64，必须重建为 64 位（重写或转译）。")
    else:
        lines.append("- ⚠️ 找不到可执行文件")

    report = "\n".join(lines)
    save_finding("ipa_inventory", report)
    return report


def detect_engine(app: Path, frameworks: list, exe_name: str | None) -> str | None:
    hits = []
    if any("unity" in f.lower() for f in frameworks):
        hits.append("Unity（内嵌 UnityFramework）")
    for marker, name in [
        ("Data/level0", "Unity"), ("Data/Managed", "Unity/Mono"),
        ("cocos2d", "Cocos2d"), ("Cocos2dx", "Cocos2d-x"),
        (".pak", "可能是自研或中间件打包"),
    ]:
        if isinstance(marker, str) and "/" in marker:
            if (app / marker).exists():
                hits.append(name)
        else:
            for p in app.rglob("*"):
                if marker.lower() in p.name.lower():
                    hits.append(name)
                    break
    if (app / "Frameworks").exists():
        for f in frameworks:
            fl = f.lower()
            if "cocoa" in fl:
                hits.append("Cocoa (ObjC/Swift)")
            if "sdl" in fl:
                hits.append("SDL")
    return "、".join(dict.fromkeys(hits)) or None


def cmd_inspect(a: argparse.Namespace) -> None:
    ipa = Path(a.ipa)
    if not ipa.exists():
        sys.exit(f"文件不存在: {ipa}")
    print(inspect_ipa(ipa))
    print("\n报告已写入 shared_context/findings/ipa_inventory.md")


def main(argv=None) -> None:
    p = argparse.ArgumentParser(prog="harness.ipa_tools", description="IPA 体检")
    sub = p.add_subparsers(dest="cmd", required=True)
    i = sub.add_parser("inspect")
    i.add_argument("ipa", help="ipa 文件路径")
    i.set_defaults(func=cmd_inspect)
    a = p.parse_args(argv)
    a.func(a)


if __name__ == "__main__":
    main()
