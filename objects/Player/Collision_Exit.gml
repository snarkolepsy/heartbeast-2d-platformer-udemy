/// @description Collide with the Exit and go to the next Room!
if (up) { // Activates Exit with UP keystroke
	
	// Workaround for "kipping" bug --> undo the y displacement
	y = yprevious;
	
	state = exit_state;
	
	audio_stop_sound(snd_jump);
	audio_play_sound(snd_exit, 4, false);
}