/// @description Draw

draw_self();

if (!instance_exists(selected_entity))
	selected_entity = noone;

if (selected_entity != noone) {
	var pos_x = selected_entity.x;
	var pos_y = selected_entity.y;
	
	// Bob up and down
	selected_offset += script_util_delta();
	
	var scale = 0.2; // 1/5
	var a = 20;
	var k = 4;
	var c = selected_entity.sprite_height + 30;
	var offset_y = a * sin(k * (selected_offset)) - c;
	
	// Draw arrow
	draw_sprite_ext(sprite_arrow, 0, pos_x, pos_y + offset_y, scale, scale, 0, -1, 1);
}

if (charged) {
	draw_sprite(sprite_charge, 0, x, y); // Draw the charging shield thing
}