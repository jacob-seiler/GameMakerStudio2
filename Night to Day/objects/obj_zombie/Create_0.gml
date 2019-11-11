/// @description Insert description here
// You can write your code in this editor

move_speed = 120

speed_x = 0
speed_y = 0

// Tracker
tracker = instance_create_depth(x, y, depth + 1, obj_tracker)

with (tracker) {
	x = other.x
	y = other.y
	
	move_speed = other.move_speed
}