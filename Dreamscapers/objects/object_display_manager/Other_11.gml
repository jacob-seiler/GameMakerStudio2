/// @description Set camera position

var cam_width = global.camera_width * global.camera_zoom;
var cam_height = global.camera_height * global.camera_zoom;

var width = (cam_width / 2);
var height = (cam_height / 2);

var camera_x = clamp(global.camera_x - width, 0, room_width - width * 2);
var camera_y = clamp(global.camera_y - height, 0, room_height - height * 2);

camera_set_view_pos(view_camera[0], camera_x, camera_y);