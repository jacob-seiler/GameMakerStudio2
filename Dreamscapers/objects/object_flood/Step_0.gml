/// @description Update

if (global.dialogue_current != noone) {
	if (global.dialogue_current.message == "*WATER PRESSURE SET TO 5000psi*")
		called = true;
}

if (!called) {
	y = - 100;
} else {
	if (y > target_y)
		y = target_y;
	else if (y < target_y)
		y += target_y * script_util_delta();
}