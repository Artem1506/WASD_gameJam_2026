/// @description Insert description here
// You can write your code in this editor

// Если лаг ввода превысил критический порог и таймер еще не запущен
if (global.var_input_lag >= global.var_input_lag_threshold){
	if (game_over_timer == -1)
    {
        game_over_timer = 5.0; // Запускаем 5-секундный таймер
        
        audio_stop_sound(snd_musicLoop);
		audio_play_sound(snd_gameOver, 100, false); 
		audio_sound_gain(obj_audioManger.loop_sound_id, 0, 500); 
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
