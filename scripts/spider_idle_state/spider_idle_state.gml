function spider_idle_state(){
	if (instance_exists(Player)) {
		// Once the Player gets close enough...
		var dis = distance_to_object(Player);
		if (dis < sight && alarm[0] <= 0) {
			
			// ...begin animating the Spider!
			image_speed = 0.5;
			
			// Make sure the Spider is pointed in the correct direction
			if (Player.x != x) {
				image_xscale = sign(Player.x - x);
			}
		}
		// After the animation completes, perform the jump
	}
}