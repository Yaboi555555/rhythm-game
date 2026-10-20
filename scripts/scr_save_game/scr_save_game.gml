function save_game() {
    var path = working_directory + "rhythm_save.json";

    var file = file_text_open_write(path);

    var save_data = {
        master_volume: global.master_volume,
        note_travel_time: global.note_travel_time,
        lane_keys: global.lane_keys
    };

    file_text_write_string(file, json_stringify(save_data));
    file_text_close(file);
}
