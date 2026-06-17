/// @description Insert description here
// You can write your code in this editor

right_down = false;
left_down = false;
up_down = false;
down_down = false;
exit_down = false;
	
if (device_mouse_check_button(0, mb_left)) {
	if (point_in_rectangle(
		mouse_x, mouse_y,
		btn_right.x1s, btn_right.y1s,
		btn_right.x2s, btn_right.y2s
	)) { right_down = true; }

	if (point_in_rectangle(
		mouse_x, mouse_y,
		btn_left.x1s, btn_left.y1s,
		btn_left.x2s, btn_left.y2s
	)) { left_down = true; }

	if (point_in_rectangle(
		mouse_x, mouse_y,
		btn_up.x1s, btn_up.y1s,
		btn_up.x2s, btn_up.y2s
	)) { up_down = true; }

	if (point_in_rectangle(
		mouse_x, mouse_y,
		btn_down.x1s, btn_down.y1s,
		btn_down.x2s, btn_down.y2s
	)) { down_down = true; }

	if (point_in_rectangle(
		mouse_x, mouse_y,
		btn_exit.x1s, btn_exit.y1s,
		btn_exit.x2s, btn_exit.y2s
	)) { exit_down = true; }
}	
