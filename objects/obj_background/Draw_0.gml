draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_alpha(0.15);
draw_set_color(c_white);

for (var yy = -400; yy < room_height + 400; yy += 120)
{
    for (var xx = -400; xx < room_width + 400; xx += 400)
    {
        var xxx = xx + scroll_x;
        var yyy = yy + scroll_y;

        draw_text(
            xxx,
            yyy,
            bg_text
        );
    }
}

draw_set_alpha(1);