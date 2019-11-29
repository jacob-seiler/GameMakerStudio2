/// @description Draw settings / pause menu
if (!global.pause)
	exit;
	
var c = c_black
// TODO blur background

draw_rectangle_color(0, 0, 500, 500, c, c, c, c, false);