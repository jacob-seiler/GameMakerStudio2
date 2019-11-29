/// @description Move

if (!selected)
	exit;
	
global.control_listener = self;

#region old
if (script_control_check_pressed(controls.up)) {
	// Move up
	var closest = noone;
	
	for (var i = 0; i < instance_number(object_button); i++) {
		var inst = instance_find(object_button, i);
		
		if (inst == self || inst.y >= y)
			continue;
		
		if (closest == noone || (abs(distance_to_object(inst)) < abs(distance_to_object(closest))))
			closest = inst;
	}
	
	if (closest != noone) {
		target = closest;
		alarm[0] = 1;
		exit;
	}
}

if (script_control_check_pressed(controls.down)) {
	// Move down
	
	var closest = noone;
	
	for (var i = 0; i < instance_number(object_button); i++) {
		var inst = instance_find(object_button, i);
		
		if (inst == self || inst.y <= y)
			continue;
		
		if (closest == noone || (abs(distance_to_object(inst)) < abs(distance_to_object(closest))))
			closest = inst;
	}
	
	if (closest != noone) {
		//closest.selected = true;
		//selected = false;
		target = closest;
		alarm[0] = 1;
		exit;
	}
}

if (script_control_check_pressed(controls.left)) {
	// Move left
	
	var closest = noone;
	
	for (var i = 0; i < instance_number(object_button); i++) {
		var inst = instance_find(object_button, i);
		
		if (inst == self || inst.x >= x)
			continue;
		
		if (closest == noone || (abs(distance_to_object(inst)) < abs(distance_to_object(closest))))
			closest = inst;
	}
	
	if (closest != noone) {
		target = closest;
		alarm[0] = 1;
		exit;
	}
}

if (script_control_check_pressed(controls.right)) {
	// Move right
	
	var closest = noone;
	
	for (var i = 0; i < instance_number(object_button); i++) {
		var inst = instance_find(object_button, i);
		
		if (inst == self || inst.x <= x)
			continue;
		
		if (closest == noone || (abs(distance_to_object(inst)) < abs(distance_to_object(closest))))
			closest = inst;
	}
	
	if (closest != noone) {
		target = closest;
		alarm[0] = 1;
		exit;
	}
}
#endregion
