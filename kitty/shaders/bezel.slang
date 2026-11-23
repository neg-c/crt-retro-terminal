#language slang 2026
// Soft rounded-rect bezel so a rectangular Kitty window reads as a CRT tube.
// INSET_PX / RADIUS_PX should stay in sync with window_padding_width in kitty.conf.

import kitty_custom_shader_types;

static const float INSET_PX = 18.0;
static const float RADIUS_PX = 28.0;
static const float FEATHER_PX = 1.25;

public float4
fragment_main(float4 color, KittyTextures t, KittyCustomShaderData d) {
    float2 res = float2(d.viewport_size_pixels);
    float2 p = t.pos * res;
    float2 center = res * 0.5;
    float2 half_size = max(res * 0.5 - INSET_PX, float2(1.0, 1.0));
    float2 q = abs(p - center) - half_size + RADIUS_PX;
    float dist = length(max(q, float2(0.0, 0.0))) + min(max(q.x, q.y), 0.0) - RADIUS_PX;
    float inside = 1.0 - smoothstep(-FEATHER_PX, FEATHER_PX, dist);
    return float4(color.rgb * inside, color.a);
}
