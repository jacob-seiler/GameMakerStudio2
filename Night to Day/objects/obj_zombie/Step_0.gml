/// @description Insert description here
// You can write your code in this editor

// TODO Only chase if in the same house room

// Calculate movement
var actual_speed = max(move_speed * 2 * scr_get_delta(), 1)

var dir_x = sign(tracker.x - x);
var dir_y = sign(tracker.y - y);

// Move the object
vel_x = actual_speed * dir_x
vel_y = actual_speed * dir_y

speed_x -= sign(speed_x - vel_x) * 0.25
speed_y -= sign(speed_y - vel_y) * 0.25

x += speed_x
y += speed_y

depth = -y