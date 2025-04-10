// Mostly the same as the generic move() script except for Player "flinching"
function direction_move_bounce(collision_object){
	if (place_meeting(x+hspd, y, collision_object)) {
		while (!place_meeting(x+sign(hspd), y, collision_object)) {
			x += sign(hspd);
		}
		
		// Different from generic move() here...
		hspd = -(hspd/2);
	}

	x += hspd;

	if (place_meeting(x, y+vspd, collision_object)) {
		while (!place_meeting(x, y+sign(vspd), collision_object)) {
			y += sign(vspd);
		}
		
		// ...and here!
		vspd = -(vspd/2);
		if (abs(vspd) < 2) vspd = 0; // Prevent edge case and getting stuck
	}
	
	y += vspd;
}