/// @description Insert description here
// You can write your code in this editor

event_inherited();

normal_style = ui_buttonInfo_normal;
hovered_style = ui_buttonInfo_hovered;
pressed_style = ui_buttonInfo_pressed;

scroll_y = 0;
scroll_speed = 32;
show_info = false;

callback_function = function() {
	if (show_info == false) {
		show_info = true}
	else {show_info = false}
}
