function move(collision_object){
	// Horizontal collision-handling
	if (place_meeting(x+hspd, y, collision_object)) {
		while (!place_meeting(x+sign(hspd), y, collision_object)) {
			x += sign(hspd);
		}
		hspd = 0;
	}

	// Horizontally move the Player
	x += hspd;

	// Vertical collision-handing
	if (place_meeting(x, y+vspd, collision_object)) {
		while (!place_meeting(x, y+sign(vspd), collision_object)) {
			y += sign(vspd);
		}
		vspd = 0;
	}
	
	// Vertically move the Player
	y += vspd;
}