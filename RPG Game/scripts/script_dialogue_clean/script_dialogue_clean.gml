/// @function script_dialogue_clean()
/// @description Removes all instances of noone from the array.
/// @return The cleaned array.

if (!variable_global_exists("dialogue_que"))
	exit;

var tempArray = [];

for (var i = 0; i < array_length_1d(global.dialogue_que); i++) {
	var inst = global.dialogue_que[i];
	
	if (inst == noone)
		continue;
	
	tempArray[array_length_1d(tempArray)] = inst;
}

return tempArray;