# 切割几何 / 碰撞层还原（T-006）

- 主源：`findings/deep_slash_macho.md`（`FUN_00017d74` 615B / `FUN_00017fdc` 681B / `FUN_00009b50` 195B 全量反编译）
- 常量源：`findings/pending_constants_macho.md` / `findings/pending_constants_exe.md`
- 取数协议：类结构/命名 ← exe；数值/行为 ← macho（`binary_equivalence.md`）
- 置信：`H`=函数体内字面量或单一数据流可确证 · `M`=由控制流/比较结构推断 · `L`=依赖数据段或寄存器建模，值/归属未证

> ⚠️ 反编译失真声明：macho 是 **armv7 VFP 单精度 SIMD** 代码，Ghidra 把 d0–d15 的打包传递建模成
> `CONCAT44(extraout_sX, ...)` / `FloatVectorMult(v, 0, 2, 0x20)` 这类形式。**标量与"平方和→开方→比较"
> 的控制流可信（H），但向量各分量在 `off` 中的归属不可 100% 采信（M/[待验证]）**。
> 需要 Frida 动态打点或 Ghidra 重导出才能逐分量确认。

---

## §0 本轮五条结论

1. **切割判定是两段式**：先走引擎碰撞层 `intersect()`（vtable+0xc）拿精确相交结果；若实体形状类型为
   **类型 1（球体）**，再叠加一层「球心距离 + 截面极值点 ± off」的二次确认。非球体形状直接采信引擎结果。
2. **近失（near_miss）= 同一套判定 + 球半径 ×1.5**。1.5f(0x3FC00000) 是**本轮新提取常量**，此前无记录。
3. **`game+0xf0` 是切割半径的平方**（`hitRadius²`），不是之前笔记里的任何字段。这是新增字段，判定链三处都拿它做比较。
4. **`entity_shape->vtable+8() == 1` 是碰撞层的类型分发点**（球体分支），`game_ctx->vtable+0xc(a, b, &out)`
   是引擎精确相交入口，`out` 为交点 vec3。这是碰撞层调用的唯一入口契约。
5. `FUN_00301044` = **sqrtf**；`FUN_00009b50` = **vec3 normalize（原地，返回原长度）**。判定链的开方与归一化全部收敛到这两个函数。

---

## §1 FUN_00017d74 —— 主切割命中测试

### 1.1 前置门控（全部为真才继续，否则返回 0）

| 条件 | 语义 | 置信 |
|---|---|---|
| `param_1 + 0x38 != 0` | game 持有碰撞上下文（slash 形状） | H |
| `0.0 < *(float*)(param_1 + 0xf0)` | **切割半径² > 0**（未禁用/未归零） | H |
| `param_2 != 0` | 实体非空 | H |
| `*(int*)(param_2 + 0x38) != 0` | 实体持有碰撞形状 | H |
| `PTR_DAT_004d9048[0x18] == '\0'` | 全局开关 A 关闭（推测：教程/无敌/暂停） | L [待验证] |
| `PTR_DAT_004d9048[10] == '\0'` | 全局开关 B 关闭（十进制 10 = 0xA） | L [待验证] |

> 这两个字节开关在 `FUN_00017fdc` 中同样出现（同一门控），是**切割判定总开关**，与主循环里的
> `DAT_005d4d74 & 0x40`（特效/调试位）**不是同一回事**。`PTR_DAT_004d9048` 即引擎 Globals 单例，
> 其 `+0x44` 被主循环当作帧 dt 使用（见 §6）。

### 1.2 vtable 分发（碰撞层入口契约）

```c
int   t    = (**(code**)(**(int**)(param_2 + 0x38) + 0x08))();            // shape->getType()
bool  hit0 = (**(code**)(**(int**)(param_1 + 0x38) + 0x0C))(
                 *(int**)(param_1 + 0x38),      // slash 形状（this）
                 *(int**)(param_2 + 0x38),      // 实体形状
                 &local_3c);                    // out: 交点 vec3
```

