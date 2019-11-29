/// @description Interact Event

// TODO prompt SAVE?

var type = dialogue_type.system;
var message = "Save?";
		
script_dialogue_add_message(type, message);

// TODO save
script_util_save();