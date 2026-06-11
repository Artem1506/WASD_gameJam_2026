/// @description Контроль проигрывания фоновой музыки при смене комнат

// Если игра поставлена на паузу, ничего не делаем
if (instance_exists(obj_pause) && obj_pause.is_paused) exit;

// 1. Определение смены комнаты
if (room != current_playing_room)
{
    // Гарантированно и принудительно останавливаем проигрывание всех фоновых ассетов звуков
    if (audio_exists(snd_startRoomMusic)){
        audio_stop_sound(snd_startRoomMusic);
    }
    if (audio_exists(snd_musicLoopIntro)){
        audio_stop_sound(snd_musicLoopIntro);
    }
    if (audio_exists(snd_musicLoop)){
        audio_stop_sound(snd_musicLoop);
    }
    if (snd_blackoutAmb != -1){
        audio_stop_sound(snd_blackoutAmb);
    }
    if (audio_exists(snd_pauseMusic)){
        audio_stop_sound(snd_pauseMusic);
    }

    // Принудительно останавливаем игровые звуки, которые могли остаться на паузе
    audio_stop_sound(snd_eatFreshD);
    audio_stop_sound(snd_eatRottenA);
    audio_stop_sound(snd_eatMedsB);
    audio_stop_sound(snd_grapeSpawn);
    audio_stop_sound(snd_medsSpawn);
    audio_stop_sound(snd_collision);
    audio_stop_sound(snd_gameOver);

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

    if (pause_sound_id != -1 && audio_is_playing(pause_sound_id))
    {
        audio_stop_sound(pause_sound_id);
    }
    pause_sound_id = -1;

    // Сбрасываем переменные состояния для уровня rm_main
    intro_started = false;
    loop_started = false;
    
    // Обновляем текущую активную комнату в менеджере
    current_playing_room = room;
}

// 2. Воспроизведение музыки в зависимости от текущей комнаты
if (room == rm_main || room == rm_2Players)
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
    // Воспроизведение зацикленного snd_startRoomMusic для стартового меню
    if (current_music_sound_id == -1 || !audio_is_playing(current_music_sound_id))
    {
        if (audio_exists(snd_startRoomMusic))
        {
            current_music_sound_id = audio_play_sound(snd_startRoomMusic, 10, true);
        }
    }
}

