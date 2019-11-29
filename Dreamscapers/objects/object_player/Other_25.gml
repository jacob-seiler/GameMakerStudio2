/// @description Battle - end turn

// Reset variables
redirect = 0;
selected_entity = self;
prompted = false;
battle_action_approached = false;
battle_action_attacked = false;
sprite_direction = 1; // 0 = right, 1 = left

script_battle_turn_end();
