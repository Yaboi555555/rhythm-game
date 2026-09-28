function hit_note(_lane)
{
    var closest_note = noone;
    var closest_difference = obj_rhythm.hit_window + 1;

    var count = instance_number(obj_note);

    for (var i = 0; i < count; i++)
    {
        var note = instance_find(obj_note, i);

        if (note.lane == _lane &&
            !note.hit &&
            !note.missed)
        {
            var difference = abs(
                note.hit_time -
                obj_rhythm.song_position
            );

            if (difference < closest_difference)
            {
                closest_difference = difference;
                closest_note = note;
            }
        }
    }

    if (closest_note == noone)
    {
        return;
    }

    var timing_error = abs(
        closest_note.hit_time -
        obj_rhythm.song_position
    );

    if (timing_error > obj_rhythm.hit_window)
    {
        return;
    }

    var hit_score =
        100 * (
            1 -
            timing_error / obj_rhythm.hit_window
        );

    hit_score = clamp(hit_score, 1, 100);

    if (hit_score >= 90)
    {
        show_judgement("PERFECT!", _lane);
    }
    else if (hit_score >= 70)
    {
        show_judgement("GREAT", _lane);
    }
    else if (hit_score >= 40)
    {
        show_judgement("GOOD", _lane);
    }
    else
    {
        show_judgement("BAD", _lane);
    }

    obj_rhythm.UIScore += hit_score;
    obj_rhythm.notes_hit++;
    obj_rhythm.accuracy_total += hit_score;
    obj_rhythm.combo++;

    if (closest_note.hold_duration > 0)
    {
        closest_note.hit = true;
        closest_note.holding = true;

        closest_note.hold_start_time =
            obj_rhythm.song_position;

        closest_note.hold_points = 0;

        return;
    }
    with (closest_note)
    {
        instance_destroy();
    }
}
