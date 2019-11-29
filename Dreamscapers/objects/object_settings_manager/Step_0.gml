/// @description Listen for key input

var keyboard = keyboard_check_pressed(script_control_value(controls.start));
var gamepad = false;

if (gamepad_is_connected(0))
	gamepad = gamepad_button_check_pressed(0, script_control_value_gamepad(controls.start));
	
if (keyboard || gamepad) {
	if (global.pause) {
		global.pause = false;
		alarm[0] = 1;
	} else {
		global.pause = true;
		alarm[1] = 1;
	}
}