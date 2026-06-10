/// @description Отрисовка комбо-шкалы и эффекта ui_combo

// Ограничиваем значение комбо в диапазоне 0..10
var combo_val = clamp(global.var_combo, 0, 10);

// 1. Определение спрайтов
var main_sprite = ui_comboBar0;
var extra_sprite = -1;

if (combo_val <= 5)
{
    if (combo_val == 0) main_sprite = ui_comboBar0;
    else if (combo_val == 1) main_sprite = ui_comboBar1;
    else if (combo_val == 2) main_sprite = ui_comboBar2;
    else if (combo_val == 3) main_sprite = ui_comboBar3;
    else if (combo_val == 4) main_sprite = ui_comboBar4;
    else if (combo_val == 5) main_sprite = ui_comboBar5;
}
else
{
    main_sprite = ui_comboBar5;
    var extra_val = combo_val - 5;
    if (extra_val == 1) extra_sprite = ui_comboBar1;
    else if (extra_val == 2) extra_sprite = ui_comboBar2;
    else if (extra_val == 3) extra_sprite = ui_comboBar3;
    else if (extra_val == 4) extra_sprite = ui_comboBar4;
    else if (extra_val == 5) extra_sprite = ui_comboBar5;
}

// Присваиваем спрайт объекту для корректной работы draw_self()
sprite_index = main_sprite;

// Рисуем основной спрайт
draw_self();

// Отрисовка значка концентрации поверх основного бара
var spr_conc = ui_concentration;
var spr_conc_act = ui_concentrationActiv;
if (spr_conc != -1)
{
    if (global.var_concentration_active && spr_conc_act != -1)
    {
        draw_sprite(spr_conc_act, floor(concentration_anim_index), x + 46, y + 46);
    }
    else
    {
        draw_sprite(spr_conc, 0, x + 46, y + 46);
    }
}

// Если комбо >= 5, рисуем второй спрайт со смещением x+105, y
if (combo_val >= 5)
{
    var draw_extra_sprite = (combo_val == 5) ? ui_comboBar0 : extra_sprite;
    if (draw_extra_sprite != -1)
    {
        draw_sprite(draw_extra_sprite, 0, x + 105, y);
        
        // Отрисовка значка сброса лага поверх дополнительного бара
        var spr_reset = ui_resetLag;
        var spr_reset_act = ui_resetLagActiv;
        if (spr_reset != -1)
        {
            if (reset_lag_active_timer > 0 && spr_reset_act != -1)
            {
                draw_sprite(spr_reset_act, floor(reset_lag_anim_index), x + 151, y + 46);
            }
            else
            {
                draw_sprite(spr_reset, 0, x + 151, y + 46);
            }
        }
    }
}

// 2. Экспериментальный эффект вспышки шкалы: отрисовка ui_comboBar5 на 0.3 секунды при росте комбо
if (combo_show_timer > 0)
{
    if (main_sprite != ui_comboBar5)
    {
        // Отрисовываем ui_comboBar5 поверх основного спрайта комбо
        draw_sprite(ui_comboBar5, 0, x, y);
    }
    else
    {
        // Если основной спрайт равен ui_comboBar5, проверяем дополнительный
        var draw_extra_sprite = (combo_val == 5) ? ui_comboBar0 : extra_sprite;
        if (draw_extra_sprite != -1 && draw_extra_sprite != ui_comboBar5)
        {
            // Отрисовываем ui_comboBar5 поверх дополнительного спрайта комбо
            draw_sprite(ui_comboBar5, 0, x + 105, y);
        }
    }
}
