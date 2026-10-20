scroll_x -= scroll_speed;

if (scroll_x <= -cover_step) {
    scroll_x += cover_step;
}