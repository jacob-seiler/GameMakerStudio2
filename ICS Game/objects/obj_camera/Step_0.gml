if (game_is_paused())
	return;

if (array_length_1d(follow) <= 0)
	return;

var camera_speed = 250 * get_delta_time();

if (follow[0] != noone) {
	var follow_x = follow[0].x;
	var follow_y = follow[0].y;
	var follow_zoom_x = 0;
	var follow_zoom_y = 0;
	var zoom_denominator = 64; // TODO better way of getting this number than making it magic
	
	var follow_size = 0;
	
	for (var i = 0; i < array_length_1d(follow); i++) {
		if (!instance_exists(follow[i]))
			follow[i] = noone;
			
		if (follow[i] != noone)
			follow_size ++;
	}
	
	if (follow_size > 1) {
		for (var i = 1; i < array_length_1d(follow); i++) {
			if (follow[i] == noone)
				continue;
			
			follow_x += follow[i].x;
			follow_y += follow[i].y;
		}
		
		follow_x /= follow_size;
		follow_y /= follow_size;
	
		var furthest_point_1 = 0;
		var furthest_point_2 = 1;
		var furthest_point_value_1 = 0;
		var furthest_point_value_2 = 1;
		
		for (var i = 0; i < array_length_1d(follow); i++) {
			if (follow[i] == noone)
				continue;
			
			var distance = distance_to_object(follow[i]);
			if (distance > furthest_point_value_1) {
				furthest_point_value_2 = furthest_point_value_1;
				furthest_point_2 = furthest_point_1;
			
				furthest_point_value_1 = distance;
				furthest_point_1 = i;
			} else if (distance > furthest_point_value_2) {
				furthest_point_value_2 = distance;
				furthest_point_2 = i;
			}
		}
	
		follow_zoom_x = max(zoom_denominator, abs(follow[furthest_point_1].x - follow[furthest_point_2].x) / (zoom_denominator / 8));
		follow_zoom_y = max(zoom_denominator, abs(follow[furthest_point_1].y - follow[furthest_point_2].y) / (zoom_denominator / 8));
	} else {
		follow_zoom_x = sprite_get_width(follow[0].sprite_index);
		follow_zoom_y = sprite_get_height(follow[0].sprite_index);
	}

	zoom_x += ((follow_zoom_x - zoom_x) / camera_speed);
	zoom_y += ((follow_zoom_y - zoom_y) / camera_speed);

	var distance_x = (to_x - x) / camera_speed;
	var distance_y = (to_y - y) / camera_speed;

	if (previous_zoom != zoom) {
		centering_x = true;
		centering_y = true;
	} else {
		if (round(abs(distance_x)) == 0)
			centering_x = false;
		else if (abs(distance_x) > 10) {
			centering_x = true;
			centering_y = true;
		}

		if (round(abs(distance_y)) == 0)
			centering_y = false;
		else if (abs(distance_y) > 10) {
			centering_x = true;
			centering_y = true;
		}
	}
	
	if (centering_x)
		move(distance_x * camera_speed, 1, 0);
	
	if (centering_y)
		move(distance_y * camera_speed, 0, 1);
		
	to_x = follow_x;
	to_y = follow_y;

	zoom = max(zoom_x / zoom_denominator, zoom_y / zoom_denominator);
}

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
var pm = matrix_build_projection_ortho(camera_width * zoom, camera_height * zoom, 1, 10000);

camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);

previous_zoom = zoom;