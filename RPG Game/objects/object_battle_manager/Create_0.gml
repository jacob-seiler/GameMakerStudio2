/// @description Battle Setup

// TODO room transition?

// Initialize entities
var enemies = global.battle_enemies;
	
for (var i = 0; i < array_length_1d(enemies); i++) {
	var pos = script_battle_get_position_enemy(i);
	instance_create_layer(pos[0], pos[1], "Instances", enemies[i]);
}

instance_create_layer(1250, 670, "Instances", global.battle_player); // Initialize player
instance_create_layer(1404, 512, "Instances", global.battle_ally); // Initialize ally

global.battle_turn = noone; // The entity whose turn it is

// Setup speed
var entities = script_battle_get_entities();
var entity_amount = array_length_1d(entities);

battle_speed_max = entities[0].battle_speed;
for (var i = 0; i < entity_amount; i++) {
	var entity = entities[i];
	
	entity.battle_speed_actual = 0;
	
	if (entity.battle_speed > battle_speed_max)
		battle_speed_max = entity.battle_speed;
}

battle_size = entity_amount; // Amount of entities