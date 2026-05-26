// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_processInputQueue()
{
	if (array_length(input_queue) <= 0)
    {
        exit;
    }

    var command = input_queue[0];

    if (current_time >= command.execute_time)
    {
        next_dir_x = command.dir_x;
        next_dir_y = command.dir_y;

        array_delete(input_queue, 0, 1);
    }
}