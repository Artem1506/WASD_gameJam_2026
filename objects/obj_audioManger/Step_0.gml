/// @description Контроль проигрывания фоновой музыки при смене комнат

// 1. Определение смены комнаты
if (room != current_playing_room)
{
    // Гарантированно и принудительно останавливаем проигрывание всех фоновых ассетов звуков
    if (audio_exists(snd_startRoomAmb))
    {
        audio_stop_sound(snd_startRoomAmb);
    }
    if (audio_exists(snd_musicLoopIntro))
    {
        audio_stop_sound(snd_musicLoopIntro);
    }
    if (audio_exists(snd_musicLoop))
    {
        audio_stop_sound(snd_musicLoop);
    }

    var blackout_sound = asset_get_index("snd_blackoutAmb");
    if (blackout_sound != -1)
    {
        audio_stop_sound(blackout_sound);
    }

    // Дополнительно останавливаем по конкретным ID потоков
    if (current_music_sound_id != -1 && audio_is_playing(current_music_sound_id))
    {
        audio_stop_sound(current_music_sound_id);
    }
    current_music_sound_id = -1;

    if (intro_sound_id != -1 && audio_is_playing(intro_sound_id))
    {
        audio_stop_sound(intro_sound_id);
    }
    intro_sound_id = -1;

    if (loop_sound_id != -1 && audio_is_playing(loop_sound_id))
    {
        audio_stop_sound(loop_sound_id);
    }
    loop_sound_id = -1;

    // Сбрасываем переменные состояния для уровня rm_main
    intro_started = false;
    loop_started = false;
    
    // Обновляем текущую активную комнату в менеджере
    current_playing_room = room;
}

// 2. Воспроизведение музыки в зависимости от текущей комнаты
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
else if (room == rm_result)
{
    // Воспроизведение зацикленного snd_blackoutAmb для комнаты результатов
    if (current_music_sound_id == -1 || !audio_is_playing(current_music_sound_id))
    {
        if (audio_exists(snd_blackoutAmb))
        {
            current_music_sound_id = audio_play_sound(snd_blackoutAmb, 10, true);
        }
    }
}
else if (room == rm_start)
{
    // Воспроизведение зацикленного snd_startRoomAmb для стартового меню
    if (current_music_sound_id == -1 || !audio_is_playing(current_music_sound_id))
    {
        if (audio_exists(snd_startRoomAmb))
        {
            current_music_sound_id = audio_play_sound(snd_startRoomAmb, 10, true);
        }
    }
}

