/// @description Отрисовка головы змейки 2 и звезд при столкновении

// Рисуем обычную голову второй змейки (т.к. отдельного спрайта поедания нет)
draw_self();

// Рисуем активную каску поверх головы змейки
if (is_helmet)
{
    draw_sprite_ext(
        spr_helmetActiv,
        helmet_index,
        x,
        y,
        image_xscale,
        image_yscale,
        image_angle,
        image_blend,
        image_alpha
    );
}

// Если произошло столкновение, рисуем зацикленную анимацию звезд
if (show_stars)
{ 
    draw_sprite(spr_transparentStars, stars_index, x, y);
}
