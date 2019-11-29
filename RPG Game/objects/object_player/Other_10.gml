/// @description Battle turn

// TODO manage ally turn aswell

#region Re-direct
// Setup re-direct
if (!redirect_setup) {
	redirect_special = false;
	redirect_ally = false;
	
	if (action_attack) {
		if (selected_entity.id == self.id) {
			// Re-direct to the player's special attack
			redirect_special = true;
		} else if (selected_entity.id == object_ally.id) {
			// Re-direct to the ally special attack
			redirect_ally = true;
		}
	}
	
	redirect_setup = true;
}

// Re-direct
if (action_attack) {
	if (redirect_special) {
		// Run the player's special attack
		event_user(3);
	} else if (redirect_ally) {
		// Run the ally special attack
		event_user(4);
	} else {
		// Regular attack
		event_user(2);
	}
	
	exit;
} else if (action_charge) {
	event_user(1);
	exit;
}
#endregion

// If there is no selected entity
if (selected_entity == noone) {
	var entities = script_battle_get_entities();
	selected_entity = entities[0];
}

if (script_control_check(controls.rb)) {
	// TODO RB pressed
		// TODO view speed meters
} else if (script_control_check(controls.lb)) {
	// TODO LB pressed
		// TODO view info on selected entity (attacks, type, bio, etc)
} else {
	#region Entity selection
	// Choose entity
	var l_pressed = script_control_check_pressed(controls.left);
	var u_pressed = script_control_check_pressed(controls.up);
	var r_pressed = script_control_check_pressed(controls.right);
	var d_pressed = script_control_check_pressed(controls.down);
	
	if (l_pressed || u_pressed || r_pressed || d_pressed) {
		var entities = script_battle_get_entities();
		if (l_pressed) {
			var closest = noone;
			
			for (var i = 0; i < array_length_1d(entities); i++) {
				var entity = entities[i];
				if (entity == selected_entity)
					continue;
					
				if (entity.x > selected_entity.x)
					continue
				
				if (closest == noone) {
					closest = entity;
					continue;
				} else {
					with (selected_entity) {
						if (distance_to_object(entity) < distance_to_object(closest))
							closest = entity;
					}
				}
			}
			
			if (closest != noone)
				selected_entity = closest;
		}
	
		if (u_pressed) {
			var closest = noone;
			
			for (var i = 0; i < array_length_1d(entities); i++) {
				var entity = entities[i];
				if (entity == selected_entity)
					continue;
					
				if (entity.y > selected_entity.y)
					continue
				
				if (closest == noone) {
					closest = entity;
					continue;
				} else {
					with (selected_entity) {
						if (distance_to_object(entity) < distance_to_object(closest))
							closest = entity;
					}
				}
			}
			
			if (closest != noone)
				selected_entity = closest;
		}
	
		if (r_pressed) {
			var closest = noone;
			
			for (var i = 0; i < array_length_1d(entities); i++) {
				var entity = entities[i];
				if (entity == selected_entity)
					continue;
					
				if (entity.x < selected_entity.x)
					continue
				
				if (closest == noone) {
					closest = entity;
					continue;
				} else {
					with (selected_entity) {
						if (distance_to_object(entity) < distance_to_object(closest))
							closest = entity;
					}
				}
			}
			
			if (closest != noone)
				selected_entity = closest;
		}
	
		if (d_pressed) {
			var closest = noone;
			
			for (var i = 0; i < array_length_1d(entities); i++) {
				var entity = entities[i];
				if (entity == selected_entity)
					continue;
					
				if (entity.y < selected_entity.y)
					continue
				
				if (closest == noone) {
					closest = entity;
					continue;
				} else {
					with (selected_entity) {
						if (distance_to_object(entity) < distance_to_object(closest))
							closest = entity;
					}
				}
			}
			
			if (closest != noone)
				selected_entity = closest;
		}
	}
	#endregion
	
	if (script_control_check_pressed(controls.x)) {
		action_attack = true;
	} else if (script_control_check_pressed(controls.b)) {
		if (charged) {
			show_debug_message("you are already charged");
		} else {
			action_charge = true;
		}
	} else if (script_control_check_pressed(controls.select)) {
		// TODO inventory pressed
			// TODO open inventory & stuff
	}
}
