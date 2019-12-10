var dir_x = controller.right - controller.left;
var dir_y = controller.down - controller.up;

if (dir_x != 0 || dir_y != 0) {
	idle_dir_x = dir_x;
	idle_dir_y = dir_y;
}

if (dodge_roll_distance > 0) {
	sprite_index = spr_dodge_roll;
	
	var x_initial = x;
	var y_initial = y;
	
	move(move_speed, dodge_roll_dir_x, dodge_roll_dir_y);
	
	var x_diff = abs(x_initial - x);
	var y_diff = abs(y_initial - y);
	
	dodge_roll_distance -= max(x_diff, y_diff);
	
	if (dodge_roll_distance < 0)
		dodge_roll_distance = 0;
} else {
	var actual_speed = move_speed;
	
	if (attack_cooldown)
		actual_speed = 0;
	else if (attack_charge > 0) {
		actual_speed /= 3;
		sprite_index = spr_charge;
	} else if ((dir_x != 0 || dir_y != 0) && actual_speed > 0)
		sprite_index = spr_move;
	else
		sprite_index = spr_idle;
	
	move(actual_speed, dir_x, dir_y);
}

/*
{DONE} L = Move
{DONE} Move + A = Dodge Roll
{DONE} Dodge Roll + A = Dash
{DONE} Dodge Roll + X = Bash
{DONE} X = Attack
{DONE} Attack + Hold X = Charge
{DONE} Charge + Release X = Strong Attack
{DONE} Charge + A = Range Attack (Shoots beam like Zelda 1)
{DONE} Charge + L = Aim Charge
Hold B = Aim Teleport
Release B = Teleport
Aim Teleport + L1/R1 = Cycle target
Y = Special
Hold L1 = Select Character (Wheel)
Hold R1 = Select Item (Wheel)
--------------------------
Enemy Attack + Attack = Parry
Enemy Attack + Dodge Roll = Perfect Dodge (Wind Waker {A})
Character Special + Special = Partner Special (Chrono Trigger)
Dash = Lose some SP
Bash = Lose some SP
Range Attack = Lose Some SP
Teleport = Lose lots of SP
Special = Lose all SP + Special Ability
Special + Full SP = Lose all SP + Super Special Ability
Attack = Gain SP
*/

if (controller.button_1_pressed && !attack_cooldown) {
	// TODO check if they have enough SP for whatever ability they are doing
	
	if (attack_charge > 0) {
		if (attack_charge > attack_charge_min) {
			// TODO range attack (using value of attack_charge, clamp attack_charge_max)
			var attack_power = clamp(attack_charge, attack_charge_min, attack_charge_max);
			show_debug_message("Range Attack");
			attack(idle_dir_x, idle_dir_y, attack_power, obj_attack_range_player, true);
			attack_charge = 0;
		}
	} else {
		if (dodge_roll_distance != 0) {
				move(dodge_roll_distance * (2/5) / get_delta_time(), dodge_roll_dir_x, dodge_roll_dir_y);
				dodge_roll_distance = 0;
		} else {
				if (1 != 1) {
					// TODO if enemy is about to attack
					// TODO perfect dodge
				} else {
					if (dir_x != 0 || dir_y != 0) {
						dodge_roll_distance = 585;
						dodge_roll_dir_x = dir_x;
						dodge_roll_dir_y = dir_y;
					}	
				}
		}
	}
	
	// TODO lose some SP
}

if (controller.button_3) {
	if (attack_charge > 0) {
		attack_charge += 50 * get_delta_time();
		// TODO aim using L
	}
	
	/*
		Enemy Attack + Attack = Parry
		Bash = Lose some SP
		Range Attack = Lose Some SP
		Attack = Gain SP
	*/
	
	if (controller.button_3_pressed) {
		if (dodge_roll_distance != 0) {
			move(dodge_roll_distance * (2/5) / get_delta_time(), dodge_roll_dir_x, dodge_roll_dir_y);
			dodge_roll_distance = 0;
			
			show_debug_message("Bash Attack");
			// TODO run attack method: bash attack
			var attack_power = clamp(attack_charge, attack_charge_min, attack_charge_max);
			attack(dodge_roll_dir_x, dodge_roll_dir_y, attack_power, obj_attack_player, true);
		} else {
			show_debug_message("Attack");
			var attack_power = clamp(attack_charge, attack_charge_min, attack_charge_max);
			attack(idle_dir_x, idle_dir_y, attack_power, obj_attack_player, true);
			attack_charge = 1;
		}
	}
}

if (controller.button_3_released) {
	if (attack_charge > attack_charge_min) {
		var attack_power = min(attack_charge, attack_charge_max);
		show_debug_message("Strong Attack");
		// TODO  run attack method: strong attack
		attack(idle_dir_x, idle_dir_y, attack_power, obj_attack_strong_player, true);
	}
	
	attack_charge = 0;
}
