/// @description Draw

var c = make_color_rgb(211, 212, 217);

if (selected)
	c = make_color_rgb(187, 10, 33);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(font_letter);

var pos_x = x + random_range(-1, 1);
var pos_y = y + random_range(-1, 1);

draw_text_color(pos_x, pos_y, char, c, c, c, c, 1);