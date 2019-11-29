/// @description Setup

width = display_get_gui_width();
height = display_get_gui_height();

x = width/4;
y = height/3 + 80;

global.name = "";

scale = 1/3;
fixed = false;
done = false;
exists = false;

// Names
username = environment_get_variable("USERNAME");

var start_x = x + ((sprite_get_width(sprite_name_card) * scale) / 2) + 50;
var start_y = y - ((sprite_get_height(sprite_name_card) * scale) / 2) - 70;

var alphabet = "abcdefghijklmnopqrstuvwxyz";
var offset_x = 0;
var offset_y = 0;
var spacing = 55;

var set_first = false;

for (var i = 1; i <= 26; i++) {
	var pos_x = start_x + offset_x;
	var pos_y = start_y + offset_y;
	
	var inst = instance_create_depth(pos_x, pos_y, -pos_y, object_letter);
	with (inst) {
		char = string_upper(string_char_at(alphabet, i));
		selected = false;
		
		if (!set_first) {
			selected = true;
			set_first = true;
		}
	}
	
	offset_x += spacing;
	if (offset_x > spacing * 10) {
		offset_x = 0;
		offset_y += spacing;
	}
}

offset_x = 0;
offset_y += spacing * 2;

for (var i = 1; i <= 26; i++) {
	var pos_x = start_x + offset_x;
	var pos_y = start_y + offset_y;
	
	var inst = instance_create_depth(pos_x, pos_y, -pos_y, object_letter);
	with (inst) {
		char = string_char_at(alphabet, i);
		selected = false;
	}
	
	offset_x += spacing;
	if (offset_x > spacing * 10) {
		offset_x = 0;
		offset_y += spacing;
	}
}

offset_y += spacing * 3;

var pos_x = width / 5;
var pos_y = start_y + offset_y;

var inst = instance_create_depth(pos_x, pos_y, -pos_y, object_letter);
with (inst) {
	char = "CANCEL";
	selected = false;
}

var pos_x = width / 2;

var inst = instance_create_depth(pos_x, pos_y, -pos_y, object_letter);
with (inst) {
	char = "DONE";
	selected = false;
}

var pos_x = width / 5 * 4;

var inst = instance_create_depth(pos_x, pos_y, -pos_y, object_letter);
with (inst) {
	char = "BACKSPACE";
	selected = false;
}