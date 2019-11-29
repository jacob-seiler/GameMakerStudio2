/// @description Sets up the dialogue systems

global.dialogue_que = [];
global.dialogue_current = noone;

enum dialogue_type {
	speech,
	speech_nameless,
	speech_floating,
	speech_floating_nameless,
	thought,
	info,
	system
}

enum text_mode {
	normal,
	waving,
	shaking
}