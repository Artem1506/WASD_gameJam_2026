function sc_updateSnake()
{
    // Обрабатываем очередь команд строго в момент совершения шага змейкой
    sc_processInputQueue();

    var old_dir_x = dir_x;
    var old_dir_y = dir_y;

    dir_x = next_dir_x;
    dir_y = next_dir_y;

    // Если змейка начала движение, отключаем отображение звезд
    if (dir_x != 0 || dir_y != 0)
    {
        show_stars = false;
    }

    if (dir_x == 0 && dir_y == 0)
    {
        exit;
    }

    // Если направление изменилось, запускаем анимацию поворота головы
    if (dir_x != old_dir_x || dir_y != old_dir_y)
    {
        rotation_start_angle = image_angle;
        rotation_target_angle = point_direction(0, 0, dir_x, dir_y);
        rotation_timer = 0;
        is_rotating = true;
    }

    var next_grid_x = grid_x + dir_x;
    var next_grid_y = grid_y + dir_y;

    // Проверяем столкновение со стеной
    if (sc_checkWallCollision(next_grid_x, next_grid_y))
    {
        audio_play_sound(snd_collision, 1, false);
		
        dir_x = 0;
        dir_y = 0;
        next_dir_x = 0;
        next_dir_y = 0;
        input_queue = [];
        
        global.var_input_lag += global.var_input_lag_increment;
        move_delay += global.var_speed_increment_2;
        
        // Активируем анимацию звезд при столкновении
        show_stars = true;
        stars_index = 0;
        
        exit;
    }

    // Проверяем столкновение с хвостом
    if (sc_checkTailCollision(next_grid_x, next_grid_y))
    {
        audio_play_sound(snd_collision, 1, false, 1, 0.34); // при столкновения с хвостом звонкий удар столкновения не проигрывается 
		
        dir_x = 0;
        dir_y = 0;
        next_dir_x = 0;
        next_dir_y = 0;
        input_queue = [];
        
        global.var_input_lag += global.var_input_lag_increment;
        
        // Активируем анимацию звезд при столкновении
        show_stars = true;
        stars_index = 0;
        
        exit;
    }

    var prev_x = grid_x;
    var prev_y = grid_y;

    grid_x = next_grid_x;
    grid_y = next_grid_y;

    x = global.arena_left + grid_x * global.grid_size;
    y = global.arena_top + grid_y * global.grid_size;

    var prev_target_angle = rotation_target_angle; // Целевой угол головы (уже обновленный на этом шаге)

    for (var i = 0; i < array_length(segments); i++)
    {
        var seg = segments[i];

        var temp_x = seg.grid_x;
        var temp_y = seg.grid_y;

        seg.grid_x = prev_x;
        seg.grid_y = prev_y;

        seg.x = global.arena_left + seg.grid_x * global.grid_size;
        seg.y = global.arena_top + seg.grid_y * global.grid_size;

        // Сохраняем целевой угол текущего сегмента до его обновления на этом шаге
        var old_seg_target = seg.rotation_target_angle;

        // Целевым углом для сегмента становится целевой угол предыдущего элемента
        var new_target = prev_target_angle;

        if (new_target != seg.rotation_target_angle)
        {
            seg.rotation_start_angle = seg.image_angle;
            seg.rotation_target_angle = new_target;
            seg.rotation_timer = 0;
            seg.is_rotating = true;
        }

        // Для следующего сегмента предыдущим целевым углом будет старый целевой угол текущего
        prev_target_angle = old_seg_target;

        prev_x = temp_x;
        prev_y = temp_y;
    }
	
    sc_eatFreshGrape();
    sc_eatRottenGrape();
    sc_eatPill();
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
