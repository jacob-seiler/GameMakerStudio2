/// @description Damage the entity

if (other == ignore.id)
	exit;
	
other.battle_hp -= damage;
instance_destroy();