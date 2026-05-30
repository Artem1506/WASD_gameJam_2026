/// @description Insert description here
// You can write your code in this editor

life_timer += delta_time / 1000000;

if (life_timer >= life_time)
{
    instance_create_layer(x, y, "Instances", obj_grapeRotten);

    instance_create_layer(0, 0, "Instances", obj_grapeFresh);

    instance_destroy();
}
