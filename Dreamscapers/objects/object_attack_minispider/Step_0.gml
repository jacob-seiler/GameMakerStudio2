/// @description Behaviour

script_entity_move(move_speed, 0, true, false); // Move to the right

// Delete once off the screen
if (x > room_width)
	instance_destroy();