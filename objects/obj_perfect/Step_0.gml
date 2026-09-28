if (pulse > 0)
{
    pulse -= pulse_speed;

    image_alpha = pulse;
    image_xscale = 1 + pulse * 0.5;
    image_yscale = 1 + pulse * 0.5;
}
else
{
    image_alpha = 0;
    image_xscale = 1;
    image_yscale = 1;
}