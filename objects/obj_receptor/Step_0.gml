var dt = delta_time / 1000000;

if (!variable_instance_exists(id, "lane"))
{
    lane = round((x - 440) / 120);
}

pulse = max(0, pulse - dt * 5);
flash = max(0, flash - dt * 4);
glow_phase += dt * 4;

var holding_lane = false;
var receptor_lane = lane;

with (obj_note)
{
    if (holding && lane == receptor_lane)
    {
        holding_lane = true;
    }
}

if (holding_lane)
{
    hold_pulse = min(1, hold_pulse + dt * 5);
}
else
{
    hold_pulse = max(0, hold_pulse - dt * 2);
}
