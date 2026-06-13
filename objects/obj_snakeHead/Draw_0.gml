/// @description Отрисовка головы змейки и звезд при столкновении

if (is_eating)
{
    // Рисуем спрайт поедания с текущим кадром, углом поворота головы и масштабом
    draw_sprite_ext(
        spr_snakeHeadEat,
        eat_index,
        x,
        y,
        image_xscale,
        image_yscale,
        image_angle,
        image_blend,
        image_alpha
    );
}
else
{
    // Рисуем обычную голову змейки
    draw_self();
}

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
