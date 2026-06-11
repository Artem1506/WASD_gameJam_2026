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
            
            if (other.object_index == obj_snakeHead)
            {
                // Увеличиваем комбо (не больше 10) для P1
                global.var_combo = min(10, global.var_combo + 1);
                
                // Активация эффектов при наборе комбо
                if (global.var_combo == 5)
                {
                    with (other) { sc_activateConcentration(); }
                    with (obj_audioManger) { play_combo_five(); }
                }
                else if (global.var_combo == 10)
                {
                    global.var_input_lag = 0;
                    global.var_concentration_stored_lag = 0;
                    global.var_concentration_accumulated_lag = 0;
                    with (obj_audioManger) { play_combo_ten(); }
                }
            }
            else // obj_snakeHead_2
            {
                // Увеличиваем комбо (не больше 10) для P2
                global.var_combo_p2 = min(10, global.var_combo_p2 + 1);
                
                // Активация эффектов при наборе комбо
                if (global.var_combo_p2 == 5)
                {
                    with (other) { sc_activateConcentration(); }
                    with (obj_audioManger) { play_combo_five(); }
                }
                else if (global.var_combo_p2 == 10)
                {
                    global.var_input_lag_p2 = 0;
                    global.var_concentration_stored_lag_p2 = 0;
                    global.var_concentration_accumulated_lag_p2 = 0;
                    with (obj_audioManger) { play_combo_ten(); }
                }
            }
            
            // Запуск анимации поедания на голове змейки
            other.is_eating = true;
            other.eat_index = 0;

            // Воспроизводим звук съедания свежего винограда через аудио-менеджер
            with (obj_audioManger)
            {
                play_eat_fresh();
            }

            sc_recalculateSnakeSpeed(other);

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
            // Изменение лага через хелпер во время/вне концентрации
            with (other) { sc_changeInputLag(global.var_input_lag_increment); }
            
            // Сбрасываем комбо при поедании испорченного винограда
            if (other.object_index == obj_snakeHead)
            {
                global.var_combo = 0;
            }
            else
            {
                global.var_combo_p2 = 0;
            }
            
            // Запуск анимации поедания на голове змейки
            other.is_eating = true;
            other.eat_index = 0;

            other.speed_penalties += global.var_speed_increment_2;
            sc_recalculateSnakeSpeed(other);

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
            // Уменьшение лага через хелпер
            with (other) { sc_changeInputLag(-(global.var_input_lag_increment * 3)); }
            
            // Запуск анимации поедания на голове змейки
            other.is_eating = true;
            other.eat_index = 0;

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

/// @description Вспомогательные функции для изменения инпут-лага и эффекта концентрации
function sc_changeInputLag(amount)
{
    if (object_index == obj_snakeHead)
    {
        if (global.var_concentration_active)
        {
            global.var_concentration_accumulated_lag += amount;
        }
        else
        {
            global.var_input_lag = max(0, global.var_input_lag + amount);
        }
    }
    else // obj_snakeHead_2
    {
        if (global.var_concentration_active_p2)
        {
            global.var_concentration_accumulated_lag_p2 += amount;
        }
        else
        {
            global.var_input_lag_p2 = max(0, global.var_input_lag_p2 + amount);
        }
    }
}

function sc_activateConcentration()
{
    if (object_index == obj_snakeHead)
    {
        // Если эффект уже активен, просто обновляем таймер
        if (global.var_concentration_active)
        {
            global.var_concentration_timer = global.var_concentration_time;
        }
        else
        {
            global.var_concentration_active = true;
            global.var_concentration_timer = global.var_concentration_time;
            global.var_concentration_stored_lag = global.var_input_lag;
            global.var_concentration_accumulated_lag = 0;
            
            // На время концентрации лаг ввода равен 0
            global.var_input_lag = 0;
        }
    }
    else // obj_snakeHead_2
    {
        // Если эффект уже активен, просто обновляем таймер
        if (global.var_concentration_active_p2)
        {
            global.var_concentration_timer_p2 = global.var_concentration_time;
        }
        else
        {
            global.var_concentration_active_p2 = true;
            global.var_concentration_timer_p2 = global.var_concentration_time;
            global.var_concentration_stored_lag_p2 = global.var_input_lag_p2;
            global.var_concentration_accumulated_lag_p2 = 0;
            
            // На время концентрации лаг ввода равен 0
            global.var_input_lag_p2 = 0;
        }
    }
}

/// @description Вычисление скорости змейки по экспоненциальной формуле с учетом штрафов
function sc_recalculateSnakeSpeed(head)
{
    with (head)
    {
        move_delay = max(
            global.var_move_delay_min,
            global.var_move_delay_min + (global.var_snake_initial_speed - global.var_move_delay_min) * exp(global.var_speed_increment * global.var_score) + speed_penalties
        );
    }
}
