/// function script_camera_set_zoom_to(zoom, move_speed)
/// @description Moves the camera to a desired position.
/// @param {real} zoom The desired zoom.
/// @param {real} move_speed The speed to move the camera.

// Arguments
var zoom = argument[0];
var move_speed = argument[1];

if (global.camera_zoom != zoom)
	global.camera_zoom += (move_speed - global.camera_zoom) / move_speed;