#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""model_extract.py — T-031 水果 3D 网格提取器

严格解析：
* 54 个 `.mmd`（Mortar HBR0 网格）
* 44 个 `.binmodel`（Mortar 二进制模型，合计 45 个网格）

输出：
* `Content/fruitModels.json`：24 个 FruitInfo 按 typeID 映射 + bomb
* `Content/fruitMeshes.bin`：版本化二进制，保存完整索引/顶点及 JSON 偏移长度

关键约束：
* 不把 UV 包围盒裁图冒充官方 3D 模型；
* 不把 FruitInfo/colours/colour 当模型 tint；
* 不做 UV V 翻转猜测；
* 未知结构直接抛 ModelError，不静默跳过。

CLI：
    python tools/AssetPipeline/model_extract.py \
        --models assets_raw/models/Fruit \
        --fruit-list Content/fruitList.json \
        --out Content

自检：
    python tools/AssetPipeline/model_extract.py --selftest
"""

from __future__ import annotations

import argparse
import base64
import hashlib
import json
import math
import os
import struct
import sys
from dataclasses import dataclass, field
from typing import Dict, List, Optional, Tuple

__version__ = "T-031"

BIN_MAGIC = b"FNPM"
BIN_VERSION = 1
BIN_HEADER_SIZE = 32
VERTEX_STRIDE = 64
INDEX_TYPE_U32 = 1
BINMODEL_END_MARKER = 123456

EXPECTED_MMD_FILES = 54
EXPECTED_BINMODEL_FILES = 44
EXPECTED_BINMODEL_MESHES = 45
EXPECTED_FRUIT_COUNT = 24


class ModelError(Exception):
    """模型格式/边界/计数错误。"""


# ---------------------------------------------------------------------------
# 基础读取器
# ---------------------------------------------------------------------------

class BinReader:
    def __init__(self, data: bytes, path: str):
        self.data = data
        self.path = path
        self.pos = 0

    def remaining(self) -> int:
        return len(self.data) - self.pos

    def need(self, n: int, what: str) -> None:
        if n < 0 or self.pos + n > len(self.data):
            raise ModelError(
                f"{self.path}: truncated at 0x{self.pos:x}, "
                f"need {n} bytes for {what}, total={len(self.data)}"
            )

    def u8(self, what: str) -> int:
        self.need(1, what)
        v = self.data[self.pos]
        self.pos += 1
        return v

    def u32(self, what: str) -> int:
        self.need(4, what)
        v = struct.unpack_from("<I", self.data, self.pos)[0]
        self.pos += 4
        return v

    def f32(self, what: str) -> float:
        self.need(4, what)
        v = struct.unpack_from("<f", self.data, self.pos)[0]
        self.pos += 4
        if not math.isfinite(v):
            raise ModelError(f"{self.path}: non-finite f32 for {what}")
        return v

    def tag(self) -> str:
        n = self.u32("tag length")
        if n < 1 or n > 64:
            raise ModelError(
                f"{self.path}: invalid tag length {n} at 0x{self.pos - 4:x}"
            )
        self.need(n, "tag bytes")
        raw = self.data[self.pos:self.pos + n]
        self.pos += n
        if any(b < 0x20 or b > 0x7E for b in raw):
            raise ModelError(
                f"{self.path}: non-ASCII tag bytes {raw!r} "
                f"at 0x{self.pos - n:x}"
            )
        delimiter = self.u8("tag NUL delimiter")
        if delimiter != 0:
            raise ModelError(
                f"{self.path}: tag {raw!r} lacks NUL delimiter, "
                f"got 0x{delimiter:02x}"
            )
        return raw.decode("ascii")

    def lp_string(self, what: str) -> str:
        n = self.u32(f"{what} length")
        if n > 4096:
            raise ModelError(
                f"{self.path}: {what} length {n} too large at "
                f"0x{self.pos - 4:x}"
            )
        self.need(n, what)
        raw = self.data[self.pos:self.pos + n]
        self.pos += n
        # 长度只计 UTF-8 字节；随后还有一个不计入长度的 NUL 分隔符。
        if b"\x00" in raw:
            raise ModelError(f"{self.path}: {what} contains an interior NUL")
        delimiter = self.u8(f"{what} NUL delimiter")
        if delimiter != 0:
            raise ModelError(
                f"{self.path}: {what} lacks NUL delimiter, "
                f"got 0x{delimiter:02x}"
            )
        try:
            return raw.decode("utf-8")
        except UnicodeDecodeError as e:
            raise ModelError(
                f"{self.path}: {what} is not UTF-8: {raw!r}"
            ) from e

    def expect_tag(self, expected: str) -> None:
        actual = self.tag()
        if actual != expected:
            raise ModelError(
                f"{self.path}: expected tag {expected!r}, got {actual!r} "
                f"at 0x{self.pos:x}"
            )

    def read_int_f32(self, what: str, max_value: int = 10_000_000) -> int:
        f = self.f32(what)
        r = int(round(f))
        if abs(f - r) > 1e-6:
            raise ModelError(f"{self.path}: {what} is not integral: {f}")
        if r < 0 or r > max_value:
            raise ModelError(f"{self.path}: {what} out of range: {r}")
        return r

    def read_index_f32(self, what: str) -> int:
        f = self.f32(what)
        r = int(round(f))
        if abs(f - r) > 1e-6:
            raise ModelError(f"{self.path}: {what} is not integral: {f}")
        if r < 0:
            raise ModelError(f"{self.path}: {what} is negative: {r}")
        return r

    def read_binmodel_vertex(self) -> "Vertex":
        self.need(48, "binmodel vertex")
        vals = struct.unpack_from("<12f", self.data, self.pos)
        self.pos += 48
        for v in vals:
            if not math.isfinite(v):
                raise ModelError(
                    f"{self.path}: non-finite float in binmodel vertex "
                    f"at 0x{self.pos - 48:x}"
                )
        weight = vals[0]
        px, py, pz = vals[1], vals[2], vals[3]
        nx, ny, nz = vals[4], vals[5], vals[6]
        u, v = vals[7], vals[8]
        r, g, b = vals[9], vals[10], vals[11]
        return Vertex(
            px=px, py=py, pz=pz,
            nx=nx, ny=ny, nz=nz,
            u=u, v=v,
            r=r, g=g, b=b, a=1.0,
            weight=weight,
        )


# ---------------------------------------------------------------------------
# 数据模型
# ---------------------------------------------------------------------------

@dataclass
class Vertex:
    px: float
    py: float
    pz: float
    nx: float
    ny: float
    nz: float
    u: float
    v: float
    r: float
    g: float
    b: float
    a: float
    weight: float = 1.0


@dataclass
class MeshData:
    name: str
    parent: str = ""
    material_names: List[str] = field(default_factory=list)
    diffuse_textures: List[str] = field(default_factory=list)
    matrix: Optional[List[float]] = None
    source_topology: str = "triangles"
    source_indices: List[int] = field(default_factory=list)
    triangle_indices: List[int] = field(default_factory=list)
    vertices: List[Vertex] = field(default_factory=list)
    face_count: int = 0
    extra: Dict[str, object] = field(default_factory=dict)


@dataclass
class ModelData:
    rel_path: str
    format: str
    meshes: List[MeshData] = field(default_factory=list)
    top_material_block: Optional[Dict[str, object]] = None
    tail_chunks: List[Dict[str, object]] = field(default_factory=list)
    tail_padding_bytes: int = 0


# ---------------------------------------------------------------------------
# MMD 解析
# ---------------------------------------------------------------------------

def _u32_at(data: bytes, off: int, path: str, what: str) -> int:
    if off < 0 or off + 4 > len(data):
        raise ModelError(
            f"{path}: truncated at 0x{off:x} reading {what}, total={len(data)}"
        )
    return struct.unpack_from("<I", data, off)[0]


def _parse_mmd_tail(data: bytes, start: int, path: str
                    ) -> Tuple[List[Dict[str, object]], int]:
    """完整保留已定界、但语义尚未闭合的 mesh 尾部。

    真实水果 MMD 的尾部是节点/变换数据，不是另一组 HBR0。
    本卡不猜其字段语义；以 base64 原样保存，后续解析器可无损复核。
    """
    tail = data[start:]
    if not tail:
        return [], 0
    if all(b == 0 for b in tail):
        return [], len(tail)
    return [{
        "format": "uninterpreted_node_transform_tail",
        "offset": start,
        "lengthBytes": len(tail),
        "sha256": hashlib.sha256(tail).hexdigest(),
        "encoding": "base64",
        "data": base64.b64encode(tail).decode("ascii"),
    }], 0


def _mmd_material_strings(data: bytes, start: int, end: int,
                          path: str) -> List[str]:
    """提取顶层材质块中由 u16 长度界定的可打印字符串。"""
    strings: List[str] = []
    for off in range(start, end - 2):
        n = struct.unpack_from("<H", data, off)[0]
        if n < 3 or off + 2 + n > end:
            continue
        raw = data[off + 2:off + 2 + n]
        if any(b < 0x20 or b > 0x7e for b in raw):
            continue
        strings.append(raw.decode("ascii"))
    return strings


def parse_mmd(data: bytes, path: str) -> ModelData:
    if len(data) < 16:
        raise ModelError(f"{path}: too short for HBR0")
    if data[0:4] != b"HBR0":
        raise ModelError(f"{path}: missing top-level HBR0 magic")
    top_version = _u32_at(data, 4, path, "top version")
    if top_version != 2:
        raise ModelError(f"{path}: top-level HBR0 version {top_version} != 2")
    top_len = _u32_at(data, 8, path, "top length")

    # 顶层版本 2 的 payload 从 12 开始；与 mesh 之间有 4 字节字段。
    # 该字段并非固定零，语义尚未闭合，原值记录到 topMaterialBlock。
    top_payload_start = 12
    top_payload_end = top_payload_start + top_len
    separator = _u32_at(data, top_payload_end, path, "top/mesh field")
    mesh_start = top_payload_end + 4
    if mesh_start + 16 > len(data):
        raise ModelError(
            f"{path}: mesh header at 0x{mesh_start:x} overruns file"
        )
    if data[mesh_start:mesh_start + 4] != b"HBR0":
        raise ModelError(
            f"{path}: missing mesh HBR0 magic at 0x{mesh_start:x}"
        )
    mesh_version = _u32_at(data, mesh_start + 4, path, "mesh version")
    if mesh_version != 0:
        raise ModelError(
            f"{path}: mesh HBR0 version {mesh_version} != 0 "
            f"at 0x{mesh_start:x}"
        )
    extra_zero = _u32_at(data, mesh_start + 8, path, "mesh extra zero")
    if extra_zero != 0:
        raise ModelError(
            f"{path}: mesh extra field at +8 is not zero: 0x{extra_zero:x}"
        )
    mesh_len = _u32_at(data, mesh_start + 12, path, "mesh length")

    payload_start = mesh_start + 16
    payload_end = payload_start + mesh_len
    if payload_end > len(data):
        raise ModelError(
            f"{path}: mesh payload 0x{payload_start:x}..0x{payload_end:x} "
            f"overruns file length 0x{len(data):x}"
        )

    p = payload_start
    if p + 3 > payload_end:
        raise ModelError(f"{path}: truncated mesh 3-byte parameter")
    mesh_param3 = data[p:p + 3].hex()
    p += 3

    if p + 4 > payload_end:
        raise ModelError(f"{path}: truncated indexCount")
    index_count = struct.unpack_from("<I", data, p)[0]
    p += 4
    if index_count == 0:
        raise ModelError(f"{path}: indexCount == 0")
    if p + index_count * 2 > payload_end:
        raise ModelError(f"{path}: index array overruns mesh payload")
    index_start = p
    indices = list(struct.unpack_from(
        "<%dH" % index_count, data, index_start
    ))
    p = index_start + index_count * 2

    if p + 5 > payload_end:
        raise ModelError(f"{path}: truncated 5-byte mesh parameter")
    mesh_params5 = data[p:p + 5].hex()
    p += 5

    if p + 4 > payload_end:
        raise ModelError(f"{path}: truncated vertexCount")
    vertex_count = struct.unpack_from("<I", data, p)[0]
    p += 4
    if vertex_count == 0:
        raise ModelError(f"{path}: vertexCount == 0")

    vertex_start = p
    vertex_end = vertex_start + vertex_count * 36
    if vertex_end != payload_end:
        raise ModelError(
            f"{path}: vertex end 0x{vertex_end:x} != payload end "
            f"0x{payload_end:x} (vertexCount={vertex_count})"
        )

    vertices: List[Vertex] = []
    for i in range(vertex_count):
        off = vertex_start + i * 36
        u, v = struct.unpack_from("<ff", data, off)
        color_u32 = struct.unpack_from("<I", data, off + 8)[0]
        nx, ny, nz = struct.unpack_from("<fff", data, off + 12)
        px, py, pz = struct.unpack_from("<fff", data, off + 24)
        for f in (u, v, nx, ny, nz, px, py, pz):
            if not math.isfinite(f):
                raise ModelError(
                    f"{path}: non-finite vertex float at 0x{off:x}"
                )
        # “RGBA u32”按 little-endian 字节序解释为 R,G,B,A。
        r = (color_u32 & 0xFF) / 255.0
        g = ((color_u32 >> 8) & 0xFF) / 255.0
        b = ((color_u32 >> 16) & 0xFF) / 255.0
        a = ((color_u32 >> 24) & 0xFF) / 255.0
        vertices.append(Vertex(
            px=px, py=py, pz=pz,
            nx=nx, ny=ny, nz=nz,
            u=u, v=v,
            r=r, g=g, b=b, a=a,
            weight=1.0,
        ))

    for idx in indices:
        if idx >= vertex_count:
            raise ModelError(
                f"{path}: index {idx} >= vertexCount {vertex_count}"
            )

    if index_count % 3:
        raise ModelError(f"{path}: triangle indexCount {index_count} not divisible by 3")
    tail_chunks, tail_pad = _parse_mmd_tail(data, payload_end, path)
    material_strings = _mmd_material_strings(
        data, top_payload_start, top_payload_end, path)
    diffuse_textures = [s.replace("\\", "/") for s in material_strings
                        if s.lower().endswith(".tex")]

    stem = os.path.splitext(os.path.basename(path))[0]
    mesh = MeshData(
        name=stem,
        parent="",
        material_names=[],
        diffuse_textures=diffuse_textures,
        matrix=None,
        source_topology="triangles",
        source_indices=[int(i) for i in indices],
        triangle_indices=[int(i) for i in indices],
        vertices=vertices,
        face_count=index_count // 3,
        extra={
            "meshParam3": mesh_param3,
            "meshParams5": mesh_params5,
            "indexCount": index_count,
        },
    )

    top_payload = data[top_payload_start:top_payload_end]
    top_meta = {
        "length": top_len,
        "topMeshField": separator,
        "topMeshFieldSemantics": "unverified_preserved_verbatim",
        "sha256": hashlib.sha256(top_payload).hexdigest(),
        "encoding": "base64",
        "data": base64.b64encode(top_payload).decode("ascii"),
        "strings": material_strings,
        "parsed": False,
        "note": "MMD top material block preserved verbatim; only bounded "
                "u16 strings and .tex references are extracted",
    }

    return ModelData(
        rel_path=path,
        format="mmd",
        meshes=[mesh],
        top_material_block=top_meta,
        tail_chunks=tail_chunks,
        tail_padding_bytes=tail_pad,
    )


# ---------------------------------------------------------------------------
# binmodel 解析
# ---------------------------------------------------------------------------

def _parse_binmesh(r: BinReader) -> MeshData:
    r.expect_tag("Name")
    name = r.lp_string("Name")

    r.expect_tag("Parent")
    parent = r.lp_string("Parent")

    r.expect_tag("Matcount")
    mat_count = r.read_int_f32("Matcount", max_value=64)

    material_names: List[str] = []
    diffuse_textures: List[str] = []
    materials: List[Dict[str, object]] = []
    scalar_fields = {
        "Twosided", "SpecLevel", "GlossLevel", "ReflectLevel",
        "AmbientLevel", "alpha",
    }
    vector3_fields = {"Ambient", "Diffuse", "Specular"}
    pending_tag: Optional[str] = None

    for mi in range(mat_count):
        if pending_tag is None:
            r.expect_tag("Matname")
        else:
            pending_tag = None
        mat_name = r.lp_string("Matname")
        material_names.append(mat_name)
        material: Dict[str, object] = {"Matname": mat_name}

        while True:
            tag = r.tag()
            if tag == "Matname" or tag == "Faces":
                if tag == "Matname":
                    if mi + 1 >= mat_count:
                        raise ModelError(
                            f"{r.path}: mesh {name!r}: unexpected extra Matname"
                        )
                    pending_tag = tag
                elif mi + 1 != mat_count:
                    raise ModelError(
                        f"{r.path}: mesh {name!r}: Faces before all materials"
                    )
                break
            if tag in material:
                raise ModelError(
                    f"{r.path}: mesh {name!r}: duplicate material field "
                    f"{tag!r} in {mat_name!r}"
                )
            if tag == "DiffuseTex":
                texture = r.lp_string("DiffuseTex")
                material[tag] = texture
                diffuse_textures.append(texture)
            elif tag in scalar_fields:
                material[tag] = r.f32(f"material {mat_name!r} {tag}")
            elif tag in vector3_fields:
                material[tag] = [
                    r.f32(f"material {mat_name!r} {tag}[{axis}]")
                    for axis in range(3)
                ]
            else:
                raise ModelError(
                    f"{r.path}: mesh {name!r}: unsupported material tag "
                    f"{tag!r}"
                )
        materials.append(material)

    if mat_count == 0:
        r.expect_tag("Faces")

    face_count = r.read_int_f32("faceCount", max_value=1_000_000)
    face_indices: List[int] = []
    for _ in range(face_count * 4):
        face_indices.append(r.read_index_f32("face index"))

    r.expect_tag("MATRIX0")
    matrix = [r.f32("matrix") for _ in range(12)]

    r.expect_tag("Verts")
    vertex_count = r.read_int_f32("vertexCount", max_value=10_000_000)

    vertices = [r.read_binmodel_vertex() for _ in range(vertex_count)]

    # 每个顶点数组后有且仅有一个 f32；真实文件并不统一为 255。
    # 其语义尚未闭合，原值保留；边界由后续标签/文件结束标记严格校验。
    vertex_trailer = r.f32("vertex trailer")

    for idx in face_indices:
        if idx >= vertex_count:
            raise ModelError(
                f"{r.path}: mesh {name!r}: face index {idx} >= "
                f"vertexCount {vertex_count}"
            )

    triangle_indices: List[int] = []
    for f in range(face_count):
        i0, i1, i2, i3 = face_indices[f * 4:(f + 1) * 4]
        triangle_indices.extend([i0, i1, i2, i0, i2, i3])

    return MeshData(
        name=name,
        parent=parent,
        material_names=material_names,
        diffuse_textures=diffuse_textures,
        matrix=matrix,
        source_topology="quads",
        source_indices=face_indices,
        triangle_indices=triangle_indices,
        vertices=vertices,
        face_count=face_count,
        extra={
            "materials": materials,
            "vertexTrailer": vertex_trailer,
            "vertexTrailerSemantics": "unverified_preserved_verbatim",
        },
    )


def parse_binmodel(data: bytes, path: str) -> ModelData:
    r = BinReader(data, path)
    r.expect_tag("HalfBrickMesh")
    r.expect_tag("Version")
    version = r.f32("binmodel Version")
    if abs(version - 1.0) > 1e-6:
        raise ModelError(f"{path}: binmodel Version {version} != 1.0")
    r.expect_tag("Meshcount")
    mesh_count = r.u32("Meshcount")
    if mesh_count > 256:
        raise ModelError(f"{path}: Meshcount {mesh_count} > 256")
    if mesh_count < 1:
        raise ModelError(f"{path}: Meshcount {mesh_count} < 1")

    meshes = [_parse_binmesh(r) for _ in range(mesh_count)]

    end = r.u32("end marker")
    if end != BINMODEL_END_MARKER:
        raise ModelError(
            f"{path}: end marker {end} != {BINMODEL_END_MARKER} "
            f"at 0x{r.pos - 4:x}"
        )
    if r.remaining() != 0:
        raise ModelError(
            f"{path}: {r.remaining()} trailing bytes after end marker"
        )

    return ModelData(
        rel_path=path,
        format="binmodel",
        meshes=meshes,
    )


# ---------------------------------------------------------------------------
# 文件索引 / fruitList
# ---------------------------------------------------------------------------

def build_file_index(models_root: str) -> Dict[str, str]:
    if not os.path.isdir(models_root):
        raise ModelError(f"models root is not a directory: {models_root}")
    index: Dict[str, str] = {}
    for base, dirs, names in os.walk(models_root):
        dirs.sort()
        for name in sorted(names):
            low = name.lower()
            if not (low.endswith(".mmd") or low.endswith(".binmodel")):
                continue
            rel = os.path.relpath(os.path.join(base, name), models_root)
            rel = rel.replace("\\", "/")
            key = low
            if key in index:
                raise ModelError(
                    f"duplicate model basename {name!r}: "
                    f"{index[key]!r} vs {rel!r}"
                )
            index[key] = rel
    return index


def _load_model(models_root: str, rel: str) -> ModelData:
    path = os.path.join(models_root, rel)
    try:
        with open(path, "rb") as f:
            data = f.read()
    except OSError as e:
        raise ModelError(f"cannot read model {rel}: {e}") from e
    if rel.lower().endswith(".mmd"):
        return parse_mmd(data, rel)
    if rel.lower().endswith(".binmodel"):
        return parse_binmodel(data, rel)
    raise ModelError(f"unsupported model extension: {rel}")


def load_fruit_list(path: str) -> List[dict]:
    try:
        with open(path, "r", encoding="utf-8") as f:
            doc = json.load(f)
    except (OSError, json.JSONDecodeError) as e:
        raise ModelError(f"cannot read fruitList.json: {e}") from e

    root = doc.get("root")
    if not isinstance(root, dict):
        raise ModelError("fruitList.json: missing root object")
    children = root.get("children")
    if not isinstance(children, list):
        raise ModelError("fruitList.json: missing root.children")

    fruits = [c for c in children
              if isinstance(c, dict) and c.get("tag") == "FruitInfo"]
    if len(fruits) != EXPECTED_FRUIT_COUNT:
        raise ModelError(
            f"fruitList.json: expected {EXPECTED_FRUIT_COUNT} FruitInfo, "
            f"got {len(fruits)}"
        )
    for i, info in enumerate(fruits):
        attrs = info.get("attrs")
        if not isinstance(attrs, dict) or not attrs.get("name"):
            raise ModelError(f"fruitList.json: FruitInfo[{i}] missing name")
    return fruits


def _juice_colour(info: dict) -> List[int]:
    name = info.get("attrs", {}).get("name", "?")
    for child in info.get("children", []) or []:
        if child.get("tag") != "colours":
            continue
        s = child.get("attrs", {}).get("colour")
        if s is None:
            continue
        try:
            parts = [int(x.strip()) for x in s.split(",")]
        except ValueError as e:
            raise ModelError(
                f"FruitInfo {name!r}: invalid colour {s!r}"
            ) from e
        if len(parts) != 4 or any(p < 0 or p > 255 for p in parts):
            raise ModelError(
                f"FruitInfo {name!r}: colour must be 4 bytes 0..255, got {s!r}"
            )
        return parts
    raise ModelError(f"FruitInfo {name!r}: missing colours/colour")


def resolve_fruit_model(name: str, attrs: dict,
                        index: Dict[str, str]) -> str:
    base = attrs.get("modelName") or name
    if isinstance(base, str) and base.startswith("super_"):
        base = base[6:]
    candidates = [
        f"{base}_single.mmd",
        f"{base}_single.binmodel",
        f"{base}.mmd",
        f"{base}.binmodel",
    ]
    for cand in candidates:
        rel = index.get(cand.lower())
        if rel is not None:
            return rel
    raise ModelError(
        f"FruitInfo {name!r}: no model found for base {base!r}; "
        f"tried {candidates}"
    )


def resolve_bomb_model(index: Dict[str, str]) -> str:
    candidates = [
        "Bomb.mmd",
        "Bomb.binmodel",
        "bomb.mmd",
        "bomb.binmodel",
        "bomb_single.mmd",
        "bomb_single.binmodel",
    ]
    for cand in candidates:
        rel = index.get(cand.lower())
        if rel is not None:
            return rel
    raise ModelError(f"bomb model not found; tried {candidates}")


# ---------------------------------------------------------------------------
# JSON / BIN 输出
# ---------------------------------------------------------------------------

def uv_bounds(vertices: List[Vertex]) -> Dict[str, float]:
    if not vertices:
        raise ModelError("uv_bounds: empty vertex list")
    us = [v.u for v in vertices]
    vs = [v.v for v in vertices]
    return {
        "minU": min(us),
        "minV": min(vs),
        "maxU": max(us),
        "maxV": max(vs),
    }


def union_uv_bounds(meshes: List[MeshData]) -> Dict[str, float]:
    if not meshes:
        raise ModelError("union_uv_bounds: empty mesh list")
    bs = [uv_bounds(m.vertices) for m in meshes]
    return {
        "minU": min(b["minU"] for b in bs),
        "minV": min(b["minV"] for b in bs),
        "maxU": max(b["maxU"] for b in bs),
        "maxV": max(b["maxV"] for b in bs),
    }


def mesh_to_json(mesh: MeshData) -> dict:
    d = {
        "name": mesh.name,
        "parent": mesh.parent,
        "materialNames": list(mesh.material_names),
        "diffuseTextures": list(mesh.diffuse_textures),
        "diffuseTex": (mesh.diffuse_textures[0]
                       if mesh.diffuse_textures else None),
        "sourceTopology": mesh.source_topology,
        "faceCount": mesh.face_count,
        "sourceIndexCount": len(mesh.source_indices),
        "triangleIndexCount": len(mesh.triangle_indices),
        "vertexCount": len(mesh.vertices),
        "uvBounds": uv_bounds(mesh.vertices),
        "bin": {},
    }
    if mesh.matrix is not None:
        d["matrix"] = list(mesh.matrix)
    d.update(mesh.extra)
    return d


def build_model_json(model: ModelData) -> Tuple[dict, List[Tuple[MeshData, dict]]]:
    mesh_jsons: List[dict] = []
    refs: List[Tuple[MeshData, dict]] = []
    for m in model.meshes:
        js = mesh_to_json(m)
        mesh_jsons.append(js)
        refs.append((m, js))
    d = {
        "modelFile": model.rel_path,
        "modelFormat": model.format,
        "meshCount": len(model.meshes),
        "uvBounds": union_uv_bounds(model.meshes),
        "meshes": mesh_jsons,
    }
    if model.top_material_block is not None:
        d["topMaterialBlock"] = model.top_material_block
    if model.tail_chunks:
        d["tailChunks"] = model.tail_chunks
    if model.tail_padding_bytes:
        d["tailPaddingBytes"] = model.tail_padding_bytes
    return d, refs


def _align16(buf: bytearray) -> None:
    while len(buf) % 16:
        buf.append(0)


def _pack_vertex(v: Vertex) -> bytes:
    return struct.pack(
        "<16f",
        v.px, v.py, v.pz,
        v.nx, v.ny, v.nz,
        v.u, v.v,
        v.r, v.g, v.b, v.a,
        v.weight,
        0.0, 0.0, 0.0,
    )


def write_fruit_meshes_bin(entries: List[Tuple[MeshData, dict]],
                           path: str) -> dict:
    buf = bytearray(BIN_HEADER_SIZE)

    for mesh, js in entries:
        _align16(buf)
        src_off = len(buf)
        src = mesh.source_indices
        if src:
            buf += struct.pack("<%dI" % len(src), *src)
        js["bin"]["sourceIndices"] = {
            "offset": src_off,
            "lengthBytes": len(src) * 4,
            "count": len(src),
        }

        _align16(buf)
        tri_off = len(buf)
        tri = mesh.triangle_indices
        if tri:
            buf += struct.pack("<%dI" % len(tri), *tri)
        js["bin"]["triangleIndices"] = {
            "offset": tri_off,
            "lengthBytes": len(tri) * 4,
            "count": len(tri),
        }

        _align16(buf)
        vert_off = len(buf)
        for v in mesh.vertices:
            buf += _pack_vertex(v)
        js["bin"]["vertices"] = {
            "offset": vert_off,
            "lengthBytes": len(mesh.vertices) * VERTEX_STRIDE,
            "count": len(mesh.vertices),
            "stride": VERTEX_STRIDE,
        }

    struct.pack_into(
        "<4sIIIII8x",
        buf, 0,
        BIN_MAGIC,
        BIN_VERSION,
        BIN_HEADER_SIZE,
        len(entries),
        VERTEX_STRIDE,
        INDEX_TYPE_U32,
    )

    d = os.path.dirname(path)
    if d:
        os.makedirs(d, exist_ok=True)
    with open(path, "wb") as f:
        f.write(buf)

    return {
        "file": os.path.basename(path),
        "version": BIN_VERSION,
        "headerBytes": BIN_HEADER_SIZE,
        "meshCount": len(entries),
        "vertexStride": VERTEX_STRIDE,
        "indexType": "u32",
        "bytes": len(buf),
    }


# ---------------------------------------------------------------------------
# 主提取流程
# ---------------------------------------------------------------------------

def extract(models_root: str, fruit_list_path: str, out_dir: str) -> dict:
    index = build_file_index(models_root)

    mmd_rels = sorted([rel for rel in index.values()
                       if rel.lower().endswith(".mmd")])
    bin_rels = sorted([rel for rel in index.values()
                       if rel.lower().endswith(".binmodel")])

    if len(mmd_rels) != EXPECTED_MMD_FILES:
        raise ModelError(
            f"expected {EXPECTED_MMD_FILES} MMD files, got {len(mmd_rels)}"
        )
    if len(bin_rels) != EXPECTED_BINMODEL_FILES:
        raise ModelError(
            f"expected {EXPECTED_BINMODEL_FILES} binmodel files, "
            f"got {len(bin_rels)}"
        )

    cache: Dict[str, ModelData] = {}
    for rel in mmd_rels + bin_rels:
        cache[rel] = _load_model(models_root, rel)

    bin_mesh_total = sum(len(cache[rel].meshes) for rel in bin_rels)
    if bin_mesh_total != EXPECTED_BINMODEL_MESHES:
        raise ModelError(
            f"expected {EXPECTED_BINMODEL_MESHES} binmodel meshes, "
            f"got {bin_mesh_total}"
        )

    fruits = load_fruit_list(fruit_list_path)

    mesh_refs: List[Tuple[MeshData, dict]] = []
    fruit_entries: List[dict] = []

    for type_id, info in enumerate(fruits):
        attrs = info.get("attrs", {})
        name = attrs["name"]
        rel = resolve_fruit_model(name, attrs, index)
        model = cache[rel]
        model_json, refs = build_model_json(model)
        mesh_refs.extend(refs)
        entry = {
            "typeID": type_id,
            "name": name,
            "juiceColour": _juice_colour(info),
            "juiceColourRole": "juice_splash_not_tint",
            **model_json,
        }
        fruit_entries.append(entry)

    if len(fruit_entries) != EXPECTED_FRUIT_COUNT:
        raise ModelError(
            f"expected {EXPECTED_FRUIT_COUNT} fruit entries, "
            f"got {len(fruit_entries)}"
        )

    bomb_rel = resolve_bomb_model(index)
    bomb_model = cache[bomb_rel]
    bomb_json, bomb_refs = build_model_json(bomb_model)
    mesh_refs.extend(bomb_refs)
    bomb_entry = {
        "typeID": None,
        "name": "bomb",
        "juiceColour": None,
        "juiceColourRole": "not_applicable",
        "note": "bomb is not a FruitInfo; source model resolved separately",
        **bomb_json,
    }

    os.makedirs(out_dir, exist_ok=True)
    bin_path = os.path.join(out_dir, "fruitMeshes.bin")
    bin_summary = write_fruit_meshes_bin(mesh_refs, bin_path)

    out_doc = {
        "tool": "model_extract.py",
        "version": __version__,
        "sourceModels": os.path.abspath(models_root),
        "sourceFruitList": os.path.abspath(fruit_list_path),
        "binary": bin_summary,
        "notes": {
            "uvOrientation": "UV copied verbatim; no V flip applied in this "
                             "tool (render-time test required)",
            "juiceColour": "FruitInfo/colours/colour is juice/splash RGBA, "
                           "NOT a model tint",
            "modelSource": "original MMD/binmodel meshes; UV bounds are "
                           "metadata only, not cropped official sprites",
            "mmdVertexColor": "RGBA8 packed u32 interpreted as R,G,B,A bytes, "
                              "normalized to 0..1",
            "binmodelVertexColor": "RGB f32 copied verbatim",
            "binmodelTopology": "source quads preserved in sourceIndices; "
                                "triangleIndices = (i0,i1,i2)+(i0,i2,i3)",
            "vertexStride": VERTEX_STRIDE,
            "vertexLayout": "pos3 f32, normal3 f32, uv2 f32, color4 f32, "
                            "weight f32, reserved3 f32",
        },
        "fruits": fruit_entries,
        "bomb": bomb_entry,
    }

    json_path = os.path.join(out_dir, "fruitModels.json")
    with open(json_path, "w", encoding="utf-8") as f:
        json.dump(out_doc, f, ensure_ascii=False, indent=2)

    return {
        "tool": "model_extract.py",
        "version": __version__,
        "counts": {
            "mmdFiles": len(mmd_rels),
            "binmodelFiles": len(bin_rels),
            "binmodelMeshes": bin_mesh_total,
            "fruitModels": len(fruit_entries),
            "bombModels": 1,
            "meshRecordsInBin": len(mesh_refs),
        },
        "binary": bin_summary,
        "json": os.path.basename(json_path),
    }


# ---------------------------------------------------------------------------
# selftest
# ---------------------------------------------------------------------------

def _tag(s: str) -> bytes:
    b = s.encode("ascii")
    return struct.pack("<I", len(b)) + b + b"\x00"


def _lp(s: str) -> bytes:
    b = s.encode("utf-8")
    return struct.pack("<I", len(b)) + b + b"\x00"


def _build_synthetic_mmd(indices: Tuple[int, int, int] = (0, 1, 2),
                         tail: bytes = b"") -> bytes:
    top_payload = b"\x00" * 4
    top = (b"HBR0" + struct.pack("<I", 2)
           + struct.pack("<I", len(top_payload)))

    verts = [
        (0.0, 0.0, 0xFFFFFFFF, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0),
        (1.0, 0.0, 0xFF00FF00, 0.0, 0.0, 1.0, 1.0, 0.0, 0.0),
        (0.0, 1.0, 0xFF0000FF, 0.0, 0.0, 1.0, 0.0, 1.0, 0.0),
    ]

    payload = bytearray()
    payload += b"\x01\x02\x03"
    payload += struct.pack("<I", len(indices))
    payload += struct.pack("<%dH" % len(indices), *indices)
    payload += b"\x00" * 5
    payload += struct.pack("<I", len(verts))
    for u, v, color, nx, ny, nz, px, py, pz in verts:
        payload += struct.pack(
            "<ffIffffff",
            u, v, color, nx, ny, nz, px, py, pz,
        )

    mesh = (b"HBR0" + struct.pack("<I", 0)
            + struct.pack("<I", 0)
            + struct.pack("<I", len(payload)))
    return (top + top_payload + struct.pack("<I", 0)
            + mesh + bytes(payload) + tail)


def _binmodel_vertex(w: float, px: float, py: float, pz: float,
                     nx: float, ny: float, nz: float,
                     u: float, v: float,
                     r: float, g: float, b: float) -> Tuple[float, ...]:
    return (w, px, py, pz, nx, ny, nz, u, v, r, g, b)


def _build_synthetic_binmodel(meshes: List[dict],
                              end_marker: int = BINMODEL_END_MARKER,
                              terminator: float = 255.0,
                              bad_faces_tag: bool = False,
                              unknown_material_tag: bool = False) -> bytes:
    buf = bytearray()
    buf += _tag("HalfBrickMesh")
    buf += _tag("Version") + struct.pack("<f", 1.0)
    buf += _tag("Meshcount")
    buf += struct.pack("<I", len(meshes))

    for mesh in meshes:
        buf += _tag("Name") + _lp(mesh["name"])
        buf += _tag("Parent") + _lp(mesh.get("parent", ""))
        materials = mesh.get("materials", [("mat0", "textures/fruits/x.tex")])
        buf += _tag("Matcount")
        buf += struct.pack("<f", float(len(materials)))
        for mat_name, tex in materials:
            buf += _tag("Matname") + _lp(mat_name)
            if unknown_material_tag:
                buf += _tag("BogusMaterialField")
            if tex is not None:
                buf += _tag("DiffuseTex") + _lp(tex)

        if bad_faces_tag:
            buf += _tag("BadFaces")
        else:
            buf += _tag("Faces")
        faces = mesh["faces"]
        buf += struct.pack("<f", float(len(faces)))
        flat: List[float] = []
        for face in faces:
            flat.extend([float(x) for x in face])
        buf += struct.pack("<%df" % len(flat), *flat)

        buf += _tag("MATRIX0")
        buf += struct.pack("<12f", *[float(x) for x in range(12)])

        buf += _tag("Verts")
        verts = mesh["vertices"]
        buf += struct.pack("<f", float(len(verts)))
        for v in verts:
            buf += struct.pack("<12f", *v)
        buf += struct.pack("<f", terminator)

    buf += struct.pack("<I", end_marker)
    return bytes(buf)


def _synthetic_binmesh(name: str = "watermelon",
                       diffuse: str = "textures/fruits/watermelon.tex",
                       faces: Tuple[Tuple[int, int, int, int], ...] = ((0, 1, 2, 3),),
                       vertex_count: int = 4) -> dict:
    verts = []
    for i in range(vertex_count):
        verts.append(_binmodel_vertex(
            1.0, float(i), float(i) * 2, 0.0,
            0.0, 0.0, 1.0,
            float(i) * 0.1, float(i) * 0.2,
            1.0, 0.0, 0.0,
        ))
    return {
        "name": name,
        "materials": [("mat0", diffuse)],
        "faces": faces,
        "vertices": verts,
    }


def selftest() -> bool:
    ok = True

    def check(name: str, cond: bool, detail=None) -> None:
        nonlocal ok
        if cond:
            print(f"[PASS] {name}")
        else:
            ok = False
            print(f"[FAIL] {name}  {detail!r}")

    def expect_error(name: str, fn) -> None:
        nonlocal ok
        try:
            fn()
        except ModelError:
            print(f"[PASS] {name}")
        else:
            ok = False
            print(f"[FAIL] {name}  expected ModelError")

    # ---------------- MMD 正例 ----------------
    mmd = _build_synthetic_mmd()
    m = parse_mmd(mmd, "synthetic.mmd")
    check("MMD mesh count", len(m.meshes) == 1, len(m.meshes))
    mesh = m.meshes[0]
    check("MMD indices", mesh.source_indices == [0, 1, 2],
          mesh.source_indices)
    check("MMD triangles same", mesh.triangle_indices == [0, 1, 2],
          mesh.triangle_indices)
    check("MMD vertex count", len(mesh.vertices) == 3, len(mesh.vertices))
    check("MMD uv0", abs(mesh.vertices[0].u - 0.0) < 1e-6,
          mesh.vertices[0].u)
    check("MMD uv1", abs(mesh.vertices[1].u - 1.0) < 1e-6,
          mesh.vertices[1].u)
    check("MMD color1", abs(mesh.vertices[1].g - 1.0) < 1e-6,
          mesh.vertices[1].g)
    check("MMD top block hashed", m.top_material_block is not None)

    # ---------------- MMD 反例 ----------------
    expect_error("MMD bad magic",
                 lambda: parse_mmd(b"BAD!" + mmd[4:], "bad.mmd"))
    expect_error("MMD index out of range",
                 lambda: parse_mmd(_build_synthetic_mmd(indices=(0, 1, 9)),
                                   "bad_index.mmd"))
    expect_error("MMD truncated",
                 lambda: parse_mmd(mmd[:-1], "truncated.mmd"))
    mmd_tail = parse_mmd(_build_synthetic_mmd(tail=b"XXXX"), "tail.mmd")
    check("MMD ordinary tail preserved verbatim",
          len(mmd_tail.tail_chunks) == 1
          and mmd_tail.tail_chunks[0]["data"]
          == base64.b64encode(b"XXXX").decode("ascii"),
          mmd_tail.tail_chunks)

    # ---------------- binmodel 正例 ----------------
    bm = _build_synthetic_binmodel([_synthetic_binmesh()])
    b = parse_binmodel(bm, "watermelon_single.binmodel")
    check("binmodel mesh count", len(b.meshes) == 1, len(b.meshes))
    bmesh = b.meshes[0]
    check("binmodel name", bmesh.name == "watermelon", bmesh.name)
    check("binmodel topology", bmesh.source_topology == "quads",
          bmesh.source_topology)
    check("binmodel source indices", bmesh.source_indices == [0, 1, 2, 3],
          bmesh.source_indices)
    check("binmodel triangle indices",
          bmesh.triangle_indices == [0, 1, 2, 0, 2, 3],
          bmesh.triangle_indices)
    check("binmodel face count", bmesh.face_count == 1, bmesh.face_count)
    check("binmodel diffuse", bmesh.diffuse_textures == [
        "textures/fruits/watermelon.tex"
    ], bmesh.diffuse_textures)
    check("binmodel uv1", abs(bmesh.vertices[1].u - 0.1) < 1e-6,
          bmesh.vertices[1].u)
    check("binmodel color0", abs(bmesh.vertices[0].r - 1.0) < 1e-6,
          bmesh.vertices[0].r)

    # ---------------- binmodel 多网格 ----------------
    bm2 = _build_synthetic_binmodel([
        _synthetic_binmesh("chest", "textures/chest.tex"),
        _synthetic_binmesh("chestRays", "textures/effects/chestRays.tex"),
    ])
    b2 = parse_binmodel(bm2, "chest_c_piece_2.binmodel")
    check("binmodel multi mesh count", len(b2.meshes) == 2, len(b2.meshes))
    check("binmodel second name", b2.meshes[1].name == "chestRays",
          b2.meshes[1].name)
    check("binmodel second diffuse",
          b2.meshes[1].diffuse_textures == [
              "textures/effects/chestRays.tex"
          ], b2.meshes[1].diffuse_textures)

    # ---------------- binmodel 反例 ----------------
    expect_error("binmodel bad end marker",
                 lambda: parse_binmodel(
                     _build_synthetic_binmodel([_synthetic_binmesh()],
                                               end_marker=999),
                     "bad_end.binmodel"))
    expect_error("binmodel bad faces tag",
                 lambda: parse_binmodel(
                     _build_synthetic_binmodel([_synthetic_binmesh()],
                                               bad_faces_tag=True),
                     "bad_faces.binmodel"))
    variable_trailer = parse_binmodel(
        _build_synthetic_binmodel([_synthetic_binmesh()], terminator=254.0),
        "variable_trailer.binmodel")
    check("binmodel variable vertex trailer preserved",
          variable_trailer.meshes[0].extra["vertexTrailer"] == 254.0,
          variable_trailer.meshes[0].extra)
    expect_error("binmodel unknown material tag",
                 lambda: parse_binmodel(
                     _build_synthetic_binmodel([_synthetic_binmesh()],
                                               unknown_material_tag=True),
                     "bad_mat.binmodel"))
    expect_error("binmodel face index out of range",
                 lambda: parse_binmodel(
                     _build_synthetic_binmodel([
                         _synthetic_binmesh(faces=((0, 1, 2, 9),))
                     ]),
                     "bad_face_index.binmodel"))
    expect_error("binmodel trailing bytes",
                 lambda: parse_binmodel(bm + b"ZZZZ",
                                        "trailing.binmodel"))

    print("")
    print("[SELFTEST] " + ("PASS" if ok else "FAIL"))
    return ok


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------

def main(argv: Optional[List[str]] = None) -> int:
    ap = argparse.ArgumentParser(
        description="T-031 水果 MMD/binmodel 网格提取器")
    ap.add_argument("--models", default="assets_raw/models/Fruit",
                    help="模型根目录（默认 assets_raw/models/Fruit）")
    ap.add_argument("--fruit-list", default="Content/fruitList.json",
                    help="fruitList.json 路径（默认 Content/fruitList.json）")
    ap.add_argument("--out", default="Content",
                    help="输出目录（默认 Content）")
    ap.add_argument("--selftest", action="store_true",
                    help="跑合成样本自检（含损坏输入）")
    args = ap.parse_args(argv)

    if args.selftest:
        return 0 if selftest() else 1

    try:
        summary = extract(args.models, args.fruit_list, args.out)
    except ModelError as e:
        print(f"[ERROR] {e}", file=sys.stderr)
        return 1

    print(json.dumps(summary, ensure_ascii=False, indent=2))
    c = summary["counts"]
    print(f"[SUMMARY] mmd={c['mmdFiles']} binmodelFiles={c['binmodelFiles']} "
          f"binmodelMeshes={c['binmodelMeshes']} fruits={c['fruitModels']} "
          f"bomb={c['bombModels']} meshRecordsInBin={c['meshRecordsInBin']}",
          file=sys.stderr)
    return 0


if __name__ == "__main__":
    sys.exit(main())