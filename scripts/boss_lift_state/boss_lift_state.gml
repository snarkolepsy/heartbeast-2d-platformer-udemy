function boss_lift_state(){
	// Change to the second image, which has glowing eyes
	image_index = 1;
	
	// If we're not currently falling, start to lift off the ground 
	if (vspd >= -16) vspd -= 0.5;
	move(Solid);
	
	// Once we're high enough (i.e. hit the ceiling), start chasing the playr
	if(place_meeting(x, y-1, Solid)) {
		vspd = 0; // stop climbing
		state = boss_chase_state;
	}
}