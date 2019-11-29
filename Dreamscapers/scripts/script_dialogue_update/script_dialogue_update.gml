/// @function script_dialogue_update()
/// @description Updates the dialogue que.

global.dialogue_que = script_dialogue_clean();
global.dialogue_current = noone;
	
if (array_length_1d(global.dialogue_que) > 0)
	global.dialogue_current = global.dialogue_que[0];