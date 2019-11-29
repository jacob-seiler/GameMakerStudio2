/// @function script_battle_get_enemies()
/// @description Get the enemy entities in the battle.
/// @return The enemy entities in the battle.

var enemies = [];

for (var i = 0; i < array_length_1d(global.battle_enemies); i++) {
	var entity = global.battle_enemies[i];
	
	if (script_battle_entity_is_valid(entity))
		enemies[array_length_1d(enemies)] = entity;
}

return enemies;