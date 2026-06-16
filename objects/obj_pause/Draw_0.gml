/// @description Отрисовка размытого экрана паузы
if (is_paused && surface_exists(pause_surf))
{
    // Задаем шейдер размытия
    shader_set(sh_blur);
    
    var _shader = sh_blur;
    
    // Передаем разрешение экрана (u_resolution)
    shader_set_uniform_f(
        shader_get_uniform(_shader, "u_resolution"),
        surface_get_width(pause_surf),
        surface_get_height(pause_surf)
    );
    
    // Передаем силу размытия (u_strength)
    shader_set_uniform_f(
        shader_get_uniform(_shader, "u_strength"),
        2.5
    );
    
    // Передаем текстуру поверхности u_surface
    var tex_surface = surface_get_texture(pause_surf);
    texture_set_stage(
        shader_get_sampler_index(_shader, "u_surface"),
        tex_surface
    );
    
    // Рисуем саму поверхность
    draw_surface(pause_surf, 0, 0);
    
    shader_reset();
 
    // Отрисовываем полупрозрачное темное перекрытие поверх размытия для лучшей читаемости кнопок
    var old_color = draw_get_color();
    var old_alpha = draw_get_alpha();
    
    draw_set_color(c_black);
    draw_set_alpha(0.4);
    draw_rectangle(0, 0, room_width, room_height, false);
    
    draw_set_color(old_color);
    draw_set_alpha(old_alpha);
}
