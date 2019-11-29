/// function script_control_string(key)
/// @description Gets the string value of the given key.
/// @param {real} key The key to get the value of.
/// @return The string value of the key.

var key = argument[0];
var value = 0;

if (gamepad_is_connected(0)) {
	var value = script_control_value_gamepad(key)
	// TODO depending on controller type, return different values (Xbox, Nintendo, PS4, etc)
} else {
	var value = script_control_value(key);
}

return chr(value);