/// @description Инициализация таблицы рекордов

highscores = [];

/**
 * Читает рекорды из файла INI и обновляет локальный массив для отрисовки.
 */
refresh_highscores = function()
{
    highscores = sc_loadHighscores();
}

// Загружаем данные рекордов при создании объекта
refresh_highscores();
