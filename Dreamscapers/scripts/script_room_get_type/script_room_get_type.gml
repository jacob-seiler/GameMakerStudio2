/// @function script_room_get_type()
/// @description Gets the room type.
/// @param {real} room The room to get the type of.
/// @return The room type.

var name = room_get_name(argument[0]);

if (string_replace(name, "room_battle", "") != name)
	return room_type.battle;
else if (string_replace(name, "room_dream", "") != name)
	return room_type.dream;
else if (string_replace(name, "room_overworld", "") != name)
	return room_type.overworld;
else
	return room_type.other;