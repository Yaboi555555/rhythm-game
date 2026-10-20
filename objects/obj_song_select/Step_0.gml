if (selection_mode == 0)
{
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

    if (keyboard_check_pressed(vk_enter) && selected_song >= 0)
    {
        if (selected_song == 2)
        {
            selection_mode = 1;
            selected_difficulty = 1;
        }
        else
        {
            if (preview_sound != noone)
            {
                audio_stop_sound(preview_sound);
                preview_sound = noone;
            }

            var duration_text = songs[selected_song][6];
            var colon_pos = string_pos(":", duration_text);
            var minutes = real(string_copy(duration_text, 1, colon_pos - 1));
            var seconds = real(string_copy(duration_text, colon_pos + 1, string_length(duration_text) - colon_pos));

            global.selected_song_length = minutes * 60 + seconds;

            var destination = songs[selected_song][3];

            room_goto(destination);
            exit;
        }
    }
}
else
{ //spaghetti
    if (keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_left))
    {
        selected_difficulty--;
        if (selected_difficulty < 0)
        {
            selected_difficulty = 2;
        }
    }

    if (keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_right))
    {
        selected_difficulty++;
        if (selected_difficulty > 2)
        {
            selected_difficulty = 0;
        }
    }

    if (keyboard_check_pressed(vk_escape))
    {
        selection_mode = 0;
    }

    if (keyboard_check_pressed(vk_enter))
    {
        if (preview_sound != noone)
        {
            audio_stop_sound(preview_sound);
            preview_sound = noone;
        }

        global.selected_song_length = 174;
        global.selected_difficulty = selected_difficulty;

        room_goto(rm_Spaghetti);
        exit;
    }
}

//smooth anim

for (var i = 0; i < song_count; i++)
{
    var target_scale = 0.82;
    var target_x = 640;

    if (i == selected_song)
    {
        target_scale = 1.0;
        target_x = 660;
    }

    visual_scale[i] = lerp(visual_scale[i], target_scale, 0.15);
    visual_x[i] = lerp(visual_x[i], target_x, 0.15);
}