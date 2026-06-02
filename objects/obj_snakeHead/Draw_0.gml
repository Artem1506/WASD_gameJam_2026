/// @description Отрисовка головы змейки и звезд при столкновении

// Сначала рисуем саму голову змейки
draw_self();

// Если произошло столкновение, рисуем зацикленную анимацию звезд
if (show_stars)
{
    draw_sprite( spr_transparentStars, stars_index, x, y );
}
