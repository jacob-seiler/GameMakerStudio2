/// @description Update things

// TODO control management
if (global.dialogue_current != noone) {
	global.control_listener = self;
} else {
	if (instance_exists(object_player)) {
		global.control_listener = instance_find(object_player, 0);
	}
}

if (instance_exists(object_player)) {
	if (global.dialogue_current != noone) {
		if (!set) {
			script_camera_set_pos_to(object_player.x, object_player.y - 100, 1);
			
			if (global.camera_x == object_player.x && global.camera_y == object_player.y - 100)
				set = true;
		}
	} else {
		script_camera_set_pos_to(object_player.x, object_player.y, 1);
		set = false;
	}
}

if (global.dialogue_current != noone) {
	var message = global.dialogue_current.message;
	
	if (message == "{2HEY!") {
		script_camera_set_pos_to(1220, 920, 300);
		global.prev_player_pos_x = 1195;
		global.prev_player_pos_y = 950;
		global.prev_enemy = instance_find(object_enemy, 0);
	} else if (message == ".") {
		var enemies;
		enemies[0] = object_enemy_boss;
		script_battle_start(enemies);
	}
}

// Adjust camera zoom
event_user(2);

// Adjust camera position
event_user(1);

// Dialogue
event_user(3);