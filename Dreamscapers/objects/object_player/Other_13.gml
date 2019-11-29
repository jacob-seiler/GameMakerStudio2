/// @description Battle - Special Attack Prompt

if (!prompted) {
	script_dialogue_add_message(dialogue_type.prompt, "Do a special attack?", "Yes", "No");
	prompted = true;
}

if (global.dialogue_response == 0) {
	prompted = false;
	redirect = 6;
} else if (global.dialogue_response == 1) {
	prompted = false;
	redirect = 0;
}