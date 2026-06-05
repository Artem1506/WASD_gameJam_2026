/// @description Insert description here
// You can write your code in this editor


// Уничтожаем систему частиц для предотвращения утечки памяти
if (variable_instance_exists(id, "pill_particles") && part_system_exists(pill_particles))
{
    part_system_destroy(pill_particles);
}
