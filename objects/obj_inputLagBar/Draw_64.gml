/// @description Отрисовка шкалы лага
// Отрисовка элементов HUD

draw_self();

var max_width = 196;
var bar_height = 18;

// нормализуем lag
var t = global.var_input_lag / global.var_input_lag_threshold;

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
var draw_x = x + 64;
var draw_y = y + 40;

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