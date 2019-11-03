/* VIEWPORT CODE */
var aspectRatio = display_get_width() / display_get_height();
update_camera(1024, aspectRatio);

/* CAMERA CODE */
follow[0] = obj_player_1;
follow[1] = obj_player_1; // TODO decide what to follow

if (follow[0] != noone) {
	x = follow[0].x;
	y = follow[0].y;
}

zoom = 1;

camera = camera_create();

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
var pm = matrix_build_projection_ortho(cam_width * zoom, cam_height * zoom, 1, 10000);

camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);

view_camera[0] = camera;

x_to = x;
y_to = y;

desired_width = 0;
desired_height = 0;

width = 0;
height = 0;