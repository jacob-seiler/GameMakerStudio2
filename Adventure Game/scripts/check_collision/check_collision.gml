//@arg spd1
//@arg dir_x
//@arg dir_y

// TODO check collision
	// TODO if so, check if dash is allowed & if they are dashing
	// TODO if not, move as close as possible

var spd1 = argument[0];
var dir_x1 = argument[1];
var dir_y1 = argument[2];

if (place_meeting(x + spd1 * dir_x1, y + spd1 * dir_y1, obj_collision)) {
	var inst = instance_place(x + spd1 * dir_x1, y + spd1 * dir_y1, obj_collision);
	
	if (inst.collision_type == 1 && is_agility)
		return false;
	
	dash_end();
	
	if (place_meeting(x + spd1 * dir_x1, y, obj_collision)) {
		while(!place_meeting(x + sign(dir_x1), y, obj_collision))
			x += sign(dir_x1);
	} else x += spd1 * dir_x1;
	
	if (place_meeting(x, y + spd1 * dir_y1, obj_collision)) {
		while(!place_meeting(x, y + sign(dir_y1), obj_collision))
			y += sign(dir_y1);
			
	} else y += spd1 * dir_y1;
	
	return true;
}

return false;