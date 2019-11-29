/// @function script_entity_move_to(desired_x, desired_y, move_speed)
/// @description Moves the entity to a desired location.
/// @param {real} desired__x The desired coordinate on the x-axis to move the entity to.
/// @param {real} desired_y The desired coordinate on the y-axis to move the entity to.
/// @param {real} move_speed The speed to move the entity.

var desired_x = argument[0];
var desired_y = argument[1];
var move_speed = argument[2] * script_util_delta();

if (x != desired_x)
	script_entity_move(clamp(desired_x - x, -1 * move_speed, move_speed), 0, false, false);

if (y != desired_y)
	script_entity_move(0, clamp(desired_y - y, -1 * move_speed, move_speed), false, false);