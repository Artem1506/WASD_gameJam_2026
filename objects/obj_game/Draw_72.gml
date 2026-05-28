/// @description Insert description here
// You can write your code in this editor

if (!surface_exists(surf_game))
{
    surf_game = surface_create(room_width, room_height);
}

surface_set_target(surf_game);

draw_clear(c_black);
