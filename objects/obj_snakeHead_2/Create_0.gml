/// @description Инициализация головы второй змейки
move_timer = 0;

speed_penalties = 0;
move_delay = global.var_snake_initial_speed;

// Таймер задержки старта (3 секунды перед началом движения змейки)
start_delay_timer = 3.0;

// На старте движемся влево
dir_x = -1;
dir_y = 0;

next_dir_x = dir_x;
next_dir_y = dir_y;

segment_count = global.var_snake_initial_segments;

segments = [];

input_queue = [];

// Вычисляем начальные координаты на сетке арены на основе переданных x и y при создании
grid_x = floor((x - global.arena_left) / global.grid_size);
grid_y = floor((y - global.arena_top) / global.grid_size);

// Корректируем координаты x и y объекта для точного выравнивания по сетке
x = global.arena_left + grid_x * global.grid_size;
y = global.arena_top + grid_y * global.grid_size;

for (var i = 0; i < segment_count; i++)
{
    // Так как движемся влево (dir_x = -1), хвост спавнится справа от головы
    var seg = instance_create_layer(
        x - (i + 1) * global.grid_size * dir_x,
        y,
        "Instances", obj_snakeSegment
    );

    seg.grid_x = grid_x - (i + 1) * dir_x;
    seg.grid_y = grid_y;
    
    // Задаем спрайт сегмента для второй змейки
    seg.sprite_index = spr_snakeSegment_2;

    // Начальный поворот сегментов тела змейки (влево - 180)
    seg.image_angle = point_direction(0, 0, dir_x, dir_y);
    seg.rotation_start_angle = seg.image_angle;
    seg.rotation_target_angle = seg.image_angle;

    array_push(segments, seg);
}

// Инициализация угла и параметров анимации поворота (180 градусов)
image_angle = point_direction(0, 0, dir_x, dir_y);
is_rotating = false;
rotation_start_angle = image_angle;
rotation_target_angle = image_angle;
rotation_timer = 0;

// Переменные для анимации звезд при столкновении
show_stars = false;
stars_index = 0;

// Переменные для анимации поедания
is_eating = false;
eat_index = 0;

// Состояние наличия защитной каски
is_helmet = false;
helmet_index = 0;
