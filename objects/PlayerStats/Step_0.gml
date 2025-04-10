// Transition from the Main Menu into the GAMEPLAY

var start = keyboard_check_pressed(vk_space);

if (gamepad_is_connected(0)) {
	start = gamepad_button_check_pressed(0, gp_start);
}

if (start == true && room == rm_menu) {
	room_goto(rm_one);
}