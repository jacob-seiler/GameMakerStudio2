/// @description Setup
event_inherited();

move_speed = 300;
battle_action_decision = 0;
battle_action_summoned = 0;

charged = false;

battle_damage_spiders = 10;
battle_damage_webs = 10;

// Sprites
sprite_direction = 0; // 0 = right, 1 = left
sprite_idle = sprite_enemy_boss_1_idle;
sprite_idle_vulnerable = sprite_enemy_boss_1_vulnerable;
sprite_attack_summon = sprite_enemy_boss_1_attack_summon;
sprite_charge = sprite_enemy_boss_1_charge;
sprite_charge_index = 0;
sprite_charge_speed = 10;
sprite_offset = 0;

event_user(1);