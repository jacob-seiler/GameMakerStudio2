/// @description Move

if (!selected)
	exit;
	
global.control_listener = self;

// Move up
if (script_control_check_pressed(controls.up)) {
	var closest = noone;
	
	for (var i = instance_number(object_button) - 1; i >= 0; i--) {
		var inst = instance_find(object_button, i);
		
		if (inst.y >= y)
			continue;
		
		if (closest == noone || (abs(x - closest.x) > abs(x - inst.x)))
			closest = inst;
	}
	
	if (closest != noone) {
		target = closest;
		alarm[0] = 1;
		exit;
	}
}

// Move down
if (script_control_check_pressed(controls.down)) {
	var closest = noone;
	
	for (var i = 0; i < instance_number(object_button); i++) {
		var inst = instance_find(object_button, i);
		
		if (inst.y <= y)
			continue;
		
		if (closest == noone || (abs(x - closest.x) > abs(x - inst.x)))
			closest = inst;
	}
	
	if (closest != noone) {
		target = closest;
		alarm[0] = 1;
		exit;
	}
}

// Move right
if (script_control_check_pressed(controls.right)) {
	var closest = noone;
	
	for (var i = 0; i < instance_number(object_button); i++) {
		var inst = instance_find(object_button, i);
		
		if (inst.x <= x)
			continue;
		
		if (closest == noone || (abs(y - closest.y) > abs(y - inst.y)))
			closest = inst;
	}
	
	if (closest != noone) {
		target = closest;
		alarm[0] = 1;
		exit;
	}
}

// Move left
if (script_control_check_pressed(controls.left)) {
	var closest = noone;
	
	for (var i = instance_number(object_button) - 1; i >= 0; i--) {
		var inst = instance_find(object_button, i);
		
		if (inst.x >= x)
			continue;
		
		if (closest == noone || (abs(y - closest.y) > abs(y - inst.y)))
			closest = inst;
	}
	
	if (closest != noone) {
		target = closest;
		alarm[0] = 1;
		exit;
	}
}