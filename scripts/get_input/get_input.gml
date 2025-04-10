function get_input(){
	// Check for keystrokes
	right = keyboard_check(vk_right);
	left = keyboard_check(vk_left);
	up = keyboard_check(vk_up);
	up_release = keyboard_check_released(vk_up);
	down = keyboard_check(vk_down);
	
	// Override the controls for a gamepad
	var gp_id = 0; // First gamepad plugged into sysytem
	var thresh = 0.5; // Filtering noise from the gamepad
	
	if(gamepad_is_connected(gp_id)) {
		right = gamepad_axis_value(gp_id, gp_axislh) > thresh; // Left horizontal axis tilting right
		left = gamepad_axis_value(gp_id, gp_axislh) < -thresh; // ...or tilting to the left?
		up =  gamepad_button_check_pressed(gp_id, gp_face1); // X button on a PS4 controller
		up_release =  gamepad_button_check_released(gp_id, gp_face1);
		down = gamepad_axis_value(gp_id, gp_axislv) > thresh;
	}
}