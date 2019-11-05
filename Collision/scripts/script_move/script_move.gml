/// @function script_move(amount_x, amount_y)
/// @description Moves an object the desired amount.
/// @param {real} amount_x The amount to move on the x-axis.
/// @param {real} amount_y The amount to move on the y-axis.

// Arguments
var amount_x = argument[0];
var amount_y = argument[1];

if (place_meeting(x + amount_x, y, object_collision))
	while (!place_meeting(x + sign(amount_x), y, object_collision))
		x += sign(amount_x);
else
	x += amount_x;

if (place_meeting(x, y + amount_y, object_collision))
	while (!place_meeting(x, y + sign(amount_y), object_collision))
		y += sign(amount_y);
else
	y += amount_y;