keys = [
    ord("D"),
    ord("F"),
    ord("J"),
    ord("K")
];

receptor_x = [
    440,
    560,
    680,
    800
];

receptor_y = 600;

note_travel_time = 2.0;
hit_window = 0.200;

UIScore = 0;
notes_hit = 0;
notes_missed = 0;
accuracy_total = 0;
combo = 0;

song_position = 0;

// time, lane
chart = [];
chart_index = 0;

music = noone;

flash_times = [
    5.25,
    8.50,
    12.00,
    16.75,
    20.50
];

flash_index = 0;

flash_alpha = 0;
flash_color = make_color_rgb(180, 80, 255);