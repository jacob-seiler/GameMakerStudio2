/// @description Insert description here
// You can write your code in this editor

char_width = 25;
padding = 450;
start_x = (display_get_gui_width() / 2) - padding;
start_y = 110;
line_space = 45;
delay = 3;
wave = [];
wave[0] = -100;

dialogue_current_length = 0;
mode = text_mode.normal;