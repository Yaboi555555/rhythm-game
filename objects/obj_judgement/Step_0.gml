life++;

judgement_y -= 0.8;

judgement_alpha = 1 - (life / life_max);

if (life >= life_max)
{
    instance_destroy();
}