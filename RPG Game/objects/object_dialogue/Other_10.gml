/// @description Draw the dialogue box

if (sprite_index != sprite_dialogue_speech)
	sprite_index = sprite_dialogue_speech;

x = display_get_gui_width() / 2;
y = 20;

var width = display_get_gui_width() * 0.90; // 90%
var height = display_get_gui_height() * 0.35; // 35%

// TODO draw name

draw_set_font(font_talk);
var c = make_color_rgb(37, 38, 39);

draw_sprite_stretched(sprite_index, image_index, x - width / 2, y, width, height)

var text_speed = 35;

dialogue_current_length += text_speed * script_util_delta();

var length = min(floor(dialogue_current_length), string_length(message));
var space = 0;
var line = 0;

var current_mode = mode;

if (wave[0] == -100) {
	for (var i = 0; i <= string_length(message); i++) {
		wave[i] = 0;
	}
}

for (var i = 1; i <= length; i++) {
	var char = string_char_at(message, i); // The character to draw
	
	// Set the drawing mode
	if (current_mode == -1) {
		current_mode = real(char);
	} else if (char == "{") {
		current_mode = -1;
	} else {
		// Draw the char
		var pos_x = start_x + (space * char_width);
		var pos_y = start_y + (line_space * line);
		
		switch (current_mode) {
			case text_mode.waving:
				var amplitude = 8;
				var period = 1;
				var k = (2 * pi) / period;
				
				if ((i - 2) < 1 || string_char_at(message, i - 2) == "{") {
					wave[i] -= script_util_delta(); // Time its been
				} else {
					wave[i] = wave[i - 1] + 0.02;
				}
				
				var offset = amplitude * cos(k * (wave[i]));
				
				draw_text_color(pos_x, pos_y + offset, char, c, c, c, c, 1);
				break;
			case text_mode.shaking:
				var shake = 1.5;
				draw_text_color(pos_x + random_range(-shake, shake), pos_y + random_range(-shake, shake), char, c, c, c, c, 1);
				break;
			default:
				draw_text_color(pos_x, pos_y, char, c, c, c, c, 1);
				break;
		}
		
		// Move to the text char position
		var pos_current = start_x + (space * char_width);
		var pos_max = (display_get_gui_width() / 2) + (padding * 3 / 5);
		var pos_end = (display_get_gui_width() / 2) + padding;
		
		if ((char == " " && pos_current > pos_max) || pos_current > pos_end) {
			space = 0;
			line++;
		} else {
			space++;
		}
	}
}

// TODO draw continue arrow