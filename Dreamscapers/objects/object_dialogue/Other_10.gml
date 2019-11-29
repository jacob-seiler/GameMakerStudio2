/// @description Draw the dialogue box

switch (type) {
	case dialogue_type.system:
		if (sprite_index != sprite_dialogue_system)
			sprite_index = sprite_dialogue_system;
		break;
	case dialogue_type.prompt:
		if (sprite_index != sprite_dialogue_prompt)
			sprite_index = sprite_dialogue_prompt;
		break;
	case dialogue_type.info:
		if (sprite_index != sprite_dialogue_info)
			sprite_index = sprite_dialogue_info;
		break;
	case dialogue_type.thought:
		if (sprite_index != sprite_dialogue_thought)
			sprite_index = sprite_dialogue_thought;
		break;
	default:
		if (sprite_index != sprite_dialogue_speech)
			sprite_index = sprite_dialogue_speech;
		break;
}

draw_set_font(font_talk);

if (type == dialogue_type.system || type == dialogue_type.prompt) {
	draw_sprite_stretched(sprite_index, image_index, x - width / 2, y - height / 2, width, height)
} else {
	draw_sprite_stretched(sprite_index, image_index, x - width / 2, y, width, height)
}

if (type == dialogue_type.speech_floating || type == dialogue_type.speech) {
	// TODO draw name
}

if (type == dialogue_type.speech_nameless || type == dialogue_type.speech) {
	// TODO arrow
}

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
		
		if ((char == " " && pos_current > pos_max) || pos_current > pos_end) {
			space = 0;
			line++;
		} else {
			space++;
		}
	}
}

if (type == dialogue_type.prompt) {
	var down_pressed = keyboard_check_pressed(script_control_value(controls.down)) || (gamepad_is_connected(0) && gamepad_button_check_pressed(0, script_control_value_gamepad(controls.down)));
	var up_pressed = keyboard_check_pressed(script_control_value(controls.up)) || (gamepad_is_connected(0) && gamepad_button_check_pressed(0, script_control_value_gamepad(controls.up)));
		
	if (selection == 0 && down_pressed)
		selection = 1;
	else if (selection == 1 && up_pressed)
		selection = 0;
		
	// TODO draw options
	// TODO draw currently selected option
	if (selection == 0)
		show_debug_message(option_0);
	else
		show_debug_message(option_1);
} else {
	// TODO draw continue arrow
}