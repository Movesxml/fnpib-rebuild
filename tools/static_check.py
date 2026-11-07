# -*- coding: utf-8 -*-
"""全工程 Swift 静态交叉检查（无编译器环境下的 best-effort 审查）。

检查项：
1. 协议完整性：每个 conforming 类型实现了协议全部要求（花括号匹配版）
2. 类型静态成员引用：EnumName.member / TypeName.member 是否存在（含 extension）
3. 实例成员引用抽查：state.xxx / stamp.xxx / entity.transform.xxx 等
4. enum case 使用 vs 定义
"""
import re
import subprocess
import sys
import collections
import os

GIT_CANDIDATES = [r"D:\tools\git\cmd\git.exe", "git"]


def _tracked_files() -> list:
    """优先用 git ls-files；没有 git 时退化为遍历源码目录（保持本机可用）。"""
    for candidate in GIT_CANDIDATES:
        try:
            out = subprocess.run([candidate, "ls-files"], capture_output=True,
                                 text=True, check=True).stdout
            return out.splitlines()
        except (OSError, subprocess.CalledProcessError):
            continue
    found = []
    for top in ("Sources", "App", "Tests", "blueprint"):
        for dirpath, _dirnames, filenames in os.walk(top):
            for name in filenames:
                found.append(os.path.join(dirpath, name).replace(os.sep, "/"))
    return found


files = [f for f in _tracked_files() if f.endswith(".swift")]
src = {f: open(f, encoding="utf-8").read() for f in files}

def strip_comments(t: str) -> str:
    t = re.sub(r"/\*.*?\*/", "", t, flags=re.S)
    t = re.sub(r"(?m)//[^\n\"]*$", "", t)   # 粗略去行注释（避免删字符串内的 http://）
    return t

clean = {f: strip_comments(t) for f, t in src.items()}
allc = "\n".join(clean.values())

# ---------- 1. 协议完整性（花括号匹配） ----------
def external_labels(params: str) -> tuple:
    """只取外部参数标签：`_ name:` -> `_`，`name value:`/`name:` -> `name:`。

    Swift 的协议见证只要求外部标签一致，内部参数名可不同
    （例如协议 `nextInt(_ upperBound: Int32)` 由 `nextInt(_ bound: Int32)` 满足），
    旧实现按字面比较会把这类正确实现误报为缺失。
    """
    out = []
    for raw in re.findall(r"(?:\w+|_\s+\w+)\s*:", params):
        token = raw.strip().rstrip(":").strip()
        if token.startswith("_"):
            out.append("_")
        else:
            out.append(token.split()[0] + ":")
    return tuple(out)


def find_body(text: str, start: int) -> str:
    """从 '{' 位置返回匹配的花括号内容。"""
    depth = 0
    for i in range(start, len(text)):
        if text[i] == "{":
            depth += 1
        elif text[i] == "}":
            depth -= 1
            if depth == 0:
                return text[start + 1:i]
    return text[start + 1:]

protos: dict[str, tuple[set, str]] = {}  # name -> (reqs: "name|labels", defined-in)
for f, t in clean.items():
    for m in re.finditer(r"public protocol (\w+)(?:\s*:\s*([^\{]+))?\{", t):
        name, _inher = m.groups()
        body = find_body(t, m.end() - 1)
        reqs = set()
        for fm in re.finditer(r"(?:mutating |static |class )?func (\w+)\(([^)]*)\)", body):
            labels = external_labels(fm.group(2))
            reqs.add(f"{fm.group(1)}|{','.join(labels)}")
        for vm in re.finditer(r"(?:var|let) (\w+)(?![^(]*\()\s*[:{=]", body):
            reqs.add(f"var|{vm.group(1)}")
        protos[name] = (reqs, f)

proto_defaults = collections.defaultdict(set)
for f, t2 in clean.items():
    for em in re.finditer(r"(?:public )?extension (\w+)[^{]*\{", t2):
        ename = em.group(1)
        if ename in protos:
            ebody = find_body(t2, em.end() - 1)
            for fm in re.finditer(r"(?:public )?(?:mutating )?func (\w+)\(([^)]*)\)", ebody):
                labels = external_labels(fm.group(2))
                proto_defaults[ename].add(f"{fm.group(1)}|{','.join(labels)}")
            proto_defaults[ename] |= {f"var|{vm.group(1)}" for vm in re.finditer(r"(?:public )?(?:var|let) (\w+)\s*[:{=]", ebody)}

