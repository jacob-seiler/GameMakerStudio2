/// @function script_entity_move(speed_x, speed_y, delta, collision)
/// @description Moves the entity.
/// @param {real} speed_x The speed to move the entity on the x-axis.
/// @param {real} speed_y The speed to move the entity on the y-axis.
/// @param {real} delta Use the delta value?.
/// @param {real} collision Check for collision?.

var speed_x = argument[0];
var speed_y = argument[1];

var delta = script_util_delta();

if (!argument[2])
	delta = 1;

var collision = argument[3];

var amount_x = speed_x * delta;
var amount_y = speed_y * delta;

object_set_solid(object_collision, collision);

// Check for collisions on the x-axis
/*
if (collision && place_meeting(x + amount_x, y, object_collision)) {
	while (!place_meeting(x + sign(amount_x), y, object_collision))
		x += sign(amount_x);
	
	prev_x = x;
} else {
*/	x += amount_x;
/*}

// Check for collisions on the y-axis
if (collision && place_meeting(x, y + amount_y, object_collision)) {
	while (!place_meeting(x, y + sign(amount_y), object_collision))
		y += sign(amount_y);
	
	prev_y = y;
} else {
*/	y += amount_y;
//}

object_set_solid(object_collision, !collision);