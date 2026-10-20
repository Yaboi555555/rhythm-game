var screen_w = display_get_gui_width();
var screen_h = display_get_gui_height();

var count = array_length(covers);
var total_width = count * cover_step;

for (var row = 0; row < ceil(screen_h / cover_step) + 1; row++) {
    for (var i = 0; i < count + ceil(screen_w / total_width) + 1; i++) {
        var index = i mod count;
        var scrollx = scroll_x + i * cover_step;
        var scrolly = row * cover_step;

        draw_sprite(covers[index], 0, scrollx, scrolly)
    }
}