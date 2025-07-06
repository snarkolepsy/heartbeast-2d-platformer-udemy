function boss_smash_state(){
	if (!place_meeting(x, y+1, Solid)) {
		if (vspd < 16) { // need to cap how fast the Boss can fall
			vspd += 2;
		}
		move(Solid);
	}
	else {
		// If we've impacted the floor, then we delay for a bit
		state = boss_stall_state;
		alarm[0] = room_speed;
		audio_play_sound_on(audio_em, snd_step, false, 8);
		
		// Checking for collision with Lava object
		if (position_meeting(x, y, Lava)) {
			hp -= 1;
			audio_play_sound(snd_snake, 9, false);
		}
	}
}