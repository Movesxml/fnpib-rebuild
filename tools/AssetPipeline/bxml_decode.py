#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""T-026 Halfbrick bxml 二进制 XML 解码器。

格式实证：Kimi 对 assets_raw/xml/*.xml 的字节级分析（见 DECISIONS / BXML_FORMAT.md）。
本模块只实现已实证的两种节点 marker：

  * 0x01 = 元素节点
  * 0x04 = 文本叶节点

未知 marker 一律报错，不做猜测性扩展。

对外 API::

    is_bxml(data) -> bool
    decode_bxml(data, *, max_depth=64, max_nodes=200_000,
                max_attrs=65_535) -> xml.etree.ElementTree.Element
    BxmlError

严格性
------
* 头、字符串表、字节码全部做越界检查；
* 字符串 offset 必须 < 字符串表大小，且必须能在表内找到 NUL；
  offset 允许落在某个字符串内部（后缀复用），读取到下一个 NUL 为止；
* rootCount 必须大于 0；单根直接返回该元素，多根用 bxmlDocument 包装；
  所有顶层节点必须是元素；
* 解析结束后必须恰好消费到文件末尾，否则报“尾部有未消费字节”；
* 递归深度、节点总数、单元素属性数均有上限，超限抛 BxmlError。

依赖：仅标准库。
"""

from __future__ import annotations

import struct
import xml.etree.ElementTree as ET

MAGIC = b"bxml"
HEADER_SIZE = 12

MARKER_ELEMENT = 0x01
MARKER_TEXT = 0x04

DEFAULT_MAX_DEPTH = 64
DEFAULT_MAX_NODES = 200_000
DEFAULT_MAX_ATTRS = 65_535


class BxmlError(Exception):
    """bxml 结构/边界错误。offset 为出错位置的字节偏移（有则带上）。"""

    def __init__(self, message: str, offset: int | None = None):
        self.offset = offset
        if offset is not None:
            message = f"{message}（字节偏移 {offset}）"
        super().__init__(message)


def is_bxml(data: bytes) -> bool:
    """仅按 magic 判断，不验证长度/内容。"""
    return len(data) >= 4 and data[:4] == MAGIC


class _Decoder:
    def __init__(
        self,
        data: bytes,
        *,
        max_depth: int,
        max_nodes: int,
        max_attrs: int,
    ):
        if not isinstance(data, (bytes, bytearray)):
            raise TypeError(f"bxml 数据必须是 bytes/bytearray，实得 {type(data)!r}")

        self.data = bytes(data)
        self.max_depth = max_depth
        self.max_nodes = max_nodes
        self.max_attrs = max_attrs
        self._node_count = 0

        n = len(self.data)
        if n < HEADER_SIZE:
            raise BxmlError(
                f"文件长度 {n} 小于 bxml 头长度 {HEADER_SIZE}"
            )
        if self.data[:4] != MAGIC:
            raise BxmlError(
                f"magic 不是 bxml（实得 {self.data[:4]!r}）"
            )

        self.header_attr_count = struct.unpack_from("<H", self.data, 4)[0]
        self.header_unknown = struct.unpack_from("<H", self.data, 6)[0]
        self.string_table_size = struct.unpack_from("<I", self.data, 8)[0]

        self.string_table_start = HEADER_SIZE
        self.string_table_end = self.string_table_start + self.string_table_size
        if self.string_table_end > n:
            raise BxmlError(
                f"字符串表越界：12 + {self.string_table_size} = "
                f"{self.string_table_end} > 文件长度 {n}",
                HEADER_SIZE,
            )

        self.cursor = self.string_table_end
        if self.cursor + 4 > n:
            raise BxmlError(
                "字符串表之后缺少 rootCount（u32）",
                self.cursor,
            )
        self.root_count = self._read_u32()

    # ------------------------------------------------------------------ #
    # 基础读取
    # ------------------------------------------------------------------ #

    def _require(self, size: int) -> None:
        if self.cursor + size > len(self.data):
            raise BxmlError(
                f"字节码越界：需要 {size} 字节，剩余 "
                f"{len(self.data) - self.cursor} 字节",
                self.cursor,
            )

    def _read_u8(self) -> int:
        self._require(1)
        value = self.data[self.cursor]
        self.cursor += 1
        return value

    def _read_u32(self) -> int:
        self._require(4)
        value = struct.unpack_from("<I", self.data, self.cursor)[0]
        self.cursor += 4
        return value

    def _read_string(self, offset: int, what: str) -> str:
        if offset >= self.string_table_size:
            raise BxmlError(
                f"{what} 的字符串 offset={offset} 越界"
                f"（字符串表大小 {self.string_table_size}）"
            )

        start = self.string_table_start + offset
        end = self.data.find(b"\x00", start, self.string_table_end)
        if end < 0:
            raise BxmlError(
                f"{what} 的字符串 offset={offset} 在字符串表内没有 NUL 终止符"
            )

        raw = self.data[start:end]
        try:
            return raw.decode("utf-8")
        except UnicodeDecodeError as exc:
            raise BxmlError(
                f"{what} 的字符串 offset={offset} 不是合法 UTF-8：{exc}"
            ) from exc

    # ------------------------------------------------------------------ #
    # 节点解析
    # ------------------------------------------------------------------ #

    def _parse_node(self, depth: int) -> tuple[int, ET.Element | str]:
        if depth > self.max_depth:
            raise BxmlError(
                f"递归深度 {depth} 超过上限 {self.max_depth}（疑似环/恶意数据）",
                self.cursor,
            )

        self._node_count += 1
        if self._node_count > self.max_nodes:
            raise BxmlError(
                f"节点总数超过上限 {self.max_nodes}",
                self.cursor,
            )

        marker_offset = self.cursor
        marker = self._read_u8()

        if marker == MARKER_ELEMENT:
            return MARKER_ELEMENT, self._parse_element_body(depth, marker_offset)

        if marker == MARKER_TEXT:
            text_offset = self._read_u32()
            return MARKER_TEXT, self._read_string(text_offset, "文本叶")

        raise BxmlError(
            f"未知节点 marker=0x{marker:02x}"
            "（仅实证 0x01=元素、0x04=文本叶；不猜测其他 marker）",
            marker_offset,
        )

    def _parse_element_body(self, depth: int, marker_offset: int) -> ET.Element:
        name_offset = self._read_u32()
        tag = self._read_string(name_offset, "元素名")
        if not tag:
            raise BxmlError("元素名为空字符串", marker_offset)

        attr_count = self._read_u32()
        if attr_count > self.max_attrs:
            raise BxmlError(
                f"元素属性数 {attr_count} 超过上限 {self.max_attrs}",
                marker_offset,
            )

        attrib: dict[str, str] = {}
        for index in range(attr_count):
            attr_name_offset = self._read_u32()
            attr_value_offset = self._read_u32()
            attr_name = self._read_string(attr_name_offset, f"属性名[{index}]")
            attr_value = self._read_string(attr_value_offset, f"属性值[{index}]")
            if not attr_name:
                raise BxmlError(f"属性名[{index}] 为空字符串", marker_offset)
            attrib[attr_name] = attr_value

        child_count = self._read_u32()
        element = ET.Element(tag, attrib)

        # 按 ElementTree 语义合并文本叶：
        #   所有元素子节点之前 → element.text
        #   某个元素子节点之后 → 该子节点.tail
        # 连续文本叶直接拼接。
        last_child: ET.Element | None = None
        for _ in range(child_count):
            kind, value = self._parse_node(depth + 1)
            if kind == MARKER_TEXT:
                text = value  # type: ignore[assignment]
                if last_child is None:
                    element.text = (element.text or "") + text
                else:
                    last_child.tail = (last_child.tail or "") + text
            else:
                child = value  # type: ignore[assignment]
                element.append(child)
                last_child = child

        return element

    # ------------------------------------------------------------------ #
    # 入口
    # ------------------------------------------------------------------ #

    def decode(self) -> ET.Element:
        n = len(self.data)

        if self.root_count == 0:
            raise BxmlError(
                "rootCount=0：文档没有根节点",
                self.string_table_end,
            )
        if self.root_count == 1:
            kind, value = self._parse_node(0)
            if kind != MARKER_ELEMENT:
                raise BxmlError(
                    "顶层节点必须是元素（marker=1），实际是文本叶（marker=4）",
                    self.string_table_end,
                )
            result = value  # type: ignore[assignment]
        else:
            # globalProbabilities.xml 实证 rootCount=3。ElementTree 只能持有一个
            # 根，因此用明确的转换层包装节点保留全部顶层元素，不丢弃、不改名。
            result = ET.Element("bxmlDocument")
            for _ in range(self.root_count):
                kind, value = self._parse_node(0)
                if kind != MARKER_ELEMENT:
                    raise BxmlError(
                        "多根文档的顶层节点必须是元素（marker=1）",
                        self.string_table_end,
                    )
                result.append(value)  # type: ignore[arg-type]

        if self.cursor != n:
            raise BxmlError(
                f"尾部有 {n - self.cursor} 字节未消费",
                self.cursor,
            )

        return result


def decode_bxml(
    data: bytes,
    *,
    max_depth: int = DEFAULT_MAX_DEPTH,
    max_nodes: int = DEFAULT_MAX_NODES,
    max_attrs: int = DEFAULT_MAX_ATTRS,
) -> ET.Element:
    """把 bxml 字节解码为 xml.etree.ElementTree 元素。

    失败抛 BxmlError（带出错字节偏移）；成功时保证完整消费输入。
    """
    return _Decoder(
        data,
        max_depth=max_depth,
        max_nodes=max_nodes,
        max_attrs=max_attrs,
    ).decode()


__all__ = [
    "BxmlError",
    "DEFAULT_MAX_ATTRS",
    "DEFAULT_MAX_DEPTH",
    "DEFAULT_MAX_NODES",
    "MARKER_ELEMENT",
    "MARKER_TEXT",
    "decode_bxml",
    "is_bxml",
]