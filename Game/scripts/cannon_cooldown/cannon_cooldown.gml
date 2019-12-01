if (sprite_index == spr_cannon_cooldown) return;
	sprite_index = spr_cannon_cooldown;
	alarm[0] = 7000 * get_delta();