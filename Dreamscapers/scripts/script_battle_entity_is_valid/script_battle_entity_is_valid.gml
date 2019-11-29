/// @function script_battle_entity_is_valid()
/// @description Checks if the given entity is valid.
/// @param {real} entity the entity to check.
/// @return True if the entity is valid.

var entity = argument[0];

// Check valid
if (entity == noone)
	return false;

// Check exists
if (!instance_exists(entity))
	return false;

// Check parent
var parent = object_get_parent(entity).id;
if (parent != object_entity.id && parent != object_enemy.id && parent != object_ally.id)
	return false;

// Check health
if (entity.battle_hp <= 0)
	return false;

return true;