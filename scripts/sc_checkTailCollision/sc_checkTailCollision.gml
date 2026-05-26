// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_checkTailCollision()
{
	for (var i = 0; i < array_length(segments); i++)
    {
        var seg = segments[i];

        if (
            seg.grid_x == grid_x
            && seg.grid_y == grid_y
        )
        {
            show_debug_message("tail collision");
        }
    }
}