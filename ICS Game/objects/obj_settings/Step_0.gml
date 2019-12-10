if (keyboard_check_pressed(vk_escape)) {
	if (paused) {
		paused = false;
	} else {
		paused = true;
	}
}