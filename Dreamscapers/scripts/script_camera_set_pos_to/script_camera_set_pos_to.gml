/// function script_camera_set_pos_to(pos_x, pos_y, move_speed)
/// @description Moves the camera to a desired position.
/// @param {real} pos_x The desired position on the x-axis.
/// @param {real} pos_y The desired position on the y-axis.
/// @param {real} move_speed The speed to move the camera.

// Arguments
var pos_x = argument[0];
var pos_y = argument[1];
var move_speed = argument[2];

if (global.camera_x != pos_x)
	global.camera_x += (pos_x - global.camera_x) / move_speed;

if (global.camera_y != pos_y)
	global.camera_y += (pos_y - global.camera_y) / move_speed;