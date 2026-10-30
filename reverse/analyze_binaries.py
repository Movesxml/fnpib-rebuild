"""双二进制等价性分析：iOS Mach-O（发售版，基准真源） vs x86 Debug exe（辅助对照）。

输出:
  reverse/class_inventory_exe.md   — exe 的 MSVC RTTI 类清单
  reverse/class_inventory_macho.md — macho 的 Itanium 符号类/方法清单
  控制台摘要 + findings 数据供 binary_equivalence.md 引用
"""
import re, zipfile, struct
from collections import defaultdict
from pathlib import Path

WS = Path(__file__).resolve().parent
APP = WS.parent / 'ipa/extracted/FruitNinjaPiB-v1.0412/Payload/FruitNinjaPuss.app'

def exe_bytes():
    z = zipfile.ZipFile(APP / 'assets.zip')
    return z.read('FruitNinjaPIB.exe')

def macho_bytes():
    return (APP / 'FruitNinjaPuss').read_bytes()

# ---------- exe: MSVC RTTI 类名 ----------
# 注意: 允许 $ ? < > 等模板字符, 否则模板类(项目中最常见的 Delegate/Callee)会丢失
MSVC_CLASS = re.compile(rb'\.\?A[UV][$?\w@<>\-,.\' ]{2,200}?@@')

def exe_classes(data):
    """返回 {短名: RTTI 原始串集合}。段拆分: Name@Ns@@; 短名=首段去 $/模板残留。"""
    raw = set(m.group(0) for m in MSVC_CLASS.finditer(data))
    classes = defaultdict(set)
    for s in raw:
        body = s[4:]
        seg = re.split(rb'@', body)[0]
        seg = re.sub(rb'^\$?', b'', seg)
        seg = re.split(rb'[$<?]', seg)[0]
        name = seg.decode('ascii', 'ignore')
        if len(name) >= 2:
            classes[name].add(s.decode('ascii', 'ignore'))
    return classes

# ---------- macho: Itanium mangled 符号 ----------
ITAN = re.compile(rb'_ZN(K?)6Mortar(?:(\d+)([A-Za-z0-9_]+))(?:(\d+)([A-Za-z0-9_]+))?E[A-Za-z0-9_]*')
def macho_symbols(data):
    classes = defaultdict(lambda: defaultdict(int))  # class -> method -> count
    for m in ITAN.finditer(data):
        clen, cname, mlen, mname = m.group(2), m.group(3), m.group(4), m.group(5)
        if not clen:
            continue
        c = cname.decode('ascii', 'ignore')
        if mlen and mname:
            classes[c][mname.decode('ascii', 'ignore')] += 1
        else:
            classes[c]['<ctor/dtor/其他>'] += 1
    return classes

# ---------- 字符串集 ----------
STR = re.compile(rb'[\x20-\x7e]{6,}')
def strings(data):
    return set(s.decode('ascii', 'ignore') for s in STR.findall(data))

KEYWORDS = ['combo', 'Combo', 'wave', 'Wave', 'score', 'Score', 'fruit', 'Fruit', 'blade', 'Blade',
            'slash', 'Slash', 'critical', 'Critical', 'banana', 'mango', 'watermelon', 'pomegranate',
            'kiwi', 'lime', 'orange', 'peach', 'pear', 'plum', 'berry', 'coconut', 'dojo', 'Dojo',
            'arcade', 'Arcade', 'zen', 'Zen', 'storm', 'Challenge', 'challenge', 'highscore', 'Highscore',
            'puss', 'boots', 'Bandito', 'bandito', 'magic', 'Magic', 'bomb', 'Bomb', 'freeze', 'Freeze',
            'frenzy', 'Frenzy', 'life', 'Life', 'timer', 'Timer', 'gravity', 'physics', 'Physics']

def gameplay_strings(strset):
    hits = set()
    for s in strset:
        if any(k in s for k in KEYWORDS) and len(s) < 80:
            hits.add(s)
    return hits

def main():
    exe, macho = exe_bytes(), macho_bytes()
    ec = exe_classes(exe)      # {短名: rtti串集合}
    mc = macho_symbols(macho)  # {类: {方法: 计数}}

    exe_all = set(ec.keys())
    macho_all = set(mc.keys())

    both = exe_all & macho_all
    only_exe = exe_all - macho_all
    only_macho = macho_all - exe_all

    print("== 类清单对比 ==")
    print(f"exe 类总数: {len(exe_all)} (Mortar 命名空间: {len(ec.get('Mortar', []))})")
    print(f"macho 类总数: {len(macho_all)} (含方法符号)")
    print(f"双方共有: {len(both)}")
    print(f"仅 exe: {len(only_exe)}  仅 macho: {len(only_macho)}")
    print("\n关键类在双方的覆盖:")
    for k in ['Fruit', 'SlashEntity', 'ComboModifier', 'ChallengeUIScore', 'Blade', 'Entity',
              'Component', 'GameWorld', 'FruitManager', 'ScoreManager', 'WaveManager']:
        e, m = k in exe_all, k in macho_all
        mm = sorted(mc[k].keys())[:10] if m else []
        print(f"  {k:22} exe={str(e):5} macho={str(m):5} macho方法={mm}")

    gs_exe = gameplay_strings(strings(exe))
    gs_macho = gameplay_strings(strings(macho))
    print("\n== 玩法字符串 ==")
    print(f"exe 命中 {len(gs_exe)} 条, macho 命中 {len(gs_macho)} 条, 共有 {len(gs_exe & gs_macho)} 条")
    print("\n仅 macho 有(发售版文案,重建须以它为准):")
    for s in sorted(gs_macho - gs_exe)[:15]: print("  +", s)
    print("\n仅 exe 有(可能为调试版独有):")
    for s in sorted(gs_exe - gs_macho)[:15]: print("  -", s)

    # 写类清单文件
    with open(WS / 'class_inventory_exe.md', 'w', encoding='utf-8') as f:
        f.write(f"# exe (x86 Debug) 类清单 — MSVC RTTI\n\n共 {len(exe_all)} 个类/结构短名\n\n")
        f.write("按字母序；括号内为该名的 RTTI 串数\n\n")
        for n in sorted(exe_all):
            f.write(f"- {n} ({len(ec[n])})\n")
    with open(WS / 'class_inventory_macho.md', 'w', encoding='utf-8') as f:
        f.write(f"# macho (iOS 发售版) 类/方法清单 — Itanium 符号\n\n共 {len(macho_all)} 类\n\n")
        for c in sorted(macho_all):
            methods = sorted(mc[c].keys())
            f.write(f"## {c} ({len(methods)} 方法)\n\n")
            for m in methods: f.write(f"- {m}\n")
            f.write("\n")

    import json
    summary = {
        'exe_classes': len(exe_all), 'macho_classes': len(macho_all),
        'both': len(both), 'only_exe': len(only_exe), 'only_macho': len(only_macho),
        'gs_exe': len(gs_exe), 'gs_macho': len(gs_macho), 'gs_both': len(gs_exe & gs_macho),
        'only_exe_sample': sorted(only_exe)[:40],
        'only_macho_sample': sorted(only_macho)[:40],
        'only_macho_strings': sorted(gs_macho - gs_exe)[:30],
        'only_exe_strings': sorted(gs_exe - gs_macho)[:30],
    }
    (WS / 'equivalence_summary.json').write_text(
        json.dumps(summary, ensure_ascii=False, indent=2), encoding='utf-8')
    print("\nsummary written: reverse/equivalence_summary.json")

if __name__ == '__main__':
    main()
