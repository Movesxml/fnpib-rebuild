#include <metal_stdlib>
using namespace metal;

// 必须与 Swift 侧 `SpriteInstanceGPU` 逐字段一致（64 字节 stride）。
// Swift 布局：
//   position(0..7) size(8..15) rotation(16..19) pad0(20..23)
//   uvOrigin(24..31) uvSize(32..39) pad1(40..47) tint(48..63)
struct SpriteInstanceGPU {
    float2 position;
    float2 size;
    float rotation;
    float pad0;
    float2 uvOrigin;
    float2 uvSize;
    float2 pad1;
    float4 tint;
};

// 必须与 Swift 侧 `SpriteUniforms` 一致。
struct SpriteUniforms {
    float2 viewportSize;
};

struct SpriteVertexOut {
    float4 position [[position]];
    float2 uv;
    float4 tint;
};

vertex SpriteVertexOut sprite_vertex(
    uint vertexID [[vertex_id]],
    uint instanceID [[instance_id]],
    const device SpriteInstanceGPU *instances [[buffer(0)]],
    constant SpriteUniforms &uniforms [[buffer(1)]]
) {
    // triangle strip 的四角，单位 quad [-0.5, 0.5]。
    const float2 corners[4] = {
        float2(-0.5, -0.5),
        float2( 0.5, -0.5),
        float2(-0.5,  0.5),
        float2( 0.5,  0.5)
    };

    SpriteInstanceGPU instance = instances[instanceID];
    float2 corner = corners[vertexID];

    // 局部 quad 缩放后做 2D 旋转。
    float2 local = corner * instance.size;
    float c = cos(instance.rotation);
    float s = sin(instance.rotation);
    float2 rotated = float2(
        local.x * c - local.y * s,
        local.x * s + local.y * c
    );

    // position 为逻辑点坐标，左上原点、y 向下。
    float2 logical = instance.position + rotated;
    float2 viewport = max(uniforms.viewportSize, float2(1.0, 1.0));

    // 逻辑坐标 -> NDC：x 向右，y 向下翻转为 NDC 向上。
    float2 ndc = float2(
        logical.x / viewport.x * 2.0 - 1.0,
        1.0 - logical.y / viewport.y * 2.0
    );

    SpriteVertexOut out;
    out.position = float4(ndc, 0.0, 1.0);

    // corner 从 [-0.5,0.5] 映射到 [0,1] 后应用图集 UV 子矩形。
    float2 uvCorner = corner + float2(0.5, 0.5);
    out.uv = instance.uvOrigin + uvCorner * instance.uvSize;
    out.tint = instance.tint;
    return out;
}

fragment float4 sprite_fragment(
    SpriteVertexOut in [[stage_in]],
    texture2d<float> texture [[texture(0)]]
) {
    // 图集整页采样；UV 子矩形由调用方通过实例数据给出。
    // [待验证] 若贴图为 nearest 风格像素图，可将 filter::linear 改为 filter::nearest。
    constexpr sampler spriteSampler(
        coord::normalized,
        address::clamp_to_edge,
        filter::linear
    );

    return texture.sample(spriteSampler, in.uv) * in.tint;
}