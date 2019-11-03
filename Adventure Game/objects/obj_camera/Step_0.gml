if (array_length_1d(follow) <= 0) return;

var follow_x = 0;
var follow_y = 0;
var follow_width = 0;
var follow_height = 64;

if (array_length_1d(follow) == 1) {
	follow_x = follow[0].x;
	follow_y = follow[0].y;
	follow_width = sprite_get_width(follow[0].sprite_index);
	follow_height = sprite_get_height(follow[0].sprite_index);
} else {
	follow_x = follow[0].x;
	follow_y = follow[0].y;
	
	for (var i = 1; i < array_length_1d(follow); i++) {
		follow_x = (follow_x + follow[i].x)/2;
		follow_y = (follow_y + follow[i].y)/2;
	}
	
	var furthest_point_1 = 0;
	var furthest_point_2 = 1;
	var furthest_point_value_1 = 0;
	var furthest_point_value_2 = 1;
	
	for (var i = 0; i < array_length_1d(follow); i++) {
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
	
	follow_height = max(64, abs(follow[furthest_point_1].y - follow[furthest_point_2].y) / 8);
	follow_width = max(64, abs(follow[furthest_point_1].x - follow[furthest_point_2].x) / 8);
}

x_follow = follow_x;
y_follow = follow_y;

desired_width = follow_width;
desired_height = follow_height;

var denominator = 10;
width += (desired_width - width) / denominator;
height += (desired_height - height) / denominator;

x += (x_to - x) / denominator;
y += (y_to - y) / denominator;

x_to = x_follow;
y_to = y_follow;

zoom = max(width / 64, height / 64);

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
var pm = matrix_build_projection_ortho(cam_width * zoom, cam_height * zoom, 1, 10000);

camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);