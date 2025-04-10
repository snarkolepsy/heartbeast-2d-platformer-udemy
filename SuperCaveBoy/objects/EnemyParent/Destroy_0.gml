/// @description Whenever an Enemy is defeated, perform this

// Create a random Blood "splatter"
repeat(irandom_range(4, 7)) { // Randomized number of drops
	
	// Localized within an area relative to the Enemy dying
	var rand_x = irandom_range(-4, 4);
	var rand_y = irandom_range(-4, 4);
	
	instance_create_layer(x + rand_x, y + rand_y, "Effects", Blood);
}