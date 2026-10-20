selected_song = 0;
scroll_offset = 0;
selected_setting = 0;
selected_lane = 0;
adjusting_setting = false;
rebind_lane = -1;

songs = [
    ["SONG SELECT","!2 NEW!",0 ,rm_songselect],
    ["SETTINGS","& ACCESSIBILITY",0 ,rm_settings],
	["TUTORIAL","SONG MEDLEY",0 ,rm_Spaghetti],
];
song_count = array_length(songs);

preview_sound = noone;


// smooth anim
visual_scale = [];
visual_x = [];

for (var i = 0; i < song_count; i++)
{
    visual_scale[i] = 0.82;
    visual_x[i] = 640;
}

// settings
if (!variable_global_exists("master_volume")) {
    global.master_volume = 0.5;
}

if (!variable_global_exists("note_travel_time")) {
    global.note_travel_time = 2.0;
}

if (!variable_global_exists("lane_keys")) {
    global.lane_keys = [
        ord("D"),
        ord("F"),
        ord("J"),
        ord("K")
    ];
}

rebind_lane = -1;

audio_master_gain(global.master_volume);

// display
function get_lane_key_name(_key) {
    switch (_key) {
        case ord("D"): return "D";
        case ord("F"): return "F";
        case ord("J"): return "J";
        case ord("K"): return "K";
        case vk_space: return "SPACE";
        case vk_shift: return "SHIFT";
        case vk_control: return "CTRL";
        case vk_alt: return "ALT";
        case vk_left: return "LEFT";
        case vk_right: return "RIGHT";
        case vk_up: return "UP";
        case vk_down: return "DOWN";
        case vk_enter: return "ENTER";
        case vk_escape: return "ESC";
        default: return "KEY " + string(_key);
    }
}