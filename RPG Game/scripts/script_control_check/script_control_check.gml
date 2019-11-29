/// function script_control_check(key)
/// @description Checks if a key is pressed.
/// @param {real} key The key to check.
/// @return boolean if the key is currently pressed.

// Arguments
var key = argument[0];

if (global.control_listener != self)
	return false;

var keyboard = keyboard_check(script_control_value(key));
var gamepad = false;

if (gamepad_is_connected(0))
	gamepad = gamepad_button_check(0, script_control_value_gamepad(key))

return (keyboard || gamepad);
