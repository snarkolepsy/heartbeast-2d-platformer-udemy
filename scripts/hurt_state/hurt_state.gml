function hurt_state(){
	sprite_index = spr_player_hurt;
	
	// Determine direction to flip the Player sprite
	if (hspd != 0) image_xscale = sign(hspd); // Convert into a FUNCTION?!
	
	// Apply gravity
	if (!place_meeting(x, y+1, Solid)) {
		vspd += grav;
	}
	else {
		vspd = 0;
		
		apply_friction(acc); // Use friction function when we touch the ground
	}
	
	// Move the Player in the modified way
	direction_move_bounce(Solid);
	
	// Revert to "normal state" once we stop moving
	if (hspd == 0 && vspd == 0) {
		image_blend = c_white; // c_white is DEFAULT
		
		// When the player dies, we restart at the last checkpoint i.e. start of the room
		if (PlayerStats.hp <= 0) {
			// Reset Sapphire Count
			// PlayerStats.sapphires = 0;
			// Our score-keeping is completely janked so it's not like this would do anything
			
			// Reset the player's hit points
			PlayerStats.hp = PlayerStats.maxhp;
			
			// stop the music to prevent double audio events
			if (audio_is_playing(snd_music_volatile_reaction)) {
				audio_stop_sound(snd_music_volatile_reaction);
			}
			
			room_restart();
		}
		state = move_state;
	}
}