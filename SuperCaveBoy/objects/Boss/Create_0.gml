/// Initialize the Boss creature

hspd = 0;
vspd = 0;
image_speed = 0;
state = boss_idle_state;
hp = 3;

// Create an audio emitter
audio_em = audio_emitter_create();

// Stop the BGM when the boss appears for ATMOSPHERE
if (audio_is_playing(snd_music_oppressive_gloom)) {
	audio_stop_sound(snd_music_oppressive_gloom)
}