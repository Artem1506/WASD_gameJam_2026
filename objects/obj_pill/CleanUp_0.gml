/// @description Освобождение ресурсов пилюли
// Этот код выполняется всегда при уничтожении объекта, смене комнат или перезапуске

if (part_system_exists(pill_particles))
{
    part_system_destroy(pill_particles);
}
