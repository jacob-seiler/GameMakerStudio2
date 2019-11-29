/// @description Setup

event_inherited();

move_speed = 300;
battle_speed = 3;

attacking = false;
attack_potential = 0;
defending = false;
charged = false;
moved = false;
interact = noone;

// Battle selection variables
redirect = 0;
selected_entity = self;
prompted = false;
battle_action_approached = false;
battle_action_attacked = false;

// Sprites
sprite_direction = 1; // 0 = right, 1 = left
sprite_idle = sprite_player_idle;
sprite_idle_battle = sprite_player_idle_battle;
sprite_move = sprite_player_move;
sprite_move_battle = sprite_player_move_battle;
sprite_defend = sprite_player_defend;
sprite_attack = sprite_player_attack;
sprite_attack_windup = sprite_player_attack_windup;

sprite_charge = sprite_player_charge;
sprite_charge_index = 0;
sprite_charge_speed = 10;