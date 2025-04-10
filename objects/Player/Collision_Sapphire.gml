/// Collect the Sapphire
PlayerStats.sapphires += 1;

with (other) { // concerning the OTHER object in this interaction
	instance_destroy()
}

// Play the sound effect of the Sapphire breaking
audio_play_sound(snd_tink, 4, false);