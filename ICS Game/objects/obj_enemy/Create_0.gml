camera_track(self);

// Movement
move_speed = 325;
idle_dir_x = 0;
idle_dir_y = -1;
previous_x = 0;
previous_y = 0;

target_x = random_range(0, room_width);
target_y = random_range(0, room_height);

// Basic Stats
health_points = 100; // TODO
special_points = 5; // TOOD
passive = true;

// Attack
attack_cooldown = false;
attack_damage = 50;

// Sprites (plus 1 for each direction)
spr_idle = sprite05; // TODO idle
spr_move = sprite011; // TODO move
spr_idle_passive = sprite051; // TODO idle
spr_move_passive = sprite0111; // TODO move
// TODO dash
// TODO bash
spr_attack = sprite031;// TODO attack
// TODO strong attack
// TODO range attack
// TODO aim (charge)
// TODO aim (teleport)
// TODO teleport (probably one for disapearing and one for reappearing)
// TODO special (idk how this will work yet, may not need a sprite)
// TODO parry
// TODO super special ability
// TODO partner special (again, not sure how this will work)