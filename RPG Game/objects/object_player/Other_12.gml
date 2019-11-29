/// @description Battle - Attack

// TODO attack
// TODO different attack if charged

show_debug_message("Enemy");

if (!battle_action_approached_enemy) {
	// Move into position
	var pos_x = selected_entity.x + (selected_entity.sprite_width / 2) + (self.sprite_width/2) + 10;
	var pos_y = selected_entity.y;
	
	script_entity_move_to(pos_x, pos_y, move_speed);
	
	if (x == pos_x && y == pos_y) {
		battle_action_approached_enemy = true // End action
	}
} else if (!battle_action_attacked) {
	var attack = 0;
	
	if (script_control_check(controls.x)) {
		// Increase potential damage
		battle_action_charge_held += battle_damage * script_util_delta();
		
		// Check if held too long
		if (battle_action_charge_held > (battle_damage * 2.2)) {
			attack = 0.5; // Weak attack
		}
	} else if (battle_action_charge_held > 0) {
		attack = battle_action_charge_held / battle_damage;
	}
	
	if (attack > 0) {
		attack = max(attack, 0.5);
		
		if (charged)
			attack *= 2; // TODO
		
		var attack_damage = round(battle_damage * attack); // Damage value
		
		var inst = instance_create_depth(selected_entity.x, selected_entity.y, -y, object_attack); // Attack object
		with (inst) {
			damage = attack_damage;
			ignore = other;
		}
		
		battle_action_attacked = true;
		battle_action_charge_held = 0;
		charged = false;
		
		show_debug_message("BOOM");
	}
} else {
	// Return to rest position
	
	// TODO wait a bit first?
	script_entity_move_to(battle_rest_x, battle_rest_y, move_speed);
	
	if (x == battle_rest_x && y == battle_rest_y) {
		event_user(15); // End turn
	}
}
