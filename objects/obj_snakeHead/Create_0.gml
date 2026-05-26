/// @description Insert description here
// You can write your code in this editor

move_timer = 0;

move_delay = 0.15;

dir_x = 1;
dir_y = 0;

next_dir_x = dir_x;
next_dir_y = dir_y;

segment_count = 10;

segments = [];

input_queue = [];

grid_x = 3;
grid_y = 3;

x = global.arena_left + grid_x * global.grid_size;
y = global.arena_top + grid_y * global.grid_size;

for (var i = 0; i < segment_count; i++)
{
    var seg = instance_create_layer(
        x - (i + 1) * global.grid_size,
        y,
        "Instances", obj_snakeSegment
    );

    seg.grid_x = grid_x - (i + 1);
    seg.grid_y = grid_y;

    array_push(segments, seg);
}