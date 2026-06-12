/// @description Обработка времени жизни каски
life_timer += delta_time / 1000000;

if (life_timer >= life_time)
{
    instance_destroy();
}
