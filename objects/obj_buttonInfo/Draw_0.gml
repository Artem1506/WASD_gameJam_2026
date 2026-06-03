/// @description INFO SCREEN

draw_self();

if (show_info == true) {

    var base_x = 750;
    var base_y = 50 - scroll_y;
    var spacing = 35;
    var padding = 50;

    draw_set_font(f_textRus);

    // фон области
    draw_set_color(c_black);
    draw_set_alpha(0.8);
    draw_rectangle(700, 0, 1280, 720, false);
    draw_set_alpha(1);

    // текст
    draw_set_color(c_white);

    draw_text(base_x + padding, base_y,
    "ИГРА \"ЗЕЛЕНЫЙ ЗМЕЙ\"");

    draw_text(base_x, base_y + spacing,
    "Разработано командой \"GrampsGamer\"");

    draw_text(base_x, base_y + spacing * 2,
    "для GameJam.Moscow 2026");



    // ---------------- ГЕЙМПЛЕЙ ----------------

    draw_text(base_x + padding, base_y + spacing * 4,
    "ГЕЙМПЛЕЙ:");

    draw_text(base_x, base_y + spacing * 5,
    "Змейка перемещается по арене, избегает");

    draw_text(base_x, base_y + spacing * 6,
    "столкновений со стенами и собственным");

    draw_text(base_x, base_y + spacing * 7,
    "хвостом. Игрок собирает свежий виноград");

    draw_text(base_x, base_y + spacing * 8,
    "и старается избегать испорченного.");



    draw_text(base_x + padding, base_y + spacing * 10,
    "ЦЕЛЬ ИГРЫ:");

    draw_text(base_x, base_y + spacing * 11,
    "Набрать как можно больше очков");

    draw_text(base_x, base_y + spacing * 12,
    "и продержаться максимально долго.");



    // ---------------- ПРЕДМЕТЫ ----------------

    draw_sprite(spr_grapeFresh, 0,
    base_x, base_y + 16 + spacing * 14);

    draw_text(base_x + padding,
    base_y + spacing * 14,
    "- Свежий виноград: +1 очко.");



    draw_sprite(spr_grapeRotten, 0,
    base_x, base_y + 16 + spacing * 16);

    draw_text(base_x + padding,
    base_y + spacing * 16,
    "- Испорченный виноград:");

    draw_text(base_x + padding,
    base_y + spacing * 17,
    "увеличивает уровень опьянения.");



    draw_sprite(spr_pill, 0,
    base_x, base_y + 16 + spacing * 19);

    draw_text(base_x + padding,
    base_y + spacing * 19,
    "- Таблетка: снижает уровень");

    draw_text(base_x + padding,
    base_y + spacing * 20,
    "опьянения на 3 единицы.");



    // ---------------- МЕХАНИКИ ----------------

    draw_text(base_x + padding,
    base_y + spacing * 22,
    "МЕХАНИКИ:");

    draw_text(base_x, base_y + spacing * 23,
    "Опьянение увеличивает задержку ввода.");

    draw_text(base_x, base_y + spacing * 24,
    "Чем выше уровень опьянения, тем хуже");

    draw_text(base_x, base_y + spacing * 25,
    "змейка реагирует на команды игрока.");

    draw_text(base_x, base_y + spacing * 26,
    "Игроку приходится планировать");

    draw_text(base_x, base_y + spacing * 27,
    "движение заранее.");


    draw_text(base_x, base_y + spacing * 29,
    "По мере роста счета увеличивается");

    draw_text(base_x, base_y + spacing * 30,
    "скорость змейки и уменьшается время");

    draw_text(base_x, base_y + spacing * 31,
    "жизни свежего винограда.");


    draw_text(base_x, base_y + spacing * 33,
    "Столкновения со стенами и хвостом");

    draw_text(base_x, base_y + spacing * 34,
    "также увеличивают уровень");

    draw_text(base_x, base_y + spacing * 35,
    "опьянения и временно замедляют");

    draw_text(base_x, base_y + spacing * 36,
    "движение змейки.");



    // ---------------- КОМАНДА ----------------

    draw_text(base_x + padding,
    base_y + spacing * 38,
    "КОМАНДА РАЗРАБОТКИ:");

    draw_text(base_x, base_y + spacing * 39,
    "- Артем Ваулин - продюсер,");

    draw_text(base_x, base_y + spacing * 40,
    "геймдизайнер, программист,");

    draw_text(base_x, base_y + spacing * 41,
    "UI/UX-дизайнер, VFX");


    draw_text(base_x, base_y + spacing * 43,
    "- Василий Казаков - композитор,");

    draw_text(base_x, base_y + spacing * 44,
    "саунд-дизайнер, SFX");


    draw_text(base_x, base_y + spacing * 46,
    "- Павел - художник, аниматор");

    // ---------------- ПЛЕЙТЕСТЫ ----------------

    draw_text(base_x + padding,
    base_y + spacing * 48,
    "ПЛЕЙТЕСТЫ:");

    draw_text(base_x, base_y + spacing * 49,
    "- Ахмедзянов Алексей, RodjerX");
    draw_text(base_x + padding, base_y + spacing * 50,
    "TELEGRAM: https://t.me/myArduinoProj");
}
