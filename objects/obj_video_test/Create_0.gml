if (room == rm_Made_My_Night)
{
    video_open("IMG_9965.mp4");
    seek_time = 7400;
}
else if (room == rm_Ash)
{
    video_open("ASH_VID.mp4");
    seek_time = 1250;
}
else if (room == rm_Spaghetti)
{
    video_open("SPAGHETTI_VID.mp4");
    seek_time = 11000;
}


video_set_volume(0);
video_enable_loop(false);

video_alpha = 0;
video_fade_speed = 0.5;

seek_pending = true;

depth = 10;