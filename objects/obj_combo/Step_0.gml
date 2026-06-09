/// @description Обновление таймеров и отслеживание комбо

// Отслеживаем момент увеличения значения комбо
if (global.var_combo > prev_combo)
{
    // Запускаем анимацию только если комбо выросло до значения больше 1
    if (global.var_combo > 1)
    {
        combo_show_timer = 1.0; // Держится 1 секунду
        combo_fade_timer = 1.0; // Затем затухает 1 секунду
    }
    
    // Если комбо достигло 10, активируем анимацию сброса лага на 3 секунды
    if (global.var_combo == 10)
    {
        reset_lag_active_timer = 3.0;
    }
}
prev_combo = global.var_combo;

// Обновление таймеров комбо-баннера
if (combo_show_timer > 0)
{
    combo_show_timer -= delta_time / 1000000;
}
else if (combo_fade_timer > 0)
{
    combo_fade_timer -= delta_time / 1000000;
}

// Обновление таймера анимации сброса лага
if (reset_lag_active_timer > 0)
{
    reset_lag_active_timer -= delta_time / 1000000;
}

// Плавная анимация индексов кадров (на основе скорости спрайта или 10 fps)
if (ui_concentrationActiv != -1)
{
    concentration_anim_index += sprite_get_speed(ui_concentrationActiv) * (delta_time / 1000000);
}
else
{
    concentration_anim_index += 10 * (delta_time / 1000000);
}

if (ui_resetLagActiv != -1)
{
    reset_lag_anim_index += sprite_get_speed(ui_resetLagActiv) * (delta_time / 1000000);
}
else
{
    reset_lag_anim_index += 10 * (delta_time / 1000000);
}
