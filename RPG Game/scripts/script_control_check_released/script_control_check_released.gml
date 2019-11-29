/// function script_control_check_released(key)
/// @description Checks if a key is released.
/// @param {real} key The key to check.
/// @return boolean if the key is released.

// Arguments
var key = argument[0];

if (global.control_listener != self)
	return false;

var keyboard = keyboard_check_released(script_control_value(key));
var gamepad = false;

if (gamepad_is_connected(0))
	gamepad = gamepad_button_check_released(0, script_control_value_gamepad(key))

return (keyboard || gamepad);
