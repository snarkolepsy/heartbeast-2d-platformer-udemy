/// @description Create Snake enemy

image_speed = 0.1; // slower to account for low frame count

// Randomly cloose a starting direction
state = choose(snake_move_right_state, snake_move_left_state);