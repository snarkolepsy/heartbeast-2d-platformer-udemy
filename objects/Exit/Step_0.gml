/// @description Check for Boss presence

if (instance_exists(Boss)) {
	// Obscure the exit if the Boss is still alive and active
	visible = false;
}
else {
	visible = true;
}