function play_preview()
{
    if (preview_sound != noone)
    {
        audio_stop_sound(preview_sound);
    }

    preview_sound = audio_play_sound(
        songs[selected_song][2],
        1,
        false
    );
}