if (hold_duration > 0)
{
    var hold_height =
        (hold_duration / obj_rhythm.note_travel_time) * 700;

    draw_set_color(c_white);

    draw_rectangle(
        x - 5,
        y,
        x + 5,
        y - hold_height,
        true
    );
}

draw_sprite(
    spr_note,
    0,
    x,
    y
);