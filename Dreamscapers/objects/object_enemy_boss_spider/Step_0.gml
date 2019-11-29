/// @description Insert description here

// Inherit the parent event
event_inherited();

sprite_charge_index += script_util_delta() * sprite_charge_speed;

if (sprite_charge_index > sprite_get_number(sprite_charge))
	sprite_charge_index = 0;

sprite_offset += script_util_delta();