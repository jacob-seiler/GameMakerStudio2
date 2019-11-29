/// @description Set idle sprite

if (instance_exists(object_enemy_leg)) {
	if (sprite_index != sprite_idle)
		sprite_index = sprite_idle;
} else {
	if (sprite_index != sprite_idle_vulnerable)
		sprite_index = sprite_idle_vulnerable;
}
