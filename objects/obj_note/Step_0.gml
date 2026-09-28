var time_until_hit =
    hit_time - obj_rhythm.song_position;

x = obj_rhythm.receptor_x[lane];

y = target_y - (time_until_hit / obj_rhythm.note_travel_time) * 700;

// norm miss
if (!hit &&
    !missed &&
    obj_rhythm.song_position >
    hit_time + obj_rhythm.hit_window)
{
    missed = true;

    obj_rhythm.notes_missed++;
    obj_rhythm.combo = 0;

    show_judgement("MISS", lane);

    instance_destroy();

    exit;
}


// hold
if (hit && hold_duration > 0)
{
    var key = obj_rhythm.keys[lane];
    var hold_end = hit_time + hold_duration;

    if (keyboard_check(key))
    {
        var held_time = obj_rhythm.song_position - hold_start_time;

        held_time = clamp(
            held_time,
            0,
            hold_duration
        );

        var hold_progress =
            held_time / hold_duration;
        var new_hold_points = hold_progress * 100; //percentage based, max points 100 head 100 body = 200

        var points_this_step = new_hold_points - hold_points;
		
        if (points_this_step > 0)
        {
            obj_rhythm.UIScore += points_this_step;
            obj_rhythm.accuracy_total += points_this_step;
            hold_points = new_hold_points;
        }
		
        if (obj_rhythm.song_position >= hold_end)
        {
            show_judgement("HOLD!", lane);
            instance_destroy();
            exit;
        }
    }
    else
    {
        var held_time = obj_rhythm.song_position - hold_start_time;

        held_time = clamp(
            held_time,
            0,
            hold_duration
        );
        var hold_progress = held_time / hold_duration;
        var final_hold_points = hold_progress * 100;
        var remaining_points = final_hold_points - hold_points;


        if (remaining_points > 0)
        {
            obj_rhythm.UIScore += remaining_points;
            obj_rhythm.accuracy_total += remaining_points;
        }

        show_judgement("RELEASE", lane);
        instance_destroy();
        exit;
    }
}