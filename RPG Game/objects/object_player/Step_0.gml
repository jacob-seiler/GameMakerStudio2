/// @description Player input

var moved = false;

if (script_room_get_type(room) == room_type.battle) {
	#region cooldowns
	if (ability_cooldown_defend > 0) {
		ability_cooldown_defend -= script_util_delta();
		ability_cooldown = 1;
		ability_cooldown_ally = 1;
		
		if (ability_cooldown_defend <= 0) {
			ability_cooldown = 0;
			ability_cooldown_ally = 0;
			ability_cooldown_defend = 0;
		}
	} else {
		if (ability_cooldown > 0) {
			ability_cooldown -= script_util_delta();
		
			if (ability_cooldown < 0)
				ability_cooldown = 0;
		}
	
		if (ability_cooldown_ally > 0) {
			ability_cooldown_ally -= script_util_delta();
		
			if (ability_cooldown_ally < 0)
				ability_cooldown_ally = 0;
		}
	}
	#endregion
	
	if (script_control_check_pressed(controls.x) && !action_attack) {
		// TODO ability_cooldown
		
		// TODO check if player is performing action (attack or something)
			// TODO check if pressed at the correct interval
		// TODO else if player is selecting action (their turn)
			// select the action
		// TODO else
			
		if (ability_cooldown <= 0) {
			var inst = instance_create_depth(x - 64, y, -y, object_attack);
			with (inst) {
				damage = other.battle_damage;
				ignore = other;
				alarm[0] = 300 * script_util_delta();
			}
			
			ability_cooldown = 0.45; // Set cooldown
		}
	}
	
	if (script_control_check_pressed(controls.y)) {
		// TODO ability_cooldown_ally
		
		// TODO check if ally is performing action (attack or something)
			// TODO check if pressed at the correct interval
		// TODO else if ally is selecting action (their turn)
			// select the action
		// TODO else
			// TODO ally action
	}
	
	if (script_control_check_pressed(controls.b)) {
		// TODO ability_cooldown_defend
		
		// TODO check if ally or player is performing action (attack or something)
			// TODO something
		// TODO else if player or ally is selection action (their turn)
			// TODO go back
		// TODO else
		
		if (ability_cooldown_defend <= 0) {
			// TODO defend
			
			ability_cooldown_defend = 0.45; // Set cooldown
		}
	}
} else {
	#region cooldown
	if (ability_cooldown_defend > 0) {
		ability_cooldown_defend -= script_util_delta();
		
		if (ability_cooldown_defend < 0)
			ability_cooldown_defend = 0;
	}
	#endregion
	else {
		// Move direction
		var dir_x = script_control_check(controls.right) - script_control_check(controls.left);
		var dir_y = script_control_check(controls.down) - script_control_check(controls.up);
		
		// Analogue Input
		var analogue_x = script_control_check_analogue(true, false);
		var analogue_y = script_control_check_analogue(true, true);
		
		if (abs(dir_x) < abs(analogue_x))
			dir_x = analogue_x;
		
		if (abs(dir_y) < abs(analogue_y))
			dir_y = analogue_y;
		
		// Interact
		if (script_control_check_pressed(controls.a)) {
			if (instance_exists(object_npc)) {
				var inst = instance_nearest(x, y + sprite_height / 2, object_npc);
				var distance_max = 100;
		
				if (point_distance(x, y + sprite_height / 2, inst.x, inst.y + inst.sprite_height / 2) < distance_max) {
					with (inst)
						event_user(0);
				}
			}
		}
	
		if (script_room_get_type(room) == room_type.dream) {
			if (script_control_check_pressed(controls.b) && ability_cooldown_defend == 0) {
				if (dir_x == 0 && dir_y == 0) {
					// TODO defend
				} else {
					// Dash
					var amount = move_speed / 10;
				
					ability_cooldown_defend = ((amount * 5) / move_speed);
					
					dir_x *= amount;
					dir_y *= amount;
				}
			
				// TODO cooldown
			}
		}
		
		if (dir_x != 0 || dir_y != 0) {
			moved = true;
			script_entity_move(move_speed * dir_x, move_speed * dir_y, true, true); // Move
		}
	}
}

// Sprites
// TODO direction
if (ability_cooldown_defend > 0) {
	// TODO defend / dodge animation
	if (sprite_index != sprite_defend)
		sprite_index = sprite_defend;
} else if (ability_cooldown > 0) {
	// TODO attack animation
	if (sprite_index != sprite_attack)
		sprite_index = sprite_attack;
} else if (moved) {
	// TODO move animation
	if (sprite_index != sprite_move)
		sprite_index = sprite_move;
} else {
	// TODO idle animation
	if (sprite_index != sprite_idle)
		sprite_index = sprite_idle;
}
