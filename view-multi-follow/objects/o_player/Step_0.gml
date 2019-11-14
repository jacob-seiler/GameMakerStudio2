if (active) {
    x += (keyboard_check(vk_right) - keyboard_check(vk_left)) * 4
    y += (keyboard_check(vk_down) - keyboard_check(vk_up)) * 4
    image_index = 0
} else image_index = 1

