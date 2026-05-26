// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_addInputCommand()
{
	var input_x = 0;
    var input_y = 0;

    var pressed = false;

    if (keyboard_check_pressed(ord("W")))
    {
        input_y = -1;
        pressed = true;
    }

    if (keyboard_check_pressed(ord("S")))
    {
        input_y = 1;
        pressed = true;
    }

    if (keyboard_check_pressed(ord("A")))
    {
        input_x = -1;
        pressed = true;
    }

    if (keyboard_check_pressed(ord("D")))
    {
        input_x = 1;
        pressed = true;
    }

    if (!pressed)
    {
        exit;
    }

    // запрет разворота
    if (
        input_x == -dir_x
        && input_y == -dir_y
    )
    {
        exit;
    }

    var command =
    {
        dir_x : input_x,
        dir_y : input_y,

        execute_time :
            current_time + (global.var_input_lag * 1000)
    };

    array_push(input_queue, command);
}