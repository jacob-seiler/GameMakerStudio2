/// @description Initialize setting values
// TODO save settings
// TODO audio
// TODO settings menu

// Game
global.pause = false;

// Visuals
var visual_aspect_ratio = clamp(display_get_width() / display_get_height(), 1, 16/9);
global.visual_width = 1920;
global.visual_height = global.visual_width / visual_aspect_ratio;
global.visual_full_screen = false;

// Controls
global.control_up = vk_up;
global.control_down = vk_down;
global.control_left = vk_left;
global.control_right = vk_right;
global.control_a = ord("Z");
global.control_b = ord("X");
global.control_x = ord("A");
global.control_y = ord("S");
global.control_rb = ord("W");
global.control_lb = ord("Q");
global.control_start = vk_escape;
global.control_select = vk_space;

global.control_deadzone = 0.2;
global.control_gp_up = gp_padu;
global.control_gp_down = gp_padd;
global.control_gp_left = gp_padl;
global.control_gp_right = gp_padr;
global.control_gp_a = gp_face1;
global.control_gp_b = gp_face2;
global.control_gp_x = gp_face3;
global.control_gp_y = gp_face4;
global.control_gp_rb = gp_shoulderrb;
global.control_gp_lb = gp_shoulderlb;
global.control_gp_start = gp_start;
global.control_gp_select = gp_select;

global.control_listener = noone;

enum controls {
	up,
	down,
	left,
	right,
	a,
	b,
	x,
	y,
	rb,
	lb,
	start,
	select
}

// Apply Settings
script_settings_apply();

// Settings Menu
// TODO

// Game Setup
// TODO

enum room_type {
	overworld,
	dream,
	battle,
	other
}