function boss_stall_state(){
	// Change back to the non-glowing eyes variant
	image_index = 0;
	
	// When the Alarm expires, change back to boss_lift_state
	if(alarm[0] == -1) {
		state = boss_lift_state;
	}
}