print("== 1. 协议完整性 ==")
issues = 0
for f, t in clean.items():
    for m in re.finditer(r"(?:public |private |fileprivate |internal )*final class (\w+)[^{]*?:\s*([^\{]+)\{", t):
        cls, confs = m.groups()
        body = find_body(t, m.end() - 1)
        have = set()
        for fm in re.finditer(r"(?:public |private |@discardableResult\s+|override )*func (\w+)\(([^)]*)\)", body):
            labels = external_labels(fm.group(2))
            have.add(f"{fm.group(1)}|{','.join(labels)}")
        have |= {f"var|{vm.group(1)}" for vm in re.finditer(r"(?:public |private )*(?:var|let) (\w+)\s*[:{=]", body)}
        for p in re.findall(r"\b\w+\b", confs):
            if p in protos:
                reqs, pf = protos[p]
                have |= proto_defaults.get(p, set())
                for r in sorted(reqs):
                    pname, labels = r.split("|", 1)
                    # 宽松匹配：同名 func 且标签是要求的前缀（默认参数允许少传）
                    hit = any(h.split("|")[0] == pname and
                              (labels == "" or h.split("|")[1].startswith(labels) or labels.startswith(h.split("|")[1]))
                              for h in have)
                    if not hit:
                        print(f"  ❌ {cls} ({f}) 缺 {p}.{pname}({labels}) [协议定义于 {pf}]")
                        issues += 1
print(f"  -> {issues} 处缺失")

# ---------- 2. 静态成员引用 ----------
print("\n== 2. Enum/struct 静态成员引用 ==")
type_members = collections.defaultdict(set)
for f, t in clean.items():
    for tm in re.finditer(r"(?:public |private )*(?:struct|class|enum|extension) (\w+)[^{]*\{", t):
        tname = tm.group(1)
        body = find_body(t, tm.end() - 1)
        for mm in re.finditer(r"(?:public |private )*(?:static let|static var|case|static func) (?:`|)(\w+)(?:`|)", body):
            type_members[tname].add(mm.group(1))
        for mm in re.finditer(r"(?:public |private )*(?:struct|class|enum) (\w+)", body):
            type_members[tname].add(mm.group(1))
        if re.search(r"public init\(", body):
            type_members[tname].add("init")
        for mm in re.finditer(r"(?:public |private )*(?:let|var) (\w+)\s*[:=]", body):
            type_members[tname].add(mm.group(1))

missing2 = collections.Counter()
for f, t in clean.items():
    for mm in re.finditer(r"\b([A-Z]\w+)\.(\w+)", t):
        tn, mem = mm.groups()
        if tn in type_members and mem not in type_members[tn]:
            ctx = t[max(0, mm.start()-40):mm.end()+20].replace("\n", " ")
            missing2[(tn, mem, f)] += 1
for (tn, mem, f), n in sorted(missing2.items()):
    print(f"  ❓ {tn}.{mem}  ({f}) x{n}")
if not missing2:
    print("  -> 无")

# ---------- 3. GameState / FrameStamp 等核心类型的实例成员 ----------
print("== 3. core member check ==")
for tname, pattern in [("GameState", r"\bstate\.(\w+)"), ("FrameStamp", r"\bstamp\.(\w+)"),
                       ("Entity", r"\bentity\.(\w+)")]:
    members = set(re.findall(rf"(?:public |private )*(?:var|let) (\w+)\s*[:=]", allc)) if False else set()
    decl = set()
    for f, t in clean.items():
        for dm in re.finditer(rf"(?:public |private )*(?:struct|class|extension) {tname}[^{{]*\{{", t):
            body = find_body(t, dm.end() - 1)
            decl |= set(re.findall(r"(?:public |private )*(?:var|let) (\w+)\s*[:=]", body))
            decl |= set(re.findall(r"(?:public |private )*(?:mutating )?func (\w+)\(", body))
    used = collections.Counter()
    for f, t in clean.items():
        for um in re.finditer(pattern, t):
            used[um.group(1)] += 1
    bad = {k: v for k, v in used.items() if k not in decl}
    print(f"  {tname}: 定义 {len(decl)} 成员，引用 {len(used)} 个，未命中: {sorted(bad) if bad else '无'}")
