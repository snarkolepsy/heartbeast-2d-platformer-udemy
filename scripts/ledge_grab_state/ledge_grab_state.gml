function ledge_grab_state(){
	// If we pressed down, detach from ledge
	// Functionally this is returning to a move_state wherein gravity is pulling us
	if (down) {
		state = move_state;
	}
	
	// If we press up, jump up i.e. mantle the ledge
	if (up) {
		state = move_state;
		vspd = -16;
	}
}