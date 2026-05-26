/// @description Insert description here
// You can write your code in this editor

move_timer += delta_time / 1000000;

sc_handleInput();

if (move_timer >= move_delay)
{
    move_timer = 0;

    sc_updateSnake();
}
