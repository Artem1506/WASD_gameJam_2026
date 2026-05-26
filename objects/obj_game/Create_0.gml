/// @description Insert description here
// You can write your code in this editor

global.grid_size = 32;

global.arena_left   = 64;
global.arena_top    = 64;
global.arena_right  = 1280 - 64;
global.arena_bottom = 720 - 64;

instance_create_layer(560, 160, "Instances", obj_snakeHead);

global.var_score = 0;

global.var_input_lag = 0;
global.var_input_lag_increment = 0.1;
global.var_input_lag_threshold = 1.0;

global.var_speed_increment = 0.01;

global.var_life_time = 5;
global.var_life_time_min = 1.0;
global.var_life_time_decrement = 0.25;

instance_create_layer(0, 0, "Instances", obj_grapeFresh);