/// @description Interact event

var type = dialogue_type.speech_floating;
var message = "See, {2THIS{0 is why my evil plans always derail! Because {1you clods always goof off!";
var name = "Dr. Depper";
		
script_dialogue_add_message(type, message, name);
script_dialogue_add_message(type, "POOP. " + message, name);