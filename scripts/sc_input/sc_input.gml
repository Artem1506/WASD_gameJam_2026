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

    // Задаем лаг в зависимости от того, какая змейка опрашивается
    var lag = (object_index == obj_snakeHead) ? global.var_input_lag : global.var_input_lag_p2;

    var command =
    {
        dir_x : dx,
        dir_y : dy,
        execute_time : current_time + (lag * 1000)
    };

    array_push(input_queue, command);
}

function sc_addInputCommand()
{
    var pressed_up, pressed_down, pressed_left, pressed_right;

    // Опрашиваем клавиши в зависимости от того, какая это змейка
    if (object_index == obj_snakeHead)
    {
        pressed_up = keyboard_check_pressed(ord("W")) || obj_virtualButton.up_down;
        pressed_down = keyboard_check_pressed(ord("S")) || obj_virtualButton.down_down;
        pressed_left = keyboard_check_pressed(ord("A")) || obj_virtualButton.left_down;
        pressed_right = keyboard_check_pressed(ord("D")) || obj_virtualButton.right_down;
    }
    else // obj_snakeHead_2
    {
        pressed_up = keyboard_check_pressed(vk_up);
        pressed_down = keyboard_check_pressed(vk_down);
        pressed_left = keyboard_check_pressed(vk_left);
        pressed_right = keyboard_check_pressed(vk_right);
    }

    // Добавляем команды по отдельности. Если нажаты две клавиши одновременно, они запишутся как последовательность шагов.
    if (pressed_up) sc_pushCommand(0, -1);
    if (pressed_down) sc_pushCommand(0, 1);
    if (pressed_left) sc_pushCommand(-1, 0);
    if (pressed_right) sc_pushCommand(1, 0);
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
