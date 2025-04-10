// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function snake_move_right_state(){
	var wall_at_right = place_meeting(x + 1, y, Solid);
	var ledge_at_right = !position_meeting(bbox_right + 1, bbox_bottom + 1, Solid) // Check one pixel down and to the right
	
	// If we encounter a wall or reach the ledge, turn around
	if (wall_at_right || ledge_at_right) {
		state = snake_move_left_state;
	}
	
	image_xscale = 1; // facing to the right i.e. positive x direction
	
	// Move the Snake
	x += 1;
}