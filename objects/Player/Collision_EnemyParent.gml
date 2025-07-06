/// @description Collide with any of the Enemies objects
var above_enemy = y < other.y + vspd;
var falling = vspd > 0;

// If falling onto enemy, kill it (like in Mario)
if (above_enemy && (falling || state = ledge_grab_state)) {
	// Pre-emptively displacing the Player sprite to prevent double impacts
	if (!place_meeting(x, yprevious, Solid)) {
		y = yprevious;
	}
	
	// Moves us to the spot right above the enemy so it "looks right"
	while (!place_meeting(x, y+1, other)) {
		y++;
	}
	
	// Removing i.e. "killing" the enemy instance
	with(other) {
		instance_destroy();
	}
	
	// Player sprite should "kip" up a bit i.e. bounce off the slain foe
	vspd = -(jspd/grav);
	
	
	audio_play_sound(snd_step, 6, false);
}
else {
	take_damage();
}