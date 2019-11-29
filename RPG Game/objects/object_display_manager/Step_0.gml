/// @description Update things

// TODO control management
if (global.dialogue_current != noone) {
	global.control_listener = self;
} else {
	if (instance_exists(object_player)) {
		global.control_listener = instance_find(object_player, 0);
	}
}

// TODO this stuff is temporary
if (instance_exists(object_player)) {
	if (global.dialogue_current != noone) {
		script_camera_set_pos_to(object_player.x, object_player.y - 100, 1);
	} else {
		script_camera_set_pos_to(object_player.x, object_player.y, 1);
	}
}

// Adjust camera zoom
event_user(2);

// Adjust camera position
event_user(1);

// Dialogue
if (global.dialogue_current != noone) {
	var finished;
	
	with (global.dialogue_current) {
		finished = dialogue_current_length >= string_length(message);
	}

	if (script_control_check_pressed(controls.y) || (script_control_check_pressed(controls.a) && finished)) {
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