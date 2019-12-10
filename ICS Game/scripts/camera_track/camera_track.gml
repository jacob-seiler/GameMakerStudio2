/// @arg obj_follow

with (obj_camera) {
	if (follow[0] == noone)
		follow[0] = argument[0];
	else
		follow[array_length_1d(follow)] = argument[0];
}