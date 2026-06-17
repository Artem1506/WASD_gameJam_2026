/// @description Insert description here
// You can write your code in this editor

//resize_x = (global.width - room_width) / 2
//resize_y = (global.height - room_height) / 2

button1_width = 280-64;
button1_height = 720;

button2_width = 720
button2_height = 360

btn_right = {
	//x1: resize_x + room_width - button1_width,
	x1s: room_width - button1_width,
	//y1: resize_y + room_height - button1_height,
	y1s: room_height - button1_height,
	//x2: resize_x + room_width,
	x2s: room_width,
	//y2: resize_y + room_height,
	y2s: room_height
}
btn_left = { 
	//x1: resize_x,
	x1s: 0,
	//y1: resize_y + room_height - button1_height,
	y1s: room_height - button1_height,
	//x2: resize_x + button1_width,
	x2s: button1_width,
	//y2: resize_y + room_height,
	y2s: room_height
}
btn_up = {
	//x1: resize_x + button1_width,
	x1s: button2_width,
	//y1: resize_y,
	y1s: 0,
	//x2: (resize_x + room_width) - button1_width,
	x2s: room_width - button1_width,
	//y2: resize_y + (room_height/2),
	y2s: room_height/2
}
btn_down = {
	//x1: resize_x + button1_width,
	x1s: button1_width,
	//y1: resize_y + (room_height/2),
	y1s: (room_height/2),
	//x2: (resize_x + room_width) - button1_width,
	x2s: room_width - button1_width,
	//y2: resize_y + room_height,
	y2s: room_height
}
btn_exit = {
	//x1: resize_x,
	x1s: 0,
	//y1: resize_y,
	y1s: 0,
	//x2: resize_x + 64,
	x2s: 64,
	//y2: resize_y + 64,
	y2s: 64
}

right_down = false;
left_down = false;
shoot_down = false;
boost_down = false;
exit_down = false;
