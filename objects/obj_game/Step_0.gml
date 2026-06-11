/// @description Insert description here
// You can write your code in this editor

// Если лаг ввода одной из змеек превысил критический порог и таймер еще не запущен
if (!variable_global_exists("var_is_multiplayer"))
{
    global.var_is_multiplayer = false;
}

var p1_drunk = (global.var_input_lag >= global.var_input_lag_threshold);
var p2_drunk = (global.var_is_multiplayer && global.var_input_lag_p2 >= global.var_input_lag_threshold);

if (p1_drunk || p2_drunk) {
	if (game_over_timer == -1)
    {
        game_over_timer = 5.0; // Запускаем 5-секундный таймер
        
        audio_stop_sound(snd_musicLoop);
		audio_play_sound(snd_gameOver, 100, false); 
		with (obj_audioManger)
        {
            if (loop_sound_id != -1) audio_sound_gain(loop_sound_id, 0, 500); 
        }
	}
}

// Отсчет таймера конца игры
if (game_over_timer > 0)
{
    game_over_timer -= delta_time / 1000000;
    if (game_over_timer <= 0)
    {
        // Переход в комнату результатов
        room_goto(rm_result);
    }
}

// Обновление анимации стартового светофора
if (show_traffic_light)
{
    // Скорость анимации: 1.1 кадра в секунду (из настроек spr_trafficLight.yy)
    traffic_light_index += 1.1 * (delta_time / 1000000);
    
    // Если анимация закончилась (воспроизведены все 4 кадра), удаляем светофор
    var _frames = sprite_get_number(spr_trafficLight);
    if (traffic_light_index >= _frames)
    {
        show_traffic_light = false;
    }
}

// Обновление таймера концентрации Игрока 1
if (global.var_concentration_active)
{
    global.var_concentration_timer -= delta_time / 1000000;
    if (global.var_concentration_timer <= 0)
    {
        global.var_concentration_active = false;
        global.var_concentration_timer = 0;
        
        // Возвращаем сохраненный инпут-лаг + изменения за время концентрации
        global.var_input_lag = max(0, global.var_concentration_stored_lag + global.var_concentration_accumulated_lag);
    }
}

// Обновление таймера концентрации Игрока 2
if (global.var_is_multiplayer && global.var_concentration_active_p2)
{
    global.var_concentration_timer_p2 -= delta_time / 1000000;
    if (global.var_concentration_timer_p2 <= 0)
    {
        global.var_concentration_active_p2 = false;
        global.var_concentration_timer_p2 = 0;
        
        // Возвращаем сохраненный инпут-лаг + изменения за время концентрации для P2
        global.var_input_lag_p2 = max(0, global.var_concentration_stored_lag_p2 + global.var_concentration_accumulated_lag_p2);
    }
}
