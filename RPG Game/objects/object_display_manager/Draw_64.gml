/// @description Draw dialogue systems (text boxes, system messages, etc)

if (bar_size != bar_size_to)
	bar_size += (bar_size_to - bar_size) / (bar_speed * script_util_delta());

if (bar_size > 0) {
	var c = make_color_rgb(0, 0, 0);
	draw_rectangle_color(0, 0, display_get_gui_width(), bar_size, c, c, c, c, false);
	draw_rectangle_color(0, display_get_gui_height() - bar_size, display_get_gui_width(), display_get_gui_height(), c, c, c, c, false);
}

if (global.dialogue_current != noone) {
	bar_size_to = 50;
	
	with (global.dialogue_current)
		event_user(0);
} else {
	bar_size_to = 0;
	
	script_dialogue_update();
}