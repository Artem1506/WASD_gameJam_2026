/// @description Считывание и фильтрация ввода имени

if (is_entering_name)
{
    var filtered = "";
    for (var i = 1; i <= string_length(keyboard_string); i++)
    {
        var char = string_char_at(keyboard_string, i);
        var upper_char = string_upper(char);
        var code = ord(upper_char);
        
        // Допускаем:
        // - Латинские буквы A-Z (65..90)
        // - Цифры 0-9 (48..57)
        // - Кириллические буквы А-Я (1040..1071)
        // - Кириллическая буква Ё (1025)
        if ((code >= 65 && code <= 90) || 
            (code >= 48 && code <= 57) || 
            (code >= 1040 && code <= 1071) || 
            (code == 1025))
        {
            filtered += upper_char;
        }
    }
    
    // Ограничиваем длину 3 символами
    if (string_length(filtered) > 3)
    {
        filtered = string_copy(filtered, 1, 3);
    }
    
    // Синхронизируем буфер GameMaker и введенное имя
    keyboard_string = filtered;
    entered_name = filtered;
    
    // Когда введены ровно 3 буквы
    if (string_length(entered_name) == 3)
    {
        // Записываем новый рекорд в файл records.ini
        sc_insertNewHighscore(entered_name, session_score);
        
        // Отключаем дальнейший ввод
        is_entering_name = false;
        
        // Мгновенно заставляем объект obj_highscores обновить вывод на экран
        with (obj_highscores)
        {
            refresh_highscores();
        }
    }
}
