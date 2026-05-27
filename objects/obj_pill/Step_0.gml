/// @description Insert description here
// You can write your code in this editor

life_timer += delta_time / 1000000;

if (life_timer >= life_time)
{
    instance_destroy();
}