- `vtable+0x08`：无参 → int。**`== 1` 即球体**，进入二次确认分支；其余值（0/2/3…）直接返回 `hit0`。
- `vtable+0x0C`：`(otherShape, outVec3) → bool`。这是引擎的**通用形状-形状相交**（对应旧笔记里猜的
  `coline/colsphere/triclipper` 家族由这一槽位多态分发，不需要在调用点区分）。

### 1.3 二次确认（仅球体）

记：
- `c_g = *(vec3*)(slashShape + 0x04)`（+4/+8/+0xC，xyz）
- `c_e = *(vec3*)(sphereShape + 0x04)`
- `r   = *(float*)(sphereShape + 0x14)`（**+0x14 = 球半径**）
- `pt  = local_3c/38/34`（引擎输出的交点，相对量）
- `R² = *(float*)(game + 0xf0)`

控制流（H，逐分支可读）：

```
① d² = |c_g − c_e|²
   if (d² < r²)  →  return TRUE            // slash 参考点落在球内，直接命中（跳过一切）
   否则继续                                 // ★ 注意：这是 if(!(d²<r²)) 包裹的长分支

② if (|pt|² < r²) {                         // 交点落在球内 → 计算截面极值偏移
       k   = sqrtf(r² − |pt|²)               // ← FUN_00301044，球在该点的截面圆半径
       n   = normalize( 由 pt/c_e 构造的切向 )  // ← FUN_00009b50，[待验证] 具体构造式
       off = n * k
   } else {
       off = (DAT_0052bfe0, DAT_0052bfe4, DAT_0052bfe8)   // 推测为零向量 [待验证]
   }

③ p⁺ = c_e + pt + off
   if (|c_g − p⁺|² < R²) → return TRUE

④ p⁻ = c_e + pt − off                      // 关于截面圆对称的另一极值
   if (|c_g − p⁻|² < R²) → return TRUE

⑤ return FALSE
```

> 语义解释：球体与「有粗细的 slash 线段（胶囊）」求交。引擎 `intersect` 只给出球面上一点，作者再沿
> 球面截面圆取 **± 两个极值点**，检查它们是否落进 slash 的切割半径 `R`（`R² = game+0xf0`）内。
> 这就是「刀刃有宽度」的判定实现——**不是**点到线段距离公式，而是「球截面两点 vs 胶囊半径」的等价形式。

### 1.4 返回约定

返回 `uint`（0/1）。主循环调用点 `if (FUN_00017d74(g, e) == 1)` 后立即触发 `OnSliced(vtable+0x24)`、
计分、combo 计数（见 `core_logic_notes.md` §1 步骤 6.3）——**与本函数语义吻合，无歧义**。

---

## §2 FUN_00017fdc —— 近失（near_miss）测试

### 2.1 结构对比

门控与 `FUN_00017d74` **完全一致**（含两个全局字节开关）。差异只有一处：

```c
FUN_002ed28c(&local_6c);              // ctor：临时形状对象
local_6c = shape[0]; local_68 = shape[1]; local_64 = shape[2]; local_60 = shape[3];
uStack_5c = shape[4];
local_54  = shape[6]; local_50 = shape[7];
local_58  = shape[5] * 1.5f;          // ★ 半径 +0x14 放大 1.5 倍（0x3FC00000）
iVar1 = FUN_002ed344(local_58, &local_6c, shape, &local_4c);   // 用放大球做相交
if (iVar1 == 1) { ...同 §1.3 的 ②③④二次确认...; }
FUN_002ed304(&local_6c);              // dtor
return iVar1;
```

### 2.2 结论

- **`1.5f` 是近失放大因子**（H，函数体内字面量）。语义：球半径 ×1.5 仍能被切中 → 记为 near_miss。
- 近失**不需要**主判定失败：主循环炸弹循环里 `FUN_00017d74 != 1` 才调 `FUN_00017fdc`（§1 步骤 7），
  因此实际语义是「**差一点切到炸弹**」的危险度统计，而非「切中了但没计分」。
- 形状结构至少有 8 个 dword（0x20 字节）：`+0x14` 半径、`+0x18/+0x1C` 另有含义（近失拷贝但未放大）[待验证]。
- `FUN_002ed28c/000302d304/0002ed344` 属**同一个类**（ctor/dtor/method），是引擎碰撞层的具体实现类，
  疑似 `colSphere`（因为 method 第一参是"半径覆盖值"）。→ 见 §5 函数地图。

