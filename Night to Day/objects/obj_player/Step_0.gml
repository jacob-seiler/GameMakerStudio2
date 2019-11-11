/// @description Insert description here
// You can write your code in this editor

// Calculate movement
var move_speed = 300
var actual_speed = max(move_speed * scr_get_delta(), 1)

var dir_x = keyboard_check(vk_right) - keyboard_check(vk_left)
var dir_y = keyboard_check(vk_down) - keyboard_check(vk_up)

// Move the object on the x-axis
x += actual_speed * dir_x

// Fix collision
while (place_meeting(x, y, obj_collision)) {
	x -= dir_x
}

// Move the object on the y-axis
y += actual_speed * dir_y

// Fix collision
while (place_meeting(x, y, obj_collision)) {
	y -= dir_y
}

depth = -y