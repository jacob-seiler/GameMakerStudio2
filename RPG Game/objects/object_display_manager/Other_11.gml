/// @description Set camera position

var cam_width = global.camera_width * global.camera_zoom;
var cam_height = global.camera_height * global.camera_zoom;

var camera_x = clamp(global.camera_x - (cam_width / 2), 0, room_width);
var camera_y = clamp(global.camera_y - (cam_height/ 2), 0, room_height);

camera_set_view_pos(view_camera[0], camera_x, camera_y);