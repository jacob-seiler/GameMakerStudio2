/// @description Draw the sprite

var width = display_get_gui_width();
var height = display_get_gui_height();

draw_sprite(sprite_title, 0, width/2, height/6);

global.control_listener = self;

if (script_control_check_pressed(controls.start) || script_control_check_pressed(controls.a)) {
	room_goto(room_name);
}