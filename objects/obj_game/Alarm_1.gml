/// @description Проверка и спавн чистильщика (obj_cleaner)

// 1. Получаем количество инстансов объекта "плохой виноград" (obj_grapeRotten)
rotten_grape_count = instance_number(obj_grapeRotten);

// 2. Генерируем случайное число от 1 до 100
var rand_val = irandom_range(1, 100);

// 3. Сравниваем значение переменной и сгенерированное число
if (rotten_grape_count > rand_val)
{
    // Спавним чистильщика, только если его еще нет на сцене
    if (!instance_exists(obj_cleaner))
    {
        instance_create_layer(0, 0, "Instances", obj_cleaner);
    }
}

// 4. Перезапускаем будильник на 5 секунд
alarm[1] = 3 * 60;
