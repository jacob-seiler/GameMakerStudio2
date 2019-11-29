/// @function script_battle_get_position_enemy(index)
/// @param {real} index The enemy to get the position of.
/// @description Get the position to place the enemy.
/// @return The position to place the enemy.

var index = argument[0];
var enemies = script_battle_get_enemies();
var enemy_amount = array_length_1d(enemies);

// Positions
var pos_x = [514, 578, 748];
var pos_y = [703, 479, 607];

var pos = [];
if (enemy_amount > 1) {
	pos[0] = pos_x[index];
	pos[1] = pos_y[index];
	return pos;
} else {
	pos[0] = pos_x[2];
	pos[1] = pos_y[2];
	return pos;
}

