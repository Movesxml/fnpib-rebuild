# HBR0 容器格式分析（mmd / binmodel）

> 状态：**部分确认、部分推测**。本文只把「在样例字节上直接观察到的事实」标为已确认；
> 未经 Raw/ 下 60 个 mmd 全量复核的结论一律标「推测」或 **[待验证]**。
>
> 依据来源：T-017 前置格式侦察（Kimi）给出的样例字节描述 + 资产清单数量
> （mmd×60、binmodel×46、uiscreen×20、tex×264、xml×68、str×12、ogg×227、ttf×4、vs/fs 各 6）。
> ⚠️ 执行本文件时手上**没有真实 assets.zip**，因此没有做字节级二次复核；
> 所有「下一步验证脚本」都必须在跑过 `extract.py` 之后立即执行并回填结论。
>
> 本文**不实现**解析器本体 —— 那是后续任务卡的范围（建议 T-018）。

---

## 1. 事实清单

| # | 观察 | 置信 |
|---|---|---|
| F1 | 文件以 ASCII 魔数 `HBR0`（4 字节）起头 | 已确认（样例） |
| F2 | 偏移 `0x04` 起 4 字节，样例为小的单调值 → 版本号（u32 LE） | 观察 / 推测 |
| F3 | 偏移 `0x08` 起 4 字节 → 长度字段（u32 LE） | 观察 / 推测 |
| F4 | 其后是「块」的序列，块首字节出现 `0x02 / 0x01 / 0x00` | 观察 |
| F5 | `mmd` 60 个、`binmodel` 46 个 → **数量不等，非 1:1 配对** | 已确认（清单） |
| F6 | `HBR0` 只出现在 `.mmd` 上（其他扩展名是否也用此容器未验证） | **[待验证]** |

命名推测：`HBR0` = **H**alf**B**rick **R**esource 0（引擎内部资源容器标识）。
纯推测，无二进制证据支持，仅作为命名习惯记录。

---

## 2. 容器布局：候选假设

### 假设 A —— 通用 chunk 流（推荐优先验证）

```
offset  size  field
0x00    4     magic  = "HBR0"
0x04    4     version        (u32 LE)
0x08    4     declared_len   (u32 LE)   ← 语义待定，见 §3
0x0C    ...   chunk stream
```

chunk 头候选：

```
[id: u8][len: u32 LE][payload: len bytes]
```

### 假设 B —— 对齐的 chunk 头

```
[id: u8][pad: 3][len: u32 LE][payload: len bytes]        // 8 字节头，4 对齐
```

很多自研引擎为了让 payload 4 字节对齐会插 3 字节 padding。
判别方法：按 A 走一遍，若 `pos` 落点普遍是 `4k+3` 且后续字节恒为 `0x00`，则 B 更可能。

### 假设 C —— 带计数的 chunk 头

```
[id: u8][len: u32 LE][count: u32 LE][payload]
```

判别方法：若某 chunk 的 payload 长度恰好能被 `count` 整除，且 `count` 与
「子块数量 / 顶点数」强相关，则 C 更可能。

> 侦察描述里 `02/01/00` 被记为「层级样例」，存在两种互斥解释：
> **(a) 块类型 ID**（同一 id 在不同文件中反复出现、内容类型稳定）；
> **(b) 嵌套层级深度**（id 沿树严格单调）。
> 判别方法见 §4 脚本的 `id_hist` 统计：若 `id` 取值只有 0/1/2 三种且分布极偏，支持 (b)；
> 若出现更多取值或每种 id 后面接的结构长度分布完全不同，支持 (a)。

---

## 3. 长度字段语义（必须先闭合的问题）

`0x08` 的 4 字节到底是：

| 假设 | 含义 | 自洽判据 |
|---|---|---|
| L1 | 整个文件剩余字节数 | `declared + 12 == filesize` |
| L2 | 整个文件字节数 | `declared == filesize` |
| L3 | 第一个顶层 chunk 的 payload 长度 | `0x0C + 5 + declared == filesize`（假设 A） |
| L4 | 顶层 chunk 数量 | 值应很小（个位数），且远小于 filesize |

`extract.py` 的清点报告已经把这个判定做成了统计：
`inventory.json → mmd.len_hypothesis_hits`，**三种假设各命中多少个文件**一眼可见。
跑完 extract 后先看这个字典，再回来修正本节。

