
var scale = 1 + pulse * 0.18 + hold_pulse * 0.12;
var layers = 5;
var base_alpha = 0.20;

for (var i = layers; i >= 1; i--)
{
    var layer_scale = scale + i * 0.12;
    var layer_alpha = base_alpha * (1 - (i / (layers + 1)));

    draw_sprite_ext(sprite_index,
        image_index,
        x,
        y,
        layer_scale,
        layer_scale,
        image_angle,
        accent_color,
        layer_alpha
    );
}

draw_sprite_ext(sprite_index,
    image_index,
    x,
    y,
    scale,
    scale,
    image_angle,
    c_white,
    1
);

if (flash > 0)
{
    draw_sprite_ext(sprite_index,
        image_index,
        x,
        y,
        scale,
        scale,
        image_angle,
        c_white,
        flash * 0.7
    );
}
