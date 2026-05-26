/// @description Insert description here
// You can write your code in this editor

draw_set_halign(fa_left);
draw_set_valign(fa_top);

var old_color = draw_get_color();
draw_set_colour(c_black);
draw_text(
    x,
    y,
    "Score: " + string(global.var_score)
);

draw_set_colour(old_color);
