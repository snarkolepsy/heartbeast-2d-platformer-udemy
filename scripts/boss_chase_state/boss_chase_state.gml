function boss_chase_state(){
	// If we're atop the player, drop down onto them!
	var dis = point_distance(x, y, Player.x, y); // We only need to know the horizontal distance
	
	// When we're above the player, drop down and play a sound fx
	if (dis < sprite_width/2-16 || place_meeting(x-1, y, Solid) || place_meeting(x+1, y, Solid)) {
		// Check if Player is up against a wall
		state = boss_smash_state;
		audio_play_sound_on(audio_em, snd_step, false, 6);
		hspd = 0;
	}
	else { // not close enough yet, keep moving closer to the Player
		hspd = (Player.x - x)*0.05;
	}
	
	move(Solid);
}