---

## §3 FUN_00009b50 —— vec3 normalize

```
输入 v（float*，原地修改），返回原长度 |v|
if (v == 0) return 0
len² = x²+y²+z² ; len = sqrtf(len²)         // ← FUN_00301044
if (len == 0) {                             // 极短向量兜底（sqrt 下溢）
    v *= DAT_00009c14 ; 递归 normalize(v)    // DAT_00009c14 值未读 [待验证]（推测为放大系数）
} else {
    v /= len
}
return len
```

- 主循环用它做「速度 clamp 到 8.0」：取长度 → 超限则归一化后乘 8.0（`core_logic_notes.md` §1.1 `8.0` 条目）。
- **不是点积**（此前 §6 的猜测"模长/点积"应修正为"仅模长/normalize"）。

---

## §4 切割判定完整公式（可直接落代码）

```c
// game+0xf0 = R²（切割半径平方）；shape+0x14 = 球半径；1.5f = 近失放大
bool SlashHitTest(Game* g, Entity* e) {
    if (!g->collisionCtx) return false;
    if (!(g->hitRadius2 > 0.f)) return false;
    if (!e || !e->shape) return false;
    if (g->globals->flag18 || g->globals->flag0A) return false;

    int  type = e->shape->vt->getType();                 // vt+0x08
    bool hit0 = g->collisionCtx->vt->intersect(          // vt+0x0C
                    g->collisionCtx, e->shape, &pt);
    if (type != 1) return hit0;                          // 非球：引擎结果即最终
    if (!hit0)     return false;
    return SphereConfirm(g, e->shape, pt, 1.0f);         // 见下
}

// 近失：同一确认函数，半径放大 1.5
bool SlashNearMiss(Game* g, Entity* e) {
    ...同样门控...
    bool hit0 = TempSphereIntersect(e->shape, e->shape->radius * 1.5f, &pt);
    if (!hit0) return false;
    return SphereConfirm(g, e->shape, pt, 1.5f);
}

bool SphereConfirm(Game* g, Shape* s, Vec3 pt, float scale) {
    Vec3  cg = g->collisionCtx->center;      // +0x04
    Vec3  ce = s->center;                    // +0x04
    float r  = s->radius * scale;            // +0x14
    if (dist2(cg, ce) < r*r) return true;    // ① 参考点在球内
    Vec3 off = {0,0,0};                      // = DAT_0052bfe0/e4/e8 [待验证]
    if (len2(pt) < r*r) {                    // ② 截面极值偏移
        float k = sqrtf(r*r - len2(pt));
        off = normalize(perpDir(ce, pt)) * k;
    }
    return dist2(cg, ce + pt + off) < g->hitRadius2   // ③
        || dist2(cg, ce + pt - off) < g->hitRadius2;  // ④
}
```

> `perpDir()` 的构造式在反编译里被 SIMD 失真遮蔽（`FloatVectorMult(...,0,...)`），标 **[待验证]**；
> 建议用 Frida 在 `FUN_00009b50` 入口 dump 三个 float 参数即可一次确认。

---

## §5 碰撞层函数地图

| 层 | 函数 / 槽位 | 签名（还原） | 角色 | 证据 | 置信 |
|---|---|---|---|---|---|
| 玩法 | `FUN_00017d74` | `uint(Game*, Entity*)` | 切割命中测试 | 主循环 6.3/7/8 调用点 | H |
| 玩法 | `FUN_00017fdc` | `uint(Game*, Entity*)` | 近失测试（1.5×） | 主循环炸弹未中分支 | H |
| 数学 | `FUN_00301044` | `float(float bits)` | `sqrtf` | 被 0x9b50、0x17d74、0x17fdc 用于"平方和→开方" | H |
| 数学 | `FUN_00009b50` | `float(vec3*)` | `normalize`（原地，返长度） | 函数体 + 32 个调用者 | H |
| 碰撞 | `shape->vtbl+0x08` | `int()` | `getShapeType()`，`1`=球体 | 0x17d74 控制流分发 | M |
| 碰撞 | `ctx->vtbl+0x0C` | `bool(self, other, vec3* out)` | 通用形状相交（多态：线/球/三角） | 两函数同契约 | H |
| 碰撞 | `FUN_002ed28c` | `void(Shape*)` | 临时形状 ctor | 0x17fdc 入口 | M |
| 碰撞 | `FUN_002ed304` | `void(Shape*)` | 临时形状 dtor | 0x17fdc 全出口 | M |
| 碰撞 | `FUN_002ed344` | `bool(float radius, Shape*, Shape*, vec3*)` | **参数化半径**的球-形状相交（near-miss 靠它实现放大） | 首参传 `r*1.5` | M |

