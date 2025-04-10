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
	// Otherwise we take damage
	if (state !=hurt_state) {
		// Playing the HURT sound effect
		audio_emitter_pitch(audio_em, 1.6);
		audio_emitter_gain(audio_em, 1.4);
		audio_play_sound_on(audio_em, snd_ouch, false, 8)
		
		// Changing color of the sprite to represent "damaged"
		image_blend = make_color_rgb(220, 150, 150);
		
		// Define a vector to apply to Player
		vspd = -12;
		hspd = (sign(x - other.x) * 10); // Getting direction
		
		state = hurt_state;
		
		// "Flinch" the Player
		move(Solid);
		
		if (instance_exists(PlayerStats)) {
			PlayerStats.hp -= 1;
		}
	}
}