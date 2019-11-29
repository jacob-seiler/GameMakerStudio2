/// @function script_battle_entity_is_valid()
/// @description Checks if the given entity is valid.
/// @param {real} entity the entity to check.
/// @return True if the entity is valid.

var entity = argument[0];

if (entity == noone)
	return false;

if (!instance_exists(entity))
	return false;
	
if (entity.battle_hp <= 0)
	return false;

return true;