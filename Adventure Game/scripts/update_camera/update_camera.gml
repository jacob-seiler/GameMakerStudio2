//@arg viewport_width
//@arg viewport_aspect_ratio

with (obj_camera) {
	/* VIEWPORT CODE */
	view_enabled = true; //Enable the use of views

	view_set_visible(0, true); //Make view 0 visible

	//Set the port bounds of view 0
	var vAspectRatio = argument[1];
	var vWidth = argument[0];
	var vHeight = vWidth / vAspectRatio;

	view_set_wport(0, vWidth);
	view_set_hport(0, vHeight);

	//Resize and center
	window_set_rectangle((display_get_width() - view_wport[0]) * 0.5, (display_get_height() - view_hport[0]) * 0.5, view_wport[0], view_hport[0]);
	surface_resize(application_surface,view_wport[0], view_hport[0]);

	cam_width = view_get_wport(0);
	cam_height = view_get_hport(0);
}