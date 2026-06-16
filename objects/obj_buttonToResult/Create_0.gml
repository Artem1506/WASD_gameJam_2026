/// @description Insert description here
// You can write your code in this editor

event_inherited();

normal_style = ui_buttonResult_normal;
hovered_style = ui_buttonResult_hovered;
pressed_style = ui_buttonResult_pressed;

callback_function = function() {
	instance_activate_all();
	room_goto(rm_result);
}
