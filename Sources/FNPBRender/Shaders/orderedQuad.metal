#include <metal_stdlib>
using namespace metal;

struct OrderedVertex {
    float2 position;
    float2 uv;
    float4 rgba;
};

struct OrderedVertexOut {
    float4 position [[position]];
    float2 uv;
    float4 rgba;
};

vertex OrderedVertexOut orderedQuad_vertex(
    uint vertexID [[vertex_id]],
    constant OrderedVertex *vertices [[buffer(0)]],
    constant float2 &viewportSize [[buffer(1)]]
) {
    OrderedVertex vertex = vertices[vertexID];
    OrderedVertexOut out;
    out.position = float4(
        vertex.position.x / viewportSize.x * 2.0 - 1.0,
        1.0 - vertex.position.y / viewportSize.y * 2.0,
        0.0,
        1.0);
    out.uv = vertex.uv;
    out.rgba = vertex.rgba;
    return out;
}

fragment float4 orderedQuad_fragment(
    OrderedVertexOut in [[stage_in]],
    texture2d<float> texture0 [[texture(0)]]
) {
    constexpr sampler s(coord::normalized, address::clamp_to_edge, filter::linear);
    return texture0.sample(s, in.uv) * in.rgba;
}
