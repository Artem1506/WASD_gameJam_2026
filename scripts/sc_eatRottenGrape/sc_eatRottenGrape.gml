// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_eatRottenGrape()
{
	with (obj_grapeRotten)
    {
        if (
            other.grid_x == grid_x
            && other.grid_y == grid_y
        )
        {
            global.var_input_lag += global.var_input_lag_increment;

            instance_destroy();

            break;
        }
    }
}