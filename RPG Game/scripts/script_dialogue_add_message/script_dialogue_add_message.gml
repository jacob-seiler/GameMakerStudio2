/// @function script_dialogue_add_message(type, message, name, origin_x, origin_y)
/// @description Adds a dialogue box to be displayed.
/// @param {real} type The type of dialogue box.
/// @param {real} message The message.
/// @param {real} name The name of the dialogue box.
/// @param {real} origin_x The location on the x-axis to point the dialogue box towards.
/// @param {real} origin_y The location on the y-axis to point the dialogue box towards.

var inst = instance_create_depth(0, 0, 0, object_dialogue);

switch (argument[0]) {
	case dialogue_type.speech:
		// Speech (type, message, name, origin_x, origin_y)
		var i = 2;
		
		with (inst) {
			type = argument[0];
			message = argument[1];
			name = argument[i];
			origin_x = argument[i + 1];
			origin_y = argument[i + 2];
		}
		break;
	case dialogue_type.speech_nameless:
		// Speech nameless (type, message, origin_x, origin_y)
		var i = 2;
	
		with (inst) {
			type = argument[0];
			message = argument[1];
			origin_x = argument[i];
			origin_y = argument[i + 1];
		}
		break;
	case dialogue_type.speech_floating:
		// Speech floating (type, message, name)
		var i = 2;
		with (inst) {
			type = argument[0];
			message = argument[1];
			name = argument[i];
		}
		break;
	case dialogue_type.speech_floating_nameless:
		// Speech floating nameless (type, message)
		with (inst) {
			type = argument[0];
			message = argument[1];
		}
		break;
	case dialogue_type.thought:
		// Thought (type, message)
		with (inst) {
			type = argument[0];
			message = argument[1];
		}
		break;
	
	case dialogue_type.info:
		// Info (type, message)
		with (inst) {
			type = argument[0];
			message = argument[1];
		}
		break;
	
	default:
		// System (type, message)
		with (inst) {
			type = argument[0];
			message = argument[1];
		}
		break;
}

// Add the instance to the dialogue array
global.dialogue_que[array_length_1d(global.dialogue_que)] = inst;