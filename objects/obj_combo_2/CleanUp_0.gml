/// @description Освобождение систем частиц комбо из памяти

// Уничтожаем все активные системы частиц во избежание утечки видеопамяти
for (var i = 0; i < array_length(combo_effect_systems); i++)
{
    var sys = combo_effect_systems[i].system;
    if (part_system_exists(sys))
    {
        part_system_destroy(sys);
    }
}
