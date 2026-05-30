varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D u_surface;

uniform float u_time;
uniform vec2 u_resolution;
uniform vec2 u_center;

void main()
{
    vec2 uv = v_vTexcoord;

    //-----------------------------------------
    // SCREEN POSITION
    //-----------------------------------------

    vec2 screen_pos =
        uv * u_resolution;

    //-----------------------------------------
    // TIME
    //-----------------------------------------

    float t = clamp(u_time, 0.0, 5.0);

    //-----------------------------------------
    // PHASE 1
    //-----------------------------------------

    float phase1 =
        clamp(t / 3.0, 0.0, 1.0);

    //-----------------------------------------
    // VIGNETTE SIZE
    //-----------------------------------------

    float radius =
        mix(704.0, 160.0, phase1);

    //-----------------------------------------
    // DISTANCE
    //-----------------------------------------

    float dist =
        distance(screen_pos, u_center);

    //-----------------------------------------
    // EDGE SOFTNESS
    //-----------------------------------------

    float softness = 96.0;

    //-----------------------------------------
    // VIGNETTE MASK
    //-----------------------------------------

    float vignette =
        smoothstep(
            radius - softness,
            radius + softness,
            dist
        );

    //-----------------------------------------
    // PHASE 2
    //-----------------------------------------

    float fade =
        clamp((t - 3.0) / 2.0, 0.0, 1.0);

    //-----------------------------------------
    // FINAL BLACK
    //-----------------------------------------

    float black_amount =
        max(vignette, fade);

    //-----------------------------------------
    // BASE COLOR
    //-----------------------------------------

    vec4 base =
        texture2D(u_surface, uv);

    //-----------------------------------------
    // FINAL
    //-----------------------------------------

    vec3 final_rgb =
        mix(base.rgb, vec3(0.0), black_amount);

    gl_FragColor =
        vec4(final_rgb, 1.0);
}