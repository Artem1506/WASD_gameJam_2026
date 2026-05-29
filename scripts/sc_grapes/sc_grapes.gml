function sc_spawnRandomPosition()
{
    var valid = false;

    while (!valid)
    {
        grid_x = irandom_range(0, global.arena_width_cells - 1);
        grid_y = irandom_range(0, global.arena_height_cells - 1);

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
            if (id != other.id)
            {
                if (other.grid_x == grid_x && other.grid_y == grid_y)
                {
                    valid = false;
                }
            }
        }

        // pills
        with (obj_pill)
        {
            if (id != other.id)
            {
                if (other.grid_x == grid_x && other.grid_y == grid_y)
                {
                    valid = false;
                }
            }
        }

        if (valid)
        {
            x = px;
            y = py;
        }
    }
}

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

            // Воспроизводим звук съедания свежего винограда через аудио-менеджер
            with (obj_audioManger)
            {
                play_eat_fresh();
            }

            other.move_delay = max(
                global.var_move_delay_min,
                other.move_delay - global.var_speed_increment
            );

            if (global.var_score % global.var_score_speed_threshold == 0)
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

            other.move_delay += global.var_speed_increment_2;

            // Воспроизводим звук съедания испорченного винограда через аудио-менеджер
            with (obj_audioManger)
            {
                play_eat_rotten();
            }

            instance_destroy();

            break;
        }
    }
}

function sc_eatPill()
{
    with (obj_pill)
    {
        if (
            other.grid_x == grid_x
            && other.grid_y == grid_y
        )
        {
            global.var_input_lag = max(0, global.var_input_lag - (global.var_input_lag_increment * 3));

            // Воспроизводим звук съедания таблетки/пилюли через аудио-менеджер
            with (obj_audioManger)
            {
                play_eat_pill();
            }

            instance_destroy();

            break;
        }
    }
}
