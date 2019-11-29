/// @description Draw the sprite

if (done)
	draw_sprite_ext(sprite_name_card, 0, x + random_range(-1, 1), y + random_range(-1, 1), scale, scale, 0, -1, 1);
else
	draw_sprite_ext(sprite_name_card, 0, x, y, scale, scale, 0, -1, 1);

var c = make_color_rgb(37, 38, 39);

draw_set_halign(fa_center);

if (string_length(global.name) > 6) {
	draw_set_font(font_name_small);
} else {
	draw_set_font(font_name);
}

var pos_x = x + random_range(-1, 1);
var pos_y = y + random_range(-1, 1);

draw_text_color(pos_x, pos_y + 25, global.name, c, c, c, c, 1);

// TODO title

var message = "Is this name ok?";

#region messages
if (global.name == username) {
	message = "An honest fella. Aren't ya!";
} else if (string_replace_all(string_lower(global.name), "a", "") == "") {
	message = "Very original.";
} else if (string_lower(global.name) == "morty" || string_lower(global.name) == "rick") {
	message = "Is this name *burp* ok?";
} else if (string_lower(global.name) == "abcdefghij") {
	message = "klmnopqrstuvwxyz";
} else if (string_lower(global.name) == "wirt") {
	message = "Into the unknown?";
} else if (string_lower(global.name) == global.name) {
	message = "is this name ok?";
} else if (string_upper(global.name) == global.name) {
	message = "IS THIS NAME OK?";
}
#endregion

if (!done) {
	if (!fixed) {
		scale = 1/3;
	
		x = width/4;
		y = height/3 + 80;
	
		var none = true;
	
		for (var i = 0; i < instance_number(object_letter); i++) {
			with (instance_find(object_letter, i)) {
				if (selected)
					none = false;
			}
		}
	
		if (none)
			with (instance_find(object_letter, 0))
				selected = true;
		
		exists = false;
		
		fixed = true;
	}
	
	for (var i = 0; i < instance_number(object_letter); i++) {
		with (instance_find(object_letter, i)) {
			event_user(0);
		}
	}
} else {
	if (fixed) {
		for (var i = 0; i < instance_number(object_letter); i++) {
			with (instance_find(object_letter, i))
				selected = false;
		}
		
		exists = file_exists(global.name + ".sav"); // Check if file exists
		
		fixed = false;
	} else {
		if (script_control_check_pressed(controls.b)) {
			done = false;
		} else if (script_control_check_pressed(controls.a)) {
			// TODO advance
			room_goto(room_dream_0_path);
		}
	}
			
	var to_x = width / 2;
	var to_y = (height / 2) - 100;
	var to_scale = 1/2;
	
	var delay = 2400 * script_util_delta();
	
	x += (to_x - x) / delay;
	y += (to_y - y) / delay;
	scale += (to_scale - scale) / delay;
	
	var c = make_color_rgb(255, 249, 251);
	if (exists)
		draw_text_color(width / 2, (height / 6 * 5) - 55, "This name is already taken. Would you like to override it?", c, c, c, c, 1);
	else
		draw_text_color(width / 2, (height / 6 * 5) - 55, message, c, c, c, c, 1);
	
	var value_a = script_control_string(controls.a);
	var value_b = script_control_string(controls.b);
	
	draw_set_font(font_message);
	draw_text_color(width / 2, (height / 6 * 5) + 5, "(" + value_a + " = yes, " + value_b + " = no)", c, c, c, c, 1);
	
	global.control_listener = self;
}
