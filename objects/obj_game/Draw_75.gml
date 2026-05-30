/// @description Полноэкранный нарастающий blackout поверх всех слоев
// Если игра подходит к концу, плавно затемняем весь экран поверх HUD и игрового мира

if (game_over_timer != -1)
{
    shader_set(sh_blackout);

    //-----------------------------------------
    // TIME
    //-----------------------------------------

    var _time =
        5.0 - game_over_timer;

    shader_set_uniform_f(
        shader_get_uniform(sh_blackout, "u_time"),
        _time
    );

    //-----------------------------------------
    // RESOLUTION
    //-----------------------------------------

    shader_set_uniform_f(
        shader_get_uniform(sh_blackout, "u_resolution"),
        display_get_gui_width(),
        display_get_gui_height()
    );

    //-----------------------------------------
    // CENTER
    //-----------------------------------------

    shader_set_uniform_f(
        shader_get_uniform(sh_blackout, "u_center"),
        obj_snakeHead.x,
        obj_snakeHead.y
    );

    //-----------------------------------------
    // SURFACE
    //-----------------------------------------

    texture_set_stage(
        shader_get_sampler_index(sh_blackout, "u_surface"),
        surface_get_texture(application_surface)
    );

    //-----------------------------------------
    // DRAW
    //-----------------------------------------

    draw_surface(application_surface, 0, 0);

    shader_reset();
}