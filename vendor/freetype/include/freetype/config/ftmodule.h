/* 本项目裁剪版 ftmodule.h —— 只登记 TrueType 渲染需要的模块。
 *
 * 原版游戏静态链入的是完整 FreeType；这里按 docs/CUSTOMIZE 的做法裁剪，
 * 只保留 TrueType 字形加载与灰度抗锯齿渲染所需模块。
 * 新增模块时要同时把对应 src/<module> 拷贝进 vendor/freetype/src。
 */

FT_USE_MODULE( FT_Module_Class, autofit_module_class )
FT_USE_MODULE( FT_Driver_ClassRec, tt_driver_class )
FT_USE_MODULE( FT_Module_Class, psnames_module_class )
FT_USE_MODULE( FT_Module_Class, sfnt_module_class )
FT_USE_MODULE( FT_Renderer_Class, ft_smooth_renderer_class )
FT_USE_MODULE( FT_Renderer_Class, ft_raster1_renderer_class )

/* EOF */
