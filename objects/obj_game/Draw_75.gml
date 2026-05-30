/// @description Полноэкранный нарастающий blackout поверх всех слоев
// Если игра подходит к концу, плавно затемняем весь экран поверх HUD и игрового мира
/*
if (game_over_timer != -1)
{
    // Вычисляем альфу нарастания блэкаута (от 0.0 до 1.0 за 5 секунд)
    var _alpha = 1.0 - (game_over_timer / 5.0);
    _alpha = clamp(_alpha, 0, 1);
    
    shader_set(sh_blackout);
    
    var _old_alpha = draw_get_alpha();
    var _old_color = draw_get_color();
    
    draw_set_alpha(_alpha);
    draw_set_color(c_white); // Белый цвет для корректной передачи альфы в шейдер
    
    // Рисуем прямоугольник на весь экран GUI
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    
    draw_set_alpha(_old_alpha);
    draw_set_color(_old_color);
    
    shader_reset();
}*/

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