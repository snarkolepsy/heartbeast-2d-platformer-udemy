/// @description Initialize the Player Object

// Generalized speed of movement
spd = 8;
// Rate of acceleration for smoother animations
acc = 2; 

// Horizontal and vertical speeds to determine cartesian movement
hspd = 0;
vspd = 0;

// Jump Speed
jspd = 16;

// Rate of veritcal descent when Player is in the air
grav = 1.5;

// Beginning state when game begins
state = move_state;

// Get the input
get_input();

// Audio emitter
audio_em = audio_emitter_create();