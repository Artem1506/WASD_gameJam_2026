/// @description Insert description here
// You can write your code in this editor

draw_self();

if (show_info == true){
	var base_x = 100;
	var base_y = 50 - scroll_y;

	// фон области (опционально)
	draw_set_color(c_black);
	draw_rectangle(80, 30, 500, 300, false);

	// иконка
	draw_sprite(spr_grapeFresh, 0, base_x, base_y);

	// текст
	draw_set_color(c_white);
	draw_text(150, base_y, "свежий виноград");
}
