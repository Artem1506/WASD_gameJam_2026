/// @description Insert description here
// You can write your code in this editor

// Если таблетки нет на арене и таймер активен
if (!instance_exists(obj_pill))
{
    if (pill_spawn_timer > 0)
    {
        pill_spawn_timer -= delta_time / 1000000;
        if (pill_spawn_timer <= 0)
        {
            show_debug_message("spawn pill");
            instance_create_layer(0, 0, "Instances", obj_pill);
        }
    }
}
