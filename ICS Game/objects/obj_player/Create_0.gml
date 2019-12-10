camera_track(self);

controller = obj_controller_1;

// Basic Stats
health_points = 100; // TODO
special_points = 5; // TOOD
move_speed = 325;
idle_dir_x = 0;
idle_dir_y = -1;

// Agility
dodge_roll_distance = 0;
dodge_roll_dir_x = 0;
dodge_roll_dir_y = 0;

// Attack
attack_cooldown = false;
attack_charge = 0;
attack_charge_min = 30; // TODO find the correct value for this
attack_charge_max = 90; // TODO find the correct value for this

// Sprites (plus 1 for each direction)
spr_idle = sprite0; // TODO idle
spr_move = sprite01; // TODO move
spr_dodge_roll = sprite02; // TODO dodge roll
// TODO dash
// TODO bash
spr_attack = sprite03;// TODO attack
spr_charge = sprite04; // TODO charge
// TODO strong attack
// TODO range attack
// TODO aim (charge)
// TODO aim (teleport)
// TODO teleport (probably one for disapearing and one for reappearing)
// TODO special (idk how this will work yet, may not need a sprite)
// TODO parry
// TODO super special ability
// TODO partner special (again, not sure how this will work)