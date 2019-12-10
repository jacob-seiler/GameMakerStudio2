/// @description Movement

// Get input
var speed_x = keyboard_check(vk_right) - keyboard_check(vk_left);
var speed_y = keyboard_check(vk_down) - keyboard_check(vk_up);

var amount_x = speed_x * move_speed * script_util_delta();
var amount_y = speed_y * move_speed * script_util_delta();

// Move
script_move(amount_x, amount_y);
