/// @description Run battle turn

if (!battle_action_aproached_player) {
	var player = script_battle_get_player();
	script_entity_move_to(player.x, player.y, move_speed);
	
	if (x == player.x && y == player.y)
		battle_action_aproached_player = true;
} else {
	script_entity_move_to(battle_rest_x, battle_rest_y, move_speed);
	
	if (x == battle_rest_x && y == battle_rest_y) {
		show_debug_message("It was fun while it lasted. Goodbye. - da boss");
		
		battle_action_aproached_player = false; // Reset variables
		script_battle_turn_end(); // End turn
	}
}