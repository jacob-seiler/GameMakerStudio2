/// @description Insert description here
// You can write your code in this editor

state = STATE_CAMERA.MOVE_TO_FOLLOW_OBJECT

target = object_character_dummy
target_x = 0
target_y = 0

view_width = camera_get_view_width(view_camera[0])
view_height = camera_get_view_height(view_camera[0])

enum STATE_CAMERA {
	FOLLOW_OBJECT,
	FOLLOW_MOUSE_PEAK,
	MOVE_TO_TARGET,
	MOVE_TO_FOLLOW_OBJECT
}