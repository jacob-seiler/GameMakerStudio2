/// @function script_setup_window()
/// @description Sets up the window

if (global.visual_full_screen) {
	window_set_fullscreen(true);
} else {
	var width = global.visual_width;
	var height = global.visual_height;
	var x_pos = (display_get_width() - width) / 2;
	var y_pos = (display_get_height() - height) / 2;

	window_set_rectangle(x_pos, y_pos, width, height);
}