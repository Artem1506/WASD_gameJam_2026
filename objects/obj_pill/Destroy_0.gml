/// @description Insert description here
// You can write your code in this editor

// Запускаем новый таймер спавна восстановительной таблетки
with (obj_game)
{
    pill_spawn_timer = irandom_range(30, 60);
}

// Уничтожаем систему частиц для предотвращения утечки памяти
if (variable_instance_exists(id, "pill_particles") && part_system_exists(pill_particles))
{
    part_system_destroy(pill_particles);
}
