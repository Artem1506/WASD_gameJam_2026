/// @description Управление состоянием паузы и активацией объектов

// 1. Переключение состояния по клавише Esc
if (keyboard_check_pressed(vk_escape))
{
    is_paused = !is_paused;
}

// Управление прокруткой во время активной паузы
if (is_paused)
{
    scroll_y += mouse_wheel_down() * scroll_speed;
    scroll_y -= mouse_wheel_up() * scroll_speed;
    scroll_y = clamp(scroll_y, 0, 1200);
}

// 2. Реагируем на изменение состояния паузы (включая переключения из кнопок)
if (is_paused != last_paused)
{
    if (is_paused)
    {
        // Активация паузы
        
        // Копируем содержимое экрана (application_surface) в буферную поверхность
        if (surface_exists(application_surface))
        {
            pause_surf = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
            surface_copy(pause_surf, 0, 0, application_surface);
        }
        else
        {
            pause_surf = -1;
        }
        
        // Ставим все звуки на паузу через аудио-менеджер
        with (obj_audioManger)
        {
            pause_audio();
        }
        
        // Деактивируем все объекты, кроме этого контроллера и менеджера звуков
        instance_deactivate_all(true);
        instance_activate_object(obj_audioManger);
        
        // Создаем кнопки меню паузы на HUD слое
        var HUD_layer = "HUD";
        if (!layer_exists(HUD_layer))
        {
            HUD_layer = "Instances";
        }
        
        btn_return = instance_create_layer(96, 256, HUD_layer, obj_buttonReturn);
        btn_to_result = instance_create_layer(96, 480, HUD_layer, obj_buttonToResult);
    }
    else
    {
        // Отключение паузы
        
        // Удаляем кнопки меню паузы
        if (instance_exists(btn_return))
        {
            instance_destroy(btn_return);
            btn_return = -1;
        }
        if (instance_exists(btn_to_result))
        {
            instance_destroy(btn_to_result);
            btn_to_result = -1;
        }
        
        // Возвращаем все объекты в активное состояние
        instance_activate_all();
        
        // Возобновляем проигрывание звуков
        with (obj_audioManger)
        {
            resume_audio();
        }
        
        // Освобождаем поверхность из памяти
        if (surface_exists(pause_surf))
        {
            surface_free(pause_surf);
        }
        pause_surf = -1;
        
        // Сбрасываем позицию прокрутки при выходе из паузы
        scroll_y = 0;
    }
    
    last_paused = is_paused;
}