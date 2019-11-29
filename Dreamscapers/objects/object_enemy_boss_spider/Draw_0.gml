/// @description Draw

var sprite = real(sprite_index);

var xscale = 1 - (2 * sprite_direction);

// Calculate offset
var offset_x = 0;
var offset_y = 0;

if (instance_exists(object_enemy_leg)) {
	var a = 10;
	var k = pi;

	offset_x = 0;
	offset_y = a * cos(k * (sprite_offset));
} else {
	if (sprite_index != sprite_idle_vulnerable) {
		var shake = 1;
	
		offset_x = random_range(shake, -shake);
		offset_y = random_range(shake, -shake);
	}
}

draw_sprite_ext(sprite, image_index, x + offset_x, y + offset_y, xscale, 1, 0, -1, 1);

if (charged) {
	var image = floor(sprite_charge_index);
	draw_sprite(sprite_charge, image, x, y);
}