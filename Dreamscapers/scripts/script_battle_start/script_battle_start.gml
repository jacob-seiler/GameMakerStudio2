/// @function script_battle_start(enemies)
/// @description Starts a battle.
/// @param {real} enemies An array of enemies to fight in the battle.
	
// TODO battle start type? Ambush, Invasion, Normal?
// TODO get nearby enemies?

// TODO background?
room_goto(room_battle);

// TODO which ally?

var enemies = argument[0];

global.battle_player = object_player; // TODO
global.battle_ally = object_ally; // TODO
global.battle_enemies = enemies; // TODO