/// @description Insert description here
// You can write your code in this editor

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
