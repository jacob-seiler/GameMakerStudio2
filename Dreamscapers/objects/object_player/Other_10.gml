/// @description Battle turn

// TODO GUI

// Redirect
if (redirect > 0) {
	event_user(redirect);
	exit;
}

if (script_control_check(controls.lb)) {
	// TODO selected entity info
	show_debug_message("entity info");
} else if (script_control_check(controls.rb)) {
	// TODO show speed bars
	show_debug_message("speed bars");
} else {
	// Use arrows to navigate selected entity
	#region Select entity
	var pos_x = selected_entity.x;
	var pos_y = selected_entity.y;
	
	if (script_control_check_pressed(controls.up)) {
		var entities = script_battle_get_entities();
		var closest = noone;
		
		for (var i = array_length_1d(entities) - 1; i >= 0; i--) {
			var entity = entities[i];
			
			if (entity.y >= pos_y)
				continue;
			
			if (closest == noone || abs(selected_entity.x - closest.x) > abs(selected_entity.x - entity.x))
				closest = entity;
		}
		
		if (closest != noone)
			selected_entity = closest;
	} else if (script_control_check_pressed(controls.down)) {
		var entities = script_battle_get_entities();
		var closest = noone;
		
		for (var i = 0; i < array_length_1d(entities); i++) {
			var entity = entities[i];
			
			if (entity.y <= pos_y)
				continue;
			
			if (closest == noone || abs(selected_entity.x - closest.x) > abs(selected_entity.x - entity.x))
				closest = entity;
		}
		
		if (closest != noone)
			selected_entity = closest;
	} else if (script_control_check_pressed(controls.right)) {
		var entities = script_battle_get_entities();
		var closest = noone;
		
		for (var i = 0; i < array_length_1d(entities); i++) {
			var entity = entities[i];
			
			if (entity.x <= pos_x)
				continue;
			
			if (closest == noone || abs(selected_entity.y - closest.y) > abs(selected_entity.y - entity.y))
				closest = entity;
		}
		
		if (closest != noone)
			selected_entity = closest;
	} else if (script_control_check_pressed(controls.left)) {
		var entities = script_battle_get_entities();
		var closest = noone;
		
		for (var i = array_length_1d(entities) - 1; i >= 0; i--) {
			var entity = entities[i];
			
			if (entity.x >= pos_x)
				continue;
			
			if (closest == noone || abs(selected_entity.y - closest.y) > abs(selected_entity.y - entity.y))
				closest = entity;
		}
		
		if (closest != noone)
			selected_entity = closest;
	}
	#endregion

	if (script_control_check_pressed(controls.x)) {
		if (selected_entity.id == object_enemy.id) {
			redirect = 2; // Standard attack
			exit;
		} else if (selected_entity.id == object_player.id) {
			redirect = 3; // Special attack
			exit;
		}
	} else if (script_control_check_pressed(controls.b)) {
		redirect = 1; // Charge
		exit;
	} else if (script_control_check_pressed(controls.select)) {
		redirect = 4; // Inventory
		exit;
	} else if (script_control_check_pressed(controls.a)) {
		redirect = 5; // Tactics
		exit;
	}
}

// TODO script_battle_turn_end();