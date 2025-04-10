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
		state = move_state;
	}
}