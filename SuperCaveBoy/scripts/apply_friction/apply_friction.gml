function apply_friction(amount){
	
	// Make sure we're actually moving!
	if (hspd != 0) {
		if (abs(hspd) - amount > 0) {
			hspd -= amount * image_xscale;
		}
		else {
			hspd = 0;
		}
	}
}