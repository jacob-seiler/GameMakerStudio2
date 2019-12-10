left = keyboard_check(left_key) || gamepad_button_check(gamepad_device, left_gamepad) || gamepad_axis_value(gamepad_device, gp_axislh) < 0;
up = keyboard_check(up_key) || gamepad_button_check(gamepad_device, up_gamepad) || gamepad_axis_value(gamepad_device, gp_axislv) < 0;
right = keyboard_check(right_key) || gamepad_button_check(gamepad_device, right_gamepad) || gamepad_axis_value(gamepad_device, gp_axislh) > 0;
down = keyboard_check(down_key) || gamepad_button_check(gamepad_device, down_gamepad) || gamepad_axis_value(gamepad_device, gp_axislv) > 0;

left_pressed = keyboard_check_pressed(left_key);
up_pressed = keyboard_check_pressed(up_key);
right_pressed = keyboard_check_pressed(right_key);
down_pressed = keyboard_check_pressed(down_key);

left_released = keyboard_check_released(left_key);
up_released = keyboard_check_released(up_key);
right_released = keyboard_check_released(right_key);
down_released = keyboard_check_released(down_key);

button_1 = keyboard_check(button_1_key) || gamepad_button_check(gamepad_device, button_1_gamepad);
button_2 = keyboard_check(button_2_key) || gamepad_button_check(gamepad_device, button_2_gamepad);
button_3 = keyboard_check(button_3_key) || gamepad_button_check(gamepad_device, button_3_gamepad);
button_4 = keyboard_check(button_4_key) || gamepad_button_check(gamepad_device, button_4_gamepad);

button_1_pressed = keyboard_check_pressed(button_1_key) || gamepad_button_check_pressed(gamepad_device, button_1_gamepad);
button_2_pressed = keyboard_check_pressed(button_2_key || gamepad_button_check_pressed(gamepad_device, button_2_gamepad));
button_3_pressed = keyboard_check_pressed(button_3_key) || gamepad_button_check_pressed(gamepad_device, button_3_gamepad);
button_4_pressed = keyboard_check_pressed(button_4_key) || gamepad_button_check_pressed(gamepad_device, button_4_gamepad);

button_1_released = keyboard_check_released(button_1_key) || gamepad_button_check_released(gamepad_device, button_1_gamepad);
button_2_released = keyboard_check_released(button_2_key) || gamepad_button_check_released(gamepad_device, button_2_gamepad);
button_3_released = keyboard_check_released(button_3_key) || gamepad_button_check_released(gamepad_device, button_3_gamepad);
button_4_released = keyboard_check_released(button_4_key) || gamepad_button_check_released(gamepad_device, button_4_gamepad);