/// @description Movement

// Get input
var input_right = keyboard_check(ord("D")) || keyboard_check(vk_right);
var input_left = keyboard_check(ord("A")) || keyboard_check(vk_left);
var input_down = keyboard_check(ord("S")) || keyboard_check(vk_down);
var input_up = keyboard_check(ord("W")) || keyboard_check(vk_up);

var speed_x = input_right - input_left;
var speed_y = input_down - input_up;

var amount_x = speed_x * move_speed * script_util_delta();
var amount_y = speed_y * move_speed * script_util_delta();

// Move
script_move(amount_x, amount_y);
