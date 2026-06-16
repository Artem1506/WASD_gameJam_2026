/// @description Insert description here
// You can write your code in this editor

if (is_paused) {

    var base_x = 600;
    var base_y = 50 - scroll_y;
    var spacing = 35;
    var padding = 45;

    draw_set_font(f_textRus);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    // фон области (сделан от 575 по оси x)
    draw_set_color(c_black);
    draw_set_alpha(0.8);
    draw_rectangle(570, 0, 1280, 720, false);
    draw_set_alpha(1);

    // текст
    draw_set_color(c_white);

    var current_y = base_y;

    // ---------------- ЗАГОЛОВОК ----------------
    draw_text(base_x + padding, current_y, "ИГРА \"ЗЕЛЕНЫЙ ЗМЕЙ\"");
    current_y += spacing;

    draw_text(base_x, current_y, "Разработано командой \"GrampsGamer\"");
    current_y += spacing * 2;

    // ---------------- ГЕЙМПЛЕЙ ----------------
    draw_text(base_x + padding, current_y, "ГЕЙМПЛЕЙ:");
    current_y += spacing;

    draw_text(base_x, current_y, "Змейка перемещается по арене, избегая столкновений");
    current_y += spacing;
    draw_text(base_x, current_y, "со стенами и хвостом. Игрок собирает полезные предметы");
    current_y += spacing;
    draw_text(base_x, current_y, "и старается избегать испорченного винограда.");
    current_y += spacing * 2;

    // ---------------- ЦЕЛЬ ИГРЫ ----------------
    draw_text(base_x + padding, current_y, "ЦЕЛЬ ИГРЫ:");
    current_y += spacing;

    draw_text(base_x, current_y, "Набрать как можно больше очков и продержаться");
    current_y += spacing;
    draw_text(base_x, current_y, "максимально долго.");
    current_y += spacing * 2;

    // ---------------- УПРАВЛЕНИЕ ----------------
    draw_text(base_x + padding, current_y, "УПРАВЛЕНИЕ:");
    current_y += spacing;

    draw_text(base_x, current_y, "Игрок 1: клавиши WASD для движения.");
    current_y += spacing;
    draw_text(base_x, current_y, "Игрок 2: клавиши-стрелки для движения.");
    current_y += spacing * 2;

    // ---------------- ПРЕДМЕТЫ ----------------
    draw_text(base_x + padding, current_y, "ПРЕДМЕТЫ:");
    current_y += spacing;

    // Fresh grape
    draw_sprite(spr_grapeFresh, 0, base_x, current_y + 16);
    draw_text(base_x + padding, current_y, "- Свежий виноград: дает +1 очко к счету и +1 к комбо.");
    current_y += spacing * 1.5;

    // Rotten grape
    draw_sprite(spr_grapeRotten, 0, base_x, current_y + 24);
    draw_text(base_x + padding, current_y, "- Испорченный виноград: +1 к опьянению и сброс комбо.");
    current_y += spacing * 1.5;

    // Pill
    draw_sprite(spr_pill, 0, base_x, current_y + 16);
    draw_text(base_x + padding, current_y, "- Таблетка: снижает уровень опьянения на 3 пункта");
    current_y += spacing * 1.5;

    // Helmet
    draw_sprite(spr_helmet, 0, base_x, current_y + 16);
    draw_text(base_x + padding, current_y, "- Защитная каска: спасает от одной аварии без потери");
    current_y += spacing;
    draw_text(base_x + padding, current_y, "комбо, лага и скорости змейки.");
    current_y += spacing * 1.5;

    // Cleaner
    draw_sprite(spr_cleaner, 0, base_x, current_y + 16);
    draw_text(base_x + padding, current_y, "- Мусорка: уничтожает 50% случайных плохих ягод.");
    current_y += spacing * 1.5;

    // Banana
    draw_sprite(spr_banan, 0, base_x, current_y + 16);
    draw_text(base_x + padding, current_y, "- Банан: дает +3 очка/комбо, и временно удваивает");
    current_y += spacing;
    draw_text(base_x + padding, current_y, "скорость движения.");
    current_y += spacing * 2;

    // ---------------- МЕХАНИКИ ----------------
    draw_text(base_x + padding, current_y, "МЕХАНИКИ:");
    current_y += spacing;

    draw_text(base_x, current_y, "Опьянение увеличивает задержку ввода: чем выше лаг,");
    current_y += spacing;
    draw_text(base_x, current_y, "тем медленнее змейка реагирует на управление. Игроку");
    current_y += spacing;
    draw_text(base_x, current_y, "приходится планировать свои действия заранее.");
    current_y += spacing;

    draw_text(base_x, current_y, "По мере роста счета увеличивается скорость змейки и");
    current_y += spacing;
    draw_text(base_x, current_y, "ускоряется порча винограда. Любые столкновения с");
    current_y += spacing;
    draw_text(base_x, current_y, "препятствиями (камни, стены, хвост) останавливают");
    current_y += spacing;
    draw_text(base_x, current_y, "движение, сбрасывают комбо и увеличивают лаг.");
    current_y += spacing * 2;

    // ---------------- КОМАНДА ----------------
    draw_text(base_x + padding, current_y, "КОМАНДА РАЗРАБОТКИ:");
    current_y += spacing;

    draw_text(base_x, current_y, "- Артем Ваулин - продюсер, геймдизайнер, программист");
    current_y += spacing;

    draw_text(base_x, current_y, "- Василий Казаков - композитор, саунд-дизайнер");
    current_y += spacing;

    draw_text(base_x, current_y, "- Павел Artmoogl - художник, аниматор");
    current_y += spacing * 2;

    // ---------------- ПЛЕЙТЕСТЫ ----------------
    draw_text(base_x + padding, current_y, "ПЛЕЙТЕСТЫ:");
    current_y += spacing;

    draw_text(base_x, current_y, "- RodjerX  (https://t.me/myArduinoProj)");
    current_y += spacing * 2;

    // ---------------- ВЕРСИЯ ----------------
    draw_text(base_x, current_y, "v. " + GM_version);
}
