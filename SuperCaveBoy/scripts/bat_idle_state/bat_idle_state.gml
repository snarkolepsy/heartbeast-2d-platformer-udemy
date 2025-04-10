function bat_idle_state(){
	sprite_index = spr_bat_idle;
	
	// Looking for a Player object instance
	if (instance_exists(Player)) {
		// Calculate distance between the Player and Bat
		var dis = point_distance(x, y, Player.x, Player.y);
		
		// If we're within aggro range, start the chase!
		if (dis < sight) {
			state = bat_chase_state;
		}
	}
}