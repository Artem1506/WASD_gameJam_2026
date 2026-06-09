/// @description Повторяющийся таймер проверки спавна таблетки

// Проверяем, есть ли на сцене восстановительная таблетка
if (!instance_exists(obj_pill))
{
    // Сравниваем значение лага (умноженное на 10) со случайным числом от 1 до 100
    var random_val = irandom_range(1, 100);
	show_debug_message(string(random_val));
    if ((global.var_input_lag * 10) > random_val)
    {
        instance_create_layer(0, 0, "Instances", obj_pill);
    }
}

// Перезапускаем таймер проверки через 60 шагов (1 секунда)
alarm[0] = 60;