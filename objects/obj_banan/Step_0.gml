/// @description Отсчет срока жизни банана
life_timer += delta_time / 1000000;

if (life_timer >= life_time)
{
    instance_destroy();
}
