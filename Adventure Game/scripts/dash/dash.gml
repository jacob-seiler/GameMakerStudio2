if (sprite_index != spr_dash) return; // If they are not dashing, return

if (dash_spd <= (dash_initial_spd)) // If they are slower than the initial speed
	dash_end(); // Stop dashing
else
	move(dash_spd, dash_dir_x, dash_dir_y); // Move

dash_spd -= (dash_spd * ((delta_time / 1000000) * 1.2)); // Slow down a little