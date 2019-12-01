if (sprite_index != spr_cannon_attack) {
	sprite_index = spr_cannon_attack;
	
	if (orange) {
		amount = 3;
		alarm[1] = 1;
	} else {
		amount = 0;
		create_projectile(obj_attack_projectile_blue, obj_player);
	}
} else {
	if (amount <= 0)
			state = states.cooldown;	
}