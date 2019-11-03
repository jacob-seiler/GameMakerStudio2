//@arg speed
//@arg direction_x
//@arg direction_y

// Arguments
var spd = argument[0] * get_delta_time(); // Determine how much to move this frame
var dir_x = argument[1]; // Direction to move on the x-axis
var dir_y = argument[2]; // Direction to move on the y-axis

/* Move the player */
// Check collision void
if (spd == 0 || (dir_x == 0 && dir_y = 0)) return;

if (!check_collision(spd, dir_x, dir_y)) {
	x += spd * dir_x;
	y += spd * dir_y;
	
	if (!is_agility) {
		set_animation(spr_move);
	}
}