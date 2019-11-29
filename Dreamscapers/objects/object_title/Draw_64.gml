/// @description Draw the sprite

var width = display_get_gui_width();
var height = display_get_gui_height();

draw_sprite(sprite_title, 0, width/2, height/6);

global.control_listener = self;

var pressed_start = script_control_check_pressed(controls.start);
var pressed_a = script_control_check_pressed(controls.a);
var pressed_x = script_control_check_pressed(controls.x);

if (pressed_start || pressed_a || pressed_x) {
	room_goto(room_name);
}

// TODO NEW GAME
// TODO LOAD GAME
// TODO SETTINGS