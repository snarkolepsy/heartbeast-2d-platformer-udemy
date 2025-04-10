/// @description Initialize the PlayerStats object and set parameters

// Get the aspect ratio correct
display_set_gui_size(camera_get_view_width(1), camera_get_view_height(1));

// Initialize some gameplay variables

// Tracking health
maxhp = 3;
hp = 3;

// time-tracking
timer = 0;

// Scorekeeping variables
sapphires = 0;
score = 0;
highscore = 0;