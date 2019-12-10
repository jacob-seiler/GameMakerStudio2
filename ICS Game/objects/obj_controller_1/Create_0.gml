left_key = vk_left;
up_key = vk_up;
right_key = vk_right;
down_key = vk_down;

button_1_key = ord("Z");
button_2_key = ord("X");
button_3_key = ord("A");
button_4_key = ord("S");

gamepad_device = 0;

left_gamepad = gp_padl;
up_gamepad = gp_padu;
right_gamepad = gp_padr;
down_gamepad = gp_padd;

button_1_gamepad = gp_face1; // A
button_2_gamepad = gp_face2; // B
button_3_gamepad = gp_face3; // X
button_4_gamepad = gp_face4; // Y

gamepad_set_axis_deadzone(gamepad_device, 0.2);

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