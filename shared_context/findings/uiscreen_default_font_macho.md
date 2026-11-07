# UIScreen 默认字体：发售版 Mach-O 证据

范围：`inGameChallengeMapScreen.uiscreen` 中缺省 `fontName` 的组件；不包含完整字体排版或特效。

## 结论

- 真正的 ComponentText 构造函数是 `FUN_003cec7c`，虚表为 `0x542c78`。组件自身的原始默认 `fontSize=1.0`、`maxLines=1`、`strokeSize=1.0`、`softShadowSize=1.0`；`FUN_003c2818` 属于 UIScreen 基类路径，不能作为文字组件构造函数。
- `FUN_0001dde4` 的启动初始化在 `~iPhone` 布局成功加载后，调用 `FUN_003ecb20()` 取得同一 UI 系统对象，并执行：`FUN_00023758(ui, "ComponentText", "fontName", "fontstruetype/bronic.ttf")`。
- 紧邻调用对 `ComponentButton.fontName` 使用同一默认值。因此 map UISF 中 `fontName=nil` 不表示系统字体，而是 `fontstruetype/bronic.ttf`；实际资源为 `assets_raw/FontsTrueType/bronic.ttf`。
- 生产地图共有 11 个文本组件。9 个缺省 fontName 使用上述回退；`actLabel` 和 `finaleHeading` 明确使用 `FontsTrueType/miserable.TTF`，不应用该回退。

## 原始证据

- `build_logs/component_text_constructor.txt`：`FUN_003cec7c` 的虚表与文字属性初始化。
- `build_logs/font_property_initializers.txt`：`FUN_0001dde4` 第 333–347 行的全局默认字体设置。
- `build_logs/font_property_references.txt`：`fontName` 地址 `0x418bb2` 在初始化与启动配置中的直接引用。
- `reverse/uiscreen_reports/inGameChallengeMapScreen.json`：生产组件的实际字体、字号、文本和布局属性。

## 尚未闭合

`FUN_00023758` 的存储与读取路径、本地化文案、字体栅格化、基线、行距、描边、阴影、颜色样式和真机视觉不能由该结论代替验证。
