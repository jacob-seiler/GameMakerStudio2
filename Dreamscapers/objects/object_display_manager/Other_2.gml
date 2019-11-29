/// @description Sets up the dialogue systems

global.dialogue_que = [];
global.dialogue_current = noone;
global.dialogue_response = -1;

enum dialogue_type {
	speech,
	speech_nameless,
	speech_floating,
	speech_floating_nameless,
	thought,
	info,
	system,
	prompt
}

enum text_mode {
	normal,
	waving,
	shaking
}