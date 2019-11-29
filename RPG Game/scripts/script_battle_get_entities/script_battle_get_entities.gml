/// @function script_battle_get_entities()
/// @description Gets a list of every entity in the battle.
/// @return The list of every entity in the battle.

var entities = script_battle_get_enemies();
var ally = script_battle_get_ally();
var player = script_battle_get_player();

if (script_battle_entity_is_valid(ally))
	entities[array_length_1d(entities)] = ally;

if (script_battle_entity_is_valid(player))
	entities[array_length_1d(entities)] = player;

return entities;