/// @description Damage the entity

if (other == ignore.id)
	exit;

// TODO check if dodging
if ((instance_exists(object_player) && other == object_player.id) || (instance_exists(object_ally) && other == object_ally.id)) {
	if (instance_find(object_player, 0).defending)
		exit;
}

other.battle_hp -= damage;
instance_destroy();