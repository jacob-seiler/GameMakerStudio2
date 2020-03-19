/// @description Insert description here
// You can write your code in this editor

if (!object_is_ancestor(controlling.object_index, object_character)) {
	return
}

with (controlling) {
	action_up = keyboard_check(ord("W"))
	action_left = keyboard_check(ord("A"))
	action_down = keyboard_check(ord("S"))
	action_right = keyboard_check(ord("D"))
	
	// TODO add other actions
}