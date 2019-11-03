// Check inputs for input 1
left_check = keyboard_check(ord("A")); // Check inputs for moving left
up_check = keyboard_check(ord("W")); // Check inputs for moving up
right_check = keyboard_check(ord("D")); // Check inputs for moving right
down_check = keyboard_check(ord("S")); // Check inputs for moving down

agility_check = keyboard_check(vk_space);
agility_pressed = keyboard_check_pressed(vk_space);
agility_released = keyboard_check_released(vk_space);

attack_pressed = mouse_check_button_pressed(mb_left);
attack_released = mouse_check_button_released(mb_left);