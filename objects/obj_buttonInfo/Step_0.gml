/// @description Insert description here
// You can write your code in this editor

event_inherited();

if (show_info == true) {
	scroll_y += mouse_wheel_down() * scroll_speed;
	scroll_y -= mouse_wheel_up() * scroll_speed;

	// ограничение прокрутки
	scroll_y = clamp(scroll_y, 0, 500);
}

if (show_info == true && keyboard_check_pressed(vk_escape)){
	show_info = false;
}