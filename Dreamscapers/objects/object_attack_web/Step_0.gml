/// @description Behaviour

var move_x = move_speed * speed_x;
var move_y = move_speed * speed_y;
script_entity_move(move_x, move_y, true, false); // Move to the right

// Delete once off the screen
if (x > room_width)
	instance_destroy();