---

## 4. 验证脚本（跑完 extract.py 后立即执行）

把下面存成 `tools/AssetPipeline/_probe_mmd.py`（临时脚本，不纳入正式管线）：

```python
import struct
from collections import Counter
from pathlib import Path

MAGIC = b"HBR0"

def probe(path: Path):
    d = path.read_bytes()
    if d[:4] != MAGIC:
        return {"file": path.name, "error": "bad_magic"}
    ver, declared = struct.unpack_from("<II", d, 4)

    result = {
        "file": path.name,
        "size": len(d),
        "version": ver,
        "declared": declared,
        "L1_declared_plus_12_eq_size": declared + 12 == len(d),
        "L2_declared_eq_size": declared == len(d),
        "L3_first_chunk": None,
        "chunks": [],
    }

    # 按假设 A 走一遍 chunk 流
    pos, ids = 0x0C, Counter()
    while pos + 5 <= len(d):
        cid = d[pos]
        ln = struct.unpack_from("<I", d, pos + 1)[0]
        if pos + 5 + ln > len(d):
            result["chunks"].append({"offset": pos, "id": cid, "len": ln,
                                     "error": "overruns_file"})
            break
        result["chunks"].append({"offset": pos, "id": cid, "len": ln})
        ids[cid] += 1
        pos += 5 + ln

    result["L3_first_chunk"] = (0x0C + 5 + result["chunks"][0]["len"] == len(d)
                               if result["chunks"] else None)
    result["tail_pos"] = pos
    result["tail_slack"] = len(d) - pos
    result["id_hist"] = dict(ids)
    return result

root = Path("build/AssetPipeline/Raw")
rows = [probe(p) for p in sorted(root.rglob("*.mmd"))]
ok = [r for r in rows if "error" not in r]
print(f"probed {len(ok)}/{len(rows)}")
print("version:", Counter(r["version"] for r in ok))
for key in ("L1_declared_plus_12_eq_size", "L2_declared_eq_size", "L3_first_chunk"):
    print(key, Counter(r[key] for r in ok))
print("tail_slack:", Counter(r["tail_slack"] for r in ok))
all_ids = Counter()
for r in ok:
    all_ids.update(r["id_hist"])
print("global id_hist:", dict(sorted(all_ids.items())))
```

判读方式：

- `tail_slack == 0` 的文件占多数 → 假设 A 的 chunk 头 `[u8 id][u32 len]` 正确；
- `tail_slack` 恒为某个小常数（1..3）→ 假设 B 的对齐 padding 成立；
- `L1/L2/L3` 三选一几乎全中 → §3 的长度语义闭合；
- `global id_hist` 只出现 0/1/2 → 侦察里的「02/01/00」更可能是**层级**而非类型 ID。

---

## 5. `mmd` 与 `binmodel` 的关系（推测）

仅基于数量与命名，**无字节级证据**：

| 推测 | 内容 | 反向证据 / 风险 |
|---|---|---|
| S1 | `.mmd` = 模型/材质的**描述层**（树结构：模型 → 网格 → 材质 → 引用），`.binmodel` = 顶点/索引的**数据层** | 60 vs 46 不等 → 有 14 个 mmd 不引用 binmodel（内联数据？共享？） |
| S2 | `.mmd` 自包含（内联顶点数据），`.binmodel` 属于另一类资源 | 若成立，mmd 应显著更大；用 filesize 分布可判 |
| S3 | `binmodel` 也是 `HBR0` 容器，只是扩展名不同 | 用 `extract.py` 的 magic 探针统计可判（当前只探 .mmd） |

**判别动作**：把 §4 脚本的 `rglob("*.mmd")` 改成 `rglob("*.binmodel")` 再跑一次，
看 magic 与 `id_hist` 是否同构。

---

## 6. 完整解析器的接口建议（T-018 用）

### 6.1 Python 侧（构建期校验器）

