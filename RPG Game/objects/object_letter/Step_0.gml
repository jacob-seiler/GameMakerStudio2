/// @description Listen for input

event_inherited(); // Inherit the parent event

if (script_control_check_pressed(controls.a)) {
	var length = string_length(global.name);
	
	if (char == "CANCEL") {
		global.name = "";
		room_goto(room_0);
	} else if (char == "DONE") {
		if (length > 0)
			object_name_card.done = true;
	} else if (char == "BACKSPACE") {
		if (length > 0)
			global.name = string_delete(global.name, length, 1);
	} else {
		if (length < 10)
			global.name = global.name + char;
	}
}

if (script_control_check_pressed(controls.b)) {
	var length = string_length(global.name);
	
	if (length > 0)
		global.name = string_delete(global.name, length, 1);
	else {
		global.name = "";
		room_goto(room_0);
	}
}
