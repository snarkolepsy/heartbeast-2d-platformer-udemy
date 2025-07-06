// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function take_damage(){
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