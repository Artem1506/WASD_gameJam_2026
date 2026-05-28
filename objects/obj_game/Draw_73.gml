/// @description Insert description here
// You can write your code in this editor

surface_reset_target();

shader_set(sh_inputLag);

var _time =
    current_time * 0.001;

var _lag =
    global.var_input_lag;

var _shader = sh_inputLag;

shader_set_uniform_f(
    shader_get_uniform(_shader, "u_time"),
    _time
);

shader_set_uniform_f(
    shader_get_uniform(_shader, "u_lag"),
    _lag
);

shader_set_uniform_f(
    shader_get_uniform(_shader, "u_resolution"),
    surface_get_width(surf_game),
    surface_get_height(surf_game)
);

draw_surface(surf_game, 0, 0);

shader_reset();