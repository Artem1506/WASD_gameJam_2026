/// @description Инициализация комбо-панели

// Безопасная инициализация на случай непредвиденного порядка создания объектов
if (!variable_global_exists("var_combo"))
{
    global.var_combo = 0;
}
if (!variable_global_exists("var_concentration_active"))
{
    global.var_concentration_active = false;
}

// Сохраняем предыдущее значение для отслеживания момента его увеличения
prev_combo = global.var_combo;

// Таймеры для отображения и затухания всплывающего спрайта ui_combo
combo_show_timer = 0; // Время отображения на 100% непрозрачности (до 1.0 секунды)
combo_fade_timer = 0; // Время плавного затухания (до 1.0 секунды)

// Переменные для анимации эффектов концентрации и сброса лага
concentration_anim_index = 0;
reset_lag_anim_index = 0;
reset_lag_active_timer = 0;

// Устанавливаем меньшую глубину (ближе к экрану), чтобы объект рисовался поверх других элементов HUD (например, obj_inputLagBar, у которого глубина по умолчанию равна глубине слоя HUD = 100)
depth = 90;

// Массив для хранения активных систем частиц комбо для их своевременного удаления
combo_effect_systems = [];
