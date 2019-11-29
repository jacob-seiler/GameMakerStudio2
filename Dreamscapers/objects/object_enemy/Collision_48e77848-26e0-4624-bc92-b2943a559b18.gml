/// @description Insert description here
// TODO start battle?

// TODO get enemies to start battle with
	// TODO check for nearby enemies within a certain range
//script_start_battle(object_index, object_enemy, object_enemy, object_enemy, object_enemy, object_enemy, object_enemy);

if (script_room_get_type(room) != room_type.battle) {
	var enemies = [];
	enemies[0] = object_index;
	
	script_battle_start(enemies);
}