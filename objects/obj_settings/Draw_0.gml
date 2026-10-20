if (room != rm_settings) {
    exit;
}

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(1);
draw_set_color(c_white);

var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();
var center_x = gui_w / 2;

draw_set_color(c_white);
draw_text(center_x, 65, "OPTIONS");

var panel_x = center_x;
var panel_w = 500;
var panel_h = 100;

var volume_y = 175;
var speed_y = 290;
var controls_y = 420;

// VOLUME
draw_set_alpha(1);
draw_set_color(c_black);
draw_rectangle(
    panel_x - panel_w / 2,
    volume_y - panel_h / 2,
    panel_x + panel_w / 2,
    volume_y + panel_h / 2,
    false
);

draw_set_color(c_white);
draw_rectangle(
    panel_x - panel_w / 2 - 3,
    volume_y - panel_h / 2 - 3,
    panel_x + panel_w / 2 + 3,
    volume_y + panel_h / 2 + 3,
    true
);

draw_text(panel_x, volume_y - 25, "VOLUME");

var slider_left = panel_x - 150;
var slider_right = panel_x + 150;
var slider_y = volume_y + 15;

draw_set_color(c_gray);
draw_rectangle(slider_left, slider_y - 5, slider_right, slider_y + 5, false);

draw_set_color(c_white);
draw_rectangle(
    slider_left,
    slider_y - 5,
    slider_left + (slider_right - slider_left) * global.master_volume,
    slider_y + 5,
    false
);

draw_set_color(c_white);
draw_text(panel_x, volume_y + 38, string(round(global.master_volume * 100)) + "%");

// NOTE SPEED
draw_set_color(c_black);
draw_rectangle(
    panel_x - panel_w / 2,
    speed_y - panel_h / 2,
    panel_x + panel_w / 2,
    speed_y + panel_h / 2,
    false
);

draw_set_color(c_white);
draw_rectangle(
    panel_x - panel_w / 2 - 3,
    speed_y - panel_h / 2 - 3,
    panel_x + panel_w / 2 + 3,
    speed_y + panel_h / 2 + 3,
    true
);

draw_text(panel_x, speed_y - 25, "NOTE SPEED");

var speed_value = (3.0 - global.note_travel_time) / 2.25;

draw_set_color(c_black);
draw_rectangle(slider_left, speed_y + 10, slider_right, speed_y + 20, false);

draw_set_color(c_white);
draw_rectangle(
    slider_left,
    speed_y + 10,
    slider_left + (slider_right - slider_left) * clamp(speed_value, 0, 1),
    speed_y + 20,
    false
);

draw_set_color(c_white);

if (global.note_travel_time < 1.25) {
    draw_text(panel_x, speed_y + 38, "FAST");
} else if (global.note_travel_time > 2.5) {
    draw_text(panel_x, speed_y + 38, "SLOW");
} else {
    draw_text(panel_x, speed_y + 38, "NORMAL");
}

// CONTROLS
draw_set_color(c_white);
draw_text(panel_x, controls_y - 45, "CONTROLS");

for (var i = 0; i < 4; i++) {
    var button_x = center_x - 165 + i * 110;
    var button_y = controls_y + 5;
    var button_w = 90;
    var button_h = 55;

    draw_set_alpha(1);
    draw_set_color(c_black);

    draw_rectangle(
        button_x - button_w / 2,
        button_y - button_h / 2,
        button_x + button_w / 2,
        button_y + button_h / 2,
        false
    );

    var outline_color = c_white;

    if (selected_setting == 2 && selected_lane == i) {
        outline_color = c_aqua;
    }

    if (rebind_lane == i) {
        outline_color = c_yellow;
    }

    draw_set_color(outline_color);

    draw_rectangle(
        button_x - button_w / 2 - 4,
        button_y - button_h / 2 - 4,
        button_x + button_w / 2 + 4,
        button_y + button_h / 2 + 4,
        true
    );

    draw_set_color(c_white);

    if (rebind_lane == i) {
        draw_text(button_x, button_y, "PRESS KEY");
    } else {
        draw_text(
            button_x,
            button_y,
            get_lane_key_name(global.lane_keys[i])
        );
    }
}
// BACK BUTTON
var back_y = gui_h - 65;

draw_set_color(c_black);
draw_rectangle(
    center_x - 120,
    back_y - 25,
    center_x + 120,
    back_y + 25,
    false
);

draw_set_color(c_white);
draw_rectangle(
    center_x - 123,
    back_y - 28,
    center_x + 123,
    back_y + 28,
    true
);

draw_text(center_x, back_y, "BACK");

draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// outline

if (selected_setting == 0) {
    draw_set_color(c_yellow);
    draw_rectangle(
        panel_x - panel_w / 2 - 5,
        volume_y - panel_h / 2 - 5,
        panel_x + panel_w / 2 + 5,
        volume_y + panel_h / 2 + 5,
        true
    );
}

if (selected_setting == 1) {
    draw_set_color(c_yellow);
    draw_rectangle(
        panel_x - panel_w / 2 - 5,
        speed_y - panel_h / 2 - 5,
        panel_x + panel_w / 2 + 5,
        speed_y + panel_h / 2 + 5,
        true
    );
}
// controls
if (selected_setting == i + 2) {
    draw_set_color(c_yellow);
    draw_rectangle(
        button_x - button_w / 2 - 6,
        button_y - button_h / 2 - 6,
        button_x + button_w / 2 + 6,
        button_y + button_h / 2 + 6,
        true
    );
}

// back, i know this is inefficient but it WORKS
if (selected_setting == 6) {
    draw_set_color(c_yellow);
    draw_rectangle(
        center_x - 128,
        back_y - 33,
        center_x + 128,
        back_y + 33,
        true
    );
}