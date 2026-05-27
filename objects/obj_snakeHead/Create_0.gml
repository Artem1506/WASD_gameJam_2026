/// @description Insert description here
// You can write your code in this editor

move_timer = 0;

move_delay = global.var_snake_initial_speed;

dir_x = 1;
dir_y = 0;

next_dir_x = dir_x;
next_dir_y = dir_y;

segment_count = global.var_snake_initial_segments;

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

// Инициализация угла и параметров анимации поворота
image_angle = point_direction(0, 0, dir_x, dir_y);
is_rotating = false;
rotation_start_angle = image_angle;
rotation_target_angle = image_angle;
rotation_timer = 0;