
if (room != rm_settings) {
    exit;
}

if (!variable_instance_exists(id, "selected_setting")) {
    selected_setting = 0;
}

if (!variable_instance_exists(id, "selected_lane")) {
    selected_lane = 0;
}

if (!variable_instance_exists(id, "adjusting_setting")) {
    adjusting_setting = false;
}

if (!variable_instance_exists(id, "rebind_lane")) {
    rebind_lane = -1;
}

if (rebind_lane != -1) {
    if (keyboard_check_pressed(vk_escape)) {
        rebind_lane = -1;
        exit;
    }

    if (keyboard_check_pressed(vk_anykey)) {
        var new_key = keyboard_lastkey;
        var duplicate = false;

        for (var i = 0; i < 4; i++) {
            if (i != rebind_lane && global.lane_keys[i] == new_key) {
                duplicate = true;
            }
        }

        if (new_key != vk_escape && !duplicate) {
            global.lane_keys[rebind_lane] = new_key;
        }

        rebind_lane = -1;
    }

    exit;
}

if (keyboard_check_pressed(vk_escape)) {
    if (adjusting_setting) {
        adjusting_setting = false;
    } else {
        room_goto(rm_menu);
    }

    exit;
}

if (keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up)) {
    selected_setting = (selected_setting + 3) mod 4;
    adjusting_setting = false;
}

if (keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down)) {
    selected_setting = (selected_setting + 1) mod 4;
    adjusting_setting = false;
}

if (selected_setting == 0 || selected_setting == 1) {
    if (adjusting_setting) {
        var change = 0;

        if (keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left)) {
            change = -1;
        }

        if (keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right)) {
            change = 1;
        }

        if (change != 0) {
            if (selected_setting == 0) {
                global.master_volume = clamp(
                    global.master_volume + change * 0.05,
                    0,
                    1
                );

                audio_master_gain(global.master_volume);
            } else {
                global.note_travel_time = clamp(
                    global.note_travel_time - change * 0.1,
                    0.75,
                    3.0
                );
            }
        }
    }
}

if (selected_setting == 2) {
    if (keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left)) {
        selected_lane = (selected_lane + 3) mod 4;
    }

    if (keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right)) {
        selected_lane = (selected_lane + 1) mod 4;
    }
}

if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
    if (selected_setting == 0 || selected_setting == 1) {
        adjusting_setting = !adjusting_setting;
    } else if (selected_setting == 2) {
        rebind_lane = selected_lane;
    } else if (selected_setting == 3) {
        room_goto(rm_menu);
    }
}

save_game();