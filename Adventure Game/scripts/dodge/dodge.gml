if (sprite_index != spr_dodge) return; // If they are not dodging, return

// If they are slower than the initial speed times 4
if (dodge_spd <= (dodge_initial_spd * 4)) {
	// TODO: wait for the animation to end
	if (dodge_cooldown > 0) {
		dodge_cooldown -= (dodge_cooldown * ((delta_time / 1000000) * 30));
	} else {
		dodge_end(); // Stop the dodge
	}
} else
	move(dodge_spd, dodge_dir_x, dodge_dir_y); // Move

dodge_spd -= (dodge_spd * ((delta_time / 1000000) * 2)); // Slow down a little