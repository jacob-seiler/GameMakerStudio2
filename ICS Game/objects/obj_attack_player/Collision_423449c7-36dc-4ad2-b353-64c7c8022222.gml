for (var i = 0; i < array_length_1d(alreadyHit); i++) {
	if (alreadyHit[i] == other.object_index)
		return;
}

other.health_points -= damage;
alreadyHit[array_length_1d(alreadyHit)] = other.object_index;

if (other.health_points <= 0)
	with (other)
		instance_destroy();

show_debug_message("damaged them! HP: " + string(other.health_points));