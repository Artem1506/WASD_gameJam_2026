/**
 * Читает таблицу рекордов из файла records.ini и возвращает отсортированный по убыванию массив топ-5.
 * Если файл пуст, инициализирует ячейки по умолчанию ("---", 0).
 */
function sc_loadHighscores()
{
    var list = [];
    var section = (variable_global_exists("var_is_multiplayer") && global.var_is_multiplayer) ? "HighscoresMulti" : "HighscoresSingle";
    ini_open("records.ini");
    for (var i = 0; i < 5; i++)
    {
        var key_num = string(i + 1);
        var r_name = ini_read_string(section, "Name" + key_num, "---");
        var r_score = ini_read_real(section, "Score" + key_num, 0);
        array_push(list, { name: r_name, score: r_score });
    }
    ini_close();
    
    // Сортируем по убыванию набранного счета
    array_sort(list, function(a, b) {
        return b.score - a.score;
    });
    
    return list;
}

/**
 * Проверяет, достоин ли переданный счет занять место в таблице рекордов.
 * Возвращает true, если счет больше хотя бы одного рекорда в таблице.
 */
function sc_checkHighscoreEligible(_score)
{
    var list = sc_loadHighscores();
    for (var i = 0; i < 5; i++)
    {
        if (_score > list[i].score)
        {
            return true;
        }
    }
    return false;
}

/**
 * Записывает отсортированный массив рекордов топ-5 в файл records.ini.
 */
function sc_saveHighscores(list)
{
    var section = (variable_global_exists("var_is_multiplayer") && global.var_is_multiplayer) ? "HighscoresMulti" : "HighscoresSingle";
    ini_open("records.ini");
    for (var i = 0; i < 5; i++)
    {
        var key_num = string(i + 1);
        ini_write_string(section, "Name" + key_num, list[i].name);
        ini_write_real(section, "Score" + key_num, list[i].score);
    }
    ini_close();
}

/**
 * Добавляет новую запись в таблицу рекордов, сортирует список и сохраняет топ-5 в INI.
 */
function sc_insertNewHighscore(name, score)
{
    var list = sc_loadHighscores();
    
    // Добавляем новый результат
    array_push(list, { name: name, score: score });
    
    // Сортируем по убыванию счета
    array_sort(list, function(a, b) {
        return b.score - a.score;
    });
    
    // Оставляем только топ-5
    if (array_length(list) > 5)
    {
        array_delete(list, 5, array_length(list) - 5);
    }
    
    // Сохраняем обновленный список рекордов
    sc_saveHighscores(list);
}
