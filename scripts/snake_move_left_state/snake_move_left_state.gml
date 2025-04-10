// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function snake_move_left_state(){
	var wall_at_left = place_meeting(x - 1, y, Solid);
	var ledge_at_left = !position_meeting(bbox_left - 1, bbox_bottom + 1, Solid) // Check one pixel down and to the LEFT
	
	// Turn around when we reach the ledge
	if (wall_at_left || ledge_at_left) {
		state = snake_move_right_state;
	}
	
	image_xscale = -1; // facing to the left i.e. negative x direction
	
	// Move the Snake
	x -= 1;
}