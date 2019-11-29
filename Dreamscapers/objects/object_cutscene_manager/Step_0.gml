/// @description Scenes

if (!variable_global_exists("do_it")) {
	global.do_it = false;
}

if (global.do_it) {
	object_player.x = global.prev_player_pos_x;
	object_player.y = global.prev_player_pos_y;
			
	instance_destroy(instance_find(object_enemy, 0));
	
	ran_scene_0 = true;
	scene_1 = true;
	ran_scene_1 = true;
	scene_2 = true;
	ran_scene_2 = true;
	global.do_it = false;
}

// Triggers
if (instance_exists(object_player) &&  object_player.x > 515)
	scene_1 = true;

if (!instance_exists(object_enemy))
	scene_3 = true;

if (instance_exists(object_player) &&  object_player.x > 1580)
	scene_4 = true;

if (instance_exists(object_player) &&  object_player.x > 1750 &&  object_player.x > 405)
	scene_5 = true;

if (scene_0 && !ran_scene_0) {
	// Scene 0 - Bootup
	script_dialogue_add_message(dialogue_type.speech_floating_nameless, "Alright, we should be online and ready to go now.");
	script_dialogue_add_message(dialogue_type.speech_floating_nameless, "Hello? You should be able to hear me.");
	script_dialogue_add_message(dialogue_type.speech_floating_nameless, "Try moving around.");
	script_dialogue_add_message(dialogue_type.system, "Move using the arrow keys.");
	
	ran_scene_0 = true;
}

if (scene_1 && !ran_scene_1) {
	// Scene 1 - Punch
	script_dialogue_add_message(dialogue_type.speech_floating_nameless, "No way! It's working!");
	script_dialogue_add_message(dialogue_type.speech_floating_nameless, "Alright, now let's get started.");
	script_dialogue_add_message(dialogue_type.speech_floating_nameless, "There should be a door up ahead.");
	script_dialogue_add_message(dialogue_type.speech_floating_nameless, "To open it... let's see...");
	script_dialogue_add_message(dialogue_type.speech_floating_nameless, "Try pressing A in front of it.");
	script_dialogue_add_message(dialogue_type.speech_floating_nameless, "I mean, {1What could possibly go wrong?");
	
	ran_scene_1 = true;
}

if (scene_2 && !ran_scene_2) {
	// Scene 2 - Alarm / Enemy
	// TODO alarm
	script_dialogue_add_message(dialogue_type.speech_floating_nameless, "Oops. I mean't Z...");
	script_dialogue_add_message(dialogue_type.speech_floating_nameless, "Z is for interacting, A is for attacking.");
	script_dialogue_add_message(dialogue_type.speech_floating_nameless, "You better get out of there. The alarms have been activated.");
	script_dialogue_add_message(dialogue_type.speech_floating_nameless, "If you don't hurry-");
	
	script_dialogue_add_message(dialogue_type.speech_floating_nameless, "{2HEY!");
	// Camera move
	script_dialogue_add_message(dialogue_type.speech_floating_nameless, "{2STOP RIGHT THERE!");
	script_dialogue_add_message(dialogue_type.speech_floating_nameless, ".");
	// Enter battle
	
	ran_scene_2 = true;
}

if (scene_3 && !ran_scene_3) {
	// Scene 3 - Recap
	script_dialogue_add_message(dialogue_type.speech_floating_nameless, "Ok. That was close.");
	script_dialogue_add_message(dialogue_type.speech_floating_nameless, "I think the coast is clear now.");
	script_dialogue_add_message(dialogue_type.speech_floating_nameless, "Don't forget. Z is to open the doors...");
	script_dialogue_add_message(dialogue_type.speech_floating_nameless, "... not A ...");
	
	ran_scene_3 = true;
}

if (scene_4 && !ran_scene_4) {
	// Scene 4 - Water
	script_dialogue_add_message(dialogue_type.speech_floating_nameless, "{2There he is!");
	script_dialogue_add_message(dialogue_type.speech_floating_nameless, "Ah! Don't worry " + string(global.name) + ". I got this!");
	script_dialogue_add_message(dialogue_type.speech_floating_nameless, "*typing*");
	script_dialogue_add_message(dialogue_type.speech_floating_nameless, "{2Let's get him!");
	script_dialogue_add_message(dialogue_type.speech_floating_nameless, "*WATER PRESSURE SET TO 5000psi*");
	script_dialogue_add_message(dialogue_type.speech_floating_nameless, "{2Uh oh.");
	// Water
	script_dialogue_add_message(dialogue_type.speech_floating_nameless, "Ok. Keep moving.");
	
	ran_scene_4 = true;
}

if (scene_5 && !ran_scene_5) {
	// Scene 5 - Dodging
	script_dialogue_add_message(dialogue_type.speech_floating_nameless, "Huh... Oops.");
	script_dialogue_add_message(dialogue_type.speech_floating_nameless, "I kinda blocked your path.");
	script_dialogue_add_message(dialogue_type.speech_floating_nameless, "Let me just...");
	script_dialogue_add_message(dialogue_type.speech_floating_nameless, "*ACESS DENIED*");
	script_dialogue_add_message(dialogue_type.speech_floating_nameless, "What? C'mon. Really?");
	script_dialogue_add_message(dialogue_type.speech_floating_nameless, "*ACESS DENIED*");
	script_dialogue_add_message(dialogue_type.speech_floating_nameless, "Sorry " + string(global.name) + ". Looks like you're gonna have to get over it on your own.");
	script_dialogue_add_message(dialogue_type.speech_floating_nameless, "But fret not. That should be easy! Just do your dash.");
	script_dialogue_add_message(dialogue_type.speech_floating_nameless, "Umm... Let's see...");
	script_dialogue_add_message(dialogue_type.speech_floating_nameless, "Press X while moving...");
	script_dialogue_add_message(dialogue_type.speech_floating_nameless, "Sounds simple enough.");
	script_dialogue_add_message(dialogue_type.speech_floating_nameless, "And this time, I'm sure.");
	script_dialogue_add_message(dialogue_type.system, "Press X while moving to do a dash.");
	
	ran_scene_5 = true;
}
