/// @description Обновление таймеров и отслеживание комбо

// Отслеживаем момент увеличения значения комбо
if (global.var_combo > prev_combo)
{
    // 1. Запускаем всплывающий баннер Combo по первоначальной логике только при комбо = 5 или 10
    if (global.var_combo == 5 || global.var_combo == 10)
    {
        combo_show_timer = 1.0; // Держится 1 секунду
        combo_fade_timer = 1.0; // Затем затухает 1 секунду
    }
    
    // 2. Запускаем систему частиц ps_combo во всех значениях комбо больше 2-х на слое HUD
    if (global.var_combo > 1)
    {
        
        var combo_val = clamp(global.var_combo, 0, 10);
        var check_main_sprite = ui_comboBar0;
        var check_extra_sprite = -1;

        if (combo_val <= 5)
        {
            if (combo_val == 0) check_main_sprite = ui_comboBar0;
            else if (combo_val == 1) check_main_sprite = ui_comboBar1;
            else if (combo_val == 2) check_main_sprite = ui_comboBar2;
            else if (combo_val == 3) check_main_sprite = ui_comboBar3;
            else if (combo_val == 4) check_main_sprite = ui_comboBar4;
            else if (combo_val == 5) check_main_sprite = ui_comboBar5;
        }
        else
        {
            check_main_sprite = ui_comboBar5;
            var extra_val = combo_val - 5;
            if (extra_val == 1) check_extra_sprite = ui_comboBar1;
            else if (extra_val == 2) check_extra_sprite = ui_comboBar2;
            else if (extra_val == 3) check_extra_sprite = ui_comboBar3;
            else if (extra_val == 4) check_extra_sprite = ui_comboBar4;
            else if (extra_val == 5) check_extra_sprite = ui_comboBar5;
        }

        if (check_main_sprite != ui_comboBar5)
        {
            // Создаем систему частиц в центре main_sprite на слое HUD
            var sys = part_system_create_layer("HUD", false, ps_combo);
            part_system_position(sys, x + 46, y + 46);
            part_system_automatic_draw(sys, false); // Отключаем авто-отрисовку в мире для вывода на GUI
            array_push(combo_effect_systems, { system: sys, timer: 2.0 });
        }
        else
        {
            // Для комбо от 5 до 10 включительно создаем в центре extra_sprite на слое HUD
            var draw_extra_sprite = (combo_val == 5) ? ui_comboBar0 : check_extra_sprite;
            if (draw_extra_sprite != -1)
            {
                var sys = part_system_create_layer("HUD", false, ps_combo);
                part_system_position(sys, x + 151, y + 46);
                part_system_automatic_draw(sys, false); // Отключаем авто-отрисовку в мире для вывода на GUI
                array_push(combo_effect_systems, { system: sys, timer: 2.0 });
            }
        }
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

// Обновление и автоматическое уничтожение отработавших систем частиц комбо
for (var i = array_length(combo_effect_systems) - 1; i >= 0; i--)
{
    var eff = combo_effect_systems[i];
    eff.timer -= delta_time / 1000000;
    if (eff.timer <= 0)
    {
        if (part_system_exists(eff.system))
        {
            part_system_destroy(eff.system);
        }
        array_delete(combo_effect_systems, i, 1);
    }
}
