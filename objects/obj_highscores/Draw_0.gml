/// @description Отрисовка таблицы рекордов

draw_set_halign(fa_center);
draw_set_valign(fa_top);

var text_color = c_white;

// Отрисовка заголовка таблицы рекордов по центру
draw_set_color(text_color);
draw_set_font(f_textRus);
var title = "ТАБЛИЦА РЕКОРДОВ (СОЛО):";
if (variable_global_exists("var_is_multiplayer") && global.var_is_multiplayer)
{
    title = "РЕКОРДЫ (2 ИГРОКА):";
}
draw_text(x + 200, y, title);

draw_set_halign(fa_left);
draw_set_color(text_color);

var start_x = x + 80;
var start_y = y + 50;
var spacing = 45;

// Отрисовка 5 строк таблицы рекордов по колонкам
draw_set_font(f_score);

for (var i = 0; i < 5; i++)
{
    if (i < array_length(highscores))
    {
        var rec = highscores[i];
        var num_str = string(i + 1) + ".";
        
        // Номер (колонка 1) и Имя игрока (колонка 2) в f_textRus
        draw_set_font(f_textRus);
        draw_text(start_x, start_y + i * spacing + 4, num_str);
        draw_text(start_x + 80, start_y + i * spacing + 4, rec.name);
        
        // Числовое значение рекорда (колонка 3, выровнена по правому краю) в f_score
        draw_set_font(f_score);
        draw_set_halign(fa_right);
        draw_text(start_x + 320, start_y + i * spacing, string(rec.score));
        draw_set_halign(fa_left); // Сбрасываем выравнивание
    }
}
