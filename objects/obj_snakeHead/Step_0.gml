/// @description Insert description here
// You can write your code in this editor

// Анимация пошагового поворота головы змейки
if (is_rotating)
{
    rotation_timer += delta_time / 1000000;
    
    var diff = angle_difference(rotation_target_angle, rotation_start_angle);
    var total_steps = round(abs(diff) / 30);
    
    if (total_steps > 0)
    {
        var step_dur = 0.3 / total_steps;
        var current_step = floor(rotation_timer / step_dur);
        current_step = clamp(current_step, 0, total_steps);
        
        image_angle = rotation_start_angle + current_step * 30 * sign(diff);
    }
    
    if (rotation_timer >= 0.3)
    {
        image_angle = rotation_target_angle;
        is_rotating = false;
    }
}

// Обновление индекса кадра анимации поедания
if (is_eating)
{
    eat_index += 10 * (delta_time / 1000000);
    var _eat_frames = sprite_get_number(spr_snakeHeadEat);
    if (eat_index >= _eat_frames)
    {
        is_eating = false;
        eat_index = 0;
    }
}

// Обновление индекса кадра анимации звезд при столкновении
if (show_stars)
{
    stars_index += 5 * (delta_time / 1000000);
    var _frames = sprite_get_number(spr_transparentStars);
    if (_frames > 0)
    {
        stars_index = stars_index % _frames;
    }
}

// Обновление индекса кадра анимации каски
if (is_helmet)
{
    helmet_index += 10 * (delta_time / 1000000);
    var _helmet_frames = sprite_get_number(spr_helmetActiv);
    if (_helmet_frames > 0)
    {
        helmet_index = helmet_index % _helmet_frames;
    }
}
else
{
    helmet_index = 0;
}

// Отсчет таймера ускорения банана
if (banana_speed_timer > 0)
{
    banana_speed_timer -= delta_time / 1000000;
    if (banana_speed_timer <= 0)
    {
        banana_speed_timer = 0;
        sc_recalculateSnakeSpeed(id); // Восстанавливаем обычную скорость
    }
}

// Отсчитываем таймер стартовой задержки, если он еще не истек
if (start_delay_timer > 0)
{
    start_delay_timer -= delta_time / 1000000;
}
else
{
    move_timer += delta_time / 1000000;
}

// Ввод доступен только если лаг ввода не достиг критического порога (Game Over)
if (global.var_input_lag < global.var_input_lag_threshold)
{
    sc_handleInput();
}
else
{
    show_debug_message("GAME OVER");
}

if (move_timer >= move_delay)
{
    move_timer = 0;

    sc_updateSnake();
}

// конец игры
if (global.var_input_lag >= global.var_input_lag_threshold){
	move_delay = 10;
	// todo вщбавить анимацию менять спрайт змейки
}
