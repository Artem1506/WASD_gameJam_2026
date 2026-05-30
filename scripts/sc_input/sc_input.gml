function sc_handleInput()
{
    sc_addInputCommand();
}

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

    // Вычисляем последнее запланированное направление змейки в очереди (или текущее, если очередь пуста)
    var last_dir_x = dir_x;
    var last_dir_y = dir_y;
    var q_size = array_length(input_queue);
    if (q_size > 0)
    {
        var last_cmd = input_queue[q_size - 1];
        last_dir_x = last_cmd.dir_x;
        last_dir_y = last_cmd.dir_y;
    }

    // Запрет разворота на 180 градусов относительно последнего запланированного вектора движения
    if (
        input_x == -last_dir_x
        && input_y == -last_dir_y
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
