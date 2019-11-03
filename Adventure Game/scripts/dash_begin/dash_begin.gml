//@arg speed
//@arg direction_x
//@arg direction_y

if (is_agility) return; // If they are already doing an agility ability, return

// Arguments
var spd = argument[0]; // Speed to move
var dir_x = argument[1]; // Direction to move on the x-axis
var dir_y = argument[2]; // Direction to move on the y-axis

if (spd == 0 || (dir_x == 0 && dir_y == 0)) return; // If they are not moving, return

dash_initial_spd = spd; // Set the initial dash speed

if (dir_x != 0 && dir_y != 0) // If they are moving diagonally
	spd *= 2; // Multiply speed by 1.5
else // If they are not moving diagonally
	spd *= 2.5; // Multiply speed by 2

dash_spd = spd; // Set the dash speed
dash_dir_x = dir_x; // Set the dash direction on the x-axis
dash_dir_y = dir_y; // Set the dash direction on the y-axis
is_agility = true; // Say they are dashing
agility_charge = false;

set_animation(spr_dash); // Set to dash sprite