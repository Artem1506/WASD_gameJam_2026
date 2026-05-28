//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_time;
uniform float u_lag;
uniform vec2 u_resolution;

void main()
{
    vec2 uv = v_vTexcoord;

    //-----------------------------------------
    // NORMALIZED STRENGTH
    //-----------------------------------------

    float strength = clamp(u_lag / 1.5, 0.0, 1.0);

    //-----------------------------------------
    // PIXEL SIZE
    //-----------------------------------------

    vec2 pixel = 1.0 / u_resolution;

    //-----------------------------------------
    // SMOOTH DRIFT
    //-----------------------------------------

    float drift_x =
        sin(u_time * 1.3) * 0.5 +
        cos(u_time * 0.7) * 0.5;

    float drift_y =
        cos(u_time * 1.1) * 0.5 +
        sin(u_time * 0.9) * 0.5;

    //-----------------------------------------
    // OFFSET
    //-----------------------------------------

    float offset_pixels = 64.0 * strength;

    vec2 drift =
        vec2(drift_x, drift_y) *
        offset_pixels *
        pixel;

    //-----------------------------------------
    // BLUR
    //-----------------------------------------

    float blur = 6.0 * strength;

    vec4 blur_col = vec4(0.0);

    blur_col += texture2D(gm_BaseTexture, uv + vec2(-blur, 0.0) * pixel);
    blur_col += texture2D(gm_BaseTexture, uv + vec2( blur, 0.0) * pixel);
    blur_col += texture2D(gm_BaseTexture, uv + vec2(0.0, -blur) * pixel);
    blur_col += texture2D(gm_BaseTexture, uv + vec2(0.0,  blur) * pixel);

    blur_col *= 0.25;

    //-----------------------------------------
    // CHROMATIC ABERRATION
    //-----------------------------------------

    float chroma = 0.008 * strength;

    vec4 col;

    col.r = texture2D(
        gm_BaseTexture,
        uv + vec2(chroma, 0.0)
    ).r;

    col.g = texture2D(
        gm_BaseTexture,
        uv
    ).g;

    col.b = texture2D(
        gm_BaseTexture,
        uv - vec2(chroma, 0.0)
    ).b;

    col.a = 1.0;

    //-----------------------------------------
    // GHOST IMAGE
    //-----------------------------------------

    vec4 ghost =
        texture2D(
            gm_BaseTexture,
            uv + drift
        );

    //-----------------------------------------
    // FINAL COMPOSITE
    //-----------------------------------------

    vec4 final_col = col;

    final_col =
        mix(final_col, blur_col, 0.35 * strength);

    final_col += ghost * (0.25 * strength);

    gl_FragColor = final_col;
}