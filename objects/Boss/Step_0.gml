/// Execute the current state
script_execute(state);

// Indicator that the boss is taking damage
// Draw the boss RED
if (place_meeting(x, y, Lava)) {
	image_blend = c_red;
}
else {
	image_blend = c_white;
}

// Check health and die if appropriate
if (hp <= 0) {
	
	// Playing the death animation
	repeat(50) {
		instance_create_layer(bbox_left + random(sprite_width-24), bbox_top + random(sprite_height), "Effects", FireBubble);
	}
	
	// Stop the boss music, if playing
	if (audio_is_playing(snd_music_volatile_reaction)) {
		audio_stop_sound(snd_music_volatile_reaction);
	}
	
	// Resume playing BGM?
	/*if (!audio_is_playing(snd_music_oppressive_gloom)) {
		audio_
	}*/
	
	// Finally, destroy the instance
	instance_destroy();
}