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

// Если произошло столкновение, рисуем зацикленную анимацию звезд
if (show_stars)
{
    var stars_width = sprite_get_width(spr_transparentStars);
    var stars_height = sprite_get_height(spr_transparentStars);
    
    draw_sprite(
        spr_transparentStars, 
        stars_index, 
        x - stars_width / 2, 
        y - stars_height / 2
    );
}
