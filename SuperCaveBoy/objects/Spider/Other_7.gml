/// @description JUMP!

// Confirm we are idle and ready to jump
if (state == spider_idle_state) {
	// Mak sure the player existw
	if (instance_exists(Player)) {
		hspd = sign(Player.x - x) * spd;
		vspd = -abs(hspd * 2);
	}
	
	horizontal_move_bounce(Solid);
	state = spider_jump_state;
}