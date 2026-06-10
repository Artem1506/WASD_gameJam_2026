varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D u_surface;

uniform vec2 u_resolution;
uniform float u_strength;

void main()
{
    vec2 uv = v_vTexcoord;

    //-----------------------------------------
    // PIXEL SIZE
    //-----------------------------------------

    vec2 pixel =
        1.0 / u_resolution;

    //-----------------------------------------
    // BLUR RADIUS
    //-----------------------------------------

    float radius =
        u_strength * 6.0;

    //-----------------------------------------
    // GAUSSIAN-LIKE BLUR
    //-----------------------------------------

    vec4 col = vec4(0.0);

    col += texture2D(u_surface, uv) * 0.20;

    col += texture2D(
        u_surface,
        uv + vec2( radius, 0.0) * pixel
    ) * 0.15;

    col += texture2D(
        u_surface,
        uv + vec2(-radius, 0.0) * pixel
    ) * 0.15;

    col += texture2D(
        u_surface,
        uv + vec2(0.0,  radius) * pixel
    ) * 0.15;

    col += texture2D(
        u_surface,
        uv + vec2(0.0, -radius) * pixel
    ) * 0.15;

    col += texture2D(
        u_surface,
        uv + vec2( radius, radius) * pixel
    ) * 0.10;

    col += texture2D(
        u_surface,
        uv + vec2(-radius, radius) * pixel
    ) * 0.10;

    gl_FragColor = col;
}