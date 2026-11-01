#include <metal_stdlib>
using namespace metal;

/// 与 T-031 的 64 字节顶点完全一致；禁止在 Swift 侧用 SIMD3 结构体冒充此 packed 布局。
struct FruitVertex {
    packed_float3 position;  // +0, 12B
    packed_float3 normal;    // +12, 12B（本卡不猜测光照）
    packed_float2 uv;        // +24, 8B
    packed_float4 color;     // +32, 16B
    float weight;            // +48, 4B
    packed_float3 reserved;  // +52, 12B
};

struct FruitUniforms {
    float4x4 modelViewProjection;
};

struct FruitVertexOut {
    float4 position [[position]];
    float2 uv;
    float4 color;
};

vertex FruitVertexOut fruit_vertex(
    uint vertexID [[vertex_id]],
    device const FruitVertex *vertices [[buffer(0)]],
    constant FruitUniforms &uniforms [[buffer(2)]]
) {
    FruitVertex v = vertices[vertexID];
    FruitVertexOut out;
    out.position = uniforms.modelViewProjection * float4(float3(v.position), 1.0);
    out.uv = float2(v.uv);       // 原样直通，[待验证] Metal 与原始 UV 原点方向。
    out.color = float4(v.color); // 原始顶点色，不乘果汁色或 typeID 哈希色。
    return out;
}

fragment float4 fruit_fragment(
    FruitVertexOut in [[stage_in]],
    texture2d<float> atlas [[texture(0)]]
) {
    constexpr sampler atlasSampler(
        coord::normalized,
        address::clamp_to_edge,
        filter::linear,
        mip_filter::none
    );
    return atlas.sample(atlasSampler, in.uv) * in.color;
}
