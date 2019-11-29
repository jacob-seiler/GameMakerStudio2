/// @description Interact & Sprites
var overworld = (script_room_get_type(room) == room_type.overworld);
var battle = (script_room_get_type(room) == room_type.battle);

if (prev_x != x || prev_y != y) {
	moved = true;
	
	if (prev_x < x) {
		sprite_direction = 0; // Right
	} else if (prev_x > x) {
		sprite_direction = 1; // Left
	}
} else {
	moved = false;
}

// TODO Custom sprites during battle actions?
#region Sprites
if (defending) {
	// Defend
	script_util_set_animation(sprite_defend);
} else if (attacking) {
	// Attack
	if (attack_potential == 0) {
		script_util_set_animation(sprite_attack);
	} else {
		script_util_set_animation(sprite_attack_windup);
	}
} else if (moved) {
	// Move
	if (overworld) {
		script_util_set_animation(sprite_move);
	} else {
		script_util_set_animation(sprite_move_battle);
	}
} else {
	// Idle
	if (overworld) {
		script_util_set_animation(sprite_idle);
	} else {
		script_util_set_animation(sprite_idle_battle);
	}
}
#endregion
#region Charge sprite counter
if (charged) {
	// TODO charged sprite if charged
	sprite_charge_index += script_util_delta() * sprite_charge_speed;

	if (sprite_charge_index > sprite_get_number(sprite_charge))
		sprite_charge_index = 0;
}
#endregion

event_inherited();

if (interact != noone && !defending && !attacking && !battle && script_control_check_pressed(controls.a)) {
	with (interact)
		event_user(0);
}
