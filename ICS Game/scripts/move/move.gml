/// @description Moves object
/// @arg move_speed
/// @arg dir_x
/// @arg dir_y

if (game_is_paused())
	return;

if (argument[1] == 0 && argument[2] == 0)
	return;

x += argument[0] * argument[1] * get_delta_time();
y += argument[0] * argument[2] * get_delta_time();