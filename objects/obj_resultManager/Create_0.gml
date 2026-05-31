/// @description Инициализация менеджера результатов

session_score = global.var_score;
is_eligible = sc_checkHighscoreEligible(session_score);

// Будем вводить имя только если результат заслуживает места в таблице рекордов
is_entering_name = is_eligible;
entered_name = "";

// Очищаем встроенный буфер GameMaker для корректного считывания с чистого листа
keyboard_string = "";
