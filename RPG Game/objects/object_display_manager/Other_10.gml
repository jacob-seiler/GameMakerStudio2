/// @description Set up camera & view

// Views
view_enabled = true; // Enable view
view_visible[0] = true; // Make view 0 visible

view_wport[0] = global.visual_width;
view_hport[0] = global.visual_height;

// Camera properties
var aspect_ratio = global.visual_width / global.visual_height;
global.camera_width = 1200;
global.camera_height = global.camera_width / aspect_ratio;
global.camera_zoom = 1;

surface_resize(application_surface, view_wport[0], view_hport[0]); // Resize application surface

//Camera creation
view_camera[0] = camera_create_view(0, 0, global.camera_width, global.camera_height, 0, -1, -1, -1, global.camera_width / 2, global.camera_height / 2);

//Basic set up
var camera_width = camera_get_view_width(view_camera[0]);
var camera_height = camera_get_view_height(view_camera[0]);

global.camera_x = -1 * camera_width / 2;
global.camera_y = -1 * camera_height / 2;

event_user(2);
event_user(1);

display_set_gui_size(camera_width, camera_height);