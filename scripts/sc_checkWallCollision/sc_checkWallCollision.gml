// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_checkWallCollision()
{
	var px = grid_x * global.grid_size;
    var py = grid_y * global.grid_size;

    if (
        px < global.arena_left
        || px >= global.arena_right
        || py < global.arena_top
        || py >= global.arena_bottom
    )
    {
        show_debug_message("wall collision");
    }
}