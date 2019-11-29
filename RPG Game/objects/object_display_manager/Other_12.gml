/// @description Set camera zoom

var camera_width = global.camera_width * global.camera_zoom;
var camera_height = global.camera_height * global.camera_zoom;

camera_set_view_size(view_camera[0], camera_width, camera_height);
