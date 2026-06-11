/// @description Insert description here
// You can write your code in this editor

event_inherited();

normal_style = ui_buttonAgain_normal;
hovered_style = ui_buttonAgain_hovered;
pressed_style = ui_buttonAgain_pressed;

callback_function = function() {
	if (variable_global_exists("var_is_multiplayer") && global.var_is_multiplayer) {
		room_goto(rm_2Players);
	} else {
		room_goto(rm_main);
	}
}
