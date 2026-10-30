"""从 exe 提取 Debug 构建残留的源文件路径(__FILE__)与断言串 → 重建源码树视图。"""
import re, zipfile
from collections import defaultdict, Counter

BS = chr(92)  # 反斜杠，避免转义问题
z = zipfile.ZipFile(r'ipa/extracted/FruitNinjaPiB-v1.0412/Payload/FruitNinjaPuss.app/assets.zip')
exe = z.read('FruitNinjaPIB.exe')

paths = re.findall(rb'[A-Za-z]:[\\/\w .\-]{3,120}?\.(?:cpp|h|hpp|cxx|mm|m)(?:\(\d+\))?', exe)
files = defaultdict(int)
for p in paths:
    s = p.decode('ascii', 'ignore')
    s = re.sub(r'\(\d+\)$', '', s)
    s = s.replace('/', BS)
    files[s] += 1

print(f"exe 源文件路径串: {len(paths)} 条, 去重 {len(files)} 个文件\n")
dirs = defaultdict(list)
for f in files:
    parts = f.split(BS)
    dirs[BS.join(parts[:-1])].append(parts[-1])
for d in sorted(dirs):
    print(f"[{d}] ({len(dirs[d])} 文件)")
    for fn in sorted(dirs[d])[:8]:
        print("   ", fn)
    if len(dirs[d]) > 8:
        print(f"    ... 等共 {len(dirs[d])} 个")

print("\n=== 玩法断言/调试串样例 ===")
all_strs = set(s.decode('ascii', 'ignore') for s in re.findall(rb'[\x20-\x7e]{10,140}', exe))
for kw in ['combo', 'slash', 'sliced', 'spawner', 'gravity', 'spawn']:
    hits = sorted(a for a in all_strs if kw.lower() in a.lower()
                  and ('assert' in a.lower() or 'error' in a.lower() or 'invalid' in a.lower()))[:5]
    for h in hits:
        print(f"  [{kw}] {h[:110]}")

# 游戏源码目录关键词统计（定位源码树中的玩法代码区）
gamey = [f for f in files if any(k in f.lower() for k in
         ['fruit', 'slash', 'combo', 'blade', 'game', 'entity', 'component', 'screen', 'mode'])]
print(f"\n=== 玩法相关源文件 ({len(gamey)} 个) ===")
for f in sorted(gamey)[:40]:
    print(f"  {f}  x{files[f]}")

# 游戏侧完整清单 → markdown
game = {f: c for f, c in files.items() if 'fruitninjapuss' in f.lower()}
lines = [f"# Fruit Ninja PiB 游戏侧源文件清单（__FILE__ 恢复）", "",
         f"共 {len(game)} 个文件 / {sum(game.values())} 次引用；引用次数≈该文件内断言/日志点数量，可指示模块复杂度\n"]
from collections import OrderedDict
sub = OrderedDict()
for f in sorted(game):
    rel = f.lower().split('fruitninjapuss' + BS.lower() + 'source' + BS.lower())[-1]
    d = BS.join(rel.split(BS)[:-1]) or '(根目录)'
    sub.setdefault(d, []).append((rel.split(BS)[-1], files[f]))
for d, items in sub.items():
    lines.append(f"## {d}/ ({len(items)} 文件)")
    for fn, c in items:
        lines.append(f"- {fn} (x{c})")
    lines.append("")
out = __file__.replace('extract_source_tree.py', 'game_source_files.md')
open(out, 'w', encoding='utf-8').write(BS.join(lines) if False else "\n".join(lines))
print(f"\nwritten: {out}")
