/// @description Insert description here
// You can write your code in this editor

grid_x = 0;
grid_y = 0;

sc_spawnRandomPosition();

// Создаем систему частиц ps_pill в точке ориджин пилюли
pill_particles = part_system_create(ps_pill);
part_system_position(pill_particles, x, y);
audio_play_sound(snd_medsSpawn, 1, false);

life_timer = 0;
life_time = 9; // Исчезает через 10 секунд
