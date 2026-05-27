/// @description Insert description here
// You can write your code in this editor

global.grid_size = 32;

global.arena_left   = 64;
global.arena_top    = 64;
global.arena_right  = 1280 - 64;
global.arena_bottom = 720 - 96;

global.var_score = 0;

global.var_input_lag = 0;
global.var_input_lag_increment = 0.1;
global.var_input_lag_threshold = 1.5;

global.var_speed_increment = 0.005;

global.var_life_time = 5;
global.var_life_time_min = 1.0;
global.var_life_time_decrement = 0.25;
global.var_score_speed_threshold = 5; // Порог очков для ускорения порчи ягод

// Новые балансные переменные
global.var_snake_initial_speed = 0.20;
global.var_snake_initial_segments = 10;
global.var_move_delay_min = 0.03;

// Размеры сетки арены
global.arena_width_cells = 36;
global.arena_height_cells = 19;

// Таймер спавна восстановительной таблетки
pill_spawn_timer = irandom_range(30, 60);

instance_create_layer(760, 260, "Instances", obj_snakeHead);

instance_create_layer(0, 0, "Instances", obj_grapeFresh);