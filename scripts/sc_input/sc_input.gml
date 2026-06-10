function sc_handleInput()
{
    sc_addInputCommand();
}

function sc_pushCommand(dx, dy)
{
    // Направление не должно быть нулевым
    if (dx == 0 && dy == 0) exit;

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
    if (dx == -last_dir_x && dy == -last_dir_y)
    {
        exit;
    }

    var command =
    {
        dir_x : dx,
        dir_y : dy,
        execute_time : current_time + (global.var_input_lag * 1000)
    };

    array_push(input_queue, command);
}

function sc_addInputCommand()
{
    // Опрашиваем нажатия клавиш независимо для исключения диагонального движения
    var pressed_w = keyboard_check_pressed(ord("W"));
    var pressed_s = keyboard_check_pressed(ord("S"));
    var pressed_a = keyboard_check_pressed(ord("A"));
    var pressed_d = keyboard_check_pressed(ord("D"));

    // Добавляем команды по отдельности. Если нажаты две клавиши одновременно, они запишутся как последовательность шагов.
    if (pressed_w) sc_pushCommand(0, -1);
    if (pressed_s) sc_pushCommand(0, 1);
    if (pressed_a) sc_pushCommand(-1, 0);
    if (pressed_d) sc_pushCommand(1, 0);
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
