instrumental_voice = audio_play_sound(room_instrumental, 0, false);
acapella_voice = audio_play_sound(room_acapella, 0, false);

audio_sound_gain(instrumental_voice, global.master_volume, 0);
audio_sound_gain(acapella_voice, global.master_volume, 0);

acapella_muted_until = 0;