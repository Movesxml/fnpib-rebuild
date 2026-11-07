//
//  FontShim.h — 对 FreeType 的最小 C 封装
//
//  原版发售版静态链入 FreeType 做字形光栅化（findings §3.1）：
//    FT_Open_Face(内存模式) / FT_Get_Char_Index / FT_Load_Glyph(flags=4=FT_LOAD_RENDER) /
//    FT_Get_Kerning / FT_Set_Transform(16.16 单位矩阵)。
//  这里只暴露这几个调用，Swift 侧通过 bridging header 使用。
//
//  注意：FT_New_Memory_Face 不拷贝字体数据，调用方必须在 face 存活期间保住那段内存。
//
#ifndef FN_FONT_SHIM_H
#define FN_FONT_SHIM_H

#include <stddef.h>
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef struct FNFont FNFont;

/// 从内存建 face；成功返回非 NULL。
FNFont *FNFontCreate(const void *bytes, size_t length);

void FNFontDestroy(FNFont *font);

/// 码点 → 字形索引（FT_Get_Char_Index）。
uint32_t FNFontGlyphIndex(FNFont *font, uint32_t codePoint);

/// 设定像素字号（对应原版 FUN_0031ddf8 的设定字号步骤 [待验证]）。
/// 返回 0 成功。
int FNFontSetPixelSize(FNFont *font, uint32_t pixelSize);

/// 字形推进量，单位像素（FT_LOAD_GLYPH 后读 advance.x，16.16 → float）。
double FNFontAdvance(FNFont *font, uint32_t codePoint);

/// 字距，单位像素（FT_Get_Kerning，默认模式）。
double FNFontKerning(FNFont *font, uint32_t left, uint32_t right);

/// 渲染字形灰度位图（FT_LOAD_RENDER，对应原版 load_flags = 4）。
/// 输出 width/rows/pitch 与 8bit 灰度缓冲指针；返回 0 成功。
int FNFontRenderGlyph(FNFont *font, uint32_t codePoint,
                      int *width, int *rows, int *pitch,
                      const uint8_t **buffer);

#ifdef __cplusplus
}
#endif

#endif /* FN_FONT_SHIM_H */
