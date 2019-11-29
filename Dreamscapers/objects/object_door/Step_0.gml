/// @description Move

if (!opened)
	script_util_set_animation(sprite_door_closed);
else {
	script_util_set_animation(sprite_door_open);
}

if (fling != 0) {
	x += (move_speed * script_util_delta()) * fling;
	if (x > room_width)
		instance_destroy();
}
