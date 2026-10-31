# Halfbrick bxml 格式说明（T-026 实证）

状态：`assets_raw/xml` 全量 60 个文件均已完整消费并成功转换；
本文件描述 `tools/AssetPipeline/bxml_decode.py` 实际实现并验证过的子集。

> 真实资产 `assets_raw/xml/*.xml` 是 bxml 二进制容器，不是文本 XML。
> 判断方式：文件前 4 字节为 ASCII `bxml`。

## 1. 总体布局

| 偏移 | 类型 | 字段 | 说明 |
|---:|---|---|---|
| 0 | char[4] | magic | 固定 `bxml` |
| 4 | u16 LE | `headerAttrCount` | 语义未实证；当前解码器不读取、不依赖 |
| 6 | u16 LE | `unknown` | 语义未实证；不参与消费 |
| 8 | u32 LE | `stringTableByteSize` | 字符串表字节数 |
| 12 | bytes[size] | 字符串表 | NUL 结尾的 UTF-8 字符串拼接 |
| 12+size | u32 LE | `rootCount` | 根节点数；已实证样本为 1 或 3 |
| 12+size+4 | nodes | 字节码 | 根节点开始，递归结构见下 |

## 2. 字符串表

- 每条字符串以 `0x00` 结尾，内容为 UTF-8。
- 引用使用 **u32 LE 偏移**，相对字符串表起点（偏移 0 指向表内第一个字节）。
- **后缀复用**：偏移允许落在另一条字符串的内部。读取规则是「从 offset 开始，
  取到下一个 `0x00` 为止」，不要求 offset 恰好是某条字符串的起点。
  例：表内 `fruitInfoFile\0`，offset=5 会解析为 `InfoFile`。
- 解码器要求 `offset < stringTableByteSize`，且表内必须存在终止 NUL；
  不满足即 `BxmlError`。
- UTF-8 按 strict 解码，非法字节立即报错（不静默替换）。

## 3. 节点文法

```
node       := element | text_leaf

element    := 0x01
              u32 nameOffset
              u32 attrCount
              attrCount * (u32 attrNameOffset, u32 attrValueOffset)
              u32 childCount
              childCount * node

text_leaf  := 0x04
              u32 textOffset
```

- `0x01` 元素：名字、属性表、按顺序排列的子节点。
- `0x04` 文本叶：**只有 5 字节**（marker + u32），后面不再跟元素体。
- childCount 包含文本叶；文本叶和元素可以在同一层任意交错。

## 4. rootCount 与根节点

- `rootCount` 是顶层节点数量；真实资产中已实证 1 根和 3 根两种文档。
- `rootCount == 0` → `BxmlError`。
- 单根文档直接返回该元素；顶层是文本叶则报错。
- 多根文档已由 `globalProbabilities.xml`（3 根）实证：用转换层专用
  `bxmlDocument` 元素包装并保留全部顶层元素；顶层文本叶仍拒绝。
- 解析结束后，游标必须恰好等于文件长度；否则报「尾部有未消费字节」。
  这样可以捕获结构理解偏差，而不是静默忽略尾部数据。

## 5. 文本叶与 ElementTree 语义

解码器在构建元素时按 ET 规则合并文本叶：

1. 文本叶出现在所有元素子节点之前 → 设为父元素的 `.text`；
2. 文本叶出现在某个元素子节点之后 → 设为该子元素的 `.tail`；
3. 连续多个文本叶直接拼接（ET 无法区分相邻文本分段）。

`xml_convert.py` 的 `elem_to_obj` 会把非空 `.text` / `.tail` 分别输出为
JSON 的 `"text"` / `"tail"` 字段（纯空白丢弃）。

## 6. 严格性与限制

实现中明确拒绝而不猜测的情况：

- magic 不是 `bxml`；
- 文件短于 12 字节头；
- 字符串表越界；
- 字符串 offset 越界或表内无 NUL；
- 字符串不是合法 UTF-8；
- 未知节点 marker（除 `0x01` / `0x04` 外全部报错）；
- 元素名/属性名为空；
- `rootCount == 0`；
- 顶层节点是文本叶；
- 解析结束后仍有未消费字节；
- 递归深度、节点总数、单元素属性数超过上限。

默认上限（`bxml_decode.py`）：

| 参数 | 默认值 |
|---|---:|
| `max_depth` | 64 |
| `max_nodes` | 200,000 |
| `max_attrs` | 65,535 |

## 7. 合成样例

`xml_convert.py --selftest` 会构造并解码以下合成 bxml：

```xml
<fruitInfoFile version="1.0.4">
  <fruitInfo name="watermelon">12</fruitInfo>
  <InfoFile>hello<note/>tail</InfoFile>
</fruitInfoFile>
```

其中 `InfoFile` 的 nameOffset 指向字符串 `fruitInfoFile` 内部的第 5 字节，
用于验证后缀复用；`note` 的 `tail` 由文本叶触发。

## 8. 未决 / 待验证

- `headerAttrCount` 与根元素实际 attrCount 的关系：当前未使用。若实跑出现
  「完整消费失败」，应优先复核该字段是否参与根属性计数。
- `unknown`（偏移 6 的 u16）语义未知，不参与解析。
- 是否还存在其他 marker（例如整数/布尔叶、数组容器）尚未实证；当前遇到即报错。
- 当前 60 个真实文件只出现已支持的元素与文本叶；其他资产或版本仍需按
  完整消费和未知 marker 检查重新验证。