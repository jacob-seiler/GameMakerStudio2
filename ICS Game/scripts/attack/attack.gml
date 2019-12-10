/// @arg dir_x
/// @arg dir_y
/// @arg damage
/// @arg obj_attack
/// @arg reset_attack_charge

// TODO args
//@arg knockback
//@arg sprite

if (attack_cooldown)
	return;

// Attack
	// Animation
	// Hitbox for enemies (take damage if they are in it)
	// Can't move / Knockback maybe or something?
	// Check if attack is a parry

if (argument[4])
	attack_charge = 0;

sprite_index = spr_attack;
// TODO Set animation to attack
// TODO They can't move (except maybe the attack moves them forwards a bit or something)

var attack_x = x + (self.sprite_width * argument[0]);
var attack_y = y + (self.sprite_height * argument[1]);

var time = 750 * get_delta_time();

var inst = instance_create_depth(attack_x, attack_y, self.depth, argument[3]);
with (inst) {
	damage = argument[2];
	dir_x = argument[0];
	dir_y = argument[1];
	
	alarm[0] = time;
}

// TOOD when animation is finished
	// TODO charge stuff

attack_cooldown = true;
alarm[0] = time;
