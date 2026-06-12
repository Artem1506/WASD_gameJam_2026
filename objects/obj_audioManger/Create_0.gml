/// @description Инициализация аудио-менеджера
// Здесь определены основные методы для работы со звуком в проекте

// Паттерн Синглтон: если менеджер уже существует, уничтожаем новый дубликат
if (instance_number(object_index) > 1)
{
    instance_destroy();
    exit;
}

// Делаем объект персистентным на уровне кода, чтобы он переходил между всеми комнатами
persistent = true;

// Переменные для отслеживания и контроля фоновой музыки по комнатам
current_music_sound_id = -1;
current_playing_room = -1;

// Для комнаты rm_main (интро + луп)
intro_started = false;
loop_started = false;
intro_sound_id = -1;
loop_sound_id = -1;

/**
 * Воспроизводит звук поедания свежего винограда (snd_eatFreshD)
 */
play_eat_fresh = function()
{
    // Воспроизводим звук snd_eatFreshD с приоритетом 1, без зацикливания
    audio_play_sound(snd_eatFreshD, 1, false);
}

/**
 * Воспроизводит звук поедания испорченного винограда (snd_eatRottenA)
 */
play_eat_rotten = function()
{
    // Воспроизводим звук snd_eatRottenA с приоритетом 1, без зацикливания
    audio_play_sound(snd_eatRottenA, 1, false);
}

/**
 * Воспроизводит звук поедания таблетки/пилюли (snd_eatMedsB)
 */
play_eat_pill = function()
{
    // Воспроизводим звук snd_eatMedsB с приоритетом 1, без зацикливания
    audio_play_sound(snd_eatMedsB, 1, false);
}

/**
 * Воспроизводит звук поедания каски
 */
play_eat_helmet = function()
{
    audio_play_sound(snd_eatMedsB, 1, false);
}

/**
 * Воспроизводит звук достижения 5 комбо (snd_comboFive)
 */
play_combo_five = function()
{
    audio_play_sound(snd_comboFive, 10, false);
}

/**
 * Воспроизводит звук достижения 10 комбо (snd_comboTen)
 */
play_combo_ten = function()
{
    audio_play_sound(snd_comboTen, 10, false);
}

pause_sound_id = -1;

/**
 * Ставит на паузу все проигрываемые звуки
 */
pause_audio = function()
{
    audio_pause_all();
    
    // Воспроизводим фоновую музыку паузы зациклено
    if (audio_exists(snd_pauseMusic))
    {
        pause_sound_id = audio_play_sound(snd_pauseMusic, 10, true);
    }
}

/**
 * Возобновляет проигрывание всех звуков
 */
resume_audio = function()
{
    // Останавливаем фоновую музыку паузы
    if (pause_sound_id != -1)
    {
        audio_stop_sound(pause_sound_id);
        pause_sound_id = -1;
    }
    if (audio_exists(snd_pauseMusic))
    {
        audio_stop_sound(snd_pauseMusic);
    }
    
    audio_resume_all();
}
