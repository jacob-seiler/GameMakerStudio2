/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (instance_exists(object_enemy_boss_spider)) {
	depth = -instance_find(object_enemy_boss_spider, 0).y + 1 - (2 * left_side);
}