```python
# tools/AssetPipeline/mmd_parse.py （尚未实现）

class MmdError(Exception): ...

@dataclass(frozen=True)
class MmdHeader:
    magic: bytes          # b"HBR0"
    version: int
    declared_len: int
    chunk_stream_offset: int   # 目前 0x0C

@dataclass
class MmdChunk:
    chunk_id: int
    offset: int           # 头部起始绝对偏移
    header_size: int      # 5 / 8 / 9，由假设 A/B/C 决定
    length: int
    payload: memoryview
    children: list["MmdChunk"]

class MmdReader:
    MAGIC = b"HBR0"

    def __init__(self, data: bytes, *, strict: bool = True) -> None: ...

    @property
    def header(self) -> MmdHeader: ...

    def iter_chunks(self, parent: MmdChunk | None = None) -> Iterator[MmdChunk]:
        """扁平遍历；不递归时用 .children。"""

    def tree(self) -> list[MmdChunk]:
        """按 id/层级假设重建树（假设未闭合前先返回扁平列表）。"""

    def validate(self) -> list[str]:
        """返回自洽性问题列表（空 = 通过）：
           1. magic 正确
           2. declared_len 与 filesize 的关系符合 §3 结论
           3. 每个 chunk 的 offset+header_size+length 不越父边界
           4. 兄弟 chunk 首尾相接、无空洞（padding 假设 B 例外）
           5. 子块长度之和 == 父 payload 长度（若成立 → 容器无 padding）
        """
```

设计原则：
1. **解析器只负责切块，不解释语义**。语义（顶点布局、材质字段）另立 `mmd_semantic.py`，
   避免格式一改全盘推翻。
2. **`strict` 开关**：构建期 `strict=True`，遇到越界立刻抛错；实验期 `strict=False`
   尽力解析并收集 `validate()` 问题，便于对着 60 个文件做统计归纳。
3. **不猜版本**：`version` 只记录不分支；等确认是否会变（当前 1.0.4 版本大概率全同）。
4. 输出中间态用 JSON（`{"file": ..., "chunks": [...]}`）便于人工 diff，
   二进制 payload 不 dump。

### 6.2 Swift 侧（运行时）

如果渲染层最终需要直接读 `mmd`（而不是离线转成 Metal 友好的中间格式），建议：

```swift
// FNPBCore/Formats/MMD.swift
struct MMDHeader { let version: UInt32; let declaredLength: UInt32 }
struct MMDChunk: Sendable { let id: UInt8; let offset: Int; let length: Int }

enum MMDReader {
    static let magic: [UInt8] = [0x48, 0x42, 0x52, 0x30] // HBR0
    static func read(_ data: Data) throws -> (MMDHeader, [MMDChunk])
}
```

**但更推荐离线转成 `.json`（结构）+ `.bin`（顶点缓冲）**，理由：
- iOS 27 端解析自定义容器 = 冷启动时间 + 崩溃面；构建期解析一次即可
- 顶点数据本来就要按 Metal 的 `MTLBuffer` 布局重排（stride/alignment 与 GL 不同）
- 失败早暴露在构建期，而不是玩家设备上

---

## 7. 未决问题（T-018 必须回答）

1. `0x08` 的 4 字节到底是哪种长度语义？（§3 的四选一）
2. chunk 头是 5 / 8 / 9 字节？（假设 A/B/C）
3. `02/01/00` 是类型 ID 还是嵌套层级？（§4 的 `global id_hist`）
4. `HBR0` 是否也用于 `.binmodel` / `.uiscreen`？（扩展名无关性）
5. mmd ↔ binmodel 是否配对？14 个差值怎么解释？
6. 顶点格式：位置/UV/法线/骨骼权重各几位？是否 float16（移动端着色器常见）？
7. 是否含 mip / 索引压缩（如 `u16` 索引上限 65535 会限制单网格顶点数）？

> 建议 T-018 的第一条验收点就是「§4 脚本跑通 60 个 mmd，`tail_slack` 与
> `len_hypothesis_hits` 全部有结论」，而不是直接写解析器 —— 格式没闭合时写解析器
> 会白写一遍。

---

## 8. 与 T-017 其他文件的接口

- `extract.py` 产出 `inventory.json.mmd.len_hypothesis_hits` → 本文 §3 的判据来源
- 本文不做数值/行为层面的还原；玩法常量以 `findings/core_logic_notes.md` 为准
- `tex_convert.py` 的 16bpp 判定结论与 mmd 无关，但两者都依赖「`type` 字节语义未知」
  这一共同问题；两处 manifest 的交叉表可一起看