selected_song = -1;
scroll_offset = 0;

songs = [
    ["CALL IT WHAT YOU WANT","FAT DOG",snd_CallItWhatYouWant_prev,rm_CallItWhatYouWant,spr_CallItWhatYouWant_cover,84,"2:50",3],
    ["MADE MY NIGHT","LE SSERAFIM",snd_MadeMyNight_prev,rm_Made_My_Night,spr_MMN_cover,125,"2:06",3],
    ["SPAGHETTI","LE SSERAFIM",snd_Spaghetti_prev,rm_Spaghetti,spr_Gracie_cover,111,"2:54",3],
    ["ASH","LE SSERAFIM",snd_Ash_prev,rm_Ash,spr_Ash_cover,112,"3:18",4],
    ["ENERGY","AVA MAX, BIA",snd_Energy_prev,rm_Energy,spr_Energy_cover,130,"3:02",2]
];

song_count = array_length(songs);

preview_sound = noone;

selection_mode = 0;
selected_difficulty = 1;
difficulty_names = ["EASY", "NORMAL", "HARD"];

visual_scale = [];
visual_x = [];

for (var i = 0; i < song_count; i++)
{
    visual_scale[i] = 0.82;
    visual_x[i] = 640;
}
