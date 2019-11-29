/// @description Dialogue

if (global.dialogue_current != noone) {
	var finished;
	
	with (global.dialogue_current) {
		finished = dialogue_current_length >= string_length(message);
	}

	if (script_control_check_pressed(controls.b) || (script_control_check_pressed(controls.a) && finished)) {
		if (global.dialogue_current.type == dialogue_type.prompt)
			global.dialogue_response = global.dialogue_current.selection;
		
		instance_destroy(global.dialogue_current);
		
		global.dialogue_current = noone;
		global.dialogue_que[0] = noone;
		script_dialogue_update();
	} else if ((script_control_check_pressed(controls.a) && !finished)) {
		with (global.dialogue_current) {
			dialogue_current_length = string_length(message);
		}
	}
}