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

move_timer += delta_time / 1000000;

sc_handleInput();

if (global.var_input_lag >= global.var_input_lag_threshold)
{
    show_debug_message("GAME OVER");

    //instance_destroy();
}

if (move_timer >= move_delay)
{
    move_timer = 0;

    sc_updateSnake();
}
