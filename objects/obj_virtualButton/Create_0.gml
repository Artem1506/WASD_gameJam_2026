/// @description Insert description here
// You can write your code in this editor

button1_width = 280-64;
button1_height = 720;

button2_width = 720
button2_height = 360

btn_right = {
	x1s: room_width - button1_width,
	y1s: room_height - button1_height,
	x2s: room_width,
	y2s: room_height
}
btn_left = { 
	x1s: 0,
	y1s: room_height - button1_height,
	x2s: button1_width,
	y2s: room_height
}
btn_up = {
	x1s: button1_width,
	y1s: 0,
	x2s: room_width - button1_width,
	y2s: room_height/2
}
btn_down = {
	x1s: button1_width,
	y1s: (room_height/2),
	x2s: room_width - button1_width,
	y2s: room_height
}
btn_exit = {
	x1s: 0,
	y1s: 0,
	x2s: 64,
	y2s: 64
}

right_down = false;
left_down = false;
up_down = false;
down_down = false;
exit_down = false;
