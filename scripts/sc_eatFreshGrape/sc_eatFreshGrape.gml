// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_eatFreshGrape()
{
    with (obj_grapeFresh)
    {
        if (
            other.grid_x == grid_x
            && other.grid_y == grid_y
        )
        {
            global.var_score += 1;

            other.move_delay = max(
                0.03,
                other.move_delay - global.var_speed_increment
            );

            if (global.var_score % 5 == 0)
            {
                global.var_life_time -= global.var_life_time_decrement;

                global.var_life_time = max(
                    global.var_life_time,
                    global.var_life_time_min
                );
            }

            instance_create_layer(
                0,
                0,
                "Instances",
                obj_grapeFresh
            );

            instance_destroy();

            break;
        }
    }
}
