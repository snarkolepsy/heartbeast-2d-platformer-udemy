/// @description Splashing the lava
if (vspd > 0) {
	with (other) {
		speed = random_range(4, 10);
		direction = random_range(45, 135); // Fan-like pattern of dispersal
	}
}