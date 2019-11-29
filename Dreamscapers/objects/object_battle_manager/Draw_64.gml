/// @description Draw win / death screens

if (win == 0)
	exit;
	
var keyboard = keyboard_check_pressed(script_control_value(controls.start)) || keyboard_check_pressed(script_control_value(controls.a)) || keyboard_check_pressed(script_control_value(controls.x));
var gamepad = false;

if (gamepad_is_connected(0))
	gamepad = gamepad_button_check_pressed(0, script_control_value_gamepad(controls.start)) || gamepad_button_check_pressed(0, script_control_value_gamepad(controls.a)) || gamepad_button_check_pressed(0, script_control_value_gamepad(controls.x));

if (win < 0) {
	// Fade to black
	bg_alpha += script_util_delta();
	draw_set_color(make_color_rgb(0, 0, 0));
	draw_set_alpha(bg_alpha);
	draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
	
	// Game over sprite
	var pos_x = display_get_gui_width() / 2;
	var pos_y = display_get_gui_height() * (1/5);
	var scale = (display_get_gui_width() * (3/5)) / sprite_get_width(sprite_gameover);
	var alpha = bg_alpha - 1; // 1 Second delay
	draw_sprite_ext(sprite_gameover, 0, pos_x, pos_y, scale, scale, 0, -1, alpha);
	
	// When button is pressed
	if (!prompted && (keyboard || gamepad)) {
		script_dialogue_add_message(dialogue_type.prompt, "What would you like to do?", "Wake up", "Load save");
		prompted = true;
	}
	
	if (prompted) {
		if (global.dialogue_response == 0) {
			// TODO wake up
			show_debug_message("WAKE UP");
		} else if (global.dialogue_response == 1) {
			// TODO load save
			show_debug_message("LOAD SAVE");
		}
	}
	
	draw_set_alpha(1);
	
	if (global.dialogue_current != noone)
	with (global.dialogue_current)
		event_user(0);
	
} else if (win > 0) {
	// Victory over sprite
	var shake = random_range(1, -1);
	var pos_x = display_get_gui_width() / 2;
	var pos_y = display_get_gui_height() * (1/7);
	
	// Scale
	var scale = (display_get_gui_width() * (3/5)) / sprite_get_width(sprite_victory);
	
	if (abs(victory_scale - scale) < 5)
			victory_scale = scale;
	
	if (victory_scale != scale && keyboard || gamepad) {
		keyboard = false;
		gamepad = false;
		
		victory_scale = scale;
	}
	
	if (victory_scale != scale) {
		victory_scale += (scale - victory_scale) / 25;
	}
	
	if (victory_scale == scale) {
		// Screen slides in
		var scale_screen = display_get_gui_width() / sprite_get_width(sprite_victory_screen);
		var screen_x = display_get_gui_width() / 2;
		
		if (abs(victory_screen_x - screen_x) < 1)
			victory_screen_x = screen_x;
		
		if (victory_screen_x != screen_x && keyboard || gamepad) {
			keyboard = false;
			gamepad = false;
		
			victory_screen_x = screen_x;
		}
		
		if (victory_screen_x != screen_x) {
			victory_screen_x += (screen_x - victory_screen_x) / 25;
		}
		
		draw_sprite_ext(sprite_victory_screen, 0, victory_screen_x, display_get_gui_height() / 2, scale_screen, scale_screen, 0, -1, 1);
		
		if (victory_screen_x == screen_x) {
			show_debug_message("STUFF");
			// TODO rewards displayed
				// TODO Dying words
				// TODO Gold
				// TODO XP
			// TODO if level up
				// TODO show level up
				// TODO if player
					// TODO choose attack defense or health
			// TODO dismiss info
			// TODO return to previous room
			// TODO dismiss page
			
			global.do_it = true;
			room_goto(room_dream_2_tutorial);
			
		}
	}
	
	draw_sprite_ext(sprite_victory, 0, pos_x + shake, pos_y + shake, victory_scale, victory_scale, 0, -1, 1);
}