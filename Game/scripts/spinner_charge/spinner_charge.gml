if (sprite_index == spr_spinner_charge) return;
	sprite_index = spr_spinner_charge;
	// TODO how long to charge for?
	alarm[0] = 7000 * get_delta();