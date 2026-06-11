/// @description Insert description here
// You can write your code in this editor

event_inherited();

normal_style = ui_buttonStartGame_normal;
hovered_style = ui_buttonStartGame_hovered;
pressed_style = ui_buttonStartGame_pressed;

callback_function = function() {
	global.var_is_multiplayer = true;
	room_goto(rm_2Players);
}
