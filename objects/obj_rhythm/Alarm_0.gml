var note = instance_create_layer(
    500,
    100,
    "Instances",
    obj_note
);

note.target_y = 600;

show_debug_message(
    "X: " + string(note.x)
    + " Y: " + string(note.y)
);