pulse = 0;
pulse_speed = 0.15;

image_alpha = 0;
image_xscale = 1;
image_yscale = 1;

function trigger_pulse()
{
    pulse = 1;

    image_alpha = 1;
    image_xscale = 1.5;
    image_yscale = 1.5;
}