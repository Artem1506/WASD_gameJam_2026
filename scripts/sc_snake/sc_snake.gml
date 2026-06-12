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

    // Проверяем лобовое столкновение с другой змейкой
    var other_head = noone;
    if (object_index == obj_snakeHead)
    {
        other_head = instance_find(obj_snakeHead_2, 0);
    }
    else
    {
        other_head = instance_find(obj_snakeHead, 0);
    }

    if (other_head != noone)
    {
        if (next_grid_x == other_head.grid_x && next_grid_y == other_head.grid_y)
        {
            audio_play_sound(snd_collision, 1, false);
            
            // Применяем штрафы к обеим змейкам
            sc_applyCollisionPenalty(id);
            sc_applyCollisionPenalty(other_head);
            
            exit;
        }
    }

    // Проверяем столкновение со стеной
    if (sc_checkWallCollision(next_grid_x, next_grid_y))
    {
        audio_play_sound(snd_collision, 1, false);
		
        sc_applyCollisionPenalty(id);
        
        exit;
    }

    // Проверяем столкновение с хвостом
    if (sc_checkTailCollision(next_grid_x, next_grid_y))
    {
        audio_play_sound(snd_collision, 1, false, 1, 0.34); // при столкновения с хвостом звонкий удар столкновения не проигрывается 
		
        sc_applyCollisionPenalty(id);
        
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
    sc_eatHelmet();
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
    var collision_found = false;
    with (obj_snakeSegment)
    {
        if (grid_x == next_x && grid_y == next_y)
        {
            collision_found = true;
            break;
        }
    }
    return collision_found;
}

/// @description Применение штрафов при столкновении с учетом наличия каски
function sc_applyCollisionPenalty(head)
{
    with (head)
    {
        // Полная остановка змейки и сброс очереди ввода
        dir_x = 0;
        dir_y = 0;
        next_dir_x = 0;
        next_dir_y = 0;
        input_queue = [];

        // Снижение скорости
        speed_penalties += global.var_speed_increment_2;
        sc_recalculateSnakeSpeed(id);

        if (is_helmet)
        {
            // Снимаем защиту каски
            is_helmet = false;
            
            // Звездочки не показываем
            show_stars = false;
            
            // Степень опьянения не накладываем, комбо не сбрасываем
        }
        else
        {
            // Увеличиваем инпут-лаг (накладываем степень опьянения)
            sc_changeInputLag(global.var_input_lag_increment);

            // Сбрасываем комбо
            if (object_index == obj_snakeHead) global.var_combo = 0;
            else global.var_combo_p2 = 0;

            // Активируем анимацию звезд
            show_stars = true;
            stars_index = 0;
        }
    }
}
