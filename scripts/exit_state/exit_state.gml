function exit_state(){
	if (image_alpha > 0) { // Still visible?
		image_alpha -= 0.25; // If so, increase transparency????
	}
	else {
		if (room != room_last) { // Move to the next room, if one exists!
			room_goto_next();
		}
		else { // Otherwise, go to the high score room before resetting our game entirely
			// Calculate the HIGH SCORE
			score = PlayerStats.sapphires; // TODO: factor in time and perhaps enemies slain?
			
			// Open the high scores table
			ini_open("savedata.ini");
			PlayerStats.highscore = ini_read_real("Score", "Highscore", 0); // Getting the older high score
			
			// In case we've exceeded a previous max value
			if (score > PlayerStats.highscore) {
				PlayerStats.highscore = score;
				ini_write_real("Score", "Highscore", PlayerStats.highscore);
			}
			
			// Always properly close the ini file
			ini_close();
			
			room_goto(rm_high_score);
		}
	}
}