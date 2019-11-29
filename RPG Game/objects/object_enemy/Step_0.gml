/// @description Insert description here
// You can write your code in this editor

if (battle_hp <= 0) {
	// TODO death animation
	show_debug_message("ENEMY STEP EVENT - Death Animation");
	instance_destroy();
}