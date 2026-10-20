function load_game() {
    var path = working_directory + "rhythm_save.json";

    if (!file_exists(path)) {
        global.master_volume = 1;
        global.note_travel_time = 2.0;
        global.lane_keys = [
            ord("D"),
            ord("F"),
            ord("J"),
            ord("K")
        ];
        return;
    }

    var file = file_text_open_read(path);
    var content = "";

    while (!file_text_eof(file)) {
        content += file_text_read_string(file);
        file_text_readln(file);
    }

    file_text_close(file);

    var data = json_parse(content);

    if (is_struct(data)) {
        if (variable_struct_exists(data, "master_volume")) {
            global.master_volume = data.master_volume;
        } else {
            global.master_volume = 1;
        }

        if (variable_struct_exists(data, "note_travel_time")) {
            global.note_travel_time = data.note_travel_time;
        } else {
            global.note_travel_time = 2.0;
        }

        if (variable_struct_exists(data, "lane_keys")) {
            global.lane_keys = data.lane_keys;
        } else {
            global.lane_keys = [
                ord("D"),
                ord("F"),
                ord("J"),
                ord("K")
            ];
        }
    }
}
