song_position = audio_sound_get_track_position(music);


while (chart_index < array_length(chart))
{
	var note_time = chart[chart_index][0];
	var lane = chart[chart_index][1];
	var hold_duration = chart[chart_index][2];

    if (song_position >= note_time - note_travel_time)
    {
        var note = instance_create_layer(
            receptor_x[lane],
            -100,
            "Instances",
            obj_note
        );

        note.hit_time = note_time;
		note.lane = lane;
		note.target_y = receptor_y;
		note.hold_duration = hold_duration;
        chart_index++;
    }
    else
    {
        break;
    }
}

if (keyboard_check_pressed(ord("D")))
{
    hit_note(0);
}

if (keyboard_check_pressed(ord("F")))
{
    hit_note(1);
}

if (keyboard_check_pressed(ord("J")))
{
    hit_note(2);
}

if (keyboard_check_pressed(ord("K")))
{
    hit_note(3);
}

if (flash_index < array_length(flash_times))
{
    if (song_position >= flash_times[flash_index])
    {
        flash_alpha = 0.35;

        flash_index++;
    }
}
if (flash_alpha > 0)
{
    flash_alpha -= 0.02;

    if (flash_alpha < 0)
    {
        flash_alpha = 0;
    }
}