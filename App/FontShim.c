//
//  FontShim.c — FreeType 最小封装实现
//
#include "FontShim.h"

#include <ft2build.h>
#include FT_FREETYPE_H
#include <stdlib.h>

struct FNFont {
    FT_Library library;
    FT_Face face;
};

FNFont *FNFontCreate(const void *bytes, size_t length) {
    if (bytes == NULL || length == 0) { return NULL; }
    FNFont *font = (FNFont *)calloc(1, sizeof(FNFont));
    if (font == NULL) { return NULL; }
    if (FT_Init_FreeType(&font->library) != 0) {
        free(font);
        return NULL;
    }
    // 内存模式：不拷贝字节，调用方需保证 bytes 在 face 存活期间有效。
    if (FT_New_Memory_Face(font->library, (const FT_Byte *)bytes,
                           (FT_Long)length, 0, &font->face) != 0) {
        FT_Done_FreeType(font->library);
        free(font);
        return NULL;
    }
    return font;
}

void FNFontDestroy(FNFont *font) {
    if (font == NULL) { return; }
    if (font->face != NULL) { FT_Done_Face(font->face); }
    if (font->library != NULL) { FT_Done_FreeType(font->library); }
    free(font);
}

uint32_t FNFontGlyphIndex(FNFont *font, uint32_t codePoint) {
    if (font == NULL || font->face == NULL) { return 0; }
    return (uint32_t)FT_Get_Char_Index(font->face, (FT_ULong)codePoint);
}

int FNFontSetPixelSize(FNFont *font, uint32_t pixelSize) {
    if (font == NULL || font->face == NULL || pixelSize == 0) { return -1; }
    return FT_Set_Pixel_Sizes(font->face, 0, pixelSize) == 0 ? 0 : -1;
}

double FNFontAdvance(FNFont *font, uint32_t codePoint) {
    if (font == NULL || font->face == NULL) { return 0.0; }
    FT_UInt index = FT_Get_Char_Index(font->face, (FT_ULong)codePoint);
    if (index == 0) { return 0.0; }
    // 不渲染，只取度量（flags = 0）。
    if (FT_Load_Glyph(font->face, index, 0) != 0) { return 0.0; }
    return (double)font->face->glyph->advance.x / 64.0;
}

double FNFontKerning(FNFont *font, uint32_t left, uint32_t right) {
    if (font == NULL || font->face == NULL) { return 0.0; }
    if (FT_HAS_KERNING(font->face) == 0) { return 0.0; }
    FT_UInt l = FT_Get_Char_Index(font->face, (FT_ULong)left);
    FT_UInt r = FT_Get_Char_Index(font->face, (FT_ULong)right);
    if (l == 0 || r == 0) { return 0.0; }
    FT_Vector delta;
    if (FT_Get_Kerning(font->face, l, r, FT_KERNING_DEFAULT, &delta) != 0) {
        return 0.0;
    }
    return (double)delta.x / 64.0;
}

int FNFontRenderGlyph(FNFont *font, uint32_t codePoint,
                      int *width, int *rows, int *pitch,
                      const uint8_t **buffer) {
    if (font == NULL || font->face == NULL) { return -1; }
    FT_UInt index = FT_Get_Char_Index(font->face, (FT_ULong)codePoint);
    if (index == 0) { return -2; }
    // 原版 load_flags = 4 = FT_LOAD_RENDER：直接得到 8bit 灰度位图。
    if (FT_Load_Glyph(font->face, index, FT_LOAD_RENDER) != 0) { return -3; }
    FT_GlyphSlot slot = font->face->glyph;
    if (slot->bitmap.pixel_mode != FT_PIXEL_MODE_GRAY) { return -4; }
    if (width != NULL) { *width = (int)slot->bitmap.width; }
    if (rows != NULL) { *rows = (int)slot->bitmap.rows; }
    if (pitch != NULL) { *pitch = slot->bitmap.pitch; }
    if (buffer != NULL) { *buffer = slot->bitmap.buffer; }
    return 0;
}
