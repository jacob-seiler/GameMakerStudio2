/// @description Damage

var pos_x = other.x;

if (other.ignore != noone)
	pos_x = other.ignore.x;

if (pos_x > x) {
	fling = -1;
	var inst = instance_find(object_cutscene_manager, 0);
	inst.scene_2 = true;
} else {
	fling = 1;
	var inst = instance_find(object_cutscene_manager, 0);
	inst.scene_2 = true;
}