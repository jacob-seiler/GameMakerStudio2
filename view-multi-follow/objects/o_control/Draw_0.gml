// trick for a "Draw GUI" esque event in pre-Studio:
d3d_set_projection_ortho(0, 0, __view_get( e__VW.WPort, 0 ), __view_get( e__VW.HPort, 0 ), 0)
//
draw_set_color(c_white)
draw_text(4, 4, string_hash_to_newline("Click circles to select,#arrow keys to move around."))

