selected_song = 0;
scroll_offset = 0;


songs = [
    ["SONG SELECT","!2 NEW!",0 ,rm_songselect],
    ["SETTINGS","& ACCESSIBILITY",0 ,rm_settings],
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