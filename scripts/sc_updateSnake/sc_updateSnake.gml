// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_updateSnake()
{
	dir_x = next_dir_x;
    dir_y = next_dir_y;

    var prev_x = grid_x;
    var prev_y = grid_y;

    grid_x += dir_x;
    grid_y += dir_y;

	x = global.arena_left + grid_x * global.grid_size;
	y = global.arena_top + grid_y * global.grid_size;

    for (var i = 0; i < array_length(segments); i++)
    {
        var seg = segments[i];

        var temp_x = seg.grid_x;
        var temp_y = seg.grid_y;

        seg.grid_x = prev_x;
        seg.grid_y = prev_y;

        seg.x = global.arena_left + seg.grid_x * global.grid_size;
        seg.y = global.arena_top + seg.grid_y * global.grid_size;

        prev_x = temp_x;
        prev_y = temp_y;
    }
	
	sc_eatFreshGrape();
	sc_eatRottenGrape();

    sc_checkWallCollision();
	sc_checkTailCollision();
}