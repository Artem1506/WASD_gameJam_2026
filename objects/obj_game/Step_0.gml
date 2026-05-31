/// @description Insert description here
// You can write your code in this editor

// Если таблетки нет на арене и таймер активен
if (!instance_exists(obj_pill))
{
    if (pill_spawn_timer > 0)
    {
        pill_spawn_timer -= delta_time / 1000000;
        if (pill_spawn_timer <= 0)
        {
            show_debug_message("spawn pill");
            instance_create_layer(0, 0, "Instances", obj_pill);
        }
    }
}

// Если лаг ввода превысил критический порог и таймер еще не запущен
if (global.var_input_lag >= global.var_input_lag_threshold){
	if (game_over_timer == -1)
    {
        game_over_timer = 5.0; // Запускаем 5-секундный таймер
    }
}

// Отсчет таймера конца игры
if (game_over_timer > 0)
{
    game_over_timer -= delta_time / 1000000;
    if (game_over_timer <= 0)
    {
        // Переход в комнату результатов
        //room_goto(rm_result);
    }
}
