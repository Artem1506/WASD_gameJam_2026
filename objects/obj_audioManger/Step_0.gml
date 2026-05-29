/// @description Контроль проигрывания фоновой музыки
// Логика переключения музыкального интро на зацикленный луп для комнаты rm_main

if (room == rm_main)
{
    // Если музыкальное интро еще не было запущено
    if (!intro_started)
    {
        // Воспроизводим интро с приоритетом 10, без зацикливания
        intro_sound_id = audio_play_sound(snd_musicLoopIntro, 10, false);
        intro_started = true;
    }
    // Если интро уже запущено, но основной зацикленный луп еще не начался
    else if (!loop_started && intro_sound_id != -1)
    {
        // Если интро завершило свое воспроизведение
        if (!audio_is_playing(intro_sound_id))
        {
            // Запускаем основной луп музыки с приоритетом 10, с зацикливанием
            loop_sound_id = audio_play_sound(snd_musicLoop, 10, true);
            loop_started = true;
        }
    }
}
else
{
    // Если мы перешли в другую комнату, останавливаем проигрывание музыки
    if (intro_sound_id != -1 && audio_is_playing(intro_sound_id))
    {
        audio_stop_sound(intro_sound_id);
    }
    if (loop_sound_id != -1 && audio_is_playing(loop_sound_id))
    {
        audio_stop_sound(loop_sound_id);
    }
    
    // Сбрасываем переменные состояния
    intro_started = false;
    loop_started = false;
    intro_sound_id = -1;
    loop_sound_id = -1;
}
