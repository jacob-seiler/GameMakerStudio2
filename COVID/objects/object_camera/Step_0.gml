/// @description Insert description here
// You can write your code in this editor

var camera_x = camera_get_view_x(view_camera[0])
var camera_y = camera_get_view_y(view_camera[0])

if (instance_exists(target)) {
	target_x = target.x
	target_y = target.y
}

switch (state) {
	case STATE_CAMERA.FOLLOW_OBJECT:
		camera_x = target_x - (view_width / 2)
		camera_y = target_y - (view_height / 2)
		break
	
	case STATE_CAMERA.FOLLOW_MOUSE_PEAK:
		camera_x = lerp(target_x, mouse_x, 0.2) - (view_width / 2)
		camera_y = lerp(target_y, mouse_y, 0.2) - (view_height / 2)
		break
	
	case STATE_CAMERA.MOVE_TO_TARGET:
		camera_x = lerp(camera_x, target_x - (view_width / 2), 0.1)
		camera_y = lerp(camera_y, target_y - (view_height / 2), 0.1)
		break
	
	case STATE_CAMERA.MOVE_TO_FOLLOW_OBJECT:
		camera_x = lerp(camera_x, target_x - (view_width / 2), 0.1)
		camera_y = lerp(camera_y, target_y - (view_height / 2), 0.1)
		
		if (point_distance(camera_x, camera_y, target_x - (view_width / 2), target_y - (view_height / 2)) < 1) {
			state = STATE_CAMERA.FOLLOW_OBJECT
		}
		
		break
}

// Bound to room dimensions
camera_x = clamp(camera_x, 0, room_width - view_width)
camera_y = clamp(camera_y, 0, room_height - view_height)

camera_set_view_pos(view_camera[0], camera_x, camera_y)