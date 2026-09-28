function show_judgement(_text, _lane)
{
    var j = instance_create_layer(
        obj_rhythm.receptor_x[_lane],
        obj_rhythm.receptor_y - 70,
        "Instances",
        obj_judgement
    );

    j.judgement_text = _text;
}