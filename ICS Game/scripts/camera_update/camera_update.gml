/// @arg viewport_width
/// @arg viewport_aspect_ratio
/// @arg camera
/// @arg zoom
/// @arg camera_width
/// @arg camera_height

var viewport_aspect_ratio = argument[1];
var viewport_width = argument[0];
var viewport_height = viewport_width / viewport_aspect_ratio;
var cam = argument[2];
var camera_zoom = argument[3];
var camera_width = argument[4];
var camera_height = argument[5];

with (obj_camera) {
	view_enabled = true; //Enable the use of views

	view_set_visible(0, true); //Make view 0 visible
	
	view_set_wport(0, viewport_width);
	view_set_hport(0, viewport_height);
	
	var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
	var pm = matrix_build_projection_ortho(camera_width * camera_zoom, camera_height * camera_zoom, 1, 10000);

	camera_set_view_mat(cam, vm);
	camera_set_proj_mat(cam, pm);

	view_camera[0] = cam;

	//Resize and center
	surface_resize(application_surface, viewport_width, viewport_height);
	window_set_rectangle((display_get_width() - viewport_width) * 0.5, (display_get_height() - viewport_height) * 0.5, viewport_width, viewport_height);
	display_set_gui_size(viewport_width, viewport_height);
}