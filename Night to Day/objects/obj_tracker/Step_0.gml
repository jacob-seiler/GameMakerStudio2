/// @description Insert description here
// You can write your code in this editor

// TODO Only chase if in the same house room
// TODO Do not collide with walls

// Calculate movement
var actual_speed = max(move_speed * scr_get_delta(), 1)

if (target == noone)
	return;
	
var goal_x = (target.x div 32) * 32;
var goal_y = (target.y div 32) * 32;

if (mp_grid_path(global.grid, path, x, y, goal_x, goal_y, true)) {
	path_start(path, actual_speed, path_action_stop, false)
}