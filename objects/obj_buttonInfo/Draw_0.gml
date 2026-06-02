/// @description Insert description here
// You can write your code in this editor

draw_self();

if (show_info == true){
	var base_x = 500;
	var base_y = 0 - scroll_y;
	var spacing = 35
	
	draw_set_font(f_textRus)

	// фон области (опционально)
	draw_set_color(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(500, 0, 1280, 720, false);
	draw_set_alpha(1);

	// иконка
	draw_sprite(spr_grapeFresh, 0, base_x, base_y);

	// текст
	draw_set_color(c_white);
	draw_text(base_x + 150, base_y + spacing, "свежий виноград");
}
