if (sprite_index == spr_spinner_cooldown) return;
	sprite_index = spr_spinner_cooldown;
	alarm[0] = 7000 * get_delta();