/// @description Insert description here
// You can write your code in this editor

event_inherited();

normal_style = ui_buttonInfo_normal;
hovered_style = ui_buttonInfo_hovered;
pressed_style = ui_buttonInfo_pressed;

callback_function = function() {
	if (obj_pause.is_paused == true) {
		obj_pause.is_paused = false}
	else {obj_pause.is_paused = true}
}
