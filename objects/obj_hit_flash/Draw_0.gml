draw_set_color(flash_color);
draw_set_alpha(flash_alpha);

draw_rectangle(
    0,
    0,
    room_width,
    25,
    false
);

draw_rectangle(
    0,
    room_height - 25,
    room_width,
    room_height,
    false
);

draw_rectangle(
    0,
    0,
    25,
    room_height,
    false
);

draw_rectangle(
    room_width - 25,
    0,
    room_width,
    room_height,
    false
);

draw_set_alpha(1);
draw_set_color(c_white);