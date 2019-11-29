/// @description Battle - Standard attack

// TODO run attack on enemy
show_debug_message("standard attack");

// TODO approach enemy
// TODO attack
if (!battle_action_approached) {
	var pos_x = selected_entity.x + 80;
	var pos_y = selected_entity.y;
	
	script_entity_move_to(pos_x, pos_y, move_speed);
	
	if (x == pos_x && y == pos_y)
		battle_action_approached = true;
} else if (!battle_action_attacked || attacking) {
	// TODO once they attacked
	if (attacking)
		battle_action_attacked = true;
} else {
	var pos_x = battle_rest_x;
	var pos_y = battle_rest_y;
	
	script_entity_move_to(pos_x, pos_y, move_speed);
	
	if (x == pos_x && y == pos_y)
		event_user(15);
}

if (charged) {
	// TODO more damage
}

// TODO show, weak or critical
