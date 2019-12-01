if (target != noone) {
	if (x > target.x)
		dir_x = -1;
	else
		dir_x = 1;
	
	if (y > target.y)
		dir_y = -1;
	else
		dir_y = 1;
}

speed_x += dir_x;
speed_y += dir_y;

var speed_limit = 30;
speed_x = clamp(speed_x, -1 * speed_limit, speed_limit);
speed_y = clamp(speed_y, -1 * speed_limit, speed_limit);

move(move_speed / 40, speed_x, speed_y);