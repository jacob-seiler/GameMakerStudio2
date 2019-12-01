var move_speed = 300;
var dir_x = keyboard_check(obj_settings.move_right_key) - keyboard_check(obj_settings.move_left_key);
var dir_y = keyboard_check(obj_settings.move_down_key) - keyboard_check(obj_settings.move_up_key);

move(move_speed, dir_x, dir_y);