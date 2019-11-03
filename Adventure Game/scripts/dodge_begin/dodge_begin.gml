//@arg speed
//@arg direction_x
//@arg direction_y

if (is_agility) return; // If they are already doing an agility ability, return

// Arguments
var spd = argument[0]; // Speed to move
var dir_x = argument[1]; // Direction to move on the x-axis
var dir_y = argument[2]; // Direction to move on the y-axis

if (spd == 0 || (dir_x == 0 && dir_y == 0)) return; // If they are not moving, return

// Prevent diagonal movement
if (dir_x != 0 && dir_y != 0) {
	if (abs(dir_y) < abs(dir_x)) {
		dir_y = 0;
	} else {
		dir_x = 0;
	}
}

dodge_initial_spd = spd; // Set the initial dodge speed

spd *= 5; // Multiply speed by 5

dodge_spd = spd; // Set the dodge speed
dodge_dir_x = dir_x; // Set the dodge direction on the x-axis
dodge_dir_y = dir_y; // Set the dodge direction on the y-axis
dodge_cooldown = dodge_initial_spd * 0.25;
is_agility = true; // Say they are dodgeing
agility_charge = false;

set_animation(spr_dodge); // Set to dodge sprite