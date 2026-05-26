function sc_updateSnake()
{
    dir_x = next_dir_x;
    dir_y = next_dir_y;

    if (dir_x == 0 && dir_y == 0)
    {
        exit;
    }

    var next_grid_x = grid_x + dir_x;
    var next_grid_y = grid_y + dir_y;

    // Проверяем столкновение со стеной
    if (sc_checkWallCollision(next_grid_x, next_grid_y))
    {
        show_debug_message("wall collision");
        
        dir_x = 0;
        dir_y = 0;
        next_dir_x = 0;
        next_dir_y = 0;
        input_queue = [];
        
        global.var_input_lag += global.var_input_lag_increment;
        exit;
    }

    // Проверяем столкновение с хвостом
    if (sc_checkTailCollision(next_grid_x, next_grid_y))
    {
        show_debug_message("tail collision");
        
        dir_x = 0;
        dir_y = 0;
        next_dir_x = 0;
        next_dir_y = 0;
        input_queue = [];
        
        global.var_input_lag += global.var_input_lag_increment;
        exit;
    }

    var prev_x = grid_x;
    var prev_y = grid_y;

    grid_x = next_grid_x;
    grid_y = next_grid_y;

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
}

function sc_checkWallCollision(next_x, next_y)
{
    var px = global.arena_left + next_x * global.grid_size;
    var py = global.arena_top + next_y * global.grid_size;

    if (
        px < global.arena_left
        || px >= global.arena_right
        || py < global.arena_top
        || py >= global.arena_bottom
    )
    {
        return true;
    }
    return false;
}

function sc_checkTailCollision(next_x, next_y)
{
    for (var i = 0; i < array_length(segments); i++)
    {
        var seg = segments[i];

        if (
            seg.grid_x == next_x
            && seg.grid_y == next_y
        )
        {
            return true;
        }
    }
    return false;
}
