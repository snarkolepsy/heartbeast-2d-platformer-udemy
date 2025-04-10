/// @description Draw the Dirt with special borders
draw_self();

var right = place_meeting(x+1, y, Solid);
var left = place_meeting(x-1, y, Solid);
var up = place_meeting(x, y-1, Solid);
var down = place_meeting(x, y+1, Solid);

// If we're at the appropriate edge i.e. nothing to the R/L/U/P of here, draw edge
if (!right) {
	draw_sprite_ext(spr_dirt_edge, 0, x+16, y+16, 1, 1, 0, c_white, 1);
}

if (!left) {
	draw_sprite_ext(spr_dirt_edge, 0, x+16, y+16, 1, 1, 180, c_white, 1);
}

if (!up) {
	draw_sprite_ext(spr_dirt_top, 0, x, y-4, 1, 1, 0, c_white, 1);
}

if (!down) {
	draw_sprite_ext(spr_dirt_edge, 0, x+16, y+16, 1, 1, 270, c_white, 1);
}