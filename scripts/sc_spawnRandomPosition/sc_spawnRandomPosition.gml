// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_spawnRandomPosition()
{
	var valid = false;

    while (!valid)
    {
        grid_x = irandom_range(0, 35);
        grid_y = irandom_range(0, 18);

        valid = true;

        var px = global.arena_left + grid_x * global.grid_size;
        var py = global.arena_top + grid_y * global.grid_size;

        // snake head
        with (obj_snakeHead)
        {
            if (other.grid_x == grid_x && other.grid_y == grid_y)
            {
                valid = false;
            }
        }

        // snake segments
        with (obj_snakeSegment)
        {
            if (other.grid_x == grid_x && other.grid_y == grid_y)
            {
                valid = false;
            }
        }

        // fresh grapes
        with (obj_grapeFresh)
        {
            if (id != other.id)
            {
                if (other.grid_x == grid_x && other.grid_y == grid_y)
                {
                    valid = false;
                }
            }
        }

        // rotten grapes
        with (obj_grapeRotten)
        {
            if (other.grid_x == grid_x && other.grid_y == grid_y)
            {
                valid = false;
            }
        }

        if (valid)
        {
            x = px;
            y = py;
        }
    }
}