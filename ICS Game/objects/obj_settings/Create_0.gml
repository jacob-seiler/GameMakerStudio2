// Video
largest_width = display_get_width();
largest_height = display_get_height();

var aspect_ratios;
aspect_ratios[0] = 4/3;
aspect_ratios[1] = 16/9;
aspect_ratios[2] = 21/9;
aspect_ratios[3] = 5/4;
aspect_ratios[4] = 3/2;

var currentRatio = largest_width / largest_height; // Check if ratio is valid

if (currentRatio <= 21/9 && currentRatio >= 4/3) {
	var found = false;
	for (var i = 0; i < array_length_1d(aspect_ratios); i++) {
		if (aspect_ratios[i] == currentRatio)
			found = true;
	}

	if (!found) {
		aspect_ratios[array_length_1d(aspect_ratios)] = currentRatio;
	}
}

var temp;
for (var row = 0; row < array_length_1d(aspect_ratios) - 1; row++) {
	for (var col = 0; col < array_length_1d(aspect_ratios) - row - 1; col++) {
		if (aspect_ratios[col] > aspect_ratios[col + 1]) {
			temp = aspect_ratios[col];
			aspect_ratios[col] = aspect_ratios[col + 1];
			aspect_ratios[col + 1] = temp;
		}
	}
}

smallest_width = 800 * aspect_ratios[0];
smallest_height = 800;

// TODO get possible resolutions

// Audio
// Controls
// Gameplay
paused = false;