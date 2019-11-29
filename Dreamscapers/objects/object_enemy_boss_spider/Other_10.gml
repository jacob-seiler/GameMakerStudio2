/// @description Run battle turn

if (battle_action_decision <= 0) {
	if (charged)
		battle_action_decision = choose(1, 2);
	else
		battle_action_decision = choose(1, 2, 3);
}

if (battle_action_decision == 1) {
	// Attack 1: Send mini spiders
	
	if (battle_action_summoned < 5.5) {
		// TODO sound effect
		
		if (sprite_index != sprite_attack_summon)
			sprite_index = sprite_attack_summon;
		
		if (!instance_exists(object_attack_minispider)) {
			var amount = irandom_range(5, 9);
			
			for (var i = 0; i < amount; i++) {
				var offset = random_range(15, -15);
				
				var pos_x = -45 - (100 * i);
				var pos_y = choose(script_battle_get_player().y, script_battle_get_ally().y) + offset;
				
				var attack_damage = battle_damage_spiders * (charged + 1);
				
				var inst = instance_create_depth(pos_x, pos_y, -y, object_attack_minispider);
				with (inst) {
					damage = attack_damage;
					ignore = other;
				}
			}
		}
		
		battle_action_summoned += script_util_delta();
	} else {
		event_user(1);
		
		if (!instance_exists(object_attack_minispider)) {
			// Reset variables
			battle_action_summoned = 0;
			battle_action_decision = 0;
			charged = false; // Charge was used
			script_battle_turn_end(); // End turn
		}
	}
} else if (battle_action_decision == 2) {
	// Attack 2: Shoot web
	// TODO target random player or ally
	// TODO remove once offscreen
	
	if (battle_action_summoned < 3.5) {
		// TODO sound effect
		
		if (sprite_index != sprite_attack_summon)
			sprite_index = sprite_attack_summon;
		
		if (!instance_exists(object_attack_web)) {
			var amount = irandom_range(1, 3);
			
			for (var i = 0; i < amount; i++) {
				// TODO launch projectile
				
				var target = choose(script_battle_get_player(), script_battle_get_ally())
				var target_pos_x = target.x;
				var target_pos_y = target.y;
				
				var attack_damage = battle_damage_webs * (charged + 1);
				
				var inst = instance_create_depth(x, y, -y, object_attack_web);
				with (inst) {
					target_x = target_pos_x;
					target_y = target_pos_y;
					damage = attack_damage;
					ignore = other;
					move_speed = 300 + (i * 30);
					event_user(0);
				}
			}
		}
		
		battle_action_summoned += script_util_delta();
	} else {
		event_user(1);
		
		if (!instance_exists(object_attack_web)) {
			// Reset variables
			battle_action_summoned = 0;
			battle_action_decision = 0;
			charged = false; // Charge was used
			script_battle_turn_end(); // End turn
		}
	}
} else if (battle_action_decision == 3) {
	// Reset variables
	battle_action_summoned = 0;
	battle_action_decision = 0;
	charged = true; // Set charge
	script_battle_turn_end(); // End turn
}

// TODO after X turns, respawn legs

// TODO LEGS
// TODO VULNERABLE