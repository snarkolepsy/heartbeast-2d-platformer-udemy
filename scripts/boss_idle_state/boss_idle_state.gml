function boss_idle_state(){
	var dis = point_distance(x, y, Player.x, Player.y);
	
	// Aggros when player is close enough, start the boss behavior and "mood"
	if (dis <= 128) {
		state = boss_lift_state;
		
		if(audio_is_playing(snd_music_oppressive_gloom)) {
			audio_emitter_gain(audio_em, 0.5);
			audio_play_sound_on(audio_em, snd_music_volatile_reaction, true, 10);
		}
	}
}