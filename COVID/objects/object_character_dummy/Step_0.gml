/// @description Insert description here
// You can write your code in this editor

// Movement
var dir_x = action_right - action_left
var dir_y = action_down - action_up

if (dir_x != 0 or dir_y != 0) {
	var dir = point_direction(0, 0, dir_x, dir_y)
	var move_x = lengthdir_x(move_speed, dir)
	var move_y = lengthdir_y(move_speed, dir)

	x += move_x
	y += move_y
	
	// Set Sprite
	switch (dir) {
		case 0: sprite_index = sprite_dummy_moving_r; break
		case 45: sprite_index = sprite_dummy_moving_ur; break
		case 90: sprite_index = sprite_dummy_moving_u; break
		case 135: sprite_index = sprite_dummy_moving_ul; break
		case 180: sprite_index = sprite_dummy_moving_l; break
		case 225: sprite_index = sprite_dummy_moving_dl; break
		case 270: sprite_index = sprite_dummy_moving_d; break
		case 315: sprite_index = sprite_dummy_moving_dr; break
	}
} else {
	image_index = 0
}