/// @description Insert description here
// You can write your code in this editor

var max_width = 256;
var bar_height = 64;

// нормализуем lag
var t =
    global.var_input_lag
    / global.var_input_lag_threshold;

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

// рисуем прямоугольник
draw_rectangle(
    x,
    y,
    x + bar_width,
    y + bar_height,
    false
);

// возвращаем цвет на исходное значение
draw_set_color(old_color);