/// @description Calculate vectors

// Calculate the distance
var distance_x = abs(x - target_x);
var distance_y = abs(y - target_y);

// Convert to percentage
var distance_max = max(distance_x, distance_y);
speed_x = distance_x / distance_max;
speed_y = distance_y / distance_max;