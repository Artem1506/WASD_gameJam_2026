/// @description Insert description here
// You can write your code in this editor

if (point_in_rectangle(mouse_x, mouse_y, x, y, x + sprite_width, y + sprite_height)) {
    if (mouse_check_button_pressed(mb_left)) {
        is_pressed = true;
		audio_play_sound(click_snd, 1, false);
		sprite_index = pressed_style;
		} else if (mouse_check_button_released(mb_left) && is_pressed == true) {
			is_pressed = false;
			sprite_index = hovered_style;
				if (callback_function != noone) {
					callback_function(); 
					}
			} else if (!mouse_check_button(mb_left)) {
				if (sprite_index != hovered_style) {
					audio_play_sound(hovered_snd, 10, false, 0.1); }
				sprite_index = hovered_style;
			}
	} else {
    sprite_index = normal_style; 
    is_pressed = false;
}
