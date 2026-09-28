if (flash_alpha > 0)
{
    flash_alpha -= fade_speed;

    if (flash_alpha < 0)
    {
        flash_alpha = 0;
    }
}