/// @description Insert description here
// You can write your code in this editor

global.grid_size = 32;

global.arena_left   = 64;
global.arena_top    = 64;
global.arena_right  = 1280 - 32; 
global.arena_bottom = 720 - 80;

global.var_score = 0;

global.var_combo = 0;

// Переменные для эффекта концентрации
global.var_concentration_time = 5.0; // Длительность концентрации в секундах
global.var_concentration_active = false;
global.var_concentration_timer = 0;
global.var_concentration_stored_lag = 0;
global.var_concentration_accumulated_lag = 0;

global.var_input_lag = 0;
global.var_input_lag_increment = 0.1;
global.var_input_lag_threshold = 1.5;

global.var_speed_increment = 0.005;  //увеличение скорости при хорошем фрукте
global.var_speed_increment_2 = 0.01; //уменьшение скорости при столкновении

global.var_life_time = 6;
global.var_life_time_min = 1.0;
global.var_life_time_decrement = 0.15;
global.var_score_speed_threshold = 5; // Порог очков для ускорения порчи ягод

// Новые балансные переменные
global.var_snake_initial_speed = 0.20;
global.var_snake_initial_segments = 10;
global.var_move_delay_min = 0.03;

// Размеры сетки арены
global.arena_width_cells = 37;
global.arena_height_cells = 18;


instance_create_layer(0, 0, "Instances", obj_grapeFresh);

// ============================================================================
instance_create_layer(x, y, "Instances", obj_snakeHead);
// ============================================================================

surf_game = -1;

// Таймер окончания игры (-1 означает, что игра продолжается)
game_over_timer = -1;

// Параметры анимации стартового светофора
show_traffic_light = true;
traffic_light_index = 0;

// Запуск циклического таймера спавна таблетки
alarm[0] = 60;
