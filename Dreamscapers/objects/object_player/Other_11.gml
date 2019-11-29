/// @description Battle - charge

if (!prompted) {
	script_dialogue_add_message(dialogue_type.prompt, "Are you sure you want to charge?", "Yes", "No");
	prompted = true;
}

if (global.dialogue_response == 0) {
	charged = true;
	event_user(15);
} else if (global.dialogue_response == 1) {
	prompted = false;
	redirect = 0;
}