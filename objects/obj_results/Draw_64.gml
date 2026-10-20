draw_set_alpha(1);
draw_set_color(c_black);
draw_rectangle(0, 0, 1280, 720, false);

// Title
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(640, 65, "RESULTS");

// Rank
draw_set_color(make_color_rgb(180, 80, 255));
draw_text_transformed(640, 175, rank, 4, 4, 0);

// Score
draw_set_color(c_white);
draw_text(640, 285, "SCORE");
draw_text(640, 325, string(gamescore));

// Accuracy
draw_text(390, 420, "ACCURACY");
draw_text(390, 460, string_format(accuracy, 0, 2) + "%");

// Max combo
draw_text(890, 420, "MAX COMBO");
draw_text(890, 460, string(max_combo));

// Notes
draw_set_color(make_color_rgb(100, 255, 150));
draw_text(390, 535, "HIT: " + string(hits));

draw_set_color(make_color_rgb(255, 100, 100));
draw_text(890, 535, "MISS: " + string(misses));

// Footer
draw_set_color(c_white);
draw_text(640, 650, "ENTER  -  SONG SELECT");