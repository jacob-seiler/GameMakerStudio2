/// @description Player input

var overworld = (script_room_get_type(room) == room_type.overworld);
var battle = (script_room_get_type(room) == room_type.battle);

if (defending)
	attacking = false;

if (!defending) {
	var speed_x = 0;
	var speed_y = 0;
	
	if (!attacking && !battle) {
		#region Move
		speed_x = script_control_check(controls.right) - script_control_check(controls.left);
		speed_y = script_control_check(controls.down) - script_control_check(controls.up);
		
		var analogue_x = script_control_check_analogue(true, false);
		var analogue_y = script_control_check_analogue(true, true);
		
		if (abs(speed_x) < abs(analogue_x))
			speed_x = analogue_x;
			
		if (abs(speed_y) < abs(analogue_y))
			speed_y = analogue_y;
		#endregion
	}
	
	if (!overworld) {
		if (script_control_check_pressed(controls.b)) {
			defending = true;
			
			if (!battle) {
				speed_x *= 50;
				speed_y *= 50;
			}
		} else {
			var force = false;
			
			if (script_control_check_pressed(controls.x)) {
				attacking = true;
			}
			
			if (script_control_check(controls.x) && attacking) {
				attack_potential += (battle_damage * 2/3) * script_util_delta(); // 1.5 Seconds
				
				if (attack_potential > battle_damage) {
					attack_potential = battle_damage * 0.2; // 20%
					force = true;
				}
			}
			
			if (force || (script_control_check_released(controls.x) && attacking)) {
				var inst = instance_create_depth(x - ((sprite_get_width(sprite_index) / 2) * ((sprite_direction * 2) - 1)), y, -y, object_attack);
				with (inst) {
					ignore = other;
					damage = other.battle_damage;
					alarm[0] = 1;
				}
				
				attack_potential = 0;
			}
		}
	}
	
	if (speed_x != 0 || speed_y != 0)
		script_entity_move(move_speed * speed_x, move_speed * speed_y, true, true);
}

// TODO CHECK IF THEY ARE PERFORMING A BATTLE ATTACK OR ACTION OR SOMETHING
