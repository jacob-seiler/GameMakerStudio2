/* Movement */
// Get inputs from controller
var left_check = controller.left_check; // Check inputs for moving left
var up_check = controller.up_check; // Check inputs for moving up
var right_check = controller.right_check; // Check inputs for moving right
var down_check = controller.down_check; // Check inputs for moving down

var agility_check = controller.agility_check;
var agility_pressed = controller.agility_pressed;
var agility_released = controller.agility_released;

var attack_pressed = controller.attack_pressed;
var attack_released = controller.attack_released;

// Determine what direction to move the player
	var dir_x = right_check - left_check; // Determine what direction to move on the x-axis
	var dir_y = down_check - up_check; // Determine what direction to move on the y-axis

	// Move the player
	if (!is_agility) {
		if (agility_charge && (dir_x != 0 || dir_y != 0) && move_spd != 0) {
			// TODO: something different if they attakck instead of move?
			dodge_begin(move_spd, dir_x, dir_y);
		} else if (sprite_index != spr_attack) {
			move(move_spd, dir_x, dir_y); // Run the move script
		}
	}

	/* Agility */
	// TODO: bash (if they attack while dodging)
		// TODO: check if there is a hole/void in the way
			// TODO: if so, set animation to leap
			// TODO: if not, set animation to roll
	if (!is_agility) {
		if (agility_pressed) {
			if (move_spd == 0 || (dir_x == 0 && dir_y == 0))
				agility_charge = true;
			else
				dash_begin(move_spd, dir_x, dir_y); // Run the dash_begin script
		}
		
		if (agility_check) {
			// TODO: climb (if there is an object to climb)
			if (sprite_index != spr_dash && agility_charge)
				set_animation(spr_charge);
		}
		
		if (agility_released && agility_charge) {
			agility_charge = false;
			set_animation(spr_idle);
		}
	}

	dash(); // Run the dash script
	dodge(); // Run the dodge script
	
	/* Comabt */
	// TODO: slash / counter / idk yet
	if (!is_agility)
		if (attack_pressed || attack_released)
			attack_begin();
		else if ((move_spd == 0 || (dir_x == 0 && dir_y == 0)) && !agility_charge)
			set_animation(spr_idle);