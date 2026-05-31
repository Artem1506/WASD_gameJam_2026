/// @description Отрисовка таблицы рекордов

draw_set_font(f_score);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

var title_color = make_color_rgb(255, 215, 0); // Красивый золотой цвет
var text_color = c_white;

// Отрисовка заголовка таблицы рекордов по центру
draw_set_color(title_color);
draw_text(640, 200, "ТАБЛИЦА РЕКОРДОВ");

draw_set_halign(fa_left);
draw_set_color(text_color);

var start_x = 480;
var start_y = 260;
var spacing = 45;

// Отрисовка 5 строк таблицы рекордов по колонкам
for (var i = 0; i < 5; i++)
{
    if (i < array_length(highscores))
    {
        var rec = highscores[i];
        var num_str = string(i + 1) + ".";
        
        // Номер (колонка 1)
        draw_text(start_x, start_y + i * spacing, num_str);
        
        // Имя игрока (колонка 2)
        draw_text(start_x + 80, start_y + i * spacing, rec.name);
        
        // Числовое значение рекорда (колонка 3, выровнена по правому краю)
        draw_set_halign(fa_right);
        draw_text(start_x + 320, start_y + i * spacing, string(rec.score));
        draw_set_halign(fa_left); // Сбрасываем выравнивание
    }
}
