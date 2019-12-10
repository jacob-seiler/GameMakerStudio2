/// @description Collision

var pos_x = x;
var pos_y = y;

var amount_x = x - xprevious;
var amount_y = y - yprevious;

if (amount_x == 0 && amount_y == 0) {
	show_debug_message("crushed");
	exit;
}

x = xprevious;
y = yprevious;

x += amount_x;

if (amount_x != 0 && place_meeting(x, y, other)) {
	while (place_meeting(x, y, other)) {
		other.x += sign(amount_x);
	}
}

y += amount_y;

if (amount_y != 0 && place_meeting(x, y, other)) {
	while (place_meeting(x, y, other)) {
		other.y += sign(amount_y);
	}
}