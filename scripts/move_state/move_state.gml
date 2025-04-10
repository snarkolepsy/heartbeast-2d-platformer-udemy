function move_state(){
	// First, check whether the player is in the air; if so, apply gravity!
	if (!place_meeting(x, y+1, Solid)) {
		vspd += grav;
		
		// Confirmed that player is in the air at this step
		sprite_index = spr_player_jump;
		image_speed = 0; // we don't want the jumping sprite to animate
		image_index = (vspd > 0); // If we're rising, use one frame, and if we're falling, the other
	
		// Control the jump height based on jumping release
		if (up_release && vspd < -6) {
			vspd = -6;
		}
	}
	else {
		vspd = 0;
	
		// Jumping modifies vertical speed with the UP keystroke
		if (up) {
			vspd = -16;
			audio_play_sound(snd_jump, 5, false);
		}
		
		// Player is on the ground; need to reset animations again
		if (hspd == 0) { // i.e. not moving
			sprite_index = spr_player_idle;
		}
		else {
			sprite_index = spr_player_walk;
			image_speed = 0.6;
		}
	}
	
	// Implementing acceleration for smoother motion
	if (right || left) {
		hspd += (right-left) * acc;
		hspd_dir = right - left;
		
		// Need to cap it at max speed so we don't go over!
		// max speed to the right
		if (hspd > spd) {
			hspd = spd;
		}
		// Max speed, but leftward
		if (hspd < - spd) {
			hspd = -spd;
		}
	}
	else { // Apply the friction function
		apply_friction(acc);
	}

	// Apply the sprite flip, if necessary
	if (hspd != 0) {
		image_xscale = sign(hspd);
	}

	// Play the landing sound effect if we contacted with a Solid and were falling
	if(place_meeting(x, y+vspd+1, Solid) && vspd > 0) {
		audio_emitter_pitch(audio_em, random_range(0.8, 1.2));
		audio_emitter_gain(audio_em, 0.2);
		audio_play_sound_on(audio_em, snd_step, false, 6);
	}

	move(Solid);
	
	// Checking for ledge_grab_state
	var falling = y - yprevious > 0;
	var wasnt_wall = !position_meeting(x + 17 * image_xscale, yprevious, Solid); // 17 because the player is 16 pixels tall
	var is_wall = position_meeting(x + 17 * image_xscale, y, Solid);
	
	// Transitions to ledge-grabbing state when conditions are met
	if (falling && wasnt_wall && is_wall) {
		
		// Reset player speed when grapping a ledge!
		hspd = 0;
		vspd = 0; // Otherwise we might drop too fast
		
		// Move against the ledge; as close as possible so we are always in the same position
		while (!place_meeting(x + image_xscale, y, Solid)) {
			x += image_xscale;
		}
		
		// Then make sure we are always on the same vertical level relative to ledge
		while (position_meeting(x + 17 * image_xscale, y-1, Solid)) {
			y -= 1;
		}
		
		// change to the ledge grabbing sprite
		sprite_index = spr_player_edge_grab;
		state = ledge_grab_state;
		
		// Player the ledge-grabbing sfx
		audio_emitter_pitch(audio_em, 1.5);
		audio_emitter_gain(audio_em, 0.1);
		audio_play_sound_on(audio_em, snd_step, false, 6);
	}
}