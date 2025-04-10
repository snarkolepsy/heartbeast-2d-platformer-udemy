/// @description Draw the PlayerStats on the GUI layer

switch (room) {
	case rm_menu : // If we're in the MAIN MENU, draw the title
		draw_set_halign(fa_center);
		
		draw_set_font(fnt_title);
		draw_text_colour(room_width/2+irandom_range(2,3), 32-irandom_range(8,6), "Super Cave\nBoy", c_black, c_black, c_black, c_black, random_range(0.5, 0.75));
		draw_text_colour(room_width/2, 32, "Super Cave\nBoy", c_white, c_white, c_white, c_white, 1);
		
		var start_message;
		
		if (gamepad_is_connected(0)) {
			start_message = "Press [START] to Play";
		}
		else {
			start_message = "Press [SPACEBAR] to Play!";
		}
		
		draw_set_font(fnt_start); 
		draw_text_colour(room_width/2+irandom_range(1,2), room_height-48+irandom_range(4,5), start_message, c_black, c_black, c_black, c_black, random_range(0.5, 0.75));
		draw_text_colour(room_width/2, room_height-48, start_message, c_white, c_white, c_white, c_white, 1);
		
		break;
	
	case rm_high_score :
		draw_set_halign(fa_center);
		draw_text_colour(view_wview[0]/2, 64, "Time Elapsed: " + string(floor(timer/game_get_speed(gamespeed_fps))) + " seconds.", c_white, c_white, c_white, c_white, 1);
		draw_text_colour(view_wview[0]/2, 96, "Your final score is: " + string(score) + "!", c_white, c_white, c_white, c_white, 1);
		draw_text_colour(view_wview[0]/2, 128, "The highest score was: " + string(highscore), c_white, c_white, c_white, c_white, 1);
		break;
	
	default :
		// Drawing the full health bar based on maximum hp
		for (var i = 0; i < maxhp; i++) {
			draw_sprite_ext(spr_heart, 0, 24+i*36, 20, 1, 1, 0, c_black, 0.5);
		}

		// Draw the hearts!
		for (var i = 0; i < hp; i++) {
			draw_sprite_ext(spr_heart, 0, 24+i*36, 20, 1, 1, 0, c_white, 1);
		}
		
		// Draw the Sapphire count
		draw_set_halign(fa_right);
		draw_set_font(fnt_start);
		var str = "x" + string(sapphires);
		draw_text_colour(view_wview[0] - 16, 8, str, c_white, c_white, c_white, c_white, 1);
		var text_width = string_width(str); // Measure how wide we need to make the GUI icon
		draw_sprite(spr_sapphire_gui, 0, view_wview[0] - 32 - text_width, 22);
		
		// Adding to the timer, which I'm assuming affects the score?
		timer += 1;
		
		// Draw the constantly incrementing TIMER
		draw_text_colour(view_wview[0]/2 + 64, 8, "Time: "+ string(floor(timer/game_get_speed(gamespeed_fps))), c_white, c_white, c_white, c_white, 1);
		
		break;
}

