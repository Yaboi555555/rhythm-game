draw_set_halign(fa_right);
draw_set_valign(fa_top);

draw_set_color(c_white);

draw_text(
    1200,
    40,
    "SCORE: " + string_format(
        floor(obj_rhythm.UIScore),
        6,
        0
    )
);

draw_text(
    1200,
    75,
    "COMBO: " + string(obj_rhythm.combo)
);