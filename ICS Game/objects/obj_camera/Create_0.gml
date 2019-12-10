follow[0] = noone;

if (follow[0] != noone) {
	x = follow[0].x;
	y = follow[0].y;
}

zoom = 1; // TODO default zoom

camera = camera_create();

var aspect_ratio = display_get_width() / display_get_height();
camera_width = 1366;
camera_height = (1366) / aspect_ratio;

camera_update(1024, aspect_ratio, camera, zoom, camera_width, camera_height);

previous_zoom = zoom;
to_x = x;
to_y = y;
zoom_x = 0;
zoom_y = 0;