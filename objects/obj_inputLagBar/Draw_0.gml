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

// красный цвет
draw_set_color(c_red);

// рисуем прямоугольник
draw_rectangle(
    x,
    y,
    x + bar_width,
    y + bar_height,
    false
);