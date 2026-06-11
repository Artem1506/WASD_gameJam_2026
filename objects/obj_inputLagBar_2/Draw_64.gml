/// @description Отрисовка шкалы лага
// Отрисовка элементов HUD

draw_self();

var max_width = 274;
var bar_height = 45;

// нормализуем lag
var t = global.var_input_lag_p2 / global.var_input_lag_threshold;

// ограничиваем диапазон
t = clamp(t, 0, 1);

// вычисляем ширину
var bar_width = lerp(1, max_width, t);

// сохраняем текущий цвет рисования
var old_color = draw_get_color();

// вычисляем промежуточный цвет от зеленого к красному
var r = lerp(0, 255, t);
var g = lerp(255, 0, t);
var b = 0;
var col = make_color_rgb(r, g, b);

// задаем вычисленный цвет
draw_set_color(col);

// Вычисляем координаты отрисовки относительно точки ориджин самого объекта
var draw_x = x + 104;
var draw_y = y + 30;

// рисуем прямоугольник
draw_rectangle(
    draw_x,
    draw_y,
    draw_x + bar_width,
    draw_y + bar_height,
    false
);

// возвращаем цвет на исходное значение
draw_set_color(old_color);

// Определение спрайта головы на основе заполнения шкалы лага
head_sprite = -1;

if (global.var_input_lag_p2 >= 0 && global.var_input_lag_p2 <= 0.4)
{
    head_sprite = spr_head_01;
}
else if (global.var_input_lag_p2 >= 0.5 && global.var_input_lag_p2 <= 0.9)
{
    head_sprite = spr_head_02;
}
else if (global.var_input_lag_p2 >= 1)
{
    head_sprite = spr_head_03;
}

// Рисуем спрайт в координатах объекта, если он существует в проекте
if (head_sprite != -1)
{
    draw_sprite(head_sprite, 0, x+10, y);
}