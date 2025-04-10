/// @description Initialize Spider

// Sprite strip only has one other animation frame for jumping
image_speed = 0;
image_index = 0;

// Aggro distance
sight = 128;

spd = 6;
acc = 2;
grav = 1;

// Setting the initial state
state = spider_idle_state;