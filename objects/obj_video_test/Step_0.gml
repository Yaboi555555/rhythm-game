video_alpha = min(1, video_alpha + video_fade_speed * delta_time / 1000000);
if (seek_pending)
{
    video_seek_to(seek_time);
    seek_pending = false;
}