/// @function script_util_save()
/// @description Saves the game

// TODO
var filename = global.name + ".sav";

if (file_exists(filename))
	file_delete(filename);

ini_open(filename);

// System
var section = "System";
// Actions called
// Settings
// Time played

// Game
section = "Game";
// In-game date
// In-game time (morning, afternoon, night)
// Unlocked allies
// Friend stats
// Enemies defeated

// Player
section = "Player";
// Location
// Money
// Battle Stats
// Social Stats
// Equipped Ally

ini_close();