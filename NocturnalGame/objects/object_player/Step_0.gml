/// @description Movement

var delta = script_util_delta();

// Get input
var input_left = keyboard_check(ord("A"));
var input_right = keyboard_check(ord("D"));
var input_up = keyboard_check(ord("W"));
var input_down = keyboard_check(ord("S"));

var input_agility = mouse_check_button(mb_right); // Face button left
var input_agility_releassed = mouse_check_button_released(mb_right); // Face button left

#region Movement
if (agility <= 0) {
	speed_y = (input_down - input_up) * (move_speed * delta);
	speed_x = (input_right - input_left) * (move_speed * delta);
}
#endregion
#region Defend / Agility
if (input_agility)
	agility += script_util_delta();

if (input_agility_releassed || agility > stamina)
	agility = 0;

if (agility > 0) {
	var idle = (speed_x == 0 && speed_y == 0);
	
	// TODO if second press
		if (idle) {
			// TODO counter
		} else {
			// TODO roll
		}
	
	if (idle) {
		// TODO defend
	} else {
		// TODO sprint / leap
	}
} else {
	// TODO if sprinting
		// if only a little, become leap
		// else, stop sprinting
}
#endregion

// Move
script_move(speed_x, speed_y);

/* TODO:
- LS: Move
- RS: Aim / Direction
- D-Pad: Switch character
- Cross: Confirm / Interact (talk, pickup, yes, continue)
- Circle: Block / Agility (block, parry, leap, sprint, roll, dive)
- Square: Item
- Triangle: Special
- R1: Attack
- L1: Lock-on
*/

// TODO: Sprites
#region Sprites
	if (speed_x == 0 && speed_y == 0) {
		if (sprite_index != sprite_player_idle)
			sprite_index = sprite_player_idle;
	} else {
		if (sprite_index != sprite_player_move)
			sprite_index = sprite_player_move;
	}
#endregion