**各层调用图**

```
主循环 FUN_00016214
 ├─(type=1 水果/type=2 炸弹/type=0 其他)─> FUN_00017d74 ──> shape->vtbl+0x08 (getType)
 │                                                     ──> ctx->vtbl+0x0C   (intersect)  ← 引擎碰撞层
 │                                                     ──> FUN_00301044     (sqrtf)
 │                                                     ──> FUN_00009b50     (normalize)
 └─(仅炸弹未中)──────────────────────────> FUN_00017fdc ──> FUN_002ed28c/304 (临时球 ctor/dtor)
                                                       ──> FUN_002ed344     (放大球 intersect)
                                                       ──> 同 ctx->vtbl+0x0C / sqrtf / normalize
```

> 注：`FUN_002ed344` 与 `ctx->vtbl+0x0C` 可能是同一实现的两种调用形式（前者为静态/带半径重载，
> 后者为虚分发）。**判定二者是否为同一函数体，是下一轮 5 分钟就能做的事**（比对 xref/函数体哈希）。

---

## §6 与既有笔记的差异与订正

| 项 | 既有（core_logic_notes §1/§6） | 本轮结论 | 处理 |
|---|---|---|---|
| `FUN_00009b50` | "模长/点积" | **仅 normalize + 返回模长**，无点积 | 订正 |
| 固定步长 `PTR+0x44` | "dt==0 时兜底步长，值待读" | **是「上一帧 dt 缓存」**，非编译期常量：exe `_DAT_0197f47c` 初值读出 0.0 恰好自证（首帧前为 0） | 语义订正，见 pending_constants |
| `game+0xf0` | 表中无此字段 | **切割半径²（hitRadius²）**，判定链核心 | 新增字段 |
| 切割算法形态 | 推测"线段-球/三角裁剪" | **球体二次确认 = 球心距离 + 截面±极值点 vs 胶囊半径**；非球体直接采信引擎 | 修正 |
| 近失语义 | "无伤划过" | **炸弹擦身**（主循环只在炸弹循环调用），1.5× 半径 | 明确 |
| `§2.1 exe _DAT_016f4094 = 0.25` | [L] 推断 | 实测 **0.4**（0x3ECCCCCD）→ 该地址实为 combo 动画起始值，0.25 在别处 | 订正，见 pending_constants |

---

## §7 未闭合项（本轮无法完成，需明确）

1. **exe 侧 `Fruit`/`SlashEntity` 虚表 `+0x24` 反查 OnSliced：本轮未执行。**
   输入中不含 exe 的 OnSliced 反编译，仅 `FUN_00bda510` 片段出现 `(**(code**)(*piVar4 + 0x24))()`（作用于单例，
   非 Fruit）。**子任务 3 无产出**，需补一轮输入：RTTI `.?AVFruit@@` → COL → vftable → 读 `+0x20/+0x24/+0x28`
   三槽，并对照 `§1.4` 已裁决的「exe 虚表整体多一条」关系。
2. `perpDir()` 精确构造式 —— 需动态打点（见 §4 注）。
3. `FUN_002ed344` vs `ctx->vtbl+0x0C` 是否同体 —— 需 xref 比对。
4. `DAT_0052bfe0/e4/e8` 是否零向量 —— 数据段未读。
5. 实体形状 `+0x18/+0x1C` 字段语义 —— 未定位使用点。