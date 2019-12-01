/// @arg move_speed
/// @arg dir_x
/// @arg dir_y

var move_speed = argument[0];
var dir_x = argument[1];
var dir_y = argument[2];

x += move_speed * dir_x * get_delta();
y += move_speed * dir_y * get_delta();