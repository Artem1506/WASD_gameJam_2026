/// @description Отрисовка очков HUD
// Отрисовка элементов HUD

draw_self();

draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_font(f_score);

var old_color = draw_get_color();
draw_set_colour(c_black);
draw_text(x + 30, y + 10, string(global.var_score));

draw_set_colour(old_color);
