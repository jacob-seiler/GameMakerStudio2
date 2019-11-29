/// @description Turn Management

var entities = script_battle_get_entities();
var entity_amount = array_length_1d(entities);

if (win != 0)
	exit;

if (!script_battle_entity_is_valid(script_battle_get_player())) {
	win = -1;
	exit;
}

if (entity_amount != battle_size) {
	battle_size = entity_amount;
	
	if (!instance_exists(object_enemy)) {
		win = 1;
		exit;
	}
	
	// Recalculate max speed
	battle_speed_max = entities[0].battle_speed;
	for (var i = 0; i < entity_amount; i++) {
		var entity = entities[i];
	
		if (entity.battle_speed > battle_speed_max)
			battle_speed_max = entity.battle_speed;
	}
}

if (!script_battle_entity_is_valid(global.battle_turn))
	script_battle_turn_end();

if (global.battle_turn != noone) {
	// Run their turn
	script_battle_turn_run(global.battle_turn);
} else {
	// Determine whose turn it is
	
	// Check for turn
	for (var i = 0; i < entity_amount; i++) {
		var entity = entities[i];
		
		if (entity.battle_speed_actual >= 1) {
			global.battle_turn = entity; // Set the turn to theirs
			entity.battle_speed_actual -= 1; // Decrease their speed value
			exit; // Do not run anymore code
		}
	}
	
	// Increment speed values
	for (var i = 0; i < entity_amount; i++) {
		var entity = entities[i];
		
		entity.battle_speed_actual += (entity.battle_speed/battle_speed_max);
	}
}