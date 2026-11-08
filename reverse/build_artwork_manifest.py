"""从 UISF 报告与 assets_png 生成贴图路径清单。

规则（全部可验证，不做模糊匹配）：
  · 引用来自 reverse/uiscreen_reports/*.json 的 properties.texture；
  · 规范化：反斜杠转正斜杠、小写、去掉 textures/ 前缀；
  · 只有「assets_png/textures 下确实存在同名 .png」才算命中；
  · 引用到的 .tex 若在 assets_raw/textures 里存在却没有对应 png ⇒ 抛错（转换缺口）；
  · 引用到的 .tex 连源文件都没有 ⇒ 记入 unresolved（原版同样加载不到）。
"""
import json
import pathlib
import re

ROOT = pathlib.Path(__file__).resolve().parent.parent
REPORTS = ROOT / "reverse" / "uiscreen_reports"
PNG_ROOT = ROOT / "assets_png" / "textures"
TEX_ROOT = ROOT / "assets_raw" / "textures"
OUTPUT = ROOT / "Content" / "artworkManifest.json"


def normalize(reference):
    value = reference.replace("\\", "/").lower()
    if value.startswith("textures/"):
        value = value[len("textures/"):]
    return value


def main():
    pngs = {str(p.relative_to(PNG_ROOT)).replace("\\", "/").lower()
            for p in PNG_ROOT.rglob("*.png")}
    texs = {str(p.relative_to(TEX_ROOT)).replace("\\", "/").lower()
            for p in TEX_ROOT.rglob("*.tex")}

    references = {}
    for report in sorted(REPORTS.glob("*.json")):
        document = json.loads(report.read_text(encoding="utf-8"))
        for component in document.get("components", []):
            texture = (component.get("properties") or {}).get("texture")
            if isinstance(texture, str) and texture:
                references[texture] = references.get(texture, 0) + 1

    resolved = []
    unresolved = []
    for reference in sorted(references):
        relative = normalize(reference)
        png = re.sub(r"\.tex$", ".png", relative)
        if png in pngs:
            resolved.append({"reference": reference, "png": png})
        else:
            if relative in texs:
                raise ValueError(f"source texture exists but no png: {reference}")
            unresolved.append(reference)

    if len(resolved) != 57:
        raise ValueError(f"expected 57 resolved textures, found {len(resolved)}")
    if len(unresolved) != 6:
        raise ValueError(f"expected 6 unresolved textures, found {len(unresolved)}")

    payload = {
        "version": 1,
        "note": "reference 为 UISF 里的原始路径；png 为 assets_png/textures 下的相对路径",
        "resolved": resolved,
        "unresolved": unresolved,
    }
    OUTPUT.write_text(json.dumps(payload, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(f"resolved={len(resolved)} unresolved={len(unresolved)}")


if __name__ == "__main__":
    main()
