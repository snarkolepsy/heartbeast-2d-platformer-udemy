// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bat_chase_state(){
	if (instance_exists(Player)) {
		// Get the direction and coordinates
		var dir = point_direction(x, y, Player.x, Player.y);
		hspd = lengthdir_x(spd, dir);
		vspd = lengthdir_y(spd, dir);
		
		// Change the sprite to active
		sprite_index = spr_bat_fly;
		
		// Change to the correct direction
		if (hspd != 0) {
			image_xscale = sign(hspd);
		}
		
		// Move the object with the helper script
		move(Solid);
	}
}