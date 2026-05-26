// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_handleInput()
{
	if (keyboard_check_pressed(ord("W")))
    {
        if (dir_y != 1)
        {
            next_dir_x = 0;
            next_dir_y = -1;
        }
    }

    if (keyboard_check_pressed(ord("S")))
    {
        if (dir_y != -1)
        {
            next_dir_x = 0;
            next_dir_y = 1;
        }
    }

    if (keyboard_check_pressed(ord("A")))
    {
        if (dir_x != 1)
        {
            next_dir_x = -1;
            next_dir_y = 0;
        }
    }

    if (keyboard_check_pressed(ord("D")))
    {
        if (dir_x != -1)
        {
            next_dir_x = 1;
            next_dir_y = 0;
        }
    }
}