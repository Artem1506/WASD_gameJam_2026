/// @description Освобождение ресурсов при уничтожении объекта
if (surface_exists(pause_surf))
{
    surface_free(pause_surf);
}
pause_surf = -1;
