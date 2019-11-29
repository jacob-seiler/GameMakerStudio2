/// @description Draw

var overworld = (script_room_get_type(room) == room_type.overworld);

var xscale = 1 + (-2 * sprite_direction);
draw_sprite_ext(sprite_player_shadow, 0, x, y, xscale, 1, 0, -1, 0.8);
draw_sprite_ext(sprite_index, image_index, x, y, xscale, 1, 0, -1, 1);

if (charged) {
	var image = floor(sprite_charge_index);
	draw_sprite(sprite_charge, image, x, y); // Draw the charging sprite
}