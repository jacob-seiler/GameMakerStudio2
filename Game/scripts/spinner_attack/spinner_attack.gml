if (sprite_index != spr_spinner_attack) {
	sprite_index = spr_spinner_attack;
	
	var my_dir = point_direction(x, y, obj_player.x, obj_player.y);
	dir_x = lengthdir_x(1, my_dir);
	dir_y = lengthdir_y(1, my_dir);
}

move(300, dir_x, dir_y);