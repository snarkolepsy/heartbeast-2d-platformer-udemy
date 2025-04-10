// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function spider_jump_state(){
	// Change to the appropriate sprite
	image_index = image_number - 1; // Grabbing the LAST entry in the image list
	
	// Apply gravity
	if (!place_meeting(x, y + 1, Solid)) {
		vspd += grav;
	}
	else {
		vspd = 0;

		// Use friction helper function
		apply_friction(acc);
		
		// Check for lack of motion; then apply idle state if necessary
		if (hspd == 0 && vspd == 0) {
			state = spider_idle_state;
			alarm[0] = 15; // Landing cooldown
			
			// Reset how the spider looks
			image_speed = 0;
			image_index = 0;
		}
	}
	
	// Making sure we're facing the right direction
	if (hspd != 0) {
		image_xscale = sign(hspd);
	}
	
	// Finally, MOVE IT!
	horizontal_move_bounce(Solid);
}