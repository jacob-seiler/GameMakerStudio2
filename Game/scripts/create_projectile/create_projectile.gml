/// @arg0 projectile
/// @arg1 target

with (instance_create_depth(x, y, -y, argument[0])) {
	var my_dir = point_direction(x, y, argument[1].x, argument[1].y);
	dir_x = lengthdir_x(1, my_dir);
	dir_y = lengthdir_y(1, my_dir);
	
	alarm[0] = 21000 * get_delta();
}