/// function script_control_value(key)
/// @description Gets the value of the given key.
/// @param {real} key The key to get the value of.
/// @return The value of the key.

switch (argument[0]) {
	case controls.up:
		return global.control_up;
		break;
	case controls.down:
		return global.control_down;
		break;
	case controls.left:
		return global.control_left;
		break;
	case controls.right:
		return global.control_right;
		break;
	case controls.a:
		return global.control_a;
		break;
	case controls.b:
		return global.control_b;
		break;
	case controls.x:
		return global.control_x;
		break;
	case controls.y:
		return global.control_y;
		break;
	case controls.rb:
		return global.control_rb;
		break;
	case controls.lb:
		return global.control_lb;
		break;
	case controls.start:
		return global.control_start;
		break;
	case controls.select:
		return global.control_select;
		break;
}
