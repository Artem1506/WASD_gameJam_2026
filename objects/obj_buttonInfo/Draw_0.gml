/// @description Insert description here
// You can write your code in this editor

draw_self();

if (show_info == true){
	var base_x = 650;
	var base_y = 50 - scroll_y;
	var spacing = 35;
	var padding = 50;
	
	draw_set_font(f_textRus)

	// фон области (опционально)
	draw_set_color(c_black);
	draw_set_alpha(0.8);
	draw_rectangle(600, 0, 1280, 720, false);
	draw_set_alpha(1);

	// текст
	draw_set_color(c_white);
	
	draw_text(base_x + padding, base_y, "ИГРА \"ЗЕЛЕНЫЙ ЗМЕЙ\"");
	draw_text(base_x, base_y + spacing, "разработано командой \"GrampsGamer\" для геймджем.москва 2026г.");
	draw_text(base_x + padding, base_y + spacing * 3, "ГЕЙМПЛЕЙ:");
	draw_text(base_x, base_y + spacing * 4, "змейка перемещается по арене,избегает столкновений с своим хвостом и стенами. Собирает хороший виноград, уклоняется от плохого винограда.");
	draw_text(base_x, base_y + spacing * 5, "ЦЕЛЬ: НАБРАТЬ МАКСИМУМ ОЧКОВ");
	
	draw_sprite(spr_grapeFresh, 0, base_x, base_y + spacing * 7);
	draw_text(base_x + padding, base_y + spacing * 7, "- \"свежий виноград\" при сьедании +1 очко");
	
	draw_sprite(spr_grapeRotten, 0, base_x, base_y + spacing * 9);
	draw_text(base_x + padding, base_y + spacing * 9, "- \"испорченый виноград\" при сьедании на 1 увеличивает степень опьянения.");
	
	draw_sprite(spr_pill, 0, base_x, base_y + spacing * 11);
	draw_text(base_x + padding, base_y + spacing * 11, "- \"таблетка\" при сьедании снимает 3 степени опьянения.");
	
	draw_text(base_x, base_y + spacing * 13, "состояние опьянение увеличиват задержку ввода, чем сильнее опьяние тем хуже змейка реагирует на команды (растет задержка ввода). Столкновение со стенами и с собственным хвостом так же на 1 увеличивают степень опьянения");
	draw_text(base_x, base_y + spacing * 14, "помере увеличения счета постепенно растет скорость движения змейки и уменьшается срок жизни свежего винограда");
	draw_text(base_x, base_y + spacing * 15, "Столкновение со стенами и с собственным хвостом так же на 1 увеличивают степень опьянения и уменьшает скорость движения змейки");
	
	draw_text(base_x + padding, base_y + spacing * 17, "команда разработчиков \"GrampsGamer\":");
	draw_text(base_x, base_y + spacing * 18, "- Артем Ваулин - Продюсер, Геймдизайнер, Програмист, UI/UX дизайнер, VFX");
	draw_text(base_x, base_y + spacing * 19, "- Василий Казаков - Композитор, Саунддизайнер, SFX");
	draw_text(base_x, base_y + spacing * 20, "- Павел - Художник, Аниматор");
	
	draw_text(base_x + padding, base_y + spacing * 22, "Плейтесты:");
	draw_text(base_x, base_y + spacing * 23, "- Ахмедзянов Алексей, RodjerX");
	draw_text(base_x, base_y + spacing * 24, "https://t.me/myArduinoProj");
}
