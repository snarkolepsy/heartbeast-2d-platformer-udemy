/// @description Start playing the BGM

// Create an audio emitter for BGM
audio_em = audio_emitter_create();

audio_emitter_gain(audio_em, 0.1);
audio_play_sound_on(audio_em, snd_music_oppressive_gloom, true, 10);