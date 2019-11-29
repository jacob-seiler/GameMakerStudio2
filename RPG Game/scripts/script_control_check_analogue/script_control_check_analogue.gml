/// function script_control_check_analogue(left, y_axis)
/// @description Gets the value of the desired analogue stick.
/// @param {real} left True if getting the value of the left stick.
/// @param {real} y_axis True if getting the value of the y-axis.
/// @return the value of the analogue stick.

// Arguments
var left = argument[0];
var y_axis = argument[1];

if (!gamepad_is_connected(0))
	return 0;

gamepad_set_axis_deadzone(0, global.control_deadzone);
	
if (left) {
	if (y_axis)
		return gamepad_axis_value(0, gp_axislv);
	else
		return gamepad_axis_value(0, gp_axislh);
} else {
	if (y_axis)
		return gamepad_axis_value(0, gp_axisrv);
	else
		return gamepad_axis_value(0, gp_axisrh);
}