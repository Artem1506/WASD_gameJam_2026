/// @description Отрисовка результатов сессии и ввода имени

draw_set_font(f_textRus);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

// 1. Отрисовка надписи "Твой результат" и счета сессии
draw_set_color(c_white);
draw_text(x, y, "ТВОЙ РЕЗУЛЬТАТ");

draw_set_color(make_color_rgb(0, 255, 128)); // Сочный мятно-зеленый цвет для счета
draw_text(x + 100, y, string(session_score));

// 2. Отрисовка интерактивного поля ввода имени при попадании в топ-5
if (is_entering_name)
{
    draw_set_color(make_color_rgb(255, 100, 100)); // Выделяющийся цвет для поздравления
    draw_text(x + 100, y - 100, "НОВЫЙ РЕКОРД!");
    
    draw_set_color(c_white);
    var display_name = entered_name;
    repeat (3 - string_length(entered_name))
    {
        display_name += "_";
    }
    
    // Форматируем строку ввода имени с пробелами для наглядности (например, "A B _")
    var formatted_name = "";
    for (var i = 1; i <= 3; i++)
    {
        formatted_name += string_char_at(display_name, i) + " ";
    }
    
    draw_text(x + 200, y, "ВВЕДИТЕ ИМЯ: " + formatted_name);
}
