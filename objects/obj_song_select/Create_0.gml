selected_song = -1;
scroll_offset = 0;


songs = [
    ["MADE MY NIGHT","LE SSERAFIM",snd_MadeMyNight_prev,rm_Made_My_Night,spr_MMN_cover,125,"2:06",3],
    ["GRACIE","NAOMI SCOTT",snd_Gracie_prev,rm_Gracie,spr_Gracie_cover,111,"2:54",3],
    ["BLINDING LIGHTS","THE WEEKND",snd_BlindingLights_prev,rm_BlindingLights,spr_BlindingLights_cover,171,"3:20",4],
];
song_count = array_length(songs);

preview_sound = noone;

// smooth anim
visual_scale = [];
visual_x = [];

for (var i = 0; i < song_count; i++)
{
    visual_scale[i] = 0.82;
    visual_x[i] = 640;
}