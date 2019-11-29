/// function script_control_value_gamepad(key)
/// @description Gets the value of the given key for the gamepad.
/// @param {real} key The key to get the value of.
/// @return The value of the key.

if (gamepad_is_connected(0))
	gamepad_set_axis_deadzone(0, global.control_deadzone);

switch (argument[0]) {
	case controls.up:
		return global.control_gp_up;
		break;
	case controls.down:
		return global.control_gp_down;
		break;
	case controls.left:
		return global.control_gp_left;
		break;
	case controls.right:
		return global.control_gp_right;
		break;
	case controls.a:
		return global.control_gp_a;
		break;
	case controls.b:
		return global.control_gp_b;
		break;
	case controls.x:
		return global.control_gp_x;
		break;
	case controls.y:
		return global.control_gp_y;
		break;
	case controls.rb:
		return global.control_gp_rb;
		break;
	case controls.lb:
		return global.control_gp_lb;
		break;
	case controls.start:
		return global.control_gp_start;
		break;
	case controls.select:
		return global.control_gp_select;
		break;
}
