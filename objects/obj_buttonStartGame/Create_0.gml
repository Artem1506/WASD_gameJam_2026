/// @description Insert description here
// You can write your code in this editor

normal_style = ui_buttonStartGame_normal;
hovered_style = ui_buttonStartGame_hovered;
pressed_style = ui_buttonStartGame_pressed;

is_pressed = false;
click_snd = snd_click;
hovered_snd = false;

callback_function = function() {
	room_goto(rm_main);
}
