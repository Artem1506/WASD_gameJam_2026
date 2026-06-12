/// @description Insert description here
// You can write your code in this editor

event_inherited();

normal_style = ui_button2Players_normal;
hovered_style = ui_button2Players_hovered;
pressed_style = ui_button2Players_pressed;

callback_function = function() {
	global.var_is_multiplayer = true;
	room_goto(rm_2Players);
}
