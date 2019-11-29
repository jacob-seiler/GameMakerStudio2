/// @function script_room_is_child()
/// @description Checks if a room is a child or not.
/// @param {real} room The room to check.
/// @return True if the room is a child, false if not.

var name = room_get_name(argument[0]);

if (string_replace(name, "room_battle_", "") != name)
	return true;
else if (string_replace(name, "room_dream_", "") != name)
	return true;
else if (string_replace(name, "room_overworld_", "") != name)
	return true;

return false;