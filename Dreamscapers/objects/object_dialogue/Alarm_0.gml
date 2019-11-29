/// @description Setup variables

if (type == dialogue_type.system || type == dialogue_type.prompt) {
	x = display_get_gui_width() / 2;
	y = display_get_gui_height() / 2;
	
	width = display_get_gui_width() * 0.60; // 60%
	height = display_get_gui_height() * 0.65; // 60%
	
	c = make_color_rgb(211, 212, 217); // Color
} else {
	x = display_get_gui_width() / 2;
	y = 20;
	
	width = display_get_gui_width() * 0.90; // 90%
	height = display_get_gui_height() * 0.35; // 35%
	
	c = make_color_rgb(37, 38, 39); // Color
}

if (type == dialogue_type.info) {
	start_y = 130;
	pos_max = (display_get_gui_width() / 2) + (padding * 9/11);
	c = make_color_rgb(211, 212, 217); // Color
}

if (type == dialogue_type.prompt) {
	global.dialogue_response = -1;
}
