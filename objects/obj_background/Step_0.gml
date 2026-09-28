
//scroll_x += scroll_speed;
//scroll_y += scroll_speed;

//if (scroll_x > 400)
//{
//    scroll_x -= 400;
//}
//
//if (scroll_y > 400)
//{
//    scroll_y -= 400;
//}


t += (bpm / 60) * (delta_time / 1000000); //deltatime in microsecs
scroll_x = t * 100;
scroll_y = t * 100 + sin(t * pi) * 50;

scroll_x = scroll_x mod 400;
scroll_y = scroll_y mod 400;