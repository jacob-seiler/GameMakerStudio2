/// @description Insert description here
// You can write your code in this editor

// Cell size
var cell_width = 32
var cell_height = 32

// Cells in room
var hc = room_width div cell_width
var vc = room_height div cell_height

// Create grid
global.grid = mp_grid_create(0, 0, hc, vc, cell_width, cell_height)

// Add the walls
mp_grid_add_instances(global.grid, obj_wall, false)