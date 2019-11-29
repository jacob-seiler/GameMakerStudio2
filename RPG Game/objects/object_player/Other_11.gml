/// @description Battle - Charge

show_debug_message("Are you suuuure? b = no, a = yes"); // TODO are you sure prompt

if (script_control_check_pressed(controls.b)) {
	// Return to previous menu
	action_charge = false;
} else if (script_control_check_pressed(controls.a)) {
	// Charge
	carged = true;
	alarm[0] = 1;
	event_user(15); // End turn
}