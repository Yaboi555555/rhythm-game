if (keyboard_check_pressed(ord("W")))
{
    if (selected_song == -1)
    {
        selected_song = 0;
    }
    else
    {
        selected_song--;
        if (selected_song < 0)
        {
            selected_song = song_count - 1;
        }
    }

    play_preview();
}


if (keyboard_check_pressed(ord("S")))
{
    if (selected_song == -1)
    {
        selected_song = 0;
    }
    else
    {
        selected_song++;
        if (selected_song >= song_count)
        {
            selected_song = 0;
        }
    }

    play_preview();
}
// PLAY SONG
if (keyboard_check_pressed(vk_enter))
{
    // Stop preview
    if (preview_sound != noone)
    {
        audio_stop_sound(preview_sound);
        preview_sound = noone;
    }

    // Store the room BEFORE changing rooms
    var destination = songs[selected_song][3];

    room_goto(destination);
    exit;
}


// SMOOTH ANIMATION
for (var i = 0; i < song_count; i++)
{
    var target_scale = 0.82;
    var target_x = 640;

    if (i == selected_song)
    {
        target_scale = 1.0;
        target_x = 660;
    }

    visual_scale[i] = lerp(
        visual_scale[i],
        target_scale,
        0.15
    );

    visual_x[i] = lerp(
        visual_x[i],
        target_x,
        0.15
    );
}