var data = video_draw();

if (data[0] == 0 && video_get_format() == video_format_rgba)
{
    draw_set_alpha(video_alpha);

    draw_surface_stretched(
        data[1],
        0,
        0,
        room_width,
        room_height
    );

    draw_set_alpha(1);
}